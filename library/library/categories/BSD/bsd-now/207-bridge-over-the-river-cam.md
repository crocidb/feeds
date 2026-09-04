+++
title = "207: Bridge over the river Cam"
description = "We recap our devsummit experiences at BSDCambridge, share why memcmp is more complicated than expected, explore Docker on FreeBSD, and we look at a retro terminal.This episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1."
date = "2017-08-16T12:00:00Z"
url = "https://www.bsdnow.tv/207"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.863587464Z"
seen = true
+++

We recap our devsummit experiences at BSDCambridge, share why memcmp is more complicated than expected, explore Docker on FreeBSD, and we look at a retro terminal.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [BSDCam recap](https://wiki.freebsd.org/DevSummit/201708) ###

>
>
> The 2017 Cambridge DevSummit took place from 2-4 August 2017. The event took place over three days including a formal dinner at St John's College, and was attended by 55 registered developers and guests.
>
>

* Prior to the start of the conference, we had a doc hacking lounge, the computer lab provided a room where we could meet and try to spend some time on documentation. Sevan walked two interested people through the process of creating a documentation patch and submitting it for the first time. In the process, found ways to improve the documentation on how to write documentation.

>
>
> The event is run "un-conference style" in that we brainstorm the actual session schedule on the first morning, with a focus on interactive topics that reflect the interests and exploit the knowledge of the attendees.
>
>

* The idea is to maximize the amount of discussion and decisions that can be made while we are all in the same room
* The first morning, we all gather in the slightly too small, and even more slightly under air conditioned FW11 classroom. We go around the room introducing ourselves, and listing a few topics we would be interested in discussing. Eventually the whiteboard is full of topics, with various numbers of ticks beside them to indicate the number of interested people
* There are breakout rooms of all sizes, so even topics with only a small group of interested folks can get a lot accomplished
* The most difficult is trying to schedule the sessions, as there is much overlap and people usually want to be in concurrent sessions, or someone's schedule means they won’t be available that day, etc.
* This years working groups:
  * Toolchain (Compilers, Linkers, External Toolchain, Static analysis and sanitizers)
  * Virtualization (bhyve, xen, jails, docker)
  * Transport (TCP) and Network Performance
  * Security and mitigations (W<sup>X,</sup> noexec stack, CFI, ASLR, KASLR, Safe Stack, etc)
  * Testing (Status, What to test, How to test, QA for releases)
  * Capsicum (Automation with LLVM etc, Casper, Namespacing, “Services”, capsh)
  * Desktop / WiFi (drm-next, drivers, resume, power, installer, desktop, OOB Experience)
  * Tracing (Blackbox, DTrace, KTR, ptrace, truss, hardware tracing)
  * Packaging and Packaged Base (Sets, Kernels, Ports & flavours, sub-packages, privlib)
  * Architectural Security Features (CPU Features: SGX, PXN/PAN, Pointer Authentication, AMD Memory Encryption, Libcrunch, RISC-V, CheriABI)
  * Architectures and Embedded systems (RISC-V, ARM, ARM64, MIPS(64), SPARC64)
  * Teaching (Audiences, Objectives, Targets, Material, future directions)
  * Provisioning and Management Tools (CfgMgmt tools, Image building, VM/bhyve orchestration, Preconfigured VMs for testing, Wishlist)
  * Storage (ZFS status update, ZFS encryption infrastructure, ZFS Zero Copy / Sendfile, Acceleration of checksums and raidz parity calculations, sesutil, mpsutil)

* And that wasn’t everything. We then had a series of short talklets:
  * Enhancing and replacing mmap()
  * SDIO support
  * eBPF support for FreeBSD
  * Tracing + Virtualization
  * Practical DMA Attack Protection

* On Thursday night there was a special dinner at St John's College
* Overall it was a great DevSummit, and I even managed to get some of the work assigned to me finished. Shortly I will commit an update to the boot loader menu that will automatically populate the kernel selection menu with the automatically detected list of installed kernels. The list is also properly refreshed when you switch boot environments. \*\*\*

### [Hosts/BSD – for when you need to run your BSD inside a penguin](https://wiki.qemu.org/index.php/Hosts/BSD) ###

* This wiki provides details on how to run each of the various BSDs under QEMU
* The target audience is Linux developers looking to test their apps etc under BSD
* The wiki is in need of some love, there are some option questions, and it lacks some polish
* There are instructions on building qemu from source, but it should likely mention the qemu-devel port
* There should probably also be instructions on using other architectures, like ARM/MIPS etc
* If you have used QEMU, or would like to spend the time to learn how, please help update this wiki \*\*\*

### [memcmp -- more complicated than you might expect](http://trust-in-soft.com/memcmp-requires-pointers-to-fully-valid-buffers/) ###

>
>
> “A suspicious pattern in open-source software”  
>  One bug recently found by John using tis-interpreter on a widely used open-source library involved the comparison of strings with memcmp. The unexpected condition was that memcmp was, in one case, called with a pointer to a buffer shorter than the length passed as third argument, breaking one of the two symmetrical pre-conditions in the function’s ACSL contract  
>  A reason that may have made this use of memcmp look okay to the developer is that the buffers being passed to it always differed before the end of the buffers were reached.  
>  a memcmp implementation based on stopping as soon as a difference is found, would not have caused any out-of-bounds read access  
>  The first question raised was whether the pattern memcmp("a", "bc", 3) was problematic according to the letter of the C standard. If it was, the second question was whether the busy maintainer of one of the Open Source packages that make the Internet tick should be bothered with a bug report.  
>  I would like to be able to say that memcmp’s ACSL contract was the product of careful deliberation, but unfortunately this is not the case: many standard function contracts were written quickly in order to get most of the standard library covered, and have not been tested by time. Anyway, upon proofreading the relevant clause in the C11 standard, my feeling was that the ACSL formalization was, in this particular case, right, and that it was undefined behavior to pass as memcmp argument a buffer that wasn’t fully valid, even if the implementation sort-of needs to read the buffer’s characters in order for the purpose of finding the first mismatch.
>
>

* The post then goes on to look at the memcmp code in glibc

>
>
> There are two distinct optimizations for long buffers, one that applies when both buffers start at the same offset modulo the word size, memcmp\_common\_alignment, and one that applies when they don’t, memcmp\_not\_common\_alignment.  
>  The function memcmp\_common\_alignment is relatively well-behaved: it reads from the two buffers aligned word by aligned word, and thus reads the entire words that contain differing bytes. If the caller passed buffers that aren’t valid after the differing byte, this amounts to reading out of bounds, but this sort of out-of-bounds access is not detected by the typical MMU, which works at the scale of the page.  
>  The “not\_common\_alignment” case, however, tells a different story. When passed the carefully (mis-)aligned buffers t1 and (char\*)t2+1, although these buffers differ in the 8th byte, Glibc’s implementation of memcmp reads 8 bytes beyond the end of t1. By making the 16th byte differ instead of the 8th one, it is also possible to make Glibc’s implementation of memcmp read 16 bytes beyond the end of t1.  
>  In conclusion, yes, some implementations of memcmp will crash when invoked with buffers that aren’t valid for the full length, even if they differ early. The circumstances are rare (probably the reason this bug was still there to be found in a library that had already been tested with all the available techniques) but outside the programmer’s control. The pattern described in this post should be reported as a bug when found.
>
>

* It is interesting to read the detailed analysis of a bug in such a basic libc feature \*\*\*

News Roundup
----------

### [Docker on FreeBSD](http://daemon-notes.com/articles/network/docker) ###

>
>
> There are two approaches to running Docker on FreeBSD. First one was created back in 2015 and it was a native port of Docker engine to FreeBSD. It was an ambitious project but nobody stepped forward to continuously port the never-ending flow of upstream code to FreeBSD. So the port still exists (sysutils/docker-freebsd) but it wasn't updated since 2015 and it is Docker v1 (it is v17 as of 2017).  
>  The other approach is to use official way of running Docker on platforms other than Linux. Well, somewhat official as Docker still does not support FreeBSD as a host officially. This is docker-machine tool which in turn will use VirtualBox to run a virtual machine with Linux and Docker engine. docker utility on the host will communicate with the engine inside VB where all the work will be done. This article describes what needs to be done to start using it.  
>  Before we begin you need VirtualBox installed. Do not skip adding /boot/loader.conf and /etc/rc.conf lines mentioned on that page. You won't need user inteface or anything, docker-machine will do all the work, just make sure VirtualBox is present and ready to be used.  
>  `pkg install docker docker-machine docker-compose’  
>  Docker will store its stuff in \~/.docker. You might not want the virtual machine image files to live in your home, in this case just create a symlink:  
>  mkdir \~/.docker  
>  ln -s /storage/docker \~/.docker/machine  
>  docker-machine create --driver virtualbox \\  
>  \--virtualbox-memory 2048 \\  
>  \--virtualbox-cpu-count 2 \\  
>  \--virtualbox-disk-size 102400 \\  
>  \--virtualbox-hostonly-cidr "10.2.1.1/24" \\  
>  docker1  
>  Here's the example. We are creating machine named docker1. It is using VirtualBox driver, the vm has 2G of memory, 2 cores and 100G of disk space. docker-machine setups VirtualBox to use host-only network adapter (it will create vboxnet0 interface on the host automatically) and we are instructing it to use 10.2.1.1/24 as the address of this adapter — change it to what suits your needs or omit this flag (default is 192.168.99.1/24).  
>  And basically that is all. Check if it is running:  
>  docker-machine ls  
>  If you do open VirtualBox interface you will find a virtual machine named docker1 running. You can start/stop/whatever your machine using docker-machine utility.
>
>

* Here’s how you can connect to the machine:

>
>
> docker utility by default tries to talk to Docker engine running on the same host. However with specific environment variables you can instruct it to talk to other host. docker-machine can export these variables for you.  
>  eval `docker-machine env docker1`  
>  docker run hello-world
>
>

* There was quite a bit of discussion about docker at the FreeBSD developers summit in Cambridge during the first week of August. Two docker developers who had worked on the Mac OS X port, one of whom is an OpenBSD advocate, explained how docker has evolved, and the linux-isms have been abstracted away such that a truly native docker solution for FreeBSD can be built and maintained with a lot less headache than before
* I look forward to seeing if we can’t make that happen \*\*\*

### [The POSIX Shell And Utilities](http://shellhaters.org/) ###

* The POSIX Shell And Utilities
* Compiled for The Shell Hater's Handbook \*\*\*

### [PostgreSQL – logging to a file](http://dan.langille.org/2017/07/31/postgresql-logging-to-a-file/) ###

>
>
> These steps were carried out on FreeBSD 11.0 with PostgreSQL 9.6 (two of my favorite tools).  
>  I like logging. I like logging PostgreSQL. With logs, you can see what happened. Without, you can only guess.  
>  Setting up logging for PostgreSQL involves several parts, each of which must be completed or else I don’t get what I want. This is not a criticism of PostgreSQL. It’s a feature.  
>  I am documenting this because each time I configure a new PostgreSQL instance, it takes me more than one iteration to get it working. The goal: this post lets both you and me get it right the first time.  
>  The parts include:
>
>
>
> * Telling PostgreSQL to log via syslog
> * Telling FreeBSD to local postgres to /var/log/postgres.log (my preference).
> * Telling PostgreSQL the things you want logged.
> * Changes to postgresql.conf The file location varies with the version installed. For PostgreSQL 9.6 on FreeBSD, the file is /var/db/postgres/data96/postgresql.conf (adjust 96 according to the version installed). I made these changes to that file. ` log_destination = 'syslog' log_min_messages = notice log_min_error_statement = notice log_checkpoints = on log_lock_waits = on log_timezone = 'UTC' ` By default, PostgreSQL logs to the local0 facility and is controlled by the syslog\_facility in postgresql.conf. This will be used in syslog.conf (see the next section of this post). The above mentioned changes require a reload: `service postgresql reload`
>
>

* Changes to /etc/syslog.conf

>
>
> Now that we have PostgreSQL logging to syslog, we want to tell syslog where to put those messages.  
>  I changed this line in /etc/syslog.conf:`*.notice;authpriv.none;kern.debug;lpr.info;mail.crit;news.err /var/log/messages`  
>  With *.notice pulling in some local0 messages, adding local0.none to the line will free the messages up for later use in the configuration file. Otherwise, the PostgreSQL messages will be in /var/log/messages.  
>  The changed line is:  
>  `*.notice;authpriv.none;kern.debug;lpr.info;mail.crit;news.err;local0.none /var/log/messages`  
>  Then, to get the messages into my preferred location, I added this to the file:  
> `local0.\* /var/log/postgresql.log`
>
>

* Log file rotation

>
>
> For rotating my log file, I added a new file: /usr/local/etc/newsyslog.conf.d/postgresql96
>
>
>
> ```
> /var/log/postgresql.log     pgsql:wheel  640  7     *    $D0   GB  /var/db/postgres/data96/postmaster.pid 30
>
> ```
>
>
>
> Before restarting syslog, I did this, so the destination file existed. This isn’t always/strictly necessary, but because the ownership is not chown root:wheel, I do it to get that part set.
>
>
>
> ```
> touch /var/log/postgresql.log
> chown pgsql:wheel
>
> ```
>
>
>
> Restarting syslog:
>
>
>
> ```
> sudo kill -HUP `sudo cat /var/run/syslog.pid `
>
> ```
>
>
>
> That’s it Now you should see PostgreSQL logging in /var/log/postgresql.log.
>
>

---

### [mandoc-1.14.2 released](http://undeadly.org/cgi?action=article&sid=20170729122350) ###

>
>
> i just released portable mandoc-1.14.2. It is available now from [http://mandoc.bsd.lv/](http://mandoc.bsd.lv/).
>
>

```From: Ingo Schwarze [schwarze@usta.de](mailto:schwarze@usta.de)  
 Date: Fri, 28 Jul 2017 20:12:44 +0200  
 To: [discuss@mandoc.bsd.lv](mailto:discuss@mandoc.bsd.lv)  
 Subject: mandoc-1.14.2 released

Hi,

i just released portable mandoc-1.14.2.  
 It is available now from [http://mandoc.bsd.lv/](http://mandoc.bsd.lv/) .

All downstream maintainers are encouraged to update their ports  
 and packages from 1.14.1 to 1.14.2.

Mandoc 1.14.2 is a feature release introducing:

* a new -Tmarkdown output mode
* anchors for deep linking into -Thtml manual pages
* a superset of the functionality of the former mdoclint(1) utility
* a new -Wstyle message level with several new messages
* automatic line breaking inside individual tbl(7) cells
* a rewrite of the eqn(7) lexer, and some eqn(7) rendering improvements
* support for many additional low-level roff(7) features
* and various smaller features and bug fixes.

For more details, see: [http://mandoc.bsd.lv/NEWS](http://mandoc.bsd.lv/NEWS)

With the improved mandoc features, only twenty-five out of the  
 ten thousand software packages in the OpenBSD ports tree still  
 need groff to format their manual pages.

Since the project has been called "mandoc" rather than "mdocml"  
 for several years now, the website, the distribution tarball,  
 and the source extraction directory are now also called "mandoc"  
 rather than "mdocml".

The release was tested on the following systems:

* OpenBSD-current and OpenBSD-stable
* NetBSD-current
* illumos
* Debian Linux
* Void Linux x86\_64 glibc and musl
* Crux Linux
* SunOS 5.11.2, 5.10, and 5.9

As before, catman(8) and the regression suite cannot be used on  
 SunOS 5.10 and SunOS 5.9.  
 A big thanks to everybody who provided patches, bug reports,  
 feature suggestions, advice, and help with testing!  
 Yours,  
 Ingo```

---

Beastie Bits
----------

* [A good looking terminal emulator which mimics the old cathode display. Available in x11/cool-retro-terminal](https://github.com/Swordfish90/cool-retro-term)
* [Milestone Complete! OpenRC conversion](https://www.trueos.org/blog/milestone-complete-openrc-conversion/)
* [Healthy developer interaction between FreeBSD and IllumOS re: mdb](https://illumos.topicbox.com/groups/developer/discussions/T5eae6079331c4df4)
* [Large Batch of Kernel Errata Patches Released](http://undeadly.org/cgi?action=article&sid=20170804053102)
* [opnsense 17.7 released](https://opnsense.org/opnsense-17-7-released/)
* [Twitter Co-Founder and CEO states “FreeBSD rules them all”](https://twitter.com/jack/status/892605692317650944)
* Hurry up and register for [vBSDCon September 7-9](http://www.verisign.com/en_US/internet-technology-news/verisign-events/vbsdcon/index.xhtml?dmn=vBSDcon.com) and [EuroBSDCon September 21-24](https://2017.eurobsdcon.org/) \*\*\*

Feedback/Questions
----------

* Dominik - [Monitoring Software](http://dpaste.com/08971FQ)
* Darren - [Wonderful Awk](http://dpaste.com/0YCS4DN)
* Andrew - [Thanks](http://dpaste.com/0ZREKTV)
* Jens - [Migration Questions](http://dpaste.com/1GVZNWN) \*\*\*