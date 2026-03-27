+++
title = "199: Read the source, KARL"
description = "FreeBSD 11.1-Beta1 is out, we discuss Kernel address randomized link (KARL), and explore the benefits of daily OpenBSD source code readingThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystem"
date = "2017-06-21T12:00:00Z"
url = "https://www.bsdnow.tv/199"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.885202217Z"
seen = false
+++

FreeBSD 11.1-Beta1 is out, we discuss Kernel address randomized link (KARL), and explore the benefits of daily OpenBSD source code reading

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeBSD 11.1-Beta1 now available](https://lists.freebsd.org/pipermail/freebsd-stable/2017-June/087242.html) ###

* Glen Barber, of the FreeBSD release engineering team has announced that FreeBSD 11.1-Beta1 is now available for the following architectures:

>
>
> 11.1-BETA1 amd64 GENERIC  
>  11.1-BETA1 i386 GENERIC  
>  11.1-BETA1 powerpc GENERIC  
>  11.1-BETA1 powerpc64 GENERIC64  
>  11.1-BETA1 sparc64 GENERIC  
>  11.1-BETA1 armv6 BANANAPI  
>  11.1-BETA1 armv6 BEAGLEBONE  
>  11.1-BETA1 armv6 CUBIEBOARD  
>  11.1-BETA1 armv6 CUBIEBOARD2  
>  11.1-BETA1 armv6 CUBOX-HUMMINGBOARD  
>  11.1-BETA1 armv6 GUMSTIX  
>  11.1-BETA1 armv6 RPI-B  
>  11.1-BETA1 armv6 RPI2  
>  11.1-BETA1 armv6 PANDABOARD  
>  11.1-BETA1 armv6 WANDBOARD  
>  11.1-BETA1 aarch64 GENERIC  
>  Note regarding arm/armv6 images: For convenience for those without console access to the system, a freebsd user with a password of freebsd is available by default for ssh(1) access. Additionally, the root user password is set to root. It is strongly recommended to change the password for both users after gaining access to the system.
>
>

* The [full schedule](https://www.freebsd.org/releases/11.1R/schedule.html) for 11.1-RELEASE is here, the final release is expected at the end of July
* It was also announced there will be a 10.4-RELEASE [scheduled for October](https://www.freebsd.org/releases/10.4R/schedule.html) \*\*\*

### [KARL – kernel address randomized link](https://marc.info/?l=openbsd-tech&m=149732026405941&w=2) ###

>
>
> Over the last three weeks I've been working on a new randomization feature which will protect the kernel.  
>  The situation today is that many people install a kernel binary from OpenBSD, and then run that same kernel binary for 6 months or more. We have substantial randomization for the memory allocations made by the kernel, and for userland also of course.  
>  Previously, the kernel assembly language bootstrap/runtime locore.S was compiled and linked with all the other .c files of the kernel in a deterministic fashion. locore.o was always first, then the .c files order specified by our config(8) utility and some helper files.  
>  In the new world order, locore is split into two files: One chunk is bootstrap, that is left at the beginning. The assembly language runtime and all other files are linked in random fashion. There are some other pieces to try to improve the randomness of the layout.  
>  As a result, every new kernel is unique. The relative offsets between functions and data are unique.  
>  It still loads at the same location in KVA. This is not kernel ASLR! ASLR is a concept where the base address of a module is biased to a random location, for position-independent execution. In this case, the module itself is perturbed but it lands at the same location, and  
>  does not need to use position-independent execution modes.
>
>

---

### [LLDB: Sanitizing the debugger's runtime](https://blog.netbsd.org/tnf/entry/lldb_sanitizing_the_debugger_s) ###

* The good

>
>
> Besides the greater enhancements this month I performed a cleanup in the ATF ptrace(2) tests again. Additionally I have managed to unbreak the LLDB Debug build and to eliminate compiler warnings in the NetBSD Native Process Plugin. It is worth noting that LLVM can run tests on NetBSD again, the patch in gtest/LLVM has been installed by Joerg Sonnenberg and a more generic one has been submitted to the upstream googletest repository. There was also an improvement in ftruncate(2) on the LLVM side (authored by Joerg).  
>  Since LLD (the LLVM linker) is advancing rapidly, it improved support for NetBSD and it can link a functional executable on NetBSD. I submitted a patch to stop crashing it on startup anymore. It was nearly used for linking LLDB/NetBSD and it spotted a real linking error... however there are further issues that need to be addressed in the future. Currently LLD is not part of the mainline LLDB tasks - it's part of improving the work environment. This linker should reduce the linking time - compared to GNU linkers - of LLDB by a factor of 3x-10x and save precious developer time. As of now LLDB linking can take minutes on a modern amd64 machine designed for performance.
>
>

* Kernel correctness

>
>
> I have researched (in pkgsrc-wip) initial support for multiple threads in the NetBSD Native Process Plugin. This code revealed - when running the LLDB regression test-suite - new kernel bugs. This unfortunately affects the usability of a debugger in a multithread environment in general and explains why GDB was never doing its job properly in such circumstances. One of the first errors was asserting kernel panic with PT\_\*STEP, when a debuggee has more than a single thread. I have narrowed it down to lock primitives misuse in the do\_ptrace() kernel code. The fix has been committed.
>
>

* The bad

>
>
> Unfortunately this is not the full story and there is further mandatory work.  
>  LLDB acceleration  
>  The EV\_SET() bug broke upstream LLDB over a month ago, and during this period the debugger was significantly accelerated and parallelized. It is difficult to declare it definitely, but it might be the reason why the tracer's runtime broke due to threading desynchronization. LLDB behaves differently when run standalone, under ktruss(1) and under gdb(1) - the shared bug is that it always fails in one way or another, which isn't trivial to debug.
>
>

* The ugly

>
>
> There are also unpleasant issues at the core of the Operating System.  
>  Kernel troubles  
>  Another bug with single-step functions that affects another aspect of correctness - this time with reliable execution of a program - is that processes die in non-deterministic ways when single-stepped. My current impression is that there is no appropriate translation between process and thread (LWP) states under a debugger. These issues are sibling problems to unreliable PT\_RESUME and PT\_SUSPEND.  
>  In order to be able to appropriately address this, I have diligently studied this month the Solaris Internals book to get a better image of the design of the NetBSD kernel multiprocessing, which was modeled after this commercial UNIX.
>
>

* Plan for the next milestone

>
>
> The current troubles can be summarized as data races in the kernel and at the same time in LLDB. I have decided to port the LLVM sanitizers, as I require the Thread Sanitizer (tsan). Temporarily I have removed the code for tracing processes with multiple threads to hide the known kernel bugs and focus on the LLDB races.  
>  Unfortunately LLDB is not easily bisectable (build time of the LLVM+Clang+LLDB stack, number of revisions), therefore the debugging has to be performed on the most recent code from upstream trunk.
>
>

---

### d2K17 Hackathon Reports ###

* [d2k17 Hackathon Report: Ken Westerback on XS\_NO\_CCB removal and dhclient link detection](http://undeadly.org/cgi?action=article&sid=20170605225415)
* [d2k17 Hackathon Report: Antoine Jacoutot on rc.d, syspatch, and more](http://undeadly.org/cgi?action=article&sid=20170608074033)
* [d2k17 Hackathon Report: Florian Obser on slaacd(8)](http://undeadly.org/cgi?action=article&sid=20170609013548)
* [d2k17 Hackathon Report: Stefan Sperling on USB audio, WiFi Progress](http://undeadly.org/cgi?action=article&sid=20170602014048)

---

News Roundup
----------

### [Multi-tenant router or firewall with FreeBSD](https://bsdrp.net/documentation/examples/multi-tenant_router_and_firewall) ###

* Setting-up a virtual lab
* Downloading BSD Router Project images
* Download BSDRP serial image (prevent to have to use an X display) on Sourceforge.
* Download Lab scripts

>
>
> More information on these BSDRP lab scripts available on [How to build a BSDRP router lab](https://bsdrp.net/documentation/examples/how_to_build_a_bsdrp_router_lab).
>
>

* Start the lab with full-meshed 5 routers and one shared LAN, on this example using bhyve lab script on FreeBSD:

`[root@FreeBSD]~# tools/BSDRP-lab-bhyve.sh -i BSDRP-1.71-full-amd64-serial.img.xz -n 5 -l 1`

* **Configuration**
* Router 4 (R4) hosts the 3 routers/firewalls for each 3 customers.
* Router 1 (R1) belongs to customer 1, router 2 (R2) to customer 2 and router 3 (R3) to customer 3.
* Router 5 (R5) simulates a simple Internet host
* Using pf firewall in place of ipfw

>
>
> pf need a little more configuration because by default /dev/pf is hidden from jail. Then, on the host we need to:
>
>

* In place of loading the ipfw/ipfw-nat modules we need to load the pf module (but still disabling pf on our host for this example)
* Modify default devd rules for allowing jails to see /dev/pf (if you want to use tcpdump inside your jail, you should use bpf device too)
* Replacing nojail tag by nojailvnet tag into /etc/rc.d/pf ([already done into BSDRP](https://github.com/ocochard/BSDRP/blob/master/BSDRP/patches/freebsd.pf.rc.jail.patch))
* Under the hood: jails-on-nanobsd
* [BSDRP's tenant shell script](https://github.com/ocochard/BSDRP/blob/master/BSDRP/Files/usr/local/sbin/tenant) creates jail configuration compliant with a host running nanobsd. Then these jails need to be configured for a nanobsd:
* Being nullfs based for being hosted on a read-only root filesystem
* Have their /etc and /var into tmpfs disks (then we need to populate these directory before each start)
* Configuration changes need to be saved with nanobsd configuration tools, like “config save” on BSDRP
* And on the host:
* [autosave daemon](https://github.com/ocochard/BSDRP/blob/master/BSDRP/Files/usr/local/sbin/autosave) need to be enabled: Each time a customer will issue a “config save” inside a jail, his configuration diffs will be save into host's /etc/jails/. And this directory is a RAM disk too, then we need to automatically save hosts configuration on changes. \*\*\*

### [OpenBSD Daily Source Reading](https://blog.tintagel.pl/2017/06/09/openbsd-daily.html) ###

* Adam Wołk writes:

>
>
> I made a new year's resolution to read at least one C source file from OpenBSD daily. The goal was to both get better at C and to contribute more to the base system and userland development. I have to admit that initially I wasn’t consistent with it at all. In the first quarter of the year I read the code of a few small base utilities and nothing else. Still, every bit counts and it’s never too late to get better.  
>  Around the end of May, I really started reading code daily - no days skipped. It usually takes anywhere between ten minutes (for small base utils) and one and a half hour (for targeted reads). I’m pretty happy with the results so far. Exploring the system on a daily basis, looking up things in the code that I don’t understand and digging as deep as possible made me learn a lot more both about C and the system than I initially expected.  
>  There’s also one more side effect of reading code daily - diffs. It’s easy to spot inconsistencies, outdated code or an incorrect man page. This results in opportunities for contributing to the project. With time it also becomes less opportunitstic and more goal oriented. You might start with a [[https://marc.info/?l=openbsd-tech&m=149591302814638&w=2](drive](https://marc.info/?l=openbsd-tech&m=149591302814638&w=2](drive) by diff to kill) optional compilation of an old compatibility option in chown that has been compiled in by default since 1995.  
>  Soon the contributions become more targeted, for example using a new API for encrypting passwords in the htpasswd utility after reading the code of the utility and the code for htpasswd handling in httpd. Similarly it can take you from discussing a doas feature idea with a friend to implementing it after reading the code.  
>  I was having a lot of fun reading code daily and started to recommend it to people in general discussions. There was one particular twitter thread that ended up starting something new.  
>  This is still a new thing and the format is not yet solidified. Generally I make a lot of notes reading code, instead of slapping them inside a local file I drop the notes on the IRC channel as I go. Everyone on the channel is encouraged to do the same or share his notes in any way he/she seems feasable.
>
>

* Check out the logs from the IRC discussions.
* Start reading code from other BSD projects and see whether you can replicate their results! \*\*\*

### [Become FreeBSD User: Find Useful Tools](https://bsdmag.org/become-freebsd-user-find-useful-tools/) ###

* BSD Mag has the following article by David Carlier:

>
>
> If you’re usually programming on Linux and you consider a potential switch to FreeBSD, this article will give you an overview of the possibilities.
>
>

* How to Install the Dependencies

>
>
> FreeBSD comes with either applications from binary packages or compiled from sources (ports). They are arranged according to software types (programming languages mainly in lang (or java specifically for Java), libraries in devel, web servers in www …) and the main tool for modern FreeBSD versions is pkg, similar to Debian apt tools suite. Hence, most of the time if you are looking for a specific application/library, simply
>
>
>
> `pkg search <name>`
>
>
>
> without necessarily knowing the fully qualified name of the package. It is somehow sufficient. For example pkg search php7 will display php7 itself and the modules. Furthermore, php70 specific version and so on.
>
>

* Web Development

>
>
> Basically, this is the easiest area to migrate to. Most Web languages do not use specific platform features. Thus, most of the time, your existing projects might just be “drop-in” use cases.  
>  If your language of choice is PHP, you are lucky as this scripting language is workable on various operating systems, on most Unixes and Windows. In the case of FreeBSD, you have even many different ports or binary package versions (5.6 to 7.1). In this case, you may need some specific PHP modules enabled, luckily they are available atomically, or if the port is the way you chose, it is via the www/php70-extensions’s one.  
>  Of course developing with Apache (both 2.2 and 2.4 series are available, respectively www/apache22 and www/apache24 packages), or even better with Nginx (the last stable or the latest development versions could be used, respectively www/nginx and www/nginx-devel packages) via php-fpm is possible.  
>  In terms of databases, we have the regular RDMBS like MySQL and PostgreSQL (client and server are distinct packages … databases/(mysql/portgresql)-client, and databases/(mysql/postgresql)-server). Additionally, a more modern concept of NoSQL with CouchDB, for example (databases/couchdb), MongoDB (databases/mongodb), and Cassandra (databases/cassandra), to name but a few.
>
>

* Low-level Development

>
>
> The BSDs are shipped with C and C++ compilers in the base. In the case of FreeBSD 11.0, it is clang 3.8.0 (in x86 architectures) otherwise, modern versions of gcc exist for developing with C++11. Examples are of course available too (lang/gcc … until gcc 7.0 devel).  
>  Numerous libraries for various topics are also present, web services SOAP with gsoap through User Interfaces with GTK (x11-toolkits/gtk), QT4 or QT 5 (devel/qt), malware libraries with Yara (security/yara), etc.
>
>

* Android / Mobile Development

>
>
> To be able to do Android development, to a certain degree, the Linux’s compatibility layer (aka linuxulator) needs to be enabled. Also, x11-toolkits/swt and linux-f10-gtk2 port/package need to be installed (note that libswt-gtk-3550.so and libswt-pi-gtk-3550.so are necessary. The current package is versioned as 3557 and can be solved using symlinks). In the worst case scenario, remember that bhyve (or Virtualbox) is available, and can run any Linux distribution efficiently.
>
>

* Source Control Management

>
>
> FreeBSD comes in base with a version of subversion. As FreeBSD source is in a subversion repository, a prefixed svnlite command prevents conflicts with the package/port.  
>  Additionally, Git is present but via the package/port system with various options (with or without a user interface, subversion support).
>
>

* Conclusion

>
>
> FreeBSD has made tremendous improvements over the years to fill the gap created by Linux. FreeBSD still maintains its interesting specificities; hence there will not be too much blockers if your projects are reasonably sized to allow a migration to FreeBSD.
>
>
> ---
>

### [Notes from project Aeronix, part 10](https://martin.kopta.eu/blog/#2017-06-11-16-07-26) ###

* Prologue

>
>
> It is almost two years since I finished building Aeronix and it has served me well during that time. Only thing that ever broke was Noctua CPU fan, which I have replaced with the same model. However, for long time, I wanted to run Aeronix on OpenBSD instead of GNU/Linux Debian.
>
>

* Preparation

>
>
> I first experimented with RAID1 OpenBSD setup in VirtualBox, plugging and unplugging drives and learned that OpenBSD RAID1 is really smooth. When I finally got the courage, I copied all the data on two drives outside of Aeronix. One external HDD I regulary use to backup Aeronix and second internal drive in my desktop computer. Copying the data took about two afternoons. Aeronix usually has higher temperatures (somewhere around 55°C or 65°C depending on time of the year), and when stressed, it can go really high (around 75°C). During full speed copy over NFS and to external drive it went as high as 85°C, which made me a bit nervous. After the data were copied, I temporarily un-configured computers on local network to not touch Aeronix, plugged keyboard, display and OpenBSD 6.1 thumb drive. Installing OpenBSD 6.1 on full disk RAID1 was super easy.
>
>

* Configuring NFS

>
>
> Aeronix serves primarily as NAS, which means NFS and SMB. NFS is used by computers in local network with persistent connection (via Ethernet). SMB is used by other devices in local network with volatile connection (via WiFi). When configuring NFS, I expected similar configuration to what I had in Debian, but on OpenBSD, it is very different. However, after reading through exports(5), it was really easy to put it together.
>
>

* Putting the data back

>
>
> Copying from the external drive took few days, since the transfer speed was something around 5MB/s. I didn't really mind. It was sort of a good thing, because Aeronix wasn't overheating that way. I guess I need to figure new backup strategy though.  
>  One interesting thing happened with one of my local desktops. It was connecting Aeronix with default NFS mount options (on Archlinux) and had really big troubles with reading anything. Basically it behaved as if the network drive had horrible access times. After changing the default mount options, it started working perfectly.
>
>

* Conclusion

>
>
> Migrating to OpenBSD was way easier than I anticipated. There are various benefits like more security, realiable RAID1 setup (which I know how will work when drive dies), better documentation and much more. However, the true benefit for me is just the fact I like OpenBSD and makes me happy to have one more OpenBSD machine. On to the next two years of service!
>
>

---

Beastie Bits
----------

* [Running OpenBSD on Azure](http://undeadly.org/cgi?action=article&sid=20170609121413&mode=expanded&count=0)
* [Mondieu - portable alternative for freebsd-update](https://github.com/skoef/mondieu)
* [Plan9-9k: 64-bit Plan 9](https://bitbucket.org/forsyth/plan9-9k)
* [Installing OpenBSD 6.1 on your laptop is really hard (not)](http://sohcahtoa.org.uk/openbsd.html)
* [UbuntuBSD is dead](http://www.ubuntubsd.org/)
* [OPNsense 17.1.8 released](https://opnsense.org/opnsense-17-1-8-released/) \*\*\*

Feedback/Questions
----------

* [Patrick - Operating System Textbooks](http://dpaste.com/2DKXA0T#wrap)
* [Brian - snapshot retention](http://dpaste.com/3CJGW22#wrap)
* [Randy - FreeNAS to FreeBSD](http://dpaste.com/2X3X6NR#wrap)
* [Florian - Bootloader Resolution](http://dpaste.com/1AE2SPS#wrap) \*\*\*