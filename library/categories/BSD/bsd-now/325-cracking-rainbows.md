+++
title = "325: Cracking Rainbows"
description = "FreeBSD 12.1 is here, A history of Unix before Berkeley, FreeBSD development setup, HardenedBSD 2019 Status Report, DNSSEC, compiling RainbowCrack on OpenBSD, and more.HeadlinesFreeBSD 12.1 * Some of the hig"
date = "2019-11-21T12:00:00Z"
url = "https://www.bsdnow.tv/325"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.585889107Z"
seen = true
+++

FreeBSD 12.1 is here, A history of Unix before Berkeley, FreeBSD development setup, HardenedBSD 2019 Status Report, DNSSEC, compiling RainbowCrack on OpenBSD, and more.

Headlines
----------

### [FreeBSD 12.1](https://www.freebsd.org/releases/12.1R/announce.html) ###

* Some of the highlights:

  * BearSSL has been imported to the base system.
  * The clang, llvm, lld, lldb, compiler-rt utilities and libc++ have been updated to version 8.0.1.
  * OpenSSL has been updated to version 1.1.1d.
  * Several userland utility updates.

* For a complete list of new features and known problems, please see the online release notes and errata list, available at: [https://www.FreeBSD.org/releases/12.1R/relnotes.html](https://www.FreeBSD.org/releases/12.1R/relnotes.html)

---

### [A History of UNIX before Berkeley: UNIX Evolution: 1975-1984.](http://www.darwinsys.com/history/hist.html) ###

>
>
> Nobody needs to be told that UNIX is popular today. In this article we will show you a little of where it was yesterday and over the past decade. And, without meaning in the least to minimise the incredible contributions of Ken Thompson and Dennis Ritchie, we will bring to light many of the others who worked on early versions, and try to show where some of the key ideas came from, and how they got into the UNIX of today.
>
>
>
> Our title says we are talking about UNIX evolution. Evolution means different things to different people. We use the term loosely, to describe the change over time among the many different UNIX variants in use both inside and outside Bell Labs. Ideas, code, and useful programs seem to have made their way back and forth - like mutant genes - among all the many UNIXes living in the phone company over the decade in question.
>
>
>
> Part One looks at some of the major components of the current UNIX system - the text formatting tools, the compilers and program development tools, and so on. Most of the work described in Part One took place at `Research'', a part of Bell Laboratories (now AT&T Bell Laboratories, then as now`the Labs''), and the ancestral home of UNIX. In planned (but not written) later parts, we would have looked at some of the myriad versions of UNIX - there are far more than one might suspect. This includes a look at Columbus and USG and at Berkeley Unix. You'll begin to get a glimpse inside the history of the major streams of development of the system during that time.
>
>

---

News Roundup
----------

### [My FreeBSD Development Setup](https://adventurist.me/posts/00296) ###

>
>
> I do my FreeBSD development using git, tmux, vim and cscope.
>
>
>
> I keep a FreeBSD fork on my github, I have forked [https://github.com/freebsd/freebsd](https://github.com/freebsd/freebsd) to [https://github.com/adventureloop/freebsd](https://github.com/adventureloop/freebsd)
>
>

---

### [OPNsense 19.7.6 released](https://opnsense.org/opnsense-19-7-6-released/) ###

>
>
> As we are experiencing the Suricata community first hand in Amsterdam we thought to release this version a bit earlier than planned. Included is the latest Suricata 5.0.0 release in the development version. That means later this November we will releasing version 5 to the production version as we finish up tweaking the integration and maybe pick up 5.0.1 as it becomes available.
>
>
>
> LDAP TLS connectivity is now integrated into the system trust store, which ensures that all required root and intermediate certificates will be seen by the connection setup when they have been added to the authorities section. The same is true for trusting self-signed certificates. On top of this, IPsec now supports public key authentication as contributed by Pascal Mathis.
>
>

---

### [HardenedBSD November 2019 Status Report.](https://hardenedbsd.org/article/shawn-webb/2019-11-09/hardenedbsd-status-report) ###

>
>
> We at HardenedBSD have a lot of news to share. On 05 Nov 2019, Oliver Pinter resigned amicably from the project. All of us at HardenedBSD owe Oliver our gratitude and appreciation. This humble project, named by Oliver, was born out of his thesis work and the collaboration with Shawn Webb. Oliver created the HardenedBSD repo on GitHub in April 2013. The HardenedBSD Foundation was formed five years later to carry on this great work.
>
>

---

### [DNSSEC enabled in default unbound(8) configuration.](https://undeadly.org/cgi?action=article;sid=20191110123908) ###

>
>
> DNSSEC validation has been enabled in the default unbound.conf(5) in -current. The relevant commits were from Job Snijders (job@)
>
>

---

### [How to Install Shopware with NGINX and Let's Encrypt on FreeBSD 12](https://www.howtoforge.com/how-to-install-shopware-with-nginx-and-lets-encrypt-on-freebsd-12/) ###

>
>
> Shopware is the next generation of open source e-commerce software. Based on bleeding edge technologies like Symfony 3, Doctrine2 and Zend Framework Shopware comes as the perfect platform for your next e-commerce project. This tutorial will walk you through the Shopware Community Edition (CE) installation on FreeBSD 12 system by using NGINX as a web server.
>
>

* Requirements

>
>
> Make sure your system meets the following minimum requirements:
>
>
>
> * Linux-based operating system with NGINX or Apache 2.x (with mod\_rewrite) web server installed.
> * PHP 5.6.4 or higher with ctype, gd, curl, dom, hash, iconv, zip, json, mbstring, openssl, session, simplexml, xml, zlib, fileinfo, and pdo/mysql extensions. PHP 7.1 or above is strongly recommended.
> * MySQL 5.5.0 or higher.
> * Possibility to set up cron jobs.
> * Minimum 4 GB available hard disk space.
> * IonCube Loader version 5.0.0 or higher (optional).
>
>

---

### [How to Compile RainbowCrack on OpenBSD](https://cromwell-intl.com/open-source/compiling-rainbowcrack-on-openbsd.html) ###

>
>
> Project RainbowCrack was originally Zhu Shuanglei's implementation, it's not clear to me if the project is still just his or if it's even been maintained for a while. His page seems to have been last updated in August 2007.
>
>
>
> The Project RainbowCrack web page now has just binaries for Windows XP and Linux, both 32-bit and 64-bit versions.
>
>
>
> Earlier versions were available as source code. The version 1.2 source code does not compile on OpenBSD, and in my experience it doesn't compile on Linux, either. It seems to date from 2004 at the earliest, and I think it makes some version-2.4 assumptions about Linux kernel headers.
>
>

* You might also look at ophcrack, a more modern tool, although it seems to be focused on cracking Windows XP/Vista/7/8/10 password hashes

---

Feedback/Questions
----------

* Reese - [Amature radio info](http://dpaste.com/2RDG9K4#wrap)
* Chris - [VPN](http://dpaste.com/2K4T2FQ#wrap)
* Malcolm - [NAT](http://dpaste.com/138NEMA)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.