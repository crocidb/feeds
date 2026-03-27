+++
title = "10: Year of the BSD Desktop"
description = """HeadlinesOpenBSD 5.4 released The usual 6 month release cycle continues with 5.4 People who bought the CD get the release very early, but now it's on the public FTP New platforms "octeon" and "beagle" Improved Intel DRM, rew"""
date = "2013-11-06T13:00:00Z"
url = "https://www.bsdnow.tv/10"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.294297264Z"
seen = false
+++

Headlines
----------

### [OpenBSD 5.4 released](http://www.openbsd.org/54.html) ###

* The usual 6 month release cycle continues with 5.4
* People who bought the CD get the release very early, but now it's on the public FTP
* New platforms "octeon" and "beagle"
* Improved Intel DRM, reworked checksumming for network protocols, ECDHE support in httpd, inetd no longer started by default, DHCP improvements, lots of new OpenSMTPD work, OpenSSH 6.3
* Over 7,800 ports available, comes with another new song and fun artwork, lots of new features - check out the full release notes
* A special thanks to Nick Holland and Bob Beck for their behind-the-scenes work
* Experimental FUSE support was enabled shortly after the release, so look forward to that in the future \*\*\*

### [FreeBSD pkgng repos are official](https://lists.freebsd.org/pipermail/freebsd-pkg/2013-October/000107.html) ###

* Built weekly from a snapshot of the Ports Collection every Wednesday
* Signed packages coming soon with pkg 1.2
* Added official [public key](http://freshbsd.org/commit/freebsd/r257150) to -STABLE and -CURRENT
* New "pkg+http" [protocol](http://freshbsd.org/commit/freebsd/r257328) identifier for SRV records
* If you need something more up to date or with custom options, it's easy to [make your own](http://www.bsdnow.tv/tutorials/poudriere) with just the packages you want using our tutorial
* If you need a guide on how to use pkgng itself, check [our tutorial](http://www.bsdnow.tv/tutorials/pkgng) for that too!
* What does this mean for PCBSD repo users? Should they switch? Differences? \*\*\*

### [DragonflyBSD 3.6 branched](http://lists.dragonflybsd.org/pipermail/kernel/2013-October/063015.html) ###

* SMP improvements and GCC changes are all in, so it's time to branch
* Release planned for a little under 2 weeks from today
* Features will include i915 support, mdocml imported, crazy SMP improvements, dports being default
* We're hoping to get someone from Dragonfly on the show next week to talk about the final release \*\*\*

### [FreeBSD portmgr lurkers](http://blogs.freebsdish.org/portmgr/2013/11/01/portmgr-lurkers-pilot-project/) ###

* Over the course of the next two years, volunteers from a group of ports committers will participate in portmgr activities
* At four month intervals, two committers at a time will be brought in to work on various projects and learn the inner workings of the team
* The first two -lurkers are Mathieu Arnold (mat@) and Antoine Brodin (antoine@). \*\*\*

Interview - Michael W. Lucas - [mwlucas@michaelwlucas.com](mailto:mwlucas@michaelwlucas.com) / [@mwlauthor](https://twitter.com/mwlauthor)
----------

[Sudo Mastery](http://blather.michaelwlucas.com/archives/1852)

* [Video: DNSSec in 55 Minutes](http://blather.michaelwlucas.com/archives/1805) \*\*\*

Tutorial
----------

### [Configuring FreeBSD as a desktop system](http://www.bsdnow.tv/tutorials/the-desktop) ###

---

News Roundup
----------

### [Capsicum in DragonflyBSD](http://lists.dragonflybsd.org/pipermail/kernel/2013-October/063014.html) ###

* Dragonfly has no security framework yet besides the traditional unix DAC model
* Port of Capsicum to Dragonfly has begun
* Quite a bit of technical detail in the show notes \*\*\*

### [NYCBSDCon 2014](http://www.nycbsdcon.org/2014/) ###

* After a three year hiatus, NYCBSDCon is back on February 8, 2014
* Theme of "The BSDs in Production" this year
* Held in New York City, more information to come as the time draws closer \*\*\*

### [FreeBSD newcons progress update](http://freebsdfoundation.blogspot.com/2013/11/newcons-system-console-project-update.html) ###

* This project will provide a replacement for the legacy syscons system console
* Newcons provides a number of improvements, including better integration with graphics modes, and broader character set support
* More details on the project can be found on the [FreeBSD wiki](https://wiki.freebsd.org/Newcons) \*\*\*

### [Weekly PCBSD feature digest](http://blog.pcbsd.org/2013/11/pc-bsd-weekly-feature-digest-11113/) ###

* PBI 10 format is about ready and they'll begin populating the 10.0 appcafe starting next week
* PCDM login manager is back and is ready to be tested
* New PC-BSD Disk Manager Utility with lots of features \*\*\*

Feedback/Questions
----------

* [Alptekin writes in](http://slexy.org/view/s208YfYZA9)
* [Gertjan writes in[([http://slexy.org/view/s2k4C2Ryo9](http://slexy.org/view/s2k4C2Ryo9))
* [Kevin writes in](http://slexy.org/view/s2172EyaRG)
* [Kjell-Aleksander writes in](http://slexy.org/view/s2mP8ftX0U)
* [Michael writes in](http://slexy.org/view/s203Z9VdKt) \*\*\*