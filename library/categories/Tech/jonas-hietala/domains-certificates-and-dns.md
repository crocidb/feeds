+++
title = "Domains, certificates, and DNS"
description = "Accessing services via raw IP addresses isn’t that swell; I’m no Rain Man.It’s time to set up subdomains for my hietala.xyz domain for internal use. We’ll use the Gateway API to set up routes, cert-manager to give "
date = "2026-08-07T07:38:00Z"
url = "http://jonashietala.se/blog/2026/08/06/domains_certificates_and_dns/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2026-08-10T12:13:33.207959811Z"
seen = false
+++

Accessing services via raw IP addresses isn’t that swell; I’m no Rain Man.

It’s time to set up subdomains for my `hietala.xyz` domain for internal use. We’ll use the [Gateway API](https://gateway-api.sigs.k8s.io/) to set up routes, [cert-manager](https://cert-manager.io/) to give us `https` without self-signed browser warnings, and [ExternalDNS](https://github.com/kubernetes-sigs/external-dns) to set up DNS overrides.

[HTTP routing](#HTTP-routing)
----------

I believe the flow of resolving `http://argocd.hietala.xyz` to a service looks something like this:

```
digraph {
  rankdir=LR
  "Browser" -> "OPNsense DNS" [label="resolve host"]
  "OPNsense DNS" -> "Browser" [label="Gateway IP"]
  "Browser" -> "Cilium Gateway" [label="HTTP request" class="label-below"]
  "Cilium Gateway" -> "HTTPRoute" [label="match hostname" class="label-below"]
  "HTTPRoute" -> "Service" [label="backendRef" class="label-below"]
  "Service" -> "Pod" [label="EndpointSlice" class="label-below"]
}

```

First the browser asks my router running [OPNsense](https://opnsense.org/) about `argocd.hietala.xyz` and gets the Gateway IP address. The request then flows through a route (http or https), to a `Service`, and eventually a `Pod` where [ArgoCD](https://argo-cd.readthedocs.io/en/stable/) is running.

We’ll handle these one at a time but let’s start by creating the Gateway and giving it an IP (we’ll use `10.1.4.101`):

```
apiVersion: gateway.networking.k8s.io/v1
kind: Gateway
metadata:
  name: main
  namespace: kube-system
  annotations:
    io.cilium/lb-ipam-ips: "10.1.4.101"
spec:
  gatewayClassName: cilium

```

We installed the prerequisites for Gateway when we [configured Cilium](/blog/2026/05/22/talos_linux_on_proxmox_with_terraform/#Setting-up-Cilium) during our initial cluster bootstrap.

Then we need to tell the Gateway to manage all `http` routes for all namespaces (we’ll get back to `https`):

```
# Continued from the above Gateway manifest
spec:
  gatewayClassName: cilium
  listeners:
    - name: http
      port: 80
      protocol: HTTP
      allowedRoutes:
        namespaces:
          from: All

```

Then we can add an `HTTPRoute` for our ArgoCD application that targets `argocd-server` at port 80:

```
# Below the ArgoCD Application setup
# Resources in the same file are separated by `---`
---
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: argocd
  namespace: argocd
spec:
  parentRefs:
    - name: main
      namespace: kube-system
      sectionName: http
  hostnames:
    - argocd.hietala.xyz
  rules:
    - backendRefs:
        - name: argocd-server
          port: 80

```

If we then add a DNS override from `http://argocd.hietala.xyz` to `10.1.4.101` (`/etc/hosts` or [OPNsense](https://opnsense.org/) or similar) then we should be able to reach `http://argocd.hietala.xyz`.

[Enabling SSL](#Enabling-SSL)
----------

I want `https://argocd.hietala.xyz` to “just work” and for that we need to tell Gateway to manage `https` routes:

```
# ...
spec:
  gatewayClassName: cilium
  listeners:
    - name: https
      port: 443
      protocol: HTTPS
      tls:
        mode: Terminate
        certificateRefs:
          - name: hietala-xyz-tls
      allowedRoutes:
        namespaces:
          from: All
    - name: http
      # Http definition from before

```

(Note the `tls` addition that terminates using a not-yet-defined certificate.)

And add the `https` route itself:

```
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: argocd
  namespace: argocd
spec:
  parentRefs:
    - name: main
      namespace: kube-system
      sectionName: https
  hostnames:
    - argocd.hietala.xyz
  rules:
    - backendRefs:
        - name: argocd-server
          port: 80

```

This doesn’t work just yet as we need to create the `hietala-xyz-tls` cert.

[Cert-manager](#Cert-manager)
----------

[cert-manager](https://cert-manager.io/) seems like the standard way to manage certificates for Kubernetes. I don’t want to expose my services to the internet which means I need a [DNS01 challenge](https://cert-manager.io/docs/configuration/acme/dns01/). [cert-manager](https://cert-manager.io/) doesn’t natively support Namecheap (bummer) but there’s an [open source webhook Namecheap provider](https://github.com/kelvie/cert-manager-webhook-namecheap) out there. It hasn’t been updated in a couple of years but I couldn’t find an alternative…

YOLO I guess?

The [cert-manager](https://cert-manager.io/) manifest:

```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: cert-manager
  namespace: argocd
  annotations:
    argocd.argoproj.io/sync-wave: "-1"
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  project: default
  source:
    repoURL: https://charts.jetstack.io
    chart: cert-manager
    targetRevision: v1.21.0
    helm:
      values: |
        installCRDs: true
  destination:
    server: https://kubernetes.default.svc
    namespace: cert-manager
  syncPolicy:
    syncOptions:
      - CreateNamespace=true
    automated:
      prune: true
      selfHeal: true

```

Note the `installCRDs: true` that makes things easier for us, and `CreateNamespace=true` which will create the `cert-manager` namespace for us too. Saves some typing. We also set sync-wave to `-1` as it needs to sync before the cluster issuer and certificate that we’ll define later.

Then the namecheap webhook:

```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: cert-manager-webhook-namecheap
  namespace: argocd
  annotations:
    argocd.argoproj.io/sync-wave: "-1"
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  project: default
  source:
    repoURL: https://github.com/kelvie/cert-manager-webhook-namecheap.git
    targetRevision: HEAD
    path: deploy/cert-manager-webhook-namecheap
    helm:
      # Identifier that our issuer will use
      values: |
        groupName: acme.namecheap.com
  destination:
    server: https://kubernetes.default.svc
    namespace: cert-manager
  syncPolicy:
    syncOptions:
      - CreateNamespace=false
    automated:
      prune: true
      selfHeal: true

```

Then a `ClusterIssuer` that uses the namecheap webhook:

```
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-staging
  annotations:
    # Must come after the cert-manager applications.
    # It defaults to 0 anyway but this is more explicit.
    argocd.argoproj.io/sync-wave: "0"
    # If resources doesn't exist ArgoCD may complain.
    argocd.argoproj.io/sync-options: SkipDryRunOnMissingResource=true
spec:
  acme:
    # Use the staging endpoint during testing!
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    email: homelab@hietala.xyz
    privateKeySecretRef:
      name: letsencrypt-staging
    solvers:
      - dns01:
          # Use the namecheap webhook
          webhook:
            # Same identifier the webhook defined above.
            groupName: acme.namecheap.com
            solverName: namecheap
            config:
              # These are very sensitive!
              # Store them in a Sealed Secret
              apiKeySecretRef:
                name: namecheap-credentials
                key: apiKey
              apiUserSecretRef:
                name: namecheap-credentials
                key: apiUser

```

Make sure to use the staging issuer during testing to avoid rate limits. When you’re done playing around you can switch to the production server at `https://acme-v02.api.letsencrypt.org/directory`.

I created a new `ClusterIssuer` called `letsencrypt-prod` instead of replacing the url so I can easily change between them if I need to.

Create the sealed secret:

```
kubectl create secret generic namecheap-credentials \
  --namespace cert-manager \
  --from-literal=apiKey="key" \
  --from-literal=apiUser="user" \
  --dry-run=client -o yaml \
  | kubeseal --cert infrastructure/sealed-secrets-cert.pem \
             --format yaml \
  > gitops/apps/cert-manager/namecheap-secret.yaml

```

Finally we need to create the `hietala-xyz-tls` certificate that uses the issuer:

```
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: hietala-xyz
  # Must match the namespace of the Gateway
  namespace: kube-system
  annotations:
    # References the issuer so must be synced after.
    argocd.argoproj.io/sync-wave: "2"
    argocd.argoproj.io/sync-options: SkipDryRunOnMissingResource=true
spec:
  # Gateway references this certificate using this name.
  secretName: hietala-xyz-tls
  dnsNames:
    - "*.hietala.xyz"
    - "hietala.xyz"
  issuerRef:
    # Switch to `letsencrypt-prod` later.
    name: letsencrypt-staging
    kind: ClusterIssuer

```

When all this has been synced we should be able to see that the certificate is created:

```
$ kubectl get certificate -n kube-system

NAME          READY   SECRET            AGE
hietala-xyz   True    hietala-xyz-tls   4d20h

```

And that we can visit `https://argocd.hietala.xyz` (browser will warn while we use `letsencrypt-staging`, on prod it should be without errors).

(If not, then you have a bunch of debugging to do. Have fun!)

Want to redirect `http` to `https`? Add this route:

```
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: argocd-redirect
  namespace: argocd
spec:
  parentRefs:
    - name: main
      namespace: kube-system
      sectionName: http
  hostnames:
    - argocd.hietala.xyz
  rules:
    - filters:
        - type: RequestRedirect
          requestRedirect:
            scheme: https
            statusCode: 301

```

In general though I skip the `http` route as I tell Firefox to always use `https`. [ArgoCD](https://argo-cd.readthedocs.io/en/stable/) is still accessible via its external IP I defined in a previous post but you can also port-forward or proxy to it:

```
# http://localhost:8001/api/v1/namespaces/argocd/services/argocd-server:80/proxy/
kubectl proxy
# localhost:8123
kubectl port-forward svc/argocd-server -n argocd 8123:80

```

[Automating DNS overrides](#Automating-DNS-overrides)
----------

By now most of the things are set up in proper GitOps fashion but there’s still one thing I have to do manually: I have to add a DNS override to unbound (it’s on my [OPNsense](https://opnsense.org/) router). Doing it once is fine but it gets old fast.

<img width="1139" height="171" alt="" src="/images/kube/opnsense_unbound_overrides.png"> Some of my overrides in unbound. Can you see a pattern?

A wildcard domain could work but I have other services running outside of Kubernetes, so I’d like a cleaner solution.

That solution is [ExternalDNS](https://github.com/kubernetes-sigs/external-dns), which automatically adds overrides for any existing Gateway `HTTPRoute`. There’s a [webhook provider for OPNsense](https://github.com/crutonjohn/external-dns-opnsense-webhook) that we’ll use.

The manifest:

```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: external-dns
  namespace: argocd
  finalizers:
    - resources-finalizer.argocd.argoproj.io
spec:
  project: default
  sources:
    - repoURL: https://kubernetes-sigs.github.io/external-dns/
      chart: external-dns
      targetRevision: 1.21.1
      helm:
        valueFiles:
          - $values/gitops/apps/external-dns/values.yaml
    - repoURL: https://git.hietala.xyz/tree/home-ops.git
      targetRevision: HEAD
      ref: values
  destination:
    server: https://kubernetes.default.svc
    namespace: external-dns
  syncPolicy:
    syncOptions:
      - CreateNamespace=true
    automated:
      prune: true
      selfHeal: true

```

It loads `values.yaml` from the repo:

```
provider:
  name: webhook
  webhook:
    image:
      repository: ghcr.io/crutonjohn/external-dns-opnsense-webhook
      tag: v1.0.0
    env:
      - name: OPNSENSE_HOST
        value: "https://router.hietala.xyz"
      # Remember to create the `external-dns` sealed secret.
      - name: OPNSENSE_API_KEY
        valueFrom:
          secretKeyRef:
            name: external-dns
            key: api-key
      - name: OPNSENSE_API_SECRET
        valueFrom:
          secretKeyRef:
            name: external-dns
            key: api-secret
sources:
  - gateway-httproute
policy: sync
domainFilters:
  - hietala.xyz
txtOwnerId: talos-dorne

```

This connects to OPNsense, sources routes from the Gateway, targets the `hietala.xyz` domain, and uses a new `external-dns` secret:

```
kubectl create secret generic external-dns \
  --namespace external-dns \
  --from-literal=api-key="key" \
  --from-literal=api-secret="secret" \
  --dry-run=client -o yaml \
  | kubeseal --cert infrastructure/sealed-secrets-cert.pem \
             --format yaml \
  > gitops/apps/external-dns/external-dns-secret.yaml

```

With this I don’t have to add manual overrides anymore. Nothing like spending hours to automate a few minutes of work!

If you want to extend support to other network things, say a Minecraft server talking TCP over 25565 with a fixed IP, we can add service support to [ExternalDNS](https://github.com/kubernetes-sigs/external-dns):

```
sources:
  - gateway-httproute
  - service

```

And declare the Minecraft `Service` like so:

```
apiVersion: v1
kind: Service
metadata:
  name: minecraft
  annotations:
    external-dns.alpha.kubernetes.io/hostname: mc.hietala.xyz
spec:
  type: ClusterIP
  externalIPs:
    - 10.1.4.53
  selector:
    app: minecraft
  ports:
    - port: 25565
      targetPort: 25565
      protocol: TCP
      name: minecraft

```

[Many steps but the end is nice](#Many-steps-but-the-end-is-nice)
----------

There’s a few moving parts but once done supporting new apps is satisfyingly easy. For example, to expose the `homeassistant` service under `https://ha.hietala.xyz` this is enough:

```
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: homeassistant
spec:
  parentRefs:
    - name: main
      namespace: kube-system
      sectionName: https
  hostnames:
    - ha.hietala.xyz
  rules:
    - backendRefs:
        - name: homeassistant
          port: 8123

```

Commit and push, and `https://ha.hietala.xyz` is ready in a jiffy, certificates and DNS overrides included.

I encountered a bug in ArgoCD v3.3.5 where it’ll get stuck syncing the routes with extra lines in the diff (or mark them as out of sync), for example here:

```
    - backendRefs:
        - name: my-app
          port: 80
          group: ""
          kind: Service
          weight: 1
      matches:
        - path:
            type: PathPrefix
            value: /

```

You can add the lines to each route to fix it but you can also tell [ArgoCD](https://argo-cd.readthedocs.io/en/stable/) to ignore them with these lines in the Application template:

```
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
spec:
  template:
    spec:
      ignoreDifferences:
        - group: gateway.networking.k8s.io
          kind: HTTPRoute
          jqPathExpressions:
            - .spec.parentRefs[].group
            - .spec.parentRefs[].kind
            - .spec.rules[].backendRefs[].group
            - .spec.rules[].backendRefs[].kind
            - .spec.rules[].backendRefs[].weight
            - .spec.rules[].matches
      syncPolicy:
        syncOptions:
          - ServerSideApply=true
          - RespectIgnoreDifferences=true

```