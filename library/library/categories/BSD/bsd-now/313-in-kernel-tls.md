+++
title = "313: In-Kernel TLS"
description = "OpenBSD on 7th gen Thinkpad X1 Carbon, how to install FreeBSD on a MacBook, Kernel portion of in-kernel TLS (KTLS), Boot Environments on DragonflyBSD, Project Trident Updates, vBSDcon schedule, and more.Headlines[OpenBSD on the Thinkpad X1 Carbon 7th Gen](https://jc"
date = "2019-08-29T04:30:00Z"
url = "https://www.bsdnow.tv/313"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.609368559Z"
seen = true
+++

OpenBSD on 7th gen Thinkpad X1 Carbon, how to install FreeBSD on a MacBook, Kernel portion of in-kernel TLS (KTLS), Boot Environments on DragonflyBSD, Project Trident Updates, vBSDcon schedule, and more.

Headlines
----------

### [OpenBSD on the Thinkpad X1 Carbon 7th Gen](https://jcs.org/2019/08/14/x1c7) ###

>
>
> Another year, another ThinkPad X1 Carbon, this time with a Dolby Atmos sound system and a smaller battery.  
>  The seventh generation X1 Carbon isn't much different than the fifth and sixth generations. I opted for the non-vPro Core i5-8265U, 16Gb of RAM, a 512Gb NVMe SSD, and a matte non-touch WQHD display at \~300 nits. A brighter 500-nit 4k display is available, though early reports indicated it severely impacts battery life.  
>  Gone are the microSD card slot on the back and 1mm of overall thickness (from 15.95mm to 14.95mm), but also 6Whr of battery (down to 51Whr) and a little bit of travel in the keyboard and TrackPoint buttons. I still very much like the feel of both of them, so kudos to Lenovo for not going too far down the Apple route of sacrificing performance and usability just for a thinner profile.  
>  On my fifth generation X1 Carbon, I used a vinyl plotter to cut out stickers to cover the webcam, "X1 Carbon" branding from the bottom of the display, the power button LED, and the "ThinkPad" branding from the lower part of the keyboard deck.
>
>

* See link for the rest of the article

---

### [How To Install FreeBSD On A MacBook 1,1 or 2,1](http://lexploit.com/freebsdmacbook1-1-2-1/) ###

* FreeBSD Setup For MacBook 1,1 and 2,1

>
>
> FreeBSD with some additional setup can be installed on a MacBook 1,1 or 2,1. This article covers how to do so with FreeBSD 10-12.
>
>

* Installing

>
>
> FreeBSD can be installed as the only OS on your MacBook if desired. What you should have is:
>
>

* A Mac OS X 10.4.6-10.7.5 installer. Unofficial versions modified for these MacBooks such as 10.8 also work.
* A blank CD or DVD to burn the FreeBSD image to. Discs simply work best with these older MacBooks.
* An ISO file of FreeBSD for x86. The AMD64 ISO does not boot due to the 32 bit EFI of these MacBooks.
* Burn the ISO file to the blank CD or DVD. Once done, make sure it's in your MacBook and then power off the MacBook. Turn it on, and hold down the c key until the FreeBSD disc boots.

  * See link for the rest of the guide

---

News Roundup
----------

### [Patch for review: Kernel portion of in-kernel TLS (KTLS)](https://svnweb.freebsd.org/base?view=revision&revision=351522) ###

>
>
> One of the projects I have been working on for the past several months in conjunction with several other folks is upstreaming work from Netflix to handle some aspects of Transport Layer Security (TLS) in the kernel. In particular, this lets a web server use sendfile() to send static content on HTTPS connections. There is a lot more detail in the review itself, so I will spare pasting a big wall of text here. However, I have posted the patch to add the kernel-side of KTLS for review at the URL below. KTLS also requires other patches to OpenSSL and nginx, but this review is only for the kernel bits. Patches and reviews for the other bits will follow later.
>
>

* [https://reviews.freebsd.org/D21277](https://reviews.freebsd.org/D21277)

---

### [DragonFly Boot Enviroments](https://github.com/newnix/dfbeadm) ###

>
>
> This is a tool inspired by the beadm utility for FreeBSD/Illumos systems that creates and manages ZFS boot environments. This utility in contrast is written from the ground up in C, this should provide better performance, integration, and extensibility than the POSIX sh and awk script it was inspired by. During the time this project has been worked on, beadm has been superseded by bectl on FreeBSD. After hammering out some of the outstanding internal logic issues, I might look at providing a similar interface to the command as bectl.
>
>

* See link for the rest of the details

---

### Project Trident Updates ###

* [19.08 Available](https://project-trident.org/post/2019-08-15_19.08_available/)

>
>
> This is a general package update to the CURRENT release repository based upon TrueOS 19.08.  
>  Legacy boot ISO functional again  
>  This update includes the FreeBSD fixes for the “vesa” graphics driver for legacy-boot systems. The system can once again be installed on legacy-boot systems.
>
>

* PACKAGE CHANGES FROM 19.07-U1

  * New Packages: 154
  * Deleted Packages: 394
  * Updated Packages: 4926

* [12-U3 Available](https://project-trident.org/post/2019-08-22_stable12-u3_available/)

>
>
> This is the third general package update to the STABLE release repository based upon TrueOS 12-Stable.
>
>

* PACKAGE CHANGES FROM STABLE 12-U2
  * New Packages: 105
  * Deleted Packages: 386
  * Updated Packages: 1046

---

### [vBSDcon](https://www.vbsdcon.com/schedule/) ###

* vBSDcon 2019 will return to the Hyatt Regency in Reston, VA on September 5-7 2019. \*\*\*

Beastie Bits
----------

* [The next NYCBUG meeting will be Sept 4 @ 18:45](https://www.nycbug.org/index?action=view&id=10671)

---

Feedback/Questions
----------

* Tom - [Questions](http://dpaste.com/1AXXK7G#wrap)
* Michael - [dfbeadm](http://dpaste.com/0PNEDYT#wrap)
* Bostjan - [Questions](http://dpaste.com/1N7T7BR#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.