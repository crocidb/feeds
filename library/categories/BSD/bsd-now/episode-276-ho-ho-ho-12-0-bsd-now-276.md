+++
title = "Episode 276: Ho, Ho, Ho - 12.0 | BSD Now 276"
description = 'FreeBSD 12.0 is finally here, partly-cloudy IPsec VPN, KLEAK with NetBSD, How to create synth repos, GhostBSD author interview, and more.\Headlines   \FreeBSD 12.0 is available* After a long release cycle, the wait is o'
date = "2018-12-13T09:15:00Z"
url = "https://www.bsdnow.tv/276"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.679316875Z"
seen = false
+++

FreeBSD 12.0 is finally here, partly-cloudy IPsec VPN, KLEAK with NetBSD, How to create synth repos, GhostBSD author interview, and more.

\##Headlines  
 \###[FreeBSD 12.0 is available](https://www.freebsd.org/releases/12.0R/relnotes.html)

* After a long release cycle, the wait is over: FreeBSD 12.0 is now officially available.
* We’ve picked a few interesting things to cover in the show, make sure to read the full [Release Notes](https://www.freebsd.org/releases/12.0R/relnotes.html)

>
>
> Userland:  
>  Group permissions on /dev/acpi have been changed to allow users in the operator GID to invoke acpiconf(8) to suspend the system.  
>  The default devfs.rules(5) configuration has been updated to allow mount\_fusefs(8) with jail(8).  
>  The default PAGER now defaults to less(1) for most commands.  
>  The newsyslog(8) utility has been updated to reject configuration entries that specify setuid(2) or executable log files.  
>  The WITH\_REPRODUCIBLE\_BUILD src.conf(5) knob has been enabled by default.  
>  A new src.conf(5) knob, WITH\_RETPOLINE, has been added to enable the retpoline mitigation for userland builds.  
>  Userland applications:  
>  The dtrace(1) utility has been updated to support if and else statements.  
>  The legacy gdb(1) utility included in the base system is now installed to /usr/libexec for use with crashinfo(8). The gdbserver and gdbtui utilities are no longer installed. For interactive debugging, lldb(1) or a modern version of gdb(1) from devel/gdb should be used. A new src.conf(5) knob, WITHOUT\_GDB\_LIBEXEC has been added to disable building gdb(1). The gdb(1) utility is still installed in /usr/bin on sparc64.  
>  The setfacl(1) utility has been updated to include a new flag, -R, used to operate recursively on directories.  
>  The geli(8) utility has been updated to provide support for initializing multiple providers at once when they use the same passphrase and/or key.  
>  The dd(1) utility has been updated to add the status=progress option, which prints the status of its operation on a single line once per second, similar to GNU dd(1).  
>  The date(1) utility has been updated to include a new flag, -I, which prints its output in ISO 8601 formatting.  
>  The bectl(8) utility has been added, providing an administrative interface for managing ZFS boot environments, similar to sysutils/beadm.  
>  The bhyve(8) utility has been updated to add a new subcommand to the -l and -s flags, help, which when used, prints a list of supported LPC and PCI devices, respectively.  
>  The tftp(1) utility has been updated to change the default transfer mode from ASCII to binary.  
>  The chown(8) utility has been updated to prevent overflow of UID or GID arguments where the argument exceeded UID\_MAX or GID\_MAX, respectively.  
>  Kernel:  
>  The ACPI subsystem has been updated to implement Device object types for ACPI 6.0 support, required for some Dell, Inc. Poweredge™ AMD® Epyc™ systems.  
>  The amdsmn(4) and amdtemp(4) drivers have been updated to attach to AMD® Ryzen 2™ host bridges.  
>  The amdtemp(4) driver has been updated to fix temperature reporting for AMD® 2990WX CPUs.  
>  Kernel Configuration:  
>  The VIMAGE kernel configuration option has been enabled by default.  
>  The dumpon(8) utility has been updated to add support for compressed kernel crash dumps when the kernel configuration file includes the GZIO option. See rc.conf(5) and dumpon(8) for additional information.  
>  The NUMA option has been enabled by default in the amd64 GENERIC and MINIMAL kernel configurations.  
>  Device Drivers:  
>  The random(4) driver has been updated to remove the Yarrow algorithm. The Fortuna algorithm remains the default, and now only, available algorithm.  
>  The vt(4) driver has been updated with performance improvements, drawing text at rates ranging from 2- to 6-times faster.  
>  Deprecated Drivers:  
>  The lmc(4) driver has been removed.  
>  The ixgb(4) driver has been removed.  
>  The nxge(4) driver has been removed.  
>  The vxge(4) driver has been removed.  
>  The jedec\_ts(4) driver has been removed in 12.0-RELEASE, and its functionality replaced by jedec\_dimm(4).  
>  The DRM driver for modern graphics chipsets has been marked deprecated and marked for removal in FreeBSD 13. The DRM kernel modules are available from graphics/drm-stable-kmod or graphics/drm-legacy-kmod in the Ports Collection as well as via pkg(8). Additionally, the kernel modules have been added to the lua loader.conf(5) module\_blacklist, as installation from the Ports Collection or pkg(8) is strongly recommended.  
>  The following drivers have been deprecated in FreeBSD 12.0, and not present in FreeBSD 13.0: ae(4), de(4), ed(4), ep(4), ex(4), fe(4), pcn(4), sf(4), sn(4), tl(4), tx(4), txp(4), vx(4), wb(4), xe(4)  
>  Storage:  
>  The UFS/FFS filesystem has been updated to support check hashes to cylinder-group maps. Support for check hashes is available only for UFS2.  
>  The UFS/FFS filesystem has been updated to consolidate TRIM/BIO\_DELETE commands, reducing read/write requests due to fewer TRIM messages being sent simultaneously.  
>  TRIM consolidation support has been enabled by default in the UFS/FFS filesystem. TRIM consolidation can be disabled by setting the vfs.ffs.dotrimcons sysctl(8) to 0, or adding vfs.ffs.dotrimcons=0 to sysctl.conf(5).  
>  NFS:  
>  The NFS version 4.1 server has been updated to include pNFS server support.  
>  ZFS:  
>  ZFS has been updated to include new sysctl(8)s, vfs.zfs.arc\_min\_prefetch\_ms and vfs.zfs.arc\_min\_prescient\_prefetch\_ms, which improve performance of the zpool(8) scrub subcommand.  
>  The new spacemap\_v2 zpool feature has been added. This provides more efficient encoding of spacemaps, especially for full vdev spacemaps.  
>  The large\_dnode zpool feature been imported, allowing better compatibility with pools created under ZFS-on-Linux 0.7.x  
>  Many bug fixes have been applied to the device removal feature. This feature allows you to remove a non-redundant or mirror vdev from a pool by relocating its data to other vdevs.  
>  Includes the fix for PR 229614 that could cause processes to hang in zil\_commit()  
>  Boot Loader Changes:  
>  The lua loader(8) has been updated to detect a list of installed kernels to boot.  
>  The loader(8) has been updated to support geli(8) for all architectures and all disk-like devices.  
>  The loader(8) has been updated to add support for loading Intel® microcode updates early during the boot process.
>
>
>
> Networking:  
>  The pf(4) packet filter is now usable within a jail(8) using vnet(9).  
>  The pf(4) packet filter has been updated to use rmlock(9) instead of rwlock(9), resulting in significant performance improvements.  
>  The SO\_REUSEPORT\_LB option has been added to the network stack, allowing multiple programs or threads to bind to the same port, and incoming connections load balanced using a hash function.
>
>

* Again, read the release notes for a full list, check out the [errata notices](https://www.freebsd.org/releases/12.0R/errata.html). A big THANKS to the entire release engineering team and all developers involved in the release, much appreciated!

---

\###[Abandon Linux. Move to FreeBSD or Illumos](https://www.adminbyaccident.com/politics/abandon-linux-move-freebsd-illumos/)

>
>
> If you use GNU/Linux and you are only on opensource, you may be doing it wrong. Here’s why.  
>  Is your company based on opensource based software only? Do you have a bunch of developers hitting some kind of server you have installed for them to “do their thing”? Being it for economical reasons (remember to donate), being it for philosophycal ones, you may have skipped good alternatives. The BSD’s and Illumos.  
>  I bet you are running some sort of Debian, openSuSE or CentOS. It’s very discouraging having entered into the IT field recently and discover many of the people you meet do not even recognise the name BSD. Naming Solaris seems like naming the evil itself. The problem being many do not know why. They can’t point anything specific other than it’s fading out. This has recently shown strong when Oracle officials have stated development for new features has ceased and almost 90 % of developers for Solaris have been layed off. AIX seems alien to almost everybody unless you have a white beard. And all this is silly.  
>  And here’s why. You are certainly missing two important features that FreeBSD and Illumos derivatives are enjoying. A full virtualization technology, much better and fully developed compared to the LXC containers in the Linux world, such as Jails on BSD, Zones in Solaris/Illumos, and the great ZFS file system which both share.  
>  You have probably heard of a new Linux filesystem named Btrfs, which by the way, development has been dropped from the Red Hat side. Trying to emulate ZFS, Oracle started developing Btrfs file system before they acquired Sun (the original developer of ZFS), and SuSE joined the effort as well as Red Hat. It is not as well developed as ZFS and it hasn’t been tested in production environments as extensively as the former has. That leaves some uncertainty on using it or not. Red Hat leaving it aside does add some more. Although some organizations have used it with various grades of success.  
>  But why is this anyhow interesting for a sysadmin or any organization? Well… FreeBSD (descendant of Berkeley UNIX) and SmartOS (based on Illumos) aglutinate some features that make administration easier, safer, faster and more reliable. The dream of any systems administrator.  
>  To start, the ZFS filesystem combines the typical filesystem with a volume manager. It includes protection against corruption, snapshots and copy-on-write clones, as well as volume manager.  
>  Jails is another interesting piece of technology. Linux folks usually associate this as a sort of chroot. It isn’t. It is somehow inspired by it but as you may know you can escape from a chroot environment with a blink of an eye. Jails are not called jails casually. The name has a purpose. Contain processes and programs within a defined and totally controlled environment. Jails appeared first in FreeBSD in the year 2000. Solaris Zones debuted on 2005 (now called containers) are the now proprietary version of those.  
>  There are some other technologies on Linux such as Btrfs or Docker. But they have some caveats. Btrfs hasn’t been fully developed yet and it’s hasn’t been proved as much in production environments as ZFS has. And some problems have arisen recently although the developers are pushing the envelope. At some time they will match ZFS capabilities for sure. Docker is growing exponentially and it’s one of the cool technologies of modern times. The caveat is, as before, the development of this technology hasn’t been fully developed. Unlike other virtualization technologies this is not a kernel playing on top of another kernel. This is virtualization at the OS level, meaning differentiated environments can coexist on a single host, “hitting” the same unique kernel which controls and shares the resources. The problem comes when you put Docker on top of any other virtualization technology such as KVM or Xen. It breaks the purpose of it and has a performance penalty.  
>  I have arrived into the IT field with very little knowledge, that is true. But what I see strikes me. Working in a bank has allowed me to see a big production environment that needs the highest of the availability and reliability. This is, sometimes, achieved by bruteforce. And it’s legitime and adequate. Redundancy has a reason and a purpose for example. But some other times it looks, it feels, like killing flies with cannons. More hardware, more virtual machines, more people, more of this, more of that. They can afford it, so they try to maintain the cost low but at the end of the day there is a chunky budget to back operations.  
>  But here comes reality. You’re not a bank and you need to squeeze your investment as much as possible. By using FreeBSD jails you can avoid the performance penalty of KVM or Xen virtualization. Do you use VMWare or Hyper-V? You can avoid both and gain in performance. Not only that, control and manageability are equal as before, and sometimes easier to administer. There are four ways to operate them which can be divided in two categories. Hardcore and Human Being. For the Hardcore use the FreeBSD handbook and investigate as much as you can. For the Human Being way there are three options to use. Ezjail, Iocage and CBSD which are frameworks or programs as you may call to manage jails. I personally use Iocage but I have also used Ezjail.  
>  How can you use jails on your benefit? Ever tried to configure some new software and failed miserably? You can have three different jails running at the same time with different configurations. Want to try a new configuration in a production piece of hardware without applying it on the final users? You can do that with a small jail while the production environment is on in another bigger, chunkier jail.  
>  Want to divide the hardware as a replica of the division of the team/s you are working with? Want to sell virtual machines with bare metal performance? Do you want to isolate some piece of critical software or even data in a more controlled environment? Do you have different clients and you want to use the same hardware but you want to avoid them seeing each other at the same time you maintain performance and reliability?  
>  Are you a developer and you have to have reliable and portable snapshots of your work? Do you want to try new options-designs without breaking your previous work, in a timeless fashion? You can work on something, clone the jail and apply the new ideas on the project in a matter of seconds. You can stop there, export the filesystem snapshot containing all the environment and all your work and place it on a thumbdrive to later import it on a big production system. Want to change that image properties such as the network stack interface and ip? This is just one command away from you.  
>  But what properties can you assign to a jail and how can I manage them you may be wondering. Hostname, disk quota, i/o, memory, cpu limits, network isolation, network virtualization, snapshots and the manage of those, migration and root privilege isolation to name a few. You can also clone them and import and export them between different systems. Some of these things because of ZFS. Iocage is a python program to manage jails and it takes profit from ZFS advantages.  
>  But FreeBSD is not Linux you may say. No it is not. There are no run levels. The systemd factor is out of this equation. This is so since the begginning. Ever wondered where did vi come from? The TCP/IP stack? Your beloved macOS from Apple? All this is coming from the FreeBSD project. If you are used to Linux your adaptation period with any BSD will be short, very short. You will almost feel at home. Used to packaged software using yum or apt-get? No worries. With pkgng, the package management tool used in FreeBSD has almost 27.000 compiled packages for you to use. Almost all software found on any of the important GNU/Linux distros can be found here. Java, Python, C, C++, Clang, GCC, Javascript frameworks, Ruby, PHP, MySQL and the major forks, etc. All this opensource software, and much more, is available at your fingertips.  
>  I am a developer and… frankly my time is money and I appreciate both much more than dealing with systems configuration, etc. You can set a VM using VMWare or VirtualBox and play with barebones FreeBSD or you can use TrueOS (a derivative) which comes in a server version and a desktop oriented one. The latter will be easier for you to play with. You may be doing this already with Linux. There is a third and very sensible option. FreeNAS, developed by iXSystems. It is FreeBSD based and offers all these technologies with a GUI. VMWare, Hyper-V? Nowadays you can get your hands off the CLI and get a decent, usable, nice GUI.  
>  You say you play on the cloud. The major players already include FreeBSD in their offerings. You can find it in Amazon AWS or Azure (with official Microsoft support contracts too!). You can also find it in DigitalOcean and other hosting providers. There is no excuse. You can use it at home, at the office, with old or new hardware and in the cloud as well. You can even pay for a support contract to use it. Joyent, the developers of SmartOS have their own cloud with different locations around the globe. Have a look on them too.  
>  If you want the original of ZFS and zones you may think of Solaris. But it’s fading away. But it really isn’t. When Oracle bouth Sun many people ran away in an stampide fashion. Some of the good folks working at Sun founded new projects. One of these is Illumos. Joyent is a company formed by people who developed these technologies. They are a cloud operator, have been recently bought by Samsung and have a very competent team of people providing great tech solutions. They have developed an OS, called SmartOS (based on Illumos) with all these features. The source from this goes back to the early days of UNIX. Do you remember the days of OpenSolaris when Sun opensourced the crown jewels? There you have it. A modern opensource UNIX operating system with the roots in their original place and the head planted on today’s needs.  
>  In conclusion. If you are on GNU/Linux and you only use opensource software you may be doing it wrong. And missing goodies you may need and like. Once you put your hands on them, trust me, you won’t look back. And if you have some “old fashioned” admins who know Solaris, you can bring them to a new profitable and exciting life with both systems.  
>  Still not convinced? Would you have ever imagined Microsoft supporting Linux? Even loving it? They do love now FreeBSD. And not only that, they provide their own image in the Azure Cloud and you can get Microsoft support, payed support if you want to use the platform on Azure. Ain’t it… surprising? Convincing at all?  
>  PS: I haven’t mentioned both softwares, FreeBSD and SmartOS do have a Linux translation layer. This means you can run Linux binaries on them and the program won’t cough at all. Since the ABI stays stable the only thing you need to run a Linux binary is a translation between the different system calls and the libraries. Remember POSIX? Choose your poison and enjoy it.
>
>

---

\###[A partly-cloudy IPsec VPN](https://bradackerman.com/posts/2018-12-05-bsd-cloudy-vpn/)

* Audience

>
>
> I’m assuming that readers have at least a basic knowledge of TCP/IP networking and some UNIX or UNIX-like systems, but not necessarily OpenBSD or FreeBSD. This post will therefore be light on details that aren’t OS specific and are likely to be encountered in normal use (e.g., how to use vi or another text editor.) For more information on these topics, read Absolute FreeBSD (3ed.) by Michael W. Lucas.
>
>

* Overview

>
>
> I’m redoing my DigitalOcean virtual machines (which they call droplets). My requirements are:
>
>

* VPN
* Road-warrior access, so I can use private network resources from anywhere.
* A site-to-site VPN, extending my home network to my VPSes.
* Hosting for public and private network services.
* A proxy service to provide a public IP address to services hosted at home.

>
>
> The last item is on the list because I don’t actually have a public IP address at home; my firewall’s external address is in the RFC 1918 space, and the entire apartment building shares a single public IPv4 address.1 (IPv6? Don’t I wish.) The end-state network will include one OpenBSD droplet providing firewall, router, and VPN services; and one FreeBSD droplet hosting multiple jailed services.  
>  I’ll be providing access via these droplets to a NextCloud instance at home. A simple NAT on the DO router droplet isn’t going to work, because packets going from home to the internet would exit through the apartment building’s connection and not through the VPN. It’s possible that I could do work around this issue with packet tagging using the pf firewall, but HAProxy is simple to configure and unlikely to result in hard-to-debug problems. relayd is also an option, but doesn’t have the TLS parsing abilities of HAProxy, which I’ll be using later on.  
>  Since this system includes jails running on a VPS, and they’ve got RFC 1918 addresses, I want them reachable from my home network. Once that’s done, I can access the private address space from anywhere through a VPN connection to the cloudy router.  
>  The VPN itself will be of the IPsec variety. IPsec is the traditional enterprise VPN standard, and is even used for classified applications, but has a (somewhat-deserved) reputation for complexity, but recent versions of OpenBSD turn down the difficulty by quite a bit.
>
>

* The end-state network should look like: [https://d33wubrfki0l68.cloudfront.net/0ccf46fb057e0d50923209bb2e2af0122637e72d/e714e/201812-cloudy/endstate.svg](https://d33wubrfki0l68.cloudfront.net/0ccf46fb057e0d50923209bb2e2af0122637e72d/e714e/201812-cloudy/endstate.svg)

>
>
> This VPN both separates internal network traffic from public traffic and uses encryption to prevent interception or tampering.  
>  Once traffic has been encrypted, decrypting it without the key would, as Bruce Schneier once put it, require a computer built from something other than matter that occupies something other than space. Dyson spheres and a frakton of causality violation would possibly work, as would mathemagical technology that alters the local calendar such that P=NP.2 Black-bag jobs and/or suborning cloud provider employees doesn’t quite have that guarantee of impossibility, however. If you have serious security requirements, you’ll need to do better than a random blog entry.
>
>

---

\##News Roundup  
 \###[KLEAK: Practical Kernel Memory Disclosure Detection](https://netbsd.org/gallery/presentations/maxv/kleak.pdf)

>
>
> Modern operating systems such as NetBSD, macOS, and Windows isolate their kernel from userspace programs to increase fault tolerance and to protect against malicious manipulations [10]. User space programs have to call into the kernel to request resources, via system calls or ioctls. This communication between user space and kernel space crosses a security boundary. Kernel memory disclosures - also known as kernel information leaks - denote the inadvertent copying of uninitialized bytes from kernel space to user space. Such disclosed memory may contain cryptographic keys, information about the kernel memory layout, or other forms of secret data. Even though kernel memory disclosures do not allow direct exploitation of a system, they lay the ground for it.  
>  We introduce KLEAK, a simple approach to dynamically detect kernel information leaks. Simply said, KLEAK utilizes a rudimentary form of taint tracking: it taints kernel memory with marker values, lets the data travel through the kernel and scans the buffers exchanged between the kernel and the user space for these marker values. By using compiler instrumentation and rotating the markers at regular intervals, KLEAK significantly reduces the number of false positives, and is able to yield relevant results with little effort.  
>  Our approach is practically feasible as we prove with an implementation for the NetBSD kernel. A small performance penalty is introduced, but the system remains usable. In addition to implementing KLEAK in the NetBSD kernel, we applied our approach to FreeBSD 11.2. In total, we detected 21 previously unknown kernel memory disclosures in NetBSD-current and FreeBSD 11.2, which were fixed subsequently. As a follow-up, the projects’ developers manually audited related kernel areas and identified dozens of other kernel memory disclosures.  
>  The remainder of this paper is structured as follows. Section II discusses the bug class of kernel memory disclosures. Section III presents KLEAK to dynamically detect instances of this bug class. Section IV discusses the results of applying KLEAK to NetBSD-current and FreeBSD 11.2. Section V reviews prior research. Finally, Section VI concludes this paper.
>
>

---

\###[How To Create Official Synth Repo](https://www.dragonflybsd.org/docs/howtos/How_To_Create_Official_Synth_Repo/)

* System Environment

* Make sure /usr/dports is updated and that it contains no cruft (git pull; git status). Remove any cruft.

* Make sure your ‘synth’ is up-to-date ‘pkg upgrade synth’. If you already updated your system you may have to build synth from scratch, from /usr/dports/ports-mgmt/synth.

* Make sure /etc/make.conf is clean.

* Update /usr/src to the current master, make sure there is no cruft in it

* Do a full buildworld, buildkernel, installkernel and installworld

* Reboot

* After the reboot, before proceeding, run ‘uname -a’ and make sure you are now on the desired release or development kernel.

* Synth Environment

* /usr/local/etc/synth/ contains the synth configuration. It should contain a synth.ini file (you may have to rename the template), and you will have to create or edit a LiveSystem-make.conf file.

* System requirements are hefty. Just linking chromium alone eats at least 30GB, for example. Concurrent c++ compiles can eat up to 2GB per process. We recommend at least 100GB of SSD based swap space and 300GB of free space on the filesystem.

* synth.ini should contain this. Plus modify the builders and jobs to suit your system. With 128G of ram, 30/30 or 40/25 works well. If you have 32G of ram, maybe 8/8 or less.

`; Take care when hand editing!`  
``  
`[Global Configuration]`  
`profile_selected= LiveSystem`  
``  
`[LiveSystem]`  
`Operating_system= DragonFly`  
`Directory_packages= /build/synth/live_packages`  
`Directory_repository= /build/synth/live_packages/All`  
`Directory_portsdir= /build/synth/dports`  
`Directory_options= /build/synth/options`  
`Directory_distfiles= /usr/distfiles`  
`Directory_buildbase= /build/synth/build`  
`Directory_logs= /build/synth/logs`  
`Directory_ccache= disabled`  
`Directory_system= /`  
`Number_of_builders= 30`  
`Max_jobs_per_builder= 30`  
`Tmpfs_workdir= true`  
`Tmpfs_localbase= true`  
`Display_with_ncurses= true`  
`leverage_prebuilt= false`

* LiveSystem-make.conf should contain one line to restrict licensing to only what is allowed to be built as a binary package:

`LICENSES_ACCEPTED= NONE`

* Make sure there is no other cruft in /usr/local/etc/synth/

* In the example above, the synth working dirs are in “/build/synth”. Make sure the base directories exist. Clean out any cruft for a fresh build from-scratch:

`rm -rf /build/synth/live_packages/*`  
`rm -rf /build/synth/logs`  
`mkdir /build/synth/logs`

* Run synth everything. I recommend doing this in a ‘screen’ session in case you lose your ssh session (assuming you are ssh’d into the build machine).

`(optionally start a screen session)`  
`synth everything`

* A full synth build takes over 24 hours to run on a 48-core box, around 12 hours to run on a 64-core box. On a 4-core/8-thread box it will take at least 3 days. There will be times when swap space is heavily used. If you have not run synth before, monitor your memory and swap loads to make sure you have configured the jobs properly. If you are overloading the system, you may have to ^C the synth run, reduce the jobs, and start it again. It will pick up where it left off.
* When synth finishes, let it rebuild the database. You then have a working binary repo.
* It is usually a good idea to run synth several times to pick up any stuff it couldn’t build the first time. Each of these incremental runs may take a few hours, depending on what it tries to build.

---

\###[Interview with founder and maintainer of GhostBSD, Eric Turgeon](https://www.freebsdbytes.com/2018/11/interview-eric-turgeon-founder-maintainer-ghostbsd/)

* Thanks you Eric for taking part. To start off, could you tell us a little about yourself, just a bit of background?
* How did you become interested in open source?
* When and how did you get interested in the BSD operating systems?
* On your Twitter profile, you state that you are an automation engineer at iXsystems. Can you share what you do in your day-to-day job?
* You are the founder and project lead of GhostBSD. Could you describe GhostBSD to those who have never used it or never heard of it?
* Developing an operating system is not a small thing. What made you decide to start the GhostBSD project and not join another “desktop FreeBSD” related project, such as PC-BSD and DesktopBSD at the time?
* How did you get to the name GhostBSD? Did you consider any other names?
* You recently released GhostBSD 18.10? What’s new in that version and what are the key features? What has changed since GhostBSD 11.1?
* The current version is 18.10. Will the next version be 19.04 (like Ubuntu’s version numbering), or is a new version released after the next stable TrueOS release
* Can you tell us something about the development team? Is it yourself, or are there other core team members? I think I saw two other developers on your Github project page.
* How about the relationship with the community? Is it possible for a community member to contribute, and how are those contributions handled?
* What was the biggest challenge during development?
* If you had to pick one feature readers should check out in GhostBSD, what is it and why?
* What is the relationship between iXsystems and the GhostBSD project? Or is GhostBSD a hobby project that you run separately from your work at iXsystems?
* What is the relationship between GhostBSD and TrueOS? Is GhostBSD TrueOS with the MATE desktop on top, or are there other modifications, additions, and differences?
* Where does GhostBSD go from here? What are your plans for 2019?
* Is there anything else that wasn’t asked or that you want to share?

---

\##Beastie Bits

* [dialog(1) script to select audio output on FreeBSD](https://twitter.com/gonzoua/status/1071252700023508993)
* [Erlang otp on OpenBSD](http://blog.obligd.com/posts/erlang-otp-on-openbsd.html)
* [Capsicum](https://oshogbo.vexillium.org/blog/57/)
* [https://blog.grem.de/sysadmin/FreeBSD-On-rpi3-With-crochet-2018-10-27-18-00.html](https://blog.grem.de/sysadmin/FreeBSD-On-rpi3-With-crochet-2018-10-27-18-00.html)
* [Introduction to µUBSan - a clean-room reimplementation of the Undefined Behavior Sanitizer runtime](https://blog.netbsd.org/tnf/entry/introduction_to_µubsan_a_clean)
* [pkgsrcCon 2018 in Berlin - Videos](https://pkgsrc.org/pkgsrcCon/2018/talks.html)
* [Getting started with drm-kmod](https://freebsddesktop.github.io/2018/12/08/drm-kmod-primer.html)

---

\##Feedback/Questions

* Malcolm - [Show segment idea](http://dpaste.com/28PYSGK)
* Fraser - [Question: FreeBSD official binary package options](http://dpaste.com/38W3PRB)
* Harri - [BSD Magazine](http://dpaste.com/3SENZ7H#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---