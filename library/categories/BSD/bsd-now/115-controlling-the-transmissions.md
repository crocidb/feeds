+++
title = "115: Controlling the Transmissions"
description = "Controlling the TransmissionsThis episode was brought to you byiXsystems - Enterprise Servers and Storage for Open Source[DigitalOcean - Simple Cloud Hosting, Built for Developers](http://www.digital"
date = "2015-11-11T13:00:00Z"
url = "https://www.bsdnow.tv/115"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.089999571Z"
seen = false
+++

Controlling the Transmissions

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

#### [iX Systems Mission Complete](https://www.ixsystems.com/missioncomplete/) ####

* Submit your story of how you accomplished a mission with FreeBSD, FreeNAS, or iXsystems hardware, and you could win monthly prizes, and have your story featured in the FreeBSD Journal! \*\*\*

Headlines
----------

### [FreeBSD 2015 Vendor Dev Summit](https://wiki.freebsd.org/201511VendorDevSummit) ###

---

### [FreeBSD Quarterly Status Report - Third Quarter 2015](https://www.freebsd.org/news/status/report-2015-07-2015-09.html) ###

* We have a fresh quarterly status report from the FreeBSD project. Once again it almost merits an entire show, but we will try to hit all the highlights.
* Bhyve - Porting of the Intel edk2 UEFI firmware, allowing Windows in headless mode, and Illumos support. Also porting to ARM has begun!
* Improved Support for Acer C720 ChromeBooks
* High Availability Clustering in CTL (Cam Target Layer)
* Root Remounting (Similar to pivot\_root in Linux). This work allows using “reboot -r” to do a fast-reboot, with a partial shutdown, kill all processes, and re-mount rootfs and boot. Especially useful for booting from mfs or similar then transitioning to iscsi or some other backing storage
* OpenCL Support in Mesa, as well as kernel progress on the i915 driver
* Improved support for UEFI FrameBuffer on a bunch of recent MacBook Pro and other Macs, in addition to improvements to “vt” framebuffer driver for high resolution displays.
* ZFS support for UEFI Boot (Needs testing, but used in PC-BSD for a couple months now), and importing new features from IllumOS (resumable send, receive prefetch, replication checksumming, 50% less ram required for L2ARC, better prefetch)
* DTrace SDT probes added to TCP code, to replace the old TCPDEBUG kernel option. Recompiling the kernel is no longer required to debug TCP, just use DTrace
* Ongoing work to bring us a native port/package of GitLab \*\*\*

### [Meteor, the popular javascript web application framework has been forked to run on FreeBSD, OpenBSD and NetBSD - FreeBSD testers requested](https://forums.meteor.com/t/freebsd-testers-please/12919/10) ###

* We have a public call for testing for FreeBSD users of Meteor by Tom Freudenberg
* The included link includes all the details on how to currently get meteor boot-strapped on your box and bring up the server
* So far the reports are positive, many users reporting that it is running on their 10.2 systems / jails just fine.
* Just a day ago the original porter mentioned that OpenBSD is ready to go for testing using the prepared dev bundle. \*\*\*

### [Mike Larkin work continues on an native OpenBSD hypervisor, which he has announced is now booting](http://undeadly.org/cgi?action=article&sid=20151101223132) ###

* Speaking of OpenBSD, we have an update from Mike Larkin about the status of the OpenBSD native hypervisor vmm(4).
* His twitter post included the output from a successful VM bootup of OpenBSD 5.8-current, all the way to multi-user
* While the code hasn’t been committed (yet) we will keep you informed when it lands so you too can begin playing with it. \*\*\*

### [This is how I like open source](http://blog.etoilebsd.net/post/This_is_how_I_like_opensource) ###

