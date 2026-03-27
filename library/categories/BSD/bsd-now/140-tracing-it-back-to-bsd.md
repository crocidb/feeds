+++
title = "140: Tracing it back to BSD"
description = "This week on BSDNow, Allan is back in down from Europe! We’ll get to hear some of his wrap-up and get caught up on the latest BSDThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems.com/bsd"
date = "2016-05-04T12:00:00Z"
url = "https://www.bsdnow.tv/140"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.039923489Z"
seen = false
+++

This week on BSDNow, Allan is back in down from Europe! We’ll get to hear some of his wrap-up and get caught up on the latest BSD

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeBSD Quarterly Report](http://www.freebsd.org/news/status/report-2016-01-2016-03.html) ###

* This quarterly status report starts with a rather interesting introduction by Warren Block
* ASLR
* Porting CEPH to FreeBSD
* RCTL I/O Rate Limiting
* The Graphics Stack on FreeBSD (Haswell is in, work is progressing on the next update)
* CAM I/O Scheduler
* NFS Server updates, working around the 16 group limit, and implementing pNFS, allowing NFS to scale beyond a single server
* Static Analysis of the FreeBSD Kernel with PVS Studio
* PCI-express HotPlug
* GitLab Port committed!
* WITH\_FAST\_DEPEND and other improvements to the FreeBSD build system
* Lots of other interesting stuff \*\*\*

### [A Prog By Any Other Name](http://www.tedunangst.com/flak/post/a-prog-by-any-other-name) ###

* Ted Unangst looks at what goes into the name of a program
* “Sometimes two similar programs are really the same program with two names. For example, grep and egrep are two commands that perform very similar functions and are therefore implemented as a single program. Running ls -i and observing the inode number of each file will reveal that there is only one file. Calling the program egrep is a shorthand for -E and does the same thing.”
* So BSD provides \_\_progname in libc, so a program can tell what its name is
* But, what if it has more than one name?
* “In fact, every program has three names: its name in the filesystem, the name it has been invoked with, and whatever it believes its own name to be.”
* Of course it is not that easy.
* “there’s another set of choices for each name, the full path and the basename”
* “It’s even possible on some systems for argv[0] to be NULL.”
* He then goes on to rename doas (the OpenBSD light replacement for sudo) to banana and discuss what happens
* “On that note, another possible bug is to realize that syslog by default uses progname. A user may be able to evade log monitoring by invoking doas with a different name. (Just fixed.)”
* Another interesting article from our friend Ted \*\*\*

### [FreeBSD](https://summerofcode.withgoogle.com/organizations/4892834293350400/) and [NetBSD](https://summerofcode.withgoogle.com/organizations/6246531984261120/) Google Summer of Code projects have been announced ###

* Some FreeBSD highlights:
  * Add SCSI passthrough to CTL (share an optical drive via iSCSI)
  * Add USB target mode driver based on CTL (share a USB device via iSCSI)
  * API to link created /dev entries to sysctl nodes
  * Implement Ethernet Ring Protection Switching (ERPS)
  * HD Audio device model in userspace for bhyve

* Some NetBSD highlights:
  * Implement Ext4fs support in ReadOnly mode
  * NPF and blacklistd web interface
  * Port U-Boot so it can be compiled on NetBSD
  * Split debug symbols for pkgsrc builds \*\*\*

### [libressl - more vague priomises](http://www.tedunangst.com/flak/post/libressl-more-vague-promises) ###

* We haven’t had a Ted U article on the show as of late, however this week we get several! In his next entry “LibreSSL, more vague promises”
* He then goes into some detail on what has happened with LibreSSL in the past while, as well as future plans going forward.
* “With an eye to the future, what new promises can we make? Some time ago I joked that we only promised to make a better TLS implementation, not a better TLS. Remains true, but fortunately there are people working on that, too. TLS 1.3 support is on the short term watchlist. The good news is we may be ahead of the game, having already removed compression. How much more work can there be?”
* “LibreSSL integrated the draft chacha20-poly1305 construction from BoringSSL. The IETF has since standardized a slightly different version because if it were the same it wouldn’t be different. Support for standard variant, and the beginning of deprecation for the existing code, should be landing very shortly. Incidentally, some people got bent out of shape because shipping chacha20 meant exposing non IANA approved numbers to Internet. No promises that won’t happen again.” \*\*\*

Interview - Samy Al Bahra - [@0xF390](https://twitter.com/0xF390)
----------

* Backtrace \*\*\*

News Roundup
----------

### [systrace(1) is removed for OpenBSD 6.0](http://marc.info/?l=openbsd-cvs&m=146161167911029&w=2) ###

* OpenBSD has removed systrace, an older mechanism for limiting what syscalls an application can make
* It is mostly replaced by the pledge() system
* OpenBSD was the first implementation, most others have been unmaintained for some time
* The last reported Linux version was for kernel 2.6.1
* NetBSD removed systrace in 2007 \*\*\*

### [pfSense Video Series: Comprehensive Guide To pfSense 2.3](https://www.youtube.com/playlist?list=PLE726R7YUJTePGvo0Zga2juUBxxFTH4Bk) ###

* A series of videos (11 so far), about pfSense
* Covers Why you would use it, how to pick your hardware, and installation
* Then the series covers some networking basics, to make sure you are up to speed before configuring your pfSense
* Then a comprehensive tour of the WebUI
* Then goes on to cover graphing, backing up and restoring configuration
* There are also videos on running DHCP, NTP, and DNS servers \*\*\*

### [DuckDuckGo announces its 2016 FOSS Donations ](https://duck.co/blog/post/303/2016-foss-donations-announcement) ###

* The theme is “raising the standard of trust online”
* Supported projects include:
* [OpenBSD Foundation announces DuckDuckGo as a Gold Sponsor](http://undeadly.org/cgi?action=article&sid=20160503085227&mode=expanded)
* the Freedom of the Press Foundation for SecureDrop
* the Freenet Project
* the CrypTech Project
* the Tor Project
* Fight for the Future for Save Security
* Open Source Technology Improvement Fund for VeraCrypt (based on TrueCrypt)
* Riseup Labs for LEAP (LEAP Encryption Access Project)
* GPGTools for GPGMail \*\*\*

### [Larry the BSD Guy hangs up his hat at FOSS Force](http://fossforce.com/2016/04/bsd-linuxfest-northwest/) ###

* After 15 years, Larry the BSD Guy has decided to hang it up, and walk into the sunset! (Figuratively of course)
* After wrapping up coverage of recent LinuxFest NorthWest (Which he didn’t attend), Larry has decided it’s time for a change and is giving up his column over at FOSS Force, as well as stepping away from all things technical.
* His last write-up is a good one, and he has some nice plugs for both Dru Lavigne and Michael Dexter of the BSD community.
* He will be missed, but we wish him all the luck with the future! He also puts out the plug that FOSS Force will be needing a new columnist in the near future, so if you are interested please let them know! \*\*\*

Beastie Bits
----------

* [If you sponsored “FreeBSD Mastery: Advanced ZFS”, check your mail box ](http://blather.michaelwlucas.com/archives/2648)
* [pkg-1.7.0 is an order of magnitude slower than pkg-1.6.4](https://marc.info/?l=freebsd-ports&m=146001143408868&w=2) -- Caused by a problem not in pkg
* [LinuxFest Northwest 2016 Recap](https://www.ixsystems.com/blog/linuxfest-northwest-2016/)
* [Dru Lavigne's 'Doc like an Egyption' talk from LFNW](https://www.linuxfestnorthwest.org/2016/sessions/doc-egyptian)
* [Michael Dexters' 'Switching to BSD from Linux' talk from LFNW](https://www.linuxfestnorthwest.org/2016/sessions/devil-details-switching-bsd-linux)
* [Michael Dexters' 'Secrets to enduring user groups' talk from LFNW](https://www.linuxfestnorthwest.org/2016/sessions/20-year-and-counting-secrets-enduring-user-groups)
* [January issue of Freebsd Journal online for free](https://www.freebsdfoundation.org/journal/)
* [Ghost BSD releases 10.3 Alpha1 for testing](http://ghostbsd.org/10.3_alpha1)
* [EuroBSDcon 2016 - Call for Papers - Dealine: May 8th](https://www.freebsdnews.com/2016/04/15/eurobsdcon-2016-call-for-papers/)
* [KnoxBUG Initial Meeting](http://www.knoxbug.org/content/knoxbug-maiden-voyage)
* [Photos, slides, and videos from the Open Source Data Center Conference ](https://www.netways.de/en/events_trainings/osdc/archive/osdc2016/) \*\*\*

Feedback/Questions
----------

* [ Mohammad - Replication](http://pastebin.com/KDnyWf6Y)
* [ John - Rolling new packages](http://pastebin.com/mAbRwbEF)
* [Clint - Unicast](http://pastebin.com/BNa6pyir)
* [ Bill - GhostBSD](http://pastebin.com/KDjS2Hxa)
* [ Charles - BSD Videos](http://pastebin.com/ABUUtzWM) \*\*\*