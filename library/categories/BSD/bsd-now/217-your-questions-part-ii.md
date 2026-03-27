+++
title = "217: Your questions, part II"
description = "OpenBSD 6.2 is here, style arguments, a second round of viewer interview questions, how to set CPU affinity for FreeBSD jails, containers on FreeNAS & more!HeadlinesOpenBSD 6.2 Released * OpenBSD continues their six month releas"
date = "2017-10-25T15:00:00Z"
url = "https://www.bsdnow.tv/217"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.836386084Z"
seen = false
+++

OpenBSD 6.2 is here, style arguments, a second round of viewer interview questions, how to set CPU affinity for FreeBSD jails, containers on FreeNAS & more!

Headlines
----------

### [OpenBSD 6.2 Released](https://www.openbsd.org/62.html) ###

* OpenBSD continues their six month release cadence with the release of 6.2, the 44th release
* On a disappointing note, the song for 6.2 will not be released until December
* Highlights:

>
>
> Improved hardware support on modern platforms including ARM64/ARMv7 and octeon, while amd64 users will appreciate additional support for the Intel Kaby Lake video cards.  
>  Network stack improvements include extensive SMPization improvements and a new FQ-CoDel queueing discipline, as well as enhanced WiFi support in general and improvements to iwn(4), iwm(4) and anthn(4) drivers.  
>  Improvements in vmm(4)/vmd include VM migration, as well as various compatibility and performance improvements.  
>  Security enhancements including a new freezero(3) function, further pledge(2)ing of base system programs and conversion of several daemons to the fork+exec model.  
>  Trapsleds, KARL, and random linking for libcrypto and ld.so, dramatically increase security by making it harder to find helpful ROP gadgets, and by creating a unique order of objects per-boot.  
>  A unique kernel is now created by the installer to boot from after install/upgrade.   
>  The base system compiler on the amd64 and i386 platforms has switched to clang(1).  
>  New versions of OpenSSH, OpenSMTPd, LibreSSL and mandoc are also included.  
>  The kernel no longer handles IPv6 Stateless Address Autoconfiguration (RFC 4862), allowing cleanup and simplification of the IPv6 network stack.   
>  Improved IPv6 checks for IPsec policies and made them consistent with IPv4.  
>  Enabled the use of per-CPU caches in the network packet allocators.  
>  Improved UTF-8 line editing support for ksh(1) Emacs and Vi input mode.  
> *breaking change for nvme(4) users with GPT*: If you are booting from an nvme(4) drive with a GPT disk layout, you are affected by an off-by-one in the driver with the consequence that the sector count in your partition table may be incorrect. The only way to fix this is to re-initialize the partition table. Backup your data to another disk before you upgrade. In the new bsd.rd, drop to a shell and re-initialize the GPT:  
> **fdisk -iy -g -b 960 sdN**
>
>
> ---
>

### [Why we argue: style](https://www.sandimetz.com/blog/2017/6/1/why-we-argue-style) ###

>
>
> I've been thinking about why we argue about code, and how we might transform vehement differences of opinion into active forces for good.  
>  My thoughts spring from a very specific context. Ten or twelve times a year I go to an arbitrary business and spend three or more days teaching a course in object-oriented design. I'm an outsider, but for a few days these business let me in on their secrets.  
>  Here's what I've noticed. In some places, folks are generally happy. Programmers get along. They feel as if they are all "in this together." At businesses like this I spend most of my time actually teaching object-oriented design.  
>  Other places, folks are surprisingly miserable. There's a lot of discord, and the programmers have devolved into competing "camps." In these situations the course rapidly morphs away from OO Design and into wide-ranging group discussions about how to resolve deeply embedded conflicts.  
>  Tolstoy famously said that "Happy families are all alike; every unhappy family is unhappy in its own way." This is known as the Anna Karenina Principle, and describes situations in which success depends on meeting all of a number of criteria. The only way to be happy is to succeed at every one of them. Unhappiness, unfortunately, can be achieved by any combination of failure. Thus, all happy businesses are similar, but unhappy ones appear unique in their misery.  
>  Today I'm interested in choices of syntax, i.e whether or not your shop has agreed upon and follows a style guide. If you're surprised that I'm starting with this apparently mundane issue, consider yourself lucky in your choice of workplace. If you're shaking your head in rueful agreement about the importance of this topic, I feel your pain.  
>  I firmly believe that all of the code that I personally have to examine should come to me in a consistent format. Code is read many more times than it is written, which means that the ultimate cost of code is in its reading. It therefore follows that code should be optimized for readability, which in turn dictates that an application's code should all follow the same style.
>
>

* This is why FreeBSD, and most other open source projects, have a preferred style. Some projects are less specific and less strict about it.

