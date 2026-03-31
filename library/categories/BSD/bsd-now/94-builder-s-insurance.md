+++
title = "94: Builder's Insurance"
description = "This week on the show, we'll be chatting with Marc Espie. He's recently added some additional security measures to dpb, OpenBSD's package building tool, and we'll find out why they're so important. We've also got all this week's news, answers to your emails and even a BSDCan wrap"
date = "2015-06-17T12:00:00Z"
url = "https://www.bsdnow.tv/94"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.132802297Z"
seen = true
+++

This week on the show, we'll be chatting with Marc Espie. He's recently added some additional security measures to dpb, OpenBSD's package building tool, and we'll find out why they're so important. We've also got all this week's news, answers to your emails and even a BSDCan wrap-up, coming up on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [BSDCan 2015 videos](https://www.bsdcan.org/2015/schedule/) ###

* BSDCan just ended last week, but some of the BSD-related presentation videos are already online
* Allan Jude, [UCL for FreeBSD](https://www.youtube.com/watch?v=8l6bhKIDecg)
* Andrew Cagney, [What happens when a dwarf and a daemon start dancing by the light of the silvery moon?](https://www.youtube.com/watch?v=XDIcD4LR5HE)
* Andy Tanenbaum, [A reimplementation of NetBSD](https://www.youtube.com/watch?v=0pebP891V0c) [using a MicroKernel](https://www.youtube.com/watch?v=Bu1JuwVfYTc)
* Brooks Davis, [CheriBSD: A research fork of FreeBSD](https://www.youtube.com/watch?v=DwCg-51vFAs)
* Giuseppe Lettieri, [Even faster VM networking with virtual passthrough](https://www.youtube.com/watch?v=Lo6wDCapo4k)
* Joseph Mingrone, [Molecular Evolution, Genomic Analysis and FreeBSD](https://www.youtube.com/watch?v=K2pnf1YcMTY)
* Olivier Cochard-Labbe, [Large-scale plug&play x86 network appliance deployment over Internet](https://www.youtube.com/watch?v=6jhSvdnu4k0)
* Peter Hessler, [Using routing domains / routing tables in a production network](https://www.youtube.com/watch?v=BizrC8Zr-YY)
* Ryan Lortie, [a stitch in time: jhbuild](https://www.youtube.com/watch?v=YSVFnM3_2Ik)
* Ted Unangst, [signify: Securing OpenBSD From Us To You](https://www.youtube.com/watch?v=9R5s3l-0wh0)
* Many more still to come... \*\*\*

### [Documenting my BSD experience](http://pid1.com/posts/post1.html) ###

* Increasingly common scenario: a long-time Linux user (since the mid-90s) decides it's finally time to give BSD a try
* "That night I came home, I had been trying to find out everything I could about BSD and I watched many videos, read forums, etc. One of the shows I found was BSD Now. I saw that they helped people and answered questions, so I decided to write in."
* In this ongoing series of blog posts, a user named Michael writes about his initial experiences with trying different BSDs for some different tasks
* The first post covers ZFS on FreeBSD, used to build a file server for his house (and of course he lists the hardware, if you're into that)
* You get a glimpse of a brand new user trying things out, learning how great ZFS-based RAID arrays are and even some of the initial hurdles someone could run into
* He's also looking to venture into the realm of replacing some of his VMs with jails and bhyve soon
* His [second post](http://pid1.com/posts/post2.html) explores replacing the firewall on his self-described "over complicated home network" with an OpenBSD box
* After going from ipfwadmin to ipchains to iptables, not even making it to nftables, he found the simple PF syntax to be really refreshing
* All the tools for his networking needs, the majority of which are in the base system, worked quickly and were easy to understand
* Getting to hear experiences like this are very important - they show areas where all the BSD developers' hard work has paid off, but can also let us know where we need to improve \*\*\*

### [PC-BSD tries HardenedBSD builds](https://github.com/pcbsd/hardenedBSD-stable) ###

* The PC-BSD team has created a new branch of their git repo with the HardenedBSD ASLR patches integrated
* They're not the first major FreeBSD-based project to offer an alternate build - OPNsense [did that](https://hardenedbsd.org/article/shawn-webb/2015-05-08/hardenedbsd-teams-opnsense) a few weeks ago - but this might open the door for more projects to give it a try as well
* With Personacrypt, OpenNTPD, LibreSSL and recent Tor integration through the tools, these additional memory protections will offer PC-BSD users even more security that a default FreeBSD install won't have
* Time will tell if more projects and products like FreeNAS might be interested too \*\*\*

### [C-states in OpenBSD](https://www.marc.info/?l=openbsd-cvs&m=143423172522625&w=2) ###

* People who run BSD on their notebooks, you'll want to pay attention to this one
* OpenBSD has recently committed some ACPI improvements for [deep C-states](http://www.hardwaresecrets.com/article/Everything-You-Need-to-Know-About-the-CPU-C-States-Power-Saving-Modes/611), enabling the processor to enter a low-power mode
* [According](https://twitter.com/StevenUniq/status/610586711358316545) [to a](https://www.marc.info/?l=openbsd-misc&m=143430996602802&w=2) [few users](https://www.marc.info/?l=openbsd-misc&m=143429914700826&w=2) [so far](https://www.marc.info/?l=openbsd-misc&m=143425943026225&w=2), the change has resulted in dramatically lower CPU temperatures on their laptops, as well as much better battery life
* If you're running OpenBSD -current on a laptop, try out the latest snapshot and [report back](https://www.marc.info/?l=openbsd-misc&m=143423391222952&w=2) with your findings \*\*\*

### [NetBSD at Open Source Conference 2015 Hokkaido](https://mail-index.netbsd.org/netbsd-advocacy/2015/06/13/msg000687.html) ###

* The Japanese NetBSD users group never sleeps, and they've hit yet another open source conference
* As is usually the case, lots of strange machines on display were running none other than NetBSD (though it was mostly ARM this time)
* We'll be having one of these guys on the show next week to discuss some of the lesser-known NetBSD platforms \*\*\*

Interview - Marc Espie - [espie@openbsd.org](mailto:espie@openbsd.org) / [@espie\_openbsd](https://twitter.com/espie_openbsd)
----------

[Recent](https://www.marc.info/?l=openbsd-ports&m=143051151521627&w=2) [improvements](https://www.marc.info/?l=openbsd-ports&m=143151777209226&w=2) to OpenBSD's [dpb](http://www.bsdnow.tv/tutorials/dpb) tool

---

News Roundup
----------

### [Introducing xhyve, bhyve on OS X](https://github.com/mist64/xhyve/blob/master/README.md) ###

* We've talked about FreeBSD's "bhyve" hypervisor a lot on the show, and now it's been ported to another OS
* As the name "xhyve" might imply, it's a port of bhyve to Mac OS X
* Currently it only has support for virtualizing a few Linux distributions, but more guest systems can be added in the future
* It runs entirely in userspace, and has no extra requirements beyond OS X 10.10 or newer
* There are also [a few examples](http://www.pagetable.com/?p=831) on how to use it \*\*\*

### [4K displays on DragonFlyBSD](http://www.dragonflybsd.org/docs/newhandbook/docs/newhandbook/4KDisplays/) ###

* If you've been using DragonFly as a desktop, maybe with those nice Broadwell graphics, you'll be pleased to know that 4K displays work just fine
* Matthew Dillon wrote up a wiki page about some of the specifics, including a couple gotchas
* Some GUI applications might look weird on such a huge resolution,
* HDMI ports are mostly limited to a 30Hz refresh rate, and there are slightly steeper hardware requirements for a smooth experience \*\*\*

### [Sandboxing port daemons on OpenBSD](http://coderinaworldofcode.blogspot.com/2015/06/chrooting-mumble-server-on-openbsd.html) ###

* We talked about different containment methods last week, and mentioned that a lot of the daemons in OpenBSD's base as chrooted by default - things from ports or packages don't always get the same treatment
* This blog post uses a mumble server as an example, but you can apply it to *any* service from ports that doesn't chroot by default
* It goes through the process of manually building a sandbox with all the libraries you'll need to run the daemon, and this setup will even wipe and refresh the chroot every time you restart it
* With a few small changes, similar tricks could be done on the other BSDs as well - everybody has chroots \*\*\*

### [SmallWall 1.8.2 released](http://smallwall.freeforums.net/thread/44/version-1-8-2-released) ###

* SmallWall is a relatively new BSD-based project that we've never covered before
* It's an attempt to keep the old m0n0wall codebase going, and appears to have started around the time m0n0wall called it quits
* They've just released [the first official version](http://www.smallwall.org/download.html), so you can give it a try now
* If you're interested in learning more about SmallWall, the lead developer just might be on the show in a few weeks... \*\*\*

Feedback/Questions
----------

* [David writes in](http://slexy.org/view/s21gRTNnk7)
* [Brian writes in](http://slexy.org/view/s2DdiMvELg)
* [Dan writes in](http://slexy.org/view/s2h4ZS6SMd)
* [Joel writes in](http://slexy.org/view/s20kA1jeXY)
* [Steve writes in](http://slexy.org/view/s2wJ9HP1bs) \*\*\*