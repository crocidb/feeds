+++
title = "Episode 256: Because Computers | BSD Now 2^8"
description = "FreeBSD ULE vs. Linux CFS, OpenBSD on Tuxedo InfinityBook, how zfs diff reports filenames efficiently, why choose FreeBSD over Linux, PS4 double free exploit, OpenBSD’s wifi autojoin, and FreeBSD jails the hard way.WinCelebrate our 256th episode with us. You can win a M"
date = "2018-07-25T05:00:00Z"
url = "https://www.bsdnow.tv/256"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.730223586Z"
seen = true
+++

FreeBSD ULE vs. Linux CFS, OpenBSD on Tuxedo InfinityBook, how zfs diff reports filenames efficiently, why choose FreeBSD over Linux, PS4 double free exploit, OpenBSD’s wifi autojoin, and FreeBSD jails the hard way.

Win
----------

Celebrate our 256th episode with us. You can win a Mogics Power Bagel (not sponsored).

To enter, go find the 4 episodes we did in December of 2017. In the opening, find the 4 letters in the bookshelf behind me. They spell different words in each of the 4 episodes. Send us these words in order to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) with the subject “bsdnow256” until August 8th, 2018 18:00 UTC and we’ll randomly draw the winner on the live show. We’ll then contact you to ship the item.  
 Only one item to win. All decisions are final. Better luck next time.

Headlines
----------

### Battle of the Schedulers: FreeBSD ULE vs. Linux CFS ###

Introduction  
 This paper analyzes the impact on application performance of the design and implementation choices made in two widely used open-source schedulers: ULE, the default FreeBSD scheduler, and CFS, the default Linux scheduler. We compare ULE and CFS in otherwise identical circumstances. We have ported ULE to Linux, and use it to schedule all threads that are normally scheduled by CFS. We compare the performance of a large suite of applications on the modified kernel running ULE and on the standard Linux kernel running CFS. The observed performance differences are solely the result of scheduling decisions, and do not reflect differences in other subsystems between FreeBSD and Linux. There is no overall winner. On many workloads the two schedulers perform similarly, but for some workloads there are significant and even surprising differences. ULE may cause starvation, even when executing a single application with identical threads, but this starvation may actually lead to better application performance for some workloads. The more complex load balancing mechanism of CFS reacts more quickly to workload changes, but ULE achieves better load balance in the long run.  
 Operating system kernel schedulers are responsible for maintaining high utilization of hardware resources (CPU cores, memory, I/O devices) while providing fast response time to latency-sensitive applications. They have to react to workload changes, and handle large numbers of cores and threads with minimal overhead [12]. This paper provides a comparison between the default schedulers of two of the most widely deployed open-source operating systems: the Completely Fair Scheduler (CFS) used in Linux, and the ULE scheduler used in FreeBSD. Our goal is not to declare an overall winner.  
 In fact, we find that for some workloads ULE is better and for others CFS is better. Instead, our goal is to illustrate how differences in the design and the implementation of the two schedulers are reflected in application performance under different workloads. ULE and CFS are both designed to schedule large numbers of threads on large multicore machines. Scalability considerations have led both schedulers to adopt per-core run-queues. On a context switch, a core accesses only its local run-queue to find the next thread to run. Periodically and at select times, e.g., when a thread wakes up, both ULE and CFS perform load balancing, i.e., they try to balance the amount of work waiting in the run-queues of different cores.  
 ULE and CFS, however, differ greatly in their design and implementation choices. FreeBSD ULE is a simple scheduler (2,950 lines of code in FreeBSD 11.1), while Linux CFS is much more complex (17,900 lines of code in the latest LTS Linux kernel, Linux 4.9). FreeBSD run-queues are FIFO. For load balancing, FreeBSD strives to even out the number of threads per core. In Linux, a core decides which thread to run next based on prior execution time, priority, and perceived cache behavior of the threads in its runqueue. Instead of evening out the number of threads between cores, Linux strives to even out the average amount of pending work.

