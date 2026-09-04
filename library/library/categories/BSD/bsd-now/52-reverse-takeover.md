+++
title = "52: Reverse Takeover"
description = "Coming up this week, we'll be chatting with Shawn Webb about his recent work with ASLR and PIE in FreeBSD. After that, we'll be showing you how you can create a reverse SSH tunnel to a system behind a firewall... how sneaky. Answers to your emails plus the latest news, on BSD Now"
date = "2014-08-27T12:00:00Z"
url = "https://www.bsdnow.tv/52"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.217035963Z"
seen = true
+++

Coming up this week, we'll be chatting with Shawn Webb about his recent work with ASLR and PIE in FreeBSD. After that, we'll be showing you how you can create a reverse SSH tunnel to a system behind a firewall... how sneaky. Answers to your emails plus the latest news, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeBSD foundation August update](https://www.freebsdfoundation.org/press/2014augupdate.pdf) ###

* The foundation has published a new PDF detailing some of their recent activities
* It includes project development updates, the 10.1-RELEASE schedule and some of its new features
* There is also a short interview with [Dru Lavigne](http://www.bsdnow.tv/episodes/2014_04_09-pxe_dust) in the "voices from the community" section
* If you're into hardware, there's another section about some new FreeBSD server equipment
* In closing, there's an update on funding too \*\*\*

### [NSD for an authoritative nameserver](http://www.prado.it/2014/08/20/how-to-run-master-nsd-on-freebsd-10-0/) ###

* With BIND having been removed from FreeBSD 10.0, you might be looking to replace your old DNS setup
* This article shows how to use NSD for an authoritative DNS nameserver
* It's also got a link to a similar article on Unbound, the new favorite recursive and caching resolver (they work great together)
* All the instructions are presented very neatly, with all the little details included
* Less BIND means less vulnerabilities, everybody's happy \*\*\*

### [BIND and Nginx removed from OpenBSD](http://marc.info/?l=openbsd-cvs&m=140873518514033&w=2) ###

* While we're on the topic of DNS servers, BIND was finally removed from OpenBSD as well
* The base system contains both NSD and Unbound, so users can transition over between 5.6 (November of this year) and 5.7 (May of next year)
* They've also [removed nginx](http://marc.info/?l=openbsd-cvs&m=140908174910713&w=2) from the base system, in favor of the new custom HTTP daemon
* BIND and Nginx are still available in ports if you don't want to switch
* We're hoping to have Reyk Floeter on the show next week to talk about it, but scheduling might not work out, so it may be a little later on
* With Apache gone in the upcoming 5.6, It's also likely that sendmail will be removed before 5.7 - hooray for modern alternatives \*\*\*

### [NetBSD demo videos](https://www.youtube.com/user/tsutsuii/videos) ###

* A Japanese NetBSD developer has been uploading lots of interesting videos
* Unsurprisingly, they're all featuring NetBSD running on exotic and weird hardware
* Most of them are demoing sound or running a modern Twitter client on an ancient computer
* They're from the same guy that did the conference wrap-up we mentioned recently \*\*\*

Interview - Shawn Webb - [shawn.webb@hardenedbsd.org](mailto:shawn.webb@hardenedbsd.org) / [@lattera](https://twitter.com/lattera)
----------

Address space layout randomization [in FreeBSD](http://hardenedbsd.org/)

---

Tutorial
----------

### [Reverse SSH tunneling](http://www.bsdnow.tv/tutorials/reverse-ssh) ###

---

News Roundup
----------

### [Puppet master-agent installation on FreeBSD](https://deuterion.net/puppet-master-agent-installation-on-freebsd/) ###

* If you've got a lot of BSD boxes under your control, or if you're just lazy, you've probably looked into Puppet before
* The author claims a lack of BSD-specific Puppet documentation, so he decided to write up some notes of his own
* He goes through some advantages of using this type of tool for deployments, even when you don't have a huge number of systems
* The rest of the post explains how to set up both the master and the agent configurations \*\*\*

### [Misc. pfSense items](http://www.mondaiji.com/blog/other/it/10175-the-hunt-for-the-ultimate-free-open-source-firewall-distro) ###

* We found a few miscellaneous pfSense articles this past week
* The first one is about the hunt for the "ultimate" free open source firewall, where pfSense is obviously a strong contender
* [The second one](http://willbradley.name/2014/08/20/logging-natfirewallstate-entries-in-pfsense/) shows how to log NAT firewall states (a good way to find out which family member has been torrenting!)
* In [the third](http://www.proteansec.com/linux/pfsense-automatically-backup-configuration-files/), you can see how to automatically back up your configuration files
* [The fourth item](https://vidarw.wordpress.com/2014/07/09/network-boot-with-pfsense-and-tftpd32/) shows how to set up PXE booting with pfSense, similar to one of our tutorials \*\*\*

### [Time Machine backups on ZFS](http://blog.khubla.com/freebsd/timemachine-backups-on-freebsd-10) ###

* If you've got a Mac you need to keep backed up, a FreeBSD server with ZFS can take the place of an expensive "time capsule"
* This post walks you through setting up netatalk and mDNS for a very versatile Time Machine backup system
* With a single command on the OS X side, you can write to and read from the BSD box just like a regular external drive
* Surprisingly simple to do, recommended for anyone with Macs on their network \*\*\*

### [Lumina desktop preview](http://blog.pcbsd.org/2014/08/pc-bsd-10-0-3-preview-lumina-desktop/) ###

* Lumina, the BSD-exclusive desktop environment, seems to be coming along nicely
* The main developer has posted an update on the PCBSD blog with some screenshots
* Lots of new features have been added, many of which are documented in the post
* There just might be a BSD Now episode about Lumina coming up.. (cough cough) \*\*\*

Feedback/Questions
----------

* [Gary writes in](http://slexy.org/view/s21eLBvf1l)
* [Cedric writes in](http://slexy.org/view/s20xqTKNrf)
* [Caldwell writes in](http://slexy.org/view/s21q428tPj)
* [Cary writes in](http://slexy.org/view/s2uVLhqCaO) \*\*\*