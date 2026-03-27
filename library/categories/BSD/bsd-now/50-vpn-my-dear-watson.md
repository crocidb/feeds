+++
title = "50: VPN, My Dear Watson"
description = "It's our 50th episode, and we're going to show you how to protect your internet traffic with a BSD-based VPN. We'll also be talking to Robert Watson, of the FreeBSD core team, about security research, exploit mitigation and a whole lot more. The latest news and answers to all of "
date = "2014-08-13T12:00:00Z"
url = "https://www.bsdnow.tv/50"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.220696100Z"
seen = false
+++

It's our 50th episode, and we're going to show you how to protect your internet traffic with a BSD-based VPN. We'll also be talking to Robert Watson, of the FreeBSD core team, about security research, exploit mitigation and a whole lot more. The latest news and answers to all of your emails, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [MeetBSD 2014 is approaching](http://www.ixsystems.com/whats-new/ixsystems-to-host-meetbsd-california-2014-at-western-digital-in-san-jose/) ###

* The MeetBSD conference is coming up, and will be held on November 1st and 2nd in San Jose, California
* MeetBSD has an "unconference" format, which means there will be both planned talks and community events
* All the extra details will be on [their site](https://www.meetbsd.com/) soon
* It also has hotels and various other bits of useful information - hopefully with more info on the talks to come
* Of course, EuroBSDCon is coming up before then \*\*\*

### [First experiences with OpenBSD](https://www.azabani.com/2014/08/09/first-experiences-with-openbsd.html) ###

* A new blog post that leads off with "tired of the sluggishness of Windows on my laptop and interested in experimenting with a Unix-like that I haven't tried before"
* The author read the famous "[BSD for Linux users](http://www.over-yonder.net/~fullermd/rants/bsd4linux/01)" series (that most of us have surely seen) and decided to give BSD a try
* He details his different OS and distro history, concluding with how he "eventually became annoyed at the poor quality of Linux userland software"
* From there, it talks about how he used the OpenBSD USB image and got a fully-working system
* He especially liked the simplicity of OpenBSD's "hostname.if" system for network configuration
* Finally, he gets Xorg working and imports all his usual configuration files - seems to be a happy new user! \*\*\*

### [NetBSD rump kernels on bare metal (and Kansai OSC report)](https://blog.netbsd.org/tnf/entry/an_internet_ready_os_from) ###

* When you're developing a new OS or a very specialized custom solution, working drivers become one of the hardest things to get right
* However, NetBSD's rump kernels - a very unique concept - make this process a lot easier
* This blog post talks about the process of starting with just a rump kernel and expanding into an internet-ready system in just a week
* Also have a look back at [episode 8](http://www.bsdnow.tv/episodes/2013_10_23-a_brief_intorduction) for our interview about rump kernels and what exactly they do
* While on the topic of NetBSD, there were also a couple of [very detailed reports](http://mail-index.netbsd.org/netbsd-advocacy/2014/08/09/msg000658.html) (with lots of pictures!) of the various NetBSD-themed booths at the 2014 [Kansai Open Source Conference](http://d.hatena.ne.jp/mizuno-as/20140806/1407307913) that we wanted to highlight \*\*\*

### [OpenSSL and LibreSSL updates](https://www.openssl.org/news/secadv_20140806.txt) ###

* OpenSSL pushed out a few new versions, fixing multiple vulnerabilities (nine to be precise!)
* Security concerns include leaking memory, possible denial of service, crashing clients, memory exhaustion, TLS downgrades and more
* [LibreSSL released a new version](http://marc.info/?l=openbsd-tech&m=140752295222929&w=2) to address most of the vulnerabilities, but wasn't affected by some of them
* Whichever version of whatever SSL you use, make sure it's patched for these issues
* DragonFly and OpenBSD are patched as of the time of this recording but, even after a week, NetBSD and FreeBSD are not (outside of -CURRENT) \*\*\*

Interview - Robert Watson - [rwatson@freebsd.org](mailto:rwatson@freebsd.org)
----------

FreeBSD architecture, security research techniques, exploit mitigation

---

Tutorial
----------

### [Protecting traffic with a BSD-based VPN](http://www.bsdnow.tv/tutorials/openvpn) ###

---

News Roundup
----------

### [A FreeBSD-based CGit server](https://lechindianer.de/blog/2014/08/06/freebsd-cgit/) ###

* If you use git (like a certain host of this show) then you've probably considered setting up your own server
* This article takes you through the process of setting up a jailed git server, complete with a fancy web frontend
* It even shows you how to set up multiple repos with key-based user separation and other cool things
* The author of the post is also a listener of the show, thanks for sending it in! \*\*\*

### [Backup devices for small businesses](http://www.smallbusinesscomputing.com/biztools/6-data-backup-devices-for-small-businesses.html) ###

* In this article, different methods of data storage and backup are compared
* After weighing the various options, the author comes to an obvious conclusion: FreeNAS is the answer
* He praises FreeNAS and the FreeNAS Mini for their tight integration, rock solid FreeBSD base and the great ZFS featureset that it offers
* It also goes over some of the hardware specifics in the FreeNAS Mini \*\*\*

### [A new Xenocara interview](http://blog.bronevichok.ru/2014/08/06/testing-of-xorg.html) ###

* As a follow up to last week's OpenSMTPD interview, this Russian blog interviews Matthieu Herrb about Xenocara
* If you're not familiar with Xenocara, it's OpenBSD's version of Xorg with some custom patches
* In this interview, he discusses how large and complex the upstream X11 development is, how different components are worked on by different people, how they test code (including a new framework) and security auditing
* Matthieu is both a developer of upstream Xorg and an OpenBSD developer, so it's natural for him to do a lot of the maintainership work there \*\*\*

### [Building a high performance FreeBSD samba server](https://not.burntout.org/blog/high_performance_samba_server_on_freebsd/) ###

* If you've got to PXE boot several hundred Windows boxes to upgrade from XP to 7, what's the best solution?
* FreeBSD, ZFS and Samba obviously!
* The master image and related files clock in at over 20GB, and will be accessed at the same time by *all* of those clients
* This article documents that process, highlighting some specific configuration tweaks to maximize performance (including NIC bonding)
* It doesn't even require the newest or best hardware with the right changes, pretty cool \*\*\*

Feedback/Questions
----------

* [An interesting Reddit thread](http://www.reddit.com/r/BSD/comments/2ctlt4/switched_from_arch_linux_to_openbsd_reference/) ([or two](http://www.reddit.com/r/BSD/comments/2dcig9/thinking_about_coming_to_bsd_from_arch))
* [PB writes in](http://slexy.org/view/s21t7L5bqO)
* [Sean writes in](http://slexy.org/view/s20MFywDqZ)
* [Steve writes in](http://slexy.org/view/s2Td6nq11J)
* [Lachlan writes in](http://slexy.org/view/s215MlpJYV)
* [Justin writes in](http://slexy.org/view/s2N4JKkoKt) \*\*\*