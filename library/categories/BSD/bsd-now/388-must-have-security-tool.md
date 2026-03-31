+++
title = "388: Must-have security tool"
description = "FreeBSD Q4 2020 Status report, a must-have security tool from OpenBSD, Bastille Port Redirection and Persistence, FreeBSD Wall Display Computer, etymology of command-line tools, GhostBSD 21.01.15 Release Notes, and more.NOTES   This episode of BSDNow is brought to you by [T"
date = "2021-02-04T08:00:00Z"
url = "https://www.bsdnow.tv/388"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.480661127Z"
seen = true
+++

FreeBSD Q4 2020 Status report, a must-have security tool from OpenBSD, Bastille Port Redirection and Persistence, FreeBSD Wall Display Computer, etymology of command-line tools, GhostBSD 21.01.15 Release Notes, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [FreeBSD quarterly status report for Q4 2020](https://www.freebsd.org/news/status/report-2020-10-2020-12/) ###

---

### [Block spammers/abusive IPs with Pf-badhost in OpenBSD. A 'must have' security tool!](https://undeadly.org/cgi?action=article;sid=20210119113425) ###

>
>
> Pf-badhost is a very practical, robust, stable and lightweight security script for network servers.  
>  It's compatible with BSD based operating systems such as {Open,Free,Net,Dragonfly}BSD and MacOS. It prevents potentially-bad IP addresses that could possibly attack your servers (and waste your bandwidth and fill your logfiles), by blocking all those IPs contacting your server, and therefore it makes your server network/resources lighter and the logs of important services running on your server become simpler, more readable and efficient.
>
>
> ---
>

---

News Roundup
----------

### [Bastille Port Redirection and Persistence](https://bastillebsd.org/blog/2021/01/13/bastille-port-redirection-and-persistence/) ###

>
>
> Bastille supports redirecting (rdr) ports from the host system into target containers. This port redirection is commonly used when running Internet services such as web servers, dns servers, email and many others. Any service you want to make public outside of your cluster will likely require port redirection (with some exceptions, see below).
>
>
> ---
>
>
> ### [FreeBSD Wall Display Computer](https://blog.tyk.nu/blog/freebsd-wall-display-computer/) ###
>
>
>
> I've recently added a wall mounted 30" monitor for Grafana in my home. I can highly recommend doing the same, especially in a world where more work from home is becoming the norm.
>
>
> ---
>
>
> ### [The etymology of command-line tools](https://i.redd.it/sni9gaxfj2d61.png) ###
>
>
> ---
>
>
> ### [GhostBSD 21.01.15 Release Notes](https://ghostbsd.org/21.01.15_release_notes) ###
>
>
>
> I am happy to announce the availability of the new ISO 21.01.15. This new ISO comes with a clean-up of packages that include removing LibreOffice and Telegram from the default selection. We did this to bring the zfs RW live file systems to run without problem on 4GB of ram machine. We also removed the UFS full disk option from the installer. Users can still use custom partitions to setup UFS partition, but we discourage it. We also fixed the Next button's restriction in the custom partition related to some bug that people reported. We also fix the missing default locale setup and added the default setup for Linux Steam, not to forget this ISO includes kernel, userland and numerous application updates.
>
>

---

Beastie Bits
----------

* [Interview with Brian Kernighan](https://corecursive.com/brian-kernighan-unix-bell-labs1/) \*\*\* ###Tarsnap
* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

  ---