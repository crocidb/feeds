+++
title = "327: ZFS Rename Repo"
description = "We read FreeBSD’s third quarterly status report, OpenBSD on Sparc64, ZoL repo move to OpenZFS, GEOM NOP, keeping NetBSD up-to-date, and more.HeadlinesFreeBSD third quarterly status report for 2019 "
date = "2019-12-05T12:00:00Z"
url = "https://www.bsdnow.tv/327"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.582466360Z"
seen = true
+++

We read FreeBSD’s third quarterly status report, OpenBSD on Sparc64, ZoL repo move to OpenZFS, GEOM NOP, keeping NetBSD up-to-date, and more.

Headlines
----------

### [FreeBSD third quarterly status report for 2019](https://www.freebsd.org/news/status/report-2019-07-2019-09.html) ###

>
>
> This quarter the reports team has been more active than usual thanks to a better organization: calls for reports and reminders have been sent regularly, reports have been reviewed and merged quickly (I would like to thank debdrup@ in particular for his reviewing work).
>
>
>
> Efficiency could still be improved with the help of our community. In particular, the quarterly team has found that many reports have arrived in the last days before the deadline or even after. I would like to invite the community to follow the guidelines below that can help us sending out the reports sooner.
>
>
>
> Starting from next quarter, all quarterly status reports will be prepared the last month of the quarter itself, instead of the first month after the quarter's end. This means that deadlines for submitting reports will be the 1st of January, April, July and October.
>
>
>
> Next quarter will then be a short one, covering the months of November and December only and the report will probably be out in mid January.
>
>

---

### [OpenBSD on Sparc64](https://eerielinux.wordpress.com/2019/10/10/openbsd-on-sparc64-6-0-to-6-5/) ###

>
>
> OpenBSD, huh? Yes, I usually write about FreeBSD and that’s in fact what I tried installing on the machine first. But I ran into problems with it very early on (never even reached single user mode) and put it aside for later. Since I powered up the SunFire again last month, I needed an OS now and chose OpenBSD for the simple reason that I have it available.
>
>
>
> First I wanted to call this article simply “OpenBSD on SPARC” – but that would have been misleading since OpenBSD used to support 32-bit SPARC processors, too. The platform was just put to rest after the 5.9 release.
>
>
>
> Version 6.0 was the last release of OpenBSD that came on CD-ROM. When I bought it, I thought that I’d never use the SPARC CD. But here was the chance! While it is an obsolete release, it comes with the cryptographic signatures to verify the next release. So the plan is to start at 6.0 as I can trust the original CDs and then update to the latest release. This will also be an opportunity to recap on some of the things that changed over the various versions.
>
>

---

News Roundup
----------

### [ZoL repo move to OpenZFS](https://zfsonlinux.topicbox.com/groups/zfs-discuss/T13eedc32607dab41/zol-repo-move-to-openzfs) ###

>
>
> Because it will contain the ZFS source code for both Linux and FreeBSD, we will rename the "ZFSonLinux" code repository to "OpenZFS". Specifically, the repo at [http://github.com/ZFSonLinux/zfs](http://github.com/ZFSonLinux/zfs) will be moved to the OpenZFS organization, at [http://github.com/OpenZFS/zfs](http://github.com/OpenZFS/zfs).
>
>
>
> The next major release of ZFS for Linux and FreeBSD will be "OpenZFS 2.0", and is expected to ship in 2020.
>
>

---

### [Mcclure111 Sun Thread](https://twitter.com/mcclure111/status/1196557401710837762) ###

>
>
> A long time ago— like 15 years ago— I worked at Sun Microsystems. The company was nearly dead at the time (it died a couple years later) because they didn't make anything that anyone wanted to buy anymore. So they had a lot of strange ideas about how they'd make their comeback.
>
>

---

### [GEOM NOP](https://oshogbo.vexillium.org/blog/71/) ###

>
>
> Sometimes while testing file systems or applications you want to simulate some errors on the disk level. The first time I heard about this need was from Baptiste Daroussin during his presentation at AsiaBSDCon 2016. He mentioned how they had built a test lab with it. The same need was recently discussed during the PGCon 2019, to test a PostgreSQL instance. If you are FreeBSD user, I have great news for you: there is a GEOM provider which allows you to simulate a failing device.
>
>
>
> GNOP allows us to configure transparent providers from existing ones. The first interesting option of it is that we can slice the device into smaller pieces, thanks to the ‘offset option’ and ‘stripsesize’. This allows us to observe how the data on the disk is changing. Let’s assume that we want to observe the changes in the GPT table when the GPT flags are added or removed (for example the bootme flags which are described here). We can use dd every time and analyze it using absolute values from the disks.
>
>

---

### [Keeping NetBSD up-to-date with pkg\_comp 2.0](https://jmmv.dev/2017/02/pkg_comp-2.0-tutorial-netbsd.html) ###

>
>
> This is a tutorial to guide you through the shiny new pkg\_comp 2.0 on NetBSD.
>
>
>
> Goals: to use pkg\_comp 2.0 to build a binary repository of all the packages you are interested in; to keep the repository fresh on a daily basis; and to use that repository with pkgin to maintain your NetBSD system up-to-date and secure.
>
>
>
> This tutorial is specifically targeted at NetBSD but should work on other platforms with some small changes. Expect, at the very least, a macOS-specific tutorial as soon as I create a pkg\_comp standalone installer for that platform.
>
>

---

Beastie Bits
----------

* [DragonFly - Radeon Improvements](http://lists.dragonflybsd.org/pipermail/commits/2019-November/720070.html)
* [NomadBSD review](https://www.youtube.com/watch?v=7DglP7SbnlA&feature=share)
* [Spongebob OpenBSD Security Comic](https://files.yukiisbo.red/openbsd_claim.png)
* [Forth : The Early Years](https://colorforth.github.io/HOPL.html)
* [LCM+L PDP-7 booting and running UNIX Version 0](https://www.youtube.com/watch?v=pvaPaWyiuLA)

---

Feedback/Questions
----------

* Chris - [Ctrl-T](http://dpaste.com/284E5BV)
  * [Improved Ctrl+t that shows kernel backtrace](https://asciinema.org/a/xfSpvPT61Cnd9iRgbfIjT6kYj)

* Brian - [Migrating NexentaStore to FreeBSD/FreeNAS](http://dpaste.com/05GDK8H#wrap)
* Avery - [How to get involved](http://dpaste.com/26KW801#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.