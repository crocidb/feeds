+++
title = "95: Bitrot Group Therapy"
description = "This time on the show, we'll be talking some ZFS with Sean Chittenden. He's been using it on FreeBSD at Groupon, and has some interesting stories about how it's saved his data. Answers to your emails and all of this week's headlines, on BSD Now - the place to B.. SD.This episode "
date = "2015-06-24T12:00:00Z"
url = "https://www.bsdnow.tv/95"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.130771209Z"
seen = false
+++

This time on the show, we'll be talking some ZFS with Sean Chittenden. He's been using it on FreeBSD at Groupon, and has some interesting stories about how it's saved his data. Answers to your emails and all of this week's headlines, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [More BSDCan 2015 videos](https://www.bsdcan.org/2015/schedule/) ###

* Almost as if we said it would happen last week, more BSD-related presentation videos have been uploaded
* Alexander Motin, [Feature-rich and fast SCSI target with CTL and ZFS](https://www.youtube.com/watch?v=lBE4BfxVDQc)
* Daichi Goto, [FreeBSD for High Density Servers](https://www.youtube.com/watch?v=r2BoQ70bwK4)
* Ken Moore, [Lumina-DE](https://www.youtube.com/watch?v=Qh_YK9y4_Os)
* Kevin Bowling, [FreeBSD Operations at](https://www.youtube.com/watch?v=4l2rlRjkGhk) [Limelight Networks](https://www.youtube.com/watch?v=K1-ZyiY5z48)
* Maciej Pasternacki, [Jetpack, a container](https://www.youtube.com/watch?v=8phbsAhJ-9w) [runtime for FreeBSD](https://www.youtube.com/watch?v=kJ74mgkzLxc)
* Ray Percival, [Networking with OpenBSD in a virtualized environment](https://www.youtube.com/watch?v=gx5FILdSp2w)
* Reyk Floeter, [Introducing OpenBSD's](https://www.youtube.com/watch?v=DV1-EfdIp8I) [new httpd](https://www.youtube.com/watch?v=_v0lI6qDWFs)
* Still more to come, hopefully \*\*\*

### [OpenBSD httpd rewrite support](https://www.marc.info/?l=openbsd-tech&m=143480475721221&w=2) ###

* One of the most-requested features of OpenBSD's new HTTP daemon (in fact, you can hear someone asking about it in the video just above) is rewrite support
* There were concerns about regex code being too complicated and potentially allowing another attack surface, so that was out
* Instead, Reyk ported over an implementation of lua pattern matching while on the flight back from BSDCan, turning it into a C API without the lua bindings
* In the mailing list post, he shows an example of how to use it for redirects and provides [the diff](https://www.marc.info/?l=openbsd-tech&m=143489473103114&w=2) if you'd like to give it a try now
* It's since [been committed](https://www.marc.info/?l=openbsd-cvs&m=143507301715409&w=2) to -current, so you can try it out with a snapshot too \*\*\*

### [SSH 2FA on FreeBSD](http://sysconfig.org.uk/two-factor-authentication-with-ssh.html) ###

* We've discussed different ways to lock down SSH access to your BSD boxes before - use keys instead of passwords, whitelist IPs, or even use two-factor authentication
* This article serves as a sort of "roundup" on different methods to set up two-factor authentication on FreeBSD
* It touches on key pairs with a server-side password, google authenticator and a few other variations
* While the article is focused on FreeBSD, a lot of it can be easily applied to the others too
* OpenSSH has a great security record, but two-factor authentication is always a good thing to have for the most important systems \*\*\*

### [NetBSD 7.0-RC1 released](https://blog.netbsd.org/tnf/entry/netbsd_7_0_rc1_binaries) ###

* NetBSD has just announced the first release candidate for the 7.0 branch, after a long delay since the initial beta ([11 months ago](http://www.bsdnow.tv/episodes/2014_07_23-des_challenge_iv))
* Some of the standout features include: improved KMS/DRM with support for modern GPUs, SMP support on ARM, lots of new ARM boards officially supported, GPT support in the installer, Lua kernel scripting, a multiprocessor USB stack, improvements to NPF (their firewall) and, optionally, Clang 3.6.1
* They're looking for as much testing as possible, so give it a try and report your findings to the release engineering team \*\*\*

Interview - Sean Chittenden - [seanc@freebsd.org](mailto:seanc@freebsd.org) / [@seanchittenden](https://twitter.com/seanchittenden)
----------

FreeBSD at Groupon, ZFS

---

News Roundup
----------

### [OpenSMTPD and Dovecot](http://www.tumfatig.net/20150620/opensmtpd-and-dovecot-on-openbsd-5-7/) ###

* We've covered a number of OpenSMTPD mail server guides on the show, each with just a little something different to offer than the last
* This blog post about it has something not mentioned before: virtual domains and virtual users
* This means you can easily have "[user1@domain.com](mailto:user1@domain.com)" and "[user2@otherdomain.com](mailto:user2@otherdomain.com)" both go to a local user on the box (or a different third address)
* It also covers SSL certificates, blocking spam and setting up IMAP access, the usual
* Now might also be a good time to test out OpenSMTPD [5.7.1-rc1](https://www.mail-archive.com/misc@opensmtpd.org/msg02177.html), which we'll cover in more detail when it's released... \*\*\*

### [OctoPkg, a QT frontend to pkgng](https://github.com/aarnt/octopkg) ###

* A PC-BSD user has begun porting over a graphical package management utility from Arch linux called [Octopi](https://octopiproject.wordpress.com/about/)
* Obviously, it needed to be rewritten to use FreeBSD's pkg system instead of pacman
* There are some basic instructions on how to get it built and running on the github page
* After some testing, it'll likely make its way to the FreeBSD ports tree
* Tools like this might make it easier for desktop users (who are used to similar things in Ubuntu or related distros) to switch over \*\*\*

### [AFL vs. mandoc, a quantitative analysis](http://undeadly.org/cgi?action=article&sid=20150619071929) ###

* Ingo Schwarze has written a pretty detailed article about how he and other OpenBSD developers have been fuzzing mandoc with AFL
* It's meant to be accompanying material to his BSDCan talk, which already covered nine topics
* mandoc is an interesting example to stress test with fuzzing, since its main job is to take and parse some highly varying input
* The article breaks down the 45 different bugs that were found, based on their root cause
* If you're interested in secure coding practices, this'll be a great one to read \*\*\*

### [OpenZFS conference videos](https://www.youtube.com/playlist?list=PLaUVvul17xScvtic0SPoks2MlQleyejks) ###

* Videos from the second OpenZFS conference have just started to show up
* The first talk is by, you guessed it, Matt Ahrens
* In it, he covers some ZFS history, the Oracle takeover, the birth of illumos and OpenZFS, some administration basics and also some upcoming features that are being worked on
* There are also videos [from Nexenta](https://www.youtube.com/watch?v=5ciV4z7WWmo) [and HGST](https://www.youtube.com/watch?v=a2lnMxMUxyc), talking about how they use and contribute to OpenZFS \*\*\*

Feedback/Questions
----------

* [Bryson writes in](http://slexy.org/view/s2FqJfmeK3)
* [Kevin writes in](http://slexy.org/view/s20erRHahQ) \*\*\*