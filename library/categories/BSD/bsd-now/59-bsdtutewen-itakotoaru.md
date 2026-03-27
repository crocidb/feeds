+++
title = "59: BSDって聞いたことある？"
description = "This week on the show we'll be talking with Hiroki Sato about the status of BSD in Japan. We also get to hear about how he got on the core team, and we just might find out why NetBSD is so popular over there! Answers to all your emails, the latest news, and even a brand new segme"
date = "2014-10-15T12:00:00Z"
url = "https://www.bsdnow.tv/59"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.204608893Z"
seen = false
+++

This week on the show we'll be talking with Hiroki Sato about the status of BSD in Japan. We also get to hear about how he got on the core team, and we just might find out why NetBSD is so popular over there! Answers to all your emails, the latest news, and even a brand new segment, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [BSD talks at XDC 2014](https://www.youtube.com/channel/UCXlH5v1PkEhjzLFTUTm_U7g/videos) ###

* This year's Xorg conference featured a few BSD-related talks
* Matthieu Herrb, [Status of the OpenBSD graphics stack](https://www.youtube.com/watch?v=KopgD4nTtnA)
* Matthieu's talk details what's been done recently in Xenocara the OpenBSD kernel for graphics ([slides here](http://www.openbsd.org/papers/xdc2014-xenocara.pdf))
* Jean-Sébastien Pédron, [The status of the graphics stack on FreeBSD](https://www.youtube.com/watch?v=POmxFleN3Bc)
* His presentation gives a history of major changes and outlines the current overall status of graphics in FreeBSD ([slides here](http://www.x.org/wiki/Events/XDC2014/XDC2014PedronFreeBSD/XDC-2014_FreeBSD.pdf))
* Francois Tigeot, [Porting DRM/KMS drivers to DragonFlyBSD](https://www.youtube.com/watch?v=NdM7_yPGFDk)
* Francois' talk tells the story of how he ported some of the DRM and KMS kernel drivers to DragonFly ([slides here](http://www.x.org/wiki/Events/XDC2014/XDC2014TigeotDragonFlyBSD/XDC-2014_Porting_kms_drivers_to_DragonFly.pdf)) \*\*\*

### [FreeBSD Quarterly Status Report](https://www.freebsd.org/news/status/report-2014-07-2014-09.html) ###

* The FreeBSD project has a report of their activities between July and September of this year
* Lots of ARM work has been done, and a goal for 11.0 is tier one support for the platform
* The release includes reports from the cluster admin team, release team, ports team, core team and much more, but we've already covered most of the items on the show
* If you're interested in seeing what the FreeBSD community has been up to lately, check the full report - it's huge \*\*\*

### [Monitoring pfSense logs using ELK](http://elijahpaul.co.uk/monitoring-pfsense-2-1-logs-using-elk-logstash-kibana-elasticsearch/) ###

* If you're one of those people who loves the cool graphs and charts that pfSense can produce, this is the post for you
* ELK (ElasticSearch, Logstash, Kibana) is a group of tools that let you collect, store, search and (most importantly) visualize logs
* It works with lots of different things that output logs and can be sent to one central server for displaying
* This post shows you how to set up pfSense to do remote logging to ELK and get some pretty awesome graphs \*\*\*

### [Some updates to IPFW](https://svnweb.freebsd.org/base?view=revision&revision=272840) ###

* Even though PF gets a lot of attention, a lot of FreeBSD people still love IPFW
* While mostly a dormant section of the source tree, some updates were recently committed to -CURRENT
* The commit lists the user-visible changes, performance changes, ABI changes and internal changes
* It should be merged back to -STABLE after a month or so of testing, and will probably end up in 10.2-RELEASE
* Also check [this blog post](http://blog.cochard.me/2014/10/ipfw-improvement-on-freebsd-current.html) for some more information and fancy graphs \*\*\*

Interview - Hiroki Sato (佐藤広生) - [hrs@freebsd.org](mailto:hrs@freebsd.org) / [@hiroki\_sato](https://twitter.com/hiroki_sato)
----------

BSD in Japan, technology conferences, various topics

---

News Roundup
----------

### [pfSense on Hyper-V](https://virtual-ops.de/?p=600) ###

* In case you didn't know, the latest pfSense snapshots support running on Hyper-V
* Unfortunately, the current stable release is based on an old, unsupported FreeBSD 8.x base, so you have to use the snapshots for now
* The author of the post tells about his experience running pfSense and gives lots of links to read if you're interested in doing the same
* He also praises pfSense above other Linux-based solutions for its IPv6 support and high quality code \*\*\*

### [OpenBSD as a daily driver](https://www.reddit.com/r/openbsd/comments/2isz24/openbsd_as_a_daily_driver/) ###

* A curious Reddit user posts to ask the community about using OpenBSD as an everyday desktop OS
* The overall consensus is that it works great for that, stays out of your way and is quite reliable
* Caveats would include there being no Adobe Flash support (though others consider this a blessing..) and it requiring a more hands-on approach to updating
* If you're considering running OpenBSD as a "daily driver," check all the comments for more information and tips \*\*\*

### [Getting PF log statistics](https://secure.ciscodude.net/2014/10/09/firewall-log-stats/) ###

* The author of this post runs an OpenBSD box in front of all his VMs at his colocation, and details his experiences with firewall logs
* He usually investigates any IPs of interest with whois, nslookup, etc. - but this gets repetitive quickly, so..
* He sets out to find the best way to gather firewall log statistics
* After coming across [a perl script](http://www.pantz.org/software/pf/pantzpfblockstats.html) to do this, he edited it a bit and is now a happy, lazy admin once again
* You can try out his updated PF script [here](https://github.com/tbaschak/Pantz-PFlog-Stats) \*\*\*

### [FlashRD 1.7 released](http://www.nmedia.net/flashrd/) ###

* In case anyone's not familiar, flashrd is a tool to create OpenBSD images for embedded hardware devices, executing from a virtualized environment
* This new version is based on (the currently unreleased) OpenBSD 5.6, and automatically adapts to the number of CPUs you have for building
* It also includes fixes for 4k drives and lots of various other improvements
* If you're interested in learning more, take a look at some of the slides and audio from the main developer on the website \*\*\*

Feedback/Questions
----------

* [Antonio writes in](http://slexy.org/view/s20XvSa4h0)
* [Don writes in](http://slexy.org/view/s20lGUXW3d)
* [Andriy writes in](http://slexy.org/view/s2al5DFIO7)
* [Richard writes in](http://slexy.org/view/s203QoFuWs)
* [Robert writes in](http://slexy.org/view/s29WIplL6k) \*\*\*

Mailing List Gold
----------

* [Subtle trolling](https://marc.info/?l=openbsd-cvs&m=141271076115386&w=2)
* [Old bugs with old fixes](https://marc.info/?l=openbsd-cvs&m=141275713329601&w=2)
* [A pig reinstall](https://lists.freebsd.org/pipermail/freebsd-ports/2014-October/095906.html)
* [Strange DOS-like environment](https://lists.freebsd.org/pipermail/freebsd-doc/2014-October/024408.html) \*\*\*