+++
title = "364: FreeBSD Wireless Grind"
description = "FreeBSD Qt WebEngine GPU Acceleration, the grind of FreeBSD’s wireless stack, thoughts on overlooking Illumos's syseventadm, when Unix learned to reboot, New EXT2/3/4 File-System driver in DragonflyBSD, and more.NOTES   This episode of BSDNow is brought to you by [Tarsnap]("
date = "2020-08-20T11:00:00Z"
url = "https://www.bsdnow.tv/364"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.519341167Z"
seen = false
+++

FreeBSD Qt WebEngine GPU Acceleration, the grind of FreeBSD’s wireless stack, thoughts on overlooking Illumos's syseventadm, when Unix learned to reboot, New EXT2/3/4 File-System driver in DragonflyBSD, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/)

Headlines
----------

### [FreeBSD Qt WebEngine GPU Acceleration](https://euroquis.nl/freebsd/2020/07/21/webengine.html) ###

>
>
> FreeBSD has a handful of Qt WebEngine-based browsers. Falkon, and Otter-Browser, and qutebrowser and probably others, too. All of them can run into issues on FreeBSD with GPU-accelerated rendering not working. Let’s look at some of the workarounds.
>
>

---

### [NetBSD on the Nanopi Neo2](https://www.cambus.net/netbsd-on-the-nanopi-neo2/) ###

>
>
> The NanoPi NEO2 from FriendlyARM has been serving me well since 2018, being my test machine for OpenBSD/arm64 related things.  
>  As NetBSD/evbarm finally gained support for AArch64 in NetBSD 9.0, released back in February, I decided to give it a try on this device. The board only has 512MB of RAM, and this is where NetBSD really shines. Things have become a lot easier since jmcneill@ now provides bootable ARM images for a variety of devices, including the NanoPi NEO2.
>
>

---

### [I'm back into the grind of FreeBSD's wireless stack and 802.11ac](https://adrianchadd.blogspot.com/2020/07/im-back-into-grind-of-freebsds-wireless.html) ###

>
>
> Yes, it's been a while since I posted here and yes, it's been a while since I was actively working on FreeBSD's wireless stack. Life's been .. well, life. I started the ath10k port in 2015. I wasn't expecting it to take 5 years, but here we are. My life has changed quite a lot since 2015 and a lot of the things I was doing in 2015 just stopped being fun for a while.  
>  But the stars have aligned and it's fun again, so here I am.
>
>

---

News Roundup
----------

### [Some thoughts on us overlooking Illumos's syseventadm](https://utcc.utoronto.ca/~cks/space/blog/solaris/OverlookingSyseventadm) ###

>
>
> In a comment on my praise of ZFS on Linux's ZFS event daemon, Joshua M. Clulow noted that Illumos (and thus OmniOS) has an equivalent in syseventadm, which dates back to Solaris. I hadn't previously known about syseventadm, despite having run Solaris fileservers and OmniOS fileservers for the better part of a decade, and that gives me some tangled feelings.
>
>

---

### [When Unix learned to reboot](https://bsdimp.blogspot.com/2020/07/when-unix-learned-to-reboot2.html) ###

>
>
> Recently, a friend asked me the history of halt, and when did we have to stop with the sync / sync / sync dance before running halt or reboot. The two are related, it turns out.
>
>

---

### [DragonFlyBSD Lands New EXT2/3/4 File-System Driver](https://www.phoronix.com/scan.php?page=news_item&px=DragonFlyBSD-New-EXT2FS) ###

>
>
> While DragonFlyBSD has its own, original HAMMER2 file-system, for those needing to access data from EXT2/EXT3/EXT4 file-systems, there is a brand new "ext2fs" driver implementation for this BSD operating system.  
>  DragonFlyBSD has long offered an EXT2 file-system driver (that also handles EXT3 and EXT4) while hitting their Git tree this week is a new version. The new sys/vfs/ext2fs driver, which will ultimately replace their existing sys/gnu/vfs/ext2fs driver is based on a port from FreeBSD code. As such, this driver is BSD licensed rather than GPL. But besides the more liberal license to jive with the BSD world, this new driver has various feature/functionality improvements over the prior version. However, there are some known bugs so for the time being both file-system drivers will co-exist.
>
>

---

Beastie Bits
----------

* [LibreOffice 7.0 call for testing](https://lists.freebsd.org/pipermail/freebsd-office/2020-July/005822.html)
* [More touchpad support](https://www.dragonflydigest.com/2020/07/15/24747.html)

---

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

[Casey - openbsd wirewall](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/364/feedback/casey - openbsd wirewall.md>)  
[Daryl - zfs](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/364/feedback/daryl - zfs.md>)  
[Raymond - hpe microserver](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/364/feedback/raymond - hpe microserver.md>)

---

* - Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*