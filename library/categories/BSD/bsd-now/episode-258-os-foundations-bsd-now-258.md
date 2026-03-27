+++
title = "Episode 258: OS Foundations | BSD Now 258"
description = 'FreeBSD Foundation July Newsletter, a bunch of BSDCan trip reports, HardenedBSD Foundation status, FreeBSD and OSPFd, ZFS disk structure overview, and more Spectre mitigations in OpenBSD.\Headlines   \[FreeBSD Foundation Update, July 2018](https://www.freebsdfoundation.org/n'
date = "2018-08-08T05:00:00Z"
url = "https://www.bsdnow.tv/258"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.724581290Z"
seen = false
+++

FreeBSD Foundation July Newsletter, a bunch of BSDCan trip reports, HardenedBSD Foundation status, FreeBSD and OSPFd, ZFS disk structure overview, and more Spectre mitigations in OpenBSD.

\##Headlines  
 \###[FreeBSD Foundation Update, July 2018](https://www.freebsdfoundation.org/news-and-events/newsletter/freebsd-foundation-update-july-2018/)

* MESSAGE FROM THE EXECUTIVE DIRECTOR

>
>
> We’re in the middle of summer here, in Boulder, CO. While the days are typically hot, they can also be quite unpredictable. Thanks to the Rocky Mountains, waking up to 50-degree (\~10 C) foggy weather is not surprising. In spite of the unpredictable weather, many of us took some vacation this month. Whether it was extending the Fourth of July celebration, spending time with family, or relaxing and enjoying the summer weather, we appreciated our time off, while still managing to accomplish a lot!  
>  In this newsletter, Glen Barber enlightens us about the upcoming 12.0 release. I gave a recap of OSCON, that Ed Maste and I attended, and Mark Johnston explains the work on his improved microcode loading project, that we are funding. Finally, Anne Dickison gives us a rundown on upcoming events and information on submitting a talk for MeetBSD.  
>  Your support helps us continue this work. Please consider making a donation today. We can’t do it without you. Happy reading!!
>
>

* June 2018 Development Projects Update
* Fundraising Update: Supporting the Project
* July 2018 Release Engineering Update
* OSCON 2018 Recap
* Submit Your Work: MeetBSD 2018
* FreeBSD Discount for 2018 SNIA Developer Conference
* EuroBSDcon 2018 Travel Grant Application Deadline: August 2

---

**iXsystems**

\###BSDCan Trip Reports

