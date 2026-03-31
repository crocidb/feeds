+++
title = "114: BSD-Schooling"
description = 'This week, Allan is out of town at another Developer Summit, but we have a great episode comingThis episode was brought to you by alt="iXsystems - Enterprise Servers and Storage for Open Source" /\[ title="DigitalOce'
date = "2015-11-04T13:00:00Z"
url = "https://www.bsdnow.tv/114"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.091981649Z"
seen = true
+++

This week, Allan is out of town at another Developer Summit, but we have a great episode coming

This episode was brought to you by
----------

[![](/images/1.png) alt="iXsystems - Enterprise Servers and Storage for Open Source" /\>](http://www.ixsystems.com/bsdnow)[ title="DigitalOcean"\>![DigitalOcean - Simple Cloud Hosting, <br>
Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![]() src="/images/3.png" alt="Tarsnap - Online Backups for the Truly Paranoid" /\>](http://www.tarsnap.com/bsdnow)

#### [iX Systems Mission Complete](https://www.ixsystems.com/missioncomplete/) ####

* Submit your story of how you accomplished a mission with FreeBSD, FreeNAS, or iXsystems hardware, and you could win monthly prizes, and have your story featured in the FreeBSD Journal! \*\*\*

Headlines
----------

### [WhatsApp founder, on how it got so HUGE](http://www.wired.com/2015/10/whatsapps-co-founder-on-how-the-iconoclastic-app-got-huge/) ###

* Wired has interviewed WhatsApp co-founder Brian Acton, about the infrastructure behind WhatsApp
* WhatsApp manages 900 million users with a team of 50, while Twitter needs around 4,000 employees to manage 300 million users.
* “FreeBSD has a nicely tuned network stack and extremely good reliability. We find managing FreeBSD installations to be quite straightforward.”
* “Linux is a beast of complexity. FreeBSD has the advantage of being a single distribution with an extraordinarily good ports collection.”
* “To us, it has been an advantage as we have had very few problems that have occurred at the OS level. With Linux, you tend to have to wrangle more and you want to avoid that if you can.”
* “FreeBSD happened because both Jan and I have experience with FreeBSD from Yahoo!.”
* [Additional Coverage ](http://uk.businessinsider.com/whatsapp-built-using-erlang-and-freebsd-2015-10) \*\*\*

### [User feedback in the SystemD vs BSD init](https://www.textplain.net/blog/2015/problems-with-systemd-and-why-i-like-bsd-init/) ###

* We have a very detailed blog post this week from Randy Westlund, about his experiences on Linux and BSD, contrasting the init systems.
* What he finds is that while, it does make some things easier, such as writing a service file once, and having it run everywhere, the tradeoff comes in the complexity and lack of transparency.
* Another area of concern was the reproducibility of boots, how in his examples on servers, there can often be times when services start in different orders, to save a few moments of boot-time.
* His take on the simplicity of BSD’s startup scripts is that they are very easy to hack on and monitor, while not introducing the feature creep we have seen in sysd.
* It will be interesting to see NextBSD / LaunchD and how it compares in the future! \*\*\*

### [Learn to embrace open source, or get buried](http://opensource.com/business/15/10/ato-interview-jim-salter) ###

* At the recent “All Things Open” conference, opensource.com interviewed Jim Salter
* He describes how he first got started using FreeBSD to host his personal website
* He then goes on to talk about starting FreeBSDWiki.net and what its goals were
* The interview then talks about using Open Source at solve customers’ problems at his consulting firm
* Finally, the talks about his presentation at AllThingsOpen: [Move Over, Rsync ](http://allthingsopen.org/talks/move-over-rsync/) about switching to ZFS replication \*\*\*

### [HP’s CTO Urges businesses to avoid permissive licenses ](http://lwn.net/Articles/660428/) ###

* Martin Fink went on a rant about the negative effects of license proliferation
* While I agree that having too many new licenses is confusing and adds difficulty, I didn’t agree with his closing point
* “He then ended the session with an extended appeal to move the open-source software industry away from permissive licenses like Apache 2.0 and toward copyleft licenses like the GPL”
* “The Apache 2.0 license is currently the most widely used "permissive" license. But the thing that developers overlook when adopting it, he said, is that by using Apache they are also making a choice about how much work they will have to put into building any sort of community around the project. If you look at Apache-licensed projects, he noted, "you'll find that they are very top-heavy with 'governance' structures." Technical committees, working groups, and various boards, he said, are needed to make such projects function. But if you look at copyleft projects, he added, you find that those structures simply are not needed.”
* There are plenty of smaller permissively licensed projects that do not have this sort of structure, infact, most of this structure comes from being an Apache run project, rather than from using the Apache or any other permissive license
* Luckily, he goes on to state that the “OpenSwitch code is released under the Apache 2.0 license, he said, because the other partner companies viewed that as a requirement.”
* “HP wanted to get networking companies and hardware suppliers on board. In order to get all of the legal departments at all of the partners to sign on to the project, he said, HP was forced to go with a permissive license”
* Hopefully the trend towards permissive licenses continues
* Additionally, in a separate LWN post:
* [RMS Says: “I am not saying that competitors to a GNU package are unjust or bad -- that isn't necessarily so. The pertinent point is that they are *competitors*. The goal of the GNU Project is for GNU to win the competition. Each GNU package is a part of the GNU system, and should contribute to the success of the GNU Project. Thus, each GNU package should encourage people to run other GNU packages rather than their competitors -- even competitors which are free software.” ](http://lwn.net/Articles/659757/)
* Never thought I’d see RMS espousing vendor lock-in \*\*\*

Interview - Brian Callahan - [bcallah@devio.us](mailto:bcallah@devio.us) / [@twitter](https://twitter.com/__briancallahan)
----------

* The BSDs in Education \*\*\*

News Roundup
----------

### [Digital Libraries in Africa making use of DragonflyBSD and HAMMER](http://lists.dragonflybsd.org/pipermail/users/2015-October/228403.html) ###

* In the international development context, we have an interesting post from Michael Wilson of the PeerCorps Trust Fund.
* They are using DragonFlyBSD and FreeBSD to support the Tanzanian Digital Library Initiative in very resource-limited settings.  

* They cite among the most important reasons for using BSD as the availability and quality of the documentation, as well as the robustness of the filesystems, both ZFS and HAMMER.
* Their website is now online over at ([http://www.tandli.com/](http://www.tandli.com/)) , check it out to see exactly how BSD is being used in the field \*\*\*

### [netflix hits \> 65gbps from a single freebsd box](https://twitter.com/ed_maste/status/655120086248763396) ###

* A single socket server, with a high end Xeon E5 processor and a dual ported Chelsio T580 (2x 40 Gbps ports) set a netflix record pushing over 65 Gbps of traffic from a single machine
* The videos were being pushed from SSDs and some new high end NVMe devices
* The previous record at Netflix was 52 Gbps from a single machine, but only with very experimental settings. The current work is under much more typical settings
* By the end of that night, traffic surged to over 70 Gbps
* Only about 10-15% of that traffic was encrypted with the in-kernel TLS engine that Netflix has been working on with John-Mark Gurney
* It was reported that the machine was only using about 65% cpu, and had plenty of head room
* If I remember the discussion correctly, there were about 60,000 streams running off the machine \*\*\*

### [Lumina Desktop 0.8.7 has been released](http://lumina-desktop.org/lumina-desktop-0-8-7-released/) ###

* A very large update has landed for PC-BSD’s Lumina desktop
* A brand new “Start” menu has been added, which enables quick launch of favorite apps, pinning to desktop / favorites and more.
* Desktop icons have been overhauled, with better font support, and a new Grid system for placement of icons.
* Support for other BSD’s such as DragonFly has been improved, along with TONS of internal changes to functionality and backends.
* Almost too many things to list here, but the link above will have full details, along with screenshots. \*\*\*

### [A LiveUSB for NetBSD has been released by Jibbed](http://www.jibbed.org/) ###

* After a three year absence, the Jibbed project has come back with a Live USB image for NetBSD!
* The image contains NetBSD 7.0, and is fully R/W, allowing you to run the entire system from a single USB drive.
* Images are available for 8Gb and 4Gb sticks (64bit and 32bit respectively), along with VirtualBox images as well
* For those wanting X, it includes both X and TWM, although ‘pkgin’ is available, so you can quickly add other desktops to the image \*\*\*

### Beastie Bits ###

* [After recent discussions of revisiting W<sup>X</sup> support in Mozilla Firefox, David Coppa has flipped the switch to enable it for OpenBSD users running -current.](http://undeadly.org/cgi?action=article&sid=20151021191401&mode=expanded)

* [Using the vt(4) driver to change console resolution](http://lme.postach.io/post/changing-console-resolution-in-freebsd-10-with-vt-4)

* [The FreeBSD Foundation gives a great final overview of the Grace Hopper Conference](http://freebsdfoundation.blogspot.com/2015/10/conference-recap-grace-hopper.html)

* [A dialog about Compilers in the (BSD) base system](https://medium.com/@jmmv/compilers-in-the-bsd-base-system-1c4515a18c49)

* [One upping their 48-core work from July, The Semihalf team shows off their the 96-core SMP support for FreeBSD on Cavium ThunderX (ARMv8 architecture](https://www.youtube.com/watch?v=1q5aDEt18mw)

### [NYC Bug's November meeting will be featuring a talk by Stephen R. Bourne](http://lists.nycbug.org/pipermail/talk/2015-October/016384.html) ###

### [New not-just-BSD postcast, hosted by two OpenBSD devs Brandon Mercer and Joshua Stein](http://garbage.fm/) ###

---

Feedback/Questions
----------

* [ Stefan ](http://slexy.org/view/s21wjbhCJ4)
* [ Zach ](http://slexy.org/view/s21TbKS5t0)
* [ Jake ](http://slexy.org/view/s20AkO1i1R)
* [ Corey ](http://slexy.org/view/s2nrUMatU5)
* [ Robroy ](http://slexy.org/view/s2pZsC7arX)

  ---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to   
  [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)