+++
title = "221: BSD in Taiwan"
description = "Allan reports on his trip to BSD Taiwan, new versions of Lumina and GhostBSD are here, a bunch of OpenBSD p2k17 hackathon reports.This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems.com/bs"
date = "2017-11-22T13:00:00Z"
url = "https://www.bsdnow.tv/221"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.824821564Z"
seen = false
+++

Allan reports on his trip to BSD Taiwan, new versions of Lumina and GhostBSD are here, a bunch of OpenBSD p2k17 hackathon reports.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Allans Trip Report from BSD Taiwan](https://bsdtw.org/) ###

* BSD TW and Taiwan in general was a fun and interesting experience
* I arrived Thursday night and took the high speed train to Taipei main station, and then got on the Red line subway to the venue. The dorm rooms were on par with BSDCan, except the mattress was better.
* I spent Friday with a number of other FreeBSD developers doing touristy things. We went to Taipei 101, the worlds tallest building from 2004 - 2010. It also features the worlds fastest elevator (2004 - 2016), traveling at 60.6 km/h and transporting passengers from the 5th to 89th floor in 37 seconds.
* We also got to see the tuned mass damper, a 660 tonne steel pendulum suspended between the 92nd and 87th floors. This device resists the swaying of the building caused by high winds. There are interesting videos on display beside the damper, of its reaction during recent typhoons and earthquakes. The Taipei 101 building sits just 200 meters from a major fault line.
* Then we had excellent dumplings for lunch
* After walking around the city for a few more hours, we retired to a pub to escape the heat of the sunny Friday afternoon.
* Then came the best part of each day in Taipei, dinner!
* We continued our efforts to cause a nation wide shortage of dumplings
* Special thanks to [Scott Tsai](https://twitter.com/scottttw) who took detailed notes for each of the presentations
* Saturday marked the start of the conference:
  * Arun Thomas provided background and then a rundown of what is happening with the RISC-V architecture. [Notes](https://docs.google.com/document/d/1yrnhNTHaMDr4DG-iviXN0O9NES9Lmlc7sWVQhnios6g/edit#heading=h.kcm1n3yzl35q)
  * George Neville-Neil talked about using DTrace in distributed systems as an in-depth auditing system (who did what to whom and when). [Notes](https://docs.google.com/document/d/1qut6tMVF8NesrGHd6bydLDN-aKBdXMgHx8Vp3_iGKjQ/edit#heading=h.qdghsgk1bgtl)
  * Baptiste Daroussin presented Poudrière image, an extension of everyones favourite package building system, to build custom images of FreeBSD. There was discussion of making this generate ZFS based images as well, making it mesh very well with my talk the next day. [Notes](https://docs.google.com/document/d/1LceXj8IWJeTRHp9KzOYy8tpM00Fzt7fSN0Gw83B9COE/edit#heading=h.incfzi6bnzxr)
  * Brooks Davis presented his work on an API design for a replacement for mmap. It started with a history of address space management in the BSD family of operating systems going all the way back to the beginning. This overview of the feature and how it evolved filled in many gaps for me, and showed why the newer work would be beneficial. The motivation for the work includes further extensions to support the CHERI hardware platform. [Notes](https://docs.google.com/document/d/1LceXj8IWJeTRHp9KzOYy8tpM00Fzt7fSN0Gw83B9COE/edit#heading=h.incfzi6bnzxr)
  * Johannes M Dieterich gave an interesting presentation about using FreeBSD and GPU acceleration for high performance computing. One of the slides showed that amd64 has taken almost the entire market for the top 500 super computers, and that linux dominates the list, with only a few remaining non-linux systems. Sadly, at the supercomputing conference the next week, it was announced that linux has achieved 100% saturation of the top 500 super computers list. Johannes detailed the available tools, what ports are missing, what changes should be made to the base system (mostly OpenMP), and generally what FreeBSD needs to do to become a player in the supercomputer OS market. Johannes perspective is interesting, as he is a computational chemist, not a computer scientist. Those interested in improving the numerical libraries and GPU acceleration frameworks on FreeBSD should join the ports team. [Notes](https://docs.google.com/document/d/1uaJiqtPk8WetST6_GnQwIV49bj790qx7ToY2BHC9zO4/edit#heading=h.nvsz1n6w3gyq)
  * The final talk of the day was Peter Grehan, who spoke about how graphics support in bhyve came to be. He provided a history of how the feature evolved, and where it stands today. [Notes](https://docs.google.com/document/d/1LqJQJUwdUwWZ0n5KwCH1vNI8jiWGJlI1j0It3mERN80/edit#heading=h.sgeixwgz7bjs)

* Afterwards, we traveled as a group to a large restaurant for dinner. There was even Mongolian Vodka, provided by Ganbold Tsagaankhuu of the FreeBSD project.
* Sunday:
  * The first talk of the day Sunday was mine. I presented ZFS: Advanced Integration, mostly talking about how boot environments work, and the new libbe and be(1) tools that my GSoC student Kyle Kneitinger created to manage them. I talked about how they can be used for laptop and developer systems, but also how boot environments can be used to replace nanobsd for appliances (as already done in FreeNAS and pfSense). I also presented about zfsbootcfg (zfs nextboot), and some future extensions to it to make it even more useful in appliance type workloads. I also provided a rundown of new developments out of the ZFS developer summit, two weeks previous. [Notes](https://docs.google.com/document/d/1Blh3Dulf0O91A0mwv34UnIgxRZaS_0FU2lZ41KRQoOU/edit#heading=h.gypim387e8hy)
  * Theo de Raadt presented Mitigations and other real Security Features, and made his case for changing to a fail closed mode of interoperability. Computers cannot actually self heal, so lets stop pretending that they can. [Notes](https://docs.google.com/document/d/1fFHzlxJjbHPsV9t_Uh3PXZnXmkapAK5RkJsfaHki7kc/edit#heading=h.192e4lmbl70c)
  * Ruslan Bukin talked about doing the port of FreeBSD for RISC-V and writing the Device Drivers. Ruslan walked through the process step by step, leading members of the audience to suggest he turn it into a developers handbook article, explaining how to do the initial bringup on new hardware. Ruslan also showed off a FreeBSD/MIPS board he designed himself and had manufactured in China. [Notes](https://docs.google.com/document/d/1kRhRr3O3lQ-0dS0kYF0oh_S0_zFufEwrdFjG1QLyk8Y/edit#heading=h.293mameym7w1)
  * Mariusz Zaborski presented Case studies on sandboxing the base system with Capsicum. He discussed the challenges encountered as existing programs are modified to sandbox them, and recent advancements in the debugging tools available during that process. Mariusz also discussed the Casper service at length, including the features that are planned for 2018 and onwards. [Notes](https://docs.google.com/document/d/1_0BpAE1jGr94taUlgLfSWlJOYU5II9o7Y3ol0ym1eZQ/edit#heading=h.xm9mh7dh6bay)
  * The final presentation of the day was Mark Johnston on Memory Management Improvements in FreeBSD 12.0. This talk provided a very nice overview of the memory management system in FreeBSD, and then detailed some of the recent improvements. [Notes](https://docs.google.com/document/d/1gFQXxsHM66GQGMO4-yoeFRTcmOP4NK_ujVFHIQJi82U/edit#heading=h.uirc9jyyti7w)
  * The conference wrapped up with the Work-in-Progress session, including updates on: multi-device-at-once GELI attach, MP-safe networking on NetBSD, pkgsrc, NetBSD in general, BSD on Microsoft Azure, Mothra (send-pr for bugzilla), BSDMizer a machine learning compiler optimizer, Hyperledger Sawtooth (blockchain), and finally VIMAGE and pf testing on FreeBSD. [Notes](https://docs.google.com/document/d/1miHZEPrqrpCTh8JONmUKWDPYUmTuG2lbsVrWDtekvLc/edit#heading=h.orhedpjis5po)

* [Group Photo](https://pbs.twimg.com/media/DOh1txnVoAAFKAa.jpg:large)
* BSDTW was a great conference. They are still considering if it should be an annual thing, trade off every 2nd year with AsiaBSDCon, or something else. In order to continue, BSD Taiwan requires more organizers and volunteers. They have regular meetups in Taipei if you are interested in getting involved. \*\*\*

### [Lumina 1.4.0 released](https://lumina-desktop.org/version-1-4-0-released/) ###

* The Lumina Theme Engine (and associated configuration utility)
* The Lumina theme engine is a new component of the core desktop, and provides enhanced theming capabilities for the desktop as well as all Qt5 applications. While it started out life as a fork of the qt5ct utility, it quickly grew all sorts of new features and functionality such as system-defined color profiles, modular theme components, and built-in editors/creators for all components. The backend of this engine is a standardized theme plugin for the Qt5 toolkit, so that all Qt5 applications will now present a unified appearance (if the application does not enforce a specific appearance/theme of its own). Users of the Lumina desktop will automatically have this plugin enabled: no special action is required.
  * Please note that the older desktop theme system for Lumina has been rendered obsolete by the new engine, but a settings-conversion path has already been implemented which should transition your current settings to the new engine the first time you login to Lumina 1.4.0. Custom themes for the older system may not be converted though, but it is trivial to copy/paste any custom stylesheets from the old system into the editor for the new theme engine to register/re-apply them as desired.

* Lumina-Themes Repository

>
>
> I also want to give a shout-out to the trueos/lumina-themes github repository contributors. All of the wallpapers in the 1.4.0 screenshots I posted come from that package, and they are working on making more wallpapers, color palettes, and desktop styles for use with the Lumina Theme Engine. If your operating system does not currently provide a package for lumina-themes, I highly recommend that you make one as soon as possible!
>
>

* The Lumina PDF Viewer (lumina-pdf)

  * This is a new, stand-alone desktop utility for viewing/printing/presenting PDF documents. It uses the poppler-qt5 library in the backend for rendering the document, but uses multi-threading in many ways (such as to speed up the loading of pages) to give the user a nice, streamlined utility for viewing PDF documents. There is also built-in presentation functionality which allows users to easily cast the document to a separate screen without mucking about in system menus or configuration utilities.

* Lumina PDF Viewer (1.4.0)

  * Important Packaging Changes

>
>
> One significant change of note for people who are packaging Lumina for their particular operating system is that the minimum supported versions of Qt for Lumina have been changed with this release:
>
>
>
> ```
> lumina-core: Qt 5.4+
> lumina-mediaplayer: Qt 5.7+
> Everything else: Qt 5.2+
>
> ```
>
>
>
> Of course, using the latest version of the Qt5 libraries is always recommended.  
>  When packaging for Linux distributions, the theme engine also requires the availability of some of the -dev packages for Qt itself when compiling the theme plugin. For additional information (specifically regarding Ubuntu builds), please take a look at a recent ticket on the Lumina repository.
>
>
>
> * The new lumina-pdf utility requires the availability of the poppler-qt5 library. The includes for this library on Ubuntu 17.10 were found to be installed outside of the normal include directories, so a special rule for it was added to our OS-Detect file in the Lumina source tree. If your particular operating system also places the the poppler include files in a non-standard place, please patch that file or send us the information and we can add more special rules for your particular OS.
>
>

* Other Changes of Note (in no particular order)
  * lumina-config:
  * Add a new page for changing audio theme (login, logout, low battery)
  * Add option to replace fluxbox with some other WM (with appropriate warnings)
  * Have the themes page redirect to launching the Lumina theme engine configuration utility.
  * start-lumina-desktop:
  * Auto-detect the active X11 displays and create a new display for the Lumina session (prevent conflict with prior graphical sessions).
  * Add a process-failure counter & restart mechanism. This is particularly useful for restarting Fluxbox from time to time (such as after any monitor addition/removal)
  * lumina-xconfig:
  * Restart fluxbox after making any monitor changes with xrandr. This ensures a more reliable session.
  * Implement a new 2D monitor layout mechanism. This allows for the placement of monitors anywhere in the X/Y plane, with simplification buttons for auto-tiling the monitors in each dimension based on their current location.
  * Add the ability to save/load monitor profiles.
  * Distinguish between the default monitor arrangement and the current monitor arrangement. Allow the user to set the current arrangement as the new default.
  * lumina-desktop:
  * Completely revamp the icon loading mechanisms so it should auto-update when the theme changes.
  * Speed up the initialization of the desktop quite a bit.
  * Prevent loading/probing files in the /net/ path for existence (assume they exist in the interest of providing shortcuts). On FreeBSD, these are special paths that actually pause the calling process in order to mount/load a network share before resuming the process, and can cause significant hangs in the desktop process.
  * Add the ability to take a directory as a target for the wallpaper. This will open/probe the directory for any existing image files that it can use as a wallpaper and randomly select one.
  * Remove the popup dialog prompting about system updates, and replace it with new Restart (with updates) buttons on the appropriate menus/windows instead.
  * If no wallpapers selection is provided, try to use the lumina-nature wallpaper directory as the default, otherwise fall back on the original default wallpaper if the lumina-themes package is not installed.
  * lumina-open:
  * Make the \*.desktop parsing a bit more flexible regarding quoted strings where there should not be any.
  * If selecting which application to use, only overwrite the user-default app if the option is explicitly selected.
  * lumina-fileinfo:
  * Significant cleanup of this utility. Now it can be reliably used for creating/registering XDG application shortcuts.
  * Add a whole host of new ZFS integrations:
  * If a ZFS dataset is being examined, show all the ZFS properties for that dataset.
  * If the file being examined exists within ZFS snapshots, show all the snapshots of the file

* lumina-fm:
  * Significant use of additional multi-threading. Makes the loading of directories much faster (particularly ones with image files which need thumbnails)
  * Add detection/warning when running as root user. Also add an option to launch a new instance of lumina-fm as the root user.
  * [FreeBSD/TrueOS] Fix up the detection of the External Devices list to also list available devices for the autofs system.
  * Fix up some drag and drop functionality.
  * Expose the creation, extraction, and insertion of files into archives (requires lumina-archiver at runtime)
  * Expand the Open With option into a menu of application suggestions in addition to the Other option which runs lumina-open to find an application.
  * Provide an option to set the desktop wallpaper to the selected image file(s). (If the running desktop session is Lumina).

* lumina-mediaplayer:
  * Enable the ability to playback local video files. (NOTE: If Qt5 is set to use the gstreamer multimedia backend, make sure you have the GL plugin installed for smooth video playback).

* lumina-archiver:
  * Add CLI flags for auto-archive and auto-extract. This allows for programmatic/scriptable interactions with archives.
  * That is not mentioning all of the little bugfixes, performance tweaks, and more that are also included in this release. \*\*\*

### [The strongest KASLR, ever?](https://blog.netbsd.org/tnf/entry/the_strongest_kaslr_ever) ###

* [Re: amd64: kernel aslr support](https://mail-index.netbsd.org/tech-kern/2017/11/14/msg022594.html)

>
>
> So, I did it. Now the kernel sections are split in sub-blocks, and are all randomized independently. See my drawing [1]. What it means in practice, is that Kernel ASLR is much more difficult to defeat: a cache attack will at most allow you to know that a given range is mapped as executable for example, but you don't know which sub-block of .text it is; a kernel pointer leak will at most allow you to reconstruct the layout of one sub-block, but you don't know the layout and address of the remaining blocks, and there can be many.  
>  The size and number of these blocks is controlled by the split-by-file parameter in Makefile.amd64. Right now it is set to 2MB, which produces a kernel with \~23 allocatable (ie useful at runtime) sections, which is a third of the total number supported (BTSPACE\_NSEGS = 64). I will probably reduce this parameter a bit in the future, to 1.5MB, or even 1MB.  
>  All of that leaves us with about the most advanced KASLR implementation available out there. There are ways to improve it even more, but you'll have to wait a few weeks for that.  
>  If you want to try it out you need to make sure you have the latest versions of GENERIC\_KASLR / prekern / bootloader. The instructions are still here, and haven't changed.
>
>

* Initial design

>
>
> As I said in the previous episode, I added in October a Kernel ASLR implementation in NetBSD for 64bit x86 CPUs. This implementation would randomize the location of the kernel in virtual memory as one block: a random VA would be chosen, and the kernel ELF sections would be mapped contiguously starting from there.  
>  This design had several drawbacks: one leak, or one successful cache attack, could be enough to reconstruct the layout of the entire kernel and defeat KASLR.  
>  NetBSDs new KASLR design significantly improves this situation.
>
>

* New design

>
>
> In the new design, each kernel ELF section is randomized independently. That is to say, the base addresses of .text, .rodata, .data and .bss are not correlated. KASLR is already at this stage more difficult to defeat, since you would need a leak or cache attack on each of the kernel sections in order to reconstruct the in-memory kernel layout.  
>  Then, starting from there, several techniques are used to strengthen the implementation even more.
>
>

* Sub-blocks

>
>
> The kernel ELF sections are themselves split in sub-blocks of approximately 1MB. The kernel therefore goes from having:
>
>
>
> ```
>     { .text .rodata .data .bss }
>
> ```
>
>
>
> to having
>
>
>
> ```
>     { .text .text.0 .text.1 ... .text.i .rodata .rodata.0 ... .rodata.j ... .data ...etc }
>
> ```
>
>
>
> As of today, this produces a kernel with \~33 sections, each of which is mapped at a random address and in a random order.  
>  This implies that there can be dozens of .text segments. Therefore, even if you are able to conduct a cache attack and determine that a given range of memory is mapped as executable, you dont know which sub-block of .text it is. If you manage to obtain a kernel pointer via a leak, you can at most guess the address of the section it finds itself in, but you dont know the layout of the remaining 32 sections. In other words, defeating this KASLR implementation is much more complicated than in the initial design.
>
>

* Higher entropy

>
>
> Each section is put in a 2MB-sized physical memory chunk. Given that the sections are 1MB in size, this leaves half of the 2MB chunk unused. Once in control, the prekern shifts the section within the chunk using a random offset, aligned to the ELF alignment constraint. This offset has a maximum value of 1MB, so that once shifted the section still resides in its initial 2MB chunk:  
>  The prekern then maps these 2MB physical chunks at random virtual addresses; but addresses aligned to 2MB. For example, the two sections in Fig. A will be mapped at two distinct VAs:  
>  There is a reason the sections are shifted in memory: it offers higher entropy. If we consider a .text.i section with a 64byte ELF alignment constraint, and give a look at the number of possibilities for the location of the section in memory:  
>  The prekern shifts the 1MB section in its 2MB chunk, with an offset aligned to 64 bytes. So there are (2MB-1MB)/(64B)=214 possibilities for the offset.  
>  Then, the prekern uses a 2MB-sized 2MB-aligned range of VA, chosen in a 2GB window. So there are (2GB-2MB)/(2MB)=210-1 possibilities for the VA.  
>  Therefore, there are 214x(210-1)224 possible locations for the section. As a comparison with other systems:
>
>
>
> ```
> OS  # of possibilities
> Linux   2^6
> MacOS   2^8
> Windows 2^13
> NetBSD  2^24
>
> ```
>
>
>
> Of course, we are talking about one .text.i section here; the sections that will be mapped afterwards will have fewer location possibilities because some slots will be already occupied. However, this does not alter the fact that the resulting entropy is still higher than that of the other implementations. Note also that several sections have an alignment constraint smaller than 64 bytes, and that in such cases the entropy is even higher.
>
>

* Large pages

>
>
> There is also a reason we chose to use 2MB-aligned 2MB-sized ranges of VAs: when the kernel is in control and initializes itself, it can now use large pages to map the physical 2MB chunks. This greatly improves memory access performance at the CPU level.
>
>

* Countermeasures against TLB cache attacks

>
>
> With the memory shift explained above, randomness is therefore enforced at both the physical and virtual levels: the address of the first page of a section does not equal the address of the section itself anymore.  
>  It has, as a side effect, an interesting property: it can mostly mitigate TLB cache attacks. Such attacks operate at the virtual-page level; they will allow you to know that a given large page is mapped as executable, but you dont know where exactly within that page the section actually begins.
>
>

* Strong?

>
>
> This KASLR implementation, which splits the kernel in dozens of sub-blocks, randomizes them independently, while at the same time allowing for higher entropy in a way that offers large page support and some countermeasures against TLB cache attacks, appears to be the most advanced KASLR implementation available publicly as of today.   
>  Feel free to prove me wrong, I would be happy to know!
>
>

* WIP

>
>
> Even if it is in a functional state, this implementation is still a work in progress, and some of the issues mentioned in the previous blog post haven't been addressed yet. But feel free to test it and report any issue you encounter. Instructions on how to use this implementation can still be found in the previous blog post, and havent changed since.  
>  See you in the next episode!
>
>
> ---
>

News Roundup
----------

### [GhostBSD 11.1 Finally Ready and Available!](http://www.ghostbsd.org/11.1_release_announcement) ###

* [Screenshots](https://imgur.com/a/Mu8xk)

>
>
> After a year of development, testing, debugging and working on our software package repository, we are pleased to announce the release of GhostBSD 11.1 is now available on 64-bit(amd64) architecture with MATE and XFCE Desktop on direct and torrent download. With 11.1 we drop 32-bit i386 supports, and we currently maintain our software packages repository for more stability.
>
>

* What's new on GhostBSD 11.1
  * GhostBSD software repository
  * Support VMware Workstation Guest Features
  * New UFS full disk mirroring option on the installer
  * New UFS full disk MBR and GPT option on the installer
  * New UFS full disk swap size option on the installer
  * Whisker Menu as default Application menu on XFCE
  * All software developed by GhostBSD is now getting updated
  * ZFS configuration for disk

* What has been fixed on 11.1?
  * Fix XFCE sound plugin
  * Installer ZFS configuration file setting
  * Installer ZFS setup appears to be incomplete
  * The installer was not listing ZFS disk correctly.
  * The installer The partition list was not deleted when pressing back
  * XFCE and MATE shutdown/suspend/hibernate randomly missing
  * Clicking 'GhostBSD Bugs' item in the Main menu -\> 'System Tools' brings up 'Server not found' page
  * XFCE installation - incorrect keyboard layout
  * Locale setting not filling correctly
  * Update Station tray icon

* The image checksum's, hybrid ISO(DVD, USB) images are available at [GhostBSD](http://www.ghostbsd.org/download). \*\*\*

### p2k17 Hackathon Reports ###

* [p2k17 Hackathon Report: Matthias Kilian on xpdf, haskell, and more](https://undeadly.org/cgi?action=article;sid=20171107034258)
* [p2k17 Hackathon Report: Herzliche grusse vom Berlin (espie@ on mandoc, misc packages progress)](https://undeadly.org/cgi?action=article;sid=20171107185122)
* [p2k17 Hackathon Report: Paul Irofti (pirofti@) on hotplugd(8), math ports, xhci(4) and other kernel advancements](https://undeadly.org/cgi?action=article;sid=20171107225258)
* [p2k17 Hackathon report: Jeremy Evans on ruby progress, postgresql and webdriver work](https://undeadly.org/cgi?action=article;sid=20171108072117)
* [p2k17 Hackathon report: Christian Weisgerber on random devices, build failures and gettext](https://undeadly.org/cgi?action=article;sid=20171109171447)
* [p2k17 Hackathon report: Sebastian Reitenbach on Puppet progress](https://undeadly.org/cgi?action=article;sid=20171110124645)
* [p2k17 Hackathon Report: Anthony J. Bentley on firmware, games and securing pkg\_add runs](https://undeadly.org/cgi?action=article;sid=20171110124656)
* [p2k17 Hackathon Report: Landry Breuil on Mozilla things and much more](https://undeadly.org/cgi?action=article;sid=20171113091807)
* [p2k17 Hackathon report: Florian Obser on network stack progress, kernel relinking and more](https://undeadly.org/cgi?action=article;sid=20171113235334)
* [p2k17 Hackathon report: Antoine Jacoutot on ports+packages progress](https://undeadly.org/cgi?action=article;sid=20171120075903) \*\*\*

### TrueOS Talks ###

* [Tech and Open Source at Pellissippi State](https://www.trueos.org/blog/trueos-talks-tech-open-source-pellissippi-state/)

>
>
> Ken Moore of the TrueOS project presented a talk to the AITP group at Pellissippi State today entitled Its A Unix(-like) system? An Introduction to TrueOS and Open source. Joshua Smith of the TrueOS project was also in attendance.   
>  We were happy to see a good attendance of about 40 individuals that came to hear more about TrueOS and how we continue to innovate along with the FreeBSD project. Many good questions were raised about development, snapshots, cryptocurrency, and cyber-security. Weve included a copy of the slides if youd like to have a look at the talk on open source. Wed like to offer a sincere thanks to everyone who attended and offer an extended invitation for you to join us at our KnoxBUG group on October 30th @ the iXsystems offices! We hope to see you soon!
>
>

* [Open Source Talk  Slideshare PDF](https://web.trueos.org/wp-content/uploads/2017/10/Open-Source-Talk.pdf) [KnoxBug - Lumina Rising : Challenging Desktop Orthodoxy](http://knoxbug.org/content/octobers-talk-available-youtube)
* Ken gave his talk about the new Lumina 2.0 Window Manager that he gave at Ohio LinuxFest 2017
* [KnoxBUG October 2017](https://youtu.be/w3ZrqxLTnIU)
* [(OLF 2017) Lumina Rising: Challenging Desktop Orthodoxy](https://www.slideshare.net/beanpole135/olf-2017-lumina-rising-challenging-desktop-orthodoxy) \*\*\*

### [Official OpenBSD 6.2 CD set - the only one to be made!](https://undeadly.org/cgi?action=article;sid=20171118190325) ###

* Our dear friend Bob Beck (beck@) writes:

>
>
> So, again this release the tradition of making Theo do art has continued!  
>  Up for sale by auction to the highest bidder on Ebay is the only OpenBSD 6.2 CD set to be produced.  
>  The case and CD's feature the 6.2 artwork, custom drawn and signed by Theo.  
>  All proceeds to support OpenBSD  
>  Go have a look at the auction
>
>

* As with previous OpenBSD auctions, if you are not the successful bidder, we would like to encourage you to donate the equivalent of you highest bid to the project.
* [The Auction](https://www.ebay.ca/itm/Official-OpenBSD-6-2-CD-Set/253265944606) \*\*\*

Beastie Bits
----------

* [HAMMER2 userspace on Linux](http://lists.dragonflybsd.org/pipermail/users/2017-October/313646.html)
* [OpenBSD Porting Workshop (now changed to January 3, 2018)](http://www.nycbug.org/index.cgi?action=view&id=10655)
* [Matt Ahrens on when Native Encryption for ZFS will land](https://twitter.com/mahrens1/status/921204908094775296)
* [The first successful build of OpenBSD base system](http://nanxiao.me/en/the-first-successful-build-of-openbsd-base-system/)
* [KnoxBug November Meeting](https://www.meetup.com/KnoxBUG-BSD-Linux-and-FOSS-Users-Unite/events/245291204/)
* [Absolute FreeBSD, 3rd Edition, pre-orders available](https://www.michaelwlucas.com/os/af3e)

Feedback/Questions
----------

* Jon - [Jails and Networking](http://dpaste.com/2BEW0HB#wrap)
* Nathan - [bhyve Provisioning](http://dpaste.com/1GHSYJS#wrap)
* Lian - [OpenSSL jumping the Shark](http://dpaste.com/18P8D8C#wrap)
* Kim - [Suggestions](http://dpaste.com/1VE0K9E#wrap) \*\*\*