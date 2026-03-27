+++
title = "Episode 254: Bare the OS | BSD Now 254"
description = 'Control flow integrity with HardenedBSD, fixing bufferbloat with OpenBSD’s pf, Bareos Backup Server on FreeBSD, MeetBSD CfP, crypto simplified interface, twitter gems, interesting BSD commits, and more.\Headlines   \[Silent Fanless FreeBSD Desktop/Server](https://vermaden.wo'
date = "2018-07-12T15:00:00Z"
url = "https://www.bsdnow.tv/254"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.735450622Z"
seen = false
+++

Control flow integrity with HardenedBSD, fixing bufferbloat with OpenBSD’s pf, Bareos Backup Server on FreeBSD, MeetBSD CfP, crypto simplified interface, twitter gems, interesting BSD commits, and more.

\##Headlines  
 \###[Silent Fanless FreeBSD Desktop/Server](https://vermaden.wordpress.com/2018/06/07/silent-fanless-freebsd-desktop-server/)

>
>
> Today I will write about silent fanless FreeBSD desktop or server computer … or NAS … or you name it, it can have multa##Headlines  
>  \###[Cross-DSO CFI in HardenedBSD](https://github.com/lattera/articles/blob/master/hardenedbsd/2018-05-26_cross-dso-cfi/article.md)  
>  Control Flow Integrity, or CFI, raises the bar for attackers aiming to hijack control flow and execute arbitrary code. The llvm compiler toolchain, included and used by default in HardenedBSD 12-CURRENT/amd64, supports forward-edge CFI. Backward-edge CFI support is gained via a tangential feature called SafeStack. Cross-DSO CFI builds upon ASLR and PaX NOEXEC for effectiveness.  
>  HardenedBSD supports non-Cross-DSO CFI in base for 12-CURRENT/amd64 and has it enabled for a few individual ports. The term “non-Cross-DSO CFI” means that CFI is enabled for code within an application’s codebase, but not for the shared libraries it depends on. Supporting non-Cross-DSO CFI is an important initial milestone for supporting Cross-DSO CFI, or CFI applied to both shared libraries and applications.  
>  This article discusses where HardenedBSD stands with regards to Cross-DSO CFI in base. We have made a lot of progress, yet we’re not even half-way there.  
>  Brace yourself: This article is going to be full of references to “Cross-DSO CFI.” Make a drinking game out of it. Or don’t. It’s your call. ;)
>
>

* Using More llvm Toolchain Components

>
>
> CFI requires compiling source files with Link-Time Optimization (LTO). I remembered hearing a few years back that llvm developers were able to compile the entirety of FreeBSD’s source code with LTO. Compiling with LTO produces intermediate object files as LLVM IR bitcode instead of ELF objects.  
>  In March of 2017, we started compiling all applications with LTO and non-Cross-DSO CFI. This also enabled ld.lld as the default linker in base since CFI requires lld. Commit f38b51668efcd53b8146789010611a4632cafade made the switch to ld.lld as the default linker while enabling non-Cross-DSO CFI at the same time.  
>  Building libraries in base requires applications like ar, ranlib, nm, and objdump. In FreeBSD 12-CURRENT, ar and ranlib are known as “BSD ar” and “BSD ranlib.” In fact, ar and ranlib are the same applications. One is hardlinked to another and the application changes behavior depending on arvgv[0] ending in “ranlib”. The ar, nm, and objdump used in FreeBSD do not support LLVM IR bitcode object files.  
>  In preparation for Cross-DSO CFI support, commit fe4bb0104fc75c7216a6dafe2d7db0e3f5fe8257 in October 2017 saw HardenedBSD switching ar, ranlib, nm, and objdump to their respective llvm components. The llvm versions due support LLVM IR bitcode object files (surprise!) There has been some fallout in the ports tree and we’ve added LLVM\_AR\_UNSAFE and friends to help transition those ports that dislike llvm-ar, llvm-ranlib, llvm-nm, and llvm-objdump.  
>  With ld.lld, llvm-ar, llvm-ranlib, llvm-nm, and llvm-objdump the default, HardenedBSD has effectively switched to a full llvm compiler toolchain in 12-CURRENT/amd64.
>
>

* Building Libraries With LTO

