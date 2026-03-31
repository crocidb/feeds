+++
title = "352: Introducing Randomness"
description = "A brief introduction to randomness, logs grinding netatalk to a halt, NetBSD core team changes, Using qemu guest agent on OpenBSD kvm/qemu guests, WireGuard patchset for OpenBSD, FreeBSD 12.1 on a laptop, and more.Headlines[Entropy](https://washbear.neocities.org/en"
date = "2020-05-28T12:00:00Z"
url = "https://www.bsdnow.tv/352"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.538437583Z"
seen = true
+++

A brief introduction to randomness, logs grinding netatalk to a halt, NetBSD core team changes, Using qemu guest agent on OpenBSD kvm/qemu guests, WireGuard patchset for OpenBSD, FreeBSD 12.1 on a laptop, and more.

Headlines
----------

### [Entropy](https://washbear.neocities.org/entropy.html) ###

>
> >
> >
> > A brief introduction to randomness
> >
> >
>
>

* Problem: Computers are very predictable. This is by design.

>
>
> But what if we want them to act unpredictably? This is very useful if we want to secure our private communications with randomized keys, or not let people cheat at video games, or if we're doing statistical simulations or similar.
>
>

---

### [Logs grinding Netatalk on FreeBSD to a hault](https://rubenerd.com/logs-grinding-netatalk-on-freebsd-to-a-hault/) ###

>
> >
> >
> > I’ve heard it said the cobbler’s children walk barefoot. While posessing the qualities of a famed financial investment strategy, it speaks to how we generally put more effort into things for others than ourselves; at least in business.  
> >  The HP Microserver I share with Clara is a modest affair compared to what we run at work. It has six spinning rust drives and two SSDs which are ZFS-mirrored; not even in a RAID 10 equivalent. This is underlaid with GELI for encryption, and served to our Macs with Netatalk over gigabit Ethernet with jumbo frames.
> >
> >
>
>

---

News Roundup
----------

### [NetBSD Core Team Changes](https://mail-index.netbsd.org/netbsd-announce/2020/05/07/msg000314.html) ###

>
>
> Matt Thomas (matt@) has served on the NetBSD core team for over ten years, and has made many contributions, including ELF functionality, being the long-time VAX maintainer, gcc contributor, the generic pmap, and also networking functionality, and platform bring-up over the years. Matt has stepped down from the NetBSD core team, and we thank him for his many, extensive contributions.  
>  Robert Elz (kre@), a long time BSD contributor, has kindly accepted the offer to join the core team, and help us out with the benefit of his experience and advice over many years. Amongst other things, Robert has been maintaining our shell, liaising with the Austin Group, and bringing it up to date with modern functionality.
>
>
> ---
>

### [Using qemu guest agent on OpenBSD kvm/qemu guests](https://undeadly.org/cgi?action=article;sid=20200514073852) ###

>
>
> In a post to the ports@ mailing list, Landry Breuil (landry@) shared some of his notes on using qemu guest agent on OpenBSD kvm/qemu guests.
>
>

---

### [WireGuard patchset for OpenBSD](https://undeadly.org/cgi?action=article;sid=20200512080047) ###

>
>
> A while ago I wanted to learn more about OpenBSD development. So I picked a project, in this case WireGuard, to develop a native client for. Over the last two years, with many different iterations, and working closely with the WireGuard's creator (Jason [Jason A. Donenfeld - Ed.], CC'd), it started to become a serious project eventually reaching parity with other official implementations. Finally, we are here and I think it is time for any further development to happen inside the src tree.
>
>
> ---
>

### [FreeBSD 12.1 on a laptop](https://dataswamp.org/~solene/2020-05-11-freebsd-workstation.html) ###

>
>
> I’m using FreeBSD again on a laptop for some reasons so expect to read more about FreeBSD here. This tutorial explain how to get a graphical desktop using FreeBSD 12.1.
>
>
> ---
>

Beastie Bits
----------

* [List of useful FreeBSD Commands](https://medium.com/@tdebarbora/list-of-useful-freebsd-commands-92dffb8f8c57)
* [Master Your Network With Unix Command Line Tools](https://itnext.io/master-your-network-with-unix-command-line-tools-790bdd3b3b87)
* [Original Unix containers aka FreeBSD jails](https://twitter.com/nixcraft/status/1257674069387993088)
* [Flashback : 2003 Article : Bill Joy's greatest gift to man – the vi editor](https://www.theregister.co.uk/2003/09/11/bill_joys_greatest_gift/)
* [FreeBSD Journal March/April 2020 Filesystems: ZFS Encryption, FUSE, and more, plus Network Bridges](https://www.freebsdfoundation.org/past-issues/filesystems/)
* [HAMBug meeting will be online again in June, so those from all over the world are welcome to join, June 9th (2nd Tuesday of each month) at 18:30 Eastern](https://www.hambug.ca/)

---

Feedback/Questions
----------

* + [Lyubomir - GELI and ZFS](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/352/feedback/Lyubomir - GELI and ZFS.md>)
* [Patrick - powerd and powerd++](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/352/feedback/Patrick - powerd and powerd++.md>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---