+++
title = "31: Edgy BSD Users"
description = "This week we'll be talking to Richard Stallman about the upcoming GPLv4 and how it will protect our software from being stolen. After that, we'll show you how to recover from those pesky ZFS on Linux corruption issues, as well as some tips on how to explain to your boss that all "
date = "2014-04-01T12:00:00Z"
url = "https://www.bsdnow.tv/31"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.255953883Z"
seen = true
+++

This week we'll be talking to Richard Stallman about the upcoming GPLv4 and how it will protect our software from being stolen. After that, we'll show you how to recover from those pesky ZFS on Linux corruption issues, as well as some tips on how to explain to your boss that all the production boxes were compromised. Your questions and all the latest GNUs, on Linux Now - the place to Lin.. ux.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage For Open Source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)

---

Headlines
----------

### [Preorders for cool BSD stuff](http://www.amazon.com/gp/aw/d/0321968972/) ###

* The 2nd edition of The Design and Implementation of the FreeBSD Operating System is up for preorder
* We [talked to GNN](http://www.bsdnow.tv/episodes/2014_01_29-journaled_news_updates) briefly about it, but he and [Kirk](http://www.bsdnow.tv/episodes/2013-10-02_stacks_of_cache) have apparently finally finished the book
* "For many years, The Design and Implementation of the FreeBSD Operating System has been recognized as the most complete, up-to-date, and authoritative technical guide to FreeBSD's internal structure. Now, this definitive guide has been extensively updated to reflect all major FreeBSD improvements between Versions 5 and Versions 11"
* [OpenBSD 5.5 preorders](https://https.openbsd.org/cgi-bin/order) are also up, so you can buy a CD set now
* You can help support the project, and even get the -release of the OS before it's available publicly
* 5.5 is a huge release with lots of big changes, so now is the right time to purchase one of these - tell Austin we sent you! \*\*\*

### [pkgsrcCon 2014 CFP](http://mail-index.netbsd.org/pkgsrc-users/2014/03/18/msg019424.html) ###

* This year's pkgsrcCon is in London, on June 21st and 22nd
* There's a Call For Papers out now, so you can submit your talks
* Anything related to pkgsrc is fine, it's pretty informal
* Does anyone in the audience know if the talks will be recorded? This con is relatively unknown \*\*\*

### [BSDMag issue for March 2014](http://bsdmag.org/magazine/1860-deploying-netbsd-on-the-cloud-using-aws-ec2-march-bsd-issue) ###

* The monthly BSD magazine releases its newest issue
* Topics this time include: deploying NetBSD using AWS EC2, creating a multi-purpose file server with NetBSD, DragonflyBSD as a backup server, more GIMP lessons, network analysis with wireshark and a general security article
* The Linux article trend seems to continue... hmm \*\*\*

### [Non-ECC RAM in FreeNAS](http://blog.brianmoses.net/2014/03/why-i-chose-non-ecc-ram-for-my-freenas.html) ###

* We've gotten a few questions about ECC RAM with ZFS
* Here we've got a surprising blog post about why someone **did not** go with ECC RAM for his NAS build
* The article mentions the benefits of ECC and admits it is a better choice in nearly all instances, but unfortunately it's not very widespread in consumer hardware motherboards and it's more expensive
* Regular RAM also has "special" issues with ZFS and pool corruption
* Long post, so check out the whole thing if you've been considering your memory options and weighing the benefits \*\*\*

Interview - Pierre Pronchery - [khorben@edgebsd.org](mailto:khorben@edgebsd.org) / [@khorben](https://twitter.com/khorben)
----------

[EdgeBSD](https://www.youtube.com/watch?v=_D_iaad5rPo) ([slides](http://ftp.netbsd.org/pub/NetBSD/misc/khorben/asiabsdcon2014/))

---

Tutorial
----------

### [Building an OpenBSD desktop](http://www.bsdnow.tv/tutorials/the-desktop-obsd) ###

---

News Roundup
----------

### [Getting to know your portmgr-lurkers](http://blogs.freebsdish.org/portmgr/2014/03/25/getting-to-know-your-portmgr-lurker-frederic-culot) ###

* This week we get to hear from Frederic Culot, colut@
* Originally an OpenBSD user from France, Frederic joined as a ports committer in 2010 and recently joined the portmgr lurkers team
* "FreeBSD is also one of my sources of inspiration when it comes to how organizations behave and innovate, and I find it very interesting to compare FreeBSD with the for-profit companies I work for"
* We get to find out a little bit about him, why he loves FreeBSD and what he does for the project \*\*\*

### [NetBSD on the Playstation 2](https://blog.netbsd.org/tnf/entry/the_playstation2_port_is_back) ###

* Who doesn't want to run NetBSD on their old PS2?
* The PS2 port of NetBSD was sadly removed in 2009, but it has been revived
* It's using a slightly unusual MIPS CPU that didn't have much GCC support
* Hopefully a bootable kernel will be available soon \*\*\*

### [The FreeBSD Challenge update](http://www.thelinuxcauldron.com/2014/03/24/freebsd-challenge-day-22-30/) ###

* Our friend from the Linux Foundation continues his FreeBSD switching journey
* This time he starts off by discovering virtual machines suck at keeping accurate time, and some ports weren't working because of his clock being way off
* After polling the IRC for help, he finally learns the difference between ntpdate and ntpd and both of their use cases
* Maybe he should've just read our [NTP tutorial](http://www.bsdnow.tv/tutorials/ntpd)! \*\*\*

### [PCBSD weekly digest](http://blog.pcbsd.org/2014/03/pc-bsd-weekly-feature-digest-23/) ###

* The mount tray icon got lots of updates and fixes
* The faulty distribution server has finally been tracked down and... destroyed
* New language localization project is in progress
* Many many updates to ports and PBIs, new -STABLE builds \*\*\*

Feedback/Questions
----------

* [Antonio writes in](http://slexy.org/view/s27d69qHJW)
* [Patrick writes in](http://slexy.org/view/s21FhLCHbB)
* [Chris writes in](http://slexy.org/view/s20Hisk3Yw)
* [Ron writes in](http://slexy.org/view/s20rBZyTLC)
* [Tyler writes in](http://slexy.org/view/s2s4CxE4gd) \*\*\*