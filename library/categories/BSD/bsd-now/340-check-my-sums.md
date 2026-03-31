+++
title = "340: Check My Sums"
description = "Why ZFS is doing filesystem checksumming right, better TMPFS throughput performance on DragonFlyBSD, reshaping pools with ZFS, PKGSRC on Manjaro aarch64 Pinebook-pro, central log host with syslog-ng on FreeBSD, and more.Headlines[Checksumming in filesystems, and why"
date = "2020-03-05T13:00:00Z"
url = "https://www.bsdnow.tv/340"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.558708468Z"
seen = true
+++

Why ZFS is doing filesystem checksumming right, better TMPFS throughput performance on DragonFlyBSD, reshaping pools with ZFS, PKGSRC on Manjaro aarch64 Pinebook-pro, central log host with syslog-ng on FreeBSD, and more.

Headlines
----------

### [Checksumming in filesystems, and why ZFS is doing it right](https://oshogbo.vexillium.org/blog/73/) ###

>
>
> One of the best aspects of ZFS is its reliability. This can be accomplished using a few features like copy-on-write approach and checksumming. Today we will look at how ZFS does checksumming and why it does it the proper way. Most of the file systems don’t provide any integrity checking and fail in several scenarios:
>
>

* Data bit flips - when the data that we wanted to store are bit flipped by the hard drives, or cables, and the wrong data is stored on the hard drive.
* Misdirected writes - when the CPU/cable/hard drive will bit flip a block to which the data should be written.
* Misdirected read - when we miss reading the block when a bit flip occurred.
* Phantom writes - when the write operation never made it to the disk. For example, a disk or kernel may have some bug that it will return success even if the hard drive never made the write. This problem can also occur when data is kept only in the hard drive cache.

>
>
> Checksumming may help us detect errors in a few of those situations.
>
>

---

### [DragonFlyBSD Improves Its TMPFS Implementation For Better Throughput Performance](https://www.phoronix.com/scan.php?page=news_item&px=DragonFlyBSD-TMPFS-Throughput) ###

>
>
> It's been a while since last having any new magical optimizations to talk about by DragonFlyBSD lead developer Matthew Dillon, but on Wednesday he landed some significant temporary file-system "TMPFS" optimizations for better throughput including with swap.
>
>
>
> Of several interesting commits merged tonight, the improved write clustering is a big one. In particular, "Reduces low-memory tmpfs paging I/O overheads by 4x and generally increases paging throughput to SSD-based swap by 2x-4x. Tmpfs is now able to issue a lot more 64KB I/Os when under memory pressure."
>
>

