+++
title = "188: And then the murders began"
description = "Today on BSD Now, the latest Dragonfly BSD release, RaidZ performance, another OpenSSL Vulnerability, and more; all this week on BSD Now.This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems"
date = "2017-04-05T12:00:00Z"
url = "https://www.bsdnow.tv/188"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.923313338Z"
seen = false
+++

Today on BSD Now, the latest Dragonfly BSD release, RaidZ performance, another OpenSSL Vulnerability, and more; all this week on BSD Now.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[ href="http://www.digitalocean.com/" title="DigitalOcean"\>![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)]()[ href="http://www.tarsnap.com/bsdnow" title="Tarsnap"\>![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)]()

---

Headlines
----------

### [DragonFly BSD 4.8 is released](https://www.dragonflybsd.org/release48/) ###

* Improved kernel performance
  * This release further localizes cache lines and reduces/removes cache ping-ponging on globals. For bulk builds on many-cores or multi-socket systems, we have around a 5% improvement, and certain subsystems such as namecache lookups and exec()s see massive focused improvements. See the corresponding mailing list post with details.

* Support for eMMC booting, and mobile and high-performance PCIe SSDs
  * This kernel release includes support for eMMC storage as the boot device. We also sport a brand new SMP-friendly, high-performance NVMe SSD driver (PCIe SSD storage). Initial device test results are available.

* EFI support
  * The installer can now create an EFI or legacy installation. Numerous adjustments have been made to userland utilities and the kernel to support EFI as a mainstream boot environment. The /boot filesystem may now be placed either in its own GPT slice, or in a DragonFly disklabel inside a GPT slice.
  * DragonFly, by default, creates a GPT slice for all of DragonFly and places a DragonFly disklabel inside it with all the standard DFly partitions, such that the disk names are roughly the same as they would be in a legacy system.

* Improved graphics support
  * The i915 driver has been updated to match the version found with the Linux 4.6 kernel. Broadwell and Skylake processor users will see improvements.

* Other user-affecting changes
  * Kernel is now built using -O2.
  * VKernels now use COW, so multiple vkernels can share one disk image.
  * powerd() is now sensitive to time and temperature changes.
  * Non-boot-filesystem kernel modules can be loaded in rc.conf instead of loader.conf. \*\*\*

### [#8005 poor performance of 1MB writes on certain RAID-Z configurations](https://github.com/openzfs/openzfs/pull/321) ###

* Matt Ahrens posts a new patch for OpenZFS

>
>
> Background: RAID-Z requires that space be allocated in multiples of P+1 sectors,because this is the minimum size block that can have the required amount of parity. Thus blocks on RAIDZ1 must be allocated in a multiple of 2 sectors; on RAIDZ2 multiple of 3; and on RAIDZ3 multiple of 4. A sector is a unit of 2<sup>ashift</sup> bytes, typically 512B or 4KB.  
>  To satisfy this constraint, the allocation size is rounded up to the proper multiple, resulting in up to 3 "pad sectors" at the end of some blocks. The contents of these pad sectors are not used, so we do not need to read or write these sectors. However, some storage hardware performs much worse (around 1/2 as fast) on mostly-contiguous writes when there are small gaps of non-overwritten data between the writes. Therefore, ZFS creates "optional" zio's when writing RAID-Z blocks that include pad sectors. If writing a pad sector will fill the gap between two (required) writes, we will issue the optional zio, thus doubling performance. The gap-filling performance improvement was introduced in July 2009.  
>  Writing the optional zio is done by the io aggregation code in vdev\_queue.c. The problem is that it is also subject to the limit on the size of aggregate writes, zfs\_vdev\_aggregation\_limit, which is by default 128KB. For a given block, if the amount of data plus padding written to a leaf device exceeds zfs\_vdev\_aggregation\_limit, the optional zio will not be written, resulting in a \~2x performance degradation.  
>  The solution is to aggregate optional zio's regardless of the aggregation size limit.
>
>

* As you can see from the graphs, this can make a large difference in performance.
* I encourage you to read the entire commit message, it is well written and very detailed. \*\*\*

### [Can you spot the OpenSSL vulnerability ](https://guidovranken.wordpress.com/2017/01/28/can-you-spot-the-vulnerability/) ###

>
>
> This code was introduced in OpenSSL 1.1.0d, which was released a couple of days ago. This is in the server SSL code, ssl/statem/statem\_srvr.c, ssl\_bytes\_to\_cipher\_list()), and can easily be reached remotely. Can you spot the vulnerability?  
>  So there is a loop, and within that loop we have an ‘if’ statement, that tests a number of conditions. If any of those conditions fail, OPENSSL\_free(raw) is called. But raw isn’t the address that was allocated; raw is increment every loop. Hence, there is a remote invalid free vulnerability.  
>  But not quite. None of those checks in the ‘if’ statement can actually fail; earlier on in the function, there is a check that verifies that the packet contains at least 1 byte, so PACKET\_get\_1 cannot fail. Furthermore, earlier in the function it is verified that the packet length is a multiple of 3, hence PACKET\_copy\_bytes and PACKET\_forward cannot fail.
>
>

