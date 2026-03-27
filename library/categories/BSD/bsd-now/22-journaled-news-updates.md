+++
title = "22: Journaled News-Updates"
description = "This time on the show, we'll be talking with George Neville-Neil about the brand new FreeBSD Journal and what it's all about. After that, we've got a tutorial on how to track the -stable and -current branches of OpenBSD. Answers to all your BSD questions and the latest headlines,"
date = "2014-01-29T13:00:00Z"
url = "https://www.bsdnow.tv/22"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.271528061Z"
seen = false
+++

This time on the show, we'll be talking with George Neville-Neil about the brand new FreeBSD Journal and what it's all about. After that, we've got a tutorial on how to track the -stable and -current branches of OpenBSD. Answers to all your BSD questions and the latest headlines, only on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage For Open Source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)

---

Headlines
----------

### [FreeBSD quarterly status report](https://lists.freebsd.org/pipermail/freebsd-stable/2014-January/077085.html) ###

* Gabor Pali sent out the October-December 2013 status report to get everyone up to date on what's going on
* The report contains 37 entries and is very very long... various reports from all the different teams under the FreeBSD umbrella, probably too many to even list in the show notes
* Lots of work going on in the ARM world, EC2/Xen and Google Compute Engine are also improving
* Secure boot support hopefully coming [by mid-year]([www.itwire.com/business-it-news/open-source/62855-freebsd-to-support-secure-boot-by-mid-year](http://www.itwire.com/business-it-news/open-source/62855-freebsd-to-support-secure-boot-by-mid-year))
* There's quite a bit going on in the FreeBSD world, many projects happening at the same time \*\*\*

### [n2k14 OpenBSD Hackathon Report](http://undeadly.org/cgi?action=article&sid=20140124142027) ###

* Recently, OpenBSD held one of [their hackathons](http://www.openbsd.org/hackathons.html) in New Zealand
* 15 developers gathered there to sit in a room and write code for a few days
* Philip Guenther brings back a nice report of the event
* If you've been watching the -current CVS logs, you've seen the flood of commits just from this event alone
* Fixes with threading, Linux compat, ACPI, and various other things - some will make it into 5.5 and others need more testing
* [Another report from Theo](http://undeadly.org/cgi?action=article&sid=20140127083112) details his work
* Updates to the random subsystem, some work-in-progress pf fixes, suspend/resume fixes and more signing stuff \*\*\*

### [Four new NetBSD releases](https://blog.netbsd.org/tnf/entry/netbsd_6_1_3_netbsd) ###

* NetBSD released versions 6.1.3, 6.0.4, 5.2.2 and 5.1.4
* These updates include lots of bug fixes and some security updates, not focused on new features
* You can upgrade depending on what branch you're currently on
* Confused about the different branches? [See this graph.](https://www.netbsd.org/releases/release-map.html#graph1) \*\*\*

### [The future of open source ZFS development ](http://sites.ieee.org/scv-cs/archives/openzfs-future-open-source-zfs-development) ###

* On February 11, 2014, Matt Ahrens will be giving a presentation about ZFS
* The talk will be about the future of ZFS and the open source development since Oracle closed the code
* It's in San Jose, California - go if you can! \*\*\*

Interview - George Neville-Neil - [gnn@freebsd.org](mailto:gnn@freebsd.org) / [@gvnn3](https://twitter.com/gvnn3)
----------

[The FreeBSD Journal](http://freebsdjournal.com/)

---

Tutorial
----------

### [Tracking -STABLE and -CURRENT (OpenBSD)](http://www.bsdnow.tv/tutorials/stable-current-obsd) ###

---

News Roundup
----------

### [pfSense news and 2.1.1 snapshots](https://doc.pfsense.org/index.php/2.1.1_New_Features_and_Changes) ###

* pfSense has some snapshots available for the upcoming 2.1.1 release
* They include FreeBSD security fixes as well as some other updates
* There are [recordings posted](https://blog.pfsense.org/?p=1198) of some of the previous hangouts
* Unfortunately they're only for subscribers, so you'll have to wait until next month when we have Chris on the show to talk about pfSense! \*\*\*

### [FreeBSD on Google Compute Engine](https://groups.google.com/forum/#!msg/gce-discussion/YWoa3Aa_49U/FYAg9oiRlLUJ) ###

* Recently we mentioned some posts about getting OpenBSD to run on GCE, here's the FreeBSD version
* Nice big fat warning: "The team has put together a best-effort posting that will get most, if not all, of you up and running. That being said, we need to remind you that FreeBSD is being supported on Google Compute Engine by the community. The instructions are being provided as-is and without warranty."
* Their instructions are a little too Linuxy (assuming wget, etc.) for our taste, someone should probably get it updated!
* Other than that it's a pretty good set of instructions on how to get up and running \*\*\*

### [Dragonfly ACPI update](http://www.shiningsilence.com/dbsdlog/2014/01/22/13225.html) ###

* Sascha Wildner committed some [new ACPI code](http://lists.dragonflybsd.org/pipermail/commits/2014-January/199071.html)
* There's also a "heads up" to [update your BIOS](http://lists.dragonflybsd.org/pipermail/users/2014-January/090504.html) if you experience problems
* Check the mailing list post for all the details \*\*\*

### [PCBSD weekly digest](http://blog.pcbsd.org/2014/01/pc-bsd-weekly-feature-digest-6/) ###

* 10.0-RC4 users need to upgrade all their packages for 10.0-RC5
* PBIs needed to be rebuilt.. actually everything did
* Help test GNOME 3 so we can get it in the official ports tree
* By the way, I think Kris has an announcement - PCBSD 10.0 is out! \*\*\*

Feedback/Questions
----------

* [Tony writes in](http://slexy.org/view/s21ZlfOdTt)
* [Jeff writes in](http://slexy.org/view/s2BFZ68Na5)
* [Remy writes in](http://slexy.org/view/s20epArsQI)
* [Nils writes in](http://slexy.org/view/s213CoNvLt)
* [Solomon writes in](http://slexy.org/view/s21XWnThNS) \*\*\*