>
>
> The primary 12-CURRENT development branch in HardenedBSD (hardened/current/master) only builds applications with LTO as mentioned in the secion above. My first attempt at building all static and shared libraries failed due to issues within llvm itself.  
>  I reported these issues to FreeBSD. Ed Maste (emaste@), Dimitry Andric (dim@), and llvm’s Rafael Espindola expertly helped address these issues. Various commits within the llvm project by Rafael fully and quickly resolved the issues brought up privately in emails.  
>  With llvm fixed, I could now build nearly every library in base with LTO. I noticed, however, that if I kept non-Cross-DSO CFI and SafeStack enabled, all applications would segfault. Even simplistic applications like /bin/ls.  
>  Disabling both non-Cross-DSO CFI and SafeStack, but keeping LTO produced a fully functioning world! I have spent the last few months figuring out why enabling either non-Cross-DSO CFI or SafeStack caused issues. This brings us to today.
>
>

* The Sanitizers in FreeBSD

>
>
> FreeBSD brought in all the files required for SafeStack and CFI. When compiling with SafeStack, llvm statically links a full sanitization framework into the application. FreeBSD includes a full copy of the sanitization framework in SafeStack, including the common C++ sanization namespaces. Thus, libclang\_rt.safestack included code meant to be shared among all the sanitizers, not just SafeStack.  
>  I had naively taken a brute-force approach to setting up the libclang\_rt.cfi static library. I copied the Makefile from libclang\_rt.safestack and used that as a template for libclang\_rt.cfi. This approach was incorrect due to breaking the One Definition Rule (ODR). Essentially, I ended up including a duplicate copy of the C++ classes and sanitizer runtime if both CFI and SafeStack were used.  
>  In my Cross-DSO CFI development VM, I now have SafeStack disabled across-the-board and am only compiling in CFI. As of 26 May 2018, an LTO-ified world (libs + apps) works in my limited testing. /bin/ls does not crash anymore! The second major milestone for Cross-DSO CFI has now been reached.
>
>

* Known Issues And Limitations

>
>
> There are a few known issues and regressions. Note that this list of known issues essentially also constitutes a “work-in-progress” and every known issue will be fixed prior to the official launch of Cross-DSO CFI.  
>  It seems llvm does not like statically compiling applications with LTO that have a mixture of C and C++ code. /sbin/devd is one of these applications. As such, when Cross-DSO CFI is enabled, devd is compiled as a Position-Independent Executable (PIE). Doing this breaks UFS systems where /usr is on a separate partition. We are currently looking into solving this issue to allow devd to be statically compiled again.  
>  NO\_SHARED is now unset in the tools build stage (aka, bootstrap-tools, cross-tools). This is related to the static compilation issue above. Unsetting NO\_SHARED for to tools build stage is only a band-aid until we can resolve static compliation with LTO.  
>  One goal of our Cross-DSO CFI integration work is to be able to support the cfi-icall scheme when dlopen(3) and dlsym(3)/dlfunc(3) is used. This means the runtime linker (RTLD), must be enhanced to know and care about the CFI runtime. This enhancement is not currently implemented, but is planned.  
>  When Cross-DSO CFI is enabled, SafeStack is disabled. This is because compiling with Cross-DSO CFI brings in a second copy of the sanitizer runtime, violating the One Definition Rule (ODR). Resolving this issue should be straightforward: Unify the sanitizer runtime into a single common library that both Cross-DSO CFI and SafeStack can link against. When the installed world has Cross-DSO CFI enabled, performing a buildworld with Cross-DSO CFI disabled fails. This is somewhat related to the static compilation issue described above.
>
>

* Current Status

>
>
> I’ve managed to get a Cross-DSO CFI world booting on bare metal (my development laptop) and in a VM. Some applications failed to work. Curiously, Firefox still worked (which also means xorg works).  
>  I’m now working through the known issues list, researching and learning.
>
>

* Future Work

>
>
> Fixing pretty much everything in the “Known Issues And Limitations” section. ;P  
>  I need to create a static library that includes only a single copy of the common sanitizer framework code. Applications compiled with CFI or SafeStack will then only have a single copy of the framework.  
>  Next I will need to integrate support in the RTLD for Cross-DSO CFI. Applications with the cfi-icall scheme enabled that call functions resolved through dlsym(3) currently crash due to the lack of RTLD support. I need to make a design decision as to whether to only support adding cfi-icall whitelist entries only with dlfunc(3) or to also whitelist cfi-icall entries with the more widely used dlsym(3).  
>  There’s likely more items in the “TODO” bucket that I am not currently aware of. I’m treading in uncharted territory. I have no firm ETA for any bit of this work. We may gain Cross-DSO CFI support in 2018, but it’s looking like it will be later in either 2019 or 2020.
>
>

