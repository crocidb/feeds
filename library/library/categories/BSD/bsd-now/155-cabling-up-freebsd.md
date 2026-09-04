+++
title = "155: Cabling up FreeBSD"
description = "This week on BSDNow, Allen is away in the UK (For BSDCam), but we still have a full episode for you! Don’t miss our interview withThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems.com/bs"
date = "2016-08-17T12:00:00Z"
url = "https://www.bsdnow.tv/155"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.009153732Z"
seen = true
+++

This week on BSDNow, Allen is away in the UK (For BSDCam), but we still have a full episode for you! Don’t miss our interview with

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [My two year journey to becoming an OS Developer ](http://zinascii.com/2016/going-to-joyent.html) ###

* A blog post by Ryan Zezeski about how he ended doing OS Development instead of working on application
* We have featured his posts before, including [The illumos SYSCALL Handler](http://zinascii.com/2016/the-illumos-syscall-handler.html)

>
>
> It started in the summer of 2014: I had just left Basho after 3.5 years of working on Riak, when I decided I wanted to become an OS developer. I purchased Solaris Internals, cloned illumos-gate, fired up cscope, and got to work. I hardly knew any C, x86 might as well have been Brainfuck, and, frankly, I knew shit about operating systems. But I was determined.  
>  I’ve always learned best by beating my head against something until it makes sense. I’m not a fast learner; I’m persistent. What others have in ability I make up for in effort. And when it comes to OS internals it’s all about work ethic. The more you look, the more you realize it’s just another program. The main difference being: it’s the program all the other programs run on.  
>  My strategy: to pick something, anything, that looked interesting, and write a post describing how it works. I wrote several of these posts in 2014 and 2015. More important, it put me in touch with Roger Faulkner: the creator of truss(1), the Solaris process model, and the real /proc filesystem. At the time I didn’t like my interaction with Roger. He explained, in what I would later find out to be his typical gruff manner, that I was wrong; so I concluded he is a prick. But over the years I realized that I was being a brat—he was trying to teach me something and I let my ego get in the way. I’ve come to view that interaction as a blessing. I interacted with one of the greats, a mentor of my mentor’s mentor (a Great Great Mentor).  
>  A couple of weeks later something even more surreal happened, at illumos Day 2014. Bryan Cantrill was the last speaker of the day. One of my mentors and someone I admire greatly. He was there to regale us with the story of Joyent’s resurrection of lx-branded zones: Linux system call emulation on top of the illumos kernel. But before he would do that he decided to speak about me! I couldn’t believe it. I was so overwhelmed that I don’t remember most of what he said. I was too busy flipping shit—Bryan Cantrill is on stage, in front of other kernel developers I look up to, saying my name. I was in a dream. It turns out, unknown to me at the time, that he wrote the POSIX queue code for both Solaris and QNX, which I wrote about. He compared me to the great expository technical writers Elliott Organick and Richard Stevens. And it was at this moment that I knew I could do this: I could become an OS developer.  
>  Never underestimate the effect kind words can have on someone that looks up to you.
>
>

* There is a lot more to the story, and it is definitely worth the read
* The story then goes on to talk about his recent run in with Bryan Cantrill \> A week from now my two year journey to become an OS developer comes to an end; and a new chapter begins. I don’t know what specific things I’m going to work on, but I’m sure it will push me to the limit. I look forward to the challenge. \*\*\*

### [Version 1.0 of the Lumina Desktop released](https://lumina-desktop.org/version-1-0-0-released/) ###

* After 4 years of development, Lumina Desktop has now hit version 1.0!
* This release brings with it a slew of new features and support:

>
>
> * Completely customizable interface! Rather than having to learn how to use a new layout, change the desktop to suit you instead!
> * Simple shortcuts for any application! The “favorites” system makes it easy to find and launch applications at any time.
> * Extremely lightweight! Allows applications to utilize more of your system hardware and revitalizes older systems!
> * Multiple-monitor support! Each monitor is treated as an independent entity – making it great for presentation systems which use a temporary monitor or for workstations which utilize an array of monitors for various tasks.
>
>

* While originally developed on PC-BSD, it already has been ported to a variety of different platforms, including OpenBSD, DragonFly, NetBSD, Debian and Gentoo
* Lumina has become the defacto desktop environment for TrueOS (Formerly PC-BSD), and looks like will provide a solid framework to continue growing desktop features. \*\*\*

### [n2k16 hackathon report: Ken Westerback on dhclient, bridges, routing and more](http://undeadly.org/cgi?action=article&sid=20160804200232) ###

* Next up, we have a report from Ken Westerback talking about the recent OpenBSD hackathon in Prague
* He starts by telling us about the work in bpf:

>
>
> First order of business, stsp@'s weird setup involving bridges and multiple dhclient clients. A bit of bpf(4) programming to restrict dhclient to handling ethernet packets unicast to its interface worked. Cool. Unfortunately it turned out some lazy dhcp servers always use ethernet broadcasts just because some lesser, non-OpenBSD clients ignore unicast packets until they have configured IP. Classic chicken and egg. So this was backed out just before 6.0. Sigh.
>
>

* Next up, he talks about an idea he had on the flight over, specifically with regard to how DHCP leases are stored, and how keeping the SSID information with them could speed up re-connection times, by only trying leases for current SSID’s connected. After a day or so of hacking, it was working! However for $REASONS it was shelved for post 6.0, bummer!
* He then discusses an on-going project with Peter Hessler on passing along relevant PIDs in response to routing messages generated by kernel from ioctl events. This is something they’ve been hacking at, in order to allow dhclient to recognize its own routing messages. Sounds like they are both still works-in-progress.
* However, Ken did get something in for 6.0:

>
>
> Diving back into dhclient code I discovered that in situations where multiple offers were received the unused offers were not being declined and discarded. Despite a clear comment saying that's what was being done! Thus dhclient might gradually use up more and more memory. And possibly be retrying offers that should have been discarded. The fix for this did make 6.0! Yay!
>
>

---

### [In Memoriam Roger Faulkner ](https://www.usenix.org/memoriam-roger-faulkner) ###

* USENIX has re-released Roger Faulkner’s original paper on /proc as a free download
* The UNIX community recently lost one of its original pioneers, Roger Faulkner, whom one commenter described as “The godfather of post-AT&T UNIX”
* In his memory, the USENIX group as re-released his original paper on the /proc file-system from 1991.
* Roger worked in many area’s of UNIX, however the process file system /proc was his special baby.
* “/proc began as a debugger interface superseding ptrace(2) but has evolved into a general interface to the process model.”
* The original /proc only had a file for each process, not a directory. "Data may be transferred from or to any valid locations in the process's address space by applying lseek(2) to position the file at the virtual address of interest followed by read(2) or write(2)."
* Processes could be controlled using IOCTLs on the file
* As the USENIX article states:

  >
  >
  > Roger believed that terrible things were sometimes required to create beautiful abstractions, and his trailblazing work on /proc embodies this burden: the innards may be delicate and nasty ("vile," as Roger might say in his distinguished Carolinian accent)—but the resulting abstractions are breathtaking in their power, scope and robustness.
  >
  >

* RIP Roger, and thanks for the wonderful UNIX legacy you’ve left us all.

  ---

Interview - Myke Geiger - [myke@servernorth.net](mailto:myke@servernorth.net) / [@mWare](https://twitter.com/mWare)
----------

* Using FreeBSD at a DSL/Cable ISP \*\*\*

News Roundup
----------

### [New options in bsdinstall - some sysctls and date/time settings](https://www.reddit.com/r/freebsd/comments/4vxnw3/new_options_in_bsdinstall_some_sysctls_and/) ###

* bsdinstall in FreeBSD 11.0 will feature a number of new menus.
* The first, well allow you to set the date and time. Often on computers that have been in storage, or some embedded type devices that have no RTC, the date will be wildly wrong, and ntpd will refuse to run until the date is correctly set. This feature makes it easy to enter the date and time using dialog(1)
* The second menu, inspired by the existing ‘services’ menu, offers a number of ‘hardening’ options
* This menu allows users to easily enable a number of security features, including:
  * Hide processes running as other users/groups
  * Disable reading the kernel message buffer and debugging processes for unprivileged users
  * Randomize the PID of newly created processes
  * Enable the stack guard
  * Erase /tmp at boot
  * Disable remote syslog
  * Disable sendmail

* All of these options are off by default, so that an install done with the installer will be the same as an install from source, or an upgrade.
* A number of these options are candidates to become on-by-default in the future, so the hope is that this menu will get more users to test these features and find any negative interactions with applications or general use, so they can be fixed. \*\*\*

### [Rawrite32: the NetBSD image writing tool](https://www.netbsd.org/~martin/rawrite32/) ###

* Martin of the NetBSD project has released a new version of his USB imaging tool, rawrite32
* For those who’ve not used this tool before, it is a Windows Application that allows writing NetBSD images directly to USB media (other other disk media)
* This update brings with it support for writing .xz file, and binary signing
* This may come in handy for writing other OS images to memory sticks as well, especially for those locked into a windows environment who need to switch. \*\*\*

### [ZFS-Snap-Diff -- A pretty interface for viewing what changed after a ZFS snapshot ](https://github.com/j-keck/zfs-snap-diff) ###

* There are lots of nice little utilities to help create and maintain your ZFS snapshots. However today we have something unique to look at, ‘zfs-snap-diff’.
* What makes it unique, is that it ships with a built-in golang / angularjs GUI for snapshot management
* It looks very powerful, including a built-in diff utility, so you can even see the changes in text-files, in addition to downloading files, restoring old versions and more.
* Its nice to see so many ZFS utilities starting to take off, and evolve file-management further. \*\*\*

### [Dtrace Conf 2016 Event Videos](https://www.joyent.com/about/events/2016/dtrace-conf) ###

* The videos from Dtrace.conf 2016 have been posted
* Some highlights:
  * Useful DTrace Intro
  * CTF Everywhere
  * Distributed DTrace
  * DTrace for Apps
  * DTrace json() subroutine
  * Implementing (or not) fds[] in FreeBSD
  * OpenDTrace
  * DTrace performance improvements with always-on instrumentation
  * D Syntactic Sugar
  * DTrace and Go, DTrace and Postgres

* [dtrace.conf(16) wrap-up by Bryan Cantrill](https://www.joyent.com/blog/dtrace-conf-16-wrap-up)

>
>
> Once again, it was an eclectic mix of technologists — and once again, the day got kicked off with me providing an introduction to dtrace.conf and its history. (Just to save you the time filling out your Cantrill Presentation Bingo Card: you can find me punching myself at 16:19, me offering unsolicited personal medical history at 20:11, and me getting trolled by unikernels at 38:25.)
>
>

* The next DTrace.conf isn’t until 2020 \*\*\*

Beastie Bits
----------

* [The BSD Daemon features in Mexican candy packaging](https://www.reddit.com/r/BSD/comments/4vngmw/the_bsd_daemon_feature_in_mexican_candy_packaging/)

* [Remove PG\_ZERO and zeroidle (page-zeroing) entirely](http://lists.dragonflybsd.org/pipermail/commits/2016-August/624202.html)

* [OpenBSD: Release Songs: 6.0: "Black Hat"](https://www.openbsd.org/lyrics.html#60b)

* [OpenBSD Gaming Resource](http://satterly.neocities.org/openbsd_games.html)

* [LibreSSL 2.4.2 and 2.3.7 Released](http://bsdsec.net/articles/libressl-2-4-2-and-2-3-7-released)

Feedback/Questions
----------

* [ Pedja - Bhyve GUI ](http://pastebin.com/LJcJmNsR)
* [ Tim - Jail Management](http://pastebin.com/259x94Rh)
* [ Don - X260 ](http://pastebin.com/A86yHnzz)
* [ David - Updates](http://pastebin.com/wjtcuVSA)
* [ Ghislain - Jail Management](http://pastebin.com/DgH9G7p5) \*\*\*