* So, does the code do what the original author thought, or expected it to do?
* But what about the next person that modifies that code, maybe changing or removing one of the earlier checks, allowing one of those if conditions to fail, and execute the bad code?

>
>
> Nonetheless OpenSSL has acknowledged that the OPENSSL\_free line needs a rewrite: [Pull Request #2312](https://github.com/openssl/openssl/pull/2312)  
>  PS I’m not posting this to ridicule the OpenSSL project or their programming skills. I just like reading code and finding corner cases that impact security, which is an effort that ultimately works in everybody’s best interest, and I like to share what I find. Programming is a very difficult enterprise and everybody makes mistakes.
>
>

* Thanks to Guido Vranken for the sharp eye and the blog post \*\*\*

### [Research Debt](http://distill.pub/2017/research-debt/) ###

* I found this article interesting as it relates to not just research, but a lot of technical areas in general

>
>
> Achieving a research-level understanding of most topics is like climbing a mountain. Aspiring researchers must struggle to understand vast bodies of work that came before them, to learn techniques, and to gain intuition. Upon reaching the top, the new researcher begins doing novel work, throwing new stones onto the top of the mountain and making it a little taller for whoever comes next.   
>  People expect the climb to be hard. It reflects the tremendous progress and cumulative effort that’s gone into the research. The climb is seen as an intellectual pilgrimage, the labor a rite of passage. But the climb could be massively easier. It’s entirely possible to build paths and staircases into these mountains. The climb isn’t something to be proud of. The climb isn’t progress: the climb is a mountain of debt.  
>  Programmers talk about technical debt: there are ways to write software that are faster in the short run but problematic in the long run.
>
>
>
> Poor Exposition – Often, there is no good explanation of important ideas and one has to struggle to understand them. This problem is so pervasive that we take it for granted and don’t appreciate how much better things could be.
>
>
>
> Undigested Ideas – Most ideas start off rough and hard to understand. They become radically easier as we polish them, developing the right analogies, language, and ways of thinking.
>
>
>
> Bad abstractions and notation – Abstractions and notation are the user interface of research, shaping how we think and communicate. Unfortunately, we often get stuck with the first formalisms to develop even when they’re bad. For example, an object with extra electrons is negative, and pi is wrong
>
>
>
> Noise – Being a researcher is like standing in the middle of a construction site. Countless papers scream for your attention and there’s no easy way to filter or summarize them. We think noise is the main way experts experience research debt.
>
>
>
> There’s a tradeoff between the energy put into explaining an idea, and the energy needed to understand it. On one extreme, the explainer can painstakingly craft a beautiful explanation, leading their audience to understanding without even realizing it could have been difficult. On the other extreme, the explainer can do the absolute minimum and abandon their audience to struggle. This energy is called interpretive labor  
>  Research distillation is the opposite of research debt. It can be incredibly satisfying, combining deep scientific understanding, empathy, and design to do justice to our research and lay bare beautiful insights. Distillation is also hard. It’s tempting to think of explaining an idea as just putting a layer of polish on it, but good explanations often involve transforming the idea. This kind of refinement of an idea can take just as much effort and deep understanding as the initial discovery.
>
>
>
> * The distillation can often times require an entirely different set of skills than the original creation of the idea. Almost all of the BSD projects have some great ideas or subsystems that just need distillation into easy to understand and use platforms or tools. Like the theoretician, the experimentalist or the research engineer, the research distiller is an integral role for a healthy research community. Right now, almost no one is filling it.
>
>

* Anyway, if that bit piqued your interest, go read the full article and the suggested further reading. \*\*\*

News Roundup
----------

### [And then the murders began.](https://blather.michaelwlucas.com/archives/2902) ###

>
>
> A whole bunch of people have pointed me at articles like [this one](http://thehookmag.com/2017/03/adding-murders-began-second-sentence-book-makes-instantly-better-125462/), which claim that you can improve almost any book by making the second sentence “And then the murders began.”  
>  It’s entirely possible they’re correct. But let’s check, with a sampling of books. As different books come in different tenses and have different voices, I’ve made some minor changes.
>
>
>
> “Welcome to Cisco Routers for the Desperate! And then the murders begin.” — Cisco Routers for the Desperate, 2nd ed
>
>
>
> “Over the last ten years, OpenSSH has become the standard tool for remote management of Unix-like systems and many network devices. And then the murders began.” — SSH Mastery
>
>
>
> “The Z File System, or ZFS, is a complicated beast, but it is also the most powerful tool in a sysadmin’s Batman-esque utility belt. And then the murders begin.” — FreeBSD Mastery: Advanced ZFS
>
>
>
> “Blood shall rain from the sky, and great shall be the lamentation of the Linux fans. And then, the murders will begin.” — Absolute FreeBSD, 3rd Ed
>
>

---

### [Netdata now supports FreeBSD](https://github.com/firehol/netdata) ###

>
>
> netdata is a system for distributed real-time performance and health monitoring. It provides unparalleled insights, in real-time, of everything happening on the system it runs (including applications such as web and database servers), using modern interactive web dashboards.
>
>

* From the release notes:

>
>
> apps.plugin ported for FreeBSD
>
>

* [Check out their demo sites](https://github.com/firehol/netdata/wiki) \*\*\*

### [Distrowatch Weekly reviews RaspBSD](https://distrowatch.com/weekly.php?issue=20170220#raspbsd) ###

>
>
> RaspBSD is a FreeBSD-based project which strives to create a custom build of FreeBSD for single board and hobbyist computers. RaspBSD takes a recent snapshot of FreeBSD and adds on additional components, such as the LXDE desktop and a few graphical applications. The RaspBSD project currently has live images for Raspberry Pi devices, the Banana Pi, Pine64 and BeagleBone Black & Green computers.
>
>
>
> The default RaspBSD system is quite minimal, running a mere 16 processes when I was logged in. In the background the operating system runs cron, OpenSSH, syslog and the powerd power management service. Other than the user's shell and terminals, nothing else is running. This means RaspBSD uses little memory, requiring just 16MB of active memory and 31MB of wired or kernel memory.
>
>
>
> I made note of a few practical differences between running RaspBSD on the Pi verses my usual Raspbian operating system. One minor difference is RaspBSD turns off the Pi's external power light after booting. Raspbian leaves the light on. This means it looks like the Pi is off when it is running RaspBSD, but it also saves a little electricity.
>
>
>
> Conclusions: Apart from these little differences, running RaspBSD on the Pi was a very similar experience to running Raspbian and my time with the operating system was pleasantly trouble-free. Long-term, I think applying source updates to the base system might be tedious and SD disk operations were slow. However, the Pi usually is not utilized for its speed, but rather its low cost and low-energy usage. For people who are looking for a small home server or very minimal desktop box, RaspBSD running on the Pi should be suitable.
>
>
> ---
>

### [Research UNIX V8, V9 and V10 made public by Alcatel-Lucent](<https://media-bell-labs-com.s3.amazonaws.com/pages/20170327_1602/statement regarding Unix 3-7-17.pdf>) ###

* Alcatel-Lucent USA Inc. (“ALU-USA”), on behalf of itself and Nokia Bell Laboratories agrees, to the extent of its ability to do so, that it will not assert its copyright rights with respect to any non-commercial copying, distribution, performance, display or creation of derivative works of Research Unix®1 Editions 8, 9, and 10.
* Research Unix is a term used to refer to versions of the Unix operating system for DEC PDP-7, PDP-11, VAX and Interdata 7/32 and 8/32 computers, developed in the Bell Labs Computing Science Research Center. The version breakdown can be viewed on its [Wikipedia page](https://en.wikipedia.org/wiki/Research_Unix)
* It only took 30+ years, but now they’re public
* You can grab them from [here](http://www.tuhs.org/Archive/Distributions/Research/)
* If you’re wondering what happened with Research Unix, After Version 10, Unix development at Bell Labs was stopped in favor of a successor system, [Plan 9](http://plan9.bell-labs.com/plan9/); which itself was succeeded by [Inferno](http://www.vitanuova.com/inferno/). \*\*\*

Beastie Bits
----------

* [The BSD Family Tree](https://github.com/freebsd/freebsd/blob/master/share/misc/bsd-family-tree)
* [Unix Permissions Calculator](http://permissions-calculator.org/)
* [NAS4Free release 11.0.0.4 now available](https://sourceforge.net/projects/nas4free/files/NAS4Free-11.0.0.4/11.0.0.4.4141/)
* [Another BSD Mag released for free downloads](https://bsdmag.org/download/simple-quorum-drive-freebsd-ctl-ha-beast-storage-system/)
* [OPNsense 17.1.4 released](https://forum.opnsense.org/index.php?topic=4898.msg19359) \*\*\*

Feedback/Questions
----------

* [gozes asks via twitter about how get involved in FreeBSD](https://twitter.com/gozes/status/846779901738991620) \*\*\*