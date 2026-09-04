+++
title = "170: Sandboxing Cohabitation"
description = "This week on the show, we’ve got some new info on the talks from EuroBSDCon, a look at sharing a single ZFS pool between Linux and BSD, Sandboxing and much more! Stay tuned for your place to B...SD!This episode was brought to you by[![iXsystems - Enterprise Servers and "
date = "2016-11-30T13:00:00Z"
url = "https://www.bsdnow.tv/170"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.976801247Z"
seen = true
+++

This week on the show, we’ve got some new info on the talks from EuroBSDCon, a look at sharing a single ZFS pool between Linux and BSD, Sandboxing and much more! Stay tuned for your place to B...SD!

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![](/images/2.png) alt="DigitalOcean - Simple Cloud Hosting, Built for Developers" /\>](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [EuroBSDcon 2016 Presentation Slides](https://2016.eurobsdcon.org/PresentationSlides/) ###

* Due to circumstances beyond the control of the organizers of EuroBSDCon, there were not recordings of the talks given at the event.
* However, they have collected the slide decks from each of the speakers and assembled them on this page for you
* Also, we have some stuff from MeetBSD already:
* [Youtube Playlist ](https://www.youtube.com/playlist?list=PLb87fdKUIo8TAMC2HJLZ7H54edD2BeGWv)
* Not all of the sessions are posted yet, but the rest should appear shortly
* [MeetBSD 2016 Trip Report: Domagoj Stolfa](https://www.freebsdfoundation.org/blog/meetbsd-2016-trip-report-domagoj-stolfa/) \*\*\*

### [Cohabiting FreeBSD and Gentoo Linux on a Common ZFS Volume](https://ericmccorkleblog.wordpress.com/2016/11/15/cohabiting-freebsd-and-gentoo-linux-on-a-common-zfs-volume/) ###

* Eric McCorkle, who has contributed ZFS support to the FreeBSD EFI boot-loader code has posted an in-depth look at how he’s setup dual-boot with FreeBSD and Gentoo on the same ZFS volume.
* He starts by giving us some background on how the layout is done. First up, GRUB is used as the boot-loader, allowing boot of both Linux and BSD
* The next non-typical thing was using /etc/fstab to manage mount-points, instead of the typical ‘zfs mount’ usage, (apart from /home datasets)

* data/home is mounted to /home, with all of its child datasets using the ZFS mountpoint system

* data/freebsd and its child datasets house the FreeBSD system, and all have their mountpoints set to legacy

* data/gentoo and its child datasets house the Gentoo system, and have their mountpoints set to legacy as well

* So, how did he set this up? He helpfully provides an overview of the steps:

  * Use the FreeBSD installer to create the GPT and ZFS pool
  * Install and configure FreeBSD, with the native FreeBSD boot loader
  * Boot into FreeBSD, create the Gentoo Linux datasets, install GRUB
  * Boot into the Gentoo Linux installer, install Gentoo
  * Boot into Gentoo, finish any configuration tasks

* The rest of the article walks us through the individual commands that make up each of those steps, as well as how to craft a GRUB config file capable of booting both systems.

* Personally, since we are using EFI, I would have installed rEFInd, and chain-loaded each systems EFI boot code from there, allowing the use of the BSD loader, but to each their own!

  ---

### [HardenedBSD introduces Safestack into base](https://hardenedbsd.org/article/shawn-webb/2016-11-27/introducing-safestack) ###

* HardenedBSD has integrated SafeStack into its base system and ports tree
* [SafeStack](http://clang.llvm.org/docs/SafeStack.html) is part of the Code Pointer Integrity (CPI) project within clang.
* “SafeStack is an instrumentation pass that protects programs against attacks based on stack buffer overflows, without introducing any measurable performance overhead. It works by separating the program stack into two distinct regions: the safe stack and the unsafe stack. The safe stack stores return addresses, register spills, and local variables that are always accessed in a safe way, while the unsafe stack stores everything else. This separation ensures that buffer overflows on the unsafe stack cannot be used to overwrite anything on the safe stack.”
* “As of 28 November 2016, with clang 3.9.0, SafeStack only supports being applied to applications and not shared libraries. Multiple patches have been submitted to clang by third parties to add support for shared libraries.”
* SafeStack is only enabled on AMD64 \*\*\*

### [pledge(2)… or, how I learned to love web application sandboxing](https://learnbchs.org/pledge.html) ###

* We’ve talked about OpenBSD’s sandboxing mechanism pledge() in the past, but today we have a great article by Kristaps Dzonsons, about how he grew to love it for Web Sandboxing. +First up, he gives us his opening argument that should make most of you sit up and listen:

>
>
> I use application-level sandboxing a lot because I make mistakes a lot; and when writing web applications, the price of making mistakes is very dear.
>
>
>
> In the early 2000s, that meant using systrace(4) on OpenBSD and NetBSD. Then it was seccomp(2) (followed by libseccomp(3)) on Linux. Then there was capsicum(4) on FreeBSD and sandbox\_init(3) on Mac OS X.
>
>
>
> All of these systems are invoked differently; and for the most part, whenever it came time to interface with one of them, I longed for sweet release from the nightmare. Please, try reading seccomp(2). To the end. Aligning web application logic and security policy would require an arduous (and usually trial-and-error or worse, copy-and-paste) process. If there was any process at all — if the burden of writing a policy didn't cause me to abandon sandboxing at the start.
>
>
>
> And then there was pledge(2).
>
>
>
> This document is about pledge(2) and why you should use it and love it. “
>
>

\+Not convinced yet? Maybe you should take his challenge:

>
>
> Let's play a drinking game. The challenge is to stay out of the hospital.
>
>
>
> 1.Navigate to seccomp(2).
>
>
>
> 1. Read it to the end.  
>    
> 2. Drink every time you don't understand.  
>    
>
>
>
> For capsicum(4), the challenge is no less difficult. To see these in action, navigate no further than OpenSSH, which interfaces with these sandboxes: sandbox-seccomp-filter.c or sandbox-capsicum.c. (For a history lesson, you can even see sandbox-systrace.c.) Keep in mind that these do little more than restrict resources to open descriptors and the usual necessities of memory, signals, timing, etc. Keep that in mind and be horrified. “
>
>

* Now Kristaps has his theory on why these are so difficult (NS..), but perhaps there is a better way. He makes the case that pledge() sits right in that sweet-spot, being powerful enough to be useful, but easy enough to implement that developers might actually use it.
* All in all, a nice read, check it out! Would love to hear other developer success stories using pledge() as well. \*\*\*

News Roundup
----------

### [Unix history repository, now on GitHub](http://www.osnews.com/story/29513/Unix_history_repository_now_on_GitHub) ###

* OS News has an interesting tidbit on their site today, about the entire commit history of Unix now being available online, starting all the way back in 1970 and bringing us forward to today.

* From the README

>
>
> The history and evolution of the Unix operating system is made available as a revision management repository, covering the period from its inception in 1970 as a 2.5 thousand line kernel and 26 commands, to 2016 as a widely-used 27 million line system. The 1.1GB repository contains about half a million commits and more than two thousand merges. The repository employs Git system for its storage and is hosted on GitHub. It has been created by synthesizing with custom software 24 snapshots of systems developed at Bell Labs, the University of California at Berkeley, and the 386BSD team, two legacy repositories, and the modern repository of the open source FreeBSD system. In total, about one thousand individual contributors are identified, the early ones through primary research. The data set can be used for empirical research in software engineering, information systems, and software archaeology.
>
>

* This is a fascinating find, especially will be of value to students and historians who wish to look back in time to see how UNIX evolved, and in this repo ultimately turned into modern FreeBSD. \*\*\*

### [Yandex commits improvements to FreeBSD network stack ](https://reviews.freebsd.org/D8526) ###

* “Rework ip\_tryforward() to use FIB4 KPI.”
* This commit brings some code from the experimental routing branch into head
* As you can see from the graphs, it offers some sizable improvements in forwarding and firewalled packets per second
* [commit ](https://svnweb.freebsd.org/base?view=revision&revision=309257) \*\*\*

### [The brief history of Unix socket multiplexing – select(2) system call](https://idea.popcount.org/2016-11-01-a-brief-history-of-select2/) ###

* Ever wondered about the details of socket multiplexing, aka the history of select(2)?
* Well Marek today gives a treat, with a quick look back at the history that made today’s modern multiplexing possible.
* First, his article starts the way all good ones do, presenting the problem in silent-movie form:

>
>
> In mid-1960's time sharing was still a recent invention. Compared to a previous paradigm - batch-processing - time sharing was truly revolutionary. It greatly reduced the time wasted between writing a program and getting its result. Batch-processing meant hours and hours of waiting often to only see a program error. See this film to better understand the problems of 1960's programmers: "The trials and tribulations of batch processing".
>
>

* Enter the wild world of the 1970’s, and we’ve now reached the birth of UNIX which tried to solve the batch processing problem with time-sharing.

>
>
> These days when a program was executed, it could "stall" (block) only on a couple of things1:
>
>
>
> * wait for CPU
> * wait for disk I/O
> * wait for user input (waiting for a shell command) or console (printing data too fast)“
>
>

* Jump forward another dozen years or so, and the world changes yet again:

>
>
> This all changed in 1983 with the release of 4.2BSD. This revision introduced an early implementation of a TCP/IP stack and most importantly - the BSD Sockets API.Although today we take the BSD sockets API for granted, it wasn't obvious it was the right API. STREAMS were a competing API design on System V Revision 3.
>
>

* Coming in along with the sockets API was the select(2) call, which our very own Kirk McKusick gives us some background on:

>
>
> Select was introduced to allow applications to multiplex their I/O.
>
>
>
> Consider a simple application like a remote login. It has descriptors for reading from and writing to the terminal and a descriptor for the (bidirectional) socket. It needs to read from the terminal keyboard and write those characters to the socket. It also needs to read from the socket and write to the terminal. Reading from a descriptor that has nothing queued causes the application to block until data arrives. The application does not know whether to read from the terminal or the socket and if it guesses wrong will incorrectly block. So select was added to let it find out which descriptor had data ready to read. If neither, select blocks until data arrives on one descriptor and then awakens telling which descriptor has data to read.
>
>
>
> [...] Non-blocking was added at the same time as select. But using non-blocking when reading descriptors does not work well. Do you go into an infinite loop trying to read each of your input descriptors? If not, do you pause after each pass and if so for how long to remain responsive to input? Select is just far more efficient.
>
>

Select also lets you create a single inetd daemon rather than having to have a separate daemon for every service.

* The article then wraps up with an interesting conclusion: \> CSP = Communicating sequential processes

>
>
> In this discussion I was afraid to phrase the core question. Were Unix processes intended to be CSP-style processes? Are file descriptors a CSP-derived "channels"? Is select equivalent to ALT statement?
>
>
>
> I think: no. Even if there are design similarities, they are accidental. The file-descriptor abstractions were developed well before the original CSP paper.
>
>
>
> It seems that an operating socket API's evolved totally disconnected from the userspace CSP-alike programming paradigms. It's a pity though. It would be interesting to see an operating system coherent with the programming paradigms of the user land programs.
>
>

* A long (but good) read, and worth your time if you are interested in the history how modern multiplexing came to be. \*\*\*

### [How to start CLion on FreeBSD?](https://intellij-support.jetbrains.com/hc/en-us/articles/206525024-How-to-start-CLion-on-FreeBSD) ###

* CLion (pronounced "sea lion") is a cross-platform C and C++ IDE
* By default, the Linux version comes bundled with some binaries, which obviously won’t work with the native FreeBSD build
* Rather than using Linux emulation, you can replace these components with native versions
  * pkg install openjdk8 cmake gdb
  * Edit clion-2016.3/bin/idea.properties and change run.processes.with.pty=false
  * Start CLion and open Settings | Build, Execution, Deployment | Toolchains
  * Specify CMake path: /usr/local/bin/cmake and GDB path: /usr/local/bin/gdb

* Without a replacement for fsnotifier, you will get a warning that the IDE may be slow to detect changes to files on disk
* But, someone has already written a version of fsnotifier that works on FreeBSD and OpenBSD
* [fsnotifier for OpenBSD and FreeBSD](https://github.com/idea4bsd/fsnotifier) -- The fsnotifier is used by IntelliJ for detecting file changes. This version supports FreeBSD and OpenBSD via libinotify and is a replacement for the bundled Linux-only version coming with the IntelliJ IDEA Community Edition. \*\*\*

Beastie Bits
----------

* [TrueOS Pico – FreeBSD ARM/RPi Thin Clients](https://www.trueos.org/trueos-pico/)

* [A Puppet package provider for FreeBSD's PkgNG package manager.](https://github.com/xaque208/puppet-pkgng)

* [Notes from November London \*BSD meetup](http://mailman.uk.freebsd.org/pipermail/ukfreebsd/2016-November/014059.html)

* [SemiBug meeting on Dec 20th](http://lists.nycbug.org/pipermail/semibug/2016-November/000131.html)

---

Feedback/Questions
----------

* [ Erno - SSH without password](http://pastebin.com/SMvxur9v)
* [ Jonathan - Magical ZFS](http://pastebin.com/5ETL7nmj)
* [ George - TrueOS](http://pastebin.com/tSVvaV9e)
* [ Mohammad - Jails IP](http://pastebin.com/T8nUexd1)
* [ Gibheer - BEs](http://pastebin.com/YssXXp70) \*\*\*