+++
title = "341: U-NAS-ification"
description = "FreeBSD on Power, DragonflyBSD 5.8 is here, Unifying FreeNAS/TrueNAS, OpenBSD vs. Prometheus and Go, gcc 4.2.1 removed from FreeBSD base, and more.Headlines[FreeBSD on Power](https://www.freebsdfoundation.org/blog/power-to-the-people-making-freebsd-a-first-class-cit"
date = "2020-03-12T12:00:00Z"
url = "https://www.bsdnow.tv/341"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.556836229Z"
seen = true
+++

FreeBSD on Power, DragonflyBSD 5.8 is here, Unifying FreeNAS/TrueNAS, OpenBSD vs. Prometheus and Go, gcc 4.2.1 removed from FreeBSD base, and more.

Headlines
----------

### [FreeBSD on Power](https://www.freebsdfoundation.org/blog/power-to-the-people-making-freebsd-a-first-class-citizen-on-power/) ###

>
>
> The power and promise of all open source software is freedom. Another way to express freedom is choice — choice of platforms, deployment models, stacks, configurations, etc.
>
>
>
> The FreeBSD Foundation is dedicated to supporting and promoting the FreeBSD Project and community worldwide. But, what does this mean, exactly, you may wonder. The truth is it means many different things, but in all cases the Foundation acts to expand freedom and choice so that FreeBSD users have the power to serve their varied compute needs.
>
>
>
> This blog tells the story of one specific way the Foundation helps a member of the community provide greater hardware choice for all FreeBSD users.
>
>

---

### [Dragonfly 5.8](https://www.dragonflybsd.org/release58/) ###

>
>
> DragonFly version 5.8 brings a new dsynth utility for building your own binary dports packages, plus significant support work to speed up that build - up to and including the entire collection. Additional progress has been made on GPU and signal support.
>
>
>
> The details of all commits between the 5.6 and 5.8 branches are available in the associated commit messages for 5.8.0rc1 and 5.8.0. Also see /usr/src/UPDATING for specific file changes in PAM.
>
>

* See article for rest of information

---

### [2nd HamBUG meeting recap](https://www.hambug.ca/) ###

* The second meeting of the Hamilton BSD Users Group took place last night
* The next meeting is scheduled for the 2nd Tuesday of the month, April 14th 2020

---

News Roundup
----------

### [FreeNAS/TrueNAS Brand Unification](https://www.ixsystems.com/blog/freenas-truenas-unification/) ###

>
>
> FreeNAS and TrueNAS have been separate-but-related members of the #1 Open Source storage software family since 2012. FreeNAS is the free Open Source version with an expert community and has led the pursuit of innovations like Plugins and VMs. TrueNAS is the enterprise version for organizations of all sizes that need additional uptime and performance, as well as the enterprise-grade support necessary for critical data and applications.
>
>
>
> From the beginning at iXsystems, we’ve developed, tested, documented, and released both as separate products, even though the vast majority of code is shared. This was a deliberate technical decision in the beginning but over time became less of a necessity and more of “just how we’ve always done it”. Furthermore, to change it was going to require a serious overhaul to how we build and package both products, among other things, so we continued to kick the can down the road. As we made systematic improvements to development and QA efficiency over the past few years, the redundant release process became almost impossible to ignore as our next major efficiency roadblock to overcome. So, we’ve finally rolled up our sleeves.
>
>
>
> With the recent 11.3 release, TrueNAS gained parity with FreeNAS on features like VMs and Plugins, further homogenizing the code. Today, we announce the next phase of evolution for FreeNAS and TrueNAS.
>
>

---

### [OpenBSD versus Prometheus (and Go).](https://utcc.utoronto.ca/~cks/space/blog/sysadmin/OpenBSDVsPrometheusAndGo) ###

>
>
> We have a decent number of OpenBSD machines that do important things (and that have sometimes experienced problems like running out of disk space), and we have a Prometheus based metrics and monitoring system. The Prometheus host agent has enough support for OpenBSD to be able to report on critical metrics, including things like local disk space. Despite all of this, after some investigation I've determined that it's not really sensible to even try to deploy the host agent on our OpenBSD machines. This is due to a combination of factors that have at their root OpenBSD's lack of ABI stability
>
>

---

### [FreeBSD removed gcc from base](https://svnweb.freebsd.org/base?view=revision&revision=358454) ###

>
>
> As described in Warner's email message[1] to the FreeBSD-arch mailing list we have reached GCC 4.2.1's retirement date. At this time all supported architectures either use in-tree Clang, or rely on external toolchain (i.e., a contemporary GCC version from ports).
>
>
>
> GCC 4.2.1 was released July 18, 2007 and was imported into FreeBSD later that year, in r171825. GCC has served us well, but version 4.2.1 is obsolete and not used by default on any architecture in FreeBSD. It does not support modern C and does not support arm64 or RISC-V.
>
>

---

Beastie Bits
----------

* [New Archive location for Dragonfly 4.x](https://www.dragonflydigest.com/2020/03/10/24276.html)
* [A dead simple git cheat sheet](https://hub.iwebthings.com/a-dead-simple-git-cheatsheet/)
* [Xorg 1.20.7 on HardenedBSD Comes with IE/RELRO+BIND\_NOW/CFI/SafeStack Protections](https://twitter.com/lattera/status/1233412881569415168)

---

Feedback/Questions
----------

* [Niclas writes in Regarding the Lenovo E595 user (episode 340)](http://dpaste.com/2YJ6PFW#wrap)
* [Lyubomir writes about GELI and ZFS](http://dpaste.com/1S0DGT3#wrap)
* [Peter writes in about scaling FreeBSD jails](http://dpaste.com/2FSZQ8V#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.