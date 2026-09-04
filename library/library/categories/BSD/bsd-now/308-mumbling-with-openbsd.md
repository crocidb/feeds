+++
title = "308: Mumbling with OpenBSD"
description = "Replacing a (silently) failing disk in a ZFS pool, OPNsense 19.7 RC1 released, implementing DRM ioctl support for NetBSD, High quality/low latency VOIP server with umurmur/Mumble on OpenBSD, the PDP-7 where Unix began, LLDB watchpoints, and more.Headlines[Replacing "
date = "2019-07-25T03:00:00Z"
url = "https://www.bsdnow.tv/308"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.618735902Z"
seen = true
+++

Replacing a (silently) failing disk in a ZFS pool, OPNsense 19.7 RC1 released, implementing DRM ioctl support for NetBSD, High quality/low latency VOIP server with umurmur/Mumble on OpenBSD, the PDP-7 where Unix began, LLDB watchpoints, and more.

Headlines
----------

### [Replacing a (silently) failing disk in a ZFS pool](https://imil.net/blog/2019/07/02/Replacing-a-silently-failing-disk-in-a-ZFS-pool/) ###

>
>
> Maybe I can’t read, but I have the feeling that official documentations explain every single corner case for a given tool, except the one you will actually need. My today’s struggle: replacing a disk within a FreeBSD ZFS pool.  
>  What? there’s a shitton of docs on this topic! Are you stupid?  
>  I don’t know, maybe. Yet none covered the process in a simple, straight and complete manner.
>
>

---

### [OPNsense 19.7 RC1 released](https://opnsense.org/opnsense-19-7-rc1-released/) ###

>
>
> Hi there,  
>  For four and a half years now, OPNsense is driving innovation through modularising and hardening the open source firewall, with simple and reliable firmware upgrades, multi-language support, HardenedBSD security, fast adoption of upstream software updates as well as clear and stable 2-Clause BSD licensing.  
>  We thank all of you for helping test, shape and contribute to the project! We know it would not be the same without you.  
>  Download links, an installation guide[1] and the checksums for the images can be found below as well.
>
>

---

News Roundup
----------

### [Implementation of DRM ioctl Support for NetBSD kernel](https://blog.netbsd.org/tnf/entry/implementation_of_drm_ioctl_support) ###

* What is DRM ioctl ?

>
>
> Ioctls are input/output control system calls and DRM stands for direct rendering manager The DRM layer provides several services to graphics drivers, many of them driven by the application interfaces it provides through libdrm, the library that wraps most of the DRM ioctls. These include vblank event handling, memory management, output management, framebuffer management, command submission & fencing, suspend/resume support, and DMA services.
>
>

* Native DRM ioctl calls

>
>
> NetBSD was able to make native DRM ioctl calls with hardware rendering once xorg and proper mesa packages where installed. We used the glxinfo and glxgears applications to test this out.
>
>

---

### [High quality / low latency VOIP server with umurmur/Mumble on OpenBSD](https://dataswamp.org/~solene/2019-07-04-umurmur.html) ###

>
>
> Discord users keep telling about their so called discord server, which is not dedicated to them at all. And Discord has a very bad quality and a lot of voice distorsion.  
>  Why not run your very own mumble server with high voice quality and low latency and privacy respect? This is very easy to setup on OpenBSD!  
>  Mumble is an open source voip client, it has a client named Mumble (available on various operating system) and at least Android, the server part is murmur but there is a lightweight server named umurmur. People authentication is done through certificate generated locally and automatically accepted on a server, and the certificate get associated with a nickname. Nobody can pick the same nickname as another person if it’s not the same certificate.
>
>

---

### [TMWL June’19 — JS Fetch API, scheduling in Spring, thoughts on Unix](https://blog.softwaremill.com/tmwl-june19-js-fetch-api-scheduling-in-spring-thoughts-on-unix-fd54f50ecd64) ###

* Unix — going back to the roots

