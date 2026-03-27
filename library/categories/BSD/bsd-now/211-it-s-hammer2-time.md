+++
title = "211: It's HAMMER2 Time!"
description = "We explore whether a BSD can replicate Cisco router performance; RETGUARD, OpenBSDs new exploit mitigation technology, Dragonflys HAMMER2 filesystem implementation & more!This episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Open Source](/"
date = "2017-09-13T12:00:00Z"
url = "https://www.bsdnow.tv/211"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.852517313Z"
seen = false
+++

We explore whether a BSD can replicate Cisco router performance; RETGUARD, OpenBSDs new exploit mitigation technology, Dragonflys HAMMER2 filesystem implementation & more!

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Can a BSD system replicate the performance of a Cisco router?](https://www.reddit.com/r/networking/comments/6upchy/can_a_bsd_system_replicate_the_performance_of/) ###

* Short Answer: No, but it might be good enough for what you need

>
>
> Traditionally routers were built with a tightly coupled data plane and control plane. Back in the 80s and 90s the data plane was running in software on commodity CPUs with proprietary software. As the needs and desires for more speeds and feeds grew, the data plane had to be implemented in ASICs and FPGAs with custom memories and TCAMs. While these were still programmable in a sense, they certainly weren't programmable by anyone but a small handful of people who developed the hardware platform. The data plane was often layered, where features not handled by the hardware data plane were punted to a software only data path running on a more general CPU. The performance difference between the two were typically an order or two of magnitude. [source](https://fd.io/wp-content/uploads/sites/34/2017/07/FDioVPPwhitepaperJuly2017.pdf)
>
>
>
> Except for encryption (e.g. IPsec) or IDS/IPS, the true measure of router performance is packets forwarded per unit time. This is normally expressed as Packets-per-second, or PPS. To 'line-rate' forward on a 1gbps interface, you must be able to forward packets at 1.488 million pps (Mpps). To forward at "line-rate" between 10Gbps interfaces, you must be able to forward at 14.88Mpps.  
>  Even on large hardware, kernel-forwarding is limited to speeds that top out below 2Mpps. George Neville-Neil and I did a couple papers on this back in 2014/2015. You can read [the papers](https://github.com/freebsd-net/netperf/blob/master/Documentation/Papers/ABSDCon2015Paper.pdf) for the results.
>
>
>
> However, once you export the code from the kernel, things start to improve. There are a few open source code bases that show the potential of kernel-bypass networking for building a software-based router. The first of these is netmap-fwd which is the FreeBSD ip\_forward() code hosted on top of netmap, a kernel-bypass technology present in FreeBSD (and available for linux). Full-disclosure, netmap-fwd was done at my company, Netgate. netmap-fwd will l3 forward around 5 Mpps per core. [slides](https://github.com/Netgate/netmap-fwd/blob/master/netmap-fwd.pdf)
>
>
>
> The first of these is [netmap-fwd](https://github.com/Netgate/netmap-fwd) which is the FreeBSD ip\_forward() code hosted on top of [netmap](https://github.com/luigirizzo/netmap), a kernel-bypass technology present in FreeBSD (and available for linux). Full-disclosure, netmap-fwd was done at my company, Netgate. (And by "my company" I mean that I co-own it with my spouse.). netmap-fwd will l3 forward around 5 Mpps per core. [slides](https://github.com/Netgate/netmap-fwd/blob/master/netmap-fwd.pdf)
>
>
>
> Nanako Momiyama of the Keio Univ Tokuda Lab presented on [IP Forwarding Fastpath](https://www.bsdcan.org/2017/schedule/events/823.en.html) at BSDCan this past May. She got about 5.6Mpps (roughly 10% faster than netmap-fwd) using a similar approach where the ip\_foward() function was rewritten as a module for VALE (the netmap-based in-kernel switch). [Slides](https://2016.eurobsdcon.org/PresentationSlides/NanakoMomiyama_TowardsFastIPForwarding.pdf) from her previous talk at EuroBSDCon 2016 are available. (Speed at the time was 2.8Mpps.). Also a [paper](https://www.ht.sfc.keio.ac.jp/~nanako/conext17-sw.pdf) from that effort, if you want to read it. Of note: They were showing around 1.6Mpps even after replacing the in-kernel routing lookup algorithm with DXR. (DXR was written by Luigi Rizzo, who is also the primary author of netmap.)
>
>
>
> Not too long after netmap-fwd was open sourced, Ghandi announced packet-journey, an application based on drivers and libraries and from DPDK. Packet-journey is also an L3 router. The GitHub page for packet-journey lists performance as 21,773.47 mbps (so 21.77Gbps) for 64-byte UDP frames with 50 ACLs and 500,000 routes. Since they're using 64-byte frames, this translates to roughly 32.4Mpps.  
>  Finally, there is recent work in FreeBSD (which is part of 11.1-RELEASE) that gets performance up to 2x the level of netmap-fwd or the work by Nanako Momiyama. 10 million PPS: [Here](http://blog.cochard.me/2015/09/receipt-for-building-10mpps-freebsd.html) is a decent introduction.
>
>

* But of course, even as FreeBSD gets up to being able to do 10gbps at line-rate, 40 and 100 gigabits are not uncommon now

>
>
> Even with the fastest modern CPUs, this is very little time to do any kind of meaningful packet processing. At 10Gbps, your total budget per packet, to receive (Rx) the packet, process the packet, and transmit (Tx) the packet is 67.2 ns. Complicating the task is the simple fact that main memory (RAM) is 70 ns away. The simple conclusion here is that, even at 10Gbps, if you have to hit RAM, you can't generate the PPS required for line-rate forwarding.
>
>

* There is some detail about design tradeoffs in the Ryzen architecture and how that might impact using those machines as routers

>
>
> Anyway... those are all interesting, but the natural winner here is FD.io's Vector Packet Processing (VPP). [Read this](http://blogs.cisco.com/sp/a-bigger-helping-of-internet-please)  
>  VPP is an efficient, flexible open source data plane. It consists of a set of forwarding nodes arranged in a directed graph and a supporting framework. The framework has all the basic data structures, timers, drivers (and interfaces to both DPDK and netmap), a scheduler which allocates the CPU time between the graph nodes, performance and debugging tools, like counters and built-in packet trace. The latter allows you to capture the paths taken by the packets within the graph with high timestamp granularity, giving full insight into the processing on a per-packet level.  
>  The net result here is that Cisco (again, Cisco) has shown the ability to route packets at 1 Tb/s using VPP on a four socket Purley system
>
>

* There is also much discussion of the future of pfSense, as they transition to using VPP
* This is a very lengthy write up which deserves a full read, plus there are some comments from other people \*\*\*

### [RETGUARD, the OpenBSD next level in exploit mitigation, is about to debut](https://marc.info/?l=openbsd-tech&m=150317547021396&w=2) ###

>
>
> This year I went to BSDCAN in Ottawa. I spent much of it in the 'hallway track', and had an extended conversation with various people regarding our existing security mitigations and hopes for new ones in the future. I spoke a lot with Todd Mortimer. Apparently I told him that I felt return-address protection was impossible, so a few weeks later he sent a clang diff to address that issue...  
>  The first diff is for amd64 and i386 only -- in theory RISC architectures can follow this approach soon.  
>  The mechanism is like a userland 'stackghost' in the function prologue and epilogue. The preamble XOR's the return address at top of stack with the stack pointer value itself. This perturbs by introducing bits from ASLR. The function epilogue undoes the transform immediately before the RET instruction. ROP attack methods are impacted because existing gadgets are transformed to consist of "  RET". That pivots the return sequence off the ROP chain in a highly unpredictable and inconvenient fashion.  
>  The compiler diff handles this for all the C code, but the assembly functions have to be done by hand. I did this work first for amd64, and more recently for i386. I've fixed most of the functions and only a handful of complex ones remain.  
>  For those who know about polymorphism and pop/jmp or JOP, we believe once standard-RET is solved those concerns become easier to address seperately in the future. In any case a substantial reduction of gadgets is powerful.  
>  For those worried about introducing worse polymorphism with these "xor; ret" epilogues themselves, the nested gadgets for 64bit and 32bit variations are +1 "xor %esp,(%rsp); ret", +2 "and $0x24,%al; ret" and +3 "and $0xc3,%al; int3". Not bad.  
>  Over the last two weeks, we have received help and advice to ensure debuggers (gdb, egdb, ddb, lldb) can still handle these transformed callframes. Also in the kernel, we discovered we must use a smaller XOR, because otherwise userland addresses are generated, and cannot rely on SMEP as it is really new feature of the architecture. There were also issues with pthreads and dlsym, which leads to a series of uplifts around \_\_builtin\_return\_address and DWARF CFI.  
>  Application of this diff doesn't require anything special, a system can simply be built twice. Or shortcut by building & installing gnu/usr.bin/clang first, then a full build.  
>  We are at the point where userland and base are fully working without regressions, and the remaining impacts are in a few larger ports which directly access the return address (for a variety of reasons).  
>  So work needs to continue with handling the RET-addr swizzle in those ports, and then we can move forward.
>
>

* You can find the full message with the diff [here](https://marc.info/?l=openbsd-tech&m=150317547021396&w=2) \*\*\*

Interview - Ed Maste, Charlie & Siva - [@ed\_maste](https://twitter.com/ed_maste), [@yzgyyang](https://twitter.com/yzgyyang) & [@svmhdvn](https://twitter.com/svmhdvn)
----------

* Co-op Students for the FreeBSD Foundation \*\*\*

News Roundup
----------

### [Next DFly release will have an initial HAMMER2 implementation](http://lists.dragonflybsd.org/pipermail/users/2017-August/313558.html) ###

>
>
> The next DragonFly release (probably in September some time) will have an initial HAMMER2 implementation. It WILL be considered experimental and won't be an installer option yet. This initial release will only have single-image support operational plus basic features. It will have live dedup (for cp's), compression, fast recovery, snapshot, and boot support out of the gate.  
>  This first H2 release will not have clustering or multi-volume support, so don't expect those features to work. I may be able to get bulk dedup and basic mirroring operational by release time, but it won't be very efficient. Also, right now, sync operations are fairly expensive and will stall modifying operations to some degree during the flush, and there is no reblocking (yet). The allocator has a 16KB granularity (on HAMMER1 it was 2MB), so for testing purposes it will still work fairly well even without reblocking.  
>  The design is in a good place. I'm quite happy with how the physical layout turned out. Allocations down to 1KB are supported. The freemap has a 16KB granularity with a linear counter (one counter per 512KB) for packing smaller allocations. INodes are 1KB and can directly embed 512 bytes of file data for files \<= 512 bytes, or have four top-level blockrefs for files \> 512 bytes. The freemap is also zoned by type for I/O locality.  
>  The blockrefs are 'fat' at 128 bytes but enormously powerful. That will allow us to ultimately support up to a 512-bit crypto hash and blind dedup using said hash. Not on release, but that's the plan.  
>  I came up with an excellent solution for directory entries. The 1KB allocation granularity was a bit high but I didn't want to reduce it. However, because blockrefs are now 128 byte entities, and directory entries are hashed just like in H1, I was able to code them such that a directory entry is embedded in the blockref itself and does not require a separate data reference or allocation beyond that. Filenames up to 64 bytes long can be accomodated in the blockref using the check-code area of the blockref. Longer filenames will use an additional data reference hanging off the blockref to accomodate up to 255 char filenames. Of course, a minimum of 1KB will have to be allocated in that case, but filenames are \<= 64 bytes in the vast majority of use cases so it just isn't an issue.  
>  This gives directory entries optimal packing and indexing and is a huge win in terms of performance since blockrefs are arrayed in 16KB and 64KB blocks. In addition, since inodes can embed up to four blockrefs, the directory entries for 'small' directories with \<= 4 entries ('.' and '..' don't count) can actually be embedded in the directory inode itself.  
>  So, generally speaking, the physical layout is in a very happy place. The basics are solid on my test boxes so it's now a matter of implementing as many of the more sophisticated features as I can before release, and continuing to work on the rest after the release.
>
>
> ---
>

### [Removing Some Code](https://www.openssl.org/blog/blog/2017/06/17/code-removal/) ###

>
>
> This is another update on our effort to re-license the OpenSSL software. Our previous post in March was about the launch of our effort to reach all contributors, with the hope that they would support this change.  
>  So far, about 40% of the people have responded. For a project that is as old as OpenSSL (including its predecessor, SSLeay, its around 20 years) thats not bad. Well be continuing our efforts over the next couple of months to contact everyone.  
>  Of those people responding, the vast majority have been in favor of the license change  less then a dozen objected. This post describes what were doing about those and how we came to our conclusions. The goal is to be very transparent and open with our processes.  
>  First, we want to mention that we respect their decision. While it is inconvenient to us, we acknowledge their rights to keep their code under the terms that they originally agreed to. We are asking permission to change the license terms, and it is fully within their rights to say no.  
>  The license website is driven by scripts that are freely available in the license section of our tools repository on GitHub. When we started, we imported every single git commit, looked for anything that resembled an email address, and created tables for each commit, each user we found, and a log that connects users to commits. This did find false positives: sometimes email Message-IDs showed up, and there were often mentions of folks just as a passing side-comment, or because they were in the context diff. (That script is also in the tools repository, of course.)  
>  The user table also has columns to record approval or rejection of the license change, and comments. Most of the comments have been supportive, and (a bit surprisingly) only one or two were obscene.  
>  The whattoremove script finds the users who refused, and all commits they were named in. We then examined each commit  there were 86 in all  and filtered out those that were cherry-picks to other releases. We are planning on only changing the license for the master branch, so the other releases branches arent applicable. There were also some obvious false positives. At the end of this step, we had 43 commits to review.  
>  We then re-read every single commit, looking for what we could safely ignore as not relevant. We found the following:  
>  Nine of them showed up only because the person was mentioned in a comment.  
>  Sixteen of them were changes to the OpenBSD configuration data. The OpenSSL team had completely rewritten this, refactoring all BSD configurations into a common hierarchy, and the config stuff changed a great deal for 1.1.0.  
>  Seven were not copyrightable as because they were minimal changes (e.g., fixing a typo in a comment).  
>  One was a false positive.  
>  This left us with 10 commits. Two of them them were about the CryptoDev engine. We are removing that engine, as can be seen in this PR, but we expect to have a replacement soon (for at least Linux and FreeBSD). As for the other commits, we are removing that code, as can be seen in this first PR. and this second PR. Fortunately, none of them are particularly complex.  
>  Copyright, however, is a complex thing  at times it makes debugging look simple. If there is only one way to write something, then that content isnt copyrightable. If the work is very small, such as a one-line patch, then it isnt copyrightable. We arent lawyers, and have no wish to become such, but those viewpoints are valid. It is not official legal advice, however.  
>  For the next step, we hope that we will be able to put back the code that we removed. We are looking to the community for help, and encourage you to create the appropriate GitHub pull requests. We ask the community to look at that second PR and provide fixes.  
>  And finally, we ask everyone to look at the list of authors and see if their name, or the name of anyone they know, is listed. If so please email us.
>
>
> ---
>

### [deraadt@ moves us to 6.2-beta!](http://undeadly.org/cgi?action=article&sid=20170821133453) ###

>
>
> Theo has just committed the diff that marks the end of the development cycle and the beginning of the testing phase for the upcoming 6.2 release:
>
>

`  
 CVSROOT: /cvs  

 Module name: src  

 Changes by: [deraadt@cvs.openbsd.org](mailto:deraadt@cvs.openbsd.org) 2017/08/20 10:56:43

Modified files:  

 etc/root : root.mail  

 share/mk : sys.mk  

 sys/arch/macppc/stand/tbxidata: bsd.tbxi  

 sys/conf : newvers.sh  

 sys/sys : param.h  

 Log message:  

 crank to 6.2-beta  

 `

>
>
> You all know what this means: get to testing! Find whatever hardware you have and install the latest snapshots, stress the upgrade procedure, play your favorite games, build your own code - whatever you use OpenBSD for, try it in the new snaps and report any problems you find. Your testing efforts will help make sure 6.2 is another great release!
>
>
> ---
>

Beastie Bits
----------

* [64 Hijacked ARMs](https://www.soldierx.com/news/64-Hijacked-ARMs)
* [Smartisan Makes Another Iridium Donation to the OpenBSD Foundation](http://undeadly.org/cgi?action=article&sid=20170817195416)
* [Andrey A. Chernov (ache), long-time FreeBSD core team member and dev, has passed away](https://twitter.com/Keltounet/status/898092662657560576)
* [OpenBSD hacker Mickey Shalayeff has passed away](https://twitter.com/dugsong/status/897338038212276224)
* [FreeBSD 10.4-BETA1 Available](https://www.freebsd.org/news/newsflash.html#event20170819:01)
* [vmadm in action, from getting a dataset to running a jail w/ vnet networking in just a few commands](https://asciinema.org/a/M8sjN0FC64JPBWZqjKIG5sx2q)
* [Interview with Patrick Wildt (from t2k17 OpenBSD Hackathon)](https://garbage.fm/episodes/41) \*\*\*

Feedback/Questions
----------

* Seth - [Switching to tarsnap](http://dpaste.com/0F2382X)
* Johnny - [memcmp](http://dpaste.com/1F576QS)
* Thomas - [Drives and NAS](http://dpaste.com/0F9QSZZ)
* Ben - [Nvidia](http://dpaste.com/1Z6CFWE)
* David - [ZFS performance variations over nfs](http://dpaste.com/0B23QZB) \*\*\*