+++
title = "368: Changing OS roles"
description = "Modernizing the OpenBSD Console, OS roles have changed, FreeBSD Cluster with Pacemaker and Corosync, Wine in a 32-bit sandbox on 64-bit NetBSD, Find package which provides a file in OpenBSD, and more.NOTES   This episode of BSDNow is brought to you by [Tarsnap](https://www."
date = "2020-09-17T10:00:00Z"
url = "https://www.bsdnow.tv/368"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.512637093Z"
seen = true
+++

Modernizing the OpenBSD Console, OS roles have changed, FreeBSD Cluster with Pacemaker and Corosync, Wine in a 32-bit sandbox on 64-bit NetBSD, Find package which provides a file in OpenBSD, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/)

Headlines
----------

### [Modernizing the OpenBSD Console](https://www.cambus.net/modernizing-the-openbsd-console/) ###

>
>
> At the beginning were text mode consoles. Traditionally, \*BSD and Linux on i386 and amd64 used text mode consoles which by default provided 25 rows of 80 columns, the "80x25 mode". This mode uses a 8x16 font stored in the VGA BIOS (which can be slightly different across vendors).  
>  OpenBSD uses the wscons(4) console framework, inherited from NetBSD
>
>
> ---
>

### [OS roles have changed](https://rubenerd.com/the-roles-of-oss-have-changed/) ###

>
>
> Though I do wonder sometimes, with just a slight tweak to history, how things might have been different. In another dimension somewhere, I’m using the latest BeOS-powered PowerPC laptop, and a shiny new Palm smartphone. Both of these represented the pinnacle of UI design in the 1990s, and still in the 2020s have yet to be surpassed. People call me an Apple fanboy, but I’d drop all of it in a second for that gear.
>
>
> ---
>

News Roundup
----------

### [FreeBSD Cluster with Pacemaker and Corosync](https://vermaden.wordpress.com/2020/09/03/freebsd-cluster-with-pacemaker-and-corosync/) ###

>
>
> I always missed ‘proper’ cluster software for FreeBSD systems. Recently I got to run several Pacemaker/Corosync based clusters on Linux systems. I thought how to make similar high availability solutions on FreeBSD and I was really shocked when I figured out that both Pacemaker and Corosync tools are available in the FreeBSD Ports and packages as net/pacemaker2 and net/corosync2 respectively.
>
>
> ---
>

### [Wine in a 32-bit sandbox on 64-bit NetBSD](https://washbear.neocities.org/wine-sandbox.html) ###

>
>
> "Mainline pkgsrc" can't do strange multi-arch Wine builds yet, so a 32-bit sandbox seems like a reasonable way to use 32-bit Wine on amd64 without resorting to running real Windows in NVMM. We'll see if this was a viable alternative to re-reviewing the multi-arch support in pkgsrc-wip...  
>  We're using sandboxctl, which is a neat tool for quickly shelling into a different NetBSD userspace. Maybe you also don't trust the Windows applications you're running too much - sandboxctl creates a chroot based on a fresh system image, and chroot on NetBSD is fairly bombproof.
>
>
> ---
>

### [Find package which provides a file in OpenBSD](https://dataswamp.org/~solene/2020-09-04-pkglocate-openbsd.html) ###

>
>
> There is one very handy package on OpenBSD named pkglocatedb which provides the command pkglocate.  
>  If you need to find a file or binary/program and you don’t know which package contains it, use pkglocate.
>
>

---

Beastie Bits
----------

* [OpenBSD for 1.5 Years: Confessions of a Linux Heretic](https://www.youtube.com/watch?v=oTShQIXSdqM)
* [OpenBSD 6.8 Beta Tagged](https://undeadly.org/cgi?action=article;sid=20200831192811)
* [Hammer2 and growth](https://www.dragonflydigest.com/2020/09/08/24933.html)
* [Understanding a FreeBSD kernel vulnerability](https://www.thezdi.com/blog/2020/9/1/cve-2020-7460-freebsd-kernel-privilege-escalation) \*\*\*

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Rob - 7 years](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/368/feedback/Bruce - 7 years.md>)
* [Kurt - Microserver](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/368/feedback/Kurt - Microserver.md>)
* [Rob - Interviews](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/368/feedback/Rob - Interviews.md>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*