+++
title = "311: Conference Gear Breakdown"
description = "NetBSD 9.0 release process has started, xargs, a tale of two spellcheckers, Adapting TriforceAFL for NetBSD, Exploiting a no-name freebsd kernel vulnerability, and more.Headlines[NetBSD 9.0 release process has started](https://mail-index.netbsd.org/netbsd-announce/2"
date = "2019-08-15T13:00:00Z"
url = "https://www.bsdnow.tv/311"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.613087876Z"
seen = false
+++

NetBSD 9.0 release process has started, xargs, a tale of two spellcheckers, Adapting TriforceAFL for NetBSD, Exploiting a no-name freebsd kernel vulnerability, and more.

Headlines
----------

### [NetBSD 9.0 release process has started](https://mail-index.netbsd.org/netbsd-announce/2019/07/31/msg000301.html) ###

>
>
> If you have been following source-changes, you may have noticed the creation of the netbsd-9 branch! It has some really exciting items that we worked on:
>
>
>
> * New AArch64 architecture support:
>   * Symmetric and asymmetrical multiprocessing support (aka big.LITTLE)
>   * Support for running 32-bit binaries
>   * UEFI and ACPI support
>   * Support for SBSA/SBBR (server-class) hardware.
>   
>   
> * The FDT-ization of many ARM boards:
>   * the 32-bit GENERIC kernel lists 129 different DTS configurations
>   * the 64-bit GENERIC64 kernel lists 74 different DTS configurations
>   * All supported by a single kernel, without requiring per-board configuration.
>   
>   
> * Graphics driver update, matching Linux 4.4, adding support for up to Kaby Lake based Intel graphics devices.
> * ZFS has been updated to a modern version and seen many bugfixes.
> * New hardware-accelerated virtualization via NVMM.
> * NPF performance improvements and bug fixes. A new lookup algorithm, thmap, is now the default.
> * NVMe performance improvements
> * Optional kernel ASLR support, and partial kernel ASLR for the default configuration.
> * Kernel sanitizers:
>   * KLEAK, detecting memory leaks
>   * KASAN, detecting memory overruns
>   * KUBSAN, detecting undefined behaviour
>   * These have been used together with continuous fuzzing via the syzkaller project to find many bugs that were fixed.
>   
>   
> * The removal of outdated networking components such as ISDN and all of its drivers
> * The installer is now capable of performing GPT UEFI installations.
> * Dramatically improved support for userland sanitizers, as well as the option to build all of NetBSD's userland using them for bug-finding.
> * Update to graphics userland: Mesa was updated to 18.3.4, and llvmpipe is now available for several architectures, providing 3D graphics even in the absence of a supported GPU.
>
>
>
> We try to test NetBSD as best as we can, but your testing can help NetBSD 9.0 a great release. Please test it and let us know of any bugs you find.
>
>
>
> * Binaries are available at [https://nycdn.netbsd.org/pub/NetBSD-daily/netbsd-9/latest/](https://nycdn.netbsd.org/pub/NetBSD-daily/netbsd-9/latest/)
>
>

---

### [xargs wtf](https://medium.com/@aarontharris/xargs-wtf-34d2618286b7) ###

>
>
> xargs is probably one of the more difficult to understand of the unix command arsenal and of course that just means it’s one of the most useful too.  
>  I discovered a handy trick that I thought was worth a share. Please note there are probably other (better) ways to do this but I did my stackoverflow research and found nothing better.  
>  xargs — at least how I’ve most utilized it — is handy for taking some number of lines as input and doing some work per line. It’s hard to be more specific than that as it does so much else.  
>  It literally took me an hour of piecing together random man pages + tips from 11 year olds on stack overflow, but eventually I produced this gem:  
>  This is an example of how to find files matching a certain pattern and rename each of them. It sounds so trivial (and it is) but it demonstrates some cool tricks in an easy concept.
>
>

---

News Roundup
----------

### [PkgSrc: A Tale of Two Spellcheckers](https://bentsukun.ch/posts/pkgsrccon-2019/) ###

>
>
> This is a transcript of the talk I gave at pkgsrcCon 2019 in Cambridge, UK. It is about spellcheckers, but there are much more general software engineering lessons that we can learn from this case study.  
>  The reason I got into this subject at all was my paternal leave last year, when I finally had some more time to spend working on pkgsrc. It was a tiny item in the enormous TODO file at the top of the source tree (“update enchant to version 2.2”) that made me go into this rabbit hole.
>
>

---

### [Adapting TriforceAFL for NetBSD, Part 2](https://blog.netbsd.org/tnf/entry/adapting_triforceafl_for_netbsd_part1) ###

>
>
> I have been working on adapting TriforceAFL for NetBSD kernel syscall fuzzing. This blog post summarizes the work done until the second evaluation.  
>  For work done during the first coding period, check out this post.
>
>

* Summary \> So far, the TriforceNetBSDSyscallFuzzer has been made available in the form of a pkgsrc package with the ability to fuzz most of NetBSD syscalls. In the final coding period of GSoC. I plan to analyse the crashes that were found until now. Integrate sanitizers, try and find more bugs and finally wrap up neatly with detailed documentation. \> Last but not least, I would like to thank my mentor, Kamil Rytarowski for helping me through the process and guiding me. It has been a wonderful learning experience so far!

---

### [Exploiting a no-name freebsd kernel vulnerability](https://www.synacktiv.com/posts/exploit/exploiting-a-no-name-freebsd-kernel-vulnerability.html) ###

* A new patch has been recently shipped in FreeBSD kernels to fix a vulnerability (cve-2019-5602) present in the cdrom device. In this post, we will introduce the bug and discuss its exploitation on pre/post-SMEP FreeBSD revisions. \> A closer look at the commit 6bcf6e3 shows that when invoking the CDIOCREADSUBCHANNEL\_SYSSPACE ioctl, data are copied with bcopy instead of the copyout primitive. This endows a local attacker belonging to the operator group with an arbitrary write primitive in the kernel memory.

---

### [Allan and Benedicts Conference Gear Breakdown] ###

*
* Benedict’s Gear:

  >
  >
  > [GlocalMe G3 Mobile Travel HotSpot and Powerbank](https://www.glocalme.com/CA/en-US/cloudsim/g3)  
  > [Mogics Power Bagel](http://www.mogics.com/3824-2)  
  > [Charby Sense Power Cable](https://charbycharge.com/charby-sense-worlds-smartest-auto-cutoff-cable/)
  >
  >

* Allan’s Gear:

  >
  >
  > [Huawei E5770s-320 4G LTE 150 Mbps Mobile WiFi Pro](https://smile.amazon.com/gp/product/B013CEGGKI/)  
  > [AOW Global Data SIM Card for On-Demand 4G LTE Mobile Data in Over 90 Countries](https://smile.amazon.com/dp/B071HJFX27/)  
  >  All my devices charge from USB-C, so that is great  
  >  More USB thumb drives than strictly necessary  
  >  My Lenovo X270 laptop running FreeBSD 13-current  
  >  My 2016 Macbook Pro (a prize from the raffle at vBSDCon 2017) that I use for email and video conferencing to preserve battery on my FreeBSD machine for work
  >
  >

---

Beastie Bits
----------

* [Replacing the Unix tradition (Warning may be rage inducing)](https://www.youtube.com/watch?v=L9v4Mg8wi4U&feature=youtu.be)
* [Installing OpenBSD over remote serial on the AtomicPI](https://www.thanassis.space/remoteserial.html#remoteserial)
* [Zen 2 and DragonFly](https://www.dragonflydigest.com/2019/08/05/23294.html)
* [Improve Docking on FreeBSD](https://blog.yukiisbo.red/posts/2019/05/improve-docking-on-freebsd/)
* [Register for vBSDCon 2019, Sept 5-7 in Reston VA. Early bird ends August 15th.](https://vbsdcon.com/registration)
* [Register for EuroBSDCon 2019, Sept 19-22 in Lillehammer, Norway](https://2019.eurobsdcon.org/registration/)

---

Feedback/Questions
----------

* JT - [Congrats](http://dpaste.com/0D7Y31E#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.