+++
title = "400: FreeBSD became 13"
description = "FreeBSD 13 is here, multi-factor authentication on OpenBSD, KDE on FreeBSD 2021o2, NetBSD GSoC report, a working D compiler on OpenBSD, and moreNOTES   This episode of BSDNow is brought to you by TarsnapHeadlines[FreeBSD 13.0 "
date = "2021-04-29T07:00:00Z"
url = "https://www.bsdnow.tv/400"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.461097993Z"
seen = true
+++

FreeBSD 13 is here, multi-factor authentication on OpenBSD, KDE on FreeBSD 2021o2, NetBSD GSoC report, a working D compiler on OpenBSD, and more

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [FreeBSD 13.0 R Annoucement](https://www.freebsd.org/releases/13.0R/announce/) ###

```
• OpenZFS 2.0 (almost 2.1) is included in 13.0
• Removed support for previously-deprecated algorithms in geli(8).
• The armv8crypto(4) driver now supports AES-GCM which is used by IPsec and kernel TLS.

```

---

### [Enable multi-factor authentication on OpenBSD](https://dataswamp.org/~solene/2021-02-06-openbsd-2fa.html) ###

>
>
> In this article I will explain how to add a bit more security to your OpenBSD system by adding a requirement for user logging into the system, locally or by ssh. I will explain how to setup 2 factor authentication (2FA) using TOTP on OpenBSD
>
>

---

News Roundup
----------

### [KDE on FreeBSD 2021o2](https://euroquis.nl/kde/2021/03/26/freebsd2021o2.html) ###

>
>
> Gosh, second octant already! Well, let’s take a look at the big things that happened in KDE-on-FreeBSD in these six-and-a-half weeks.
>
>

---

### [GSoC Reports: Make system(3), popen(3) and popenve(3) use posix\_spawn(3) internally (Final report)](http://blog.netbsd.org/tnf/entry/gsoc_reports_make_system_31) ###

>
>
> My code can be found at github.com/teknokatze/src in the gsoc2020 branch, at the time of writing some of it is still missing. The test facilities and logs can be found in github.com/teknokatze/gsoc2020. A diff can be found at github which will later be split into several patches before it is sent to QA for merging.  
>  The initial and defined goal of this project was to make system(3) and popen(3) use posix\_spawn(3) internally, which had been completed in June. For the second part I was given the task to replace fork+exec calls in our standard shell (sh) in one scenario. Similar to the previous goal we determined through implementation if the initial motivation, to get performance improvements, is correct otherwise we collect metrics for why posix\_spawn() in this case should be avoided. This second part meant in practice that I had to add and change code in the kernel, add a new public libc function, and understand shell internals.
>
>
> ---
>

### [A working D compiler on OpenBSD](https://undeadly.org/cgi?action=article;sid=20210322080633) ###

>
>
> Dr. Brian Robert Callahan (bcallah@) blogged about his work in getting D compiler(s) working under OpenBSD.
>
>
>
> * [Full Post](https://briancallahan.net/blog/20210320.html) \*\*\*
>
>

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Vasilis - upgrade question](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/400/feedback/Vasilis - upgrade question>)
* [Dennis - zfs questions](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/400/feedback/Dennis - zfs questions>)
* [Daniel Dettlaff - KTLS question](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/400/feedback/dmilith - KTLS>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*