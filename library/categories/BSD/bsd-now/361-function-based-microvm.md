+++
title = "361: Function-based MicroVM"
description = "Emulex: The Cheapest 10gbe for Your Homelab, In Search of 2.11BSD, as released, Fakecracker: NetBSD as a Function Based MicroVM, First powerpc64 snapshots available for OpenBSD, OPNsense 20.1.8 released, and more.NOTES   This episode of BSDNow is brought to you by [Tarsnap]"
date = "2020-07-30T11:00:00Z"
url = "https://www.bsdnow.tv/361"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.523894784Z"
seen = false
+++

Emulex: The Cheapest 10gbe for Your Homelab, In Search of 2.11BSD, as released, Fakecracker: NetBSD as a Function Based MicroVM, First powerpc64 snapshots available for OpenBSD, OPNsense 20.1.8 released, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/)

Headlines
----------

### [Emulex: The Cheapest 10gbe for Your Homelab](https://vincerants.com/emulex-the-cheapest-10gbe/) ###

>
>
> Years ago, the hunt for the cheapest 10gbe NICs resulted in buying Mellanox ConnectX-2 single-port 10gbe network cards from eBay for around $10. Nowadays those cards have increased in cost to around $20-30. While still cheap, not quite the cheapest. There are now alternatives!  
>  Before diving into details, let’s get something very clear. If you want the absolute simplest plug-and-play 10gbe LAN for your homelab, pay the extra for Mellanox. If you’re willing to go hands-on, do some simple manual configuration and installation, read on for my experiences with Emulex 10gbe NICs.  
>  Emulex NICs can often be had for around $15 on eBay, sometimes even cheaper. I recently picked up a set of 4 of these cards, which came bundled with 6 SFP+ 10g-SR modules for a grand total of $47.48. Considering I can usually find SFP+ modules for about $5/ea, these alone were worth $30.
>
>
>
> * I have also tried some Solarflare cards that I found cheap, they work ok, but are pickier about optics, and tend to be focused on low-latency, so often don’t manage to saturate the full 10 gbps, topping out around 8 gbps.
> * I have been using fs.com for optics, patch cables, and DACs. I find DACs are usually cheaper if you are just going between a server and a switch in the same rack, or direct between 2 servers. \*\*\*
>
>

### [In Search of 2.11BSD, as released](https://bsdimp.blogspot.com/2020/07/211bsd-original-tapes-recreation.html) ###

>
>
> Almost all of the BSD releases have been well preserved. If you want to find 1BSD, or 2BSD or 4.3-TAHOE BSD you can find them online with little fuss. However, if you search for 2.11BSD, you'll find it easily enough, but it won't be the original. You'll find either the latest patched version (2.11BSD pl 469), or one of the earlier popular version (pl 430 is popular). You can even find the RetroBSD project which used 2.11BSD as a starting point to create systems for tiny mips-based PIC controllers. You'll find every single patch that's been issued for the system.
>
>
> ---
>

News Roundup
----------

### [Fakecracker: NetBSD as a Function Based MicroVM](https://imil.net/blog/posts/2020/fakecracker-netbsd-as-a-function-based-microvm/) ###

>
>
> In November 2018 AWS published an Open Source tool called Firecracker, mostly a virtual machine monitor relying on KVM, a small sized Linux kernel, and a stripped down version of Qemu. What baffled me was the speed at which the virtual machine would fire up and run the service. The whole process is to be compared to a container, but safer, as it does not share the kernel nor any resource, it is a separate and dedicated virtual machine.  
>  If you want to learn more on Firecracker‘s internals, here’s a very well put article.
>
>
> ---
>

### [First powerpc64 snapshots available for OpenBSD](https://undeadly.org/cgi?action=article;sid=20200707001113) ###

>
>
> Since we reported the first bits of powerpc64 support going into the tree on 16 May, work has progressed at a steady pace, resulting in snapshots now being available for this platform.  
>  So, if you have a POWER9 system idling around, go to your nearest mirror and fetch this snapshot. Keep in mind that as this is still very early days, very little handholding is available - you are basically on your own.
>
>
> ---
>

### [OPNsense 20.1.8 released](https://opnsense.org/opnsense-20-1-8-released/) ###

>
>
> Sorry about the delay while we chased a race condition in the updates back to an issue with the latest FreeBSD package manager updates. For now we reverted to our current version but all relevant third party packages have been updated as updates became available over the last weeks, e.g. cURL and Python, and hostapd / wpa\_supplicant amongst others.
>
>
> ---
>

Beastie Bits
----------

* [Old School Disk Partitioning](https://bsdimp.blogspot.com/2020/07/old-school-disk-partitioning.html)
* [Nomad BSD 1.3.2 Released](http://nomadbsd.org/index.html#1.3.2)
* [Chai-Fi](https://github.com/gonzoua/chaifi)

---

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Poojan - ZFS Question](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/361/feedback/Poojan - ZFS question.md>)
* [graceon - supermicro](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/361/feedback/graceon - supermicro.md>)
* [zenbum - groff](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/361/feedback/zenbum - groff.md>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*

Special Guest: Warner Losh.