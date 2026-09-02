+++
title = "Azure Linux"
description = "Azure Linux is Microsoft’s internal Linux distribution for 1st party services (cloud infra, IoT devices, etc.).Although my [disclaimer](/spac"
date = "2025-09-24T11:20:00Z"
url = "https://taoofmac.com/space/os/linux/distributions/azure?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-09-01T19:33:17.044612416Z"
seen = false
+++

[Azure Linux](https://github.com/microsoft/azurelinux?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is [Microsoft](/space/com/microsoft)’s internal Linux distribution for 1st party services (cloud infra, IoT devices, etc.).

Although my [disclaimer](/space/site/disclaimer) doesn’t allow me to write much about it, there are a few of my notes that mention things in the public domain that might be hard to figure out in under an hour and that even I keep forgetting.

These notes mostly apply to the `core` distribution, which is what I always build upon since I have very specific needs.

[

Package Management
----------

](/space/os/linux/distributions/azure#package-management)

* Use `tdnf`, not `dnf` or `yum` (which actually don’t ship with it, but that I am constantly trying to use because I forget this all the time)

[

Useful Packages
----------

](/space/os/linux/distributions/azure#useful-packages)

* You can get `docker-compose`, `moby-engine` and even `k3s` from the base repos. Just don’t forget to enable them after installing them (`systemctl enable –now docker` is something else I keep forgetting to do)
* 3.0 ships with Python 3.12, Java 21 and Golang 1.25 (which are nice and stable)

[

General Use
----------

](/space/os/linux/distributions/azure#general-use)

* A blank VM uses 120MB of RAM (including buffers), which is quite nice
* `bash` is the default, but you can install `zsh`
* The default locale is `C.UTF-8`, with a `UTC` timezone
* `curl`, `arping`, `arptables`, `ebtables`/`ip6tables`, `lvm` and `ionice` are installed, which is… nice
* Besides the usual virtualization guest tools you get a few creature comforts
* There is no `avahi-daemon`–the package you want is called `avahi`
* There is no `less`, but `more` is there for you since the dawn of UNIX

[

Related projects
----------

](/space/os/linux/distributions/azure#related-projects)

* [Azure Linux Desktop](https://github.com/sirredbeard/azurelinux-desktop?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) — proof-of-concept GNOME desktop spin layered on Azure Linux 4.0