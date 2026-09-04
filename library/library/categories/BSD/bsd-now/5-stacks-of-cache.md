+++
title = "5: Stacks of Cache"
description = "After returning from a successful EuroBSDCon in Malta, we're back to get you caught up on all the latest news! We've got stories, interviews and a special treat for OpenBSD fans later in the show. All that and more on this week's BSD Now, the place to B.. SD.Headlines"
date = "2013-10-02T12:00:00Z"
url = "https://www.bsdnow.tv/5"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.302733318Z"
seen = true
+++

After returning from a successful EuroBSDCon in Malta, we're back to get you caught up on all the latest news! We've got stories, interviews and a special treat for OpenBSD fans later in the show. All that and more on this week's BSD Now, the place to B.. SD.

Headlines
----------

### [FreeBSD 9.2 released](https://www.freebsd.org/releases/9.2R/relnotes.html) ###

* FreeBSD 9.2-RELEASE is finally out
* Highlights include ZFS TRIM and LZ4 support, virtio drivers, dtrace and OpenSSH updates as well as lots of driver improvements
* Will be supported until 2014-09-30
* Get out there and freebsd-update or buildworld! \*\*\*

### [Four new NetBSD releases](https://blog.netbsd.org/tnf/entry/netbsd_5_2_1_and) ###

* NetBSD 5.2 and 5.1 branches get security and bugfix updates
* The 6.1 and 6.0 branches were [updated soon after](https://blog.netbsd.org/tnf/entry/netbsd_6_1_2_and), also with security updates and bug fixes
* Check the show notes for the full changelog \*\*\*

### [BIND being replaced by unbound in FreeBSD](http://freshbsd.org/commit/freebsd/r255597) ###

* Most FreeBSD users are familiar with BIND from the security notifications
* It has has many vulnerabilities over the years, and [we’ll finally be rid of it](http://blog.des.no/2013/09/dns-in-freebsd-10/)
* Being replaced with unbound and ldns, [everyone rejoices](http://blog.des.no/2013/09/dns-again-a-clarification/)
* As of [September 24th](https://svnweb.freebsd.org/base?view=revision&revision=255850), BIND is no longer built by default
* As of [September 30th](http://freshbsd.org/commit/freebsd/r255949), BIND was completely removed
* Includes an easy to use [script](http://freshbsd.org/commit/freebsd/r255809) for local DNS
* OpenBSD also has [unbound in base](http://marc.info/?l=openbsd-cvs&m=137984954228414&w=2), but it's not built by default yet \*\*\*

### [DragonflyBSD future plans](http://lists.dragonflybsd.org/pipermail/kernel/2013-September/062975.html) ###

* An announcement was posted that details some possible plans for Dragonfly
* dports (their version of FreeBSD ports) will be switching to GCC 4.7
* i915 support is probably going to be in version 3.6
* Work is being done on HAMMER 2, but it won't make it to 3.6
* 3.6 is also likely going to ditch pkgsrc as the default in favor of dports, due to a hugely positive reaction from the community \*\*\*

### [FreeBSD ports get Stack Protector support](https://lists.freebsd.org/pipermail/freebsd-ports-announce/2013-September/000066.html) ###

* Some portsnap users noticed a massive sweep of every port being updated
* Shortly after, [stack protector](https://en.wikipedia.org/wiki/Buffer_overflow_protection) support was announced by Bryan Drewery
* Only works on i386 and AMD64 on FreeBSD 10 and AMD64 on 9
* Hopefully will become the default, but needs to go through some testing and exp-runs \*\*\*

EuroBSDCon 2013 wrap-up chat
----------

* BSD Now is back from EuroBSDCon with lots of stories
* We picked up an OpenBSD 5.4 CD set at EuroBSDCon, before the official release
* We'll give a little showcase of what's inside, they put a lot of effort into it
* Comes with the OS, source code, stickers, music, cool other stuff
* Consider [supporting the OpenBSD project](http://www.openbsd.org/orders.html) \*\*\*

Interview - Marshall Kirk McKusick - [mckusick@freebsd.org](mailto:mckusick@freebsd.org)
----------

Various topics

---

Tutorial
----------

### [Faster recompiles with ccache and tmpfs](http://www.bsdnow.tv/tutorials/ccache) ###

---

News Roundup
----------

### [List of vBSDCon speakers posted](http://blog.hostileadmin.com/2013/09/09/reminder-vbsdcon-registrations-are-open/) ###

* Registration will be open until October 23rd
* Presentations covering FreeBSD, OpenBSD, FreeNAS and others \*\*\*

### [Xen PVHVM added to GENERIC](https://svnweb.freebsd.org/base?view=revision&revision=255744) ###

* It's now possible to run FreeBSD 10 under Xen with the GENERIC kernel
* freebsd-update will work now
* With FreeBSD 10 [ALPHA 4](https://lists.freebsd.org/pipermail/freebsd-snapshots/2013-September/000045.html) just being released, should be interesting
* We should call the new kernel "XENERIC" \*\*\*

### [Dragonfly AMD KMS port](http://lists.dragonflybsd.org/pipermail/kernel/2013-September/062993.html) ###

* A Dragonfly user has started porting the new FreeBSD AMD KMS driver
* Still a work in progress, asking for help from the community \*\*\*

### [NetBSD gets an nVidia driver](http://mail-index.netbsd.org/source-changes/2013/09/18/msg047712.html) ###

* NetBSD gets a preliminary nVidia driver
* So far only supports the GeForce 2MX, so not a lot of use just yet
* No acceleration yet, but it's a start \*\*\*

### [FreeBSD cracks the top 10 on DistroWatch](http://distrowatch.com/dwres.php?resource=popularity) ###

* Over the last year FreeBSD has steadily moved up the rankings from #18 to #10
* Increasing from an average of 570 to 779 hits per day
* Surpassed CentOS, Puppy Linux and Slackware \*\*\*

Feedback/Questions
----------

* [Charlie writes in](http://slexy.org/view/s21jRKf7lp)
* [Kjell-Aleksander writes in](http://slexy.org/view/s2M0OKmxMK)
* [Stefen writes in](http://slexy.org/view/s2YlVuhhUa)
* [Sichendra writes in](http://slexy.org/view/s2P7KtE5x2) \*\*\*