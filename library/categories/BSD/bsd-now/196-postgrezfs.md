+++
title = "196: PostgreZFS"
description = "This week on BSD Now, we review the EuroBSDcon schedule, we explore the mysteries of Docker on OpenBSD, and show you how to run PostgreSQL on ZFS.This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www."
date = "2017-05-31T12:00:00Z"
url = "https://www.bsdnow.tv/196"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.892241792Z"
seen = false
+++

This week on BSD Now, we review the EuroBSDcon schedule, we explore the mysteries of Docker on OpenBSD, and show you how to run PostgreSQL on ZFS.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [EuroBSDcon 2017 - Talks & Schedule published](https://2017.eurobsdcon.org/2017/05/26/talks-schedule-published/) ###

* The EuroBSDcon website was updated with the tutorial and talk schedule for the upcoming September conference in Paris, France.
* Tutorials on the 1st day: Kirk McKusick - An Introduction to the FreeBSD Open-Source Operating System, George Neville-Neil - DTrace for Developers, Taylor R Campbell - How to untangle your threads from a giant lock in a multiprocessor system
* Tutorials on the 2nd day: Kirk continues his Introduction lecture, Michael Lucas - Core concepts of ZFS (half day), Benedict Reuschling - Managing BSD systems with Ansible (half day), Peter Hessler - BGP for developers and sysadmins
* Talks include 3 keynotes (2 on the first day, beginning and end), another one at the end of the second day by Brendan Gregg
* Good mixture of talks of the various BSD projects
* Also, a good amount of new names and faces
* Check out the full [talk schedule](https://2017.eurobsdcon.org/talks-schedule/).
* Registration is not open yet, but will be soon. \*\*\*

### [OpenBSD on the Xiaomi Mi Air 12.5"](https://jcs.org/2017/05/22/xiaomiair) ###

>
>
> The [Xiaomi Mi Air 12.5"](https://xiaomi-mi.com/notebooks/xiaomi-mi-notebook-air-125-silver/) is a basic fanless 12.5" Ultrabook with good build quality and decent hardware specs, especially for the money: while it can usually be had for about $600, I got mine for $489 shipped to the US during a sale about a month ago.  
>  Xiaomi offers this laptop in silver and gold. They also make a 13" version but it comes with an NVidia graphics chip. Since these laptops are only sold in China, they come with a Chinese language version of Windows 10 and only one or two distributors that carry them ship to the US. Unfortunately that also means they come with practically no warranty or support.  
>  Hardware
>
>

```
> The Mi Air 12.5" has a fanless, 6th generation (Skylake) Intel Core m3 processor, 4Gb of soldered-on RAM, and a 128Gb SATA SSD (more on that later). It has a small footprint of 11.5" wide, 8" deep, and 0.5" thick, and weighs 2.3 pounds.
> A single USB-C port on the right-hand side is used to charge the laptop and provide USB connectivity. A USB-C ethernet adapter I tried worked fine in OpenBSD. Whether intentional or not, a particular design touch I appreciated was that the USB-C port is placed directly to the right of the power button on the keyboard, so you don't have to look or feel around for the port when plugging in the power cable.
> A single USB 3 type-A port is also available on the right side next to the USB-C port. A full-size HDMI port and a headphone jack are on the left-hand side. It has a soldered-on Intel 8260 wireless adapter and Bluetooth. The webcam in the screen bezel attaches internally over USB.
> The chassis is all aluminum and has sufficient rigidity in the keyboard area. The 12.5" 1920x1080 glossy IPS screen has a fairly small bezel and while its hinge is properly weighted to allow opening the lid with one hand (if you care about that kind of thing), the screen does have a bit of top-end wobble when open, especially when typing on another laptop on the same desk.
> The keyboard has a roomy layout and a nice clicky tactile with good travel. It is backlit, but with only one backlight level. When enabled via Fn+F10 (which is handled by the EC, so no OpenBSD support required), it will automatically shut off after not typing for a short while, automatically turning back once a key is pressed.

```

>
>
> Upgrades  
>  \> An interesting feature of the Mi Air is that it comes with a 128Gb SATA SSD but also includes an open PCI-e slot ready to accept an NVMe SSD.  
>  \> I upgraded mine with a Samsung PM961 256Gb NVMe SSD (left), and while it is possible to run with both drives in at the same time, I removed the Samsung CM871a 128Gb SATA (right) drive to save power.  
>  \> The bottom case can be removed by removing the seven visible screws, in addition to the one under the foot in the middle back of the case, which just pries off. A spudger tool is needed to release all of the plastic attachment clips along the entire edge of the bottom cover.  
>  \> Unfortunately this upgrade proved to be quite time consuming due to the combination of the limited UEFI firmware on the Mi Air and a bug in OpenBSD.
>
>
>
> A Detour into UEFI Firmware Variables
>
>

```
> Unlike a traditional BIOS where one can boot into a menu and configure the boot order as well as enabling and disabling options such as "USB Hard Drive", the InsydeH2O UEFI firmware on the Xiaomi Air only provides the ability to adjust the boot order of existing devices. Any change or addition of boot devices must be done from the operating system, which is not possible under OpenBSD.
> I booted to a USB key with OpenBSD on it and manually partitioned the new NVME SSD, then rsynced all of the data over from the old drive, but the laptop would not boot to the new NVME drive, instead showing an error message that there was no bootable OS.
> Eventually I figured out that the GPT table that OpenBSD created on the NVMe disk was wrong due to a [one-off bug in the nvme driver](https://github.com/openbsd/src/commit/dc8298f669ea2d7e18c8a8efea509eed200cb989) which was causing the GPT table to be one sector too large, causing the backup GPT table to be written in the wrong location (and other utilities under Linux to write it over the OpenBSD area). I'm guessing the UEFI firmware would fail to read the bad GPT table on the disk that the boot variable pointed to, then declare that disk as missing, and then remove any variables that pointed to that disk.

```

>
>
> OpenBSD Support
>
>

```
> The Mi Air's soldered-on Intel 8260 wireless adapter is supported by OpenBSD's iwm driver, including 802.11n support. The Intel sound chip is recognized by the azalia driver.
> The Synaptics touchpad is connected via I2C, but is not yet supported. I am actively hacking on my dwiic driver to make this work and the touchpad will hopefully operate as a Windows Precision Touchpad via imt so I don't have to write an entirely new Synaptics driver.
> Unfortunately since OpenBSD's inteldrm support that is ported from Linux is lagging quite a bit behind, there is no kernel support for Skylake and Kaby Lake video chips. Xorg works at 1920x1080 through efifb so the machine is at least usable, but X is not very fast and there is a noticeable delay when doing certain redrawing operations in xterm. Screen backlight can be adjusted through my OpenBSD port of intel_backlight. Since there is no hardware graphics support, this also means that suspend and resume do not work because nothing is available to re-POST the video after resume. Having to use efifb also makes it impossible to adjust the screen gamma, so for me, I can't use redshift for comfortable night-time hacking.

```

>
>
> Flaws
>
>

```
> Especially taking into account the cheap price of the laptop, it's hard to find faults with the design. One minor gripe is that the edges of the case along the bottom are quite sharp, so when carrying the closed laptop, it can feel uncomfortable in one's hands.
> While all of those things could be overlooked, unfortunately there is also a critical flaw in the rollover support in the keyboard/EC on the laptop. When typing certain combinations of keys quickly, such as holding Shift and typing "NULL", one's fingers may actually hold down the Shift, N, and U keys at the same time for a very brief moment before releasing N. Normally the keyboard/EC would recognize U being pressed after N is already down and send an interrupt for the U key. Unfortunately on this laptop, particular combinations of three keys do not interrupt for the third key at all until the second key is lifted, usually causing the third key not to register at all if typed quickly.

```

>
>
> I've been able to reproduce this problem in OpenBSD, Linux, and Windows, with the combinations of at least Shift+N+U and Shift+D+F. Holding Shift and typing the two characters in sequence quickly enough will usually fail to register the final character. Trying the combinations without Shift, using Control or Alt instead of Shift, or other character pairs does not trigger the problem.  
>  This might be a problem in the firmware on the Embedded Controller, or a defect in the keyboard circuitry itself. As I mentioned at the beginning, getting technical support for this machine is difficult because it's only sold in China.
>
>
> ---
>

### [Docker on OpenBSD 6.1-current](https://medium.com/@dave_voutila/docker-on-openbsd-6-1-current-c620513b8110) ###

* Dave Voutila writes:

>
>
> So here’s the thing. I’m normally a macOS user…all my hardware was designed in Cupertino, built in China. But I’m restless and have been toying with trying to switch my daily machine over to a non-macOS system sort of just for fun. I find Linux messy, FreeBSD not as Apple-laptop-friendly as it should be, and Windows a non-starter. Luckily, I found a friend in Puffy. Switching some of my Apple machines over to dual-boot OpenBSD left a gaping hole in my workflow. Luckily, all the hard work the OpenBSD team has done over the last year seems to have plugged it nicely!  
>  OpenBSD’s hypervisor support officially made it into the 6.1 release, but after some experimentation it was rather time consuming and too fragile to get a Linux guest up and running (i.e. basically the per-requisite for Docker). Others had reported some success starting with QEMU and doing lots of tinkering, but after a wasted evening I figured I’d grab the latest OpenBSD snapshot and try what the openbsd-misc list suggested was improved Linux support in active development.
>
>

* 10 (11) Steps to docker are provided
  * Step 0 — Install the latest OpenBSD 6.1 snapshot (-current)
  * Step 1 — Configure VMM/VMD
  * Step 2 — Grab an Alpine Linux ISO
  * Step 3 — Make a new virtual disk image
  * Step 4 — Boot Alpine’s ISO
  * Step 5 — Inhale that fresh Alpine air
  * Step 6 — Boot Alpine for Reals
  * Step 7 — Install Docker
  * Step 8 — Make a User
  * Step 9 — Ditch the Serial Console
  * Step 10 — Test out your Docker instance

>
>
> I haven’t done it yet, but I plan on installing docker-compose via Python’s pip package manager. I prefer defining containers in the compose files.
>
>
> ---
>

### [PostgreSQL + ZFS Best Practices and Standard Procedures](https://people.freebsd.org/~seanc/postgresql/scale15x-2017-postgresql_zfs_best_practices.pdf) ###

* Slides from Sean Chittenden’s talk about PostgreSQL and ZFS at Scale 15x this spring
* Slides start with a good overview of Postgres and ZFS, and how to use them together
* To start, it walks through the basics of how PostgreSQL interacts with the filesystem (any filesystem)
* Then it shows the steps to take a good backup of PostgreSQL, then how to do it even better with ZFS
* Then an intro to ZFS, and how Copy-on-Write changes host PostgreSQL interacts with the filesystem
* Overview of how ZFS works
* ZFS Tuning tips: Compression, Recordsize, atime, when to use mostly ARC vs shared\_buffer, plus pg\_repack
* Followed by a discussion of the reliability of SSDs, and their Bit Error Rate (BER)
* A good SSD has a 4%/year chance of returning the wrong data. A cheap SSD 34%
* If you put 20 SSDs in a database server, that means 58% (Good SSDs) to 99.975% (Lowest quality commercially viable SSD) chance of an error per year
* Luckily, ZFS can detect and correct these errors
* This applies to all storage, not just SSDs, every device fails
* More Advice:
  * Use quotas and reservations to avoid running out of space
  * Schedule Periodic Scrubs
  * One dataset per database

* Backups: Live demo of rm -rf’ing the database and getting it back
* Using clones to test upgrades on real data
* Naming Conventions:
  * Use a short prefix not on the root filesystem (e.g. /db)
  * Encode the PostgreSQL major version into the dataset name
  * Give each PostgreSQL cluster its own dataset (e.g. pgdb01)
  * Optional but recommended: one database per cluster
  * Optional but recommended: one app per database
  * Optional but recommended: encode environment into DB name
  * Optional but recommended: encode environment into DB username

* using ZFS Replication
* Check out the full detailed PDF and implement a similar setup for your database needs \*\*\*

News Roundup
----------

### [TrueOS Evolving Its "Stable" Release Cycle](https://www.trueos.org/blog/housekeeping-update-infrastructure-trueos-changes/) ###

* TrueOS is reformulating its Stable branch based on feedback from users. The goal is to have a “release” of the stable branch every 6 months, for those who do not want to live on the edge with the rapid updates of the full rolling release

>
>
> Most of the TrueOS developers work for iX Systems in their Tennessee office. Last month, the Tennessee office was moved to a different location across town. As part of the move, we need to move all our servers. We’re still getting some of the infrastructure sorted before moving the servers, so please bear with us as we continue this process.  
>  As we’ve continued working on TrueOS, we’ve heard a significant portion of the community asking for a more stable “STABLE” release of TrueOS, maybe something akin to an old PC-BSD version release. In order to meet that need, we’re redefining the TrueOS STABLE branch a bit. STABLE releases are now expected to follow a six month schedule, with more testing and lots of polish between releases. This gives users the option to step back a little from the “cutting edge” of development, but still enjoy many of the benefits of the “rolling release” style and the useful elements of FreeBSD Current.  
>  Critical updates like emergency patches and utility bug fixes are still expected to be pushed to STABLE on a case-by-case basis, but again with more testing and polish. This also applies to version updates of the Lumina and SysAdm projects. New, released work from those projects will be tested and added to STABLE outside the 6 month window as well.  
>  The UNSTABLE branch continues to be our experimental “cutting edge” track, and users who want to follow along with our development and help us or FreeBSD test new features are still encouraged to follow the UNSTABLE track by checking that setting in their TrueOS Update Manager.
>
>

* With boot environments, it will be easy to switch back and forth, so you can have the best of both worlds. Use the latest bleeding edge features, but knowing you can fall back to the stable branch with just a reboot

>
>
> As TrueOS evolves, it is becoming clearer that one role of the system is to function as a “test platform” for FreeBSD. In order to better serve this role, TrueOS will support both OpenRC and the FreeBSD RC init systems, giving users the choice to use either system. While the full functionality isn’t quite ready for the next STABLE update, it is planned for addition after the last bit of work and testing is complete. Stay tuned for an upcoming blog post with all the details of this change, along with instructions how to switch between RC and OpenRC.
>
>

* This is the most important change for me. I used TrueOS as an easy way to run the latest version of -CURRENT on my laptop, to use it as a user, but also to do development. When TrueOS deviates from FreeBSD too much, it lessens the power of my expertise, and complicates development and debugging.
* Being able to switch back to RC, even if it takes another minute to boot, will bring TrueOS back to being FreeBSD + GUI and more by default, instead of a science project.
* We need both of those things, so having the option, while more work for the TrueOS team, I think will be better for the entire community \*\*\*

### [Logical Domains on SunFire T2000 with OpenBSD/sparc64](http://www.h-i-r.net/2017/05/logical-domains-on-sunfire-t2000-with.html) ###

>
>
> A couple of years ago, I picked up a Sun Fire T2000. This is a 2U rack mount server. Mine came with four 146GB SAS drives, a 32-core UltraSPARC T1 CPU and 32GB of RAM.  
>  Sun Microsystems incorporated Logical Domains (LDOMs) on this class of hardware. You don't often need 32 threads and 32GB of RAM in a single server. LDOMs are a kind of virtualization technology that's a bit closer to bare metal than vmm, Hyper-V, VirtualBox or even Xen. It works a bit like Xen, though. You can allocate processor, memory, storage and other resources to virtual servers on-board, with a blend of firmware that supports the hardware allocation, and some software in userland (on the so-called primary or control domain, similar to Xen DomU) to control it.  
>  LDOMs are similar to what IBM calls Logical Partitions (LPARs) on its Mainframe and POWER series computers. My day job from 2006-2010 involved working with both of these virtualization technologies, and I've kind of missed it.  
>  While upgrading OpenBSD to 6.1 on my T2000, I decided to delve into LDOM support under OpenBSD. This was pretty easy to do, but let's walk through it
>
>

* Resources:
  * [The ldomctl(8) man page](http://man.openbsd.org/OpenBSD-current/man8/sparc64/ldomctl.8)
  * [tedu@'s write-up on Flak (for a different class of server)](http://www.tedunangst.com/flak/post/OpenBSD-on-a-Sun-T5120)
  * [A Google+ post by bmercer@](https://plus.google.com/101694200911870273983/posts/jWh4rMKVq97)

>
>
> Once you get comfortable with the fact that there's a little-tiny computer (the ALOM) powered by VXWorks inside that's acting as the management system and console (there's no screen or keyboard/mouse input), Installing OpenBSD on the base server is pretty straightforward. The serial console is an RJ-45 jack, and, yes, the ubiquitous blue-colored serial console cables you find for certain kinds of popular routers will work fine.  
>  OpenBSD installs quite easily, with the same installer you find on amd64 and i386. I chose to install to /dev/sd0, the first SAS drive only, leaving the others unused. It's possible to set them up in a hardware RAID configuration using tools available only under Solaris, or use softraid(4) on OpenBSD, but I didn't do this.  
>  I set up the primary LDOM to use the first ethernet port, em0. I decided I wanted to bridge the logical domains to the second ethernet port. You could also use a bridge and vether interface, with pf and dhcpd to create a NAT environment, similar to how I networked the vmm(4) systems.  
>  Create an LDOM configuration file. You can put this anywhere that's convenient. All of this stuff was in a "vm" subdirectory of my home. I called it ldom.conf:  
>  domain primary {  
>  vcpu 8  
>  memory 8G  
>  }  
>  domain puffy {  
>  vcpu 8  
>  memory 4G  
>  vdisk "/home/axon/vm/ldom1"  
>  vnet  
>  }
>
>
>
> Make as many disk images as you want, and make as many additional domain clauses as you wish. Be mindful of system resources. I couldn't actually allocate a full 32GB of RAM across all the LDOMs  
>  I eventually provisioned seven LDOMs (in addition to the primary) on the T2000, each with 3GB of RAM and 4 vcpu cores. If you get creative with use of network interfaces, virtual ethernet, bridges and pf rules, you can run a pretty complex environment on a single chassis, with services that are only exposed to other VMs, a DMZ segment, and the internal LAN.
>
>

* A nice tutorial, and an interesting look at an alternative platform that was ahead of its time \*\*\*

### [documentation is thoroughly hard](http://www.tedunangst.com/flak/post/documentation-is-thoroughly-hard) ###

* Ted Unangst has a new post this week about documentation:

>
>
> Documentation is good, so therefore more documentation must be better, right? A few examples where things may have gotten out of control  
>  A fine example is the old OpenBSD install instructions. Once you’ve installed OpenBSD once or twice, the process is quite simple, but you’d never know this based on reading the instructions. Compare the files for 4.8 INSTALL and 5.8 INSTALL. Both begin with a brief intro to the project. Then 4.8 has an enormous list of mirrors, which seems fairly redundant if you’ve already found the install file. Followed by an enormous list of every supported variant of every supported device. Including a table of IO port configurations for ISA devices. Finally, after 1600 lines of introduction we get to the actual installation instructions. (Compared to line 231 for 5.8.) This includes a full page of text about how to install from tape, which nobody ever does. It took some time to recognize that all this documentation was actually an impediment to new users. Attempting to answer every possible question floods the reader with information for questions they were never planning to ask.  
>  Part of the problem is how the information is organized. Theoretically it makes sense to list supported hardware before instructions. After all, you can’t install anything if it’s not supported, right? I’m sure that was considered when the device list was originally inserted above the install instructions. But as a practical matter, consulting a device list is neither the easiest nor fastest way to determine what actually works.
>
>

* In the FreeBSD docs tree, we have been doing a facelift project, trying to add ‘quick start’ sections to each chapter to let you get to the more important information first. It is also helpful to move data in the forms of lists and tables to appendices or similar, where they can easily be references, but are not blocking your way to the information you are actually hunting for

>
>
> An example of [nerdview signage](http://languagelog.ldc.upenn.edu/nll/?p=29866). “They have in effect provided a sign that will tell you exactly what the question is provided you can already supply the answer.”
>
>

* That is, the logical minds of technical people often decide to order information in an order that makes sense to them, rather than in the order that will be most useful to the reader

>
>
> In the end, I think “copy diskimage to USB and follow prompts” is all the instructions one should need, but it’s hard to overcome the unease of actually making the jump. What if somebody is confused or uncertain? Why is this paragraph more redundant than that paragraph? (And if we delete both, are we cutting too much?)  
>  Sometimes we don’t need to delete the information. Just hide it. The instructions to upgrade to 4.8 and upgrade to 5.8 are very similar, with a few differences because every release is a little bit different. The pages look very different, however, because the not at all recommended kernel free procedure, which takes up half the page, has been hidden from view behind some javascript and only expanded on demand. A casual browser will find the page and figure the upgrade process will be easy, as opposed to some long ordeal.
>
>

* This is important as well, it was my original motivation for working on the FreeBSD Handbook’s ZFS chapter. The very first section of the chapter was the custom kernel configuration required to run ZFS on i386. That scared many users away. I moved that to the very end, and started with why you might want to use ZFS. Much more approachable.

>
>
> Sometimes it’s just a tiny detail that’s overspecified. The apmd manual used to explain exactly which CPU idle time thresholds were used to adjust frequency. Those parameters, and the algorithm itself, were adjusted occasionally in response to user feedback, but sometimes the man page lagged behind. The numbers are of no use to a user. They’re not adjustable without recompiling. Knowing that the frequency would be reduced at 85% idle vs 90% idle doesn’t really offer much guidance as to whether to enable auto scaling or not. Deleting this detail ensured the man page was always correct and spares the user the cognitive load of trying to solve an unnecessary math problem.
>
>

* For fun:

>
>
> For another humorous example, it was recently observed that the deja-dup package provides man page translations for Australia, Canada, and Great Britain. I checked, the pages are in fact not quite identical. Some contain typo fixes that didn’t propagate to other translations. Project idea: attempt to identify which country has the most users, or most fastidious users, by bug fixes to localized man pages.
>
>
> ---
>

### [lldb on BeagleBone Black](https://lists.freebsd.org/pipermail/freebsd-arm/2017-May/016260.html) ###

>
>
> I reliably managed to build (lldb + clang/lld) from the svn trunk of LLVM 5.0.0 on my Beaglebone Black running the latest snapshot (May 20th) of FreeBSD 12.0-CURRENT, and the lldb is working very well, and this includes single stepping and ncurses-GUI mode, while single stepping with the latest lldb 4.0.1 from the ports does not work.  
>  In order to reliably build LLVM 5.0.0 (svn), I set up a 1 GB swap partition for the BBB on a NFSv4 share on a FreeBSD fileserver in my network - I put a howto of the procedure on my BLog: [https://obsigna.net/?p=659](https://obsigna.net/?p=659)
>
>

* The prerequesites on the Beaglebone are:

```
# pkg install tmux
# pkg install cmake
# pkg install python
# pkg install libxml2
# pkg install swig30
# pkg install ninja
# pkg install subversion

```

* On the FreeBSD fileserver:

```
# /path_to_the/bbb_share
# svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm
# cd llvm/tools
# svn co http://llvm.org/svn/llvm-project/cfe/trunk clang
# svn co http://llvm.org/svn/llvm-project/lld/trunk lld
# svn co http://llvm.org/svn/llvm-project/lldb/trunk lldb

```

* On the Beaglebone Black:

```
 # mount_nfs -o noatime,readahead=4,intr,soft,nfsv4 server:/path_to_the/bbb_share /mnt
 # cd /mnt
 # mkdir build
 # cmake -DLLVM_TARGETS_TO_BUILD="ARM" -DCMAKE_BUILD_TYPE="MinSizeRel" \
        -DLLVM_PARALLEL_COMPILE_JOBS="1" -DLLVM_PARALLEL_LINK_JOBS="1" -G Ninja ..

```

>
>
> I execute the actual build command from within a tmux session, so I may disconnect during the quite long (40 h) build:
>
>

```
# tmux new "ninja lldb install"

```

>
>
> When debugging in GUI mode using the newly build lldb 5.0.0-svn, I see only a minor issue, namely UTF8 strings are not displayed correctly. This happens in the ncurses-GUI only, and this is an ARM issue, since it does not occur on x86 machines. Perhaps this might be related to the signed/unsigned char mismatch between ARM and x86.
>
>

---

Beastie Bits
----------

* [Triangle BSD Meetup on June 27th](https://www.meetup.com/Triangle-BSD-Users-Group/events/240247251/)
* [Support for Controller Area Networks (CAN) in NetBSD](http://www.feyrer.de/NetBSD/bx/blosxom.cgi/nb_20170521_0113.html)
* [Notes from Monday's meeting](http://mailman.uk.freebsd.org/pipermail/ukfreebsd/2017-May/014104.html)
* [RunBSD - A site about the BSD family of operating systems](http://runbsd.info/)
* [BSDCam(bridge) 2017 Travel Grant Application Now Open](https://www.freebsdfoundation.org/blog/bsdcam-2017-travel-grant-application-now-open/)
* [New BSDMag has been released](https://bsdmag.org/download/nearly-online-zpool-switching-two-freebsd-machines/) \*\*\*

Feedback/Questions
----------

* [Philipp - A show about byhve](http://dpaste.com/390F9JN#wrap)
* [Jake - byhve Support on AMD](http://dpaste.com/0DYG5BD#wrap)
* [CY - Pledge and Capsicum](http://dpaste.com/1YVBT12#wrap)
* [CY - OpenSSL relicense Issue](http://dpaste.com/3RSYV23#wrap)
* [Andy - Laptops](http://dpaste.com/0MM09EX#wrap) \*\*\*