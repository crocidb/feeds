+++
title = "383: Scale the tail"
description = "FreeBSD Remote Process Plugin Final Milestone achieved, Tailscale for OpenBSD, macOS to FreeBSD migration, monitoring of our OpenBSD machines, OPNsense 20.7.6 released, and moreNOTES   This episode of BSDNow is brought to you by TarsnapHead"
date = "2020-12-31T08:00:00Z"
url = "https://www.bsdnow.tv/383"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.488789101Z"
seen = false
+++

FreeBSD Remote Process Plugin Final Milestone achieved, Tailscale for OpenBSD, macOS to FreeBSD migration, monitoring of our OpenBSD machines, OPNsense 20.7.6 released, and more

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [FreeBSD Remote Process Plugin: Final Milestone Achieved](https://www.moritz.systems/blog/freebsd-remote-plugin-final-milestone-achieved/) ###

>
>
> Moritz Systems have been contracted by the FreeBSD Foundation to modernize the LLDB debugger’s support for FreeBSD. We are working on a new plugin utilizing the more modern client-server layout that is already used by Darwin, Linux, NetBSD and (unofficially) OpenBSD. The new plugin is going to gradually replace the legacy one.
>
>
> ---
>
>
> ### [Tailscale on OpenBSD](https://rakhesh.com/linux-bsd/tailscale-on-openbsd/) ###
>
>
>
> I spent some time setting this up today evening and thought I’d post the steps here. Nothing fancy, just putting together various pieces actually.  
>  I assume you know what Tailscale is; if not check out their website. Basically it is a mesh network built on top of Wireguard. Using it you can have all your devices both within your LAN(s) and outside be on one overlay network as if they are all on the same LAN and can talk to each other. It’s my new favourite thing!
>
>

---

News Roundup
----------

### [macOS to FreeBSD migration a.k.a why I left macOS](https://antranigv.am/weblog_en/posts/macos_to_freebsd/) ###

>
>
> This is not a technical documentation for how I migrated from macOS to FreeBSD. This is a high-level for why I migrated from macOS to FreeBSD.  
>  Not so long ago, I was using macOS as my daily driver. The main reason why I got a macbook was the underlying BSD Unix and the nice graphics it provides. Also, I have an iPhone. But they were also the same reasons for why I left macOS.
>
>
> ---
>
>
> ### [Our monitoring of our OpenBSD machines, such as it is (as of November 2020](https://utcc.utoronto.ca/~cks/space/blog/sysadmin/OurOpenBSDMonitoring) ###
>
>
>
> We have a number of OpenBSD firewalls in service (along with some other OpenBSD servers for things like VPN endpoints), and I was recently asked how we monitor PF and overall network traffic on them. I had to disappoint the person who asked with my answer, because right now we mostly don't (although this is starting to change).
>
>
> ---
>
>
> ### [OPNsense 20.7.6 released](https://opnsense.org/opnsense-20-7-6-released/) ###
>
>
>
> This update brings the usual mix of reliability fixes, plugin and third party software updates: FreeBSD, HardenedBSD, PHP, OpenSSH, StrongSwan, Suricata and Syslog-ng amongst others.  
>  Please note that Let's Encrypt users need to reissue their certificates manually after upgrading to this version to fix the embedded certificate chain issue with the current signing CA switch going on.
>
>
> ---
>
>
> ### [NYC Bug Jan 2021 with Michael W. Lucas](https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/383/nycbug) ###
>
>
> ---
>
>
> ### Tarsnap ###
>
>
>
> * This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.
>
>

Feedback/Questions
----------

* [cy - .so files](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/383/feedback/cy - .so files>)
* [ben - mixer volume](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/383/feedback/ben - mixer volume>)
* [probono - live cds](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/383/feedback/probono - live cds>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*