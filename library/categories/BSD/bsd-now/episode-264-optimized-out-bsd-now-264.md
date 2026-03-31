+++
title = "Episode 264: Optimized-out | BSD Now 264"
description = 'FreeBSD and DragonflyBSD benchmarks on AMD’s Threadripper, NetBSD 7.2 has been released, optimized out DTrace kernel symbols, stuck UEFI bootloaders, why ed is not a good editor today, tell your BSD story, and more.\Headlines   \[FreeBSD & DragonFlyBSD Put Up A Strong Fight '
date = "2018-09-20T05:00:00Z"
url = "https://www.bsdnow.tv/264"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.707929543Z"
seen = true
+++

FreeBSD and DragonflyBSD benchmarks on AMD’s Threadripper, NetBSD 7.2 has been released, optimized out DTrace kernel symbols, stuck UEFI bootloaders, why ed is not a good editor today, tell your BSD story, and more.

\##Headlines  
 \###[FreeBSD & DragonFlyBSD Put Up A Strong Fight On AMD’s Threadripper 2990WX, Benchmarks Against Linux](https://www.phoronix.com/scan.php?page=article&item=bsd-threadripper-2990wx&num=1)

>
>
> The past two weeks I have been delivering a great deal of AMD Threadripper 2990WX benchmarks on Linux as well as some against Windows and Windows Server. But recently I got around to trying out some of the BSD operating systems on this 32-core / 64-thread processor to see how they would run and to see whether they would have similar scaling issues or not like we’ve seen on the Windows side against Linux. In this article are FreeBSD and DragonFlyBSD benchmarks with the X399 + 2990WX compared to a few Linux distributions.  
>  The BSDs I focused my testing on were FreeBSD 11.2-STABLE and 12.0-CURRENT/ALPHA1 (the version in development) as well as iX System’s TrueOS that is tracking FreeBSD 12.0-CURRENT. Also included were DragonFlyBSD, with FreeBSD and DragonFlyBSD being tied as my favorite operating systems when it comes to the BSDs. When it came to FreeBSD 11.2-STABLE and 12.0-ALPHA1 on the Threadripper 2990WX, it worked out surprisingly well. I encountered no real issues during my two days of benchmarking on FreeBSD (and TrueOS). It was a great experience and FreeBSD was happy to exploit the 64 threads on the system.  
>  DragonFlyBSD was a bit of a different story… Last week when I started this BSD testing I tried DragonFly 5.2.2 as the latest stable release as well as a DragonFlyBSD 5.3 development snapshot from last week: both failed to boot in either BIOS or UEFI modes.  
>  But then a few days ago DragonFlyBSD lead developer Matthew Dillon bought himself a 2990WX platform. He made the necessary changes to get DragonFlyBSD 5.3 working and he ended up finding really great performance and potential out of the platform. So I tried the latest DragonFlyBSD 5.3 daily ISO on 22 August and indeed it now booted successfully and we were off to the races. Thus there are some DragonFlyBSD 5.3 benchmarks included in this article too.  
>  Just hours ago, Matthew Dillon landed some 2990WX topology and scheduler enhancements but that fell out of the scope of when DragonFly was installed on this system. But over the weekend or so I plan to re-test DragonFlyBSD 5.3 and see how those optimizations affect the overall 2990WX performance now on that BSD. DragonFlyBSD 5.4 stable should certainly be an interesting release on several fronts!  
>  With FreeBSD 11.2-STABLE and 12.0-ALPHA1 I ran benchmarks when using their stock compiler (LLVM Clang 6.0) as well as GCC 7.3 obtained via GCC 7.3. That was done to rule out compiler differences in benchmarking against the GCC-based Linux distributions. On DragonFlyBSD 5.3 it defaults to the GCC 5.4.1 but via pkg I also did a secondary run when upgraded to GCC 7.3.  
>  The hardware and BIOS/UEFI settings were maintained the same throughout the entire benchmarking process. The system was made up of the AMD Ryzen Threadripper 2990WX at stock speeds, the ASUS ROG ZENITH EXTREME motherboard, 4 x 8GB DDR4-3200MHz memory, Samsung 970 EVO 500GB NVMe SSD, and Radeon RX Vega 56 graphics card.  
>  All of these Linux vs. BSD benchmarks were carried out in a fully-automated and reproducible manner using the open-source Phoronix Test Suite benchmarking framework.  
>  While for the last of today’s BSD vs. Linux benchmarking on the Threadripper 2990WX, the Linux distributions came out slightly ahead of FreeBSD and DragonFlyBSD with GCC (another test having issues with Clang 6.0 on the BSDs).  
>  Overall, I was quite taken away by the BSD performance on the Threadripper 2990WX – particularly FreeBSD. In a surprising number of benchmarks, the BSDs were outperforming the tested Linux distributions though often by incredibly thin margins. Still, quite an accomplishment for these BSD operating systems and considering how much better Linux is already doing than Windows 10 / Windows Server on this 32-core / 64-thread processor. Then again, the BSDs like Linux have a long history of running on high core/thread-count systems, super computers, and other HPC environments.  
>  It will be interesting to see how much faster DragonFlyBSD can run given today’s commit to its kernel with scheduler and topology improvements for the 2990WX. Those additional DragonFlyBSD benchmarks will be published in the coming days once they are completed.
>
>

