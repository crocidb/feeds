+++
title = "220: Opening ZFS in 2017"
description = "We have a first PS4 kernel exploit, the long awaited OpenZFS devsummit report by Allan, DragonflyBSD 5.0 is out, we show you vmadm to manage jails, and parallel processing with Unix tools.This episode was brought to you by[![iXsystems - Enterprise Servers and Storage fo"
date = "2017-11-15T13:00:00Z"
url = "https://www.bsdnow.tv/220"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.827682361Z"
seen = true
+++

We have a first PS4 kernel exploit, the long awaited OpenZFS devsummit report by Allan, DragonflyBSD 5.0 is out, we show you vmadm to manage jails, and parallel processing with Unix tools.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [The First PS4 Kernel Exploit: Adieu](https://fail0verflow.com/blog/2017/ps4-namedobj-exploit/) ###

* The First PS4 Kernel Exploit: Adieu

>
>
> Plenty of time has passed since we first demonstrated Linux running on the PS4. Now we will step back a bit and explain how we managed to jump from the browser process into the kernel such that ps4-kexec et al. are usable. Over time, ps4 firmware revisions have progressively added many mitigations and in general tried to lock down the system. This post will mainly touch on vulnerabilities and issues which are not present on the latest releases, but should still be useful for people wanting to investigate ps4 security.
>
>

* Vulnerability Discovery

>
>
> As previously explained, we were able to get a dump of the ps4 firmware 1.01 kernel via a PCIe man-in-the-middle attack. Like all FreeBSD kernels, this image included export symbols - symbols which are required to perform kernel and module initialization processes. However, the ps4 1.01 kernel also included full ELF symbols (obviously an oversight as they have been removed in later firmware versions). This oversight was beneficial to the reverse engineering process, although of course not a true prerequisite. Indeed, we began exploring the kernel by examining built-in metadata in the form of the syscall handler table - focusing on the ps4-specific entries.  
>  Each process object in the kernel contains its own idt (ID Table) object. As can be inferred from the snippet above, the hash table essentially just stores pointers to opaque data blobs, along with a given kind and name. Entries may be accessed (and thus locked) with either read or write intent. Note that IDT\_TYPE is not a bitfield consisting of only unique powers of 2. This means that if we can control the kind of an id\_entry, we may be able to cause a type confusion to occur (it is assumed that we may control name).
>
>

* Exploitation

>
>
> To an exploiter without ps4 background, it might seem that the easiest way to exploit this bug would be to take advantage of the write off the end of the mallocd namedobj\_usr\_t object. However, this turns out to be impossible (as far as I know) because of a side effect of the ps4 page size being changed to 0x4000 bytes (from the normal of 0x1000). It appears that in order to change the page size globally, the ps4 kernel developers opted to directly change the related macros. One of the many changes resulting from this is that the smallest actual amount of memory which malloc may give back to a caller becomes 0x40 bytes. While this also results in tons of memory being completely wasted, it does serve to nullify certain exploitation techniques (likely completely by accident).
>
>

* Adieu

>
>
> The namedobj exploit was present and exploitable (albeit using a slightly different method than described here) until it was fixed in firmware version 4.06. This vulnerability was also found and exploited by (at least) Chaitin Tech, so props to them! Taking a quick look at the 4.07 kernel, we can see a straightforward fix (4.06 is assumed to be identical - only had 4.07 on hand while writing this post):
>
>
>
> ```
> int sys_namedobj_create(struct thread *td, void *args) {
>   // ...
>   rv = EINVAL;
>   kind = *((_DWORD *)args + 4)
>   if ( !(kind & 0x4000) && *(_QWORD *)args ) {
>     // ... (unchanged)
>   }
>   return rv;
> }
>
> ```
>
>
>
> And so we say goodbye to a nice exploit. I hope you enjoyed this blast from the past :) Keep hacking!
>
>

---

### [OpenZFS Developer Summit 2017 Recap](https://www.ixsystems.com/blog/openzfs-devsummit-2017/) ###

