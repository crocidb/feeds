+++
title = "146: Music to Beastie’s ears"
description = "Kris is on vacation this week, so allan flies solo, provides a recap of BSDCan & cover's a boatload of news including MicrosoftThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems.com/bsdno"
date = "2016-06-16T12:00:00Z"
url = "https://www.bsdnow.tv/146"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.028223688Z"
seen = true
+++

Kris is on vacation this week, so allan flies solo, provides a recap of BSDCan & cover's a boatload of news including Microsoft

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [BSDCan Recap and Live Stream Videos](http://www.bsdcan.org/2016/) ###

* [OpenBSD BSDCan 2016 papers now available](http://www.openbsd.org/papers)
* [Allan’s slides ](http://allanjude.com/bsd/BSDCan2016_-_GELIBoot.pdf) [and Paper ](http://allanjude.com/bsd/AsiaBSDCon2016_geliboot_pdf1a.pdf)
* [Michael W Lucas presents Allan with a gift ](https://www.youtube.com/watch?v=LFgxAHkrSTg)
* [“FreeBSD Mastery: Advanced ZedFS” ](http://blather.michaelwlucas.com/archives/2698)
* Highlighted Tweets:
  * [Groff Arrives at BSDCan ](https://twitter.com/Keltounet/status/740344735194320896)
  * [FreeBSD Foundation recognizes the contributions of Bryan Drewery, Rod Grimes, Warren Block, & Gleb Smirnoff ](https://twitter.com/freebsdfndation/status/742456950676393984)
  * [A moment of silence and shots in memory in Benjamin Perrault @creepingfur ](https://twitter.com/__briancallahan/status/741854476340858880)
  * [@gvnn3 sells the FreeBSD Foundation shirt off of his back for Charity ](https://twitter.com/Keltounet/status/741763867471155201)
  * [Michael W. Lucas asks Matt Ahrens how to pronounce ZFS, “You can pronounce ZFS however you like, but if you pronounce it 'reiserfs', people might be confused.” ](https://twitter.com/cperciva/status/741375414967410688)
  * [Sysadmin T-Shirt ](https://twitter.com/BSDCan/status/741420633007874050)
  * [FreeBSD Dev Summit ran out of room on the chalkboards listing accomplishments of 11.0 ](https://twitter.com/SeanChittenden/status/740904105388978176)
  * [List of things people have or want for FreeBSD 12 ](https://twitter.com/Keltounet/status/740928627471159296)
  * [Matt Ahrens signing Allan’s ZFS book ](https://twitter.com/kprovst/status/741322268480049152?cn=bWVudGlvbg==&refsrc=email)
  * [FreeBSD’s new marketing strategy ](https://twitter.com/cperciva/status/741707948469157889)
  * [Charity Auction: systemd whoopie cushion ](https://twitter.com/HippyWizard/status/741768670704066560)
  * [Embarass OpenBSD’s @HenningBrauer by donating $10 to charity for a selfie with him wearing a Linux t-shirt ](https://twitter.com/juliefriday/status/741948048788586496)
  * [@GroffTheBSDGoat changes handlers, from @HenningBrauer to @GavinAtkinson ](https://twitter.com/GroffTheBSDGoat/status/742415390798716928)

* [Day 1 Video ](https://www.youtube.com/watch?v=AOidjSS7Hsg)
* [Day 2 Video ](https://www.youtube.com/watch?v=z7pDnBO5wSM)
* [Allan’s GELIBoot talk (day 2) ](https://www.youtube.com/watch?v=z7pDnBO5wSM&feature=youtu.be&list=PLeF8ZihVdpFfoEV67dBSrKfA8ifpUr6qC&t=4440) \*\*\*

### [Media Coverage of Microsoft + FreeBSD story](https://azure.microsoft.com/en-us/blog/freebsd-now-available-in-azure-marketplace/) ###

* Microsoft has released their own custom image of FreeBSD 10.3 for the Azure Cloud
* “This means that not only can you quickly bring-up a FreeBSD VM in Azure, but also that in the event you need technical support, Microsoft support engineers can assist.”
* “Microsoft is the publisher of the FreeBSD image in the marketplace rather than the FreeBSD Foundation. The FreeBSD Foundation is supported by donations from the FreeBSD community, including companies that build their solutions on FreeBSD. They are not a solution provider or an ISV with a support organization but rather rely on a very active community that support one another. In order to ensure our customers have an enterprise SLA for their FreeBSD VMs running in Azure, we took on the work of building, testing, releasing and maintaining the image in order to remove that burden from the Foundation. We will continue to partner closely with the Foundation as we make further investments in FreeBSD on Hyper-V and in Azure.”
* "It's quite a significant milestone for FreeBSD community and for Microsoft to publish a supported FreeBSD image on Azure Marketplace. We really appreciate Microsoft's commitment and investment in FreeBSD project". - Justin T. Gibbs, President of FreeBSD Foundation
* Microsoft took a FreeBSD 10.3-RELEASE image and added additional patches, most of which they have upstreamed but that were too late for the regular 10.3 release cycle.
* Rather than requiring users to use a snapshot of the stable/10 branch, which would complicate the user experience, and complicate the job of the Microsoft support engineers, they created their own “certified” release
* This allows Microsoft to selectively deploy errata fixes to the image as well
* It is not clear how this affects update mechanisms like freebsd-update(8)
* [The Register ](http://www.theregister.co.uk/2016/06/09/microsoft_freebsd/)
* [The Inquirer ](http://www.theinquirer.net/inquirer/news/2461070/microsoft-creates-own-distribution-of-freebsd-for-azure-developers)
* [Infoworld ](http://www.infoworld.com/article/3082090/open-source-tools/is-microsoft-publishing-its-own-freebsd-yes-and-no.html)
* [The Hacker News ](http://thehackernews.com/2016/06/microsoft-azure-freebsd.html)
* [Windows Report ](http://windowsreport.com/microsoft-freebsd-10-3-ready-made-vm-image-azure/)
* [Windows Club ](http://news.thewindowsclub.com/microsoft-freebsd-operating-system-84375/) \*\*\*

### [Select works poorly](http://www.tedunangst.com/flak/post/select-works-poorly) ###

* “At the bottom of the OpenBSD man page for select is a little note. “Internally to the kernel, select() and pselect() work poorly if multiple processes wait on the same file descriptor.” There’s a similar warning in the poll man page. Where does this warning come from and what does it mean?”
* Ted found that at first glance, OpenBSD’s select() appears to be quite bad:
* “whenever some data gets written, we call wakeup(&selwait);. Based on what we’ve seen so far, one can conclude that this is likely to be inefficient. Every time any socket has some data available, we wake up every selecting process in the system. Works poorly indeed.”
* After further investigation, it turns out to not be quite as bad
* When the select() is first setup, the PID of the process that cares about the FD is recorded in the selinfo struct
* If a second process runs select() on the same FD, the SI\_COLL (Select Collision) flag is set on the selinfo struct
* When selwakeup() is called, if SI\_COLL is set, all select()ing processes are woken up, and the sysctl kern.nselcoll is incremented. If the flag is not set, and only a single PID is waiting for activity on that FD, only that process is woken up
* “This is not an intractable problem. kevent avoids it entirely. Other implementations may too. But practically, does it need to be solved? My laptop says it’s happened 43 times. A server with substantially more uptime says 0. Doesn’t seem so bad.” \*\*\*

Interview - Hans Petter Selasky - [hps@freebsd.org](mailto:hps@freebsd.org) / [@twitter](https://twitter.com/user)
----------

* Designing FreeBSD’s USB drivers, hooking up a piano to FreeBSD & more! \*\*\*

News Roundup
----------

* [Timeline of libexpat random vulnerability](http://www.tedunangst.com/flak/post/timeline-of-libexpat-random-vulnerability)

* [Do you use FreeBSD as web server? Why or why not?](https://news.ycombinator.com/item?id=11804565)

* [20 years of NetBSD code Bloat](http://kristerw.blogspot.sg/2016/05/20-years-of-netbsd-code-bloat.html)

* [HP Chromebook 13 now booting OpenBSD](https://jcs.org/statuses/2016/06/08/740606952149942272/)

* [UNIX for Poets ](https://web.stanford.edu/class/cs124/lec/124-UnixForPoets.pdf)

* [Comparing live version upgrade methods](https://distrowatch.com/weekly.php?issue=20160530#upgrades)

* [My life with FreeBSD on a Thinkpad X220](https://www.reddit.com/r/BSD/comments/4n3flx/my_life_with_freebsd_on_a_thinkpad_x220/)

  ---