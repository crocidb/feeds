+++
title = "299: The NAS Fleet"
description = "Running AIX on QEMU on Linux on Windows, your NAS fleet with TrueCommand, Unleashed 1.3 is available, LLDB: CPU register inspection support extension, V7 Unix programs often not written as expected, and more.Headlines[Running AiX on QEMU on Linux on Windows](https:/"
date = "2019-05-22T18:00:00Z"
url = "https://www.bsdnow.tv/299"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.636048748Z"
seen = false
+++

Running AIX on QEMU on Linux on Windows, your NAS fleet with TrueCommand, Unleashed 1.3 is available, LLDB: CPU register inspection support extension, V7 Unix programs often not written as expected, and more.

Headlines
----------

### [Running AiX on QEMU on Linux on Windows](https://virtuallyfun.com/wordpress/2019/04/22/installing-aix-on-qemu/) ###

>
>
> YES it’s real! I’m using the Linux subsystem on Windows, as it’s easier to build this Qemu tree from source. I’m using Debian, but these steps will work on other systems that use Debian as a base. first thing first, you need to get your system with the needed pre-requisites to compile Great with those in place, now clone Artyom Tarasenko’s source repository Since the frame buffer apparently isn’t quite working just yet, I configure for something more like a text mode build. Now for me, GCC 7 didn’t build the source cleanly. I had to make a change to the file config-host.mak and remove all references to -Werror. Also I removed the sound hooks, as we won’t need them. Now you can build Qemu. Okay, all being well you now have a Qemu. Now following the steps from Artyom Tarasenko’s blog post, we can get started on the install!
>
>

* See article for rest of walkthrough.

---

### [Take Command of Your NAS Fleet with TrueCommand](https://www.ixsystems.com/blog/truecommand/) ###

>
>
> Hundreds of thousands of FreeNAS and TrueNAS systems are deployed around the world, with many sites having dozens of systems. Managing multiple systems individually can be time-consuming. iXsystems has responded to the challenge by creating a “single pane of glass” application to simplify the scaling of data, drive management, and administration of iXsystems NAS platforms. We are proud to introduce TrueCommand. TrueCommand is a ZFS-aware management application that manages TrueNAS and FreeNAS systems. The public Beta of TrueCommand is available for download now. TrueCommand can be used with small iXsystems NAS fleets for free. Licenses can be purchased for large-scale deployments and enterprise support. TrueCommand expands on the ease of use and power of TrueNAS and FreeNAS systems with multi-system management and reporting.
>
>

---

News Roundup
----------

### [Unleashed 1.3 Released](http://lists.31bits.net/archives/devel/2019-April/000052.html) ###

>
>
> This is the fourth release of Unleashed - an operating system fork of illumos. For more information about Unleashed itself and the download links, see our website. As one might expect, this release removes a few things. The most notable being the removal of ksh93 along with all its libs. As far as libc interfaces are concerned, a number of non-standard functions were removed. In general, they have been replaced by the standards-compliant versions. (getgrent*r, fgetgrent*r, getgrgid*r, getgrnam*r, ttyname*r, getlogin*r, shmdt, sigwait, gethostname, putmsg, putpmsg, and getaddrinfo) Additionally, wordexp and wordfree have been removed from libc. Even though they are technically required by POSIX, software doesn't seem to use them. Because of the fragile implementation (shelling out), we took the OpenBSD approach and just removed them. The default compilation environment now includes *XOPEN*SOURCE=700 and **EXTENSIONS**. Additionally, all applications now use 64-bit file offsets, making use of *LARGEFILE*SOURCE, *LARGEFILE64*SOURCE, and *FILE*OFFSET\_BITS unnecessary. Last but not least, nightly.sh is no more. In short, to build one simply runs 'make'. (See README for detailed build instructions.)
>
>

