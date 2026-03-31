+++
title = "389: Comfy FreeBSD Jails"
description = "A week with Plan 9, Exploring Swap on FreeBSD, how to create a FreeBSD pkg mirror using bastille and poudriere, How to set up FreeBSD 12 VNET jail with ZFS, Creating Comfy FreeBSD Jails Using Standard Tools, and more.NOTES   This episode of BSDNow is brought to you by [Tars"
date = "2021-02-10T08:00:00Z"
url = "https://www.bsdnow.tv/389"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.479148679Z"
seen = true
+++

A week with Plan 9, Exploring Swap on FreeBSD, how to create a FreeBSD pkg mirror using bastille and poudriere, How to set up FreeBSD 12 VNET jail with ZFS, Creating Comfy FreeBSD Jails Using Standard Tools, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [A Week With Plan 9](https://thedorkweb.substack.com/p/a-week-with-plan-9) ###

>
>
> I spent the first week of 2021 learning an OS called Plan 9 from Bell Labs. This is a fringe Operating System, long abandoned by it’s original authors. It's also responsible for a great deal of inspiration elsewhere. If you’ve used the Go language, /proc, UTF-8 or Docker, you’ve used Plan 9-designed features. This issue dives into Operating System internals and some moderately hard computer science topics. If that sort of thing isn’t your bag you might want to skip ahead. Normal service will resume shortly.
>
>
> ---
>
>
> ### [Exploring Swap on FreeBSD](https://klarasystems.com/articles/exploring-swap-on-freebsd/) ###
>
>
>
> On modern Unix-like systems such as FreeBSD, “swapping” refers to the activity of paging out the contents of memory to a disk and then paging it back in on demand. The page-out activity occurs in response to a lack of free memory in the system: the kernel tries to identify pages of memory that probably will not be accessed in the near future, and copies their contents to a disk for safekeeping until they are needed again. When an application attempts to access memory that has been swapped out, it blocks while the kernel fetches that saved memory from the swap disk, and then resumes execution as if nothing had happened.
>
>

---

News Roundup
----------

### [How to create a FreeBSD pkg mirror using bastille and poudriere](https://hackacad.net/post/2021-01-13-build-a-freebsd-pkg-mirror-with-bastille-poudriere/) ###

>
>
> This a short how-to for creating a FreeBSD pkg mirror using BastilleBSD and Poudriere.
>
>
> ---
>
>
> ### [How to set up FreeBSD 12 VNET jail with ZFS](https://www.cyberciti.biz/faq/configuring-freebsd-12-vnet-jail-using-bridgeepair-zfs/) ###
>
>
>
> How do I install, set up and configure a FreeBSD 12 jail with VNET on ZFS? How can I create FreeBSD 12 VNET jail with /etc/jail.conf to run OpenVPN, Apache, Wireguard and other Internet-facing services securely on my BSD box?  
>  FreeBSD jail is nothing but operating system-level virtualization that allows partitioning a FreeBSD based Unix server. Such systems have their root user and access rights. Jails can use network subsystem virtualization infrastructure or share an existing network. FreeBSD jails are a powerful way to increase security. Usually, you create jail per services such as an Nginx/Apache webserver with PHP/Perl/Python app, WireGuard/OpeNVPN server, MariaDB/PgSQL server, and more. This page shows how to configure a FreeBSD Jail with vnet and ZFZ on FreeBSD 12.x.
>
>
> ---
>
>
> ### [Creating Comfy FreeBSD Jails Using Standard Tools](https://kettunen.io/post/standard-freebsd-jails/) ###
>
>
>
> Docker has stormed into software development in recent years. While the concepts behind it are powerful and useful, similar tools have been used in systems for decades. FreeBSD’s jails in one of those tools which build upon even older chroot(2) To put it shortly, with these tools, you can make a safe environment separated from the rest of the system.
>
>
> ---
>

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Chris - USB BSD variant](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/389/feedback/Chris - USB BSD variant>)
* [Jacob - host wifi through a jail](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/389/feedback/Jacob - host wifi through a jail>)
* [Jordan - new tool vs updating existing tool](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/389/feedback/Jordan - new too vs updating existing tool>) \*\*\*
* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*