* A blog post by FreeBSD Core Team member, and one of the lead developers of pkg, Baptiste Daroussin
* One project he has been working on is string collation
* Garrett d'Amore (of IllumOS) implemented unicode string collation while working for Nexenta and made it BSD license
* John Marino (from Dragonfly) imported the work done on Illumos into Dragonfly, while he was doing that he decided, it was probably a good idea to rework how locales are handled
* He discovered that Edwin Groothuis (from FreeBSD) had long ago started a project to simplify locales handling on FreeBSD
* He extended the tools written by Edwin and has been able to update Dragonfly to the latest (v27 so far) unicode definitions
* John Marino has worked with Bapt many times on various projects (including bringing pkg and ports to Dragonfly)
* Bapt decided it was time that FreeBSD got proper string collation support as well, and worked with John to import the support to FreeBSD
* Bapt spotted a couple of bugs and worked with John on fixing them: issues with eucJP encoding, issues with Russian encoding (John did most of the work on tracking down and fixing the bugs), Bapt also converted localedef (the tool to generate the locales) into using BSD license only code (original version used the CDDL libavl library which I modified to use tree(3)), fixed issues. I also took the locale generation from Edwin (extended by John)
* This work resulted in a nice flow of patches going from Dragonfly to FreeBSD and from FreeBSD to Dragonfly.
* And now Garrett is interested in grabbing back our patches into Illumos!
* The result of this collaboration is that now 3 OS share the same implementation for collation support! This is very good because when one discovers a bug the 3 of them benefit the fix!
* The biggest win here is that this was a lot of work, and not an area that many people are interested in working on, so it was especially important to share the work rather than reimplement it separately. \*\*\*

