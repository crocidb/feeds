+++
title = "63: A Man's man(1)"
description = "This time on the show, we've got an interview with Kristaps Džonsons, the creator of mandoc. He tells us how the project got started and what its current status is across the various BSDs. We also have a mini-tutorial on using PF to throttle bandwidth. This week's news, answers t"
date = "2014-11-12T13:00:00Z"
url = "https://www.bsdnow.tv/63"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.196336599Z"
seen = true
+++

This time on the show, we've got an interview with Kristaps Džonsons, the creator of mandoc. He tells us how the project got started and what its current status is across the various BSDs. We also have a mini-tutorial on using PF to throttle bandwidth. This week's news, answers to your emails and even some cheesy mailing list gold, coming up on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Updates to FreeBSD's random(4)](https://svnweb.freebsd.org/base?view=revision&revision=273872) ###

* FreeBSD's random device, which presents itself as "/dev/random" to [users](https://news.ycombinator.com/item?id=8550457), has gotten a fairly major overhaul in -CURRENT
* The CSPRNG (cryptographically secure pseudo-random number generator) algorithm, Yarrow, now has a new alternative called Fortuna
* Yarrow is still the default for now, but Fortuna can be used with a kernel option (and will likely be the new default in 11.0-RELEASE)
* Pluggable modules can now be written to add more sources of entropy
* These changes are expected to make it in 11.0-RELEASE, but there hasn't been any mention of MFCing them to 10 or 9 \*\*\*

### [OpenBSD Tor relays and network diversity](https://lists.torproject.org/pipermail/tor-relays/2014-November/005661.html) ###

* We've talked about getting [more BSD-based Tor nodes](http://lists.nycbug.org/mailman/listinfo/tor-bsd) a few times in previous episodes
* The "tor-relays" mailing list has had some recent discussion about increasing diversity in the Tor network, specifically by adding more OpenBSD nodes
* With the security features and attention to detail, it makes for an excellent dedicated Tor box
* More and more adversaries are attacking Tor nodes, so having something that can withstand that will help the greater network at large
* A few users are even saying they'll *convert their Linux nodes* to OpenBSD to help out
* Check the archive for the full conversation, and maybe [run a node yourself](http://www.bsdnow.tv/tutorials/tor) on any of the BSDs
* The Tor wiki page on OpenBSD is pretty [out of date](https://lists.torproject.org/pipermail/tor-dev/2014-November/007715.html) (nine years old!?) and uses the old pf syntax, maybe one of our listeners can modernize it \*\*\*

### [SSP now default for FreeBSD ports](https://lists.freebsd.org/pipermail/freebsd-ports/2014-November/096344.html) ###

* SSP, or [Stack Smashing Protection](https://en.wikipedia.org/wiki/Buffer_overflow_protection), is an additional layer of protection against buffer overflows that the compiler can give to the binaries it produces
* It's now enabled by default in FreeBSD's ports tree, and the pkgng packages will have it as well - but only for amd64 (all supported releases) and i386 (10.0-RELEASE or newer)
* This will only apply to regular ports and binary packages, not the quarterly branch that only receives security updates
* If you were using the temporary "new Xorg" or SSP package repositories instead of the default ones, you need to switch back over
* NetBSD made this the default on i386 and amd64 [two years ago](https://www.netbsd.org/releases/formal-6/NetBSD-6.0.html) and OpenBSD made this the default on all architectures [twelve years ago](https://www.marc.info/?l=openbsd-cvs&m=103881967909595&w=2)
* Next time you rebuild your ports, things should be automatically hardened without any extra steps or configuration needed \*\*\*

### [Building an OpenBSD firewall and router](https://www.reddit.com/r/BSD/comments/2ld0yw/building_an_openbsd_firewall_and_router/) ###

* While we've discussed the software and configuration of an OpenBSD router, this Reddit thread focuses more on the hardware side
* The OP lists some of his potential choices, but was originally looking for something a bit cheaper than a Soekris
* Most agree that, if it's for a business especially, it's worth the extra money to go with something that's well known in the BSD community
* They also list a few other popular alternatives: ALIX or the APU series from PC Engines, some Supermicro boards, etc.
* Through the comments, we also find out that **QuakeCon runs OpenBSD** on their network
* Hopefully most of our listeners are running some kind of BSD as their gateway - [try it out](http://www.bsdnow.tv/tutorials/openbsd-router) if you haven't already \*\*\*

Interview - Kristaps Džonsons - [kristaps@bsd.lv](mailto:kristaps@bsd.lv)
----------

Mandoc, historical man pages, various topics

---

Tutorial
----------

### [Throttling bandwidth with PF](http://www.bsdnow.tv/tutorials/openbsd-router#queues) ###

---

News Roundup
----------

### [NetBSD at Kansai Open Forum 2014](https://mail-index.netbsd.org/netbsd-advocacy/2014/11/08/msg000672.html) ###

* Japanese NetBSD users invade yet another conference, demonstrating that they **can and will** install NetBSD *on everything*
* From a Raspberry Pi to SHARP Netwalkers to various luna68k devices, they had it all
* As always, you can find lots of pictures in the trip report \*\*\*

### [Getting to know your portmgr lurkers](http://blogs.freebsdish.org/portmgr/2014/11/04/getting-to-know-your-portmgr-lurker-ak/) ###

* The lovable "getting to know your portmgr" series makes its triumphant return
* This time around, they interview Alex, one of the portmgr lurkers that joined just this month
* "How would you describe yourself?" "Too lazy."
* [Another post](http://blogs.freebsdish.org/portmgr/2014/11/08/getting-to-know-your-portmgr-lurker-ehaupt/) includes a short interview with Emanuel, another new lurker
* We discussed the portmgr lurkers initiative with Steve Wills [a while back](http://www.bsdnow.tv/episodes/2014_10_01-the_daemons_apprentice) \*\*\*

### [NetBSD's ARM port gets SMP](https://blog.netbsd.org/tnf/entry/working_arm_multiprocessor_support) ###

* The ARM port of NetBSD now has SMP support, allowing more than one CPU to be used
* This blog post on the website has a list of supported boards: Banana Pi, Cubieboard 2, Cubietruck, Merrii Hummingbird A31, CUBOX-I and NITROGEN6X
* NetBSD's release team is working on getting these changes into the 7 branch before 7.0 is released
* There are also a few nice pictures in the article \*\*\*

### [A high performance mid-range NAS](http://pivotallabs.com/high-performing-mid-range-nas-server-part-2-performance-tuning-iscsi/) ###

* This blog post is about FreeNAS and optimizing iSCSI performance
* It talks about using mid-range hardware with FreeNAS and different tunables you can change to affect performance
* There are some nice graphs and lots of detail if you're interested in tweaking some of your own settings
* They conclude "there is no optimal configuration; rather, FreeNAS can be configured to suit a particular workload" \*\*\*

Feedback/Questions
----------

* [Heto writes in](http://slexy.org/view/s2xGCUj8mC)
* [Brad writes in](http://slexy.org/view/s2SJ8xppDJ)
* [Tyler writes in](http://slexy.org/view/s20Ktl6BMk)
* [Tim writes in](http://slexy.org/view/s2AsrxU0ZQ)
* [Brad writes in](http://slexy.org/view/s21yn0xLv2) \*\*\*

Mailing List Gold
----------

* [Suspicious contributions](https://www.marc.info/?t=141379917200003&r=1&w=2)
* [La puissance du fromage](https://www.marc.info/?l=openbsd-cvs&m=141538800019451&w=2)
* [Nothing unusual here](https://mail-index.netbsd.org/tech-ports/2002/07/05/0000.html) \*\*\*