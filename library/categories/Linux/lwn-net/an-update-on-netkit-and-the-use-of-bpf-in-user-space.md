+++
title = "[$] An update on netkit and the use of BPF in user space"
description = " Daniel Borkmann led a session at the 2026  Linux Filesystem, Memory-Management, and BPF Summit about the progress that has been made with netkit, the subsystem that allows virtual machines (VMs) running on Linux to perform networki"
date = "2026-07-24T13:17:28Z"
url = "https://lwn.net/Articles/1083418/"
author = "daroc"
text = ""
lastupdated = "2026-07-28T12:42:27.234529691Z"
seen = false
+++

 Daniel Borkmann led a session at the 2026 [ Linux Filesystem, Memory-Management, and BPF Summit](https://events.linuxfoundation.org/lsfmmbpf/) about the progress that has been made with netkit, the subsystem that allows virtual machines (VMs) running on Linux to perform networking efficiently. When that did not fill the full time, he went on to discuss his idea for using BPF to live-patch user-space applications. While netkit is making progress, and can now support zero-copy receipt of packets into a VM in a network namespace, the idea of using BPF for patching user-space programs remains entirely speculative.