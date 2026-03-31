+++
title = "51: Engineering Nginx"
description = "Coming up on the show, we'll be showing you how to set up a secure, SSL-only webserver. There's also an interview with Eric Le Blan about community participation and FreeBSD's role in the commercial server space. All that and more, on BSD Now - the place to B.. SD.This episode wa"
date = "2014-08-20T12:00:00Z"
url = "https://www.bsdnow.tv/51"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.218854402Z"
seen = true
+++

Coming up on the show, we'll be showing you how to set up a secure, SSL-only webserver. There's also an interview with Eric Le Blan about community participation and FreeBSD's role in the commercial server space. All that and more, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Password gropers take spamtrap bait](http://bsdly.blogspot.com/2014/08/password-gropers-take-spamtrap-bait.html) ###

* Our friend [Peter Hansteen](http://www.bsdnow.tv/episodes/2014_04_30-puffy_firewall), who keeps his eyes glued to his log files, has a new blog post
* He seems to have discovered another new weird phenomenon in his pop3 logs
* "yes, I still run one, for the same bad reasons more than a third of my readers probably do: inertia"
* Someone tried to log in to his service with an address that was known to be invalid
* The rest of the post goes into detail about his theory of why someone would use a list of invalid addresses for this purpose \*\*\*

### [Inside the Atheros wifi chipset](https://www.youtube.com/watch?v=WOcYTqoSQ68) ###

* Adrian Chadd - sometimes known in the FreeBSD community as "the wireless guy" - gave a talk at the Defcon Wireless Village 2014
* He covers a lot of topics on wifi, specifically on Atheros chips and why they're so popular for open source development
* There's a lot of great information in the presentation, including cool (and evil) things you can do with wireless cards
* Very technical talk; some parts might go over your head if you're not a driver developer
* The raw video file is also available [to download](https://archive.org/download/WirelessVillageAtDefCon22/20-Atheros.mp4) on archive.org
* Adrian has also recently worked on getting Kismet and Aircrack-NG to work better with FreeBSD, including packet injection and other fun things \*\*\*

### [Trip report and hackathon mini-roundup](http://freebsdfoundation.blogspot.com/2014/08/bsdcan-trip-report-mark-linimon.html) ###

* A few more (late) reports from BSDCan and the latest OpenBSD hackathon have been posted
* Mark Linimon mentions some of the future plans for FreeBSD's release engineering and ports
* Bapt [also has a BSDCan report](http://freebsdfoundation.blogspot.com/2014/08/bsdcan-trip-report-baptiste-daroussin.html) detailing his work on ports and packages
* Antoine Jacoutot [writes about](http://undeadly.org/cgi?action=article&sid=20140812064946) his work at the most recent hackathon, working with rc configuration and a new /etc/examples layout
* Peter Hessler, a latecomer to the hackathon, [details his experience](http://undeadly.org/cgi?action=article&sid=20140806125308) too, hacking on the installer and built-in upgrade function
* Christian Weisgerber [talks about](http://undeadly.org/cgi?action=article&sid=20140803122705) starting some initial improvements of OpenBSD's ports infrastructure \*\*\*

### [DragonFly BSD 3.8.2 released](http://lists.dragonflybsd.org/pipermail/commits/2014-August/270573.html) ###

* Although it was already branched, the release media is now available for DragonFly 3.8.2
* This is a minor update, mostly to fix the recent OpenSSL vulnerabilities
* It also includes some various other small fixes \*\*\*

Interview - Eric Le Blan - [info@xinuos.com](mailto:info@xinuos.com)
----------

Xinuos' recent FreeBSD integration, BSD in the commercial server space

---

Tutorial
----------

### [Building a hardened, feature-rich webserver](http://www.bsdnow.tv/tutorials/nginx) ###

---

News Roundup
----------

### [Defend your network and privacy, FreeBSD version](http://networkfilter.blogspot.com/2014/08/defend-your-network-and-privacy-vpn.html) ###

* Back in [episode 39](http://www.bsdnow.tv/episodes/2014_05_28-the_friendly_sandbox), we covered a blog post about creating an OpenBSD gateway - partly based on [our tutorial](http://www.bsdnow.tv/tutorials/openbsd-router)
* This is a follow-up post, by the same author, about doing a similar thing with FreeBSD
* He mentions some of the advantages and disadvantages between the two operating systems, and encourages users to decide for themselves which one suits their needs
* The rest is pretty much the same things: firewall, VPN, DHCP server, DNSCrypt, etc. \*\*\*

### [Don't encrypt all the things](http://www.tedunangst.com/flak/post/dont-encrypt-all-the-things) ###

* Another couple of interesting blog posts from [Ted Unangst](http://www.bsdnow.tv/episodes/2014_02_05-time_signatures) about encryption
* It talks about how Google recently started ranking sites with HTTPS higher in their search results, and then reflects on how sometimes encryption does more harm than good
* After heartbleed, the ones who might be able to decrypt your emails went from just a three-letter agency to any script kiddie
* He also talks a bit about some PGP weaknesses and a possible future replacement
* He also has another, similar post entitled "[in defense of opportunistic encryption](http://www.tedunangst.com/flak/post/in-defense-of-opportunistic-encryption)" \*\*\*

### [New automounter lands in FreeBSD](https://svnweb.freebsd.org/base?view=revision&revision=270096) ###

* The work on the new automounter has just landed in 11-CURRENT
* With help from the FreeBSD Foundation, we'll have a new "autofs" kernel option
* Check the SVN viewer online to read over the man pages if you're not running -CURRENT
* You can also read a bit about it in the [recent newsletter](https://www.freebsdfoundation.org/press/2014jul-newsletter#Project3) \*\*\*

### [OpenSSH 6.7 CFT](https://lists.mindrot.org/pipermail/openssh-unix-dev/2014-August/032810.html) ###

* It's been a little while since the last OpenSSH release, but 6.7 is almost ready
* Our friend [Damien Miller](http://www.bsdnow.tv/episodes/2013_12_18-cryptocrystalline) issued a call for testing for the upcoming version, which includes a fair amount of new features
* It includes some old code removal, some new features and some internal reworkings - we'll cover the full list in detail when it's released
* This version also officially supports being built with LibreSSL now
* Help test it out and report any findings, especially if you have access to something a little more exotic than just a BSD system \*\*\*

Feedback/Questions
----------

* [David writes in](http://slexy.org/view/s20yIP7VXa)
* [Lachlan writes in](http://slexy.org/view/s2DeeUjAn6)
* [Francis writes in](http://slexy.org/view/s216imwEb0)
* [Frank writes in](http://slexy.org/view/s2oc8vavWe)
* [Sean writes in](http://slexy.org/view/s20wL61sSr) \*\*\*