Performance analysis  
 We now analyze the impact of the per-core scheduling on the performance of 37 applications. We define “performance” as follows: for database workloads and NAS applications, we compare the number of operations per second, and for the other applications we compare “execution time”. The higher the “performance”, the better a scheduler performs. Figure 5 presents the performance difference between CFS and ULE on a single core, with percentages above 0 meaning that the application executes faster with ULE than CFS.  
 Overall, the scheduler has little influence on most workloads. Indeed, most applications use threads that all perform the same work, thus both CFS and ULE endup scheduling all of the threads in a round-robin fashion. The average performance difference is 1.5%, in favor of ULE. Still, scimark is 36% slower on ULE than CFS, and apache is 40% faster on ULE than CFS. Scimark is a single-threaded Java application. It launches one compute thread, and the Java runtime executes other Java system threads in the background (for the garbage collector, I/O, etc.).  
 When the application is executed with ULE, the compute thread can be delayed, because Java system threads are considered interactive and get priority over the computation thread. The apache workload consists of two applications: the main server (httpd) running 100 threads, and ab, a single-threaded load injector.  
 The performance difference between ULE and CFS is explained by different choices regarding thread preemption. In ULE, full preemption is disabled, while CFS preempts the running thread when the thread that has just been woken up has a vruntime that is much smaller than the vruntime of the currently executing thread (1ms difference in practice). In CFS, ab is preempted 2 million times during the benchmark, while it never preempted with ULE.  
 This behavior is explained as follows: ab starts by sending 100 requests to the httpd server, and then waits for the server to answer. When ab is woken up, it checks which requests have been processed and sends new requests to the server. Since ab is single-threaded, all requests sent to the server are sent sequentially. In ULE, ab is able to send as many new requests as it has received responses. In CFS, every request sent by ab wakes up a httpd thread, which preempts ab.

Conclusion  
 Scheduling threads on a multicore machine is hard. In this paper, we perform a fair comparison of the design choices of two widely used schedulers: the ULE scheduler from FreeBSD and CFS from Linux. We show that they behave differently even on simple workloads, and that no scheduler performs better than the other on all workloads.

### OpenBSD 6.3 on Tuxedo InfinityBook ###

Disclaimer:  
 I came across the Tuxedo Computers InfinityBook last year at the Open! Conference where Tuxedo had a small booth. Previously they came to my attention since they’re a member of the OSB Alliance on whose board I’m a member. Furthermore Tuxedo Computers are a sponsor of the OSBAR which I’m part of the organizational team.

OpenBSD on the Tuxedo InfinityBook  
 I’ve asked the guys over at Tuxedo Computers whether they would be interested to have some tests with \*BSD done and that I could test drive one of their machines and give feedback on what works and what does not - and possibly look into it.+

Within a few weeks they shipped me a machine and last week the InfinityBook Pro 14” arrived. Awesome. Thanks already to the folks at Tuxedo Computers. The machine arrived accompanied by lot’s of swag :)

The InfinityBook is a very nice machine and allows a wide range of configuration. The configuration that was shipped to me:

Intel Core i7-8550U  
 1x 16GB RAM 2400Mhz Crucial Ballistix Sport LT  
 250 GB Samsung 860 EVO (M.2 SATAIII)

I used a USB-stick to boot install63.fs and re-installed the machine with OpenBSD. Full dmesg.

The installation went flawlessly, the needed intel firmware is being installed after installation automatically via fw\_update(1).

Out of the box the graphics works and once installed the machine presents the login.

Video  
 When X starts the display is turned off for some reason. You will need to hit fn+f12 (the key with the moon on it) then the display will go on. Aside from that little nit, X works just fine and presents one the expected resolution.

External video is working just fine as well. Either via hdmi output or via the mini displayport connector.

The buttons for adjusting brightness (fn+f8 and fn+f9) are not working. Instead one has to use wsconsctl(8) to adjust the brightness.

Networking  
 The infinityBook has built-in ethernet, driven by re(4) And for the wireless interface the iwm(4) driver is being used. Both work as expected.

ACPI  
 Neither suspend nor hibernate work. Reporting of battery status is bogus as well. Some of the keyboard function keys work:

LCD on/off works (fn+f2)  
 Keyboard backlight dimming works (fn+f4)  
 Volume (fn+f5 / fn+f6) works

Sound  
 The azalia chipset is being used for audio processing. Works as expected, volume can be controlled via buttons (fn+f5, fn+f6) or via mixerctl.

Touchpad  
 Can be controlled via wsconsctl(8).  
 So far I must say, that the InfinityBook makes a nice machine - and I’m enjoying working with it.

iXsystems  
 iXsystems - Its all NAS

### How ZFS makes things like ‘zfs diff’ report filenames efficiently ###

