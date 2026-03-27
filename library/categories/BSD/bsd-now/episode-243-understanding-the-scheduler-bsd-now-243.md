+++
title = "Episode 243: Understanding The Scheduler | BSD Now 243"
description = "OpenBSD 6.3 and DragonflyBSD 5.2 are released, bug fix for disappearing files in OpenZFS on Linux (and only Linux), understanding the FreeBSD CPU scheduler, NetBSD on RPI3, thoughts on being a committer for 20 years, and 5 reasons to use FreeBSD in 2018.Headlines[Op"
date = "2018-04-25T20:00:00Z"
url = "https://www.bsdnow.tv/243"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.762672531Z"
seen = false
+++

OpenBSD 6.3 and DragonflyBSD 5.2 are released, bug fix for disappearing files in OpenZFS on Linux (and only Linux), understanding the FreeBSD CPU scheduler, NetBSD on RPI3, thoughts on being a committer for 20 years, and 5 reasons to use FreeBSD in 2018.

Headlines
----------

### [OpenBSD 6.3 released](https://www.openbsd.org/63.html) ###

* Punctual as ever, OpenBSD 6.3 has been releases with the following features/changes:
  >  Improved HW support, including: SMP support on OpenBSD/arm64 platforms vmm/vmd improvements: IEEE 802.11 wireless stack improvements Generic network stack improvements Installer improvements Routing daemons and other userland network improvements Security improvements dhclient(8) improvements Assorted improvements OpenSMTPD 6.0.4 OpenSSH 7.7 LibreSSL 2.7.2

---

### [DragonFlyBSD 5.2 released](https://www.dragonflybsd.org/release52/) ###

>
>
> Big-ticket items Meltdown and Spectre mitigation support Meltdown isolation and spectre mitigation support added. Meltdown mitigation is automatically enabled for all Intel cpus. Spectre mitigation must be enabled manually via sysctl if desired, using sysctls machdep.spectre*mitigation and machdep.meltdown*mitigation. HAMMER2 H2 has received a very large number of bug fixes and performance improvements. We can now recommend H2 as the default root filesystem in non-clustered mode. Clustered support is not yet available. ipfw Updates Implement state based "redirect", i.e. without using libalias. ipfw now supports all possible ICMP types. Fix ICMP*MAXTYPE assumptions (now 40 as of this release). Improved graphics support The drm/i915 kernel driver has been updated to support Intel Coffeelake GPUs Add 24-bit pixel format support to the EFI frame buffer code. Significantly improve fbio support for the "scfb" XOrg driver. This allows EFI frame buffers to be used by X in situations where we do not otherwise support the GPU. Partly implement the FBIO*BLANK ioctl for display powersaving. Syscons waits for drm modesetting at appropriate places, avoiding races. + For more details, check out the “All changes since DragonFly 5.0” section.
>
>

---

### [ZFS on Linux bug causes files to disappear](https://github.com/zfsonlinux/zfs/issues/7401) ###

* A bug in ZoL 0.7.7 caused 0.7.8 to be released just 3 days after the release
* The bug only impacts Linux, the change that caused the problem was not upstreamed yet, so does not impact ZFS on illumos, FreeBSD, OS X, or Windows
* The bug can cause files being copied into a directory to not be properly linked to the directory, so they will no longer be listed in the contents of the directory
* ZoL developers are working on a tool to allow you to recover the data, since no data was actually lost, the files were just not properly registered as part of the directory
* The bug was introduced in a commit made in February, that attempted to improve performance of datasets created with the case insensitivity option. In an effort to improve performance, they introduced a limit to cap to give up (return ENOSPC) if growing the directory ZAP failed twice.
* The ZAP is the key-value pair data structure that contains metadata for a directory, including a hash table of the files that are in a directory. When a directory has a large number of files, the ZAP is converted to a FatZAP, and additional space may need to be allocated as additional files are added.
  >  Commit cc63068 caused ENOSPC error when copy a large amount of files between two directories. The reason is that the patch limits zap leaf expansion to 2 retries, and return ENOSPC when failed.

