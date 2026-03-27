+++
title = "148: The place to B...A Robot!"
description = "This week on the show, Allan and I are going to be showing you a very interesting interview we did talking about using FreeBSD to driveThis episode was brought to you by[iXsystems - Enterprise Servers and <brStorage for Open Source](http://www.ixsyste"
date = "2016-06-29T12:00:00Z"
url = "https://www.bsdnow.tv/148"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.024305801Z"
seen = false
+++

This week on the show, Allan and I are going to be showing you a very interesting interview we did talking about using FreeBSD to drive

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and <br>
Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![](/images/2.png) alt="DigitalOcean - Simple Cloud Hosting, Built for Developers" /\>](http://www.digitalocean.com/)[![]() src="/images/3.png" alt="Tarsnap - Online Backups for the Truly Paranoid" /\>](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeBSD Core Team Election](https://www.freebsd.org/administration.html#t-core) ###

* Core.9 has been elected, and will officially take over from Core.8 on Wednesday, 6 July 2016
* Many thanks to the outgoing members of the core team for their service over the last 2 years
* 214 out of 325 eligible voters (65.8%) cast their votes in an election counting 14 candidates.
* The top nine candidates are, in descending order of votes received:
* 180 84.1% Ed Maste (incumbent)
* 176 82.2% George V. Neville-Neil (incumbent)
* 171 79.9% Baptiste Daroussin (incumbent)
* 168 78.5% John Baldwin
* 166 77.6% Hiroki Sato (incumbent)
* 147 68.7% Allan Jude
* 132 61.7% Kris Moore
* 121 56.5% Benedict Reuschling
* 108 50.5% Benno Rice
* There was no tie for ninth.
* BSDNow and the entire community would also like to extend their thanks to all those who stood for election to the core team
* Next week’s core meeting will encompass the members of Core.8 and Core.9, as responsibility for any outstanding items will be passed from outgoing members of core to the new incoming members \*\*\*

### [Why I run OpenBSD](http://deftly.net/posts/2016-05-31-why-i-run-openbsd.html) ###

* This week we have a good article / blog post talking about why the posted has moved to OpenBSD from Linux.

>
>
> “One thing I learned during my travels between OSs: consistency is everything.
>
>
>
> Most operating systems seem to, at least, keep a consistent interface between themselves and binaries / applications. They do this by keeping consistent APIs (Application Programming Interfaces) and ABIs (Application Binary Interfaces). If you take a binary from a really old version of Linux and run or build it on a brand-spanking new install of Linux, it will likely Just Work™. This is great for applications and developers of applications. Vendors can build binaries for distribution and worry less about their product working when it gets out in the wild (sure this binary built in 2016 will run on RedHat AS2.1!!).“
>
>

* The author then goes through another important part of the consistency argument, with what he calls “UPI” or “User Program Interfaces”. In other words, while the ABI may be stable, what about the end-user tooling that the user directly has to interact with on a daily basis?

>
>
> “This inconsistency seems to have come to be when Linux started getting wireless support. For some reason someone (vendors, maybe?) decided that ifconfig wasn’t a good place to let users interact with their wireless device. Maybe they felt their device was special? Maybe there were technical reasons? The bottom line is, someone decided to create a new utility to manage a wireless device… and then another one came along… pretty soon there was iwconfig(8), iw(8), ifconfig(8), some funky thing that let windows drivers interface with Linux.. and one called ip(8) I am sure there are others I am forgetting, but I prefer to forget. I have moved onto greener pastures and the knowledge of these programs no longer serves me.”
>
>

* The article then goes through the rundown of how he evaluated the various BSD’s and ultimately settled on OpenBSD:

>
>
> “OpenBSD won the showdown. It was the most complete, simple, and coherent system. The documentation was thorough, the code was easy to follow   
>  and understand.  
>  It had one command to configure all of the network interfaces!  
>  I didn’t have wireless, but I was able to find a cheap USB adapter that worked by simply running man -k wireless and reading about the USB   
>  entries.  
>  It didn’t have some of the applications I use regularly, so I started reading about ports (intuitively, via man ports!).”
>
>
> ---
>

### [The ultimate NetBSD Router](http://blog.tbrodel.me/2016/#netbsd-router) ###

>
>
> “So yesterday I spent the day setting up a new firewall at home here, based off of this BSD Now tutorial. Having set up a couple of OpenBSD routers before, either based on old laptops, bulky old power-sucking desktops or completely over-specced machines like the Intel NUC, I wanted to get some kind of BSD onto a low-powered ARM board and use that instead.”  
>  “I've had a couple of Cubietrucks lying around for a while now, I've used them in a couple of art installations, running Debian and Pure Data, but over all they've been a bit disappointing. It's more the manufacturer's fault but they require blobs for the graphics and audio, which Debian won't allow, so as a multimedia board they're dud for video, and only passable for audio work with a usb sound card. So they've been collecting dust.”  
>  “Only thing missing is a second NIC, luckily I had an Apple USB-\>Ethernet dongle lying around, which when I bought it was the cheapest thing I could find on eBay that OpenBSD definitely supported. There, and on NetBSD, it's supported by the axe(4) driver. USB 2.0 works fine for me as I live in Australia and my ISP can only give me 30Mbps, so this should do for the forseeable future.”
>
>
>
> * The article then walks through installing and configuring NetBSD
> * Configuration includes: pf, unbound, and dhcpd “This project has been really fun, I started with basically no experience with NetBSD and have finished with a really useful, low-powered and robust appliance. It's a testament to the simplicity of the NetBSD system, and the BSD design principles in general, that such a novice as myself could figure this out. The NetBSD project has easily the most polished experience on Allwinner ARM boards, even Debian doesn't make it this easy. It's been a joy running the system, it has the bits I love from OpenBSD; ksh(1), tmux(1), an http daemon in base and of course, pf(4). This is mixed with some of the pragmatism I see in FreeBSD; a willingness to accept blobs if that really is the only way to boot, or get audio, or a video console.” \*\*\*
>
>

### [bhyve-Bootable Boot Environments](http://callfortesting.org/bhyve-boot-environments/) ###

* We have a lengthy article also today from our friend Michael Dexter, who asks the basic question “What if multibooting and OS upgrades weren't horrible?”
* No doubt if you’ve been a frequent listener to this show, you’ve heard Allan or Myself talking about ZFS Boot Environments, and how they can “change your life”.
* Well today Michael goes further into detail on how the BE’s work, and how they can be leveraged to do neat things, like installing other versions of an operating system from the original running system.

>
>
> “If you are reading this, you have probably used a personal computer with a BSD or GNU/Linux operating system and at some point attempted to multiboot between multiple operating systems on the same computer. This goal is typically attempted with complex disk partitioning and a BSD or GNU/Linux boot loader like LILO or GRUB, plus several hours of frustrating experimentation and perhaps data loss. While exotic OS experimentation has driven my virtualization work since the late 1990s, there are very pragmatic reasons for multibooting the same OS on the same hardware, notable for updates and failback to "known good" versions. To its credit, FreeBSD has long had various strategies including the NanoBSD embedded system framework with primary and secondary root partitions, plus the nextboot(8) utility for selecting the "next" kernel with various boot parameters. Get everything set correctly and you can multiboot "with impunity".
>
>
>
> “That's a good start, and over time we have seen ZFS "boot environments" be used by PC-BSD and FreeNAS to allow for system updates that allow one to fall back to previous versions should something go wrong. Hats off to these efforts but they exist in essentially purpose-built appliance environments. I have long sensed that there is more fun to be had here and a wonderful thing happened with FreeBSD 10.3 and 11.0: Allan Jude added a boot environment menu to the FreeBSD loader”
>
>

* From here Michael takes us through the mechanical bits of actually creating a new ZFS dataset (BE) and performing a fresh FreeBSD 10.3 installation into this new boot-environment.
* The twist comes at the end, where he next sets up the BE to be a root NFS for booting in bhyve! This is interesting and gives you a way to test booting into your new environment via a VM, before rebooting the host directly into it. \*\*\*

Interview - Edicarla Andrade & Vinícius Zavam - [@egypcio](https://twitter.com/egypcio)
----------

* BSD-Powered Robots

---

News Roundup
----------

### [Tomohiro Kasumi explains what “@@” means, in the context of the Hammer filesystem](http://lists.dragonflybsd.org/pipermail/users/2016-June/249717.html) ###

* A post from the Dragonfly users’ mailing list about what the @@ construct means in the Hammer filesystem
* “@@ represents the existence of a PFS which is logically separated pseudo filesystem space within HAMMER's B-Tree”
* “HAMMER only has 1 large B-Tree per filesystem (not per PFS), so all the PFS exist within that single B-Tree. PFS are separated by localization parameter which is one of the B-Tree keys used to lookup the tree.”
* Each substring in "@@-1:00001" means:
  1. "@@" means it's a PFS or snapshot.
  2. "-1" means it's a master.
  3. ":" is just a separator.
  4. "00001" means it's PFS#1, where PFS#0 is the default PFS created on newfs. There is no "00000" because that's what's mounted on /HAMMER. PFS# is used for localization parameter.

* “Localization parameter has the highest priority when inserting or looking up B-Tree elements, so fs elements that belong to the same PFS# tend to be localized (clustered) within the B-Tree”
* There is also a note about how snapshots are named: "@@0x00..."
* A user points out that having : in the path can confuse some applications, such as in the case of adding the current directory or a relative path to the $PATH environment variable, which is a colon delimited list of paths
* This seems quite a bit more confusing that the datasets created by ZFS, but they might have other useful properties \*\*\*

### [FreeBSD 11.0 nearing RC1](https://www.freebsd.org/releases/11.0R/schedule.html) ###

* We’ve all been eagerly awaiting the pending release of FreeBSD 11.0, and the schedule has now been updated!
* The first release candidate is slated for July 29th!
* If all goes well (and we stick to schedule) there will be another RC2 and possible RC3 release, before 11.0 officially drops near the end of August.
* Start playing with those builds folks, be sure to send your feedback to the team to make this the best .0 release ever! \*\*\*

### [TensorFlow on FreeBSD](http://ecc-comp.blogspot.com/2016/06/tensorflow-on-freebsd.html) ###

* Next we have a blog post about the experience of a “new” FreeBSD user trying to deploy some non-ported software to his new system.
* Specifically he was interested in running TensorFlow, but not doing a port himself, because in his words:

>
>
> “First, I apologize for not supplying a port archive myself. After reading the FreeBSD handbook for creating a port, it's too complex of a task for me right now. I've only been using FreeBSD for two weeks. I would also not like to waste anyone's time giving them a terrible port archive and mess up their system.”
>
>

* First of all, good ports are often born out of bad ports! Don’t let the porting framework daunt you, give it a go, since that's the only way you are going to learn how to write “good” ports over time. The porters-handbook is a good first place to start, plus the community usually is very helpful in providing feedback.
* He then walks us through the changes made to the TensorFlow code (starting with the assumption that OSX was a good “flavor” to begin porting from) and ultimately compiling.
* This ends up with the creation of a pip package which works!
* A good tutorial, and also very similar to what goes on in the porting process. With this write-up perhaps somebody will take up creating a port of it… hint hint! \*\*\*

### [NetBSD: A New Beginning?](http://jamesdeagle.blogspot.ca/2016/06/netbsd-new-beginning.html) ###

* We don’t get enough NetBSD news at times, but this post by James Deagle talks about his adventure with NetBSD 7.0 and making it his “new beginning”

>
>
> “After a few months of traipsing around the worlds of SunOS and Linux, I'm back to NetBSD for what I hope will be a lengthy return engagement. And while I'm enamored of NetBSD for all the previously-mentioned reasons, I'm already thinking ahead to some problems to solve, some of which have also been mentioned before.”
>
>

* He then goes through and lists some of the small nits he’s still running into during the daily workflow

* YouTube audio - Specifically he mentions that no audio is playing, but wonders if Flash plays some part. (Ideally you’re not using Flash though, in which case you need to check the audio backend FF is using. Try PulseAudio since it seems the best supported. If pulse is already enabled, install ‘pavucontrol’ to make sure audio is playing to the correct sound device)

* Slow gaming performance (TuxKart and Celestia) - Check DRI / Xorg? Or is it CPU bound?

* Lastly some unspecified Wireless issues, which typically end up being driver related. (Or use another chipset)

  ---

### Beastie Bits ###

* [Reproducible NetBSD? 77.7% of the way there](https://reproducible.debian.net/netbsd/netbsd.html)

* [Create FreeBSD virtual machine using qemu. Run the VM using xhyve.](https://gist.github.com/zg/38a3afa112ddf7de4912aafc249ec82f)

* [FreeBSD PowerPC 32bit pkg repository (unofficial). \~19,500 packages, more to come](https://joshcummings.net/pub/FreeBSD)

* [NetBSD machines at Open Source Conference 2016 Gunma](http://mail-index.netbsd.org/netbsd-advocacy/2016/05/16/msg000706.html)

* [Adam Leventhal (of ZFS and DTrace) does an analysis of APFS ](http://arstechnica.com/apple/2016/06/a-zfs-developers-analysis-of-the-good-and-bad-in-apples-new-apfs-file-system/)

* [SemiBug June meeting summary](http://lists.nycbug.org/pipermail/semibug/2016-June/000106.html)

* [KnoxBug Meeting](http://knoxbug.org/content/2016-07-26)

---

Feedback/Questions
----------

* [ Andrew - iocage ](http://pastebin.com/nuYTzaG6)
* [ Florian - Arm + GitHub](http://pastebin.com/PzY68hNS)
* [ Clint - Synth](http://pastebin.com/JESGZjLu)
* [ Leonardo - Translations](http://pastebin.com/b4LAiPs4)
* [ Zachary - Moving things to VMs](http://pastebin.com/VRc8fvBk) \*\*\*