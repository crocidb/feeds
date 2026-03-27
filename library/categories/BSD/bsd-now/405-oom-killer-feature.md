+++
title = "405: OOM Killer Feature"
description = "NetBSD 9.2 released, DragonFly 6.0 is out, Home Network Monitoring using Prometheus, Preventing FreeBSD to kill PostgreSQL, Customizing Emacs for Git Commit Messages, Deleting old FreeBSD boot environments, Always be quitting, and moreNOTES   This episode of BSDNow is broug"
date = "2021-06-03T07:00:00Z"
url = "https://www.bsdnow.tv/405"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.453199748Z"
seen = false
+++

NetBSD 9.2 released, DragonFly 6.0 is out, Home Network Monitoring using Prometheus, Preventing FreeBSD to kill PostgreSQL, Customizing Emacs for Git Commit Messages, Deleting old FreeBSD boot environments, Always be quitting, and more

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [NetBSD 9.2 Released](http://blog.netbsd.org/tnf/entry/netbsd_9_2_released) ###

---

### [DragonFly 6.0 is out!](https://www.dragonflydigest.com/2021/05/10/25731.html) ###

* [Release Notes](https://www.dragonflybsd.org/release60/) \*\*\* ### [EuroBSDCon 2021 will be online](https://2021.eurobsdcon.org/) \*\*\* ## News Roundup ### [Home Network Monitoring using Prometheus](https://linux-bsd.github.io/post/monitoring/) \> This blog post describes my setup for monitoring various devices on my home network suh as servers, laptops/desktops, networking gear etc. The setup and configuration is squarely geared towards small/medium sized network monitoring. A similar setup might work for large networks, but you will need to plan your compute/storage/bandwidth capacities accordingly. I’m running all the monitoring software on FreeBSD, but you can run it on your choice of OS. Just make sure to install the packages using your OS’s package manager. \*\*\* ### [Preventing FreeBSD to kill PostgreSQL (aka OOM Killer prevention)](https://fluca1978.github.io/2021/04/02/OOMKillerFreeBSD.html) \> There are a lot of interesting articles on how to prevent the Out of Memory Killer (OOM killer in short) on Linux to ruin your day, or better your night. One particularly well done explanation about how the OOM Killer works, and how to help PostgreSQL to survive, is, in my humble opinion, the one from Percona Blog. \*\*\* ### [Customizing Emacs for Git Commit Messages](http://bsdimp.blogspot.com/2021/04/customizing-emacs-for-git-commit.html) \>I do a lot of commits to the FreeBSD project and elsewhere. It would be nice if I could setup emacs in a custom way for each commit message that I'm editing. \> Fortunately, GNU Emacs provides a nice way to do just that. While I likely could do some of these things with git commit hooks, I find this to be a little nicer. \*\*\* ### [Deleting old FreeBSD boot environments](https://dan.langille.org/2021/04/15/deleting-old-freebsd-boot-environments/) \> I like boot environments (BE) on FreeBSD. They were especially handy when building the AWS host for FreshPorts, since I had no serial console. I would create a BE saving the current status, then make some changes. I’d mark the current BE as boot once, so I could boot back in the known good BE. Worst case, I could mount the storage onto a rescue EC2 instance and adjust the bootfs value of the zpool. \*\*\*

### [Always be quitting](https://jmmv.dev/2021/04/always-be-quitting.html) ###

>
>
> A good philosophy to live by at work is to “always be quitting”. No, don’t be constantly thinking of leaving your job. But act as if you might leave on short notice. Counterintuitively, this will make you a better engineer and open up growth opportunities.
>
>
> ---
>

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Christopher - zfs question](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/405/feedback/Christopher - zfs question>)
* [Chris - two questions](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/405/feedback/Chris - two questions>)
* [Vas - zpools and moving to FreeBSD 13](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/405/feedback/Vas - zpools and moving to FreeBSD 13>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*