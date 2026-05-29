+++
title = "Just: command runner & documentation"
description = "I wanted the bootstrap process to be simple; ideally a single command and it would be up and running. But that’s not what we have right now; just look at this monstrosity from the previous post:`helm install cilium ciliu"
date = "2026-05-28T07:15:34Z"
url = "http://jonashietala.se/blog/2026/05/28/just_command_runner_documentation/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2026-05-28T23:18:21.849812023Z"
seen = false
+++

I wanted the bootstrap process to be simple; ideally a single command and it would be up and running. But that’s not what we have right now; just look at this monstrosity from the [previous post](/blog/2026/05/22/talos_linux_on_proxmox_with_terraform):

```
helm install cilium cilium/cilium \
  --namespace kube-system \
  --version 1.19.2 \
  --set kubeProxyReplacement=true \
  --set k8sServiceHost=10.1.4.10 \
  --set k8sServicePort=6443 \
  --set l2announcements.enabled=true \
  --set externalIPs.enabled=true \
  --set gatewayAPI.enabled=true \
  --set ipam.mode=kubernetes \
  --set operator.replicas=1 \
  --set securityContext.privileged=true

```

Yuck.

I could place this in a README file, put it in a shell script, a Makefile, [Task](https://taskfile.dev/), or many other tools but I chose [Just](https://just.systems/man/en/introduction.html). [Just](https://just.systems/man/en/introduction.html) has some small quality of life features and it doesn’t make me want to hurt myself when I look at it.

If all I wanted was a simple bootstrap script I wouldn’t bother writing a separate post about it, but I realized that [Just](https://just.systems/man/en/introduction.html) is an excellent way to add some sorely needed documentation as well.

For example, in the future I’ll probably forget how the bootstrap process looks like. Fire up `just`:

```
$ just
just -l
Available recipes:
    argocd ...
    arr ...
    bootstrap ...
    cluster ...
    deps ...
    garage ...
    jellyfin ...
    proxmox ...
    repos ...
    router ...
    secrets ...
    tf ...
    util ...

```

(Don’t worry, I won’t bore you with the details of everything here.)

Let’s drill into the bootstrap:

```
$ just bootstrap
just -l bootstrap
Available recipes:
    argocd                # Bootstrap ArgoCD
    cilium                # Bootstrap Cilium
    cluster               # Bootstrap VMs and talos cluster
    create_cluster_config # Create talasconfig and kubeconfig
    forgejo               # Install and configure Forgejo inside the LXC created by Terraform
    full                  # Bootstrap everything from zero
    link_cluster_config   # Initialize ~/.talos/config and ~/.kube/config
    pbs                   # Install and configure PBS inside the LXC created by Terraform
    sealed_secrets        # Install sealed secrets controller

```

It seems `just bootstrap full` would try to bootstrap everything. Sounds scary, so let’s look at the code:

```
[doc("Bootstrap everything from zero")]
full:
    just bootstrap::cluster
    just bootstrap::cilium
    # We'll revisit these in the future (I hope)
    just secrets::restore_sealed_secrets_private_key
    just bootstrap::sealed_secrets
    just bootstrap::argocd
    # I manage some other Proxmox related things too,
    # but they're out of scope for this series
    just bootstrap::pbs
    just bootstrap::forgejo

```

Where the cluster is bootstrapped like this:

```
[doc("Bootstrap VMs and talos cluster")]
[working-directory('../infrastructure')]
cluster:
    just tf::init
    just tf::apply -auto-approve
    just bootstrap::create_cluster_config

[doc("Create talasconfig and kubeconfig")]
[working-directory('../infrastructure')]
create_cluster_config:
    terraform output -raw talosconfig > talosconfig.yaml
    terraform output -raw kubeconfig > kubeconfig.yaml
    # We'll look at this in the next post
    just secrets::encrypt_cluster_config

```

And Cilium like so:

```
[doc("Bootstrap Cilium")]
[working-directory('../gitops')]
cilium: wait_for_api
    kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.2.1/standard-install.yaml
    helm install cilium \
        --repo https://helm.cilium.io/ \
        cilium \
        --namespace kube-system \
        --version 1.19.2 \
        --set kubeProxyReplacement=true \
        --set k8sServiceHost=10.1.4.100 \
        --set k8sServicePort=6443 \
        --set l2announcements.enabled=true \
        --set externalIPs.enabled=true \
        --set gatewayAPI.enabled=true \
        --set ipam.mode=kubernetes \
        --set operator.replicas=1 \
        --set securityContext.privileged=true
    kubectl rollout status daemonset/cilium -n kube-system
    kubectl apply -f bootstrap/cilium_config.yaml
    talosctl health -n 10.1.4.10 --wait-timeout 10m

```

Here I’ve added the bootstrap commands from the last post together with some waits to make the process work in script form.

The `--repo` flag makes `helm repo add cilium https://helm.cilium.io/` unnecessary.

[Notes on the setup](#Notes-on-the-setup)
----------

There are some other features and gotchas with [Just](https://just.systems/man/en/introduction.html) I’d like to mention.

### [Waiting for nodes](#Waiting-for-nodes) ###

Note the dependency `wait_for_api` above in the line `cilium: wait_for_api`. This means `wait_for_api` will run before `cilium`, which waits until the Kubernetes nodes are ready (albeit not necessarily healthy according to `talosctl health`):

```
[private]
wait_for_api:
    until kubectl get nodes 2>/dev/null | grep -q "NotReady\|Ready"; do sleep 5; done

```

You can call `just bootstrap::wait_for_api` inside scripts too, which would give you more control over ordering. Dependencies on the other hand are deduplicated and always run before the recipe.

### [Modules and directory structure](#Modules-and-directory-structure) ###

I wanted to organize the recipes a little and group them (`just tf::init` instead of `just tf_init`). For that we use modules:

```
mod argocd 'just/argocd.just'
mod bootstrap 'just/bootstrap.just'
mod secrets 'just/secrets.just'
# etc...

# With this `just` will give you a list of the modules.
[private]
default:
    just -l

```

Organized like this in the repository:

```
home-ops/
├── justfile          # `just` entrypoint, loads `just/*`
├── just/
│   ├── bootstrap.just
│   ├── secrets.just
│   ├── cluster.just
│   └── ...
├── infrastructure/   # Terraform, setup in the previous post
└── gitops/           # GitOps using ArgoCD, setup in the future

```

### [Working directories](#Working-directories) ###

Another nice feature is to be able to set the working directory:

```
[doc("terraform init")]
[working-directory('../infrastructure')]
init *args:
    terraform init {{args}}

```

This means I can run `just tf::init` from anywhere in the entire repo, and it will just work.

### [Export kubeconfig / talosconfig](#Export-kubeconfig-talosconfig) ###

```
export KUBECONFIG := justfile_directory() / "infrastructure/kubeconfig.yaml"
export TALOSCONFIG := justfile_directory() / "infrastructure/talosconfig.yaml"

```

Every `kubectl`/`talosctl` command in any just file now targets the cluster, no matter what directory they’re run from.

### [Shebang](#Shebang) ###

By default each line runs in its own shell. A `#!/usr/bin/env bash` at the top converts a recipe into one script, which allows you to define functions, run for loops, or set traps for cleanup.

For example, this recipe runs `terraform apply` and then encrypts the terraform state *even on failure*:

```
[doc("terraform apply, then re-encrypt state (encrypts even on failure)")]
[working-directory('../infrastructure')]
apply *args:
    #!/usr/bin/env bash
    set -e
    trap 'just secrets::encrypt_terraform_state' EXIT
    terraform apply {{args}}

```

(I encrypt the state so I can safely commit it to git, meaning I can manage terraform from multiple computers, since you need the up-to-date state.)

[Just a single command](#Just-a-single-command)
----------

```
just bootstrap full

```

I wanted to have a single command to bootstrap and I think I’m pretty close. In practice it’s not *quite* that simple; for example secret management may need some extra setup first, which we’ll revisit in the next post.