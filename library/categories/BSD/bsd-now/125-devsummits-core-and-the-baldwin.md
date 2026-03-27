+++
title = "125: DevSummits, Core and the Baldwin"
description = "This week on the show, we will be talking to FreeBSD developer and former core-team member John Baldwin about a variety of topics, including running a DevSummit, everything you needed or wanted to know. Coming up right now on BSDNow, the place to B...SD.This episode was brought t"
date = "2016-01-20T13:00:00Z"
url = "https://www.bsdnow.tv/125"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.069718806Z"
seen = false
+++

This week on the show, we will be talking to FreeBSD developer and former core-team member John Baldwin about a variety of topics, including running a DevSummit, everything you needed or wanted to know. Coming up right now on BSDNow, the place to B...SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeBSD server retired after almost 19 years](http://www.theregister.co.uk/2016/01/14/server_retired_after_18_years_and_ten_months_beat_that_readers/) ###

* We’ve heard stories about this kind of thing before, that box that often sits under-appreciated, but refuses to die. Well the UK register has picked up on a story of a FreeBSD server finally being retired after almost 19 years of dedicated service.

“In its day, it was a reasonable machine - 200MHz Pentium, 32MB RAM, 4GB SCSI-2 drive,” Ross writes. “And up until recently, it was doing its job fine.” Of late, however the “hard drive finally started throwing errors, it was time to retire it before it gave up the ghost!” The drive's a Seagate, for those of you looking to avoid drives that can't deliver more than 19 years of error-free operations.

* This system in particular had been running FreeBSD 2.2.1 over the years. Why not upgrade you ask? Ross has an answer for that:

“It was heavily firewalled and only very specific services were visible to anyone, and most only visible to our directly connected customers,” Ross told Vulture South. “By the time it was probably due for a review, things had moved so far that all the original code was so tightly bound to the operating system itself, that later versions of the OS would have (and ultimately, did) require substantial rework. While it was running and not showing any signs of stress, it was simply expedient to leave sleeping dogs lie.”

* All in all, an amazing story of the longevity of a system and its operating system. Do you have a server with a similar or even greater uptime? Let us know so we can try and top this story. \*\*\*

### [Roundup of all the BSDs](https://www.linuxvoice.com/group-test-bsd-distros/) ###

* The magazine LinuxVoice recently did a group test of a variety of “BSD Distros”.
* Included in their review were Free/Open/Net/Dragon/Ghost/PC
* It starts with a pretty good overview of BSD in general, its starts and the various projects / forks that spawned from it, such as FreeNAS / Junos / Playstation / PFSense / etc
* The review starts with a look at OpenBSD, and the consensus reached is that it is good, but does require a bit more manual work to run as a desktop. (Most of the review focuses on desktop usage). It ends up with a solid ⅘ stars though.
* Next it moves into GhostBSD, discusses it being a “Live” distro, which can optionally be installed to disk. It loses a few points for lacking a graphical package management utility, and some bugs during the installation, but still earns a respectable ⅗ stars.
* Dragonfly gets the next spin and gets praise for its very-up to date video driver support and availability of the HAMMER filesystem. It also lands at ⅗ stars, partly due to the reviewer having to use the command-line for management. (Notice a trend here?)
* NetBSD is up next, and gets special mention for being one of the only “distros” that doesn’t do frequent releases. However that doesn’t mean you can’t have updated packages, since the review mentions pkgsrc and pkg as both available to customize your desktop. The reviewer was slightly haunted by having to edit files in /etc by hand to do wireless, but still gives NetBSD a ⅗ overall.
* Last up are FreeBSD and PC-BSD, which get a different sort of head-to-head review. FreeBSD goes first, with mention that the text-install is fairly straight-forward and most configuration will require being done by hand. However the reviewer must be getting use to the command-line at this point, because he mentions:

“This might sound cumbersome, but is actually pretty straightforward and at the end produces a finely tuned aerodynamic system that does exactly what you want it to do and nothing else.”

* He does mention that FreeBSD is the ultimate DIY system, even to the point of not having the package management tools provided out of box.
* PC-BSD ultimately gets a lot of love in this review, again with it being focused on desktop usage this follows. Particularly popular are all the various tools written to make PC-BSD easier to use, such as Life-Preserver, Warden, the graphical installer and more. (slight mistake though, Life-Preserver does not use rsync to backup to FreeNAS, it does ZFS replication)
* In the end he rates FreeBSD ⅘ and PC-BSD a whopping 5/5 for this roundup.
* While reviews may be subjective to the particular use-case being evaluated for, it is still nice to see BSD getting some press and more interest from the Linux community in general. \*\*\*

### [OpenBSD Laptops](http://www.tedunangst.com/flak/post/openbsd-laptops) ###

* Our buddy Ted Unangst has posted a nice “planning ahead” guide for those thinking of new laptops for 2016 and the upcoming OpenBSD 5.9
* He starts by giving us a status update on several of the key driver components that will be in 5.9 release“5.9 will be the first release to support the graphics on Broadwell CPUs. This is anything that looks like i5-5xxx. There are a few minor quirks, but generally it works well. There’s no support for the new Skylake models, however. They’ll probably work with the VESA driver but minus suspend/resume/acceleration (just as 5.8 did with Broadwell).”
* He then goes on to mention that the IWM driver works well with most of the revisions (7260, 7265, and 3160) that ship with broadwell based laptops, however the newer skylake series ships with the 8260, which is NOT yet supported.
* He then goes on to list some of the more common makes and models to look for, starting with the broadwell based X1 carbons which work really well (Kris gives +++), but make sure its not the newer skylake model just yet.
* The macbook gets a mention, but probably should be avoided due to broadcom wifi
* The Dell XPS he mentions as a good choice for a powerful (portable) desktops \*\*\*

### [Significant changes from NetBSD 7.0 to 8.0](https://www.netbsd.org/changes/changes-8.0.html) ###

* Updated to GCC 4.8.5
* Imported dhcpcd and replaced rtsol and rtsold
* gpt(8) utility gained the ability to resize partitions and disks, as well as change the type of a partition
* OpenSSH 7.1 and OpenSSL 1.0.1q
* FTP client got support for SNI for https
* Imported dtrace from FreeBSD
* Add syscall support
* Add lockstat support \*\*\*

Interview - John Baldwin - [jhb@freebsd.org](mailto:jhb@freebsd.org) / [@BSDHokie](https://twitter.com/BSDHokie)
----------

FreeBSD Kernel Debugging

---

News Roundup
----------

### [Dragonfly Mail Agent spreads to FreeBSD and NetBSD](https://www.dragonflydigest.com/2016/01/18/17508.html) ###

* DMA, the Dragonfly Mail Agent is now available not only in Dragonfly’s dports, but also FreeBSD ports, and NetBSD pkgsrc
* “dma is a small Mail Transport Agent (MTA), designed for home and office use. It accepts mails from locally installed Mail User Agents (MUA) and delivers the mails either locally or to a remote destination. Remote delivery includes several features like TLS/SSL support and SMTP authentication. dma is not intended as a replacement for real, big MTAs like sendmail(8) or postfix(1). Consequently, dma does not listen on port 25 for incoming connections.”
* There was a project looking at importing DMA into the FreeBSD base system to replace sendmail, I wonder of the port signals that some of the blockers have been fixed \*\*\*

### [ZFS UEFI Support has landed!](https://svnweb.freebsd.org/base?view=revision&revision=294068) ###

* Originally started by Eric McCorkle
* Picked up by Steven Hartland
* Including modularizing the existing UFS boot code, and adding ZFS boot code
* General improvements to the EFI loader including using more of libstand instead of containing its own implementations of many common functions
* Thanks to work by Toomas Soome, there is now a Beastie Menu as part of the EFI loader, similar to the regular loader
* As soon as this was committed, I added a few lines to it to connect the ZFS BE Menu to it, thanks to all of the above, without whom my work wouldn’t be usable
* It should be relatively easy to hook my GELI boot stuff in as a module, and possibly just stack the UFS and ZFS modules on top of it
* I might try to redesign the non-EFI boot code to use a similar design instead of what I have now \*\*\*

### [How three BSD OSes compare to ten Linux Distros](http://www.phoronix.com/scan.php?page=article&item=3bsd-10linux) ###

* After benchmarking 10 of the latest Linux distros, Phoronix took to benchmarking 3 of the big BSDs
* DragonFlyBSD 4.4.1 - The latest DragonFly release with GCC 5.2.1 and the HAMMER file-system.
* OpenBSD 5.8 - OpenBSD 5.8 with GCC 4.2.1 as the default compiler and FFS file-system.
* PC-BSD 10.2 - Derived off FreeBSD 10.2, the defaults were the Clang 3.4.1 compiler and ZFS file-system.
* In the SQLite test, PCBSD+ZFS won out over all of the Linux distros, including those that were also using ZFS
* In the first compile benchmark, PCBSD came second only to Intel’s Linux distro, Clear Linux. OpenBSD can last, although it is not clear if the benchmark was just comparing the system compiler, which would be unfair to OpenBSD
* In Disk transaction performance, against ZFS won the day, with PCBSD edging out the Linux distros. OpenBSD’s older ffs was hurt by the lack of soft updates, and DragonFly’s Hammer did not perform well. Although in an fsync() heavy test, safety is more important that speed
* As with all benchmarks, these obviously need to be taken with a grain of salt
* In some of them you can clearly see that the ‘winner’ has a much higher standard error, suggesting that the numbers are quite variable \*\*\*

### [OPNSense 15.7.24 Released](https://opnsense.org/opnsense-15-7-24-released/) ###

* We are just barely into the new year and OPNSense has dropped a new release on us to play with.
* This new version, 15.7.24 brings a bunch of notable changes, which includes improvements to the firewall UI and a plugin management section of the firmware page. Additionally better signature verification using PKG’s internal verification mechanisms was added for kernel and world updates.
* The announcement contains the full rundown of changes, including the suricata, openvpn and ntp got package bumps as well. \*\*\*

### Beastie Bits ###

[A FreeBSD 10 Desktop How-to](https://cooltrainer.org/a-freebsd-desktop-howto/) (A bit old, but still one of the most complete walkthroughs of a desktop FreeBSD setup from scratch)

[BSD and Scale 14](http://fossforce.com/2016/01/bsd-ready-scale-14x/)

[Xen support enabled in OpenBSD -current](http://undeadly.org/cgi?action=article&sid=20160114113445&mode=expanded)

---

Feedback/Questions
----------

* [ Matt - Zil Sizes](http://slexy.org/view/s20a0mLaAv)
* [ Drin - IPSEC](http://slexy.org/view/s21qpiTF8h)
* [ John - ZFS + UEFI](http://slexy.org/view/s2HCq0r0aD)
* [ Jake - ZFS Cluster SAN](http://slexy.org/view/s2VORfyqlS)
* [ Phillip - Media Server](http://slexy.org/view/s20ycRhUkM) \*\*\*