As a copy on write (file)system, ZFS can use the transaction group (txg) numbers that are embedded in ZFS block pointers to efficiently find the differences between two txgs; this is used in, for example, ZFS bookmarks. However, as I noted at the end of my entry on block pointers, this doesn’t give us a filesystem level difference; instead, it essentially gives us a list of inodes (okay, dnodes) that changed.  
 In theory, turning an inode or dnode number into the path to a file is an expensive operation; you basically have to search the entire filesystem until you find it. In practice, if you’ve ever run ‘zfs diff’, you’ve likely noticed that it runs pretty fast. Nor is this the only place that ZFS quickly turns dnode numbers into full paths, as it comes up in ‘zpool status’ reports about permanent errors. At one level, zfs diff and zpool status do this so rapidly because they ask the ZFS code in the kernel to do it for them. At another level, the question is how the kernel’s ZFS code can be so fast.  
 The interesting and surprising answer is that ZFS cheats, in a way that makes things very fast when it works and almost always works in normal filesystems and with normal usage patterns. The cheat is that ZFS dnodes record their parent’s object number.  
 If you’re familiar with the twists and turns of Unix filesystems, you’re now wondering how ZFS deals with hardlinks, which can cause a file to be in several directories at once and so have several parents (and then it can be removed from some of the directories). The answer is that ZFS doesn’t; a dnode only ever tracks a single parent, and ZFS accepts that this parent information can be inaccurate. I’ll quote the comment in zfs\_obj\_to\_pobj:  
 When a link is removed [the file’s] parent pointer is not changed and will be invalid. There are two cases where a link is removed but the file stays around, when it goes to the delete queue and when there are additional links.  
 Before I get into the details, I want to say that I appreciate the brute force elegance of this cheat. The practical reality is that most Unix files today don’t have extra hardlinks, and when they do most hardlinks are done in ways that won’t break ZFS’s parent stuff. The result is that ZFS has picked an efficient implementation that works almost all of the time; in my opinion, the great benefit we get from having it around are more than worth the infrequent cases where it fails or malfunctions. Both zfs diff and having filenames show up in zpool status permanent error reports are very useful (and there may be other cases where this gets used).  
 The current details are that any time you hardlink a file to somewhere or rename it, ZFS updates the file’s parent to point to the new directory. Often this will wind up with a correct parent even after all of the dust settles; for example, a common pattern is to write a file to an initial location, hardlink it to its final destination, and then remove the initial location version. In this case, the parent will be correct and you’ll get the right name.

News Roundup
----------

### What is FreeBSD? Why Should You Choose It Over Linux? ###

Not too long ago I wondered if and in what situations FreeBSD could be faster than Linux and we received a good amount of informative feedback. So far, Linux rules the desktop space and FreeBSD rules the server space.

In the meantime, though, what exactly is FreeBSD? And at what times should you choose it over a GNU/Linux installation? Let’s tackle these questions.

FreeBSD is a free and open source derivative of BSD (Berkeley Software Distribution) with a focus on speed, stability, security, and consistency, among other features. It has been developed and maintained by a large community ever since its initial release many years ago on November 1, 1993.

BSD is the version of UNIX® that was developed at the University of California in Berkeley. And being a free and open source version, “Free” being a prefix to BSD is a no-brainer.

What’s FreeBSD Good For?

FreeBSD offers a plethora of advanced features and even boasts some not available in some commercial Operating Systems. It makes an excellent Internet and Intranet server thanks to its robust network services that allow it to maximize memory and work with heavy loads to deliver and maintain good response times for thousands of simultaneous user processes.

FreeBSD runs a huge number of applications with ease. At the moment, it has over 32,000 ported applications and libraries with support for desktop, server, and embedded environments. with that being said, let me also add that FreeBSD is excellent for working with advanced embedded platforms. Mail and web appliances, timer servers, routers, MIPS hardware platforms, etc. You name it!

FreeBSD is available to install in several ways and there are directions to follow for any method you want to use; be it via CD-ROM, over a network using NFS or FTP, or DVD.

FreeBSD is easy to contribute to and all you have to do is to locate the section of the FreeBSD code base to modify and carefully do a neat job. Potential contributors are also free to improve on its artwork and documentation, among other project aspects.

FreeBSD is backed by the FreeBSD Foundation, a non-profit organization that you can contribute to financially and all direct contributions are tax deductible.

