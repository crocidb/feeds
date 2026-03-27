+++
title = "105: Virginia BSD Assembly"
description = "It's already our two-year anniversary! This time on the show, we'll be chatting with Scott Courtney, vice president of infrastructure engineering at Verisign, about this year's vBSDCon. What's it have to offer in an already-crowded BSD conference space? We'll find out.This episod"
date = "2015-09-02T12:00:00Z"
url = "https://www.bsdnow.tv/105"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.108084067Z"
seen = false
+++

It's already our two-year anniversary! This time on the show, we'll be chatting with Scott Courtney, vice president of infrastructure engineering at Verisign, about this year's vBSDCon. What's it have to offer in an already-crowded BSD conference space? We'll find out.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [OpenBSD hypervisor coming soon](https://www.marc.info/?l=openbsd-tech&m=144104398132541&w=2) ###

* Our buddy Mike Larkin never rests, and he posted some very tight-lipped [console output](http://pastebin.com/raw.php?i=F2Qbgdde) on Twitter recently
* From what little he revealed [at the time](https://twitter.com/mlarkin2012/status/638265767864070144), it appeared to be a new [hypervisor](https://en.wikipedia.org/wiki/Hypervisor) (that is, X86 hardware virtualization) running on OpenBSD -current, tentatively titled "vmm"
* Later on, he provided a much longer explanation on the mailing list, detailing a bit about what the overall plan for the code is
* Originally started around the time of the Australia hackathon, the work has since picked up more steam, and has gotten a funding boost from the OpenBSD foundation
* One thing to note: this **isn't** just a port of something like Xen or Bhyve; it's all-new code, and Mike explains why he chose to go that route
* He also answered some basic questions about the requirements, when it'll be available, what OSes it can run, what's left to do, how to get involved and so on \*\*\*

### [Why FreeBSD should not adopt launchd](http://blog.darknedgy.net/technology/2015/08/26/0/) ###

* [Last week](http://www.bsdnow.tv/episodes/2015_08_26-beverly_hills_25519) we mentioned a talk Jordan Hubbard gave about integrating various parts of Mac OS X into FreeBSD
* One of the changes, perhaps the most controversial item on the list, was the adoption of launchd to replace the init system (replacing init systems seems to cause backlash, we've learned)
* In this article, the author talks about why he thinks this is a bad idea
* He doesn't oppose the integration into FreeBSD-*derived* projects, like FreeNAS and PC-BSD, only vanilla FreeBSD itself - this is also explained in more detail
* The post includes both high-level descriptions and low-level technical details, and provides an interesting outlook on the situation and possibilities
* Reddit had [quite a bit](https://www.reddit.com/r/BSD/comments/3ilhpk) [to say](https://www.reddit.com/r/freebsd/comments/3ilj4i) about this one, some in agreement and some not \*\*\*

### [DragonFly graphics improvements](http://lists.dragonflybsd.org/pipermail/commits/2015-August/458108.html) ###

* The DragonFlyBSD guys are at it again, merging newer support and fixes into their i915 (Intel) graphics stack
* This latest update brings them in sync with Linux 3.17, and includes Haswell fixes, DisplayPort fixes, improvements for Broadwell and even Cherryview GPUs
* You should also see some power management improvements, longer battery life and various other bug fixes
* If you're running DragonFly, especially on a laptop, you'll want to get this stuff on your machine quick - big improvements all around \*\*\*

### [OpenBSD tames the userland](https://www.marc.info/?l=openbsd-tech&m=144070638327053&w=2) ###

* Last week we mentioned OpenBSD's tame framework getting support for file whitelists, and said that the userland integration was next - well, now here we are
* Theo posted a *mega diff* of nearly 100 smaller diffs, adding tame support to many areas of the userland tools
* It's still a work-in-progress version; there's still more to be added (including the file path whitelist stuff)
* Some classic utilities are even being reworked to make taming them easier - [the "w" command](https://www.marc.info/?l=openbsd-cvs&m=144103945031253&w=2), for example
* The diff provides some good insight on exactly how to restrict different types of utilities, as well as how easy it is to actually do so (and en masse)
* More discussion can be found [on HN](https://news.ycombinator.com/item?id=10135901), as one might expect
* If you're a software developer, and especially if your software is in ports already, consider adding some more fine-grained tame support in your next release \*\*\*

Interview - Scott Courtney - [vbsdcon@verisign.com](mailto:vbsdcon@verisign.com) / [@verisign](https://twitter.com/verisign)
----------

[vBSDCon](http://vbsdcon.com/) 2015

---

News Roundup
----------

### [OPNsense, beyond the fork](https://opnsense.org/opnsense-beyond-the-fork) ###

* We first [heard about](http://www.bsdnow.tv/episodes/2015_01_14-common_sense_approach) OPNsense back in January, and they've since released nearly **40** versions, spanning over **5,000** commits
* This is their first big status update, covering some of the things that've happened since the project was born
* There's been a lot of community growth and participation, mass bug fixing, new features added, experimental builds with ASLR and much more - the report touches on a little of everything \*\*\*

### [LibreSSL nukes SSLv3](http://undeadly.org/cgi?action=article&sid=20150827112006) ###

* With their latest release, LibreSSL began to turn off [SSLv3](http://disablessl3.com) support, starting with the "openssl" command
* At the time, SSLv3 wasn't disabled entirely because of some things in the OpenBSD ports tree requiring it (apache being one odd example)
* They've now flipped the switch, and the process of complete removal has started
* From the Undeadly summary, "This is an important step for the security of the LibreSSL library and, by extension, the ports tree. It does, however, require lots of testing of the resulting packages, as some of the fallout may be at runtime (so not detected during the build). That is part of why this is committed at this point during the release cycle: it gives the community more time to test packages and report issues so that these can be fixed. When these fixes are then pushed upstream, the entire software ecosystem will benefit. In short: you know what to do!"
* With this change and a few more to follow shortly, Libre\*SSL\* won't actually *support SSL* anymore - time to rename it "LibreTLS" \*\*\*

### [FreeBSD MPTCP updated](http://caia.swin.edu.au/urp/newtcp/mptcp/tools/v05/mptcp-readme-v0.5.txt) ###

* For anyone unaware, [Multipath TCP](https://en.wikipedia.org/wiki/Multipath_TCP) is "an ongoing effort of the Internet Engineering Task Force's (IETF) Multipath TCP working group, that aims at allowing a Transmission Control Protocol (TCP) connection to use multiple paths to maximize resource usage and increase redundancy."
* There's been work out of an Australian university to add support for it to the FreeBSD kernel, and the patchset was recently updated
* Including in this latest version is an overview of the protocol, how to get it compiled in, current features and limitations and some info about the routing requirements
* Some big performance gains can be had with MPTCP, but only if both the client and server systems support it - getting it into the FreeBSD kernel would be a good start \*\*\*

### [UEFI and GPT in OpenBSD](https://www.marc.info/?l=openbsd-cvs&m=144092912907778&w=2) ###

* There hasn't been much fanfare about it yet, but some initial UEFI and GPT-related commits have been creeping into OpenBSD recently
* Some [support](https://github.com/yasuoka/openbsd-uefi) for UEFI booting has landed in the kernel, and more bits are being slowly enabled after review
* This comes along with a [number](https://www.marc.info/?l=openbsd-cvs&m=143732984925140&w=2) [of](https://www.marc.info/?l=openbsd-cvs&m=144088136200753&w=2) [other](https://www.marc.info/?l=openbsd-cvs&m=144046793225230&w=2) [commits](https://www.marc.info/?l=openbsd-cvs&m=144045760723039&w=2) related to GPT, much of which is being refactored and slowly reintroduced
* Currently, you have to do some disklabel wizardry to bypass the MBR limit and access more than 2TB of space on a single drive, but it should "just work" with GPT (once everything's in)
* The UEFI bootloader support [has been committed](https://www.marc.info/?l=openbsd-cvs&m=144115942223734&w=2), so stay tuned for [more updates](http://undeadly.org/cgi?action=article&sid=20150902074526&mode=flat) as [further](https://twitter.com/kotatsu_mi/status/638909417761562624) [progress](https://twitter.com/yojiro/status/638189353601097728) is made \*\*\*

Feedback/Questions
----------

* [John writes in](http://slexy.org/view/s2sIWfb3Qh)
* [Mason writes in](http://slexy.org/view/s2Ybrx00KI)
* [Earl writes in](http://slexy.org/view/s20FpmR7ZW) \*\*\*