* Finding the root cause of this issue was somewhat hampered by the fact that many people were not able to reproduce the issue. It turns out this was caused by an entirely unrelated change to GNU coreutils.
* On later versions of GNU Coreutils, the files were returned in a sorted order, resulting in them hitting different buckets in the hash table, and not tripping the retry limit
* Tools like rsync were unaffected, because they always sort the files before copying
* If you did not see any ENOSPC errors, you were likely not impacted The intent for limiting retries is to prevent pointlessly growing table to max size when adding a block full of entries with same name in different case in mixed mode. However, it turns out we cannot use any limit on the retry. When we copy files from one directory in readdir order, we are copying in hash order, one leaf block at a time. Which means that if the leaf block in source directory has expanded 6 times, and you copy those entries in that block, by the time you need to expand the leaf in destination directory, you need to expand it 6 times in one go. So any limit on the retry will result in error where it shouldn't.
* Recommendations for Users from Ryan Yao: The regression makes it so that creating a new file could fail with ENOSPC after which files created in that directory could become orphaned. Existing files seem okay, but I have yet to confirm that myself and I cannot speak for what others know. It is incredibly difficult to reproduce on systems running coreutils 8.23 or later. So far, reports have only come from people using coreutils 8.22 or older. The directory size actually gets incremented for each orphaned file, which makes it wrong after orphan files happen. We will likely have some way to recover the orphaned files (like ext4’s lost+found) and fix the directory sizes in the very near future. Snapshots of the damaged datasets are problematic though. Until we have a subcommand to fix it (not including the snapshots, which we would have to list), the damage can be removed from a system that has it either by rolling back to a snapshot before it happened or creating a new dataset with 0.7.6 (or another release other than 0.7.7), moving everything to the new dataset and destroying the old. That will restore things to pristine condition. It should also be possible to check for pools that are affected, but I have yet to finish my analysis to be certain that no false negatives occur when checking, so I will avoid saying how for now.
* Writes to existing files cannot trigger this bug, only adding new files to a directory in bulk

---

News Roundup
----------

### [des@’s thoughts on being a FreeBSD committer for 20 years](https://blog.des.no/2018/04/twenty-years/) ###

>
>
> Yesterday was the twentieth anniversary of my FreeBSD commit bit, and tomorrow will be the twentieth anniversary of my first commit. I figured I’d split the difference and write a few words about it today.
>
>
>
> My level of engagement with the FreeBSD project has varied greatly over the twenty years I’ve been a committer. There have been times when I worked on it full-time, and times when I did not touch it for months. The last few years, health issues and life events have consumed my time and sapped my energy, and my contributions have come in bursts. Commit statistics do not tell the whole story, though: even when not working on FreeBSD directly, I have worked on side projects which, like OpenPAM, may one day find their way into FreeBSD.
>
>
>
> My contributions have not been limited to code. I was the project’s first Bugmeister; I’ve served on the Security Team for a long time, and have been both Security Officer and Deputy Security Officer; I managed the last four Core Team elections and am doing so again this year.
>
>
>
> In return, the project has taught me much about programming and software engineering. It taught me code hygiene and the importance of clarity over cleverness; it taught me the ins and outs of revision control; it taught me the importance of good documentation, and how to write it; and it taught me good release engineering practices.
>
>
>
> Last but not least, it has provided me with the opportunity to work with some of the best people in the field. I have the privilege today to count several of them among my friends.
>
>
>
> For better or worse, the FreeBSD project has shaped my career and my life. It set me on the path to information security in general and IAA in particular, and opened many a door for me. I would not be where I am now without it.
>
>
>
> I won’t pretend to be able to tell the future. I don’t know how long I will remain active in the FreeBSD project and community. It could be another twenty years; or it could be ten, or five, or less. All I know is that FreeBSD and I still have things to teach each other, and I don’t intend to call it quits any time soon.
>
>

---

### [iXsystems unveils new TrueNAS M-Series Unified Storage Line](https://www.ixsystems.com/blog/truenas-m-series/?utm_source=twitter.com&utm_medium=bsdnow&utm_campaign=truenas+m+series) ###

