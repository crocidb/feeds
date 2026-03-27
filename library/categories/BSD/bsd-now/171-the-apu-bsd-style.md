+++
title = "171: The APU - BSD Style!"
description = "Today on the show, we’ve got a look at running OpenBSD on a APU, some BSD in your Android, managing your own FreeBSD cloud service with ansible and much more. Keep it turned on your place to B...SD!This episode was brought to you by[![iXsystems - Enterprise Servers and "
date = "2016-12-07T13:00:00Z"
url = "https://www.bsdnow.tv/171"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.974613838Z"
seen = false
+++

Today on the show, we’ve got a look at running OpenBSD on a APU, some BSD in your Android, managing your own FreeBSD cloud service with ansible and much more. Keep it turned on your place to B...SD!

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [OpenBSD on PC Engines APU2](https://github.com/elad/openbsd-apu2) ###

* A detailed walkthrough of building an OpenBSD firewall on a PC Engines APU2
* It starts with a breakdown of the parts that were purchases, totally around $200
* Then the reader is walked through configuring the serial console, flashing the ROM, and updating the BIOS
* The next step is actually creating a custom OpenBSD install image, and pre-configuring its serial console. Starting with OpenBSD 6.0, this step is done automatically by the installer
* Installation:
  * Power off the APU2
  * Insert the bootable OpenBSD installer USB flash drive to one of the USB slots on the APU2
  * Power on the APU2, press F10 to get to the boot menu, and choose to boot from USB (usually option number 1)
  * At the boot\> prompt, remember the serial console settings (see above)
  * Also at the boot\> prompt, press Enter to start the installer
  * Follow the installation instructions

>
>
> The driver used for wireless networking is athn(4). It might not work properly out of the box. Once OpenBSD is installed, run fw\_update with no arguments. It will figure out which firmware updates are required and will download and install them. When it finishes, reboot.
>
>
> ---
>

### [Where the rubber meets the road… (part one)](https://functionallyparanoid.com/2016/11/29/where-the-rubber-meets-the-road-part-one/) ###

* A user describes their adventures installing OpenBSD and Arch Linux on a new Lenovo X1 Carbon (4th gen, skylake)
* They also detail why they moved away from their beloved Macbook, which while long, does describe a journey away from Apple that we’ve heard elsewhere.
* The journey begins with getting a new Windows laptop, shrinking the partition and creating space for a triple-boot install, of Windows / Arch / OpenBSD
* Brian then details how he setup the partitioning and performed the initial Arch installation, getting it tuned to his specifications.
* Next up was OpenBSD though, and that went sideways initially due to a new NVMe drive that wasn’t fully supported (yet)
* The article is split into two parts (we will bring you the next installment at a future date), but he leaves us with the plan of attack to build a custom OpenBSD kernel with corrected PCI device identifiers.
* We wish Brian luck, and look forward to the “rest of the story” soon. \*\*\*

### [Howto setup a FreeBSD jail server using iocage and ansible.](https://github.com/JoergFiedler/freebsd-ansible-demo) ###

* Setting up a FreeBSD jail server can be a daunting task. However when a guide comes along which shows you how to do that, including not exposing a single (non-jailed) port to the outside world, you know we had a take a closer look.
* This guide comes to us from GitHub, courtesy of Joerg Fielder.
* The project goals seem notable:

* Ansible playbook that creates a FreeBSD server which hosts multiple jails.

  * Travis is used to run/test the playbook.
  * No service on the host is exposed externally.
  * All external connections terminate within a jail.
  * Roles can be reused using Ansible Galaxy.
  * Combine any of those roles to create FreeBSD server, which perfectly suits you.

* To get started, you’ll need a machine with Ansible, Vagrant and VirtualBox, and your credentials to AWS if you want it to automatically create / destroy EC2 instances.

* There’s already an impressive list of Anisible roles created for you to start with:

  * freebsd-build-server - Creates a FreeBSD poudriere build server
  * freebsd-jail-host - FreeBSD Jail host
  * freebsd-jailed - Provides a jail
  * freebsd-jailed-nginx - Provides a jailed nginx server
  * freebsd-jailed-php-fpm - Creates a php-fpm pool and a ZFS dataset which is used as web root by php-fpm
  * freebsd-jailed-sftp - Installs a SFTP server
  * freebsd-jailed-sshd - Provides a jailed sshd server.
  * freebsd-jailed-syslogd - Provides a jailed syslogd
  * freebsd-jailed-btsync - Provides a jailed btsync instance server
  * freebsd-jailed-joomla - Installs Joomla
  * freebsd-jailed-mariadb - Provides a jailed MariaDB server
  * freebsd-jailed-wordpress - Provides a jailed Wordpress server.

* Since the machines have to be customized before starting, he mentions that cloud-init is used to do the following:

* activate pf firewall

* add a pass all keep state rule to pf to keep track of connection states, which in turn allows you to reload the pf service without losing the connection

* install the following packages:

  * sudo
  * bash
  * python27

* allow passwordless sudo for user ec2-user  
   “

* From there it is pretty straight-forward, just a couple commands to spin up the VM’s either locally on your VirtualBox host, or in the cloud with AWS. Internally the VM’s are auto-configured with iocage to create jails, where all your actual services run.

* A neat project, check it out today if you want a shake-n-bake type cloud + jail solution.

  ---

### [Colin Percival's bsdiff helps reduce Android apk bandwidth usage by 6 petabytes per day](http://android-developers.blogspot.ca/2016/12/saving-data-reducing-the-size-of-app-updates-by-65-percent.html) ###

* A post on the official Android-Developers blog, talks about how they used bsdiff (and bspatch) to reduce the size of Android application updates by 65%
* bsdiff was developed by FreeBSD’s Colin Percival

>
>
> Earlier this year, we announced that we started using the bsdiff algorithm (by Colin Percival). Using bsdiff, we were able to reduce the size of app updates on average by 47% compared to the full APK size.
>
>

* This post is actually about the second generation of the code.

>
>
> Today, we're excited to share a new approach that goes further — File-by-File patching. App Updates using File-by-File patching are, on average, 65% smaller than the full app, and in some cases more than 90% smaller.  
>  Android apps are packaged as APKs, which are ZIP files with special conventions. Most of the content within the ZIP files (and APKs) is compressed using a technology called Deflate. Deflate is really good at compressing data but it has a drawback: it makes identifying changes in the original (uncompressed) content really hard. Even a tiny change to the original content (like changing one word in a book) can make the compressed output of deflate look completely different. Describing the differences between the original content is easy, but describing the differences between the compressed content is so hard that it leads to inefficient patches.
>
>

* So in the second generation of the code, they use bsdiff on each individual file, then package that, rather than diffing the original and new archives
* bsdiff is used in a great many other places, including shrinking the updates for the Firefox and Chrome browsers
* You can find out more about bsdiff here: [http://www.daemonology.net/bsdiff/](http://www.daemonology.net/bsdiff/)

>
>
> A far more sophisticated algorithm, which typically provides roughly 20% smaller patches, is described in my [doctoral thesis](http://www.daemonology.net/papers/thesis.pdf).
>
>

* Considering the gains, it is interesting that no one has implemented Colin’s more sophisticated algorithm
* Colin had an [interesting observation](https://twitter.com/cperciva/status/806426180379230208) last night: “I just realized that bandwidth savings due to bsdiff are now roughly equal to what the *total internet traffic* was when I wrote it in 2003.” \*\*\*

News Roundup
----------

### [Distrowatch does an in-depth review of NAS4Free](https://distrowatch.com/weekly.php?issue=20161114#nas4free) ###

* Jesse Smith over at DistroWatch has done a pretty in-depth review of Nas4Free.
* The review starts with mentioning that NAS4Free works on 3 platforms, ARM/i386/AMD64 and for the purposes of this review he would be using AMD64 builds.
* After going through the initial install (doing typical disk management operations, such as GPT/MBR, etc) he was ready to begin using the product.
* One concern originally observed was that the initial boot seemed rather slow. Investigation revealed this was due to it loading the entire OS image into memory, and the first (long) disk read did take some time, but once loaded was super responsive.
* The next steps involved doing the initial configuration, which meant creating a new ZFS storage pool. After this process was done, he did find one puzzling UI option called “VM” which indicated it can be linked to VirtualBox in some way, but the Docs didn’t reveal its secrets of usage.
* Additionally covered were some of the various “Access” methods, including traditional UNIX permissions, AD and LDAP, and then various Sharing services which are typical to a NAS, Such as NFS / Samba and others.
* One neat feature was the built-in file-browser via the web-interface, which allows you another method of getting at your data when sometimes NFS / Samba or WebDav aren’t enough.
* Jesse gives us a nice round-up conclusion as well

>
>
> Most of the NAS operating systems I have used in the past were built around useful features. Some focused on making storage easy to set up and manage, others focused on services, such as making files available over multiple protocols or managing torrents. Some strive to be very easy to set up. NAS4Free does pretty well in each of the above categories. It may not be the easiest platform to set up, but it's probably a close second. It may not have the prettiest interface for managing settings, but it is quite easy to navigate. NAS4Free may not have the most add-on services and access protocols, but I suspect there are more than enough of both for most people.
>
>
>
> Where NAS4Free does better than most other solutions I have looked at is security. I don't think the project's website or documentation particularly focuses on security as a feature, but there are plenty of little security features that I liked. NAS4Free makes it very easy to lock the text console, which is good because we do not all keep our NAS boxes behind locked doors. The system is fairly easy to upgrade and appears to publish regular security updates in the form of new firmware. NAS4Free makes it fairly easy to set up user accounts, handle permissions and manage home directories. It's also pretty straight forward to switch from HTTP to HTTPS and to block people not on the local network from accessing the NAS's web interface.
>
>
>
> All in all, I like NAS4Free. It's a good, general purpose NAS operating system. While I did not feel the project did anything really amazing in any one category, nor did I run into any serious issues. The NAS ran as expected, was fairly straight forward to set up and easy to manage. This strikes me as an especially good platform for home or small business users who want an easy set up, some basic security and a solid collection of features.
>
>
> ---
>

### [Browsix: Unix in the browser tab](https://browsix.org/) ###

* Browsix is a research project from the PLASMA lab at the University of Massachusetts, Amherst.
* The goal: Run C, C++, Go and Node.js programs as processes in browsers, including LaTeX, GNU Make, Go HTTP servers, and POSIX shell scripts.
* “Processes are built on top of Web Workers, letting applications run in parallel and spawn subprocesses. System calls include fork, spawn, exec, and wait.”

>
>
> Pipes are supported with pipe(2) enabling developers to compose processes into pipelines.
>
>
>
> Sockets include support for TCP socket servers and clients, making it possible to run applications like databases and HTTP servers together with their clients in the browser.
>
>

* Browsix comprises two core parts:
  * A kernel written in TypeScript that makes core Unix features (including pipes, concurrent processes, signals, sockets, and a shared file system) available to web applications.
  * Extended JavaScript runtimes for C, C++, Go, and Node.js that support running programs written in these languages as processes in the browser.

* This seems like an interesting project, although I am not sure how it would be used as more than a toy \*\*\*

### [Book Review: PAM Mastery](https://www.cyberciti.biz/reviews/book-review-pam-mastery/) ###

* nixCraft does a book review of Michael W. Lucas’ “Pam Mastery”

>
>
> Linux, FreeBSD, and Unix-like systems are multi-user and need some way of authenticating individual users. Back in the old days, this was done in different ways. You need to change each Unix application to use different authentication scheme.
>
>

* Before PAM, if you wanted to use an SQL database to authenticate users, you had to write specific support for that into each of your applications. Same for LDAP, etc.

>
>
> So Open Group lead to the development of PAM for the Unix-like system. Today Linux, FreeBSD, MacOS X and many other Unix-like systems are configured to use a centralized authentication mechanism called Pluggable Authentication Modules (PAM). The book “PAM Mastery” deals with the black magic of PAM.
>
>

* Of course, each OS chose to implement PAM a little bit differently

>
>
> The book starts with the basic concepts about PAM and authentication. You learn about Multi-Factor Authentication and why use PAM instead of changing each program to authenticate the user. The author went into great details about why PAM is useful for developers and sysadmin for several reasons. The examples cover CentOS Linux (RHEL and clones), Debian Linux, and FreeBSD Unix system.
>
>
>
> I like the way the author described PAM Configuration Files and Common Modules that covers everyday scenarios for the sysadmin. PAM configuration file format and PAM Module Interfaces are discussed in easy to understand language. Control flags in PAM can be very confusing for new sysadmins. Modules can be stacked in a particular order, and the control flags determine how important the success or failure of a particular module.
>
>
>
> There is also a chapter about using one-time passwords (Google Authenticator) for your application.
>
>
>
> The final chapter is all about enforcing good password policies for users and apps using PAM.
>
>
>
> The sysadmin would find this book useful as it covers a common authentication scheme that can be used with a wide variety of applications on Unix. You will master PAM topics and take control over authentication for your organization IT infrastructure. If you are Linux or Unix sysadmin, I would highly recommend this book. Once again Michael W Lucas nailed it. The only book you may need for PAM deployment.
>
>

* [get “PAM Mastery” ](https://www.michaelwlucas.com/tools/pam) \*\*\*

### [Reflections on Trusting Trust - Ken Thompson, co-author of UNIX](http://www.win.tue.nl/~aeb/linux/hh/thompson/trust.html) ###

>
>
> Ken Thompson's "cc hack" - Presented in the journal, Communication of the ACM, Vol. 27, No. 8, August 1984, in a paper entitled "Reflections on Trusting Trust", Ken Thompson, co-author of UNIX, recounted a story of how he created a version of the C compiler that, when presented with the source code for the "login" program, would automatically compile in a backdoor to allow him entry to the system. This is only half the story, though. In order to hide this trojan horse, Ken also added to this version of "cc" the ability to recognize if it was recompiling itself to make sure that the newly compiled C compiler contained both the "login" backdoor, and the code to insert both trojans into a newly compiled C compiler. In this way, the source code for the C compiler would never show that these trojans existed.
>
>

* The article starts off by talking about a content to write a program that produces its own source code as output. Or rather, a C program, that writes a C program, that produces its own source code as output.

>
>
> The C compiler is written in C. What I am about to describe is one of many "chicken and egg" problems that arise when compilers are written in their own language. In this case, I will use a specific example from the C compiler.
>
>
>
> Suppose we wish to alter the C compiler to include the sequence "\\v" to represent the vertical tab character. The extension to Figure 2 is obvious and is presented in Figure 3. We then recompile the C compiler, but we get a diagnostic. Obviously, since the binary version of the compiler does not know about "\\v," the source is not legal C. We must "train" the compiler. After it "knows" what "\\v" means, then our new change will become legal C. We look up on an ASCII chart that a vertical tab is decimal 11. We alter our source to look like Figure 4. Now the old compiler accepts the new source. We install the resulting binary as the new official C compiler and now we can write the portable version the way we had it in Figure 3.
>
>
>
> The actual bug I planted in the compiler would match code in the UNIX "login" command. The replacement code would miscompile the login command so that it would accept either the intended encrypted password or a particular known password. Thus if this code were installed in binary and the binary were used to compile the login command, I could log into that system as any user. Such blatant code would not go undetected for long. Even the most casual perusal of the source of the C compiler would raise suspicions.
>
>
>
> Next “simply add a second Trojan horse to the one that already exists. The second pattern is aimed at the C compiler. The replacement code is a Stage I self-reproducing program that inserts both Trojan horses into the compiler. This requires a learning phase as in the Stage II example. First we compile the modified source with the normal C compiler to produce a bugged binary. We install this binary as the official C. We can now remove the bugs from the source of the compiler and the new binary will reinsert the bugs whenever it is compiled. Of course, the login command will remain bugged with no trace in source anywhere.
>
>
>
> So now there is a trojan’d version of cc. If you compile a clean version of cc, using the bad cc, you will get a bad cc. If you use the bad cc to compile the login program, it will have a backdoor. The source code for both backdoors no longer exists on the system. You can audit the source code of cc and login all you want, they are trustworthy.
>
>
>
> The compiler you use to compile your new compiler, is the untrustworthy bit, but you have no way to know it is untrustworthy, and no way to make a new compiler, without using the bad compiler.
>
>
>
> The moral is obvious. You can't trust code that you did not totally create yourself. (Especially code from companies that employ people like me.) No amount of source-level verification or scrutiny will protect you from using untrusted code. In demonstrating the possibility of this kind of attack, I picked on the C compiler. I could have picked on any program-handling program such as an assembler, a loader, or even hardware microcode. As the level of program gets lower, these bugs will be harder and harder to detect. A well installed microcode bug will be almost impossible to detect.
>
>
>
> Acknowledgment: I first read of the possibility of such a Trojan horse in an Air Force critique of the security of an early implementation of Multics. I can- not find a more specific reference to this document. I would appreciate it if anyone who can supply this reference would let me know.
>
>
> ---
>

Beastie Bits
----------

* [Custom made Beastie Stockings](https://www.etsy.com/listing/496638945/freebsd-beastie-christmas-stocking)

* [Migrating ZFS from mirrored pool to raidz1 pool](http://ximalas.info/2016/12/06/migrating-zfs-from-mirrored-pool-to-raidz1-pool/)

* [OpenBSD and you](https://home.nuug.no/~peter/blug2016/)

* [Watson.org FreeBSD and Linux cross reference ](http://fxr.watson.org/)

* [OpenGrok](http://bxr.su/)

* [FreeBSD SA-16:37: libc](https://www.freebsd.org/security/advisories/FreeBSD-SA-16:37.libc.asc) -- A 26+ year old bug found in BSD’s libc, all BSDs likely affected -- A specially crafted argument can trigger a static buffer overflow in the library, with possibility to rewrite following static buffers that belong to other library functions.

* [HardenedBSD issues correction for libc patch ](https://github.com/HardenedBSD/hardenedBSD/commit/fb823297fbced336b6beeeb624e2dc65b67aa0eb) -- original patch improperly calculates how many bytes are remaining in the buffer.

>
>
> From December the 27th until the 30th there the 33rd Chaos Communication Congress[0] is going to take place in Hamburg, Germany. Think of it as the yearly gathering of the european hackerscene and their overseas friends. I am one of the persons organizing the "[BSD assembly](https://events.ccc.de/congress/2016/wiki/Assembly:BSD)" as a gathering place for BSD enthusiasts and waving the flag amidst the all the other projects / communities.
>
>
> ---
>

Feedback/Questions
----------

* [ Chris - IPFW + Wifi](http://pastebin.com/WRiuW6nn)
* [ Jason - bhyve pci](http://pastebin.com/JgerqZZP)
* [ Al - pf errors](http://pastebin.com/3XY5MVca)
* [ Zach - Xorg settings](http://pastebin.com/Kty0qYXM)
* [ Bart - Wireless Support](http://pastebin.com/m3D81GBW) \*\*\*