FreeBSD’s license allows users to incorporate the use of proprietary software which is ideal for companies interested in generating revenues. Netflix, for example, could cite this as one of the reasons for using FreeBSD servers.

Why Should You Choose It over Linux?

From what I’ve gathered about both FreeBSD and Linux, FreeBSD has a better performance on servers than Linux does. Yes, its packaged applications are configured to offer better a performance than Linux and it is usually running fewer services by default, there really isn’t a way to certify which is faster because the answer is dependent on the running hardware and applications and how the system is tuned.

FreeBSD is reportedly more secure than Linux because of the way the whole project is developed and maintained.

Unlike with Linux, the FreeBSD project is controlled by a large community of developers around the world who fall into any of these categories; core team, contributors, and committers.

FreeBSD is much easier to learn and use because there aren’t a thousand and one distros to choose from with different package managers, DEs, etc.

FreeBSD is more convenient to contribute to because it is the entire OS that is preserved and not just the kernel and a repo as is the case with Linux. You can easily access all of its versions since they are sorted by release numbers.

Apart from the many documentations and guides that you can find online, FreeBSD has a single official documentation wherein you can find the solution to virtually any issue you will come across. So, you’re sure to find it resourceful.

FreeBSD has close to no software issues compared to Linux because it has Java, is capable of running Windows programs using Wine, and can run .NET programs using Mono.

FreeBSD’s ports/packages system allows you to compile software with specific configurations, thereby avoiding conflicting dependency and version issues.

Both the FreeBSD and GNU/Linux project are always receiving updates. The platform you decide to go with is largely dependent on what you want to use it for, your technical know-how, willingness to learn new stuff, and ultimately your preference.  
 What is your take on the topic? For what reasons would you choose FreeBSD over Linux if you would? Let us know what you think about both platforms in the comments section below.

### PS4 5.05 BPF Double Free Kernel Exploit Writeup ###

Introduction  
 Welcome to the 5.0x kernel exploit write-up. A few months ago, a kernel vulnerability was discovered by qwertyoruiopz and an exploit was released for BPF which involved crafting an out-of-bounds (OOB) write via use-after-free (UAF) due to the lack of proper locking. It was a fun bug, and a very trivial exploit. Sony then removed the write functionality from BPF, so that exploit was patched. However, the core issue still remained (being the lack of locking). A very similar race condition still exists in BPF past 4.55, which we will go into detail below on. The full source of the exploit can be found here.  
 This bug is no longer accessible however past 5.05 firmware, because the BPF driver has finally been blocked from unprivileged processes - WebKit can no longer open it. Sony also introduced a new security mitigation in 5.0x firmwares to prevent the stack pointer from pointing into user space, however we’ll go more in detail on this a bit further down.

Assumptions  
 Some assumptions are made of the reader’s knowledge for the writeup. The avid reader should have a basic understanding of how memory allocators work - more specifically, how malloc() and free() allocate and deallocate memory respectively. They should also be aware that devices can be issued commands concurrently, as in, one command could be received while another one is being processed via threading. An understanding of C, x86, and exploitation basics is also very helpful, though not necessarily required.

Background  
 This section contains some helpful information to those newer to exploitation, or are unfamiliar with device drivers, or various exploit techniques such as heap spraying and race conditions. Feel free to skip to the “A Tale of Two Free()'s” section if you’re already familiar with this material.

What Are Drivers?  
 There are a few ways that applications can directly communicate with the operating system. One of which is system calls, which there are over 600 of in the PS4 kernel, \~500 of which are FreeBSD - the rest are Sony-implemented. Another method is through something called “Device Drivers”. Drivers are typically used to bridge the gap between software and hardware devices (usb drives, keyboard/mouse, webcams, etc) - though they can also be used just for software purposes.  
 There are a few operations that a userland application can perform on a driver (if it has sufficient permissions) to interface with it after opening it. In some instances, one can read from it, write to it, or in some cases, issue more complex commands to it via the ioctl() system call. The handlers for these commands are implemented in kernel space - this is important, because any bugs that could be exploited in an ioctl handler can be used as a privilege escalation straight to ring0 - typically the most privileged state.  
 Drivers are often the more weaker points of an operating system for attackers, because sometimes these drivers are written by developers who don’t understand how the kernel works, or the drivers are older and thus not wise to newer attack methods.

