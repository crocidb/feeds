+++
title = "215: Turning FreeBSD up to 100 Gbps"
description = "We look at how Netflix serves 100 Gbps from an Open Connect Appliance, read through the 2nd quarter FreeBSD status report, show you a freebsd-update speedup via nginx reverse proxy, and customize your OpenBSD default shell.This episode was brought to you by[![iXsystems "
date = "2017-10-11T12:00:00Z"
url = "https://www.bsdnow.tv/215"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.841761941Z"
seen = true
+++

We look at how Netflix serves 100 Gbps from an Open Connect Appliance, read through the 2nd quarter FreeBSD status report, show you a freebsd-update speedup via nginx reverse proxy, and customize your OpenBSD default shell.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Serving 100 Gbps from an Open Connect Appliance](https://medium.com/netflix-techblog/serving-100-gbps-from-an-open-connect-appliance-cdb51dda3b99) ###

>
>
> In the summer of 2015, the Netflix Open Connect CDN team decided to take on an ambitious project. The goal was to leverage the new 100GbE network interface technology just coming to market in order to be able to serve at 100 Gbps from a single FreeBSD-based Open Connect Appliance (OCA) using NVM Express (NVMe)-based storage.  
>  At the time, the bulk of our flash storage-based appliances were close to being CPU limited serving at 40 Gbps using single-socket Xeon E52697v2. The first step was to find the CPU bottlenecks in the existing platform while we waited for newer CPUs from Intel, newer motherboards with PCIe Gen3 x16 slots that could run the new Mellanox 100GbE NICs at full speed, and for systems with NVMe drives.
>
>

* Fake NUMA

>
>
> Normally, most of an OCAs content is served from disk, with only 1020% of the most popular titles being served from memory (see our previous blog, [Content Popularity for Open Connect](https://medium.com/@NetflixTechBlog/content-popularity-for-open-connect-b86d56f613b) for details). However, our early pre-NVMe prototypes were limited by disk bandwidth. So we set up a contrived experiment where we served only the very most popular content on a test server. This allowed all content to fit in RAM and therefore avoid the temporary disk bottleneck. Surprisingly, the performance actually dropped from being CPU limited at 40 Gbps to being CPU limited at only 22 Gbps!  
>  The ultimate solution we came up with is what we call Fake NUMA. This approach takes advantage of the fact that there is one set of page queues per NUMA domain. All we had to do was to lie to the system and tell it that we have one Fake NUMA domain for every 2 CPUs. After we did this, our lock contention nearly disappeared and we were able to serve at 52 Gbps (limited by the PCIe Gen3 x8 slot) with substantial CPU idle time.  
>  After we had newer prototype machines, with an Intel Xeon E5 2697v3 CPU, PCIe Gen3 x16 slots for 100GbE NIC, and more disk storage (4 NVMe or 44 SATA SSD drives), we hit another bottleneck, also related to a lock on a global list. We were stuck at around 60 Gbps on this new hardware, and we were constrained by pbufs.  
>  Our first problem was that the list was too small. We were spending a lot of time waiting for pbufs. This was easily fixed by increasing the number of pbufs allocated at boot time by increasing the kern.nswbuf tunable. However, this update revealed the next problem, which was lock contention on the global pbuf mutex. To solve this, we changed the vnode pager (which handles paging to files, rather than the swap partition, and hence handles all sendfile() I/O) to use the normal kernel zone allocator. This change removed the lock contention, and boosted our performance into the 70 Gbps range.  
>  As noted above, we make heavy use of the VM page queues, especially the inactive queue. Eventually, the system runs short of memory and these queues need to be scanned by the page daemon to free up memory. At full load, this was happening roughly twice per minute. When this happened, all NGINX processes would go to sleep in vm\_wait() and the system would stop serving traffic while the pageout daemon worked to scan pages, often for several seconds. This problem is actually made progressively worse as one adds NUMA domains, because there is one pageout daemon per NUMA domain, but the page deficit that it is trying to clear is calculated globally. So if the vm pageout daemon decides to clean, say 1GB of memory and there are 16 domains, each of the 16 pageout daemons will individually attempt to clean 1GB of memory.  
>  To solve this problem, we decided to proactively scan the VM page queues. In the sendfile path, when allocating a page for I/O, we run the pageout code several times per second on each VM domain. The pageout code is run in its lightest-weight mode in the context of one unlucky NGINX process. Other NGINX processes continue to run and serve traffic while this is happening, so we can avoid bursts of pager activity that blocks traffic serving. Proactive scanning allowed us to serve at roughly 80 Gbps on the prototype hardware.  
>  Hans Petter Selasky, Mellanoxs 100GbE driver developer, came up with an innovative solution to our problem. Most modern NICs will supply an Receive Side Scaling (RSS) hash result to the host. RSS is a standard developed by Microsoft wherein TCP/IP traffic is hashed by source and destination IP address and/or TCP source and destination ports. The RSS hash result will almost always uniquely identify a TCP connection. Hans idea was that rather than just passing the packets to the LRO engine as they arrive from the network, we should hold the packets in a large batch, and then sort the batch of packets by RSS hash result (and original time of arrival, to keep them in order). After the packets are sorted, packets from the same connection are adjacent even when they arrive widely separated in time. Therefore, when the packets are passed to the FreeBSD LRO routine, it can aggregate them.  
>  With this new LRO code, we were able to achieve an LRO aggregation rate of over 2 packets per aggregation, and were able to serve at well over 90 Gbps for the first time on our prototype hardware for mostly unencrypted traffic. So the job was done. Or was it? The next goal was to achieve 100 Gbps while serving only TLS-encrypted streams. By this point, we were using hardware which closely resembles todays 100GbE flash storage-based OCAs: four NVMe PCIe Gen3 x4 drives, 100GbE ethernet, Xeon E5v4 2697A CPU. With the improvements described in the Protecting Netflix Viewing Privacy at Scale blog entry, we were able to serve TLS-only traffic at roughly 58 Gbps.  
>  In the lock contention problems wed observed above, the cause of any increased CPU use was relatively apparent from normal system level tools like flame graphs, DTrace, or lockstat. The 58 Gbps limit was comparatively strange. As before, the CPU use would increase linearly as we approached the 58 Gbps limit, but then as we neared the limit, the CPU use would increase almost exponentially. Flame graphs just showed everything taking longer, with no apparent hotspots. We finally had a hunch that we were limited by our systems memory bandwidth. We used the Intel® Performance Counter Monitor Tools to measure the memory bandwidth we were consuming at peak load. We then wrote a simple memory thrashing benchmark that used one thread per core to copy between large memory chunks that did not fit into cache. According to the PCM tools, this benchmark consumed the same amount of memory bandwidth as our OCAs TLS-serving workload. So it was clear that we were memory limited. At this point, we became focused on reducing memory bandwidth usage. To assist with this, we began using the Intel VTune profiling tools to identify memory loads and stores, and to identify cache misses.  
>  Because we are using sendfile() to serve data, encryption is done from the virtual memory page cache into connection-specific encryption buffers. This preserves the normal FreeBSD page cache in order to allow serving of hot data from memory to many connections. One of the first things that stood out to us was that the ISA-L encryption library was using half again as much memory bandwidth for memory reads as it was for memory writes. From looking at VTune profiling information, we saw that ISA-L was somehow reading both the source and destination buffers, rather than just writing to the destination buffer. We realized that this was because the AVX instructions used by ISA-L for encryption on our CPUs worked on 256-bit (32-byte) quantities, whereas the cache line size was 512-bits (64 bytes)??thus triggering the system to do read-modify-writes when data was written. The problem is that the the CPU will normally access the memory system in 64 byte cache line-sized chunks, reading an entire 64 bytes to access even just a single byte. After a quick email exchange with the ISA-L team, they provided us with a new version of the library that used non-temporal instructions when storing encryption results. Non-temporals bypass the cache, and allow the CPU direct access to memory. This meant that the CPU was no longer reading from the destination buffers, and so this increased our bandwidth from 58 Gbps to 65 Gbps.  
>  At 100 Gbps, were moving about 12.5 GB/s of 4K pages through our system unencrypted. Adding encryption doubles that to 25 GB/s worth of 4K pages. Thats about 6.25 Million mbufs per second. When you add in the extra 2 mbufs used by the crypto code for TLS metadata at the beginning and end of each TLS record, that works out to another 1.6M mbufs/sec, for a total of about 8M mbufs/second. With roughly 2 cache line accesses per mbuf, thats 128 bytes \* 8M, which is 1 GB/s (8 Gbps) of data that is accessed at multiple layers of the stack (alloc, free, crypto, TCP, socket buffers, drivers, etc).  
>  At this point, were able to serve 100% TLS traffic comfortably at 90 Gbps using the default FreeBSD TCP stack. However, the goalposts keep moving. Weve found that when we use more advanced TCP algorithms, such as RACK and BBR, we are still a bit short of our goal. We have several ideas that we are currently pursuing, which range from optimizing the new TCP code to increasing the efficiency of LRO to trying to do encryption closer to the transfer of the data (either from the disk, or to the NIC) so as to take better advantage of Intels DDIO and save memory bandwidth.
>
>

---

### [FreeBSD April to June 2017 Status Report](https://www.freebsd.org/news/status/report-2017-04-2017-06.html) ###

[FreeBSD Team Reports](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#FreeBSD-Team-Reports)  

* [FreeBSD Release Engineering Team](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#FreeBSD-Release-Engineering-Team)  
* [Ports Collection](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Ports-Collection)  
* [The FreeBSD Core Team](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#The-FreeBSD-Core-Team)  
* [The FreeBSD Foundation](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#The-FreeBSD-Foundation)  
* [The Postmaster Team](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#The-Postmaster-Team)

### [Projects](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Projects) ###

* [64-bit Inode Numbers](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#64-bit-Inode-Numbers)
* [Capability-Based Network Communication for Capsicum/CloudABI](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Capability-Based-Network-Communication-for-Capsicum/CloudABI)
* [Ceph on FreeBSD](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Ceph-on-FreeBSD)
* [DTS Updates](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#DTS-Updates)

### [Kernel](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Kernel) ###

* [Coda revival](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Coda-revival)
* [FreeBSD Driver for the Annapurna Labs ENA](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#FreeBSD-Driver-for-the-Annapurna-Labs-ENA)
* [Intel 10G Driver Update](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Intel-10G-Driver-Update)
* [pNFS Server Plan B](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#pNFS-Server-Plan-B)

### [Architectures](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Architectures) ###

* [FreeBSD on Marvell Armada38x](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#FreeBSD-on-Marvell-Armada38x)
* [FreeBSD/arm64](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#FreeBSD/arm64)

### [Userland Programs](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Userland-Programs) ###

* [DTC](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#DTC)
* [Using LLVM's LLD Linker as FreeBSD's System Linker](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Using-LLVM's-LLD-Linker-as-FreeBSD's-System-Linker)

### [Ports](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Ports) ###

* [A New USES Macro for Porting Cargo-Based Rust Applications](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#A-New-USES-Macro-for-Porting-Cargo-Based-Rust-Applications)
* [GCC (GNU Compiler Collection)](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#GCC-(GNU-Compiler-Collection))
* [GNOME on FreeBSD](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#GNOME-on-FreeBSD)
* [KDE on FreeBSD](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#KDE-on-FreeBSD)
* [New Port: FRRouting](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#New-Port:-FRRouting)
* [PHP Ports: Help Improving QA](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#PHP-Ports:-Help-Improving-QA)
* [Rust](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Rust)
* [sndio Support in the FreeBSD Ports Collection](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#sndio-Support-in-the-FreeBSD-Ports-Collection)
* [TensorFlow](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#TensorFlow)
* [Updating Port Metadata for non-x86 Architectures](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Updating-Port-Metadata-for-non-x86-Architectures)
* [Xfce on FreeBSD](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Xfce-on-FreeBSD)

### [Documentation](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Documentation) ###

* [Absolute FreeBSD, 3rd Edition](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Absolute-FreeBSD,-3rd-Edition)
* [Doc Version Strings Improved by Their Absence](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Doc-Version-Strings-Improved-by-Their-Absence)
* [New Xen Handbook Section](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#New-Xen-Handbook-Section)

### [Miscellaneous](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#Miscellaneous) ###

* [BSD Meetups at Rennes (France)](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#BSD-Meetups-at-Rennes-(France))

### [Third-Party Projects](https://www.freebsd.org/news/status/report-2017-04-2017-06.htmlThird-Party-Projects) ###

* [HardenedBSD](https://www.freebsd.org/news/status/report-2017-04-2017-06.html#HardenedBSD)

---

### [DPDK, VPP, and the future of pfSense @ the DPDK Summit](https://www.pscp.tv/DPDKProject/1dRKZnleWbmKB?t=5h1m0s) ###

* The DPDK (Data Plane Development Kit) conference included a short update from the pfSense project
* The video starts with a quick introduction to pfSense and the company behind it
* It covers the issues they ran into trying to scale to 10gbps and beyond, and some of the solutions they tried: libuinet, netmap, packet-journey
* Then they discovered VPP (Vector Packet Processing)
* The video then covers the architecture of the new pfSense
* pfSense has launched of EC2, on Azure soon, and will launch support for the new Atom C3000 and Xeon hardware with built-in QAT (Quick-Assist crypto offload) in November
* The future: 100gbps, MPLS, VXLANs, and ARM64 hardware support \*\*\*

News Roundup
----------

### [Local nginx reverse proxy cache for freebsd-update](https://wiki.freebsd.org/VladimirKrstulja/Guides/FreeBSDUpdateReverseProxy) ###

* Vladimir Krstulja has created this interesting tutorial on the FreeBSD wiki about a freebsd-update reverse proxy cache

>
>
> Either because you're a good netizen and don't want to repeatedly hammer the FreeBSD mirrors to upgrade all your systems, or you want to benefit from the speed of having a local "mirror" (cache, more precisely), running a freebsd update reverse proxy cache with, say, nginx is dead simple.
>
>
>
> 1. Install nginx somewhere
> 2. Configure nginx for a subdomain, say, freebsd-update.example.com
> 3. On all your hosts, in all your jails, configure /etc/freebsd-update.conf for new ServerName And... that's it. Running freebsd-update will use the ServerName domain which is your reverse nginx proxy. Note the comment about using a "nearby" server is not quite true. FreeBSD update mirrors are frequently slow and running such a reverse proxy cache significantly speeds things up. Caveats: This is a simple cache. That means it doesn't consider the files as a whole repository, which in turn means updates to your cache are not atomic. It'd be advised to nuke your cache before your update run, as its point is only to retain the files in a local cache for some short period of time required for all your machines to be updated. \*\*\*
>
>

### [ClonOS is a free, open-source FreeBSD-based platform for virtual environment creation and management](https://clonos.tekroutine.com/) ###

>
>
> The operating system uses FreeBSD's development branch (12.0-CURRENT) as its base. ClonOS uses ZFS as the default file system and includes web-based administration tools for managing virtual machines and jails. The project's website also mentions the availability of templates for quickly setting up new containers and web-based VNC access to jails. Puppet, we are told, can be used for configuration management.  
>  ClonOS can be downloaded as a disk image file (IMG) or as an optical media image (ISO). I downloaded the ISO file which is 1.6GB in size. Booting from ClonOS's media displays a text console asking us to select the type of text terminal we are using. There are four options and most people can probably safely take the default, xterm, option.  
>  The operating system, on the surface, appears to be a full installation of FreeBSD 12. The usual collection of FreeBSD packages are available, including manual pages, a compiler and the typical selection of UNIX command line utilities. The operating system uses ZFS as its file system and uses approximately 3.3GB of disk space. ClonOS requires about 50MB of active memory and 143MB of wired memory before any services or jails are created.  
>  Most of the key features of ClonOS, the parts which set it apart from vanilla FreeBSD, can be accessed through a web-based control panel. When we connect to this control panel, over a plain HTTP connection, using our web browser, we are not prompted for an account name or password. The web-based interface has a straight forward layout. Down the left side of the browser window we find categories of options and controls. Over on the right side of the window are the specific options or controls available in the selected category. At the top of the page there is a drop-down menu where we can toggle the displayed language between English and Russian, with English being the default.  
>  There are twelve option screens we can access in the ClonOS interface and I want to quickly give a summary of each one:
>
>

* Overview - this page shows a top-level status summary. The page lists the number of jails and nodes in the system. We are also shown the number of available CPU cores and available RAM on the system.
* Jail containers - this page allows us to create and delete jails. We can also change some basic jail settings on this page, adjusting the network configuration and hostname. Plus we can click a button to open a VNC window that allows us to access the jail's command line interface.
* Template for jails - provides a list of available jail templates. Each template is listed with its name and a brief description. For example, we have a Wordpress template and a bittorrent template. We can click a listed template to create a new jail with a vanilla installation of the selected software included. We cannot download or create new templates from this page.
* Bhyve VMs - this page is very much like the Jails containers page, but concerns the creation of new virtual machines and managing them.
* Virtual Private Network - allows for the management of subnets
* Authkeys - upload security keys for something, but it is not clear for what these keys will be used.
* Storage media - upload ISO files that will be used when creating virtual machines and installing an operating system in the new virtual environment.
* FreeBSD Bases - I think this page downloads and builds source code for alternative versions of FreeBSD, but I am unsure and could not find any associated documentation for this page.
* FreeBSD Sources - download source code for various versions of FreeBSD.
* TaskLog - browse logs of events, particularly actions concerning jails.
* SQLite admin - this page says it will open an interface for managing a SQLite database. Clicking link on the page gives a file not found error.
* Settings - this page simply displays a message saying the settings page has not been implemented yet.

>
>
> While playing with ClonOS, I wanted to perform a couple of simple tasks. I wanted to use the Wordpress template to set up a blog inside a jail. I wanted a generic, empty jail in which I could play and run commands without harming the rest of the operating system. I also wanted to try installing an operating system other than FreeBSD inside a Bhyve virtual environment. I thought this would give me a pretty good idea of how quick and easy ClonOS would make common tasks.
>
>

* Conclusions

>
>
> ClonOS appears to be in its early stages of development, more of a feature preview or proof-of-concept than a polished product. A few of the settings pages have not been finished yet, the web-based controls for jails are unable to create jails that connect to the network and I was unable to upload even small ISO files to create virtual machines.  
>  The project's website mentions working with Puppet to handle system configuration, but I did not encounter any Puppet options. There also does not appear to be any documentation on using Puppet on the ClonOS platform.  
>  One of the biggest concerns I had was the lack of security on ClonOS. The web-based control panel and terminal both automatically login as the root user. Passwords we create for our accounts are ignored and we cannot logout of the local terminal. This means anyone with physical access to the server automatically gains root access and, in addition, anyone on our local network gets access to the web-based admin panel. As it stands, it would not be safe to install ClonOS on a shared network.  
>  Some of the ideas present are good ones. I like the idea of jail templates and have used them on other systems. The graphical Bhyve tools could be useful too, if the limitations of the ISO manager are sorted out. But right now, ClonOS still has a way to go before it is likely to be safe or practical to use.
>
>
> ---
>

### [Customize ksh display for OpenBSD](http://nanxiao.me/en/customize-ksh-display-for-openbsd/) ###

>
>
> The default shell for OpenBSD is ksh, and it looks a little monotonous.  
>  To make its user-experience more friendly, I need to do some customizations:  
>  (1) Modify the Prompt String to display the user name and current directory:  
>  PS1='$USER:$PWD# '  
>  (2) Install colorls package:  
>  pkg\_add colorls  
>  Use it to replace the shipped ls command:  
>  alias ls='colorls -G'  
>  (3) Change LSCOLORS environmental variable to make your favorite color. For example, I dont want the directory is displayed in default blue, change it to magenta:  
>  LSCOLORS=fxexcxdxbxegedabagacad  
>  For detailed explanation of LSCOLORS, please refer manual of colorls.  
>  This is my final modification of .profile:  
>  PS1='$USER:$PWD# '  
>  export PS1  
>  LSCOLORS=fxexcxdxbxegedabagacad  
>  export LSCOLORS  
>  alias ls='colorls -G'
>
>
> ---
>

### [DragonFly 5 release candidate](https://www.dragonflydigest.com/2017/10/02/20295.html) ###

* [Commit](http://lists.dragonflybsd.org/pipermail/commits/2017-September/626463.html)

>
>
> I tagged DragonFly 5.0 (commit message list in that link) over the weekend, and theres a [5.0 release candidate for download](http://mirror-master.dragonflybsd.org/iso-images/).  
>  Its RC2 because the recent Radeon changes [had to be taken out.](http://lists.dragonflybsd.org/pipermail/commits/2017-September/626476.html)
>
>

---

Beastie Bits
----------

* [Faster forwarding](http://www.grenadille.net/post/2017/08/21/Faster-forwarding)
* [DRM-Next-Kmod hits the ports tree](http://www.freshports.org/graphics/drm-next-kmod/)
* [OpenBSD Community Goes Platinum](https://undeadly.org/cgi?action=article;sid=20170829025446)
* [Setting up iSCSI on TrueOS and FreeBSD12](https://www.youtube.com/watch?v=4myESLZPXBU) \*\*\*

Feedback/Questions
----------

* Christopher - [Virtualizing FreeNAS](http://dpaste.com/38G99CK#wrap)
* Van - [Tar Question](http://dpaste.com/3MEPD3S#wrap)
* Joe - [Book Reviews](http://dpaste.com/0T623Z6#wrap) \*\*\*