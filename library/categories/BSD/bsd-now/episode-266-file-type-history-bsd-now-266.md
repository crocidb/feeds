+++
title = "Episode 266: File Type History | BSD Now 266"
description = 'Running OpenBSD/NetBSD on FreeBSD using grub2-bhyve, vermaden’s FreeBSD story, thoughts on OpenBSD on the desktop, history of file type info in Unix dirs, Multiboot a Pinebook KDE neon image, and more.\Headlines   \[OpenBSD/NetBSD on FreeBSD using grub2-bhyve](https://oshogb'
date = "2018-10-03T17:00:00Z"
url = "https://www.bsdnow.tv/266"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.703596237Z"
seen = true
+++

Running OpenBSD/NetBSD on FreeBSD using grub2-bhyve, vermaden’s FreeBSD story, thoughts on OpenBSD on the desktop, history of file type info in Unix dirs, Multiboot a Pinebook KDE neon image, and more.

\##Headlines  
 \###[OpenBSD/NetBSD on FreeBSD using grub2-bhyve](https://oshogbo.vexillium.org/blog/53/)

>
>
> When I was writing a blog post about the process title, I needed a couple of virtual machines with OpenBSD, NetBSD, and Ubuntu. Before that day I mainly used FreeBSD and Windows with bhyve. I spent some time trying to set up an OpenBSD using bhyve and UEFI as described here. I had numerous problems trying to use it, and this was the day I discovered the grub2-bhyve tool, and I love it!  
>  The grub2-bhyve allows you to load a kernel using GRUB bootloader. GRUB supports most of the operating systems with a standard configuration, so exactly the same method can be used to install NetBSD or Ubuntu. First, let’s install grub2-bhyve on our FreeBSD box:
>
>

`# pkg install grub2-bhyve`

>
>
> To run grub2-bhyve we need to provide at least the name of the VM. In bhyve, if the memsize is not specified the default VM is created with 256MB of the memory.
>
>

`# grub-bhyve test`  
`GNU GRUB version 2.00`  
`Minimal BASH-like line editing is supported. For the first word, TAB lists possible command`  
`completions. Anywhere else TAB lists possible device or file completions.`  
``  
``  
`grub>`

>
>
> After running grub-bhyve command we will enter the GRUB loader. If we type the ls command, we will see all the available devices. In the case of the grub2-bhyve there is one additional device called “(host)” that is always available and allows the host filesystem to be accessed. We can list files under that device.
>
>

`grub> ls`  
`(host)`  
`grub> ls (host)/`  
`libexec/ bin/ usr/ bhyve/ compat/ tank/ etc/ boot/ net/ entropy proc/ lib/ root/ sys/ mnt/ rescue/ tmp/ home/ sbin/ media/ jail/ COPYRIGHT var/ dev/`  
`grub>`

>
>
> To exit console simply type ‘reboot’. I would like to install my new operating system under a ZVOL `ztank/bhyve/post`. On another terminal, we create:
>
>

`# zfs create -V 10G ztank/bhyve/post`

>
>
> If you don’t use ZFS for some crazy reason you can also create a raw blob using the truncate(1) command.
>
>

`# truncate -s 10G post.img`

>
>
> I recommend installing an operating system from the disk image (installXX.fs for OpenBSD and NetBSD-X.X-amd64-install.img for NetBSD). Now we need to create a device map for a GRUB.
>
>

`cat > /tmp/post.map << EOF`  
`(hd0) /directory/to/disk/image`  
`(hd1) /dev/zvol/ztank/bhyve/post`  
`EOF`

>
>
> The mapping files describe the names for files in the GRUB. In our case under hd0 we will have an installation image and in hd1 we will have our ZVOL/blob. You can also try to use an ISO image then instead of using hd0 device name use a cd0. When we will run the grub-bhyve command we will see two additional devices.
>
>

`# grub-bhyve -m /tmp/post.map post`  
`grub> ls`  
`(hd0) (hd0,msdos4) (hd0,msdos1) (hd0,openbsd9) (hd0,openbsd1) (hd1) (host)`

>
>
> The hd0 (in this example OpenBSD image) contains multiple partitions. We can check what is on it.
>
>

`grub> ls (hd0,msdos4)/`  
`boot bsd 6.4/ etc/`

