+++
title = "150: Sprinkle a little BSD into your life."
description = "Today on the show, we are going to be talking to Jim Brown (of BSD Cert Fame) about his home-brew sprinkler system… Wait for it…This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems.com/bsdn"
date = "2016-07-13T12:00:00Z"
url = "https://www.bsdnow.tv/150"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.019760024Z"
seen = true
+++

Today on the show, we are going to be talking to Jim Brown (of BSD Cert Fame) about his home-brew sprinkler system… Wait for it…

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Distrowatch reviews OpenBSD and PCBSD's live upgrade method](http://distrowatch.com/weekly.php?issue=20160620#upgrade) ###

* Upgrading… The bane of any sysadmin! Distrowatch has recently done a write-up on the in-place upgrading of various distros / BSDs including PC-BSD and OpenBSD.
* Lets look first at the PC-BSD attempt, which was done going from 9.2 -\> 10.

>
>
> “I soon found trying to upgrade either the base system or pkg would fail. The update manager did not provide details as to what had gone wrong and so I decided to attempt a manual upgrade by following the FreeBSD Handbook as I had when performing a live upgrade of FreeBSD back in May. At first the manual process seemed to work, downloading the necessary patches for FreeBSD 10 and getting me to resolve conflicts between my existing configuration files and the new versions. Part way through, we are asked to reboot and then continue the upgrade process using the freebsd-update command utility. PC-BSD failed to reboot and, in fact, the boot loader no longer found any operating systems to run.”
>
>

* Ouch! I’m not sure on the particular commands used, but to lose the boot-loader indicates something went horribly wrong. There is good news in this though. After the pain experienced in the 9.X upgrade process, 11.0 has been vastly improved to help fix this going forward. The updater is also self-updating, which means future changes to tools such as package can be accounted for in previously released versions.
* Moving on to OpenBSD, Jesse had much better luck: \> “The documentation provided explains how to upgrade OpenBSD 5.8 to version 5.9 step-by-step and the instructions worked exactly as laid out. Upgrading requires two reboots, one to initiate the upgrade process and one to boot into the new version of OpenBSD. Upgrading the base operating system took approximately ten minutes, including the two reboots. Upgrading the third-party packages took another minute or two. The only quirk I ran into was that I had to manually update my repository mirror information to gain access to the new packages available for OpenBSD 5.9. If this step is not done, then the pkg\_add package manager will continue to pull in packages from the old repository we set up for OpenBSD 5.8. “
* A good read, and they covered some Linux distros such as Mint and OpenMandriva as well, if you want to find out how they fared. \*\*\*

### [A curated list of awesome DTrace books, articles, videos, tools and resources](http://awesome-dtrace.com/) ###

* The website awesome-dtrace.com compiles a list of resources, including books, articles, videos, tools, and other resources, to help you get the most out of DTrace
* The list of books includes 2 open source books that are available on the web, and of course Brendan Gregg’s official DTrace book
* There are also cheat sheets, one-liner collections, and a set of DTrace war stories
* A breakdown of different PID providers and the userspace statically defined tracepoints
* The videos from DTrace.conf 2008, 2012, and soon 2016
* And links to the tools to start using DTrace with your favourite programming language, including Erlang, Node.JS, Perl, PHP, Python, or Ruby
* There are also DTrace setups for MySQL/MariaDB, and PostreSQL
* Joyent has even written a mod\_usdt DTrace module for the Apache web server
* This seems like a really good resource, and with the efforts of the new OpenDTrace project, to modernize the dtracetoolkit and make it more useful across the different supported operating systems, there has never been a better time to start learning DTrace \*\*\*

### [Installing OpenBSD using a serial console with no external monitor](http://unix.stackexchange.com/questions/292891/how-can-i-install-openbsd-using-the-serial-console-without-external-monitor-wi) ###

