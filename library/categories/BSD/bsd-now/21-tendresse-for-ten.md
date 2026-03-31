+++
title = "21: Tendresse for Ten"
description = "This time on the show, we've got some great news for OpenBSD, as well as the scoop on FreeBSD 10.0-RELEASE - yes it's finally here! We're gonna talk to Colin Percival about running FreeBSD 10 on EC2 and lots of other interesting stuff. After that, we'll be showing you how to do s"
date = "2014-01-22T13:00:00Z"
url = "https://www.bsdnow.tv/21"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.273882360Z"
seen = true
+++

This time on the show, we've got some great news for OpenBSD, as well as the scoop on FreeBSD 10.0-RELEASE - yes it's finally here! We're gonna talk to Colin Percival about running FreeBSD 10 on EC2 and lots of other interesting stuff. After that, we'll be showing you how to do some bandwidth monitoring and network performance testing in a combo tutorial. We've got a round of your questions and the latest news, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage For Open Source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)

---

Headlines
----------

### [FreeBSD 10.0-RELEASE is out](https://www.freebsd.org/releases/10.0R/announce.html) ###

* The long awaited, giant release of FreeBSD is now official and [ready to be downloaded](http://ftp.freebsd.org/pub/FreeBSD/ISO-IMAGES-amd64/10.0/)
* One of the biggest releases in FreeBSD history, with tons of new updates
* Some features include: LDNS/Unbound replacing BIND, Clang by default (no GCC anymore), native Raspberry Pi support and other ARM improvements, bhyve, hyper-v support, AMD KMS, VirtIO, Xen PVHVM in GENERIC, lots of driver updates, ZFS on root in the installer, SMP patches to pf that drastically improve performance, Netmap support, pkgng by default, wireless stack improvements, a new iSCSI stack, FUSE in the base system... [the list goes on and on](https://www.freebsd.org/releases/10.0R/relnotes.html)
* Start up your freebsd-update or do a source-based upgrade \*\*\*

### [OpenSSH 6.5 CFT](https://lists.mindrot.org/pipermail/openssh-unix-dev/2014-January/031987.html) ###

* Our buddy [Damien Miller](http://www.bsdnow.tv/episodes/2013_12_18-cryptocrystalline) announced a Call For Testing for OpenSSH 6.5
* Huge, huge release, focused on new features rather than bugfixes (but it includes those too)
* New ciphers, new key formats, new config options, see the mailing list for all the details
* Should be in OpenBSD 5.5 in May, look forward to it - but also help test on other platforms! \*\*\*

### [DIY NAS story, FreeNAS 9.2.1-BETA](http://blog.brianmoses.net/2014/01/diy-nas-2014-edition.html) ###

* Another new blog post about FreeNAS!
* Instead of updating the older tutorials, the author started fresh and wrote a new one for 2014
* "I did briefly consider suggesting nas4free for the EconoNAS blog, since it’s essentially a fork off the FreeNAS tree but may run better on slower hardware, but ultimately I couldn’t recommend anything other than FreeNAS"
* Really long article with lots of nice details about his setup, why you might want a NAS, etc.
* Speaking of FreeNAS, they released [9.2.1-BETA](http://www.freenas.org/whats-new/2014/01/freenas-9-2-1-beta-now-ready-for-download.html) with lots of bugfixes \*\*\*

### [OpenBSD needed funding for electricity.. and they got it](https://news.ycombinator.com/item?id=7069889) ###

* Briefly mentioned at the end of last week's show, but has blown up over the internet since
* OpenBSD in the headlines of major tech news sites: slashdot, zdnet, the register, hacker news, reddit, twitter.. thousands of comments
* They needed about $20,000 to cover electric costs for the [server rack in Theo's basement](http://www.openbsd.org/images/rack2009.jpg)
* Lots of positive reaction from the community helping out so far, and it appears they have [reached their goal](http://www.openbsdfoundation.org/campaign2104.html) and got $100,000 in donations
* From Bob Beck: "we have in one week gone from being in a dire situation to having a commitment of approximately $100,000 in donations to the foundation"
* This is a shining example of the BSD community coming together, and even the Linux people realizing how critical BSD is to the world at large \*\*\*

Interview - Colin Percival - [cperciva@freebsd.org](mailto:cperciva@freebsd.org) / [@cperciva](https://twitter.com/cperciva)
----------

FreeBSD [on Amazon EC2](http://www.daemonology.net/freebsd-on-ec2/), backups with [Tarsnap](https://www.tarsnap.com/), 10.0-RELEASE, various topics

---

Tutorial
----------

### [Bandwidth monitoring and testing](http://www.bsdnow.tv/tutorials/vnstat-iperf) ###

---

News Roundup
----------

### [pfSense talk at Tokyo FreeBSD Benkyoukai](https://blog.pfsense.org/?p=1176) ###

* Isaac Levy will be presenting "pfSense Practical Experiences: from home routers, to High-Availability Datacenter Deployments"
* He's also going to be looking for help to translate the pfSense documentation into Japanese
* The event is on February 17, 2014 if you're in the Tokyo area \*\*\*

### [m0n0wall 1.8.1 released](http://m0n0.ch/wall/downloads.php) ###

* For those who don't know, m0n0wall is an older BSD-based firewall OS that's mostly focused on embedded applications
* pfSense was forked from it in 2004, and has a lot more active development now
* They switched to FreeBSD 8.4 for this new version
* Full list of updates in the changelog
* This version requires at least 128MB RAM and a disk/CF size of 32MB or more, oh no! \*\*\*

### [Ansible and PF, plus NTP](http://blather.michaelwlucas.com/archives/1933) ###

* Another blog post from our buddy [Michael Lucas](http://www.bsdnow.tv/episodes/2013_11_06-year_of_the_bsd_desktop)
* There've been some NTP amplification attacks [recently](https://www.freebsd.org/security/advisories/FreeBSD-SA-14:02.ntpd.asc) in the news
* The post describes how he configured ntpd on a lot of servers without a lot of work
* He leverages pf and ansible for the configuration
* OpenNTPD is, not surprisingly, unaffected - use it \*\*\*

### [ruBSD videos online](http://undeadly.org/cgi?action=article&sid=20140115054839) ###

* Just a quick followup from a few weeks ago
* Theo and Henning's talks from ruBSD are now available for download
* There's also a nice interview with Theo \*\*\*

### [PCBSD weekly digest](http://blog.pcbsd.org/2014/01/pc-bsd-weekly-feature-digest-5/) ###

* 10.0-RC4 images are available
* Wine PBI is now available for 10
* 9.2 systems will now be able to upgrade to version 10 and keep their PBI library \*\*\*

Feedback/Questions
----------

* [Sha'ul writes in](http://slexy.org/view/s2WQXwMASZ)
* [Kjell-Aleksander writes in](http://slexy.org/view/s2H0FURAtZ)
* [Mike writes in](http://slexy.org/view/s21eKKPgqh)
* [Charlie writes in (and gets a reply)](http://slexy.org/view/s21UMLnV0G)
* [Kevin writes in](http://slexy.org/view/s2SuazcfoR) \*\*\*