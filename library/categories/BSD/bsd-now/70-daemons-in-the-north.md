+++
title = "70: Daemons in the North"
description = "It's our last episode of 2014, and we'll be chatting with Dan Langille about the upcoming BSDCan conference. We'll find out what's planned and what sorts of presentations they're looking for. As usual, answers to viewer-submitted questions and all the week's news, coming up on BS"
date = "2014-12-31T13:00:00Z"
url = "https://www.bsdnow.tv/70"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.181937380Z"
seen = true
+++

It's our last episode of 2014, and we'll be chatting with Dan Langille about the upcoming BSDCan conference. We'll find out what's planned and what sorts of presentations they're looking for. As usual, answers to viewer-submitted questions and all the week's news, coming up on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [More conference presentation videos](http://2014.asiabsdcon.org/timetable.html.en) ###

* Some more of the presentation videos from AsiaBSDCon are appearing online
* Masanobu Saitoh, [Developing CPE Routers Based on NetBSD](https://www.youtube.com/watch?v=ApruZrU5fVs)
* [Reyk Floeter](http://www.bsdnow.tv/episodes/2014_09_03-its_hammer_time), [VXLAN and Cloud-based Networking with OpenBSD](https://www.youtube.com/watch?v=ufeEP_hzFN0)
* Jos Jansen, [Adapting OS X to the enterprise](https://www.youtube.com/watch?v=gOPfRQgTjNo)
* [Pierre Pronchery](http://www.bsdnow.tv/episodes/2014_04_01-edgy_bsd_users) & Guillaume Lasmayous, [Carve your NetBSD](https://www.youtube.com/watch?v=vh-TjLUj6os) \<!-- skip to 5:06 for henning trolling --\>
* [Colin Percival](http://www.bsdnow.tv/episodes/2014_01_22-tendresse_for_ten), [Everything you need to know about cryptography in 1 hour](https://www.youtube.com/watch?v=jzY3m5Kv7Y8) (not from AsiaBSDCon)
* The "bsdconferences" YouTube channel has quite a lot of interesting [older BSD talks](https://www.youtube.com/user/bsdconferences/videos?sort=da&view=0&flow=grid) too - you may want to go back and watch them if you haven't already \*\*\*

### [OpenBSD PIE enhancements](https://www.marc.info/?l=openbsd-cvs&m=141922027318727&w=2) ###

* [ASLR](https://en.wikipedia.org/wiki/Address_space_layout_randomization) and [PIE](https://en.wikipedia.org/wiki/Position-independent_executable) are great security features that OpenBSD has had enabled by default for a long time, in both the base system and ports, but they have one inherent problem
* They only work with *dynamic* libraries and binaries, so if you have any static binaries, they don't get the same treatment
* For example, the default shells (and many other things in /bin and /sbin) are statically linked
* In the case of the static ones, you can always predict the memory layout, which is very bad and sort of [defeats the whole purpose](https://en.wikipedia.org/wiki/Return-oriented_programming)
* With this and a few [related commits](https://www.marc.info/?l=openbsd-cvs&m=141927571832106&w=2), OpenBSD fixes this by introducing **static self-relocation**
* More and more CPU architectures are being tested and getting support too; this isn't just for amd64 and i386 - VAX users can rest easy
* It'll be available in 5.7 in May, or you can use a [-current snapshot](http://www.openbsd.org/faq/faq5.html#BldBinary) if you want to get a *slice* of the action now \*\*\*

### [FreeBSD foundation semi-annual newsletter](https://www.freebsdfoundation.org/press/2014dec-newsletter.html) ###

* The FreeBSD foundation publishes a huge newsletter twice a year, detailing their funded projects and some community activities
* As always, it starts with a letter from the president of the foundation - this time it's about encouraging students and new developers to get involved
* The article also has a fundraising update with a list of sponsored projects, and they note that the donations meter has changed from dollars to number of donors (since they exceeded the goal already)
* You can read summaries of all the BSD conferences of 2014 and see a list of upcoming ones next year too
* There are also sections about the [FreeBSD Journal](http://www.bsdnow.tv/episodes/2014_01_29-journaled_news_updates)'s progress, a new staff member and a testimonial from NetApp
* It's a very long report, so dedicate some time to read all the way through it
* This year was pretty great for BSD: both the FreeBSD and OpenBSD foundations exceeded their goals and the NetBSD foundation came really close too
* As we go into 2015, consider donating to [whichever](https://www.freebsdfoundation.org/donate) [BSD](http://www.openbsdfoundation.org/donations.html) [you](https://www.netbsd.org/donations/) [use](http://www.dragonflybsd.org/donations/), it really can make a difference \*\*\*

### [Modernizing OpenSSH fingerprints](https://www.marc.info/?l=openbsd-cvs&m=141920089614758&w=4) ###

* When you connect to a server for the first time, you'll get what's called a fingerprint of the host's public key - this is used to verify that you're actually talking to the same server you intended to
* Up until now, the key fingerprints have been an MD5 hash, displayed as hex
* This [can be problematic](https://lists.mindrot.org/pipermail/openssh-unix-dev/2014-November/033117.html), especially for larger key types like RSA that give lots of wiggle room for collisions, as an attacker could generate a fake host key that gives the same MD5 string as the one you wanted to connect to
* This new change replaces the default MD5 and hex with a base64-encoded SHA256 fingerprint
* You can add a "FingerprintHash" line in your ssh\_config to force using only the new type
* There's also a [new option](https://www.marc.info/?l=openbsd-cvs&m=141923470520906&w=2) to require users to authenticate with **more than one** public key, so you can really lock down login access to your servers - also useful if you're not 100% confident in any single key type
* The new options should be in the upcoming 6.8 release \*\*\*

Interview - Dan Langille - [info@bsdcan.org](mailto:info@bsdcan.org) / [@bsdcan](https://twitter.com/bsdcan)
----------

Plans for the BSDCan 2015 conference

---

News Roundup
----------

### [Introducing ntimed, a new NTP daemon](https://github.com/bsdphk/Ntimed) ###

* As we've mentioned before in [our tutorials](http://www.bsdnow.tv/tutorials/ntpd), there are two main daemons for the Network Time Protocol - ISC's NTPd and OpenBSD's OpenNTPD
* With all the recent security problems with ISC's NTPd, [Poul-Henning Kamp](http://www.bsdnow.tv/episodes/2013_10_16-go_directly_to_jail) has been working on a third NTP daemon
* It's called "ntimed" and you can try out a preview version of it right now - it's [in FreeBSD ports](https://www.freshports.org/net/ntimed/) or on Github
* PHK also has a few [blog entries](http://phk.freebsd.dk/time/) about the project, including status updates \*\*\*

### [OpenBSD-maintained projects list](http://mdocml.bsd.lv/openbsd_projects.html) ###

* There was recently a read on the [misc mailing list](https://www.marc.info/?t=141961588200003&r=1&w=2) asking about different projects started by OpenBSD developers
* The initial list had marks for which software had portable versions to other operating systems (OpenSSH being the most popular example)
* A developer compiled a new list from all of the replies to that thread into a nice organized webpage
* Most people are only familiar with things like OpenSSH, OpenSMTPD, OpenNTPD and more recently LibreSSL, but there are quite a lot more
* This page also serves as a good history lesson for BSD in general: FreeBSD and others have ported some things over, while a couple OpenBSD tools were born from forks of FreeBSD tools (mergemaster, pkg tools, portscout) \*\*\*

### [Monitoring network traffic with FreeBSD](https://forums.freebsd.org/threads/howto-monitor-network-traffic-with-netflow-nfdump-nfsen-on-freebsd.49724/) ###

* If you've ever been curious about monitoring network traffic on your FreeBSD boxes, this forum post may be exactly the thing for you
* It'll show you how to combine the Netflow, NfDump and NfSen suite of tools to get some pretty detailed network stats (and of course put them into a fancy webpage)
* This is especially useful for finding out what was going on at a certain point in time, for example if you had a traffic spike \*\*\*

### [Trapping spammers with spamd](http://www.protoc.org/blog/2014/12/22/trapping-spammers-with-the-openbsd-spam-deferral-daemon) ###

* This is a blog post about OpenBSD's [spamd](https://en.wikipedia.org/wiki/Spamd) - a spam email deferral daemon - and how to use it for your mail
* It gives some background on the greylisting approach to spam, rather than just a typical host blacklist
* "Greylisting is a method of defending e-mail users against spam. A mail transfer agent (MTA) using greylisting will "temporarily reject" any email from a sender it does not recognize. If the sender re-attempts mail delivery at a later time, the sender may be allowed to continue the mail delivery conversation."
* The post also shows how to combine it with PF and other tools for a pretty fancy mail setup
* You can find spamd in the OpenBSD [base system](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man8/spamd.8), or use it [with FreeBSD](https://www.freshports.org/mail/spamd) [or NetBSD](http://pkgsrc.se/mail/spamd) via ports and pkgsrc
* You might also want to go back and listen to [BSDTalk episode 68](https://archive.org/details/bsdtalk068), where Will talks to Bob Beck about spamd \*\*\*

Feedback/Questions
----------

* [Sean writes in](http://slexy.org/view/s20rUK9XVJ)
* [Brandon writes in](http://slexy.org/view/s20nfzIuT2)
* [Anders writes in](http://slexy.org/view/s20wCBhFLO)
* [David writes in](http://slexy.org/view/s20xGrBIyl)
* [Kyle writes in](http://slexy.org/view/s2QHRaiZJW) \*\*\*

Mailing List Gold
----------

* [NTP code comparison](https://www.marc.info/?l=openbsd-tech&m=141903858708123&w=2) - [192870 vs. 2898](https://www.marc.info/?l=openbsd-tech&m=141905854411370&w=2)
* [NICs have feelings too](https://lists.freebsd.org/pipermail/freebsd-hackers/2014-December/046741.html)
* [Just think about it](https://www.marc.info/?l=openbsd-ports&m=141998130824977&w=2) \*\*\*