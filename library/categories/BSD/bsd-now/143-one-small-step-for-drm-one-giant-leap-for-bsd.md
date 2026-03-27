+++
title = "143: One small step for DRM, one giant leap for BSD"
description = "This week on BSDNow, we have an interview with Matthew Macy, who has some exciting news to share with us regarding the state of graphicsThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems."
date = "2016-05-25T12:00:00Z"
url = "https://www.bsdnow.tv/143"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.033828954Z"
seen = false
+++

This week on BSDNow, we have an interview with Matthew Macy, who has some exciting news to share with us regarding the state of graphics

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [How the number of states affects pf’s performance of FreeBSD](http://blog.cochard.me/2016/05/playing-with-freebsd-packet-filter.html) ###

* Our friend Olivier of FreeNAS and BSDRP fame has an interesting blog post this week detailing his unique issue with finding a firewall that can handle upwards of 4 million state table entries.
* He begins in the article with benchmarking the defaults, since without that we don’t have a framework to compare the later results. All done on his Netgate RCC-VE 4860 (4 cores ATOM C2558, 8GB RAM) under FreeBSD 10.3.
* “We notice a little performance impact when we reach the default 10K state table limit: From 413Kpps with 128 states in-used, it lower to 372Kpps.”
* With the initial benchmarks done and graphed, he then starts the tuning process by adjusting the “net.pf.states\_hashsize”sysctl, and then playing with the number of states for the firewall to keep.
* “For the next bench, the number of flow will be fixed for generating 9800 pf state entries, but I will try different value of pf.states\_hashsize until the maximum allowed on my 8GB RAM server (still with the default max states of 10k):”
* Then he cranks it up to 4 million states
* “There is only 12% performance penalty between pf 128 pf states and 4 million pf states.”
* “With 10M state, pf performance lower to 362Kpps: Still only 12% lower performance than with only 128 states”
* He then looks at what this does of pfsync, the protocol to sync the state table between two redundant pf firewalls
* Conclusions:

There need to be a linear relationship between the pf hard-limit of states and the pf.states\_hashsize; RAM needed for pf.states\_hashsize = pf.states\_hashsize \* 80 Byte and pf.states\_hashsize should be a power of 2 (from the manual page); Even small hardware can manage large number of sessions (it's a matter of RAM), but under too lot's of pressure pfsync will suffer.

---

### [Introducing the BCHS Stack = BSD, C, httpd, SQLite](http://www.learnbchs.org/) ###

* Pronounced Beaches
* “It's a hipster-free, open source software stack for web applications”
* “Don't just write C. Write portable and secure C.”
* “Get to know your security tools. OpenBSD has systrace(4) and pledge(2). FreeBSD has capsicum(4).”
* “Statically scan your binary with LLVM” and “Run your application under valgrind”
* “Don't forget: BSD is a community of professionals. Go to conferences (EuroBSDCon, AsiaBSDCon, BSDCan, etc.)”
* This seems like a really interesting project, we’ll have to get Kristaps Dzonsons back on the show to talk about it \*\*\*

### [Installing OpenBSD's httpd server, MariaDB, PHP 5.6 on OpenBSD 5.9](https://www.rootbsd.net/kb/339/Installing-OpenBSDandsharp039s-httpd-server-MariaDB-PHP-56-on-OpenBSD-59.html) ###

* Looking to deploy your next web-stack on OpenBSD 5.9? If so this next article from rootbsd.net is for you.
* Specifically it will walk you through the process of getting OpenBSD’s own httpd server up and running, followed by MariaDB and PHP 5.6.
* Most of the setup is pretty straight-forward, the httpd syntax may be different to you, if this is your first time trying it out.
* Once the various packages are installed / configured, the rest of the tutorial will be easy, walking you through the standard hello world PHP script, and enabling the services to run at reboot.
* A good article for those wanting to start hosting PHP/DB content (wordpress anyone?) on your OpenBSD system. \*\*\*

### [The infrastructure behind Varnish ](https://www.varnish-cache.org/news/20160425_website.html) ###

* Dogfooding. It’s a term you hear often in the software community, which essentially means to “Run your own stuff”. Today we have an article by PKH over at varnish-cache, talking about what that means to them.
* Specifically, they recently went through a website upgrade, which will enable them to run more of their own stuff.
* He has a great quote on what OS they use:“So, dogfood: Obviously FreeBSD. Apart from the obvious reason that I wrote a lot of FreeBSD and can get world-class support by bugging my buddies about it, there are two equally serious reasons for the Varnish Project to run on FreeBSD: Dogfood and jails.Varnish Cache is not “software for Linux”, it is software for any competent UNIX-like operating system, and FreeBSD is our primary “keep us honest about this” platform.“
* He then goes through the process of explaining how they would setup a new Varnish-cache website, or upgrade it.
* All together a great read, and if you are one of the admin-types, you really should pay attention to how they build from the ground up. Some valuable knowledge here which every admin should try to replicate.
* I can not reiterate the value of having your config files in a private source control repo strongly enough
* The biggest take-away is: “And by doing it this way, I know it will work next time also.” \*\*\*

Interview - Matt Macy - [mmacy@nextbsd.org](mailto:mmacy@nextbsd.org)[Graphics Stack Update](https://lists.freebsd.org/pipermail/freebsd-x11/2016-May/017560.html)
----------

---

News Roundup
----------

### [Followup on packaging base with pkg(8)](https://lists.freebsd.org/pipermail/freebsd-pkgbase/2016-May/000238.html) ###

* In spite of the heroic last minute effort by a team of contributors, pkg’d base will not be ready in time for FreeBSD 11.0
* There are just too many issues that were discovered during testing
* The plan is to continue using freebsd-update in the meantime, and introduce a pkg based upgrade mechanism in FreeBSD 11.1
* With the new support model for the FreeBSD 11 branch, 11.1 may come sooner than with previous major releases \*\*\*

### [FreeBSD Core Election](https://www.freebsd.org/internal/bylaws.html) ###

* It is time once again for the FreeBSD Core Election
* Application period begins: Wednesday, 18 May 2016 at 18:00:00 UTC
* Application period ends: Wednesday, 25 May 2016 at 18:00:00 UTC
* Voting begins: Wednesday, 25 May 2016 at 18:00:00 UTC
* Voting ends: Wednesday, 22 June 2016 at 18:00:00 UTC
* Results announced Wednesday, 29 June 2016
* New core team takes office: Wednesday, 6 July 2016
* As of the time I was writing these notes, 3 hours before the application deadline, the candidates are:
* Allan Jude: Filling in the potholes
* Marcelo Araujo: We are not vampires, but we need new blood.
* Baptiste Daroussin (incumbent): Keep on improving
* Benedict Reuschling: Learn and Teach
* Benno Rice: Revitalising The Community
* Devin Teske: Here to help
* Ed Maste (incumbent): FreeBSD is people
* George V. Neville-Neil (incumbent): There is much to do…
* Hiroki Sato (incumbent): Keep up with our good community and technical strength
* John Baldwin: Ready to work
* Juli Mallett: Caring for community.
* Kris Moore: User-Focused
* Mathieu Arnold: Someone ask for fresh blood ?
* Ollivier Robert: Caring for the project and you, its developers
* The deadline for applications is around the time we finish recording the live show
* We welcome any of the candidates to schedule an interview in the next few weeks. We will make an attempt to hunt many of them down at BSDCan as well. \*\*\*

### [Wayland/Weston with XWayland works on DragonFly](http://lists.dragonflybsd.org/pipermail/users/2016-May/249620.html) ###

* We haven’t talked a lot about Wayland on BSD recently (or much at all), but today we have a post from Peter to the dragonfly mailing list, detailing his experience with it.
* Specifically he talks about getting XWayland working, which provides the compat bits for native X applications to run on WayLand displays.
* So far on the working list of apps: “gtk3:
  * gedit
  * nautilus
  * evince

xfce4:

* xfce4-terminal
* atril

  * firefox
  * spyder
  * scilab”
  * A pretty impressive list, although he said “chrome” failed with a seg-fault
  * This is something I’m personally interested in. Now with the newer DRM bits landing in FreeBSD, perhaps it’s time for some further looking into Wayland. \*\*\*

### [Broadcom WiFi driver update](http://adrianchadd.blogspot.ca/2016/05/updating-broadcom-softmac-driver-bwn-or.html) ###

* In this blog post Adrian Chadd talks about his recent work on the bwn(4) driver for Broadcom WiFi chips
* This work has added support for a number of older 802.11g chips, including the one from 2009-era Macbooks
* Work is ongoing, and the hope is to add 802.11n and 5ghz support as well
* Adrian is mentoring a number of developers working on embedded or wifi related things, to try to increase the projects bandwidth in those areas
* If you are interested in driver development, or wifi internals, the blog post has lots of interesting details and covers the story of Adrian’s recent adventures in bringing the drivers up \*\*\*

### Beastie Bits ###

[The Design of the NetBSD I/O Subsystems (2002)](http://arxiv.org/abs/1605.05810)

[ZFS, BTRFS, XFS, EXT4 and LVM with KVM – a storage performance comparison](http://www.ilsistemista.net/index.php/virtualization/47-zfs-btrfs-xfs-ext4-and-lvm-with-kvm-a-storage-performance-comparison.html?print=true)

[Swift added to FreeBSD Ports](http://www.freshports.org/lang/swift/)

[misc@openbsd: 'NSA addition to ifconfig'](http://marc.info/?l=openbsd-misc&m=146391388912602&w=2)

[Papers We Love: Memory by the Slab: The Tale of Bonwick's Slab Allocator ](http://paperswelove.org/2015/video/ryan-zezeski-memory-by-the-slab/)

---

Feedback/Questions
----------

* [ Lars - Poudriere](http://pastebin.com/HRRyfxev)
* [ Warren - .NET](http://pastebin.com/fESV1egk)
* [ Eddy - Sys Init](http://pastebin.com/kQecpA1X)
* [ Tim - ZFS Resources](http://pastebin.com/5096cGXr)
* [ Morgan - Ports and Kernel](http://pastebin.com/rYr1CDcV) \*\*\*