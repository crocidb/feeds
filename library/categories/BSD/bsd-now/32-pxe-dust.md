+++
title = "32: PXE Dust"
description = """This week on the big show we'll be showing off OpenBSD's new "autoinstall" feature to do completely automatic, unattended installations. We also have an interview with Dru Lavigne about all the writing work she does for FreeBSD, PCBSD and FreeNAS. The latest headlines and answers"""
date = "2014-04-09T12:00:00Z"
url = "https://www.bsdnow.tv/32"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.254186554Z"
seen = false
+++

This week on the big show we'll be showing off OpenBSD's new "autoinstall" feature to do completely automatic, unattended installations. We also have an interview with Dru Lavigne about all the writing work she does for FreeBSD, PCBSD and FreeNAS. The latest headlines and answers to your emails, on BSD Now - it's the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage For Open Source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)

---

Headlines
----------

### [FreeBSD ASLR status update](http://0xfeedface.org/blog/lattera/2014-04-03/awesome-freebsd-aslr-progress) ###

* Shawn Webb gives us a little update on his address space layout randomization work for FreeBSD
* He's implemented execbase randomization for position-independent executables (which OpenBSD also just enabled globally in 5.5 on i386)
* Work has also started on testing ASLR on ARM, using a Raspberry Pi
* He's giving a presentation at BSDCan this year about his ASLR work
* While we're on the topic of BSDCan... \*\*\*

### [BSDCan tutorials, improving the experience](http://bsdly.blogspot.com/2014/04/bsdcan-tutorials-please-help-me-improve.html) ###

* Peter Hansteen writes a new blog post about his upcoming BSDCan tutorials
* The tutorials are called "Building the network you need with PF, the OpenBSD packet filter" and "Transitioning to OpenBSD 5.5" - both scheduled to last three hours each
* He's requesting anyone that'll be there to go ahead and contact him, telling him exactly what you'd like to learn
* There's also a bit of background information about the tutorials and how he's looking to improve them
* If you're interested in OpenBSD and going to BSDCan this year, hit him up \*\*\*

### [pkgsrc-2014Q1 released](http://mail-index.netbsd.org/netbsd-announce/2014/04/04/msg000202.html) ###

* The new stable branch of pkgsrc packages has been built and is ready
* Python 3.3 is now a "first class citizen" in pkgsrc
* 14255 packages for NetBSD-current/x86\_64, 11233 binary packages built with clang for FreeBSD 10/x86\_64
* There's a new release every three months, and remember pkgsrc works on MANY operating systems, not just NetBSD - you could even use pkgsrc instead of pkgng or ports if you were so inclined
* They're also looking into [signing packages](http://mail-index.netbsd.org/tech-pkg/2014/03/31/msg012873.html) \*\*\*

### [Only two holes in a heck of a long time, who cares?](https://www.mail-archive.com/misc@openbsd.org/index.html#127993) ###

* A particularly vocal Debian user, a lost soul, somehow finds his way to the misc@ OpenBSD mailing list
* He questions "what's the big deal" about OpenBSD's slogan being "Only two remote holes in the default install, in a heck of a long time!"
* Luckily, the community and Theo [set the record straight](https://www.mail-archive.com/misc@openbsd.org/msg128001.html) about why you should care about this
* Running insecure applications on OpenBSD is actually **more** secure than running them on other systems, due to things like ASLR, PIE and all the [security features](https://www.mail-archive.com/misc@openbsd.org/msg127995.html) of OpenBSD
* It spawned a discussion about ease of management and Linux's poor security record, definitely [worth reading](https://www.mail-archive.com/misc@openbsd.org/msg128073.html) \*\*\*

Interview - Dru Lavigne - [dru@freebsd.org](mailto:dru@freebsd.org) / [@bsdevents](https://twitter.com/bsdevents)
----------

FreeBSD's documentation printing, documentation springs, various topics

---

Tutorial
----------

### [Automatic, unattended OpenBSD installs with PXE](http://www.bsdnow.tv/tutorials/autoinstall) ###

---

News Roundup
----------

### [pfSense 2.1.1 released](https://doc.pfsense.org/index.php/2.1.1_New_Features_and_Changes) ###

* A new version of pfSense is released, mainly to fix some security issues
* Tracking some recent FreeBSD advisories, pfSense usually only applies the ones that would matter on a firewall or router
* There are also some NIC driver updates [and other things](https://blog.pfsense.org/?p=1238)
* Of course if you want to learn more about pfSense, watch [episode 25](http://www.bsdnow.tv/episodes/2014_02_19-a_sixth_pfsense)
* 2.1.2 is already up for testing too \*\*\*

### [FreeBSD gets UEFI support](https://svnweb.freebsd.org/base?view=revision&revision=264095) ###

* It looks like FreeBSD's battle with UEFI may be coming to a close?
* Ed Maste committed a giant list of patches to enable UEFI support on x86\_64
* Look through the list to see all the details and information
* Thanks FreeBSD foundation! \*\*\*

### [Ideas for the next DragonflyBSD release](http://lists.dragonflybsd.org/pipermail/kernel/2014-March/094909.html) ###

* Mr. Dragonfly release engineer himself, [Justin Sherrill](http://www.bsdnow.tv/episodes/2013_11_13-the_gateway_drug) posts some of his ideas for the upcoming release
* They're aiming for late May for the next version
* Ideas include better support for running in a VM, pkgng fixes, documentation updates and PAM support
* Gasp, they're even considering dropping i386 \*\*\*

### [PCBSD weekly digest](http://blog.pcbsd.org/2014/04/pc-bsd-weekly-feature-digest-24/) ###

* Lots of new PBI updates for 10.0, new runtime implementation
* New support for running 32 bit applications in PBI runtime
* New default CD and DVD player, umplayer
* Latest GNOME 3 and Cinnamon merged, new edge package builds \*\*\*

Feedback/Questions
----------

* [Remy writes in](http://slexy.org/view/s273oSezFs)
* [Jan writes in](http://slexy.org/view/s2I3H1HsVb)
* [Eddie writes in](http://slexy.org/view/s2wUTRowzU)
* [Zen writes in](http://slexy.org/view/s2RA0whmwz)
* [Sean writes in](http://slexy.org/view/s2pwE20Ov6) \*\*\*