>
>
> Most programmers agree with the prior paragraph, but here's where things begin to break down. As far as I'm concerned, my personal formatting style is clearly the best. However, I'm quite sure that you feel the same. It's easy for a group of programmers to agree that all code should follow a common style, but surprisingly difficult to get them to agree on just what that common style should be.  
>  Avoid appointing a human "style cop", which just forces someone to be an increasingly ill-tempered nag. Instead, supply programmers with the information they need to remedy their own transgressions. By the time a pull request is submitted, mis-stylings should long since have been put right. Pull request conversations ought to be about what code does rather than how code looks.  
>  What about old code? Ignore it. You don't have to re-style all existing code, just do better from this day forward. Defer updating old code until you touch it for other reasons. Following this strategy means that the code you most often work on will gradually take on a common style. It also means that some of your existing code might never get updated, but if you never look at it, who cares?  
>  If you choose to re-style code that you otherwise have no need to touch, you're declaring that changing the look of this old code has more value to your business than delivering the next item on the backlog. The opportunity cost of making a purely aesthetic change includes losing the benefit of what you could have done instead. The rule-of-thumb is: Don't bother updating the styling of stable, existing code unless not doing so costs you money.
>
>

* Most open source projects also avoid reformatting code just to change the style, because of the merge conflicts this will cause for downstream consumers

>
>
> If you disagree with the style guide upon which your team agrees, you have only two honorable options:  
>  First, you can obey the guide despite your aversion. As with me in the Elm story above, this act is likely to change your thinking so that over time you come to prefer the new style. It's possible that if you follow the guide you'll begin to like it.  
>  Alternatively, you can decide you will not obey the style guide. Making this decision demands that you leave your current project and find some other project whose guide matches your preferred style. Go there and follow that one.  
>  Notice that both of these choices have you following a guide. This part is not optional.  
>  The moral of this story? It's more important for all code to be formatted the same than it is for any one of us to get our own way. Commit to agreeing upon and following a style guide. And if you find that your team cannot come to an agreement, step away from this problem and start a discussion about power.
>
>

* There have been many arguments about style, and it can often be one of the first complaints of people new to any open source project
* This article covers it fairly well from both sides, a) you should follow the style guide of the project you are contributing to, b) the project should review your actual code, then comment on the style after, and provide gentle guidance towards the right style, and avoid being “style cops” \*\*\*

Interview - The BSDNow Crew, Part II
----------

---

News Roundup
----------

### [Building FreeBSD for the Onion Omega 2](https://github.com/sysadminmike/freebsd-onion-omega2-build) ###

* I got my Onion Omega 2 devices in the mail quite a while ago, but I had never gotten around to trying to install FreeBSD on them. They are a different MIPS SoC than the Onion Omega 1, so it would not work out of the box at the time. Now, the SoC is supported!
* This guide provides the steps to build an image for the Omega 2 using the freebsd-wifi-build infrastructure
* First some config files are modified to make the image small enough for the Omega 2’s flash chip
* The DTS (Device Tree Source) files are not yet included in FreeBSD, so they are fetched from github
* Then the build for the ralink SoC is run, with the provided DTS file and the MT7628\_FDT kernel config
* Once the build is complete, you’ll have a tftp image file. Then that image is compressed, and bundled into a uboot image
* Write the files to a USB stick, and plug it into the Omega’s dock
* Turn it on while holding the reset button with console open

>
>
> Press 1 to get into the command line.
>
>

* You will need to reset the usb:

>
>
> usb reset
>
>

* Then load the kernel boot image:

>
>
> fatload usb 0:1 0x80800000 kernel.MT7628\_FDT.lzma.uImage
>
>

* And boot it:

>
>
> bootm 0x80800000
>
>

* At this point FreeBSD should boot
* Mount a userland, and you should end up in multi-user mode
* Hopefully this will get even easier in the next few weeks, and we’ll end up with a more streamlined process to tftp boot the device, then write FreeBSD into the onboard flash so it boots automatically. \*\*\*

### [Setting the CPU Affinity on FreeBSD Jails with ezjail](https://www.neelc.org/setting-the-cpu-affinity-on-freebsd-jails-with-ezjail/) ###

* While there are more advanced resource controls available for FreeBSD jails, one of the most basic ways to control CPU usage is to limit the subset of CPUs that each jail can use. This can make sure that every jail has access to some dedicated resources, while at the same time doesn’t have the ability to entirely dominate the machine

>
>
> I just got a new home server: a HP ProLiant ML110 G6. Being a FreeBSD person myself, it was natural that I used it on my server instead of Linux  
>  I chose to use ezjail to manage the jails on my ProLiant, with the initial one being a Tor middle node. Despite the fact that where my ML110 is, the upstream is only 35mbps (which is pretty good for cable), I did not want to give my Tor jail access to all four cores.  
>  Setting the CPU Affinity would let you choose a specific CPU core (or a range of cores) you want to use. However, it does not just let you pick the number of CPU cores you want and make FreeBSD choose the core running your jail. Going forward, I assumed that you have already created a jail using ezjail-admin. I also do not cover limiting a jail to a certain percentage of CPU usage.  
>  ezjail-admin config -c [CORE\_NUMBER\_FIRST]-[CORE\_NUMBER\_LAST] [JAIL\_NAME]
>
>

