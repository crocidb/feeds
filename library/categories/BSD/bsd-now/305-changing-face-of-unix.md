+++
title = "305: Changing face of Unix"
description = "Website protection with OPNsense, FreeBSD Support Pull Request for ZFS-on-Linux, How much has Unix changed, Porting Wine to amd64 on NetBSD, FreeBSD Enterprise 1 PB Storage, the death watch for X11 has started, and more.Headlines[Website protection with OPNsense](ht"
date = "2019-07-04T02:00:00Z"
url = "https://www.bsdnow.tv/305"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.624306858Z"
seen = true
+++

Website protection with OPNsense, FreeBSD Support Pull Request for ZFS-on-Linux, How much has Unix changed, Porting Wine to amd64 on NetBSD, FreeBSD Enterprise 1 PB Storage, the death watch for X11 has started, and more.

Headlines
----------

### [Website protection with OPNsense](https://medium.com/@jccwbb/website-protection-with-opnsense-3586a529d487) ###

* with nginx plugin OPNsense become a strong full featured Web Application Firewall (WAF)

>
>
> The OPNsense security platform can help you to protect your network and your webservers with the nginx plugin addition.  
>  In old days, install an open source firewall was a very trick task, but today it can be done with few clicks (or key strokes). In this article I'll not describe the detailed OPNsense installation process, but you can watch this video that was extracted from my OPNsense course available in Udemy. The video is in portuguese language, but with the translation CC Youtube feature you may be able to follow it without problems (if you don't are a portuguese speaker ofcourse) :-)
>
>
>
> * See the article for the rest of the writeup
>
>

---

### [FreeBSD Support Pull Request against the ZFS-on-Linux repo](https://github.com/zfsonlinux/zfs/pull/8987) ###

