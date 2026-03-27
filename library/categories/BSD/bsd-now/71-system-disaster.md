+++
title = "71: System Disaster"
description = "This time on the show, we'll be talking to Ian Sutton about his new BSD compatibility wrappers for various systemd dependencies. Don't worry, systemd is not being ported to BSD! We're still safe! We've also got all the week's news and answers to your emails, coming up on BSD Now "
date = "2015-01-07T13:00:00Z"
url = "https://www.bsdnow.tv/71"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.179817901Z"
seen = false
+++

This time on the show, we'll be talking to Ian Sutton about his new BSD compatibility wrappers for various systemd dependencies. Don't worry, systemd is not being ported to BSD! We're still safe! We've also got all the week's news and answers to your emails, coming up on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Introducing OPNsense, a pfSense fork](http://opnsense.org/) ###

* OPNsense is a new BSD-based firewall project that was [recently started](http://www.prnewswire.com/news-releases/deciso-launches-opnsense-a-new-open-source-firewall-initiative-287334371.html), forked from the pfSense codebase
* Even though it's just been announced, they already have a formal release based on FreeBSD 10 (pfSense's latest stable release is based on 8.3)
* The [core team](http://opnsense.org/about/about-opnsense/#opnsense-core-team) includes a well-known DragonFlyBSD developer
* You can check out their code [on Github](https://github.com/opnsense) now, or download an image and try it out - [let us know](mailto:feedback@bsdnow.tv) if you do and what you think about it
* They also have a nice wiki and some [instructions on getting started](http://wiki.opnsense.org/index.php/Manual:Installation_and_Initial_Configuration) for new users
* We plan on having them on the show **next week** to learn a bit more about how the project got started and why you might want to use it - stay tuned \*\*\*

### [Code rot and why I chose OpenBSD](http://homing-on-code.blogspot.com/2015/01/code-rot-openbsd.html) ###

* Here we have a blog post about rotting codebases - a core banking system in this example
* The author tells the story of how his last days spent at the job were mostly removing old, dead code from a giant project
* He goes on to compare it to OpenSSL and the hearbleed disaster, from which LibreSSL was born
* Instead of just bikeshedding like the rest of the internet, OpenBSD "silently started putting the beast into shape" as he puts it
* The article continues on to mention OpenBSD's code review process, and how it catches any bugs so we don't have more heartbleeds
* "In OpenBSD you are encouraged to run current and the whole team tries its best to make current as stable as it can. You know why? They eat their own dog food. That's so simple yet so amazing that it blows my mind. Developers actually run OpenBSD on their machines daily."
* It's a very long and detailed story about how the author has gotten more involved with BSD, learned from the mailing lists and even started contributing back - he says "In summary, I'm learning more than ever - computing is fun again"
* Look for the phrase "Getting Started" in the blog post for a nice little gem \*\*\*

### [ZFS vs HAMMER FS](https://forums.freebsd.org/threads/zfs-vs-hammer.49789/) ###

* One of the topics we've seen come up from time to time is how [FreeBSD's ZFS](http://www.bsdnow.tv/tutorials/zfs) and [DragonFly's HAMMER FS](http://www.bsdnow.tv/tutorials/hammer) compare to each other
* They both have a lot of features that traditional filesystems lack
* A forum thread was opened for discussion about them both and what they're typically used for
* It compares resource requirements, ideal hardware and pros/cons of each
* Hopefully someone will do another new comparison when HAMMER 2 is finished
* This is not to be confused with the [other "hammer" filesystem](https://www.youtube.com/watch?v=HBXlVl5Ll6k) \*\*\*

### [Portable OpenNTPD revived](https://www.mail-archive.com/tech@openbsd.org/msg21886.html) ###

* With ISC's NTPd having so many security vulnerabilities recently, people need an alternative [NTP daemon](http://www.bsdnow.tv/tutorials/ntpd)
* OpenBSD has developed [OpenNTPD](http://openntpd.org/) since 2004, but the portable version for other operating systems hasn't been actively maintained in a few years
* The older version still works fine, and is in FreeBSD ports and NetBSD pkgsrc, but it would be nice to have some of the newer features and fixes from the native version
* Brent Cook, who we've [had on the show before](http://www.bsdnow.tv/episodes/2014_07_30-liberating_ssl) to talk about LibreSSL, decided it was time to fix this
* While looking through the code, he also found [some fixes](http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/usr.sbin/ntpd/?sortby=date#dirlist) for the native version as well
* You can grab it from [Github](https://github.com/openntpd-portable/openntpd-portable) now, or just wait for [the updated release](https://lists.freebsd.org/pipermail/freebsd-ports/2015-January/097400.html) to hit the repos of your OS of choice \*\*\*

Interview - Ian Sutton - [ian@kremlin.cc](mailto:ian@kremlin.cc)
----------

[BSD replacements](https://uglyman.kremlin.cc/gitweb/gitweb.cgi?p=systembsd.git;a=summary) for [systemd dependencies](http://undeadly.org/cgi?action=article&sid=20140915064856)

---

News Roundup
----------

### [pkgng adds OS X support](https://github.com/freebsd/pkg/pull/1113) ###

* FreeBSD's next-gen [package manager](http://www.bsdnow.tv/tutorials/pkgng) has just added support for Mac OS X
* Why would you want that? Well.. we don't really know, but it's cool
* The author of the patch [may have some insight](https://github.com/freebsd/pkg/pull/1113#issuecomment-68063964) about what his goal is though
* This could open up the door for a cross-platform pkgng solution, similar to NetBSD's pkgsrc
* There's also the possibility of pkgng being used as a packaging format for MacPorts in the future
* While we're on the topic of pkgng, you can also watch [bapt](http://www.bsdnow.tv/episodes/2014_01_01-eclipsing_binaries)'s latest presentation about it from ruBSD 2014 - "[four years of pkg](http://is.gd/4AvUwt)" \*\*\*

### [Secure secure shell](https://stribika.github.io/2015/01/04/secure-secure-shell.html) ###

* Almost everyone watching BSD Now probably [uses OpenSSH](http://www.bsdnow.tv/tutorials/ssh-tmux) and has set up a server at one point or another
* This guide provides a list of best practices beyond the typical "disable root login and use keys" advice you'll often hear
* It specifically goes in-depth with server and client configuration with the best key types, KEX methods and encryption ciphers to use
* There are also good explanations for all the choices, based both on history and probability
* Minimal backwards compatibility is kept, but most of the old and insecure stuff gets disabled
* We've also got [a handy chart](http://ssh-comparison.quendi.de/comparison.html) to show which SSH implementations support which ciphers, in case you need to support Windows users or people who use weird clients \*\*\*

### [Dissecting OpenBSD's divert(4)](http://lteo.net/blog/2015/01/06/dissecting-openbsds-divert-4-part-1-introduction/) ###

* PF has a cool feature that not a lot of people seem to know about: divert
* It lets you send packets to userspace, allowing you to inspect them a lot easier
* This blog post, the first in a series, details all the cool things you can do with divert and how to use it
* A very common example is with intrusion detection systems like Snort \*\*\*

### [Screen recording on FreeBSD](https://www.banym.de/freebsd/create-a-screen-recording-on-freebsd-with-kdenlive-and-external-usb-mic) ###

* This is a neat article about a topic we don't cover very often: making video content on BSD
* In the post, you'll learn how to make screencasts with FreeBSD, using kdenlive and ffmpeg
* There are also notes about getting a USB microphone working, so you can do commentary on whatever you're showing
* It also includes lots of details and helpful screenshots throughout the process
* You should make cool screencasts and send them to us \*\*\*

Feedback/Questions
----------

* [Camio writes in](http://slexy.org/view/s21Zx0ktmb)
* [ezpzy writes in](http://slexy.org/view/s2vVR5Orhh)
* [Emett writes in](http://slexy.org/view/s21Ahb5Lxa)
* [Ben writes in](http://slexy.org/view/s20oJmveN6)
* [Laszlo writes in](http://slexy.org/view/s2cTayMxPk) \*\*\*

Mailing List Gold
----------

* [Protocol X97](https://lists.freebsd.org/pipermail/freebsd-questions/2015-January/263441.html)
* [My thoughts echoed](https://www.marc.info/?l=openbsd-tech&m=141159429123859&w=2)
* [Vulnerability sample](http://www.openwall.com/lists/oss-security/2015/01/04/10) \*\*\*