>
>
> San Jose, Calif., April 10, 2018 — iXsystems, the leader in Enterprise Open Source servers and software-defined storage, announced the TrueNAS M40 and M50 as the newest high-performance models in its hybrid, unified storage product line. The TrueNAS M-Series harnesses NVMe and NVDIMM to bring all-flash array performance to the award-winning TrueNAS hybrid arrays. It also includes the Intel® Xeon® Scalable Family of Processors and supports up to 100GbE and 32Gb Fibre Channel networking. Sitting between the all-flash TrueNAS Z50 and the hybrid TrueNAS X-Series in the product line, the TrueNAS M-Series delivers up to 10 Petabytes of highly-available and flash-powered network attached storage and rounds out a comprehensive product set that has a capacity and performance option for every storage budget.
>
>

* Designed for On-Premises & Enterprise Cloud Environments

>
>
> As a unified file, block, and object sharing solution, TrueNAS can meet the needs of file serving, backup, virtualization, media production, and private cloud users thanks to its support for the SMB, NFS, AFP, iSCSI, Fibre Channel, and S3 protocols.
>
>
>
> At the heart of the TrueNAS M-Series is a custom 4U, dual-controller head unit that supports up to 24 3.5” drives and comes in two models, the M40 and M50, for maximum flexibility and scalability. The TrueNAS M40 uses NVDIMMs for write cache, SSDs for read cache, and up to two external 60-bay expansion shelves that unlock up to 2PB in capacity. The TrueNAS M50 uses NVDIMMs for write caching, NVMe drives for read caching, and up to twelve external 60-bay expansion shelves to scale upwards of 10PB. The dual-controller design provides high-availability failover and non-disruptive upgrades for mission-critical enterprise environments.
>
>
>
> By design, the TrueNAS M-Series unleashes cutting-edge persistent memory technology for demanding performance and capacity workloads, enabling businesses to accelerate enterprise applications and deploy enterprise private clouds that are twice the capacity of previous TrueNAS models. It also supports replication to the Amazon S3, BackBlaze B2, Google Cloud, and Microsoft Azure cloud platforms and can deliver an object store using the ubiquitous S3 object storage protocol at a fraction of the cost of the public cloud.
>
>

* Fast

>
>
> As a true enterprise storage platform, the TrueNAS M50 supports very demanding performance workloads with up to four active 100GbE ports, 3TB of RAM, 32GB of NVDIMM write cache and up to 15TB of NVMe flash read cache. The TrueNAS M40 and M50 include up to 24/7 and global next-business-day support, putting IT at ease. The modular and tool-less design of the M-Series allows for easy, non-disruptive servicing and upgrading by end-users and support technicians for guaranteed uptime. TrueNAS has US-Based support provided by the engineering team that developed it, offering the rapid response that every enterprise needs.
>
>

* Award-Winning TrueNAS Features

  * Enterprise: Perfectly suited for private clouds and enterprise workloads such as file sharing, backups, M&E, surveillance, and hosting virtual machines.
  * Unified: Utilizes SMB, AFP, NFS for file storage, iSCSI, Fibre Channel and OpenStack Cinder for block storage, and S3-compatible APIs for object storage. Supports every common operating system, hypervisor, and application.
  * Economical: Deploy an enterprise private cloud and reduce storage TCO by 70% over AWS with built-in enterprise-class features such as in-line compression, deduplication, clones, and thin-provisioning.
  * Safe: The OpenZFS file system ensures data integrity with best-in-class replication and snapshotting. Customers can replicate data to the rest of the iXsystems storage lineup and to the public cloud.
  * Reliable: High Availability option with dual hot-swappable controllers for continuous data availability and 99.999% uptime.
  * Familiar: Provision and manage storage with the same simple and powerful WebUI and REST APIs used in all iXsystems storage products, as well as iXsystems’ FreeNAS Software.
  * Certified: TrueNAS has passed the Citrix Ready, VMware Ready, and Veeam Ready certifications, reducing the risk of deploying a virtualized infrastructure.
  * Open: By using industry-standard sharing protocols, the OpenZFS Open Source enterprise file system and FreeNAS, the world’s #1 Open Source storage operating system (and also engineered by iXsystems), TrueNAS is the most open enterprise storage solution on the market.

* Availability

>
>
> The TrueNAS M40 and M50 will be generally available in April 2018 through the iXsystems global channel partner network. The TrueNAS M-Series starts at under $20,000 USD and can be easily expanded using a linear “per terabyte” pricing model. With typical compression, a Petabtye can be stored for under $100,000 USD. TrueNAS comes with an all-inclusive software suite that provides NFS, Windows SMB, iSCSI, snapshots, clones and replication.
>
>

