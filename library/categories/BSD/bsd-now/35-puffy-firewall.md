+++
title = "35: Puffy Firewall"
description = """We're back again! On this week's packed show, we've got one of the biggest tutorials we've done in a while. It's an in-depth look at PF, OpenBSD's firewall, with some practical examples and different use cases. We'll also be talking to Peter Hansteen about the new edition of "The"""
date = "2014-04-30T12:00:00Z"
url = "https://www.bsdnow.tv/35"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.248921789Z"
seen = true
+++

We're back again! On this week's packed show, we've got one of the biggest tutorials we've done in a while. It's an in-depth look at PF, OpenBSD's firewall, with some practical examples and different use cases. We'll also be talking to Peter Hansteen about the new edition of "The Book of PF." Of course, we've got news and answers to your emails too, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage For Open Source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)

---

Headlines
----------

### [ALTQ removed from PF](http://undeadly.org/cgi?action=article&sid=20140419151959) ###

* Kicking off our big PF episode...
* The classic packet queueing system, ALTQ, was recently removed from OpenBSD -current
* There will be a transitional phase between 5.5 and 5.6 where you can still use it by replacing the "queue" keyword with "oldqueue" in your pf.conf
* As of 5.6, due about six months from now, you'll have to change your ruleset to the new syntax if you're using it for bandwidth shaping
* After more than ten years, bandwidth queueing has matured quite a bit and we can finally put ALTQ to rest, in favor of the new queueing subsystem
* This doesn't affect FreeBSD, PCBSD, NetBSD or DragonflyBSD since all of their PFs are older and maintained separately. \*\*\*

### [FreeBSD Quarterly Status Report](https://www.freebsd.org/news/status/report-2014-01-2014-03.html) ###

* The quarterly status report from FreeBSD is out, detailing some of the project's ongoing tasks
* Some highlights include the first "stable" branch of ports, ARM improvements (including SMP), bhyve improvements, more work on the test suite, desktop improvements including the new vt console driver and UEFI booting support finally being added
* We've got some specific updates from the cluster admin team, core team, documentation team, portmgr team, email team and release engineering team
* LOTS of details and LOTS of topics to cover, give it a read \*\*\*

### [OpenBSD's OpenSSL rewrite continues with m2k14](http://undeadly.org/cgi?action=article&sid=20140417184158) ###

* A mini OpenBSD [hackathon](http://www.openbsd.org/hackathons.html) begins in Morocco, Africa
* You can follow the changes in [the -current CVS log](http://www.openbsd.org/cgi-bin/cvsweb/src/lib/libssl/src/ssl/), but [a lot of work](http://undeadly.org/cgi?action=article&sid=20140418063443) is mainly going towards the OpenSSL cleaning
* We've got two [trip](http://undeadly.org/cgi?action=article&sid=20140429121423) [reports](http://undeadly.org/cgi?action=article&sid=20140425115340) so far, hopefully we'll have some more to show you in a future episode
* You can see some of the [more interesting quotes](http://opensslrampage.org/) from the tear-down or [see everything](http://freshbsd.org/commit/openbsd/e5136d69ece4682e6167c8f4a8122270236898bf)
* [Apparently](http://undeadly.org/cgi?action=article&sid=20140423045847) they are going to call the fork "[LibreSSL](https://news.ycombinator.com/item?id=7623789)" ....
* [What were the OpenSSL developers thinking](http://freshbsd.org/commit/openbsd/e5136d69ece4682e6167c8f4a8122270236898bf)? The RSA private key was used to seed the entropy!
* We also got [some mainstream news coverage](http://www.zdnet.com/openbsd-forks-prunes-fixes-openssl-7000028613/) and [another post from Ted](http://www.tedunangst.com/flak/post/origins-of-libressl) about the history of the fork
* Definitely consider [donating to the OpenBSD foundation](http://www.openbsdfoundation.org/donations.html), this fork will benefit all the other BSDs too \*\*\*

### [NetBSD 6.1.4 and 6.0.5 released](https://blog.netbsd.org/tnf/entry/netbsd_6_1_4_and) ###

* New updates for the 6.1 and 6.0 branches of NetBSD, focusing on bugfixes
* The main update is - of course - the heartbleed vulnerability
* Also includes fixes for other security issues and even a kernel panic... on Atari
* Patch your Ataris right now, this is serious business \*\*\*

Interview - Peter Hansteen - [peter@bsdly.net](mailto:peter@bsdly.net) / [@pitrh](https://twitter.com/pitrh)
----------

The Book of PF: 3rd edition

---

Tutorial
----------

### [BSD Firewalls: PF](http://www.bsdnow.tv/tutorials/pf) ###

---

News Roundup
----------

### [New Xorg now the default in FreeBSD](https://svnweb.freebsd.org/ports?view=revision&revision=351411) ###

* For quite a while now, FreeBSD has had two versions of X11 in ports
* The older, stable version was the default, but you could install a newer one by having "WITH\_NEW\_XORG" in /etc/make.conf
* They've finally made the switch for 10-STABLE and 9-STABLE
* Check [this wiki page](https://wiki.freebsd.org/Graphics) for more info \*\*\*

### [GSoC-accepted BSD projects](https://www.google-melange.com/gsoc/org2/google/gsoc2014/openbsdfoundation) ###

* The Google Summer of Code team has got the list of accepted project proposals uploaded so we can see what's planned
* OpenBSD's list includes DHCP configuration parsing improvements, systemd replacements, porting capsicum, GPT and UEFI support, and modernizing the DHCP daemon
* The [FreeBSD list](https://www.google-melange.com/gsoc/org2/google/gsoc2014/freebsd) was also posted
* Theirs includes porting FreeBSD to the Android emulator, CTF in the kernel debugger, improved unicode support, converting firewall rules to a C module, pkgng improvements, MicroBlaze support, PXE fixes, bhyve caching, bootsplash and lots more
* Good luck to all the students participating, hopefully they become full time BSD users \*\*\*

### [Complexity of FreeBSD VFS using ZFS as an example](http://www.hybridcluster.com/blog/complexity-freebsd-vfs-using-zfs-example-part-2/) ###

* HybridCluster posted the second part of their VFS and ZFS series
* This new post has lots of technical details once again, definitely worth reading if you're a ZFS guy
* Of course, also watch [episode 24](http://www.bsdnow.tv/episodes/2014_02_12-the_cluster_the_cloud) for our interview with HybridCluster - they do really interesting stuff \*\*\*

### [PCBSD weekly digest](http://blog.pcbsd.org/2014/04/weekly-feature-digest-26-the-lumina-project-and-preload/) ###

* Preload has been ported over, it's a daemon that prefetches applications
* PCBSD is developing their own desktop environment, Lumina ([there's also an FAQ](http://blog.pcbsd.org/2014/04/quick-lumina-desktop-faq/))
* It's still in active development, but you can try it out by installing from ports
* We'll be showing a live demo of it in a few weeks (when development settles down a bit)
* Some kid in Australia [subjects his poor mother to being on camera](https://www.youtube.com/watch?v=ETxhbf3-z18) while she tries out PCBSD and gives her impressions of it \*\*\*