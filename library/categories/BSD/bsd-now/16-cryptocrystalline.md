+++
title = "16: Cryptocrystalline"
description = "This time on the show, we'll be showing you how to do a fully-encrypted installation of FreeBSD and OpenBSD. We also have an interview with Damien Miller - one of the lead developers of OpenSSH - about some recent crypto changes in the project. If you're into data security, today"
date = "2013-12-18T13:00:00Z"
url = "https://www.bsdnow.tv/16"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.282350643Z"
seen = true
+++

This time on the show, we'll be showing you how to do a fully-encrypted installation of FreeBSD and OpenBSD. We also have an interview with Damien Miller - one of the lead developers of OpenSSH - about some recent crypto changes in the project. If you're into data security, today's the show for you. The latest news and all your burning questions answered, right here on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage For Open Source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)

---

Headlines
----------

### [Secure communications with OpenBSD and OpenVPN](http://johnchapin.boostrot.net/blog/2013/12/07/secure-comms-with-openbsd-and-openvpn-part-1/) ###

* Starting off today's theme of encryption...
* A new blog series about combining OpenBSD and OpenVPN to secure your internet traffic
* Part 1 covers installing OpenBSD with full disk encryption (which we'll be doing later on in the show)
* Part 2 covers the initial setup of OpenVPN certificates and keys
* Parts 3 and 4 are the OpenVPN server and client configuration
* Part 5 is some updates and closing remarks \*\*\*

### [FreeBSD Foundation Newsletter](https://www.freebsdfoundation.org/press/2013Dec-newsletter) ###

* The December 2013 semi-annual newsletter was sent out from the foundation
* In the newsletter you will find the president's letter, articles on the current development projects they sponsor and reports from all the conferences and summits they sponsored
* The president's letter alone is worth the read, really amazing
* Really long, with lots of details and stories from the conferences and projects \*\*\*

### [Use of NetBSD with Marvell Kirkwood Processors](http://evertiq.com/design/33394) ###

* Article that gives a brief history of NetBSD and how to use it on an IP-Plug computer
* The IP-Plug is a "multi-functional mini-server was developed by Promwad engineers by the order of AK-Systems. It is designed for solving a wide range of tasks in IP networks and can perform the functions of a computer or a server. The IP-Plug is powered from a 220V network and has low power consumption, as well as a small size (which can be compared to the size of a mobile phone charger)."
* Really cool little NetBSD ARM project with lots of graphs, pictures and details \*\*\*

### [Experimenting with zero-copy network IO](http://adrianchadd.blogspot.com/2013/12/experimenting-with-zero-copy-network-io.html) ###

* Long blog post from Adrian Chadd about zero-copy network IO on FreeBSD
* Discusses the different OS' implementations and options
* He's able to get 35 gbit/sec out of 70,000 active TCP sockets, but isn't stopping there
* Tons of details, check the full post \*\*\*

Interview - Damien Miller - [djm@openbsd.org](mailto:djm@openbsd.org) / [@damienmiller](https://twitter.com/damienmiller)
----------

Cryptography in OpenBSD and OpenSSH

---

Tutorial
----------

### [Full disk encryption in FreeBSD & OpenBSD](http://www.bsdnow.tv/tutorials/fde) ###

---

News Roundup
----------

### [OpenZFS office hours](https://www.youtube.com/watch?v=wWmVW2R_uz8) ###

* Our buddy [George Wilson](http://www.bsdnow.tv/episodes/2013_12_04-zettabytes_for_days) sat down to take some ZFS questions from the community
* You can see more info about it [here](http://open-zfs.org/wiki/OpenZFS_Office_Hours) \*\*\*

### [License summaries in pkgng](http://www.shiningsilence.com/dbsdlog/2013/12/09/12934.html) ###

* A discussion between [Justin Sherill](http://www.bsdnow.tv/episodes/2013_11_13-the_gateway_drug) and some NYCBUG guys about license frameworks in pkgng
* Similar to pkgsrc's "ACCEPTABLE\_LICENSES" setting, pkgng could let the user decide which software licenses he wants to allow
* Maybe we could get a "pkg licenses" command to display the license of all installed packages
* Ok bapt, do it \*\*\*

### [The FreeBSD challenge continues](http://thelinuxcauldron.com/2013/12/08/freebsd-challenge/) ###

* Checking in with our buddy from the Linux foundation...
* The switching from Linux to FreeBSD blog series continues for his month-long trial
* Follow up from last week: "As a matter of fact, I did check out PC-BSD, and wanted the challenge. Call me addicted to pain and suffering, but the pride and accomplishment you feel from diving into FreeBSD is quite rewarding."
* Since we last mentioned it, he's decided to go from a VM to real hardware, got all of his common software installed, experimented with the Linux emulation, set up virtualbox, learned about slices/partitions/disk management, found BSD alternatives to his regularly-used commands and lots more \*\*\*

### [Ports gets a stable branch](https://svnweb.freebsd.org/ports?view=revision&revision=336615) ###

* For the first time ever, FreeBSD's ports tree will have a maintained "stable" branch
* This is similar to how pkgsrc does things, with a rolling release for updated software and stable branch for only security and big fixes
* All commits to this branch require approval of portmgr, looks like it'll start in 2014Q1 \*\*\*

Feedback/Questions
----------

* [John writes in](http://slexy.org/view/s2iRV1tOzB)
* [Spencer writes in](http://slexy.org/view/s21gAR5lgf)
* [Campbell writes in](http://slexy.org/view/s203iOnFh1)
* [Sha'ul writes in](http://slexy.org/view/s2yUqj3vKW)
* [Clint writes in](http://slexy.org/view/s2egcTPBXH) \*\*\*