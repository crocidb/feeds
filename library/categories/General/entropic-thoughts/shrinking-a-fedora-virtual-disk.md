+++
title = "Shrinking a Fedora virtual disk"
description = " I have a weird setup for my laptop. In summary, I have been irrationally scared of running Fedora on bare, dual-GPU metal, so I run it in a virtual machine with Hyper-V on Windows as a hypervisor. The idea was to let Windows manage GPUs and power management stuff like hibernatio"
date = "2026-09-23T22:00:00Z"
url = "https://entropicthoughts.com/shrinking-fedora-virtual-disk"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-09-27T09:50:56.519033612Z"
seen = false
+++

 I have a weird setup for my laptop. In summary, I have been irrationally scared of running Fedora on bare, dual-GPU metal, so I run it in a virtual machine with Hyper-V on Windows as a hypervisor. The idea was to let Windows manage GPUs and power management stuff like hibernation, and then use Fedora as my main UI to the computer.

 This has worked surprisingly well, but that’s only because my expectations were low to begin with. The VM can barely access the hardware of the underlying machine: it can’t use the GPU, it can’t use the front-facing camera, Linux starts thrashing weirdly when the VM runs out of memory, among other quirks I’ve learned to work around. Thus, I’ve wanted to re-install on bare metal for a while, but! problem!

 Come on a journey with me. It’s got a hero with hubris, mistakes, tension, and a cliffhanger.

[(Continue reading the full article on the web.)](https://entropicthoughts.com/shrinking-fedora-virtual-disk)