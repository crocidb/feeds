+++
title = "8: A Brief Introduction"
description = "This week, we chat with Antti Kantee from the NetBSD project about a crazy little thing called rump kernels. We'll also be showing you all the different cool things you can do with BSD and the Tor network, as well as discussing all the latest news. So sit back and enjoy BSD Now -"
date = "2013-10-23T12:00:00Z"
url = "https://www.bsdnow.tv/8"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.297663152Z"
seen = true
+++

This week, we chat with Antti Kantee from the NetBSD project about a crazy little thing called rump kernels. We'll also be showing you all the different cool things you can do with BSD and the Tor network, as well as discussing all the latest news. So sit back and enjoy BSD Now - the place to B.. SD.

Headlines
----------

### [FreeBSD July-September 2013 Status Report](https://www.freebsd.org/news/status/report-2013-07-2013-09.html) ###

* Quarterly FreeBSD status report is out with A LOT of updates, we'll cover a few of them
* Highlights include AES-NI Improvements for GELI, Capsicum development, Continuation of the Newcons Project, Download Manager Service for the Ports Collection, status updates from all the various FreeBSD teams, FreeBSD on EC2 news, updates to the CSPRNG, much more
* We've covered some of these things already, but there's lots to read in the announcement
* See full page for details on everything \*\*\*

### [Dragonfly SMP contention update](http://lists.dragonflybsd.org/pipermail/users/2013-October/090181.html) ###

* Lots of work going in to reducing SMP contention in the next Dragonfly release
* Anything which forks and/or execs a lot will now run as close to optimally as it is possible to run on a multi-core box
* The lead developer was using poudriere and noticed the performance difference, says this is "a fairly major milestone for the project"
* Lots of technical details in the mailing list post, check it out \*\*\*

### [FreeBSD gets "first boot" rc.d scripts](https://svnweb.freebsd.org/base?view=revision&sortby=date&revision=256775) ###

* Colin Percival added support for scripts that run on the first boot
* Might be desirable for embedded systems to automatically download and apply patches
* Similarly, it can be used to invoke freebsd-update to patch your system on the first bootup
* Could also be used to download and run a script or install ports or packages
* Already MFCed to 10-STABLE and 9-STABLE and added to ports
* Lots of possibilities \*\*\*

### [NetBSD gets lua scripting in the kernel](http://mail-index.netbsd.org/source-changes/2013/10/16/msg048283.html) ###

* NetBSD gained support for the Lua scripting language in the kernel
* A [luactl](http://mail-index.netbsd.org/source-changes/2013/10/16/msg048285.html) command was added to easily manipulate it
* It will be interesting to see [what can come out of this](https://archive.fosdem.org/2013/schedule/event/lua_in_the_netbsd_kernel/)
* Speaking of NetBSD kernels, that leads us into our interview! \*\*\*

Interview - Antti Kantee - [pooka@netbsd.org](mailto:pooka@netbsd.org) / [@anttikantee](https://twitter.com/anttikantee)
----------

The anykernel and [rump kernels](http://www.netbsd.org/docs/rump/)  
[rump kernels in userspace](https://github.com/anttikantee/buildrump.sh), [rump kernels + applications on Xen](https://github.com/anttikantee/rumpuser-xen), [fs-utils](https://github.com/stacktic/fs-utils), [rump kernel compiled to javascript](http://ftp.netbsd.org/pub/NetBSD/misc/pooka/rump.js/)

---

Tutorial
----------

### [Running a Tor relay, bridge, exit or hidden service](http://www.bsdnow.tv/tutorials/tor) ###

---

News Roundup
----------

### [Second PCBSD feature digest is out](http://blog.pcbsd.org/2013/10/pc-bsd-weekly-feature-digest-101813/) ###

* Weekly PCBSD digest is out to tell you about new features
* Mentions switching over all bug reports to trac​.pcbsd​.org
* Life Preserver has finished development and is now being tested
* PCBSD 10.0 ISOs coming soon \*\*\*

### [OpenBSD imports VXLAN interface](http://marc.info/?l=openbsd-cvs&m=138165902522412&w=2) ###

* VXLAN is a virtual extensible local area network tunnel interface
* UDP-based tunneling protocol for overlaying virtualized layer 2 networks over layer 3 networks \*\*\*

### [OpenZFS Office Hours](https://www.youtube.com/watch?v=G2vIdPmsnTI) ###

* The [question and answer](http://www.open-zfs.org/wiki/OpenZFS_Office_Hours) session with Matt has been uploaded
* Covers lots of topics ranging from cross-compatibility to performance improvements and trivia
* We'll be trying to get Matt on for an interview sometime, already contacted him \*\*\*

### [BSDMag's October issue is out](http://bsdmag.org/magazine/1851-freebsd-programming-primer-how-to-configure-a-development-environment) ###

* Free monthly BSD magazine releases another issue
* Topics include FreeBSD moving to SVN, a BSD programming intro, new PCBSD utilities, migrating from Linux to BSD and OpenBSD LTS updates (which we already covered!) \*\*\*

Feedback/Questions
----------

* [Ben writes in](http://slexy.org/view/s20MUQmfuD)
* [Brian writes in](http://slexy.org/view/s20oVdxaE5)
* [Toby writes in](http://slexy.org/view/s2GfQkSSDz)
* [Noah writes in](http://slexy.org/view/s2IFpjbWVr) \*\*\*