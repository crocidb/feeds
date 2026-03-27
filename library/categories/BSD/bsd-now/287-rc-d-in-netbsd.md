+++
title = "287: rc.d in NetBSD"
description = 'Design and Implementation of NetBSD’s rc.d system, first impressions of Project Trident 18.12, PXE booting a FreeBSD disk image, middle mouse button pasting, NetBSD gains hardware accelerated virtualization, and more.\Headlines   \[The Design and Implementation of the NetBSD'
date = "2019-02-28T17:00:00Z"
url = "https://www.bsdnow.tv/287"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.657996992Z"
seen = false
+++

Design and Implementation of NetBSD’s rc.d system, first impressions of Project Trident 18.12, PXE booting a FreeBSD disk image, middle mouse button pasting, NetBSD gains hardware accelerated virtualization, and more.

\##Headlines  
 \###[The Design and Implementation of the NetBSD rc.d system](https://www.usenix.org/legacy/events/usenix01/freenix01/full_papers/mewburn/mewburn_html/index.html)

* Abstract

>
>
> In this paper I cover the design and implementation of the rc.d system start-up mechanism in NetBSD 1.5, which replaced the monolithic /etc/rc start-up file inherited from 4.4BSD. Topics covered include a history of various UNIX start-up mechanisms (including NetBSD prior to 1.5), design considerations that evolved over six years of discussions, implementation details, an examination of the human issues that occurred during the design and implementation, as well as future directions for the system.
>
>

* Introduction

>
>
> NetBSD recently converted from the traditional 4.4BSD monolithic /etc/rc start-up script to an /etc/rc.d mechanism, where there is a separate script to manage each service or daemon, and these scripts are executed in a specific order at system boot.  
>  This paper covers the motivation, design and implementation of the rc.d system; from the history of what NetBSD had before to the system that NetBSD 1.5 shipped with in December 2000, as well as future directions.  
>  The changes were contentious and generated some of the liveliest discussions about any feature change ever made in NetBSD. Parts of those discussions will be covered to provide insight into some of the design and implementation decisions.
>
>

* History

>
>
> There is great diversity in the system start-up mechanisms used by various UNIX variants. A few of the more pertinent schemes are detailed below. As NetBSD is derived from 4.4BSD, it follows that a description of the latter’s method is relevant. Solaris’ start-up method is also detailed, as it is the most common System V UNIX variant.
>
>

---

\###[First impressions of Project Trident 18.12](https://distrowatch.com/weekly.php?issue=20190211#trident)

>
>
> Project Trident (hereafter referred to as Trident) is a desktop operating system based on TrueOS. Trident takes the rolling base platform of TrueOS, which is in turn based on FreeBSD’s development branch, and combines it with the Lumina desktop environment.
>
>

\+Installing

>
>
> The debut release of Trident is available as a 4.1GB download that can be burned to a disc or transferred to a USB thumb drive. Booting from the Trident media brings up a graphical interface and automatically launches the project’s system installer. Down the left side of the display there are buttons we can click to show hardware information and configuration options. These buttons let us know if our wireless card and video card are compatible with Trident and give us a chance to change our preferred language and keyboard layout. At the bottom of the screen we find buttons that will open a terminal or shutdown the computer.
>
>

* Early impressions

>
>
> Trident boots to a graphical login screen where we can sign into the Lumina desktop or a minimal Fluxbox session. Lumina, by default, uses Fluxbox as its window manager. The Lumina desktop places its panel along the bottom of the screen and an application menu sits in the bottom-left corner. On the desktop we find icons for opening the software manager, launching the Falkon web browser, running the VLC media player, opening the Control Panel and adjusting the Lumina theme.  
>  The application menu has an unusual and compact layout. The menu shows just a search box and buttons for browsing applications, opening a file manager, accessing desktop settings and signing out. To see what applications are available we can click the Browse Applications entry, which opens a window in the menu where we can scroll through installed programs. This is a bit awkward since the display window is small and only shows a few items at a time.  
>  Early on I found it is possible to swap out the default “Start menu” with an alternative “Application menu” through the Panels configuration tool. This alternative menu offers a classic tree-style application menu. I found the latter menu easier to navigate as it expands to show all the applications in a selected category.
>
>

* Conclusions

>
>
> I have a lot of mixed feelings and impressions when it comes to Trident. On the one hand, the operating system has some great technology under the hook. It has cutting edge packages from the FreeBSD ecosystem, we have easy access to ZFS, boot environments, and lots of open source packages. Hardware support, at least on my physical workstation, was solid and the Lumina desktop is flexible.
>
>

