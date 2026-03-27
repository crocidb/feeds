+++
title = "Episode 274: Language: Assembly | BSD Now 274"
description = 'Assembly language on OpenBSD, using bhyve for FreeBSD development, FreeBSD Gaming, FreeBSD for Thanksgiving, no space left on Dragonfly’s hammer2, and more.\Headlines   \Assembly language on OpenBSD amd64+arm64This is a shor'
date = "2018-11-29T07:00:00Z"
url = "https://www.bsdnow.tv/274"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.684316632Z"
seen = false
+++

Assembly language on OpenBSD, using bhyve for FreeBSD development, FreeBSD Gaming, FreeBSD for Thanksgiving, no space left on Dragonfly’s hammer2, and more.

\##Headlines  
 \###[Assembly language on OpenBSD amd64+arm64](https://cryogenix.net/OpenBSD_assembly.html)

>
>
> This is a short introduction to assembly language programming on OpenBSD/amd64+arm64. Because of security features in the kernel, I have had to rethink a series of tutorials covering Aarch64 assembly language on OpenBSD, and therefore this will serve as a placeholder-cum-reminder.
>
>

>
>
> OpenBSD, like many UNIX and unix-like operating systems, now uses the Executable and Linkable Format (ELF) for its binary libraries and executables. Although the structure of this format is beyond the scope of this short introduction, it is necessary for me to explain part of one of the headers.
>
>

>
>
> Within the program header there are sections known as PT\_NOTE that OpenBSD and other systems use to distinguish their ELF executables - OpenBSD looks for this section to check if it should attempt to execute the program or not.
>
>

* Our first program: in C!

>
>
> It’s often a good idea to prototype your assembly programs in a high level language such as C - it can then double up as both a set of notes and a working program that you can debug and compile into assembly language to compare with your own asm code.
>
>

* See the article for the rest on:
* Our first program: in x86-64 Asm (AT&T/GAS syntax)
* Our first program: in inline x86-64 assembly
* Our first program: in x86-64 asm (NASM syntax)
* Our first program: in ARMv8 AArch64 assembly

---

\###[Using bhyve for FreeBSD Development](https://bsdjhb.blogspot.com/2018/10/using-bhyve-for-freebsd-development.html)

* The Hypervisor

>
>
> The bhyve hypervisor requires a 64-bit x86 processor with hardware support for virtualization. This requirement allows for a simple, clean hypervisor implementation, but it does require a fairly recent  
>  processor. The current hypervisor requires an Intel processor, but there is an active development branch with support for AMD processors.  
>  The hypervisor itself contains both user and kernel components. The kernel driver is contained in the vmm.ko module and can be loaded either at boot from the boot loader or at runtime. It must  
>  be loaded before any guests can be created. When a guest is created, the kernel driver creates a device file in /dev/vmm which is used by the user programs to interact with the guest.  
>  The primary user component is the bhyve(8) program. It constructs the emulated device tree in the guest and provides the implementation for most of the emulated devices. It also calls the kernel driver to execute the guest. Note that the guest always executes inside the driver itself, so guest execution time in the host is counted as system time in the bhyve process.  
>  Currently, bhyve does not provide a system firmware interface to the guest (neither BIOS nor UEFI). Instead, a user program running on the host is used to perform boot time operations including loading the guest operating system kernel into the guest’s memory and setting the initial guest state so that the guest begins execution at the kernel’s entry point. For FreeBSD guests, the bhyveload(8) program can be used to load the kernel and prepare the guest for execution. Support for some other operating systems is available via the grub2-bhyve program which is available via the sysutils/grub2-bhyve port or as a prebuilt package.  
>  The bhyveload(8) program in FreeBSD 10.0 only supports 64-bit guests. Support for 32-bit guests will be included in FreeBSD 10.1.
>
>

* See the article for the very technical breakdown of the following:

* Network Setup

* Bridged Configuration

* Private Network with NAT

* Using dnsmasq with a Private Network

