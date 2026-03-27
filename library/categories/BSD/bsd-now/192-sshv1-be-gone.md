+++
title = "192: SSHv1 Be Gone"
description = "This week we have a FreeBSD Foundation development update, tell you about sprinkling in the TrueOS project, Dynamic WDS & a whole lot more!This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsyste"
date = "2017-05-03T12:00:00Z"
url = "https://www.bsdnow.tv/192"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.901477854Z"
seen = false
+++

This week we have a FreeBSD Foundation development update, tell you about sprinkling in the TrueOS project, Dynamic WDS & a whole lot more!

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [OpenSSH Removes SSHv1 Support](http://undeadly.org/cgi?action=article&sid=20170501005206) ###

* In a series of commits starting [here](http://marc.info/?l=openbsd-cvs&m=149359384905651&w=2) and ending with [this one](http://marc.info/?l=openbsd-cvs&m=149359530105864&w=2), Damien Miller completed the removal of all support for the now-historic SSHv1 protocol from [OpenSSH](https://www.openssh.com/).
* The final commit message, for the commit that removes the SSHv1 related regression tests, reads:

>
>
> Eliminate explicit specification of protocol in tests and loops over protocol. We only support SSHv2 now.  
>  Dropping support for SSHv1 and associated ciphers that were either suspected to or known to be broken has been planned for several releases, and has been eagerly anticipated by many in the OpenBSD camp.  
>  In practical terms this means that starting with OpenBSD-current and snapshots as they will be very soon (and further down the road OpenBSD 6.2 with OpenSSH 7.6), the arcane options you used with [ssh](http://man.openbsd.org/ssh) to connect to some end-of-life gear in a derelict data centre you don't want to visit anymore will no longer work and you will be forced do the reasonable thing. Upgrade.
>
>
> ---
>

### [FreeBSD Foundation April 2017 Development Projects Update](https://www.freebsdfoundation.org/blog/april-2017-development-projects-update/) ###

>
>
> FreeBSD runs on many embedded boards that provide a USB target or USB On-the-Go (OTG) interface. This allows the embedded target to act as a USB device, and present one or more interfaces (USB device classes) to a USB host. That host could be running FreeBSD, Linux, Mac OS, Windows, Android, or another operating system. USB device classes include audio input or output (e.g. headphones), mass storage (USB flash drives), human interface device (keyboards, mice), communications (Ethernet adapters), and many others.
>
>
>
> The Foundation awarded a project grant to Edward Tomasz Napierała to develop a USB mass storage target driver, using the FreeBSD CAM Target Layer (CTL) as a backend. This project allows FreeBSD running on an embedded platform, such as a BeagleBone Black or Raspberry Pi Zero, to emulate a USB mass storage target, commonly known as a USB flash stick. The backing storage for the emulated mass storage target is on the embedded board’s own storage media. It can be configured at runtime using the standard CTL configuration mechanism – the ctladm(8) utility, or the ctl.conf(5) file.
>
>
>
> The FreeBSD target can now present a mass storage interface, a serial interface (for a console on the embedded system), and an Ethernet interface for network access. A typical usage scenario for the mass storage interface is to provide users with documentation and drivers that can be accessed from their host system. This makes it easier for new users to interact with the embedded FreeBSD board, especially in cases where the host operating system may require drivers to access all of the functionality, as with Windows and OS X.
>
>

* They provide instructions on how to configure a BeagleBone Black to act as a flash memory stick attached to a host computer. +Check out the article, test, and report back your experiences with the new USB OTG interface. \*\*\*

### [Spring cleaning: Hardware Update and Preview of upcoming TrueOS changes](https://www.trueos.org/blog/spring-cleaning-hardware-update-preview-upcoming-trueos-changes/) ###

>
>
> The much-abused TrueOS build server is experiencing some technical difficulties, slowing down building new packages and releasing updates. After some investigation, one problem seemed to be a bug with the Poudriere port building software. After updating builders to the new version, some of the instability is resolved. Thankfully, we won’t have to rely on this server so much, because…
>
>

* We’re getting new hardware!
* A TrueOS/Lumina contributor is donating a new(ish) server to the project. Special thanks to TrueOS contributor/developer q5sys for the awesome new hardware!

* Preview: UNSTABLE and Upcoming TrueOS STABLE update

* A fresh UNSTABLE release is dropping today, with a few key changes:

>
>
> Nvidia/graphics driver detection fixes.  
>  Boot environment listing fix (FreeBSD boot-loader only)  
>  Virtual box issues fixed on most systems. There appears to be a regression in VirtualBox 5.1 with some hardware.  
>  New icon themes for Lumina (Preferences -\> Appearance -\> Theme).  
>  Removal of legacy pc-diskmanager. It was broken and unmaintained, so it is time to remove it.
>
>

* Installer/.iso Changes (Available with new STABLE Update):

>
>
> The text installer has been removed. It was broken and unmaintained, so it is time to remove it.  
>  There is now a single TrueOS install image. You can still choose to install as either a server or desktop, but both options live in a single install image now. This image is still available as either an .iso or .img file.  
>  The size of the .iso and .img files is reduced about 500 Mb to around 2Gb total. We’ve removed Firefox and Thunderbird from the default desktop installation. These have been replaced with Qupzilla and Trojita. Note you can replace Qupzilla and Trojita with Firefox and Thunderbird via the SysAdm Appcafe after completing the TrueOS install.  
>  Grub is no longer an installation option. Instead, the FreeBSD boot-loader is always used for the TrueOS partition. rEFInd is used as the master boot-loader for multi-booting; EFI partitioning is required.  
>  Qpdfview is now preinstalled for pdf viewing.  
>  Included a slideshow during the installation with tips and screenshots.
>
>

---

Interview - Patrick M. Hausen - [hausen@punkt.de](mailto:hausen@punkt.de)
----------

* Founder of Punkt.de [HAST - Highly Available Storage](https://wiki.freebsd.org/HAST)

---

News Roundup
----------

### [(finally) investigating how to get dynamic WDS (DWDS) working in FreeBSD!](http://adrianchadd.blogspot.com/2017/04/finally-investigating-how-to-get.html) ###

* Adrian Chadd writes in his blog:

>
>
> I sat down recently to figure out how to get dynamic WDS working on FreeBSD-HEAD. It's been in FreeBSD since forever, and it in theory should actually have just worked, but it's extremely not documented in any useful way. It's basically the same technology in earlier Apple Airports (before it grew into what the wireless tech world calls "Proxy-STA") and is what the "extender" technology on Qualcomm Atheros chipsets implement.  
>  A common question I get from people is "why can't I bridge multiple virtual machines on my laptop and have them show up over wifi? It works on ethernet!" And my response is "when I make dynamic WDS work, you can just make this work on FreeBSD devices - but for now, use NAT." That always makes people sad.
>
>
>
> * Goes on to explain that normal station/access point setups have up to three addresses and depending on the packet type, these can vary. There are a couple of variations in the addresses, which is more than the number of address fields in a normal 802.11 frame.
>
>
>
> The big note here is that there's not enough MAC addresses to say "please send this frame to a station MAC address, but then have them forward it to another MAC address attached behind it in a bridge." That would require 4 mac addresses in the 802.11 header, which we don't get.  
>  .. except we do. There's a separate address format where from-DS and to-DS bits in the header set to 1, which means "this frame is coming from distribution system to a distribution system", and it has four mac addresses. The RA is then the AP you're sending to, and then a fourth field indicates the eventual destination address that may be an ethernet device connected behind said STA.  
>  If you don't configure up WDS, then when you send frames from a station from a MAC address that isn't actually your 802.11 interface MAC address, the system would be confused. The STA wouldn't be able to transmit it easily, and the AP wouldn't know how to get back to your bridged ethernet addresses.  
>  The original WDS was a statically configured thing. [...] So for static configurations, this works great. You'd associate your extender AP as a station of the central AP, it'd use wpa\_supplicant to setup encryption, then anything between that central AP and that extender AP (as a station) would be encrypted as normal station traffic (but, 4-address frame format.)  
>  But that's not very convenient. You have to statically configure everything, including telling your central AP about all of your satellite extender APs. If you want to replace your central AP, you have to reprogram all of your extenders to use the new MAC addresses.  
>  So, Sam Leffler came up with "dynamic WDS" - where you don't have to explicitly state the list of central/satellite APs. Instead, you configure a central AP as "dynamic WDS", and when a 4-address frame shows up from an associated station, it "promotes" it to a WDS peer for you. On the satellite AP, it will just find an AP to communicate to, and then assume it'll do WDS and start using 4-address frames. It's still a bit clunky (there's no beacon, probe request, etc IEs that say "I do dynamic WDS!" so you'd better make ALL your central APs a different SSID!) but it certainly is better than what we had.  
>  Firstly, there are scripts in src/tools/tools/net80211/ - setup.wdsmain and setup.wdsrelay. These scripts are .. well, the almost complete documentation on a dynamic WDS setup. The manpage doesn't go into anywhere near enough information.  
>  So I dug into it. It turns out that dynamic WDS uses a helper daemon - 'wlanwds' - which listens for dynamic WDS configuration changes and will do things for you. This is what runs on the central AP side. Then it started making sense!  
>  So far, so good. I followed that script, modified it a bit to use encryption, and .. well, it half worked. Association worked fine, but no traffic was passing.  
>  A little more digging showed the actual problem - the dynamic WDS example scripts are for an open/unencrypted network. If you are using an encrypted network, the central AP side needs to enable privacy on the virtual interfaces so traffic gets encrypted with the parent interface encryption keys.  
>  Now, I've only done enough testing to show that indeed it is working. I haven't done anything like pass lots of traffic via iperf, or have a mix of DWDS and normal STA peers, nor actually run it for longer than 5 minutes. I'm sure there will be issues to fix. However - I do need it at home, as I can't see the home AP from the upstairs room (and now you see why I care about DWDS!) and so when I start using it daily I'll fix whatever hilarity ensues.
>
>
> ---
>

### [Why don't schools teach debugging?](https://danluu.com/teach-debugging/) ###

>
>
> A friend of mine and I couldn’t understand why some people were having so much trouble; the material seemed like common sense. The Feynman Method was the only tool we needed.  
>  Write down the problem  
>  Think real hard  
>  Write down the solution
>
>
>
> The Feynman Method failed us on the last project: the design of a divider, a real-world-scale project an order of magnitude more complex than anything we’d been asked to tackle before.
>
>
>
> I understand now why half the class struggled with the earlier assignments. Without an explanation of how to systematically approach problems, anyone who didn’t intuitively grasp the correct solution was in for a semester of frustration. People who were, like me, above average but not great, skated through most of the class and either got lucky or wasted a huge chunk of time on the final project. I’ve even seen people talented enough to breeze through the entire degree without ever running into a problem too big to intuitively understand; those people have a very bad time when they run into a 10 million line codebase in the real world. The more talented the engineer, the more likely they are to hit a debugging wall outside of school.
>
>
>
> It’s one of the most fundamental skills in engineering: start at the symptom of a problem and trace backwards to find the source. It takes, at most, half an hour to teach the absolute basics – and even that little bit would be enough to save a significant fraction of those who wash out and switch to non-STEM majors.
>
>
>
> Why do we leave material out of classes and then fail students who can’t figure out that material for themselves? Why do we make the first couple years of an engineering major some kind of hazing ritual, instead of simply teaching people what they need to know to be good engineers? For all the high-level talk about how we need to plug the leaks in our STEM education pipeline, not only are we not plugging the holes, we’re proud of how fast the pipeline is leaking.
>
>
> ---
>

### [FreeBSD: pNFS server for testing](https://lists.freebsd.org/pipermail/freebsd-fs/2017-April/024702.html) ###

* Rick Macklem has issued a call for testing his new pNFS server:

>
>
> I now have a pNFS server that I think is ready for testing/evaluation. It is basically a patched FreeBSD-current kernel plus nfsd daemon.  
>  If you are interested, some very basic notes on how it works and how to set it up are at:  
> [http://people.freebsd.org/\~rmacklem/pnfs-planb-setup.txt](http://people.freebsd.org/~rmacklem/pnfs-planb-setup.txt)
>
>
>
> A Plan B pNFS service consists of a single MetaData Server (MDS) and K Data Servers (DS), all of which would be recent FreeBSD systems. Clients will mount the MDS as they would a single NFS server. When files are created, the MDS creates a file tree identical to what a single NFS server creates, except that all the regular (VREG) files will be empty. As such, if you look at the exported tree on the MDS directly on the MDS server (not via an NFS mount), the files will all be of size == 0. Each of these files will also have two extended attributes in the system attribute name space:  
>  pnfsd.dsfile - This extended attrbute stores the information that the MDS needs to find the data storage file on a DS for this file.  
>  pnfsd.dsattr - This extended attribute stores the Size, ModifyTime and Change attributes for the file.
>
>
>
> For each regular (VREG) file, the MDS creates a data storage file on one of the K DSs, in one of the dsNN directories. The name of this file is the file handle of the file on the MDS in hexadecimal. The DSs use 20 subdirectories named "ds0" to "ds19" so that no one directory gets too large.  
>  At this time, the MDS generates File Layout layouts to NFSv4.1 clients that know how to do pNFS.  
>  For NFS clients that do not support NFSv4.1 pNFS, there will be a performance hit, since the IO RPCs will be proxied by the MDS for the DS server the data storage file resides on.  
>  The current setup does not allow for redundant servers. If the MDS or any of the K DS servers fail, the entire pNFS service will be non-functional.  
>  Looking at creating mirrored DS servers is planned, but it may be a year or more before that is implemented. I am planning on using the Flex File Layout for this, since it supports client side mirroring, where the client will write to all mirrors concurrently.
>
>
> ---
>

Beastie Bits
----------

* [Openbsd changes of note 620](http://www.tedunangst.com/flak/post/openbsd-changes-of-note-620)
* [Why Unix commands are short](http://www.catonmat.net/blog/why-unix-commands-are-short/)
* [OPNsense 17.1.5 released](https://opnsense.org/opnsense-17-1-5-released/)
* [Something for Apple dual-GPU users](http://lists.dragonflybsd.org/pipermail/commits/2017-April/625847.html)
* [pkgsrcCon 2017 CFT](https://mail-index.netbsd.org/netbsd-advocacy/2017/05/01/msg000735.html)
* [TrueOS/Lumina Dev Q&A: May 5th 2017](https://discourse.trueos.org/t/trueos-lumina-dev-q-a-5-4-17/1347)

---

Feedback/Questions
----------

* [Peter - Jails](http://dpaste.com/0J14HGJ#wrap)

* [Andrew - Languages and University Courses](http://dpaste.com/31AVFSF#wrap)

  * [JuniorJobs ](https://wiki.freebsd.org/JuniorJobs)

* [Steve - TrueOS and Bootloader](http://dpaste.com/1BXVZSY#wrap)

* [Ben - ZFS questions](http://dpaste.com/0R7AW2T#wrap)

* [Steve - Linux Emulation](http://dpaste.com/3ZR7NCC#wrap)

  ---