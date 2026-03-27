+++
title = "24: The Cluster & The Cloud"
description = "This week on BSD Now... a wrap-up from NYCBSDCon! We'll also be talking to Luke Marsden, CEO of HybridCluster, about how they use BSD at large. Following that, our tutorial will show you how to securely share files with SFTP in a chroot. The latest news and answers to your questi"
date = "2014-02-12T13:00:00Z"
url = "https://www.bsdnow.tv/24"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.267734704Z"
seen = false
+++

This week on BSD Now... a wrap-up from NYCBSDCon! We'll also be talking to Luke Marsden, CEO of HybridCluster, about how they use BSD at large. Following that, our tutorial will show you how to securely share files with SFTP in a chroot. The latest news and answers to your questions, of course it's BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage For Open Source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)

---

Headlines
----------

### [FreeBSD 10 as a firewall](http://www.pantz.org/software/pf/use_freebsd_10_as_a_pf_firewall.html) ###

* Back in 2012, the author of this site wrote an article stating you should avoid FreeBSD 9 for a firewall and use OpenBSD instead
* Now, with the release of 10.0, he's apparently changed his mind and switched back over
* It mentions the SMP version of pf, general performance advantages and more modern features
* The author is a regular listener of BSD Now, hi Joe! \*\*\*

### [Network Noise Reduction Using Free Tools](http://bsdly.blogspot.com/2014/02/effective-spam-and-malware.html) ###

* Really long blog post, based on a BSDCan presentation, about fighting spam with OpenBSD
* Peter Hansteen, author of the book of PF, goes through how he uses OpenBSD's spamd and other security features to combat spam and malware
* He goes through his experiences with content filtering and disappointment with a certain proprietary vendor
* Not totally BSD-specific, lots of people can enjoy the article - lots of virus history as well \*\*\*

### [FreeBSD ASLR patches submitted](http://0xfeedface.org/blog/lattera/2014-02-02/freebsd-aslr-patch-submitted-upstream) ###

* So far, FreeBSD hasn't had Address Space Layout Randomization
* ASLR is a nice security feature, [see wikipedia](https://en.wikipedia.org/wiki/Address_space_layout_randomization) for more information
* With a giant patch from Shawn Webb, it might be integrated into a future version (after a vicious review from the security team of course)
* We might have Shawn on the show to talk about it, but he's also giving a presentation at BSDCan about his work with ASLR \*\*\*

### [Old-style pkg\_ tools retired](http://blogs.freebsdish.org/portmgr/2014/02/03/time-to-bid-farewell-to-the-old-pkg_-tools/) ###

* At last the old pkg\_add tools are being retired in FreeBSD
* [pkgng](http://www.bsdnow.tv/tutorials/pkgng) is a huge improvement, and now portmgr@ thinks it's time to cut the cord on the legacy toolset
* Ports aren't going away, and probably never will, but for binary package fans and new users that are used to things like apt, pkgng is the way to go
* All pkg\_ tools will be considered unsupported on September 1, 2014 - even on older branches \*\*\*

Interview - Luke Marsden - [luke@hybridcluster.com](mailto:luke@hybridcluster.com) / [@lmarsden](https://twitter.com/lmarsden)
----------

BSD at HybridCluster

---

Tutorial
----------

### [Filesharing with chrooted SFTP](http://www.bsdnow.tv/tutorials/chroot-sftp) ###

---

News Roundup
----------

### [FreeBSD on OpenStack](http://pellaeon.github.io/bsd-cloudinit/) ###

* [OpenStack](https://en.wikipedia.org/wiki/OpenStack) is a cloud computing project
* It consists of "a series of interrelated projects that control pools of processing, storage, and networking resources throughout a datacenter, able to be managed or provisioned through a web-based dashboard, command-line tools, or a RESTful API."
* Until now, there wasn't a good way to run a full BSD instance on OpenStack
* With a project in the vein of [Colin Percival](http://www.bsdnow.tv/episodes/2014_01_22-tendresse_for_ten)'s AWS startup scripts, now that's no longer the case! \*\*\*

### [FOSDEM BSD videos](https://fosdem.org/2014/schedule/track/bsd/) ###

* This year's FOSDEM had seven BSD presentations
* The videos are [slowly being uploaded](https://video.fosdem.org/2014/) for your viewing pleasure
* Not all of the BSD ones are up yet, but by the time you're watching this they might be!
* Check [this directory](https://video.fosdem.org/2014/AW1121/Saturday/) for most of 'em
* The BSD dev room was full, lots of interest in what's going on from the other communities \*\*\*

### [The FreeBSD challenge finally returns!](http://www.thelinuxcauldron.com/2014/02/05/freebsd-challenge-returns-day-11-30/) ###

* Due to prodding from a certain guy of a certain podcast, the "FreeBSD Challenge" series has finally resumed
* Our friend from the Linux foundation picks up with [day 11](http://www.thelinuxcauldron.com/2014/02/05/freebsd-challenge-day-11-30/) and [day 12](http://www.thelinuxcauldron.com/2014/02/09/freebsd-challenge-day-12-30/) on his switching from Linux journey
* This time he outlines the upgrade process of going from 9 to 10, using freebsd-update
* There's also some notes about different options for upgrading ports and some extra tips \*\*\*

### [PCBSD weekly digest](http://blog.pcbsd.org/2014/02/pc-bsd-weekly-feature-digest-16/) ###

* After the big 10.0 release, the PCBSD crew is focusing on bug fixes for a while
* During their "fine tuning phase" users are encouraged to submit any and all bugs via the trac system
* Warden got some fixes and the package manager got some updates as well
* Huge size reduction in PBI format \*\*\*

Feedback/Questions
----------

* [Derrick writes in](http://slexy.org/view/s21nbJKYmb)
* [Sean writes in](http://slexy.org/view/s2yhziVsBP)
* [Patrick writes in](http://slexy.org/view/s20PuccWbo)
* [Peter writes in](http://slexy.org/view/s22PL0SbUO)
* [Sean writes in](http://slexy.org/view/s20dkbjuOK) \*\*\*