+++
title = "121: All your hyves are belong to us"
description = "This week on the show, we are going to be talking to Trent Thompson,This episode was brought to you byiXsystems - Enterprise Servers and Storage for Open Source[![DigitalOcean - Simple Cloud Hosting, Built for Develop"
date = "2015-12-23T13:00:00Z"
url = "https://www.bsdnow.tv/121"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.077717399Z"
seen = false
+++

This week on the show, we are going to be talking to Trent Thompson,

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

#### [iX Systems Mission Complete](https://www.ixsystems.com/missioncomplete/) ####

* Submit your story of how you accomplished a mission with FreeBSD, FreeNAS, or iXsystems hardware, and you could win monthly prizes, and have your story featured in the FreeBSD Journal! \*\*\*

Headlines
----------

### [Review: Guarding the gates with OpenBSD 5.8](http://distrowatch.com/weekly.php?issue=20151207#openbsd) ###

* Jesse Smith over at DistroWatch treats us this week to a nice review of OpenBSD 5.8, which may be a good introduction for the uninitiated to learn more+ He first walks through some of the various highlights of 5.8, and spends time introducing the reader to a number of the projects that originate from OpenBSD, such as LibreSSL, OpenSSH, doas, the new “file” implementation and W<sup>X</sup> support on i386.
* The article then walks through his impressions of performing a fresh install of 5.8, and then getting up and running in X.
* He mentions that you may want to check the installation defaults, since on his 8GB VM disk, it didn’t leave enough room for packages on the /usr partition.
* It also includes a nice heads-up for new users about using the pkg\_add command, and where / how you can set the initial repository mirror address.
* The “doas” command was also praised:“I found I very much appreciated the doas command, its documentation and configuration file. The doas configuration file is much easier to read than sudo's and the available options are well explained. The doas command allowed me to assign root access to a user given the proper password and doas worked as advertised.”
* A glowing summary as well:“OpenBSD may be very secure, but I think what sets the operating system apart are its documentation and clean system design. It is so easy to find things and understand the configuration of an OpenBSD system. The file system is organized in a clean and orderly manner. It always takes me a while to get accustomed to using OpenBSD, as for me it is a rare occurrence, but once I get settled in I like how straight forward everything is. I can usually find and configure anything on the system without referring to external documents or searching for answers on-line and that is quite an accomplishment for an operating system where virtually everything is done from the command line. “ \*\*\*

### OpenBSD Hackathon Reports ###