>
>
> The 5th annual OpenZFS Developer Summit was held in San Francisco on October 24-25. Hosted by Delphix at the Childrens Creativity Museum in San Francisco, over a hundred OpenZFS contributors from a wide variety of companies attended and collaborated during the conference and developer summit. iXsystems was a Gold sponsor and several iXsystems employees attended the conference, including the entire Technical Documentation Team, the Director of Engineering, the Senior Analyst, a Tier 3 Support Engineer, and a Tier 2 QA Engineer.  
>  Day 1 of the conference had 9 highly detailed, informative, and interactive technical presentations from companies which use or contribute to OpenZFS. The presentations highlighted improvements to OpenZFS developed in-house at each of these companies, with most improvements looking to be made available to the entire OpenZFS community in the near to long term. Theres a lot of exciting stuff happening in the OpenZFS community and this post provides an overview of the presented features and proof-of-concepts.  
>  The keynote was delivered by Mark Maybee who spoke about the past, present, and future of ZFS at Oracle. An original ZFS developer, he outlined the history of closed-source ZFS development after Oracles acquisition of Sun. ZFS has a fascinating history, as the project has evolved over the last decade in both open and closed source forms, independent of one another. While Oracles proprietary internal version of ZFS has diverged from OpenZFS, it has implemented many of the same features. Mark was very proud of the work his team had accomplished over the years, claiming Oracles ZFS products have accounted for over a billion dollars in sales and are used in the vast majority of Fortune 100 companies. However, with Oracle aggressively moving into cloud storage, the future of closed source ZFS is uncertain. Mark presented a few ideas to transform ZFS into a mainstream and standard file system, including adding more robust support for Linux.  
>  Allan Jude from ScaleEngine talked about ZStandard, a new compression method he is developing in collaboration with Facebook. It offers compression comparable to gzip, but at speeds fast enough to keep up with hard drive bandwidth. According to early testing, it improves both the speed and compression efficiency over the current LZ4 compression algorithm. It also offers a new dictionary feature for improving image compression, which is of particular interest to Facebook. In addition, when using ZFS send and receive, it will adapt the compression ratio to make the most efficient use of the network bandwidth.  
>  Currently, deleting a clone on ZFS is a time-consuming process, especially when dealing with large datasets that have diverged over time. Sara Hartse from Delphix described how clone fast delete speeds up clone deletion. Rather than traversing the entire dataset during clone deletion, changes to the clone are tracked in a live list which the delete process uses to determine which blocks to free. In addition, rather than having to wait for the clone to finish, the delete process backgrounds the task so you can keep working without any interruptions. Sara shared the findings of a test they ran on a clone with 500MB of data, which took 45 minutes to delete with the old method, and under a minute using the live list. This behavior is an optional property as it may not be appropriate for long-lived clones where deletion times are not a concern. At this time, it does not support promoted clones.  
>  Olaf Faaland from Lawrence Livermore National Labs demonstrated the progress his team has made to improve ZFS pool imports with MMP (Multi-Modifier Protection), a watchdog system to make sure that ZFS pools in clustered High Availability environments are not imported by more than one host at a time. MMP uses uberblocks and other low-level ZFS features to monitor pool import status and otherwise safeguard the import process. MMP adds fields to on-disk metadata so it does not depend on hardware, such as SAS. It supports multi-node HA configs and does not affect non-HA systems. However, it does have issues with long I/O delays so existing HA software is recommended as an additional fallback.  
>  Jörgen Lundman of GMO Internet gave an entertaining talk on the trials and tribulations of porting ZFS to OS X. As a bonus, he talked about porting ZFS to Windows, and showed a working demo. While not yet in a usable state, it demonstrated a proof-of-concept of ZFS support for other platforms.  
>  Serapheim Dimitropoulos from Delphix discussed Faster Allocation with the Log Spacemap as a means of optimizing ZFS allocation performance. He began with an in-depth overview of metaslabs and how log spacemaps are used to track allocated and freed blocks. Since blocks are only allocated from loaded metaslabs but freed blocks may apply to any metaslab, over time logging the freed blocks to each appropriate metaslab with every txg becomes less efficient. Their solution is to create a pool-wide metaslab for unflushed entries.  
>  Shailendra Tripathi from Tegile presented iFlash: Dynamic Adaptive L2ARC Caching. This was an interesting talk on what is required to allow very different classes of resources to share the same flash devicein their case, ZIL, L2ARC, and metadata. To achieve this, they needed to address the following differences for each class: queue priority, metaslab load policy, allocation, and data protection (as cache has no redundancy).  
>  Isaac Huang of Intel introduced DRAID, or parity declustered RAID. Once available, this will provide the same levels of redundancy as traditional RAIDZ, providing the administrator doubles the amount of options for providing redundancy for their use case. The goals of DRAID are to address slow resilvering times and the write throughput of a single replacement drive being a bottleneck. This solution skips block pointer tree traversal when rebuilding the pool after drive failure, which is the cause of long resilver times. This means that redundancy is restored quickly, mitigating the risk of losing additional drives before the resilver completes, but it does require a scrub afterwards to confirm data integrity. This solution supports logical spares, which must be defined at vdev creation time, which are used to quickly restore the array.  
>  Prakash Surya of Delphix described how ZIL commits currently occur in batches, where waiting threads have to wait for the batch to complete. His proposed solution was to replace batch commits and to instead notify the waiting thread after its ZIL commit in order to greatly increase throughput. A new tunable for the log write block timeout can also be used to log write blocks more efficiently.  
>  Overall, the quality of the presentations at the 2017 OpenZFS conference was high. While quite technical, they clearly explained the scope of the problems being addressed and how the proposed solutions worked. We look forward to seeing the described features integrated into OpenZFS. The videos and slides for the presentations should be made available over the next month or so at the OpenZFS website.
>
>

