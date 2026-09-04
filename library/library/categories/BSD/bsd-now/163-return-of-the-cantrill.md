+++
title = "163: Return of the Cantrill"
description = "The wait is over, 11.0 of FreeBSD has (officially) launched. We’ll have coverage of this, plus a couple looks back at UNIX history, and a crowd-favorite guest today.This episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Open Source](/images/"
date = "2016-10-12T12:00:00Z"
url = "https://www.bsdnow.tv/163"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.991957246Z"
seen = true
+++

The wait is over, 11.0 of FreeBSD has (officially) launched. We’ll have coverage of this, plus a couple looks back at UNIX history, and a crowd-favorite guest today.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[ href="http://www.digitalocean.com/" title="DigitalOcean"\>![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)]()[ href="http://www.tarsnap.com/bsdnow" title="Tarsnap"\>![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)]()

---

Headlines
----------

### [FreeBSD 11.0-RELEASE Now Available](https://lists.freebsd.org/pipermail/freebsd-announce/2016-October/001760.html) ###

* FreeBSD 11.0-RELEASE is now officially out.
* A last minute reroll to pickup OpenSSL updates and a number of other security fixes meant the release was a little behind schedule, and shipped as 11.0-RELEASE-p1, but the release is better for it
* Improved support for 802.11n and various wifi drivers
* Support for the AArch64 (arm64) architecture has been added.
* Native graphics support has been added to the bhyve(8) hypervisor.
* A new flag, “onifconsole” has been added to /etc/ttys. This allows the system to provide a login prompt via serial console if the device is an active kernel console, otherwise it is equivalent to off.
* The xz(1) utility has been updated to support multi-threaded compression.
* A number of kernel panics related to VNET have been fixed
* The IMAGACT\_BINMISC kernel configuration option has been enabled by default, which enables application execution through emulators, such as QEMU via binmiscctl(8).
* The GENERIC kernel configuration has been updated to include the IPSEC option by default.
* The kern.osrelease and kern.osreldate are now configurable jail(8) parameters
* A new sysctl(8), kern.racct.enable, has been added, which when set to a non-zero value allows using rctl(8) with the GENERIC kernel. A new kernel configuration option, RACCT\_DISABLED has also been added.
* The minimum (arc\_min) and maximum (arc\_max) values for the ZFS adaptive replacement cache can be modified at runtime.
* **Changes to watch out for**:
  * OpenSSH DSA key generation has been disabled by default. It is important to update OpenSSH keys prior to upgrading. Additionally, Protocol 1 support has been removed.
  * By default, the ifconfig(8) utility will set the default regulatory domain to FCC on wireless interfaces. As a result, newly created wireless interfaces with default settings will have less chance to violate country-specific regulations.
  * An issue was discovered with Amazon® EC2™ images which would cause the virtual machine to hang during boot when upgrading from previous FreeBSD versions. New EC2™ installations are not affected, but existing installations running earlier releases are advised to wait until the issue is resolved in an Errata Notice before upgrading. An Errata Notice to address this is planned following the release. \*\*\*

### [process listing consistency](http://www.tedunangst.com/flak/post/process-listing-consistency) ###

* Ted Unangst asks: how consistent is the output of ps(1)?
* If processes are starting and exiting constantly, and you run ps(1), is the output guaranteed to reflect that exact moment in time, or might it include some processes that have gone away before ps(1) exited, and include some processes that did not exist when ps(1) was started?
* Ted provides a little example chicken/egg program to try to create such an inconsistency, so you can test out your OS
* On OpenBSD ps(1) was switched away from the reading kernel memory directly, and instead uses the KERN\_PROC\_ALL sysctl

>
>
> Thus sysctl can iterate over the entire process list, copying out information to ps(1), without blocking. If we prevent processes from forking or exiting during this time, we get a consistent snapshot. The snapshot may be stale, but it will never show us a viewpoint that never happened.
>
>

* So, OpenBSD will always be consistent, or will it?

