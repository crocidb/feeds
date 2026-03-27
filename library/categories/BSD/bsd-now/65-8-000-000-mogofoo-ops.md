+++
title = "65: 8,000,000 Mogofoo-ops"
description = "Coming up on the show this week, we've got an interview with Brendan Gregg of Netflix. He's got a lot to say about performance tuning and benchmarks, and even some pretty funny stories about how people have done them incorrectly. As always, this week's news and answers to your em"
date = "2014-11-26T13:00:00Z"
url = "https://www.bsdnow.tv/65"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.191375663Z"
seen = false
+++

Coming up on the show this week, we've got an interview with Brendan Gregg of Netflix. He's got a lot to say about performance tuning and benchmarks, and even some pretty funny stories about how people have done them incorrectly. As always, this week's news and answers to your emails, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Even more BSD presentation videos](https://www.meetbsd.com/) ###

* More videos from this year's MeetBSD and OpenZFS devsummit were uploaded since last week
* Robert Ryan, [At the Heart of the Digital Economy](https://www.youtube.com/watch?v=Rc9k1xEepWU)
* FreeNAS & ZFS, The Indestructible Duo - [Except for the Hard Drives](https://www.youtube.com/watch?v=d1C6DELK7fc)
* Richard Yao, [libzfs\_core and ioctl stabilization](https://www.youtube.com/watch?v=PIC0dwLRBZU)
* OpenZFS, [Company lightning talks](https://www.youtube.com/watch?v=LmbI7F7XTTc)
* OpenZFS, [Hackathon Presentation and Awards](https://www.youtube.com/watch?v=gPbVPwScMGk)
* Pavel Zakharov, [Fast File Cloning](https://www.youtube.com/watch?v=_lGOAZFXra8)
* Rick Reed, [Half a billion unsuspecting FreeBSD users](https://www.youtube.com/watch?v=TneLO5TdW_M)
* Alex Reece & Matt Ahrens, [Device Removal](https://www.youtube.com/watch?v=Xs6MsJ9kKKE)
* Chris Side, [Channel Programs](https://www.youtube.com/watch?v=RMTxyqcomPA)
* David Maxwell, [The Unix command pipeline](https://www.youtube.com/watch?v=CZHEZHK4jRc)
* Be sure to check out the **giant list of videos** from [last week's episode](http://www.bsdnow.tv/episodes/2014_11_19-rump_kernels_revisited) if you haven't seen them already \*\*\*

### [NetBSD on a Cobalt Qube 2](http://www.jarredcapellman.com/2014/3/9/NetBSD-and-a-Cobalt-Qube-2) ###

* The Cobalt Qube was a very expensive networking appliance around 2000
* In 2014, you can apparently get one of these MIPS-based machines for about forty bucks
* This blog post details getting NetBSD installed and set up on the rare relic of our networking past
* If you're an old-time fan of RISC or MIPS CPUs, this'll be a treat for you
* Lots of great pictures of the hardware too \*\*\*

### [OpenBSD vs. AFL](https://www.marc.info/?l=openbsd-cvs&w=2&r=1&s=afl&q=b) ###

* In their never-ending security audit, some OpenBSD developers have been [hitting various parts of the tree](https://twitter.com/damienmiller/status/534156368391831552) with a fuzzer
* If you're not familiar, [fuzzing](https://en.wikipedia.org/wiki/Fuzz_testing) is a semi-automated way to test programs for crashes and potential security problems
* The program being subjected to torture gets all sorts of random and invalid input, in the hopes of uncovering overflows and other bugs
* [American Fuzzy Lop](http://lcamtuf.coredump.cx/afl/), in particular, has provided some interesting results across various open source projects recently
* So far, it's fixed some NULL pointer dereferences in OpenSSH, various crashes in tcpdump and [mandoc](http://www.bsdnow.tv/episodes/2014_11_12-a_mans_man) and [a few other things](https://www.marc.info/?l=openbsd-cvs&m=141646270127039&w=2)
* AFL has an impressive list of CVEs (vulnerabilities) that it's helped developers discover and fix
* It also made its way into OpenBSD ports, FreeBSD ports and NetBSD's pkgsrc very recently, so you can try it out for yourself \*\*\*

### [GNOME 3 hits the FreeBSD ports tree](https://svnweb.freebsd.org/ports?view=revision&revision=372768) ###

* While you've been able to run GNOME 3 on PC-BSD and OpenBSD for a while, it hasn't actually hit the FreeBSD ports tree.. until now
* Now you can play with GNOME 3 and all its goodies (as well as Cinnamon 2.2, which this also brings in) on vanilla FreeBSD
* Be sure to check the commit message and [/usr/ports/UPDATING](http://www.bsdnow.tv/tutorials/ports) if you're upgrading from GNOME 2
* You might also want to go back and listen to [our interview](http://www.bsdnow.tv/episodes/2014_02_26-port_authority) with Joe Marcus Clark about GNOME's portability \*\*\*

Interview - Brendan Gregg - [bgregg@netflix.com](mailto:bgregg@netflix.com) / [@brendangregg](https://twitter.com/brendangregg)
----------

Performance tuning, benchmarks, debugging

---

News Roundup
----------

### [DragonFlyBSD 4.0 released](http://www.dragonflybsd.org/release40/) ###

* A new major version of DragonFly, 4.0.1, was just recently announced
* This version includes support for Haswell GPUs, lots of SMP improvements (including some in PF) and support for up to 256 CPUs
* It's also the first release to drop support for i386, so it joins PCBSD in the 64 bit-only club
* Check the release notes for all the details, including networking and kernel improvements, as well as some crypto changes \*\*\*

### [Can we talk about FreeBSD vs Linux](https://news.ycombinator.com/item?id=8645443) ###

* Hackernews had a recent thread about discussing Linux vs BSD, and the trolls stayed away for once
* Rather than rehashing why one is "better" than the other, it was focused on explaining some of the differences between ecosystems and communities
* If you're one of the many people who watch our show just out of curiosity about the BSD world, this might be a good thread to read
* Someone in the comments even gave bsdnow.tv a mention as a good resource to learn, thanks guy \*\*\*

### [OpenBSD IPSEC tunnel guide](http://www.packetmischief.ca/openbsd-ipsec-tunnel-guide/) ###

* If you've ever wanted to connect two networks with OpenBSD gateways, this is the article for you
* It shows how to set up an IPSEC tunnel between destinations, how to lock it down and how to access all the machines on the other network just like they were on your LAN
* The article also explains some of the basics of IPSEC if you're not familiar with all the terminology, so this isn't just for experts
* Though the article itself is a few years old, it mostly still applies to the latest stuff today
* All the tools used are in the OpenBSD base system, so that's pretty handy too \*\*\*

### [DragonFly starts work on IPFW2](http://www.dragonflybsd.org/docs/ipfw2/) ###

* DragonFlyBSD, much like FreeBSD, comes with more than one firewall you can use
* Now it looks like you're going to have yet another choice, as someone is working on a fork of IPFW (which is actually already in its second version, so it should be "IPFW3")
* Not a whole lot is known yet; it's still in heavy development, but there's a brief [roadmap](http://www.dragonflybsd.org/docs/ipfw2/#index6h1) page with some planned additions
* The guy who's working on this has already agreed to come on the show for an interview, but we're going to give him a chance to get some more work done first
* Expect that sometime next year, once he's made some progress \*\*\*

Feedback/Questions
----------

* [Michael writes in](http://slexy.org/view/s2NYgVifXN)
* [Samael writes in](http://slexy.org/view/s21X02saI3)
* [Steven writes in](http://slexy.org/view/s21Dj7zImH)
* [Remy writes in](http://slexy.org/view/s218lXg38C)
* [Michael writes in](http://slexy.org/view/s20SEuKlaH) \*\*\*