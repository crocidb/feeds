+++
title = "338: iocage in Jail"
description = 'Distrowatch reviews FuryBSD, LLDB on i386 for NetBSD, wpa\_supplicant as lower-class citizen, KDE on FreeBSD updates, Travel Grant for BSDCan open, ZFS dataset for testing iocage within a jail, and more.Headlines[Distrowatch Fury BSD Review](https://distrowatch.com/'
date = "2020-02-20T13:00:00Z"
url = "https://www.bsdnow.tv/338"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.562349815Z"
seen = false
+++

Distrowatch reviews FuryBSD, LLDB on i386 for NetBSD, wpa\_supplicant as lower-class citizen, KDE on FreeBSD updates, Travel Grant for BSDCan open, ZFS dataset for testing iocage within a jail, and more.

Headlines
----------

### [Distrowatch Fury BSD Review](https://distrowatch.com/weekly.php?issue=20200127#furybsd) ###

>
>
> FuryBSD is the most recent addition to the DistroWatch database and provides a live desktop operating system based on FreeBSD. FuryBSD is not entirely different in its goals from NomadBSD, which we discussed recently. I wanted to take this FreeBSD-based project for a test drive and see how it compares to NomadBSD and other desktop-oriented projects in the FreeBSD family.
>
>
>
> FuryBSD supplies hybrid ISO/USB images which can be used to run a live desktop. There are two desktop editions currently, both for 64-bit (x86\_64) machines: Xfce and KDE Plasma. The Xfce edition is 1.4GB in size and is the flavour I downloaded. The KDE Plasma edition is about 3.0GB in size.
>
>
>
> My fresh install of FuryBSD booted to a graphical login screen. From there I could sign into my account, which brings up the Xfce desktop. The installed version of Xfce is the same as the live version, with a few minor changes. Most of the desktop icons have been removed with just the file manager launchers remaining. The Getting Started and System Information icons have been removed. Otherwise the experience is virtually identical to the live media.
>
>
>
> FuryBSD uses a theme that is mostly grey and white with creamy yellow folder icons. The application menu launchers tend to have neutral icons, neither particularly bright and detailed or minimal.
>
>

---

### [LLDB now works on i386](http://blog.netbsd.org/tnf/entry/lldb_now_works_on_i386) ###

>
>
> Upstream describes LLDB as a next generation, high-performance debugger. It is built on top of LLVM/Clang toolchain, and features great integration with it. At the moment, it primarily supports debugging C, C++ and ObjC code, and there is interest in extending it to more languages.
>
>
>
> In February 2019, I have started working on LLDB, as contracted by the NetBSD Foundation. So far I've been working on reenabling continuous integration, squashing bugs, improving NetBSD core file support, extending NetBSD's ptrace interface to cover more register types and fix compat32 issues, fixing watchpoint and threading support.
>
>
>
> The original NetBSD port of LLDB was focused on amd64 only. In January, I have extended it to support i386 executables. This includes both 32-bit builds of LLDB (running natively on i386 kernel or via compat32) and debugging 32-bit programs from 64-bit LLDB.
>
>

---

News Roundup
----------

### [wpa\_supplicant is definitely a lower-class citizen, sorry](https://marc.info/?l=openbsd-misc&m=158068418807352&w=2) ###

>
>
> wpa\_supplicant is definitely a lower-class citizen, sorry.
>
>
>
> I increasingly wonder why this stuff matters; transit costs are so much lower than the period when eduroam was setup, and their reliance on 802.11x is super weird in a world where, for the most part  
>  \+ entire cities have open wifi in their downtown core  
>  \+ edu vs edu+transit split horizon problems have to be solved anyways  
>  \+ many universities have parallel open wifi  
>  \+ rate limiting / fare-share approaches for the open-net, on unmetered  
>  \+ flat-rate solves the problem  
>  \+ LTE hotspot off a phone isn't a rip off anymore  
>  \+ other open networks exist
>
>
>
> essentially no one else feels compelled to do use 802.11x for a so called "semi-open access network", so I think they've lost the plot on friction vs benefit.
>
>
>
> (we've held hackathons at EDU campus that are locked down like that, and in every case we've said no way, gotten a wire with open net, and built our own wifi. we will not subject our developers to that extra complexity).
>
>

