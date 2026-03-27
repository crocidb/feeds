+++
title = "48: Liberating SSL"
description = "Coming up in this week's episode, we'll be talking with one of OpenBSD's newest developers - Brent Cook - about the portable version of LibreSSL and how it's developed. We've also got some information about the FreeBSD port of LibreSSL you might not know. The latest news and your"
date = "2014-07-30T12:00:00Z"
url = "https://www.bsdnow.tv/48"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.224172467Z"
seen = false
+++

Coming up in this week's episode, we'll be talking with one of OpenBSD's newest developers - Brent Cook - about the portable version of LibreSSL and how it's developed. We've also got some information about the FreeBSD port of LibreSSL you might not know. The latest news and your emails, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeBSD quarterly status report](https://www.freebsd.org/news/status/report-2014-04-2014-06.html) ###

* FreeBSD has gotten quite a lot done this quarter
* Changes in the way release branches are supported - major releases will get at least five years over their lifespan
* A new automounter is in the works, hoping to replace amd (which has some issues)
* The CAM target layer and RPC stack have gotten some major optimization and speed boosts
* Work on ZFSGuru continues, with a large status report specifically for that
* The report also mentioned some new committers, both source and ports
* It also covers GNATS being replaced with Bugzilla, the new core team, 9.3-RELEASE, GSoC updates, UEFI booting and lots of other things that we've already mentioned on the show
* "Foundation-sponsored work resulted in **226 commits** to FreeBSD over the April to June period" \*\*\*

### [A new OpenBSD HTTPD is born](http://undeadly.org/cgi?action=article&sid=20140724094043) ###

