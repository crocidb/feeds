+++
title = "58: Behind the Masq"
description = "Coming up this week on the show, we'll be talking to Matt Ranney and George Kola about how they use FreeBSD at Voxer, and how to get more companies to switch over. After that, we'll show you how to filter website ads at the gateway level, using DNSMasq. All this week's news and a"
date = "2014-10-08T12:00:00Z"
url = "https://www.bsdnow.tv/58"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.206561371Z"
seen = false
+++

Coming up this week on the show, we'll be talking to Matt Ranney and George Kola about how they use FreeBSD at Voxer, and how to get more companies to switch over. After that, we'll show you how to filter website ads at the gateway level, using DNSMasq. All this week's news and answers to your emails, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [NetBSD's EuroBSDCon report](https://blog.netbsd.org/tnf/entry/netbsd_developer_summit_at_eurobsdcon) ###

* This year's EuroBSDCon had the record number of NetBSD developers attending
* The NetBSD guys had a small devsummit as well, and this blog post details some of their activities
* Pierre Pronchery also talked about EdgeBSD there (also see [our interview](http://www.bsdnow.tv/episodes/2014_04_01-edgy_bsd_users) if you haven't already)
* Hopefully this trend continues, and NetBSD starts to have even more of a presence at the conferences \*\*\*

### [Upcoming features in OpenBSD 5.6](http://lteo.net/blog/2014/10/01/a-sneak-peek-at-the-upcoming-openbsd-5-dot-6-release/) ###

* OpenBSD 5.6 is to be released in just under a month from now, and one of the developers wrote a blog post about some of the new features
* The post is mostly a collection of various links, many of which we've discussed before
* It'll be the first version with LibreSSL and many other cool things
* We will, of course, have all the details on the day of release
* There are some good [comments](https://news.ycombinator.com/item?id=8413028) on hacker news about 5.6 as well \*\*\*

### [FreeBSD ARMv8-based implementation](http://www.prnewswire.com/news-releases/cavium-to-sponsor-freebsd-armv8-based-implementation-277724361.html) ###

* The FreeBSD foundation is sponsoring some work to port FreeBSD to the new ThunderX ARM CPU family
* With the potential to have up to 48 cores, this type of CPU might make ARM-based servers a more appealing option
* Cavium, the company involved with this deal, seems to have lots of BSD fans
* This collaboration is expected to result in Tier 1 recognition of the ARMv8 architecture \*\*\*

### [Updating orphaned OpenBSD ports](https://marc.info/?l=openbsd-ports&m=141235737615585&w=2) ###

* We discussed OpenBSD porting over portscout from FreeBSD a while back
* Their ports team is making full use of it now, and they're also looking for people to help update some unmaintained ports
* A new subdomain, [portroach.openbsd.org](http://portroach.openbsd.org/), will let you view all the ports information easily
* If you're interested in learning to port software, or just want to help update a port you use, this is a good chance to get involved \*\*\*

Interview - Matt Ranney & George Kola - [mjr@ranney.com](mailto:mjr@ranney.com) & [george.kola@voxer.com](mailto:george.kola@voxer.com)
----------

BSD at Voxer, companies switching from Linux, community interaction

---

Tutorial
----------

### [Adblocking with DNSMasq & Pixelserv](http://www.bsdnow.tv/tutorials/dnsmasq) ###

---

News Roundup
----------

### [GhostBSD 4.0 released](http://ghostbsd.org/4.0-release) ###

* The 4.0 branch of GhostBSD has finally been released, based on FreeBSD 10
* With it come all the big 10.0 changes: clang instead of gcc, pkgng by default, make replaced by bmake
* Mate is now the default desktop, with different workstation styles to choose from \*\*\*

### [Reports from PF about banned IPs](http://ypnose.org/blog/2014/newbrute-pf.html) ###

* If you run any kind of public-facing server, you've probably seen your logs fill up with unwanted traffic
* This is especially true if you run SSH on port 22, which the author of this post seems to
* A lot can be done with just PF and some brute force tables
* He goes through some different options for blocking Chinese IPs and break-in attempts
* It includes a useful script he wrote to get reports about the IPs being blocked via email \*\*\*

### [NetBSD 6.1.5 and 6.0.6 released](https://blog.netbsd.org/tnf/entry/netbsd_6_1_5_and) ###

* The 6.1 and 6.0 branches of NetBSD got some updates
* They include a number of security and stability fixes - plenty of OpenSSL mentions
* Various panics and other small bugs also got fixed \*\*\*

### [OpenSSH 6.7 released](https://lists.mindrot.org/pipermail/openssh-unix-announce/2014-October/000119.html) ###

* After a long delay, OpenSSH 6.7 has finally been released
* Major internal refactoring has been done to make part of OpenSSH usable as a library
* SFTP transfers can now be resumed
* Lots of bug fixes, a few more new features - check the release notes for all the details
* This release disables some insecure ciphers by default, so keep that in mind if you connect with legacy clients that use Arcfour or CBC modes \*\*\*

Feedback/Questions
----------

* [Andriy writes in](http://slexy.org/view/s218tT9C7v)
* [Karl writes in](http://slexy.org/view/s2WY5R5e0l)
* [Possnfiffer writes in](http://slexy.org/view/s20z8MPBVw)
* [Brad writes in](http://slexy.org/view/s21h2Yx5al)
* [Solomon writes in](http://slexy.org/view/s21xu9U0qt) \*\*\*