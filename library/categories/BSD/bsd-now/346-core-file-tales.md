+++
title = "346: Core File Tales"
description = "Tales from a core file, Lenovo X260 BIOS Update with OpenBSD, the problem of Unix iowait and multi-CPU machines, Hugo workflow using FreeBSD Jails, Caddy, Restic; extending NetBSD-7 branch support, a tale of two hypervisor bugs, and more.Headlines[Tales From a Core "
date = "2020-04-16T12:00:00Z"
url = "https://www.bsdnow.tv/346"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.548392625Z"
seen = false
+++

Tales from a core file, Lenovo X260 BIOS Update with OpenBSD, the problem of Unix iowait and multi-CPU machines, Hugo workflow using FreeBSD Jails, Caddy, Restic; extending NetBSD-7 branch support, a tale of two hypervisor bugs, and more.

Headlines
----------

### [Tales From a Core File - Lessons from the Unix stdio ABI: 40 Years Later](https://fingolfin.org/blog/20200327/stdio-abi.html) ###

>
>
> On the side, I’ve been wrapping up some improvements to the classic Unix stdio libraries in illumos. stdio contains the classic functions like fopen(), printf(), and the security nightmare gets(). While working on support for fmemopen() and friends I got to reacquaint myself with some of the joys of the stdio ABI and its history from 7th Edition Unix. With that in mind, let’s dive into this, history, and some mistakes not to repeat. While this is written from the perspective of the C programming language, aspects of it apply to many other languages.
>
>

---

### [Update Lenovo X260 BIOS with OpenBSD](https://www.tumfatig.net/20200331/update-lenovo-x260-bios-with-openbsd/) ###

>
>
> My X260 only runs OpenBSD and has no CD driver. But I still need to upgrade its BIOS from time to time. And this is possible using the ISO BIOS image.
>
>
>
> First off all, you need to download the “BIOS Update (Bootable CD)” from the Lenovo Support Website.
>
>

---

News Roundup
----------

### [The problem of Unix iowait and multi-CPU machines](https://utcc.utoronto.ca/~cks/space/blog/unix/IowaitAndMultipleCPUs) ###

>
>
> Various Unixes have had a 'iowait' statistic for a long time now (although I can't find a source for where it originated; it's not in 4.x BSD, so it may have come through System V and sar). The traditional and standard definition of iowait is that it's the amount of time the system was idle but had at least one process waiting on disk IO. Rather than count this time as 'idle' (as you would if you had a three-way division of CPU time between user, system, and idle), some Unixes evolved to count this as a new category, 'iowait'.
>
>

---

### [My Latest Self Hosted Hugo Workflow using FreeBSD Jails, Caddy, Restic and More](https://www.jaredwolff.com/my-latest-self-hosted-hugo-workflow/) ###

>
>
> After hosting with Netlify for a few years, I decided to head back to self hosting. Theres a few reasons for that but the main reasoning was that I had more control over how things worked.
>
>
>
> In this post, i’ll show you my workflow for deploying my Hugo generated site ([www.jaredwolff.com](http://www.jaredwolff.com)). Instead of using what most people would go for, i’ll be doing all of this using a FreeBSD Jails based server. Plus i’ll show you some tricks i’ve learned over the years on bulk image resizing and more.
>
>
>
> Let’s get to it.
>
>

---

### [Extending support for the NetBSD-7 branch](http://blog.netbsd.org/tnf/entry/extending_support_for_the_netbsd) ###

>
>
> Typically, some time after releasing a new NetBSD major version (such as NetBSD 9.0), we will announce the end-of-life of the N-2 branch, in this case NetBSD-7.
>
>
>
> We've decided to hold off on doing that to ensure our users don't feel rushed to perform a major version update on any remote machines, possibly needing to reach the machine if anything goes wrong.
>
>
>
> Security fixes will still be made to the NetBSD-7 branch.
>
>
>
> We hope you're all safe. Stay home.
>
>

---

### [Tale of two hypervisor bugs - Escaping from FreeBSD bhyve](http://phrack.org/papers/escaping_from_freebsd_bhyve.html) ###

>
>
> VM escape has become a popular topic of discussion over the last few years. A good amount of research on this topic has been published for various hypervisors like VMware, QEMU, VirtualBox, Xen and Hyper-V. Bhyve is a hypervisor for FreeBSD supporting hardware-assisted virtualization. This paper details the exploitation of two bugs in bhyve - FreeBSD-SA-16:32.bhyve (VGA emulation heap overflow) and CVE-2018-17160 (Firmware Configuration device bss buffer overflow) and some generic techniques which could be used for exploiting other bhyve bugs. Further, the paper also discusses sandbox escapes using PCI device passthrough, and Control-Flow Integrity bypasses in HardenedBSD 12-CURRENT
>
>

---

Beastie Bits
----------

* [GhostBSD 20.02 Overview](https://www.youtube.com/watch?v=kFG-772WGwg)
* [FuryBSD 12.1 Overview](https://www.youtube.com/watch?v=5V8680uoXxw) \> Joe Maloney got in touch to say that the issues in the video and other ones found have since been fixed. Now that's community feedback in action, and an example of a developer who does his best to help the community. A great guy indeed.
* [OS108-9.0 amd64 MATE released](https://forums.os108.org/d/27-os108-9-0-amd64-mate-released)
* [FreeBSD hacking: carp panics & test](https://www.twitch.tv/videos/584064729)
* [Inaugural FreeBSD Office Hours](https://www.youtube.com/watch?v=6qBm5NM3zTQ)

---

Feedback/Questions
----------

* Shody - [systemd question](http://dpaste.com/2SAQDJJ#wrap)
* Ben - [GELI and GPT](http://dpaste.com/1S0DGT3#wrap)
* Stig - [DIY NAS](http://dpaste.com/2NGNZG5#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.