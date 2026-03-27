+++
title = "356: Dig in Deeper"
description = "TrueNAS is Multi-OS, Encrypted ZFS on NetBSD, FreeBSD’s new Code of Conduct, Gaming on OpenBSD, dig a little deeper, Hammer2 and periodic snapshots, and more.NOTES   This episode of BSDNow is brought to you by TarsnapHeadlines[TrueN"
date = "2020-06-25T11:00:00Z"
url = "https://www.bsdnow.tv/356"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.531930268Z"
seen = false
+++

TrueNAS is Multi-OS, Encrypted ZFS on NetBSD, FreeBSD’s new Code of Conduct, Gaming on OpenBSD, dig a little deeper, Hammer2 and periodic snapshots, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/)

Headlines
----------

### [TrueNAS is Multi-OS](https://www.ixsystems.com/blog/truenas-multi-os/) ###

>
>
> There was a time in history where all that mattered was an Operating System (OS) and the hardware it ran on — the “pre-software era”, if you will. Your hardware dictated the OS you used.  
>  Once software applications became prominent, your hardware’s OS determined the applications you could run. Application vendors were forced to juggle the burden of “portability” between OS platforms, choosing carefully the operating systems they’d develop their software to. Then, there were the great OS Wars of the 1990s, replete with the rampant competition, licensing battles, and nasty lawsuits, which more or less gave birth to the “open source OS” era.  
>  The advent of the hypervisor simultaneously gave way to the “virtual era” which set us on a path of agnosticism toward the OS. Instead of choosing from the applications available for your chosen OS, you could simply install another OS on the same hardware for your chosen application. The OS became nothing but a necessary cog in the stack.  
>  TrueNAS open storage enables this “post-OS era” with support for storage clients of all UNIX flavors, Linux, FreeBSD, Windows, MacOS, VMware, Citrix, and many others. Containerization has carried that mentality even further. An operating system, like the hardware that runs it, is now just thought of as part of the “infrastructure”.
>
>
> ---
>
>
> ### [Encrypted ZFS on NetBSD 9.0, for a FreeBSD guy](https://rubenerd.com/encrypted-zfs-on-netbsd-9-for-a-freebsd-guy/) ###
>
>
>
> I had one of my other HP Microservers brought back from the office last week to help with this working-from-home world we’re in right now. I was going to wipe an old version of Debian Wheezy/Xen and install FreeBSD to mirror my other machines before thinking: why not NetBSD?
>
>
> ---
>

News Roundup
----------

### [FreeBSD's New Code of Conduct](https://www.freebsd.org/internal/code-of-conduct.html) ###

* [FreeBSD Announcement Email](https://raw.githubusercontent.com/BSDNow/bsdnow.tv/master/episodes/356/FBSD-CoC-Email)

---

### [Gaming on OpenBSD](https://dataswamp.org/~solene/2020-06-05-openbsd-gaming.html) ###

>
>
> While no one would expect this, there are huge efforts from a small team to bring more games into OpenBSD. In fact, now some commercial games works natively now, thanks to Mono or Java. There are no wine or linux emulation layer in OpenBSD.  
>  Here is a small list of most well known games that run on OpenBSD:
>
>
> ---
>
>
> ### ['dig' a little deeper](https://vishaltelangre.com/dig-a-little-deeper/) ###
>
>
>
> I knew the existence of the dig command but didn't exactly know when and how to use it. Then, just recently I encountered an issue that allowed me to learn and make use of it.
>
>
> ---
>
>
> ### [HAMMER2 and periodic snapshots](https://www.dragonflydigest.com/2020/06/15/24635.html) ###
>
>
>
> The first version of HAMMER took automatic snapshots, set within the config for each filesystem. HAMMER2 now also takes automatic snapshots, via periodic(8) like most every repeating task on your DragonFly system.
>
>
>
> * [git: Implement periodic hammer2 snapshots](http://lists.dragonflybsd.org/pipermail/commits/2020-June/769247.html) \*\*\*
>
>

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Cy - OpenSSL relicensing](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/356/feedback/Cy - OPenSSL relicensing.md>)
* [Christian - lagg vlans and iocage](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/356/feedback/Christian - lagg vlans and iocage>)
* [Brad - SMR](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/356/feedback/Brad - SMR>) \*\*\*
* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*