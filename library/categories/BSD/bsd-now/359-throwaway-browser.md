+++
title = "359: Throwaway Browser"
description = 'Throw-Away Browser on FreeBSD With "pot" within 5 minutes, OmniOS as OpenBSD guest with bhyve, BSD vs Linux distro development, My FreeBSD Laptop Build, FreeBSD CURRENT Binary Upgrades, and more.NOTES   This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsn'
date = "2020-07-16T11:00:00Z"
url = "https://www.bsdnow.tv/359"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.527266622Z"
seen = false
+++

Throw-Away Browser on FreeBSD With "pot" within 5 minutes, OmniOS as OpenBSD guest with bhyve, BSD vs Linux distro development, My FreeBSD Laptop Build, FreeBSD CURRENT Binary Upgrades, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/)

Headlines
----------

### [Throw-Away Browser on FreeBSD With "pot" Within 5 Minutes](https://honeyguide.eu/posts/pot-throwaway-firefox/) ###

>
>
> pot is a great and relatively new jail management tool. It offers DevOps style provisioning and can even be used to provide Docker-like, scalable cloud services together with nomad and consul (more about this in Orchestrating jails with nomad and pot).
>
>

---

### [OpenBSD guest with bhyve - OmniOS](https://www.pbdigital.org/omniosce/bhyve/openbsd/2020/06/08/bhyve-zones-omnios.html) ###

>
>
> Today I will be creating a OpenBSD guest via bhyve on OmniOS. I will also be adding a Pass Through Ethernet Controller so I can have a multi-homed guest that will serve as a firewall/router.  
>  This post will cover setting up bhyve on OmniOS, so it will also be a good introduction to bhyve. As well, I look into OpenBSD’s uEFI boot loader so if you have had trouble with this, then you are in the right place.
>
>

---

News Roundup
----------

### [BSD versus Linux distribution development](https://distrowatch.com/weekly.php?issue=20200622#qa) ###

>
>
> Q: Comparing-apples-to-BSDs asks: I was reading one of the old articles from the archive. One of the things mentioned was how the BSDs have a distinct approach in terms of packaging the base system relative to userland apps, and that the Linux distros at the time were not following the same practice. Are there Linux distros that have adopted the same approach in modern times? If not, are there technical limitations that are preventing them from doing so, such as some distros supporting multiple kernel versions maybe?  
>  DistroWatch answers: In the article mentioned above, I made the observation that Linux distributions tend to take one of two approaches when it comes to packaging software. Generally a Linux distribution will either offer a rolling release, where virtually all packages are regularly upgraded to their latest stable releases, or a fixed release where almost all packages are kept at a set version number and only receive bug fixes for the life cycle of the distribution. Projects like Arch Linux and Void are popular examples of rolling, always-up-to-date distributions while Fedora and Ubuntu offer fixed platforms.
>
>
> ---
>
>
> ### [My FreeBSD Laptop Build](https://corrupted.io/2020/06/21/my-freebsd-laptop-build.html) ###
>
>
>
> I have always liked Thinkpad hardware and when I started to do more commuting I decided I needed something that had a decent sized screen but fit well on a bus. Luckily about this time Lenovo gave me a nice gift in the Thinkpad X390. Its basically the famous X2xx series but with a 13” screen and smaller bezel.  
>  So with this laptop I figured it was time to actually put the docs together on how I got my FreeBSD workstation working on it. I will here in the near future have another post that will cover this for HardenedBSD as well since the steps are similar but have a few extra gotchas due to the extra hardening.
>
>
> ---
>
>
> ### [FreeBSD CURRENT Binary Upgrades](http://up.bsd.lv) ###
>
>
>
> * Disclaimer This proof-of-concept is not a publication of FreeBSD.
> * Description up.bsd.lv is a proof-of-concept of binary updates for FreeBSD/amd64 CURRENT/HEAD to facilitate the exhaustive testing of FreeBSD and the bhyve hypervisor and OpenZFS 2.0 specifically. Updates are based on the SVN revisions of official FreeBSD Release Engineering bi-monthly snapshots.
>
>

---

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Karl - pfsense](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/359/Feedback/Karl - pfsense.md>)
* [Val - esxi question](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/359/Feedback/Val - esxi question.md>)
* [lars - openbsd router hardware](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/359/Feedback/lars - openbsd router hardware.md>)

  ---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

  ---