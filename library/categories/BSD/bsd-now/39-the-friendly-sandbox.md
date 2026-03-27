+++
title = "39: The Friendly Sandbox"
description = "This time on the show we'll be talking with Jon Anderson about Capsicum and Casper to securely sandbox processes. After that, our tutorial will show you how to encrypt all your DNS lookups, either on a single system or for your whole network. News, emails and all the usual fun, o"
date = "2014-05-28T12:00:00Z"
url = "https://www.bsdnow.tv/39"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.241911324Z"
seen = false
+++

This time on the show we'll be talking with Jon Anderson about Capsicum and Casper to securely sandbox processes. After that, our tutorial will show you how to encrypt all your DNS lookups, either on a single system or for your whole network. News, emails and all the usual fun, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [BSDCan 2014 talks and reports](https://www.bsdcan.org/2014/schedule/) ###

* The majority of the BSDCan talks are finally uploaded, so prepare to be flooded with links
* Karl Lehenbauer's [keynote](https://www.youtube.com/watch?v=13LiyjnTGsQ) (he's on next week's episode)
* Mariusz Zaborski and Pawel Jakub Dawidek, [Capsicum and Casper](https://www.youtube.com/watch?v=0la06FHbdvg) (relevant to today's interview)
* Luigi Rizzo, [In-kernel OpenvSwitch on FreeBSD](https://www.youtube.com/watch?v=Lr5o1VQMtgA)
* Dwayne Hart, [Migrating from Linux to FreeBSD for Backend Data Storage](https://www.youtube.com/watch?v=AVuF9eFeVWs)
* Warner Losh, [NAND Flash and FreeBSD](https://www.youtube.com/watch?v=lj0XAE6C6-k)
* Simon Gerraty, [FreeBSD bmake and Meta Mode](https://www.youtube.com/watch?v=4s0UY0sg6vI)
* Bob Beck, [LibreSSL - The First 30 Days](https://www.youtube.com/watch?v=oM6S7FEUfkU)
* Henning Brauer, [OpenBGPD Turns 10 Years Old](https://www.youtube.com/watch?v=cP8AW111IKg)
* Arun Thomas, [BSD ARM Kernel Internals](https://www.youtube.com/watch?v=ZAM7fqhGRr8)
* Peter Hessler, [Using BGP for Realtime Spam Lists](https://www.youtube.com/watch?v=i8UAVswpagA)
* Pedro Giffuni, [Features and Status of FreeBSD's Ext2 Implementation ](https://www.youtube.com/watch?v=HMeTxViulgo)
* Matt Ahrens, [OpenZFS Upcoming Features and Performance Enhancements](https://www.youtube.com/watch?v=EjGqVdCOIhM)
* Daichi Goto, [Shellscripts and Commands](https://www.youtube.com/watch?v=MsRu0xIawaA)
* Benno Rice, [Keeping Current](https://www.youtube.com/watch?v=jZp-ciB6mAg)
* Sean Bruno, [MIPS Router Hacking](https://www.youtube.com/watch?v=LZjoFSfIv3k)
* John-Mark Gurney, [Optimizing GELI Performance](https://www.youtube.com/watch?v=2qicD0tv_tI)
* Patrick Kelsey, [Userspace Networking with libuinet](https://www.youtube.com/watch?v=LhIx8q8_7YY)
* Massimiliano Stucchi, [IPv6 Transitioning Mechanisms](https://www.youtube.com/watch?v=WZoQzUZKaeo)
* Roger Pau Monné, [Taking the Red Pill](https://www.youtube.com/watch?v=q6l9qtjlNXU)
* Shawn Webb, [Introducing ASLR in FreeBSD](https://www.youtube.com/watch?v=jo8ObzR1tKQ)
* There's also a [trip report](http://undeadly.org/cgi?action=article&sid=20140519164127) from Peter Hessler and [one from Julio Merino](http://julipedia.meroh.net/2014/05/bsdcan-2014-summary.html)
* The latter report also talks about how, unfortunately, NetBSD basically had no presence in the event at all (and how that's a recurring trend) \*\*\*

### [Defend your network and privacy with a VPN and OpenBSD](http://networkfilter.blogspot.com/2014/05/defend-your-network-and-privacy-vpn.html) ###

* After all the recent news about spying, backdoored routers, deep packet inspection and everything else, you might want to start taking steps at getting some privacy back
* This article describes how to set up a secure network gateway and VPN using OpenBSD and related crypto utilities
* There are bits for DHCP, DNS, OpenVPN, DNSCrypt and a watchdog script to make sure your tunnel is always being used
* You can transparently tunnel all your outbound traffic over the VPN with this configuration, nothing is needed on any of the client systems - this could also be used with Tor (but it would be very slow)
* It also includes a few general privacy tips, recommended browser extensions, etc
* The intro to the article is especially great, so give the whole thing a read
* He mentions our [OpenBSD router guide](http://www.bsdnow.tv/tutorials/openbsd-router) and other tutorials being a big help for this setup, so hello if you're watching! \*\*\*

### [You should try FreeBSD](http://blog.pascalj.com/article/you-should-try-freebsd/) ###

* In this blog post, the author talks a bit about how some Linux people aren't familiar with the BSDs and how we can take steps to change that
* He goes into some FreeBSD history specifically, then talks about some of the apparent (and not-so-apparent) differences between the two
* Possibly the most useful part is how to address the question "my server already works, why bother switching?"
* "Stackoverflow’s answers assume I have apt-get installed"
* It includes mention of the great documentation, stability, ports, improved security and much more
* A takeaway quote for would-be Linux switchers: "I like to compare FreeBSD to a really tidy room where you can find everything with your eyes closed. Once you know where the closets are, it is easy to just grab what you need, even if you have never touched it before" \*\*\*

### [OpenBSD and the little Mauritian contributor](http://hacklog.in/openbsd-and-the-little-mauritian-contributor/) ###

* This is a story about a guy from [Mauritius](https://en.wikipedia.org/wiki/Mauritius) named Logan, one of OpenBSD's newest developers
* Back in 2010, he started sending in patched for OpenBSD's "mg" editor, among other small things, and eventually added file transfer resume support for SFTP
* The article talks about his journey from just a guy who submits a patch here and there to joining the developer ranks and even getting his picture taken with Theo at a recent hackathon
* It really shows how easy it is to get involved with the different BSDs and contribute back to the software ecosystem
* Congrats to Logan, and hopefully this will inspire more people to start helping out and contributing code back \*\*\*

Interview - Jon Anderson - [jonathan@freebsd.org](mailto:jonathan@freebsd.org)
----------

Capsicum and Casperd

---

Tutorial
----------

### [Encrypting DNS lookups](http://www.bsdnow.tv/tutorials/dnscrypt) ###

---

News Roundup
----------

### [FreeBSD Journal, May 2014 issue](http://i.imgur.com/f0qg6Ss.jpg) ###

* The newest issue of the [FreeBSD Journal](http://www.bsdnow.tv/episodes/2014_01_29-journaled_news_updates) is out, following the bi-monthly release cycle
* This time the topics include: a letter from the foundation, a ports report, some 9.3-RELEASE plans, an events calendar, an overview of ipfw, exploring network activity with dtrace, an article about kqueue, data distribution with dnssec and finally an article about TCP scaling
* Pick up your (digital) copy at Amazon, Google Play or on iTunes and have a read \*\*\*

### [LibreSSL porting update](http://insanecoding.blogspot.com/2014/05/libressl-porting-update.html) ###

* Since the last LibreSSL post we covered, a couple unofficial "portable" versions have died off
* Unfortunately, people still think they can just port LibreSSL to other BSDs and Linux all willy-nilly - stop doing that!
* This post reiterates that LibreSSL currently relies on a lot of OpenBSD-specific security functions that are not present in other systems, and also gives a very eye-opening example
* Please wait for an official portable version instead of wasting time with these dime-a-dozen github clones that do more harm than good \*\*\*

### [BSDMag May 2014 issue is out](http://bsdmag.org/magazine/1862-meteorjs-on-freebsd-11-may-bsd-issue) ###

* The usual monthly release from BSDMag, covering a variety of subjects
* This time around the topics include: managing large development projects using RCS, working with HAMMER FS and PFSes, running MeteorJS on FreeBSD 11, another bhyve article, more GIMP tutorials and a few other things
* It's a free PDF, go grab it \*\*\*

### [BSDTalk episode 241](http://bsdtalk.blogspot.com/2014/05/bsdtalk241-bob-beck.html) ###

* A new episode of [BSDTalk](http://www.bsdnow.tv/episodes/2014_03_05-bsd_now_vs_bsdtalk) is out, this time with Bob Beck
* He talks about the OpenBSD foundation's recent activities, his own work in the project, some stories about the hardware in Theo's basement and a lot more
* The interview itself isn't about LibreSSL at all, but they do touch on it a bit too
* Really interesting stuff, covers a lot of different topics in a short amount of time \*\*\*

Feedback/Questions
----------

* We got a number of replies about last week's VPN question, so thanks to everyone who sent in an email about it - the [vpnc](https://www.freshports.org/security/vpnc/) package seems to be what we were looking for
* [Tim writes in](http://slexy.org/view/s20MK7bTyc)
* [AJ writes in](http://slexy.org/view/s2OWREQdUA)
* [Peter writes in](http://slexy.org/view/s202obAqbT)
* [Thomas writes in](http://slexy.org/view/s21Kye2jAc)
* [Martin writes in](http://slexy.org/view/s2zqFVqwxN) \*\*\*