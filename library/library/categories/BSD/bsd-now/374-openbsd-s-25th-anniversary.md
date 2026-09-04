+++
title = "374: OpenBSD’s 25th anniversary"
description = "OpenBSD 6.8 has been released, NetBSD 9.1 is out, OpenZFS devsummit report, BastilleBSD’s native container management for FreeBSD, cleaning up old tarsnap backups, Michael W. Lucas’ book sale, and more.NOTES   This episode of BSDNow is brought to you by [Tarsnap](https://ww"
date = "2020-10-29T11:00:00Z"
url = "https://www.bsdnow.tv/374"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.503257530Z"
seen = true
+++

OpenBSD 6.8 has been released, NetBSD 9.1 is out, OpenZFS devsummit report, BastilleBSD’s native container management for FreeBSD, cleaning up old tarsnap backups, Michael W. Lucas’ book sale, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [OpenBSD 6.8](https://www.openbsd.org/68.html) ###

>
>
> Released Oct 18, 2020. (OpenBSD's 25th anniversary)
>
>
> ---
>
>
> ### [NetBSD 9.1 Released](https://www.netbsd.org/releases/formal-9/NetBSD-9.1.html) ###
>
>
>
> The NetBSD Project is pleased to announce NetBSD 9.1, the first update of the NetBSD 9 release branch. It represents a selected subset of fixes deemed important for security or stability reasons, as well as new features and enhancements.
>
>
> ---
>

### [OpenZFS Developer Summit 2020](https://klarasystems.com/articles/openzfs-developer-summit-part-1/) ###

>
>
> As with most other conferences in the last six months, this year’s OpenZFS Developer’s Summit was a bit different than usual. Held via Zoom to accommodate for 2020’s new normal in terms of social engagements, the conference featured a mix of talks delivered live via webinars, and breakout sessions held as regular meetings. This helped recapture some of the “hallway track” that would be lost in an online conference.  
>  • After attending the conference, I wrote up some of my notes from each of the talks  
>  • [Part 2](https://klarasystems.com/articles/openzfs-developer-summit-part-2/)
>
>
> ---
>

### ZFS and FreeBSD Support ###

Klara offers flexible Support Subscriptions for your ZFS and FreeBSD infrastructure, simply sign up for our monthly subscription! What's even better is that for the month of October we are giving away 3 months for free, for every yearly subscription, and one month free when you sign up for a 6-months subscription! [Check it out on our website!](https://klarasystems.com/support/)

News Roundup
----------

### [BastilleBSD - native container management for FreeBSD](https://fibric.hashnode.dev/bastillebsd-native-container-management-for-freebsd) ###

>
>
> Some time ago, I had the requirement to use FreeBSD in a project, and soon the question came up if Docker and Kubernetes can be used.  
>  On FreeBSD, Docker is not very well supported, and even if you can get it running, Linux is used in a Docker container. My experience with Docker on FreeBSD is awful, and so I started looking for alternatives.  
>  A quick search on one of the most significant online search engines led me to Jails and then to BastilleBSD.
>
>

---

### [Tarsnap – cleaning up old backups](https://dan.langille.org/2020/09/10/tarsnap-cleaning-up-old-backups/) ###

>
>
> I use Tarsnap for my critical data. Case in point, I use it to backup my Bacula database dump. I use Bacula to backup my hosts. The database in question keeps track of what was backed up, from what host, the file size, checksum, where that backup is now, and many other items. Losing this data is annoying but not a disaster. It can be recreated from the backup volumes, but that is time consuming. As it is, the file is dumped daily, and rsynced to multiple locations.
>
>

---

### [MWL - BookSale](https://mwl.io/archives/8009) ###

>
>
> For those interested in such things, I recently posted my 60,000th tweet. This prodded me to try an experiment I’ve been pondering for a while.  
>  Over at my ebookstore, two of my books are now on a “Name Your Own Price” sale. You can get git commit murder and PAM Mastery for any price you wish, with a minimum of $1.
>
>
> ---
>

Beastie Bits
----------

* [Brian Kernighan: UNIX, C, AWK, AMPL, and Go Programming | Lex Fridman Podcast #109](https://www.youtube.com/watch?v=O9upVbGSBFo)
* [The UNIX Time-Sharing System - Dennis M. Ritchie and Ken Thompson - July 1974](https://chsasank.github.io/classic_papers/unix-time-sharing-system.html#)
* [Using a 1930 Teletype as a Linux Terminal](https://www.youtube.com/watch?v=2XLZ4Z8LpEE) \*\*\* ###Tarsnap
* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [lars - infosec handbook](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/374/feedback/lars - infosec handbook.md>)
* [scott - zfs import](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/374/feedback/scott - zfs import.md>)
* [zhong - first episode](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/374/feedback/zhong - first episode.md>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*