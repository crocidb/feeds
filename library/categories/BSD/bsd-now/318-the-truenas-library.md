+++
title = "318: The TrueNAS Library"
description = "DragonFlyBSD vs. FreeBSD vs. Linux benchmark on Ryzen 7, JFK Presidential Library chooses TrueNAS for digital archives, FreeBSD 12.1-beta is available, cool but obscure X11 tools, vBSDcon trip report, Project Trident 12-U7 is available, a couple new Unix artifacts, and more.Headl"
date = "2019-10-03T03:00:00Z"
url = "https://www.bsdnow.tv/318"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.599377757Z"
seen = true
+++

DragonFlyBSD vs. FreeBSD vs. Linux benchmark on Ryzen 7, JFK Presidential Library chooses TrueNAS for digital archives, FreeBSD 12.1-beta is available, cool but obscure X11 tools, vBSDcon trip report, Project Trident 12-U7 is available, a couple new Unix artifacts, and more.

Headlines
----------

### [DragonFlyBSD 5.6 vs. FreeBSD 12 vs. Linux - Ryzen 7 3700X](https://www.phoronix.com/scan.php?page=article&item=bsd-linux-3700x) ###

>
>
> For those wondering how well FreeBSD and DragonFlyBSD are handling AMD's new Ryzen 3000 series desktop processors, here are some benchmarks on a Ryzen 7 3700X with MSI MEG X570 GODLIKE where both of these popular BSD operating systems were working out-of-the-box. For some fun mid-week benchmarking, here are those results of FreeBSD 12.0 and DragonFlyBSD 5.6.2 up against openSUSE Tumbleweed and Ubuntu 19.04.
>
>
>
> Back in July I looked at FreeBSD 12 on the Ryzen 9 3900X but at that time at least DragonFlyBSD had troubles booting on that system. When trying out the Ryzen 7 3700X + MSI GODLIKE X570 motherboard on the latest BIOS, everything "just worked" without any compatibility issues for either of these BSDs.
>
>
>
> We've been eager to see how well DragonFlyBSD is performing on these new AMD Zen 2 CPUs with DragonFlyBSD lead developer Matthew Dillon having publicly expressed being impressed by the new AMD Ryzen 3000 series CPUs.
>
>
>
> For comparison to those BSDs, Ubuntu 19.04 and openSUSE Tumbleweed were tested on the same hardware in their out-of-the-box configurations. While Clear Linux is normally the fastest, on this system Clear's power management defaults had caused issues in being unable to detect the Samsung 970 EVO Plus NVMe SSD used for testing and so we left it out this round.
>
>
>
> All of the hardware was the same throughout testing as were the BIOS settings and running the Ryzen 7 3700X at stock speeds. (Any differences in the reported hardware for the system table just come down to differences in what is exposed by each OS for reporting.) All of the BSD/Linux benchmarks on this eight core / sixteen thread processor were run via the Phoronix Test Suite. In the case of FreeBSD 12.0, we benchmarked both with its default LLVM Clang 6.0 compiler as well as with GCC 9.1 so that it would match the GCC compiler being the default on the other operating systems under test.
>
>

---

### [JFK Presidential Library Chooses iXsystems TrueNAS to Preserve Precious Digital Archives](https://www.ixsystems.com/blog/jfk-presidential-library-pr/) ###

>
>
> iXsystems is honored to have the TrueNAS® M-Series unified storage selected to store, serve, and protect the entire digital archive for the John F. Kennedy Library Foundation. This is in support of the collection at the John F. Kennedy Presidential Library and Museum (JFK Library). Over the next several years, the Foundation hopes to grow the digital collection from hundreds of terabytes today to cover much more of the Archives at the Kennedy Library. Overall there is a total of 25 million documents, audio recordings, photos, and videos once the project is complete.
>
>
>
> Having first deployed the TrueNAS M50-HA earlier in 2019, the JFK Library has now completed the migration of its existing digital collection and is now in the process of digitizing much of the rest of its vast collection.
>
>
>
> Not only is the catalog of material vast, it is also diverse, with files being copied to the storage system from a variety of sources in numerous file types. To achieve this ambitious goal, the library required a high-end NAS system capable of sharing with a variety of systems throughout the digitization process. The digital archive will be served from the TrueNAS M50 and made available to both in-person and online visitors.
>
>
>
> With precious material and information comes robust demands. The highly-available TrueNAS M-Series has multiple layers of protection to help keep data safe, including data scrubs, checksums, unlimited snapshots, replication, and more. TrueNAS is also inherently scalable with data shares only limited by the number of drives connected to the pool. Perfect for archival storage, the deployed TrueNAS M50 will grow with the library’s content, easily expanding its storage capacity over time as needed. Supporting a variety of protocols, multi-petabyte scalability in a single share, and anytime, uninterrupted capacity expansion, the TrueNAS M-Series ticked all the right boxes.
>
>

