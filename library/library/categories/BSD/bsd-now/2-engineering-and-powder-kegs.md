+++
title = "2: Engineering and Powder Kegs"
description = "After a wildly successful debut episode, BSD Now is BACK to talk with Glen Barber from the FreeBSD Release team, show you how to build your own binary package repository and discuss the latest BSD news!Headlines[64bit time in OpenBSD](http://undeadly.org/cgi?action="
date = "2013-09-11T12:00:00Z"
url = "https://www.bsdnow.tv/2"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.307587654Z"
seen = true
+++

After a wildly successful debut episode, BSD Now is BACK to talk with Glen Barber from the FreeBSD Release team, show you how to build your own binary package repository and discuss the latest BSD news!

Headlines
----------

### [64bit time in OpenBSD](http://undeadly.org/cgi?action=article&sid=20130813072244) ###

* Many operating systems face an upcoming challenge, similar to (but more complicated than) Y2K: Y2038. All of the BSDs and most other operating systems track time by counting the seconds since Jan 1st, 1970. In 2038 this value will reach the maximum value of a signed 32 bit integer.
* Simply changing to a 64 bit counter may not be the best solution, because there may still be 32 bit systems in use for embedded applications
* Theo will be giving the keynote at EuroBSDCon on the subject, explaining how OpenBSD has implemented the solution
* ABI incompatibility. Updating to this kernel requires extra work or you won't be able to login: install a snapshot instead. [Upgrading by source is for the insane only.](http://www.openbsd.org/faq/current.html#20130813)

### [AESNI pipelining gets a speed boost](http://freshbsd.org/commit/freebsd/r255187) ###

* AES-NI is a new processor instruction available on modern Intel and AMD chips that provides hardware acceleration for AES encryption and decryption. This feature is especially useful for encrypted disks, because it removes most of the performance penalty traditionally associated with encryption
* The new commit has the instructions pipelined, so there is no latency between the instructions
* Uses SSE2 instructions for calculating XTS tweak factor for further increased performance
* GELI based disk encryption performance increased by 3x on capable CPUs
* Should affect PEFS and other AES backed encryption schemes as well
* Full disk encryption should be more or less transparent now \*\*\*

### [OpenBSD 5.4 Preorders](http://openbsd.org/orders.html) ###

* Every 6 months there is a new OpenBSD version
* They include a fun song and nicely-packaged CD set
* The proceeds from sale of these products is the primary funding of the OpenBSD project
* The official ISOs will be uploaded on November 1st \*\*\*

### [GCC no longer built by default on FreeBSD -CURRENT](https://svnweb.freebsd.org/base?view=revision&revision=255321) ###

* On platforms where clang is the default compiler, don't build gcc or libstdc++
* GCC is still enabled on PC98, because the PC98 bootloader requires GCC to build
* While the base FreeBSD system has been built by clang for a long time, this change also covers the ports tree \*\*\*

### [Patch to update Xorg and MESA on FreeBSD](http://lists.freebsd.org/pipermail/freebsd-x11/2013-September/013599.html) ###

* Updates xorg drivers
* Expected to be committed in about 2 weeks
* Adds option to use devd instead of HAL for X configuration
* Updates the MESA stack (9.1.6), libGL, DRI, etc
* Enables KMS for AMD/ATI cards
* Mesa 9.2 is available with xorg-dev, OpenBSD has also recently upgraded to Mesa 9.2 for their stable version of Xorg \*\*\*

Interview - Glen Barber - [gjb@freebsd.org](mailto:gjb@freebsd.org) / [@evilgjb](https://twitter.com/evilgjb)
----------

FreeBSD Release Engineering

---

Tutorial
----------

### [Making your own binary repository](http://www.bsdnow.tv/tutorials/poudriere) ###

---

The Place to B...SD
----------

### [iXsystems hosts FreeBSD Anniversary party ](http://www.ixsystems.com/resources/ix/news/ixsystems-to-once-again-host-freebsd-anniversary-celebration.html) ###

* Celebrating FreeBSD’s 20th anniversary
* Saturday, November 2nd at the DNA Lounge in San Francisco
* Notable FreeBSD figures will contribute words of wisdom on the past, present, and future of FreeBSD \*\*\*

News Roundup
----------

### [NetBSD gets basic support for the cubieboard 1 & 2 ](http://mail-index.netbsd.org/source-changes/2013/09/04/msg047155.html) ###

* Very preliminary support for cubieboard 1 & 2 based on the Allwinner A10 & A20 SoCs
* Many drivers are "stubs with autoconf glue"
* Contributed by Matt Thomas \*\*\*

### [Rayservers ditches Linux for BSD](http://rayservers.com/blog/the-freebsd-daemon-is-off-to-do-battle-in-the-name-of-christ) ###

* Used them all, Windows, Mac, OpenBSD, Linux
* Needed PF, ZFS, disk encryption, lots of networking features, better security
* In Linux, "The new cgroups based memory management ran out of memory - on a 256 GB RAM system whilst it was not using more than 40."
* BSD now protects the privacy of their email users \*\*\*

### [HPN for OpenSSH 6.2](https://lists.mindrot.org/pipermail/openssh-unix-dev/2013-August/031614.html) ###

* [High Performance Networking](http://www.psc.edu/index.php/hpn-ssh) is an SSH patchset to improve transfer speeds by removing the fixed window size and take better advantage of TCP
* Maintained as a patchset separate from OpenSSH
* First integrated into FreeBSD base as of 9.0
* Updated to support 6.2 (available in the ports tree as security/openssh-portable)
* The HPN patch set also includes threaded AES-CTR support to increase performance and take advantage of multiple CPU cores for encryption. In this latest patch, threaded AES-CTR now works in all situations (it failed in some specific situations previously). Expected performance increase is \~50%
* NONE cipher is now separate from the main patch set. The NONE cipher allows tools like scp and sftp to switch off the encryption for file transfers (when specifically told to do so) to keep encryption from bottlenecking performance and wasting CPU time \*\*\*

### [Call for testing: OpenSSH-6.3](https://lists.mindrot.org/pipermail/openssh-unix-dev/2013-July/031550.html) ###

* Mostly a bugfix release
* SFTP now supports resuming partially-downloaded or uploaded transfers
* More logging features
* Six weeks after the initial email, still no release. des@ is not pleased. \*\*\*

### [pkgsrc gets signing support](http://mail-index.netbsd.org/pkgsrc-users/2013/08/30/msg018511.html) ###

* pkgsrc is used on NetBSD, DragonflyBSD and other OSes
* Comes from an EdgeBSD developer
* Uses GPG for signing package files
* Currently just a patch on github and in its infancy
* Provides a short howto \*\*\*

### [FreeBSD vs. Linux: 10 points of superiority ](https://forums.freebsd.org/showthread.php?t=41750) ###

* New FreeBSD user, ex-Linux user writes about his experience
* Mentions consistency, documentation, security, filesystems, updates, jails, community
* Really long post, definitely worth a read \*\*\*

Feedback/Questions
----------

* [hoopla writes in](http://slexy.org/view/s21SpCcisW)
* [Juergen writes in](http://slexy.org/view/s20vHY9qAK)
* [Sam writes in](http://slexy.org/view/s23uf4vzfQ)
* [Frank writes in](http://slexy.org/view/s2Y0qiXJan) \*\*\*