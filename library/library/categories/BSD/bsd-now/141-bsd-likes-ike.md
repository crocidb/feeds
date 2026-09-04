+++
title = "141: BSD Likes Ike!"
description = "This week on the show, we have all the latest news and stories! Plus we’ll be hearing more about OpnSense from the man himself, Ike!This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems.com/"
date = "2016-05-11T12:00:00Z"
url = "https://www.bsdnow.tv/141"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.037975880Z"
seen = true
+++

This week on the show, we have all the latest news and stories! Plus we’ll be hearing more about OpnSense from the man himself, Ike!

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Regarding Embargoes](http://www.tedunangst.com/flak/post/regarding-embargoes) ###

* Our buddy TedU has a great thought piece today on the idea of “embargoes” for security advisories.
* This all stemmed from a recent incident with LibreSSL patches from embargoed OpenSSL vulns, that accidentally got committed too early.
* Ted makes a pretty good case on the difficulties of having embargos, and maybe the reason there shouldn’t be. Couple of quotes to give you a taste:

>
>
> “There are several difficulties maintaining embargoes. Keeping secrets is against human nature. I don’t want to be the one who leaks, but if I see something that looks like the secret is out, it’s a relief to be able to speak freely. There is a bias towards recognizing such signs where they may not really exist. (Exacerbated by broad embargoes where some parts leak but other parts don’t. It’s actually very hard to tell what’s not publicly known when you know everything.)
>
>
>
> The most thorough embargo and release timeline reconstruction is the heartbleed timeline. It’s another great case study. Who exactly decided who were the haves and have nots? Was it determined by who needed to know or who you needed to know? Eventually the dam started to crack.”
>
>
>
> “When Cloudflare brags that they get advance notice of vulnerabilities, attracting more customers, and therefore requiring even more early access, how are smaller players to compete? What happens if you’re not big enough to prenotify?
>
>
>
> Sometimes vulnerabilities are announced unplanned. Zero day cyber missiles are part of our reality, which means end users don’t really have the luxury of only patching on Tuesday. They need to apply patches when they appear. If applying patches at inconvenient times is a problem, make it not a problem. Not really a gripe about embargoes per se, but the scheduled timing of coordinated release at the end of the embargo is catering to a problem that shouldn’t exist.”
>
>

* I will admit that CloudFlare bragging around Heartbleed was upsetting
* The biggest issue here is the difficulty with coordinating so many open source projects, which are often done by volunteers, in different countries and time zones
* The other issue is determining when the secret is “out of the bag” \*\*\*

### [MAJOR ABI BREAK: csu, ld.so, libc, libpthread update](http://www.openbsd.org/faq/current.html#r20160507) ###

* OpenBSD warns those following the -current (development) branch to be careful as they upgrade because of a major ABI break that will result in applications not working
* “Handling of single-threaded programs is now closer to multi-threaded, with ld.so and libc.a doing thread information base (TIB) allocation. Threaded programs from before the 2016/03/19 csu and ld.so update will no longer run. An updated ld.so must be built and installed before running make build.”
* A special note for those on PowerPC: “PowerPC has been updated to offset the TIB from the hardware register. As a result, all threaded programs are broken until they have been rebuilt with the new libc and libpthread. perl must be built after building the libraries and before building the rest of base.”
* “The definitions of environ and \_\_progname for dynamically linked programs have been moved from the C startup code to ld.so(1). An updated ld.so must be built and installed before running make build.”
* The link provides instructions on how to update your system properly \*\*\*

### [How to install FreeBSD 10.3 on VMWare Workstation 12 Pro](http://random-notes-of-a-sysadmin.blogspot.be/2016/04/howto-install-freebsd-103-on-vmware.html) ###

* This tutorial starts at the very basics, running through the FreeBSD installer
* But then it goes on to configuring the machine specifically for VMWare
* After the system has been booted, the tutorial walks through installing the VMWare tools
* Then networking is configured in both VMWare and FreeBSD
* A small hack is required to make the VMWare tools startup script wait until the network is up
* A very nice tutorial for people using VMWare
* I am working on a patch to bsdinstall to ensure that the swap partition is put before the main partition, so it can more easily be resized if you later decide you need more space in your VM
* [the camcontrol reprobe subcommand has been added ](https://svnweb.freebsd.org/base?view=revision&revision=299371),
* “This makes it possible to manually force updating capacity data after the disk got resized. Without it it might be necessary to reboot before FreeBSD notices updated disk size under eg VMWare.” \*\*\*

### [BSD Router project releases v1.59](https://sourceforge.net/projects/bsdrp/files/BSD_Router_Project/1.59/) ###

* We’ve talked about the BSD Router project a bit in the past, but today we have a brand new release to bring to you.
* For those who don’t remember, the BSDrp is a router aimed at replacing more of your big-commercial type systems.
* First up in the new hotness, we have it based upon recently released FreeBSD 10.3!
* In addition, there is a new package: New package: mlvpn (aggregated network links in order to benefit from the bandwidth of multiple links)
* Other packages have gotten a bump with this release as well:

  * bsnmp-ucd to 0.4.2
  * dma to 0.11
  * dmidecode to 3.0
  * exabgp to 3.4.15
  * iperf3 to 3.1.2
  * monit to 5.17
  * mpd5 to 5.8
  * openvpn to 2.3.10
  * python to 2.7.11
  * quagga to 1.0.20160315
  * strongswan to 5.4.0

* What are you waiting for? Amd64 and i386 images are ready for you to download now.

  ---

Interview - Isaac (.Ike) Levy -
----------

* [See Ike again at SEMIBug in Troy, Michigan on May 17th](http://semibug.org/) \*\*\*

News Roundup
----------

### [Tredly - Prebuilt containers on FreeBSD](https://github.com/tredly/) ###

* [Discussion regarding its GPLv3 licensing](https://www.reddit.com/r/freebsd/comments/4gggw8/introducing_tredly_containers_for_unix_freebsd/)
* A new “container” solution called “Trendly” has started making some news around various tech sites.
* In particular, this new project uses FreeBSD as its base OS and jail functionality in the backend.
* Their solution seems based around the idea of shipping containers as manifests, such as lists of packages to install and configuration knobs.
* The project is still rather new, and we’ll be keeping an eye on it for the future.
* One notable change already though, it was (for some reason) released under GPLv3. Understandably this caused quite a ruckus with various folks in the community, since it’s built specifically on BSD. Since this, the code has been re-licensed as MIT, which is far more in the spirit of a traditional BSD license. \*\*\*

### [NVMe driver added to NetBSD - ported from OpenBSD](https://www.netbsd.org/changes/changes-8.0.html#nvme(4)) ###

* NetBSD has gained support for Non-Volatile Memory Express, the new standard for PCIe attached Flash Memory
* The change of interface from SATA to NVMe offers a number of advantages, mostly, it doesn’t require the device to pretend to be a spinning disk
* One of the biggest advantages is that it supports completing multiple operations at once, with the Intel hardware I have tested, 63 I/Os can happen concurrently, so a very large queue depth is required to keep the device busy. The 64th I/O channel is reserved for administrative commands, to keep them from being delayed by the large queue depth
* The device I tested could read at 3800 MB/s, and write 1700MB/s, something that wouldn’t be possible with a normal SSD
* It is interesting that NetBSD took the NVMe support from OpenBSD, whereas the FreeBSD implementation was contributed directly by Intel
* This may have to do with that fact that OpenBSD’s device model is closer to that of NetBSD
* [Commit Log ](http://mail-index.netbsd.org/source-changes/2016/05/01/msg074367.html) \*\*\*

### [New BSDNow T-Shirts](https://teespring.com/bsdnow) ###

* By popular demand, we have created a more subtle BSDNow shirt
* Featuring only the smallish BSDNow logo over the left breast
* Available in a number of styles (T-Shirt, Women’s T-Shirt, Long Sleeve, and Hoodie) as well as a number of colours: Black, Blue, Grey, and White
* The hope is that enough orders come though so we can get them shipped in and your sweaty little hands in time for BSDCan. (I’ll be wearing mine, will you B...SD?)
* [If you still want one of our now-famous “The Usual BSD’s” t-shirts, you can also indicate your interest here, and once 10 or more shirts are ordered, a reprint will happen automatically](https://teespring.com/bsd105) \*\*\*

### [PC-BSD 11-CURRENT with Package Base](http://lists.pcbsd.org/pipermail/testing/2016-May/010616.html) ###

* Looking for a way to play with the new FreeBSD base package system?
* This month’s PC-BSD -CURRENT image now used packages for base system installation, and is asking for testers to help find bugs.
* Known issues so far:
  * setuid binaries (Fix in works)
  * Missing tzone files
  * Distrib packages

* If all that doesn’t scare you away, then give it a whirl! Upgrades for previous APRIL images are now online also. \*\*\*

BeastieBits
----------

* [HardenedBSD + LibreSSL](https://hardenedbsd.org/article/shawn-webb/2016-05-05/libressl-hardenedbsd-base)

* [Michael Dexter's talk at LFNW 2016 is the 2nd highest youtube views from this years conference](https://www.youtube.com/watch?v=6k1Mf0c6YW8)

* [Why OpenBSD is important to me](http://ggr.com/why-openbsd-is-important-to-me.html)

* [Study of nginx-1.9.12 performance/latency on DragonFlyBSD-g67a73](http://lists.dragonflybsd.org/pipermail/users/2016-May/249581.html)

* [Running FreeBSD / OpenBSD / NetBSD as a virtualised guest on Online.net](https://www.geeklan.co.uk/?p=2109)

* [The interesting story of how IllumOS syscalls work ](http://zinascii.com/2016/the-illumos-syscall-handler.html)

* [The BeaST is the FreeBSD based dual-controller reliable storage system concept with aim to implement ZFS and in-memory cache.](https://mezzantrop.wordpress.com/portfolio/the-beast/)

* [Francois Tigeot updates the drm/i915 driver to match what’s in Linux kernel 4.3](http://lists.dragonflybsd.org/pipermail/commits/2016-May/500352.html)

* [FreeBSD is working on the update to Linux Kernel 4.6, we may finally get ahead of Dragonfly! ](https://twitter.com/ed_maste/status/730450314889924608)

---

Feedback/Questions
----------

* [ Oskar - Torrent Jail](http://pastebin.com/RT7tVtQ7)
* [ Shane - ZFS Delete](http://pastebin.com/VkpMeims)
* [ Adam - Zimbra Port](http://pastebin.com/MmQ00Sv1)
* [ Ray - PC-BSD - FrameBuffer](http://pastebin.com/Xx9TkX7A)
* [ Richard - ZFS Backups](http://pastebin.com/ncYxqpg3) \*\*\*