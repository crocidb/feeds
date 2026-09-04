+++
title = "66: Conference Connoisseur"
description = "This week on the show, we'll be talking with Paul Schenkeveld, chairman of the EuroBSDCon foundation. He tells us about his experiences running BSD conferences and how regular users can get involved too. We've also got answers to all your emails and the latest news, coming up on "
date = "2014-12-03T13:00:00Z"
url = "https://www.bsdnow.tv/66"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.189422304Z"
seen = true
+++

This week on the show, we'll be talking with Paul Schenkeveld, chairman of the EuroBSDCon foundation. He tells us about his experiences running BSD conferences and how regular users can get involved too. We've also got answers to all your emails and the latest news, coming up on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [More BSD presentation videos](https://www.meetbsd.com/) ###

* The MeetBSD video uploading spree continues with a few more talks, maybe this'll be the last batch
* Corey Vixie, [Web Apps in Embedded BSD](https://www.youtube.com/watch?v=Pbks12Mqpp8)
* Allan Jude, [UCL config](https://www.youtube.com/watch?v=TjP86iWsEzQ)
* Kip Macy, [iflib](https://www.youtube.com/watch?v=P4FRPKj7F80)
* While we're on the topic of conferences, AsiaBSDCon's CFP was [extended](https://twitter.com/asiabsdcon/status/538352055245492226) by one week
* This year's [ruBSD](https://events.yandex.ru/events/yagosti/rubsd14/) will be on December 13th in Moscow
* Also, the [BSDCan call for papers](http://lists.bsdcan.org/pipermail/bsdcan-announce/2014-December/000135.html) is out, and the event will be in June next year
* Lastly, according to Rick Miller, "A potential vBSDcon 2015 event is being explored though a decision has yet to be made." \*\*\*

### [BSD-powered digital library in Africa](http://peercorpsglobal.org/nzegas-digital-library-becomes-a-reality/) ###

* You probably haven't heard much about Nzega, Tanzania, but it's an East African country without much internet access
* With physical schoolbooks being a rarity there, a few companies helped out to bring some BSD-powered reading material to a local school
* They now have a pair of FreeNAS Minis at the center of their local network, with over 80,000 books and accompanying video content stored on them (\~5TB of data currently)
* The school's workstations also got wiped and reloaded with FreeBSD, and everyone there seems to really enjoy using it \*\*\*

### [pfSense 2.2 status update](https://blog.pfsense.org/?p=1486) ###

* With lots of people asking when the 2.2 release will be done, some pfSense developers decided to provide a status update
* 2.2 will have a lot of changes: being based on FreeBSD 10.1, Unbound instead of BIND, updating PHP to something recent, including the new(ish) IPSEC stack updates, etc
* All these things have taken more time than previously expected
* The post also has some interesting graphs showing the ratio of opened and close bugs for the upcoming release \*\*\*

### [Recommended hardware threads](https://www.reddit.com/r/BSD/comments/2n8wrg/bsd_on_mini_itx/) ###

* A few threads on caught our attention this week, all about hardware recommendations for BSD setups
* In the first one, the OP asks about mini-ITX hardware to run a FreeBSD server and NAS
* Everyone gave some good recommendations for low power, Atom-based systems
* The [second thread](https://www.marc.info/?t=141694918800006&r=1&w=2) started off asking about which CPU architecture is best for PF on an OpenBSD router, but ended up being another hardware thread
* For a router, the ALIX, APU and Soekris boards still seem to be the most popular choices, with the [third](https://www.reddit.com/r/homelab/comments/24m6tj/) and [fourth](https://www.reddit.com/r/PFSENSE/comments/2nblgp/) threads confirming this
* If you're thinking about building your first BSD box - server, router, NAS, whatever - these might be some good links to read \*\*\*

Interview - Paul Schenkeveld - [freebsd@psconsult.nl](mailto:freebsd@psconsult.nl)
----------

Running a BSD conference

---

News Roundup
----------

### [From Linux to FreeBSD - for reals](https://www.reddit.com/r/freebsd/comments/2nqa60/) ###

* Another Linux user is ready to switch to BSD, and takes to Reddit for some community encouragement (seems to be a common thing now)
* After being a Linux guy for 20(!) years, he's ready to switch his systems over, and is looking for some helpful guides to transition
* In the comments, a lot of new switchers offer some advice and reading material
* If any of the listeners have some things that were helpful along your switching journey, maybe send 'em this guy's way \*\*\*

### [Running FreeBSD as a Xen Dom0](http://wiki.xenproject.org/wiki/FreeBSD_Dom0) ###

* Continuing progress has been made to allow FreeBSD to be a host for the Xen hypervisor
* This wiki article explains how to run the Xen branch of FreeBSD and host virtual machines on it
* Xen on FreeBSD currently supports PV guests (modified kernels) and HVM (unmodified kernels, uses hardware virtualization features)
* The wiki provides instructions for running Debian (PV) and FreeBSD (HVM), and discusses the features that are not finished yet \*\*\*

### [HardenedBSD updates and changes](http://hardenedbsd.org/article/shawn-webb/2014-11-18/aout-and-null-mapping-support-removal) ###

* a.out is the old executable format for Unix
* The name stands for assembler output, and was coined by Ken Thompson as the fixed name for output of his PDP-7 assembler in 1968
* FreeBSD, on which HardenedBSD is based, switched away from a.out in version 3.0
* A restriction against NULL mapping was introduced in [FreeBSD 7](https://www.freebsd.org/security/advisories/FreeBSD-EN-09:05.null.asc) and enabled by default in FreeBSD 8
* However, for reasons of compatibility, it could be switched off, allowing buggy applications to continue to run, at the risk of allowing a kernel bug to be exploited
* HardenedBSD has removed the sysctl, making it impossible to run in ‘insecure mode’
* Package building update: [more consistent repo, no more i386 packages ](http://hardenedbsd.org/article/shawn-webb/2014-11-30/package-building-infrastructure-maintenance) \*\*\*

Feedback/Questions
----------

* [Boris writes in](http://slexy.org/view/s2kVPKICqj)
* [Alex writes in](http://slexy.org/view/s21Fic4dZC) (**edit:** adding "tinker panic 0" to the ntp.conf will disable the sanity check)
* [Chris writes in](http://slexy.org/view/s2zk1Tvfe9)
* [Robert writes in](http://slexy.org/view/s22alvJ4mu)
* [Jake writes in](http://slexy.org/view/s203YMc2zL) \*\*\*

Mailing List Gold
----------

* [Real world authpf use](https://www.marc.info/?t=141711266800001&r=1&w=2)
* [The](https://svnweb.freebsd.org/ports/head/UPDATING?r1=373564&r2=373563&pathrev=373564) [great](https://lists.freebsd.org/pipermail/freebsd-ports/2014-November/096788.html) [perl](https://lists.freebsd.org/pipermail/freebsd-ports/2014-November/096799.html) [event](https://lists.freebsd.org/pipermail/freebsd-perl/2014-November/010146.html) [of](https://lists.freebsd.org/pipermail/freebsd-perl/2014-November/010149.html) [2014](https://lists.freebsd.org/pipermail/freebsd-perl/2014-November/010167.html) \*\*\*