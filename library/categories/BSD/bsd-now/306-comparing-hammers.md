+++
title = "306: Comparing Hammers"
description = "Am5x86 based retro UNIX build log, setting up services in a FreeNAS Jail, first taste of DragonflyBSD, streaming Netflix on NetBSD, NetBSD on the last G4 Mac mini, Hammer vs Hammer2, and more.Headlines[Polprog's Am5x86 based retro UNIX build log](https://polprog."
date = "2019-07-11T14:00:00Z"
url = "https://www.bsdnow.tv/306"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.622506298Z"
seen = false
+++

Am5x86 based retro UNIX build log, setting up services in a FreeNAS Jail, first taste of DragonflyBSD, streaming Netflix on NetBSD, NetBSD on the last G4 Mac mini, Hammer vs Hammer2, and more.

---

Headlines
----------

### [Polprog's Am5x86 based retro UNIX build log](https://polprog.net/blog/486/) ###

>
>
> I have recently acquired an Am5x86 computer, in a surprisingly good condition. This is an ongoing project, check this page often for updates!
>
>
>
> I began by connecting a front panel. The panel came from a different chassis and is slightly too wide, so I had to attach it with a couple of zip-ties. However, that makes it stick out from the PC front at an angle, allowing easy access when the computer sits at the floor - and thats where it is most of the time. It's not that bad, to be honest, and its way easier to access than it would be, if mounted vertically
>
>
>
> There is a mains switch on the front panel because the computer uses an older style power supply. Those power supplies instead of relying on a PSON signal, like modern ATX supplies, run a 4 wire cable to a mains switch. The cable carries live and neutral both ways, and the switch keys in or out the power. The system powers on as soon as the switch is enabled.
>
>
>
> Originally there was no graphics card in it. Since a PC will not boot with out a GPU, I had to find one. The mainboard only has PCI and ISA slots, and all the GPUs I had were AGP. Fortunately, I bought a PCI GPU hoping it would solve my issue...
>
>
>
> However the GPU turned out to be faulty. It took me some time to repair it. I had to repair a broken trace leading to one of the EEPROM pins, and replace a contact in the EEPROM's socket. Then I replaced all the electrolytic capacitors on it, and that fixed it for good.
>
>
>
> Having used up only one of the three PCI slots, I populated the remaining pair with two ethernet cards. I still have a bunch of ISA slots available, but I have nothing to install there. Yet.
>
>

* See the article for the rest of the writeup

---

### [Setting up services in a FreeNAS Jail](https://www.ixsystems.com/blog/services-in-freenas-jail/) ###

>
>
> This piece demonstrates the setup of a server service in a FreeNAS jail and how to share files with a jail using Apache 2.4 as an example. Jails are powerful, self-contained FreeBSD environments with separate network settings, package management, and access to thousands of FreeBSD application packages. Popular packages such as Apache, NGINX, LigHTTPD, MySQL, and PHP can be found and installed with the pkg search and pkg install commands.
>
>
>
> This example shows creating a jail, installing an Apache web server, and setting up a simple web page.
>
>
>
> NOTE: Do not directly attach FreeNAS to an external network (WAN). Use port forwarding, proper firewalls and DDoS protections when using FreeNAS for external web sites. This example demonstrates expanding the functionality of FreeNAS in an isolated LAN environment.
>
>

---

News Roundup
----------

### [First taste of DragonflyBSD](https://nanxiao.me/en/first-taste-of-dragonfly-bsd/) ###

>
>
> Last week, I needed to pick a BSD Operating System which supports NUMA to do some testing, so I decided to give Dragonfly BSD a shot. Dragonfly BSDonly can run on X86\_64 architecture, which reminds me of Arch Linux, and after some tweaking, I feel Dragonfly BSD may be a “developer-friendly” Operating System, at least for me.
>
>
>
> I mainly use Dragonfly BSD as a server, so I don’t care whether GUI is fancy or not. But I have high requirements of developer tools, i.e., compiler and debugger. The default compiler of Dragonfly BSD is gcc 8.3, and I can also install clang 8.0.0 from package. This means I can test state-of-the-art features of compilers, and it is really important for me. gdb‘s version is 7.6.1, a little lag behind, but still OK.
>
>
>
> Furthermore, the upgradation of Dragonfly BSD is pretty simple and straightforward. I followed document to upgrade my Operating System to 5.6.0 this morning, just copied and pasted, no single error, booted successfully.
>
>

