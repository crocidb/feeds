+++
title = "367: Changing jail datasets"
description = "A 35 Year Old Bug in Patch, Sandbox for FreeBSD, Changing from one dataset to another within a jail, You don’t need tmux or screen for ZFS, HardenedBSD August 2020 Status Report and Call for Donations, and more.NOTES   This episode of BSDNow is brought to you by [Tarsnap](h"
date = "2020-09-10T10:00:00Z"
url = "https://www.bsdnow.tv/367"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.514308122Z"
seen = false
+++

A 35 Year Old Bug in Patch, Sandbox for FreeBSD, Changing from one dataset to another within a jail, You don’t need tmux or screen for ZFS, HardenedBSD August 2020 Status Report and Call for Donations, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/)

Headlines
----------

### [A 35 Year Old Bug in Patch](http://bsdimp.blogspot.com/2020/08/a-35-year-old-bug-in-patch-found-in.html) ###

>
>
> Larry Wall posted patch 1.3 to mod.sources on May 8, 1985. A number of versions followed over the years. It's been a faithful alley for a long, long time. I've never had a problem with patch until I embarked on the 2.11BSD restoration project. In going over the logs very carefully, I've discovered a bug that bites this effort twice. It's quite interesting to use 27 year old patches to find this bug while restoring a 29 year old OS...
>
>

---

### [Sandbox for FreeBSD](https://www.relkom.sk/en/fbsd_sandbox.shtml) ###

>
>
> A sandbox is a software which artificially limits access to the specific resources on the target according to the assigned policy. The sandbox installs hooks to the kernel syscalls and other sub-systems in order to interrupt the events triggered by the application. From the application point of view, application working as usual, but when it wants to access, for instance, /dev/kmem the sandbox software decides against the assigned sandbox scheme whether to grant or deny access.  
>  In our case, the sandbox is a kernel module which uses MAC (Mandatory Access Control) Framework developed by the TrustedBSD team. All necessary hooks were introduced to the FreeBSD kernel.
>
>

* [Source Code](https://gitlab.com/relkom/sandbox)
* [Documentation](https://www.relkom.sk/en/fbsd_sandbox_docs.shtml)

---

News Roundup
----------

### [Changing from one dataset to another within a jail](https://dan.langille.org/2020/08/16/changing-from-one-dataset-to-another-within-a-freebsd-iocage-jail/) ###

>
>
> ZFS has a the ability to share itself within a jail. That gives the jail some autonomy, and I like that.  
>  I’ve written briefly about that, specifically for iocage. More recently, I started using a zfs snapshot for caching clearing.  
>  The purpose of this post is to document the existing configuration of the production FreshPorts webserver and outline the plan on how to modify it for more zfs-snapshot-based cache clearing.
>
>

---

### [You don’t need tmux or screen for ZFS](https://rubenerd.com/you-dont-need-tmux-or-screen-for-zfs/) ###

>
>
> Back in January I mentioned how to add redundancy to a ZFS pool by adding a mirrored drive. Someone with a private account on Twitter asked me why FreeBSD—and NetBSD!—doesn’t ship with a tmux or screen equivilent in base in order to daemonise the process and let them run in the background.  
>  ZFS already does this for its internal commands.
>
>

---

### [HardenedBSD August 2020 Status Report and Call for Donations](https://hardenedbsd.org/article/shawn-webb/2020-08-15/hardenedbsd-august-2020-status-report-and-call-donations) ###

>
>
> This last month has largely been a quiet one. I've restarted work on porting five-year-old work from the Code Pointer Integrity (CPI) project into HardenedBSD. Chiefly, I've started forward-porting the libc and rtld bits from the CPI project and now need to look at llvm compiler/linker enhancements. We need to be able to apply SafeStack to shared objects, not just application binaries. This forward-porting work I'm doing is to support that effort.  
>  The infrastructure has settled and is now churning normally and happily. We're still working out bandwidth issues. We hope to have a new fiber line ran by the end of September.  
>  As part of this status report, I'm issuing a formal call for donations. I'm aiming for $4,000.00 USD for a newer self-hosted Gitea server. I hope to purchase the new server before the end of 2020.
>
>

---

### [Important parts of Unix's history happened before readline support was common](https://utcc.utoronto.ca/~cks/space/blog/unix/TimeBeforeReadline) ###

>
>
> Unix and things that run on Unix have been around for a long time now. In particular, GNU Readline was first released in 1989 (as was Bash), which is long enough ago for it (or lookalikes) to become pretty much pervasive, especially in Unix shells. Today it's easy to think of readline support as something that's always been there. But of course this isn't the case. Unix in its modern form dates from V7 in 1979 and 4.2 BSD in 1983, so a lot of Unix was developed before readline and was to some degree shaped by the lack of it.
>
>

---

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Mason - mailserver](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/367/feedback/Mason - mailserver.md>)
* [casey - freebsd on decline](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/367/feedback/casey - freebsd on decline.md>)
* [denis - postgres](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/367/feedback/denis - postgres.md>) \*\*\*
* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*