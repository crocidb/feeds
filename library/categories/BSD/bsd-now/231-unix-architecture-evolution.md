+++
title = "231: Unix Architecture Evolution"
description = "We cover an interview about Unix Architecture Evolution, another vBSDcon trip report, how to teach an old Unix about backspace, new NUMA support coming to FreeBSD, and stack pointer checking in OpenBSD.This episode was brought to you by[![iXsystems - Enterprise Servers "
date = "2018-02-01T13:00:00Z"
url = "https://www.bsdnow.tv/231"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.795596456Z"
seen = false
+++

We cover an interview about Unix Architecture Evolution, another vBSDcon trip report, how to teach an old Unix about backspace, new NUMA support coming to FreeBSD, and stack pointer checking in OpenBSD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Unix Architecture Evolution from the 1970 PDP-7 to the 2017 FreeBSD](https://fosdem.org/2018/interviews/diomidis-spinellis/) ###

* Q: Could you briefly introduce yourself?

>
>
> Im a professor of software engineering, a programmer at heart, and a technology author. Currently Im also the editor in chief of the IEEE Software magazine. I recently published the book Effective Debugging, where I detail 66 ways to debug software and systems.
>
>

* Q: What will your talk be about, exactly?

>
>
> I will describe how the architecture of the Unix operating system evolved over the past half century, starting from an unnamed system written in PDP-7 assembly language and ending with a modern FreeBSD system. My talk is based, first, on a GitHub repository where I tried to record the systems history from 1970 until today and, second, on the evolution of documented facilities (user commands, system calls, library functions) across revisions. I will thus present the early systems defining architectural features (layering, system calls, devices as files, an interpreter, and process management) and the important ones that followed in subsequent releases: the tree directory structure, user contributed code, I/O redirection, the shell as a user program, groups, pipes, scripting, and little languages.
>
>

* Q: Why this topic?

>
>
> Unix stands out as a major engineering breakthrough due to its exemplary design, its numerous technical contributions, its impact, its development model, and its widespread use. Furthermore, the design of the Unix programming environment has been characterized as one offering unusual simplicity, power, and elegance. Consequently, there are many lessons that we can learn by studying the evolution of the Unix architecture, which we can apply to the design of new systems. I often see modern systems that suffer from a bloat of architectural features and a lack of clear form on which functionality can be built. I believe that many of the modern Unix architecture defining features are excellent examples of what we should strive toward as system architects.
>
>

* Q: What do you hope to accomplish by giving this talk? What do you expect?

>
>
> Id like FOSDEM attendees to leave the talk with their mind full with architectural features of timeless quality. I want them to realize that architectural elegance isnt derived by piling design patterns and does not need to be expensive in terms of resources. Rather, beautiful architecture can be achieved on an extremely modest scale. Furthermore, I want attendees to appreciate the importance of adopting flexible conventions rather than rigid enforcement mechanisms. Finally, I want to demonstrate through examples that the open source culture was part of Unix from its earliest days.
>
>

* Q: What are the most significant milestones in the development of Unix?

>
>
> The architectural development of Unix follows a path of continuous evolution, albeit at a slowing pace, so I dont see here the most important milestones. I would however define as significant milestones two key changes in the way Unix was developed. The first occurred in the late 1970s when significant activity shifted from a closely-knit team of researchers at the AT&T Bell Labs to the Computer Science Research Group in the University of California at Berkeley. This opened the system to academic contributions and growth through competitive research funding. The second took place in the late 1980s and the 1990s when Berkeley open-sourced the the code it had developed (by that time a large percentage of the system) and enthusiasts built on it to create complete open source operating system distributions: 386BSD, and then FreeBSD, NetBSD, OpenBSD, and others.
>
>

* Q: In which areas has the development of Unix stalled?

>
>
> The data I will show demonstrate that there were in the past some long periods where the number of C library functions and system calls remained mostly stable. Nowadays there is significant growth in the number of all documented facilities with the exception of file formats. Im looking forward to a discussion regarding the meaning of these growth patterns in the Q&A session after the talk.
>
>

* Q: What are the core features that still link the 1970 PDP-7 system to the latest FreeBSD 11.1 release, almost half a century apart?

>
>
> Over the past half-century the Unix system has grown by four orders of magnitude from a few thousand lines of code to many millions. Nevertheless, looking at a 1970s architecture diagram and a current one reveals that the initial architectural blocks are still with us today. Furthermore, most system calls, user programs, and C library functions of that era have survived until today with essentially similar functionality. Ive even found in modern FreeBSD some lines of code that have survived unchanged for 40 years.
>
>

* Q: Can we still add innovative changes to operating systems like FreeBSD without breaking the Unix philosophy? Will there be a moment where FreeBSD isnt recognizable anymore as a descendant of the 1970 PDP-7 system?

>
>
> Theres a saying that form liberates. So having available a time-tested form for developing operating system functionality allows you to innovate in areas that matter rather than reinventing the wheel.
>
>
>
> Such concepts include having commands act as a filter, providing manual pages with a consistent structure, supplying build information in the form of a Makefile, installing files in a well-defined directory hierarchy, implementing filesystems with an standardized object-oriented interface, and packaging reusable functions as a library. Within this framework theres ample space for both incremental additions (think of jq, the JSON query command) and radical innovations (consider the Solaris-derived ZFS and dtrace functionality). For this reason I think that BSD and Linux systems will always be recognizable as direct or intellectual descendants of the 1970s Research Unix editions.
>
>

* Q: Have you enjoyed previous FOSDEM editions?

>
>
> Immensely! As an academic I need to attend many scientific conferences and meetings in order to present research results and interact with colleagues. This means too much time spent traveling and away from home, and a limited number of conferences Im in the end able to attend. Nevertheless, attending FOSDEM is an easy decision due to the world-changing nature of its theme, the breadth of the topics presented, the participants enthusiasm and energy, as well as the exemplary, very efficient conference organization.
>
>

---

### [Another vBSDCon trip report we just found](https://www.weaponizedawesome.com/blog/?cat=53) ###

* We just got tipped about another trip report from vBSDCon, this time from one of the first time speakers: W. Dean Freeman

>
>
> Recently I had the honor of co-presenting on the internals of FreeBSDs Kernel RNG with John-Mark Gurney at the 3rd biennial vBSDCon, hosted in Reston, VA hosted by Verisign.  
>  Ive been in and out of the FreeBSD community for about 20 years. As Ive mentioned on here before, my first Unix encounter was FreeBSD 2.2.8 when I was in the 7th or 8th grade. However, for all that time Ive never managed to get out to any of the cons. Ive been to one or two BUG meetings and Ive met some folks from IRC before, but nothing like this.
>
>

* A BSD conference is a very different experience than anything else out there. You have to try it, it is the only way to truly understand it.

>
>
> Id also not had to do a stand-up presentation really since college before this. So, my first BSD con and my first time presenting rolled into one made for an interesting experience.
>
>

* See, he didnt say terrifying. It went very well. You should totally submit a talk for the next conference, even if it is your first.

>
>
> That said, it was amazing and invigorating experience. I got to meet a few big names in the FreeBSD community, discuss projects, ideas for FreeBSD, etc. I did seem to spend an unusual amount of time talking about FIPS and Common Criteria with folks, but to me thats a good sign and indicative that there is interest in working to close gaps between FreeBSD and the current requirements so that we can start getting FreeBSD and more BSD-based products into the government and start whittling away the domination of Linux (especially since Oracle has cut Solaris, SPARC and the ZFS storage appliance business units).
>
>

* There is nothing that can match the high bandwidth interchange of ideas in person. The internet has made all kinds of communication possible, and we use it all the time, but every once in a while, getting together in person is hugely valuable.
* Dean then went on to list some of the talks he found most valuable, including DTrace, Capsicum, bhyve, \*BSD security tools, and Paul Vixies talk about gets()

>
>
> I think the talk that really had the biggest impact on me, however, was Kyle Kneisls talk on BSD community dynamics. One of the key points he asked was whether the things that drew us to the BSD community in the first place would be able to happen today. Obviously, Im not a 12 or 13 year old kid anymore, but it really got me thinking. That, combined with getting face time with people Id previously only known as screen names has recently drawn me back into participating in IRC and rejoining mailing lists (wdf on freenode. be on the lookout!)
>
>

* Then Dean covered some thoughts on his own talk:

>
>
> JMG and my talk seems to have been well received, with people paying lots of attention. I dont know what a typical number of questions is for one of these things, but on day one there werent that many questions. We got about 5 during our question time and spent most of the rest of the day fielding questions from interested attendees. Getting a great talk! from GNN after coming down from the stage was probably one of the major highlights for me.
>
>

* I remember my first solo talk, and GNN asking the right question in the middle to get me to explain a part of it I had missed. It was very helpful.

>
>
> I think key to the interest in our presentation was that JMG did a good job framing a very complicated topics importance in terms everyone could understand. It also helped that we got to drop some serious truth bombs.
>
>

* Final Thoughts:

>
>
> I met a lot of folks in person for the first time, and met some people Id never known online before. It was a great community and Im glad I got a chance to expand my network.  
>  Verisign were excellent hosts and they took good care of both speakers (covering airfare, rooms, etc.) and also conference attendees at large. The dinners that they hosted were quite good as well.  
>  Im definitely interested in attending vBSDCon again and now that Ive had a taste of meeting IRL with the community on scale of more than a handful, I have every intention of finally making it to BSDCan next year (Id said it in 2017, but then moved to Texas for a new job and it wasnt going to be practical). This year for sure, though!
>
>
> ---
>

### [Teaching an Almost 40-year Old UNIX about Backspace](https://virtuallyfun.com/2018/01/17/teaching_an_almost_40-year_old_unix_about_backspace/) ###

* Introduction

>
>
> I have been messing with the UNIX® operating system, Seventh Edition (commonly known as UNIX V7 or just V7) for a while now. V7 dates from 1979, so its about 40 years old at this point. The last post was on V7/x86, but since Ive run into various issues with it, I moved on to a proper installation of V7 on SIMH. The Internet has some really good resources on installing V7 in SIMH. Thus, I set out on my own journey on installing and using V7 a while ago, but that was remarkably uneventful.
>
>
>
> One convenience that I have been dearly missing since the switch from V7/x86 is a functioning backspace key. There seem to be multiple different definitions of backspace:
>
>
>
> BS, as in ASCII character 8 (010, 0x08, also represented as <sup>H),</sup> and  
>  DEL, as in ASCII character 127 (0177, 0x7F, also represented as <sup>?).</sup>  
>  V7 does not accept either for input by default. Instead, # is used as the erase character and @ is used as the kill character. These defaults have been there since UNIX V1. In fact, they have been there since Multics, where they got chosen seemingly arbitrarily. The erase character erases the character before it. The kill character kills (deletes) the whole line. For example, ba##gooo#d would be interpreted as good and bad line@good line would be interpreted as good line.
>
>
>
> There is some debate on whether BS or DEL is the correct character for terminals to send when the user presses the backspace key. However, most programs have settled on DEL today. tmux forces DEL, even if the terminal emulator sends BS, so simply changing my terminal to send BS was not an option. The change from the defaults outlined here to todays modern-day defaults occurred between 4.1BSD and 4.2BSD. enf on Hacker News has written a nice overview of the various conventions
>
>

* Getting the Diff

>
>
> For future generations as well as myself when I inevitably majorly break this installation of V7, I wanted to make a diff. However, my V7 is installed in SIMH. I am not a very intelligent man, I didnt keep backup copies of the files Id changed. Getting data out of this emulated machine is an exercise in frustration.
>
>
>
> In the end, I printed everything on screen using cat(1) and copied that out. Then I performed a manual diff against the original source code tree because tabs got converted to spaces in the process. Then I applied the changes to clean copies that did have the tabs. And finally, I actually invoked diff(1).
>
>

* Closing Thoughts

>
>
> Figuring all this out took me a few days. Penetrating how the system is put together was surprisingly fairly hard at first, but then the difficulty curve eased up. It was an interesting exercise in some kind of reverse engineering and I definitely learned something about tty handling. I was, however, not pleased with using ed(1), even if I do know the basics. vi(1) is a blessing that I did not appreciate enough until recently. Had I also been unable to access recursive grep(1) on my host and scroll through the code, I wouldve probably given up. Writing UNIX under those kinds of editing conditions is an amazing feat. I have nothing but the greatest respect for software developers of those days.
>
>

---

News Roundup
----------

### [New NUMA support coming to FreeBSD CURRENT](https://lists.freebsd.org/pipermail/freebsd-current/2018-January/068145.html) ###

>
>
> Hello folks,
>
>
>
> I am working on merging improved NUMA support with policy implemented by cpuset(2) over the next week. This work has been supported by Dell/EMC's Isilon product division and Netflix. You can see some discussion of these changes here:
>
>
>
> [https://reviews.freebsd.org/D13403](https://reviews.freebsd.org/D13403)  
> [https://reviews.freebsd.org/D13289](https://reviews.freebsd.org/D13289)  
> [https://reviews.freebsd.org/D13545](https://reviews.freebsd.org/D13545)
>
>
>
> The work has been done in user/jeff/numa if you want to look at svn history or experiment with the branch. It has been tested by Peter Holm on i386 and amd64 and it has been verified to work on arm at various points.
>
>
>
> We are working towards compatibility with libnuma and linux mbind. These commits will bring in improved support for NUMA in the kernel. There are new domain specific allocation functions available to kernel for UMA, malloc, kmem\_, and vm\_page\*. busdmamem consumers will automatically be placed in the correct domain, bringing automatic improvements to some   
>  device performance.
>
>
>
> cpuset will be able to constrains processes, groups of processes, jails, etc. to subsets of the system memory domains, just as it can with sets of cpus. It can set default policy for any of the above. Threads can use cpusets to set policy that specifies a subset of their visible domains.
>
>
>
> Available policies are first-touch (local in linux terms), round-robin (similar to linux interleave), and preferred. For now, the default is round-robin. You can achieve a fixed domain policy by using round-robin with a bitmask of a single domain. As the scheduler and VM become more   
>  sophisticated we may switch the default to first-touch as linux does.
>
>
>
> Currently these features are enabled with VM\_NUMA\_ALLOC and MAXMEMDOM. It will eventually be NUMA/MAXMEMDOM to match SMP/MAXCPU. The current NUMA syscalls and VM\_NUMA\_ALLOC code was 'experimental' and will be deprecated. numactl will continue to be supported although cpuset should be preferred going forward as it supports the full feature set of the new API.
>
>
>
> Thank you for your patience as I deal with the inevitable fallout of such sweeping changes. If you do have bugs, please file them in bugzilla, or reach out to me directly. I don't always have time to catch up on all of my mailing list mail and regretfully things slip through the cracks when   
>  they are not addressed directly to me.
>
>
>
> Thanks,  
>  Jeff
>
>
> ---
>

### [Stack pointer checking  OpenBSD](https://marc.info/?l=openbsd-tech&m=151572838911297&w=2) ###

>
>
> Stefan (stefan@) and I have been working for a few months on this diff, with help from a few others.
>
>
>
> At every trap and system call, it checks if the stack-pointer is on a page that is marked MAP\_STACK. execve() is changed to create such mappings for the process stack. Also, libpthread is taught the new MAP\_STACK flag to use with mmap().
>
>
>
> There is no corresponding system call which can set MAP\_FLAG on an existing page, you can only set the flag by mapping new memory into place. That is a piece of the security model.
>
>
>
> The purpose of this change is to twart stack pivots, which apparently have gained some popularity in JIT ROP attacks. It makes it difficult to place the ROP stack in regular data memory, and then perform a system call from it. Workarounds are cumbersome, increasing the need for far more gadgetry. But also the trap case -- if any memory experiences a demand page fault, the same check will occur and potentially also kill the process.
>
>
>
> We have experimented a little with performing this check during device interrupts, but there are some locking concerns and performance may then become a concern. It'll be best to gain experience from handle of syncronous trap cases first.
>
>
>
> chrome and other applications I use run fine!
>
>
>
> I'm asking for some feedback to discover what ports this breaks, we'd like to know. Those would be ports which try to (unconventionally) create their stacks in malloc()'d memory or inside another Data structure. Most of them are probably easily fixed ...
>
>

---

### [Qt 5.9 on FreeBSD](https://euroquis.nl/bobulate/?p=1768) ###

>
>
> Tobias and Raphael have spent the past month or so hammering on the Qt 5.9 branch, which has (finally!) landed in the official FreeBSD ports tree. This brings FreeBSD back up-to-date with current Qt releases and, more importantly, up-to-date with the Qt release KDE software is increasingly expecting. With Qt 5.9, the Elisa music player works, for instance (where it has run-time errors with Qt 5.7, even if it compiles). The KDE-FreeBSD CI system has had Qt 5.9 for some time already, but that was hand-compiled and jimmied into the system, rather than being a proper ports build.
>
>
>
> The new Qt version uses a new build system, which is one of the things that really slowed us down from a packaging perspective. Some modules have been reshuffled in the process. Some applications depending on Qt internal-private headers have been fixed along the way. The Telegram desktop client continues to be a pain in the butt that way.
>
>
>
> Following on from Qt 5.9 there has been some work in getting ready for Clang 6 support; in general the KDE and Qt stack is clean and modern C++, so its more infrastructural tweaks than fixing code. Outside of our silo, I still see lots of wonky C++ code being fixed and plenty of confusion between pointers and integers and strings and chars and .. ugh. Speaking of ugh, Im still planning to clean up Qt4 on ARM aarch64 for FreeBSD; this boils down to stealing suitable qatomic implementations from Arch Linux.
>
>
>
> For regular users of Qt applications on FreeBSD, there should be few to no changes required outside the regular upgrade cycle. For KDE Plasma users, note that development of the ports has changed branches; as we get closer to actually landing modern KDE bits, things have been renamed and reshuffled and mulled over so often that the old plasma5 branch wasnt really right anymore. The kde5-import branch is where its at nowadays, and the instructions are the same: the x11/kde5 metaport will give you all the KDE Frameworks 5, KDE Plasma Desktop and modern KDE Applications you need.
>
>

---

### [Adding IPv6 to an Nginx website on FreeBSD / FreshPorts](https://dan.langille.org/2018/01/13/adding-ipv6-to-an-nginx-website-on-freebsd-freshports/) ###

* FreshPorts recently moved to an IPv6-capable server but until today, that capability has not been utilized.

* There were a number of things I had to configure, but this will not necessarily be an exhaustive list for you to follow. Some steps might be missing, and it might not apply to your situation.

>
>
> All of this took about 3 hours.
>
>

* We are using:

  * FreeBSD 11.1
  * Bind 9.9.11
  * nginx 1.12.2

* Fallout

>
>
> I expect some monitoring fallout from this change. I suspect some of my monitoring assumes IP4 and now that IPv6 is available, I need to monitor both IP addresses.
>
>

---

### [ZFS on TrueOS: Why We Love OpenZFS](https://www.trueos.org/blog/zfs-trueos-love-openzfs/) ###

>
>
> TrueOS was the first desktop operating system to fully implement the OpenZFS (Zettabyte File System or ZFS for short) enterprise file system in a stable production environment. To fully understand why we love ZFS, we will look back to the early days of TrueOS (formerly PC-BSD). The development team had been using the UFS file system in TrueOS because of its solid track record with FreeBSD-based computer systems and its ability to check file consistency with the built-in check utility fsck.
>
>
>
> However, as computing demands increased, problems began to surface. Slow fsck file verification on large file systems, slow replication speeds, and inconsistency in data integrity while using UFS logging / journaling began to hinder users. It quickly became apparent that TrueOS users would need a file system that scales with evolving enterprise storage needs, offers the best data protection, and works just as well on a hobbyist system or desktop computer.
>
>
>
> Kris Moore, the founder of the TrueOS project, first heard about OpenZFS in 2007 from chatter on the FreeBSD mailing lists. In 2008, the TrueOS development team was thrilled to learn that the FreeBSD Project had ported ZFS. At the time, ZFS was still unproven as a graphical desktop solution, but Kris saw a perfect opportunity to offer ZFS as a cutting-edge file system option in the TrueOS installer, allowing the TrueOS project to act as an indicator of how OpenZFS would fair in real-world production use.
>
>
>
> The team was blown away by the reception and quality of OpenZFS on FreeBSD-based systems. By its nature, ZFS is a copy-on-write (CoW) file system that wont move a block of data until it both writes the data and verifies its integrity. This is very different from most other file systems in use today. ZFS is able to assure that data stays consistent between writes by automatically comparing write checksums, which mitigates bit rot. ZFS also comes with native RaidZ functionality that allows for enterprise data management and redundancy without the need for expensive traditional RAID cards. ZFS snapshots allow for system configuration backups in a split-second. You read that right. TrueOS can backup or restore snapshots in less than a second using the ZFS file system.
>
>
>
> Given these advantages, the TrueOS team decided to use ZFS as its exclusive file system starting in 2013, and we havent looked back since. ZFS offers TrueOS users the stable workstation experience they want, while simultaneously scaling to meet the increasing demands of the enterprise storage market. TrueOS users are frequently commenting on how easy it is to use ZFS snapshots with our built-in snapshot utility. This allows users the freedom to experiment with their system knowing they can restore it in seconds if anything goes wrong. If you havent had a chance to try ZFS with TrueOS, browse to our download page and make sure to grab a copy of TrueOS. Youll be blown away by the ease of use, data protection functionality, and incredible flexibility of RaidZ.
>
>

---

Beastie Bits
----------

* [Source Code Podcast Interview with Michael W Lucas](https://blather.michaelwlucas.com/archives/3099)
* [Operating System of the Year 2017: NetBSD Third place](https://w3techs.com/blog/entry/web_technologies_of_the_year_2017)
* [OPNsense 18.1-RC1 released](https://opnsense.org/opnsense-18-1-rc1-released/)
* [Personal OpenBSD Wiki Notes](https://balu-wiki.readthedocs.io/en/latest/security/openbsd.html)
* [BSD section can use some contribution](https://guide.freecodecamp.org/bsd-os/)
* [The Third Research Edition Unix Programmer's Manual (now available in PDF)](https://github.com/dspinellis/unix-v3man)

Feedback/Questions
----------

* Alex - [my first freebsd bug](http://dpaste.com/3DSV7BC#wrap)
* John - [Suggested Speakers](http://dpaste.com/2QFR4MT#wrap)
* Todd - [Two questions](http://dpaste.com/2FQ450Q#wrap)
* Matthew - [CentOS to FreeBSD](http://dpaste.com/3KA29E0#wrap)
* Brian - [Brian - openbsd 6.2 and enlightenment .17](http://dpaste.com/24DYF1J#wrap) \*\*\*