+++
title = "64: Rump Kernels Revisited"
description = "This time on the show, we'll be talking with Justin Cormack about NetBSD rump kernels. We'll learn how to run them on other operating systems, what's planned for the future and a lot more. As always, answers to viewer-submitted questions and all the news for the week, on BSD Now "
date = "2014-11-19T13:00:00Z"
url = "https://www.bsdnow.tv/64"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.194348Z"
seen = false
+++

This time on the show, we'll be talking with Justin Cormack about NetBSD rump kernels. We'll learn how to run them on other operating systems, what's planned for the future and a lot more. As always, answers to viewer-submitted questions and all the news for the week, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [EuroBSDCon 2014 talks and tutorials](http://2014.eurobsdcon.org/talks-and-schedule/) ###

* The 2014 EuroBSDCon videos have been online for over a month, but unannounced - keep in mind these links may be temporary (but we'll mention their new location in a future show and fix the show notes if that's the case) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Arun Thomas, [BSD ARM Kernel Internals](<https://va.ludost.net/files/eurobsdcon/2014/Rodopi/03.Saturday/01.BSD-ARM Kernel Internals - Arun Thomas.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Ted Unangst, [Developing Software in a Hostile Environment](<https://va.ludost.net/files/eurobsdcon/2014/Rodopi/03.Saturday/02.Developing Software in a Hostile Environment - Ted Unangst.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Martin Pieuchot, [Taming OpenBSD Network Stack Dragons](<https://va.ludost.net/files/eurobsdcon/2014/Rodopi/03.Saturday/03.Taming OpenBSD Network Stack Dragons - Martin Pieuchot.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Henning Brauer, [OpenBGPD turns 10 years](<https://va.ludost.net/files/eurobsdcon/2014/Rodopi/03.Saturday/04.OpenBGPD turns 10 years -  Henning Brauer.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Claudio Jeker, [vscsi and iscsid iSCSI initiator the OpenBSD way](<https://va.ludost.net/files/eurobsdcon/2014/Rodopi/03.Saturday/05.vscsi(4) and iscsid - iSCSI initiator the OpenBSD way - Claudio Jeker.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Paul Irofti, [Making OpenBSD Useful on the Octeon Network Gear](<https://va.ludost.net/files/eurobsdcon/2014/Rodopi/03.Saturday/06.Making OpenBSD Useful on the Octeon Network Gear - Paul Irofti.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Baptiste Daroussin, [Cross Building the FreeBSD ports tree](<https://va.ludost.net/files/eurobsdcon/2014/Rodopi/04.Sunday/01.Cross Building the FreeBSD ports tree - Baptiste Daroussin.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Boris Astardzhiev, [Smartcom’s control plane software, a customized version of FreeBSD](<https://va.ludost.net/files/eurobsdcon/2014/Rodopi/04.Sunday/02.Smartcom’s control plane software, a customized version of FreeBSD - Boris Astardzhiev.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Michał Dubiel, [OpenStack and OpenContrail for FreeBSD platform](<https://va.ludost.net/files/eurobsdcon/2014/Rodopi/04.Sunday/03.OpenStack and OpenContrail for FreeBSD platform - Michał Dubiel.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Martin Husemann & Joerg Sonnenberger, [Tool-chaining the Hydra, the ongoing quest for modern toolchains in NetBSD](<https://va.ludost.net/files/eurobsdcon/2014/Rodopi/04.Sunday/04.(Tool-)chaining the Hydra The ongoing quest for modern toolchains in NetBSD - Martin Huseman & Joerg Sonnenberger.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Taylor R Campbell, [The entropic principle: /dev/u?random and NetBSD](<https://va.ludost.net/files/eurobsdcon/2014/Rodopi/04.Sunday/05.The entropic principle: dev-u?random and NetBSD - Taylor R Campbell.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Dag-Erling Smørgrav, [Securing sensitive & restricted data](<https://va.ludost.net/files/eurobsdcon/2014/Rodopi/04.Sunday/06.Securing sensitive & restricted data - Dag-Erling Smørgrav.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Peter Hansteen, [Building The Network You Need](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/01.Thursday/01.Building The Network You Need With PF - Peter Hansteen.mp4>) [With PF](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/01.Thursday/02.Building The Network You Need With PF - Peter Hansteen.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Stefan Sperling, [Subversion for FreeBSD developers](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/01.Thursday/03.Subversion for FreeBSD developers - Stefan Sperling.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Peter Hansteen, [Transition to](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/02.Friday/01.Transition to OpenBSD 5.6 - Peter Hansteen.mp4>) [OpenBSD 5.6](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/02.Friday/02.Transition to OpenBSD 5.6 - Peter Hansteen.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Ingo Schwarze, [Let’s make manuals](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/02.Friday/03.Let’s make manuals more useful - Ingo Schwarze.mp4>) [more useful](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/02.Friday/04.Let’s make manuals more useful - Ingo Schwarze.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Francois Tigeot, [Improving DragonFly’s performance with PostgreSQL](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/03.Saturday/01.Improving DragonFly’s performance with PostgreSQL - Francois Tigeot.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Justin Cormack, [Running Applications on the NetBSD Rump Kernel](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/03.Saturday/02.Running Applications on the NetBSD Rump Kernel - Justin Cormack.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Pierre Pronchery, [EdgeBSD, a year later](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/03.Saturday/04.EdgeBSD, a year later -  Pierre Pronchery.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Peter Hessler, [Using routing domains or tables in a production network](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/03.Saturday/05.Using routing domains or tables in a production network -  Peter Hessler.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Sean Bruno, [QEMU user mode on FreeBSD](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/03.Saturday/06.QEMU user mode on FreeBSD -  Sean Bruno.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Kristaps Dzonsons, [Bugs Ex Ante](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/04.Sunday/01.Bugs Ex Ante - Kristaps Dzonsons.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Yann Sionneau, [Porting NetBSD to the LatticeMico32 open source CPU](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/04.Sunday/02.Porting NetBSD to the LatticeMico32 open source CPU - Yann Sionneau.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Alexander Nasonov, [JIT Code Generator for NetBSD](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/04.Sunday/03.JIT Code Generator for NetBSD - Alexander Nasonov.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Masao Uebayashi, [Porting Valgrind to NetBSD and OpenBSD](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/04.Sunday/04.Porting Valgrind to NetBSD and OpenBSD - Masao Uebayashi.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Marc Espie, [parallel make, working with legacy code](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/04.Sunday/05.parallel make: working with legacy code - Marc Espie.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Francois Tigeot, [Porting the drm-kms graphic drivers to DragonFly](<https://va.ludost.net/files/eurobsdcon/2014/Pirin/04.Sunday/06.Porting the drm-kms graphic drivers to DragonFly - Francois Tigeot.mp4>) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* **The following talks (from the Vitosha track room) are all currently missing:**
* Jordan Hubbard, FreeBSD, Looking forward to another 10 years (but we have another recording)
* Theo de Raadt, Randomness, how arc4random has grown since 1998 (but we have another recording)
* Kris Moore, Snapshots, Replication, and Boot-Environments
* Kirk McKusick, An Introduction to the Implementation of ZFS
* John-Mark Gurney, Optimizing GELI Performance
* Emmanuel Dreyfus, FUSE and beyond, bridging filesystems
* Lourival Vieira Neto, NPF scripting with Lua
* Andy Tanenbaum, A Reimplementation of NetBSD Based on a Microkernel
* Stefano Garzarella, Software segmentation offloading for FreeBSD
* Ted Unangst, LibreSSL
* Shawn Webb, Introducing ASLR In FreeBSD
* Ed Maste, The LLDB Debugger in FreeBSD
* Philip Guenther, Secure lazy binding \*\*\*

### [OpenBSD adopts SipHash](https://www.marc.info/?l=openbsd-tech&m=141614801713457&w=2) ###

* Even more DJB crypto somehow finds its way into OpenBSD's base system
* This time it's [SipHash](https://131002.net/siphash/), a family of pseudorandom functions that's resistant to hash bucket flooding attacks while still providing good performance
* After an [initial import](http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/sys/crypto/siphash.c?rev=1.1&content-type=text/x-cvsweb-markup) and some [clever early usage](https://www.marc.info/?l=openbsd-cvs&m=141604896822253&w=2), a few developers agreed that it would be better to use it in a lot more places
* It will now be used in the filesystem, and the plan is to utilize it to protect **all kernel hash functions**
* Some [other places](http://www.bsdnow.tv/episodes/2013_12_18-cryptocrystalline) that Bernstein's work can be found in OpenBSD include the ChaCha20-Poly1305 authenticated stream cipher and Curve25519 KEX used in SSH, ChaCha20 used in the RNG, and Ed25519 keys used in [signify](http://www.bsdnow.tv/episodes/2014_02_05-time_signatures) and SSH \*\*\*

### [FreeBSD 10.1-RELEASE](https://www.freebsd.org/releases/10.1R/announce.html) ###

* FreeBSD's [release engineering team](http://www.bsdnow.tv/episodes/2013-09-11_engineering_powder_kegs) likes to troll us by uploading new versions just a few hours after we finish recording an episode
* The first maintenance update for the 10.x branch is out, improving upon a lot of things found in 10.0-RELEASE
* The vt driver was merged from -CURRENT and can now be enabled with a loader.conf switch (and can even be used on a PlayStation 3)
* Bhyve has gotten quite a lot of fixes and improvements from its initial debut in 10.0, including boot support for ZFS
* Lots of new ARM hardware is supported now, including SMP support for most of them
* A new kernel selection menu was added to the loader, so you can switch between newer and older kernels at boot time
* 10.1 is the first to support UEFI booting on amd64, which also has serial console support now
* Lots of third party software (OpenSSH, OpenSSL, Unbound..) and drivers have gotten updates to newer versions
* It's a worthy update from 10.0, or a good time to try the 10.x branch if you were avoiding the first .0 release, so [grab an ISO](http://ftp.freebsd.org/pub/FreeBSD/ISO-IMAGES-amd64/10.1/) or [upgrade](https://www.freebsd.org/cgi/man.cgi?query=freebsd-update) today
* Check the [detailed release notes](https://www.freebsd.org/releases/10.1R/relnotes.html) for more information on all the changes
* Also take a look at some of the [known problems](https://www.freebsd.org/releases/10.1R/errata.html#open-issues) to see [if](https://forums.freebsd.org/threads/segmentation-fault-while-upgrading-from-10-0-release-to-10-1-release.48977/) [you'll](https://lists.freebsd.org/pipermail/freebsd-stable/2014-October/080599.html) [be](https://forums.freebsd.org/threads/10-0-10-1-diocaddrule-operation-not-supported-by-device.49016/) [affected](https://www.reddit.com/r/freebsd/comments/2mmzzy/101release_restart_problems_anyone/) by any of them
* PC-BSD was also [updated accordingly](http://wiki.pcbsd.org/index.php/What's_New/10.1) with some of their own unique features and changes \*\*\*

### [arc4random - Randomization for All Occasions](https://www.youtube.com/watch?v=aWmLWx8ut20) ###

* Theo de Raadt gave an updated version of his EuroBSDCon presentation at Hackfest 2014 in Quebec
* The presentation is mainly about OpenBSD's arc4random function, and outlines the overall poor state of randomization in the 90s and how it has evolved in OpenBSD over time
* It begins with some interesting history on OpenBSD and how it became a security-focused OS - in 1996, their syslogd got broken into and "suddenly we became interested in security"
* The talk also touches on how low-level changes can shake up the software ecosystem and third party packages that everyone uses
* There's some funny history on the name of the function (being called arc4random despite not using RC4 anymore) and an overall status update on various platforms' usage of it
* Very detailed and informative presentation, and the slides can be found [here](http://www.openbsd.org/papers/hackfest2014-arc4random/index.html)
* A great quote from the beginning: "We consider ourselves a community of (probably rather strange) people who work on software specifically for the purpose of trying to make it better. We take a 'whole-systems' approach: trying to change everything in the ecosystem that's under our control, trying to see if we can make it better. We gain a lot of strength by being able to throw backwards compatibility out the window. So that means that we're able to do research and the minute that we decide that something isn't right, we'll design an alternative for it and push it in. And if it ends up breaking everybody's machines from the previous stage to the next stage, that's fine because we'll end up in a happier place." \*\*\*

Interview - Justin Cormack - [justin@netbsd.org](mailto:justin@netbsd.org) / [@justincormack](https://twitter.com/justincormack)
----------

NetBSD on Xen, rump kernels, various topics

---

News Roundup
----------

### [The FreeBSD foundation's biggest donation](http://freebsdfoundation.blogspot.com/2014/11/freebsd-foundation-announces-generous.html) ###

* The FreeBSD foundation has a new blog post about the largest donation they've ever gotten
* From the CEO of WhatsApp comes a whopping one million dollars in a single donation
* It also has some comments from the donor about why they use BSD and why it's important to give back
* Be sure to donate to the foundation of whatever BSD you use when you can - every little bit helps, especially for [OpenBSD](http://www.openbsd.org/donations.html), [NetBSD](https://www.netbsd.org/donations/) and [DragonFly](http://www.dragonflybsd.org/donations/) who don't have huge companies supporting them regularly like FreeBSD does \*\*\*

### [OpenZFS Dev Summit 2014 videos](http://open-zfs.org/wiki/OpenZFS_Developer_Summit) ###

* Videos from the recent OpenZFS developer summit are being uploaded, with speakers from different represented platforms and companies \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* [Matt Ahrens](http://www.bsdnow.tv/episodes/2014_05_14-bsdcanned_goods), [opening keynote](https://www.youtube.com/watch?v=XnTzbisLYzg) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Raphael Carvalho, [Platform Overview: ZFS on OSv](https://www.youtube.com/watch?v=TJLOBLSRoHE) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Brian Behlendorf, [Platform Overview: ZFS on Linux](https://www.youtube.com/watch?v=_MVOpMNV7LY) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Prakash Surya, [Platform Overview: illumos](https://www.youtube.com/watch?v=UtlGt3ag0o0) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Xin Li, [Platform Overview: FreeBSD](https://www.youtube.com/watch?v=xO0x5_3A1X4) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* All platforms, [Group Q&A Session](https://www.youtube.com/watch?v=t4UlT0RmSCc) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Dave Pacheco, [Manta](https://www.youtube.com/watch?v=BEoCMpdB8WU) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Saso Kiselkov, [Compression](https://www.youtube.com/watch?v=TZF92taa_us) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* [George Wilson](http://www.bsdnow.tv/episodes/2013_12_04-zettabytes_for_days), [Performance](https://www.youtube.com/watch?v=deJc0EMKrM4) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Tim Feldman, [Host-Aware SMR](https://www.youtube.com/watch?v=b1yqjV8qemU) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Pavel Zakharov, [Fast File Cloning](https://www.youtube.com/watch?v=-4c4gsLi1LI) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* The audio is [pretty poor](https://twitter.com/OpenZFS/status/534005125853888512) on all of them unfortunately \*\*\*

### [BSDTalk 248](http://bsdtalk.blogspot.com/2014/11/bsdtalk248-dragonflybsd-with-matthew.html) ###

* Our friend Will Backman is still busy getting BSD interviews as well
* This time he sits down with Matthew Dillon, the lead developer of DragonFly BSD
* We've never had Dillon on the show, so you'll definitely want to give this one a listen
* They mainly discuss all the big changes coming in DragonFly's upcoming 4.0 release \*\*\*

### [MeetBSD 2014 videos](https://www.meetbsd.com/) ###

* The presentations from this year's MeetBSD conference are starting to appear online as well \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* [Kirk McKusick](http://www.bsdnow.tv/episodes/2013-10-02_stacks_of_cache), [A Narrative History of BSD](https://www.youtube.com/watch?v=DEEr6dT-4uQ) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* [Jordan Hubbard](http://www.bsdnow.tv/episodes/2013_11_27-bridging_the_gap), [FreeBSD: The Next 10 Years](https://www.youtube.com/watch?v=Mri66Uz6-8Y) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* Brendan Gregg, [Performance Analysis](https://www.youtube.com/watch?v=uvKMptfXtdo) \<!-- i wonder if freebsdnews will rip our html again and repost it <sup>_^</sup> --\>
* The slides can be found [here](https://www.meetbsd.com/agenda/) \*\*\*

Feedback/Questions
----------

* [Dominik writes in](http://slexy.org/view/s20PXjp55N)
* [Steven writes in](http://slexy.org/view/s2LwEYT3bA)
* [Florian writes in](http://slexy.org/view/s2ubK8vQVt)
* [Richard writes in](http://slexy.org/view/s216Eq8nFG)
* [Kevin writes in](http://slexy.org/view/s21D2ugDUy) \*\*\*

Mailing List Gold
----------

* [Contributing without code](https://www.marc.info/?t=141600819500004&r=1&w=2)
* [Compression isn't a CRIME](https://lists.mindrot.org/pipermail/openssh-unix-dev/2014-November/033176.html)
* [Securing web browsers](https://www.marc.info/?t=141616714600001&r=1&w=2) \*\*\*