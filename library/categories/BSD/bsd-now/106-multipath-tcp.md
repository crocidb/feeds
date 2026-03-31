+++
title = "106: Multipath TCP"
description = "This week, we have Nigel Williams here to bring us all sorts of info about Multipath TCP, what it is, how it works and the ongoing effort to bring it into FreeBSD. All that and of course the latest BSD news coming your way, right now!This episode was brought to you by[!"
date = "2015-09-09T12:00:00Z"
url = "https://www.bsdnow.tv/106"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.106050638Z"
seen = true
+++

This week, we have Nigel Williams here to bring us all sorts of info about Multipath TCP, what it is, how it works and the ongoing effort to bring it into FreeBSD. All that and of course the latest BSD news coming your way, right now!

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Backing out changes doesn.t always pinpoint the problem ](https://blog.crashed.org/dont-backout/) ###

* Peter Wemm brings us a fascinating look at debugging an issue which occurred on the FreeBSD build cluster recently.
* Bottom line? Backing out something isn.t necessarily the fix, rather it should be apart of the diagnostic process
* In this particular case, a change to some mmap() functionality ended up exposing a bug in the kernel.s page fault handler which existed since (wait for it.) 1997!
* As Peter mentions at the bottom of the Article, this bug had been showing up for years, but was sporadic and often written off as a networking hiccup. \*\*\*

### [BSD Router Project benchmarks new routing changes to FreeBSD ](https://github.com/ocochard/netbenchs/blob/master/Xeon_E5-2650-8Cores-Chelsio_T540-CR/nXxq10g/results/fbsd11-melifaro.r287531/README.md) ###

* A project branch of FreeBSD -CURRENT has been created with a number of optimizations to the routing code
* [Alexander V. Chernikov (melifaro@).s routing branch ](https://svnweb.freebsd.org/base/projects/routing/?view=log)
* The net result is an almost doubling of peak performance in packets per second
* Performance scales well with the number of NIC queues (2 queues is 88% faster than 1 queue, 3 is 270% faster). Unlike the previous code, when the number of queues hits 4, performance is down by only 10%, instead of being cut nearly in half
* [Other Benchmark Results, and the tools to do your own tests ](https://github.com/ocochard/netbenchs) \*\*\*

### [When is SSL not SSL?](http://www.tedunangst.com/flak/post/the-peculiar-libretunnel-situation) ###

* Our buddy Ted has a good write-up on a weird situation related to licensing of stunnel and LibreSSL
* The problem exists due to stunnel being released with a different license, that is technically incompatible with the GPL, as well as linking against non-OpenSSL versions.
* The author has also decided to create specific named exceptions when the \*SSL lib is part of the base operating system, but does not personally consider LibreSSL as a valid linking target on its own
* Ted points out that the LibreSSL team considers LibreSSL == OpenSSL, so this may be a moot concern \*\*\*

### [Update on systembsd ](http://darknedgy.net/files/systembsd.pdf) ###

* We.ve mentioned the GSoC project to create a SystemD shim in OpenBSD before. Now we have the slides from Ian Sutton talking about this project.
* As a refresher, this project is to take DBUS and create daemons emulating various systemd components, such as hostnamed, localed, timedated, and friends.
* Written from scratch in C, it was mainly created in the hopes of becoming a port, allowing Gnome and related tools to function on OpenBSD.
* This is a good read, especially for current or aspiring porters who want to bring over newer versions of applications which now depend upon SystemD. \*\*\*

Interview - Nigel Williams - [[njwilliams@swin.edu.au](mailto:njwilliams@swin.edu.au)]([njwilliams@swin.edu.au](mailto:njwilliams@swin.edu.au))
----------

Multipath TCP

---

News Roundup
----------

### [OpenBSD UEFI boot loader](http://marc.info/?l=openbsd-cvs&m=144115942223734&w=2) ###

* We.ve mentioned the ongoing work to bring UEFI booting to OpenBSD and it looks like this has now landed in the tree
* The .fdisk. utility has also been updated with a new -b flag, when used with .-i. will create the special EFI system partition on amd64/i386 . ([http://marc.info/?l=openbsd-cvs&m=144139348416071&w=2](http://marc.info/?l=openbsd-cvs&m=144139348416071&w=2))
* [Some twitter benchmarks ](https://twitter.com/mherrb/status/641004331035193344) \*\*\*

### [FreeBSD Journal, July/August issue ](https://www.freebsdfoundation.org/journal/vol2_no4/) ###

* The latest issue of the FreeBSD Journal has arrived
* As always, the Journal opens with a letter from the FreeBSD Foundation
* Feature Articles:
* Groupon's Deal on FreeBSD -- How to drive adoption of FreeBSD at your organization, and lessons learned in retraining Linux sysadmins
* FreeBSD: The Isilon Experience -- Mistakes not to make when basing a product on FreeBSD. TL;DR: track head
* Reflections on FreeBSD.org: Packages -- A status update on where we are with binary packages, what issues have been overcome, and which still remain
* Inside the Foundation -- An overview of some of the things you might not be aware that the FreeBSD Foundation is doing to support the project and attract the next generation of committers
* Includes a book review of .The Practise of System and Network Administration.
* As usual, various other reports are included: The Ports Report, SVN Update, A conference report, a report from the Essen hackathon, and the Event Calendar \*\*\*

### [Building ARMv6 packages on FreeBSD, the easy way ](http://blogs.freebsdish.org/brd/2015/08/25/building-arm-packages-with-poudriere-the-simple-way/) ###

* Previously we have discussed how to build ARMv6 packages on FreeBSD
* We also interviewed Sean Bruno about his work in this area
* Thankfully, over time this process has been simplified, and no longer requires a lot of manual configuration, or fussing with the .image activator.
* Now, you can just build packages for your Raspberry Pi or similar device, just as simply as you would build for x86, it just takes longer to build. \*\*\*

### [New PC-BSD Release Schedule](http://blog.pcbsd.org/2015/09/new-release-schedule-for-pc-bsd/) ###

* The PC-BSD Team has announce an updated release schedule for beyond 10.2
* This schedule follows more closely the FreeBSD schedules, with major releases only occurring when FreeBSD does the next point update, or major version bump.
* PC-BSD.s source tree has been split into master(current) and stable as well
* PRODUCTION / EDGE packages will be built from stable, with PRODUCTION updated monthly now. The -CURRENT monthly images will contain the master source builds. \*\*\*

Feedback/Questions
----------

* [Joris writes in](http://slexy.org/view/s21cguSv7E)
* [ Anonymous ](http://slexy.org/view/s217A5NNGg)
* [ Darin ](http://slexy.org/view/s20HyiqJV0) \*\*\*