* [Why Unleashed](https://www.unleashed-os.org/why.html)

>
>
> Why did we decide to fork illumos? After all, there are already many illumos distributions available to choose from. We felt we could do better than any of them by taking a more aggressive stance toward compatibility and reducing cruft from code and community interactions alike.
>
>

---

### [LLDB: extending CPU register inspection support](http://blog.netbsd.org/tnf/entry/lldb_extending_cpu_register_inspection) ###

>
>
> Upstream describes LLDB as a next generation, high-performance debugger. It is built on top of LLVM/Clang toolchain, and features great integration with it. At the moment, it primarily supports debugging C, C++ and ObjC code, and there is interest in extending it to more languages. In February, I have started working on LLDB, as contracted by the NetBSD Foundation. So far I've been working on reenabling continuous integration, squashing bugs, improving NetBSD core file support and updating NetBSD distribution to LLVM 8 (which is still stalled by unresolved regressions in inline assembly syntax). You can read more about that in my Mar 2019 report. In April, my main focus was on fixing and enhancing the support for reading and writing CPU registers. In this report, I'd like to shortly summarize what I have done, what I have learned in the process and what I still need to do.
>
>

* Future plans

>
>
> My work continues with the two milestones from last month, plus a third that's closely related: Add support for FPU registers support for NetBSD/i386 and NetBSD/amd64. Support XSAVE, XSAVEOPT, ... registers in core(5) files on NetBSD/amd64. Add support for Debug Registers support for NetBSD/i386 and NetBSD/amd64. The most important point right now is deciding on the format for passing the remaining registers, and implementing the missing ptrace interface kernel-side. The support for core files should follow using the same format then. Userland-side, I will work on adding matching ATF tests for ptrace features and implement LLDB side of support for the new ptrace interface and core file notes. Afterwards, I will start working on improving support for the same things on 32-bit (i386) executables.
>
>

---

### [V7 Unix programs are often not written the way you would expect](https://utcc.utoronto.ca/~cks/space/blog/unix/EdV7CodedUnusually) ###

>
>
> Yesterday I wrote that V7 ed read its terminal input in cooked mode a line at a time, which was an efficient, low-CPU design that was important on V7's small and low-power hardware. Then in comments, frankg pointed out that I was wrong about part of that, namely about how ed read its input.
>
>

* Sidebar: An interesting undocumented ed feature

>
>
> Reading this section of the source code for ed taught me that it has an interesting, undocumented, and entirely characteristic little behavior. Officially, ed commands that have you enter new text have that new text terminate by a . on a line by itself:
>
>
>
> In other words, it turns a single line with '.' into an EOF. The consequence of this is that if you type a real EOF at the start of a line, you get the same result, thus saving you one character (you use Control-D instead of '.' plus newline). This is very V7 Unix behavior, including the lack of documentation.
>
>
>
> This is also a natural behavior in one sense. A proper program has to react to EOF here in some way, and it might as well do so by ending the input mode. It's also natural to go on to try reading from the terminal again for subsequent commands; if this was a real and persistent EOF, for example because the pty closed, you'll just get EOF again and eventually quit. V7 ed is slightly unusual here in that it deliberately converts '.' by itself to EOF, instead of signaling this in a different way, but in a way that's also the simplest approach; if you have to have some signal for each case and you're going to treat them the same, you might as well have the same signal for both cases.
>
>
>
> Modern versions of ed appear to faithfully reimplement this convenient behavior, although they don't appear to document it. I haven't checked OpenBSD, but both FreeBSD ed and GNU ed work like this in a quick test. I haven't checked their source code to see if they implement it the same way.
>
>
> ---
>

Beastie Bits
----------

* [CarolinaCon 15: Writing Exploit-Resistant Code With OpenBSD](https://lteo.net/blog/2019/04/27/carolinacon-15-writing-exploit-resistant-code-with-openbsd/)
* [CFT: FreeBSD Package Base](https://lists.freebsd.org/pipermail/freebsd-pkgbase/2019-April/000396.html)
* [Initial FUSE support in DragonFly](https://www.dragonflydigest.com/2019/05/02/22862.html)
* [Two significant bugfixes for 5.4](https://www.dragonflydigest.com/2019/05/03/22869.html)
* [Libretto 100ct: 166mhz Pentium, 16gb compactflash, 32mb ram running OpenBSD](https://www.reddit.com/r/openbsd/comments/bkb2zk/surprised_this_can_still_run_current/)

---

Feedback/Questions
----------

* DJ - [Feedback](http://dpaste.com/0DSYJAH#wrap)
* Fabian - [ZFS ARC](http://dpaste.com/2EC7S10#wrap)
* Caleb - [Question](http://dpaste.com/3ZX177B#wrap)
* A small programming note: After BSDNow episode 300, the podcast will switch to audio-only, using a new higher quality recording and production system. The live stream will likely still include video.

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

 Your browser does not support the HTML5 video tag.