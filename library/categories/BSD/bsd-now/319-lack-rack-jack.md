+++
title = "319: Lack Rack, Jack"
description = "Causing ZFS corruption for fun, NetBSD Assembly Programming Tutorial, The IKEA Lack Rack for Servers, a new OmniOS Community Edition LTS has been published, List Block Devices on FreeBSD lsblk(8) Style, Project Trident 19.10 available, and more.Headlines[Causing ZFS"
date = "2019-10-10T03:00:00Z"
url = "https://www.bsdnow.tv/319"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.597271048Z"
seen = false
+++

Causing ZFS corruption for fun, NetBSD Assembly Programming Tutorial, The IKEA Lack Rack for Servers, a new OmniOS Community Edition LTS has been published, List Block Devices on FreeBSD lsblk(8) Style, Project Trident 19.10 available, and more.

Headlines
----------

### [Causing ZFS corruption for fun and profit](https://datto.engineering/post/causing-zfs-corruption) ###

>
>
> Datto backs up data, a lot of it. At the time of writing Datto has over 500 PB of data stored on ZFS. This count includes both backup appliances that are sent to customer sites, as well as cloud storage servers that are used for secondary and tertiary backup of those appliances. At this scale drive swaps are a daily occurrence, and data corruption is inevitable. How we handle this corruption when it happens determines whether we truly lose data, or successfully restore from secondary backup. In this post we'll be showing you how at Datto we intentionally cause corruption in our testing environments, to ensure we're building software that can properly handle these scenarios.
>
>

* Causing Corruption

>
>
> Since this is a mirror setup, a naive solution to cause corruption would be to randomly dd the same sectors of both /dev/sdb and /dev/sdc. This works, but is equally likely to just overwrite random unused space, or take down the zpool entirely. What we really want is to corrupt a specific snapshot, or even a specific file in that snapshot, to simulate a more realistic minor corruption event. Luckily we have a tool called zdb that lets us view some low level information about datasets.
>
>

* Conclusion

>
>
> At the 500 PB scale, it's not a matter of if data corruption will happen but when. Intentionally causing corruption is one of the strategies we use to ensure we're building software that can handle these rare (but inevitable) events.
>
>
>
> To others out there using ZFS: I'm curious to hear how you've solved this problem. We did quite a bit of experimentation with zinject before going with this more brute force method. So I'd be especially interested if you've had luck simply simulating corruption with zinject.
>
>

---

### [NetBSD Assembly Programming Tutorial](https://polprog.net/blog/netbsdasmprog/) ###

>
>
> A sparc64 version is also being prepared and will be added when done
>
>
>
> This post describes how to write a simple hello world program in pure assembly on NetBSD/amd64. We will not use (nor link against) libc, nor use gcc to compile it. I will be using GNU as (gas), and therefore the AT&T syntax instead of Intel.
>
>

* Why assembly?

>
>
> Why not? Because it's fun to program in assembly directly. Contrary to a popular belief assembly programs aren't always faster than what optimizing compilers produce. Nevertheless it's good to be able to read assembly, especially when debugging C programs
>
>

* Due to the nature of the guide, visit the site for the complete breakdown

---

News Roundup
----------

### [The IKEA Lack Rack for Servers](https://wiki.eth0.nl/index.php/LackRack) ###

* The LackRack

>
>
> First occurrence on eth0:2010 Winterlan, the LackRack is the ultimate, low-cost, high shininess solution for your modular datacenter-in-the-living-room. Featuring the LACK (side table) from Ikea, the LackRack is an easy-to-implement, exact-fit datacenter building block. It's a little known fact that we have seen Google engineers tinker with Lack tables since way back in 2009.
>
>
>
> The LackRack will certainly make its appearance again this summer at eth0:2010 Summer.
>
>

* Summary

>
>
> When temporarily not in use, multiple LackRacks can be stacked in a space-efficient way without disassembly, unlike competing 19" server racks.
>
>
>
> The LackRack was first seen on eth0:2010 Winterlan in the no-shoe Lounge area. Its low-cost and perfect fit are great for mounting up to 8 U of 19" hardware, such as switches (see below), or perhaps other 19" gear. It's very easy to assemble, and thanks to the design, they are stable enough to hold (for example) 19" switches and you can put your bottle of Club-Mate on top! Multi-shiny LackRack can also be painted to your specific preferences and the airflow is unprecedented!
>
>

* Howto

>
>
> You can find a howto on buying a LackRack on this page. This includes the proof that a 19" switch can indeed be placed in the LackRack in its natural habitat!
>
>

---

### [OmniOS Community Edition r151030 LTS - Published at May 6, 2019](https://omniosce.org/article/release-030) ###

