+++
title = "345: Switchers to BSD"
description = "NetBSD 8.2 is available, NextCloud on OpenBSD, X11 screen locking, NetBSD and RISC OS running parallel, community feedback about switching to BSD, and more.HeadlinesNetBSD 8.2 is available! The third"
date = "2020-04-09T12:00:00Z"
url = "https://www.bsdnow.tv/345"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.550159624Z"
seen = true
+++

NetBSD 8.2 is available, NextCloud on OpenBSD, X11 screen locking, NetBSD and RISC OS running parallel, community feedback about switching to BSD, and more.

Headlines
----------

### [NetBSD 8.2 is available!](http://blog.netbsd.org/tnf/entry/netbsd_8_2_is_available) ###

>
>
> The third release in the NetBSD-8 is now available.
>
>
>
> This release includes all the security fixes in NetBSD-8 up until this point, and other fixes deemed important for stability.
>
>

* Some highlights include:
  * x86: fixed regression in booting old CPUs
  * x86: Hyper-V Gen.2 VM framebuffer support
  * httpd(8): fixed various security issues
  * ixg(4): various fixes / improvements
  * x86 efiboot: add tftp support, fix issues on machines with many memory segments, improve graphics mode logic to work on more machines.
  * Various kernel memory info leaks fixes
  * Update expat to 2.2.8
  * Fix ryzen USB issues and support xHCI version 3.10.
  * Accept root device specification as NAME=label.
  * Add multiboot 2 support to x86 bootloaders.
  * Fix for CVE-2019-9506: 'Key Negotiation of Bluetooth' attack.
  * nouveau: limit the supported devices and fix firmware loading.
  * radeon: fix loading of the TAHITI VCE firmware.
  * named(8): stop using obsolete dnssec-lookaside.

---

### [NextCloud on OpenBSD](https://h3artbl33d.nl/2020-nextcloud.html) ###

>
>
> NextCloud and OpenBSD are complementary to one another. NextCloud is an awesome, secure and private alternative for proprietary platforms, whereas OpenBSD forms the most secure and solid foundation to serve it on. Setting it up in the best way isn’t hard, especially using this step by step tutorial.
>
>

* Preface

>
>
> Back when this tutorial was initially written, things were different. The OpenBSD port relied on PHP 5.6 and there were no package updates. But the port improved (hats off, Gonzalo!) and package updates were introduced to the -stable branch (hats off, Solene!).
>
>
>
> A rewrite of this tutorial was long overdue. Right now, it is written for 6.6 -stable and will be updated once 6.7 is released. If you have any questions or desire some help, feel free to reach out.
>
>

---

News Roundup
----------

### [X11 screen locking: a secure and modular approach](http://leahneukirchen.org/blog/archive/2020/01/x11-screen-locking-a-secure-and-modular-approach.html) ###

>
>
> For years I’ve been using XScreenSaver as a default, but I recently learned about xsecurelock and re-evaluated my screen-saving requirements
>
>

---

### [NetBSD and RISC OS running parallel](http://www.update.uu.se/~micken/ronetbsd.html) ###

>
>
> I have been experimenting with running two systems at the same time on the RK3399 SoC.  
>  It all begun when I figured out how to switch to the A72 cpu for RISC OS. When the switch was done, the A53 cpu just continued to execute code.  
>  OK I thought why not give it something to do!  
>  My first step was to run some small programs.  
>  It worked!
>
>
>
> * Thanks to Tom Jones for the pointer to this article
>
>

---

### Several weeks ago we covered a story about switching from Linux to BSD. Benedict and JT asked for community feedback as to their thoughts on the matter. Allan was out that week, so this will give him an opportunity to chime in with his thoughts as well. ###

* Jamie - [Dumping Linux for BSD](http://dpaste.com/0CH1YXQ#wrap)
* Matt - [BSD Packaging](http://dpaste.com/2N68YPJ#wrap)
* Brad - [Linux vs BS](http://dpaste.com/2SF9V38#wrap)
* MJ - [Linux vs BSD Feedback](http://dpaste.com/0Z2ZT4V#wrap)
* Ben - [Feedback for JT](http://dpaste.com/0B3M85X)
* Henrik - [Why you should migrate everything to BSD](http://dpaste.com/3F36EQE#wrap)

---

Beastie Bits
----------

* [ssh-copy-id now included](https://www.dragonflydigest.com/2020/04/06/24367.html)
* [OPNsense 20.1.3 released](https://opnsense.org/opnsense-20-1-3-released/)
* [A Collection of prebuilt BSD Cloud Images](https://bsd-cloud-image.org/)
* [Instant terminal sharing](https://tmate.io/)

---

Feedback/Questions
----------

* Ales - [Manually verify signature files for pkg package](http://dpaste.com/1EBWTK5#wrap)
* Shody - [Yubikey](http://dpaste.com/340PM9Q#wrap)
* Mike - [Site for hashes from old disks](http://dpaste.com/13W9SF0)
  * Answer: [https://docs.google.com/spreadsheets/d/19FmLs0jXxLkxAr0zwgdrXQd1qhbwvNHH6NvolvXKWTM/edit?usp=sharing](https://docs.google.com/spreadsheets/d/19FmLs0jXxLkxAr0zwgdrXQd1qhbwvNHH6NvolvXKWTM/edit?usp=sharing)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.