The BPF Device Driver  
 If we take a look around inside of WebKit’s sandbox, we’ll find a /dev directory. While this may seem like the root device driver path, it’s a lie. Many of the drivers that the PS4 has are not exposed to this directory, but rather only ones that are needed for WebKit’s operation (for the most part). For some reason though, BPF (aka. the “Berkely Packet Filter”) device is not only exposed to WebKit’s sandbox - it also has the privileges to open the device as R/W. This is very odd, because on most systems this driver is root-only (and for good reason). If you want to read more into this, refer to my previous write-up with 4.55FW.

What Are Packet Filters?  
 Below is an excerpt from the 4.55 bpfwrite writeup.  
 Since the bug is directly in the filter system, it is important to know the basics of what packet filters are. Filters are essentially sets of pseudo-instructions that are parsed by bpf\_filter() (which are ran when packets are received). While the pseudo-instruction set is fairly minimal, it allows you to do things like perform basic arithmetic operations and copy values around inside it’s buffer. Breaking down the BPF VM in it’s entirety is far beyond the scope of this write-up, just know that the code produced by it is ran in kernel mode - this is why read/write access to /dev/bpf should be privileged.

Race Conditions  
 Race conditions occur when two processes/threads try to access a shared resource at the same time without mutual exclusion. The problem was ultimately solved by introducing concepts such as the “mutex” or “lock”. The idea is when one thread/process tries to access a resource, it will first acquire a lock, access it, then unlock it once it’s finished. If another thread/process tries to access it while the other has the lock, it will wait until the other thread is finished. This works fairly well - when it’s used properly.  
 Locking is hard to get right, especially when you try to implement fine-grained locking for performance. One single instruction or line of code outside the locking window could introduce a race condition. Not all race conditions are exploitable, but some are (such as this one) - and they can give an attacker very powerful bugs to work with.

Heap Spraying  
 The process of heap spraying is fairly simple - allocate a bunch of memory and fill it with controlled data in a loop and pray your allocation doesn’t get stolen from underneath you. It’s a very useful technique when exploiting something such as a use-after-free(), as you can use it to get controlled data into your target object’s backing memory.  
 By extension, it’s useful to do this for a double free() as well, because once we have a stale reference, we can use a heap spray to control the data. Since the object will be marked “free” - the allocator will eventually provide us with control over this memory, even though something else is still using it. That is, unless, something else has already stolen the pointer from you and corrupts it - then you’ll likely get a system crash, and that’s no fun. This is one factor that adds to the variance of exploits, and typically, the smaller the object, the more likely this is to happen.

Follow the link to read more of the article  
 DigitalOcean  
