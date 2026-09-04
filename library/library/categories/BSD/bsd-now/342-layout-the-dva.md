+++
title = "342: Layout the DVA"
description = "OpenBSD Full disk encryption with coreboot and tianocore, FreeBSD 12.0 EOL, ZFS DVA layout, OpenBSD’s Go situation, AD updates requires changes in TrueNAS and FreeNAS, full name of FreeBSD’s root account, and more.Headlines[OpenBSD Full Disk Encryption with CoreBoot"
date = "2020-03-19T12:00:00Z"
url = "https://www.bsdnow.tv/342"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.555159060Z"
seen = true
+++

OpenBSD Full disk encryption with coreboot and tianocore, FreeBSD 12.0 EOL, ZFS DVA layout, OpenBSD’s Go situation, AD updates requires changes in TrueNAS and FreeNAS, full name of FreeBSD’s root account, and more.

Headlines
----------

### [OpenBSD Full Disk Encryption with CoreBoot and Tianocore Payload](https://functionallyparanoid.com/2020/03/07/openbsd-full-disk-encryption-with-coreboot-and-tianocore-payload/) ###

>
>
> It has been a while since I have posted here so I wanted to share something that was surprisingly difficult for me to figure out. I have a Thinkpad T440p that I have flashed with Coreboot 4.11 with some special patches that allow the newer machine to work. When I got the laptop, the default BIOS was UEFI and I installed two operating systems.
>
>
>
> Windows 10 with bitlocker full disk encryption on the “normal” drive (I replaced the spinning 2.5″ disk with an SSD)
>
>
>
> Ubuntu 19.10 on the m.2 SATA drive that I installed using LUKS full disk encryption
>
>
>
> I purchased one of those carriers for the optical bay that allows you to install a third SSD and so I did that with the intent of putting OpenBSD on it. Since my other two operating systems were running full disk encryption, I wanted to do the same on OpenBSD.
>
>

* See article for rest of story

---

### [FreeBSD 12.0 EOL](https://lists.freebsd.org/pipermail/freebsd-announce/2020-February/001930.html) ###

>
>
> Dear FreeBSD community,
>
>
>
> As of February 29, 2020, FreeBSD 12.0 will reach end-of-life and will no longer be supported by the FreeBSD Security Team. Users of FreeBSD 12.0 are strongly encouraged to upgrade to a newer release as soon as possible.
>
>

* [12.1 Active release](https://www.freebsd.org/releases/12.1R/announce.html)
* [12.2 Release Schedule](https://www.freebsd.org/releases/12.2R/schedule.html)

---

News Roundup
----------

### [Some effects of the ZFS DVA format on data layout and growing ZFS pools](https://utcc.utoronto.ca/~cks/space/blog/solaris/ZFSDVAFormatAndGrowth) ###

>
>
> One piece of ZFS terminology is DVA and DVAs, which is short for Data Virtual Address. For ZFS, a DVA is the equivalent of a block number in other filesystems; it tells ZFS where to find whatever data we're talking about. The short summary of what fields DVAs have and what they mean is that DVAs tell us how to find blocks by giving us their vdev (by number) and their byte offset into that particular vdev (and then their size). A typical DVA might say that you find what it's talking about on vdev 0 at byte offset 0x53a40ed000. There are some consequences of this that I hadn't really thought about until the other day.
>
>
>
> Right away we can see why ZFS has a problem removing a vdev; the vdev's number is burned into every DVA that refers to data on it. If there's no vdev 0 in the pool, ZFS has no idea where to even start looking for data because all addressing is relative to the vdev. ZFS pool shrinking gets around this by adding a translation layer that says where to find the portions of vdev 0 that you care about after it's been removed.
>
>

---

### [Warning! Active Directory Security Changes Require TrueNAS and FreeNAS Updates.](https://www.ixsystems.com/blog/active-directory-truenas-and-freenas/) ###

* Critical Information for Current FreeNAS and TrueNAS Users

>
>
> Microsoft is changing the security defaults for Active Directory to eliminate some security vulnerabilities in its protocols. Unfortunately, these new security defaults may disrupt existing FreeNAS/TrueNAS deployments once Windows systems are updated. The Windows updates may appear sometime in March 2020; no official date has been announced as of yet.
>
>
>
> FreeNAS and TrueNAS users that utilize Active Directory should update to version 11.3 (or 11.2-U8) to avoid potential disruption of their networks when updating to the latest versions of Windows software after March 1, 2020. Version 11.3 has been released and version 11.2-U8 will be available in early March.
>
>

---

### [Full name of the FreeBSD Root Account](https://www.geeklan.co.uk/?p=2457) ###

>
>
> NetBSD now has a users(7) and groups(7) manual. Looking into what entries existed in the passwd and group files I wondered about root’s full name who we now know as Charlie Root in the BSDs....
>
>

---

### [OpenBSD Go Situation](https://utcc.utoronto.ca/~cks/space/blog/programming/GoOpenBSDSituation) ###

>
>
> Over in the fediverse, Pete Zaitcev had a reaction to my entry on OpenBSD versus Prometheus for us:
>
>
>
> I don't think the situation is usually that bad. Our situation with Prometheus is basically a worst case scenario for Go on OpenBSD, and most people will have much better results, especially if you stick to supported OpenBSD versions.
>
>
>
> If you stick to supported OpenBSD versions, upgrading your machines as older OpenBSD releases fall out of support (as the OpenBSD people want you to do), you should not have any problems with your own Go programs. The latest Go release will support the currently supported OpenBSD versions (as long as OpenBSD remains a supported platform for Go), and the Go 1.0 compatibility guarantee means that you can always rebuild your current Go programs with newer versions of Go. You might have problems with compiled binaries that you don't want to rebuild, but my understanding is that this is the case for OpenBSD in general; it doesn't guarantee a stable ABI even for C programs (cf). If you use OpenBSD, you have to be prepared to rebuild your code after OpenBSD upgrades regardless of what language it's written in.
>
>

---

Beastie Bits
----------

* [Test your TOR](http://lists.nycbug.org/pipermail/talk/2020-February/018174.html)
* [OPNsense 20.1.1 released](https://opnsense.org/opnsense-20-1-1-released/)
* [pkg for FreeBSD 1.13](https://svnweb.freebsd.org/ports?view=revision&revision=525794)

---

Feedback/Questions
----------

* [Bostjan writes in about Wireguard](http://dpaste.com/3WKG09D#wrap)
* [Charlie has a followup to wpa\_supplicant as lower class citizen](http://dpaste.com/0DDN99Q#wrap)
* [Lars writes about LibreSSL as a positive example](http://dpaste.com/1N12HFB#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.