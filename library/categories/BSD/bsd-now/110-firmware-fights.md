+++
title = "110: - Firmware Fights"
description = "This week on BSDNow, we get to hear all of Allans post EuroBSDCon wrap-up and a great interview with Benno Rice from Isilon. We got to discuss some of the pain of doing major forklift upgrades, and why your business should track -CURRENT.This episode was brought to you by"
date = "2015-10-07T12:00:00Z"
url = "https://www.bsdnow.tv/110"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.099464123Z"
seen = true
+++

This week on BSDNow, we get to hear all of Allans post EuroBSDCon wrap-up and a great interview with Benno Rice from Isilon. We got to discuss some of the pain of doing major forklift upgrades, and why your business should track -CURRENT.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### EuroBSDCon Videos ###

* EuroBSDCon has started posting videos of the talks online already.
* The videos posted online are archives of the live stream, so some of the videos contain multiple talks
* Due to a technical complication, some videos only have 1 channel of audio
* [EuroBSDCon Talk Schedule](https://2015.eurobsdcon.org/talks-and-schedule/talk-schedule/)
* [Red Room Videos](https://www.youtube.com/channel/UCBPvcqZrNuKZuP1LQhlCp-A)
* [Yellow Room Videos](https://www.youtube.com/channel/UCJk8Kls9LT-Txu-Jhv7csfw)
* [Blue Room Videos](https://www.youtube.com/channel/UC-3DOxIOI5oHXE1H57g3FzQ)
* [Photos of the conference courtersy of Ollivier Robert](https://assets.keltia.net/photos/EuroBSDCon-2015/) \*\*\*

### [A series of OpenSMTPd patches fix multiple vulnerabilities](http://undeadly.org/cgi?action=article&sid=20151005200020) ###

* Qualys recently published an [audit of the OpenSNMPd source code](https://www.qualys.com/2015/10/02/opensmtpd-audit-report.txt)
* The fixes for these vulnerabilities were released as 5.7.2
* After its release, two [additional vulnerabilities](http://www.openwall.com/lists/oss-security/2015/10/04/2) were found. One, in the portable version, newer code that was added after the audit started
* All users are strongly encouraged to upgrade to 5.7.3
* OpenBSD users should apply the latest errata or upgrade to the newest snapshot \*\*\*

### [FreeBSD updates in -CURRENT](https://svnweb.freebsd.org/base?view=revision&revision=288917) ###

* Looks like Xen header support has been bumped in FreeBSD from 4.2 -\> 4.6
* It also enables support for ARM
* [Update to Clang / LLVM to 3.7.0](https://lists.freebsd.org/pipermail/freebsd-current/2015-October/057691.html)
* [http://llvm.org/releases/3.7.0/docs/ReleaseNotes.html](http://llvm.org/releases/3.7.0/docs/ReleaseNotes.html)
* [ZFS gets FRU (field replaceable unit) tracking](https://svnweb.freebsd.org/base?view=revision&revision=287745)
* [OpenCL makes it way into the ports tree](https://svnweb.freebsd.org/ports?view=revision&revision=397198)
* bhyve has grown UEFI support, plus a CSM module
* [bhyve can now boot Windows ](https://lists.freebsd.org/pipermail/freebsd-virtualization/2015-October/003832.html)
* Currently there is still only a serial console, so the post includes an unattended install .xml file and instructions on how to repack the ISO. Once Windows is installed, you can RDP into the machine
* [bhyve can also now run IllumOS ](https://lists.freebsd.org/pipermail/freebsd-virtualization/2015-October/003833.html) \*\*\*

### [OpenBSD Initial Support for Broadwell Graphics](http://marc.info/?l=openbsd-cvs&m=144304997800589&w=2) ###

* OpenBSD joins DragonFly now with initial support for broadwell GPUs landing in their development branch
* This brings Open up to Linux 3.14.52 DRM, and Mark Kettenis mentions that it isn.t perfect yet, and may cause some issues with older hardware, although no major regressions yet \*\*\*

### OpenBSD Slides for [TAME](http://www.openbsd.org/papers/tame-fsec2015/) and [libTLS APIs](http://www.openbsd.org/papers/libtls-fsec-2015/) ###

* The first set of slides are from a talk Theo de Raadt gave in Croatia, they describe the history and impetus for tame
* Theo specifically avoids comparisons to other sandboxing techniques like capsicum and seccomp, because he is not impartial
* tame() itself is only about 1200 lines of code
* Sandboxing the file(1) command with systrace: 300 lines of code, with tame: 4 lines
* Theo makes the point that .optional security. is irrelevant. If a mitigation feature has a knob to turn it off, some program will break and advise users to turn the feature off. Eventually, no one uses the feature, and it dies
* This has lead to OpenBSD.s policy: .Once working, these features cannot be disabled. Application bugs must be fixed.
* The second talk is by Bob Beck, about LibreSSL
* when LibreSSL was forked from OpenSSL 1.0.1g, it contained 388,000 lines of C code
* 30 days in LibreSSL, they had deleted 90,000 lines of C
* OpenSSL 1.0.2d has 432,000 lines of C (728k total), and OpenSSL Current has 411,000 lines of C (over 1 million total)
* LibreSSL today, contains 297,000 lines of C (511k total)
* None of the high risk CVEs against OpenSSL (there have been 5) have affected LibreSSL. It turns out removing old code and unneeded features is good for security.
* The talk focuses on libtls, an alternative to the OpenSSL API, designed to be easier to use and less error prone
* In the libtls api, if -1 is returned, it is always an error. In OpenSSL, it might not be an error, needs additional code to check errno
* In OpenBSD: ftp, nc, ntpd, httpd, spamd, syslog have been converted to the new API
* The OpenBSD Foundation is looking for donations in order to sponsor 2-3 developers to spend 6 months dedicated to LibreSSL \*\*\*

Interview - Benno Rice - [benno@FreeBSD.org](mailto:benno@FreeBSD.org) / [@jeamland](https://twitter.com/jeamland)
----------

Isilon and building products on top of FreeBSD

---

News Roundup
----------

### [ReLaunchd](https://github.com/mheily/relaunchd/blob/master/doc/rationale.txt) ###

* This past week we got a heads up about another init/launchd replacement, this time .Relaunchd.
* The goals of this project appear to be keeping launchd functionality, while being portable enough to run on FreeBSD / Linux, etc.
* It also has aspirations of being .container-aware. with support for jailed services, ala-docker, as well as cluster awareness.
* Written in ruby :(, it also maintains that it wishes to NOT take over PID1 or replace the initial system boot scripts, but extend / leverage them in new ways. \*\*\*

### [Static Intrusion Detection in NetBSD](https://mail-index.netbsd.org/source-changes/2015/09/24/msg069028.html) ###

* Alistar Crooks has committed a new .sid. utility to NetBSD, which allows intrusion detection by comparing the file-system contents to a database of known good values
* The utility can compare the entire root file system of a modest NetBSD machine in about 15 seconds
* The following parameters of each file can be checked: atime, block count, ctime, file type, flags, group, inode, link target, mtime, number of links, permissions, size, user, crc32c checksum, sha256 checksum, sha512 checksum
* A JSON report is issued at the end, for any detected variances \*\*\*

### LibreSSL 2.3.0 in PC-BSD ###

* If you.re running PC-BSD 10.2-EDGE or October's -CURRENT image, LibreSSL 2.3.0 is now a thing
* Thanks to the hard work of Bernard Spil and others, we have merged in the latest LibreSSL which actually removes SSL support in favor of TLS
* Quite a number of bugs have been fixed, as well as patches brought over from OpenBSD to fix numerous ports.
* Allan has started a patchset that sets the [OpenSSL in base to "private"](http://allanjude.com/bsd/privatessl_2015-10-07.patch)
* This hides the library so that applications and ports cannot find it, so only tools in the base system, like fetch, will be able to use it. This makes OpenSSL no longer part of the base system ABI, meaning the version can be upgraded without breaking the stable ABI promise. This feature may be important in the future as OpenSSL versions now have EoL dates, that may be sooner than the EoL on the FreeBSD stable branches. \*\*\*

### [PC-BSD and boot-environments without GRUB](http://lists.pcbsd.org/pipermail/testing/2015-October/010173.html) ###

* In this month.s -CURRENT image of PC-BSD, we began the process of moving back from the GRUB boot-loader, in favor of FreeBSD.s
* A couple of patches have been included, which enables boot-environment support via the 4th menus (Thanks Allan) and support for booting ZFS on root via UEFI
* "beadm" has also been updated to seamlessly support both boot-loaders
* No full-disk encryption support yet (hopefully soon), but GRUB is still available on installer for those who need it \*\*\*

### [Import of IWM wireless to DragonFly](http://gitweb.dragonflybsd.org/dragonfly.git/commitdiff/24a8d46a22f9106b0c1466c41ba73460d7d22262) ###

* Matthew Dillon has recently imported the newer if\_iwm driver from FreeBSD -\> DragonFly
* Across the internet, users with newer Intel chipsets rejoiced!
* Coupled with the latest Broadwell DRM improvements, DragonFly sounds very ready for the latest laptop chipsets
* Also, looks like progress is being made on [i386 removal](http://gitweb.dragonflybsd.org/dragonfly.git/commitdiff/cf37dc2040cea9f384bd7d3dcaf24014f441b8a6) \*\*\*

Feedback/Questions
----------

* [Dan writes in about PCBSD](http://slexy.org/view/s27ZeOiM4t)
* [Matt writes in about ZFS](http://slexy.org/view/s219J3ebx5)
* [Anonymous writes in about problems booting](http://slexy.org/view/s21uuMAmZb) \*\*\*