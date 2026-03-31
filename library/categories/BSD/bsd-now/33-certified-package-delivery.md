+++
title = "33: Certified Package Delivery"
description = "This week, we sit down with Jim Brown from the BSD Certification group to talk about the BSD exams. Following that, we'll be showing you how to build OpenBSD binary packages in bulk, a la poudriere. There's a boatload of news and we've got answers to your questions, coming up on "
date = "2014-04-16T12:00:00Z"
url = "https://www.bsdnow.tv/33"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.252253776Z"
seen = true
+++

This week, we sit down with Jim Brown from the BSD Certification group to talk about the BSD exams. Following that, we'll be showing you how to build OpenBSD binary packages in bulk, a la poudriere. There's a boatload of news and we've got answers to your questions, coming up on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage For Open Source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)

---

Headlines
----------

### [BSDCan schedule, speakers and talks](https://www.bsdcan.org/2014/schedule/) ###

* This year's BSDCan will kick off on May 14th in Ottawa
* The [list of speakers](https://www.bsdcan.org/2014/schedule/speakers.en.html) is also out
* And finally [the talks](https://www.bsdcan.org/2014/schedule/events.en.html) everyone's looking forward to
* Lots of great tutorials and talks, spanning a wide range of topics of interest
* Be sure to come by so you can and meet Allan and Kris in person [and get BSDCan shirts](https://twitter.com/bsdcan/status/454990067552247808) \*\*\*

### [NYCBSDCon talks uploaded](https://www.youtube.com/watch?v=4bPduH6O7lI) ###

* The BSD TV YouTube channel has been uploading recordings from the 2014 NYCBSDCon
* Jeff Rizzo's talk, "Releasing NetBSD: So Many Targets, So Little Time"
* [Dru Lavigne's talk](https://www.youtube.com/watch?v=DAmZ3cbfigA), "ZFS Management Tools in FreeNAS and PC-BSD"
* [Scott Long's talk](https://www.youtube.com/watch?v=FL5U4wr86L4), "Serving one third of the Internet via FreeBSD"
* [Michael W. Lucas' talk](https://www.youtube.com/watch?v=buo5JlMnGPI), "BSD Breaking Barriers" \*\*\*

### [FreeBSD Journal, issue 2](http://freebsdfoundation.blogspot.com/2014/04/freebsd-journal-issue-2-is-now-available.html) ###

* The bi-monthly FreeBSD journal's second issue is out
* Topics in this issue include pkg, poudriere, the PBI format, hwpmc and journaled soft-updates
* In less than two months, they've already gotten over 1000 subscribers! It's available on Google Play, iTunes, Amazon, etc
* "We are also working on a dynamic version of the magazine that can be read in many web browsers, including those that run on FreeBSD"
* Check [our interview with GNN](http://www.bsdnow.tv/episodes/2014_01_29-journaled_news_updates) for more information about the journal \*\*\*

### [OpenSSL, more like OpenSS-Hell](http://bsd.slashdot.org/story/200567) ###

* We mentioned this huge OpenSSL bug last week during all the chaos, but the aftermath is just as messy
* There's been a pretty vicious response from security experts all across the internet and in all of the BSD projects - and rightfully so
* We finally have [a timeline of events](http://www.smh.com.au/it-pro/security-it/heartbleed-disclosure-timeline-who-knew-what-and-when-20140414-zqurk.html)
* Reactions from [ISC](https://isc.sans.edu/diary/Testing+for+Heartbleed/17933), [PCBSD](http://blog.pcbsd.org/2014/04/openssl-security-update/), [Tarsnap](http://www.daemonology.net/blog/2014-04-09-tarsnap-no-heartbleed-here.html), the [Tor](https://lists.torproject.org/pipermail/tor-talk/2014-April/thread.html) [project](https://lists.torproject.org/pipermail/tor-relays/2014-April/thread.html), [FreeBSD](https://lists.freebsd.org/pipermail/freebsd-security/2014-April/thread.html), [NetBSD](http://ftp.netbsd.org/pub/NetBSD/security/advisories/NetBSD-SA2014-004.txt.asc), [oss-sec](http://seclists.org/oss-sec/2014/q2/index.html), [PHK](https://queue.acm.org/detail.cfm?id=2602816), [Varnish](https://www.varnish-cache.org/docs/trunk/phk/dough.html) and [Akamai](https://blogs.akamai.com/2014/04/heartbleed-update.html)
* [pfSense](http://www.bsdnow.tv/episodes/2014_02_19-a_sixth_pfsense) released [a new version to fix it](https://blog.pfsense.org/?p=1253)
* OpenBSD [disabled heartbeat entirely](http://marc.info/?l=openbsd-cvs&m=139715336230455&w=2) and is very [unforgiving of the IETF](https://news.ycombinator.com/item?id=7568921)
* [Ted Unangst](http://www.bsdnow.tv/episodes/2014_02_05-time_signatures) has two [good](http://www.tedunangst.com/flak/post/heartbleed-vs-mallocconf) [write-ups](http://www.tedunangst.com/flak/post/analysis-of-openssl-freelist-reuse) about the issue and how horrible the OpenSSL codebase is
* A nice quote from one of the OpenBSD lists: "Given how trivial one-liner fixes such as #2569 have remained unfixed for 2.5+ years, one can only assume that OpenSSL's bug tracker is only used to park bugs, not fix them"
* Sounds like [someone else](http://www.bloomberg.com/news/2014-04-11/nsa-said-to-have-used-heartbleed-bug-exposing-consumers.html) was having fun with the bug for a while too
* **There's also another OpenSSL bug** that [OpenBSD patched](http://marc.info/?l=openbsd-cvs&m=139732441810737&w=2) - it allows an attacker to **inject data from one connection into another**
* OpenBSD has also imported the most current version of OpenSSL and are ripping it apart from the inside out - we're [seeing a fork](http://undeadly.org/cgi?action=article&sid=20140415093252) in real time \*\*\*

Interview - Jim Brown - [info@bsdcertification.org](mailto:info@bsdcertification.org)
----------

The [BSD Certification](http://bsdcertification.org/) exams

---

Tutorial
----------

### [Building OpenBSD binary packages in bulk](http://www.bsdnow.tv/tutorials/dpb) ###

---

News Roundup
----------

### [Portable signify](https://github.com/aperezdc/signify) ###

* Back in [episode 23](http://www.bsdnow.tv/episodes/2014_02_05-time_signatures) we talked with Ted Unangst about the new "signify" tool in OpenBSD
* Now there's a (completely unofficial) portable version of it on github
* If you want to verify your OpenBSD sets ahead of time on another OS, this tool should let you do it
* Maybe other BSD projects can adopt it as a replacement for gpg and incorporate it into their base systems \*\*\*

### [Foundation goals and updates](https://www.mail-archive.com/misc@openbsd.org/msg128240.html) ###

* The OpenBSD foundation has reached their 2014 goal of $150,000
* You can check [their activities and goals](http://www.openbsdfoundation.org/activities.html) to see where the money is going
* Remember that funding also goes to OpenSSH, which EVERY system uses and relies on everyday to protect their data
* The FreeBSD foundation has kicked off their [spring fundraising](http://freebsdfoundation.blogspot.com/2014/04/freebsd-foundation-spring-fundraising.html) campaign
* There's also a list of their activities and goals available to read through
* Be sure to support your favorite BSD, whichever one, so they can continue to make and improve great software that powers the whole internet \*\*\*

### [PCBSD weekly digest](http://blog.pcbsd.org/2014/04/pc-bsd-weekly-feature-digest-25/) ###

* New PBI runtime that fixes stability issues and decreases load times
* "Update Center" is getting a lot of development and improvements
* Lots of misc. bug fixes and updates \*\*\*

Feedback/Questions
----------

* [There's a reddit thread](http://www.reddit.com/r/BSD/comments/22y497/i_need_a_bit_of_help_showing_my_friends_bsd_and/) we wanted to highlight - a user wants to show his friend BSD and why it's great
* [Brad writes in](http://slexy.org/view/s20Tso9a6v)
* [Sha'ul writes in](http://slexy.org/view/s21DfdV9yt)
* [iGibbs writes in](http://slexy.org/view/s2di8XRt73)
* [Matt writes in](http://slexy.org/view/s20m2g8UgV) \*\*\*