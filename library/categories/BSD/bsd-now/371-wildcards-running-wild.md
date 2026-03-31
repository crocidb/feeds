+++
title = "371: Wildcards running wild"
description = "New Project: zedfs.com, TrueNAS CORE Ready for Deployment, IPC in FreeBSD 11: Performance Analysis, Unix Wildcards Gone Wild, Unix Wars, and moreNOTES   This episode of BSDNow is brought to you by TarsnapHeadlines[My New Proje"
date = "2020-10-08T10:00:00Z"
url = "https://www.bsdnow.tv/371"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.507782536Z"
seen = true
+++

New Project: zedfs.com, TrueNAS CORE Ready for Deployment, IPC in FreeBSD 11: Performance Analysis, Unix Wildcards Gone Wild, Unix Wars, and more

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [My New Project: zedfs.com](https://www.oshogbo.vexillium.org/blog/80/) ###

>
>
> Have you ever had an idea that keeps coming back to you over and over again? For a week? For a month? I know that feeling. My new project was born from this feeling.  
>  On this blog, I mix content a lot. I have written personal posts (not many of them, but still), FreeBSD development posts, development posts, security posts, and ZFS posts. This mixed content can be problematic sometimes. I share a lot of stuff here, and readers don’t know what to expect next. I am just excited by so many things, and I want to share that excitement with you!
>
>
> ---
>

### [TrueNAS CORE is Ready for Deployment](https://www.ixsystems.com/blog/truenas-12-rc-1/) ###

>
>
> TrueNAS 12.0 RC1 was released yesterday and with it, TrueNAS CORE is ready for deployment. The merger of FreeNAS and TrueNAS into a unified software image can now begin its path into mainstream use. TrueNAS CORE is the new FreeNAS and is on schedule.  
>  The TrueNAS 12.0 BETA process started in June and has been the most successful BETA release ever with more than 3,000 users and only minor issues. Ars Technica provided a detailed technical walkthrough of the original BETA. There is a long list of features and performance improvements. During the BETA process, TrueNAS 12.0 demonstrated over 1.2 Million IOPS and over 23GB/s on a TrueNAS M60.
>
>
> ---
>

News Roundup
----------

### [Interprocess Communication in FreeBSD 11: Performance Analysis](https://arxiv.org/pdf/2008.02145.pdf) ###

>
>
> Interprocess communication, IPC, is one of the most fundamental functions of a modern operating system, playing an essential role in the fabric of contemporary applications. This report conducts an investigation in FreeBSD of the real world performance considerations behind two of the most common IPC mechanisms; pipes and sockets. A simple benchmark provides a fair sense of effective bandwidth for each, and analysis using DTrace, hardware performance counters and the operating system’s source code is presented. We note that pipes outperform sockets by 63% on average across all configurations, and further that the size of userspace transmission buffers has a profound effect on performance — larger buffers are beneficial up to a point (∼ 32-64 KiB) after which performance collapses as a result of devastating cache exhaustion. A deep scrutiny of the probe effects at play is also presented, justifying the validity of conclusions drawn from these experiments.
>
>
> ---
>

### [Back To The Future: Unix Wildcards Gone Wild](https://www.defensecode.com/public/DefenseCode_Unix_WildCards_Gone_Wild.txt) ###

>
>
> First of all, this article has nothing to do with modern hacking techniques like ASLR bypass, ROP exploits, 0day remote kernel exploits or Chrome's Chain-14-Different-Bugs-To-Get-There... Nope, nothing of the above. This article will cover one interesting old-school Unix hacking technique, that will still work nowadays in 2013.
>
>
> ---
>

### [Unix Wars](https://www.livinginternet.com/i/iw_unix_war.htm) ###

>
>
> Dozens of different operating systems have been developed over the years, but only Unix has grown in so many varieties. There are three main branches. Four factors have facilitated this growth...
>
>
> ---
>

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Chris - installing FreeBSD 13-current](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/371/feedback/Chris - installing FreeBSD 13-current.md>)
* [Dane - FreeBSD History Lesson](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/371/feedback/Dane - FreeBSD History Lesson.md>)
* [Marc - linux compat](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/371/feedback/Marc - linux compat.md>)
* [Mason - apropos battery](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/371/feedback/Mason - apropos battery.md>)
* [Paul - a topic idea](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/371/feedback/Paul - a topic idea.md>)

  ---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

  ---