---

\###[NetBSD 7.2 released](https://www.netbsd.org/releases/formal-7/NetBSD-7.2.html)

>
>
> The NetBSD Project is pleased to announce NetBSD 7.2, the second feature update of the NetBSD 7 release branch. It represents a selected subset of fixes deemed important for security or stability reasons, as well as new features and enhancements.
>
>

* General Security Note

`The NetBSD 7.2 release is a maintenance release of the netbsd-7 branch, which had it's first major release, NetBSD 7.0 in September 2015. A lot of security features have been added to later NetBSD versions, and for new installations we highly recommend using our latest release, NetBSD 8.0 instead.`

* Some highlights of the 7.2 release are:
* Support for USB 3.0.
* Enhancements to the Linux emulation subsystem.
* Fixes in binary compatibility for ancient NetBSD executables.
* iwm(4) driver for Intel Wireless 726x, 316x, 826x and 416x series added.
* Support for Raspberry Pi 3 added.
* Fix interrupt setup on Hyper-V VMs with Legacy Network Adapter.
* SVR4 and IBCS2 compatibility subsystems have been disabled by default (besides IBCS2 on VAX). These subsystems also do not auto-load their modules any more.
* Various USB stability enhancements.
* Numerous bug fixes and stability improvements.

>
>
> Complete source and binaries for NetBSD 7.2 are available for download at many sites around the world. A list of download sites providing FTP, AnonCVS, SUP, and other services may be found at [https://www.NetBSD.org/mirrors/](https://www.NetBSD.org/mirrors/). We encourage users who wish to install via ISO or USB disk images to download via BitTorrent by using the torrent files supplied in the images area. A list of hashes for the NetBSD 7.2 distribution has been signed with the well-connected PGP key for the NetBSD Security Officer: [https://cdn.NetBSD.org/pub/NetBSD/security/hashes/NetBSD-7.2\_hashes.asc](https://cdn.NetBSD.org/pub/NetBSD/security/hashes/NetBSD-7.2_hashes.asc)  
>  NetBSD is free. All of the code is under non-restrictive licenses, and may be used without paying royalties to anyone. Free support services are available via our mailing lists and website. Commercial support is available from a variety of sources. More extensive information on NetBSD is available from our website:
>
>

---

\##News Roundup  
 \###[Including optimized-out kernel symbols in dtrace on FreeBSD](https://farhan.codes/2018/08/16/including-optimized-out-kernel-symbols-in-dtrace-on-freebsd/)

>
>
> Have you ever had dtrace(1) on FreeBSD fail to list a probe that should exist in the kernel? This is because Clang will optimize-out some functions. The result is ctfconvert(1) will not generate debugging symbols that dtrace(1) uses to identify probes. I have a quick solution to getting those probes visible to dtrace(1).
>
>

>
>
> In my case, I was trying to instrument on ieee80211\_ioctl\_get80211, whose sister function ieee80211\_ioctl\_set80211 has a dtrace(1) probe in the generic FreeBSD 11 and 12 kernels. Both functions are located in /usr/src/sys/net80211/ieee80211\_ioctl.c.
>
>

>
>
> My first attempt was to add to /etc/make.conf as follows and recompile the kernel.
>
>

`CFLAGS+=-O0 and -fno-inline-functions`

>
>
> This failed to produce the dtrace(1) probe. Several other attempts failed and I was getting inconsistent compilation results (Is it me or is ieee80211\_ioctl.c compiled with different flags if NO\_CLEAN=1 is set?). When I manually compiled the object file by copying the compilation line for the object file and adding -O0 -fno-inline-functions, nm(1) on both the object file and kernel demonstrated that the symbol was present. I installed the kernel, rebooted and it was listed as a dtrace probe. Great!
>
>

>
>
> But as I continued to debug my WiFi driver (oh yeah, I’m very slowly extending rtwn(4)), I found myself rebuilding the kernel several times and frequently rebooting. Why not do this across the entire kernel?
>
>

>
>
> After hacking around, my solution was to modify the build scripts. My solution was to edit /usr/src/sys/conf/kern.pre.mk and modify all optimization level 2 to optimization level 0. The following is my diff(1) on FreeBSD 12.0-CURRENT.
>
>

* A few thoughts:

>
>
> This seems like a hack rather than a long-term solution. Either the problem is with the hard-coded optimization flags, or the inability to overwrite them in all places in make.conf.  
>  Removing optimizations is only something I would do in a non-production kernel, so its as if I have to choose between optimizations for a production kernel or having dtrace probes. But dtrace explicitly markets itself as not impactful on production.  
>  Using the dtrace pony as your featured image on WordPress does not render properly and must be rotated and modified. Blame Bryan Cantrill.  
>  If you have a better solution, please let me know and I will update the article, but this works for me!
>
>

---

\###[FreeBSD: UEFI Bootloader stuck on BootCurrent/BootOrder/BootInfo on Asus Motherboards (and fix!)](https://www.neelc.org/freebsd-uefi-on-asus-motherboards/)

>
>
> Starting with FreeBSD CURRENT from about a few weeks of posting date, but including FreeBSD 12 alpha releases (not related to DEC Alpha), I noticed one thing: When I boot FreeBSD from UEFI on a homebuilt desktop with a Asus H87M-E motherboard, and have Root on ZFS, the bootloader gets stuck on lines like BootCurrent, BootOrder, and BootInfo. This issue occurs when I try to boot directly to efi\\boot\\bootx64.efi.
>
>

>
>
> One person had a similar issue on a Asus H87I-PLUS motherboard. This issue may or may not exist on other Asus motherboards, desktops, or laptops. This may be specific to Asus motherboards for Intel’s Haswell, but may also exist on newer systems (e.g. Skylake) or older (e.g. Ivy Bridge) with Asus motherboards, as well as Asus desktops or laptops.
>
>

* There are two solutions to this problem:
* Use Legacy BIOS mode instead of UEFI mode
* Install a FreeBSD UEFI Boot entry

>
>
> Keep in mind that I am not going to talk about this issue and third-party UEFI boot managers such as rEFInd here.  
>  The first option is rather straightforward: you need to make sure your computer has “Secure Boot” disabled and “Legacy Boot” or “CSM” enabled. Then, you need to make sure FreeBSD is installed in BIOS mode. However, this solution is (in my opinion) suboptimal. Why? Because:  
>  You won’t be able to use hard drives bigger than 2TB  
>  You are limited to MBR Partitioning on Asus motherboards with UEFI as Asus motherboards refuse to boot GPT partitioned disks in BIOS mode  
>  Legacy BIOS mode may not exist on future computers or motherboards (although those systems may not have this issue, and this issue may get fixed by then)  
>  The second option, however, is less straightforward, but will let you keep UEFI. Many UEFI systems, including affected Asus motherboards described here, include a boot manager built into the UEFI. FreeBSD includes a tool called efibootmgr to manage this, similar to the similarly-named tool in Linux, but with a different syntax.
>
>

---

\###[Why ed(1) is not a good editor today](https://utcc.utoronto.ca/~cks/space/blog/unix/EdNoLongerGoodEditor)

>
>
> I’ll start with my tweet:
>
>

`Heretical Unix opinion time: ed(1) may be the 'standard Unix editor', but it is not a particularly good editor outside of a limited environment that almost never applies today.`

>
>
> There is a certain portion of Unixdom that really likes ed(1), the ‘standard Unix editor’. Having actually used ed for a not insignificant amount of time (although it was the friendlier ‘UofT ed’ variant), I have some reactions to what I feel is sometimes overzealous praise of it. One of these is what I tweeted.  
>  The fundamental limitation of ed is that it is what I call an indirect manipulation interface, in contrast to the explicit manipulation interfaces of screen editors like vi and graphical editors like sam (which are generally lumped together as ‘visual’ editors, so called because they actually show you the text you’re editing). When you edit text in ed, you have some problems that you don’t have in visual editors; you have to maintain in your head the context of what the text looks like (and where you are in it), you have to figure out how to address portions of that text in order to modify them, and finally you have to think about how your edit commands will change the context. Copious use of ed’s p command can help with the first problem, but nothing really deals with the other two. In order to use ed, you basically have to simulate parts of ed in your head.  
>  Ed is a great editor in situations where the editor explicitly presenting this context is a very expensive or outright impossible operation. Ed works great on real teletypes, for example, or over extremely slow links where you want to send and receive as little data as possible (and on real teletypes you have some amount of context in the form of an actual printout that you can look back at). Back in the old days of Unix, this described a fairly large number of situations; you had actual teletypes, you had slow dialup links (and later slow, high latency network links), and you had slow and heavily overloaded systems.  
>  However, that’s no longer the situation today (at least almost all of the time). Modern systems and links can easily support visual editors that continually show you the context of the text and generally let you more or less directly manipulate it (whether that is through cursoring around it or using a mouse). Such editors are easier and faster to use, and they leave you with more brainpower free to think about things like the program you’re writing (which is the important thing).  
>  If you can use a visual editor, ed is not a particularly good editor to use instead; you will probably spend a lot of effort (and some amount of time) on doing by hand something that the visual editor will do for you. If you are very practiced at ed, maybe this partly goes away, but I maintain that you are still working harder than you need to be.  
>  The people who say that ed is a quite powerful editor are correct; ed is quite capable (although sadly limited by only editing a single file). It’s just that it’s also a pain to use.  
>  (They’re also correct that ed is the foundation of many other things in Unix, including sed and vi. But that doesn’t mean that the best way to learn or understand those things is to learn and use ed.)  
>  This doesn’t make ed a useless, vestigial thing on modern Unix, though. There are uses for ed in non-interactive editing, for example. But on modern Unix, ed is a specialized tool, much like dc. It’s worth knowing that ed is there and roughly what it can do, but it’s probably not worth learning how to use it before you need it. And you’re unlikely to ever be in a situation where it’s the best choice for interactive editing (and if you are, something has generally gone wrong).  
>  (But if you enjoy exploring the obscure corners of Unix, sure, go for it. Learn dc too, because it’s interesting in its own way and, like ed, it’s one of those classical old Unix programs.)
>
>

---

\##Beastie Bits

* [Is there any interest in a #BSD user group in #Montreal?](https://twitter.com/DavieDavieDave/status/1040359656864903169)
* [Tell your BSD story](https://www.bsdjobs.com/people/hi.html)
* [Finishing leftover tasks from Google Summer of Code](https://blog.netbsd.org/tnf/entry/finishing_leftover_tasks_from_google)
* [Fuzzing the OpenBSD Kernel](https://undeadly.org/cgi?action=article;sid=20180906072459)
* [ARM - any Tier-1 \*BSD options?](http://lists.nycbug.org/pipermail/talk/2018-August/017692.html)

---

\##Feedback/Questions

* Chris - [byhve question](http://dpaste.com/2Y6XBYN)
* Paulo - [Topic suggestion](http://dpaste.com/1A88F2W)
* Bostjan - [How data gets to disk](http://dpaste.com/140ZHZD#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---