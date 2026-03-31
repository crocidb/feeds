+++
title = "123: ZFS in the trenches"
description = "This week on BSDNow, we will be talking shop with Josh Paetzel of FreeNAS fame, hearing about his best do’s and do-nots of using ZFS in production. Also, a quickiX Systems Mission Complete * Submit your story of how you accom"
date = "2016-01-06T13:00:00Z"
url = "https://www.bsdnow.tv/123"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.073836043Z"
seen = true
+++

This week on BSDNow, we will be talking shop with Josh Paetzel of FreeNAS fame, hearing about his best do’s and do-nots of using ZFS in production. Also, a quick

#### [iX Systems Mission Complete](https://www.ixsystems.com/missioncomplete/) ####

* Submit your story of how you accomplished a mission with FreeBSD, FreeNAS, or iXsystems hardware, and you could win monthly prizes, and have your story featured in the FreeBSD Journal! \*\*\*

#### [FreeNAS Logo Design Contest](https://www.ixsystems.com/freenas-logo-contest/) ####

[Rules and Requirements](https://forums.freenas.org/index.php?threads/freenas-logo-design-contest.39968/)

---

#### For those of you curious about Kris' new lighting here are the links to what he is using. ####

* [Softbox Light Diffuser](http://smile.amazon.com/gp/product/B00OTG6474?psc=1&redirect=true&ref_=oh_aui_detailpage_o01_s00&pldnSite=1)
* [Full Spectrum 5500K CFL Bulb](http://smile.amazon.com/gp/product/B00198U6U6?psc=1&redirect=true&ref_=oh_aui_detailpage_o06_s00) \*\*\*

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [A Brief look back at 2015](http://fossforce.com/2015/12/bsd-brief-look-back-2015/) ###

* As we start the show this week, we begin with a brief look back at BSD in 2015, brought to us by Larry at FOSS force.
* Aside from his issue with tap-to-click on the touchpad, his PC-BSD experience has been pretty good. (Larry, if you hear this, jump on #pcbsd on FreeNode and we will lend a hand)
* He mentions that this *really* isn’t his first time running BSD, apparently back in ye-olden days he got NetBSD up and running on a PowerBook G3, until an update brought that experience to abrupt ending.
* He gives a shout-out to the FreeBSD Foundation as being a great go-to source for wrapup on the previous year in FreeBSD land, while also mentioning the great 4.4 release of DragonFly, and some of the variants, such as RetroBSD and LiteBSD
* He leaves us with a tease for 2016 that work is ongoing on Twitter to port over Mopidy, a python based extensible music server \*\*\*

### [A look forward at BSD events throughout 2016](http://www.bsdevents.org/scheduler/) ###

* After a quick look back at 2015, now its time to start planning your 2016 schedule. The BSDEvents site has a calendar of all the upcoming conferences / shows where BSD will have a presence this year.
* There are quite a few items on the agenda, including non BSD specific conferences, such as SCALE / Fosdem and more.
* Take a look and see, you may be able to find something close your location where you can come hang out with other BSD developers.
* (or better yet), if a linux conference is coming to your town, think about submitting a BSD talk!
* Additionally, if getting BSD Certification is something on your 2016 resolutions, you can often take the test at one of these shows, avoiding the need to travel to a testing center. \*\*\*

### [The 'Hidden' Cost of Using ZFS for Your Home NAS](http://louwrentius.com/the-hidden-cost-of-using-zfs-for-your-home-nas.html) ###

* An article was recently posted that seems to be trying to dissuade people from using ZFS for their home NAS
* It points out what experienced users already know, but many newcomers are not strictly aware of: Expanding a ZFS pool is not always as straightforward as you think it should be
* ZFS was designed to be expanded, and it handled this very well
* However, a ZFS pool is made up of VDEVs, and it is these VDEVs that provide the redundancy. RAID-Z VDEVs cannot be changed once they are created. You can replace each disk individually, and the VDEV will grow to its new larger size, but you cannot add additional disks to a RAID-Z VDEV
* At this point, your option is to add an additional VDEV, although best practises dictate that the new VDEV should use an equal number of disks, to avoid uneven performance
* So, if you started with a 6 disk RAID-Z2, having to add 6 more disks to grow the pool does seem excessive
* For the best flexibility, use mirrors. If you had used 6 disks as 3 mirrors of 2 disks each, you could then just add 2 more disks at a time. The downside is that using 2TB disks, you’d only have 6TB of usable space, versus the 8TB you would get from those disks in a RAID-Z2
* This is the trade-off, mirrors give you better performance and flexibility, but less space efficiency
* It is important to note that the diagrams in this article make it appear as if all parity information is stored on specific drives. In ZFS parity is spread across all drives. Often times, the data written to the drive is not of a size that can evenly be split across all drives, so the data actually ends up [looking like this](http://blog.delphix.com/matt/files/2014/06/RAIDZ.png)
* The errors as I see it in the original article are:
  * It notes that the hidden cost of ZFS is that if you add a second RAID-Z VDEV, you will have a whole second set of parity drives. While this is a cost, it is the cost of making sure your data is safe. If you had an array with more than 12 drives, it is likely that you would to be able to withstand the failure of the larger number of drives
  * The article does not consider the resilver time. If you did create a configuration with a very wide RAID-Z stripe, the failure of a disk would leave the pool degraded for a much longer time, leaving your pool at risk for that longer period.
  * The article does not consider performance. Two RAID-Z2 VDEVs of 6 disks each will give much better performance than a single VDEV of 10 or 12 disks, especially when it comes to IOPS. \*\*\*

### [ZFS Boot Enviroments now availble in the FreeBSD bootloader](https://svnweb.freebsd.org/base?view=revision&revision=293001) ###

* It’s been in phabricator for a while (and PC-BSD), but the support for Boot-Environments has now landed upstream in -CURRENT
* This work was helped by cross-project collaboration when an IllumOS Developer, Toomas Soome, started porting the FreeBSD loader to IllumOS to replace GRUB there
* This gives Beastie menu the ability to look at the ZFS disk, and dynamically list boot-environments that it finds. (Much nicer than GRUB, which required a pre-written configuration file)
* This work was extended further, when Toomas Soome also ported the [Beastie Menu to the UEFI loader](https://svnweb.freebsd.org/base?view=revision&revision=293233) which is now [enabled by default for UEFI](https://svnweb.freebsd.org/base?view=revision&revision=293234)
* All of these changes are scheduled to be merged back in time for FreeBSD 10.3 as well.
* There is also a patch being worked on to [support booting from ZFS in UEFI](https://reviews.freebsd.org/D4515)
* This is exciting times for doing neat things with ZFS on root, these plus Allans forthcoming [GELI support](https://reviews.freebsd.org/D4593) will negate the necessity for GRUB on PC-BSD for example (Kris is very happy) \*\*\*

Interview - Josh Paetzel - [email@email](mailto:email@email) / [@bsdunix4ever](https://twitter.com/bsdunix4ever)
----------

* ZFS Support \*\*\*

News Roundup
----------

### [RetroBSD being tested on ESP32](http://retrobsd.org/viewtopic.php?f=1&t=37470) ###

* More hardware news for RetroBSD and LiteBSD
* I don’t know much about this hardware, but there is a lot of discussion in the forum threads about it
* Not sure what you are supposed to accomplish with only 400kb of ram
* [LITEBSD Brings 4.4BSD to PIC32](https://hackaday.com/2016/01/04/litebsd-brings-4-4bsd-to-pic32/)
* It is interesting to see these super-small boards with only 512kb of memory, but will crypto offload support
* It is also interesting to see talk of 140mbps WiFi, can the processor actually handle that much traffic? [BSD Unix-like OS is Resurrected for Embedded IoT Market](http://thevarguy.com/open-source-application-software-companies/bsd-unix-os-resurrected-embedded-iot-market)
* Related to the above stories, we also have an article about BSD making a resurgence on various Internet of things devices, which mentions both RetroBSD and LiteBSD
* The article mentions that this is an exciting development for embedded vars who now have an alternative licensed open-source OS to potentially use \*\*\*

### [HardenedBSD’s new Binary Updater](https://hardenedbsd.org/article/shawn-webb/2015-12-31/introducing-hardenedbsds-new-binary-updater) ###

* It looks like there is now another way to update your FreeBSD(hardened) system
* The post by Shawn Web, details how the new updater will work in future releases of HBSD
* Right now it looks fairly straight-forward, creating both the base.txz and kernel.txz, along with some data for etcupdate
* It includes a nice option for the kernel name in the update, allowing different kernels to be installed / updated at will
* Everything is cryptographically signed and verified using the base system openssl
* The build system is fairly simple, only requiring “sh/git/openssl” to create the binary updates
* Planned features also include updating of jails, and ZFS boot-environments \*\*\*

### [Sometimes, processors need (BSD) love too](http://functionallyparanoid.com/2016/01/02/sometimes-processors-need-love-too/) ###

* We have a blog post from Brian Everly, talking about his long journey into legacy processors and the plans for the future to work on better supporting them on OpenBSD ports
* He begins with the story of his UNIX journey to today, and why this fostered his love for many of these old (and not so old) architectures, such as Sparc64, PPC32, i386.
* This journey ended up with the purchase of some legacy hardware (ebay is your friend), and the creation of a database listing the major port blockers on each platform
* This is the great kind of thing folks can do to step up and help a project, even as a weekend hobby it’s great to run some hardware and help test / fix up issues that other developers maybe don’t interact with as much anymore. \*\*\*

### Beastie Bits ###

[The standard MWL disclaimer](http://blather.michaelwlucas.com/archives/2510)

[PC-BSD 11.0-CURRENTJAN2016 Available](http://lists.pcbsd.org/pipermail/testing/2016-January/010350.html)

[NetBSD pkgsrc-2015Q3 statistics](http://mail-index.netbsd.org/tech-pkg/2015/12/28/msg016193.html)

[NetBSD pkgsrc-2015Q4 released](http://mail-index.netbsd.org/tech-pkg/2016/01/01/msg016213.html)

[First Reproducible builds conference in Athens](http://blog.netbsd.org/tnf/entry/reproducible_builds_conference_in_athens)

[The creator of the original ThinkPad design passes away ](http://www.theregister.co.uk/2016/01/06/thinkpad_designer_obituary)

---

Feedback/Questions
----------

* [ Andrew - High Contrast](http://slexy.org/view/s213iCKLwn)
* [ John - FreeNAS followup](http://slexy.org/view/s21ClGePLP)
* [ Giorgio - Custom Install](http://slexy.org/view/s21527pkO1)
* [ Don - ZFS Slowdowns](http://slexy.org/view/s2jOlCsjkU)
* [ Fred - Dual Boot PC-BSD/Linux](http://slexy.org/view/s21uaB0FDU) \*\*\*