>
>
> Is there a way to trick ps on OpenBSD? Not everything is consistent. There’s a separate sysctl, KERN\_PROC\_ARGV, that reads the command line arguments for a process, but it only works on one process at a time. Processes can modify their own argv at any time.
>
>

* A second test program changes the process title of both the chicken and the egg, and if you run ps(1), you can get back a result that never actually happened.

* The argv of the first program is read by ps(1), and in the meantime, it changes to a different value. The second program also changes its value, so now when ps(1) reads it, it sees the new value, not the original value from when ps(1) was started.

* So the output is not that consistent, but is it worth the effort to try to make it so?

  ---

### [DragonFlyBSD - if\_iwm - Add basic powermanagement support via ifconfig wlan0 powersave](http://lists.dragonflybsd.org/pipermail/commits/2016-October/624673.html) ###

* WiFi can often be one of the biggest drains on your laptop battery, so anything we can do to improve the situation should be embraced.
* Imre VadÃ¡sz over at the DragonFly project has done that, porting over a new set of power management support from Linux to the if\_iwm driver.

>
>
> if\_iwm - Add basic powermanagement support via ifconfig wlan0 powersave.
>
>
>
> * The DEVICE\_POWER\_FLAGS\_CAM\_MSK flag was removed in the upstream iwlwifi in Linux commit ceef91c89480dd18bb3ac51e91280a233d0ca41f.
>   
>   
> * Add sc\_ps\_disabled flag to struct iwm\_softc, which corresponds to mvm-\>ps\_disabled in struct iwl\_mvm in Linux iwlwifi.
>   
>   
> * Adds a hw.iwm.power\_scheme tunable which corresponds to the power\_scheme module parameter in Linux iwlwifi. Set this to 1 for completely disabling power management, 2 (default) for balanced powermanagement, and 3 for lowerpower mode (which does dtim period skipping).
>   
>   
>   * Imports the constants.h file from iwlwifi as if\_iwm\_constants.h.
>   * This doesn't allow changing the powermanagement setting while connected, also one can only choose between enabled and disabled powersaving with ifconfig (so switching between balanced and low-power mode requires rebooting to change the tunable).
>   * After any changes to powermanagement (i.e. "ifconfig wlan0 powersave" to enable powermanagement, or "ifconfig wlan0 -powersave" for disabling powermanagement), one has to disconnect and reconnect to the accespoint for the change to take effect.“
>   
>   
>
>

* Good stuff! These positive changes need to happen more often and sooner, so we can all eek out every drop of power from our respective laptops. \*\*\*

### [Helping out an Internet Friend…Dual boot OpenBSD ](https://functionallyparanoid.com/2016/10/03/helping-out-an-internet-friend/) ###

* Dual-booting OpenBSD and Linux, via UEFI. A year ago we wouldn’t be discussing this, but today we have an article where somebody has done exactly that.
* This Journey was undertaken by Brian Everly (Indiana Bug), partly due to a friend who wanted to dual-boot his laptop which already has an existing UEFI install on it.
* As a proof of concept, he began by replicating the setup in VMware with UEFI
* He started by throwing Ubuntu into the VM, with some special attention paid to partitioning to ensure enough room left-over for OpenBSD later.

>
>
> I created a 64MB EFI partition at the front of the disk. Next, I created a 20GB primary partition at the beginning of the space, mounted as the root (/) filesystem.
>
>
>
> I then added a 4096MB swap partition for Ubuntu. Finally, I used the rest of the free space to create a Reserved BIOS Boot Area FAT32 partition that was not associated with a mount point – this is where I will be installing OpenBSD.
>
>

* With that done, he wrapped up the Ubuntu installation and then turned over to to the OpenBSD side. Some manual partitioning was required to install to the “Reserved FAT32” partition.

