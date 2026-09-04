+++
title = "87: On the List"
description = "Coming up this time on the show, we'll be speaking with Christos Zoulas, a NetBSD security officer. He's got a new project called blacklistd, with some interesting possibilities for stopping bruteforce attacks. We've also got answers to your emails and all this week's news, on BS"
date = "2015-04-29T12:00:00Z"
url = "https://www.bsdnow.tv/87"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.146398378Z"
seen = true
+++

Coming up this time on the show, we'll be speaking with Christos Zoulas, a NetBSD security officer. He's got a new project called blacklistd, with some interesting possibilities for stopping bruteforce attacks. We've also got answers to your emails and all this week's news, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [New PAE support in OpenBSD](https://www.marc.info/?l=openbsd-cvs&m=142990524317070&w=2) ###

* OpenBSD has just added [Physical Address Extention](https://en.wikipedia.org/wiki/Physical_Address_Extension) support to the i386 architecture, but it's probably not what you'd think of when you hear the term
* In most operating systems, PAE's main advantage is to partially circumvent the 4GB memory limit on 32 bit platforms - this version isn't for that
* Instead, this change specifically allows the system to use the [No-eXecute Bit](https://en.wikipedia.org/wiki/NX_bit#OpenBSD) of the processor for the userland, further hardening the in-place memory protections
* Other operating systems enable the CPU feature without doing anything to the [page table entries](https://en.wikipedia.org/wiki/Page_table#Role_of_the_page_table), so they **do get** the available memory expansion, but **don't get** the potential security benefit
* As we discussed in a [previous episode](http://www.bsdnow.tv/episodes/2015_01_14-common_sense_approach), the AMD64 platform already saw some major W<sup>X</sup> kernel **and** userland improvements - the i386 kernel reworking will begin shortly
* Not all CPUs support this feature, but, if yours supports NX, this will improve upon the previous version of W<sup>X</sup> that was already there
* The AMD64 improvements will be in 5.7, due out in just a couple days as of when we're recording this, but the i386 improvements will likely be in 5.8 \*\*\*

### [Booting Windows in bhyve](https://twitter.com/nahannisys/status/591733319357730816) ###

* Work on FreeBSD's [bhyve](http://www.bsdnow.tv/episodes/2014_01_15-bhyve_mind) continues, and a big addition is on the way
* Thus far, bhyve has only been able to boot operating systems with a serial console - no VGA, no graphics, *no Windows*
* This is finally changing, and a teasing screenshot of Windows Server was recently posted on Twitter
* Graphics emulation is still in the works; this image was taken by booting headless and using RDP
* A lot of the needed code is being committed to -CURRENT now, but the UEFI portion of it requires a bit more development (and the aim for that is around the time of BSDCan)
* Not a lot of details on the matter currently, but we'll be sure to bring you more info as it comes out
* Are you more interested in bhyve or Xen on FreeBSD? Email us your thoughts \*\*\*

### [MidnightBSD 0.6 released](http://www.midnightbsd.org/notes/) ###

* MidnightBSD is a smaller project we've not covered a lot on the show before
* It's an operating system that was forked from FreeBSD back in the 6.1 days, and their focus seems to be on ease-of-use
* They also have their own, smaller version of FreeBSD ports, called "mports"
* If you're already using it, this new version is mainly a security and bugfix release
* It syncs up with the most recent FreeBSD security patches and gets a lot of their ports closer to the latest versions
* You can check [their site](http://www.midnightbsd.org/about/) for more information about the project
* We're trying to get the lead developer to come on for an interview, but haven't heard anything back yet \*\*\*

### [OpenBSD rewrites the file utility](https://www.marc.info/?l=openbsd-cvs&m=142989267412968&w=4) ###

* We're all probably familiar with the traditional [file](https://en.wikipedia.org/wiki/File_(command)) command - it's been around [since the 1970s](http://darwinsys.com/file/)
* For anyone who doesn't know, it's used to determine what type of file something actually is
* This tool doesn't see a lot of development these days, and it's had its share of security issues as well
* Some of those security issues [remain](https://www.marc.info/?l=openbsd-tech&m=141857001403570&w=2) [unfixed](https://www.marc.info/?l=freebsd-security&m=142980545021888&w=2) in various BSDs **even today**, despite being publicly known for a while
* It's not uncommon for people to run file on random things they download from the internet, maybe even as root, and some of the previous bugs have allowed file to overwrite other files or execute code as the user running it
* When you think about it, file was technically *designed* to be used on untrusted files
* OpenBSD developer Nicholas Marriott, who also happens to be the author of tmux, decided it was time to do a complete rewrite - this time with modern coding practices and the usual OpenBSD scrutiny
* This new version will, by default, run [as an unprivileged user](https://www.marc.info/?l=openbsd-cvs&m=143014212727213&w=2) with no shell, and in a [systrace sandbox](https://www.marc.info/?l=openbsd-cvs&m=143014276127454&w=2), strictly limiting what system calls can be made
* With these two things combined, it should drastically reduce the damage a malicious file could potentially do
* Ian Darwin, the original author of the utility, [saw the commit and replied](https://www.marc.info/?l=openbsd-cvs&m=142989483913635&w=4), in what may be a moment in BSD history to remember
* It'll be interesting to see if the other BSDs, OS X, Linux or other UNIXes consider adopting this implementation in the future - someone's already thrown together an unofficial portable version
* Coincidentally, the lead developer and current maintainer of file just happens to be our guest today… \*\*\*

Interview - Christos Zoulas - [christos@netbsd.org](mailto:christos@netbsd.org)
----------

[blacklistd](https://www.youtube.com/watch?v=0UKCAsezF3Q) and NetBSD advocacy

---

News Roundup
----------

### [GSoC-accepted BSD projects](https://www.google-melange.com/gsoc/projects/list/google/gsoc2015) ###

* The Google Summer of Code people have published a list of all the projects that got accepted this year, and both FreeBSD and OpenBSD are on that list
* FreeBSD's [list](https://wiki.freebsd.org/SummerOfCode2015Projects) includes: NE2000 device model in userspace for bhyve, updating Ficl in the bootloader, type-aware kernel virtual memory access for utilities, JIT compilation for firewalls, test cluster automation, Linux packages for pkgng, an mtree parsing and manipulation library, porting bhyve to ARM-based platforms, CD-ROM emulation in CTL, libc security extensions, gptzfsboot support for dynamically discovering BEs during startup, CubieBoard support, a bhyve version of the netmap virtual passthrough for VMs, PXE support for FreeBSD guests in bhyve and finally.. **memory compression and deduplication**
* OpenBSD's [list](http://www.openbsdfoundation.org/gsoc2015.html) includes: asynchronous USB transfer submission from userland, ARM SD/MMC & controller driver in libsa, improving USB userland tools and ioctl, automating module porting, implementing a KMS driver to the kernel and, wait for it... **porting HAMMER FS to OpenBSD**
* We'll be sure to keep you up to date on developments from both projects
* Hopefully the other BSDs will make the cut too next year \*\*\*

### [FreeBSD on the Gumstix Duovero](http://www.jumpnowtek.com/gumstix-freebsd/FreeBSD-Duovero-build-workstation-setup.html) ###

* If you're not familiar with the Gumstix Duovero, it's an dual core ARM-based [computer-on-module](https://store.gumstix.com/index.php/coms/duovero-coms.html)
* They actually look more like a stick of RAM than a mini-computer
* This article shows you how to build a FreeBSD -CURRENT image to run on them, using [crochet-freebsd](https://github.com/freebsd/crochet)
* If anyone has any interesting devices like this that they use BSD on, write up something about it and send it to us \*\*\*

### [EU study recommends OpenBSD](https://joinup.ec.europa.eu/community/osor/news/ep-study-“eu-should-finance-key-open-source-tools”) ###

* A recent study by the European Parliament was published, explaining that more funding should go into critical open source projects and tools
* This is especially important, in all countries, after the mass surveillance documents came out
* "[...] the use of open source computer operating systems and applications reduces the risk of privacy intrusion by mass surveillance. Open source software is not error free, or less prone to errors than proprietary software, the experts write. But proprietary software does not allow constant inspection and scrutiny by a large community of experts."
* The report goes on to mention users becoming more and more security and privacy-aware, installing additional software to help protect themselves and their traffic from being spied on
* Alongside Qubes, a Linux distro focused on containment and isolation, OpenBSD got a special mention: "Proactive security and cryptography are two of the features highlighted in the product together with portability, standardisation and correctness. Its built-in cryptography and packet filter make OpenBSD suitable for use in the security industry, for example on firewalls, intrusion-detection systems and VPN gateways"
* Reddit, Undeadly and Hacker News also [had](https://www.reddit.com/r/programming/comments/340xh3/eu_study_recommends_use_of_openbsd_for_its/) [some](http://undeadly.org/cgi?action=article&sid=20150427093546) [discussion](https://news.ycombinator.com/item?id=9445831), particularly about corporations giving back to the BSDs that they make use of in their infrastructure - something we've discussed with [Voxer](http://www.bsdnow.tv/episodes/2014_10_08-behind_the_masq) and [M:Tier](http://www.bsdnow.tv/episodes/2015_04_22-business_as_usual) before \*\*\*

### [FreeBSD workflow with Git](https://lists.freebsd.org/pipermail/freebsd-current/2015-April/055551.html) ###

* If you're interested in contributing to FreeBSD, but aren't a big fan of SVN, they have a Github mirror too
* This mailing list post talks about interacting [between](https://wiki.freebsd.org/GitWorkflow/GitSvn) the official source repository and the Git mirror
* This makes it easy to get pull requests merged into the official tree, and encourages more developers to get involved \*\*\*

Feedback/Questions
----------

* [Sean writes in](http://slexy.org/view/s2vjh3ogvG)
* [Bryan writes in](http://slexy.org/view/s20GMcWvKE)
* [Sean writes in](http://slexy.org/view/s21M1imT3d)
* [Charles writes in](http://slexy.org/view/s25ScxQSwb) \*\*\*