* Have you found yourself needing to install OpenBSD from USB, but with a twist, as in no external monitor? Well somebody has and asked the question on stackexchange.
* The answer provided is quite well explained, but in a nut-shell the process involves downloading the USB image and making some tweaks before copying it to the physical media.
* Specifically with a couple of well-placed echo’s into boot.conf, the serial-port can be enabled and ready for use:

>
>
> echo "stty com0 115200" \> /mnt/etc/boot.conf  
>  echo "set tty com0" \>\> /mnt/etc/boot.conf
>
>
>
> * After that, simply boot the box and you are ready to access the serial console and drive the installation as normal! #bsdhacks \*\*\*
>
>

### [GSoC 2016 Reports: Split debug symbols for pkgsrc builds](https://blog.netbsd.org/tnf/entry/gsoc_2016_reports_split_debug) ###

* The NetBSD blog provides a status report on one of the GSoC projects that is nearing its midterm evaluation
* The project to split debugging data into separate pkgsrc packages, so that users can install the debugging symbols if they need them to debug a failing application
* The report is very detailed, and includes “A quick introduction to ELF and how debug information are stored/stripped off”
* It walks through the process of writing a simple example application, compiling it, and dealing with the debug data
* It includes a number of very useful diagrams, and a summary of what changes needed to be make to the pkgsrc makefile infrastructure
* With this as a recipe, someone should be able to do something quite similar for FreeBSD’s ports tree \*\*\*

iXsystems
----------

* [iXsystems’ TrueNAS Firmware Update Delivers Compelling Performance, Replication, and Graphing Improvements](https://www.ixsystems.com/blog/ixsystems-truenas-firmware-update-delivers-compelling-performance-replication-graphing-improvements/) \*\*\*

Interview - Jim Brown - [jpb@jimby.name](mailto:jpb@jimby.name)
----------

FreeBSD+BBB Sprinkler System

---

News Roundup
----------

### [From the past : A Research Unix Reader](http://www.cs.dartmouth.edu/~doug/reader.pdf) ###

* A paper by by Douglas McIlroy
* “Selected pages from the nine research editions of the UNIX® Programmer’s Manual illustrate the development of the system”
* “Accompanying commentary recounts some of the needs, events, and individual contributions that shaped this evolution.”
* Interesting insight into the evolution of the origin UNIX operating system \*\*\*

### [Evolution of C programming practices – Unix 1973–2015](http://kristerw.blogspot.com/2016/06/evolution-of-c-programming-practices.html) ###

* From the author of the recent post we covered, “20 years of NetBSD code bloat”, comes a new post
* “I found a recent paper that also looks at how the BSD code base has evolved, but from a very different perspective compared to my code-size investigation.”
* The paper "The Evolution of C Programming Practices: A Study of the Unix Operating System 1973–2015" investigates coding style, and tests seven hypotheses by looking at metrics (line length, number of volatile in the source code, etc.) in 66 releases of Unix from 1973 to 2014. The hypotheses are: \> + Programming practices reflect technology affordances (e.g. developers may be more liberal with screen space when using high resolution displays) \> + Modularity increases with code size \> + New language features are increasingly used to saturation point \> + Programmers trust the compiler for register allocation \> + Code formatting practices converge to a common standard \> + Software complexity evolution follows self correction feedback mechanisms \> + Code readability increases
* and the result is that they seem to be true, as interpreted through the metrics. \> “The data points for the releases have somewhat random dates. One issue is that the paper use each release's mean file date (the average of the files' last modification time) instead of the release date (that is why the graphs stop at November 2010, even though FreeBSD 10 was released in 2014). The idea is that this better reflects the age of the code base, but this has the effect of compressing some of the data points (especially the clustering around 1993-1994), and it makes the spline fitting even more suspect.” \> “One other problem is that the original data used by the researchers seems to have incorrect timestamps. For example, 4.3BSD Net/1 was released in 1989, but is listed as 1993-12-25 in the paper. The same is true for at least the Net/2 release too, which was released in 1991, but the paper list it as 1993-07-02.” \*\*\*

