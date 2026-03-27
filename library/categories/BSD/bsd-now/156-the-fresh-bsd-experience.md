+++
title = "156: The Fresh BSD experience"
description = 'This week on BSDNow, Allan is back from his UK trip and we’ll get to hear his thoughts on the developer summit. That plus all theThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source /\](http://www.ixsystems.com'
date = "2016-08-24T12:00:00Z"
url = "https://www.bsdnow.tv/156"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.007013574Z"
seen = false
+++

This week on BSDNow, Allan is back from his UK trip and we’ll get to hear his thoughts on the developer summit. That plus all the

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png) /\>](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for <br>
Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly <br>
Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeBSD 11.0-RC1 Available](https://lists.freebsd.org/pipermail/freebsd-stable/2016-August/085277.html) ###

* FreeBSD is marching onwards to 11.0, and with it the first RC1 was released. In addition to the usual amd64 architectures, you may want to give it   
   a whirl on your various ARM boards as well, as it includes images for the following systems:

  * 11.0-RC1 amd64 GENERIC
  * 11.0-RC1 i386 GENERIC
  * 11.0-RC1 powerpc GENERIC
  * 11.0-RC1 powerpc64 GENERIC64
  * 11.0-RC1 sparc64 GENERIC
  * 11.0-RC1 armv6 BANANAPI
  * 11.0-RC1 armv6 BEAGLEBONE
  * 11.0-RC1 armv6 CUBIEBOARD
  * 11.0-RC1 armv6 CUBIEBOARD2
  * 11.0-RC1 armv6 CUBOX-HUMMINGBOARD
  * 11.0-RC1 armv6 GUMSTIX
  * 11.0-RC1 armv6 RPI-B
  * 11.0-RC1 armv6 RPI2
  * 11.0-RC1 armv6 PANDABOARD
  * 11.0-RC1 armv6 WANDBOARD
  * 11.0-RC1 aarch64 GENERIC

* For those wondering the list of changes between this and BETA4, we have that as well:

  * A NULL pointer dereference in IPSEC has been fixed.
  * Support for SSH Protocol 1 has been removed.
  * OpenSSH DSA keys have been disabled by default. Users upgrading from prior FreeBSD versions are urged to update their SSH keys to RSA or ECDSA keys before upgrading to 11.0-RC1.
  * PCI-e hotplug on bridges with power controllers has been disabled.
  * A loader tunable (hw.pci.enable\_pcie\_hp) to disable PCI-e HotPlug has been added.
  * A VESA panic on suspend has been fixed.
  * Google Compute Engine image publication has been fixed.
  * An AES-ICM heap corruption typo bug has been fixed.
  * A regression in pf.conf while parsing the 'interval' keyword has been fixed.
  * A ZFS/VFS deadlock has been fixed.

* [RC2 is delayed while some issues are sorted out ](https://lists.freebsd.org/pipermail/freebsd-stable/2016-August/085323.html)

* RC2 is looming large, but was pushed back a few days while the following bugs are sorted out:

  * Issue with IPv6 UDP traffic being sent from wrong MAC address
  * Layer2 violation with IPv6 \*\*\*

### [OpenBSD just added initial support for the RaspberryPi 2 and 3 devices](https://marc.info/?l=openbsd-cvs&m=147059203101111&w=2) ###

* It’s a good time to be an ARM and BSD enthusiast. In addition to all the ARM images in FreeBSD 11.0, we also have word that initial support for RPi2 and RPi3 has started to land in OpenBSD.
* Mark Kettenis has posted the following with his Commit:

>
>
> Initial support for Raspberry Pi 2/3. All the hard work done by patrick@, I just cleaned things up a bit. Any bugs introduced in that process are entirely mine.
>
>
>
> This doesn't work yet. But when it does, you'll need recent firmware from the Raspberry Pi Foundation git repository at:
>
>
>
> [https://github.com/raspberrypi/firmware](https://github.com/raspberrypi/firmware)
>
>
>
> The device tree for the Raspberry Pi is somewhat in flux as bits and pieces to support the Raspberry Pi 2 and 3 are committed to the mainline Linux kernel.“
>
>
>
> * Exciting news! We will of course keep you informed as to when we have images to play with. Running OpenBSD / PF on a RPi does sound intriguing. \*\*\*
>
>

### [drm-4.8-rc2 tagged in drm-next](https://lists.freebsd.org/pipermail/freebsd-x11/2016-August/017840.html) ###

* Remember when FreeBSD lagged so far behind in Graphics support? Well, those days are rapidly coming to an end.
* Matt Macy has posted an update to the FreeBSD X11 list with news of his DRM branch being caught up all the way to Linux 4.8-RC2 now.
* This is a huge accomplishment, with Matt commenting:

>
>
> As of this moment sys/dev/drm in the drm-next tree is sync with [https://github.com/torvalds/linux](https://github.com/torvalds/linux) drivers/gpu/drm (albeit only for the subset of drivers that FreeBSD supports - i915, radeon, and amdgpu). I feel this is a bit of a milestone as it means that it is possible that in the future graphics support on FreeBSD could proceed in lockstep with Linux.
>
>

* For those who want to try out the latest support, you can build from his branch at the following GitHub location: ([https://github.com/FreeBSDDesktop/freebsd-base-graphics](https://github.com/FreeBSDDesktop/freebsd-base-graphics))
* Or, if compiling isn’t your thing, TrueOS (The re-branded PC-BSD) will be releasing the a new ISO based upon his update to Linux 4.7 in the coming days, with 4.8-RC2 to follow in the next week or two. \*\*\*

### [Installing FreeBSD for Raspberry Pi](https://www.freebsdfoundation.org/freebsd/how-to-guides/installing-freebsd-for-raspberry-pi/) ###

* People have been running FreeBSD on various RPi devices for a while now, however there are still a lot of people who probably need a hand to get boot-strapped on their RPi system.
* The FreeBSD foundation has put together a nice tutorial which walks even the most novice user through getting FreeBSD up and running.
* In particular this could become a good way for students or other FreeBSD newcomers to try out the OS on a relatively low-cost platform outside of a VM.
* The tutorial starts of with a check-list of the specific items you’ll need to get started, for RPi 1 (a/b) or RPi 2 hardware.
* From there, instructions on how to get the downloaded images onto a sdcard are provided, including Mac and Windows image burning details.
* With this done, it’s really only a matter of plugging in your device to be presented with your new RPi + FreeBSD system. The most important details (the default username/password) at also provided, so don’t skim too quickly. \*\*\*

Interview - Drew Gurkowski
----------

* Foundation Intern: First time FreeBSD User and Writing Tutorials \*\*\*

News Roundup
----------

### [FreeBSD’s ipfw gets a NAT64 implementation ](https://svnweb.freebsd.org/base?view=revision&revision=304046) ###

* A new feature has been added to FreeBSD’s native firewall, ipfw2
* The new loadable module implements stateless and stateful NAT64
* “Stateless translation is appropriate when a NAT64 translator is used in front of IPv4-only servers to allow them to be reached by remote IPv6-only clients.”
* With this setup, you map specific IPv6 addresses to the corresponding IPv4 address, allowing IPv4 only servers to be reachable on the v6 network.
* “Stateful translation is suitable for deployment at the client side or at the service provider, allowing IPv6-only client hosts to reach remote IPv4-only nodes.”
* This configuration allows many IPv6 only clients to reach the “legacy” internet. The FreeBSD cluster has been waiting for this feature for a while, because they have limited IP addresses, but many service jails that require access to services like GitHub that are not IPv6 enabled.
* The work was sponsored by Yandex, the Russian search engine and long time FreeBSD user
* Example configurations for both types are included in the commit message
* If you would find this feature useful, please take the time to set it up and document the steps and contribute that to the FreeBSD Handbook. \*\*\*

### [Update on using LLVM's lld linker in the FreeBSD base system](https://lists.freebsd.org/pipermail/freebsd-toolchain/2016-August/002240.html) ###

* Ed Maste has written a lengthy update on the progress being made towards using LLVM’s lld linker as a replacement for GNU’s ‘ld’.
* Ed starts off by giving us some of the potential benefits of using lld vs the 2.17.50 ‘ld’ version FreeBSD currently uses:

  * AArch64 (arm64) support
  * Link Time Optimization (LTO)
  * New ABI support
  * Other linker optimization
  * Much faster link times
  * Maintained code base

* Ed also gives us an update on several of the major blockers:

>
>
> Since the last update in March several lld developers have implemented much of the missing functionality. The main blockers were symbol version support and expression evaluation in the linker script expression parser. Both are now nearly complete“
>
>

* A detailed plan was also articulated in respect to switching over:

1. Update lld along with the Clang/LLVM 3.9 update that dim@ is working on.
2. Add the bmake build infrastructure, installing as /usr/bin/ld.lld on the same architectures that use Clang (amd64, arm, arm64, i386). I don't think there's a need for a WITH\_LLD src.conf knob, but will add one if desired.
3. Update lld again (most likely to a snapshot from upstream SVN) once it is able to link an unmodified FreeBSD kernel.
4. Modify the boot loader and kernel builds to avoid using features not implemented by lld.
5. Introduce a WITH\_LLD\_AS\_LD knob to have /usr/bin/ld be a ld.lld hardlink instead of /usr/bin/ld.bfd.
6. Request ports exp-runs and issue a call for testing with 3rd party software. Fix issues found during this process.
7. Switch /usr/bin/ld to ld.lld by default in head for the Clang-using architectures. Add a WITHOUT\_LLD\_AS\_LD knob to switch back to GNU ld. \*\*\*

### [How to install FreeBSD with ZFS filesystem on DigitalOcean](https://github.com/fxlv/docs/blob/master/freebsd/freebsd-with-zfs-digitalocean.md) ###

* I know we’ve mentioned using FreeBSD + ZFS on digital ocean in the past, but today we have a nice HowTo by Kaspars Mickevics (fxlv) on GitHub.

* Before getting started, kaspars mentions some pre-reqs. First up he recommends starting with a Minimum of 2GB of RAM. (The $20/mo droplet). This is to ensure you have plenty of cushion to avoid running out of memory during the process. It is possible to use ZFS with less, but depending on your desired workload this does make sense.

* From there, checking out “mfsBSD” is discussed, along with details on how to make it suitable for a DO installation. (Mostly just disabling DHCP for the network device) For good measure ‘pkg-static’ is also included.

* With that done, using mfsBSD you will create a tar file, which is then extracted on top of the running system.

* After rebooting, you will be able to run “bsdinstall” and proceed to installing / formatting your disk with ZFS as normal.

* A good tutorial, something I may need to do here in the near future.

  ---

### [User manages to get OpenBSD and FreeBSD working with Libreboot](https://lists.nongnu.org/archive/html/libreboot/2016-08/msg00058.html) ###

* In a short drive-by post to the Libreboot mailing list Piotr Kubaj gives a quick notice that he managed to get OpenBSD and FreeBSD both booting. \> I know GNU people don't like BSD, so let me make it quick :) \> \> \> I've succeeded in booting FreeBSD 11.0-RC1 using txt mode on my X200 \> with the newest Libreboot. \> \> To get installer to boot, I used: \> kfreebsd (usb0,gpt3)/boot/kernel/kernel \> set FreeBSD.vfs.mountfrom=ufs:/dev/da1p3 \> boot \> \> I didn't try to install yet. \>
* The trick looks relatively simple (looks like GRUB), manually loading the kernel with ‘kfreebsd’ and then setting the vfs.root.mountfrom variable to find the USB stick.
* In an update he also mentions booting OpenBSD with ‘kopenbsd’ instead of ‘kfreebsd’ (again GRUB syntax)
* Now somebody will need to test installation of the system (he didn’t) and see what other issues may crop up in running BSD on a free BIOS. \*\*\*

Beastie Bits:
----------

* [The ACPICA (ACPI Component Architecture) coding language AML now in DragonFly BSD](http://lists.dragonflybsd.org/pipermail/commits/2016-July/624192.html)

* [Release announcement for 4.3BSD Tahoe from 1988 ](https://groups.google.com/forum/#!topic/comp.sys.tahoe/50ManvdM1-s)

Feedback/Questions
----------

* [ Mike - Jail Uptime](http://pastebin.com/FLpybL6D)
* [ Greg - Router Hardware](http://pastebin.com/RGuayhB3)
* [ Kristof writes in](http://pastebin.com/NT4zmHiG)
* [ Ty - Updates and Logs](http://pastebin.com/CtetZdFg)
* [ Benjamin - MTA Bug ](http://pastebin.com/Qq3VbQG2) \*\*\*