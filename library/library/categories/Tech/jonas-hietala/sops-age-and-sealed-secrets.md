+++
title = "SOPS + Age and Sealed Secrets"
description = "When I’ve read other series about Kubernetes and reach the secrets section my eyes glaze over. I can’t help myself; I want to read about the fun stuff. Secrets are necessary to be sure, but it’s a little boring…But if I want to do proper GitOps I need to manage secrets (and to do"
date = "2026-05-31T04:47:20Z"
url = "http://jonashietala.se/blog/2026/05/31/sops_age_and_sealed_secrets/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2026-06-01T21:30:49.132106620Z"
seen = false
+++

When I’ve read other series about Kubernetes and reach the secrets section my eyes glaze over. I can’t help myself; I want to read about the fun stuff. Secrets are necessary to be sure, but it’s a little boring…

But if I want to do proper GitOps I need to manage secrets (and to document the process). The sooner I set it up the better.

[In and outside cluster](#In-and-outside-cluster)
----------

Kubernetes has different solutions for secrets management. Of particular note is [Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets) which creates files that are safe to commit to git and Kubernetes decrypts them in-cluster.

This is pretty great but has one big drawback: it can only manage secrets inside Kubernetes. It cannot be used to encrypt things like the `talosconfig` or the Proxmox password Terraform uses.

That’s why I’ll also use [SOPS + Age](#SOPS-Age), which allows us to encrypt whatever file we want. The idea is to use SOPS + Age to manage the bootstrapping secrets and let Sealed Secrets take over when [ArgoCD](https://argo-cd.readthedocs.io/en/stable/) is up. This way there’s only one private key I need to manage and the rest is available from the git repo.

It’s possible to purely rely on [SOPS + Age](#SOPS-Age) but I like [Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets) as it creates a native Kubernetes object you can inspect in dashboards and similar. And having to manually decrypt/encrypt stuff is tedious.

[SOPS + Age](#SOPS-Age)
----------

First, we need to install `sops` and `age` locally (I found them in my package manager). Then we can generate our private key:

```
mkdir -p ~/.config/sops/age
age-keygen -o ~/.config/sops/age/keys.txt

```

You don’t want to lose this key, store it somewhere safe. I stored it in [Bitwarden](https://bitwarden.com/) (although I’m migrating to [Vaultwarden](https://github.com/dani-garcia/vaultwarden) hosted in-cluster, which is a bit weird as keeping the key there risks a lock-out).

You then need a `.sops.yaml` that describes the files to encrypt/decrypt. For example, this is an entry for `talosconfig.yaml`:

```
creation_rules:
  - path_regex: infrastructure/talosconfig(\.encrypted)?.yaml$
    age: age1rrkgd5yza053qk9m8lp0ww39apdarz7w0rjyq85493g8l9gufgnq9cehzx
    encrypted_regex: '^(ca|crt|key)$'

```

(`age` contains the public key, safe to share.)

With `encrypted_regex` you can limit encryption to certain fields; if you leave it out you’ll encrypt the entire file.

Then to encrypt and decrypt `talosconfig.yaml` [we generated in a previous post](/blog/2026/05/22/talos_linux_on_proxmox_with_terraform/#Generating-config-files):

```
sops --encrypt talosconfig.yaml > talosconfig.encrypted.yaml
sops --decrypt talosconfig.encrypted.yaml > talosconfig.yaml

```

`talosconfig.encrypted.yaml` is safe to commit to git but the cleartext file `talosconfig.yaml` should be added to `.gitignore`.

### [Just commands](#Just-commands) ###

It won’t take long for me to forget these commands so I’ll add them to [Just](https://just.systems/man/en/introduction.html). These recipes will take care of the [secrets we’ve handled so far](/blog/2026/05/22/talos_linux_on_proxmox_with_terraform/#Generating-config-files) and the cleartext files (`talosconfig`, `kubeconfig`, `secrets.auto.tfvars`, `terraform.tfstate`) should allow us to regain cluster control, or to bootstrap the cluster anew from the git repo and the sops key.

```
[doc("Decrypt required files committed to git")]
decrypt_required:
    just secrets decrypt_cluster_config
    just secrets decrypt_terraform_secrets
    just secrets decrypt_terraform_state

[doc("Encrypt talosconfig and kubeconfig")]
[working-directory('../infrastructure')]
encrypt_cluster_config:
    sops --encrypt kubeconfig.yaml > kubeconfig.encrypted.yaml
    sops --encrypt talosconfig.yaml > talosconfig.encrypted.yaml

[doc("Decrypt talosconfig and kubeconfig")]
[working-directory('../infrastructure')]
decrypt_cluster_config:
    sops --decrypt talosconfig.encrypted.yaml > talosconfig.yaml
    sops --decrypt kubeconfig.encrypted.yaml > kubeconfig.yaml
    chmod 600 talosconfig.yaml kubeconfig.yaml

[doc("Encrypt secrets.auto.tfvars")]
[working-directory('../infrastructure')]
encrypt_terraform_secrets:
    sops --encrypt secrets.auto.tfvars > secrets.auto.encrypted.tfvars

[doc("Decrypt secrets.auto.tfvars")]
[working-directory('../infrastructure')]
decrypt_terraform_secrets:
    sops --decrypt secrets.auto.encrypted.tfvars > secrets.auto.tfvars
    chmod 600 secrets.auto.tfvars

[doc("Encrypt terraform.tfstate")]
[working-directory('../infrastructure')]
encrypt_terraform_state:
    sops --encrypt --input-type json --output-type json terraform.tfstate > terraform.encrypted.tfstate

[doc("Decrypt terraform.tfstate")]
[working-directory('../infrastructure')]
decrypt_terraform_state:
    # If the encrypted state doesn't exist yet (fresh repo), skip silently.
    test -f terraform.encrypted.tfstate || exit 0
    sops --decrypt --input-type json --output-type json terraform.encrypted.tfstate > terraform.tfstate
    chmod 600 terraform.tfstate

```

I also added encryption to `create_cluster_config` bootstrap command, to make it harder for me to forget to add them to the repo:

```
[doc("Create talosconfig and kubeconfig")]
[working-directory('../infrastructure')]
create_cluster_config:
    terraform output -raw talosconfig > talosconfig.yaml
    terraform output -raw kubeconfig > kubeconfig.yaml
    just secrets::encrypt_cluster_config

```

And for the terraform state too (run with `just tf::apply` instead of a plain `terraform apply`):

```
[doc("terraform apply, then re-encrypt state (encrypts even on failure)")]
[working-directory('../infrastructure')]
apply *args:
    #!/usr/bin/env bash
    set -e
    trap 'just secrets::encrypt_terraform_state' EXIT
    terraform apply {{args}}

[doc("terraform destroy, then re-encrypt state (encrypts even on failure)")]
[working-directory('../infrastructure')]
destroy *args:
    #!/usr/bin/env bash
    set -e
    trap 'just secrets::encrypt_terraform_state' EXIT
    terraform destroy {{args}}

```

This will leave decrypted files on disk. I figured it’s fine for my setup because they share the same protection as the master key at `~/.config/sops/age/keys.txt` anyway, but worth being explicit about.

[Sealed Secrets](#Sealed-Secrets)
----------

Let’s move on to sealed secrets. There are more setup steps than with SOPS + Age but it’s not *that* bad.

### [Installation](#Installation) ###

I’ll install the sealed secrets controller using helm:

```
helm install sealed-secrets \
    --repo https://bitnami-labs.github.io/sealed-secrets \
    sealed-secrets \
    --version 2.16.2 \
    --namespace sealed-secrets \
    --create-namespace \
    --set fullnameOverride=sealed-secrets-controller
# Wait for it to deploy
kubectl rollout status deployment/sealed-secrets-controller -n sealed-secrets

```

To create secrets on the client we also need the `kubeseal` command. It wasn’t available on the Void Linux package manager, so let’s do the hard way:

```
set -x KUBESEAL_VERSION '0.36.1'
curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v$KUBESEAL_VERSION/kubeseal-$KUBESEAL_VERSION-linux-amd64.tar.gz"
tar -xvzf kubeseal-$KUBESEAL_VERSION-linux-amd64.tar.gz kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal
rm kubeseal-$KUBESEAL_VERSION-linux-amd64.tar.gz

```

### [Create a secret](#Create-a-secret) ###

To create a secret we can either use the cluster (needs an active connection) or offline via a certificate. I prefer the certificate simply because you need to pass fewer arguments (`--cert` vs `--controller-name` and `--controller-namespace`). Here’s how to fetch the certificate:

```
kubeseal --fetch-cert \
         --controller-name=sealed-secrets-controller \
         --controller-namespace=sealed-secrets \
    > infrastructure/sealed-secrets-cert.pem

```

(It’s a public key, safe to commit to git.)

And this is how we can use it to generate a secret `my-secret` with the two fields `username` and `password`:

```
kubectl create secret generic my-secret \
  --namespace some-namespace \
  --from-literal=username="user" \
  --from-literal=password="password1" \
  --dry-run=client -o yaml \
  | kubeseal --cert infrastructure/sealed-secrets-cert.pem \
             --format yaml \
  > gitops/apps/myapp/my-secret.yaml

```

(There might be other ways to do this. You can generate json files for example, but this works and I don’t care to do research.)

It will be stored in `gitops/apps/myapp/my-secret.yaml` that we can apply:

```
kubectl apply -f gitops/apps/myapp/my-secret.yaml

```

In the future when we get our GitOps setup up the process is the same except we don’t `apply` the secret; just create, commit, and push and it’ll get applied automatically. It may feel like a lot of effort, but it’s quite nice to work with in day-to-day operations.

The process to update a secret is exactly the same; update the file with new contents and reapply.

The namespace secrets live in are important as only apps with the same namespace can access the secret. Sometimes it means we have to duplicate a secret, which is annoying.

### [View a secret](#View-a-secret) ###

Check that the secret has been applied:

```
kubectl get secret my-secret -n some-namespace -o yaml

```

The data fields `username` and `password` shown above will be base64 encoded. Here’s how to print out the password in cleartext:

```
kubectl get secret my-secret -n some-namespace -o jsonpath='{.data.password}' | base64 -d

```

Or you can view the secrets in a dashboard such as [Headlamp](https://headlamp.dev/), which is arguably easier.

### [Surviving a cluster reset](#Surviving-a-cluster-reset) ###

There’s one gotcha to sealed secrets: when the controller is installed it will generate a new public/private key pair so all existing sealed secrets are invalidated. We’d have to reseal all secrets after we reset the cluster, which is highly annoying.

We can circumvent this by exporting the private key, encrypt it with SOPS + Age, and store it in git. Then during the bootstrap process we can import the private key to the controller, allowing it to reuse all existing sealed secrets.

First export the key and encrypt it so we can keep it in git (gitignore `sealed-secrets-key.yaml`):

```
kubectl get secret -n sealed-secrets \
  -l sealedsecrets.bitnami.com/sealed-secrets-key=active -o yaml \
     > sealed-secrets-key.yaml
sops --encrypt sealed-secrets-key.yaml > sealed-secrets-key.encrypted.yaml

```

This needs a `.sops.yaml` rule:

```
creation_rules:
  - path_regex: infrastructure/sealed-secrets-key(\.encrypted)?.yaml$
    age: age1rrkgd5yza053qk9m8lp0ww39apdarz7w0rjyq85493g8l9gufgnq9cehzx

```

Then to import it we simply `apply` it:

```
kubectl apply -f sealed-secrets-key.yaml

```

### [Just commands](#Just-commands-1) ###

We’ve added a few steps to the bootstrap process to setup the sealed secrets controller:

```
[doc("Bootstrap everything from zero")]
full:
    just bootstrap::cluster
    just bootstrap::cilium
    just secrets::restore_sealed_secrets_private_key
    just bootstrap::sealed_secrets

```

```
[doc("Restore sealed-secrets-key.yaml")]
[working-directory('../infrastructure')]
restore_sealed_secrets_private_key:
    # If the encrypted private key doesn't exist, skip the whole recipe.
    test -f sealed-secrets-key.encrypted.yaml || exit 0
    just secrets::decrypt_sealed_secrets_private_key
    # Don't exit if namespace already exists.
    kubectl create namespace sealed-secrets || true
    # Restore the private key.
    kubectl apply -f sealed-secrets-key.yaml
    rm sealed-secrets-key.yaml
    # We may need to restart the controller, but it may not exist, which is fine.
    kubectl rollout restart deployment/sealed-secrets-controller -n sealed-secrets || true

```

Yes here we remove the cleartext `sealed-secrets-key.yaml`. I’m not very consistent am I?

I’ll try to defend the inconsistency by saying that the sealed secrets key is practically never needed in cleartext (I no longer reset my cluster as I run critical workloads there) while the cluster configuration files are used all the time.

*shrug*

I’ve tried to safeguard the recipe to not crash if we haven’t created a key or bootstrapped the controller yet.

```
[doc("Install sealed secrets controller")]
sealed_secrets:
    helm install sealed-secrets \
        --repo https://bitnami-labs.github.io/sealed-secrets \
        sealed-secrets \
        --version 2.16.2 \
        --namespace sealed-secrets \
        --create-namespace \
        --set fullnameOverride=sealed-secrets-controller
    # Wait for it to deploy
    kubectl rollout status deployment/sealed-secrets-controller -n sealed-secrets

```

And some extra management recipes:

```
[doc("Fetch sealed-secrets-cert.pem, necessary to encrypt secrets offline")]
[working-directory('../infrastructure')]
fetch_sealed_secrets_cert:
    kubeseal --fetch-cert \
             --controller-name=sealed-secrets-controller \
             --controller-namespace=sealed-secrets \
        > sealed-secrets-cert.pem

[doc("Fetch sealed-secrets-key.yaml")]
[working-directory('../infrastructure')]
fetch_sealed_secrets_private_key:
    kubectl get secret -n sealed-secrets -l sealedsecrets.bitnami.com/sealed-secrets-key=active -o yaml > sealed-secrets-key.yaml
    just secrets::encrypt_sealed_secrets_private_key
    rm sealed-secrets-key.yaml

[doc("Encrypt sealed-secrets-key.yaml")]
[working-directory('../infrastructure')]
encrypt_sealed_secrets_private_key:
    sops --encrypt sealed-secrets-key.yaml > sealed-secrets-key.encrypted.yaml

[doc("Decrypt sealed-secrets-key.yaml")]
[working-directory('../infrastructure')]
decrypt_sealed_secrets_private_key:
    sops --decrypt sealed-secrets-key.encrypted.yaml > sealed-secrets-key.yaml

```

With this we’re prepared to setup GitOps with [ArgoCD](https://argo-cd.readthedocs.io/en/stable/) in the next post.