* [https://gitweb.dragonflybsd.org/dragonfly.git/commitdiff/4eb0bb82efc8ef32c4357cf812891c08d38d8860](https://gitweb.dragonflybsd.org/dragonfly.git/commitdiff/4eb0bb82efc8ef32c4357cf812891c08d38d8860)

>
>
> There's also a new tunable in the VM space as well as part of his commits on Wednesday night. This follows a lot of recent work on dsynth, improved page-out daemon pipelining, and other routine work.
>
>

* [https://gitweb.dragonflybsd.org/dragonfly.git/commit/bc47dbc18bf832e4badb41f2fd79159479a7d351](https://gitweb.dragonflybsd.org/dragonfly.git/commit/bc47dbc18bf832e4badb41f2fd79159479a7d351)

>
>
> This work is building up towards the eventual DragonFlyBSD 5.8 while those wanting to try the latest improvements right away can find their daily snapshots.
>
>

---

News Roundup
----------

### [Why ZFS is not good at growing and reshaping pools (or shrinking them)](https://utcc.utoronto.ca/~cks/space/blog/solaris/ZFSWhyNoRealReshaping) ###

>
>
> recently read Mark McBride's Five Years of Btrfs (via), which has a significant discussion of why McBride chose Btrfs over ZFS that boils down to ZFS not being very good at evolving your pool structure. You might doubt this judgment from a Btrfs user, so let me say as both a fan of ZFS and a long term user of it that this is unfortunately quite true; ZFS is not a good choice if you want to modify your pool disk layout significantly over time. ZFS works best if the only change in your pools that you do is replacing drives with bigger drives. In our ZFS environment we go to quite some lengths to be able to expand pools incrementally over time, and while this works it both leaves us with unbalanced pools and means that we're basically forced to use mirroring instead of RAIDZ.
>
>
>
> (An unbalanced pool is one where some vdevs and disks have much more data than others. This is less of an issue for us now that we're using SSDs instead of HDs.)
>
>

---

### [Using PKGSRC on Manjaro Linux aarch64 Pinebook-pro](https://astr0baby.wordpress.com/2020/02/09/using-pkgsrc-on-manjaro-linux-aarch64-pinebook-pro/) ###

>
>
> I wanted to see how pkgsrc works on aarch64 Linux Manjaro since it is a very mature framework that is very portable and supported by many architectures – pkgsrc (package source) is a package management system for Unix-like operating systems. It was forked from the FreeBSD ports collection in 1997 as the primary package management system for NetBSD.
>
>
>
> One might question why use pkgsrc on Arch based Manjaro, since the pacman package repository is very good on its own. I see alternative pkgsrc as a good automated build framework that offers a way to produce independent build environment /usr/pkg that does not interfere with the current Linux distribution in any way (all libraries are statically built)
>
>
>
> I have used the latest Manjaro for Pinebookpro and standard recommended tools as mentioned here [https://wiki.netbsd.org/pkgsrc/how\_to\_use\_pkgsrc\_on\_linux/](https://wiki.netbsd.org/pkgsrc/how_to_use_pkgsrc_on_linux/)
>
>

---

### A Central Log Host with syslog-ng on FreeBSD ###

* [Part 1](https://blog.socruel.nu/freebsd/a-central-log-host-with-syslog-ng-on-freebsd.html)

>
>
> syslog-ng is the Swiss army knife of log management. You can collect logs from any source, process them in real time and deliver them to wide range of destinations. It allows you to flexibly collect, parse, classify, rewrite and correlate logs from across your infrastructure. This is why syslog-ng is the perfect solution for the central log host of my (mainly) FreeBSD based infrastructure.
>
>

* [Part 2](https://blog.socruel.nu/freebsd/check-logs-of-syslog-ng-log-host-on-freebsd.html)

>
>
> This blog post continues where the blog post A central log host with syslog-ng on FreeBSD left off. Open source solutions to check syslog log messages exist, such as Logcheck or Logwatch. Although these are not too difficult to implement and maintain, I still found these to much. So I went for my own home grown solution to check the syslog messages of the SoCruel.NU central log host.
>
>

---

Beastie Bits
----------

* [FreeBSD at Linux Conf 2020 session videos now online](https://mirror.linux.org.au/pub/linux.conf.au/2020/room_9/Tuesday/)
* [Unlock your laptop with your phone](https://vermaden.wordpress.com/2020/01/09/freebsd-desktop-part-20-configuration-unlock-your-laptop-with-phone/)
* [Managing a database of vulnerabilities for a package system: the pkgsrc study](https://www.netbsd.org/gallery/presentations/leot/itasec20/pkgsrc-security.pdf)
* Hamilton BSD User group will meet again on March 10th]([http://studybsd.com/](http://studybsd.com/))
* [CharmBUG Meeting: March 24th 7pm in Severn, MD](https://www.meetup.com/en-AU/CharmBUG/events/268251508/) \*\*\*

Feedback/Questions
----------

* Andrew - [ZFS feature Flags](http://dpaste.com/2YM23C0#wrap)
* Sam - [TwinCat BSD](http://dpaste.com/0FCZV6R)
* Dacian - [Freebsd + amdgpu + Lenovo E595](http://dpaste.com/1R7F1JN#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.