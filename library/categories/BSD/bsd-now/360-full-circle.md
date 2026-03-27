+++
title = "360: Full circle"
description = "Chasing a bad commit, New FreeBSD Core Team elected, Getting Started with NetBSD on the Pinebook Pro, FreeBSD on the Intel 10th Gen i3 NUC, pf table size check and change, and more.NOTES   This episode of BSDNow is brought to you by TarsnapHeadli"
date = "2020-07-23T12:00:00Z"
url = "https://www.bsdnow.tv/360"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.525715522Z"
seen = false
+++

Chasing a bad commit, New FreeBSD Core Team elected, Getting Started with NetBSD on the Pinebook Pro, FreeBSD on the Intel 10th Gen i3 NUC, pf table size check and change, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/)

Headlines
----------

### [Chasing a bad commit](https://vishaltelangre.com/chasing-a-bad-commit/) ###

>
>
> While working on a big project where multiple teams merge their feature branches frequently into a release Git branch, developers often run into situations where they find that some of their work have been either removed, modified or affected by someone else's work accidentally. It can happen in smaller teams as well. Two features could have been working perfectly fine until they got merged together and broke something. That's a highly possible case. There are many other cases which could cause such hard to understand and subtle bugs which even continuous integration (CI) systems running the entire test suite of our projects couldn't catch.  
>  We are not going to discuss how such subtle bugs can get into our release branch because that's just a wild territory out there. Instead, we can definitely discuss about how to find a commit that deviated from an expected outcome of a certain feature. The deviation could be any behaviour of our code that we can measure distinctively — either good or bad in general.
>
>

---

### [New FreeBSD Core Team Elected](https://www.freebsdnews.com/2020/07/14/new-freebsd-core-team-elected/) ###

>
>
> The FreeBSD Project is pleased to announce the completion of the 2020 Core Team election. Active committers to the project have elected your Eleventh FreeBSD Core Team.!
>
>

* Baptiste Daroussin (bapt)
* Ed Maste (emaste)
* George V. Neville-Neil (gnn)
* Hiroki Sato (hrs)
* Kyle Evans (kevans)
* Mark Johnston (markj)
* Scott Long (scottl)
* Sean Chittenden (seanc)
* Warner Losh (imp) \*\*\*

News Roundup
----------

### [Getting Started with NetBSD on the Pinebook Pro](https://bentsukun.ch/posts/pinebook-pro-netbsd/) ###

>
>
> If you buy a Pinebook Pro now, it comes with Manjaro Linux on the internal eMMC storage. Let’s install NetBSD instead!  
>  The easiest way to get started is to buy a decent micro-SD card (what sort of markings it should have is a science of its own, by the way) and install NetBSD on that. On a warm boot (i.e. when rebooting a running system), the micro-SD card has priority compared to the eMMC, so the system will boot from there.
>
>
>
> * A FreeBSD developer has borrowed some of the NetBSD code to get audio working on RockPro64 and Pinebook Pro: [https://twitter.com/kernelnomicon/status/1282790609778905088](https://twitter.com/kernelnomicon/status/1282790609778905088) \*\*\*
>
>

### [FreeBSD on the Intel 10th Gen i3 NUC](https://adventurist.me/posts/00300) ###

>
>
> I have ended up with some 10th Gen i3 NUC's (NUC10i3FNH to be specific) to put to work in my testbed. These are quite new devices, the build date on the boxes is 13APR2020. Before I figure out what their true role is (one of them might have to run linux) I need to install FreeBSD -CURRENT and see how performance and hardware support is.
>
>

---

### [pf table size check and change](https://www.dragonflydigest.com/2020/06/29/24698.html) ###

>
>
> Did you know there’s a default size limit to pf’s state table? I did not, but it makes sense that there is one. If for some reason you bump into this limit (difficult for home use, I’d think), [here’s how you change it](http://lists.dragonflybsd.org/pipermail/users/2020-June/381261.html)  
>  There is a table-entries limit specified, you can see current settings with  
>  'pfctl -s all'. You can adjust the limits in the /etc/pf.conf file  
>  containing the rules with a line like this near the top:  
> `set limit table-entries 100000`
>
>
>
> * In the original mail thread, there is mention of the FreeBSD sysctl net.pf.request\_maxcount, which controls the maximum number of entries that can be sent as a single ioctl(). This allows the user to adjust the memory limit for how big of a list the kernel is willing to allocate memory for. \*\*\*
>
>

Beastie Bits
----------

* [tmux and bhyve](https://callfortesting.org/tmux/)
* [Azure and FreeBSD](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/thefreebsdfoundation.freebsd-12_1)
* [Groff Tutorial](https://www.youtube.com/watch?v=bvkmnK6-qao&feature=youtu.be) \*\*\* ###Tarsnap
* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups. [Tarsnap Mastery](https://mwl.io/nonfiction/tools#tarsnap)

Feedback/Questions
----------

* [Chris - ZFS Question](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/360/feedback/Chris - zfs question.md>)
* [Patrick - Tarsnap](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/360/feedback/Patrick - Tarsnap.md>)
* [Pin - pkgsrc](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/360/feedback/pin - pkgsrc.md>) \*\*\*
* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*