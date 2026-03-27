+++
title = "190: The Moore You Know"
description = "This week, we look forward with the latest OpenBSD release, look back with Dennis Ritchies paper on the evolution of Unix Time Sharing, have an Interview with KrisThis episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1"
date = "2017-04-19T12:00:00Z"
url = "https://www.bsdnow.tv/190"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.911012407Z"
seen = false
+++

This week, we look forward with the latest OpenBSD release, look back with Dennis Ritchies paper on the evolution of Unix Time Sharing, have an Interview with Kris

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[ href="http://www.digitalocean.com/" title="DigitalOcean"\>![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)]()[ href="http://www.tarsnap.com/bsdnow" title="Tarsnap"\>![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)]()

---

### [OpenBSD 6.1 RELEASED](http://undeadly.org/cgi?action=article&sid=20170411132956) ###

* [Mailing list post](https://marc.info/?l=openbsd-announce&m=149191716921690&w=2')
* We are pleased to announce the official release of OpenBSD 6.1. This is our 42nd release.
* New/extended platforms:
  * New arm64 platform, using clang(1) as the base system compiler.
  * The loongson platform now supports systems with Loongson 3A CPU and RS780E chipset.
  * The following platforms were retired: armish, sparc, zaurus

* New vmm(4)/ vmd(8)
* IEEE 802.11 wireless stack improvements
* Generic network stack improvements
* Installer improvements
* Routing daemons and other userland network improvements
* Security improvements
* dhclient(8)/ dhcpd(8)/ dhcrelay(8) improvements
* Assorted improvements
* OpenSMTPD 6.0.0
* OpenSSH 7.4
* LibreSSL 2.5.3
* mandoc 1.14.1 \*\*\*

### [Fuzz Testing OpenSSH](http://vegardno.blogspot.ca/2017/03/fuzzing-openssh-daemon-using-afl.html) ###

* Vegard Nossum writes a blog post explaining how to fuzz OpenSSH using AFL
* It starts by compiling AFL and SSH with LLVM to get extra instrumentation to make the fuzzing process better, and faster
* Sandboxing, PIE, and other features are disabled to increase debuggability, and to try to make breaking SSH easier
* Privsep is also disabled, because when AFL does make SSH crash, the child process crashing causes the parent process to exit normally, and AFL then doesnt realize that a crash has happened. A one-line patch disables the privsep feature for the purposes of testing
* A few other features are disabled to make testing easier (disabling replay attack protection allows the same inputs to be reused many times), and faster:
  * the local arc4random\_buf() is patched to return a buffer of zeros
  * disabling CRC checks
  * disabling MAC checks
  * disabling encryption (allow the NULL cipher for everything)
  * add a call to \_\_AFL\_INIT(), to enable deferred forkserver mode
  * disabling closefrom()
  * Skipping expensive DH/curve and key derivation operations

* Then, you can finally get around to writing some test cases
* The steps are all described in detail
* In one day of testing, the author found a few NULL dereferences that have since been fixed.
* Maybe you can think of some other code paths through SSH that should be tested, or want to test another daemon \*\*\*

### [Getting OpenBSD running on Raspberry Pi 3](http://undeadly.org/cgi?action=article&sid=20170409123528) ###

>
>
> Ian Darwin writes in about his work deploying the arm64 platform and the Raspberry Pi 3  
>  So I have this empty white birdhouse-like thing in the yard, open at the front. It was intended to house the wireless remote temperature sensor from a low-cost weather station, which had previously been mounted on a dark-colored wall of the house [...]. But when I put the sensor into the birdhouse, the signal is too weak for the weather station to receive it (the mounting post was put in place by a previous owner of our property, and is set deeply in concrete). So the next plan was to pop in a tiny OpenBSD computer with a uthum(4) temperature sensor and stream the temperature over WiFi.  
>  The Raspberry Pi computers are interesting in their own way: intending to bring low-cost computing to everybody, they take shortcuts and omit things that you'd expect on a laptop or desktop. They aren't too bright on their own: there's very little smarts in the board compared to the "BIOS" and later firmwares on conventional systems. Some of the "smarts" are only available as binary files. This was part of the reason that our favorite OS never came to the Pi Party for the original rpi, and didn't quite arrive for the rpi2. With the rpi3, though, there is enough availability that our devs were able to make it boot. Some limitations remain, though: if you want to build your own full release, you have to install the dedicated raspberrypi-firmware package from the ports tree. And, the boot disks have to have several extra files on them - this is set up on the install sets, but you should be careful not to mess with these extra files until you know what you're doing!
>
>
>
> But wait! Before you read on, please note that, as of April 1, 2017, this platform boots up but is not yet ready for prime time:
>
>

* there's no driver for SD/MMC but that's the only thing the hardware can level-0 boot from, so you need both the uSD card and a USB disk, at least while getting started;
* there is no support for the built-in WiFi (a Broadcom BCM43438 SDIO 802.11), so you have to use wired Ethernet or a USB WiFi dongle (for my project an old MSI that shows up as ural(4) seems to work fine);
* the HDMI driver isn't used by the kernel (if a monitor is plugged in uBoot will display its messages there), so you need to set up cu with a 3V serial cable, at least for initial setup.
* the ports tree isn't ready to cope with the base compiler being clang yet, so packages are "a thing of the future"

>
>
> But wait - there's more! The "USB disk" can be a USB thumb drive, though they're generally slower than a "real" disk. My first forays used a Kingston DTSE9, the hardy little steel-cased version of the popular DataTraveler line. I was able to do the install, and boot it, once (when I captured the dmesg output shown below). After that, it failed - the boot process hung with the ever-unpopular "scanning usb for storage devices..." message. I tried the whole thing again with a second DTSE9, and with a 32GB plastic-cased DataTraveler. Same results. After considerable wasted time, I found a post on RPI's own site which dates back to the early days of the PI 3, in which they admit that they took shortcuts in developing the firmware, and it just can't be made to work with the Kingston DataTraveler! Not having any of the "approved" devices, and not living around the corner from a computer store, I switched to a Sabrent USB dock with a 320GB Western Digital disk, and it's been rock solid. Too big and energy-hungry for the final project, but enough to show that the rpi3 can be solid with the right (solid-state) disk. And fast enough to build a few simple ports - though a lot will not build yet. I then found and installed OpenBSD onto a PNY brand thumb drive and found it solid - in fact I populated it by dding from one of the DataTraveller drives, so theyre not at fault.
>
>

* Check out the full article for detailed setup instructions \*\*\*

### [Dennis M. Ritchies Paper: The Evolution of the Unix Time Sharing System](http://www.read.seas.harvard.edu/~kohler/class/aosref/ritchie84evolution.pdf) ###

* From the abstract:

>
>
> This paper presents a brief history of the early development of the Unix operating system. It concentrates on the evolution of the file system, the process-control mechanism, and the idea of pipelined commands. Some attention is paid to social conditions during the development of the system.   
>  During the past few years, the Unix operating system has come into wide use, so wide that its very name has become a trademark of Bell Laboratories. Its important characteristics have become known to many people. It has suffered much rewriting and tinkering since the first publication describing it in 1974 [1], but few fundamental changes. However, Unix was born in 1969 not 1974, and the account of its development makes a little-known and perhaps instructive story. This paper presents a technical and social history of the evolution of the system.
>
>

* High level document structure:

>
>
> Origins  
>  The PDP-7 Unix file system   
>  Process control  
>  IO Redirection  
>  The advent of the PDP-11  
>  The first PDP-11 system  
>  Pipes  
>  High-level languages  
>  Conclusion
>
>
>
> One of the comforting things about old memories is their tendency to take on a rosy glow. The programming environment provided by the early versions of Unix seems, when described here, to be extremely harsh and primitive. I am sure that if forced back to the PDP-7 I would find it intolerably limiting and lacking in conveniences. Nevertheless, it did not seem so at the time; the memory fixes on what was good and what lasted, and on the joy of helping to create the improvements that made life better. In ten years, I hope we can look back with the same mixed impression of progress combined with continuity.
>
>
> ---
>

Interview - Kris Moore - [kris@trueos.org](mailto:kris@trueos.org) | [@pcbsdkris](https://twitter.com/pcbsdkris)
----------

* Director of Engineering at iXSystems
* FreeNAS

---

News Roundup
----------

### [Compressed zfs send / receive now in FreeBSDs vendor area](https://svnweb.freebsd.org/base?view=revision&revision=316894) ###

* Andriy Gapon committed a whole lot of ZFS updates to FreeBSDs vendor area
* This feature takes advantage of the new compressed ARC feature, which means blocks that are compressed on disk, remain compressed in ZFS RAM cache, to use the compressed blocks when using ZFS replication.
* Previously, blocks were uncompressed, sent (usually over the network), then recompressed on the other side.
* This is rather wasteful, and can make the process slower, not just because of the CPU time wasted decompressing/recompressing the data, but because it means more data has to be sent over the network.
* This caused many users to end up doing: zfs send | xz -T0 | ssh unxz | zfs recv, or similar, to compress the data before sending it over the network.
* With this new feature, zfs send with the new -c flag, will transmit the already compressed blocks instead.
* This change also adds longopts versions of all of the zfs send flags, making them easier to understand when written in shell scripts.
* A lot of fixes, man page updates, etc. from upstream OpenZFS
* Thanks to everyone who worked on these fixes and features!
* Well announce when these have been committed to head for testing \*\*\*

### [Granting privileges using the FreeBSD MAC framework ](https://mysteriouscode.io/blog/granting-privileges-using-mac-framework/) ###

* The MAC (Mandatory Access Control) framework allows finer grained permissions than the standard UNIX permissions that exist in the base system

>
>
> FreeBSDs kernel provides quite sophisticated privilege model that extends the traditional UNIX user-and-group one. Here Ill show how to leverage it to grant access to specific privileges to group of non-root users.  
>  mac(9) allows creating pluggable modules with policies that can extend existing base system security definitions. struct mac\_policy\_ops consist of many entry points that we can use to amend the behaviour.  
>  This time, I wanted to grant a privilege to change realtime priority to a selected group. While Linux kernel lets you specify a named group, FreeBSD doesnt have such ability, hence I created this very simple policy.  
>  The privilege check can be extended using two user supplied functions: priv\_check and priv\_grant. The first one can be used to further restrict existing privileges, i.e. you can disallow some specific priv to be used in jails, etc. The second one is used to explicitly grant extra privileges not available for the target in base configuration.  
>  The core of the mac\_rtprio module is dead simple. I defined sysctl tree for two oids: enable (on/off switch for the policy) and gid (the GID target has to be member of), then I specified our custom version of mpo\_priv\_grant called rtprio\_priv\_grant. Body of my granting function is even simpler. If the policy is disabled or the privilege that is being checked is not PRIV\_SCHED\_RTPRIO, we simply skip and return EPERM. If the user is member of the designated group we return 0 thatll allow the action  target would change realtime privileges.
>
>

* Another useful thing the MAC framework can be used to grant to non-root users: PortACL: The ability to bind to TCP/UDP ports less than 1024, which is usually restricted to root.
* Some other uses for the MAC framework are discussed in [The FreeBSD Handbook](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/mac.html)
* However, there are lots more, and we would really like to see more tutorials and documentation on using MAC to make more secure servers, but allowing the few specific things that normally require root access. \*\*\*

### [The Story of the PING Program](http://ftp.arl.army.mil/~mike/ping.html) ###

* This is from the homepage of Mike Muuss:

>
>
> Yes, it's true! I'm the author of ping for UNIX. Ping is a little thousand-line hack that I wrote in an evening which practically everyone seems to know about. :-)  
>  I named it after the sound that a sonar makes, inspired by the whole principle of cho-location. In college I'd done a lot of modeling of sonar and radar systems, so the "Cyberspace" analogy seemed very apt. It's exactly the same paradigm applied to a new problem domain: ping uses timed IP/ICMP ECHO\_REQUEST and ECHO\_REPLY packets to probe the "distance" to the target machine.  
>  My original impetus for writing PING for 4.2a BSD UNIX came from an offhand remark in July 1983 by Dr. Dave Mills while we were attending a DARPA meeting in Norway, in which he described some work that he had done on his "Fuzzball" LSI-11 systems to measure path latency using timed ICMP Echo packets.  
>  In December of 1983 I encountered some odd behavior of the IP network at BRL. Recalling Dr. Mills' comments, I quickly coded up the PING program, which revolved around opening an ICMP style SOCK\_RAW AF\_INET Berkeley-style socket(). The code compiled just fine, but it didn't work -- there was no kernel support for raw ICMP sockets! Incensed, I coded up the kernel support and had everything working well before sunrise. Not surprisingly, Chuck Kennedy (aka "Kermit") had found and fixed the network hardware before I was able to launch my very first "ping" packet. But I've used it a few times since then. *grin* If I'd known then that it would be my most famous accomplishment in life, I might have worked on it another day or two and added some more options.  
>  The folks at Berkeley eagerly took back my kernel modifications and the PING source code, and it's been a standard part of Berkeley UNIX ever since. Since it's free, it has been ported to many systems since then, including Microsoft Windows95 and WindowsNT.  
>  In 1993, ten years after I wrote PING, the USENIX association presented me with a handsome scroll, pronouncing me a Joint recipient of The USENIX Association 1993 Lifetime Achievement Award presented to the Computer Systems Research Group, University of California at Berkeley 1979-1993. ``Presented to honor profound intellectual achievement and unparalleled service to our Community. At the behest of CSRG principals we hereby recognize the following individuals and organizations as CSRG participants, contributors and supporters.'' Wow!  
>  The best ping story I've ever heard was told to me at a USENIX conference, where a network administrator with an intermittent Ethernet had linked the ping program to his vocoder program, in essence writing:  
>  ping goodhost | sed -e 's/.\*/ping/' | vocoder  
>  He wired the vocoder's output into his office stereo and turned up the volume as loud as he could stand. The computer sat there shouting "Ping, ping, ping..." once a second, and he wandered through the building wiggling Ethernet connectors until the sound stopped. And that's how he found the intermittent failure.
>
>
> ---
>

### [FreeBSD: /usr/local/lib/libpkg.so.3: Undefined symbol "utimensat"](http://glasz.org/sheeplog/2017/02/freebsd-usrlocalliblibpkgso3-undefined-symbol-utimensat.html) ###

>
>
> The internet will tell you that, of course, 10.2 is EOL, that packages are being built for 10.3 by now and to better upgrade to the latest version of FreeBSD. While all of this is true and running the latest versions is generally good advise, in most cases it is unfeasible to do an entire OS upgrade just to be able to install a package.
>
>

* Points out the ABI variable being used in /usr/local/etc/pkg/repos/FreeBSD.conf

>
>
> Now, if you have 10.2 installed and 10.3 is the current latest FreeBSD version, this url will point to packages built for 10.3 resulting in the problem that, when running pkg upgrade pkg itll go ahead and install the latest version of pkg build for 10.3 onto your 10.2 system. Yikes! FreeBSD 10.3 and pkgng broke the ABI by introducing new symbols, like utimensat.
>
>

* The solution:

>
>
> Have a look at the actual repo url [http://pkg.FreeBSD.org/FreeBSD:10:amd64](http://pkg.FreeBSD.org/FreeBSD:10:amd64) theres repos for each release! Instead of going through the tedious process of upgrading FreeBSD you just need to Use a repo url that fits your FreeBSD release:
>
>
>
> Update the package cache: pkg update  
>  Downgrade pkgng (in case you accidentally upgraded it already): pkg delete -f pkg  
>  pkg install -y pkg  
>  Install your package  
>  There you go. Dont fret. But upgrade your OS soon ;)
>
>
> ---
>

---

Beastie Bits
----------

* [CPU temperature collectd report on NetBSD](https://imil.net/blog/2017/01/22/collectd_NetBSD_temperature/)
* [Booting FreeBSD 11 with NVMe and ZFS on AMD Ryzen](https://www.servethehome.com/booting-freebsd-11-nvme-zfs-amd-ryzen/)
* [BeagleBone Black Tor relay](https://torbsd.github.io/blog.html#busy-bbb)
* [FreeBSD - Disable in-tree GDB by default on x86, mips, and powerpc](https://reviews.freebsd.org/rS317094)
* [CharmBUG April Meetup](https://www.meetup.com/CharmBUG/events/238218742/)
* [The origins of XXX as FIXME](https://www.snellman.net/blog/archive/2017-04-17-xxx-fixme/) \*\*\*

Feedback/Questions
----------

* [Felis - L2ARC](http://dpaste.com/2APJE4E#wrap)
* [Gabe - FreeBSD Server Install](http://dpaste.com/0BRJJ73#wrap)  

* [FEMP Script](http://dpaste.com/05EYNJ4#wrap)
* [Scott - FreeNAS & LAGG](http://dpaste.com/1CV323G#wrap)
* [Marko - Backups](http://dpaste.com/3486VQZ#wrap) \*\*\*