>
>
> I mashed through the defaults in the OpenBSD installer until I got to the disk partitioning. Since I told VMWare to make my hard drive an IDE one, I knew I was playing around with wd0 and not sd0 (my USB key). I dumped into fdisk by selecting to (E)dit the partition scheme and saw my setup from Linux. First was the EFI partition (I am guessing I’ll have to copy my bootx64.efi file to that at some point), second was the Linux etx4 partition, third was my Linux swap partition and fourth was a weird looking one that is the “Reserved BIOS Boot” partition. That’s the one I’ll fiddle with.
>
>
>
> Issuing the command “edit 3” allowed me to fiddle with that partition #3 (remember, we start counting at zero). I set it’s type to “A6” (OpenBSD) and then took the defaults with the exception of naming it “OpenBSD”. A quick “write” followed by a “quit” allowed me to update my new partition and get back to the installer.
>
>

* Once the installation was wrapped up (OpenBSD helpfully already created the /boot/EFI partition with the correct EFI loader installed) he was able to reboot and select between the two systems at the UEFI bios screen.
* For kicks, he lastly went into Ubuntu and grabbed refind. Installing refind provided a fancy graphical selector between the two systems without too much trouble.
* Next step will be to replicate this process on his friend’s laptop. Wishing you luck with that journey!

---