* This pull request integrates the sysutils/openzfs port’s sources into the upstream ZoL repo \> Adding FreeBSD support to ZoL will make it easier to move changes back and forth between FreeBSD and Linux \> Refactor tree to separate out Linux and FreeBSD specific code \> import FreeBSD's SPL \> add ifdefs in common code where it made more sense to do so than duplicate the code in separate files \> Adapted ZFS Test Suite to run on FreeBSD and all tests that pass on ZoL passing on ZoF
* The plan to officially rename the common repo from ZFSonLinux to OpenZFS was announced at the ZFS Leadership Meeting on June 25th
* [Video of Leadership Meeting](https://www.youtube.com/watch?v=TJwykiJmH0M)
* [Meeting Agenda and Notes](https://docs.google.com/document/d/1w2jv2XVYFmBVvG1EGf-9A5HBVsjAYoLIFZAnWHhV-BM/edit)
* This will allow improvements made on one OS to be made available more easily (and more quickly) to the other platforms
* For example, mav@’s recent work:
* [Add wakeup\_any(), cheaper version of wakeup\_one() for taskqueue(9)](https://svnweb.freebsd.org/base?view=revision&revision=349220) \> As result, on 72-core Xeon v4 machine sequential ZFS write to 12 ZVOLs with 16KB block size spend 34% less time in wakeup\_any() and descendants then it was spending in wakeup\_one(), and total write throughput increased by \~10% with the same as before CPU usage.

---

News Roundup
----------

### [Episode 5 Notes - How much has UNIX changed?](http://adventofcomputing.libsyn.com/episode-5-notes-how-much-has-unix-changed) ###

>
>
> UNIX-like systems have dominated computing for decades, and with the rise of the internet and mobile devices their reach has become even larger. True, most systems now use more modern OSs like Linux, but how much has the UNIX-like landscape changed since the early days?  
>  So, my question was this: how close is a modern \*NIX userland to some of the earliest UNIX releases? To do this I'm going to compare a few key points of a modern Linux system with the earliest UNIX documentation I can get my hands on. The doc I am going to be covering([https://www.tuhs.org/Archive/Distributions/Research/Dennis\_v1/UNIX\_ProgrammersManual\_Nov71.pdf](https://www.tuhs.org/Archive/Distributions/Research/Dennis_v1/UNIX_ProgrammersManual_Nov71.pdf)) is from November 1971, predating v1 of the system.  
>  I think the best place to start this comparison is to look at one of the highest-profile parts of the OS, that being the file system. Under the hood modern EXT file systems are completely different from the early UNIX file systems. However, they are still presented in basically the same way, as a heirerarchicat structure of directories with device files. So paths still look identical, and navigating the file system still functions the same. Often used commands like `ls`, `cp`, `mv`, `du`, and `df` function the same. So are `mount` and `umount`. But, there are some key differences. For instance, `cd` didn't exist, yet instead `chdir` filled its place. Also, `chmod` is somewhat different. Instead of the usual 3-digit octal codes for permissions, this older version only uses 2 digits. Really, that difference is due to the underlying file system using a different permission set than modern systems. For the most part, all the file handling is actually pretty close to a Linux system from 2019.
>
>

* See the article for the rest of the writeup

---

### [Porting Wine to amd64 on NetBSD](https://blog.netbsd.org/tnf/entry/porting_wine_to_amd64_on) ###

>
>
> I have been working on porting Wine to amd64 on NetBSD as a GSoC 2019 project. Wine is a compatibility layer which allows running Microsoft Windows applications on POSIX-complaint operating systems. This report provides an overview of the progress of the project during the first coding period.  
>  Initially, when I started working on getting Wine-4.4 to build and run on NetBSD i386 the primary issue that I faced was Wine displaying black windows instead of UI, and this applied to any graphical program I tried running with Wine.  
>  I suspected it , as it is related to graphics, to be an issue with the graphics driver or Xorg. Subsequently, I tried building modular Xorg, and I tried running Wine on it only to realize that Xorg being modular didn't affect it in the least. After having tried a couple of configurations, I realized that trying to hazard out every other probability is going to take an awful lot of time that I didn't have. This motivated me to bisect the repo using git, and find the first version of Wine which failed on NetBSD.
>
>
>
> * See the article for the rest of the writeup
>
>

---

### [FreeBSD Enterprise 1 PB Storage](https://vermaden.wordpress.com/2019/06/19/freebsd-enterprise-1-pb-storage/?utm_source=discoverbsd) ###

>
>
> Today FreeBSD operating system turns 26 years old. 19 June is an International FreeBSD Day. This is why I got something special today :). How about using FreeBSD as an Enterprise Storage solution on real hardware? This where FreeBSD shines with all its storage features ZFS included.  
>  Today I will show you how I have built so called Enterprise Storage based on FreeBSD system along with more then 1 PB (Petabyte) of raw capacity.  
>  This project is different. How much storage space can you squeeze from a single 4U system? It turns out a lot! Definitely more then 1 PB (1024 TB) of raw storage space.
>
>

* See the article for the rest of the writeup

---

### [The death watch for the X Window System (aka X11) has probably started](https://utcc.utoronto.ca/~cks/space/blog/unix/XDeathwatchStarts) ###

>
>
> Once we are done with this we expect X.org to go into hard maintenance mode fairly quickly. The reality is that X.org is basically maintained by us and thus once we stop paying attention to it there is unlikely to be any major new releases coming out and there might even be some bitrot setting in over time. We will keep an eye on it as we will want to ensure X.org stays supportable until the end of the RHEL8 lifecycle at a minimum, but let this be a friendly notice for everyone who rely the work we do maintaining the Linux graphics stack, get onto Wayland, that is where the future is.  
>  I have no idea how true this is about X.org X server maintenance, either now or in the future, but I definitely think it's a sign that developers have started saying this. If Gnome developers feel that X.org is going to be in hard maintenance mode almost immediately, they're probably pretty likely to also put the Gnome code that deals with X into hard maintenance mode. And public Gnome statements about this (and public action or lack of it) provide implicit support for KDE and any other desktop to move in this direction if they want to (and probably create some pressure to do so). I've known that Wayland was the future for some time, but I would still like it to not arrive any time soon.
>
>

---

Beastie Bits
----------

* [Porting NetBSD to Risc-V -- Video](https://www.youtube.com/watch?v=2vQXGomKoxA)
* [FreeBSD 11.3RC3 Available](https://www.freebsd.org/news/newsflash.html#event20190628:01)
* [Open Source Could Be a Casualty of the Trade War](https://www.bunniestudios.com/blog/?p=5590)
* [Celebrate UNIX50 and SDF32](https://sdf.org/sdf32/)
* [doas environmental security](https://undeadly.org/cgi?action=article;sid=20190621104048)

---

Feedback/Questions
----------

* Matt - [BSD or Older Hardware](http://dpaste.com/1RP09F0#wrap)
* MJRodriguez - [Some Playstation news](http://dpaste.com/046SPPB#wrap)
* Moritz - [bhyve VT-x passthrough](http://dpaste.com/1H4PJXW)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.