* [OpenZFS Photo Album](https://photos.google.com/share/AF1QipNxYQuOm5RDxRgRQ4P8BhtoLDpyCuORKWiLPT0WlvUmZYDdrX3334zu5lvY_sxRBA?key=MW5fR05MdUdPaXFKVDliQVJEb3N3Uy1uMVFFdVdR)

---

### [DragonflyBSD 5.0](https://www.dragonflybsd.org/release50/) ###

* DragonFly version 5.0 brings the first bootable release of HAMMER2, DragonFly's next generation file system.
* HAMMER2
  * Preliminary HAMMER2 support has been released into the wild as-of the 5.0 release. This support is considered EXPERIMENTAL and should generally not yet be used for production machines and important data. The boot loader will support both UFS and HAMMER2 /boot. The installer will still use a UFS /boot even for a HAMMER2 installation because the /boot partition is typically very small and HAMMER2, like HAMMER1, does not instantly free space when files are deleted or replaced.
  * DragonFly 5.0 has single-image HAMMER2 support, with live dedup (for cp's), compression, fast recovery, snapshot, and boot support. HAMMER2 does not yet support multi-volume or clustering, though commands for it exist. Please use non-clustered single images for now.

* ipfw Updates
  * IPFW has gone through a number of updates in DragonFly and now offers better performance. pf and ipfw3 are also still supported.

* Improved graphics support
  * The i915 driver has been brought up to match what's in the Linux 4.7.10 kernel. Intel GPUs are supported up to the Kabylake generation.
  * vga\_switcheroo(4) module added, allowing the use of Intel GPUs on hybrid-graphics systems.
  * The new apple\_gmux driver enables switching to the Intel video chipset on dual Intel/NVIDIA and Intel/Radeon Macbook computers.

* Other user-affecting changes
  * efisetup(8) added.
  * DragonFly can now support over 900,000 processes on a single machine.
  * Client-side SSH by default does not try password authentication, which is the default behavior in newer versions of OpenSSH. Pass an explicit '-o PasswordAuthentication=yes' or change /etc/ssh/ssh\_config if you need the old behavior. Public key users are unaffected.

* Clang status
  * A starting framework has been added for using clang as the alternate base compiler in DragonFly, to replace gcc 4.7. It's not yet complete. Clang can of course be added as a package.

* Package updates
  * Many package updates but I think most notably we need to point to chrome60 finally getting into dports with accelerated video and graphics support.

* 64-bit status
  * Note that DragonFly is a 64-bit-only operating system as of 4.6, and will not run on 32-bit hardware.
  * AMD Ryzen is supported and DragonFly 5.0 has a workaround for a [hardware bug](http://lists.dragonflybsd.org/pipermail/commits/2017-August/626190.html).

* DragonFly quickly released a v5.0.1 with a few patches [Download link](https://www.dragonflybsd.org/download/)

---

News Roundup
----------

### [(r)vmadm  managing FreeBSD jails](https://blog.project-fifo.net/rvmadm-managing-freebsd-jails/) ###

>
>
> We are releasing the first version (0.1.0) of our clone of vmadm for FreeBSD jails today. It is not done or feature complete, but it does provides basic functionality. At this point, we think it would be helpful to get it out there and get some feedback. As of today, it allows basic management of datasets, as well as creating, starting, stopping, and destroying jails.
>
>

* Why another tool to manage jails

>
>
> However, before we go into details lets talk why we build yet another jail manager? It is not the frequent NIH syndrome, actually quite the opposite. In FiFo 0.9.2 we experimented with iocage as a way to control jails. While iocage is a useful tool when used as a CLI utility it has some issues when used programmatically.  
>  When managing jails automatically and not via a CLI tool things like performance, or a machine parsable interface matter. While on a CLI it is acceptable if a call takes a second or two, for automatically consuming a tool this delay is problematic.  
>  Another reason for the decision was that vmadm is an excellent tool. It is very well designed. SmartOs uses vmadm for years now. Given all that, we opted for adopting a proven interface rather than trying to create a new one. Since we already interface with it on SmartOS, we can reuse a majority of our management code between SmartOS and FreeBSD.
>
>

* What can we do

>
>
> Today we can manage datasets, which are jail templates in the form of ZFS volumes. We can list and serve them from a dataset-server, and fetch those we like want. At this point, we provide datasets for FreeBSD 10.0 to 11.1, but it is very likely that the list will grow. As an idea [here is a community-driven list of datasets](https://datasets.at/) that exist for SmartOS today. Moreover, while those datasets will not work, we hope to see the same for BSD jails.  
>  After fetching the dataset, we can define jails by using a JSON file. This file is compatible with the zone description used on SmartOS. It does not provide all the same features but a subset. Resources such as CPU and memory can be defined, networking configured, a dataset selected and necessary settings like hostname set.  
>  With the jail created, vmadm allows managing its lifetime, starting, stopping it, accessing the console and finally destroying it. Updates to jails are supported to however as of today they are only taken into account after restarting the jail. However, this is in large parts not a technical impossibility but rather wasnt high up on the TODO list.  
>  It is worth mentioning that vmadm will not pick up jails created in other tools or manually. Only using vmadm created jails was a conscious decision to prevent it interfering with existing setups or other utilities. While conventional tools can manage jails set up with vmadm just fine we use some special tricks like nested jails to allow for restrictions required for multi-tenancy that are hard or impossible to achieve otherwise.
>
>

* Whats next

>
>
> First and foremost we hope to get some feedback and perhaps community engagement. In the meantime, as [announced earlier this year](https://blog.project-fifo.net/fifo-in-2017/), we are hard at work integrating FreeBSD hypervisors in FiFo, and as of writing this, the core actions work quite well.  
>  Right now only the barebone functions are supported, some of the output is not as clear as we would like. We hope to eventually add support for behyve to vmadm the same way that it supports KVM on SmartOS. Moreover, the groundwork for this already exists in the nested jail techniques we are using.  
>  Other than that we are exploring ways to allow for PCI pass through in jails, something not possible in SmartOS zones right now that would be beneficial for some users.  
>  In general, we want to improve compatibility with SmartOS as much as possible and features that we add over time should make the specifications invalid for SmartOS.
>
>

* You can get the tool [from github](https://github.com/project-fifo/r-vmadm). \*\*\*

### [Parallel processing with unix tools](http://www.pixelbeat.org/docs/unix-parallel-tools.html) ###

* There are various ways to use parallel processing in UNIX:

>
>
> piping  
>  An often under appreciated idea in the unix pipe model is that the components of the pipe run in parallel. This is a key advantage leveraged when combining simple commands that do "one thing well"  
>  split -n, xargs -P, parallel  
>  Note programs that are invoked in parallel by these, need to output atomically for each item processed, which the GNU coreutils are careful to do for factor and sha\*sum, etc. Generally commands that use stdio for output can be wrapped with the `stdbuf -oL` command to avoid intermixing lines from parallel invocations  
>  make -j  
>  Most implementations of make(1) now support the -j option to process targets in parallel. make(1) is generally a higher level tool designed to process disparate tasks and avoid reprocessing already generated targets. For example it is used very effictively when testing coreutils where about 700 tests can be processed in 13 seconds on a 40 core machine.  
>  implicit threading  
>  This goes against the unix model somewhat and definitely adds internal complexity to those tools. The advantages can be less data copying overhead, and simpler usage, though its use needs to be carefully considered. A disadvantage is that one loses the ability to easily distribute commands to separate systems. Examples are GNU sort(1) and turbo-linecount
>
>

* The example provided counts lines in parallel:

>
>
> The examples below will compare the above methods for implementing multi-processing, for the function of counting lines in a file. First of all let's generate some test data. We use both long and short lines to compare the overhead of the various methods compared to the core cost of the function being performed:  
>  $ seq 100000000 \> lines.txt # 100M lines  
>  $ yes $(yes longline | head -n9) | head -n10000000 \> long-lines.txt # 10M lines
>
>
>
> We'll also define the add() { paste -d+ -s | bc; } helper function to add a list of numbers.  
>  Note the following runs were done against cached files, and thus not I/O bound. Therefore we limit the number of processes in parallel to $(nproc), though you would generally benefit to raising that if your jobs are waiting on network or disk etc.
>
>
>
> * We'll use this command to count lines for most methods, so here is the base non multi-processing performance for comparison: $ time wc -l lines.txt $ time wc -l long-lines.txt split -n Note using -n alone is not enough to parallelize. For example this will run serially with each chunk, because since --filter may write files, the -n pertains to the number of files to split into rather than the number to process in parallel. $ time split -n$(nproc) --filter='wc -l' lines.txt | add
>
>

* You can either run multiple invocations of split in parallel on separate portions of the file like:

>
>
> $ time for i in $(seq $(nproc)); do  
>  split -n$i/$(nproc) lines.txt | wc -l&  
>  done | add
>
>

* Or split can do parallel mode using round robin on each line, but that's huge overhead in this case. (Note also the -u option significant with -nr):

>
>
> $ time split -nr/$(nproc) --filter='wc -l' lines.txt | add
>
>

* Round robin would only be useful when the processing per item is significant.
* Parallel isn't well suited to processing a large single file, rather focusing on distributing multiple files to commands. It can't efficiently split to lightweight processing if reading sequentially from pipe:

>
>
> $ time parallel --will-cite --block=200M --pipe 'wc -l' \< lines.txt | add
>
>

* Like parallel, xargs is designed to distribute separate files to commands, and with the -P option can do so in parallel. If you have a large file then it may be beneficial to presplit it, which could also help with I/O bottlenecks if the pieces were placed on separate devices:

>
>
> split -d -n l/$(nproc) lines.txt l.  
>  Those pieces can then be processed in parallel like:  
>  $ time find -maxdepth 1 -name 'l.\*' |  
>  xargs -P$(nproc) -n1 wc -l | cut -f1 -d' ' | add
>
>

* If your file sizes are unrelated to the number of processors then you will probably want to adjust -n1 to batch together more files to reduce the number of processes run in total. Note you should always specify -n with -P to avoid xargs accumulating too many input items, thus impacting the parallelism of the processes it runs.
* make(1) is generally used to process disparate tasks, though can be leveraged to provide low level parallel processing on a bunch of files. Note also the make -O option which avoids the need for commands to output their data atomically, letting make do the synchronization. We'll process the presplit files as generated for the xargs example above, and to support that we'll use the following Makefile:

>
>
> %: FORCE # Always run the command  
>  @wc -l \< $@  
>  FORCE: ;  
>  Makefile: ; # Don't include Makefile itself
>
>

* One could generate this and pass to make(1) with the -f option, though we'll keep it as a separate Makefile here for simplicity. This performs very well and matches the performance of xargs.

>
>
> $ time find -name 'l.\*' -exec make -j$(nproc) {} + | add  
>  Note we use the POSIX specified "find ... -exec ... {} +" construct, rather than conflating the example with xargs. This construct like xargs will pass as many files to make as possible, which make(1) will then process in parallel.
>
>
> ---
>

### [OpenBSD gives a hint on forgetting unlock mutex](http://nanxiao.me/en/openbsd-gives-a-hint-on-forgetting-unlock-mutex/) ###

* OpenBSD gives a hint on forgetting unlock mutex
* Check following simple C++ program: \> ``` #include

int main(void)  
 {  
 std::mutex m;  
 m.lock();

```
return 0;

```

}

```

+ The mutex m forgot unlock itself before exiting main function:

> ```
m.unlock();

```

* Test it on GNU/Linux, and I chose ArchLinux as the testbed:

>
>
> ```
> $ uname -a
> Linux fujitsu-i 4.13.7-1-ARCH #1 SMP PREEMPT Sat Oct 14 20:13:26 CEST 2017 x86_64 GNU/Linux
> $ clang++ -g -pthread -std=c++11 test_mutex.cpp
> $ ./a.out
> $
>
> ```
>
>

* The process exited normally, and no more words was given. Build and run it on OpenBSD 6.2:

>
>
> ```
> clang++ -g -pthread -std=c++11 test_mutex.cpp
> ./a.out
> pthread_mutex_destroy on mutex with waiters!
>
> ```
>
>

* The OpenBSD prompts pthread\_mutex\_destroy on mutex with waiters!. Interesting! \*\*\*

Beastie Bits
----------

* [Updates to the NetBSD operating system since OSHUG #57 & #58](http://mailman.uk.freebsd.org/pipermail/ukfreebsd/2017-October/014148.html)
* [Creating a jail with FiFo and Digital Ocean](https://blog.project-fifo.net/fifo-jails-digital-ocean/)
* [I'm thinking about OpenBSD again](http://stevenrosenberg.net/blog/bsd/openbsd/2017_0924_openbsd)
* [Kernel ASLR on amd64](https://blog.netbsd.org/tnf/entry/kernel_aslr_on_amd64)
* [Call for Participation - BSD Devroom at FOSDEM](https://people.freebsd.org/~rodrigo/fosdem18/)
* [BSD Stockholm Meetup](https://www.meetup.com/BSD-Users-Stockholm/) \*\*\*

Feedback/Questions
----------

* architect - [vBSDCon](http://dpaste.com/15D5SM4#wrap)
* Brad - [Packages and package dependencies](http://dpaste.com/3MENN0X#wrap)
* Lars - [dpb](http://dpaste.com/2SVS18Y)
* Alex [re: PS4 Network Throttling](http://dpaste.com/028BCFA#wrap) \*\*\*