---

### [KDE FreeBSD Updates Feb 2020](https://euroquis.nl/freebsd/2020/02/08/freebsd.html) ###

>
>
> Some bits and bobs from the KDE FreeBSD team in february 2020. We met at the FreeBSD devsummit before FOSDEM, along with other FreeBSD people. Plans were made, schemes were forged, and Groff the Goat was introduced to some new people.
>
>

* The big ticket things:
  * Frameworks are at 5.66
  * Plasma is at 5.17.5 (the beta 5.18 hasn’t been tried)
  * KDE release service has landed 19.12.2 (same day it was released)

* Developer-centric:
  * KDevelop is at 5.5.0
  * KUserfeedback landed its 1.0.0 release
  * CMake is 3.16.3

* Applications:
  * Musescore is at 3.4.2
  * Elisa now part of the KDE release service updates

* Fuure work:
  * KIO-Fuse probably needs extra real-world testing on FreeBSD. I don’t have that kind of mounts (just NFS in /etc/fstab) so I’m not the target audience.
  * KTextEditor is missing .editorconfig support. That can come in with the next frameworks update, when consumers update anyway. Chasing it in an intermediate release is a bit problematic because it does require some rebuilds of consumers.

---

### [Travel Grant Application for BSDCan is now open](https://lists.freebsd.org/pipermail/freebsd-announce/2020-February/001929.html) ###

>
>
> Hi everyone,
>
>
>
> The Travel Grant Application for BSDCan 2020 is now open. The Foundation can help you attend BSDCan through our travel grant program. Travel grants are available to FreeBSD developers and advocates who need assistance with travel expenses for attending conferences related to FreeBSD development. BSDCan 2020 applications are due April 9, 2020. Find out more and apply at: [https://www.freebsdfoundation.org/what-we-do/grants/travel-grants/](https://www.freebsdfoundation.org/what-we-do/grants/travel-grants/)
>
>
>
> Did you know the Foundation also provides grants for technical events not specifically focused on BSD? If you feel that your attendance at one of these events will benefit the FreeBSD Project and Community and you need assistance getting there, please fill out the general travel grant application. Your application must be received 7 weeks prior to the event. The general application can be found here: [https://goo.gl/forms/QzsOMR8Jra0vqFYH2](https://goo.gl/forms/QzsOMR8Jra0vqFYH2)
>
>

---

### [Creating a ZFS dataset for testing iocage within a jail](https://dan.langille.org/2020/02/01/creating-a-zfs-dataset-for-testing-iocage-within-a-jail/) ###

* Be warned, this failed. I’m stalled and I have not completed this.

>
>
> I’m going to do jails within a jail. I already do that with poudriere in a jail but here I want to test an older version of iocage before upgrading my current jail hosts to a newer version.
>
>

* In this post:
  * FreeBSD 12.1
  * py36-iocage-1.2\_3
  * py36-iocage-1.2\_4

>
>
> This post includes my errors and mistakes. Perhaps you should proceed carefully and read it all first.
>
>

---

Beastie Bits
----------

* [Reminder: the FreeBSD Journal is free! Check out these great articles](https://www.freebsdfoundation.org/journal/browser-based-edition/)
* [Serenity GUI desktop running on an OpenBSD kernel](https://twitter.com/jcs/status/1224205573656322048)
* [The Open Source Parts of MacOS](https://github.com/apple-open-source/macos)
* [FOSDEM videos available](https://www.fosdem.org/2020/schedule/track/bsd/)

---

Feedback/Questions
----------

* Michael - [Install with ZFS](http://dpaste.com/3WRC9CQ#wrap)
* Mohammad - [Server Freeze](http://dpaste.com/3BYZKMS#wrap)
* Todd - [ZFS Questions](http://dpaste.com/2J50HSJ#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.