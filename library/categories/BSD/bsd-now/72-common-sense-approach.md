+++
title = "72: Common *Sense Approach"
description = "This week on the show, we'll be talking to Jos Schellevis about OPNsense, a new firewall project that was forked from pfSense. We'll learn some of the backstory and see what they've got planned for the future. We've also got all this week's news and answers to all your emails, on"
date = "2015-01-14T13:00:00Z"
url = "https://www.bsdnow.tv/72"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.177796803Z"
seen = false
+++

This week on the show, we'll be talking to Jos Schellevis about OPNsense, a new firewall project that was forked from pfSense. We'll learn some of the backstory and see what they've got planned for the future. We've also got all this week's news and answers to all your emails, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Be your own VPN provider with OpenBSD](http://networkfilter.blogspot.com/2015/01/be-your-own-vpn-provider-with-openbsd.html) ###

* We've covered how to build a BSD-based gateway that tunnels all your traffic through a VPN in the past - but what if you don't trust any VPN company?
* It's easy for anyone to say "of course we don't run a modified version of OpenVPN that logs all your traffic... what are you talking about?"
* The VPN provider might also be slow to apply security patches, putting you and the rest of the users at risk
* With this guide, you'll be able to cut out the middleman and create your own VPN, using OpenBSD
* It covers topics such as protecting your server, securing DNS lookups, configuring the firewall properly, general security practices and of course actually setting up the VPN \*\*\*

### [FreeBSD vs Gentoo comparison](http://www.iwillfolo.com/2015/01/comparison-gentoo-vs-freebsd-tweak-tweak-little-star/) ###

* People coming over from Linux will sometimes compare FreeBSD to Gentoo, mostly because of the ports-like portage system for installing software
* This article takes that notion and goes much more in-depth, with lots more comparisons between the two systems
* The author mentions that the installers are very different, ports and portage have many subtle differences and a few other things
* If you're a curious Gentoo user considering FreeBSD, this might be a good article to check out to learn a bit more \*\*\*

### [Kernel W<sup>X</sup> in OpenBSD](https://www.marc.info/?l=openbsd-tech&m=142120787308107&w=2) ###

* W<sup>X,</sup> "[Write XOR Execute](https://en.wikipedia.org/wiki/W^X)," is a security feature of OpenBSD with a rather strange-looking name
* It's meant to be an exploit mitigation technique, disallowing pages in the address space of a process to be both writable and executable at the same time
* This helps prevent some types of buffer overflows: code injected into it *won't* execute, but *will* crash the program (quite obviously the lesser of the two evils)
* Through some recent work, OpenBSD's kernel now has no part of the address space without this feature - whereas it was only enabled in the userland [previously](http://www.openbsd.org/papers/ru13-deraadt/)
* Doing this incorrectly in the kernel could lead to **far worse** consequences, and is a lot harder to debug, so this is a pretty huge accomplishment that's been in the works for a while
* More technical details can be found in some [recent CVS commits](https://www.marc.info/?l=openbsd-cvs&m=141917924602780&w=2) \*\*\*

### [Building an IPFW-based router](http://blog.pcbsd.org/2015/01/using-trueos-as-a-ipfw-based-home-router/) ###

* We've covered building [routers with PF](http://www.bsdnow.tv/tutorials/openbsd-router) many times before, but what about [IPFW](https://www.freebsd.org/doc/handbook/firewalls-ipfw.html)?
* A certain host of a certain podcast decided it was finally time to replace his [disappointing](https://github.com/jduck/asus-cmd) consumer router with something BSD-based
* In this blog post, Kris details his experience building and configuring a new router for his home, using IPFW as the firewall
* He covers in-kernel NAT and NATD, installing a DHCP server from packages and even touches on NAT reflection a bit
* If you're an IPFW fan and are thinking about putting together a new router, give this post a read \*\*\*

Interview - Jos Schellevis - [project@opnsense.org](mailto:project@opnsense.org) / [@opnsense](https://twitter.com/opnsense)
----------

The birth of [OPNsense](http://opnsense.org)

---

News Roundup
----------

### [On profiling HTTP](http://adrianchadd.blogspot.com/2015/01/on-profiling-http-or-god-damnit-people.html) ###

* Adrian Chadd, who [we've had on the show before](http://www.bsdnow.tv/episodes/2014_09_17-the_promised_wlan), has been doing some more ultra-high performance testing
* Faced with the problem of how to generate a massive amount of HTTP traffic, he looked into the current state of benchmarking tools
* According to him, it's "not very pretty"
* He decided to work on a new tool to benchmark huge amounts of web traffic, and the rest of this post describes the whole process
* You can check out his new code [on Github](https://github.com/erikarn/libevhtp-http/) right now \*\*\*

### [Using divert(4) to reduce attacks](http://daemonforums.org/showthread.php?s=db0dd79ca26eb645eadd2d8abd267cae&t=8846) ###

* We talked about using [divert(4)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man4/divert.4) with PF last week, and this post is a good follow-up to that introduction (though unrelated to that series)
* It talks about how you can use divert, combined with some blacklists, to reduce attacks on whatever public services you're running
* PF has good built-in rate limiting for abusive IPs that hit rapidly, but when they attack slowly over a longer period of time, that won't work
* The Composite Blocking List is a public DNS blocklist, operated alongside Spamhaus, that contains many IPs known to be malicious
* Consider setting this up to reduce the attack spam in your logs if you run public services \*\*\*

### [ChaCha20 patchset for GELI](https://lists.freebsd.org/pipermail/freebsd-hackers/2015-January/046814.html) ###

* A user has posted a patch to the freebsd-hackers list that adds ChaCha support to GELI, the [disk encryption](http://www.bsdnow.tv/tutorials/fde) system
* There are also some benchmarks that look pretty good in terms of performance
* Currently, GELI defaults to AES [in XTS mode](https://en.wikipedia.org/wiki/Disk_encryption_theory#XEX-based_tweaked-codebook_mode_with_ciphertext_stealing_.28XTS.29) with a few tweakable options (but also supports Blowfish, Camellia and Triple DES)
* There's [some discussion](https://lists.freebsd.org/pipermail/freebsd-hackers/2015-January/046824.html) going on about whether a [stream cipher](https://en.wikipedia.org/wiki/Stream_cipher) is [suitable or not](https://lists.freebsd.org/pipermail/freebsd-hackers/2015-January/046834.html) for disk encryption though, so this might not be a match made in heaven just yet \*\*\*

### [PCBSD update system enhancements](http://blog.pcbsd.org/2015/01/new-update-gui-for-pc-bsd-automatic-updates/) ###

* The PCBSD update utility has gotten an update itself, now supporting automatic upgrades
* You can choose what parts of your system you want to let it automatically handle (packages, security updates)
* The update system uses ZFS and Boot Environments for safe updating and bypasses some dubious pkgng functionality
* There's also a new graphical frontend available for it \*\*\*

Feedback/Questions
----------

* [Mat writes in](http://slexy.org/view/s2XJhAsffU)
* [Chris writes in](http://slexy.org/view/s20qnSHujZ)
* [Andy writes in](http://slexy.org/view/s21O0MShqi)
* [Beau writes in](http://slexy.org/view/s2LutVQOXN)
* [Kutay writes in](http://slexy.org/view/s21Esexdrc) \*\*\*

Mailing List Gold
----------

* [Wait, a real one?](https://www.mail-archive.com/advocacy@openbsd.org/msg02249.html)
* [What's that glowing...](https://www.marc.info/?l=openbsd-misc&m=142125454022458&w=2) \*\*\*