* For more information, visit www.ixsystems.com/TrueNAS
* [TrueNAS M-Series What's New Video](<TrueNAS M-Series What's New>)

---

### [Understanding and tuning the FreeBSD Scheduler ](https://lists.freebsd.org/pipermail/freebsd-stable/2018-April/088678.html) ###

``` Occasionally I noticed that the system would not quickly process the tasks i need done, but instead prefer other, longrunning tasks. I figured it must be related to the scheduler, and decided it hates me.

A closer look shows the behaviour as follows (single CPU):

Lets run an I/O-active task, e.g, postgres VACUUM that would continuously read from big files (while doing compute as well [1]):

>
>
> pool alloc free read write read write cache - - - - - - ada1s4 7.08G 10.9G 1.58K 0 12.9M 0
>
>

Now start an endless loop:

while true; do :; done
==========

And the effect is:

>
>
> pool alloc free read write read write cache - - - - - - ada1s4 7.08G 10.9G 9 0 76.8K 0
>
>

The VACUUM gets almost stuck! This figures with WCPU in "top":

>
>
> PID USERNAME PRI NICE SIZE RES STATE TIME WCPU COMMAND 85583 root 99 0 7044K 1944K RUN 1:06 92.21% bash 53005 pgsql 52 0 620M 91856K RUN 5:47 0.50% postgres
>
>

Hacking on kern.sched.quantum makes it quite a bit better:

sysctl kern.sched.quantum=1
==========

kern.sched.quantum: 94488 -\> 7874

>
>
> pool alloc free read write read write cache - - - - - - ada1s4 7.08G 10.9G 395 0 3.12M 0
>
>
>
> PID USERNAME PRI NICE SIZE RES STATE TIME WCPU COMMAND 85583 root 94 0 7044K 1944K RUN 4:13 70.80% bash 53005 pgsql 52 0 276M 91856K RUN 5:52 11.83% postgres
>
>

Now, as usual, the "root-cause" questions arise: What exactly does this "quantum"? Is this solution a workaround, i.e. actually something else is wrong, and has it tradeoff in other situations? Or otherwise, why is such a default value chosen, which appears to be ill-deceived?

The docs for the quantum parameter are a bit unsatisfying - they say its the max num of ticks a process gets - and what happens when they're exhausted? If by default the endless loop is actually allowed to continue running for 94k ticks (or 94ms, more likely) uninterrupted, then that explains the perceived behaviour - buts thats certainly not what a scheduler should do when other procs are ready to run.

11.1-RELEASE-p7, kern.hz=200. Switching tickless mode on or off does not influence the matter. Starting the endless loop with "nice" does not influence the matter.

[1] A pure-I/O job without compute load, like "dd", does not show this behaviour. Also, when other tasks are running, the unjust behaviour is not so stongly pronounced. ```

---

### [aarch64 support added](https://mail-index.netbsd.org/port-arm/2018/04/01/msg004702.html) ###

>
>
> I have committed about adding initial support for aarch64.
>
>

* booting log on RaspberryPI3:

``` boot NetBSD/evbarm (aarch64) Drop to EL1...OK Creating VA=PA tables Creating KSEG tables Creating KVA=PA tables Creating devmap tables MMU Enable...OK VSTART = ffffffc000001ff4 FDT\<3ab46000\> devmap cpufunc bootstrap consinit ok uboot: args 0x3ab46000, 0, 0, 0

```
NetBSD/evbarm (fdt) booting ...
FDT /memory [0] @ 0x0 size 0x3b000000
MEM: add 0-3b000000
MEM: res 0-1000
MEM: res 3ab46000-3ab4a000
Usable memory:
  1000 - 3ab45fff
  3ab4a000 - 3affffff
initarm: kernel phys start 1000000 end 17bd000
MEM: res 1000000-17bd000
bootargs: root=axe0
  1000 - ffffff
  17bd000 - 3ab45fff
  3ab4a000 - 3affffff
