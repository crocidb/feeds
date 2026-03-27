+++
title = "397: Fresh BSD 2021"
description = "Customizing the FreeBSD Kernel, OpenBSD/loongson on the Lemote Fuloong, how ZFS on Linux brings up pools and filesystems at boot under systemd, LLDB: FreeBSD Legacy Process Plugin Removed, FreshBSD 2021, gmid, Danschmid’s Poudriere Guide in english, and moreNOTES   This epi"
date = "2021-04-08T07:00:00Z"
url = "https://www.bsdnow.tv/397"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.465717728Z"
seen = false
+++

Customizing the FreeBSD Kernel, OpenBSD/loongson on the Lemote Fuloong, how ZFS on Linux brings up pools and filesystems at boot under systemd, LLDB: FreeBSD Legacy Process Plugin Removed, FreshBSD 2021, gmid, Danschmid’s Poudriere Guide in english, and more

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [Customizing the FreeBSD Kernel](https://klarasystems.com/articles/customizing-the-freebsd-kernel/) ###

>
>
> Learn more about customizing the build of the FreeBSD kernel and its loadable modules
>
>
> ---
>
>
> ### [OpenBSD/loongson on the Lemote Fuloong](https://www.cambus.net/openbsd-loongson-on-the-lemote-fuloong/) ###
>
>
>
> In my article about running OpenBSD/loongson on the Lemote Yeeloong back in 2016, I mentioned looking for a Fuloong. All hope seemed lost until the Summer of 2017, when a fellow OpenBSD developer was contacted by a generous user (Thanks again, Lars!) offering to donate two Lemote Fuloong machines, and I was lucky enough to get one of those units.
>
>

---

News Roundup
----------

### [How ZFS on Linux brings up pools and filesystems at boot under systemd](https://utcc.utoronto.ca/~cks/space/blog/linux/ZFSBringUpOnBoot) ###

>
>
> On Solaris and Illumos, how ZFS pools and filesystems were brought up at boot was always a partial mystery to me (and it seemed to involve the kernel knowing a lot about /etc/zfs/zpool.cache). On Linux, additional software RAID arrays are brought up mostly through udev rules, which has its own complications. For a long time I had the general impression that ZFS on Linux also worked through udev rules to recognize vdev components, much like software RAID. However, this turns out to not be the case and the modern ZFS on Linux boot process is quite straightforward on systemd systems.
>
>
> ---
>
>
> ### [LLDB: FreeBSD Legacy Process Plugin Removed](https://www.moritz.systems/blog/freebsd-legacy-process-plugin-removed/) ###
>
>
>
> During the past month we’ve successfully removed the legacy FreeBSD plugin and continued improving the new one. We have prepared an implementation of hardware breakpoint and watchpoint support for FreeBSD/AArch64, and iterated over all tests that currently fail on that platform. Therefore, we have concluded the second milestone.
>
>
> ---
>
>
> ### [FreshBSD 2021](https://freshbsd.org/news/2021/02/28) ###
>
>
>
> 6 weeks ago I created a branch for a significant rework of FreshBSD. Nearly 300 commits later, and just a week shy of our 15th anniversary, the result is what you’re looking at now. I hope you like it.
>
>
> ---
>
>
> ### [gmid](https://github.com/omar-polo/gmid/) is a [gemini](https://gemini.circumlunar.space/) server for unixes. ###
>
>
> ---
>
>
> ### [Danschmid’s Poudriere Guide now in english](https://danschmid.de/en/blog/poudriere-guide) ###
>
>
>
> The ports system is one of FreeBSD's greatest advantages for users who want flexibility and control over their software. It enables administrators to easily create and manage source-based installations using a system that is robust and predictable.
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

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*

Special Guest: Tom Jones.