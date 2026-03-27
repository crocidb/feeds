+++
title = "182: Bloaty McBloatface"
description = "This week on the show, we’ve got FreeBSD quarterly Status reports to discuss, OpenBSD changes to the installer, EC2 and IPv6 and more. StayThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsyste"
date = "2017-02-22T13:00:00Z"
url = "https://www.bsdnow.tv/182"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.951348887Z"
seen = false
+++

This week on the show, we’ve got FreeBSD quarterly Status reports to discuss, OpenBSD changes to the installer, EC2 and IPv6 and more. Stay

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [OpenBSD changes of note 6](http://www.tedunangst.com/flak/post/openbsd-changes-of-note-6) ###

* OpenBSD can now be cross built with clang. Work on this continues

>
>
> Build ld.so with -fno-builtin because otherwise clang would optimize the local versions of functions like \_dl\_memset into a call to memset, which doesn’t exist.  
>  Add connection timeout for ftp (http). Mostly for the installer so it can error out and try something else.  
>  Complete https support for the installer.
>
>

* I wonder how they handle certificate verification. I need to look into this as I’d like to switch the FreeBSD installer to this as well

>
>
> New ocspcheck utility to validate a certificate against its ocsp responder.  
>  net lock here, net lock there, net lock not quite everywhere but more than before.  
>  More per cpu counters in networking code as well.  
>  Disable and lock Silicon Debug feature on modern Intel CPUs.   
>  Prevent wireless frame injection attack described at 33C3 in the talk titled “Predicting and Abusing WPA2/802.11 Group Keys” by Mathy Vanhoef.  
>  Add support for multiple transmit ifqueues per network interface. Supported drivers include bge, bnx, em, myx, ix, hvn, xnf.   
>  pledge now tracks when a file as opened and uses this to permit or deny ioctl.   
>  Reimplement httpd’s support for byte ranges. Fixes a memory DOS.
>
>
> ---
>

### [FreeBSD 2016Q4 Status Report](https://www.freebsd.org/news/status/report-2016-10-2016-12.html) ###

* An overview of some of the work that happened in October - December 2016
* The ports tree saw many updates and surpassed 27,000 ports
* The core team was busy as usual, and the foundation attended and/or sponsored a record 24 events in 2016.
* CEPH on FreeBSD seems to be coming along nicely. For those that do not know, CEPH is a distributed filesystem that can sit on top of another filesystem. That is, you can use it to create a clustered filesystem out of a bunch of ZFS servers. Would love to have some viewers give it a try and report back.
* OpenBSM, the FreeBSD audit framework, got some updates
* Ed Schouten committed a front end to export sysctl data in a format usable by Prometheus, the open source monitoring system. This is useful for other monitoring software too.
* Lots of updates for various ARM boards
* There is an update on Reproducible Builds in FreeBSD, “ It is now possible to build the FreeBSD base system (kernel and userland) completely reproducibly, although it currently requires a few non-default settings”, and the ports tree is at 80% reproducible
* Lots of toolchain updates (gcc, lld, gdb)
* Various updates from major ports teams \*\*\*

### [Amazon rolls out IPv6 support on EC2](http://www.daemonology.net/blog/2017-01-26-IPv6-on-FreeBSD-EC2.html) ###

>
>
> A few hours ago Amazon announced that they had rolled out IPv6 support in EC2 to 15 regions — everywhere except the Beijing region, apparently. This seems as good a time as any to write about using IPv6 in EC2 on FreeBSD instances.  
>  First, the good news: Future FreeBSD releases will support IPv6 "out of the box" on EC2. I committed changes to HEAD last week, and merged them to the stable/11 branch moments ago, to have FreeBSD automatically use whatever IPv6 addresses EC2 makes available to it.  
>  Next, the annoying news: To get IPv6 support in EC2 from existing FreeBSD releases (10.3, 11.0) you'll need to run a few simple commands. I consider this unfortunate but inevitable: While Amazon has been unusually helpful recently, there's nothing they could have done to get support for their IPv6 networking configuration into FreeBSD a year before they launched it.
>
>

* You need the dual-dhclient port:

>
>
> pkg install dual-dhclient
>
>

* And the following lines in your /etc/rc.conf:

>
>
> ifconfig\_DEFAULT="SYNCDHCP accept\_rtadv"  
>  ipv6\_activate\_all\_interfaces="YES"  
>  dhclient\_program="/usr/local/sbin/dual-dhclient"
>
>
>
> * It is good to see FreeBSD being ready to use this feature on day 0, not something we would have had in the past
>
>
>
> Finally, one important caveat: While EC2 is clearly the most important place to have IPv6 support, and one which many of us have been waiting a long time to get, this is not the only service where IPv6 support is important. Of particular concern to me, Application Load Balancer support for IPv6 is still missing in many regions, and Elastic Load Balancers in VPC don't support IPv6 at all — which matters to those of us who run non-HTTP services. Make sure that IPv6 support has been rolled out for all the services you need before you start migrating.
>
>

* Colin’s blog also has the details on how to actually activate IPv6 from the Amazon side, if only it was as easy as configuring it on the FreeBSD side \*\*\*

### [FreeBSD’s George Neville-Neil tries valiantly for over an hour to convince a Linux fan of the error of their ways ](https://www.youtube.com/watch?v=cofKxtIO3Is) ###

>
>
> In today's episode of the Lunduke Hour I talk to George Neville-Neil -- author and FreeBSD advocate. He tries to convince me, a Linux user, that FreeBSD is better.
>
>
>
> * They cover quite a few topics, including:
>   * licensing, and the motivations behind it
>   * vendor relations
>   * community
>   * development model
>   * drivers and hardware support
>   
>   
> * George also talks about his work with the FreeBSD Foundation, and the book he co-authored, “The Design and Implementation of the FreeBSD Operating System, 2nd Edition” \*\*\*
>
>

News Roundup
----------

### [An interactive script that makes it easy to install 50+ desktop environments following a base install of FreeBSD 11](https://github.com/rosedovell/unixdesktops) ###

* And I thought I was doing good when I wrote a patch for the installer that enables your choice of 3 desktop environments...

>
>
> This is a collection of scripts meant to install desktop environments on unix-like operating systems following a base install. I call one of these 'complete' when it meets the following requirements:
>
>
>
> * A graphical logon manager is presented without user intervention after powering on the machine
> * Logging into that graphical logon manager takes the user into the specified desktop environment
> * The user can open a terminal emulator
>
>

* I need to revive my patch, and add Lumina to it \*\*\*

### [Firefox 51 on sparc64 - we did not hit the wall yet](https://blog.netbsd.org/tnf/entry/firefox_51_on_sparc64_we) ###

* A NetBSD developers tells the story of getting Firefox 51 running on their sparc64 machine
* It turns out the bug impacted amd64 as well, so it was quickly fixed
* They are a bit less hopeful about the future, since Firefox will soon require rust to compile, and rust is not working on sparc64 yet
* Although there has been some activity on the rust on sparc64 front, so maybe there is hope
* The post also look at a few alternative browsers, but it not hopeful \*\*\*

### [Introducing Bloaty McBloatface: a size profiler for binaries](http://blog.reverberate.org/2016/11/07/introducing-bloaty-mcbloatface.html) ###

>
>
> I’m very excited to announce that today I’m open-sourcing a tool I’ve been working on for several months at Google. It’s called Bloaty McBloatface, and it lets you explore what’s taking up space in your .o, .a, .so, and executable binary files.
>
>
>
> Bloaty is available under the Apache 2 license. All of the code is available on GitHub: github.com/google/bloaty. It is quick and easy to build, though it does require a somewhat recent compiler since it uses C++11 extensively. Bloaty primarily supports ELF files (Linux, BSD, etc) but there is some support for Mach-O files on OS X too. I’m interested in expanding Bloaty’s capabilities to more platforms if there is interest!
>
>

* I need to try this one some of the boot code files, to see if there are places we can trim some fat

>
>
> We’ve been using Bloaty a lot on the Protocol Buffers team at Google to evaluate the binary size impacts of our changes. If a change causes a size increase, where did it come from? What sections/symbols grew, and why? Bloaty has a diff mode for understanding changes in binary size
>
>

* The diff mode looks especially interesting. It might be worth setting up some kind of CI testing that alerts if a change results in a significant size increase in a binary or library \*\*\*

### [A BSD licensed mdns responder](https://github.com/kristapsdz/mdnsd) ###

* One of the things we just have to deal with in the modern world is service and system discovery. Many of us have fiddled with avahi or mdnsd and related “mdns” services.
* For various reasons those often haven’t been the best-fit on BSD systems.
* Today we have a github project to point you at, which while a bit older, has recently been updated with pledge() support for OpenBSD.
* First of all, why do we need an alternative? They list their reasons:

>
>
> This is an attempt to bring native mdns/dns-sd to OpenBSD. Mainly cause all the other options suck and proper network browsing is a nice feature these days.
>
>
>
> Why not Apple's mdnsd ?  
>  1 - It sucks big time.  
>  2 - No BSD License (Apache-2).  
>  3 - Overcomplex API.  
>  4 - Not OpenBSD-like.
>
>
>
> Why not Avahi ?  
>  1 - No BSD License (LGPL).  
>  2 - Overcomplex API.  
>  3 - Not OpenBSD-like  
>  4 - DBUS and lots of dependencies.
>
>

* Those already sound like pretty compelling reasons. What makes this “new” information again is the pledge support, and perhaps it’s time for more BSD’s to start considering importing something like mdnsd into their base system to make system discovery more “automatic” \*\*\*

Beastie Bits
----------

* [Benno Rice at Linux.Conf.Au: The Trouble with FreeBSD](https://www.youtube.com/watch?v=Ib7tFvw34DM)

* [State of the Port of VMS to x86 ](http://vmssoftware.com/pdfs/State_of_Port_20170105.pdf)

* [Microsoft Azure now offers Patent Troll Protection](https://thestack.com/cloud/2017/02/08/microsoft-azure-now-offers-patent-troll-ip-protection/)

* [FreeBSD Storage Summit 2017](https://www.freebsdfoundation.org/news-and-events/event-calendar/freebsd-storage-summit-2017/)

* [If you are going to be in Tokyo, make sure you come to](http://bhyvecon.org/)

---

Feedback/Questions
----------

* [ Farhan - Laptops](http://pastebin.com/bVqsvM3r)
* [ Hjalti - rclone](http://pastebin.com/7KWYX2Mg)
* [ Ivan - Jails](http://pastebin.com/U5XyzMDR)
* [ Jungle - Traffic Control](http://pastebin.com/sK7uEDpn) \*\*\*