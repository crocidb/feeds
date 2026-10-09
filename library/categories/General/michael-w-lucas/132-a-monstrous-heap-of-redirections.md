+++
title = "132: A Monstrous Heap of Redirections"
description = "I’m pushing to complete a first draft of OpenZFS Mastery in the next few weeks. Here’s a bit on ZFS and lightweight virtual machines. Lightweight virtualization like Linux containers, Illumos zones, and FreeBSD jails are the most efficient way to isolate virtual systems from the "
date = "2026-10-08T07:49:01Z"
url = "https://mwl.io/archives/25008"
author = "Michael Lucas"
text = ""
lastupdated = "2026-10-08T09:34:21.550893850Z"
seen = false
+++

I’m pushing to complete a first draft of [OpenZFS Mastery](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/) in the next few weeks. Here’s a bit on ZFS and lightweight virtual machines.

>
>
>  Lightweight virtualization like Linux containers, Illumos zones, and FreeBSD jails are the most efficient way to isolate virtual systems from the host. Rather than making the virtual machine deploy its own networking stack, memory cache, and filesystem, the main host’s kernel handles those tasks and reduces the virtual machine to an isolated process space. Some applications either need to control the filesystem or can benefit from controlling the filesystem, however. For most filesystems, you’d need to deploy a full virtual machine and stack a filesystem on a disk image on a file system in a monstrous heap of redirections. A host running ZFS can delegate a dataset to a lightweight virtual machine, granting it complete control.
>
>
>
> FreeBSD and Linux have different approaches to lightweight virtualization. FreeBSD creates single namespaces that can be further subdivided, while Linux offers smaller namespaces that can be aggregated into larger entities. Neither is wrong.
>
>

You sponsoring [OpenZFS Mastery](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/) would help me meet my bills.