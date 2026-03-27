+++
title = "122: The BSD Black Box"
description = "This week on the show, we will be interviewing Alex Rosenberg, toThis episode was brought to you byiXsystems - Enterprise Servers and Storage for Open Source[![DigitalOcean - Simple Cloud Hosting, Built for Developers"
date = "2015-12-30T13:00:00Z"
url = "https://www.bsdnow.tv/122"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.075705932Z"
seen = false
+++

This week on the show, we will be interviewing Alex Rosenberg, to

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

#### [iX Systems Mission Complete](https://www.ixsystems.com/missioncomplete/) ####

* Submit your story of how you accomplished a mission with FreeBSD, FreeNAS, or iXsystems hardware, and you could win monthly prizes, and have your story featured in the FreeBSD Journal! \*\*\*

Headlines
----------

### [Life with an OpenBSD Laptop: A UNIX-lover's tale of migrating away from the Mac. The Good, The Bad, The Ugly](http://www.nycbug.org/event/10356/openbsd_laptop_nycbug_2015.pdf) ###

* OpenBSD user Isaac (.ike) Levy details his switch from a Mac to an OpenBSD laptop
* He covers a bit about selecting hardware and dealing with wifi
* Talks about binary packages and system upgrades
* Talks about power management, suspend/resume, battery life
* Show screenshots of some of his favourite window managers
* Browsers and email clients are also discussed
* Things he found missing in OpenBSD:
  * A journaling file system, every unclean shutdown means a full fsck(1)
  * UTF-8/unicode was not everywhere
  * Syncing pictures and contacts to his phone
  * Drawing tools \*\*\*

### [DragonFlyBSD matches its Intel kernel graphics driver against Linux 4.0](http://lists.dragonflybsd.org/pipermail/commits/2015-December/459067.html) ###

* The DragonFlyBSD DRM stack continues to rapidly advance, now bringing in support from Linux 4.0!
* Some of the notable features:
* Basic Skylake support  

  * Panel Self-Refresh (PSR) now supported on Valleyview and Cherryview  

  * Preparations for atomic display updates  

  * Performance improvements on various GPU families, including Cherryview, Broadwell and Haswell  

  * GPU frequencies are now kept at a minimum of 450MHz when possible on Haswell and Broadwell, ensuring a minimum experience level for various types of workloads  

  * Improved reset support for gen3/4 GPUs, which should fix some OpenGL crashes on Core 2 and pre-2012 Atom machine
  * Better sound/graphics driver synchronization for audio over hdmi support  

  * As usual, small bugfixes and stability improvements here and there \*\*\*

### [A BSD Wish List for 2016](http://fossforce.com/2015/12/bsd-wish-list-2016/) ###