* Running Guests via [vmrun.sh](http://vmrun.sh)

* Configuring Guests

* Using a bhyve Guest as a Target

* Conclusion

>
>
> The bhyve hypervisor is a nice addition to a FreeBSD developer’s toolbox. Guests can be used both to develop new features and to test merges to stable branches. The hypervisor has a wide variety of uses beyond developing FreeBSD as well.
>
>

---

\##News Roundup  
 \###[Games on FreeBSD](https://oshogbo.vexillium.org/blog/58/)

>
>
> What do all programmers like to do after work? Ok, what do most programers like to do after work? The answer is simple: play a good game! Recently at the Polish BSD User Group meetup mulander was telling us how you can play games on OpenBSD. Today let’s discuss how this looks in the FreeBSD world using the “server only” operating system.
>
>

* XNA based games

>
>
> One of the ways of playing natively is to play indie games which use XNA. XNA is a framework from Microsoft which uses .NET, for creating games. Fortunately, in the BSD world we have Mono, an open source implementation of Microsoft’s .NET Framework which you can use to run games. There is also FNA framework which is a reimplementation of XNA which allows you to run the games under Linux. Thomas Frohwein, from OpenBSD, prepared a script, fnaify. Fnaify translate all dependencies used by an FNA game to OpenBSD dependencies.  
>  I decided to port the script to FreeBSD. The script is using /bin/sh which in the case of OpenBSD is a Korn Shell.
>
>

>
>
> I didn’t test it with many games, but I don’t see any reason why it shouldn’t work with all the games tested by the OpenBSD guys. For example, with:
>
>

* Cryptark

* Rouge Legacy

* Apotheon

* Escape Goat

* Bastion

* CrossCode

* Atom Zombie Smasher

* Open-Source games

>
>
> In FreeBSD and OpenBSD we also will find popular games which were open sourced. For example, I spend a lot of time playing in Quake 3 Arena on my FreeBSD machine. You can very simply install it using pkg: `# pkg install ioquake3`
>
>

>
>
> Then move the files for the skins and maps to the .ioquake3 directory from your copy of Quake. In the past I also played UrbanTerror which is a fully open source shooter based on the Quake 3 Arena engine. It’s is also very easy to install it from ports: `# pkg install iourbanterror`
>
>

>
>
> In the ports tree in the games directory you can find over 1000 directories, many of them with fully implemented games. I didn’t test many games in this category, but you can find some interesting titles like:
>
>

* openxcom (Open-source re-implementation of the original X-Com)
* openjazz (Free re-implementation of the Jazz Jackrabbit™ game engine)
* corsixth (Open source re-implementation of Theme Hospital)
* quake2
* openra (Red Alert)
* openrct2 (Open source re-implementation of RollerCoaster Tycoon 2)
* openmw (Open source engine reimplementation of the game Morrowind)

>
>
> All those titles are simply installed through the packages. In that case I don’t think FreeBSD has any difference from OpenBSD.
>
>

* Wine

>
>
> One of the big advantages of FreeBSD over OpenBSD is that FreeBSD supports wine. Wine allows you to run Windows applications under other operating systems (including mac). If you are a FreeBSD 11 user, you can simply fetch wine from packages: `# pkg install i386-wine`
>
>

>
>
> To run Windows games, you need to have a 32-bit wine because most of the games on Windows are built on 32-bits (maybe this has changed – I don’t play so much these days). In my case, because I run FreeBSD-CURRENT I needed to build wine from ports. It wasn’t nice, but it also wasn’t unpleasant. The whole step-by-step building process of a wine from ports can be found here.
>
>

* Summary

>
>
> As you can see there are many titles available for \*BSDs. Thanks to the FNA and fnaify, OpenBSD and FreeBSD can work with indie games which use the XNA framework. There are many interesting games implemented using this framework. Open source is not only for big server machines, and there are many re-implementations of popular games like Theme Hospital or RollerCoaster Tycoon 2. The biggest market is still enabled through wine, although its creates a lot of problems to run the games. Also, if you are an OpenBSD user only this option is not available for you. Please also note that we didn’t discuss any other emulators besides wine. In OpenBSD and FreeBSD there are many of them for GameBoy, SNES, NeoGeo and other games consoles.
>
>

---

\###[FreeBSD For Thanksgiving](https://bwidawsk.net/blog/index.php/2018/11/freebsd-for-thanksgiving/)

>
>
> I’ve been working on FreeBSD for Intel for almost 6 months now. In the world of programmers, I am considered an old dog, and these 6 months have been all about learning new tricks. Luckily, I’ve found myself in a remarkably inclusive and receptive community whose patience seems plentiful. As I get ready to take some time off for the holidays, and move into that retrospective time of year, I thought I’d beat the rush a bit and update on the progress  
>  Earlier this year, I decided to move from architect of the Linux graphics driver into a more nebulous role of FreeBSD enabling. I was excited, but also uncertain if I was making the right decision.  
>  Earlier this half, I decided some general work in power management was highly important and began working there. I attended BSDCam (handsome guy on the right), and led a session on Power Management. I was honored to be able to lead this kind of effort.  
>  Earlier this quarter, I put the first round of my patches up for review, implementing suspend-to-idle. I have some rougher patches to handle s0ix support when suspending-to-idle. I gave a talk MeetBSD about our team’s work.  
>  Earlier this month, I noticed that FreeBSD doesn’t have an implementation for Intel Speed Shift (HWPstates), and I started working on that.  
>  Earlier this week, I was promoted from a lowly mentee committer to a full src committer.  
>  Earlier today, I decided to relegate my Linux laptop to the role of my backup machine, and I am writing this from my Dell XPS13 running FreeBSD
>
>

`vandamme 13.0-CURRENT FreeBSD 13.0-CURRENT #45 881fee072ff(hwp)-dirty: Mon Nov 19 16:19:32 PST 2018 bwidawsk@vandamme:/usr/home/bwidawsk/usr/obj/usr/home/bwidawsk/usr/src/amd64.amd64/sys/DEVMACHINE amd64`

>
>
> 6 months later, I feel a lot less uncertain about making the right decision. In fact, I think both opportunities would be great, and I’m thankful this Thanksgiving that this is my life and career. I have more plans and things I want to get done. I’m looking forward to being thankful again next year.
>
>

---

\###[hammer2: no space left on device on Dragonfly BSD](https://www.garyshood.com/hammer2-space/)

* The Issue

>
>
> hammer2 does not actually delete a file when you rm or unlink it. Since recovery of the file is possible (this is the design of hammer2), there will still be an entry taking up data. It’s similar to how git works.  
>  Even with 75% usage listed here, the filesystem could still have filled up. If you are using it as your root filesystem, then attempts to clean up data may fail. If the kernel panics over this, you will see something like this.
>
>

* The Fix

>
>
> If you have a recent enough version of the rescue ramdisk installed, on bootup you can press ‘r’ and access the rescue ramdisk. Your provider will have to offer some sort of remote interface for interacting with the operating system before it boots, like VNC or IPMI. You can then mount your filesystem using:
>
>

`[root@ ~]# mkdir /tmp/fs`  
`[root@ ~]# mount_hammer2 -o local /dev/vbd0s1a /tmp/fs`

>
>
> If you receive an error that /sbin/hammer2 is not found, then your rescue ramdisk is not up to date enough. In that scenario, download the latest 5.2 iso from [dragonflybsd.org](http://dragonflybsd.org) and boot from the cd-rom on your virtual machine or physical device. Just login as root instead of installer.  
>  If the mount does succeed, then all you have to do is run the following twice:
>
>

`[root@ ~]# /sbin/hammer2 bulkfree /tmp/fs`

>
>
> If you do not have enough memory on your machine, you may need to mount swap. Add your swap partition to the /etc/fstab and then do:
>
>

`[root@ ~]# swapon -a`

>
>
> Once you have ran the bulkfree command twice, the usage reported by df -h will be correct. However, there is a chance on reboot that a core dump will be placed in /var/crash/ so be prepared to have plenty of space free in case that happens. You should also delete any files you can and run the bulkfree operation twice afterwards to clear up additional space.
>
>

---

\##Beastie Bits

* [BSD Pizza Night - Portland](http://dpaste.com/1S9NMZA)
* [bsd@35c3: …the place for you…\*NIX!](http://dpaste.com/3T0AB7M)
* [Project Trident PreRelease Image now available](http://project-trident.org/download/)
* [Play Stardew Valley on OpenBSD](https://dataswamp.org/~solene/2018-11-09-stardew-valley.html)
* [GUI Wrapper for OpenBSD mixerctl](https://github.com/charlesdaniels/gmixerctl)
* [qtv - QuickTextViewer](https://github.com/q5sys/qtv/)

---

\##Feedback/Questions

* Ron - [Ideas for feedback section](http://dpaste.com/16XT6PQ#wrap)
* Paulo - [SDIO Firmware](http://dpaste.com/0BEE730)
* Dan - [Some fun ZFS questions about labels](http://dpaste.com/3Q7DERN#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---