### [old release pictures] ###

* [openbsd 2.1 - 5.9, straight from theo's bookshelf.](https://twitter.com/blakkheim/status/747540167112671232)
* [Speaking of old releases, our Producer JT picked up this gem at Southeast Linuxfest this year](https://twitter.com/q5sys/status/748003859012984837)
* [Noah Axon shares a scan of his NetBSD 1.4 disc](https://plus.google.com/+NoahAxon/posts/VsiQhUn3tHb)
* [Jan van den broek shares a pic of his FreeBSD 2.2.5 set](https://plus.google.com/101232368324501316985/posts/4QsaJE2KxXh) \*\*\*

### [FreeBSD: Just in Time](https://bsdmag.org/just_in_time/) ###

* Another BSDMag goodie this week, we have a small article written by Jonathan Garrido which details their experience switching to FreeBSD for a NTP server.
* The article is short, but a good read: \> “A Few years ago we had a time problem. Suddenly our linux NTP server, for a reason that I still do not know, started to fail giving us a lot of issues within all the equipment and services within our network. After a quick and brief meeting with management, I found out that there was not sufficient budget left for a fancy and well-suited appliance. So, with no time (literally) and no money to spend, I decided to give it a try and utilized a homemade open source solution, and the operating system of choice was FreeBSD 10.0.”

>
>
> “Now, let’s pause for a second. You may be thinking, why in the world is this guy doing this, when he has never installed a BSD machine in his life? The answer is very simple; here, in the Dominican Republic, in the heart of the Caribbean, FreeBSD has a very good reputation when it comes to reliability and security. In fact, there is some collective thought within the sysadmin community that says something like: “If you want to deal only once with a service, install it over FreeBSD.””
>
>

* Jonathan then goes through some of the steps taken to initial deploy NTP services, but with that out of the way, he has a great summary: \> “Fascinated with the whole experience, we migrate one of our internal dns servers to a second FreeBSD machine and at the moment of this writing we are testing haproxy, an open source load-balancing proxy into a another server with the same OS. \> After all this, no time issues have been reported in the past 2 years, so at least for my environment, FreeBSD came just in time.“ \*\*\*

Beastie Bits
----------

* [MiniBSD laptop computer](https://hackaday.io/project/643-minibsd-laptop-computer)

* [The state of LibreSSL in FreeBSD](https://attilagyorffy.com/2016/07/02/the-state-of-libressl-in-freebsd/)

* [Justin Sherrill is looking for someone willing to run a Go builder with DragonflyBSD](https://www.dragonflydigest.com/2016/07/01/18372.html)

* [Tiny Unix tools for Windows](https://tinyapps.org/blog/windows/201606040700_tiny_unix_tools_windows.html)

* [OpenBSD's doas added to the FreeBSD Ports Tree](http://www.freshports.org/security/doas/)

* [ubuntuBSD 16.04 to feature a combo of BusyBox and OpenRC, no systemd](http://linux.softpedia.com/blog/ubuntubsd-16-04-will-feature-a-combination-of-busybox-and-openrc-but-no-systemd-505463.shtml)

* [Syncast Podcast 4 : Curl, libcurl and the future of the web, with Daniel Stenberg](http://podcast.sysca.st/podcast/4-curl-libcurl-future-web-daniel-stenberg/)

  ---

Feedback/Questions
----------

* [ Harri - Using beadm / zfssnap ](http://pastebin.com/qKeCd63F)
* [ Jonathan - bhyve vs Proxmox ](http://pastebin.com/EhXDwbWQ)
* [ Mohammad - Bhyve gfx passthrough](http://pastebin.com/ZCNk4Bga)
* [ Jeremy - Shapshots and more Snapshots](http://pastebin.com/xp7nzEYa)
* [ Ron - Microphone](http://pastebin.com/H2xr53CR) \*\*\*