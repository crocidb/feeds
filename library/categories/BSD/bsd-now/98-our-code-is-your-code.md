+++
title = "98: Our Code is Your Code"
description = "Coming up this time on the show, we'll be talking with the CTO of Xinuos, David Meyer, about their adoption of FreeBSD. We also discuss the BSD license model for businesses and the benefits of contributing changes back.This episode was brought to you by[![iXsystems - En"
date = "2015-07-15T12:00:00Z"
url = "https://www.bsdnow.tv/98"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.123135685Z"
seen = false
+++

Coming up this time on the show, we'll be talking with the CTO of Xinuos, David Meyer, about their adoption of FreeBSD. We also discuss the BSD license model for businesses and the benefits of contributing changes back.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Enabling FreeBSD on AArch64](https://community.arm.com/groups/processors/blog/2015/07/07/enabling-freebsd-on-aarch64) ###

* One of the things the FreeBSD foundation has been dumping money into lately is ARM64 support, but we haven't heard too much about it - this article should change that
* Since it's on a mainstream ARM site, the article begins with a bit of FreeBSD history, leading up to the current work on ARM64
* There's also a summary of some of the ARM work done at this year's BSDCan, including details about running it on the Cavium ThunderX platform (which has 48 cores)
* As of just a couple months ago, dtrace is even working on this new architecture
* Come 11.0-RELEASE, the plan is for ARM64 to get the same "tier 1" treatment as X86, which would imply binary updates for base and ports - something Raspberry Pi users often complain about not having \*\*\*

### [OpenBSD's tcpdump detailed](https://www.youtube.com/watch?v=8kR-tW1kyDc#t=8) ###

