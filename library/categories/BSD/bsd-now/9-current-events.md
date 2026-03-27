+++
title = "9: CURRENT Events"
description = "HeadlinesManaged services using FreeBSD New York Internet, a huge ISP and service provider, details how they use FreeBSD Mentions using BSD technologies: pf, pfsync, carp, ha"
date = "2013-10-30T12:00:00Z"
url = "https://www.bsdnow.tv/9"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.295965842Z"
seen = false
+++

Headlines
----------

### [Managed services using FreeBSD](<http://www.freebsdfoundation.org/press/Managed Services Using FreeBSD at NYI.pdf>) ###

* New York Internet, a huge ISP and service provider, details how they use FreeBSD
* Mentions using BSD technologies: pf, pfsync, carp, haproxy, zfs, jails and more
* Explains FreeBSD's role in commercial workloads on a massive scale
* Lots of cool graphs and info, check out the full write-up \*\*\*

### [OpenBSD boot support for keydisk-based crypto volumes](http://marc.info/?l=openbsd-cvs&m=138227554705375&w=2) ###

* So far, only passphrase-based crypto volumes were bootable
* Full disk encryption with key disks required a non-crypto partition to load the kernel
* The bootloader now scans all BIOS-visible disks for RAID partitions and automatically associates key disk partitions with their crypto volume
* No need to re-create existing volumes. Moving the root partition onto the crypto disk and running "installboot" is all that's needed \*\*\*

### [More Dragonfly SMP speedups](http://www.shiningsilence.com/dbsdlog/2013/10/24/12671.html) ###

* Matthew Dillon has been committing lots of various SMP improvements
* Using dports builds on a 48-processor machine as a test
* The machine’s now building more than 1000 packages an hour
* Super technical details in the show notes, check 'em out \*\*\*

### [Getting to know portmgr](http://blogs.freebsdish.org/portmgr/2013/10/21/getting-to-know-your-portmgr-joe-marcus-clarke/) ###

* Start of an ongoing series profiling members of the FreeBSD Ports Management Team
* In the first interview, they talk to longest serving member of the team, Joe Marcus Clarke
* In the second, Bernhard Frölich (who's also the creator of redports.org)
* Future segments will include the other members
* Topics include their inspiration for using FreeBSD, first time using it, lots of other interesting stuff \*\*\*

### [BSD Now at the top of iTunes](http://i.imgur.com/lITf0xb.jpg) ###

* BSD Now is on the front-and-center page of iTunes' technology podcast section \*\*\*

Interview - Henning Brauer - [henning@openbsd.org](mailto:henning@openbsd.org) / [@henningbrauer](https://twitter.com/henningbrauer)
----------

OpenBSD's pf firewall, privilege separation, various topics

---

Tutorial
----------

### [Tracking -STABLE and -CURRENT](http://www.bsdnow.tv/tutorials/stable-current) ###

---

News Roundup
----------

### [OpenBSD gets XBox360 controller support](http://marc.info/?l=openbsd-cvs&m=138267062532046&w=2) ###

* Adds support for Microsoft XBox 360 controller as a uhid
* Will make things easier for emulators in OpenBSD
* Are there people who regularly play games on BSD? Email us, might do a segment on it \*\*\*

### [PCBSD 10-STABLE ISOs available](http://lists.pcbsd.org/pipermail/announce/2013-October/000056.html) ###

* Early cut of the new stable/10 branch, not recommended for everyone
* A pkgng repository is available, but is missing a number of packages
* AMD KMS, new text installer, UEFI loader support, much more \*\*\*

### [Switching from Linux to BSD](http://www.reddit.com/r/BSD/comments/1otg6n/switching_from_linux_over_to_bsd/) ###

* Yet another Linux user switching to BSD makes a thread about it
* Asks the community what some differences and advantages are
* Good response from the community, worth reading if you're a Linux guy \*\*\*

### [Unattended OpenBSD installations](http://freshbsd.org/commit/openbsd/cacacb528f0d47778aed7630d07988314f952264) ###

* Unattended installations possible using DHCP and a "response" file
* The system gets an IP via DHCP, then fetches a config file with key=value pairs
* Can do automatic network setup, SSH, passwords, etc
* Still a work in progress \*\*\*

Feedback/Questions
----------

* [Kjell-Aleksander writes in](http://slexy.org/view/s21hxDpzjO)
* [Alex writes in](http://slexy.org/view/s21ibNDb5y)
* [Chad writes in](http://slexy.org/view/s20D6K2NUe)
* [Joshua writes in](http://slexy.org/view/s20UZLFHAg)
* [Craig writes in](http://slexy.org/view/s20S15bbZ4)
* We want to especially thank Chris for his huge feedback emails with lots of show ideas. \*\*\*