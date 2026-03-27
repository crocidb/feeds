+++
title = "44: Base ISO 100"
description = "This time on the show, we'll be sitting down to talk with Craig Rodrigues about Jenkins and the FreeBSD testing infrastructure. Following that, we'll show you how to roll your own OpenBSD ISOs with all the patches already applied... ISO can't wait! This week's news and answers to"
date = "2014-07-02T12:00:00Z"
url = "https://www.bsdnow.tv/44"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.232614261Z"
seen = false
+++

This time on the show, we'll be sitting down to talk with Craig Rodrigues about Jenkins and the FreeBSD testing infrastructure. Following that, we'll show you how to roll your own OpenBSD ISOs with all the patches already applied... ISO can't wait! This week's news and answers to all your emails, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [pfSense 2.1.4 released](https://blog.pfsense.org/?p=1377) ###

* The [pfSense team](http://www.bsdnow.tv/episodes/2014_02_19-a_sixth_pfsense) has released 2.1.4, shortly after 2.1.3 - it's mainly a security release
* Included within are eight security fixes, most of which are pfSense-specific
* OpenSSL, the WebUI and some packages all need to be patched (and there are instructions on how to do so)
* It also includes a large number of various other bug fixes
* Update all your routers! \*\*\*

### [DragonflyBSD's pf gets SMP](http://lists.dragonflybsd.org/pipermail/commits/2014-June/270300.html) ###

* While we're on the topic of pf...
* Dragonfly patches their old[er than even FreeBSD's] pf to support multithreading in many areas
* Stemming from [a user's complaint](http://lists.dragonflybsd.org/pipermail/users/2014-June/128664.html), Matthew Dillon did his own work on pf to make it SMP-aware
* [Altering your configuration](http://lists.dragonflybsd.org/pipermail/users/2014-June/128671.html)'s ruleset can also help speed things up, he found
* When will OpenBSD, the source of pf, finally do the same? \*\*\*

### [ChaCha usage and deployment](http://ianix.com/pub/chacha-deployment.html) ###

* A while back, [we talked to djm](http://www.bsdnow.tv/episodes/2013_12_18-cryptocrystalline) about some cryptography changes in OpenBSD 5.5 and OpenSSH 6.5
* This article is sort of an interesting follow-up to that, showing which projects have adopted ChaCha20
* OpenSSH offers it as a stream cipher now, OpenBSD uses it for it's random number generator, Google offers it in TLS for Chromium and some of their services and lots of other projects seem to be adopting it
* Both Google's fork of OpenSSL and LibReSSL have upcoming implementations, while vanilla OpenSSL does not
* Unfortunately, this article has one mistake: FreeBSD [does not use it](https://lists.freebsd.org/pipermail/freebsd-bugs/2013-October/054018.html) - they *still* use the broken RC4 algorithm \*\*\*

### [BSDMag June 2014 issue](http://bsdmag.org/magazine/1864-tls-hardening-june-bsd-magazine-issue) ###

* The monthly online BSD magazine releases their newest issue
* This one includes the following articles: TLS hardening, setting up a package cluster in MidnightBSD, more GIMP tutorials, "saving time and headaches using the robot framework for testing," an interview and an article about the increasing number of security vulnerabilities
* The free pdf file is available for download as always \*\*\*

Interview - Craig Rodrigues - [rodrigc@freebsd.org](mailto:rodrigc@freebsd.org)
----------

FreeBSD's [continuous](https://wiki.freebsd.org/Jenkins) [testing](https://docs.google.com/presentation/d/1yBiPxS1nKnVwRlAEsYeAOzYdpG5uzXTv1_7i7jwVCfU/edit#slide=id.p) [infrastructure](https://jenkins.freebsd.org/jenkins/)

---

Tutorial
----------

### [Creating pre-patched OpenBSD ISOs](http://www.bsdnow.tv/tutorials/stable-iso) ###

---

News Roundup
----------

### [Preauthenticated decryption considered harmful](http://www.tedunangst.com/flak/post/preauthenticated-decryption-considered-harmful) ###

* Responding to [a post](https://www.imperialviolet.org/2014/06/27/streamingencryption.html) from Adam Langley, [Ted Unangst](http://www.bsdnow.tv/episodes/2014_02_05-time_signatures) talks a little more about how signify and pkg\_add handle signatures
* In the past, the OpenBSD installer would pipe the output of ftp straight to tar, but then verify the SHA256 at the end - this had the advantage of not requiring any extra disk space, but raised some security concerns
* With signify, now everything is fully downloaded and verified before tar is even invoked
* The pkg\_add utility works a little bit differently, but it's also been improved in this area - details in the post
* Be sure to also read the original post from Adam, lots of good information \*\*\*

### [FreeBSD 9.3-RC2 is out](https://lists.freebsd.org/pipermail/freebsd-stable/2014-June/079092.html) ###

* As the -RELEASE inches closer, release candidate 2 is out and ready for testing
* Since the last one, it's got some fixes for NIC drivers, the latest file and libmagic security fixes, some serial port workarounds and various other small things
* The updated bsdconfig will use pkgng style packages now too
* A lesser known fact: there are also premade virtual machine images you can use too \*\*\*

### [pkgsrcCon 2014 wrap-up](http://saveosx.org/pkgsrcCon/) ###

* In what may be the first real pkgsrcCon article we've ever had!
* Includes wrap-up discussion about the event, the talks, the speakers themselves, what they use pkgsrc for, the hackathon and basically the whole event
* Unfortunately no recordings to be found... \*\*\*

### [PostgreSQL FreeBSD performance and scalability](https://kib.kiev.ua/kib/pgsql_perf.pdf) ###

* FreeBSD developer kib@ writes a report on PostgreSQL on FreeBSD, and how it scales
* On his monster 40-core box with 1TB of RAM, he runs lots of benchmarks and posts the findings
* Lots of technical details if you're interested in getting the best performance out of your hardware
* It also includes specific kernel options he used and the rest of the configuration
* If you don't want to open the pdf file, you can [use this link](https://docs.google.com/viewer?url=https://kib.kiev.ua/kib/pgsql_perf.pdf) too \*\*\*

Feedback/Questions
----------

* [James writes in](http://slexy.org/view/s24pFjUPe4)
* [Klemen writes in](http://slexy.org/view/s21OogIgTu)
* [John writes in](http://slexy.org/view/s21rLcemNN)
* [Brad writes in](http://slexy.org/view/s203Qsx6CZ)
* [Adam writes in](http://slexy.org/view/s2eBj0FfSL) \*\*\*