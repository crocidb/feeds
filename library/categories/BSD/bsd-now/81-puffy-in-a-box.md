+++
title = "81: Puffy in a Box"
description = "We're back from AsiaBSDCon! This week on the show, we'll be talking to Lawrence Teo about how Calyptix uses OpenBSD in their line of commercial routers. They're getting BSD in the hands of Windows admins who don't even realize it. We also have all this week's news and answer to y"
date = "2015-03-18T12:00:00Z"
url = "https://www.bsdnow.tv/81"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.157961578Z"
seen = false
+++

We're back from AsiaBSDCon! This week on the show, we'll be talking to Lawrence Teo about how Calyptix uses OpenBSD in their line of commercial routers. They're getting BSD in the hands of Windows admins who don't even realize it. We also have all this week's news and answer to your emails, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Using OpenBGPD to distribute pf table updates](http://www.echothrust.com/blogs/using-openbgpd-distribute-pf-table-updates-your-servers) ###

* For those not familiar, [OpenBGPD](https://en.wikipedia.org/wiki/OpenBGPD) is a daemon for the [Border Gateway Protocol](https://en.wikipedia.org/wiki/Border_Gateway_Protocol) - a way for routers on the internet to discover and exchange routes to different addresses
* This post, inspired by [a talk about using BGP to distribute spam lists](https://www.youtube.com/watch?v=Vet0eQB00X0), details how to use the protocol to distribute some other useful lists and information
* It begins with "One of the challenges faced when managing our OpenBSD firewalls is the distribution of IPs to pf tables without manually modifying /etc/pf.conf on each of the firewalls every time. This task becomes quite tedious, specifically when you want to distribute different types of changes to different systems (eg administrative IPs to a firewall and spammer IPs to a mail server), or if you need to distribute real time blacklists to a large number of systems."
* If you manage a lot of BSD boxes, this might be an interesting alternative to some of the other ways to distribute configuration files
* OpenBGPD is part of the OpenBSD base system, but there's also an unofficial port [to FreeBSD](https://www.freshports.org/net/openbgpd/) and a "work in progress" [pkgsrc version](http://pkgsrc.se/wip/openbgpd) \*\*\*

### [Mounting removable media with autofs](http://freebsdfoundation.blogspot.com/2015/03/freebsd-from-trenches-using-autofs5-to_13.html) ###

* The FreeBSD foundation has a new article in the "FreeBSD from the trenches" series, this time about the sponsored [autofs](https://www.freebsd.org/cgi/man.cgi?query=autofs&sektion=5) tool
* It's written by one of the autofs developers, and he details his work on creating and using the utility
* "The purpose of autofs(5) is to mount filesystems on access, in a way that's transparent to the application. In other words, filesystems get mounted when they are first accessed, and then unmounted after some time passes."
* He talks about all the components that need to work together for smooth operation, how to configure it and how to enable it by default for removable drives
* It ends with a real-world example of something we're all probably familiar with: plugging in USB drives and watching the magic happen
* There's also some more advanced bonus material on GEOM classes and all the more technical details \*\*\*

### [The Tor Browser on BSD](http://trac.haqistan.net/blog/adventures-ports-tor-browser) ###

* The Tor Project has provided a "[browser bundle](https://www.torproject.org/projects/torbrowser/design/)" for a long time, which is more or less a repackaged Firefox with many security and privacy-related settings preconfigured and some patches applied to the source
* Just tunneling your browser through a transparent Tor proxy is not safe enough - many things can lead to passive fingerprinting or, even worse, anonymity being completely lost
* It has, however, only been released for Windows, OS X and Linux - no BSD version
* "[...] we are pushing back against an emerging monoculture, and this is always a healthy thing. Monocultures are dangerous for many reasons, most importantly to themselves."
* Some work has begun to get a working port on BSD going, and this document tells about the process and how it all got started
* If you've got porting skills, or are interested in online privacy, any help would be appreciated of course (see the post for details on getting involved) \*\*\*

### [OpenSSH 6.8 released](https://lists.mindrot.org/pipermail/openssh-unix-dev/2015-March/033686.html) ###

* Continuing their "tick tock" pattern of releases alternating between new features and bugfixes, the OpenSSH team has released 6.8 - it's a major upgrade, focused on new features (we like those better of course)
* Most of the codebase has gone through refactoring, making it easier for regression tests and improving the general readability
* This release adds support for SHA256-hashed, base64-encoded host key fingerprints, as well as making that the default - a big step up from the previously hex-encoded MD5 fingerprints
* Experimental host key rotation support also makes it debut, allowing for easy in-place upgrading of old keys to newer (or refreshed) keys
* You can now require multiple, different public keys to be verified for a user to authenticate (useful if you're extra paranoid or don't have 100% confidence in any single key type)
* The native version will be in OpenBSD 5.7, and the portable version should hit a ports tree near you soon
* Speaking of the portable version, it now has a configure option to build without OpenSSL or LibreSSL, but doing so limits you to Ed25519 key types and ChaCha20 and AES-CTR ciphers \*\*\*

### [NetBSD at AsiaBSDCon](https://mail-index.netbsd.org/netbsd-advocacy/2015/03/15/msg000682.html) ###

* The NetBSD guys already have a wrap-up of the recent event, complete with all the pictures and weird devices you'd expect
* It covers their BoF session, the six NetBSD-related presentations and finally their "work in progress" session
* There was a grand total of [34 different NetBSD gadgets](https://docs.google.com/spreadsheets/d/14q6zJK5PjlMoSeBV5HBiEik5LkqlrcrbSxPoxVKKlec/edit#gid=0) on display at the event \*\*\*

Interview - Lawrence Teo - [lteo@openbsd.org](mailto:lteo@openbsd.org) / [@lteo](https://twitter.com/lteo)
----------

OpenBSD [at Calyptix](http://www.nycbsdcon.org/2010/presentations/lteo-nycbsdcon2010.pdf)

---

News Roundup
----------

### [HardenedBSD introduces Integriforce](http://hardenedbsd.org/article/shawn-webb/2015-03-11/call-testing-secadm-integriforce) ###

* A little bit of background on this one first: NetBSD has something called [veriexec](https://www.netbsd.org/docs/guide/en/chap-veriexec.html), used for [checking file integrity](http://wiki.netbsd.org/guide/veriexec/) at the kernel level
* By doing it at the kernel level, similar to [securelevels](https://en.wikipedia.org/wiki/Securelevel), it offers some level of protection even when the root account is compromised
* HardenedBSD has introduced a similar mechanism into their "secadm" utility
* You can list binaries in the config file that you want to be protected from changes, then specify whether those [can't be run](http://i.imgur.com/wHp2eAN.png) at all, or if they just print a warning
* They're looking for some more extensive testing of this new feature \*\*\*

### [More s2k15 hackathon reports](http://undeadly.org/cgi?action=article&sid=20150305100712&mode=flat) ###

* A couple more Australian hackathon reports have poured in since the last time
* The first comes from Jonathan Gray, who's done a lot of graphics-related work in OpenBSD recently
* He worked on getting some newer "Southern Islands" and "Graphics Core Next" AMD GPUs working, as well as some OpenGL and DRM-related things
* Also on his todo list was to continue hitting various parts of the tree with American Fuzzy Lop, which ended up fixing a few crashes in [mandoc](http://www.bsdnow.tv/episodes/2014_11_12-a_mans_man)
* Ted Unangst also [sent in a report](http://undeadly.org/cgi?action=article&sid=20150307165135&mode=flat) to detail what he hacked on at the event
* With a strong focus on improving SMP scalability, he tackled the virtual memory layer
* His goal was to speed up some syscalls that are used heavily during code compilation, much of which will probably end up in 5.8
* All the trip reports are **much** more detailed than our short summaries, so give them a read if you're interested in all the technicalities \*\*\*

### [DragonFly 4.0.4 and IPFW3](https://www.dragonflydigest.com/2015/03/10/15733.html) ###

* DragonFly BSD has put out a small point release to the 4.x branch, 4.0.4
* It includes a minor [list of fixes](http://lists.dragonflybsd.org/pipermail/commits/2015-March/418098.html), some of which include a HAMMER FS history fix, removing the no-longer-needed "new xorg" and "with kms" variables and a few LAGG fixes
* There was also a bug in the installer that prevented the rescue image from being installed correctly, which also gets fixed in this version
* Shortly after it was released, their new IPFW2 firewall was [added to the tree](http://lists.dragonflybsd.org/pipermail/commits/2015-March/418133.html) and subsequently renamed to [IPFW3](http://lists.dragonflybsd.org/pipermail/commits/2015-March/418160.html) (since it's technically the third revision) \*\*\*

### [NetBSD gets Raspberry Pi 2 support](https://blog.netbsd.org/tnf/entry/raspberry_pi_2_support_added) ###

* NetBSD has announced initial support for the [second revision](http://www.raspberrypi.org/products/raspberry-pi-2-model-b/) of the ever-popular Raspberry Pi board
* There are -current snapshots available for download, and multiprocessor support is also on the way
* The NetBSD wiki page about the Raspberry Pi also has some [more information](https://wiki.netbsd.org/ports/evbarm/raspberry_pi/) and an installation guide
* The usual [Hacker News discussion](https://news.ycombinator.com/item?id=9172100) on the subject
* If anyone has one of these little boards, let us know - maybe write up a blog post about your experience with BSD on it \*\*\*

### [OpenIKED as a VPN gateway](http://puffysecurity.com/wiki/openikedoffshore.html) ###

* In our first discussion segment, we talked about a few different ways to tunnel your traffic
* While we've done full tutorials on things like [SSH tunnels](http://www.bsdnow.tv/tutorials/stunnel), [OpenVPN](http://www.bsdnow.tv/tutorials/openvpn) and [Tor](http://www.bsdnow.tv/tutorials/tor), we haven't talked a whole lot about OpenBSD's IPSEC suite
* This article should help fill that gap - it walks you through the complete IKED setup
* From creating the public key infrastructure to configuring the firewall to configuring both the VPN server and client, this guide's got it all \*\*\*

Feedback/Questions
----------

* [Gary writes in](http://slexy.org/view/s21G9TWALE)
* [Robert writes in](http://slexy.org/view/s206aZrxOi)
* [Joris writes in](http://slexy.org/view/s28Um5R7LG)
* [Mike writes in](http://slexy.org/view/s2yAJsl1Es)
* [Anders writes in](http://slexy.org/view/s21dMAE55M) \*\*\*

Mailing List Gold
----------

* [Can you hear me now](https://www.marc.info/?l=openbsd-misc&m=142577632205484&w=2)
* [He must be GNU here](https://lists.freebsd.org/pipermail/freebsd-hackers/2015-March/047207.html)
* [I've seen some...](https://www.marc.info/?l=openbsd-cvs&m=142593175408756&w=2) \*\*\*