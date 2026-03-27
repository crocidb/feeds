+++
title = "1: BGP & BSD"
description = "We kick off the first episode with the latest BSD news, show you how to avoid intrusion detection systems and talk to Peter Hessler about BGP spam blacklists!HeadlinesRadeon KMS commited "
date = "2013-09-04T04:00:00Z"
url = "https://www.bsdnow.tv/1"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.309476542Z"
seen = false
+++

We kick off the first episode with the latest BSD news, show you how to avoid intrusion detection systems and talk to Peter Hessler about BGP spam blacklists!

Headlines
----------

### [Radeon KMS commited](https://lists.freebsd.org/pipermail/svn-src-head/2013-August/050931.html) ###

* Committed by Jean-Sebastien Pedron
* Brings kernel mode setting to -CURRENT, will be in 10.0-RELEASE (ETA 12/2013)
* 10-STABLE is expected to be branched in October, to begin the process of stabilizing development
* Initial testing shows it works well
* May be merged to 9.X, but due to changes to the VM subsystem this will require a lot of work, and is currently not a priority for the Radeon KMS developer
* Still suffers from the syscons / KMS switcher issues, same as Intel video
* More info: [https://wiki.freebsd.org/AMD\_GPU](https://wiki.freebsd.org/AMD_GPU) \*\*\*

### [VeriSign Embraces FreeBSD](http://www.eweek.com/enterprise-apps/verisign-embraces-open-source-freebsd-for-diversity/) ###

* "BSD is quite literally at the very core foundation of what makes the Internet work"
* Using BSD and Linux together provides reliability and diversity
* Verisign gives back to the community, runs vBSDCon
* "You get comfortable with something because it works well for your particular purposes and can find a good community that you can interact with. That all rang true for us with FreeBSD." \*\*\*

### [fetch/libfetch get a makeover](http://freshbsd.org/commit/freebsd/r253680) ###

* Adds support for SSL certificate verification
* Requires root ca bundle (security/root\_ca\_nss)
* Still missing TLS SNI support (Server Name Indication, allows name based virtual hosts over SSL) \*\*\*

### [FreeBSD Foundation Semi-Annual Newsletter](http://www.freebsdfoundation.org/press/2013Jul-newsletter) ###

* The FreeBSD Foundation took the 20th anniversary of FreeBSD as an opportunity to look at where the project is, and where it might want to go
* The foundation sets out some basic goals that the project should strive towards:
  * Unify User Experience
    * “ensure that knowledge gained mastering one task translates to the next”
    * “if we do pay attention to consistency, not only will FreeBSD be easier to use, it will be easier to learn”

  * Design for Human and Programmatic Use
    * 200 machines used to be considered a large deployment, with high density servers, blades, virtualization and the cloud, that is not so anymore
    * “the tools we provide for status reporting, configuration, and control of FreeBSD just do not scale or fail to provide the desired user experience”
    * “The FreeBSD of tomorrow needs to give programmability and human interaction equal weighting as requirements”

  * Embrace New Ways to Document FreeBSD
    * More ‘Getting Started’ sections in documentation
    * Link to external How-Tos and other documentation
    * “upgrade the cross-referencing and search tools built into FreeBSD, so FreeBSD, not an Internet search engine, is the best place to learn about FreeBSD”

* Spring Fundraising Campaign, April 17 - May 31, raised a total of $219,806 from 12 organizations and 365 individual donors. In the same period last year we raised a total of $23,422 from 2 organizations and 53 individuals
* Funds donated to the FreeBSD Foundation have been used on these projects recently:
* Capsicum security-component framework
* Transparent superpages support of the FreeBSD/ARM architecture
* Expanded and faster IPv6
* Native in-kernel iSCSI stack
* Five New TCP Congestion Control Algorithms
* Direct mapped I/O to avoid extra memory copies
* Unified Extensible Firmware Interface (UEFI) boot environment
* Porting FreeBSD to the Genesi Efika MX SmartBook laptop (ARM-based)
* NAND Flash filesystem and storage stack
* Funds were also used to sponsor a number of BSD focused conferences: BSDCan, EuroBSDCon, AsiaBSDCon, BSDDay, NYCBSDCon, vBSDCon, plus Vendor summits and Developer summits
* It is important that the foundation receive donations from individuals, to maintain their tax exempt status in the USA. Even a donation of $5 helps make it clear that the FreeBSD Foundation is backed by a large community, not only a few vendors
* [Donate Today ](http://www.freebsdfoundation.org/donate) \*\*\*

The place to B...SD
----------

#### [Ohio Linuxfest, Sept. 13-15, 2013](http://ohiolinux.org/schedule) ####

* Very BSD friendly
* Kirk McKusick giving the keynote
* BSD Certification on the 15th, all other stuff on the 14th
* Multiple BSD talks \*\*\*

#### [LinuxCon, Sept. 16-18, 2013](http://events.linuxfoundation.org/events/linuxcon-north-america) ####

* Dru Lavigne and Kris Moore will be manning a FreeBSD booth
* Number of talks of interest to BSD users, [including ZFS coop](http://linuxconcloudopenna2013.sched.org/event/b50b23f3ed3bd728fa0052b54021a2cc?iframe=yes&w=900&sidebar=yes&bg=no)

#### [EuroBSDCon, Sept. 26-29, 2013](http://2013.eurobsdcon.org/eurobsdcon-2013/talks/) ####

* Tutorials on the 26 & 27th (plus private FreeBSD DevSummit)
* 43 talks spread over 3 tracks on the 28 & 29th
* Keynote by Theo de Raadt
* Hosted in the picturesque St. Julians Area, Malta (Hilton Conference Centre) \*\*\*

Interview - Peter Hessler - [phessler@openbsd.org](mailto:phessler@openbsd.org) / [@phessler](https://twitter.com/phessler)
----------

Using BGP to distribute spam blacklists and whitelists

---

Tutorial
----------

### [Using stunnel to hide your traffic from Deep Packet Inspection](http://www.bsdnow.tv/tutorials/stunnel) ###

---

News Roundup
----------

### [NetBSD 6.1.1 released](https://blog.netbsd.org/tnf/entry/netbsd_6_1_1_released) ###

* First security/bug fix update of the NetBSD 6.1 release branch
* Fixes 4 security vulnerabilities
* Adds 4 new sysctls to avoid IPv6 DoS attacks
* Misc. other updates \*\*\*

### [Sudo Mastery](http://blather.michaelwlucas.com/archives/1792) ###

* MWL is a well-known author of many BSD books
* Also does SSH, networking, DNSSEC, etc.
* Next book is about sudo, which comes from OpenBSD (did you know that?)
* Available for preorder now at a discounted price \*\*\*

### [Documentation Infrastructure Enhancements](http://freebsdfoundation.blogspot.com/2013/08/new-funded-project-documentation.html) ###

* Gábor Kövesdán has completed a funded project to improve the infrastructure behind the documentation project
* Will upgrade documentation from DocBook 4.2 to DocBook 4.5 and at the same time migrate to proper XML tools.
* DSSSL is an old and dead standard, which will not evolve any more.
* DocBook 5.0 tree added \*\*\*

### [FreeBSD FIBs get new features](https://svnweb.freebsd.org/base?view=revision&revision=254943) ###

* FIBs (as discussed earlier in the interview) are Forward Information Bases (technical term for a routing table)
* The FreeBSD kernel can be compiled to allow you to maintain multiple FIBs, creating separate routing tables for different processes or jails
* In r254943 ps(1) is extended to support a new column ‘fib’, to display which routing table a process is using \*\*\*

### [FreeNAS 9.1.0 and 9.1.1 released](http://www.ixsystems.com/resources/ix/news/ixsystems-announces-revolutionary-freenas-910-release.html) ###

* Many improvements in nearly all areas, big upgrade
* Based on FreeBSD 9-STABLE, lots of new ZFS features
* Cherry picked some features from 10-CURRENT
* New volume manager and easy to use plugin management system
* 9.1.1 released shortly thereafter to fix a few UI and plugin bugs \*\*\*

### [BSD licensed "patch" becomes default](http://freshbsd.org/commit/freebsd/r253689) ###

* bsdpatch has become mature, does what GNU patch can do, but has a much better license
* Approved by portmgr@ for use in ports
* Added WITH\_GNU\_PATCH build option for people who still need it \*\*\*