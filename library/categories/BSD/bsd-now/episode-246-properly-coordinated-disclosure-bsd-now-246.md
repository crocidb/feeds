+++
title = "Episode 246: Properly Coordinated Disclosure | BSD Now 246"
description = "How Intel docs were misinterpreted by almost any OS, a look at the mininet SDN emulator, do’s and don’ts for FreeBSD, OpenBSD community going gold, ed mastery is a must read, and the distributed object store minio on FreeBSD.Headlines[Intel documentation flaw sees i"
date = "2018-05-17T05:00:00Z"
url = "https://www.bsdnow.tv/246"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.755539837Z"
seen = false
+++

How Intel docs were misinterpreted by almost any OS, a look at the mininet SDN emulator, do’s and don’ts for FreeBSD, OpenBSD community going gold, ed mastery is a must read, and the distributed object store minio on FreeBSD.

Headlines
----------

### [Intel documentation flaw sees instruction misimplemented in almost every OS](https://www.triplefault.io/2018/05/spurious-db-exceptions-with-pop-ss.html) ###

>
>
> A statement in the System Programming Guide of the Intel 64 and IA-32 Architectures Software Developer's Manual (SDM) was mishandled in the development of some or all operating-system kernels, resulting in unexpected behavior for #DB exceptions that are deferred by MOV SS or POP SS, as demonstrated by (for example) privilege escalation in Windows, macOS, some Xen configurations, or FreeBSD, or a Linux kernel crash. OS kernels may not expect this order of events and may therefore experience unexpected behavior when it occurs. + A detailed white paper describes this behavior [here](http://everdox.net/popss.pdf) + [FreeBSD Commit](https://svnweb.freebsd.org/base?view=revision&revision=333368) Thank you to the MSRC Incident Response Team, and in particular Greg Lenti and Nate Warfield, for coordinating the response to this issue across multiple vendors. Thanks to Computer Recycling at The Working Center of Kitchener for making hardware available to allow us to test the patch on additional CPU families. + [FreeBSD Security Advisory](https://www.freebsd.org/security/advisories/FreeBSD-SA-18:06.debugreg.asc) + [DragonFlyBSD Post](https://www.dragonflydigest.com/2018/05/09/21231.html) + [NetBSD does not support debug register and so is not affected.](https://www.kb.cert.org/vuls/id/CHEU-AYC3MZ) + [OpenBSD also appears to not be affected, “We are not aware of further vendor information regarding this vulnerability.”](https://www.kb.cert.org/vuls/id/CHEU-AYC3MR) + [IllumOS Not Impacted](https://illumos.topicbox.com/groups/developer/T9cd475bd5497caa9)
>
>

---

### [Guest Post – A Look at SDN Emulator Mininet](https://www.freebsdfoundation.org/blog/guest-post-a-look-at-sdn-emulator-mininet/) ###

* A guest post on the FreeBSD Foundation’s blog by developer Ayaka Koshibe
  >  At this year’s AsiaBSDCon, I presented a talk about a SDN network emulator called Mininet, and my ongoing work to make it more portable. That presentation was focused on the OpenBSD version of the port, and I breezed past the detail that I also had a version or Mininet working on FreeBSD. Because I was given the opportunity, I’d like to share a bit about the FreeBSD version of Mininet. It will not only be about what Mininet is and why it might be interesting, but also a recounting of my experience as a user making a first-time attempt at porting an application to FreeBSD. Mininet started off as a tool used by academic researchers to emulate OpenFlow networks when they didn’t have convenient access to actual networks. Because of its history, Mininet became associated strongly with networks that use OpenFlow for their control channels. But, it has also become fairly popular among developers working in, and among several universities for research and teaching about, SDN (Software Defined Networking) I began using Mininet as an intern at my university’s network research lab. I was using FreeBSD by that time, and wasn’t too happy to learn that Mininet wouldn’t work on anything but Linux. I gradually got tired of having to run a Linux VM just to use Mininet, and one day it clicked in my mind that I can actually try porting it to FreeBSD. Mininet creates a topology using the resource virtualization features that Linux has. Specifically, nodes are bash processes running in network namespaces, and the nodes are interconnected using veth virtual Ethernet links. Switches and controllers are just nodes whose shells have run the right commands to configure a software switch or start a controller application. Mininet can therefore be viewed as a series of Python libraries that run the system commands necessary to create network namespaces and veth interfaces, assemble a specified topology, and coordinate how user commands aimed at nodes (since they are just shells) are run. Coming back to the port, I chose to use vnet jails to replace the network namespaces, and epair(4) links to replace the veth links. For the SDN functionality, I needed at least one switch and controller that can be run on FreeBSD. I chose OpenvSwitch(OVS) for the switch, since it was available in ports and is well-known by the SDN world, and Ryu for the controller since it’s being actively developed and used and supports more recent versions of OpenFlow. I have discussed the possibility of upstreaming my work. Although they were excited about it, I was asked about a script for creating VMs with Mininet preinstalled, and continuous integration support for my fork of the repository. I started taking a look at the release scripts for creating a VM, and after seeing that it would be much easier to use the scripts if I can get Mininet and Ryu added to the ports tree, I also tried a hand at submitting some ports. For CI support, Mininet uses Travis, which unfortunately doesn’t support FreeBSD. For this, I plan to look at a minimalistic CI tool called contbuild, which looks simple enough to get running and is written portably. This is very much a work-in-progress, and one going at a glacial pace. Even though the company that I work for does use Mininet, but doesn’t use FreeBSD, so this is something that I’ve been working on in my free time. Earlier on, it was the learning curve that made progress slow. When I started, I hadn’t done anything more than run FreeBSD on a laptop, and uneventfully build a few applications from the ports tree. Right off the bat, using vnet jails meant learning how to build and run a custom kernel. This was the easy part, as the handbook was clear about how to do this. When I moved from using FreeBSD 10.3 to 11, I found that I can panic my machine by quickly creating and destroying OVS switches and jails. I submitted a bug report, but decided to go one step further and actually try to debug the panic for myself. With the help of a few people well-versed in systems programming and the developer’s handbook, I was able to come up with a fix, and get it accepted. This pretty much brings my porting experiment to the present day, where I’m slowly working out the pieces that I mentioned earlier. In the beginning, I thought that this Mininet port would be a weekend project where I come out knowing thing or two about using vnet jails and with one less VM to run. Instead, it became a crash course in building and debugging kernels and submitting bug reports, patches, and ports. It’d like to mention that I wouldn’t have gotten far at all if it weren’t for the helpful folks, the documentation, and how debuggable FreeBSD is. I enjoy good challenges and learning experiences, and this has definitely been both.

