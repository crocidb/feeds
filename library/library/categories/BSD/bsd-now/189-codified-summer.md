+++
title = "189: Codified Summer"
description = "This week on the show we interview Wendell from Level1Techs, cover Google Summer of Code on the different BSD projects, cover YubiKey usage, dive into how NICs work &This episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Open Source](/images"
date = "2017-04-12T12:00:00Z"
url = "https://www.bsdnow.tv/189"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.917967362Z"
seen = true
+++

This week on the show we interview Wendell from Level1Techs, cover Google Summer of Code on the different BSD projects, cover YubiKey usage, dive into how NICs work &

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### Google summer of code for BSDs ###

* [FreeBSD](https://www.freebsd.org/projects/summerofcode.html)

* [FreeBSD's existing list of GSoC Ideas for potential students](https://wiki.freebsd.org/SummerOfCodeIdeas)

  * FreeBSD/Xen: import the grant-table bus\_dma(9) handlers from OpenBSD
  * Add support for usbdump file-format to wireshark and vusb-analyzer
  * Write a new boot environment manager
  * Basic smoke test of all base utilities
  * Port OpenBSD's pf testing framework and tests
  * Userspace Address Space Annotation
  * zstandard integration in libstand
  * Replace mergesort implementation
  * Test Kload (kexec for FreeBSD)
  * Kernel fuzzing suite
  * Integrate MFSBSD into the release building tools
  * NVMe controller emulation for bhyve
  * Verification of bhyve's instruction emulation
  * VGA emulation improvements for bhyve
  * audit framework test suite
  * Add more FreeBSD testing to Xen osstest
  * Lua in bootloader
  * POSIX compliance testing framework
  * coreclr: add Microsoft's coreclr and corefx to the Ports tree.

* [NetBSD](https://wiki.netbsd.org/projects/gsoc/)

  * Kernel-level projects
  * Medium
  * ISDN NT support and Asterisk integration
  * LED/LCD Generic API
  * NetBSD/azure -- Bringing NetBSD to Microsoft Azure
  * OpenCrypto swcrypto(4) enhancements
  * Scalable entropy gathering
  * Userland PCI drivers
  * Hard
  * Real asynchronous I/O
  * Parallelize page queues
  * Tickless NetBSD with high-resolution timers
  * Userland projects
  * Easy
  * Inetd enhancements -- Add new features to inetd
  * Curses library automated testing
  * Medium
  * Make Anita support additional virtual machine systems
  * Create an SQL backend and statistics/query page for ATF test results
  * Light weight precision user level time reading
  * Query optimizer for find(1)
  * Port launchd
  * Secure-PLT - supporting RELRO binaries
  * Sysinst alternative interface
  * Hard
  * Verification tool for NetBSD32
  * pkgsrc projects
  * Easy
  * Version control config files
  * Spawn support in pkgsrc tools
  * Authentication server meta-package
  * Medium
  * pkgin improvements
  * Unify standard installation tasks
  * Hard
  * Add dependency information to binary packages
  * Tool to find dependencies precisely

* [LLVM](http://llvm.org/OpenProjects.html#gsoc17)

  * Fuzzing the Bitcode reader

>
>
> Description of the project: The optimizer is 25-30% slower when debug info are enabled, it'd be nice to track all the places where we don't do a good job about ignoring them!
>
>

* Extend clang AST to provide information for the type as written in template instantiations.

>
>
> Description of the project: When instantiating a template, the template arguments are canonicalized before being substituted into the template pattern. Clang does not preserve type sugar when subsequently accessing members of the instantiation. Clang should "re-sugar" the type when performing member access on a class template specialization, based on the type sugar of the accessed specialization.
>
>

* Shell auto-completion support for clang.

>
>
> Bash and other shells support typing a partial command and then automatically completing it for the user (or at least providing suggestions how to complete) when pressing the tab key. This is usually only supported for popular programs such as package managers (e.g. pressing tab after typing "apt-get install late" queries the APT package database and lists all packages that start with "late"). As of now clang's frontend isn't supported by any common shell.
>
>

* Clang-based C/C++ diff tool.

>
>
> Description of the project: Every developer has to interact with diff tools daily. The algorithms are usually based on detecting "longest common subsequences", which is agnostic to the file type content. A tool that would understand the structure of the code may provide a better diff experience by being robust against, for example, clang-format changes.
>
>

* Find dereference of pointers.

>
>
> Description of the project: Find dereference of pointer before checking for nullptr.
>
>

* Warn if virtual calls are made from constructors or destructors.

>
>
> Description of the project: Implement a path-sensitive checker that warns if virtual calls are made from constructors and destructors, which is not valid in case of pure virtual calls and could be a sign of user error in non-pure calls.
>
>

* Improve Code Layout

>
>
> Description of the project: The goal for the project is trying to improve the layout/performances of the generated executable. The primary object format considered for the project is ELF but this can be extended to other object formats. The project will touch both LLVM and lld.
>
>

* [Why Isnt OpenBSD in Google Summer of Code 2017?](http://marc.info/?l=openbsd-misc&m=149119308705465&w=2)

* [Hacker News Discussion Thread](https://news.ycombinator.com/item?id=14020814)

  ---

### [Turtles on the Wire: Understanding How the OS Uses the Modern NIC](http://dtrace.org/blogs/rm/2016/09/15/turtles-on-the-wire-understanding-how-the-os-uses-the-modern-nic/) ###

* The Simple NIC
* MAC Address Filters and Promiscuous Mode
* Problem: The Single Busy CPU
* A Swing and a Miss
* Nine Rings for Packets Doomed to be Hashed
* Problem: Density, Density, Density
* A Brief Aside: The Virtual NIC
* Always Promiscuous?
* The Classification Challenge
* Problem: CPUs are too slow
* Problem: The Interrupts are Coming in too Hot
* Solution One: Do Less Work
* Solution Two: Turn Off Interrupts
* Recapping
* Future Directions and More Reading

---

### [Make Dragonfly BSD great again!](http://akat1.pl/?id=3) ###

>
>
> Recently I spent some time reading Dragonfly BSD code. While doing so I spotted a vulnerability in the sysvsem subsystem that let user to point to any piece of memory and write data through it (including the kernel space). This can be turned into execution of arbitrary code in the kernel context and by exploiting this, we're gonna make Dragonfly BSD great again!
>
>
>
> Dragonfly BSD is a BSD system which originally comes from the FreeBSD project. In 2003 Matthew Dillon forked code from the 4.x branch of the FreeBSD and started a new flavour.  
>  I thought of Dragonfly BSD as just another fork, but during EuroBSDCon 2015 I accidentally saw the talk about graphical stack in the Dragonfly BSD. I confused rooms, but it was too late to escape as I was sitting in the middle of a row, and the exit seemed light years away from me. :-) Anyway, this talk was a sign to me that it's not just a niche of a niche of a niche of a niche operating system. I recommend spending a few minutes of your precious time to check out the HAMMER file system, Dragonfly's approach to MP, process snapshots and other cool features that it offers. Wikipedia article is a good starter
>
>

* With the exploit, they are able to change the name of the operating system back to FreeBSD, and escalate from an unprivileged user to root.

>
>
> The Bug itself is located in the semctl(2) system call implementation. bcopy(3) in line 385 copies semid\_ds structure to memory pointed by arg-\>buf, this pointer is fully controlled by the user, as it's one of the syscall's arguments. So the bad thing here is that we can copy things to arbitrary address, but we have not idea what we copy yet. This code was introduced by wrongly merging code from the FreeBSD project, *bah*, bug happens.
>
>

* Using this access, the example code shows how to overwrite the function pointers in the kernel used for the open() syscall, and how to overwrite the ostype global, changing the name of the operating system.
* In the second example, the reference to the credentials of the user trying to open a file are used to overwrite that data, making the user root.

>
>
> The bug was fixed in uber fast manner (within few hours!) by Matthew Dillon, version 4.6.1 released shortly after that seems to be safe. In case you care, you know what to do!
>
>

* Thanks to Mateusz Kocielski for the detailed post, and finding the bug \*\*\*

Interview - Wendell - [wendell@level1techs.com](mailto:wendell@level1techs.com) / [@tekwendell](https://twitter.com/tekwendell)
----------

* Host of Level1Techs website, podcast and YouTube channel

---

News Roundup
----------

### [Using yubikeys everywhere](http://www.tedunangst.com/flak/post/using-yubikeys-everywhere) ###

* Ted Unangst is back, with an interesting post about YUBI Keys

>
>
> Everybody is getting real excited about yubikeys recently, so I figured I should get excited, too. I have so far resisted two factor authorizing everything, but this seemed like another fun experiment. Theres a lot written about yubikeys and how you should use one, but nothing Ive read answered a few of the specific questions I had  
>  To begin with, I ordered two yubikeys. One regular sized 4 and one nano. I wanted to play with different form factors to see which is better for various uses, and I wanted to test having a key and a backup key. Everybody always talks about having one yubikey. And then if you lose it, terrible things happen. Can this problem be alleviated with two keys? Im also very curious what happens when I try to login to a service with my phone after enabling U2F.  
>  Weve got three computers (and operating systems) in the mix, along with a number of (mostly web) services. Wherever possible, I want to use a yubikey both to login to the computer and to authorize myself to remote services.  
>  I started my adventure on my chromebook. Ultimate goal would be to use the yubikey for local logins. Either as a second factor, or as an alternative factor. First things first and we need to get the yubikey into the account I use to sign into the chromebook. Alas, there is apparently no way to enroll only a security key for a Google account. Every time I tried, it would ask me for my phone number. That is not what I want. Zero stars.  
>  Giving up on protecting the chromebook itself, at least maybe I can use it to enable U2F with some other sites. U2F is currently limited to Chrome, but it sounds like everything I want. Facebook signup using U2F was pretty easy. Go to account settings, security subheading, add the device. Tap the button when it glows. Key added. Note that its possible to add a key without actually enabling two factor auth, in which case you can still login with only a password, but no way to login with no password and only a USB key. Logged out to confirm it would check the key, and everything looked good, so I killed all my other active sessions. Now for the phone test. Not quite as smooth. Tried to login, the Facebook app then tells me it has sent me an SMS and to enter the code in the box. But I dont have a phone number attached. Im not getting an SMS code.  
>  Meanwhile, on my laptop, I have a new notification about a login attempt. Follow the prompts to confirm its me and permit the login. This doesnt have any effect on the phone, however. I have to tap back, return to the login screen, and enter my password again. This time the login succeeds. So everything works, but there are still some rough patches in the flow. Ideally, the phone would more accurately tell me to visit the desktop site, and then automatically proceed after I approve. (The messenger app crashed after telling me my session had expired, but upon restarting it was able to borrow the Facebook app credentials and I was immediately logged back in.)  
>  Lets configure Dropbox next. Dropbox wont let you add a security key to an account until after youve already set up some other mobile authenticator. I already had the Duo app on my phone, so I picked that, and after a short QR scan, Im ready to add the yubikey. So the key works to access Dropbox via Chrome. Accessing Dropbox via my phone or Firefox requires entering a six digit code. No way to use a yubikey in a three legged configuration  
>  I dont use Github, but I know they support two factors, so lets try them next. Very similar to Dropbox. In order to set up a key, I must first set up an authenticator app. This time I went with Yubicos own desktop authenticator. Instead of scanning the QR code, type in some giant number (on my Windows laptop), and it spits out an endless series of six digit numbers, but only while the yubikey is inserted. I guess this is kind of what I want, although a three pound yubikey is kind of unwieldy.  
>  As part of my experiment, I noticed that Dropbox verifies passwords before even looking at the second auth. I have a feeling that they should be checked at the same time. No sense allowing my password guessing attack to proceed while I plot how to steal someones yubikey. In a sense, the yubikey should serve as a salt, preventing me from mounting such an attack until I have it, thus creating a race where the victim notices the key is gone and revokes access before I learn the password. If I know the password, the instant I grab the key I get access. Along similar lines, I was able to complete a password reset without entering any kind of secondary code.  
>  Having my phone turn into a second factor is a big part of what Im looking to avoid with the yubikey. Id like to be able to take my phone with me, logged into some sites but not all, and unable to login to the rest. All these sites that require using my phone as mobile authenticator are making that difficult. I bought the yubikey because it was cheaper than buying another phone! Using the Yubico desktop authenticator seems the best way around that.
>
>

* The article also provides instructions for configuring the Yubikey on OpenBSD

>
>
> A few notes about OTP. As mentioned, the secret key is the real password. Its stored on whatever laptop or server you login to. Meaning any of those machines can take the key and use it to login to any other machine. If you use the same yubikey to login to both your laptop and a remote server, your stolen laptop can trivially be used to login to the server without the key. Be mindful of that when setting up multiple machines. Also, the OTP counter isnt synced between machines in this setup, which allows limited replay attacks.
>
>

* Ted didnt switch his SSH keys to the Yubikey, because it doesnt support ED25519, and he just finished rotating all of his keys and doesnt want to do it again.

>
>
> I did most of my experimenting with the larger yubikey, since it was easier to move between machines. For operations involving logging into a web site, however, Id prefer the nano. Its very small, even smaller than the tiniest wireless mouse transcievers Ive seen. So small, in fact, I had trouble removing it because I couldnt find anything small enough to fit through the tiny loop. But probably a good thing. Most other micro USB gadgets stick out just enough to snag when pushing a laptop into a bag. Not the nano. You lose a port, but theres really no reason to ever take it out. Just leave it in, and then tap it whenever you login to the tubes. It would not be a good choice for authenticating to the local machine, however. The larger device, sized to fit on a keychain, is much better for that.   
>  It is possible to use two keys as backups. Facebook and Dropbox allow adding two U2F keys. This is perhaps a little tiresome if theres lots of sites, as I see no way to clone a key. You have to login to every service. For challenge response and OTP, however, the personalization tool makes it easy to generate lots of yubikeys with the same secrets. On the other hand, a single device supports an infinite number of U2F sites. The programmable interfaces like OTP are limited to only two slots, and the first is already used by the factory OTP setup.
>
>
> ---
>

### [What happened to my vlan](http://www.grenadille.net/post/2017/02/13/What-happened-to-my-vlan) ###

>
>
> A long term goal of the effort I'm driving to unlock OpenBSD's Network Stack is obviously to increase performances. So I'd understand that you find confusing when some of our changes introduce performance regressions.  
>  It is just really hard to do incremental changes without introducing temporary regressions. But as much as security is a process, improving performance is also a process. Recently markus@ told me that vlan(4) performances dropped in last releases. He had some ideas why but he couldn't provide evidences. So what really happened?  
>  Hrvoje Popovski was kind enough to help me with some tests. He first confirmed that on his Xeon box (E5-2643 v2 @ 3.50GHz), forwarding performances without pf(4) dropped from 1.42Mpps to 880Kpps when using vlan(4) on both interfaces.  
>  Together vlan\_input() and vlan\_start() represent 25% of the time CPU1 spends processing packets. This is not exactly between 33% and 50% but it is close enough. The assumption we made earlier is certainly too simple. If we compare the amount of work done in process context, represented by if\_input\_process() we clearly see that half of the CPU time is not spent in ether\_input().  
>  I'm not sure how this is related to the measured performance drop. It is actually hard to tell since packets are currently being processed in 3 different contexts. One of the arguments mikeb@ raised when we discussed moving everything in a single context, is that it is simpler to analyse and hopefully make it scale.  
>  With some measurements, a couple of nice pictures, a bit of analysis and some educated guesses we are now in measure of saying that the performances impact observed with vlan(4) is certainly due to the pseudo-driver itself. A decrease of 30% to 50% is not what I would expect from such pseudo-driver.  
>  I originally heard that the reason for this regression was the use of SRP but by looking at the profiling data it seems to me that the queuing API is the problem. In the graph above the CPU time spent in if\_input() and if\_enqueue() from vlan(4) is impressive. Remember, in the case of vlan(4) these operations are done per packet!  
>  When if\_input() has been introduced the queuing API did not exist and putting/taking a single packet on/from an interface queue was cheap. Now it requires a mutex per operation, which in the case of packets received and sent on vlan(4) means grabbing three mutexes per packets.  
>  I still can't say if my analysis is correct or not, but at least it could explain the decrease observed by Hrvoje when testing multiple vlan(4) configurations. vlan\_input() takes one mutex per packet, so it decreases the number of forwarded packets by \~100Kpps on this machine, while vlan\_start() taking two mutexes decreases it by \~200Kpps.
>
>

* An interesting analysis of the routing performance regression on OpenBSD
* I have asked Olivier Cochard-Labbe about doing a similar comparison of routing performance on FreeBSD when a vlan pseudo interface is added to the forwarding path \*\*\*

### [NetBSD: the first BSD introducing a modern process plugin framework in LLDB](https://blog.netbsd.org/tnf/entry/netbsd_the_first_bsd_introducing) ###

* Clean up in ptrace(2) ATF tests

>
>
> We have created some maintanance burden for the current ptrace(2) regression tests. The main issues with them is code duplication and the splitting between generic (Machine Independent) and port-specific (Machine Dependent) test files. I've eliminated some of the ballast and merged tests into the appropriate directory tests/lib/libc/sys/. The old location (tests/kernel) was a violation of the tests/README recommendation
>
>

* PTRACE\_FORK on !x86 ports

>
>
> Along with the motivation from Martin Husemann we have investigated the issue with PTRACE\_FORK ATF regression tests. It was discovered that these tests aren't functional on evbarm, alpha, shark, sparc and sparc64 and likely on other non-x86 ports. We have discovered that there is a missing SIGTRAP emitted from the child, during the fork(2) handshake. The proper order of operations is as follows:
>
>
> >
> >
> > parent emits SIGTRAP with si\_code=TRAP\_CHLD and pe\_set\_event=pid of forkee  
> >  child emits SIGTRAP with si\_code=TRAP\_CHLD and pe\_set\_event=pid of forker
> >
> >
>
>
>
> Only the x86 ports were emitting the second SIGTRAP signal.
>
>

* PT\_SYSCALL and PT\_SYSCALLEMU

>
>
> With the addition of PT\_SYSCALLEMU we can implement a virtual kernel syscall monitor. It means that we can fake syscalls within a debugger. In order to achieve this feature, we need to use the PT\_SYSCALL operation, catch SIGTRAP with si\_code=TRAP\_SCE (syscall entry), call PT\_SYSCALLEMU and perform an emulated userspace syscall that would have been done by the kernel, followed by calling another PT\_SYSCALL with si\_code=TRAP\_SCX.
>
>

* What has been done in LLDB

>
>
> A lot of work has been done with the goal to get breakpoints functional. This target penetrated bugs in the existing local patches and unveiled missing features required to be added. My initial test was tracing a dummy hello-world application in C. I have sniffed the GDB Remote Protocol packets and compared them between Linux and NetBSD. This helped to streamline both versions and bring the NetBSD support to the required Linux level.
>
>

* Plan for the next milestone

>
>
> I've listed the following goals for the next milestone.
>
>

* watchpoints support
* floating point registers support
* enhance core(5) and make it work for multiple threads
* introduce PT\_SETSTEP and PT\_CLEARSTEP in ptrace(2)
* support threads in the NetBSD Process Plugin
* research F\_GETPATH in fcntl(2)
* Beyond the next milestone is x86 32-bit support.

### [LibreSSL 2.5.2 released](https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.5.2-relnotes.txt) ###

* Added the recallocarray(3) memory allocation function, and converted various places in the library to use it, such as CBB and BUF\_MEM\_grow. recallocarray(3) is similar to reallocarray. Newly allocated memory is cleared similar to calloc(3). Memory that becomes unallocated while shrinking or moving existing allocations is explicitly discarded by unmapping or clearing to 0.
* Added new root CAs from SECOM Trust Systems / Security Communication of Japan.
* Added EVP interface for MD5+SHA1 hashes.
* Fixed DTLS client failures when the server sends a certificate request.
* Correct handling of padding when upgrading an SSLv2 challenge into an SSLv3/TLS connection.
* Allow protocols and ciphers to be set on a TLS config object in libtls.
* Improved nc(1) TLS handshake CPU usage and server-side error reporting.

Beastie Bits
----------

* [HardenedBSD Stable v46.16 released](http://hardenedbsd.org/article/op/2017-03-30/stable-release-hardenedbsd-stable-11-stable-v4616)
* [KnoxBUG looking for OpenBSD people in Knoxville TN area](https://www.reddit.com/r/openbsd/comments/5vggn7/knoxbug_looking_for_openbsd_people_in_knoxville/)
* KnoxBUG Tuesday, April 18, 2017 - 6:00pm : Caleb Cooper: Advanced BASH Scripting]([http://knoxbug.org/2017-04-18](http://knoxbug.org/2017-04-18))
* [e2k17 Nano hackathon report from Bob Beck](http://undeadly.org/cgi?action=article&sid=20170405110059)
* Noah Chelliah, Host of the Linux Action Show calls Linux a Bad Science Project and ditches Linux for TrueOS]([https://youtu.be/yXB85\_olYhQ?t=3238](https://youtu.be/yXB85_olYhQ?t=3238)) \*\*\*

Feedback/Questions
----------

* [James - ZFS Mounting](http://dpaste.com/1H43JGV#wrap)

* [Kevin - Virtualization](http://dpaste.com/18VNAJK#wrap)

* [Ben - Jails](http://dpaste.com/0R7CRZ7#wrap)

* [Florian - ZFS and Migrating Linux userlands](http://dpaste.com/2Z1P23T#wrap)

* [q5sys - question for the community](http://dpaste.com/26M453F#wrap)

  ---