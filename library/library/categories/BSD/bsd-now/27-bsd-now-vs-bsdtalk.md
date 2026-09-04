+++
title = "27: BSD Now vs. BSDTalk"
description = "The long-awaited meetup is finally happening on today's show. We're going to be interviewing the original BSD podcaster, Will Backman, to discuss what he's been up to and what the future of BSD advocacy looks like. After that, we'll be showing you how to track (and even cross-com"
date = "2014-03-05T13:00:00Z"
url = "https://www.bsdnow.tv/27"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.262464898Z"
seen = true
+++

The long-awaited meetup is finally happening on today's show. We're going to be interviewing the original BSD podcaster, Will Backman, to discuss what he's been up to and what the future of BSD advocacy looks like. After that, we'll be showing you how to track (and even cross-compile!) the -CURRENT branch of NetBSD. We've got answers to user-submitted questions and the latest news, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage For Open Source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)

---

Headlines
----------

### [FreeBSD and OpenBSD in GSOC2014](https://wiki.freebsd.org/SummerOfCode2014) ###

* The Google Summer of Code is a way to encourage students to write code for open source projects and make some money
* Both FreeBSD and OpenBSD were accepted, and we'd love for anyone listening to check out their GSOC pages
* The FreeBSD wiki has a list of things that they'd be interested in someone helping out with
* OpenBSD's want list was [also posted](http://www.openbsdfoundation.org/gsoc2014.html)
* DragonflyBSD and NetBSD were sadly not accepted this year \*\*\*

### [Yes, you too can be an evil network overlord](http://bsdly.blogspot.com/2014/02/yes-you-too-can-be-evil-network.html) ###

* A new blog post about monitoring your network using only free tools
* OpenBSD is a great fit, and has all the stuff you need in the base system or via packages
* It talks about the pflow pseudo-interface, its capabilities and relation to NetFlow (also goes well with pf)
* There's also details about flowd and nfsen, more great tools to make network monitoring easy
* If you're listening, Peter... stop ignoring our emails and come on the show! We know you're watching! \*\*\*

### [BSDMag's February issue is out](http://bsdmag.org/magazine/1858-openbsd-5-4-configure-openbsd-basic-services) ###

* The theme is "configuring basic services on OpenBSD 5.4"
* There's also an interview with Peter Hansteen (oh hey...)
* Topics also include locking down SSH, a GIMP lesson, user/group management, and...
* Linux and Solaris articles? Why?? \*\*\*

### [Changes in bcrypt](http://marc.info/?l=openbsd-misc&m=139320023202696&w=2) ###

* Not specific to any OS, but the OpenBSD team is updating their bcrypt implementation
* There is a bug in bcrypt when hashing long passwords - other OSes need to update theirs too! (FreeBSD already has)
* "The length is stored in an unsigned char type, which will overflow and wrap at 256. Although we consider the existence of affected hashes very rare, in order to differentiate hashes generated before and after the fix, we are introducing a new minor 'b'."
* As long as you upgrade your OpenBSD system in order (without skipping versions) you should be ok going forward
* Lots of specifics in the email, check the full thing \*\*\*

Interview - Will Backman - [bitgeist@yahoo.com](mailto:bitgeist@yahoo.com) / [@bsdtalk](https://twitter.com/bsdtalk)
----------

The BSDTalk podcast, BSD advocacy, various topics

---

Tutorial
----------

### [Tracking and cross-compiling -CURRENT (NetBSD)](http://www.bsdnow.tv/tutorials/current-nbsd) ###

---

News Roundup
----------

### [X11 no longer needs root](http://undeadly.org/cgi?action=article&sid=20140223112426) ###

* Xorg has long since required root privileges to run the main server
* With [recent work](http://marc.info/?l=openbsd-cvs&;m=139245772023497&w=2) from the OpenBSD team, now everything (even KMS) can run as a regular user
* Now you can set the "machdep.allowaperture" sysctl to 0 and still use a GUI \*\*\*

### [OpenSSH 6.6 CFT](https://lists.mindrot.org/pipermail/openssh-unix-dev/2014-March/032259.html) ###

* Shortly after the huge 6.5 release, we get a routine bugfix update
* Test it out on as many systems as you can
* Check the mailing list for the full bug list \*\*\*

### [Creating an OpenBSD USB drive](http://undeadly.org/cgi?action=article&sid=20140225072408) ###

* Since OpenBSD doesn't distribute any official USB images, here are some instructions on how to do it
* Step by step guide on how you can make your very own
* However, there's some [recent emails](http://undeadly.org/cgi?action=article&sid=20140228231258) that suggest official USB images may be coming soon... [oh wait](http://marc.info/?l=openbsd-cvs&m=139377587526463&w=2) \*\*\*

### [PCBSD weekly digest](http://blog.pcbsd.org/2014/02/pc-bsd-weekly-feature-digest-19/) ###

* New PBI updates that allow separate ports from /usr/local
* You need to rebuild pbi-manager if you want to try it out
* Updates and changes to Life Preserver, App Cafe, PCDM \*\*\*

Feedback/Questions
----------

* [espressowar writes in](http://slexy.org/view/s2JpJ5EaZp)
* [Antonio writes in](http://slexy.org/view/s2QpPevJ3J)
* [Christian writes in](http://slexy.org/view/s2EZLxDfWh)
* [Adam writes in](http://slexy.org/view/s21gEBZbmG)
* [Alex writes in](http://slexy.org/view/s2RnCO1p9c) \*\*\*