+++
title = "401: OpenBSD Dog Garage"
description = "Dog's Garage Runs OpenBSD, EuroBSDcon 2021 Call for Papers, FreeBSD’s iostat, The state of toolchains in NetBSD, Bandwidth limiting on OpenBSD 6.8, FreeBSD's ports migration to git and its impact on HardenedBSD, TrueNAS 12.0-U3 has been released, and more.NOTES   This episo"
date = "2021-05-06T07:00:00Z"
url = "https://www.bsdnow.tv/401"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.459498453Z"
seen = false
+++

Dog's Garage Runs OpenBSD, EuroBSDcon 2021 Call for Papers, FreeBSD’s iostat, The state of toolchains in NetBSD, Bandwidth limiting on OpenBSD 6.8, FreeBSD's ports migration to git and its impact on HardenedBSD, TrueNAS 12.0-U3 has been released, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [My Dog's Garage Runs OpenBSD](https://undeadly.org/cgi?action=article;sid=20210415055717) ###

>
>
> I was inspired by the April 2017 article in undeadly.org about getting OpenBSD running on a Raspberry Pi 3B+. My goal was to use a Raspberry Pi running OpenBSD to monitor the temperature in my garage from my home. My dog has his own little "apartment" inside the garage, so I want to keep an eye on the temperature. (I don't rely on this device. He sleeps inside the house whenever he wants.)
>
>
> ---
>

### [EuroBSDcon 2021 Call for Papers](https://2021.eurobsdcon.org/about/cfp/) ###

---

### [FreeBSD iostat](https://klarasystems.com/articles/freebsd-iostat-a-quick-glance/) ###

---

### [The state of toolchains in NetBSD](https://www.cambus.net/the-state-of-toolchains-in-netbsd/) ###

>
>
> While FreeBSD and OpenBSD both switched to using LLVM/Clang as their base system compiler, NetBSD picked a different path and remained with GCC and binutils regardless of the license change to GPLv3. However, it doesn't mean that the NetBSD project endorses this license, and the NetBSD Foundation's has issued a statement about its position on the subject.
>
>

* [NetBSD’s statement](http://cvsweb.netbsd.org/bsdweb.cgi/src/external/gpl3/README?rev=1.1) \*\*\*

News Roundup
----------

### [Bandwidth limiting on OpenBSD 6.8](https://dataswamp.org/~solene/2021-02-07-limit.html) ###

>
>
> I will explain how to limit bandwidth on OpenBSD using its firewall PF (Packet Filter) queuing capability. It is a very powerful feature but it may be hard to understand at first. What is very important to understand is that it's technically not possible to limit the bandwidth of the whole system, because once data is getting on your network interface, it's already there and got by your router, what is possible is to limit the upload rate to cap the download rate.
>
>
> ---
>
>
> ### [FreeBSD's ports migration to git and its impact on HardenedBSD](https://hardenedbsd.org/article/shawn-webb/2021-04-06/freebsds-ports-migration-git-and-its-impact-hardenedbsd) ###
>
>
>
> FreeBSD completed their ports migration from subversion to git. Prior to the official switch, we used the read-only mirror FreeBSD had at GitHub[1]. The new repo is at [2]. A cursory glance at the new repo will show that the commit hashes changed. This presents an issue with HardenedBSD's ports tree in our merge-based workflow.
>
>
> ---
>

### [TrueNAS 12.0-U3 has been released](https://www.truenas.com/docs/releasenotes/core/12.0u3/) ###

>
>
> iXsystems is excited to announce TrueNAS 12.0-U3 was released today and marks an important milestone in the transition from FreeNAS to TrueNAS. TrueNAS 12.0 is now considered by iXsystems to be a higher quality release than FreeNAS 11.3-U5, our previous benchmark. The new TrueNAS documentation site has also reached a point where it has more content and capabilities than FreeNAS. TrueNAS 12.0 is ready for mission-critical enterprise deployments.
>
>
> ---
>

Beastie Bits
----------

* [Joyent provides pkgsrc for MacOS X](https://pkgsrc.joyent.com/install-on-osx/)
* [Archives of old Irix documentation](https://techpubs.jurassic.nl)
* [FreeBSD Developer/Vendor Summit 2021](https://wiki.freebsd.org/DevSummit/202106) \*\*\*

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Andre - splitting zfs array](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/401/feedback/Andre - splitting zfs array>)
* [Bruce - Command Change](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/401/feedback/Bruce - Command Change>)
* [Dan - Annoyances with ZFS](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/401/feedback/Dan - Annoyances with ZFS>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*