* Conclusion

>
>
> I have been working on Cross-DSO CFI support in HardenedBSD for a little over a year now. A lot of progress is being made, yet there’s still some major hurdles to overcome. This work has already helped improve llvm and I hope more commits upstream to both FreeBSD and llvm will happen.  
>  We’re getting closer to being able to send out a preliminary Call For Testing (CFT). At the very least, I would like to solve the static linking issues prior to publishing the CFT. Expect it to be published before the end of 2018.  
>  I would like to thank Ed Maste, Dimitry Andric, and Rafael Espindola for their help, guidance, and support.
>
>

---

**iXsystems**  
 FreeNAS 11.2-BETAs are starting to appear

\###[Bareos Backup Server on FreeBSD](https://vermaden.wordpress.com/2018/05/01/bareos-backup-server-on-freebsd/)

>
>
> Ever heard about Bareos? Probably heard about Bacula. Read what is the difference here – Why Bareos forked from Bacula?  
>  Bareos (Backup Archiving Recovery Open Sourced) is a network based open source backup solution. It is 100% open source fork of the backup project from [bacula.org](http://bacula.org) site. The fork is in development since late 2010 and it has a lot of new features. The source is published on github and licensed under AGPLv3 license. Bareos supports ‘Always Incremental backup which is interesting especially for users with big data. The time and network capacity consuming full backups only have to be taken once. Bareos comes with WebUI for administration tasks and restore file browser. Bareos can backup data to disk and to tape drives as well as tape libraries. It supports compression and encryption both hardware-based (like on LTO tape drives) and software-based. You can also get professional services and support from Bareos as well as Bareos subscription service that provides you access to special quality assured installation packages.
>
>

>
>
> I started my sysadmin job with backup system as one of the new responsibilities, so it will be like going back to the roots. As I look on the ‘backup’ market it is more and more popular – especially in cloud oriented environments – to implement various levels of protection like GOLD, SILVER and BRONZE for example. They of course have different retention times, number of backups kept, different RTO and RPO. Below is a example implementation of BRONZE level backups in Bareos. I used 3 groups of A, B and C with FULL backup starting on DAY 0 (A group), DAY 1 (B group) and DAY 2 (C group).  
>  This way you still have FULL backups quite often and with 3 groups you can balance the network load. I for the days that we will not be doing FULL backups we will be doing DIFFERENTIAL backups. People often confuse them with INCREMENTAL backups. The difference is that DIFFERENTIAL backups are always against FULL backup, so its always ‘one level of combining’. INCREMENTAL ones are done against last done backup TYPE, so its possible to have 100+ levels of combining against 99 earlier INCREMENTAL backups and the 1 FULL backup. That is why I prefer DIFFERENTIAL ones here, faster recovery. That is all backups is about generally, recovery, some people/companies tend to forget that.  
>  The implementation of BRONZE in these three groups is not perfect, but ‘does the job’. I also made ‘simulation’ how these group will overlap at the end/beginning of the month, here is the result.  
>  Not bad for my taste.
>
>

>
>
> Today I will show you how to install and configure Bareos Server based on FreeBSD operating system. It will be the most simplified setup with all services on single machine:
>
>

* bareos-dir
* bareos-sd
* bareos-webui
* bareos-fd

>
>
> I also assume that in order to provide storage space for the backup data itself You would mount resources from external NFS shares.
>
>

>
>
> To get in touch with Bareos terminology and technology check their great Manual in HTML or PDF version depending which format You prefer for reading documentation. Also their FAQ provides a lot of needed answers.
>
>

>
>
> Also this diagram may be useful for You to get some grip into the Bareos world.
>
>

* System

>
>
> As every system needs to have its name we will use latin word closest to backup here – replica – for our FreeBSD system hostname. The install would be generally the same as in the FreeBSD Desktop – Part 2 – Install article. Here is our installed FreeBSD system with login prompt.
>
>