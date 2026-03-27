+++
title = "203: For the love of ZFS"
description = "This week on BSD Now, we clear up some ZFS FUD, show you how to write a NetBSD kernel module, and cover DragonflyBSD on the desktop.This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems.com/"
date = "2017-07-19T12:00:00Z"
url = "https://www.bsdnow.tv/203"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.874259026Z"
seen = false
+++

This week on BSD Now, we clear up some ZFS FUD, show you how to write a NetBSD kernel module, and cover DragonflyBSD on the desktop.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [ZFS is the best file system (for now)](http://blog.fosketts.net/2017/07/10/zfs-best-filesystem-now/) ###

* In my ongoing effort to fight misinformation and FUD about ZFS, I would like to go through this post in detail and share my thoughts on the current state and future of OpenZFS.
* The post starts with:

>
>
> ZFS should have been great, but I kind of hate it: ZFS seems to be trapped in the past, before it was sidelined it as the cool storage project of choice; it’s inflexible; it lacks modern flash integration; and it’s not directly supported by most operating systems. But I put all my valuable data on ZFS because it simply offers the best level of data protection in a small office/home office (SOHO) environment. Here’s why.  
>  When ZFS first appeared in 2005, it was absolutely with the times, but it’s remained stuck there ever since. The ZFS engineers did a lot right when they combined the best features of a volume manager with a “zettabyte-scale” filesystem in Solaris 10  
>  The skies first darkened in 2007, as NetApp sued Sun, claiming that their WAFL patents were infringed by ZFS. Sun counter-sued later that year, and the legal issues dragged on.
>
>

* The lawsuit was resolved, and it didn’t really impede ZFS. Some say it is the reason that Apple didn’t go with ZFS, but there are other theories too.

>
>
> By then, Sun was hitting hard times and Oracle swooped in to purchase the company. This sowed further doubt about the future of ZFS, since Oracle did not enjoy wide support from open source advocates.
>
>

* Yes, Oracle taking over Sun and closing the source for ZFS definitely seemed like a setback at the time, but the OpenZFS project was started and active development has continued as an ever increasing pace. As of today, more than half of the code in OpenZFS has been written since the fork from the last open version of Oracle ZFS.

>
>
> the CDDL license Sun applied to the ZFS code was [[https://sfconservancy.org/blog/2016/feb/25/zfs-and-linux/](judged](https://sfconservancy.org/blog/2016/feb/25/zfs-and-linux/](judged) incompatible) with the GPLv2 that covers Linux, making it a non-starter for inclusion in the world’s server operating system.
>
>

* That hasn’t stopped the ZFS-on-Linux project, or Ubuntu…

>
>
> Although OpenSolaris continued after the Oracle acquisition, and FreeBSD embraced ZFS, this was pretty much the extent of its impact outside the enterprise. Sure, NexentaStor and [[http://blog.fosketts.net/2008/09/15/greenbytes-embraces-extends-zfs/](GreenBytes)](http://blog.fosketts.net/2008/09/15/greenbytes-embraces-extends-zfs/](GreenBytes)) helped push ZFS forward in the enterprise, but Oracle’s lackluster commitment to Sun in the datacenter started having an impact.
>
>

* Lots of companies have adopted OpenZFS for their products. Before OpenZFS, there were very few non-Sun appliances that used ZFS, now there are plenty.
* [OpenZFS Wiki: Companies with products based on OpenZFS](http://open-zfs.org/wiki/Companies)

>
>
> OpenZFS remains little-changed from what we had a decade ago.
>
>

* Other than the fact that half of the current code did not exist a decade ago…

>
>
> Many remain skeptical of deduplication, which hogs expensive RAM in the best-case scenario.
>
>

* This is one of the weaker points in ZFS. As it turns out, the demand for deduplication is actually not that strong. Most of the win can be had with transparent compression.
* However, there are a number of suggested designs to work around the dedup problems:
  * Dedup Ceiling: Set a limit on the side of the DDT and just stop deduping new unique blocks when this limit is reached.
  * Allocation Classes: A feature being developed by Intel for a supercomputer, will allow different types of data to be classified, and dedicated vdevs (or even metaslabs within a vdev), to be dedicated to that class of data. This could be extended to having the DDT live on a fast device like an PCIe NVMe, combined with the Dedup Ceiling when the device is full.
  * DDT Pruning: Matt Ahrens described a design where items in the DDT with only a single reference, would be expired in an LRU type fashion, to allow newer blocks to live in the DDT in hopes that they would end up with more than a single reference. This doesn’t cause bookkeeping problems since when a block is about to be freed, if it is NOT listed in the DDT, ZFS knows it was never deduplicated, so the current block must be the only reference, and it can safely be freed. This provides a best case scenario compared to Dedup Ceiling, since blocks that will deduplicate well, are likely to be written relatively close together, whereas the chance to a dedup match on a very old block is much lower.

>
>
> And I do mean expensive: Pretty much every ZFS FAQ flatly declares that ECC RAM is a must-have and 8 GB is the bare minimum. In my own experience with FreeNAS, 32 GB is a nice amount for an active small ZFS server, and this costs $200-$300 even at today’s prices.
>
>

* As we talked about a few weeks ago, ECC is best, but it is not required. If you want your server to stay up for a long time, to be highly available, you’ll put ECC in it. Don’t let a lack of ECC stop you from using ZFS, you are just putting your data at more risk. The scrub of death is a myth.
* ZFS does not ‘require’ lots of ram. Your NAS will work happily with 8 GB instead of 32 GB of RAM. Its cache hit ratio will be much lower, so performance will be worse. It won’t be able to buffer as many writes, so performance will be worse.
* Copy-on-Write has some drawbacks, data tends to get scattered and fragmented across the drives when it is written gradually. The ARC (RAM Cache) lessens the pain of this, and allows ZFS to batch incoming writes up into nice contiguous writes. ZFS purposely alternates between reading and writing, since both are faster when the other is not happening. So writes are batched up until there is too much dirty data, or the timeout expires. Then reads are held off while the bulk linear write finishes as quickly as possible, and reads are resumed.
* Obviously all of this works better and more efficiently in larger batches, which you can do if you have more RAM.
* ZFS can be tuned to use less RAM, and if you do not have a lot of RAM, or you have a lot of other demand on your RAM, you should do that tuning.

>
>
> And ZFS never really adapted to today’s world of widely-available flash storage: Although flash can be used to support the ZIL and L2ARC caches, these are of dubious value in a system with sufficient RAM, and ZFS has no true hybrid storage capability. It’s laughable that the ZFS documentation obsesses over a few GB of SLC flash when multi-TB 3D NAND drives are on the market. And no one is talking about NVMe even though it’s everywhere in performance PC’s.
>
>

* Make up your mind, is 32GB of ram too expensive or not…
* the L2ARC exists specifically for the case where it is not possible to just install more RAM. Be it because there are no more slots, of limits of the processor, or limits of your budget.
* The SLOG is optional, but it never needs to be very big. A number of GBs of SLC flash is all you need, it is only holding writes that have not been flushed to the regular storage devices yet. The reason the documentation talks about SLC specifically is because your SLOG needs a very high write endurance, something never the newest NVMe devices cannot yet provide.
* Of course you can use NVMe devices with ZFS, lots of people do. All flash ZFS arrays are for sale right now. Other than maybe a little tuning of the device queue depths, ZFS just works and there is nothing to think about.
* However, to say there is nothing happening in this space is woefully inaccurate.
* The previously mentioned allocation classes code can be used to allocate metadata (4 KB blocks) on SSD or NVMe, while allocating bulk storage data (up to 16 MB blocks) on spinning disks. Extended a bit beyond what Intel is building for their super computer, this will basically create hybrid storage for ZFS.
* With the metaslab classes feature, it will even be possible to mix classes on the same device, grouping small allocations and large allocations in different areas, decreasing fragmentation.

>
>
> Then there’s the question of flexibility, or lack thereof. Once you build a ZFS volume, it’s pretty much fixed for life. There are only three ways to expand a storage pool:
>
>
>
> 1. Replace each and every drive in the pool with a larger one (which is great but limiting and expensive)
>
>

* It depends on your pool layout. If you design with this in mind using ZFS Mirrors, it can be quite useful

>
>
> 1. Add a stripe on another set of drives (which can lead to imbalanced performance and redundancy and a whole world of potential stupid stuff)
>
>

* The unbalanced LUNs performance issues were sorted out in 2013-2016.
* [2014: OpenZFS Allocation Performance ](http://open-zfs.org/w/images/3/31/Performance-George_Wilson.pdf)
* [2016: OpenZFS space allocation: doubling performance on large and fragmented pools](http://www.bsdcan.org/2016/schedule/events/710.en.html)
* These also mostly solved the performance issues when a pool gets full, you can run a lot closer to the edge now

>
>
> 1. Build a new pool and “zfs send” your datasets to it (which is what I do, even though it’s kind of tricky)
>
>

* This is one way to do it, yes.
* There is another way coming, but I can’t talk about it just yet. Look for big news later this year.

>
>
> Apart from option 3 above, you can’t shrink a ZFS pool.
>
>

* Device removal is arriving now. It will not work for RAIDZ\*, but for Mirrors and Stripes you will be able to remove a device.

>
>
> I’ve probably made ZFS sound pretty unappealing right about now. It was revolutionary but now it’s startlingly limiting and out of touch with the present solid-state-dominated storage world.
>
>

* I don’t feel like ZFS is out of touch with solid state. Lots of people are running SSD only pools. I will admit the tiered storage options in ZFS are a bit limited still, but there is a lot of work being done to overcome this.

>
>
> After all, reliably storing data is the only thing a storage system really has to do. All my important data goes on ZFS, from photos to music and movies to office files. It’s going to be a long time before I trust anything other than ZFS!
>
>
>
> * I agree.
> * ZFS has a great track record of doing its most important job, keeping your data safe.
> * Work is ongoing to make ZFS more performance, and more flexible. The import thing is that this work is never allowed to compromise job #1, keeping your data safe.
> * Hybrid/tiered storage features, re-RAID-ing, are coming
> * There is a lot going on with OpenZFS, check out the notes from the last two OpenZFS Developer Summits just to get an idea of what some of those things are:
>
>

[2015](http://open-zfs.org/wiki/OpenZFS_Developer_Summit_2015) & [2016](http://open-zfs.org/wiki/OpenZFS_Developer_Summit_2016)

* Some highlights:

  * Compressed ARC
  * Compressed send/recv
  * ABD (arc buf scatter/gather)
  * ZFS Native Encryption (scrub/resilver, send/recv, etc without encryption keys loaded)
  * Channel Programs (do many administrative operations as one atomic transaction)
  * Device Removal
  * Redacted send/recv
  * ZStandard Compression
  * TRIM Support (FreeBSD has its own, but this will be more performant and universal)
  * [Faster Scrub/Resilver](https://youtu.be/SZFwv8BdBj4)
  * [Declustered RAID](https://youtu.be/MxKohtFSB4M)
  * [Allocation Classes](https://youtu.be/28fKiTWb2oM)
  * Multi-mount protection (for Active/Passive failover)
  * Zpool Checkpoint (undo almost anything)
  * Even more Improved Allocator Performance
  * vdev spacemap log
  * ZIL performance improvements (w/ or w/o SLOG)
  * Persistent L2ARC

* What I don’t think the author of this article understands is how far behind every other filesystem is. 100s of Engineer years have gone into OpenZFS, and the pace is accelerating. I don’t see how BtrFS can ever catch up, without a huge cash infusion.

  ---

### [Writing a NetBSD kernel module](https://saurvs.github.io/post/writing-netbsd-kern-mod/) ###

>
>
> Kernel modules are object files used to extend an operating system’s kernel functionality at run time.  
>  In this post, we’ll look at implementing a simple character device driver as a kernel module in NetBSD. Once it is loaded, userspace processes will be able to write an arbitrary byte string to the device, and on every successive read expect a cryptographically-secure pseudorandom permutation of the original byte string.
>
>

* You will need the NetBSD Source Code.
  * [This doc](https://www.netbsd.org/docs/guide/en/chap-fetch.html) will explain how you can get it.

* The article gives an easy line by line walkthrough which is easy to follow and understand.
* The driver implements the bare minimum: open, close, read, and write, plus the module initialization function
* It explains the differences in how memory is allocated and freed in the kernel
* It also describes the process of using UIO to copy data back and forth between userspace and the kernel
* Create a Makefile, and compile the kernel module
* Then, create a simple userspace program to use the character device that the kernel module creates
* [All the code is available here](https://github.com/saurvs/rperm-netbsd) \*\*\*

### [DragonFlyBSD Desktop!](https://functionallyparanoid.com/2017/07/11/dragonflybsd-desktop/) ###

>
>
> If you read my [last post](https://functionallyparanoid.com/2017/06/30/boot-all-the-things/), you know that I set up a machine (Thinkpad x230) with UEFI and four operating systems on it. One, I had no experience with – DragonFlyBSD (other than using Matthew Dillon’s C compiler for the Amiga back in the day!) and so it was uncharted territory for me. After getting the install working, I started playing around inside of DragonFlyBSD and discovered to my delight that it was a great operating system with some really unique features – all with that BSD commitment to good documentation and a solid coupling of kernel and userland that doesn’t exist (by design) in Linux.  
>  So my goal for my DragonFlyBSD desktop experience was to be as BSD as I possibly could. Given that (and since I’m the maintainer of the port on OpenBSD ), I went with Lumina as the desktop environment and XDM as the graphical login manager. I have to confess that I really like the xfce terminal application so I wanted to make sure I had that as well. Toss in Firefox, libreOffice and ownCloud sync client and I’m good to go!  
>  OK. So where to start. First, we need to get WiFi and wired networking happening for the console at login. To do that, I added the following to /etc/rc.conf:
>
>
>
> ```
> wlans_iwn0=”wlan0″
> ifconfig_wlan0=”WPA DHCP”
> ifconfig_em0=”DHCP”
>
> ```
>
>
>
> I then edited /etc/wpa\_supplicant.conf to put in the details of my WiFi network:
>
>
>
> ```
> network={
> ssid=”MY-NETWORK-NAME”
> psk=”my-super-secret-password”
> }
>
> ```
>
>
>
> A quick reboot showed that both wired and wireless networking were functional and automatically were assigned IP addresses via DHCP. Next up is to try getting into X with whatever DragonFlyBSD uses for its default window manager. A straight up “startx” met with, shall we say, less than stellar results. Therefore, I used the following command to generate a simple /etc/X11/xorg.conf file:
>
>
>
> ```
> &#35; Xorg -configure
> &#35; cp /root/xorg.conf.new /etc/X11/xorg.conf
>
> ```
>
>
>
> With that file in place, I could get into the default window manager, but I had no mouse. After some searching and pinging folks on the mailing list, I was able to figure out what I needed to do. I added the following to my /etc/rc.conf file:
>
>
>
> ```
> moused_enable=”YES”
> moused_type=”auto”
> moused_port=”/dev/psm0″
>
> ```
>
>
>
> I rebooted (I’m sure there is an easier way to get the changes but I don’t know it… yet) and was able to get into a basic X session and have a functional mouse. Next up, installing and configuring Lumina! To do that, I went through the incredibly torturous process of installing Lumina:
>
>

`# pkg install lumina`

>
>
> Wow! That was really, really hard. I might need to pause here to catch my breath. 🙂
>
>
>
> Next up, jumping into Lumina from the console. To do that, I created a .xinitrc file in my home directory with the following:
>
>

`exec start-lumina-desktop`

>
>
> From there, I could “startx” until my heart was content and bounce into Lumina. That wasn’t good enough though! I want a graphical login (specifically xdm). To do that, I had to do a little research. The trick on DragonFlyBSD is not to add anything to /etc/rc.conf like you do in other BSDs, it’s a bit more old school. Basically you need to edit the /etc/ttys file and update ttyv8 to turn on the xdm daemon:
>
>

`ttyv8 “/usr/X11R6/bin/xdm -nodaemon” xterm on secure`

>
>
> The other thing you need to do is set it up to use your desktop environment of choice. In my case, that’s Lumina. To do that, I needed to edit /usr/local/lib/X11/xdm/Xsession and change the next to the last line in the file to launch Lumina:
>
>

`exec /usr/local/bin/start-lumina-desktop`

>
>
> I then crossed my fingers, rebooted and lo and behold had a graphical login that, when I actually didn’t fat finger my password from excitement, put me into the Lumina desktop environment!  
>  Next up – I need a cool desktop wallpaper. Of course that’s way more important that installing application or other stuff! After some searching, I found this one that met my needs. I downloaded it to a local \~/Pictures directory and then used the Lumina wallpaper preference application to add the directory containing the picture and set it to automatic layout. Voila! I had a cool DragonFlyBSD wallpaper.  
>  Next I installed the xfce4 terminal program by doing:
>
>

`# pkg install xfce4-terminal`

>
>
> I then went into the Lumina “All Desktop Settings” preferences, found the applet for the “Menu” under “Interface Configuration” and swapped out “terminal” for “Xfce Terminal”. I then configured Lumina further to have a 26 pixel thick, 99% length bottom center panel with the following gadgets in it (in this order):
>
>
>
> ```
> Start Menu
> Task Manager (No Groups)
> Spacer
> System Tray
> Time/Date
> Battery Monitor
>
> ```
>
>
>
> I then went into my Appearance | Window Manager gadget and set my Window Theme to “bora\_blue” (my favorite out of the defaults supplied). I then installed my remaining applications that I needed in order to have a functioning desktop:
>
>

`# pkg install owncloudclient qtkeychain evolution evolution-ews firefox libreoffice`

>
>
> After that, I really had a nicely functioning desktop environment! By the way, the performance of DragonFlyBSD is pretty impressive in terms of its day to day usage. Keep in mind I’m not doing any official benchmarking or anything, but it sure feels to me to be just as fast (if not faster) than OpenBSD and FreeBSD. I know that the kernel team has done a lot to unlock things (which FreeBSD has done and we are starting to do on OpenBSD) so perhaps I can attribute the “snappiness” to that?  
>  As you can see, although there isn’t as much documentation on the Internet for this BSD, you can get a really nice, functional desktop out of it with some simple (and intuitive) configuration. I’m really looking forward to living in this system for a while and learning about it. Probably the first thing I’ll do is ring up the port maintainer for Lumina and see if we can’t collaborate on getting Lumina 1.3 moved over to it! Give this one a try – I think you’ll find that its a very nice operating system with some very cool features (the HAMMER filesystem for one!).
>
>
> ---
>

News Roundup
----------

### [Porting NetBSD to Alwinner H3 SoCs](http://blog.netbsd.org/tnf/entry/porting_netbsd_to_allwinner_h3) ###

* Jared McNeill writes on the the NetBSD blog:

>
>
> A new SUNXI evbarm kernel has appeared recently in NetBSD -current with support for boards based on the Allwinner H3 system on a chip (SoC). The H3 SoC is a quad-core Cortex-A7 SoC designed primarily for set-top boxes, but has managed to find its way into many single-board computers (SBC). This is one of the first evbarm ports built from the ground up with device tree support, which helps us to use a single kernel config to support many different boards.  
>  To get these boards up and running, first we need to deal with low-level startup code. For the SUNXI kernel this currently lives in sys/arch/evbarm/sunxi/. The purpose of this code is fairly simple; initialize the boot CPU and initialize the MMU so we can jump to the kernel. The initial MMU configuration needs to cover a few things -- early on we need to be able to access the kernel, UART debug console, and the device tree blob (DTB) passed in from U-Boot. We wrap the kernel in a U-Boot header that claims to be a Linux kernel; this is no accident! This tells U-Boot to use the Linux boot protocol when loading the kernel, which ensures that the DTB (loaded by U-Boot) is processed and passed to us in r2.  
>  Once the CPU and MMU are ready, we jump to the generic ARM FDT implementation of initarm in sys/arch/evbarm/fdt/fdt\_machdep.c. The first thing this code does is validate and relocate the DTB data. After it has been relocated, we compare the compatible property of the root node in the device tree with the list of ARM platforms compiled into the kernel. The Allwinner sunxi platform code lives in sys/arch/arm/sunxi/sunxi\_platform.c. The sunxi platform code provides SoC-specific versions of code needed early at boot. We need to know how to initialize the debug console, spin up application CPUs, reset the board, etc.  
>  With a bit of luck, we're now booting and enumerating devices. Apart from a few devices, almost nothing works yet as we are missing a driver for the CCU. The CCU in the Allwinner H3 SoC controls PLLs and most of the clock generation, division, muxing, and gating. Since there are many similarities between Allwinner SoCs, I opted to write generic CCU code and then SoC-specific frontends. The resulting code lives in sys/arch/arm/sunxi/; generic code as sunxi\_ccu.c and H3-specific code in sun8i\_h3\_ccu.c.
>
>

* Jared has more information about porting and also provides a boot log. \*\*\*

### [TrueOS Community Spotlight: Reset ZFS Replication using the command line](https://www.trueos.org/blog/community-spotlight/) ###

>
>
> We’d like to spotlight TrueOS community member Brad Alexander for documenting his experience repairing ZFS dataset replication with TrueOS. Thank you! His notes are posted here, and they’ve been added to the TrueOS handbook Troubleshooting section for later reference.
>
>

* Original indications

>
>
> The SysAdm Client tray icon was pulsing red. Right-clicking on the icon and clicking Messages would show the message:
>
>

`FAILED replication task on NCC74602 -> 192.168.47.20: LOGFILE: /var/log/lpreserver/lpreserver_failed.log`

>
>
> /var/log/lpreserver/lastrep-send.log shows very little information:
>
>
>
> ```
> send from @auto-2017-07-12-01-00-00 to NCC74602/ROOT/12.0-CURRENT-up-20170623_120331@auto-2017-07-14-01-00-00
> total estimated size is 0
> TIME        SENT    SNAPSHOT
>
> ```
>
>
>
> And no useful errors were being written to the lpreserver\_failed.log.
>
>

* Repairing replication
  * First attempt:

>
>
> The first approach I tried was to use the Sysadm Client:  
>  I clicked on the dataset in question, then clicked Initialize. After waiting a few minutes, I clicked Start. I was immediately rewarded with a pulsing red icon in the system tray and received the same messages as above.
>
>

* Second attempt:

>
>
> I was working with, and want to specially thank @RodMyers and @NorwegianRockCat. They suggested I use the lpreserver command line. So I issued these commands:
>
>
>
> ```
> sudo lpreserver replicate init NCC74602 192.168.47.20
> sudo lpreserver replicate run NCC74602 192.168.47.20
>
> ```
>
>
>
> Unfortunately, the replication failed again. I got these messages in the logs:
>
>
>
> ```
> Fri Jul 14 09:03:34 EDT 2017: Removing NX80101/archive/yukon.sonsofthunder.nanobit.org/ROOT - re-created locally
> cannot unmount '/mnt/NX80101/archive/yukon.sonsofthunder.nanobit.org/ROOT': Operation not permitted
> Failed creating remote dataset!
> cannot create 'NX80101/archive/yukon.sonsofthunder.nanobit.org/ROOT': dataset already exists
>
> ```
>
>
>
> It turned out there were a number of children. I logged into luna (the FreeNAS) and issued this command as root:
>
>

`zfs destroy -r NX80101/archive/defiant.sonsofthunder.nanobit.org`

>
>
> I then ran the replicate init and replicate run commands again from the TrueOS host, and replication worked! It has continued to work too, at least until the next fiddly bit breaks.
>
>
> ---
>

### [Kernel relinking status from Theo de Raadt](http://undeadly.org/cgi?action=article&sid=20170701170044) ###

>
>
> As you may have heard (and as was mentioned in an earlier article), on recent OpenBSD snapshots we have KARL, which means that the kernel is relinked so each boot comes with a new kernel where all .o files are linked in random order and with random offsets. Theo de Raadt summarized the status in a message to the tech@ mailing list, subject kernel relinking as follows:
>
>
>
> 5 weeks ago at d2k17 I started work on randomized kernels. I've been having conversations with other developers for nearly 5 years on the topic... but never got off to a good start, probably because I was trying to pawn the work off on others.  
>  Having done this, I really had no idea we'd end up where we are today.  
>  Here are the behaviours:  
>  The base set has grown, it now includes a link-kit  
>  At install time, a unique kernel is built from this link-kit  
>  At upgrade time, a unique kernel is built  
>  At boot time, a unique kernel is built and installed for the next boot  
>  If someone compiles their own kernel and uses 'make install', the link-kit is also updated, so that the next boot can do the work  
>  If a developer cp's a kernel to /, the mechanism dis-engages until a 'make install" or upgrade is performed in the future. That may help debugging.  
>  A unique kernel is linked such that the startup assembly code is kept in the same place, followed by randomly-sized gapping, followed by all the other .o files randomly re-organized. As a result the distances between functions and variables are entirely new. An info leak of a pointer will not disclose other pointers or objects. This may also help reduce gadgets on variable-sized architectures, because polymorphism in the instruction stream is damaged by nested offsets changing.  
>  At runtime, the kernel can unmap it's startup code. On architectures where an unmap isn't possible due to large-PTE use, the code can be trashed instead.  
>  I did most of the kernel work on amd64 first, then i386. I explained what needed to be done to visa and patrick, who handled the arm and mips platforms. Then I completed all the rest of the architectures. Some architecture are missing the unmap/trashing of startup code, that's a step we need to get back to.  
>  The next part was tricky and I received assistance from tb and rpe. We had to script the behaviours at build time, snapshot time, relink time, boot time, and later on install/upgrade time also.  
>  While they helped, I also worked to create the "gap.o" file without use of a C compiler so that relinks can occur without the "comp" set installed. This uses the linkscript feature of ld. I don't think anyone has done this before. It is little bit fragile, and the various linkers may need to receive some fixes due to what I've encountered.  
>  To ensure this security feature works great in the 6.2 release, please test snapshots. By working well, I mean it should work invisibly, without any glitch such as a broken kernel or anything. If there are ugly glitches we would like to know before the release.
>
>
>
> You heard the man, now is the time to test and get a preview of the new awsomeness that will be in OpenBSD 6.2.
>
>

---

Beastie Bits
----------

* [Beta Undeadly call for testing](http://undeadly.org/cgi?action=article&sid=20170704122507)
* [Absolute FreeBSD 3rd Edition Update](https://blather.michaelwlucas.com/archives/2972)
* [New home for the NetBSD repository conversion](http://mail-index.netbsd.org/tech-repository/2017/06/10/msg000637.html)
* [TrueOS unstable Update: 7/14/17](https://www.trueos.org/blog/trueos-unstable-update-71417/)
* [Interview with George Neville-Neil - President of the FreeBSD Foundation](https://www.mappingthejourney.com/single-post/2017/07/06/Episode-4-Interview-with-George-Neville-Neil-President-of-FreeBSD)
* [LibreSSL 2.5.5, 2.6.0 released](https://marc.info/?l=openbsd-announce&m=149993703415746) \*\*\*

Feedback/Questions
----------

* [Jason - Byhve VM UEFI woes](http://dpaste.com/30EY7GZ#wrap)
* [Donald - Several Questions](http://dpaste.com/39X6YSQ#wrap)
* [Dan - Several Questions](http://dpaste.com/3B50ZRV#wrap)
* [Bryson - Jails](http://dpaste.com/08C43XN#wrap) \*\*\*

Final Note
----------

* We’ve decided to do something different for a change of pace and let you the audience interview Allan and Benedict.
* Getting our entire audience live when we record would be a challenge, so instead we want you to send in your questions for Allan and Benedict.
* This interview is not going to be like our typical support feedback questions. This is a chance for you, our audience, to ask Allan and Benedict any questions that you’ve been wondering over the years.
* Questions like… “Of all the conferences you've gone to, what was your favorite and why?”
* We will answer the questions during a random week during the month of September. Send all your questions to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) with the subject of “viewer interview questions”
* We reserve the right to not answer questions which we feel are inappropriate or trolling. \*\*\*