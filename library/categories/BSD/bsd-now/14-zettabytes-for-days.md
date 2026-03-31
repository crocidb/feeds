+++
title = "14: Zettabytes for Days"
description = "This week is the long-awaited episode you've been asking for! We'll be giving you a crash course on becoming a ZFS wizard, as well as having a chat with George Wilson about the OpenZFS project's recent developments. We have answers to your feedback emails and there are some great"
date = "2013-12-04T13:00:00Z"
url = "https://www.bsdnow.tv/14"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.286136140Z"
seen = true
+++

This week is the long-awaited episode you've been asking for! We'll be giving you a crash course on becoming a ZFS wizard, as well as having a chat with George Wilson about the OpenZFS project's recent developments. We have answers to your feedback emails and there are some great news items to get caught up on too, so stay tuned to BSD Now - the place to B.. SD.

Headlines
----------

### [pkgng 1.2 released](https://svnweb.freebsd.org/ports?view=revision&revision=334937) ###

* bapt and bdrewery from the portmgr team released pkgng 1.2 final
* New features include an improved build system, plugin improvements, new bootstrapping command, SRV mirror improvements, a new "pkg config" command, repo improvements, vuXML is now default, new fingerprint features and much more
* Really simple to upgrade, check our [pkgng tutorial](http://www.bsdnow.tv/tutorials/pkgng) if you want some easy instructions
* It's also made its way [into Dragonfly](http://lists.dragonflybsd.org/pipermail/users/2013-November/090339.html)
* See the show notes for the full list of new features and fixes \*\*\*

### [ChaCha20 and Poly1305 in OpenSSH](http://blog.djm.net.au/2013/11/chacha20-and-poly1305-in-openssh.html) ###

* Damien Miller recently committed support for a new authenticated encryption cipher for OpenSSH, chacha20-poly1305
* Long blog post explaining what these are and why we need them
* This cipher combines two primitives: the ChaCha20 cipher and the Poly1305 MAC
* RC4 is broken, we needed an authenticated encryption mode to complement AES-GCM that doesn't show the packet length in cleartext
* Great explanation of the differences between EtM, MtE and EaM and their advantages
* "Both AES-GCM and the EtM MAC modes have a small downside though: because we no longer desire to decrypt the packet as we go, the packet length must be transmitted in plaintext. This unfortunately makes some forms of traffic analysis easier as the attacker can just read the packet lengths directly." \*\*\*

### [Is it time to dump Linux and move to BSD](http://www.itworld.com/open-source/384383/should-you-switch-linux-bsd) ###

* ITworld did an article about switching from Linux to BSD
* The author's interest was sparked from a review he was reading that said "I feel the BSD communities, especially the FreeBSD-based projects, are where the interesting developments are happening these days. Over in FreeBSD land we have efficient PBI bundles, a mature advanced file system in the form of ZFS, new friendly and powerful system installers, a new package manager (pkgng), a powerful jail manager and there will soon be new virtualization technology coming with the release of FreeBSD 10.0"
* The whole article can be summed up with "yes" - ok, next story! \*\*\*

### [OpenZFS devsummit videos](https://www.youtube.com/user/deirdres/videos) ###

* The OpenZFS [developer summit](http://www.open-zfs.org/wiki/OpenZFS_Developer_Summit_2013) discussion and presentation videos are up
* People from various operating systems (FreeBSD, Mac OS X, illumos, etc.) were there to discuss ZFS on their platforms and the challenges they faced
* Question and answer session from representatives of every OS - had a couple FreeBSD guys there including one from the foundation
* Presentations both about ZFS itself and some hardware-based solutions for implementing ZFS in production
* TONS of video, about 6 hours' worth
* This leads us into our interview, which is... \*\*\*

Interview - George Wilson - [wilzun@gmail.com](mailto:wilzun@gmail.com) / [@zfsdude](https://twitter.com/zfsdude)
----------

OpenZFS

---

Tutorial
----------

### [A crash course on ZFS](http://www.bsdnow.tv/tutorials/zfs) ###

---

News Roundup
----------

### [ruBSD 2013 information](http://undeadly.org/cgi?action=article&sid=20131126113154) ###

* The ruBSD 2013 conference will take place on Saturday December 14, 2013 at 10:30 AM in Moscow, Russia
* Speakers include three OpenBSD developers, [Theo de Raadt](http://www.bsdnow.tv/episodes/2013_10_09-doing_it_de_raadt_way), [Henning Brauer](http://www.bsdnow.tv/episodes/2013_10_30-current_events) and Mike Belopuhov
* Their talks are titled "The bane of backwards compatibility," "OpenBSD's pf: Design, Implementation and Future" and "OpenBSD: Where crypto is going?"
* No word on if there will be video recordings, but we'll let you know if that changes \*\*\*

### [DragonFly roadmap, post 3.6](http://www.shiningsilence.com/dbsdlog/2013/11/28/12874.html) ###

* John Marino posted a possible roadmap for DragonFly, now that they're past the 3.6 release
* He wants some third party vendor software updated from very old versions (WPA supplicant, bmake, binutils)
* Plans to replace GCC44 with Clang, but GCC47 will probably be the primary compiler still
* Bring in fixes and new stuff from FreeBSD 10 \*\*\*

### [BSDCan 2014 CFP](http://lists.bsdcan.org/pipermail/bsdcan-announce/2013-December/000123.html) ###

* BSDCan 2014 will be held on May 16-17 in Ottawa, Canada
* They're now accepting proposals for talks
* If you are doing something interesting with a BSD operating system, please submit a proposal
* We'll be getting lots of interviews there \*\*\*

### [casperd added to -CURRENT](https://svnweb.freebsd.org/base?view=revision&revision=258838) ###

* "It (and its services) will be responsible forgiving access to functionality that is not available in capability modes and box. The functionality can be precisely restricted."
* Lists some sysctls that can be controlled \*\*\*

### [ZFS corruption bug fixed in -CURRENT](https://svnweb.freebsd.org/base?view=revision&revision=258704) ###

* Just a quick follow-up from last week, the ZFS corruption bug in FreeBSD -CURRENT was very quickly fixed, before that episode was even uploaded \*\*\*

Feedback/Questions
----------

* [Chris writes in](http://slexy.org/view/s2JDWKjs7l)
* [SW writes in](http://slexy.org/view/s20BLqxTWD)
* [Jason writes in](http://slexy.org/view/s2939tUOf5)
* [Clint writes in](http://slexy.org/view/s21qKY6qIb)
* [Chris writes in](http://slexy.org/view/s20LWlmhoK) \*\*\*