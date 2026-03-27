+++
title = "7: Go Directly to Jail(8)"
description = "On this week's show, you'll be getting the full jail treatment. We'll show you how to create and deploy BSD jails, as well as chatting with Poul-Henning Kamp - the guy who actually invented them! There's lots of interesting news items to cover as well, so stay tuned to BSD Now - "
date = "2013-10-16T12:00:00Z"
url = "https://www.bsdnow.tv/7"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.299254590Z"
seen = false
+++

On this week's show, you'll be getting the full jail treatment. We'll show you how to create and deploy BSD jails, as well as chatting with Poul-Henning Kamp - the guy who actually invented them! There's lots of interesting news items to cover as well, so stay tuned to BSD Now - the place to B.. SD.

Headlines
----------

### [FreeBSD turns it up to 11](https://lists.freebsd.org/pipermail/svn-src-head/2013-October/052141.html) ###

* The -CURRENT branch is now known as 11
* 10 has been branched to -STABLE
* 10-BETA1 ISOs are available now
* Will be the next -RELEASE, probably next year \*\*\*

### [Stopping the SSH bruteforce with BSD and pf](http://bsdly.blogspot.com/2013/10/the-hail-mary-cloud-and-lessons-learned.html) ###

* The Hail Mary Cloud is an SSH bruteforce botnet that takes a different approach
* While most botnets pound port 22 rapidly, THMB does it very slowly and passively
* This makes prevention based on rate limiting more involved and complex
* Nice long blog post about some [potential solutions](http://home.nuug.no/~peter/pf/en/bruteforce.html) and what we've learned \*\*\*

### [ZFS and GELI in bsdinstall coming soon](http://freshbsd.org/commit/freebsd/r256343/) ###

* The man [with the beard](http://www.bsdnow.tv/episodes/2013-09-25_teskeing_the_possibilities) strikes again, new patch allows for ZFS-on-root installs
* Supports GELI for disk encryption
* Might be the push we need to make Michael W Lucas [update](https://twitter.com/mwlauthor/status/389524644983611392) his FreeBSD book \*\*\*

### [AsiaBSDCon 2014 announced](http://2014.asiabsdcon.org/) ###

* Will be held in Tokyo, 13-16 March, 2014
* The conference is for anyone developing, deploying and using systems based on FreeBSD, NetBSD, OpenBSD, DragonFlyBSD, Darwin and Mac OS X
* Call for papers can be found [here](http://2014.asiabsdcon.org/cfp.html) \*\*\*

Interview - Poul-Henning Kamp - [phk@freebsd.org](mailto:phk@freebsd.org) / [@bsdphk](https://twitter.com/bsdphk)
----------

FreeBSD beginnings, md5crypt, jails, varnish and his... telescope project?

---

Tutorial
----------

### [Everything you need to know about Jails](http://www.bsdnow.tv/tutorials/jails) ###

---

News Roundup
----------

### [New pf queue system](http://freshbsd.org/commit/openbsd/c4661054d1882026efca919b6cd9cf958a8698b4) ###

* Henning Brauer committed the new kernel-side bandwidth shaping subsystem
* Uses the HFSC algorithm behind the scenes
* ALTQ to be retired "in a release or two" - everyone should migrate soon \*\*\*

### [Dragonfly imports FreeBSD KMS driver](http://lists.dragonflybsd.org/pipermail/commits/2013-October/198282.html) ###

* Hot on the trails of OpenBSD and later FreeBSD, Dragonfly gets AMD KMS
* Ported over from the FreeBSD port \*\*\*

### [Get paid to hack OpenSSH](https://lists.mindrot.org/pipermail/openssh-unix-dev/2013-October/031695.html) ###

* Google has announced they will pay up to $3113.70 for security patches to OpenSSH
* Patches can fix security or improve security
* If you come up with something, send it to the OpenSSH guys \*\*\*

Feedback/Questions
----------

* [Darren writes in](http://slexy.org/view/s24RmwvEvE)
* [Kjell-Aleksander writes in](http://slexy.org/view/s2wFcFk9Yz)
* [Ryan writes in](http://slexy.org/view/s23e920gNG)
* [Alexander writes in](http://slexy.org/view/s2usxPqO9k) \*\*\*