---

\##News Roundup  
 \###[PXE booting of a FreeBSD disk image](https://blog.cochard.me/2019/02/pxe-booting-of-freebsd-disk-image.html)

>
>
> I had to set up a regression and network performance lab. This lab will be managed by a Jenkins, but the first step is to understand how to boot a FreeBSD disk by PXE. This article explains a simple way of doing it.  
>  For information, all these steps were done using 2 PC Engines APU2 (upgraded with latest BIOS for iPXE support), so it’s a headless (serial port only, this can be IPMI SoL with different hardware) .
>
>

* THE BIG PICTURE

>
>
> Before explaining all steps and command line, here is the [full big picture](https://1.bp.blogspot.com/-SCUJAjowhYw/XG-b-qWGuXI/AAAAAAAAmXw/SVXHDC9hsMwZNB2P5glsZx0iFoCE9SAXQCLcBGAs/s1600/PXE+and+FreeBSD+mfs+image.png) of the final process.
>
>

---

\###[Why I like middle mouse button paste in xterm so much](https://utcc.utoronto.ca/~cks/space/blog/unix/MouseMovementAndPaste)

>
>
> In my entry about how touchpads are not mice, I mused that one of the things I should do on my laptop was insure that I had a keyboard binding for paste, since middle mouse button is one of the harder multi-finger gestures to land on a touchpad. Kurt Mosiejczuk recently left a comment there where they said:  
>  Shift-Insert is a keyboard equivalent for paste that is in default xterm (at least OpenBSD xterm, and putty on Windows too). I use that most of the time now as it seems less… trigger-happy than right click paste.  
>  This sparked some thoughts, because I can’t imagine giving up middle mouse paste if I have a real choice. I had earlier seen shift-insert mentioned in other commentary on my entry and so have tried a bit to use it on my laptop, and it hasn’t really felt great even there; on my desktops, it’s even less appealing (I tried shift-insert out there to confirm that it did work in my set of wacky X resources).  
>  In thinking about why this is, I came to the obvious realization about why all of this is so. I like middle mouse button paste in normal usage because it’s so convenient, because almost all of the time my hand is already on the mouse. And the reason my hand is already on the mouse is because I’ve just used the mouse to shift focus to the window I want to paste into. Even on my laptop, my right hand is usually away from the keyboard as I move the mouse pointer on the touchpad, making shift-Insert at least somewhat awkward.
>
>

---

\###[NetBSD Gains Hardware Accelerated Virtualization](http://m00nbsd.net/4e0798b7f2620c965d0dd9d6a7a2f296.html)

* NetBSD Virtual Machine Monitor

>
>
> NVMM provides hardware-accelerated virtualization support for NetBSD. It is made of an \~MI frontend, to which MD backends can be plugged. A virtualization API is shipped via libnvmm, that allows to easily create and manage virtual machines via NVMM. Two additional components are shipped as demonstrators, toyvirt and smallkern: the former is a toy virtualizer, that executes in a VM the 64bit ELF binary given as argument, the latter is an example of such binary.
>
>

---

\##Beastie Bits

* [SoloBSD 19.02-STABLE](https://www.solobsd.org/index.php/2019/02/11/solobsd-19-02-stable/)
* [Project Trident 18.12-U5 available](https://project-trident.org/post/2019-02-20_18.12-u5_available/)
* [“Sudo Mastery, Second Edition” and Cover Art](https://mwl.io/archives/4076)
* [MKSANITIZER - bug detector software integration with the NetBSD userland](https://blog.netbsd.org/tnf/entry/mksanitizer_bug_detector_software_integration)
* [Darn kids nowadays… back in my day we drew rude symbols like normal people.](https://old.reddit.com/r/unix/comments/aplxjf/darn_kids_nowadays_back_in_my_day_we_drew_rude/) {{top two comments}}
* [ShellCheck  
   finds bugs in your shell scripts.](https://www.shellcheck.net/)
* [Old School Sean - A history of UNIX](https://www.youtube.com/watch?v=JuHpABL46a8)

---

\##Feedback/Questions

* Ales - [OpenBSD, FreeNAS, OpenZFS questions](http://dpaste.com/3T8VTDJ)
* Malcolm - [Thoughts on Pgsql + ZFS thread?](http://dpaste.com/2X63H8Q)
* Brad - [Boot Environments in FreeBSD](http://dpaste.com/02DCADV#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

 Your browser does not support the HTML5 video tag.