* Work has begun on a new HTTP daemon in the OpenBSD base system
* A lot of people are [asking](http://www.reddit.com/r/BSD/comments/2b7azm/openbsd_gets_its_own_http_server/) "why?" since OpenBSD includes a chrooted nginx already - will it be removed? Will they co-exist?
* Initial responses seem to indicate that nginx is getting bloated, and is a bit overkill for just serving content (this isn't trying to be a full-featured replacement)
* It's partially based on the relayd codebase and also comes from the author of relayd, Reyk Floeter
* This has the added benefit of the usual, easy-to-understand syntax and privilege separation
* There's a very brief [man page](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man8/httpd.8) online already
* It supports vhosts and can serve static files, but is still in very active development - there will probably be even more new features by the time this airs
* Will it be named OpenHTTPD? Or perhaps... LibreHTTPD? (I hope not) \*\*\*

### [pkgng 1.3 announced](https://lists.freebsd.org/pipermail/freebsd-ports-announce/2014-July/000084.html) ###

* The newest version of FreeBSD's second generation [package management system](http://www.bsdnow.tv/tutorials/pkgng) has been released, with lots of new features
* It has a new "real" solver to automatically handle conflicts, and dynamically discover new ones (this means the annoying -o option is deprecated now, hooray!)
* Lots of the code has been sandboxed for extra security
* You'll probably notice some new changes to the UI too, making things more user friendly
* A few days later [1.3.1](https://svnweb.freebsd.org/ports?view=revision&sortby=date&revision=362996) was released to fix a few small bugs, then [1.3.2](https://svnweb.freebsd.org/ports?view=revision&revision=363108) shortly thereafter and [1.3.3](https://svnweb.freebsd.org/ports?view=revision&revision=363363) yesterday \*\*\*

### [FreeBSD after-install security tasks](http://twisteddaemon.com/post/92921205276/freebsd-installed-your-next-five-moves-should-be) ###

* A number of people have written in to ask us "how do I secure my BSD box after I install it?"
* With this blog post, hopefully most of their questions will finally be answered in detail
* It goes through locking down SSH with keys, patching the base system for security, installing packages and keeping them updated, monitoring and closing any listening services and a few other small things
* Not only does it just list things to do, but the post also does a good job of explaining why you should do them
* Maybe we'll see some more posts in this series in the future \*\*\*

Interview - Brent Cook - [bcook@openbsd.org](mailto:bcook@openbsd.org) / [@busterbcook](https://twitter.com/busterbcook)
----------

LibreSSL's portable version and development

---

News Roundup
----------

### [FreeBSD Mastery - Storage Essentials](https://www.tiltedwindmillpress.com/?product=freebsd-mastery-storage-essentials) ###

* [MWL](http://www.bsdnow.tv/episodes/2013_11_06-year_of_the_bsd_desktop)'s new book about the FreeBSD storage subsystems now has an early draft available
* Early buyers can get access to an in-progress draft of the book before the official release, but keep in mind that it may go through a lot of changes
* Topics of the book will include GEOM, UFS, ZFS, the disk utilities, partition schemes, disk encryption and maximizing I/O performance
* You'll get access to the completed (e)book when it's done if you buy the early draft
* The suggested price is $8 \*\*\*

### [Why BSD and not Linux?](http://www.reddit.com/r/BSD/comments/2buea5/why_bsd_and_not_linux_or_why_linux_and_not_bsd/) ###

* Yet another thread comes up asking why you should choose BSD over Linux or vice-versa
* Lots of good responses from users of the various BSDs
* Directly ripping a quote: "Features like Ports, Capsicum, CARP, ZFS and DTrace were stable on BSDs before their Linux versions, and some of those are far more usable on BSD. Features like pf are still BSD-only. FreeBSD has GELI and ipfw and is "GCC free". DragonflyBSD has HAMMER and kernel performance tuning. OpenBSD have upstream pf and their gamut of security features, as well as a general emphasis on simplicity."
* And "Over the years, the BSDs have clearly shown their worth in the nix ecosystem by pioneering new features and driving adoption of others. The most recent on OpenBSD were 2038 support and LibreSSL. FreeBSD still arguably rules the FOSS storage space with ZFS."
* Some other users share their switching experiences - worth a read \*\*\*

### [More g2k14 hackathon reports](http://undeadly.org/cgi?action=article&sid=20140724161550) ###

* Following up from last week's [huge list](http://www.bsdnow.tv/episodes/2014_07_23-des_challenge_iv) of hackathon reports, we have a few more
* [Landry Breuil](http://undeadly.org/cgi?action=article&sid=20140724161550) spent some time with Ansible testing his infrastructure, worked on the firefox port and tried to push some of their patches upstream
* [Andrew Fresh](http://undeadly.org/cgi?action=article&sid=20140728122850) enjoyed his first hackathon, pushing OpenBSD's perl patches upstream and got tricked into rewriting the adduser utility in perl
* [Ted Unangst](http://undeadly.org/cgi?action=article&sid=20140729070721) did his usual "teduing" (removing of) old code - say goodbye to asa, fpr, mkstr, xstr, oldrdist, fsplit, uyap and bluetooth
* Luckily we didn't have to cover 20 new ones this time! \*\*\*

### [BSDTalk episode 243](http://bsdtalk.blogspot.com/2014/07/mandoc-with-ingo-schwarze.html) ###

* The newest episode of [BSDTalk](http://www.bsdnow.tv/episodes/2014_03_05-bsd_now_vs_bsdtalk) is out, featuring an interview with Ingo Schwarze of the OpenBSD team
* The main topic of discussion is mandoc, which some users might not be familiar with
* mandoc is a utility for formatting manpages that OpenBSD and NetBSD use (DragonFlyBSD and FreeBSD include it in their source tree, but it's not built by default)
* We'll catch up to you soon, Will! \*\*\*

Feedback/Questions
----------

* [Thomas writes in](http://slexy.org/view/s2xLRQytAZ)
* [Stephen writes in](http://slexy.org/view/s21AYng20n)
* [Sha'ul writes in](http://slexy.org/view/s2DwLRdQDS)
* [Florian writes in](http://slexy.org/view/s2E05L31BC)
* [Bob Beck writes in](http://slexy.org/view/s21Nmg3Jrk) - and note the "Caution" section that was added to [libressl.org](http://www.libressl.org/) \*\*\*