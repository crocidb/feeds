+++
title = "3: MX with TTX"
description = "We follow up last week's poudriere tutorial with a segment about using pkgng, we talk with the developers of OpenSMTPD about running a mail server OpenBSD-style, answer YOUR questions and, of course, discuss all the latest news. All that and more on BSD Now! The place to B... SD."
date = "2013-09-18T12:00:00Z"
url = "https://www.bsdnow.tv/3"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.305793935Z"
seen = false
+++

We follow up last week's poudriere tutorial with a segment about using pkgng, we talk with the developers of OpenSMTPD about running a mail server OpenBSD-style, answer YOUR questions and, of course, discuss all the latest news. All that and more on BSD Now! The place to B... SD.

Headlines
----------

### [pfSense 2.1-RELEASE is out](http://blog.pfsense.org/?p=712) ###

* Now based on FreeBSD 8.3
* Lots of IPv6 features added
* Security updates, bug fixes, driver updates
* PBI package support
* Way too many updates to list, see [the full list](https://doc.pfsense.org/index.php/2.1_New_Features_and_Changes) \*\*\*

### [New kernel based iSCSI stack comes to FreeBSD](https://lists.freebsd.org/pipermail/freebsd-current/2013-September/044237.html) ###

* Brief explanation of iSCSI
* This work replaces the older userland iscsi target daemon and improves the in-kernel iscsi initiator
* Target layer consists of:
* ctld(8), a userspace daemon responsible for handling configuration, listening for incoming connections, etc, then handing off connections to the kernel after the iSCSI Login phase
* iSCSI frontend to CAM Target Layer, which handles Full Feature phase.
* The work is being sponsored by FreeBSD Foundation
* Commit [here](http://freshbsd.org/commit/freebsd/r255570) \*\*\*

### [MTier creates openup utility for OpenBSD](http://www.mtier.org/index.php/solutions/apps/openup/) ###

* MTier provides a number of things for the OpenBSD community
* For example, regularly updated (for security) stable packages from their custom repo
* openup is a utility to easily check for security updates in both base and packages
* It uses the regular pkg tools, nothing custom-made
* Can be run from cron, but only emails the admin instead of automatically updating \*\*\*

### [OpenSSH in FreeBSD -CURRENT supports DNSSEC](https://lists.freebsd.org/pipermail/freebsd-security/2013-September/007180.html) ###

* OpenSSH in base is now compiled with DNSSEC support
* In this case the default setting for ‘VerifyHostKeyDNS' is yes
* OpenSSH will silently trust DNSSEC-signed SSHFP records
* It is the secteam's opinion that this is better than teaching users to blindly hit “yes” each time they encounter a new key \*\*\*

Interview - Gilles Chehade & Eric Faurot - [gilles@poolp.org](mailto:gilles@poolp.org) / [@poolpOrg](https://twitter.com/poolpOrg) & [eric@openbsd.org](mailto:eric@openbsd.org) / [@opensmtpd](https://twitter.com/opensmtpd)
----------

OpenSMTPD

---

Tutorial
----------

### [Binary packages with pkgng](http://www.bsdnow.tv/tutorials/pkgng) ###

---

News Roundup
----------

### [New progress with Newcons](http://raybsd.blogspot.com/2013/08/newcons-beginning.html) ###

* Newcons is a replacement console driver for FreeBSD
* Supports unicode, better graphics modes and bigger fonts
* Progress is being made, but it's not finished yet \*\*\*

### [relayd gets PFS support](http://freshbsd.org/commit/openbsd/7e7bd0a7f61ea0005b5c2f763364ff8dfce03fe2) ###

* relayd is a load balancer for OpenBSD which does protocol layers 3, 4, and 7
* Currently being ported to FreeBSD. There is [a WIP port](https://www.freshports.org/net/relayd/)
* Works by negotiating ECDHE (Elliptic curve Diffie-Hellman) between the remote site and relayd to enable TLS/SSL Perfect Forward Secrecy, even when the client does not support it \*\*\*

### [OpenZFS Launches](http://open-zfs.org/wiki/Main_Page) ###

* [Slides from LinuxCon ](http://www.slideshare.net/MatthewAhrens/open-zfs-linuxcon)
* Will feature ‘Office Hours' (Ask an Expert)
* Goal is to reduce the differences between various open source implementations of ZFS, both user facing and pure lines of code \*\*\*

### [FreeBSD 10-CURRENT becomes 10.0-ALPHA](http://freshbsd.org/commit/freebsd/r255489) ###

* Glen Barber tagged the -CURRENT branch as 10.0-ALPHA
* In preparation for 10.0-RELEASE, ALPHA2 as of 9/16
* Everyone was rushing to get their big commits in before 10-STABLE, which will be branched soon
* [10 is gonna be HUGE](https://wiki.freebsd.org/WhatsNew/FreeBSD10) \*\*\*

### [September issue of BSD Mag](http://bsdmag.org/magazine/1848-day-to-day-bsd-administration) ###

* BSD Mag is a monthly online magazine about the BSDs
* This month's issue has some content written by Kris
* Topics include MidnightBSD live cds, server maintenance, turning a Mac Mini into a wireless access point with OpenBSD, server monitoring, FreeBSD programming, PEFS encryption and a brief introduction to ZFS \*\*\*

### The FreeBSD IRC channel is official ###

* For many years, the FreeBSD freenode channel has been “unofficial” with a double-hash prefix
* Finally it has freenode's blessing and looks like a normal channel!
* The old one will forward to the new one, so your IRC clients don't need updating \*\*\*

### [OpenSSH 6.3 released](https://lists.mindrot.org/pipermail/openssh-unix-dev/2013-September/031638.html) ###

* After a big delay, Damien Miller announced the release of 6.3
* Mostly a bugfix release, with a few new features
* Of note, SFTP now supports resuming failed downloads via -a \*\*\*

Feedback/Questions
----------

* [James writes in]([http://slexy.org/view/s2wBbbSWGz](http://slexy.org/view/s2wBbbSWGz)]
* [Elias writes in]([http://slexy.org/view/s2LMDF3PYx](http://slexy.org/view/s2LMDF3PYx)]
* [Gabor writes in]([http://slexy.org/view/s2aCodo65X](http://slexy.org/view/s2aCodo65X)]
* Possibly the coolest feedback we've gotten thus far: Baptiste Daroussin, leader of the FreeBSD ports management team and author of poudriere and pkgng, has put up the BSD Now poudriere tutorial on the official documentation! \*\*\*