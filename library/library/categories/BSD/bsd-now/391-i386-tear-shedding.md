+++
title = "391: i386 tear shedding"
description = "Follow-up about FreeBSD jail advantages, Install Prometheus, Node Exporter and Grafana, Calibrate your touch-screen on OpenBSD, OPNsense 21.1 Marvelous Meerkat Released, NomadBSD 1.4-RC1, Lets all shed a Tear for 386, find mostly doesn't need xargs today on modern Unixes, OpenBSD"
date = "2021-02-25T08:00:00Z"
url = "https://www.bsdnow.tv/391"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.475799771Z"
seen = true
+++

Follow-up about FreeBSD jail advantages, Install Prometheus, Node Exporter and Grafana, Calibrate your touch-screen on OpenBSD, OPNsense 21.1 Marvelous Meerkat Released, NomadBSD 1.4-RC1, Lets all shed a Tear for 386, find mostly doesn't need xargs today on modern Unixes, OpenBSD KDE Status Report, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [Follow-up about FreeBSD jail advantages](https://rubenerd.com/follow-up-about-freebsd-jail-advantages/) ###

>
>
> I’ll admit I ran a lot of justifications together into a single paragraph because I wanted to get to configuring the jails themselves. They’re also, by and large, not specific to FreeBSD’s flavour of containerisation, though I still think it’s easily the most elegant implementation. Sometimes the simplest solution really is the best one.
>
>
> ---
>
>
> ### [History of FreeBSD part 4: TCP/IP](https://klarasystems.com/articles/history-of-freebsd-part-4-bsd-and-tcp-ip/) ###
>
>
>
> * How TCP/IP evolved and BSDs special contribution to the history of the Internet \*\*\*
>
>

### [FreeBSD: Install Prometheus, Node Exporter and Grafana](https://blog.andreev.it/?p=5289) ###

>
>
> FreeBSD comes out of the box with three great tools for monitoring. If you need more info about how these tools work, please read the official documentation. I’ll explain the installation only and creating a simple dashboard.
>
>
> ---
>

News Roundup
----------

### [Calibrate your touch-screen on OpenBSD](https://www.tumfatig.net/20210122/calibrate-your-touch-screen-on-openbsd/) ###

>
>
> I didn’t expected it but my refurbished T460s came with a touch-screen. It is recognized by default on OpenBSD and not well calibrated as-is. But that’s really simple to solve.
>
>
> ---
>
>
> ### [Lets all shed a Tear for 386](https://lists.freebsd.org/pipermail/freebsd-announce/2021-January/002006.html) ###
>
>
>
> FreeBSD is designating i386 as a Tier 2 architecture starting with FreeBSD 13.0. The Project will continue to provide release images, binary updates, and pre-built packages for the 13.x branch. However, i386-specific issues (including SAs) may not be addressed in 13.x. The i386 platform will remain Tier 1 on FreeBSD 11.x and 12.x.
>
>
> ---
>

### [OPNsense 21.1 Marvelous Meerkat Released](https://opnsense.org/opnsense-21-1-marvelous-meerkat-released/) ###

>
>
> For more than 6 years, OPNsense is driving innovation through modularising and hardening the open source firewall, with simple and reliable firmware upgrades, multi-language support, HardenedBSD security, fast adoption of upstream software updates as well as clear and stable 2-Clause BSD licensing.
>
>
> ---
>
>
> ### [NomadBSD 1.4-RC1](https://nomadbsd.org/index.html#1.4-RC1) ###
>
>
>
> We are pleased to present the first release candidate of NomadBSD 1.4.
>
>
> ---
>

### [find mostly doesn't need xargs today on modern Unixes](https://utcc.utoronto.ca/~cks/space/blog/unix/FindWithoutXargsToday) ###

>
>
> I've been using Unix for long enough that 'find | xargs' is a reflex. When I started and for a long time afterward, xargs was your only choice for efficiently executing a command over a bunch of find results.
>
>
> ---
>
>
> ### [OpenBSD KDE Status Report](https://undeadly.org/cgi?action=article;sid=20210124113220) ###
>
>
>
> OpenBSD has managed to drop KDE3 and KDE4 in the 6.8 -\> 6.9 release cycle. That makes me very happy because it was a big piece of work and long discussions. This of course brings questions: Kde Plasma 5 package missing.  
>  After half a year of work, I managed to successfully update the Qt5 stack to the last LTS version 5.15.2. On the whole, the most work was updating QtWebengine. What a monster! With my CPU power at home, I can build it 1-2 times a day which makes testing a little bit annoying and time intensive.
>
>
> ---
>

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Karl - Firefox webcam audio solution](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/391/feedback/Karl - Firefox webcam audio solution.md>)
* [Michal - openzfs](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/391/feedback/Michal - openzfs.md>)
* [Dave - bufferbloat](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/391/feedback/Dave - bufferbloat.md>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*