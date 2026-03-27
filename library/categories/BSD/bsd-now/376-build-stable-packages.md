+++
title = "376: Build stable packages"
description = "FreeBSD 12.2 is available, ZFS Webinar, Enhancing Syzkaller support for NetBSD, how the OpenBSD -stable packages are built, OPNsense 20.7.4 released, and moreNOTES   This episode of BSDNow is brought to you by TarsnapHeadlines"
date = "2020-11-12T11:00:00Z"
url = "https://www.bsdnow.tv/376"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.500065702Z"
seen = false
+++

FreeBSD 12.2 is available, ZFS Webinar, Enhancing Syzkaller support for NetBSD, how the OpenBSD -stable packages are built, OPNsense 20.7.4 released, and more

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [FreeBSD 12.2 Release](https://www.freebsd.org/releases/12.2R/relnotes.html) ###

>
>
> The release notes for FreeBSD 12.2-RELEASE contain a summary of the changes made to the FreeBSD base system on the 12-STABLE development line. This document lists applicable security advisories that were issued since the last release, as well as significant changes to the FreeBSD kernel and userland. Some brief remarks on upgrading are also presented.
>
>
> ---
>
>
> ### [ZFS Webinar: November 18th](https://klarasystems.com/learning/best-practices-for-optimizing-zfs1/) ###
>
>
>
> Join us on November 18th for a live discussion with Allan Jude (VP of Engineering at Klara Inc) in this webinar centred on “best practices of ZFS”  
>  Building Your Storage Array – Everything from picking the best hardware to RAID-Z and using mirrors.  
>  Keeping up with Data Growth – Expanding and growing your pool, and of course, shrinking with device evacuation.  
>  Datasets and Properties – Controlling settings with properties and many other tricks!
>
>
> ---
>

News Roundup
----------

### [Google Summer of Code 2020: [Final Report] Enhancing Syzkaller support for NetBSD](https://blog.netbsd.org/tnf/entry/google_summer_of_code_20202) ###

>
>
> Sys2syz would give an extra edge to Syzkaller for NetBSD. It has a potential of efficiently automating the conversion of syscall definitions to syzkaller’s grammar. This can aid in increasing the number of syscalls covered by Syzkaller significantly with the minimum possibility of manual errors. Let’s delve into its internals.
>
>
> ---
>

### [How the OpenBSD -stable packages are built](https://dataswamp.org/~solene/2020-10-29-official-openbsd-stable-architecture.html) ###

>
>
> In this long blog post, I will write about the technical details of the OpenBSD stable packages building infrastructure. I have setup the infrastructure with the help of Theo De Raadt who provided me the hardware in summer 2019, since then, OpenBSD users can upgrade their packages using pkg\_add -u for critical updates that has been backported by the contributors. Many thanks to them, without their work there would be no packages to build. Thanks to pea@ who is my backup for operating this infrastructure in case something happens to me.
>
>
> ---
>

### [OPNsense 20.7.4 released](https://opnsense.org/opnsense-20-7-4-released/) ###

>
>
> This release finally wraps up the recent Netmap kernel changes and tests.  
>  The Realtek vendor driver was updated as well as third party software cURL,  
>  libxml2, OpenSSL, PHP, Suricata, Syslog-ng and Unbound just to name a couple  
>  of them.
>
>
> ---
>

Beastie Bits
----------

* [Binutils and linker changes](https://www.dragonflydigest.com/2020/11/03/25120.html)
* [28 Years of NetBSD contributions](https://github.com/NetBSD/src/graphs/contributors)
* [Bluetooth Audio on OpenBSD](https://ifconfig.se/bluetooth-audio-openbsd.html)
* [K8s Bhyve](https://k8s-bhyve.convectix.com) \*\*\*

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Sean - C Flags](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/376/feedback/Sean - C Flags.md>)
* [Thierry - RPI ZFS question](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/376/feedback/Thierry - RPI ZFS question.md>)
  * [Thierry's script](https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/376/feedback/script.md) \*\*\*

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*