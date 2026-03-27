+++
title = "292: AsiaBSDcon 2019 Recap"
description = 'FreeBSD Q4 2018 status report, the GhostBSD alternative, the coolest 90s laptop, OpenSSH 8.0 with quantum computing resistant keys exchange, project trident: 18.12-U8 is here, and more.\Headlines   \AsiaBSDcon 2019 recap* Both Allan and I atten'
date = "2019-04-04T15:00:00Z"
url = "https://www.bsdnow.tv/292"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.648858498Z"
seen = false
+++

FreeBSD Q4 2018 status report, the GhostBSD alternative, the coolest 90s laptop, OpenSSH 8.0 with quantum computing resistant keys exchange, project trident: 18.12-U8 is here, and more.

\##Headlines  
 \###[AsiaBSDcon 2019 recap](https://2019.asiabsdcon.org)

* Both Allan and I attended AsiaBSDcon 2019 in Tokyo in mid march. After a couple of days of Tokyo sightseeing and tasting the local food, the conference started with tutorials.
* Benedict gave his tutorial about “BSD-based Systems Monitoring with Icinga2 and OpenSSH”, while Allan ran the FreeBSD developer summit.
* On the next day, Benedict attended the tutorial “writing (network) tests for FreeBSD” held by Kristof Provost. I learned a lot about Kyua, where tests live and how they are executed. I took some notes, which will likely become an article or chapter in the developers handbook about writing tests.
* On the third day, Hiroki Sato officially opened the paper session and then people went into individual talks.
* Benedict attended
  >
  >
  > Adventure in DRMland - Or how to write a FreeBSD ARM64 DRM driver by Emmanuel  
  >  Vadot
  >
  >

