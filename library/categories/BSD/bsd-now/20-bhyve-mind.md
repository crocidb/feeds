+++
title = "20: Bhyve Mind"
description = "It's our big 20th episode! We're going to sit down for a chat with Neel Natu and Peter Grehan, the developers of bhyve. Not familiar with bhyve? Our tutorial will show you all you need to know about this awesome new virtualization technology. Answers to your questions and all the"
date = "2014-01-15T13:00:00Z"
url = "https://www.bsdnow.tv/20"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.275686588Z"
seen = true
+++

It's our big 20th episode! We're going to sit down for a chat with Neel Natu and Peter Grehan, the developers of bhyve. Not familiar with bhyve? Our tutorial will show you all you need to know about this awesome new virtualization technology. Answers to your questions and all the latest news, here on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage For Open Source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)

---

Headlines
----------

### [OpenBSD automatic installation](http://undeadly.org/cgi?action=article&sid=20140106055302) ###

* A CFT (call for testing) was posted for OpenBSD's new automatic installer process
* Using this new system, you can spin up fully-configured OpenBSD installs very quickly
* It will answer all the questions for you and can put files into place and start services
* Great for large deployments, help test it and report your findings \*\*\*

### [FreeNAS install guide and blog posts](https://www.youtube.com/channel/UCL09rVicvyZrqe-I2LP5Vyg/videos) ###

* A multipart series on YouTube about installing FreeNAS
* In part 1, the guy (who is possibly Dracula, with his very Transylvanian accent..) builds his new file server and shows off the hardware
* In part 2, he shows how to install and configure FreeNAS, uses IPMI, sets up his pools
* He pronounces gigabytes as jiggabytes and it's hilarious
* We've also got an [unrelated blog post](http://enoriver.net/index.php/2014/01/11/freenas-works-as-advertised/) about a very satisfied FreeNAS user who details his setup
* As well as [another blog post](http://devinteske.com/freenas-development/) from our old pal [Devin Teske](http://www.bsdnow.tv/episodes/2013-09-25_teskeing_the_possibilities) about his recent foray into the FreeNAS development world \*\*\*

### [FreeBSD 10.0-RC5 is out](https://lists.freebsd.org/pipermail/freebsd-stable/2014-January/076800.html) ###

* Another, unexpected RC is out for 10.0
* Minor fixes included, please help test and report any bugs
* You can update via freebsd-update or from source
* Hopefully this will be the last one before 10.0-RELEASE, which has tons of new features we'll talk about
* It's been [tagged -RELEASE](https://svnweb.freebsd.org/base?view=revision&revision=260664) in SVN already too! \*\*\*

### [OpenBSD 5.5-beta is out](http://marc.info/?l=openbsd-cvs&m=138952598914052&w=2) ###

* Theo updated the branch status to 5.5-beta
* A [list of changes](http://www.openbsd.org/plus.html)
* [Help test](http://ftp.openbsd.org/pub/OpenBSD/snapshots/) and report any bugs you find
* Lots of rapid development with signify (which we mentioned last week), the beta includes some "test keys"
* Does that mean it'll be part of the final release? We'll find out in May.. or when we interview Ted (soon) \*\*\*

Interview - Neel Natu & Peter Grehan - [neel@freebsd.org](mailto:neel@freebsd.org) & [grehan@freebsd.org](mailto:grehan@freebsd.org)
----------

BHyVe - the BSD hypervisor

---

Tutorial
----------

### [Virtualization with bhyve](http://www.bsdnow.tv/tutorials/bhyve) ###

---

News Roundup
----------

### [Hostname canonicalisation in OpenSSH](http://blog.djm.net.au/2014/01/hostname-canonicalisation-in-openssh.html) ###

* Blog post from our friend [Damien Miller](http://www.bsdnow.tv/episodes/2013_12_18-cryptocrystalline)
* This new feature allows clients to canonicalize unqualified domain names
* SSH will know if you typed "ssh bsdnow" you meant "ssh bsdnow.tv" with new config options
* This will help clean up some ssh configs, especially if you have many hosts
* Should make it into OpenSSH 6.5, which is "due really soon" \*\*\*

### [Dragonfly on a Chromebook](http://www.shiningsilence.com/dbsdlog/2014/01/07/13078.html) ###

* Some work has been done by Matthew Dillon to get DragonflyBSD working on a Google Chromebook
* These [couple of posts](http://www.shiningsilence.com/dbsdlog/2014/01/10/13132.html) detail some of the things he's got working so far
* Changes were needed to the boot process, trackpad and wifi drivers needed updating...
* Also includes a guide written by Dillon on how to get yours working \*\*\*

### [Spider in a box](http://kazarka.com/index.php?section=spiderinabox) ###

* "Spiderinabox" is a new OpenBSD-based project
* Using a combination of OpenBSD, Firefox, XQuartz and VirtualBox, it creates a secure browsing experience for OS X
* Firefox runs encapsulated in OpenBSD and doesn't have access to OS X in any way
* The developer is looking for testers on other operating systems! \*\*\*

### [PCBSD weekly digest](http://blog.pcbsd.org/2014/01/pc-bsd-weekly-feature-digest-3/) ###

* PCBSD 10 has entered into the code freeze phase
* They're focusing on fixing bugs now, rather than adding new features
* The update system got a lot of improvements
* PBI load times reduced by up to 40%! what!!! \*\*\*

Feedback/Questions
----------

* [Scott writes in](http://slexy.org/view/s25zbSPtcm)
* [Chris writes in](http://slexy.org/view/s2EarxbZz1)
* [SW writes in](http://slexy.org/view/s2MWKxtWxF)
* [Ole writes in](http://slexy.org/view/s20kzex2qm)
* [Gertjan writes in](http://slexy.org/view/s2858Ph4o0) \*\*\*