* Most people are probably familiar with [tcpdump](https://en.wikipedia.org/wiki/Tcpdump), a very useful packet sniffing and capturing utility that's included in all the main BSD base systems
* This video guide is specifically about the version in OpenBSD, which has gone through some major changes (it's pretty much a fork with no version number anymore)
* Unlike on the other platforms, OpenBSD's tcpdump will always run in a chroot as an unprivileged user - this has saved it from a number of high-profile exploits
* It also has support for the "pf.os" system, allowing you to filter out operating system fingerprints in the packet captures
* There's also PF (and pflog) integration, letting you see which line in your ruleset triggered a specific match
* Being able to run tcpdump directly [on your router](http://www.bsdnow.tv/tutorials/openbsd-router) is pretty awesome for troubleshooting \*\*\*

### [More FreeBSD foundation at BSDCan](http://freebsdfoundation.blogspot.com/2015/07/bsdcan-2015-trip-report-kamil-czekirda.html) ###

* The FreeBSD foundation has another round of trip reports from this year's BSDCan
* First up is Kamil Czekirda, who gives a good summary of some of the devsummit, FreeBSD-related presentations, some tutorials, getting freebsd-update bugs fixed and of course eating cake
* A [second post](http://freebsdfoundation.blogspot.com/2015/07/bsdcan-2015-trip-report-christian.html) from Christian Brueffer, who cleverly planned ahead to avoid jetlag, details how he got some things done during the FreeBSD devsummit
* Their [third report](http://freebsdfoundation.blogspot.com/2015/07/bsdcan-2015-trip-report-warren-block.html) is from our buddy Warren Block, who (unsurprisingly) worked on a lot of documentation-related things, including getting more people involved with writing them
* In true doc team style, his report is the most well-written of the bunch, including lots of links and a clear separation of topics (doc lounge, contributing to the wiki, presentations...)
* Finally, the [fourth one](http://freebsdfoundation.blogspot.com/2015/07/bsdcan-2015-trip-report-shonali.html) comes to us from Shonali Balakrishna, who also gives an outline of some of the talks
* "Not only does a BSD conference have way too many very smart people in one room, but also some of the nicest." \*\*\*

### [DragonFly on the Chromebook C720](https://www.dragonflydigest.com/2015/07/08/16391.html) ###

* If you've got one of the Chromebook laptops and weren't happy with the included OS, DragonFlyBSD might be worth a go
* This article is a "mini-report" on how DragonFly functions on the device as a desktop, and
* While the 2GB of RAM proved to be a bit limiting, most of the hardware is well-supported
* DragonFly's wiki has [a full guide](http://www.dragonflybsd.org/docs/newhandbook/ConfigChromebook/) on getting set up on one of these devices as well \*\*\*

Interview - David Meyer - [info@xinuos.com](mailto:info@xinuos.com) / [@xinuos](https://twitter.com/xinuos)
----------

Xinuos, BSD license model vs. others, community interaction

---

News Roundup
----------

### [Introducing LiteBSD](https://github.com/sergev/LiteBSD) ###

* We definitely don't talk about 4.4BSD a lot on the show
* LiteBSD is "a variant of [the] 4.4BSD operating system adapted for microcontrollers"
* If you've got really, really old hardware (or are working in the embedded space) then this might be an interesting hobby project to look info \*\*\*

### [HardenedBSD announces ASLR completion](http://hardenedbsd.org/article/shawn-webb/2015-07-06/announcing-aslr-completion) ###

* HardenedBSD, now officially [a full-on fork of FreeBSD](http://hardenedbsd.org/content/about), has declared their ASLR patchset to be complete
* The latest and last addition to the work was VDSO (Virtual Dynamic Shared Object) randomization, which is now configurable with a sysctl
* This post gives a summary of the six main features they've added since [the beginning](http://www.bsdnow.tv/episodes/2014_08_27-reverse_takeover)
* Only a few small things are left to do - man page cleanups, possibly shared object load order improvements \*\*\*

### [Unlock the reaper](https://www.marc.info/?l=openbsd-tech&m=143636371501474&w=2) ###

* In the ongoing quest to make more of OpenBSD SMP-friendly, a new patch was posted that unlocks the reaper in the kernel
* When there's a [zombie process](https://en.wikipedia.org/wiki/Zombie_process) causing a resource leak, it's the [reaper's job](https://en.wikipedia.org/wiki/Wait_(system_call)) to deallocate their resources (and yes we're still talking about computers, not horror movies)
* Initial testing has yielded [positive](https://www.marc.info/?l=openbsd-tech&m=143642748717836&w=2) [results](https://www.marc.info/?l=openbsd-tech&m=143639356810690&w=2) and [no regressions](https://www.marc.info/?l=openbsd-tech&m=143638955809675&w=2)
* They're looking for testers, so you can install a -current snapshot and get it automatically
* An updated version of the patch is [coming soon](https://www.marc.info/?l=openbsd-tech&m=143643025118637&w=2) too
* [A hackathon](http://www.openbsd.org/images/hackathons/c2k15-s.gif) is going on *right now*, so you can expect more SMP improvements in the near future \*\*\*

### [The importance of mentoring](http://adrianchadd.blogspot.com/2015/07/the-importance-of-mentoring-or-how-i.html) ###

* Adrian Chadd has a blog post up about mentoring new users, and it tells the story of how he originally got into FreeBSD
* He tells the story of, at age 11, meeting someone else who knew about making crystal sets that became his role model
* Eventually we get to his first FreeBSD 1.1 installation (which he temporarily abandoned for Linux, since it didn't have a color "ls" command) and how he started using the OS
* Nowadays, there's a formal mentoring system in FreeBSD
* While he talks about FreeBSD in the post, a lot of the concepts apply to all the BSDs (or even just life in general) \*\*\*

Feedback/Questions
----------

* [Sean writes in](http://slexy.org/view/s29LpvIxDD)
* [Herminio writes in](http://slexy.org/view/s21I1MZsDl)
* [Stuart writes in](http://slexy.org/view/s20kk3ilM6)
* [Richard writes in](http://slexy.org/view/s2pL5xA80B) \*\*\*