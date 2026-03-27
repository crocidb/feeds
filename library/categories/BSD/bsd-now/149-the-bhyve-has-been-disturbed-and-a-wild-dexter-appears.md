+++
title = "149: The bhyve has been disturbed, and a wild Dexter appears!"
description = "Today on the show, we are going to be chatting with Michael Dexter about a variety of topics, but of course including bhyve! That plusThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems.co"
date = "2016-07-06T12:00:00Z"
url = "https://www.bsdnow.tv/149"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.021914793Z"
seen = false
+++

Today on the show, we are going to be chatting with Michael Dexter about a variety of topics, but of course including bhyve! That plus

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [NetBSD Introduction](https://bsdmag.org/netbsd_intr/) ###

* We start off today’s episode with a great new NetBSD article!
* Siju Oommen George has written an article for BSDMag, which provides a great overview of NetBSD’s beginnings and what it is today.
* Of course you can’t start an article about NetBSD without mentioning where the name came from:

“The four founders of the NetBSD project, Chris Demetriou, Theo de Raadt, Adam Glass, and Charles Hannum, felt that a more open development model would benefit the project: one centered on portable, clean and correct code. They aimed to produce a unified, multi-platform, production-quality, BSD-based operating system. The name “NetBSD” was suggested by de Raadt, based on the importance and growth of networks, such as the Internet at that time, the distributed and collaborative nature of its development.”

* From there NetBSD has expanded, and keeping in line with its motto “Of course it runs NetBSD” it has grown to over 57 hardware platforms, including “IA-32, Alpha, PowerPC,SPARC, Raspberry pi 2, SPARC64 and Zaurus”
* From there topics such as pkgsrc, SMP, embedded and of course virtualization are all covered, which gives the reader a good overview of what to expect in the modern NetBSD today.
* Lastly, in addition to mentioning some of the vendors using NetBSD in a variety of ways, including Point-Of-Sale systems, routers and thin-clients, you may not have known about the research teams which deploy NetBSD:

>
>
> NASA Lewis Research Center – Satellite Networks and Architectures Branch use NetBSD almost exclusively in their investigation of TCP for use in satellite networks.  
>  KAME project – A research group for implementing IPv6, IPsec and other recent TCP/IP related technologies into BSD UNIX kernels, under BSD license.  
>  NEC Europe Ltd. established the Network Laboratories in Heidelberg, Germany in 1997, as NEC’s third research facility in Europe. The Heidelberg labs focus on software-oriented research and development for the next generation Internet.  
>  SAMS-II Project – Space Acceleration Measurement System II. NASA will be measuring the microgravity environment on the International Space Station using a distributed system, consisting of NetBSD.“
>
>
> ---
>

### [My condolences, you’re now the maintainer of a popular open source project](https://runcommand.io/2016/06/26/my-condolences-youre-now-the-maintainer-of-a-popular-open-source-project/) ###

* A presentation from a Wordpress conference, about what it is like to be the maintainer of a popular open source project
* The presentation covers the basics:
* Open Source is more than just the license, it is about community and involvement
* The difference between Maintainers and Contributors
* It covers some of the reasons people do not open up their code, and other common problems people run into:
  * “I'm embarrassed by my code” (Hint: so is everyone else, post it anyway, it is the best way to learn)
  * “I'm discouraged that I can't finish releases on time”
  * “I'm overwhelmed by the PR backlog”
  * “I'm frustrated when issues turn into flamewars”
  * “I'm overcommitted on my open source involvement”
  * “I feel all alone”

* Each of those points is met with advice and possible solutions
* So, there you have it. Open up your code, or join an existing project and help maintain it \*\*\*

### [FreeBSD Committer Allan Jude Discusses the Advantages of FreeBSD and His Role in Keeping Millions of Servers Running](http://www.hostingadvice.com/blog/freebsd-project-under-the-hood/) ###

* An interesting twist on our normal news-stories today, we have an article featuring our very own Allan Jude, talking about why FreeBSD and the advantages of working on an open-source project.

>
>
> “When Allan started his own company hosting websites for video streaming, FreeBSD was the only operating system he had previously used with other hosts. Based on his experience and comfort with it, he trusted the system with the future of his budding business.A decade later, the former-SysAdmin went to a conference focused on the open-source operating system, where he ran into some of the folks on its documentation team. “They inspired me,” he told our team in a recent chat. He began writing documentation but soon wanted to contribute improvements beyond the docs.Today, Allan sits as a FreeBSD Project Committer. It’s rare that you get to chat with someone involved with a massive-scale open-source project like this — rare and awesome.”
>
>

* From there Allan goes into some of the reasons “Why” FreeBSD, starting with Code Organization being well-maintained and documented:

>
>
> “The FreeBSD Project functions like an extremely well-organized world all its own. Allan explained the environment: “There’s a documentation page that explains how the file system’s laid out and everything has a place and it always goes in that place.””
>
>
>
> * In addition, Allan gives us some insight into his work to bring Boot-Environments to the loader, and other reasons why FreeBSD “just makes sense”
> * In summary Allan wraps it up quite nicely:
>
>
>
> “An important take-away is that you don’t have to be a major developer with tons of experience to make a difference in the project,” Allan said — and the difference that devs like Allan are making is incredible. If you too want to submit the commit that contributes to the project relied on by millions of web servers, there are plenty of ways to get involved!
>
>
>
> We’re especially talking to SysAdmins here, as Allan noted that they are the main users of FreeBSD. “Having more SysAdmins involved in the actual build of the system means we can offer the tools they’re looking for — designed the way a SysAdmin would want them designed, not necessarily the way a developer would think makes the most sense”
>
>
> ---
>

### [A guide to saving electricity and time with poudriere and bhyve](http://justinholcomb.me/blog/2016/07/03/poudriere-in-bhyve-and-bare-metal.html) ###

* “This article goes over running poudriere to built packages for a Raspberry Pi with the interesting twist of running it both as a bhyve guest and then switching to running on bare metal via Fiber Channel via ctld by sharing the same ZFS volume.”
* “Firstly, poudriere can build packages for different architectures such as ARM. This can save hours of build time compared to building ports from said ARM device.”
* “Secondly, let’s say a person has an always-on device (NAS) running FreeBSD. To save power, this device has a CPU with a low clock-rate and low core count. This low clock-rate and core count is great for saving power but terrible for processor intensive application such as poudriere. Let’s say a person also has another physical server with fast processors and a high CPU count but draws nearly twice the power and a fan noise to match.”
* “To get the best of both worlds, the goal is to build the packages on the fast physical server, power it down, and then start the same ZFS volume in a bhyve environment to serve packages from the always-on device.”
* The tutorial walks through setting up ‘ahost’, the always on machine, ‘fhost’ the fast but noisy build machine, and a raspberry pi
* It also includes creating a zvol, configuring iSCSI over fibre channel and exporting the zvol, booting an iSCSI volume in bhyve, plus installing and setting up poudriere
* This it configures booting over fibre channel, and cross-building armv6 (raspberry pi) packages on the fast build machine
* Then the fast machine is shut down, and the zvol is booted in bhyve on the NAS
* Everything you need to know to make a hybrid physical/virtual machine
* The same setup could also work to run the same bhyve VM from either ahost or fhost
* bhyve does not yet support live migration, but when it does, having common network storage like the zvol will be an important part of that \*\*\*

Interview - Michael Dexter - [editor@callfortesting.org](mailto:editor@callfortesting.org) / [@michaeldexter](https://twitter.com/michaeldexter)
----------

* The RoloDexter \*\*\*

### iXSystems ###

* [Children's Minnesota Star Studio Chooses iXsystems' TrueNAS Storage](https://www.youtube.com/watch?v=FFbdQ_05e-0) \*\*\*

News Roundup
----------

### [FreeBSD Foundation June 2016 Update](https://www.freebsdfoundation.org/wp-content/uploads/2016/06/FreeBSD-Foundation-June-2016-Update.pdf) ###

* The FreeBSD Foundation’s June newsletter is out
* Make sure you submit the [FreeBSD Community Survey](https://www.surveymonkey.com/r/freebsd2016) by July 7th:
* In addition to the opening message from the executive director of the foundation, the update includes details to sponsored work on the FreeBSD VM system, reports from a number of conferences the Foundation attended, including BSDCan
* The results of the foundation's yearly board meeting
* People the foundation recognized for their contributions to FreeBSD at BSDCan
* And an introduction to their new “Getting Started with FreeBSD” project \*\*\*

### [[How-To] Building the FreeBSD OS from scratch](http://www.all-nettools.com/forum/showthread.php?34422-Building-the-FreeBSD-OS-from-scratch) ###

* A tutorial over at the All-NetTools.com forums that walks through building FreeBSD from scratch
* I am not sure why anyone would want to build Xorg from source, but you can
* It covers everything in quite a bit of detail, from the installation process through adding Xorg and a window manager from source
* It also includes tweaking some device node permissions for easier operation as a non-root user, and configuring the firewall \*\*\*

### [Window Systems Should Be Transparent](http://doc.cat-v.org/bell_labs/transparent_wsys/) + Rob Pike of AT&T Labs writes about why Window Systems should be transparent ###

* This is an old paper (undated, but I think from the late 80s), but may contain some timeless insights
* “UNIX window systems are unsatisfactory. Because they are cumbersome and complicated, they are unsuitable companions for an operating system that is appreciated for its technical elegance”
* “A good interface should clarify the view, not obscure it”
* “Mux is one window system that is popular and therefore worth studying as an example of good design. (It is not commercially important because it runs only on obsolete hardware.) This paper uses mux as a case study to illustrate some principles that can help keep a user interface simple, comfortable, and unobtrusive. When designing their products, the purveyors of commercial window systems should keep these principles in mind.”
* There are not many commercial window systems anymore, but “open source” was not really a big thing when this paper was written \*\*\*

### [Roger Faulkner, of Solaris fame passed away ](http://permalink.gmane.org/gmane.comp.standards.posix.austin.general/12877) ###

* “RIP Roger Faulkner: creator of the One and True /proc, slayer of the M-to-N threading model -- and the godfather of post-AT&T Unix”
* [@bcantrill: Another great Roger Faulkner story ](https://twitter.com/bcantrill/status/750442169807171584)
* [The story of how pgrep -w saved a monitor -- if not a life](https://news.ycombinator.com/item?id=4306515)
* [@bcantrill: With Roger Faulkner, Tim led an engineering coup inside Sun that saved Solaris circa 2.5](https://twitter.com/bcantrill/status/750442169807171584) \*\*\*

Beastie Bits:
----------

* [Developer Ed Maste is requesting information from those who are users of libvgl.](https://lists.freebsd.org/pipermail/freebsd-stable/2016-June/084843.html)

* [HEADS UP: DragonFly 4.5 world reneeds rebuilding](http://lists.dragonflybsd.org/pipermail/users/2016-June/249748.html)

* [Chris Buechler is leaving the pfSense project, the entire community thanks you for your many years of service ](https://blog.pfsense.org/?p=2095)

* [GhostBSD 10.3-BETA1 now available](http://ghostbsd.org/10.3_BETA1)

* [DragonFlyBSD adds nvmectl](http://lists.dragonflybsd.org/pipermail/commits/2016-June/500671.html)

* [OPNsense 16.1.18 released](https://opnsense.org/opnsense-16-1-18-released/)

* [bhyve\_graphics hit CURRENT](https://svnweb.freebsd.org/base?view=revision&revision=302332)

  ---

### BUG Update ###

* [FreeBSD Central Twitter account looking for a new owner](https://twitter.com/freebsdcentral/status/750053703420350465)

* [NYCBUG meeting : Meet the Smallest BSDs: RetroBSD and LiteBSD, Brian Callahan](http://lists.nycbug.org/pipermail/talk/2016-July/016732.html)

* [NYCBUG install fest @ HOPE](http://lists.nycbug.org/pipermail/talk/2016-June/016694.html)

* [SemiBUG is looking for presentations for September and beyond](http://lists.nycbug.org/pipermail/semibug/2016-June/000107.html)

* [Caleb Cooper is giving a talk on Crytpo at KnoxBUG on July 26th](http://knoxbug.org/content/2016-07-26)

  ---

Feedback/Questions
----------

* [ Leif - ZFS xfer ](http://pastebin.com/vvASr64P)
* [ Zach - Python3](http://pastebin.com/SznQHq7n)
* [ Dave - Versioning](http://pastebin.com/qkpjKEr0)
* [ David - Encrypted Disk Images](http://pastebin.com/yr7BUmv2)
* [ Eli - TLF in all the wrong places](http://pastebin.com/xby81NvC) \*\*\*