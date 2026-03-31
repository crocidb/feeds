+++
title = "326: Certified BSD"
description = "LPI releases BSD Certification, openzfs trip report, Using FreeBSD with ports, LLDB threading support ready, Linux versus Open Source Unix, and more.Headlines[Linux Professional Institute Releases BSD Specialist Certification - re BSD Certification Group](https://ww"
date = "2019-11-28T12:00:00Z"
url = "https://www.bsdnow.tv/326"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.584120378Z"
seen = true
+++

LPI releases BSD Certification, openzfs trip report, Using FreeBSD with ports, LLDB threading support ready, Linux versus Open Source Unix, and more.

Headlines
----------

### [Linux Professional Institute Releases BSD Specialist Certification - re BSD Certification Group](https://www.lpi.org/articles/linux-professional-institute-releases-bsd-specialist-certification) ###

>
>
> Linux Professional Institute extends its Open Technology certification track with the BSD Specialist Certification. Starting October 30, 2019, BSD Specialist exams will be globally available. The certification was developed in collaboration with the BSD Certification Group which merged with Linux Professional Institute in 2018.
>
>
>
> G. Matthew Rice, the Executive Director of Linux Professional Institute says that "the release of the BSD Specialist certification marks a major milestone for Linux Professional Institute. With this new credential, we are reaffirming our belief in the value of, and support for, all open source technologies. As much as possible, future credentials and educational programs will include coverage of BSD.”
>
>

---

### [OpenZFS Trip Report](https://www.ixsystems.com/blog/openzfs-dev-summit-2019/) ###

>
>
> The seventh annual OpenZFS Developer Summit took place on November 4th and 5th in San Francisco and brought together a healthy mix of familiar faces and new community participants. Several folks from iXsystems took part in the talks, hacking, and socializing at this amazing annual event. The messages of the event can be summed up as Unification, Refinement, and Ecosystem Tooling.
>
>

---

News Roundup
----------

### [Using FreeBSD with Ports (2/2): Tool-assisted updating](https://eerielinux.wordpress.com/2019/09/12/using-freebsd-with-ports-2-2-tool-assisted-updating/) ###

* Part 1 here: [https://eerielinux.wordpress.com/2019/08/18/using-freebsd-with-ports-1-2-classic-way-with-tools/](https://eerielinux.wordpress.com/2019/08/18/using-freebsd-with-ports-1-2-classic-way-with-tools/)

>
>
> In the previous post I explained why sometimes building your software from ports may make sense on FreeBSD. I also introduced the reader to the old-fashioned way of using tools to make working with ports a bit more convenient.
>
>
>
> In this follow-up post we’re going to take a closer look at portmaster and see how it especially makes updating from ports much, much easier. For people coming here without having read the previous article: What I describe here is not what every FreeBSD admin today should consider good practice (any more)! It can still be useful in special cases, but my main intention is to discuss this for building up the foundation for what you actually should do today.
>
>

---

### [LLDB Threading support now ready for mainline](http://blog.netbsd.org/tnf/entry/lldb_threading_support_now_ready) ###

>
>
> Upstream describes LLDB as a next generation, high-performance debugger. It is built on top of LLVM/Clang toolchain, and features great integration with it. At the moment, it primarily supports debugging C, C++ and ObjC code, and there is interest in extending it to more languages.
>
>
>
> In February, I have started working on LLDB, as contracted by the NetBSD Foundation. So far I've been working on reenabling continuous integration, squashing bugs, improving NetBSD core file support, extending NetBSD's ptrace interface to cover more register types and fix compat32 issues and fixing watchpoint support. Then, I've started working on improving thread support which is taking longer than expected. You can read more about that in my September 2019 report.
>
>
>
> So far the number of issues uncovered while enabling proper threading support has stopped me from merging the work-in-progress patches. However, I've finally reached the point where I believe that the current work can be merged and the remaining problems can be resolved afterwards. More on that and other LLVM-related events happening during the last month in this report.
>
>

---

### [Linux VS open source UNIX](https://www.adminbyaccident.com/politics/linux-vs-open-source-unix/) ###

---

Beastie Bits
----------

* [Support for Realtek RTL8125 2.5Gb Ethernet controller](https://marc.info/?l=openbsd-tech&m=157380442230074&w=2)
* [Computer Files Are Going Extinct](https://onezero.medium.com/the-death-of-the-computer-file-doc-43cb028c0506)
* [FreeBSD kernel hacking](https://www.youtube.com/watch?v=4FUub_UtF3c)
* [Modern BSD Computing for Fun on a VAX! Trying to use a VAX in today's world by Jeff Armstrong](https://youtu.be/e7cJ7v2lYdE)
* [MidnightBSD 1.2 Released](https://www.justjournal.com/users/mbsd/entry/33779)

---

Feedback/Questions
----------

* Paulo - [Zfs snapshots](http://dpaste.com/0WQRP43#wrap)
* Phillip - [GCP](http://dpaste.com/075ZQE1#wrap)
* A Listener - [Old episodes?](http://dpaste.com/3YJ4119#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.