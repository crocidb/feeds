+++
title = "11: The Gateway Drug"
description = "This time on the show, we sit down to chat with Justin Sherrill of the DragonflyBSD project about their new 3.6 release. Later on, we'll be showing you a huge tutorial that's been baking for over a month - how to build an OpenBSD router that'll destroy any consumer router on the "
date = "2013-11-13T13:00:00Z"
url = "https://www.bsdnow.tv/11"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.292446765Z"
seen = true
+++

This time on the show, we sit down to chat with Justin Sherrill of the DragonflyBSD project about their new 3.6 release. Later on, we'll be showing you a huge tutorial that's been baking for over a month - how to build an OpenBSD router that'll destroy any consumer router on the market! There's lots of news to get caught up on as well, so sit back and enjoy some BSD Now - the place to B.. SD.

Headlines
----------

### [OpenSSH 6.4 released](http://openssh.com/txt/release-6.4) ###

* Security fixes in [OpenSSH](http://openssh.com/) don't happen very often
* 6.4 fixes a memory corruption problem, no new features
* If exploited, this vulnerability might permit code execution with the privileges of the authenticated user and may therefore allow bypassing restricted shell/command configurations.
* Disabling AES-GCM in the server configuration is a workaround
* Only affects 6.2 and 6.3 if compiled against a newer OpenSSL (so FreeBSD 9's base OpenSSL is unaffected, for example)
* Full details [here](http://www.openssh.com/txt/gcmrekey.adv) \*\*\*

### [Getting to know your portmgr-lurkers](http://blogs.freebsdish.org/portmgr/2013/11/04/getting-to-know-your-portmgr-mathieu-arnold/) ###

* Next entry in portmgr interview series
* This time they chat with Mathieu Arnold, one of the portmgr-lurkers we mentioned previously
* Lots of questions ranging from why he uses BSD to what he had for breakfast
* [Another one](http://blogs.freebsdish.org/portmgr/2013/11/11/getting-to-know-your-portmgr-antoine-brodin/) was since released, with Antoine Brodin aka antoine@ \*\*\*

### [FUSE in OpenBSD](http://undeadly.org/cgi?action=article&sid=20131108082749) ###

* As we glossed over last week, FUSE was recently added to OpenBSD
* Now the guys from the OpenBSD Journal have tracked down more information
* This version is released under an ISC license
* Should be in OpenBSD 5.5, released a little less than 6 months from now
* Will finally enable things like SSHFS to work in OpenBSD \*\*\*

### [Automated submission of kernel panic reports](https://lists.freebsd.org/pipermail/freebsd-current/2013-November/046175.html) ###

* New tool from Colin Percival
* Saves information about kernel panics and emails it to FreeBSD
* Lets you review before sending so you can edit out any private info
* Automatically encrypted before being sent
* FreeBSD never kernel panics so this won't get much use \*\*\*

Interview - Justin Sherrill - [justin@dragonflybsd.org](mailto:justin@dragonflybsd.org) / [@dragonflybsd](https://twitter.com/dragonflybsd)
----------

DragonflyBSD 3.6 and the [Dragonfly Digest](http://www.shiningsilence.com/dbsdlog/)

---

Tutorial
----------

### [Building an OpenBSD Router](http://www.bsdnow.tv/tutorials/openbsd-router) ###

---

News Roundup
----------

### [BSD router project 1.5 released](http://sourceforge.net/projects/bsdrp/files/BSD_Router_Project/1.5/) ###

* Nice timing for our router tutorial; TBRP is a FreeBSD distribution for installing on a router
* It's an alternative to pfSense, but not nearly as well known or popular
* New version is based on 9.2-RELEASE, includes lots of general updates and bugfixes
* Fits on a 256MB Compact Flash/USB drive \*\*\*

### [Curve25519 now default key exchange](http://freshbsd.org/commit/openbsd/5cfc11a2aa3696190b675b6e3e1da7e8ff28582e) ###

* We mentioned in an earlier episode about a patch for [curve25519](http://cr.yp.to/ecdh.html)
* Now it's become the default for key exchange
* Will probably make its way into OpenSSH 6.5, would've been in 6.4 if we didn't have that security vulnerability
* It's interesting to see all these big changes in cryptography in OpenBSD lately \*\*\*

### [FreeBSD kernel selection in boot menu](https://svnweb.freebsd.org/base?view=revision&revision=257650) ###

* Adds a kernel selection menu to the beastie menu
* List of kernels is taken from 'kernels' in loader.conf as a space or comma separated list of names to display (up to 9)
* From our good buddy [Devin Teske](http://www.bsdnow.tv/episodes/2013-09-25_teskeing_the_possibilities) \*\*\*

### [PCBSD weekly digest](http://blog.pcbsd.org/2013/11/pc-bsd-weekly-feature-digest-11813/) ###

* PCDM has officially replaced GDM as the default login manager
* New ISO build scripts (we got a sneak preview last week)
* Lots of bug fixes
* Second set of 10-STABLE ISOs available with new artwork and much more \*\*\*

### [Theo de Raadt speaking at MUUG](http://undeadly.org/cgi?action=article&sid=20131113074042&mode=expanded&count=0) ###

* Theo will be speaking at Manitoba UNIX User Group in Winnipeg
* On Friday, Nov 15, 2013 at 5:30PM (see show notes for the address)
* If you're watching the show live you have time to make plans, if you're watching the downloaded version it might be happening right now!
* No agenda, but expect some OpenBSD discussion \*\*\*

Feedback/Questions
----------

* [Dave writes in](http://slexy.org/view/s21YXhiLRB)
* [James writes in](http://slexy.org/view/s215EjcgdM)
* [Allen writes in](http://slexy.org/view/s21mCP2ecL)
* [Chess writes in](http://slexy.org/view/s207ePFrna)
* [Frank writes in](http://slexy.org/view/s20iVFXJve) \*\*\*