Interview - Bryan Cantrill - [email@email](mailto:email@email) / [@twitter](https://twitter.com/user)
----------

* CTO of Joyent \*\*\*

News Roundup
----------

### [After 22 Years, 386BSD Gets An Update](https://bsd.slashdot.org/story/16/10/09/0230203/after-22-years-386bsd-gets-an-update) ###

* Slashdot brings us an interesting mention this week, specifically that after 22 years, we now have an update to 386BSD.

>
>
> 386BSD was last released back in 1994 with a series of articles in Dr. Dobb's Journal -- but then developers for this BSD-based operating system started migrating to both FreeBSD and NetBSD. An anonymous Slashdot reader writes: The last known public release was version 0.1. Until Wednesday, when Lynne Jolitz, one of the co-authors of 386BSD, released the source code to version 1.0 as well as 2.0 on Github.
>
>
>
> 386BSD takes us back to the days when you could count every file in your Unix distribution and more importantly, read and understand all of your OS source code. 386BSD is also the missing link between BSD and Linux. One can find fragments of Linus Torvalds's math emulation code in the source code of 386BSD. To quote Linus: "If 386BSD had been available when I started on Linux, Linux would probably never had happened.”
>
>
>
> Though it was designed for Intel 80386 microprocessors, there's already instructions for launching it on the hosted hardware virtualization service Qemu.
>
>

* There you have it! Go grab the new hotness that is 386BSD and run it in 2016! Or perhaps you want FreeBSD 11, but to each their own. \*\*\*

### [Progress of the OpenBSD Limited Edition Signed CD set](http://undeadly.org/cgi?action=article&sid=20160929230557&mode=expanded) ###

* An update from a story last week! We mentioned the “very” limited edition OpenBSD 6.0 signed CD sets that had gone up for Auction on Ebay. (With proceeds to support for Foundation)
* As of today, here’s where we stand:

  * CD set #1 (Sep 29th + 5 days) [sold for $4200](http://www.ebay.com/itm/-/331985953783)
  * CD set #2 (Oct 4th + 3 days) [sold for $3000](http://www.ebay.com/itm/-/331990536246)
  * CD set #3 (Oct 8th + 3 days) [sold for $817](http://www.ebay.com/itm/-/331994217419)
  * CD set #4 (Oct 11th + 3 days) is [currently up for bidding](http://www.ebay.com/itm/-/331997031152)

* There you have it! The 4th set is almost wrapped up bidding, and the 5th and last set is not far behind. Be sure to grab your piece of BSD history before its gone!

  ---

### [**PROTOTYPE** FreeBSD Jail/ZFS based implementation of the Application Container Specification](https://github.com/3ofcoins/jetpack) ###

>
>
> “Jetpack is an experimental and incomplete implementation of the App Container Specification for FreeBSD. It uses jails as isolation mechanism, and ZFS for layered storage.”  
>  “This document uses some language used in Rocket, the reference implementation of the App Container Specification. While the documentation will be expanded in the future, currently you need to be familiar at least with Rocket's README to understand everything.”
>
>
>
> * A standard with multiple implementations, that allow substitution of components, such as FreeBSD Jails instead of docker/lxc etc, and ZFS instead of overlayfs etc, is very exciting \*\*\*
>
>

### [Microsoft’s Forgotten Unix-based Operating System](https://fossbytes.com/xenix-history-microsoft-unix-operating-system/) ###

* Do you remember the good old days. You know, when Microsoft was the driving force behind UNIX? Wait, what did you say you may be thinking? It’s true, and lets sit back and let FossBytes tell us a tale of what once was reality.
* The story begins sometime in the late 70’s:

>
>
> Turning back the pages to the late 1970’s, Microsoft entered into an agreement with AT&T Corporation to license Unix from AT&T. While the company didn’t sell the OS to public, it licensed it to other OEM vendors like Intel, SCO, and Tandy.
>
>
>
> As Microsoft had to face legal trouble due to “Unix” name, the company renamed it and came up with its own Unix distribution. So, AT&T licensed Unix to Redmond that was passed on to other OEMs as Xenix.
>
>
>
> It’s interesting to recall a time when Microsoft enabled people to run Unix — an operating system originally designed for large and multiuser systems — on a microcomputer. Even though it came first, Unix was probably more powerful than MS-DOS.
>
>

* So whatever happened to this microsoft-flavored UNIX you may ask? Sadly it was ditched for DOS due to $REASONS:

>
>
> In early 1980’s, IBM was looking for an OS to power its PC. As IBM didn’t want to maintain any ties with the recently split AT&T, Xenix was automatically rejected. To fulfill, the tech giant’s demand, Microsoft bought 86-DOS from Seattle Computer Products and managed to convince IBM to use it in their systems.
>
>
>
> Slowly, Microsoft started losing interest in Xenix and traded the full rights of Xenix with SCO, a Xenix partner company. The company filed bankruptcy in 2007 before taking the Xenix legacy to the 21st century in the form of Open Server, previously known as SCO Unix and SCO Open Desktop.
>
>

* An interesting chapter in UNIX history to be sure, and funny enough may come full-circle someday with Microsoft beginning to show interest in UNIX and BSD once again. \*\*\*

Beastie Bits
----------

* [Ohio LinuxFest 2016 wrap-up](http://blather.michaelwlucas.com/archives/2791)

* [Learn X in Y minutes Where X=zfs](https://learnxinyminutes.com/docs/zfs/)

* [Add touchscreen support for the official 7" RPi touch display ](https://svnweb.freebsd.org/base?view=revision&revision=306430)

* [64-bit U-Boot on Raspberry Pi 3 ](https://kernelnomicon.org/?p=682)

* [SNIA SDC 2016 Recap: Michael Dexter](https://www.ixsystems.com/blog/snia-sdc-2016-recap-michael-dexter/)

* [OpenZFS: Stronger than ever](https://www.ixsystems.com/blog/openzfs-devsummit-2016/)

* [Accurate, Traceable, and Verifiable Time Synchronization for World Financial Markets](http://nvlpubs.nist.gov/nistpubs/jres/121/jres.121.023.pdf)

* [ON HOLY WARS AND A PLEA FOR PEACE](https://www.ietf.org/rfc/ien/ien137.txt)

---

Feedback/Questions
----------

* [ Morgan - Zero-Filling an VM](http://pastebin.com/CYcqmW7P)
* [ Charlie - ZFS Bit-Rot](http://pastebin.com/12mNW57h)
* [ Matias - TrueOS / Launchd](http://pastebin.com/NfYWt2cu)
* [ Dale - DO Feedback](http://pastebin.com/UvKh2WcF)
* [ James - DO / FreeBSD Locks?](http://pastebin.com/0cdMc88U) \*\*\*