* Larry over at Foss Force brings us his wish list for BSD support in 2016.
* Since he has converted most of his daily desktop usage to PC-BSD, he is specifically wanting support for some desktop applications. Namely Google hangouts and Spotify.
* This is something which has come up periodically among the PC-BSD community. At the moment most users are dual-booting or using alternatives, like WebRTC. However the Google Hangouts plugin is available for Linux, and perhaps this will encourage some developers to see if we can get it running with the newer Linux stack on -CURRENT.
* Spotify also has a native Linux version, which may need testing on FreeBSD - CURRENT. It may be closer now, and should be updated on the Wanted Ports Page
* [https://wiki.freebsd.org/WantedPorts](https://wiki.freebsd.org/WantedPorts) \*\*\*

### [Hard Float API coming soon by default to armv6](http://bsdimp.blogspot.com/2015/12/hard-float-api-coming-soon-by-default.html) ###

* Warner Losh talks about upcoming changes to armv6 on FreeBSD
* “All the CPUs that FreeBSD supports have hard floating point in them. We've supported hard float for quite some time in the FreeBSD kernel. However, by default, we still use a soft-float ABI.”
* First, “A new armv6hf (architecture) was created, but that caused some issues with some ports, and the meaning of 'soft float' sadly was ambiguous between the soft-float ABI, and the soft-float libraries that implement floating point when there's no hardware FPU”
* “Over the spring and summer, I fixed ld.so so that it can load both soft ABI and hard ABI libraries on the same system, depending on markings in the binaries themselves. Soft float ABI and hard float ABI binaries have different flags in the ELF headers, so it is relatively straightforward to know which is which.”
* “So, in the coming days, I'll commit the first set of changes to move to armv6 as a hard float ABI by default. The kernel doesn't care: it can execute both. The new ld.so will allow you to transition through this change by allowing old, compat soft ABI libraries to co-exist on the system with new hard ABI libraries. This change alone isn't enough, but it will be good to get it out into circulation.”
* “armv6hf will be removed before FreeBSD 11”
* A LIBSOFT will be created, similar in concept to the LIB32 available on AMD64 \*\*\*

Interview - Alex Rosenberg - [alexr@leftfield.org](mailto:alexr@leftfield.org) / [@alexr](https://twitter.com/alexr)
----------

* Former Manager of Platform Architecture at Sony \*\*\*

### Beastie Bits ###

* [Tuesday, Dec 20, 2005 was the release date of the very first bsdtalkpodcast](http://bsdtalk.blogspot.com/2005/12/bsdtalk001-intro-to-bsd.html)

* [Patch: Server side support for TCP FastOpen ](https://reviews.freebsd.org/D4350)

* [Learn to tame OpenBSD quickly](http://www.openbsdjumpstart.org/)

* [Hardware Accerated iSCSI lands in FreeBSD ](https://svnweb.freebsd.org/base?view=revision&revision=292740)

* [Settings for full HD resolution on DragonFlyBSD under QEMU/KVM, thanks to reddit user Chapo\_Rouge](https://www.reddit.com/r/dragonflybsd/comments/3x4n7u/psa_1920x1080_on_dragonflybsd_44_under_qemukvm/)

* [Patch: An IllumOS developer has been porting the FreeBSD boot loader to replace their old version of GRUB. In doing so, he has also made improvements to the block caching in the boot loader ](https://reviews.freebsd.org/D4713)

* [A FreeBSD user working at Microsoft talks about Microsoft’s shift to Open Source ](http://blog.teleri.net/open-microsoft/)

* [BSDCG Exam Session at FOSDEM'16](https://fosdem.org/2016/schedule/event/cert_bsdcg/)

* [Schedule for the BSD devroom at FOSDEM'16](https://fosdem.org/2016/schedule/track/bsd/)

* [OpenBSD snapshots are now 5.9](http://marc.info/?l=openbsd-cvs&m=145055446007162&w=2)

* [Notes on making BSD grep faster ](http://blog.erratasec.com/2015/12/some-notes-on-fast-grep.html#.VoQKD1JSRhx)

* [Intel’s Platform Application Engineering (PAE) group within the Networking Division (ND) is looking for a Network Software Engineer](https://www-ssl.intel.com/content/www/us/en/jobs/job-search/js2.html?job=782165&src=ML-12080)

* [Did you watch Die Hard at Christmas? Get the Die Hard FreeBSD boot screen: install this file in /boot and set loader\_logo="tribute" in /boot/loader.conf ](http://locheil.shxd.cx/logo-tribute.4th)

---

Feedback/Questions
----------

* [ Jeremy - ZFS without root](http://slexy.org/view/s20CTqtEan)
* [ Dan - Getting PC-BSD Media](http://slexy.org/view/s20sNPoDm5)  

* [ Chris - VMs and FreeBSD](http://slexy.org/view/s2hjsVgGBK)
* [ Ben - Haswell and IRC](http://slexy.org/view/s21pwYOTHi)
  * [Instructions for trying the Haswell patch](<https://wiki.freebsd.org/Graphics/Update i915 GPU driver to Linux 3.8>)

* [ Matt - Donation to foundation](http://slexy.org/view/s20vifHCyc) \*\*\*