+++
title = "Episode 280: FOSS Clothing | BSD Now 280"
description = "A EULA in FOSS clothing, NetBSD with more LLVM support, Thoughts on FreeBSD 12.0, FreeBSD Performance against Windows and Linux on Xeon, Microsoft shipping NetBSD, and more.Headlines[A EULA in FOSS clothing?](http://dtrace.org/blogs/bmc/2018/12/16/a-eula-in-foss-clo"
date = "2019-01-10T08:00:00Z"
url = "https://www.bsdnow.tv/280"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.671149192Z"
seen = true
+++

A EULA in FOSS clothing, NetBSD with more LLVM support, Thoughts on FreeBSD 12.0, FreeBSD Performance against Windows and Linux on Xeon, Microsoft shipping NetBSD, and more.

Headlines
----------

### [A EULA in FOSS clothing?](http://dtrace.org/blogs/bmc/2018/12/16/a-eula-in-foss-clothing/) ###

> There was a tremendous amount of reaction to and discussion about [my blog entry on the midlife crisis in open source](http://dtrace.org/blogs/bmc/2018/12/14/open-source-confronts-its-midlife-crisis/). As part of this discussion on HN, Jay Kreps of Confluent took the time to write a [detailed response](https://news.ycombinator.com/item?id=18687498#18689179) — which he shortly thereafter elevated into a [blog entry](https://medium.com/@jaykreps/a-quick-comment-on-bryan-cantrills-blog-on-licensing-8dccee41d9e6).

> Let me be clear that I hold Jay in high regard, as both a software engineer and an entrepreneur — and I appreciate the time he took to write a thoughtful response. That said, there are aspects of his response that I found troubling enough to closely re-read the Confluent Community License — and that in turn has led me to a deeply disturbing realization about what is potentially going on here.

> To GitHub: Assuming that this is in fact a EULA, I think it is perilous to allow EULAs to sit in public repositories. It’s one thing to have one click through to accept a license (though again, that itself is dubious), but to say that a git clone is an implicit acceptance of a contract that happens to be sitting somewhere in the repository beggars belief. With efforts like [choosealicense.com](http://choosealicense.com), GitHub has been a model in guiding projects with respect to licensing; it would be helpful for GitHub’s counsel to weigh in on their view of this new strain of source-available proprietary software and the degree to which it comes into conflict with GitHub’s own terms of service.

> To foundations concerned with software liberties, including the Apache Foundation, the Linux Foundation, the Free Software Foundation, the Electronic Frontier Foundation, the Open Source Initiative, and the Software Freedom Conservancy: the open source community needs your legal review on this! I don’t think I’m being too alarmist when I say that this is potentially a dangerous new precedent being set; it would be very helpful to have your lawyers offer their perspectives on this, even if they disagree with one another. We seem to be in some terrible new era of frankenlicenses, where the worst of proprietary licenses are bolted on to the goodwill created by open source licenses; we need your legal voices before these creatures destroy the village!

---

### NetBSD and LLVM ###

[NetBSD entering 2019 with more complete LLVM support](https://blog.netbsd.org/tnf/entry/netbsd_entering_2019_with_more)

> I’m recently helping the NetBSD developers to improve the support for this operating system in various LLVM components. As you can read in my previous report, I’ve been focusing on fixing build and test failures for the purpose of improving the buildbot coverage. Previously, I’ve resolved test failures in LLVM, Clang, LLD, libunwind, openmp and partially libc++. During the remainder of the month, I’ve been working on the remaining libc++ test failures, improving the NetBSD clang driver and helping Kamil Rytarowski with compiler-rt.

[The process of upstreaming support to LLVM sanitizers has been finalized](https://blog.netbsd.org/tnf/entry/the_process_of_upstreaming_support)

> I’ve finished the process of upstreaming patches to LLVM sanitizers (almost 2000LOC of local code) and submitted to upstream new improvements for the NetBSD support. Today out of the box (in unpatched version) we have support for a variety of compiler-rt LLVM features: ASan (finds unauthorized memory access), UBSan (finds unspecified code semantics), TSan (finds threading bugs), MSan (finds uninitialized memory use), SafeStack (double stack hardening), Profile (code coverage), XRay (dynamic code tracing); while other ones such as Scudo (hardened allocator) or DFSan (generic data flow sanitizer) are not far away from completeness. The NetBSD support is no longer visibly lacking behind Linux in sanitizers, although there are still failing tests on NetBSD that are not observed on Linux. On the other hand there are features working on NetBSD that are not functional on Linux, like sanitizing programs during early initialization process of OS (this is caused by /proc dependency on Linux that is mounted by startup programs, while NetBSD relies on sysctl(3) interfaces that is always available).

---

News Roundup
----------

### [Thoughts on FreeBSD 12.0](https://distrowatch.com/weekly.php?issue=20190107#freebsd) ###

> Playing with FreeBSD with past week I don’t feel as though there were any big surprises or changes in this release compared to FreeBSD 11. In typical FreeBSD fashion, progress tends to be evolutionary rather than revolutionary, and this release feels like a polished and improved incremental step forward. I like that the installer handles both UFS and ZFS guided partitioning now and in a friendly manner. In the past I had trouble getting FreeBSD’s boot menu to work with boot environments, but that has been fixed for this release. I like the security options in the installer too. These are not new, but I think worth mentioning. FreeBSD, unlike most Linux distributions, offers several low-level security options (like hiding other users’ processes and randomizing PIDs) and I like having these presented at install time. It’s harder for people to attack what they cannot see, or predict, and FreeBSD optionally makes these little adjustment for us. Something which stands out about FreeBSD, compared to most Linux distributions I run, is that FreeBSD rarely holds the user’s hand, but also rarely surprises the user. This means there is more reading to do up front and new users may struggle to get used to editing configuration files in a text editor. But FreeBSD rarely does anything unless told to do it. Updates rarely change the system’s behaviour, working technology rarely gets swapped out for something new, the system and its applications never crashed during my trial. Everything was rock solid. The operating system may seem like a minimal, blank slate to new users, but it’s wonderfully dependable and predictable in my experience. I probably wouldn’t recommend FreeBSD for desktop use. It’s close relative, GhostBSD, ships with a friendly desktop and does special work to make end user applications run smoothly. But for people who want to run servers, possible for years without change or issues, FreeBSD is a great option. It’s also an attractive choice, in my opinion, for people who like to build their system from the ground up, like you would with Debian’s server install or Arch Linux. Apart from the base tools and documentation, there is nothing on a FreeBSD system apart from what we put on it.

---

### [FreeBSD 12.0 Performance Against Windows & Linux On An Intel Xeon Server](https://www.phoronix.com/scan.php?page=article&item=freebsd-12-windows&num=1) ###

> Last week I posted benchmarks of Windows Server 2019 against various Linux distributions using a Tyan dual socket Intel Xeon server. In this article are some complementary results when adding in the performance of FreeBSD 11.2 against the new FreeBSD 12.0 stable release for this leading BSD operating system. As some fun benchmarks to end out 2018, here are the results of FreeBSD 11.2/12.0 (including an additional run when using GCC rather than Clang) up against Windows Server and several enterprise-ready Linux distributions. While FreeBSD 12.0 had picked up just one win of the Windows/Linux comparisons run, the FreeBSD performance is moving in the right direction. FreeBSD 12.0 was certainly faster than FreeBSD 11.2 on this dual Intel Xeon Scalable server based on a Tyan 1U platform. Meanwhile, to no surprise given the data last week, Clear Linux was by far the fastest out-of-the-box operating system tested. I did run some extra benchmarks on FreeBSD 11.2/12.0 with this hardware: in total I ran 120 benchmarks for these BSD tests. Of the 120 tests, there were just 15 cases where FreeBSD 11.2 was faster than 12.0. Seeing FreeBSD 12.0 faster than 11.2 nearly 90% of the time is an accomplishment and usually with other operating systems we see more of a mixed bag on new releases with not such solidly better performance. It was also great seeing the competitive performance out of FreeBSD when using the Clang compiler for the source-based tests compared to the GCC8 performance. Additional data available via this [OpenBenchmarking.org](http://OpenBenchmarking.org) result file.

---

### [How NetBSD came to be shipped by Microsoft](http://fogey.com/contemplating/?p=1023) ###

[Google cache in case the site is down](https://webcache.googleusercontent.com/search?q=cache:5XwAm5tvJ4AJ:fogey.com/contemplating/?p=1023+&cd=1&hl=en&ct=clnk&gl=us)

> In 2000, Joe Britt, Matt Hershenson and Andy Rubin formed Danger Incorporated. Danger developed the world’s first recognizable smartphone, the Danger HipTop. T-Mobile sold the first HipTop under the brand name Sidekick in October of 2002. Danger had a well developed kernel that had been designed and built in house. The kernel came to be viewed as not a core intellectual property and Danger started a search for a replacement. For business reasons, mostly to do with legal concerns over the Gnu Public License, Danger rejected Linux and began to consider BSD Unix as a replacement for the kernel. In 2006 I was hired by Mike Chen, the manager of the kernel development group to investigate the feasibility of replacing the Danger kernel with a BSD kernel, to select the version of BSD to use, to develop a prototype and to develop the plan for adapting BSD to Danger’s requirements. NetBSD was easily the best choice among the BSD variations at the time because it had well developed cross development tools. It was easy to use a NetBSD desktop running an Intel release to cross compile a NetBSD kernel and runtime for a device running an ARM processor. (Those interested in mailing list archaeology might be amused to investigate NetBSD technical mailing list for mail from picovex, particularly from Bucky Katz at picovex.) We began product development on the specific prototype of the phone that would become the Sidekick LX2009 in 2007 and contracts for the phone were written with T-Mobile. We were about half way through the two year development cycle when Microsoft purchased Danger in 2008. Microsoft would have preferred to ship the Sidekick running Windows/CE rather than NetBSD, but a schedule analysis performed by me, and another by an independent outside contractor, indicated that doing so would result in unacceptable delay.

---

Beastie Bits
----------

* [Unleashed 1.2 Released](http://lists.31bits.net/archives/devel/2018-December/000033.html)
* [35th CCC - Taming the Chaos: Can we build systems that actually work? ](https://media.ccc.de/v/35c3-9647-taming_the_chaos_can_we_build_systems_that_actually_work)
* [Potholes to avoid when migrating to IPv6](https://rachelbythebay.com/w/2018/12/30/v6/)
* [XScreenSaver 5.42](https://www.jwz.org/blog/2018/12/xscreensaver-5-41/)
* [SSH Examples and Tunnels](https://hackertarget.com/ssh-examples-tunnels/)
* [Help request - mbuf(9) - request for comment](https://old.reddit.com/r/freebsd/comments/abevqa/mbuf9_request_for_comment/)
* [NSA to release free Reverse Engineering Tool](https://www.zdnet.com/article/nsa-to-release-a-free-reverse-engineering-tool/)
* [Running FreeBSD on a Raspberry Pi3 using a custom image created with crochet and poudriere](https://blog.grem.de/sysadmin/FreeBSD-On-rpi3-With-crochet-2018-10-27-18-00.html)

---

Feedback/Questions
----------

* Dries - [Lets talk a bit about VIMAGE jails](http://dpaste.com/2DCEJD6#wrap)
* ohb - [Question About ZFS Root Dataset](http://dpaste.com/1EGDSKQ#wrap)
* Micah - [Active-Active NAS Sync recommendations](http://dpaste.com/3TK2JWF#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---