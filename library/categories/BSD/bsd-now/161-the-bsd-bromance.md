+++
title = "161: The BSD Bromance"
description = "This week on BSDNow, we’re going to be hearing about Allan’s trip to EuroBSDCon, plus an Interview about “Bro on BSD”! Stay tuned, for your place toThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://ww"
date = "2016-09-28T12:00:00Z"
url = "https://www.bsdnow.tv/161"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.996465192Z"
seen = false
+++

This week on BSDNow, we’re going to be hearing about Allan’s trip to EuroBSDCon, plus an Interview about “Bro on BSD”! Stay tuned, for your place to

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[ href="http://www.digitalocean.com/" title="DigitalOcean"\>![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)]()[ href="http://www.tarsnap.com/bsdnow" title="Tarsnap"\>![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)]()

---

Headlines
----------

### EuroBSDCon 2016 Wrapup ###

* [Ollivier Robert’s Photos from EuroBSDCon ](https://assets.keltia.net/photos/EuroBSDCon-2016/)
* [Get your BSDNow die-cut stickers](http://www.jupiterbroadcasting.com/stickers/)

### [NetBSD for newbies - Develop your own Power PC](http://discusscomputerx.blogspot.com/2016/09/netbsd-for-noobies-your-power-laptop.html) ###

* We don’t get to feature too many stories on NetBSD being deployed as a Power PC (Not PowerPC, you know, a Powerful “PC”), so we jumped at this one.
* Specifically it starts off with some of the pre-req’s that you’ll need to get started, such as NetBSD 7.0.1 / amd64, along with some information about which wireless nics you may be using. (NetBSD like other BSD’s will give a driver based device name for network interfaces)
* From there, instructions on how to write your WPA\_supplicant config are provided, in order for us to fetch the NetBSD sources and convert to their -STABLE branch.
* After doing a CVS checkout of the sources, he then provides a walkthrough of doing a kernel compile / install, however it mentions changing the config, but doesn’t provide an example of what options were changed. Perhaps to remove drivers we don’t need?
* At this point the rest of the “desktop” setup is pretty straight forward. Some packages are added such as openbox, lxappearance, firefox, etc.
* To get working sound, firefox requires pulseaudio, which in turn needs dbus, so instructions on getting that service up and running are provided as well.
* When it’s all said and done, you’ll end up with your shiny new NetBSD -STABLE desktop (or laptop), bragging rights achieved! \*\*\*

### [More about OpenSMTPD 6.0.0](https://www.poolp.org/tech/posts/2016/09/12/opensmtpd-6-0-0-released/) ###

* OpenSMTPd 6.0.0 has just been released “and it's quite different from former releases.”
* “Unlike most of our releases, it comes out with almost no new feature.”, “Turns out most of the changes are not visible.”
* Changelog:
  * new fork+reexec model so each process has its own randomized memory space
  * logging format has been reworked
  * a "multi-line response" bug in the LMTP delivery backend has been fixed
  * connections concurrency limits have been bumped
  * artificial delaying in remote sessions have been reduced
  * dhparams option has been removed
  * dhe option has been added, supporting auto and legacy modes
  * smtp engine has been simplified
  * various cosmetic changes, code cleanup and documentation improvement

* “The OpenSMTPD bootstrap process was quite simple: Upon executation, the parent process would read configuration, build a memory representation of it and would then create a bunch of socketpair() before fork()-ing all of its child processes.”
* The problem is that this does not take advantage of the new address randomization feature. Each child will have the same memory layout, copied from the parent process
* “So deraadt@ suggested that if OpenSMTPD would not just fork() children but instead fork() them and reexecute the smtpd binary, then each of the children would have its own randomized memory space.”
* “The idea itself is neat, however not so trivial to implement because when we reexec the whole "inherit configuration and descriptors" part goes away. It's not just fork and exec, it's fork and exec and figure a way for the parent to pass back all the information and descriptors back to the new post-fork instance so it is the new instance that allocates memory and decides where the information goes.” \*\*\*

### [Upgrade a FreeBSD 10.3 Installation with ZFS on Root and Full Disk Encryption to 11.0](http://ftfl.ca/blog/2016-09-17-zfs-fde-one-pool-conversion.html) ###

* While FreeBSD 11.0 is not out yet, Joseph Mingrone has helped me work out and test the instructions for upgrading a FreeBSD 10.3 ZFS on full disk encryption setup (bootpool + zpool) to the new GELIBoot feature, which does not require any unencrypted partitions, just the 128kb bootcode
* Note: Do not upgrade to FreeBSD 11.0 yet. While some images have landed on the FTP server, they do not contain the final openssl fix and are going to be recreated.
* Currently, GELIBoot does not support key files, so the first step is to reencrypt the master key with only a passphrase.
* Next, to avoid GELIBoot picking up encrypted partitions that it does not support, or partitions you do not want decrypted at boot, only partitions with the GELIBoot flag are decrypted, so set the flag on your root partition
* Then, move the loader, kernel, and other files into /boot on the root filesystem, instead of them living on the bootpool. This allows the kernel to be versioned with boot environments, and is the main purpose of this work
* Then, install the newer gptzfsboot, as this is required to support GELIBoot
* The old 2gb bootpool partition is then purposely mislabeled as freebsd-vinum, so it is not picked up by the boot blocks. Later, if the upgrade is successful, this partition can be deleted, and used as addition swap or something
* In order to boot correctly, you want all boot environments to have the ‘canmount’ ZFS property set to ‘noauto’
* Thank you to Joseph for taking the time to prod me for the information required to write this up, and for testing it and finding all of the issues \*\*\*

Interview - Michael Shirk - [mshirk@daemon-security.com](mailto:mshirk@daemon-security.com) / [@shirkdog](https://twitter.com/shirkdog)
----------

* Running Bro on BSD \*\*\*

News Roundup
----------

### [FreeBSD based distro for virtual hosting platform and appliance](https://clonos.tekroutine.com/) ###

* An interesting new FreeBSD-based project as shown up online, called “ClonOS”, which bills itself as a “free open-source FreeBSD-based platform for virtual environments creation and management”
* It looks to be leveraging an impressive list of technologies, including Bhyve, Xen, Jails and CBSD / Puppet for management tasks.
* Among its list of features:

  * ZFS features support;
  * VM cloning, export, import
  * Ethernet SoftSwitch for separated networking
  * jails for lightweight container
  * VNC terminal for VM/containers
  * Templates for VM/containers
  * Configuration management/helpers
  * Multi-node operation

* Multi-Node? Color me intrigued!

* Right now it appears to be under heavy development, but we’ll reach out to the developer to see if we can get an interview lined up at some point!

  ---

### [The Raspberry PI Platform and The Challenges of Developing FreeBSD](https://bsdmag.org/oleksandr_rybalko/) ###

* BSDMag recently did an interview with FreeBSD developer Olesandr Rybalko!
* Oleksandr lives in the Ukraine, and while you may not have heard of him, he has worked on some cool projects for FreeBSD including the new “vt” console driver (Which a lot of people are using now), and ARM/MIPS support.
* The interview covers some of the work he’s done to get the PI support working with FreeBSD:

>
>
> I think, my main help here was a USB OTG driver, which I wrote before for another device (Ralink RT3052), then port it to R-Pi. But it was rewritten by Hans Peter Selasky. I do not know so much about USB as Hans knows.
>
>
>
> Another useful part of my help is Xorg support. I did a simple Xorg video driver which uses framebuffer exported by virtual terminal subsystem. That is help to many guys to start use RPi as a simple desktop system.
>
>

* He was also asked the question “Why would FreeBSD be good fit for ARM?”

>
>
> FreeBSD is very powerful as a network server. All modern network features in one box, with very fast processing.
>
>
>
> Another good side of FreeBSD is modularity. It is not required to write code to use some driver that was already written for another system, you can just define it in configuration files (kernel config, kernel hints, FDT). So if you want build a nice, R-Pi based, home server – use FreeBSD. If you want to play with devices attached to R-Pi’s GPIO – use FreeBSD.
>
>

* He also discusses his work on the ZRouter project, which is a very light-weight platform for tiny routers / embedded devices. But lastly the RPI comes up again, specifically asking him how interested individuals can get involved. Specifically the wiki.freebsd.org is a great reference point for those intested in getting started with FreeBSD on embedded. The warm community is also a plus!

---

### [Trying out the FreeBSD powered TrueOS](http://www.phoronix.com/scan.php?page=news_item&px=TrueOS-First-Spin) ###

* The folks over at Phoronix have done an early look at the new TrueOS desktop images and given some of their thoughts.
* First up he gives props to the installer, noting that:

>
>
> The TrueOS desktop installer is basically the same as from the PC-BSD days, just re-branded. Still one of the easiest BSD graphical installers I've dealt with and makes it a breeze for setting up a FreeBSD-on-ZFS system by default.
>
>

* After that they took it for a minimal spin, and thing mostly seem to be working. He mentions some of the default apps (Such as qupzilla and trojita) aren’t their favorite, but Lumina has come quite a ways for 1.0, despite a few rough edges still. (We are in the process of changing those default e-mail / browser apps)
* Lastly the article mentions that it’s time to do a more full BSD round-up to see the state of installation of them, which we happen to have next!

### [Trying out 8 BSDs on a modern PC](http://www.phoronix.com/scan.php?page=article&item=trying-8-bsds&num=1) ###

* First up was TrueOS again, which no major changes there, easy install and done.
* From there he tries out DragonFlyBSD, which he mentions that while the installer isn’t as easy, it is still one of his favorite BSD’s, working with all the hardware they’ve thrown at it.
* Next up was GhostBSD, which also has an Easy-To-Use graphical installer similar to TrueOS that made it quick to get loaded and up to the Mate desktop.
* Also tested was FreeBSD 11.0-RC2, which he mentions was easy to installed, and once done then ‘pkg’ could be used to easily get the setup he wanted setup.
* Turning over to page two we get to the naughty list of BSD’s he had troubles with.
* First up was OpenBSD which he tried 6.0. After installation and first boot, the display kept ‘disappearing’ which meant he couldn’t get IP information to try SSH’ing into the box. Perhaps a display driver error?
* NetBSD 7 was up next, where the installer couldn’t get past a root device prompt. Most likely trouble finding the install media, which was the same story with MightnightBSD as well.
* Also tested was “PacBSD” (Formerly ArchBSD) which he did manage to get installed, but not after major fighting with the process. After the process he ran into some issues getting packages up and running, but mentions it may have been bad timing due to them moving to a new server at the time. \*\*\*

### [IllumOS imports a modified FreeBSD boot loader to replace grub 0.97](https://www.listbox.com/member/archive/182181/2016/09/sort/time_rev/page/1/entry/0:1/20160923124232:B7978ED4-81AC-11E6-A6DA-02E3F010038B/) ###

* Toomas Soome’s work to port the FreeBSD boot loader to IllumOS has been merged into illumos-gate, the upstream repository for all IllumOS distributions
* Toomas’ work has also resulted in a number of commits to FreeBSD, and code sharing in both directions
* Toomas helped me a lot with the building of the ZFS boot environment listing menu, even though on IllumOS they use a configuration file to list the BEs, rather than interrogating the live zpool like we do in FreeBSD
* Toomas’ work to improve msdosfs and the block cache to speed up booting IllumOS also greatly helped FreeBSD
* This work means IllumOS can now boot from a RAID-Z (the old grub they used could not), and if the work Toomas has done on FreeBSD is any indication, support for almost all other zpool features is also on the way
* This work also sets IllumOS on a path to eventually having UEFI boot as well
* It is good to see this work happening, FreeBSD technology being reused elsewhere, but also the improvements being made for IllumOS are coming back to FreeBSD, often landing upstream first, to make merging them into IllumOS easier.
* The mailing list post describes how to convert existing systems away from grub, as well as how to opt to remain on grub for a while longer.
* Grub 0.97 is expected to be removed from IllumOS within a year. \*\*\*

Beastie Bits
----------

* [A demo of booting CentOS and Windows 10 in FreeBSD Bhyve through VNC headless](https://www.youtube.com/watch?v=8YQQfXqtyaA)
* [This year’s anemic output](http://blather.michaelwlucas.com/archives/2762)
* [“PAM Mastery” ebook now out](http://blather.michaelwlucas.com/archives/2771)
* [How-to Install OpenBSD 6.0 plus XFCE desktop and basic applications](https://www.youtube.com/watch?v=oC5D9fenQBs) \*\*\*

Feedback/Questions
----------

* [ Piotr - LibreBoot ](http://pastebin.com/yniniNpV)
* [ Alan - FreeBSD and PC-BSD](http://pastebin.com/dCNX0yF7)
* [ Eduardo - Newcomers](http://pastebin.com/LndNeAYb)
* [ Greg - ZFS ACL’s](http://pastebin.com/F0y6L6NK)
* [ Brian - Laptop Recs](http://pastebin.com/sqMPJGMM) \*\*\*