* [Youtube Video](https://www.youtube.com/watch?v=8rFjH5-0Fiw)

---

News Roundup
----------

### [FreeBSD 12.1-beta available](https://www.phoronix.com/scan.php?page=news_item&px=FreeBSD-12.1-Beta-Released) ###

>
>
> FreeBSD 12.0 is already approaching one year old while FreeBSD 12.1 is now on the way as the next installment with various bug/security fixes and other alterations to this BSD operating system.
>
>
>
> FreeBSD 12.1 has many security/bug fixes throughout, no longer enables "-Werror" by default as a compiler flag (Update: This change is just for the GCC 4.2 compiler), has imported BearSSL into the FreeBSD base system as a lightweight TLS/SSL implementation, bzip2recover has been added, and a variety of mostly lower-level changes. More details can be found via the in-progress release notes.
>
>
>
> For those with time to test this weekend, FreeBSD 12.1 Beta 1 is available for all prominent architectures.
>
>
>
> The FreeBSD release team is planning for at least another beta or two and around three release candidates. If all goes well, FreeBSD 12.1 will be out in early November.
>
>

* [Announcement Link](https://lists.freebsd.org/pipermail/freebsd-stable/2019-September/091533.html)

---

### [Cool, but obscure X11 tools. More suggestions in the source link](https://cyber.dabamos.de/unix/x11/) ###

* ASClock
* Free42
* FSV2
* GLXGears
* GMixer
* GVIM
* Micropolis
* Sunclock
* Ted
* TiEmu
* X026
* X48
* XAbacus
* XAntfarm
* XArchiver
* XASCII
* XBiff
* XBill
* XBoard
* XCalc
* XCalendar
* XCHM
* XChomp
* XClipboard
* XClock
* XClock/Cat Clock
* XColorSel
* XConsole
* XDiary
* XEarth
* XEdit
* Xev
* XEyes
* XFontSel
* XGalaga
* XInvaders 3D
* XKill
* XLennart
* XLoad
* XLock
* XLogo
* XMahjongg
* XMan
* XMessage
* XmGrace
* XMixer
* XmMix
* XMore
* XMosaic
* XMOTD
* XMountains
* XNeko
* XOdometer
* XOSView
* Xplore
* XPostIt
* XRoach
* XScreenSaver
* XSnow
* XSpread
* XTerm
* XTide
* Xv
* Xvkbd
* XWPE
* XZoom

---

### [vBSDCon 2019 trip report from iXSystems](https://www.ixsystems.com/blog/vbsdcon-2019/) ###

>
>
> The fourth biennial vBSDCon was held in Reston, VA on September 5th through 7th and attracted attendees and presenters from not only the Washington, DC area, but also Canada, Germany, Kenya, and beyond. While MeetBSD caters to Silicon Valley BSD enthusiasts on even years, vBSDcon caters to East Coast and DC area enthusiasts on odd years. Verisign was again the key sponsor of vBSDcon 2019 but this year made a conscious effort to entrust the organization of the event to a team of community members led by Dan Langille, who you probably know as the lead BSDCan organizer. The result of this shift was a low key but professional event that fostered great conversation and brainstorming at every turn.
>
>

---

### [Project Trident 12-U7 now available](https://project-trident.org/post/2019-09-21_stable12-u7_available/) ###

* Package Summary
  * New Packages: 130
  * Deleted Packages: 72
  * Updated Packages: 865

* Stable ISO - [https://pkg.project-trident.org/iso/stable/Trident-x64-TOS-12-U7-20190920.iso](https://pkg.project-trident.org/iso/stable/Trident-x64-TOS-12-U7-20190920.iso)

---

### [A Couple new Unix Artifacts](https://minnie.tuhs.org//pipermail/tuhs/2019-September/018685.html) ###

>
>
> I fear we're drifting a bit here and the S/N ratio is dropping a bit w.r.t the actual history of Unix. Please no more on the relative merits of version control systems or alternative text processing systems.
>
>
>
> So I'll try to distract you by saying this. I'm sitting on two artifacts that have recently been given to me:
>
>

* by two large organisations
* of great significance to Unix history
* who want me to keep "mum" about them
* as they are going to make announcements about them soon\*

>
>
> and I am going slowly crazy as I wait for them to be offically released. Now you have a new topic to talk about :-)
>
>
>
> Cheers, Warren
>
>

\* *for some definition of "soon"*

---

Beastie Bits
----------

* [NetBSD machines at Open Source Conference 2019 Hiroshima](https://mail-index.netbsd.org/netbsd-advocacy/2019/09/16/msg000813.html)
* [Hyperbola a GNU/Linux OS is using OpenBSD's Xenocara](https://www.hyperbola.info/news/end-of-xorg-support/)
* [Talos is looking for a FreeBSD Engineer](https://www.talosintelligence.com/careers/freebsd_engineer)
* [GitHub - dylanaraps/pure-sh-bible: A collection of pure POSIX sh alternatives to external processes.](https://github.com/dylanaraps/pure-sh-bible)
* [dsynth: you’re building it](https://www.dragonflydigest.com/2019/09/23/23523.html)
* [Percy Ludgate, the missing link between Babbage’s machine and everything else](http://lists.sigcis.org/pipermail/members-sigcis.org/2019-September/001606.html)

---

Feedback/Questions
----------

* Bruce - [Down the expect rabbithole](http://dpaste.com/147HGP3#wrap)
* Bruce - [Expect (update)](http://dpaste.com/37MNVSW#wrap)
* David - [Netgraph answer](http://dpaste.com/2SE1YSE)
* Mason - [Beeps?](http://dpaste.com/00KKXJM)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.