* or

>
>
> ezjail-admin config -c [CORE\_NUMBER\_FIRST],[CORE\_NUMBER\_SECOND],...,[CORE\_NUMBER\_N] [JAIL\_NAME]  
>  And hopefully, you should have your ezjail-managed FreeBSD jail limited to the CPU cores you want. While I did not cover a CPU percentage or RAM usage, this can be done with rctl  
>  I'll admit: it doesn't really matter which CPU a jail runs on, but it might matter if you don't want a jail to have access to all the CPU cores available and only want [JAIL\_NAME] to use one core. Since it's not really possible just specify the number of CPU cores with ezjail (or even iocell), a fallback would be to use CPU affinity, and that requires you to specify an exact CPU core. I know it's not the best solution (it would be better if we could let the scheduler choose provided a jail only runs on one core), but it's what works.
>
>

* We use this at work on high core count machines. When we have multiple databases colocated on the same machine, we make sure each one has a few cores to itself, while it shares other cores with the rest of the machine. We often reserve a core or two for the base system as well. \*\*\*

### [A practical guide to containers on FreeNAS for a depraved psychopath.](https://medium.com/@andoriyu/a-practical-guide-to-containers-on-freenas-for-a-depraved-psychopath-c212203c0394) ###

* If you are interested in playing with Docker, this guide sets up a Linux VM running on FreeBSD or FreeNAS under bhyve, then runs linux docker containers on top of it

>
>
> You know that jails are dope and I know that jails are dope, yet no one else knows it. So here we are stuck with docker. Two years ago I would be the last person to recommend using docker, but a whole lot of things has changes past years…
>
>

* This tutorial uses iohyve to manage the VMs on the FreeBSD or FreeNAS

>
>
> There are many Linux variants you can choose from — RancherOS, CoreOS are the most popular for docker-only hosts. We going to use RancherOS because it’s more lightweight out of the box.
>
>

* Navigate to RancherOS website and grab link to latest version

>
>
> sudo iohyve setup pool=zpool kmod=1 net=em0  
>  sudo iohyve fetch [https://releases.rancher.com/os/latest/rancheros.iso](https://releases.rancher.com/os/latest/rancheros.iso)  
>  sudo iohyve renameiso rancheros.iso rancheros-v1.0.4.iso  
>  sudo pkg install grub2-bhyve  
>  sudo iohyve create rancher 32G  
>  sudo iohyve set rancher loader=grub-bhyve ram=8G cpu=8 con=nmdm0 os=debian  
>  sudo iohyve install rancher rancheros-v1.0.4.iso  
>  sudo iohyve console rancher
>
>

* Then the tutorial does some basic configuration of RancherOS, and some house keeping in iohyve to make RancherOS come up unattended at boot

>
>
> The whole point of this guide is to reduce pain, and using the docker CLI is still painful. There are a lot of Web UIs to control docker. Most of them include a lot of orchestrating services, so it’s just overkill. Portainer is very lightweight and can be run even on Raspberry Pi
>
>

* Create a config file as described

>
>
> After reboot you will be able to access WebUI on 9000 port. Setup is very easy, so I won’t go over it
>
>

* The docker tools for FreeBSD are still being worked on. Eventually you will be able to host native FreeBSD docker containers on FreeBSD jails, but we are not quite there yet
* In the meantime, you can install sysutils/docker and use it to manage the docker instances running on a remote machine, or in this case, the RancherOS VM running in bhyve \*\*\*

Beastie Bits
----------

* [The Ghost of Invention: A Visit to Bell Labs, excerpt from the forthcoming book: “Kitten Clone: Inside Alcatel-Lucent” ](https://www.wired.com/2014/09/coupland-bell-labs/)
* [OpenBSD Cookbook (set of Ansible playbooks)](https://github.com/ligurio/openbsd-cookbooks)
* [15 useful sockstat commands to find open ports on FreeBSD ](https://www.tecmint.com/sockstat-command-examples-to-find-open-ports-in-freebsd/)
* [A prehistory of Slashdot](https://medium.freecodecamp.org/a-pre-history-of-slashdot-6403341dabae)
* [Using ed, the unix line editor ](https://medium.com/@claudio.santos.ribeiro/using-ed-the-unix-line-editor-557ed6466660) \*\*\*

Feedback/Questions
----------

* Malcolm - [ZFS snapshots](http://dpaste.com/16EB3ZA#wrap)
* Darryn - [Zones](http://dpaste.com/1DGHQJP#wrap)
* Mohammad - [SSH Keys](http://dpaste.com/08G3VTB#wrap)

  ---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

  ---