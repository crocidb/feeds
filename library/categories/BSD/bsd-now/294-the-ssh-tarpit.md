+++
title = "294: The SSH Tarpit"
description = "A PI-powered Plan 9 cluster, an SSH tarpit, rdist for when Ansible is too much, falling in love with OpenBSD again, how I created my first FreeBSD port, the Tilde Institute of OpenBSD education and more.Headlines[A Pi-Powered Plan 9 Cluster](https://www.rs-online.co"
date = "2019-04-18T16:00:00Z"
url = "https://www.bsdnow.tv/294"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.645644901Z"
seen = false
+++

A PI-powered Plan 9 cluster, an SSH tarpit, rdist for when Ansible is too much, falling in love with OpenBSD again, how I created my first FreeBSD port, the Tilde Institute of OpenBSD education and more.

Headlines
----------

### [A Pi-Powered Plan 9 Cluster](https://www.rs-online.com/designspark/a-pi-powered-plan-9-cluster) ###

>
>
> Plan 9 from Bell Labs comes from the same stable as the UNIX operating system, which of course Linux was designed after, and Apple’s OS X runs on top of a certified UNIX operating system. Just like UNIX, Plan 9 was developed as a research O/S — a vehicle for trying out new concepts — with it building on key UNIX principles and taking the idea of devices are just files even further. In this post, we take a quick look at the Plan 9 O/S and some of the notable features, before moving on to the construction of a self-contained 4-node Raspberry Pi cluster that will provide a compact platform for experimentation.
>
>
> ---
>

### [Endlessh: an SSH Tarpit](https://nullprogram.com/blog/2019/03/22/) ###

>
>
> I’m a big fan of tarpits: a network service that intentionally inserts delays in its protocol, slowing down clients by forcing them to wait. This arrests the speed at which a bad actor can attack or probe the host system, and it ties up some of the attacker’s resources that might otherwise be spent attacking another host. When done well, a tarpit imposes more cost on the attacker than the defender. The Internet is a very hostile place, and anyone who’s ever stood up an Internet-facing IPv4 host has witnessed the immediate and continuous attacks against their server. I’ve maintained such a server for nearly six years now, and more than 99% of my incoming traffic has ill intent. One part of my defenses has been tarpits in various forms.
>
>
> ---
>

News Roundup
----------

### [rdist(1) – when Ansible is too much](https://chargen.one/obsdams/rdist-1-when-ansible-is-too-much) ###

>
>
> The post written about rdist(1) on johan.huldtgren.com sparked us to write one as well. It's a great, underappreciated, tool. And we wanted to show how we wrapped doas(1) around it. There are two services in our infrastructure for which we were looking to keep the configuration in sync and to reload the process when the configuration had indeed changed. There is a pair of nsd(8)/unbound(8) hosts and a pair of hosts running relayd(8)/httpd(8) with carp(4) between them. We didn't have a requirement to go full configuration management with tools like Ansible or Salt Stack. And there wasn't any interest in building additional logic on top of rsync or repositories. \> Enter rdist(1), rdist is a program to maintain identical copies of files over multiple hosts. It preserves the owner, group, mode, and mtime of files if possible and can update programs that are executing.
>
>
> ---
>

### [Falling in love with OpenBSD again](https://functionallyparanoid.com/2019/03/13/well-its-been-a-while-falling-in-love-with-openbsd-again/) ###

>
>
> I was checking the other day and was appalled at how long it has been since I posted here. I had been working a job during 2018 that had me traveling 3,600 miles by air every week so that is at least a viable excuse. So what is my latest project? I wanted to get something better than the clunky old T500 “freedom laptop” that I could use as my daily driver. Some background here. My first paid gig as a programmer was on SunOS 4 (predecessor to Solaris) and Ultrix (on a DEC MicroVAX). I went from there to a Commodore Amiga (preemptive multitasking in 1985!). I went from there to OS/2 (I know, patron saint of lost causes) and then finally decided to “sell out” and move to Windows as the path of least resistance in the mid 90’s. My wife bought me an iPod literally just as they started working with computers other than Macs and I watched with fascination as Apple made the big gamble and moved away from PowerPC chips to Intel. That was the beginning of the Apple Fan Boi years for me. My gateway drug was a G4 MacMini and I managed somehow to get in on the pre-production, developer build of an Intel-based Mac. I was quite happy on the platform until about three years ago.
>
>
> ---
>

### [How I Created My First FreeBSD Port](https://aikchar.dev/blog/how-i-created-my-first-freebsd-port.html) ###

>
>
> I created my first FreeBSD port recently. I found that FreeBSD didn't have a port for GoCD, which is a continuous integration and continuous deployment (CI/CD) system. This was a great opportunity to learn how to build a FreeBSD port while also contributing back to the community
>
>
> ---
>

### [The Tilde Institute of OpenBSD Education](https://tilde.institute/) ###

>
>
> Welcome to tilde.institute! This is an OpenBSD machine whose purpose is to provide a space in the tildeverse for experimentation with and education of the OpenBSD operating system. A variety of editors, shells, and compilers are installed to allow for development in a native OpenBSD environment. OpenBSD's httpd(8) is configured with slowcgi(8) as the fastcgi provider and sqlite3 available. This allows users to experiment with web development using compiled CGI in C, aka the BCHS Stack. In addition to php7.0 and mysql (mariadb) by request, this provides an environment where the development of complex web apps is possible.
>
>
> ---
>

Beastie Bits
----------

* [SoloBSD 19.03-STABLE](https://www.solobsd.org/index.php/2019/03/26/solobsd-19-03-stable/)
* [WireGuard for NetBSD](https://docs.google.com/presentation/d/1BbveYtY9IhuPCOLsEafwXMefkiY3REJBYl-opMAKQC0/edit#slide=id.p)
* [NetBSD - Removing PF](https://mail-index.netbsd.org/tech-kern/2019/03/29/msg024883.html )
* [What does the N in nmake stand for?](https://devblogs.microsoft.com/oldnewthing/20190325-00/?p=102359)
* [A Map of the Internet from May 1973](https://kottke.org/19/03/a-map-of-the-internet-from-may-1973)
* [NSA-B-Gone : A sketchy hardware security device for your x220](https://hackaday.io/project/164343-nsa-b-gone)

---

Feedback/Questions
----------

* Jake - [A single jail as a VPN client](http://dpaste.com/1Y22ZJM)
* Matt - [Surprising BSD Features](http://dpaste.com/2FAFC3A#wrap)
* cia - [Routing and ZFS](http://dpaste.com/2T4J7G3)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

 Your browser does not support the HTML5 video tag.