---

### [Streaming Netflix on NetBSD](https://www.unitedbsd.com/d/68-streaming-netflix-on-netbsd) ###

>
>
> Here's a step-by-step guide that allows streaming Netflix media on NetBSD using a intel-haxm accelerated QEMU vm.
>
>
>
> Heads-up! Sound doesn't work, but everything else is fine. Please read the rest of this thread for a solution to this!!
>
>

---

### [“Sudo Mastery 2nd Edition” cover art reveal](https://mwl.io/archives/4320) ###

>
>
> I’m about halfway through the new edition of Sudo Mastery. Assuming nothing terrible happens, should have a complete first draft in four to six weeks. Enough stuff has changed in sudo that I need to carefully double-check every single feature. (I’m also horrified by the painfully obsolete versions of sudo shipped in the latest versions of CentOS and Debian, but people running those operating systems are already accustomed to their creaky obsolescence.)
>
>
>
> But the reason for this blog post? I have Eddie Sharam’s glorious cover art. My Patronizers saw it last month, so now the rest of you get a turn.
>
>

---

### [NetBSD on the last G4 Mac mini](https://tenfourfox.blogspot.com/2019/06/and-now-for-something-completely.html) ###

>
>
> I'm a big fan of NetBSD. I've run it since 2000 on a Mac IIci (of course it's still running it) and I ran it for several years on a Power Mac 7300 with a G3 card which was the second incarnation of the Floodgap gopher server. Today I also still run it on a MIPS-based Cobalt RaQ 2 and an HP Jornada 690. I think NetBSD is a better match for smaller or underpowered systems than current-day Linux, and is fairly easy to harden and keep secure even though none of these systems are exposed to the outside world.
>
>
>
> Recently I had a need to set up a bridge system that would be fast enough to connect two networks and I happened to have two of the "secret" last-of-the-line 1.5GHz G4 Mac minis sitting on the shelf doing nothing. Yes, they're probably outclassed by later Raspberry Pi models, but I don't have to buy anything and I like putting old hardware to good use.
>
>

---

### [Hammer vs Hammer2](https://phoronix.com/scan.php?page=news_item&px=DragonFlyBSD-5.6-HAMMER2-Perf) ###

>
>
> With the newly released DragonFlyBSD 5.6 there are improvements to its original HAMMER2 file-system to the extent that it's now selected by its installer as the default file-system choice for new installations. Curious how the performance now compares between HAMMER and HAMMER2, here are some initial benchmarks on an NVMe solid-state drive using DragonFlyBSD 5.6.0.
>
>
>
> With a 120GB Toshiba NVMe SSD on an Intel Core i7 8700K system, I ran some benchmarks of DragonFlyBSD 5.6.0 freshly installed with HAMMER2 and then again when returning to the original HAMMER file-system that remains available via its installer. No other changes were made to the setup during testing.
>
>
>
> And then for the more synthetic workloads it was just a mix. But overall HAMMER2 was performing well during the initial testing and great to see it continuing to offer noticeable leads in real-world workloads compared to the aging HAMMER file-system. HAMMER2 also offers better clustering, online deduplication, snapshots, compression, encryption, and many other modern file-system features.
>
>

---

Beastie Bits
----------

* [Unix CLI relational database](https://spin.atomicobject.com/2019/06/16/unix-cli-relational-database/)
* [The TTY demystified](https://www.linusakesson.net/programming/tty/index.php)
* [Ranger, a console file manager with VI keybindings](https://ranger.github.io/)
* [Some Unix Humor](https://www.reddit.com/r/unix/comments/c6o5ze/some_unix_humor/)
* [OpenBSD -import vulkan-loader for Vulkan API support](https://marc.info/?l=openbsd-ports-cvs&m=156121732625604&w=2)
* [FreeBSD ZFS without drives](https://savagedlight.me/2019/06/09/freebsd-zfs-without-drives/)

---

Feedback/Questions
----------

* Moritz - [ARM Builds](http://dpaste.com/175RRAZ)
* Dave - [Videos](http://dpaste.com/2DYK85B)
* Chris - [Raspberry Pi4](http://dpaste.com/1B16QVN)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.