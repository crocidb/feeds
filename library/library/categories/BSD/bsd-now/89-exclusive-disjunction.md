+++
title = "89: Exclusive Disjunction"
description = "This week on the show, we'll be talking to Mike Larkin about various memory protections in OpenBSD. We'll cover recent W<supX</supimprovements, SSP, ASLR, PIE and all kinds of acronyms! We've also got a bunch of news and answers to your questions, coming up on BSD Now - the pl"
date = "2015-05-13T12:00:00Z"
url = "https://www.bsdnow.tv/89"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.141696771Z"
seen = true
+++

This week on the show, we'll be talking to Mike Larkin about various memory protections in OpenBSD. We'll cover recent W<sup>X</sup> improvements, SSP, ASLR, PIE and all kinds of acronyms! We've also got a bunch of news and answers to your questions, coming up on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [OpenSMTPD for the whole family](http://homing-on-code.blogspot.com/2015/05/accept-from-any-for-any-relay-via.html) ###

* Setting up a BSD mail server is something a lot of us are probably familiar with doing, at least for our own accounts
* This article talks about configuring a home mail server too, but even for the other people you live with
* After convincing his wife to use their BSD-based Owncloud server for backups, the author talks about moving her over to his brand new OpenSMTPD server too
* If you've ever run a mail server and had to deal with greylisting, you'll appreciate the struggle he went through
* In the end, BGP-based list distribution saved the day, and his family is being served well by a BSD box \*\*\*

### [NetBSD on the Edgerouter Lite](https://blog.netbsd.org/tnf/entry/hands_on_experience_with_edgerouter) ###

* We've talked a lot about building your own BSD-based router on the show, but not many of the devices we mention are in the same price range as consumer devices
* The EdgeRouter Lite, a small MIPS-powered machine, is starting to become popular (and is a bit cheaper)
* A NetBSD developer has been hacking on it, and documents the steps to get a working install in this blog post
* The process is fairly simple, and you can [cross-compile](http://www.bsdnow.tv/tutorials/current-nbsd) your own installation image on any CPU architecture (even from another BSD!)
* OpenBSD and FreeBSD also have [some](http://www.openbsd.org/octeon.html) [support](http://rtfm.net/FreeBSD/ERL/) for these devices \*\*\*

### [Bitrig at NYC\*BUG](https://www.youtube.com/watch?v=h4FhgBdYSUU) ###

* The New York City BSD users group has semi-regular meetings with presentations, and this time the speaker was John Vernaleo
* John discussed [Bitrig](http://www.bsdnow.tv/episodes/2014_12_10-must_be_rigged), an OpenBSD fork that we've talked about a couple times on the show
* He talks about what they've been up to lately, why they're doing what they're doing, difference in supported platforms
* Ports and packages between the two projects are almost exactly the same, but he covers the differences in the base systems, how (some) patches get shared between the two and finally some development model differences \*\*\*

### [OPNsense, meet HardenedBSD](https://hardenedbsd.org/article/shawn-webb/2015-05-08/hardenedbsd-teams-opnsense) ###

* Speaking of forks, two FreeBSD-based forked projects we've mentioned on the show, [HardenedBSD](http://www.bsdnow.tv/episodes/2014_08_27-reverse_takeover) and [OPNsense](http://www.bsdnow.tv/episodes/2015_01_14-common_sense_approach), have decided to join forces
* Backporting their changes to the 10-STABLE branch, HardenedBSD hopes to introduce some of their security additions to the OPNsense codebase
* Paired up with LibreSSL, this combination should offer a good solution for anyone wanting a BSD-based firewall with an easy web interface
* We'll cover more news on the collaboration as it comes out \*\*\*

Interview - Mike Larkin - [mlarkin@openbsd.org](mailto:mlarkin@openbsd.org) / [@mlarkin2012](https://twitter.com/mlarkin2012)
----------

Memory protections in OpenBSD: [W<sup>X</sup>](https://en.wikipedia.org/wiki/W^X), [ASLR](https://en.wikipedia.org/wiki/Address_space_layout_randomization), [PIE](https://en.wikipedia.org/wiki/Position-independent_code), [SSP](https://en.wikipedia.org/wiki/Buffer_overflow_protection)

---

News Roundup
----------

### [A closer look at FreeBSD](http://www.techopedia.com/2/31035/software/a-closer-look-at-freebsd) ###

* The week wouldn't be complete without at least one BSD article making it to a mainstream tech site
* This time, it's a high-level overview of FreeBSD, some of its features and where it's used
* Being that it's an overview article on a more mainstream site, you won't find anything too technical - it covers some BSD history, stability, ZFS, LLVM and Clang, ports and packages, jails and the licensing
* If you have any BSD-curious Linux friends, this might be a good one to send to them \*\*\*

### [Linksys NSLU2 and NetBSD](http://ramblingfoo.blogspot.com/2015/05/linksys-nslu2-adventures-into-netbsd.html) ###

* The Linksys NSLU2 is a proprietary network-attached storage device introduced back in 2004
* "About 2 months ago I set a goal to run some kind of BSD on the spare Linksys NSLU2 I had. This was driven mostly by curiosity, after listening to a few BSDNow episodes and becoming a regular listener [...]"
* After doing some research, the author of this post discovered that he could cross-compile NetBSD for the device straight from his Linux box
* If you've got one of these old devices kicking around, check out this write-up and get some BSD action on there \*\*\*

### [OpenBSD disklabel templates](http://blog.jeffreyforman.net/2015/05/09/from-0-to-an-openbsd-install-with-no-hands-and-a-custom-disk-layou) ###

* We've covered OpenBSD's "autoinstall" feature for unattended installations in the past, but one area where it didn't offer a lot of customization was with the disk layout
* With a few [recent changes](http://undeadly.org/cgi?action=article&sid=20150505123418), there are now a series of templates you can use for a completely customized partition scheme
* This article takes you through the process of configuring an autoinstall answer file and adding the new section for disklabel
* Combine this new feature with our [-stable iso tutorial](http://www.bsdnow.tv/tutorials/stable-iso), and you could deploy completely patched and customized images en masse pretty easily \*\*\*

### [FreeBSD native ARM builds](https://svnweb.freebsd.org/base?view=revision&revision=282693) ###

* FreeBSD -CURRENT builds for the ARM CPU architecture can now be built natively, without utilities that aren't part of base
* Some of the older board-specific kernel configuration files have been replaced, and now the "IMC6" target is used
* This goes along with what we read in the most recent quarterly status report - ARM is starting to get treated as a first class citizen \*\*\*

Feedback/Questions
----------

* [Sean writes in](http://slexy.org/view/s2088U2OjO)
* [Ron writes in](http://slexy.org/view/s29ZKhQKOz)
* [Charles writes in](http://slexy.org/view/s2NCVHEKt1)
* [Bostjan writes in](http://slexy.org/view/s2mGRoKo5G) \*\*\*