[http://do.co/bsdnow](http://do.co/bsdnow)

### OpenBSD gains Wi-Fi “auto-join” ###

In a change which is bound to be welcomed widely, -current has gained “auto-join” for Wi-Fi networks. Peter Hessler (phessler@) has been working on this for quite some time and he wrote about it in his p2k18 hackathon report. He has committed the work from the g2k18 hackathon in Ljubljana:

CVSROOT: /cvs  
 Module name: src  
 Changes by: [phessler@cvs.openbsd.org](mailto:phessler@cvs.openbsd.org) 2018/07/11 14:18:09

Modified files:  
 sbin/ifconfig : ifconfig.8 ifconfig.c   
 sys/net80211 : ieee80211\_ioctl.c ieee80211\_ioctl.h   
 ieee80211\_node.c ieee80211\_node.h   
 ieee80211\_var.h

Log message:  
 Introduce 'auto-join' to the wifi 802.11 stack.

This allows a system to remember which ESSIDs it wants to connect to, any  
 relevant security configuration, and switch to it when the network we are  
 currently connected to is no longer available.  
 Works when connecting and switching between WPA2/WPA1/WEP/clear encryptions.

example hostname.if:  
 join home wpakey password  
 join work wpakey mekmitasdigoat  
 join open-lounge  
 join cafe wpakey cafe2018  
 join "wepnetwork" nwkey "12345"  
 dhcp  
 inet6 autoconf  
 up

OK stsp@ reyk@  
 and enthusiasm from every hackroom I've been in for the last 3 years  
 The usage should be clear from the commit message, but basically you ‘join’ all the networks you want to auto-join as you would previously use ‘nwid’ to connect to one specific network. Then the kernel will join the network that’s actually in range and do the rest automagically for you. When you move out of range of that network you lose connectivity until you come in range of the original (where things will continue to work as you’ve been used to) or one of the other networks (where you will associate and then get a new lease).

Thanks to Peter for working on this feature - something many a Wi-Fi using OpenBSD user will be able to benefit from.

### FreeBSD Jails the hard way ###

There are many great options for managing FreeBSD Jails. iocage, warden and ez-jail aim to streamline the process and make it quick an easy to get going. But sometimes the tools built right into the OS are overlooked.

This post goes over what is involved in creating and managing jails using only the tools built into FreeBSD.

For this guide, I’m going to be putting my jails in /usr/local/jails.

I’ll start with a very simple, isolated jail. Then I’ll go over how to use ZFS snapshots, and lastly nullfs mounts to share the FreeBSD base files with multiple jails.

I’ll also show some examples of how to use the templating power of jail.conf to apply similar settings to all your jails.

Full Jail  
 Make a directory for the jail, or a zfs dataset if you prefer.  
 Download the FreeBSD base files, and any other parts of FreeBSD you want. In this example I’ll include the 32 bit libraries as well.  
 Update your FreeBSD base install.  
 Verify your download. We’re downloading these archives over FTP after all, we should confirm that this download is valid and not tampered with. The freebsd-update IDS command verifies the installation using a PGP key which is in your base system, which was presumably installed with an ISO that you verified using the FreeBSD signed checksums. Admittedly this step is a bit of paranoia, but I think it’s prudent.  
 Make sure you jail has the right timezone and dns servers and a hostname in rc.conf.  
 Edit jail.conf with the details about your jail.  
 Start and login to your jail.  
 11 commands and a config file, but this is the most tedious way to make a jail. With a little bit of templating it can be even easier. So I’ll start by making a template. Making a template is basically the same as steps 1, 2 and 3 above, but with a different destination folder, I’ll condense them here.

Creating a template  
 Create a template or a ZFS dataset. If you’d like to use the zfs clone method of deploying templates, you’ll need to create a zfs dataset instead of a folder.  
 Update your template with freebsd-update.  
 Verify your install  
 And that’s it, now you have a fully up to date jail template. If you’ve made this template with zfs, you can easily deploy it using zfs snapshots.

Deploying a template with ZFS snapshots  
 Create a snapshot. My last freebsd-update to my template brought it to patch level 17, so I’ll call my snapshot p10.  
 Clone the snapshot to a new jail.  
 Configure the jail hostname.  
 Add the jail definition to jail.conf, make sure you have the global jail settings from jail.conf listed in the fulljail example.  
 Start the jail.  
 The downside with the zfs approach is that each jail is now a fully independent, and if you need to update your jails, you have to update them all individually. By sharing a template using nullfs mounts you can have only one copy of the base system that only needs to be updated once.

Follow the link to see the rest of the article about  
 Thin jails using NullFS mounts  
 Simplifying jail.conf  
 Hopefully this has helped you understand the process of how to create and manage FreeBSD jails without tools that abstract away all the details. Those tools are often quite useful, but there is always benefit in learning to do things the hard way. And in this case, the hard way doesn’t seem to be that hard after all.

Beastie Bits
----------

Meetup in Zurich #4, July edition (July 19) – Which you likely missed, but now you know to look for the August edition!  
 The next two BSD-PL User group meetings in Warsaw have been scheduled for July 30th and Aug 9th @ 1830 CEST – Submit your topic proposals now  
 Linux Geek Books - Humble Bundle  
 Extend loader(8) geli support to all architectures and all disk-like devices  
 Upgrading from a bootpool to a single encrypted pool – skip the gptzfsboot part, and manually update your EFI partition with loader.efi  
 The pkgsrc 2018Q2 for Illumos is available with 18500+ binary packages  
 NetBSD ARM64 Images Available with SMP for RPi3 / NanoPi / Pine64 Boards  
 Recently released CDE 2.3.0 running on Tribblix (Illumos)  
 An Interview With Tech & Science Fiction Author Michael W Lucas  
 A reminder : MeetBSD CFP  
 EuroBSDCon talk acceptances have gone out, and once the tutorials are confirmed, registration will open. That will likely have happened by time you see this episode, so go register! See you in Romania  
 Tarsnap

Feedback/Questions
----------

Wilyarti - Adblocked on FreeBSD Continued…  
 Andrew - A Question and a Story  
 Matthew - Thanks  
 Brian - PCI-E Controller  
 Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)