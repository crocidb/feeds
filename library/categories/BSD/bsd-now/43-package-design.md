+++
title = "43: Package Design"
description = """It's a big show this week! We'll be interviewing Marc Espie about OpenBSD's package system and build cluster. Also, we've been asked many times "how do I keep my BSD box up to date?" Well, today's tutorial should finally answer that. Answers to all your emails and this week's hea"""
date = "2014-06-25T12:00:00Z"
url = "https://www.bsdnow.tv/43"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.234411060Z"
seen = false
+++

It's a big show this week! We'll be interviewing Marc Espie about OpenBSD's package system and build cluster. Also, we've been asked many times "how do I keep my BSD box up to date?" Well, today's tutorial should finally answer that. Answers to all your emails and this week's headlines, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [EuroBSDCon 2014 talks and schedule](http://2014.eurobsdcon.org/talks-and-schedule/) ###

* The talks and schedules for EuroBSDCon 2014 are finally revealed
* The opening keynote is called "FreeBSD, looking forward to another 10 years" by jkh
* Lots of talks spanning FreeBSD, OpenBSD and PCBSD, and we finally have a few about NetBSD and DragonflyBSD too! Variety is great
* It looks like Theo even has a talk, but the title isn't on the page... how mysterious
* There are also days dedicated to some really interesting tutorials
* Register now, the conference is on September 25-28th in Bulgaria
* If you see Allan and Kris walking towards you and you haven't given us an interview yet... well you know what's going to happen
* Why aren't the videos up from last year yet? Will this year also not have any? \*\*\*

### [FreeNAS vs NAS4Free](http://arstechnica.com/information-technology/2014/06/the-ars-nas-distribution-shootout-freenas-vs-nas4free/) ###

* More mainstream news covering BSD, this time with an article about different NAS solutions
* In a possibly excessive eight-page article, Ars Technica discusses the pros and cons of both FreeNAS and NAS4Free
* Both are based on FreeBSD and ZFS of course, but there are more differences than you might expect
* Discusses the different development models, release cycles, features, interfaces and ease-of-use factor of each project
* "One is pleasantly functional; the other continues devolving during a journey of pain" - uh oh, who's the loser? \*\*\*

### [Quality software costs money, heartbleed was free](https://queue.acm.org/detail.cfm?id=2636165) ###

* [PHK](http://www.bsdnow.tv/episodes/2013_10_16-go_directly_to_jail) writes an article for ACM Queue about open source software projects' funding efforts
* A lot of people don't realize just how widespread open source software is - TVs, printers, gaming consoles, etc
* The article discusses ways to convince your workplace to fund open source efforts, then goes into a little bit about FreeBSD and Varnish's funding
* The latest heartbleed vulnerability should teach everyone that open source projects are critical to the internet, and need people actively maintaining them
* On that subject, "Earlier this year the OpenSSL Heartbleed bug laid waste to Internet security, and there are still hundreds of thousands of embedded devices of all kinds—probably your television among them—that have not been and will not ever be software-upgraded to fix it. The best way to prevent that from happening again is to avoid having bugs of that kind go undiscovered for several years, and the only way to avoid that is to have competent people paying attention to the software"
* Consider donating to your favorite BSD foundation (or buying cool shirts and CDs!) and keeping the ecosystem alive \*\*\*

### [Geoblock evasion with pf and OpenBSD rdomains](<https://matt.bionicmessage.net/blog/2014/06/21/Advanced Geoblock evasion with OpenBSD pf and rdomain's>) ###

* Geoblocking is a way for websites to block visitors based on the location of their IP
* This is a blog post about how to get around it, using pf and rdomains
* It has the advantage of not requiring any browser plugins or DNS settings on the users' computers, you just need to be running OpenBSD on your router (hmm, if only a website had [a tutorial about that](http://www.bsdnow.tv/tutorials/openbsd-router)...)
* In this post, the author wanted to get an American IP address, since the service he was using (Netflix) is blocked in Australia
* It's got all the details you need to set up a VPN-like system and bypass those pesky geographic filters \*\*\*

Interview - Marc Espie - [espie@openbsd.org](mailto:espie@openbsd.org) / [@espie\_openbsd](https://twitter.com/espie_openbsd)
----------

OpenBSD's package system, building cluster, various topics

---

Tutorial
----------

### [Keeping your BSD up to date](http://www.bsdnow.tv/tutorials/upgrade) ###

---

News Roundup
----------

### [BoringSSL and LibReSSL](https://www.imperialviolet.org/2014/06/20/boringssl.html) ###

* Yet another OpenSSL fork pops up, this time from Google, called BoringSSL
* Adam Langley has a blog post about it, why they did it and how they're going to maintain it
* You can easily browse [the source code](https://boringssl.googlesource.com/)
* Theo de Raadt also [weighs in](http://marc.info/?l=openbsd-tech&m=140332790726752&w=2) with how this effort relates to LibReSSL
* More eyes on the code is good, and patches will be shared between the two projects \*\*\*

### [More BSD Tor nodes wanted](http://lists.nycbug.org/pipermail/tor-bsd/2014-June/000129.html) ###

* Friend of the show bcallah posts some news to the Tor-BSD mailing list about monoculture in the Tor network being both bad and dangerous
* [Originally discussed](https://lists.torproject.org/pipermail/tor-relays/2014-June/004699.html) on the Tor-Relays list, it was made apparent that having such a large amount of Linux nodes weakens the security of the whole network
* If one vulnerability is found, a huge portion of the network would be useless - we need more variety in the network stacks, crypto, etc.
* The EFF is also holding a [Tor challenge](https://www.eff.org/torchallenge/) for people to start up new relays and keep them online for over a year
* Check out our [Tor tutorial](http://www.bsdnow.tv/tutorials/tor) and help out the network, and promote BSD at the same time! \*\*\*

### [FreeBSD 10 OpenStack images](https://raymii.org/s/tutorials/FreeBSD_10.0-release_Openstack_Image.html) ###

* OpenStack, to quote Wikipedia, is "a free and open-source software cloud computing platform. It is primarily deployed as an infrastructure as a service (IaaS) solution."
* The article goes into detail about creating a FreeBSD instant, installing and converting it for use with "bsd-cloudinit"
* The author of the article is a regular listener and emailer of the show, hey! \*\*\*

### [BSDday 2014 call for papers](https://lists.freebsd.org/pipermail/freebsd-advocacy/2014-June/004465.html) ###

* BSD Day, a conference not so well-known, is going to be held August 9th in Argentina
* It was created in 2008 and is the only BSD conference around that area
* The "call for papers" was issued, so if you're around Argentina and use BSD, consider submitting a talk
* Sysadmins, developers and regular users are, of course, all welcome to come to the event \*\*\*

Feedback/Questions
----------

* [Maruf writes in](http://slexy.org/view/s20nTYO2w1)
* [Solomon writes in](http://slexy.org/view/s21cvV6mRP)
* [Silas writes in](http://slexy.org/view/s2MK8sbea0)
* [Bert writes in](http://slexy.org/view/s2Yz97YlzI) \*\*\*