>
>
> powerpc64 architecture support in FreeBSD ports by Piotr Kubaj  
>  Managing System Images with ZFS by Allan Jude  
>  FreeBSD - Improving block I/O compatibility in bhyve by Sergiu Weisz  
> [Security Fantasies and Realities for the BSDs by George V.  
>  Neville-Neil](https://www.youtube.com/watch?v=7kShjboN6ek)  
>  ZRouter: Remote update of firmware by Hiroki Mori  
>  Improving security of the FreeBSD boot process by Marcin Wojtas
>
>

* Allan attended
  >
  >
  > Adventures in DRMland by Emmanuel Vadot  
  >  Intel HAXM by Kamil Rytarowski  
  >  BSD Solutions in Australian NGOs  
  >  Container Migration on FreeBSD by Yuhei Takagawa  
  >  Security Fantasies and Realities for the BSDs by George Neville-Neil
  >
  >

>
>
> ZRouter: Remote update of firmware by Hiroki Mori  
>  Improving security of the FreeBSD boot process by Marcin Wojtas
>
>

* When not in talks, time was spent in the hallway track and conversations would often continue over dinner.
* Stay tuned for announcements about where AsiaBSDcon 2020 will be, as the Tokyo Olympics will likely force some changes for next year. Overall, it was nice to see people at the conference again, listen to talks, and enjoy the hospitality of Japan.

\###[FreeBSD Quarterly Status Report - Fourth Quarter 2018](https://lists.freebsd.org/pipermail/freebsd-announce/2019-March/001871.html)

>
>
> Since we are still on this island among many in this vast ocean of the Internet, we write this message in a bottle to inform you of the work we have finished and what lies ahead of us. These deeds that we have wrought with our minds and hands, they are for all to partake of - in the hopes that anyone of their free will, will join us in making improvements. In todays message the following by no means complete or ordered set of improvements and additions will be covered:  
>  i386 PAE Pagetables for up to 24GB memory support, Continuous Integration efforts, driver updates to ENA and graphics, ARM enhancements such as RochChip, Marvell 8K, and Broadcom support as well as more DTS files, more Capsicum possibilities, as well as pfsync improvements, and many more things that you can read about for yourselves.  
>  Additionally, we bring news from some islands further down stream, namely the nosh project, HardenedBSD, ClonOS, and the Polish BSD User-Group.  
>  We would, selfishly, encourage those of you who give us the good word to please send in your submissions sooner than just before the deadline, and also encourage anyone willing to share the good word to please read the section on which submissions we’re also interested in having.
>
>

---

\###[GhostBSD: A Solid Linux-Like Open Source Alternative](https://www.linuxinsider.com/story/GhostBSD-A-Solid-Linux-Like-Open-Source-Alternative-85859.html)

>
>
> The subject of this week’s Linux Picks and Pans is a representative of a less well-known computing platform that coexists with Linux as an open source operating system. If you thought that the Linux kernel was the only open source engine for a free OS, think again. BSD (Berkeley Software Distribution) shares many of the same features that make Linux OSes viable alternatives to proprietary computing platforms.  
>  GhostBSD is a user-friendly Linux-like desktop operating system based on TrueOS. TrueOS is, in turn, based on FreeBSD’s development branch. TrueOS’ goal is to combine the stability and security of FreeBSD with a preinstalled GNOME, MATE, Xfce, LXDE or Openbox graphical user interface.  
>  I stumbled on TrueOS while checking out new desktop environments and features in recent new releases of a few obscure Linux distros. Along the way, I discovered that today’s BSD computing family is not the closed source Unix platform the “BSD” name might suggest.  
>  In last week’s Redcore Linux review, I mentioned that the Lumina desktop environment was under development for an upcoming Redcore Linux release. Lumina is being developed primarily for BSD OSes. That led me to circle back to a review I wrote two years ago on Lumina being developed for Linux.  
>  GhostBSD is a pleasant discovery. It has nothing to do with being spooky, either. That goes for both the distro and the open source computing family it exposes.  
>  Keep reading to find out what piqued my excitement about Linux-like GhostBSD.
>
>

---

\##News Roundup  
 \###[SPARCbook 3000ST - The coolest 90s laptop](http://triosdevelopers.com/jason.eckert/blog/Entries/2019/3/14_SPARCbook_3000ST_-_The_coolest_90s_laptop.html)

>
>
> A few weeks back I managed to pick up an incredibly rare laptop in immaculate condition for $50 on Kijiji: a Tadpole Technologies SPARCbook 3000ST from 1997 (it also came with two other working Pentium laptops from the 1990s).  
>  Sun computers were an expensive desire for many computer geeks in the 1990s, and running UNIX on a SPARC-based laptop was, well, just as cool as it gets. SPARC was an open hardware platform that anyone could make, and Tadpole licensed the Solaris UNIX operating system from Sun for their SPARCbooks. Tadpole essentially made high-end UNIX/VAX workstations on costly, unusual platforms (PowerPC, DEC Alpha, SPARC) but only their SPARCbooks were popular in the high-end UNIX market of the 1990s.
>
>

---

\###[OpenSSH 8.0 Releasing With Quantum Computing Resistant Keys](https://codesmithdev.com/openssh-8-0-releasing-with-quantum-computing-resistant-keys/)

>
>
> OpenSSH 7.9 came out with a host of bug fixes last year with few new features, as is to be expected in minor releases. However, recently, Damien Miller has announced that OpenSSH 8.0 is nearly ready to be released. Currently, it’s undergoing testing to ensure compatibility across supported systems.
>
>

* [https://twitter.com/damienmiller/status/1111416334737244160](https://twitter.com/damienmiller/status/1111416334737244160)

>
>
> Better Security  
>  Copying filenames with scp will be more secure in OpenSSH 8.0 due to the fact that copying filenames from a remote to local directory will prompt scp to check if the files sent from the server match your request. Otherwise, an attack server would theoretically be able to intercept the request by serving malicious files in place of the ones originally requested. Knowing this, you’re probably better off never using scp anyway. OpenSSH advises against it:  
>  “The scp protocol is outdated, inflexible and not readily fixed. We recommend the use of more modern protocols like sftp and rsync for file transfer instead.”
>
>

* Interesting new features

>
>
> ssh(1): When prompting whether to record a new host key, accept the key fingerprint as a synonym for “yes”. This allows the user to paste a fingerprint obtained out of band at the prompt and have the client do the comparison for you.
>
>

---

\###[Project Trident : 18.12-U8 Available](https://project-trident.org/post/2019-03-29_18.12-u8_available/)

>
>
> Thank you all for your patience! Project Trident has finally finished some significant infrastructure updates over the last 2 weeks, and we are pleased to announce that package update 8 for 18.12-RELEASE is now available.  
>  To switch to the new update, you will need to open the “Configuration” tab in the update manager and switch to the new “Trident-release” package repository. You can also perform this transition via the command line by running: sudo sysup --change-train Trident-release
>
>

---

\##Beastie Bits

* [BSD Router Project - Release 1.92](https://sourceforge.net/projects/bsdrp/files/BSD_Router_Project/1.92/)
* [EuroBSDcon - New Proposals](https://registration.eurobsdcon.org/conferences/2019/program/proposals/new)
* [Funny UNIX shirt (René Magritte art parody)](https://www.reddit.com/r/unix/comments/b1wyde/funny_unix_shirt_rené_magritte_art_parody/)
* [51NB’s Thinkpad X210](https://geoff.greer.fm/2019/03/04/thinkpad-x210/)
* [DragonFly: No more gcc50](https://www.dragonflydigest.com/2019/03/26/22703.html)
* [“FreeBSD Mastery: Jails” ebook escaping!](https://mwl.io/archives/4139)
* [FreeBSD talk at the Augsburger Linux Info Days (german)](https://frab.luga.de/en/LIT2019/public/events/68)

---

\##Feedback/Questions

* DJ - [FuguIta Feedback](http://dpaste.com/3ZRJ5DA#wrap)
* Mike - [Another Good Show](http://dpaste.com/32TSCH4#wrap)
* Alex - [GhostBSD and wifi](http://dpaste.com/34ND6BC#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

 Your browser does not support the HTML5 video tag.