+++
title = "74: That Sly MINIX"
description = "Coming up this week, we've got something a little bit different for you. We'll be talking with Andrew Tanenbaum, the creator of MINIX. They've recently imported parts of NetBSD into their OS, and we'll find out how and why that came about. As always, all the latest news and answe"
date = "2015-01-28T13:00:00Z"
url = "https://www.bsdnow.tv/74"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.173171017Z"
seen = false
+++

Coming up this week, we've got something a little bit different for you. We'll be talking with Andrew Tanenbaum, the creator of MINIX. They've recently imported parts of NetBSD into their OS, and we'll find out how and why that came about. As always, all the latest news and answers to your emails, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [The missing EuroBSDCon videos](http://2014.eurobsdcon.org/) ###

* Some of the missing videos from EuroBSDCon 2014 [we mentioned before](http://www.bsdnow.tv/episodes/2014_11_19-rump_kernels_revisited) have mysteriously appeared
* [Jordan Hubbard](http://www.bsdnow.tv/episodes/2013_11_27-bridging_the_gap), [FreeBSD, looking forward to another 10 years](<https://va.ludost.net/files/eurobsdcon/2014/Vitosha/03.Saturday/01.Keynote - FreeBSD: looking forward to another 10 years - Jordan Hubbard.mp4>)
* Lourival Viera Neto, [NPF scripting with Lua](<https://va.ludost.net/files/eurobsdcon/2014/Vitosha/03.Saturday/06.NFS scripting with Lua - Lourival Viera Neto.mp4>)
* Kris Moore, [Snapshots, replication and boot environments](<https://va.ludost.net/files/eurobsdcon/2014/Vitosha/03.Saturday/02.Snapshots, replication and boot environments - Kris Moore.mp4>)
* Andy Tanenbaum, [A reimplementation of NetBSD based on a microkernel](<https://va.ludost.net/files/eurobsdcon/2014/Vitosha/03.Saturday/07.A reimplementation of NetBSD based on a microkernel - Andy Tanenbaum.mp4>)
* [Kirk McKusick](http://www.bsdnow.tv/episodes/2013-10-02_stacks_of_cache), [An introduction to FreeBSD's implementation of ZFS](<https://va.ludost.net/files/eurobsdcon/2014/Vitosha/03.Saturday/03.An introduction to the implementation of ZFS - Kirk McKusick.mp4>)
* Emannuel Dreyfus, [FUSE and beyond, bridging filesystems](<https://va.ludost.net/files/eurobsdcon/2014/Vitosha/03.Saturday/05.FUSE and beyond: bridging filesystems - Emannuel Dreyfus.mp4>)
* [John-Mark Gurney](http://www.bsdnow.tv/episodes/2014_10_29-ipsecond_wind), [Optimizing GELI performance](<https://va.ludost.net/files/eurobsdcon/2014/Vitosha/03.Saturday/04.Optimizing GELI performance - John-Mark Gurney.mp4>)
* Unfortunately, there are still about six talks missing… and no ETA \*\*\*

### [FreeBSD on a MacBook Pro (or two)](https://gist.github.com/mpasternacki/974e29d1e3865e940c53) ###

* We've got a couple posts about running FreeBSD on a MacBook Pro this week
* In the first one, the author talks a bit about trying to run Linux on his laptop for quite a while, going back and forth between it and something that Just Works™
* Eventually he came full circle, and the focus on using only GUI tools got in the way, instead of making things easier
* He works on a lot of FreeBSD-related software, so switching to it for a desktop seems to be the obvious next step
* He's still not quite to that point yet, but documents his experiments with BSD as a desktop
* The [second article](http://blog.foxkit.us/2015/01/freebsd-on-apple-macbook-pro-13-late.html) also documents an ex-Linux user switching over to BSD for their desktop
* It [also covers](http://blog.foxkit.us/2015/01/freebsd-on-apple-macbook-pro-82-now.html) power management, bluetooth and trackpad setup
* On the topic of Gentoo, "Underneath the beautiful and easy-to-use Portage system lies the same glibc, the same turmoil over a switch to a less-than-ideal init system, and the same kernel-level bugs that bring my productivity down"
* Check out both articles if you've been considering running FreeBSD on a MacBook \*\*\*

### [Remote logging over TLS](https://www.marc.info/?l=openbsd-tech&m=142136923124184&w=2) ###

* In most of the BSDs, syslogd has been able to remotely send logs to another server for a long time
* That feature can be very useful, especially for forensics purposes - it's much harder for an attacker to hide their activities if the logs aren't on the same server
* The problem is, of course, that it's [sent in cleartext](https://en.wikipedia.org/wiki/Syslog#Protocol), unless you tunnel it over SSH or use some kind of third party wrapper
* With a few [recent commits](https://www.marc.info/?l=openbsd-cvs&m=142160989610410&w=2), OpenBSD's syslogd now supports sending logs over TLS natively, including X509 certificate verification
* By default, syslogd runs as an unprivileged user in a chroot on OpenBSD, so there were some initial concerns about certificate verification - how does that user access the CA chain *outside* of the chroot?
* That problem [was also conquered](https://www.marc.info/?l=openbsd-tech&m=142188450524692&w=2), by loading the CA chain [directly from memory](https://www.marc.info/?l=openbsd-cvs&m=142191799331938&w=2), so the entire process [can be run in the chroot](https://www.marc.info/?l=openbsd-cvs&m=142191819131993&w=2) without issue
* Some of the privsep verifcation code even [made its way into](https://www.marc.info/?l=openbsd-cvs&m=142191878632141&w=2) LibreSSL right afterwards
* If you haven't set up remote logging before, now might be an interesting time to try it out \*\*\*

### [FreeBSD, not a Linux distro](https://www.youtube.com/watch?v=wwbO4eTieQY) ###

* George Neville-Neil gave a presentation recently, titled "FreeBSD: not a Linux distro"
* It's meant to be an introduction to new users that might've heard about FreeBSD, but aren't familiar with any BSD history
* He goes through some of that history, and talks about what FreeBSD is and why you might want to use it over other options
* There's even an interesting "thirty years in three minutes" segment
* It's not just a history lesson though, he talks about some of the current features and even some new things coming in the next version(s)
* We also learn about filesystems, jails, capsicum, clang, dtrace and the various big companies using FreeBSD in their products
* This might be a good video to show your friends or potential employer if you're looking to introduce FreeBSD to them \*\*\*

### [Long-term support considered harmful](http://www.tedunangst.com/flak/post/long-term-support-considered-harmful) ###

* There was recently a [pretty horrible bug](https://www.marc.info/?l=bugtraq&m=142237866420639&w=2) in GNU's libc (BSDs aren't affected, don't worry)
* Aside from the severity of the actual problem, the fix was [delayed](https://code.google.com/p/chromium/issues/detail?id=364511) for quite a long time, leaving people vulnerable
* Ted Unangst writes a post about how this [idea of long-term support](https://plus.google.com/u/0/+ArtoPekkanen/posts/88jk5ggXYts?cfem=1) could actually be harmful in the long run, and compares it to how OpenBSD does things
* OpenBSD releases a new version every six months, and only the two most recent releases get support and security fixes
* He describes this as both a good thing and a bad thing: all the bugs in the ecosystem get flushed out within a year, but it forces people to stay (relatively) up-to-date
* "Upgrades only get harder and more painful (and more fragile) the longer one goes between them. More changes, more damage. Frequent upgrades amortize the cost and ensure that regressions are caught early."
* There was also [some](https://lobste.rs/s/a4iijx/long_term_support_considered_harmful) [discussion](https://news.ycombinator.com/item?id=8954737) about the article you can check out \*\*\*

Interview - Andrew Tanenbaum - [info@minix3.org](mailto:info@minix3.org) / [@minix3](https://twitter.com/minix3)
----------

MINIX's integration of NetBSD

---

News Roundup
----------

### [Using AFL on OpenBSD](http://www.undeadly.org/cgi?action=article&sid=20150121093259) ###

* We've talked about [American Fuzzy Lop](http://lcamtuf.coredump.cx/afl/) a bit on a previous episode, and how some OpenBSD devs [are using it](https://www.marc.info/?l=openbsd-cvs&w=2&r=1&s=afl&q=b) to catch and fix new bugs
* Undeadly has a cool guide on how you can get started with fuzzing
* It's a little on the advanced side, but if you're interested in programming or diagnosing crashes, it'll be a really interesting article to read
* Lots of recent CVEs in other open source projects are attributed to fuzzing - it's a great way to stress test your software \*\*\*

### [Lumina 0.8.1 released](http://blog.pcbsd.org/2015/01/lumina-desktop-0-8-1-released/) ###

* A new version of Lumina, the BSD-licensed desktop environment from PCBSD, has been released
* This update includes some new plugins, lots of bugfixes and even "quality-of-life improvements"
* There's a new audio player desktop plugin, a button to easily minimize all windows at once and some cool new customization options
* You can get it in PCBSD's edge repo or install it through regular ports (on FreeBSD, OpenBSD *or* DragonFly!)
* If you haven't seen our episode about Lumina, where we interview the developer and show you a tour of its features, [gotta go watch it](http://www.bsdnow.tv/episodes/2014_09_10-luminary_environment) \*\*\*

### [My first OpenBSD port](http://homing-on-code.blogspot.com/2015/01/my-first-openbsd-port.html) ###

* The author of the "Code Rot & Why I Chose OpenBSD" article has a new post up, this time about ports
* He recently made his first port and got it into the tree, so he talks about the whole process from start to finish
* After learning some of the basics and becoming comfortable running -current, he noticed there wasn't a port for the "Otter" web browser
* At that point he did what you're *supposed to do* in that situation, and started working on it himself
* OpenBSD has a great [porter's handbook](http://www.openbsd.org/faq/ports/) that he referenced throughout the process
* Long story short, his browser of choice is in the official ports collection and now he's the maintainer (and gets to deal with any bug reports, of course)
* If some software you use isn't available for whatever BSD you're using, you could be the one to make it happen \*\*\*

### [How to slide with DragonFly](http://www.dragonflybsd.org/docs/docs/howtos/howtoslide/) ###

* DragonFly BSD has a new HAMMER FS utility called "Slider"
* It's used to easily browse through file history and undelete files - imagine something like a commandline version of Apple's Time Machine
* They have a pretty comprehensive guide on how to use it on their wiki page
* If you're using HAMMER FS, this is a really handy tool to have, check it out \*\*\*

### [OpenSMTPD with Dovecot and Salt](https://blog.al-shami.net/2015/01/howto-small-mail-server-with-salt-dovecot-and-opensmtpd/) ###

* We recently had a feedback question about which mail servers you can use on BSD - Postfix, Exim and OpenSMTPD being the big three
* This blog post details how to set up OpenSMTPD, including Dovecot for IMAP and Salt for quick and easy deployment
* Intrigued by it becoming the default MTA in OpenBSD, the author decided to give it a try after being a long-time Postfix fan
* "Small, fast, stable, and very easy to customize, no more ugly m4 macros to deal with"
* Check it out if you've been thinking about configuring your first mail server on any of the BSDs \*\*\*

Feedback/Questions
----------

* [Christopher writes in](http://slexy.org/view/s20q2fSfEO) ([handbook section](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/jails-ezjail.html#jails-ezjail-update-os))
* [Mark writes in](http://slexy.org/view/s2zGvAczeN)
* [Kevin writes in](http://slexy.org/view/s21Dn2Tey8)
* [Stefano writes in](http://slexy.org/view/s215nxxrtF)
* [Matthew writes in](http://slexy.org/view/s20cwezc9l) \*\*\*

Mailing List Gold
----------

* [Not that interested actually](https://www.marc.info/?l=openbsd-misc&m=142194821910087&w=2)
* [This guy again](https://lists.freebsd.org/pipermail/freebsd-jail/2015-January/002742.html)
* [Yep, this is the place](https://lists.freebsd.org/pipermail/freebsd-doc/2015-January/024888.html) \*\*\*