>
>
> And this is the partition that contains a kernel. Now we can set a root device, load an OpenBSD kernel and boot:
>
>

`grub> set root=(hd0,msdos4)`  
`grub> kopenbsd -h com0 -r sd0a /bsd`  
`grub> boot`

>
>
> After that, we can run bhyve virtual machine. In my case it is:
>
>

`# bhyve -c 1 -w -u -H \`  
`-s 0,amd_hostbridge \`  
`-s 3,ahci-hd,/directory/to/disk/image \`  
`-s 4,ahci-hd,/dev/zvol/ztank/bhyve/post \`  
`-s 31,lpc -l com1,stdio \`  
`post`

>
>
> Unfortunately explaining the whole bhyve(8) command line is beyond this article. After installing the operating system remove hd0 from the mapping file and the image from the bhyve(8) command. If you don’t want to type all those GRUB commands, you can simply redirect them to the standard input.
>
>

`cat << EOF | grub-bhyve -m /tmp/post.map -M 512 post`  
`set root=(hd0,4)`  
`kopenbsd -h com0 -r sd0a /bsd`  
`boot`  
`EOF`

---

\###[My FreeBSD Story](https://vermaden.wordpress.com/2018/09/07/my-freebsd-story/)

>
>
> My first devices/computers/consoles (not at the same time) that I remember were Atari 2600 and Pegasus console which was hardware clone of the Nintendo NES.  
>  Back then I did not even knew that it was Atari 2600 as I referred to it as Video Computer System … and I did not even knew any english by then. It took me about two decades to get to know (by accident) that this Video Computer System was Atari 2600  
>  Then I got AMIGA 600 computer (or should I say my parents bought it for me) which served both for playing computer games and also other activities for the first time. AMIGA is the computer that had the greatest influence on me, as it was the first time I studied the books about Amiga Workbench operating system and learned commands from Amiga Shell terminal. I loved the idea of Ram Disk icon/directory on the desktop that allowed me to transparently put any things in system memory. I still miss that concept on today’s desktop systems … and I still remember how dismal I was when I watched Amiga Deathbed Vigil movie.  
>  At the end of 1998 I got my first PC that of course came with Windows and that computer served both as gaming machine and as well as typical tool. One time I dig into the internals with Windows Registry (which left me disgusted by its concepts and implementation) and its limited command line interface provided by CMD.EXE executable. I remember that the heart of this box was not the CPU or the motherboard but the graphics accelerator – the legendary 3Dfx Voodoo card. This company (3Dfx) – their attitude and philosophy – also left solid fingerprint on my way. Like AMIGA did.  
>  After ‘migration’ from AMIGA to PC it never again ‘felt right’. The games were cool but the Windows system was horrible. Time has passed and different Windows versions and hardware modifications took place. Windows XP felt really heavy at that time, not to mention Windows 2000 for example with even bigger hardware requirements. I also do not understand all the hate about Windows ME. It crashed with the same frequency as Windows 98 or later Windows 98 Second Edition but maybe my hardware was different ??  
>  I do not have any ‘mine’ screenshots from that period as I lost all my 40 GB (huge then) drive of data when I moved/resized the partition with Partition Magic to get some more space from the less filled C: drive. That day I learned hard that “there are people who do backups and people who will do backups”. I never lost data again as I had multiple copies of my data, but the same as Netheril fall the lost data was was gone forever.  
>  I always followed various alternatives which led me to try Linux in 2003, after reading about various distributions philosophies I decided to run Slackware Linux with KDE 3. My buddy used Aurox Linux by then (one of the few Linux distributions from Poland) and encouraged me to do the same – especially in the context of fixing possible problems as he already knew it and also as he recently dumped Windows system. But Slackware sounded like a better idea so I took that path instead. At first I dual booted between Windows XP and Slackware Linux cause I had everything worked out on the Windows world while I often felt helpless in the Linux world, so I would reboot into Windows to play some games or find a solution for Linux problem if that was required. I remember how strange the concept of dual clipboards (PRIMARY and SECONDARY) was for me by then. I was amazed why ‘so much better’ system as Linux (at least marketed that way) needs a system tray program to literally manage the clipboard. On Windows it was obvious, you do [CTRL]+[C] to copy and [CTRL]+[V] to paste things, but on Linux there (no I know its X11 feature) there were two clipboards that were synchronized by this little system tray program from KDE 3. It was also unthinkable for me that I will ‘lost’ contents of last/recent [CTRL]+[C] operation if I close the application from which the copy was made. I settled down a little on Slackware but not for long. I really did not liked manual dependency management for packages for example. Also KDE 3 was really ugly and despite trying all possible options I was not able to tweak it into something nice looking.  
>  After half a year on Slackware I checked the Linux distributions again and decided to try Gentoo Linux. I definitely agree with the image below which visualizes Gentoo Linux experience, especially when You install it for he first time ??  
>  Of course I went with the most hardcore version with self building Stage 1 (compiler and toolchain) which was horrible idea at that time because compilation on slow single core machine took forever … but after many hours I got Gentoo installed. I now have to decide which desktop environment to use. I have read a lot of good news about Fluxbox at that time so this is what I tried. It was very weird experience (to create everything in GUI from scratch) but very pleasant one. That recalled me the times of AMIGA … but Linux came in the way too much often. The more I dig into Gentoo Linux the more I read that lots of Gentoo features are based on FreeBSD solutions. Gentoo Portage is a clone of FreeBSD Ports. That ‘central’ /etc/rc.conf system configuration file concept was taken from FreeBSD as well. So I started to gather information about FreeBSD. The (then) FreeBSD website or FreeBSD Ports site (still) felt little outdated to say the least but that did not discouraged me.  
>  Somewhere in 2005 I installed FreeBSD 5.4 on my computer. The beginnings were hard, like the earlier step with Gentoo but similarly like Gentoo the FreeBSD project came with a lot of great documentation. While Gentoo documentation is concentrated within various Gentoo Wiki sites the FreeBSD project comes with ‘official’ documentation in the form of Handbook and FAQ. I remember my first questions at the now nonexistent [BSDForums.org](http://BSDForums.org) site – for example one of the first ones – how to scroll the terminal output in the plain console. I now know that I had to push Scroll Lock button but it was something totally new for me.  
>  Why FreeBSD and not OpenBSD or NetBSD? Probably because Gentoo based most their concepts on the FreeBSD solutions, so that led me to FreeBSD instead of the other BSD operating systems. Currently I still use FreeBSD but I keep an steady eye on the OpenBSD, HardenedBSD and DragonFly BSD solutions and improvements.  
>  As the migration path from Linux to FreeBSD is a lot easier – all configuration files from /home can be just copied – the migration was quite fast easy. I again had the Fluxbox configuration which I used on the Gentoo. Now – on FreeBSD – it started to fell even more like AMIGA times. Everything is/has been well thought and had its place and reason. The documentation was good and the FreeBSD Community was second to none.  
>  After 15 years of using various Windows, UNIX (macOS/AIX/HP-UX/Solaris/OpenSolaris/Illumos/FreeBSD/OpenBSD/NetBSD) and UNIX-like (Linux) systems I always come to conclusion that FreeBSD is the system that sucks least. And sucks least with each release and one day I will write why FreeBSD is such great operating system … if I already haven’t
>
>

---

\##News Roundup  
 \###[OpenBSD on the Desktop: some thoughts](https://blog.gsora.xyz/openbsd-on-the-desktop-some-thoughts/)

>
>
> I’ve been using OpenBSD on my ThinkPad X230 for some weeks now, and the experience has been peculiar in some ways.  
>  The OS itself in my opinion is not ready for widespread desktop usage, and the development team is not trying to push it in the throat of anybody who wants a Windows or macOS alternative. You need to understand a little bit of how \*NIX systems work, because you’ll use CLI more than UI. That’s not necessarily bad, and I’m sure I learned a trick or two that could translate easily to Linux or macOS. Their development process is purely based on developers that love to contribute and hack around, just because it’s fun. Even the mailing list is a cool place to hang on! Code correctness and security are a must, nothing gets committed if it doesn’t get reviewed thoroughly first - nowadays the first two properties should be enforced in every major operating system.  
>  I like the idea of a platform that continually evolves. pledge(2) and unveil(2) are the proof that with a little effort, you can secure existing software better than ever.  
>  I like the “sensible defaults” approach, having an OS ready to be used - UI included if you selected it during the setup process - is great.  
>  Just install a browser and you’re ready to go.  
>  Manual pages on OpenBSD are real manuals, not an extension of the “–help” command found in most CLI softwares. They help you understand inner workings of the operating system, no internet connection needed. There are some trade-offs, too.  
>  Performance is not first-class, mostly because of all the security mitigations and checks done at runtime.  
>  I write Go code in neovim, and sometimes you can feel a slight slowdown when you’re compiling and editing multiple files at the same time, but usually I can’t notice any meaningful difference. Browsers are a different matter though, you can definitely feel something differs from the experience you can have on mainstream operating systems. But again, trade-offs.  
>  To use OpenBSD on the desktop you must be ready to sacrifice some of the goodies of mainstream OSes, but if you’re searching for a zen place to do your computing stuff, it’s the best you can get right now.
>
>

---

\###[The history of file type information being available in Unix directories](https://utcc.utoronto.ca/~cks/space/blog/unix/DirectoryDTypeHistory)

>
>
> The two things that Unix directory entries absolutely have to have are the name of the directory entry and its ‘inode’, by which we generically mean some stable kernel identifier for the file that will persist if it gets renamed, linked to other directories, and so on. Unsurprisingly, directory entries have had these since the days when you read the raw bytes of directories with read(), and for a long time that was all they had; if you wanted more than the name and the inode number, you had to stat() the file, not just read the directory. Then, well, I’ll quote myself from an old entry on a find optimization:  
>  […], Unix filesystem developers realized that it was very common for programs reading directories to need to know a bit more about directory entries than just their names, especially their file types (find is the obvious case, but also consider things like ‘ls -F’). Given that the type of an active inode never changes, it’s possible to embed this information straight in the directory entry and then return this to user level, and that’s what developers did; on some systems, readdir(3) will now return directory entries with an additional d\_type field that has the directory entry’s type.  
>  On Twitter, I recently grumbled about Illumos not having this d\_type field. The ensuing conversation wound up with me curious about exactly where d\_type came from and how far back it went. The answer turns out to be a bit surprising due to there being two sides of d\_type.  
>  On the kernel side, d\_type appears to have shown up in 4.4 BSD. The 4.4 BSD /usr/src/sys/dirent.h has a struct dirent that has a d\_type field, but the field isn’t documented in either the comments in the file or in the getdirentries(2) manpage; both of those admit only to the traditional BSD dirent fields. This 4.4 BSD d\_type was carried through to things that inherited from 4.4 BSD (Lite), specifically FreeBSD, but it continued to be undocumented for at least a while.  
>  (In FreeBSD, the most convenient history I can find is here, and the d\_type field is present in sys/dirent.h as far back as FreeBSD 2.0, which seems to be as far as the repo goes for releases.)  
>  Documentation for d\_type appeared in the getdirentries(2) manpage in FreeBSD 2.2.0, where the manpage itself claims to have been updated on May 3rd 1995 (cf). In FreeBSD, this appears to have been part of merging 4.4 BSD ‘Lite2’, which seems to have been done in 1997. I stumbled over a repo of UCB BSD commit history, and in it the documentation appears in this May 3rd 1995 change, which at least has the same date. It appears that FreeBSD 2.2.0 was released some time in 1997, which is when this would have appeared in an official release.  
>  In Linux, it seems that a dirent structure with a d\_type member appeared only just before 2.4.0, which was released at the start of 2001. Linux took this long because the d\_type field only appeared in the 64-bit ‘large file support’ version of the dirent structure, and so was only return by the new 64-bit getdents64() system call. This would have been a few years after FreeBSD officially documented d\_type, and probably many years after it was actually available if you peeked at the structure definition.  
>  As far as I can tell, d\_type is present on Linux, FreeBSD, OpenBSD, NetBSD, Dragonfly BSD, and Darwin (aka MacOS or OS X). It’s not present on Solaris and thus Illumos. As far as other commercial Unixes go, you’re on your own; all the links to manpages for things like AIX from my old entry on the remaining Unixes appear to have rotted away.  
>  Sidebar: The filesystem also matters on modern Unixes  
>  Even if your Unix supports d\_type in directory entries, it doesn’t mean that it’s supported by the filesystem of any specific directory. As far as I know, every Unix with d\_type support has support for it in their normal local filesystems, but it’s not guaranteed to be in all filesystems, especially non-Unix ones like FAT32. Your code should always be prepared to deal with a file type of DT\_UNKNOWN.  
>  It’s also possible to have things the other way around, where you have a filesystem with support for file type information in directories that’s on a Unix that doesn’t support it. There are a number of plausible reasons for this to happen, but they’re either obvious or beyond the scope of this entry.
>
>

---

\###[Multiboot Pinebook KDE neon](https://euroquis.nl/bobulate/?p=1979)

>
>
> Recently a KDE neon image for the Pinebook was announced. There is a new image, with a handful of fixes, which the KDE Plasma team has been working on over the past week and a half.  
>  Here’s a picture of my Pinebook running KDE neon — watching Panic! At the Disco’s High Hopes — sitting in front of my monitor that’s hooked up to one of my openSUSE systems. There are still some errata, and watching video sucks up battery, but for hacking on documentation from my hammock in the garden, or doing IRC meetings it’s a really nice machine.  
>  But one of the neat things about running KDE neon off of an SD card on the Pinebook is that it’s portable — that SD card can move around. So let’s talk about multiboot in the sense of “booting the same OS storage medium in different hardware units” rather than “booting different OS from a medium in a single hardware unit”. On these little ARM boards, u-boot does all the heavy lifting early in the boot process. So to re-use the KDE neon Pinebook image on another ARM board, the u-boot blocks need to be replaced.  
>  I have the u-boot from a Pine64 image (I forget what) lying around, 1015 blocks of 1024 bytes, which I can dd over the u-boot blocks on the SD card, dd bs=1k conv=notrunc,sync if=uboot.img of=/dev/da0 seek=8, and then the same SD card, with the filesystem and data from the Pinebook, will boot on the Pine64 board. Of course, to move the SD card back again, I need to restore the Pinebook u-boot blocks.  
>  Here’s a picture of my Pineboard (the base is a piece of the garden fence, it’s Douglas pine, with 4mm threaded rods acting as the corner posts for my Pine64 mini-rack), with power and network and a serial console attached, along with the serial console output of the same.  
>  The nice thing here is that the same software stack runs on the Pine64 but then has a wired network — which in turn means that if I switch on the other boards in that mini-rack, I’ve got a distcc-capable cluster for fast development, and vast NFS storage (served from ZFS on my FreeBSD machines) for source. I can develop in a high(er) powered environment, and then swap the card around into the Pinebook for testing-on-the-go.  
>  So to sum up: you can multiboot the KDE neon Pinebook image on other Pine64 hardware (i.e. the Pine64 board). To do so, you need to swap around u-boot blocks. The blocks can be picked out of an image built for each board, and then a particular image (e.g. the latest KDE neon Pinebook) can be run on either board.
>
>

---

\##Beastie Bits

* [Unexpected benefit with Ryzen – reducing power for build server](http://lists.dragonflybsd.org/pipermail/users/2018-September/357883.html)
* [Happy #CIDRDay!](https://mwl.io/archives/3758)
* [Absolute FreeBSD 3e ship date](https://mwl.io/archives/3771)
* [MWL FreeBSD talk @ October 9th 2018 - MUG Meeting](http://www.mug.org/)
* [MeetBSD Oct 19-20](https://www.ixsystems.com/blog/meetbsd-2018-countdown/)
* [October’s London \*BSD meetup - 9th Oct 2018](http://mailman.uk.freebsd.org/pipermail/ukfreebsd/2018-September/014218.html)
* [NRW BUG Meeting at Trivago Oct. 9](https://www.bsd.nrw/)
* [Lars Wittebrood blogs about his visit to EuroBSDCon 2018](https://blog.socruel.nu/misc/eurobsdcon-2018.html)
* [EuroBSDcon 2018 OpenBSD slides available](https://undeadly.org/cgi?action=article;sid=20180925075334)
* [EuroBSDCon conference site has most slides as well](https://2018.eurobsdcon.org/talks-speakers/)

---

\##Feedback/Questions

* Brad - [Unmounted ZFS sends](http://dpaste.com/3T9M2QC#wrap)
* Niclas - [Report from a Meetup](http://dpaste.com/11TKDK2)
* Ghislain - [Bhyve not used?](http://dpaste.com/2790GC6)
* Shane - [zpool history and snapshots](http://dpaste.com/1P055SQ)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---