* Thank you to Ayaka for working to port Mininet to the BSDs, and for sharing her experiences with us.
* If you want to see the OpenBSD version of the talk, the video from [AsiaBSDCon is here](https://www.youtube.com/watch?v=Vg9Czjm9aV8), and it will be presented again at BSDCan.

---
 \*\*iXsystems\*\* [iXsystems LFNW Recap](https://www.ixsystems.com/blog/lfnw-2018-recap/)
---

### [10 Beginner Do's and Don't for FreeBSD](https://forums.freebsd.org/threads/10-dos-and-dont-for-freebsd.65618/) ###

* 1) Don't mix ports and binary packages
* 2) Don't edit 'default' files
* 3) Don't mess with /etc/crontab
* 4) Don't mess with /etc/passwd and /etc/groups either!
* 5) Reconsider the removal of any options from your customized kernel configuration
* 6) Don't change the root shell to something else
* 7) Don't use the root user all the time
* 8) /var/backups is a thing
* 9) Check system integrity using /etc/mtree
* 10) What works for me doesn't have to work for you!

---

News Roundup
----------

### [OpenBSD Community Goes Gold for 2018!](https://undeadly.org/cgi?action=article;sid=20180419060427) ###

* Ken Westerback (krw@ when wearing his developer hat) writes:

``` Monthly paypal donations from the OpenBSD community have made the community the OpenBSD Foundation's first Gold level contributor for 2018!

2018 is the third consecutive year that the community has reached Gold status or better.

These monthly paypal commitments by the community are our most reliable source of funds and thus the most useful for financial planning purposes. We are extremely thankful for the continuing support and hope the community matches their 2017 achievement of Platinum status. Or even their 2016 achievement of Iridium status.

Sign up now for a monthly donation!

Note that Bitcoin contributions have been re-enabled now that our Bitcoin intermediary has re-certified our Canadian paperwork.

https://www.openbsdfoundation.org/donations.html ```

---

### [ed(1) mastery is a must read for real unix people](http://bsdly.blogspot.com/2018/04/ed1-mastery-is-must-for-real-unix-person.html) ###

>
>
> In some circles on the Internet, your choice of text editor is a serious matter.
>
>
>
> We've all seen the threads on mailing lits, USENET news groups and web forums about the relative merits of Emacs vs vi, including endless iterations of flame wars, and sometimes even involving lesser known or non-portable editing environments.
>
>
>
> And then of course, from the Linux newbies we have seen an endless stream of tweeted graphical 'memes' about the editor vim (aka 'vi Improved') versus the various apparently friendlier-to-some options such as GNU nano. Apparently even the 'improved' version of the classical and ubiquitous vi(1) editor is a challenge even to exit for a significant subset of the younger generation.
>
>
>
> Yes, your choice of text editor or editing environment is a serious matter. Mainly because text processing is so fundamental to our interactions with computers.
>
>
>
> But for those of us who keep our systems on a real Unix (such as OpenBSD or FreeBSD), there is no real contest. The OpenBSD base system contains several text editors including vi(1) and the almost-emacs mg(1), but ed(1) remains the standard editor.
>
>
>
> Now Michael Lucas has written a book to guide the as yet uninitiated to the fundamentals of the original Unix text editor. It is worth keeping in mind that much of Unix and its original standard text editor written back when the standard output and default user interface was more likely than not a printing terminal.
>
>
>
> To some of us, reading and following the narrative of Ed Mastery is a trip down memory lane. To others, following along the text will illustrate the horror of the world of pre-graphic computer interfaces. For others again, the fact that ed(1) doesn't use your terminal settings much at all offers hope of fixing things when something or somebody screwed up your system so you don't have a working terminal for that visual editor.
>
>

