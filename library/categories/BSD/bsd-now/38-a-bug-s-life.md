+++
title = "38: A BUG's Life"
description = "We're back from BSDCan! This week on the show we'll be chatting with Brian Callahan and Aaron Bieber about forming a local BSD users group. We'll get to hear their experiences of running one and maybe encourage some of you to start your own! After that, we've got a tutorial on th"
date = "2014-05-21T12:00:00Z"
url = "https://www.bsdnow.tv/38"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.243670143Z"
seen = false
+++

We're back from BSDCan! This week on the show we'll be chatting with Brian Callahan and Aaron Bieber about forming a local BSD users group. We'll get to hear their experiences of running one and maybe encourage some of you to start your own! After that, we've got a tutorial on the basics of NetBSD's package manager, pkgsrc. Answers to your emails and the latest headlines, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage For Open Source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeBSD 11 goals and discussion](http://blather.michaelwlucas.com/archives/2053) ###

* Something that actually happened at BSDCan this year...
* During the FreeBSD devsummit, there was some discussion about what changes will be made in 11.0-RELEASE
* Some of MWL's notes include: the test suite will be merged to 10-STABLE, more work on the MIPS platforms, LLDB getting more attention, UEFI boot and install support
* A large list of possibilities was also included and open for discussion, including AES-GCM in IPSEC, ASLR, OpenMP, ICC, in-place kernel upgrades, Capsicum improvements, TCP performance improvements and A LOT more
* There's also some notes from the [devsummit virtualization session](http://blather.michaelwlucas.com/archives/2060), mostly talking about bhyve
* Lastly, he also provides some notes about [ports and packages](http://blather.michaelwlucas.com/archives/2065) and where they're going \*\*\*

### [An SSH honeypot with OpenBSD and Kippo](http://securit.se/2014/05/how-to-install-kippo-ssh-honeypot-on-openbsd-5-5-with-chroot/) ###

* Everyone loves messing with script kiddies, right?
* This blog post introduces [Kippo](https://code.google.com/p/kippo/), an SSH honeypot tool, and how to use it in combination with OpenBSD
* It includes a step by step (or rather, command by command) guide and some tips for running a honeypot securely
* You can use this to get new 0day exploits or find weaknesses in your systems
* OpenBSD makes a great companion for security testing tools like this with all its exploit mitigation techniques that protect all running applications \*\*\*

### [NetBSD foundation financial report](https://www.netbsd.org/foundation/reports/financial/2013.html) ###

* The NetBSD foundation has posted their 2013 financial report
* It's a very "no nonsense" page, pretty much only the hard numbers
* In 2013, they got $26,000 of income in donations
* The rest of the page shows all the details, how they spent it on hardware, consulting, conference fees, legal costs and everything else
* Be sure to donate to whichever BSDs you like and use! \*\*\*

### [Building a fully-encrypted NAS with OpenBSD](http://www.geektechnique.org/projectlab/796/how-to-build-a-fully-encrypted-nas-on-openbsd.html) ###

* Usually the popular choice for a NAS system is FreeNAS, or plain FreeBSD if you know what you're doing
* This article takes a look at the OpenBSD side and [explains how](http://www.geektechnique.org/projectlab/797/openbsd-encrypted-nas-howto.html) to build a NAS with security in mind
* The NAS will be fully encrypted, no separate /boot partition like FreeBSD and FreeNAS require - this means the kernel itself is even protected
* The obvious trade-off is the lack of ZFS support for storage, but this is an interesting idea that would fit most people's needs too
* There's also a bit of background information on NAS systems in general, some NAS-specific security tips and even some nice graphs and pictures of the hardware - fantastic write up! \*\*\*

Interview - Brian Callahan & Aaron Bieber - [admin@lists.nycbug.org](mailto:admin@lists.nycbug.org) & [admin@cobug.org](mailto:admin@cobug.org)
----------

Forming a local BSD Users Group

---

Tutorial
----------

### [The basics of pkgsrc](http://www.bsdnow.tv/tutorials/pkgsrc) ###

---

News Roundup
----------

### [FreeBSD periodic mails vs. monitoring](http://deranfangvomende.wordpress.com/2014/05/11/freebsd-periodic-mails-vs-monitoring/) ###

* If you've ever been an admin for a lot of FreeBSD boxes, you've probably noticed that you get a lot of email
* This page tells about all the different alert emails, cron emails and other reports you might end up getting, as well as how to manage them
* From bad SSH logins to Zabbix alerts, it all adds up quickly
* It highlights the periodic.conf file and FreeBSD's periodic daemon, as well as some third party monitoring tools you can use to keep track of your servers \*\*\*

### [Doing cool stuff with OpenBSD routing domains](http://www.skogsrud.net/?p=44) ###

* A blog post from our viewer and regular emailer, Kjell-Aleksander!
* He manages some internally-routed IP ranges at his work, but didn't want to have equipment for each separate project
* This is where OpenBSD routing domains and pf come in to save the day
* The blog post goes through the process with all the network details you could ever dream of
* He even [named his networking equipment... after us](http://i.imgur.com/penYQFP.jpg) \*\*\*

### [LibreSSL, the good and the bad](http://insanecoding.blogspot.com/2014/04/libressl-good-and-bad.html) ###

* We're all probably familiar with OpenBSD's fork of OpenSSL at this point
* However, "for those of you that don't know it, OpenSSL is at the same time the best and most popular SSL/TLS library available, and utter junk"
* This article talks about some of the cryptographic development challenges involved with maintaining such a massive project
* You need cryptographers, software engineers, software optimization specialists - there are a lot of roles that need to be filled
* It also mentions some OpenSSL alternatives and recent LibreSSL progress, as well as some downsides to the fork - the main one being their aim for backwards compatibility \*\*\*

### [PCBSD weekly digest](http://blog.pcbsd.org/2014/05/weekly-feature-digest-28-photos-of-the-new-appcafe-re-design/) ###

* Lots going on in PCBSD land this week, AppCafe has been redesigned
* The PBI system is being replaced with pkgng, PBIs will be automatically converted once you update
* In the more [recent post](http://blog.pcbsd.org/2014/05/weekly-feature-digest-29-pbing/), there's some further explanation of the PBI system and the reason for the transition
* It's got lots of details on the different ways to install software, so hopefully it will clear up any possible confusion \*\*\*

Feedback/Questions
----------

* [Antonio writes in](http://slexy.org/view/s2UbEhgjce)
* [Daniel writes in](http://slexy.org/view/s21XU0y3JP)
* [Sean writes in](http://slexy.org/view/s2QQtuawFl)
* [tsyn writes in](http://slexy.org/view/s20XrT5Q8U)
* [Chris writes in](http://slexy.org/view/s2ayZ1nsdv) \*\*\*