>
>
> The OmniOS Community Edition Association is proud to announce the general availability of OmniOS - r151030.
>
>
>
> OmniOS is published according to a 6-month release cycle, r151030 LTS takes over from r151028, published in November 2018; and since it is a LTS release it also takes over from r151022. The r151030 LTS release will be supported for 3 Years. It is the first LTS release published by the OmniOS CE Association since taking over the reins from OmniTI in 2017. The next LTS release is scheduled for May 2021. The old stable r151026 release is now end-of-life. See the release schedule for further details.
>
>
>
> This is only a small selection of the new features, and bug fixes in the new release; review the release notes for full details.
>
>
>
> If you upgrade from r22 and want to see all new features added since then, make sure to also read the release notes for r24, r26 and r28.
>
>

* For full relase notes including upgrade instructions;
* [release notes](https://omniosce.org/releasenotes.html)
* [upgrade instructions](https://omniosce.org/upgrade.html)

---

### [List Block Devices on FreeBSD lsblk(8) Style](https://vermaden.wordpress.com/2019/09/27/list-block-devices-on-freebsd-lsblk8-style/) ###

>
>
> When I have to work on Linux systems I usually miss many nice FreeBSD tools such as these for example to name the few: sockstat, gstat, top -b -o res, top -m io -o total, usbconfig, rcorder, beadm/bectl, idprio/rtprio,… but sometimes – which rarely happens – Linux has some very useful tool that is not available on FreeBSD. An example of such tool is lsblk(8) that does one thing and does it quite well – lists block devices and their contents. It has some problems like listing a disk that is entirely used under ZFS pool on which lsblk(8) displays two partitions instead of information about ZFS just being there – but we all know how much in some circles the CDDL licensed ZFS is unloved in that GPL world.
>
>

Example lsblk(8) output from Linux system:

```
$ lsblk
NAME                         MAJ:MIN RM   SIZE RO TYPE   MOUNTPOINT
sr0                           11:0    1  1024M  0 rom
sda                            8:0    0 931.5G  0 disk
|-sda1                         8:1    0   500M  0 part   /boot
`-sda2                         8:2    0   931G  0 part
  |-vg_local-lv_root (dm-0)  253:0    0    50G  0 lvm    /
  |-vg_local-lv_swap (dm-1)  253:1    0  17.7G  0 lvm    [SWAP]
  `-vg_local-lv_home (dm-2)  253:2    0   1.8T  0 lvm    /home
sdc                            8:32   0 232.9G  0 disk
`-sdc1                         8:33   0 232.9G  0 part
  `-md1                        9:1    0 232.9G  0 raid10 /data
sdd                            8:48   0 232.9G  0 disk
`-sdd1                         8:49   0 232.9G  0 part
  `-md1                        9:1    0 232.9G  0 raid10 /data

```

>
>
> What FreeBSD offers in this department? The camcontrol(8) and geom(8) commands are available. You can also use gpart(8) command to list partitions. Below you will find output of these commands from my single disk laptop. Please note that because of WordPress limitations I need to change all \> \< characters to ] [ ones in the commands outputs.
>
>

* See the article for the rest of the guide

---

### [Project Trident 19.10 Now Available](https://project-trident.org/post/2019-10-05_19.10_available/) ###

>
>
> This is a general package update to the CURRENT release repository based upon TrueOS 19.10
>
>

* PACKAGE CHANGES FROM 19.08
  * New Packages: 601
  * Deleted Packages: 165
  * Updated Packages: 3341

---

Beastie Bits
----------

* [NetBSD building tools](https://imgur.com/gallery/0sG4b1K)
* [Sponsorships open for SNMP Mastery](https://mwl.io/archives/4569)
* [pkgsrc-2019Q3 release announcement (2019-10-03)](http://mail-index.netbsd.org/pkgsrc-users/2019/10/03/msg029485.html)
* [pfetch - A simple system information tool written in POSIX sh](https://github.com/dylanaraps/pfetch)
* [Taking NetBSD kernel bug roast to the next level: Kernel Fuzzers (quick A.D. 2019 overview)](https://netbsd.org/~kamil/eurobsdcon2019_fuzzing/presentation.html#slide1)
* [Cracking Ken Thomson’s password](https://leahneukirchen.org/blog/archive/2019/10/ken-thompson-s-unix-password.html)

---

Feedback/Questions
----------

* Evilham - [Couple Questions](http://dpaste.com/2JC85WV)
* Rob - [APU2 alternatives and GPT partition types](http://dpaste.com/0SDX9ZX)
* Tom - [FreeBSD journal article by A. Fengler](http://dpaste.com/2B43MY1#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.