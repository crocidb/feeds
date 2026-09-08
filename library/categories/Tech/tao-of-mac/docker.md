+++
title = "Docker"
description = "The new hotness in the Linux container space (because nobody remembers LXC anymore).Resources|                                                                   Category                                                               "
date = "2013-09-02T10:30:00Z"
url = "https://taoofmac.com/space/os/linux/docker?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-09-08T09:44:10.290309676Z"
seen = false
+++

The new hotness in the Linux container space (because nobody remembers `LXC` anymore).

[

Resources
----------

](/space/os/linux/docker#resources)

|                                                                   Category                                                                    |                                                                         Date                                                                          |                                                                       Link                                                                        |                                                       Notes                                                       |
|-----------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
|                                                                  Base Images                                                                  |                                                                         2015                                                                          |     [gliderlabs/alpine](https://github.com/gliderlabs/docker-alpine?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)      |                                         A minimal Alpine Linux base image                                         |
|[phusion/baseimage-docker](https://github.com/phusion/baseimage-docker?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)|                                                          an arguably sane Ubuntu base image                                                           |                                                                                                                                                   |                                                                                                                   |
|                                                                      CLI                                                                      |                                                                         2015                                                                          |        [codekitchen/dinghy](https://github.com/codekitchen/dinghy?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)        |                         a nice wrapper that sets up a host NFS server and other niceties                          |
|            [Wharfee](https://github.com/j-bennet/wharfee?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)             |                                                                  a nice CLI wrapper                                                                   |                                                                                                                                                   |                                                                                                                   |
|                                                                     2014                                                                      |                 [dockersh](https://github.com/Yelp/dockersh?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                  |                                                Segregate logged in users into different containers                                                |                                                                                                                   |
|                                                                    Distros                                                                    |                                                                         2013                                                                          |                       [Core OS](https://coreos.com?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                       |                       a lightweight distro focused on containers, since acquired by RedHat                        |
|                                                                      GUI                                                                      |                                                                         2026                                                                          |               [Dockge](https://github.com/louislam/dockge?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                |                      a self-hosted, stack-oriented Docker Compose manager with a reactive UI                      |
|                                                                     2025                                                                      |               [Arcane](https://github.com/getarcaneapp/arcane?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                |                                                              A Portainer alternative                                                              |                                                                                                                   |
|                                                                     2016                                                                      |                                                     [Portainer](/space/os/linux/docker/portainer)                                                     |                                                              a simple NodeJS Web UI                                                               |                                                                                                                   |
|                                                                     2015                                                                      |                   [Portus](https://github.com/SUSE/Portus)?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                   |                            A registry front-end that works with the v2 registry and has some user management features.                            |                                                                                                                   |
|                                                                     2014                                                                      |               [Seagull](https://github.com/tobegit3hub/seagull?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)               |                                                         A Web UI for container management                                                         |                                                                                                                   |
|                                                               Mac Alternatives                                                                |                                                                         2026                                                                          |               [Davit](https://github.com/wouterdebie/davit?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)               |                                  a native macOS UI for Apple platform containers                                  |
|                                                                     2021                                                                      |            [podman-macos](https://github.com/heyvito/podman-macos?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)            |                                  a menubar item to manage podman machine, which is in turn available on Homebrew                                  |                                                                                                                   |
|                [lima](https://github.com/lima-vm/lima?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                |                                                   a possible replacement for Docker Desktop on Mac                                                    |                                                                                                                                                   |                                                                                                                   |
|                                                                     2019                                                                      |      [boot2docker-xhyve](https://github.com/ailispaw/boot2docker-xhyve?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)       |                                               a clean way to run Docker inside Hypervisor.framework                                               |                                                                                                                   |
|                                                                    Network                                                                    |                                                                         2018                                                                          |             [pipework](https://github.com/jpetazzo/pipework?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)              |                                  map physical interfaces to specific containers                                   |
|                                                                     2015                                                                      |           [socketplane](https://github.com/socketplane/socketplane?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)           |                                                   Auto-discovery and OVS for inter-host traffic                                                   |                                                                                                                   |
|                                                                     2014                                                                      |                 [weave](https://github.com/weaveworks/weave?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                  |                                                       inter-host tunneling, with encryption                                                       |                                                                                                                   |
|                                                                   OCI Tools                                                                   |                                                                         2019                                                                          |         [docker-slim](https://github.com/docker-slim/docker-slim?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)         |               performs simple runtime analysis to remove unnecessary libraries and slim down images               |
|                                                                     2018                                                                      |              [buildah](https://github.com/projectatomic/buildah?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)              |                                          a CLI tool for builting OCI container images from `Dockerfile`s                                          |                                                                                                                   |
|                                                                 Orchestration                                                                 |                                                                         2015                                                                          |                    [Kubernetes](http://kubernetes.io?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                     |                                           The current industry favorite                                           |
|                   [Rancher](http://www.rancher.com?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                   |                                                    Still arguably one of the nicer options in 2018                                                    |                                                                                                                                                   |                                                                                                                   |
|                                                                Other runtimes                                                                 |                                                                         2025                                                                          |             [container](https://github.com/apple/containerd?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)              |                             Apple’s own container host, with a Docker-like interface                              |
|                                                                     2022                                                                      |               [nerdctl](https://github.com/containerd/nerdctl?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                |                                                can be used to manage containers in containerd/k3s                                                 |                                                                                                                   |
|                                                                     2019                                                                      |                [podman](https://github.com/containers/libpod?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                 |                                               aims for 1:1 CLI parity (see also Buildah and Skopeo)                                               |                                                                                                                   |
|                                                                     2018                                                                      |                     [Singularity](https://www.sylabs.io?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                      |                                              a different take on containers, not quite OCI compliant                                              |                                                                                                                   |
|                                                                     PaaS                                                                      |                                                                         2026                                                                          |[Cloud in a Bottle](https://github.com/cloud-in-a-bottle/cloud-in-a-bottle?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)|     self-hosted app platform that deploys web apps from Git repositories using manifests and rootless Podman      |
|                                                                     2020                                                                      |               [CapRover](https://github.com/CapRover/CapRover?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                |                                                       a nice web front-end for Docker Swarm                                                       |                                                                                                                   |
|                                                                     Tools                                                                     |                                                                         2026                                                                          |             [Z-Jail](https://github.com/Division-36/Z-Jail/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)              |lightweight Linux sandbox combining namespaces, pivot\_root, seccomp-bpf, capability dropping, and verdict auditing|
|         [maintenant](https://github.com/kOlapsis/maintenant?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)          |           Single-container monitoring stack — auto-discovers Docker services, built-in dashboards, alerts, uptime checks, no config needed            |                                                                                                                                                   |                                                                                                                   |
|                                                                     2025                                                                      |      [Container-Compose](https://github.com/Mcrich23/Container-Compose?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)       |                                                    docker compose for Apple’s container engine                                                    |                                                                                                                   |
|              [tart](https://github.com/cirruslabs/tart?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)               |                                                    a macOS VM manager targeting CI/CD applications                                                    |                                                                                                                                                   |                                                                                                                   |
|               [Diun](https://github.com/crazy-max/diun?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)               |                                         A tool to monitor Docker images and notify when updates are available                                         |                                                                                                                                                   |                                                                                                                   |
|                [tini](https://github.com/krallin/tini?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                |                                   a tiny init system for Docker containers, to handle zombie processes and reaping                                    |                                                                                                                                                   |                                                                                                                   |
|           [uncloud](https://github.com/psviderski/uncloud?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)            |                                               a lightweight clustering and container orchestration tool                                               |                                                                                                                                                   |                                                                                                                   |
|        [unregistry](https://github.com/psviderski/unregistry?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)         |                                        a tool for directly copying images between servers without a registry.                                         |                                                                                                                                                   |                                                                                                                   |
|               [tilt](https://github.com/tilt-dev/tilt?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)                |                               a tool for managing local development environments, with a focus on Kubernetes and Docker                               |                                                                                                                                                   |                                                                                                                   |
|                                                                     2024                                                                      |[lazydocker](https://github.com/jesseduffield/lazydocker/blob/master/README.md?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)|                   a nice TUI for Docker management, with usage charts and easy stack/compose viewing (Portainer for terminals)                    |                                                                                                                   |
|                                                                     2023                                                                      |              [distrobox](https://github.com/89luca89/distrobox?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)               |                                                       a nice wrapper for sandbox management                                                       |                                                                                                                   |
|             [colima](https://github.com/abiosoft/colima?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)              |                                 a macOS VM container manager that replaces Docker desktop and works well with `brew`.                                 |                                                                                                                                                   |                                                                                                                   |

[

Setting up `boot2docker` manually on Parallels
----------

](/space/os/linux/docker#setting-up-boot2docker-manually-on-parallels)

Since I don’t have Parallels Pro, I run Docker on my older Macs like this:

* Download a [recent release](https://github.com/boot2docker/boot2docker/releases?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and put the ISO someplace safe
* Create a new VM manually by dragging the ISO to Parallels (use the `Shared` or `NAT` network type)
* After first boot, use `fdisk` to create a primary partition in `/dev/sda` and format it using `mkfs.ext4 -L boot2docker-data /dev/sda1`
* Reboot so that it gets mounted and used for certificate storage
* Do `brew install docker` (which gets you the CLI)
* Set up port forwarding for port 2376 and a local port to the VM’s SSH port
* SSH into the VM (`docker`/`tcuser`) and copy the `*.pem` files from `/var/lib/boot2docker/tls` to your `~/.docker` folder
* Set and export `DOCKER_HOST` and `DOCKER_TLS_VERIFY` accordingly:

```
export DOCKER_HOST=localhost:2376
export DOCKER_TLS_VERIFY=1

```

[

Useful `Dockerfile` Snippets
----------

](/space/os/linux/docker#useful-dockerfile-snippets)

|Base Image|                  Description                   |                                                                                                                                                     Dockerfile snippet                                                                                                                                                      |
|----------|------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  Ubuntu  |Installing the Oracle JDK (and setting the EULA)|```<br/>RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \<br/> && add-apt-repository -y ppa:webupd8team/java \<br/> && apt-get install -y java-common oracle-java8-installer oracle-java8-set-default \<br/> && rm -rf /var/cache/oracle-jdk8-installer<br/><br/>```|

[

Building The Docker Registry From Scratch (on ARM, too!)
----------

](/space/os/linux/docker#building-the-docker-registry-from-scratch-on-arm-too)

Very simple, really, once you have [Go](/space/dev/golang) installed. Quite quick on a [Raspberry Pi](/space/hw/raspberry_pi) 2, too:

```
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
# this fetches godep and golint
go get github.com/tools/godep github.com/golang/lint/golint
# this fetches and builds the registry
go get github.com/docker/distribution/cmd/registry
# test it with the default config
$GOPATH/bin/registry $GOPATH/src/github.com/docker/distribution/cmd/registry/config.yml

```

[

Restarting a Container Automatically in Docker Compose
----------

](/space/os/linux/docker#restarting-a-container-automatically-in-docker-compose)

Since `watchtower` only does updates and not restarts (which seems like a missed opportunity), this simple snippet will restart a container at a specific time every day:

```
version: "3"
services:

  myservice:
    container_name: myservice

  restarter:
    image: docker:cli
    restart: unless-stopped
    volumes: ["/var/run/docker.sock:/var/run/docker.sock"]
    entrypoint: ["/bin/sh","-c"]
    command:
      - |
        while true; do
          current_epoch=$$(date +%s)
          target_epoch=$$(( $$(date -d "05:00" +%s) + 86400 ))
          sleep_seconds=$$(( target_epoch - current_epoch ))
          echo "$$(date) + $$sleep_seconds seconds"
          sleep $$sleep_seconds

          docker restart myservice
        done        

```