Interview - Hiren Panchasara - [hiren@freebsd.org](mailto:hiren@freebsd.org) / [@hirenpanchasara](https://twitter.com/hirenpanchasara)
----------

* Improving TCP \*\*\*

iXsystems
----------

* [MissonComplete winners](https://www.ixsystems.com/whats-new/october-missioncomplete-winners/) \*\*\*

News Roundup
----------

### [LibreSSL 2.3.1 released](http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.3.1-relnotes.txt) ###

* LibreSSl keeps on chugging, the latest release has landed, 2.3.1, which is the second snapshot based upon the OpenBSD 5.9 development branch.
* Currently they are targeting a stable ABI/API sometime around March 2016 for the 2.3.X series.
* Included in this update are ASN. 1 cleanups and some compliance fixes for RFC5280
* Switched internally to time\_t, with a check that the host OS supports 64bit time\_t
* Various TLS fixes, including the ability to check cert validity times with tls\_peer\_cert\_not{before|after}
* Fixed a reported memory leak in OBJ\_obj2txt \*\*\*

### [Guide for Installing Ghost w/ Nginx on FreeBSD](http://linoxide.com/linux-how-to/install-ghost-nginx-freebsd-10-2/) ###

* A nice walkthrough for the week, we’ve found an article about how to install the Ghost blogging platform on FreeBSD 10.2.
* For those who don’t know, Ghost is a MIT licensed blogging tool, started in 2012 by a former WordPress UI developer and is entirely coded in Node.js
* While a port for FreeBSD does not yet exist (somebody get on that please), this tutorial can walk you through the process of getting it deployed manually
* Most of the requirements are simple, www/node, www/npm and sqlite3.
* With those installed, most of the steps are simply creating the username / home for ghost, and some “npm” setup.
* The walkthrough even includes a handy rc.d script, making the possibility of a port seem much more likely \*\*\*

### [Adrian Chadd on 'Why attention to detail matters when you're a kernel developer](http://adrianchadd.blogspot.com/2015/10/fixing-up-qca9558-performance-on.html) ###

* Adrian was correctly trolled in the FreeBSD embedded IRC chatroom and started looking at why the bridging performance in MIPS boards was so bad
* 120-150 mbit/sec is not really enough anymore
* Using previous MIPS24k support as a starting point, Adrian managed to get HWPMC (Hardware Performance Monitoring Counters) working on MIPS74k
* Using the data collected from the performance counters Adrian was able to figure out that packets were being copied in order to meet alignment requirements of the NIC and the FreeBSD networking stack. It turns out this is no longer a requirement for most modern Atheros NICs, so the workaround could be removed
* Now performance was 180 mbit/sec
* Next, on the receive side, only the TCP stack requires strict alignment, the ethernet stack does not, so offset the start point by 2 bytes so that TCP ends up aligned, and problem solved. Or not, no performance difference...
* The problem appeared to be busdma, Ian Lepore had recently made improves in this area on armv6 and helpfully ported these over to MIPS
* Now 420 mbit/sec. Getting better, but not as fast as Linux
* After some further investigation, a missing ‘sync’ operation was added, and the memory caching was changed from writethrough to writeback
* Things were so fast now, that the descriptor ring was being run through the ring so quickly as to hit the next descriptor that is still being setup. The first was to mark the first descriptor of a multi-descriptor packet as ‘empty’ until the entire chain was setup, so it would not be processed before the latter bits were done being added to the ring.
* So now MIPS can bridge at 720 mbit/sec, and route 320 mbit/sec
* Adrian wants to improve the routing speed and get it caught up to the bridging speed, but as always, free time is scarce. \*\*\*

### [Switching from OS X to FreeBSD](http://mirrorshades.net/post/132753032310) ###

* The story of a user who had used OS X since its beta, but 10.9 and 10.10, became more and more dissatisfied
* They found they were spending too much time fighting with the system, rather than getting work done
* They cover the new workstation they bought, and the process of getting FreeBSD going on it, including why they chose FreeBSD rather than PCBSD
* Also covered it setting up a Lenovo X220 laptop
* They setup the i3wm and mutt
* The blog is very detailed and goes so far as to share a github repo of dotfiles and configuration files to ease the transition from OS X. \*\*\*

BeastieBits
----------

### [The Stack behind Netflix's scaling](http://www.scalescale.com/the-stack-behind-netflix-scaling/) ###

---

### [The Amiga port of NetBSD now has xorg support](https://mail-index.netbsd.org/source-changes/2015/11/04/msg069873.html) ###

---

### [NetBSD has announced EOL for v5.x to be November 9th](http://blog.netbsd.org/tnf/entry/end_of_life_for_netbsd) ###

---

### [RetroArch ports allow playing PlayStation, Sega, Atari, etc., games on FreeBSD](https://lists.freebsd.org/pipermail/freebsd-current/2015-November/058266.html) ###

### [OpenBSD booting on a 75mhz Cyrex system with 32MB RAM](http://gfycat.com/InnocentSneakyEwe) ###

---

### [Matthew Green reports Nouveau Nvidia can support GL with his latest commit](http://mail-index.netbsd.org/source-changes/2015/10/29/msg069729.html) ###

---

### Releases! ###

[OPNsense releases 15.7.18](https://opnsense.org/opnsense-15-7-18-released/)

[pfSense releases 2.2.5](https://blog.pfsense.org/?p=1925)

---

Feedback/Questions
----------

* [ Eric](http://slexy.org/view/s2ogdURldm)
* [ Andrew](http://slexy.org/view/s22bK2LZLm)
* [ Joseph](http://slexy.org/view/s2to6ZpBTc)
* [ Sean](http://slexy.org/view/s2oLU0KM7Y)
* [ Dustin](http://slexy.org/view/s21k6oKvle) \*\*\*

### For those of you curious about Kris' new lighting here are the links to what he is using. ###

* [Softbox Light Diffuser](http://smile.amazon.com/gp/product/B00OTG6474?psc=1&redirect=true&ref_=oh_aui_detailpage_o01_s00&pldnSite=1)
* [Full Spectrum 5500K CFL Bulb](http://smile.amazon.com/gp/product/B00198U6U6?psc=1&redirect=true&ref_=oh_aui_detailpage_o06_s00) \*\*\*