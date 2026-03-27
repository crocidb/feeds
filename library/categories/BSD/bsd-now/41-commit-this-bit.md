+++
title = "41: Commit This Bit"
description = "This week in the big show, we'll be interviewing Benedict Reuschling of the FreeBSD documentation team, and he has a special surprise in store for Allan. As always, answers to your questions and all the latest news, on BSD Now - the place to B.. SD.This episode was brought to you"
date = "2014-06-11T12:00:00Z"
url = "https://www.bsdnow.tv/41"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.238117287Z"
seen = false
+++

This week in the big show, we'll be interviewing Benedict Reuschling of the FreeBSD documentation team, and he has a special surprise in store for Allan. As always, answers to your questions and all the latest news, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeBSD moves to Bugzilla](https://lists.freebsd.org/pipermail/freebsd-announce/2014-June/001559.html) ###

* Historically, FreeBSD has used the old GNATS system for keeping track of bug reports
* After years and years of wanting to switch, they've finally moved away from GNATS to Bugzilla
* It offers a lot of advantages, is much more modern and actively maintained and
* There's a new [workflow chart](http://people.freebsd.org/~eadler/bugrelocation/workflow.html) for developers to illustrate the new way of doing things
* The old "send-pr" command will still work for the time being, but will eventually be phased out in favor of native Bugzilla reporting tools (of which there are multiple in ports)
* This will hopefully make reporting bugs a lot less painful \*\*\*

### [DIY NAS: EconoNAS 2014](http://blog.brianmoses.net/2014/06/diy-nas-econonas-2014.html) ###

* We previously covered this blog last year, but the 2014 edition is up
* More of a hardware-focused article, the author details the parts he's using for a **budget** NAS
* Details the motherboard, RAM, CPU, hard drives, case, etc
* With a set goal of $500 max, he goes just over it - $550 for all the parts
* Lots of nice pictures of the hardware and step by step instructions for assembly, as well as software configuration instructions \*\*\*

### [DragonflyBSD 3.8 released](http://www.shiningsilence.com/dbsdlog/2014/06/04/14122.html) ###

* [Justin](http://www.bsdnow.tv/episodes/2013_11_13-the_gateway_drug) announced the availability of DragonflyBSD 3.8.0
* Binaries in /bin and /sbin are dynamic now, enabling the use of PAM and NSS to manage user accounts
* It includes a new HAMMER FS backup script and lots of FreeBSD tools have been synced with their latest versions
* Work continues on for the Intel graphics drivers, but it's currently limited to the HD4000 and Ivy Bridge series
* See [the release page](http://www.dragonflybsd.org/release38/) for more info and check the link for source-based upgrade instructions \*\*\*

### [OpenZFS European conference 2014](http://www.open-zfs.org/wiki/Publications#2014_OpenZFS_European_Conference) ###

* There was an OpenZFS conference held in Europe recently, and now the videos are online for your viewing pleasure
* Matt Ahrens, [Introduction](http://www.youtube.com/watch?v=Mk1czZs6vkQ)
* Michael Alexander, [FhGFS performance on ZFS](http://www.youtube.com/watch?v=Ak1HB507-xY)
* Andriy Gapon, [Testing ZFS on FreeBSD](http://www.youtube.com/watch?v=oB-QDwVuBH4)
* Luke Marsden, [HybridCluster: ZFS in the cloud](http://www.youtube.com/watch?v=ISI9Ppj3kTo)
* Vadim Comănescu, [Syneto: continuously delivering a ZFS-based OS](http://www.youtube.com/watch?v=1xK94v0BedE)
* Chris George, [DDRdrive ZIL accelerator: random write revelation](http://www.youtube.com/watch?v=ScNHjWBQYQ8)
* Grenville Whelan, [High-Availability](http://www.youtube.com/watch?v=tiTYZykCeDo)
* Phil Harman, [Harman Holistic](https://www.youtube.com/watch?v=ApjkrBVlPXk)
* Mark Rees, [Storiant and OpenZFS](http://www.youtube.com/watch?v=41yl23EACns)
* Andrew Holway, [EraStor ZFS appliances](http://www.youtube.com/watch?v=b4L0DRvKJxo)
* Dan Vâtca, [Syneto and OpenZFS](http://www.youtube.com/watch?v=pPOW8bwUXxo)
* Luke Marsden, [HybridCluster and OpenZFS](http://www.youtube.com/watch?v=uSM1s1aWlZE)
* Matt Ahrens, [Delphix and OpenZFS](http://www.youtube.com/watch?v=UaRdzUOsieA)
* Check the link for slides and other goodies \*\*\*

Interview - Benedict Reuschling - [bcr@freebsd.org](mailto:bcr@freebsd.org)
----------

BSD documentation, getting commit access, unix education, various topics

---

News Roundup
----------

### [Getting to know your portmgr, Steve Wills](http://blogs.freebsdish.org/portmgr/2014/06/04/getting-to-know-your-portmgr-steve-wills/) ###

* "It is my pleasure to introduce Steve Wills, the newest member of the portmgr team"
* swills is an all-round good guy, does a lot for ports (especially the ruby ports)
* In this interview, we learn why he uses FreeBSD, the most embarrassing moment in his FreeBSD career and much more
* He used to work for Red Hat, woah \*\*\*

### [BSDTalk episode 242](http://bsdtalk.blogspot.com/2014/06/bsdtalk242-pfsense-with-chris-buechler.html) ###

* This time on BSDTalk, Will interviews [Chris Buechler](http://www.bsdnow.tv/episodes/2014_02_19-a_sixth_pfsense) from pfSense
* Topics include: the heartbleed vulnerability and how it affected pfSense, how people usually leave their firewalls unpatched for a long time (or even forget about them!), changes between major versions, the upgrade process, upcoming features in their 10-based version, backporting drivers and security fixes
* They also touch on recent concerns in the pfSense community about their license change, that they may be "going commercial" and closing the source - so tune in to find out what their future plans are for all of that \*\*\*

### [Turn old PC hardware into a killer home server](http://www.pcworld.com/article/2243748/turn-old-pc-hardware-into-a-killer-home-server-with-freenas.html) ###

* Lots of us have old hardware lying around doing nothing but collecting dust
* Why not turn that old box into a modern file server with FreeNAS and ZFS?
* This article goes through the process of setting up a NAS, gives a little history behind the project and highlights some of the different protocols FreeNAS can use (NFS, SMB, AFS, etc)
* Most of our users are already familiar with all of this stuff, nothing too advanced
* Good to see BSD getting some well-deserved attention on a big mainstream site \*\*\*

### [Unbloating the VAX install CD](https://blog.netbsd.org/tnf/entry/unbloating_the_vax_install_cd) ###

* After a discussion on the VAX mailing list, something very important came to the attention of the developers...
* You can't boot NetBSD on a VAX box with 16MB of RAM from the CD image
* This blog post goes through the developer's adventure in trying to fix that through emulation and stripping various things out of the kernel to make it smaller
* In the end, he got it booting - and now all three VAX users who want to run NetBSD can do so on their systems with 16MB of RAM... \*\*\*

Feedback/Questions
----------

* [Thomas writes in](http://slexy.org/view/s211mNScBr)
* [Reynold writes in](http://slexy.org/view/s21JA8BVmZ)
* [Bostjan writes in](http://slexy.org/view/s2kwS3ncTY)
* [Paul writes in](http://slexy.org/view/s2VgjXUfW9)
* [John writes in](http://slexy.org/view/s202AAQUXt) \*\*\*