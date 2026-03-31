+++
title = "334: Distrowatch Running FreeBSD"
description = "Upgrading FreeBSD from 11.3 to 12.1, Distrowatch switching to FreeBSD, Torvalds says don’t run ZFS, iked(8) removed automatic IPv6 blocking, working towards LLDB on i386, and memory-hard Argon2 hashing scheme in NetBSD.Headlines[Upgrading FreeBSD from 11.3 to 12.1]("
date = "2020-01-23T13:00:00Z"
url = "https://www.bsdnow.tv/334"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.569333160Z"
seen = true
+++

Upgrading FreeBSD from 11.3 to 12.1, Distrowatch switching to FreeBSD, Torvalds says don’t run ZFS, iked(8) removed automatic IPv6 blocking, working towards LLDB on i386, and memory-hard Argon2 hashing scheme in NetBSD.

Headlines
----------

### [Upgrading FreeBSD from 11.3 to 12.1](https://blog.bimajority.org/2020/01/13/upgrading-freebsd-from-11-3-to-12-1/) ###

>
>
> Now here’s something more like what I was originally expecting the content on this blog to look like. I’m in the process of moving all of our FreeBSD servers (about 30 in total) from 11.3 to 12.1. We have our own local build of the OS, and until “packaged base” gets to a state where it’s reliably usable, we’re stuck doing upgrades the old-fashioned way. I created a set of notes for myself while cranking through these upgrades and I wanted to share them since they are not really work-specific and this process isn’t very well documented for people who haven’t been doing this sort of upgrade process for 25 years.
>
>
>
> Our source and object trees are read-only exported from the build server over NFS, which causes things to be slow. /etc/make.conf and /etc/src.conf are symbolic links on all of our servers to the master copies in /usr/src so that make installworld can find the configuration parameters the system was built with.
>
>

---

### [Switching Distrowatch over to BSD](https://www.reddit.com/r/freebsd/comments/eodhit/switching_distrowatch_over_to_freebsd_ama/) ###

>
>
> This may be a little off-topic for this board (forgive me if it is, please). However, I wanted to say that I'm one of the people who works on DistroWatch (distrowatch.com) and this past week we had to deal with a server facing hardware failure. We had a discussion about whether to continue running Debian or switch to something else.
>
>
>
> The primary "something else" option turned out to be FreeBSD and it is what we eventually went with. It took a while to convert everything over from working with Debian GNU/Linux to FreeBSD 12 (some script incompatibilities, different paths, some changes to web server configuration, networking IPv6 troubles). But in the end we ended up with a good, FreeBSD-based experience.
>
>
>
> Since the transition was successful, though certainly not seamless, I thought people might want to do a Q&A on the migration process. Especially for those thinking of making the same switch.
>
>

---

News Roundup
----------

### [iked(8) automatic IPv6 blocking removed](https://www.openbsd.org/faq/current.html#r20200114) ###

>
>
> iked(8) no longer automatically blocks unencrypted outbound IPv6 packets. This feature was intended to avoid accidental leakage, but in practice was found to mostly be a cause of misconfiguration.
>
>
>
> If you previously used iked(8)'s -6 flag to disable this feature, it is no longer needed and should be removed from /etc/rc.conf.local if used.
>
>

---

### [Linus says dont run ZFS](https://itsfoss.com/linus-torvalds-zfs/) ###

>
>
> “Don’t use ZFS. It’s that simple. It was always more of a buzzword than anything else, I feel, and the licensing issues just make it a non-starter for me.”
>
>
>
> This is what Linus Torvalds said in a mailing list to once again express his disliking for ZFS filesystem specially over its licensing.
>
>
>
> To avoid unnecessary confusion, this is more intended for Linux distributions, kernel developers and maintainers rather than individual Linux users.
>
>

---

### [GSoC 2019 Final Report: Incorporating the memory-hard Argon2 hashing scheme into NetBSD](https://blog.netbsd.org/tnf/entry/gsoc_2019_final_report_incorporating) ###

>
>
> We successfully incorporated the Argon2 reference implementation into NetBSD/amd64 for our 2019 Google Summer of Coding project. We introduced our project here and provided some hints on how to select parameters here. For our final report, we will provide an overview of what changes were made to complete the project.
>
>
>
> The Argon2 reference implementation, available here, is available under both the Creative Commons CC0 1.0 and the Apache Public License 2.0. To import the reference implementation into src/external, we chose to use the Apache 2.0 license for this project.
>
>

---

### [Working towards LLDB on i386 NetBSD](https://blog.netbsd.org/tnf/entry/working_towards_lldb_on_i386) ###

>
>
> Upstream describes LLDB as a next generation, high-performance debugger. It is built on top of LLVM/Clang toolchain, and features great integration with it. At the moment, it primarily supports debugging C, C++ and ObjC code, and there is interest in extending it to more languages.
>
>
>
> In February 2019, I have started working on LLDB, as contracted by the NetBSD Foundation. So far I've been working on reenabling continuous integration, squashing bugs, improving NetBSD core file support, extending NetBSD's ptrace interface to cover more register types and fix compat32 issues, fixing watchpoint and threading support.
>
>
>
> Throughout December I've continued working on our build bot maintenance, in particular enabling compiler-rt tests. I've revived and finished my old patch for extended register state (XState) in core dumps. I've started working on bringing proper i386 support to LLDB.
>
>

---

Beastie Bits
----------

* [An open source Civilization V](https://github.com/yairm210/UnCiv)
* [BSD Groups in Italy](https://bsdnotizie.blogspot.com/2020/01/gruppi-bsd-in-italia.html)
* [Why is Wednesday, November 17, 1858 the base time for OpenVMS?](https://www.slac.stanford.edu/~rkj/crazytime.txt)
* [Benchmarking shell pipelines and the Unix “tools” philosophy](https://blog.plover.com/Unix/tools.html)
* [LPI and BSD working together](https://youtu.be/QItb5aoj7Oc)

---

Feedback/Questions
----------

* Pat - [March Meeting](http://dpaste.com/2BMGZVV#wrap)
* Madhukar - [Overheating Laptop](http://dpaste.com/17WNVM8#wrap)
* Warren - [R vs S](http://dpaste.com/3AZYFB1#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.