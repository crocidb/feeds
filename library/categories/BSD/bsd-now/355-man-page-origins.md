+++
title = "355: Man Page Origins"
description = "Upgrading OpenBSD, Where do Unix man pages come from?, Help for NetBSD’s VAX port, FreeBSD on Dell Latitude 7390, PFS Tool changes in DragonflyBSD, and more.NOTES   This episode of BSDNow is brought to you by TarsnapHeadlines[How to"
date = "2020-06-18T11:00:00Z"
url = "https://www.bsdnow.tv/355"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.533583567Z"
seen = false
+++

Upgrading OpenBSD, Where do Unix man pages come from?, Help for NetBSD’s VAX port, FreeBSD on Dell Latitude 7390, PFS Tool changes in DragonflyBSD, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/)

Headlines
----------

### [How to Upgrade OpenBSD and Build a Kernel](https://cromwell-intl.com/open-source/openbsd-kernel.html) ###

>
>
> Let's see how to upgrade your OpenBSD system. Maybe you are doing this because the latest release just came out. If so, this is pretty simple: back up your data, boot from install media, and select "Upgrade" instead of "Install". But maybe the latest release has been out for a few months. Why would we go through the trouble of building and installing a new kernel or other core system components? Maybe some patches have been released to improve system security or stability. It is pretty easy to build and install a kernel on OpenBSD, easier and simpler in many ways than it is on Linux.
>
>

---

### [The History of man pages](https://manpages.bsd.lv/history.html) ###

>
>
> Where do UNIX manpages come from? Who introduced the section-based layout of NAME, SYNOPSIS, and so on? And for manpage authors: where were those economical two- and three-letter instructions developed?
>
>
> ---
>

### [VAX port needs help](http://blog.netbsd.org/tnf/entry/vax_port_needs_help) ###

>
>
> The VAX is the oldest machine architecture still supported by NetBSD.  
>  Unfortunately there is another challenge, totally outside of NetBSD, but affecting the VAX port big time: the compiler support for VAX is ... let's say sub-optimal. It is also risking to be dropped completely by gcc upstream.  
>  Now here is where people can help: there is a bounty campaign to finance a gcc hacker to fix the hardest and most immediate issue with gcc for VAX. Without this being resolved, gcc will drop support for VAX in a near future version.
>
>
> ---
>

### [My new FreeBSD Laptop: Dell Latitude 7390](http://www.daemonology.net/blog/2020-05-22-my-new-FreeBSD-laptop-Dell-7390.html) ###

>
>
> As a FreeBSD developer, I make a point of using FreeBSD whenever I can — including on the desktop. I've been running FreeBSD on laptops since 2004; this hasn't always been easy, but over the years I've found that the situation has generally been improving. One of the things we still lack is adequate documentation, however — so I'm writing this to provide an example for users and also Google bait in case anyone runs into some of the problems I had to address.
>
>
> ---
>

### [PFS tool changes in DragonFly](https://www.dragonflydigest.com/2020/06/09/24612.html) ###

>
>
> HAMMER2 just became a little more DWIM: the pfs-list and pfs-delete directives will now look across all mounted filesystems, not just the current directory’s mount path. pfs-delete won’t delete any filesystem name that appears in more than one place, though
>
>
>
> * [git: hammer2 - Enhance pfs-list and pfs-delete](http://lists.dragonflybsd.org/pipermail/commits/2020-June/769226.html) Enhance pfs-list to list PFSs available across all mounted hammer2 filesystems instead of just the current directory's mount. A specific mount may be specified via -s mountpt. Enhance pfs-delete to look for the PFS name across all mounted hammer2 filesystems instead of just the current directory's mount. As a safety, pfs-delete will refuse to delete PFS names which are duplicated across multiple mounts. A specific mount may be specified via -s mountpt.
>
>

---

Beastie Bits
----------

* [BastilleBSD Templates](https://gitlab.com/bastillebsd-templates)
* [Tianocore update](https://www.dragonflydigest.com/2020/06/08/24610.html)
* [Reminder: FreeBSD Office Hours on June 24, 2020](https://wiki.freebsd.org/OfficeHours) \*\*\* ###Tarsnap
* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Niclas - Regarding the Lenovo E595 user from Episode 340](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/355/feedback/Niclas - Regarding the Lenovo E595 user from Episode 340.md>)
* [Erik - What happened with the video](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/355/feedback/Erik - What happened with the video.md>)
* [Igor - Boot Environments](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/355/feedback/Igor - Boot Environments.md>) \*\*\*
* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*