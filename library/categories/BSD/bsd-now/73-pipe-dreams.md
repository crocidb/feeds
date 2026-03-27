+++
title = "73: Pipe Dreams"
description = "This week on the show we'll be chatting with David Maxwell, a former NetBSD security officer. He's got an interesting project called Pipecut that takes a whole new approach to the commandline. We've also got answers to viewer-submitted questions and all this week's headlines, on "
date = "2015-01-21T13:00:00Z"
url = "https://www.bsdnow.tv/73"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.175910654Z"
seen = false
+++

This week on the show we'll be chatting with David Maxwell, a former NetBSD security officer. He's got an interesting project called Pipecut that takes a whole new approach to the commandline. We've also got answers to viewer-submitted questions and all this week's headlines, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeBSD quarterly status report](https://www.freebsd.org/news/status/report-2014-10-2014-12.html) ###

* The FreeBSD team has posted an updated on some of their activities between October and December of 2014
* They put a big focus on compatibility with other systems: the Linux emulation layer, [bhyve](http://www.bsdnow.tv/tutorials/bhyve), WINE and Xen all got some nice improvements
* As always, the report has lots of updates from the various teams working on different parts of the OS and ports infrastructure
* The release engineering team got 10.1 out the door, the ports team shuffled a few members in and out and continued working on closing more PRs
* FreeBSD's forums underwent a huge change, and discussion about the new support model for release cycles continues (hopefully taking effect after 11.0 is released)
* Git was promoted from beta to an officially-supported version control system (Kris is happy)
* The core team is also assembling a new QA team to ensure better code quality in critical areas, such as security and release engineering, after getting a number of complaints
* Other notable entries include: lots of bhyve fixes, Clang/LLVM being updated to 3.5.0, ongoing work to the external toolchain, adding FreeBSD support to more "cloud" services, pkgng updates, work on SecureBoot, more ARM support and graphics stack improvements
* Check out the full report for all the details that we didn't cover \*\*\*

### [OpenBSD package signature audit](http://linux-audit.com/vulnerabilities-and-digital-signatures-for-openbsd-software-packages/) ###

* "Linux Audit" is a website focused on auditing and hardening systems, as well as educating people about securing their boxes
* They recently did an article about OpenBSD, specifically their [ports and package system](http://www.bsdnow.tv/tutorials/ports-obsd) and signing infrastructure
* The author gives a little background on the difference between ports and binary packages, then goes through the technical details of how releases and packages are cryptographically signed
* Package signature formats and public key distribution methods are also touched on
* After some heckling, the author of the post said he plans to write more BSD security articles, so look forward to them in the future
* If you haven't seen [our episode about signify](http://www.bsdnow.tv/episodes/2014_02_05-time_signatures) with Ted Unangst, that would be a great one to check out after reading this \*\*\*

### [Replacing a Linux router with BSD](http://ask.slashdot.org/story/15/01/15/1547209/ask-slashdot-migrating-a-router-from-linux-to-bsd) ###

* There was recently a Slashdot discussion about migrating a Linux-based router to a BSD-based one
* The poster begins with "I'm in the camp that doesn't trust systemd. You can discuss the technical merits of all init solutions all you want, but if I wanted to run Windows NT I'd run Windows NT, not Linux. So I've decided to migrate my homebrew router/firewall/samba server to one of the BSDs."
* A lot of people were quick to recommend [OPNsense](http://www.bsdnow.tv/episodes/2015_01_14-common_sense_approach) and pfSense, being that they're very easy to administer (requiring basically no BSD knowledge at all)
* Other commenters suggested a more hands-on approach, setting one up yourself with [FreeBSD](http://blog.pcbsd.org/2015/01/using-trueos-as-a-ipfw-based-home-router/) or [OpenBSD](http://www.bsdnow.tv/tutorials/openbsd-router)
* If you've been thinking about moving some routers over from Linux or other commercial solution, this might be a good discussion to read through
* Unfortunately, a lot of the comments are just Linux users bickering about systemd, so you'll have to wade through some of that to get to the good information \*\*\*

### [LibreSSL in FreeBSD and OPNsense](http://bsdxbsdx.blogspot.com/2015/01/switching-to-openssl-from-ports-in.html) ###

* A FreeBSD sysadmin has started documenting his experience replacing OpenSSL in the base system with the one from ports (and also experimenting with LibreSSL)
* The reasoning being that updates in base [tend to lag behind](http://www.openbsd.org/papers/eurobsdcon2014-libressl.html), whereas the port can be updated for security very quickly
* OPNsense developers are [looking into](https://twitter.com/fitchitis/status/555625679614521345) [switching away](http://forum.opnsense.org/index.php?topic=21.0) from OpenSSL to [LibreSSL's portable version](http://www.bsdnow.tv/episodes/2014_07_30-liberating_ssl), for both their ports and base system, which would be a pretty huge differentiator for their project
* Some ports [still need fixing](https://bugs.freebsd.org/bugzilla/buglist.cgi?order=Importance&query_format=advanced&short_desc=libressl&short_desc_type=allwordssubstr) to be compatible though, particularly [a few](https://github.com/opnsense/ports/commit/c15af648e9d5fcecf0ae666292e8f41c08979057) [python-related](https://github.com/pyca/cryptography/issues/928) ones
* If you're a FreeBSD ports person, get involved and help squash some of the last remaining bugs
* A lot of the work has already been done [in OpenBSD's ports tree](http://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/) - some patches just need to be adopted
* More and more upstream projects are incorporating LibreSSL patches in their code - let your favorite software vendor know that you're using it \*\*\*

Interview - David Maxwell - [david@netbsd.org](mailto:david@netbsd.org) / [@david\_w\_maxwell](https://twitter.com/david_w_maxwell)
----------

[Pipecut](https://www.youtube.com/watch?v=CZHEZHK4jRc), text processing, commandline wizardry

---

News Roundup
----------

### [Jetpack, a new jail container system](https://github.com/3ofcoins/jetpack) ###

* A new project was launched to adapt FreeBSD jails to the "app container specification"
* While still pretty experimental in terms of the development phase, this might be something to show your Linux friends who are in love with docker
* It's a similar project to [iocage](https://github.com/pannon/iocage) or [bsdploy](https://github.com/ployground/bsdploy), which we haven't talked a whole lot about
* There was also [some discussion](https://news.ycombinator.com/item?id=8893630) about it on Hacker News \*\*\*

### [Separating base and package binaries](https://www.reddit.com/r/BSD/comments/2szofc) ###

* All of the main BSDs make a strong separation between the base system and third party software
* This is in contrast to Linux where there's no real concept of a "base system" - more recently, some distros have even merged all the binaries into a single directory
* A user asks the community about the BSD way of doing it, trying to find out the advantages and disadvantages of both hierarchies
* Read the comments for the full explanation, but having things separated really helps keep things organized \*\*\*

### [Updated i915kms driver for FreeBSD](https://svnweb.freebsd.org/base?view=revision&revision=277487) ###

* This update brings the FreeBSD code closer inline with the Linux code, to make it easier to update going forward
* It doesn't introduce Haswell support just yet, but was required before the Haswell bits can be added \*\*\*

### [Year of the OpenBSD desktop](http://zacbrown.org/2015/01/18/openbsd-as-a-desktop/) ###

* Here we have an article about using OpenBSD as a daily driver for regular desktop usage
* The author says he "ran fifty thousand different distributions, never being satisfied"
* After dealing with the problems of Linux and fragmentation, he eventually gave up and bought a Macbook
* He also used FreeBSD between versions 7 and 9, finding a "a mostly harmonious environment," but regressions lead him to give up on desktop \*nix once again
* Starting with 2015, he's back and is using OpenBSD on a Thinkpad x201
* The rest of the article covers some of his configuration tweaks and gives an overall conclusion on his current setup
* He apparently used [our desktop tutorial](http://www.bsdnow.tv/tutorials/the-desktop-obsd) - thanks for watching! \*\*\*

### [Unattended FreeBSD installation](http://louwrentius.com/freebsd-101-unattended-install-over-pxe-http-no-nfs.html) ###

* A new BSD user was looking to get some more experience, so he documented how to install FreeBSD over PXE
* His goal was to have a setup similar to Redhat's "kickstart" or [OpenBSD's autoinstall](http://www.bsdnow.tv/tutorials/autoinstall)
* The article shows you how to set up DHCP and TFTP, with no NFS share setup required
* He also gives a mention to mfsbsd, showing how you can customize its startup script to do most of the work for you \*\*\*

Feedback/Questions
----------

* [Robert writes in](http://slexy.org/view/s20UsZjN4h)
* [Sean writes in](http://slexy.org/view/s219cMQz3U)
* [l33tname writes in](http://slexy.org/view/s2EkzMUMyb)
* [Charlie writes in](http://slexy.org/view/s2nq6L6H1n)
* [Eric writes in](http://slexy.org/view/s21EGqUYLd) \*\*\*

Mailing List Gold
----------

* [Clowning around](https://www.marc.info/?l=openbsd-cvs&m=142159202606668&w=2)
* [Better than succeeding in this case](https://lists.freebsd.org/pipermail/freebsd-ports/2015-January/097734.html) \*\*\*