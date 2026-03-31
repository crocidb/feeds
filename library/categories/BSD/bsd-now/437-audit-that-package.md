+++
title = "437: Audit that package"
description = "Using FreeBSD’s pkg-audit, 20 year old bug that went to Mars, FreeBSD on Slimbook, LLDB FreeBSD kernel core dump support, Steam on OpenBSD, Cool but obscure X11 tools, and moreNOTES   This episode of BSDNow is brought to you by Tarsnap and "
date = "2022-01-13T08:00:00Z"
url = "https://www.bsdnow.tv/437"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.406832463Z"
seen = true
+++

Using FreeBSD’s pkg-audit, 20 year old bug that went to Mars, FreeBSD on Slimbook, LLDB FreeBSD kernel core dump support, Steam on OpenBSD, Cool but obscure X11 tools, and more

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow) and the [BSDNow Patreon](https://www.patreon.com/bsdnow)

Headlines
----------

### [Using FreeBSD’s pkg-audit](https://klarasystems.com/articles/using-freebsds-pkg-audit-to-investigate-known-security-issues/) ###

---

### [The 20 year old bug that went to Mars](http://blog.securitymouse.com/2014/06/raising-lazarus-20-year-old-bug-that.html) ###

>
>
> It's rare that you come across a bug so subtle that it can last for two decades. But, that's exactly what has happened with the Lempel-Ziv-Oberhumer (LZO) algorithm. Initially written in 1994, Markus Oberhumer designed a sophisticated and extremely efficient compression algorithm so elegant and well architected that it outperforms zlib and bzip by four or five times their decompression speed.
>
>
>
> I was impressed to find out that his LZO algorithm has gone to the planet Mars on NASA devices multiple times! Most recently, LZO has touched down on the red planet within the Mars Curiosity Rover, which just celebrated its first martian anniversary on Tuesday.
>
>
>
> In the past few years, LZO has gained traction in file systems as well. LZO can be used in the Linux kernel within btrfs, squashfs, jffs2, and ubifs. A recent variant of the algorithm, LZ4, is used for compression in ZFS for Solaris, Illumos, and FreeBSD.
>
>
>
> With its popularity increasing, Lempel-Ziv-Oberhumer has been rewritten by many engineering firms for both closed and open systems. These rewrites, however, have always been based on Oberhumer's core open source implementation. As a result, they all inherited a subtle integer overflow. Even LZ4 has the same exact bug, but changed very slightly.
>
>
>
> Because the LZO algorithm is considered a library function, each specific implementation must be evaluated for risk, regardless of whether the algorithm used has been patched. Why? We are talking about code that has existed in the wild for two decades. The scope of this algorithm touches everything from embedded microcontrollers on the Mars Rover, mainframe operating systems, modern day desktops, and mobile phones. Engineers that have used LZO must evaluate the use case to identify whether or not the implementation is vulnerable, and in what format.
>
>

---

News Roundup
----------

### [FreeBSD on Slimbook -- 14 months of updates](https://euroquis.nl/freebsd/2021/12/11/slimbook.html) ###

---

### [LLDB FreeBSD kernel core dump support](https://www.moritz.systems/blog/lldb-freebsd-kernel-core-dump-support/) ###

---

### [Steam on OpenBSD](https://dataswamp.org/~solene/2021-12-01-openbsd-steam.html) ###

---

Beastie Bits
----------

```
• [OpenSSH Agent Restriction](http://undeadly.org/cgi?action=article;sid=20211220061017)
• [OpenBSD’s Clang upgraded to version 13](http://undeadly.org/cgi?action=article;sid=20211220060327)
• [Cool, but obscure X11 tools](http://cyber.dabamos.de/unix/x11/)

```

---

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

  ---