* [Alexander Bluhm: multiprocessor networking ](http://undeadly.org/cgi?action=article&sid=20151212192918)
* “The next step, we are currently working on, is to remove the big kernel lock from forwarding and routing. mpi@ has been doing this for a long time, but some corner cases were still left. I have written a regression test for handling ARP packets to show that all cases including proxy ARP are still working. Another thing that may happen with lock-free routing is that the interface is destroyed on one CPU while another CPU is working with a route to that interface. We finally got this resolved. The code that destroys the interface has to wait until all routes don't use this interface anymore. I moved the sleep before the destruction of the interface is started, so that the routes can always operate on a completely valid interface structure.”
* [Vincent Gross: ifa\_ifwithaddr() ](http://undeadly.org/cgi?action=article&sid=20151215150708)
* Vincent worked on the function that finds the interface with the specified address, which is used to tell if the machine is the intended recipient of an incoming packet. A number of corner cases existed with broadcast addresses, especially if two interfaces were in the same subnet. This code was moved to the new in\_broadcast()
* [Ken Westerback: fdisk, installbot, and dhclient](http://undeadly.org/cgi?action=article&sid=20151216192843)
* [Reyk Floeter: Hosting a hackathon, vmd, vmctl ](http://undeadly.org/cgi?action=article&sid=20151217134417)
* “When I heard that Martin Pieuchot (mpi@) was looking for a place to hold another mini-hackathon for three to four people to work on multiprocessor (MP) enhancements of the network stack, I offered to come to our work place in Hannover, Northern Germany. We have space, gear, fast Internet and it is easy to reach for the involved people. Little did I know that it would quickly turn into n2k15, a network hackathon with 20 attendees from all over the world”
* “If you ever hosted such an event or a party for many guests, you will know the dilemma of the host: you’re constantly concerned about your guests enjoying it, you have to take care about many trivial things, other things will break, and you get little to no time to attend or even enjoy it yourself. Fortunately, I had very experienced and welcomed guests: only one vintage table and a vase broke – the table can be fixed – and I even found some time for hacking myself.”
* [Martin Pieuchot: MP networking ](http://undeadly.org/cgi?action=article&sid=20151218175010)
* “ We found two kind of MP bugs! There are MP bugs that you fix without even understanding them, and there are MP bugs that you understand but can't fix”
* [Stefan Sperling: initial 802.11n support ](http://undeadly.org/cgi?action=article&sid=20151219160501) \*\*\*

### [Hacking the PS4](https://cturt.github.io/ps4.html) ###

* As a followup to the story last week about the PS4 being “jailbroken”, we have a link to further information about how far this project has come along
* This article also provides some great background information about whats running under the hood of your PS4, including FreeBSD 9, Mono VM and WebKit, with WebKit being the primary point of entry to jailbreak the box.
* One particular point of interest, was the revelation that early firmware versions did not include ASLR, but it appears ASLR was added sometime around firmware 1.70. (Wonder if they used HardenedBSD’s implementation), and how they can bypass it entirely. “Luckily for us, we aren't limited to just writing static ROP chains. We can use JavaScript to read the modules table, which will tell us the base addresses of all loaded modules. Using these bases, we can then calculate the addresses of all our gadgets before we trigger ROP execution, bypassing ASLR.“
* The article also mentions that they can prove that jails are used in some fashion, and provides examples of how they can browse the file system and dump a module list.
* The kernel exploit in question is [SA-15:21](https://www.freebsd.org/security/advisories/FreeBSD-SA-15:21.amd64.asc) from August of this year. The jailbreaking appears to be against an older version of PS4 firmware that did not include this patch \*\*\*

### [Nokia and ARM leading the charge to implement better TCP/IP as part of the 5G standard ](http://www.theregister.co.uk/2015/12/14/nokia_and_arm_bid_reinvent_tcpip_stack_5g/?page=1) ###

* “Many believe that a critical success factor for 5G will be a fully revamped TCP/IP stack, optimized for the massively varied use cases of the next mobile generation, for cloud services, and for virtualization and software-defined networking (SDN). This is the goal of the new OpenFastPath (OFP) Foundation, founded by Nokia Networks, ARM and industrial IT services player Enea. This aims to create an open source TCP/IP stack which can accelerate the move towards SDN in carrier and enterprise networks. Other sign-ups include AMD, Cavium, Freescale, Hewlett Packard Enterprise and the ARM-associated open source initiative, Linaro.”
* “The new fast-path TCP/IP stack will be based on the open source FreeBSD operating system”
* The general idea is to have a fast, open source, user space networking stack, based on the FreeBSD stack
* with an “optimised callback-based zero-copy socket API” to keep packet processing in user-space as far as possible
* It will be interesting to see a little bit more FreeBSD getting into every mobile and cloud based device. \*\*\*

Interview - Trent Thompson - [[trentnthompson@gmail.com](mailto:trentnthompson@gmail.com)]([trentnthompson@gmail.com](mailto:trentnthompson@gmail.com)) / [@pr1ntf](https://twitter.com/pr1ntf)
----------

* [iohyve](https://github.com/pr1ntf/iohyve) \*\*\*

News Roundup
----------

### [First cut of the FreeBSD modularized TCP stack ](https://svnweb.freebsd.org/base?view=revision&revision=292309) ###

* FreeBSD now has more than one TCP stack, and better yet, you can use more than one at once
* Each socket pcb is associated with a stack, and it is possible to select a non-default stack with a socket option, so you can make a specific application use an experimental stack, while still defaulting to the known-good stack
* This should lead to a lot of interesting development and testing, without the level of risk usually associated with modifying the TCP stack
* The first new module available is ‘fastpath’, which may relate to the Nokia story earlier in the show
* There are also plans to support changing TCP stacks after establish a session, which might land as early as January \*\*\*

### [Faces of FreeBSD : Erin Clark](http://freebsdfoundation.blogspot.com/2015/12/faces-of-freebsd-2015-erin-clark.html) ###

* In this edition of “Faces of FreeBSD” the FreeBSD foundation gives us an introduction to Erin Clark, of our very own iXsystems!
* Her journey to the BSD family may sound similar to a lot of ours. She first began using Linux / Slackware in the early 2000’s, but in 2009 a friend introduced her to FreeBSD and the rest, as they say, is history.
* “I use FreeBSD because it is very solid and secure and has a great selection of open source software that can be used with it from the ports collection. I have always appreciated FreeBSD’s networking stack because it makes a great router or network appliance. FreeBSD’s use of the ZFS file system is also very nice - ZFS snapshots definitely saved me a few times. I also like that FreeBSD is very well documented; almost everything you need to know about working with FreeBSD can be found in the FreeBSD Handbook.”
* Originally a sys admin at iXsystems, where she helped managed PC-BSD desktops among others, now she works on the FreeNAS project as a developer for the CLI interface functionality. \*\*\*

### [New Olimex board runs Unix](https://olimex.wordpress.com/2015/12/16/new-product-in-stock-pic32-retrobsd-open-source-hardware-board-running-unix-like-retrobsd-os/) ###

* Looking for some small / embedded gear to mess around with? The Olimex folks have a new Pic32 system now available which runs “RetroBSD”
* “The current target is Microchip PIC32 microcontroller with 128 kbytes of RAM and 512 kbytes of Flash. PIC32 processor has MIPS M4K architecture, executable data memory and flexible RAM partitioning between user and kernel modes.”
* RetroBSD isn’t something we’ve covered extensively here on BSDNow, so to bring you up to speed, it is a port of 2.11 BSD
* Their website lists the following features of this 2.11 refresh:“
* Small resource requirements. RetroBSD needs only 128 kbytes of RAM to be up and running user applications.
* Memory protection. Kernel memory is fully protected from user application using hardware mechanisms.
* Open functionality. Usually, user application is fixed in Flash memory - but in case of RetroBSD, any number of applications could be placed into SD card, and run as required.
* Real multitasking. Standard POSIX API is implemented (fork, exec, wait4 etc).
* Development system on-board. It is possible to have C compiler in the system, and to recompile the user application (or the whole operating system) when needed.“
* For those looking into BSD history, or wanting something small and exotic to play with this may fit the bill nicely. \*\*\*

### [OpenSource.com reviews PCBSD ](https://opensource.com/life/15/12/bsd-desktop-user-review-pc-bsd) ###

* Joshua over at opensource.com writes up a review of PC-BSD (10.2 we assume)
* Some of the highlights mentioned, include the easy to use graphical installer, but he does mention we should update the sorting of languages. (Good idea!)
* Along with including nice screenshots, it also covers the availability of various DE’s / WM’s, and talks a fair amount about the AppCafe and Control Panel utilities.
* “Thanks to being featured on PC-BSD's desktop, the PC-BSD Handbook is easily located by even the most novice user. There is no need to search through the system's installed applications for a manual, or relying solely on the help documentation for individual components. While not comprehensive, PC-BSD's handbook does a good job as striking a balance between concise and thorough. It contains enough information to help and provides detailed instructions for the topics it covers, but it avoids providing so much information that it overwhelms” \*\*\*

BeastieBits
----------

[Gandi introduces support for FreeBSD on their IaaS platform, with both ZFS and UFS based images available ](https://www.gandi.net/news/en/2015-12-23/6473-introducing_freebsd_and_trimming_down_the_official_image_list/)

[Funny commit message from the Linux kernel ](http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=f076ef44a44d02ed91543f820c14c2c7dff53716)

[FreeBSD Journal, Nov/Dec 2015 ](https://www.freebsdfoundation.org/journal/vol2_no6)

---

Feedback/Questions
----------

* [ Zafer - NetBSD on DO](http://slexy.org/view/s2MPhvSFja)
* [ Richard - FreeNAS Replication](http://slexy.org/view/s2hhJktjRu)
* [ Winston - Android ADP](http://slexy.org/view/s2VK83ILlK)
* [ Alex - Multiple Domains](http://slexy.org/view/s20UVY8Bs5)
* [ Randy - Getting Involved](http://slexy.org/view/s20Cb076tu)
* [ Craig - zprezto](http://slexy.org/view/s2HNQ2aB42) \*\*\*