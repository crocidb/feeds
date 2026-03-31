+++
title = "18: Eclipsing Binaries"
description = "Put away the Christmas trees and update your ports trees! We're back with the first show of 2014, and we've got some catching up to do. This time on the show, we have an interview with Baptiste Daroussin about the future of FreeBSD binary packages. Following that, we'll be highli"
date = "2014-01-01T13:00:00Z"
url = "https://www.bsdnow.tv/18"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.279266785Z"
seen = true
+++

Put away the Christmas trees and update your ports trees! We're back with the first show of 2014, and we've got some catching up to do. This time on the show, we have an interview with Baptiste Daroussin about the future of FreeBSD binary packages. Following that, we'll be highlighting a cool script to do binary upgrades on OpenBSD. Lots of holiday news and listener feedback, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage For Open Source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)

---

Headlines
----------

### [Faces of FreeBSD continues](http://freebsdfoundation.blogspot.com/2013/12/faces-of-freebsd-shteryana-shopova.html) ###

* Our first one details Shteryana Shopova, the local organizer for EuroBSDCon 2014 in Sophia
* Gives some information about how she got into BSD
* "I installed FreeBSD on my laptop, alongside the Windows and Slackware Linux I was running on it at the time. Several months later I realized that apart from FreeBSD, I hadn't booted the other two operating systems in months. So I wiped them out."
* She wrote bsnmpd and extended it with the help of a grant from the FreeBSD Foundation
* We've also got one for [Kevin Martin](http://freebsdfoundation.blogspot.com/2013/12/faces-of-freebsd-kevin-martin.html)
* Started off with a pinball website, ended up learning about FreeBSD from an ISP and starting his own hosting company
* "FreeBSD has been an asset to our operations, and while we have branched out a bit, we still primarily use FreeBSD and promote it whenever possible. FreeBSD is a terrific technology with a terrific community." \*\*\*

### [OpenPF?](http://www.shiningsilence.com/dbsdlog/2013/12/19/13008.html) ###

* A blog post over at the [Dragonfly digest](http://www.bsdnow.tv/episodes/2013_11_13-the_gateway_drug)
* What if we had some cross platform development of OpenBSD's firewall?
* Similar to portable [OpenSSH](http://www.bsdnow.tv/episodes/2013_12_18-cryptocrystalline) or [OpenZFS](http://www.bsdnow.tv/episodes/2013_12_04-zettabytes_for_days), there could be a centrally-developed version with compatibility glue
* Right now FreeBSD 9's pf is old, FreeBSD 10's pf is old (but has the best performance of any implementation due to custom patches), NetBSD's pf is old (but they're working on a fork) and Dragonfly's pf is old
* Further complicated by the fact that PF itself doesn’t have a version number, since it was designed to just be ‘the pf that came with OpenBSD 5.4’
* Not likely to happen any time soon, but it's good food for thought \*\*\*

### [Year of BSD on the server](http://mxey.net/the-year-of-freebsd-on-the-server/) ###

* A good blog post about switching servers from Linux to BSD
* 2014 is going to be the year of a lot of switching, due to FreeBSD 10's amazing new features
* This author was particularly taken with [pkgng](http://www.bsdnow.tv/tutorials/pkgng) and the more coherent layout of BSD systems
* Similarly, there was also a recent [reddit thread](http://www.reddit.com/r/BSD/comments/1tdrz1/why_did_you_choose_bsd_over_linux/), "Why did you choose BSD over Linux?"
* Both are excellent reads for Linux users that are thinking about making the switch, send 'em to your friends \*\*\*

### [Getting to know your portmgr](http://blogs.freebsdish.org/portmgr/2013/12/24/getting-to-know-your-portmgr-bryan-drewery/) ###

* This time in the series they interview Bryan Drewery, a fairly new addition to the team
* He started maintaining portupgrade and portmaster, and eventually ended up on the ports management team
* Believe it or not, his wife actually had a lot to do with him getting into FreeBSD full-time
* Lots of fun trivia and background about him
* Speaking of portmgr, our interview for today is... \*\*\*

Interview - Baptiste Daroussin - [bapt@freebsd.org](mailto:bapt@freebsd.org)
----------

The future of FreeBSD's [binary packages](http://www.bsdnow.tv/tutorials/pkgng), ports' features, various topics

---

News Roundup
----------

### [pfSense december hang out](https://www.youtube.com/watch?v=aD-2e9u3tug) ###

* Interview/presentation from pfSense developer Chris Buechler with an [accompanying blog post](http://blog.pfsense.org/?p=1146)
* "This is the first in what will be a monthly recurring series. Each month, we’ll have a how to tutorial on a specific topic or area of the system, and updates on development and other happenings with the project. We have several topics in mind, but also welcome community suggestions on topics"
* Speaking of pfSense, they recently opened an [online store](http://blog.pfsense.org/?p=1156)
* We're planning on having a pfSense episode next month! \*\*\*

### [BSDMag December issue is out](http://bsdmag.org/magazine/1854-carp-on-freebsd-how-to-use-devd-to-take-action-on-kernel-events) ###

* The free monthly BSD magazine gets a new release for December
* Topics include CARP on FreeBSD, more BSD programming, "unix basics for security professionals," some kernel introductions, using OpenBSD as a transparent proxy with relayd, GhostBSD overview and some stuff about SSH \*\*\*

### [OpenBSD gets tmpfs](http://undeadly.org/cgi?action=article&sid=20131217081921) ###

* In addition to the recently-added FUSE support, OpenBSD now has tmpfs
* To get more testing, it was enabled by default in -current
* Should make its way into 5.5 if everything goes according to plan
* Enables lots of new possibilities, like our [ccache and tmpfs guide](http://www.bsdnow.tv/tutorials/ccache) \*\*\*

### [PCBSD weekly digests](http://blog.pcbsd.org/2013/12/pc-bsd-weekly-feature-digest-122013/) ###

* Catching up with all the work going on in PCBSD land..
* [10.0-RC2 is now available](http://blog.pcbsd.org/2013/12/weekly-feature-digest-122713/)
* The big pkgng 1.2 problems seem to have been worked out \*\*\*

Feedback/Questions
----------

* [Remy writes in](http://slexy.org/view/s2UrUzlnf6)
* [Jason writes in](http://slexy.org/view/s2iqnywwKX)
* [Rob writes in](http://slexy.org/view/s2IUcPySbh)
* [John writes in](http://slexy.org/view/s21aYlbXz2)
* [Stuart writes in](http://slexy.org/view/s21vrYSqU8) \*\*\*