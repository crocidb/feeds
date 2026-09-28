+++
title = "130: Meticulous Adherence to Arcane Unofficial Procedures"
description = "OpenZFS Mastery uses FreeBSD and Proxmox as reference platforms. Here’s a bit about why. Proxmox is a Debian variant focused on virtualization, developed by Proxmox Server Solutions GmbH. It integrates ZFS as a primary filesystem and can install all the Debian packages. As we wri"
date = "2026-09-24T16:00:42Z"
url = "https://mwl.io/archives/24993"
author = "Michael Lucas"
text = ""
lastupdated = "2026-09-27T09:51:00.647396668Z"
seen = false
+++

OpenZFS Mastery uses FreeBSD and Proxmox as reference platforms. Here’s a bit about why.

>
>
> Proxmox is a Debian variant focused on virtualization, developed by Proxmox Server Solutions GmbH. It integrates ZFS as a primary filesystem and can install all the Debian packages. As we write this, Proxmox is the easiest way to get ZFS on Linux. While Proxmox is designed as a virtualization platform, it’s Debian plus other tools. You can install a desktop environment or any other Debian packages to tune the host as you wish.
>
>
>
> If you want to use ZFS on another Linux, you will have struggles. Linux ZFS users often compromise to make their lives easier. Ubuntu can use ZFS for data disks, but relies on EXTFS for the root filesystem. Running root on ZFS in other Linuxes is an advanced skill. Some sysadmins get the root filesystem on ZFS, but live without boot environments. Upgrades might require initramfs chicanery or meticulous adherence to arcane unofficial procedures.
>
>

[OpenZFS Mastery sponsorships are still open,](https://mwl.io/sponsor) and [the Twisted Presents Kickstarter is live](https://mwl.io/ks).