---

**DigitalOcean** [Digital Ocean Promo Link for BSD Now Listeners](http://do.co/bsdnow)

---

### [Distributed Object Storage with Minio on FreeBSD](https://vermaden.wordpress.com/2018/04/16/distributed-object-storage-with-minio-on-freebsd/) ###

>
>
> Free and open source distributed object storage server compatible with Amazon S3 v2/v4 API. Offers data protection against hardware failures using erasure code and bitrot detection. Supports highly available distributed setup. Provides confidentiality, integrity and authenticity assurances for encrypted data with negligible performance overhead. Both server side and client side encryption are supported. Below is the image of example Minio setup.
>
>

* [Architecture Diagram ](https://vermaden.files.wordpress.com/2018/04/minio-architecture-diagram-distributed.jpg?w=960)

The Minio identifies itself as the ZFS of Cloud Object Storage. This guide will show You how to setup highly available distributed Minio storage on the FreeBSD operating system with ZFS as backend for Minio data. For convenience we will use FreeBSD Jails operating system level virtualization.

* Setup

>
>
> The setup will assume that You have 3 datacenters and assumption that you have two datacenters in whose the most of the data must reside and that the third datacenter is used as a ‘quorum/witness’ role. Distributed Minio supports up to 16 nodes/drives total, so we may juggle with that number to balance data between desired datacenters. As we have 16 drives to allocate resources on 3 sites we will use 7 + 7 + 2 approach here. The datacenters where most of the data must reside have 7/16 ratio while the ‘quorum/witness’ datacenter have only 2/16 ratio. Thanks to built in Minio redundancy we may loose (turn off for example) any one of those machines and our object storage will still be available and ready to use for any purpose.
>
>

* Jails

>
>
> First we will create 3 jails for our proof of concept Minio setup, storage1 will have the ‘quorum/witness’ role while storage2 and storage3 will have the ‘data’ role. To distinguish commands I type on the host system and storageX Jail I use two different prompts, this way it should be obvious what command to execute and where.
>
>

* WeI know the FreeNAS people have been working on integrating this

---

### [Best practises for pledge(2) security](https://kristaps.bsd.lv/kcgi/tutorial6.html) ###

>
>
> Let's set the record straight for securing kcgi CGI and FastCGI applications with pledge(2). This is focussed on secure OpenBSD deployments.
>
>

* Theory

>
>
> Internally, kcgi makes considerable use of available security tools. But it's also designed to be invoked in a secure environment. We'll start with pledge(2), which has been around on OpenBSD since version 5.9. If you're reading this tutorial, you're probably on OpenBSD, and you probably have knowledge of pledge(2).
>
>
>
> How to begin? Read kcgi(3). It includes canonical information on which pledge(2) promises you'll need for each function in the library. This is just a tutorial—the manpage is canonical and overrides what you may read here.
>
>
>
> Next, assess the promises that your application needs. From kcgi(3), it's easy to see which promises we'll need to start. You'll need to augment this list with whichever tools you're also using. The general push is to start with the broadest set of required promises, then restrict as quickly as possible. Sometimes this can be done in a single pledge(2), but other times it takes a few.
>
>

---

Beastie Bits
----------

* [April's London \*BSD meetup - notes](http://mailman.uk.freebsd.org/pipermail/ukfreebsd/2018-April/014194.html)
* [May’s London \*BSD Meetup: May 22nd ](http://mailman.uk.freebsd.org/pipermail/ukfreebsd/2018-May/014198.html)
* [Call for Papers for EuroBSDcon 2018](https://2018.eurobsdcon.org/call-for-papers/)
* [FreeBSD Journal March/April Desktop/Laptop issue](https://www.freebsdfoundation.org/journal/)
* [LWN followup on the PostgreSQL fsync() issue](https://lwn.net/Articles/752063/)
* [The Association for Computing Machinery recognizes Steve Bourne for outstanding contributions](https://awards.acm.org/outstanding-contribution)

---

Feedback/Questions
----------

* Ray - [Speaking at Conferences](http://dpaste.com/1F8RX6H#wrap)
* Casey - [Questions](http://dpaste.com/364FTMM#wrap)
* Jeremy - [zfs in the enterprise](http://dpaste.com/3GWHP9N#wrap)
  * [HAST + ZFS](https://wiki.freebsd.org/HAST)

* Lars - [Civil Infrastructure Platform use of \*BSD](http://dpaste.com/1HDZFA3)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)