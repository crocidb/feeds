+++
title = "36: Let's Get RAID"
description = "This week on the show we'll be showing you how to set up RAID arrays in both FreeBSD and OpenBSD. There's also an interview with David Chisnall - of the FreeBSD core team - about the switch to Clang and a lot more. As usual, we'll be dropping the latest news and answering your em"
date = "2014-05-07T12:00:00Z"
url = "https://www.bsdnow.tv/36"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.246972180Z"
seen = false
+++

This week on the show we'll be showing you how to set up RAID arrays in both FreeBSD and OpenBSD. There's also an interview with David Chisnall - of the FreeBSD core team - about the switch to Clang and a lot more. As usual, we'll be dropping the latest news and answering your emails, so sit back and enjoy some BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [OpenBSD 5.5 released](http://www.openbsd.org/55.html) ###

* If you [ordered](https://https.openbsd.org/cgi-bin/order) a [CD set](https://twitter.com/blakkheim/status/461909893813784576) then you've probably had it for a little while already, but OpenBSD has formally announced the [public release](http://undeadly.org/cgi?action=article&sid=20140501153339) of 5.5
* This is one of the biggest releases to date, with a very long list of changes and improvements
* Some of the highlights include: time\_t being 64 bit on all platforms, release sets and binary packages being signed with the new signify tool, a new autoinstall feature of the installer, SMP support on Alpha, a new AViiON port, lots of new hardware drivers including newer NICs, the new vxlan driver, relayd improvements, a new pf queue system for bandwidth shaping, dhcpd and dhclient fixes, OpenSMTPD 5.4.2 and all its new features, position-independent executables being default for i386, the RNG has been replaced with ChaCha20 as well as some other security improvements, FUSE support, tmpfs, softraid partitions larger than 2TB and a RAID 5 implementation, OpenSSH 6.6 with all its new features and fixes... and a lot more
* The [full list of changes](http://www.openbsd.org/plus55.html) is HUGE, be sure to read through it all if you're interested in the details
* If you're doing an upgrade from 5.4 instead of a fresh install, pay careful attention to [the upgrade guide](http://www.openbsd.org/faq/upgrade55.html) as there are some very specific steps for this version
* Also be sure to apply the [errata patches](http://www.openbsd.org/errata55.html) on your new installations... especially those OpenSSL ones (some of which [still aren't fixed](http://marc.info/?l=oss-security&m=139906348230995&w=2) in the other BSDs yet)
* On the topic of errata patches, the project is now going to also send them out ([signed](http://undeadly.org/cgi?action=article&sid=20140502103355)) via the [announce mailing list](http://lists.openbsd.org/cgi-bin/mj_wwwusr?user=&passw=&func=lists-long-full&extra=announce), a very welcome change
* Congrats to the whole team on this great release - 5.6 is going to be even more awesome with "Libre"SSL and lots of other stuff that's currently in development \*\*\*

### [FreeBSD foundation funding highlights](http://freebsdfoundation.blogspot.com/2014/04/freebsd-foundation-spring-fundraising_28.html) ###

* The FreeBSD foundation posts a new update on how they're spending the money that everyone donates
* "As we embark on our 15th year of serving the FreeBSD Project and community, we are proud of what we've done to help FreeBSD become the most innovative, reliable, and high-performance operation system"
* During this spring, they want to highlight the new UEFI boot support [and newcons](http://freebsdfoundation.blogspot.com/2014/05/freebsd-foundation-newcons-project.html)
* There's a lot of details about what exactly UEFI is and why we need it going forward
* FreeBSD has also needed some updates to its console to support UTF8 and wide characters
* Hopefully this series will continue and we'll get to see what other work is being sponsored \*\*\*

### [OpenSSH without OpenSSL](http://marc.info/?l=openbsd-cvs&m=139879453001957&w=2) ###

* The OpenSSH team has been hard at work, making it even better, and now OpenSSL is completely optional
* Since it won't have access to the primitives OpenSSL uses, there will be a trade-off of features vs. security
* This version will drop support for legacy SSH v1, and the only two cryptographic algorithms supported are an in-house implementation of AES in counter mode and the [new combination](http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/ssh/PROTOCOL.chacha20poly1305?rev=HEAD;content-type=text/plain) of the Chacha20 stream cipher with Poly1305 for packet integrity
* Key exchange is limited to elliptic curve Diffie-Hellman and the newer Curve25519 KEXs
* No support for RSA, DSA or ECDSA public keys - only Ed25519
* It also includes a [new buffer API](http://marc.info/?l=openbsd-cvs&m=139883582313750&w=2) and a set of wrappers to make it compatible with the existing API
* Believe it or not, this was planned before all the heartbleed craziness
* Maybe someday soon we'll have a mini-openssh-portable in FreeBSD ports and NetBSD pkgsrc, would be really neat \*\*\*

### [BSDMag's April 2014 issue is out](http://bsdmag.org/magazine/1861-free-pascal-on-bsd-april-bsd-issue) ###

* The free monthly BSD magazine has got a new issue available for download
* This time the articles include: pascal on BSD, an introduction to revision control systems and configuration management, deploying NetBSD on AWS EC2, more GIMP tutorials, an AsiaBSDCon 2014 report and a piece about how easily credit cards are stolen online
* Anyone can contribute to the magazine, just send the editors an email about what you want to write
* No Linux articles this time around, good \*\*\*

Interview - David Chisnall - [theraven@freebsd.org](mailto:theraven@freebsd.org)
----------

The LLVM/Clang switch, FreeBSD's core team, various topics

---

Tutorial
----------

### [RAID in FreeBSD and OpenBSD](http://www.bsdnow.tv/tutorials/raid) ###

---

News Roundup
----------

### [BSDTalk episode 240](http://bsdtalk.blogspot.com/2014/04/bsdtalk240-about-time-with-george.html) ###

* Our buddy Will Backman has uploaded a new episode of BSDTalk, this time with our other buddy GNN as the guest - mainly to talk about NTP and keeping reliable time
* Topics include the specific details of crystals used in watches and computers to keep time, how temperature affects the quality, different sources of inaccuracy, some general NTP information, why you might want extremely precise time, different time sources (GPS, satellite, etc), differences in stratum levels, the problem of packet delay and estimating the round trip time, some of the recent NTP amplification attacks, the downsides to using UDP instead of TCP and... much more
* GNN also talks a little about the [Precision Time Protocol](https://en.wikipedia.org/wiki/Precision_Time_Protocol) and how it's different than NTP
* Two [people](http://www.bsdnow.tv/episodes/2014_01_29-journaled_news_updates) we've [interviewed](http://www.bsdnow.tv/episodes/2014_03_05-bsd_now_vs_bsdtalk) talking to each other, awesome
* If you're interested in NTP, be sure to see our [tutorial](http://www.bsdnow.tv/tutorials/ntpd) too \*\*\*

### [m2k14 trip reports](http://undeadly.org/cgi?action=article&sid=20140502092427) ###

* We've got a few more reports from the recent OpenBSD hackathon in Morocco
* The first one is from Antoine Jacoutot (who is a key GNOME porter and gave us the screenshots for the [OpenBSD desktop tutorial](http://www.bsdnow.tv/tutorials/the-desktop-obsd))
* "Since I always fail at actually doing whatever I have planned for a hackathon, this time I decided to come to m2k14 unprepared about what I was going to do"
* He got lots of work done with ports and pushing GNOME-related patches back up to the main project, then worked on fixing ports' compatibility with LibreSSL
* Speaking of LibreSSL, there's [an article](http://undeadly.org/cgi?action=article&sid=20140505062023) all would-be portable version writers should probably read and take into consideration
* Jasper Adriaanse [also writes](http://undeadly.org/cgi?action=article&sid=20140501185019) about what he got done over there
* He cleaned up and fixed the puppet port to work better with OpenBSD \*\*\*

### [Why you should use FreeBSD on your cloud VPS](https://www.atlantic.net/blog/2014/04/08/freebsd-ssd-cloud-vps-hosting-10-reasons/) ###

* Here we have a blog post from Atlantic, a VPS and hosting provider, about 10 reasons for using FreeBSD
* Starts off with a little bit of BSD history for those who are unfamiliar with it and only know Linux and Windows
* The 10 reasons are: community, stability, collaboration, ease of use, ports, security, ZFS, GEOM, sound and having lots of options
* The post goes into detail about each of them and why FreeBSD makes a great choice for a VPS OS \*\*\*

### [PCBSD weekly digest](http://blog.pcbsd.org/2014/05/weekly-feature-digest-27-software-system-redesign/) ###

* Big changes coming in the way PCBSD manages software
* The PBI system, AppCafe and related tools are all going to use pkgng now
* The AppCafe will no longer be limited to PBIs, so much more software will be easily available from the ports tree
* New rating system coming soon and much more \*\*\*

Feedback/Questions
----------

* [Martin writes in](http://slexy.org/view/s21bk2oPuQ)
* [John writes in](http://slexy.org/view/s2n9fx1Rpw)
* [Alex writes in](http://slexy.org/view/s2rBBKLA4u)
* [Goetz writes in](http://slexy.org/view/s20JY6ZI71)
* [Jarrad writes in](http://slexy.org/view/s20YV5Ohpa) \*\*\*