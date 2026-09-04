+++
title = "82: SSL in the Wild"
description = "Coming up this week, we'll be chatting with Bernard Spil about wider adoption of LibreSSL in other communities. He's been doing a lot of work with FreeBSD ports specifically, but also working with upstream projects. As usual, all this weeks news and answers to your questions, on "
date = "2015-03-25T12:00:00Z"
url = "https://www.bsdnow.tv/82"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.155809750Z"
seen = true
+++

Coming up this week, we'll be chatting with Bernard Spil about wider adoption of LibreSSL in other communities. He's been doing a lot of work with FreeBSD ports specifically, but also working with upstream projects. As usual, all this weeks news and answers to your questions, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [EuroBSDCon 2015 call for papers](https://2015.eurobsdcon.org/call-for-papers/) ###

* The call for papers has been announced for the next [EuroBSDCon](http://www.bsdnow.tv/episodes/2014_12_03-conference-connoisseur), which is set to be held in Sweden this year
* According to their site, the call for presentation proposals period will start on Monday the 23rd of March until Friday the 17th of April
* If giving a full talk isn't your thing, there's also a call for tutorials - if you're comfortable teaching other people about something BSD-related, this could be a great thing too
* You're not limited to one proposal - several speakers gave multiple in 2014 - so don't hesitate if you've got more than one thing you'd like to talk about
* We'd like to see a more balanced conference schedule than BSDCan's having this year, but that requires effort on both sides - if you're doing *anything* cool with *any* BSD, we'd encourage you submit a proposal (or two)
* Check the announcement for all the specific details and requirements
* If your talk gets accepted, the conference even pays for your travel expenses \*\*\*

### [Making security sausage](http://www.tedunangst.com/flak/post/making-security-sausage) ###

* [Ted Unangst](http://www.bsdnow.tv/episodes/2014_02_05-time_signatures) has a new blog post up, detailing his experiences with some recent security patches both in and out of OpenBSD
* "Unfortunately, I wrote the tool used for signing patches which somehow turned into a responsibility for also creating the inputs to be signed. That was not the plan!"
* The post first takes us through a few OpenBSD errata patches, explaining how some can get fixed very quickly, but others are more complicated and need a bit more review
* It also covers security in upstream codebases, and how upstream projects sometimes treat security issues as any other bug
* Following that, it leads to the topic of FreeType - and a much more complicated problem with backporting patches between versions
* The recent OpenSSL vulnerabilities were also mentioned, with an interesting story to go along with them
* Just 45 minutes before the agreed-upon announcement, OpenBSD devs found a problem with the patch OpenSSL planned to release - it had to be redone at the last minute
* It was because of this that FreeBSD actually had to release [a security update to their security update](https://lists.freebsd.org/pipermail/freebsd-security-notifications/2015-March/000237.html)
* He concludes with "My number one wish would be that every project provide small patches for security issues. Dropping enormous feature releases along with a note 'oh, and some security too' creates downstream mayhem." \*\*\*

### [Running FreeBSD on the server, a sysadmin speaks](http://www.itwire.com/business-it-news/open-source/67420-running-freebsd-on-the-server-a-sysadmin-speaks) ###

* More BSD content is appearing on mainstream technology sites, and, **more importantly**, BSD Now is being mentioned
* ITWire recently did an interview with Allan about running FreeBSD on servers (possibly to go with their earlier interview with Kris about desktop usage)
* They discuss some of the advantages BSD brings to the table for sysadmins that might be used to Linux or some other UNIX flavor
* It also covers specific features like jails, ZFS, long-term support, automating tasks and even… what to name your computers
* If you've been considering switching your servers over from Linux to FreeBSD, but maybe wanted to hear some first-hand experience, this is the article for you \*\*\*

### [NetBSD ported to Hardkernel ODROID-C1](https://blog.netbsd.org/tnf/entry/netbsd_ported_to_hardkernel_odroid) ###

* In their never-ending quest to run on every new board that comes out, NetBSD has been ported to the [Hardkernel ODROID-C1](http://www.hardkernel.com/main/products/prdt_info.php?g_code=G141578608433)
* This one features a quad-core ARMv7 CPU at 1.5GHz, has a gig of ram and gigabit ethernet... all for just $35
* There's a special kernel config file for this board's hardware, available in both -current and the upcoming 7.0
* More info can be found on [their wiki page](https://wiki.netbsd.org/ports/evbarm/odroid-c1/)
* After this was written, basic framebuffer console support was [also committed](http://mail-index.netbsd.org/source-changes/2015/03/21/msg064156.html), allowing a developer to [run XFCE](https://pbs.twimg.com/media/CAqU5CnWEAAEhH2.png:large) on the device \*\*\*

Interview - Bernard Spil - [brnrd@freebsd.org](mailto:brnrd@freebsd.org) / [@sp1l](https://twitter.com/sp1l)
----------

LibreSSL adoption [in FreeBSD ports](https://wiki.freebsd.org/LibreSSL) and the wider software ecosystem

---

News Roundup
----------

### [Monitoring pf logs with Gource](http://www.echothrust.com/blogs/monitoring-pf-logs-gource) ###

* If you're [using pf](http://www.bsdnow.tv/tutorials/pf) on any of the BSDs, maybe you've gotten bored of grepping logs and want to do something more fancy
* This article will show you how to get set up with Gource for a cinematic-like experience
* If you've never heard of Gource, it's "an OpenGL-based 3D visualization tool intended for visualizing activity on source control repositories"
* When you put all the tools together, you can end up with some pretty eye-catching animations of your firewall traffic
* One of our listeners wrote in to say that he set this up and, almost immediately, noticed his girlfriend's phone had been compromised - graphical representations of traffic could be useful for detecting suspicious network activity \*\*\*

### [pkgng 1.5.0 alpha1 released](https://svnweb.freebsd.org/ports?view=revision&revision=381573) ###

* The development version of pkgng was updated to 1.4.99.14, or 1.5.0 alpha1
* This update introduces support for provides/requires, something that we've been wanting for a long time
* It will also now print which package is the reason for direct dependency change
* Another interesting addition is the "pkg -r" switch, allowing cross installation of packages
* Remember this isn't the stable version, so maybe don't upgrade to it just yet on any production systems
* DragonFly will also likely pick up this update once it's marked stable \*\*\*

### [Welcome to OpenBSD](http://devio.us/~bcallah/rcos2015.pdf) ###

* We mentioned last week that our listener Brian was giving a talk in the Troy, New York area
* The slides from that talk are now online, and they've been generating quite a bit of [discussion](https://news.ycombinator.com/item?id=9240533) [online](https://www.reddit.com/r/openbsd/comments/2ztokc/welcome_to_openbsd/)
* It's simply titled "Welcome to OpenBSD" and gives the reader an introduction to the OS (and how easy it is to get involved with contributing)
* Topics include a quick history of the project, who the developers are and what they do, some proactive security techniques and finally how to get involved
* As you may know, NetBSD has almost 60 [supported platforms](https://www.netbsd.org/ports/) and their slogan is "*of course* it runs NetBSD" - Brian says, with [17 platforms](http://www.openbsd.org/plat.html) over 13 CPU architectures, "it *probably* runs OpenBSD"
* No matter which BSD you might be interested in, these slides are a great read, especially for any beginners looking to get their feet wet
* Try to guess which font he used... \*\*\*

### [BSDTalk episode 252](http://bsdtalk.blogspot.com/2015/03/bsdtalk252-devious-with-brian-callahan.html) ###

* And somehow Brian has snuck himself into *another* news item this week
* He makes an appearance in the latest episode of [BSD Talk](http://www.bsdnow.tv/episodes/2014_03_05-bsd_now_vs_bsdtalk), where he chats with Will about running a BSD-based shell provider
* If that sounds familiar, it's probably because [we did the same thing](http://www.bsdnow.tv/episodes/2014_06_18-devious_methods), albeit with a different member of their team
* In this interview, they discuss what a shell provider does, hardware requirements and how to weed out the spammers in favor of real people
* They also talk a bit about the community aspect of a shared server, as opposed to just running a virtual machine by yourself \*\*\*

Feedback/Questions
----------

* [Christian writes in](http://slexy.org/view/s2O81pixhq)
* [Stefan writes in](http://slexy.org/view/s2dhr2WfVc)
* [Possnfiffer writes in](http://slexy.org/view/s2Kisq2EqT)
* [Ruudsch writes in](http://slexy.org/view/s2Xr0e5YAJ)
* [Shane writes in](http://slexy.org/view/s2Xz7BNoJE) \*\*\*

Mailing List Gold
----------

* [Accidental support](https://lists.freebsd.org/pipermail/svn-src-head/2015-March/069679.html)
* [Larry's tears](https://www.marc.info/?l=openbsd-cvs&m=142686812913221&w=2)
* [The boy who sailed with BSD](https://lists.freebsd.org/pipermail/freebsd-hardware/2015-March/007625.html) \*\*\*