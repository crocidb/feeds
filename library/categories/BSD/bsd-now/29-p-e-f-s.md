+++
title = "29: P.E.F.S."
description = "We're back from AsiaBSDCon! This week we'll be chatting with Gleb Kurtsou about some a filesystem-level encryption utility called PEFS. After that, we'll give you a step by step guide on how to actually use it. There's also the usual round of your questions and we've got a lot of"
date = "2014-03-19T12:00:00Z"
url = "https://www.bsdnow.tv/29"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.259400201Z"
seen = false
+++

We're back from AsiaBSDCon! This week we'll be chatting with Gleb Kurtsou about some a filesystem-level encryption utility called PEFS. After that, we'll give you a step by step guide on how to actually use it. There's also the usual round of your questions and we've got a lot of news to catch up on, so stay tuned to BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage For Open Source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)

---

Headlines
----------

### [Using OpenSSH Certificate Authentication](http://neocri.me/documentation/using-ssh-certificate-authentication/) ###

* SSH has a not-so-often-talked-about authentication option in addition to passwords and keys: certificates - you can add certificates to any current authentication method you're using
* They're not really that complex, there just isn't a lot of documentation on how to use them - this post tries to solve that
* There's the benefit of not needing a known\_hosts file or authorized\_users file anymore
* The post goes into a fair amount of detail about the differences, advantages and implications of using certificates for authentication \*\*\*

### [Back to FreeBSD, a new series](http://www.duckland.org/2014/03/back-to-freebsd-aka-day-1#more) ###

* Similar to the "FreeBSD Challenge" blog series, one of our listeners will be writing about his switching BACK to FreeBSD journey
* "So, a long time ago, I had a box which was running FreeBSD 4, running on a Pentium. 14 years later, I have decided to get back into FreeBSD, now at FreeBSD 10"
* He's starting off with PCBSD since it's easy to get working with dual graphics
* Should be a fun series to follow! \*\*\*

### [OpenBSD's recent experiments in package building](http://undeadly.org/cgi?action=article&sid=20140307130554) ###

* If you'll remember back to our [poudriere tutorial](http://www.bsdnow.tv/tutorials/poudriere), it lets you build FreeBSD binary packages in bulk - OpenBSD's version is called [dpb](http://www.bsdnow.tv/tutorials/dpb)
* Marc Espie recently got some monster machines in russia to play with to help improve scaling of dpb on high end hardware
* This article goes through some of his findings and plans for future versions that increase performance
* We'll be showing a tutorial of dpb on the show in a few weeks \*\*\*

### [Securing FreeBSD with 2FA](http://jafdip.com/securing-freebsd-2fa-two-factor-authentication/) ###

* So maybe you've set up two-factor authentication with gmail or twitter, but have you done it with your BSD box?
* This post walks us through the process of locking down an [ssh server](http://www.bsdnow.tv/tutorials/ssh-tmux) with 2FA
* With just a mobile phone and a few extra tools, you can enable two-factor auth on your BSD box and have just that little extra bit of protections \*\*\*

Interview - Gleb Kurtsou - [gleb.kurtsou@gmail.com](mailto:gleb.kurtsou@gmail.com)
----------

PEFS (security audit results [here](https://defuse.ca/audits/pefs.htm))

---

Tutorial
----------

### [Filesystem-based encryption with PEFS](http://www.bsdnow.tv/tutorials/pefs) ###

---

News Roundup
----------

### [BSDCan 2014 registration](https://www.bsdcan.org/2014/registration.php) ###

* Registration is finally open!
* The prices are available along with a full list of presentations
* Tutorial sessions for various topics as well
* You have to go \*\*\*

### [Big changes for OpenBSD 5.6](http://undeadly.org/cgi?action=article&sid=20140314080734) ###

* Although 5.5 was just frozen and the release process has started, 5.6 is already looking promising
* OpenBSD has, for a long time, included a heavily-patched version of Apache based on 1.3
* They've also imported nginx into base a few years ago, but now have finally removed Apache
* Sendmail is also no longer the default MTA, OpenSMTPD [is the new default](http://undeadly.org/cgi?action=article&sid=20140313052817)
* Will BIND be removed next? [Maybe so](http://marc.info/?l=openbsd-cvs&m=139492163427518&w=2)
* They've also discontinued the hp300, mvme68k and mvme88k ports \*\*\*

### [Getting to know your portmgr lurkers](http://blogs.freebsdish.org/portmgr/2014/03/11/getting-to-know-your-portmgr-lurker-alexy-dokuchaev/) ###

* The "getting to know your portmgr" series makes its return
* This time we get to talk with danfe@ (probably most known for being the nVidia driver maintainer, but he does a lot with ports)
* How he got into FreeBSD? He "wanted a unix system that I could understand and that would not get bloated as time goes by"
* Mentions why he's still heavily involved with the project and lots more \*\*\*

### [PCBSD weekly digest](http://blog.pcbsd.org/2014/03/pc-bsd-weekly-feature-digest-20/) ###

* Work has started to port Pulseaudio to PCBSD 10.0.1
* There's a new "pc-mixer" utility being worked on for sound management as well
* New PBIs, GNOME/Mate updates, Life Preserver fixes and a lot more
* PCBSD 10.0.1 [was released](http://blog.pcbsd.org/2014/03/pc-bsd-weekly-feature-digest-21-pcbsd-10-0-1-released/) too \*\*\*

Feedback/Questions
----------

* [Alex writes in](http://slexy.org/view/s2QwjHkL2n)
* [Ben writes in](http://slexy.org/view/s2wLGlHF15)
* [Nick writes in](http://slexy.org/view/s21JsgRjMU)
* [Sami writes in](http://slexy.org/view/s2UX4sYdHy)
* [Christopher writes in](http://slexy.org/view/s26z60Qd6z) \*\*\*