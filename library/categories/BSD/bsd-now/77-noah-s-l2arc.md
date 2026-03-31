+++
title = "77: Noah's L2ARC"
description = "This week on the show, we'll be chatting with Alex Reece and Matt Ahrens about what's new in the world of OpenZFS. After that, we're starting a new tutorial series on submitting your first patch. All the latest BSD news and answers to your emails, coming up on BSD Now - the place"
date = "2015-02-18T13:00:00Z"
url = "https://www.bsdnow.tv/77"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.165790793Z"
seen = true
+++

This week on the show, we'll be chatting with Alex Reece and Matt Ahrens about what's new in the world of OpenZFS. After that, we're starting a new tutorial series on submitting your first patch. All the latest BSD news and answers to your emails, coming up on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Revisiting FreeBSD after 20 years](http://changelog.complete.org/archives/9317-has-linux-lost-its-way-comments-prompt-a-debian-developer-to-revisit-freebsd-after-20-years) ###

* With comments like "has Linux lost its way?" floating around, a Debian developer was prompted to revisit FreeBSD after nearly two decades
* This blog post goes through his experiences trying out a modern BSD variant, and includes the good, the bad and the ugly - not just praise this time
* He loves ZFS and the beadm tool, and finds the FreeBSD implementation to be much more stable than ZoL
* On the topic of jails, he summarizes: "Linux has tried so hard to get this right, and fallen on its face so many times, a person just wants to take pity sometimes. We’ve had linux-vserver, openvz, lxc, and still none of them match what FreeBSD jails have done for a long time."
* The post also goes through the "just plain different" aspects of a complete OS vs. a distribution of various things pieced together
* Finally, he includes some things he wasn't so happy about: subpar laptop support, virtualization being a bit behind, a *myriad* of complaints about pkgng and a few other things
* There was some [decent discussion](https://news.ycombinator.com/item?id=9063216) on Hacker News about this article too, with counterpoints from both sides \*\*\*

### [s2k15 hackathon report: network stack SMP](http://undeadly.org/cgi?action=article&sid=20150218085759) ###

* The first trip report from the recent OpenBSD hackathon in Australia has finally been submitted
* One of the themes of this hackathon was SMP (symmetric multiprocessing) improvement, and Martin Pieuchot did some hacking on the network stack
* If you're not familiar with him, he gave a [presentation](http://www.openbsd.org/papers/tamingdragons.pdf) at EuroBSDCon last year, titled [Taming OpenBSD Network Stack Dragons](<https://va.ludost.net/files/eurobsdcon/2014/Rodopi/03.Saturday/03.Taming OpenBSD Network Stack Dragons - Martin Pieuchot.mp4>)
* Teaming up with David Gwynne, they worked on getting some bits of the networking code out of the [big lock](https://en.wikipedia.org/wiki/Giant_lock)
* Hopefully more trip reports will be sent in during the coming weeks
* Most of the big code changes should probably appear after the 5.7-release testing period \*\*\*

### [From BIND to NSD and Unbound](https://www.tumfatig.net/20150215/bind-nsd-unbound-openbsd-5-6/) ###

* If you've been running a DNS server on any of the BSDs, you've probably noticed a semi-recent trend: BIND being replaced with Unbound
* BIND was ripped out in FreeBSD 10.0 and will be gone in OpenBSD 5.7, but both systems include Unbound now as an alternative
* OpenBSD goes a step further, also including NSD in the base system, whereas you'll need to install that from ports on FreeBSD
* Instead of one daemon doing everything like BIND tried to do, this new setup splits the authoritative nameserver and the caching resolver into two separate daemons
* This post takes you through the transitional phase of going from a single BIND setup to a combination of NSD and Unbound
* All in all, everyone wins here, as there will be a lot less security advisories in both BSDs because of it... \*\*\*

### [m0n0wall calls it quits](http://m0n0.ch/wall/end_announcement.php) ###

* The original, classic BSD firewall distribution [m0n0wall](https://en.wikipedia.org/wiki/M0n0wall) has finally decided to close up shop
* For those unfamiliar, m0n0wall was a FreeBSD-based firewall project that put a lot of focus on embedded devices: running from a CF card, CD, USB drive or **even a floppy disk**
* It started over twelve years ago, which is pretty amazing when you consider that's around half of FreeBSD itself's lifespan
* The project was probably a lot of people's first encounter with BSD in any form
* If you were a m0n0wall user, fear not, you've got *plenty* of choices for a potential replacement: doing it yourself with something like [FreeBSD](http://blog.pcbsd.org/2015/01/using-trueos-as-a-ipfw-based-home-router/) or [OpenBSD](http://www.bsdnow.tv/tutorials/openbsd-router), or going the premade route with something like [pfSense](http://www.bsdnow.tv/episodes/2014_02_19-a_sixth_pfsense), [OPNsense](http://www.bsdnow.tv/episodes/2015_01_14-common_sense_approach) or the [BSD Router Project](http://www.bsdnow.tv/episodes/2014_10_22-dont_buy_a_router)
* The founder's announcement includes these closing words: "m0n0wall has served as the seed for several other well known open source projects, like pfSense, FreeNAS and AskoziaPBX. The newest offspring, OPNsense, aims to continue the open source spirit of m0n0wall while updating the technology to be ready for the future. In my view, it is the perfect way to bring the m0n0wall idea into 2015, and I encourage all current m0n0wall users to check out OPNsense and contribute if they can."
* While m0n0wall didn't get a lot of on-air mention, surely a lot of our listeners will remember it fondly \*\*\*

Interview - Alex Reece & Matt Ahrens - [alex@delphix.com](mailto:alex@delphix.com) & [matt@delphix.com](mailto:matt@delphix.com) / [@openzfs](https://twitter.com/openzfs)
----------

What's new in OpenZFS

---

Tutorial
----------

### [Making your first patch (OpenBSD)](http://www.bsdnow.tv/tutorials/patching-obsd) ###

---

News Roundup
----------

### [Overlaying remote LANs with OpenBSD's VXLAN](http://www.echothrust.com/blogs/using-openbsd-and-vxlan-overlay-remote-lans) ###

* Have you ever wanted to "merge" multiple remote LANs? OpenBSD's [vxlan(4)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man4/vxlan.4) is exactly what you need
* This article talks about using it to connect two virtualized infrastructures on different ESXi servers
* It gives a bit of networking background first, in case you're not quite up to speed on all this stuff
* This tool opens up a lot of very cool possibilities, even possibly doing a "remote" LAN party
* Be sure to check the [AsiaBSDCon talk](https://www.youtube.com/watch?v=ufeEP_hzFN0) about VXLANs if you haven't already \*\*\*

### [2020, year of the PCBSD desktop](http://lukewolf.blogspot.com/2015/02/a-prediction-2020-year-of-pc-bsd-on.html) ###

* Here we have a blog post about BSD on the desktop, straight from a KDE developer
* He predicts that PCBSD is going to take off before the year 2020, possibly even overtaking Linux's desktop market share (small as it may be)
* With PCBSD making a preconfigured FreeBSD desktop a reality, and the new KMS work, the author is impressed with how far BSD has come as a viable desktop option
* ZFS and easy-to-use boot environments top the list of things he says differentiate the BSD desktop experience from the Linux one
* There was also some [discussion on Slashdot](http://bsd.slashdot.org/story/15/02/16/2355236/pc-bsd-set-for-serious-growth) that might be worth reading \*\*\*

### [OpenSSH host key rotation, redux](http://blog.djm.net.au/2015/02/hostkey-rotation-redux.html) ###

* We mentioned the new OpenSSH host key rotation and other goodies in [a previous episode](http://www.bsdnow.tv/episodes/2015_02_04-from_the_foundation_1), but things have changed a little bit since then
* [djm](http://www.bsdnow.tv/episodes/2013_12_18-cryptocrystalline) says "almost immediately after smugly declaring 'mission accomplished', the bug reports started rolling in."
* There were some initial complaints from developers about the new options, and a serious bug shortly thereafter
* After going back to the drawing board, he refactored some of the new code (and API) and added some more regression tests
* Most importantly, the bigger big fix was described as: "a malicious server (say, "host-a") could advertise the public key of another server (say, "host-b"). Then, when the client subsequently connects back to host-a, instead of answering the connection as usual itself, host-a could proxy the connection to host-b. This would cause the user to connect to host-b when they think they are connecting to host-a, which is a violation of the authentication the host key is supposed to provide."
* None of this code has been in a formal OpenSSH release just yet, but hopefully it will soon \*\*\*

### [PCBSD tries out LibreSSL](https://github.com/pcbsd/pcbsd/commit/6ede13117dcee1272d7a7060b16818506874286e) ###

* PCBSD users may soon be seeing a lot less security problems because of two recent changes
* After switching over to OpenNTPD [last week](http://www.bsdnow.tv/episodes/2015_02_11-time_for_a_change), PCBSD decides to give the [portable LibreSSL](http://www.bsdnow.tv/episodes/2014_07_30-liberating_ssl) a try too
* Note that this is only for the packages built from ports, not the base system unfortunately
* They're not the first ones to do this - OPNsense has been experimenting with replacing OpenSSL in their ports tree for a little while now, and of course all of OpenBSD's ports are built against it
* A good [number of patches](https://github.com/pcbsd/freebsd-ports/commit/2eee669f4d6ab9a641162ecda29b62ab921438eb) are still not committed in vanilla FreeBSD ports, so they had to borrow some from Bugzilla
* Look forward to Kris wearing a "[keep calm and abandon OpenSSL](https://www.openbsdstore.com/cgi-bin/live/ecommerce.pl?site=shop_openbsdeurope_com&state=item&dept_id=01&sub_dept_id=01&product_id=TSHIRTOSSL)" shirt in the near future \*\*\*

Feedback/Questions
----------

* [Benjamin writes in](http://slexy.org/view/s28nyJ5omV)
* [Mike writes in](http://slexy.org/view/s2wYUmUmh0)
* [Brad writes in](http://slexy.org/view/s2BAKAQvMt) \*\*\*

Mailing List Gold
----------

* [Debian](https://lists.freebsd.org/pipermail/svn-src-head/2015-February/068405.html) [Dejavu](https://lists.freebsd.org/pipermail/freebsd-current/2015-February/054580.html)
* [Package gone missing](http://lists.dragonflybsd.org/pipermail/users/2015-February/207475.html) \*\*\*