>
>
> From time to time, I like to review my knowledge in a certain area, even when I feel like I know a lot about it already. I go back to the basics and read tutorials, manuals, books or watch interesting videos.  
>  I’ve been using macOS for a couple of years now, previously being a linux user for some (relatively short) time. Both these operating systems have a common ancestor — Unix. While I’m definitely not an expert, I feel quite comfortable using linux & macOS — I understand the concepts behind the system architecture, know a lot of command line tools & navigate through the shell without a hassle. So-called unix philosophy is also close to my heart. I always feel like there’s more I could squeeze out of it.  
>  Recently, I found that book titled “Unix for dummies, 5th edition” which was published back in… 2004. Feels literally like AGES in the computer-related world. However, it was a great shot — the book starts with the basics, providing some brief history of Unix and how it came to life. It talks a lot about the structure of the system and where certain pieces fit (eg. “standard” set of tools), and how to understand permissions and work with files & directories. There’s even a whole chapter about shell-based text editors like Vi and Emacs! Despite the fact that I am familiar with most of these, I could still find some interesting pieces & tools that I either knew existed (but never had a chance to use), or even haven’t ever heard of. And almost all of these are still valid in the modern “incarnations” of Unix’s descendants: Linux and macOS.  
>  The book also talks about networking, surfing the web & working with email. It’s cute to see pictures of those old browsers rendering “ancient” Internet websites, but hey — this is how it looked like no more than fifteen years ago!  
>  I can really recommend this book to anyone working on modern macOS or Linux — you will certainly find some interesting pieces. Especially if you like to go back to the roots from time to time as I do!
>
>

---

### [ThePDP-7 Where Unix Began](https://bsdimp.blogspot.com/2019/07/the-pdp-7-where-unix-began.html) ###

>
>
> In preparation for a talk on Seventh Edition Unix this fall, I stumbled upon a service list from DEC for all known PDP-7 machines. From that list, and other sources, I believe that PDP-7 serial number 34 was the original Unix machine.  
>  V0 Unix could run on only one of the PDP-7s. Of the 99 PDP-7s produced, only two had disks. Serial number 14 had an RA01 listed, presumably a disk, though of a different type. In addition to the PDP-7 being obsolete in 1970, no other PDP-7 could run Unix, limiting its appeal outside of Bell Labs. By porting Unix to the PDP-11 in 1970, the group ensured Unix would live on into the future. The PDP-9 and PDP-15 were both upgrades of the PDP-7, so to be fair, PDP-7 Unix did have a natural upgrade path (the PDP-11 out sold the 18 bit systems though \~600,000 to \~1000). Ken Thompson reports in a private email that there were 2 PDP-9s and 1 PDP-15 at Bell Labs that could run a version of the PDP-7 Unix, though those machines were viewed as born obsolete.
>
>

---

### [LLDB: watchpoints, XSTATE in ptrace() and core dumps](https://blog.netbsd.org/tnf/entry/lldb_watchpoints_xstate_in_ptrace) ###

>
>
> Upstream describes LLDB as a next generation, high-performance debugger. It is built on top of LLVM/Clang toolchain, and features great integration with it. At the moment, it primarily supports debugging C, C++ and ObjC code, and there is interest in extending it to more languages.  
>  In February, I have started working on LLDB, as contracted by the NetBSD Foundation. So far I've been working on reenabling continuous integration, squashing bugs, improving NetBSD core file support and lately extending NetBSD's ptrace interface to cover more register types and fix compat32 issues. You can read more about that in my May 2019 report.  
>  In June, I have finally finished the remaining ptrace() work for xstate and got it merged both on NetBSD and LLDB end (meaning it's going to make it into NetBSD 9). I have also worked on debug register support in LLDB, effectively fixing watchpoint support. Once again I had to fight some upstream regressions.
>
>

Beastie Bits
----------

* [Project Trident 19.07 Available](https://project-trident.org/post/2019-07-12_19.07_available/)
* [A list of names from "Cold Blood" -- Any familiar?](https://www.montanalinux.org/cold-blood-list-of-numbers-201907.html)
* [fern: a curses-based mastodon client modeled off usenet news readers & pine, with an emphasis on getting to 'timeline zero'](https://github.com/enkiv2/fern)
* [OpenBSD Community goes Platinum for 2019!](https://undeadly.org/cgi?action=article;sid=20190707065226)
* [tcp keepalive and dports on DragonFly](https://www.dragonflydigest.com/2019/07/15/23199.html)

---

Feedback/Questions
----------

* Patrick - [OpenZFS/ZoL Module from Ports](http://dpaste.com/1W2HJ04)
* Brad - [Services not starting](http://dpaste.com/345VM9Y#wrap)
* Simon - [Feedback](http://dpaste.com/1B4ZKC8#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.