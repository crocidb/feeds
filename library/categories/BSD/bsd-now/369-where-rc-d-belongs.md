+++
title = "369: Where rc.d belongs"
description = "High Availability Router/Firewall Using OpenBSD, CARP, pfsync, and ifstated, Building the Development Version of Emacs on NetBSD, rc.d belongs in libexec, not etc, FreeBSD 11.3 EOL, OPNsense 20.7.1 Released, MidnightBSD 1.2.7 out, and more.NOTES   This episode of BSDNow is "
date = "2020-09-24T16:00:00Z"
url = "https://www.bsdnow.tv/369"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.511055104Z"
seen = true
+++

High Availability Router/Firewall Using OpenBSD, CARP, pfsync, and ifstated, Building the Development Version of Emacs on NetBSD, rc.d belongs in libexec, not etc, FreeBSD 11.3 EOL, OPNsense 20.7.1 Released, MidnightBSD 1.2.7 out, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [High Availability Router/Firewall Using OpenBSD, CARP, pfsync, and ifstated](https://dzone.com/articles/high-availability-routerfirewall-using-openbsd-car) ###

>
>
> I have been running OpenBSD on a Soekris net5501 for my router/firewall since early 2012. Because I run a multitude of services on this system (more on that later), the meager 500Mhz AMD Geode + 512MB SDRAM was starting to get a little sluggish while trying to do anything via the terminal. Despite the perceived performance hit during interactive SSH sessions, it still supported a full 100Mbit connection with NAT, so I wasn’t overly eager to change anything. Luckily though, my ISP increased the bandwidth available on my plan tier to 150Mbit+. Unfortunately, the Soekris only contained 4xVIA Rhine Fast Ethernet. So now, I was using a slow system and wasting money by not being able to fully utilize my connection.
>
>

---

### [Building the Development Version of Emacs on NetBSD](https://lars.ingebrigtsen.no/2020/08/25/building-the-development-version-of-emacs-on-netbsd/) ###

>
>
> I hadn’t really planned on installing a NetBSD VM (after doing all the other two BSDs), but then a NetBSD-related Emacs bug report arrived.
>
>

---

News Roundup
----------

### [rc.d belongs in libexec, not etc](https://jmmv.dev/2020/08/rcd-libexec-etc.html) ###

>
>
> Let’s open with the controversy: the scripts that live under /etc/rc.d/ in FreeBSD, NetBSD, and OpenBSD are in the wrong place. They all should live in /libexec/rc.d/ because they are code, not configuration.  
>  This misplacement is something that has bugged me for ages but I never had the energy to open this can of worms back when I was very involved in NetBSD. I suspect it would have been a draining discussion and a very difficult thing to change.
>
>

---

### [FreeBSD 11.3 EOL](https://lists.freebsd.org/pipermail/freebsd-announce/2020-September/001982.html) ###

>
>
> As of September 30, 2020, FreeBSD 11.3 will reach end-of-life and will no longer  
>  be supported by the FreeBSD Security Team. Users of FreeBSD 11.3 are strongly  
>  encouraged to upgrade to a newer release as soon as possible.
>
>

---

### [OPNsense 20.7.1 Released](https://opnsense.org/opnsense-20-7-1-released/) ###

>
>
> Overall, the jump to HardenedBSD 12.1 is looking promising from our end. From the reported issues we still have more logging quirks to investigate and especially Netmap support (used in IPS and Sensei) is lacking in some areas that were previously working. Patches are being worked on already so we shall get there soon enough. Stay tuned.
>
>

---

### [MidnightBSD 1.2.7 out](https://www.justjournal.com/users/mbsd/entry/33801) ###

>
>
> MidnightBSD 1.2.7 is available via the FTP/HTTP and mirrors as well as github.  
>   
>  It includes several bug fixes and security updates over the last ISO release and is recommended for new installations.  
>   
>  Users who don't want to updatee the whole OS, should consider at least updating libmport as there are many package management fixes
>
>

---

Beastie Bits
----------

* [Tarsnap podcast](https://blog.firosolutions.com/2020/08/tarsnap-podcast/)
* [NetBSD Tips and Tricks](http://students.engr.scu.edu/~sschaeck/netbsd/index.html)
* [FreeBSD mini-git Primer](https://hackmd.io/hJgnfzd5TMK-VHgUzshA2g)
* [GhostBSD Financial Reports](https://ghostbsd.org/financial_reports_from_January_to_June_2020) \*\*\*

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Daniel - Documentation Tooling](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/369/feedback/Daniel - Documentation Tooling.md>)
* [Fongaboo - Where did the ZFS tutorial Go?](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/369/feedback/Fongaboo - Where did the ZFS Tutorial Go.md>)
* [Johnny - Browser Cold Wars](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/369/feedback/Johnny - Browser Cold Wars.md>) \*\*\*
* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---