* [BSDCan 2018 Trip Report: Constantin Stan](https://www.freebsdfoundation.org/blog/bsdcan-2018-trip-report-constantin-stan/)
* [BSDCan 2018 Trip Report: Danilo G. Baio](https://www.freebsdfoundation.org/blog/bsdcan-2018-trip-report-danilo-g-baio/)
* [BSDCan 2018 Trip Report: Rodrigo Osorio](https://www.freebsdfoundation.org/blog/bsdcan-2018-trip-report-rodrigo-osorio/)
* [BSDCan 2018 Trip Report: Dhananjay Balan](https://www.freebsdfoundation.org/blog/bsdcan-2018-trip-report-dhananjay-balan/)
* [BSDCan 2018 Trip Report: Kyle Evans](https://www.freebsdfoundation.org/blog/bsdcan-2018-trip-report-kyle-evans/)

---

\##News Roundup  
 \###[FreeBSD and OSPFd](https://blog.haraschak.com/freebsd-and-ospfd/)

>
>
> With FreeBSD jails deployed around the world, static routing was getting a bit out of hand. Plus, when I needed to move a jail from one data center to another, I would have to update routing tables across multiple sites. Not ideal. Enter dynamic routing…
>
>

>
>
> OSPF (open shortest path first) is an internal dynamic routing protocol that provides the autonomy that I needed and it’s fairly easy to setup. This article does not cover configuration of VPN links, ZFS, or Freebsd jails, however it’s recommended that you use seperate ZFS datasets per jail so that migration between hosts can be done with zfs send & receive.
>
>

>
>
> In this scenario, we have five FreeBSD servers in two different data centers. Each physical server runs anywhere between three to ten jails. When jails are deployed, they are assigned a /32 IP on lo2. From here, pf handles inbound port forwarding and outbound NAT. Links between each server are provided by OpenVPN TAP interfaces. (I used TAP to pass layer 2 traffic. I seem to remember that I needed TAP interfaces due to needing GRE tunnels on top of TUN interfaces to get OSPF to communicate. I’ve heard TAP is slower than TUN so I may revisit this.)
>
>

>
>
> In this example, we will use 172.16.2.0/24 as the range for OpenVPN P2P links and 172.16.3.0/24 as the range of IPs available for assignment to each jail. Previously, when deploying a jail, I assigned IPs based on the following groups:
>
>

`Server 1: 172.16.3.0/28`  
`Server 2: 172.16.3.16/28`  
`Server 3: 172.16.3.32/28`  
`Server 4: 172.16.3.48/28`  
`Server 5: 172.16.3.64/28`

>
>
> When statically routing, this made routing tables a bit smaller and easier to manage. However, when I needed to migrate a jail to a new host, I had to add a new /32 to all routing tables. Now, with OSPF, this is no longer an issue, nor is it required.
>
>

* To get started, first we install the Quagga package.

* The two configuration files needed to get OSPFv2 running are /usr/local/etc/quagga/zebra.conf and /usr/local/etc/quagga/ospfd.conf.

* Starting with zebra.conf, we’ll define the hostname and a management password.

* Second, we will populate the ospfd.conf file.

* To break this down:

* service advanced-vty allows you to skip the en or enable command. Since I’m the only one who uses this service, it’s one less command to type.

* ip ospf authentication message-digest and ip ospf message-diget-key… ignores non-authenticated OSPF communication. This is useful when communicating over the WAN and to prevent a replay attack. Since I’m using a VPN to communicate, I could exclude these.

* passive-interface default turns off the active communication of OSPF messages on all interfaces except for the interfaces listed as no passive-interface [interface name]. Since my ospf communication needs to leverage the VPNs, this prevents the servers from trying to send ospf data out the WAN interface (a firewall would work too).

* network 172.16.2.0/23 area 0.0.0.0 lists a supernet of both 172.16.2.0/24 and 172.16.3.0/24. This ensures routes for the jails are advertised along with the P2P links used by OpenVPN. The OpenVPN links are not required but can provide another IP to access your server if one of the links goes down. (See the suggested tasks below).

* At this point, we can enable the services in rc.conf.local and start them.

* We bind the management interface to 127.0.0.1 so that it’s only accessable to local telnet sessions. If you want to access this service remotely, you can bind to a remotely accessable IP. Remember telnet is not secure. If you need remote access, use a VPN.

* To manage the services, you can telnet to your host’s localhost address.

* Use 2604 for the ospf service.

* Remember, this is accessible by non-root users so set a good password.

---

\###[A broad overview of how ZFS is structured on disk](https://utcc.utoronto.ca/~cks/space/blog/solaris/ZFSBroadDiskStructure)

>
>
> When I wrote yesterday’s entry, it became clear that I didn’t understand as much about how ZFS is structured on disk (and that this matters, since I thought that ZFS copy on write updates updated a lot more than they do). So today I want to write down my new broad understanding of how this works. (All of this can be dug out of the old, draft ZFS on-disk format specification, but that spec is written in a very detailed way and things aren’t always immediately clear from it.)
>
>

>
>
> Almost everything in ZFS is in DMU object. All objects are defined by a dnode, and object dnodes are almost always grouped together in an object set. Object sets are themselves DMU objects; they store dnodes as basically a giant array in a ‘file’, which uses data blocks and indirect blocks and so on, just like anything else. Within a single object set, dnodes have an object number, which is the index of their position in the object set’s array of dnodes. (Because an object number is just the index of the object’s dnode in its object set’s array of dnodes, object numbers are basically always going to be duplicated between object sets (and they’re always relative to an object set). For instance, pretty much every object set is going to have an object number ten, although not all object sets may have enough objects that they have an object number ten thousand. One corollary of this is that if you ask zdb to tell you about a given object number, you have to tell zdb what object set you’re talking about. Usually you do this by telling zdb which ZFS filesystem or dataset you mean.)
>
>

>
>
> Each ZFS filesystem has its own object set for objects (and thus dnodes) used in the filesystem. As I discovered yesterday, every ZFS filesystem has a directory hierarchy and it may go many levels deep, but all of this directory hierarchy refers to directories and files using their object number.
>
>

>
>
> ZFS organizes and keeps track of filesystems, clones, and snapshots through the DSL (Dataset and Snapshot Layer). The DSL has all sorts of things; DSL directories, DSL datasets, and so on, all of which are objects and many of which refer to object sets (for example, every ZFS filesystem must refer to its current object set somehow). All of these DSL objects are themselves stored as dnodes in another object set, the Meta Object Set, which the uberblock points to. To my surprise, object sets are not stored in the MOS (and as a result do not have ‘object numbers’). Object sets are always referred to directly, without indirection, using a block pointer to the object set’s dnode. (I think object sets are referred to directly so that snapshots can freeze their object set very simply.)
>
>

>
>
> The DSL directories and datasets for your pool’s set of filesystems form a tree themselves (each filesystem has a DSL directory and at least one DSL dataset). However, just like in ZFS filesystems, all of the objects in this second tree refer to each other indirectly, by their MOS object number. Just as with files in ZFS filesystems, this level of indirection limits the amount of copy on write updates that ZFS had to do when something changes.
>
>

>
>
> PS: If you want to examine MOS objects with zdb, I think you do it with something like ‘zdb -vvv -d ssddata 1’, which will get you object number 1 of the MOS, which is the MOS object directory. If you want to ask zdb about an object in the pool’s root filesystem, use ‘zdb -vvv -d ssddata/ 1’. You can tell which one you’re getting depending on what zdb prints out. If it says ‘Dataset mos [META]’ you’re looking at objects from the MOS; if it says ‘Dataset ssddata [ZPL]’, you’re looking at the pool’s root filesystem (where object number 1 is the ZFS master node).
>
>

>
>
> PPS: I was going to write up what changed on a filesystem write, but then I realized that I didn’t know how blocks being allocated and freed are reflected in pool structures. So I’ll just say that I think that ignoring free space management, only four DMU objects get updated; the file itself, the filesystem’s object set, the filesystem’s DSL dataset object, and the MOS.
>
>

* (As usual, doing the research to write this up taught me things that I didn’t know about ZFS.)

---

**Digital Ocean**

\###[HardenedBSD Foundation Status](https://hardenedbsd.org/article/shawn-webb/2018-07-11/mid-july-hardenedbsd-foundation-status)

>
>
> On 09 July 2018, the HardenedBSD Foundation Board of Directors held the kick-off meeting to start organizing the Foundation. The following people attended the kick-off meeting:
>
>

* 1. Shawn Webb (in person)

* 1. George Saylor (in person)

* 1. Ben Welch (in person)

* 1. Virginia Suydan (in person)

* 1. Ben La Monica (phone)

* 1. Dean Freeman (phone)

* 1. Christian Severt (phone)

>
>
> We discussed the very first steps that need to be taken to organize the HardenedBSD Foundation as a 501©(3) not-for-profit organization in the US. We determined we could file a 1023EZ instead of the full-blown 1023. This will help speed the process up drastically.
>
>

* The steps are laid out as follows:
* Register a Post Office Box (PO Box) (completed on 10 Jul 2018).
* Register The HardenedBSD Foundation as a tax-exempt nonstock corporation in the state of Maryland (started on 10 Jul 2018, submitted on 18 Jul 2018, granted 20 Jul 2018).
* Obtain a federal tax ID (obtained 20 Jul 2018).
* Close the current bank account and create a new one using the federal tax ID (completed on 20 Jul 2018).
* File the 1023EZ paperwork with the federal government (started on 20 Jul 2018).
* Hire an attorney to help draft the organization bylaws.
* Each of the steps must be done serially and in order.

>
>
> We added Christian Severt, who is on Emerald Onion’s Board of Directors, to the HardenedBSD Foundation Board of Directors as an advisor. He was foundational in getting Emerald Onion their 501©(3) tax-exempt, not-for-profit status and has really good insight. Additionally, he’s going to help HardenedBSD coordinate hosting services, figuring out the best deals for us.
>
>

>
>
> We promoted George Saylor to Vice President and changed Shawn Webb’s title to President and Director. This is to help resolve potential concerns both the state and federal agencies might have with an organization having only a single President role.
>
>

>
>
> We hope to be granted our 501©(3) status before the end of the year, though that may be subject to change. We are excited for the formation of the HardenedBSD Foundation, which will open up new opportunities not otherwise available to HardenedBSD.
>
>

---

\###[More mitigations against speculative execution vulnerabilities](https://undeadly.org/cgi?action=article;sid=20180724072257)

>
>
> Philip Guenther (guenther@) and Bryan Steele (brynet@) have added more mitigations against speculative execution CPU vulnerabilities on the amd64 platform.
>
>

```

CVSROOT:    /cvs
Module name:    src
Changes by: guenther@cvs.openbsd.org    2018/07/23 11:54:04

Modified files:
    sys/arch/amd64/amd64: locore.S
    sys/arch/amd64/include: asm.h cpufunc.h frameasm.h

Log message:
Do "Return stack refilling", based on the "Return stack underflow" discussion
and its associated appendix at https://support.google.com/faqs/answer/7625886
This should address at least some cases of "SpectreRSB" and earlier
Spectre variants; more commits to follow.

The refilling is done in the enter-kernel-from-userspace and
return-to-userspace-from-kernel paths, making sure to do it before
unblocking interrupts so that a successive interrupt can't get the
CPU to C code without doing this refill.  Per the link above, it
also does it immediately after mwait, apparently in case the low-power
CPU states of idle-via-mwait flush the RSB.

ok mlarkin@ deraadt@```

+ and:

```CVSROOT: /cvs
Module name:    src
Changes by: guenther@cvs.openbsd.org    2018/07/23 20:42:25

Modified files:
    sys/arch/amd64/amd64: locore.S vector.S vmm_support.S
    sys/arch/amd64/include: asm.h cpufunc.h

Log message:
Also do RSB refilling when context switching, after vmexits, and
when vmlaunch or vmresume fails.

Follow the lead of clang and the intel recommendation and do an lfence
after the pause in the speculation-stop path for retpoline, RSB refill,
and meltover ASM bits.

ok kettenis@ deraadt@```

+ "Mitigation G-2" for AMD processors:

```CVSROOT: /cvs
Module name:    src
Changes by: brynet@cvs.openbsd.org  2018/07/23 17:25:03

Modified files:
    sys/arch/amd64/amd64: identcpu.c
    sys/arch/amd64/include: specialreg.h

Log message:
Add "Mitigation G-2" per AMD's Whitepaper "Software Techniques for
Managing Speculation on AMD Processors"

By setting MSR C001_1029[1]=1, LFENCE becomes a dispatch serializing
instruction.

Tested on AMD FX-4100 "Bulldozer", and Linux guest in SVM vmd(8)

ok deraadt@ mlarkin@```
***

##Beastie Bits
+ [HardenedBSD will stop supporting 10-STABLE on 10 August 2018](https://groups.google.com/a/hardenedbsd.org/forum/#!topic/users/xvU0g-g1l5U)
+ [GSoC 2018 Reports: Integrate libFuzzer with the Basesystem, Part 2](https://blog.netbsd.org/tnf/entry/gsoc_2018_reports_integrate_libfuzzer1)
+ [ZFS Boot Environments at PBUG](https://vermaden.wordpress.com/2018/07/30/zfs-boot-environments-at-pbug/)
+ [Second Editions versus the Publishing Business](https://blather.michaelwlucas.com/archives/3229)
+ [Theo de Raadt on "unveil(2) usage in base"](https://undeadly.org/cgi?action=article;sid=20180728063716)
+ [rtadvd(8) has been replaced by rad(8)](https://undeadly.org/cgi?action=article;sid=20180724072205)
+ [BSD Users Stockholm Meetup #3](https://www.meetup.com/BSD-Users-Stockholm/events/253447019/)
+ [Changes to NetBSD release support policy](https://blog.netbsd.org/tnf/entry/changes_to_netbsd_release_support)
+ [The future of HAMMER1](http://lists.dragonflybsd.org/pipermail/users/2018-July/357832.html)
***

**Tarsnap**

##Feedback/Questions
+ Rodriguez - [A Question](http://dpaste.com/0Y1B75Q#wrap)
+ Shane - [About ZFS Mostly](http://dpaste.com/32YGNBY#wrap)
+ Leif - [ZFS less than 8gb](http://dpaste.com/2GY6HHC#wrap)
+ Wayne - [ZFS vs EMC](http://dpaste.com/17PSCXC#wrap)
***

- Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

```