------------------------------------------
kern_vtopdiff         = 0xffffffbfff000000
physical_start        = 0x0000000000001000
kernel_start_phys     = 0x0000000001000000
kernel_end_phys       = 0x00000000017bd000
physical_end          = 0x000000003ab45000
VM_MIN_KERNEL_ADDRESS = 0xffffffc000000000
kernel_start_l2       = 0xffffffc000000000
kernel_start          = 0xffffffc000000000
kernel_end            = 0xffffffc0007bd000
kernel_end_l2         = 0xffffffc000800000
(kernel va area)
(devmap va area)
VM_MAX_KERNEL_ADDRESS = 0xffffffffffe00000
------------------------------------------
Copyright (c) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005,
    2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017,
    2018 The NetBSD Foundation, Inc.  All rights reserved.
Copyright (c) 1982, 1986, 1989, 1991, 1993
    The Regents of the University of California.  All rights reserved.

NetBSD 8.99.14 (RPI64) #11: Fri Mar 30 12:34:19 JST 2018
        ryo@moveq:/usr/home/ryo/tmp/netbsd-src-ryo-wip/sys/arch/evbarm/compile/RPI64
total memory = 936 MB
avail memory = 877 MB

```

…

```
Starting local daemons:.
Updating motd.
Starting sshd.
Starting inetd.
Starting cron.
The following components reported failures:
    /etc/rc.d/swap2
See /var/run/rc.log for more information.
Fri Mar 30 12:35:31 JST 2018

NetBSD/evbarm (rpi3) (console)

login: root
Last login: Fri Mar 30 12:30:24 2018 on console

rpi3# uname -ap
NetBSD rpi3 8.99.14 NetBSD 8.99.14 (RPI64) #11: Fri Mar 30 12:34:19 JST 2018  ryo@moveq:/usr/home/ryo/tmp/netbsd-src-ryo-wip/sys/arch/evbarm/compile/RPI64 evbarm aarch64
rpi3#

```

```

>
>
> Now, multiuser mode works stably on fdt based boards (RPI3,SUNXI,TEGRA). But there are still some problems, more time is required for release. also SMP is not yet. See sys/arch/aarch64/aarch64/TODO for more detail. Especially the problems around TLS of rtld, and C++ stack unwindings are too difficult for me to solve, I give up and need someone's help (^o^)/ Since C++ doesn't work, ATF also doesn't work. If the ATF works, it will clarify more issues.
>
>
>
> sys/arch/evbarm64 is gone and integrated into sys/arch/evbarm. One evbarm/conf/GENERIC64 kernel binary supports all fdt (bcm2837,sunxi,tegra) based boards. While on 32bit, sys/arch/evbarm/conf/GENERIC will support all fdt based boards...but doesn't work yet. (WIP)
>
>
>
> My deepest appreciation goes to Tohru Nishimura (nisimura@) whose writes vector handlers, context switchings, and so on. and his comments and suggestions were innumerably valuable. I would also like to thank Nick Hudson (skrll@) and Jared McNeill (jmcneill@) whose added support FDT and integrated into evbarm. Finally, I would like to thank Matt Thomas (matt@) whose commited aarch64 toolchains and preliminary support for aarch64.
>
>

---

Beastie Bits
----------

* [5 Reasons to Use FreeBSD in 2018](https://www.youtube.com/watch?v=hvuWI5hzD5U)
* [Rewriting Intel gigabit network driver in Rust](https://twitter.com/johalun/status/983645780509712384)
* [Recruiting to make Elastic Search on FreeBSD better](https://twitter.com/DLangille/status/983360090240684034)
* [Windows Server 2019 Preview, in bhyve on FreeBSD](https://twitter.com/Tubsta/status/981058685219688448)
* [“SSH Mastery, 2nd ed” in hardcover](https://blather.michaelwlucas.com/archives/3126)

---

Feedback/Questions
----------

* Jason - [ZFS Transfer option](http://dpaste.com/0JN4V1K#wrap)
* Luis - [ZFS Pools](http://dpaste.com/3MH4QRF#wrap)
* [ClonOS ](https://clonos.tekroutine.com/)
* Michael - [Tech Conferences](http://dpaste.com/3MN5F74#wrap)
* anonymous - [BSD trash on removable drives](http://dpaste.com/18J24QJ#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---