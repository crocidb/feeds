+++
title = "112: Tracing the source"
description = 'This week Allan is away at a ZFS conference, so it seemsThis episode was brought to you by src="/images/1.png" alt="iXsystems - Enterprise    Servers and Storage for Open Source" /\[ href="http://www.digitalocean.com/" title="Dig'
date = "2015-10-21T12:00:00Z"
url = "https://www.bsdnow.tv/112"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.095427536Z"
seen = true
+++

This week Allan is away at a ZFS conference, so it seems

This episode was brought to you by
----------

[![]() src="/images/1.png" alt="iXsystems - Enterprise   
 Servers and Storage for Open Source" /\>](http://www.ixsystems.com/bsdnow)[ href="http://www.digitalocean.com/" title="DigitalOcean"\>![]() src="/images/2.png" alt="DigitalOcean - Simple Cloud   
 Hosting, Built for Developers" /\>]()[ href="http://www.tarsnap.com/bsdnow" title="Tarsnap"\>![]() src="/images/3.png" alt="Tarsnap - Online Backups   
 for the Truly Paranoid" /\>]()

---

Headlines
----------

### [pfsense - 2.3 alpha snapshots available](https://blog.pfsense.org/?p=1854) ###

* [pfsense 2.3 Features and Changes](https://doc.pfsense.org/index.php/2.3_New_Features_and_Changes)
* The entire front end has been re-written
* Upgrade of base OS to FreeBSD 10-STABLE
* The PPTP server component has been removed,
* PBIs have been replaced with pkg
* PHP upgraded to 5.6
* The web interface has been converted to Bootstrap \*\*\*

### [BSDMag October 2015 out](http://bsdmag.org/download/bsd-09-2015/) ###

* A Look at the New PC-BSD 10.2 - Kris Moore
* Basis Of The Lumina Desktop Environment 18 - Ken Moore
* A Secure Webserver on FreeBSD with Hiawatha - David Carlier
* Defeating CryptoLocker Attacks with ZFS - Michael Dexter
* Emerging Technology Has Increasingly Been a Force for Both Good and Evil - Rob Somerville
* Interviews with: Dru Lavigne, Luca Ferrari, Oleksandr Rybalko \*\*\*

### [OpnSense 15.7.14 Released](https://opnsense.org/opnsense-15-7-14-released/) ###

* Another update to OpnSense has landed!
* Some of the notable takeaways this time are that it isn’t a security update
* Major rework of the firewall rules sections including, rules, schedules, virtual ip, nat and aliases pages
* Latest BIND and Squid packages
* Improved configuration management, including fixes to importing an old config file. New location for configuration history / backups. \*\*\*

### [OpenBSD in Toyota Highlander](http://marc.info/?l=openbsd-misc&m=144327954931983&w=2) ###

* [Images](http://imgur.com/a/SMVdp)
* While looking through the ‘Software Information’ screen of a Toyota Highlander, Chad Dougherty of the ACM found a bunch of OpenBSD copyright notices
* At least one of which I recognize as OpenCrypto, because of the comment about “transforms”
* It is likely that the vehicle is running QNX, which contains various bits of BSD
* [QNX: Third Party License Terms List version 2.17](http://support7.qnx.com/download/download/25111/TPLTL.v2.17.Jul23-13.pdf)
* Some highlights
  * Robert N. M. Watson (FreeBSD)
  * TrustedBSD Project (FreeBSD)
  * NetBSD Foundation
  * NASA Ames Research Center (NetBSD)
  * Damien Miller (OpenBSD)
  * Theo de Raadt (OpenBSD)
  * Sony Computer Science Laboratories Inc.
  * Bob Beck (OpenBSD)
  * Christos Zoulas (NetBSD)
  * Markus Friedl (OpenBSD)
  * Henning Brauer (OpenBSD)
  * Network Associates Technology, Inc. (FreeBSD)
  * 100s of others

* OpenSSH seems to be included
* It also seems to contain tcpdump for some reason

---

Interview - Adam Leventhal -
----------

[adam.leventhal@delphix.com](mailto:adam.leventhal@delphix.com) /   
[@ahl](https://twitter.com/ahl)  
 ZFS and DTrace

---

### Beastie-Bits ###

[isboot, an iSCSI boot driver for FreeBSD 9 and 10](https://lists.freebsd.org/pipermail/freebsd-current/2015-September/057572.html)

[tame() is now called pledge() ](http://marc.info/?l=openbsd-tech&m=144469071208559&w=2)  
[Interview with NetBSD developer Leoardo   
 Taccari](http://beastie.pl/deweloperzy-netbsd-7-0-leonardo-taccari/)

[Fuguita releases LiveCD based on OpenBSD 5.8](http://fuguita.org/index.php?FuguIta)

[Dtrace toolkit gets an update and imported into NetBSD](http://mail-index.netbsd.org/source-changes/2015/09/30/msg069173.html)

[An older article about how to do failover / load-balancing in pfsense](http://www.tecmint.com/how-to-setup-failover-and-load-balancing-in-pfsense/)

---

Feedback/Questions
----------

* [ Michael writes in](http://slexy.org/view/s217HyOZ9U)
* [ Possniffer writes in](http://slexy.org/view/s2YODjppwX)
* [ Erno writes in](http://slexy.org/view/s21xltQ6jd) \*\*\*