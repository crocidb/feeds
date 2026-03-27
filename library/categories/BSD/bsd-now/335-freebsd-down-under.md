+++
title = "335: FreeBSD Down Under"
description = "Hyperbola Developer interview, why you should migrate from Linux to BSD, FreeBSD is an amazing OS, improving the ptrace(2) API in LLVM 10, First FreeBSD conference in Australia, and a guide to containers on FreeNAS.Headlines[FreeBSD is an amazing operating System](h"
date = "2020-01-30T13:00:00Z"
url = "https://www.bsdnow.tv/335"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.567667010Z"
seen = false
+++

Hyperbola Developer interview, why you should migrate from Linux to BSD, FreeBSD is an amazing OS, improving the ptrace(2) API in LLVM 10, First FreeBSD conference in Australia, and a guide to containers on FreeNAS.

Headlines
----------

### [FreeBSD is an amazing operating System](https://www.unixsheikh.com/articles/freebsd-is-an-amazing-operating-system.html) ###

>
>
> Update 2020-01-21: Since I wrote this article it got posted on Hacker News, Reddit and Lobster, and a few people have emailed me with comments. I have updated the article with comments where I have found it needed. As an important side note I would like to point out that I am not a FreeBSD developer, there may be things going on in the FreeBSD world that I know absolutely nothing about. I am also not glued to the FreeBSD developer mailing lists. I am not a FreeBSD "fanboy". I have been using GNU/Linux a ton more for the past two decades than FreeBSD, mainly due to hardware incompatibility (lacking or buggy drivers), and I love both Debian GNU/Linux and Arch Linux just as much as FreeBSD. However, I am concerned about the development of GNU/Linux as of late. Also this article is not about me trying to make anyone switch from something else to FreeBSD. It's about why I like FreeBSD and that I recommend you try it out if you're into messing with operating systems.
>
>
>
> I think the year was late 1999 or mid 2000 when I one day was browsing computer books at my favorite bookshop and I discovered the book The Complete FreeBSD third edition from 1999 by Greg Lehey. With the book came 4 CD Roms with FreeBSD 3.3.
>
>
>
> I had already familiarized myself with GNU/Linux in 1998, and I was in the process of migrating every server and desktop operating system away from Microsoft Windows, both at home and at my company, to GNU/Linux, initially Red Hat Linux and then later Debian GNU/Linux, which eventually became my favorite GNU/Linux distribution for many years.
>
>
>
> When I first saw The Complete FreeBSD book by Greg Lehey I remember noticing the text on the front page that said, "The Free Version of Berkeley UNIX" and "Rock Solid Stability", and I was immediately intrigued! What was that all about? A free UNIX operating system! And rock solid stability? That sounded amazing.
>
>

---

### [Hyperbola Dev Interview](https://itsfoss.com/hyperbola-linux-bsd/) ###

>
>
> In late December 2019, Hyperbola announced that they would be making major changes to their project. They have decided to drop the Linux kernel in favor of forking the OpenBSD kernel. This announcement only came months after Project Trident announced that they were going in the opposite direction (from BSD to Linux).
>
>
>
> Hyperbola also plans to replace all software that is not GPL v3 compliant with new versions that are.
>
>
>
> To get more insight into the future of their new project, I interviewed Andre, co-founder of Hyperbola.
>
>

---

News Roundup
----------

### [Improving the ptrace(2) API and preparing for LLVM-10.0](https://blog.netbsd.org/tnf/entry/improving_the_ptrace_2_api) ###

>
>
> This month I have improved the NetBSD ptrace(2) API, removing one legacy interface with a few flaws and replacing it with two new calls with new features, and removing technical debt.
>
>
>
> As LLVM 10.0 is branching now soon (Jan 15th 2020), I worked on proper support of the LLVM features for NetBSD 9.0 (today RC1) and NetBSD HEAD (future 10.0).
>
>

---

### [The first FreeBSD conference in Australia](https://rubenerd.com/the-first-freebsd-conference-in-australia/) ###

>
>
> FreeBSD has existed as an operating system, project, and foundation for more than twenty years, and its earlier incantations have exited for far longer. The old guard have been developing code, porting software, and writing documentation for longer than I’ve existed. I’ve been using it for more than a decade for personal projects, and professionally for half that time.
>
>
>
> While there are many prominent Australian FreeBSD contributors, sysadmins, and users, we’ve always had to venture overseas for conferences. We’re always told Australians are among the most ardent travellers, but I always wondered if we could do a domestic event as well.
>
>
>
> And on Tuesday, we did! Deb Goodkin and the FreeBSD Foundation graciously organised and chaired a dedicated FreeBSD miniconf at the long-running linux.conf.au event held each year in a different city in Australia and New Zealand.
>
>

---

### [A practical guide to containers on FreeNAS for a depraved psychopath](https://medium.com/@andoriyu/a-practical-guide-to-containers-on-freenas-for-a-depraved-psychopath-c212203c0394) ###

>
>
> This is a simple write-up to setup Docker on FreeNAS 11 or FreeBSD 11.
>
>

But muh jails?

>
>
> You know that jails are dope and you know that jails are dope, yet no one else knows it. So here we are stuck with docker. Two years ago I would be the last person to recommend using docker, but a whole lot of things has changes past years…
>
>

So jails are dead then?

>
>
> No, jails are still dope, but jails lack tools to manage them. Yes, there are a few tools, but they meant for hard-core FreeBSD users who used to suffering. Docker allows you to run applications without deep knowledge of application you’re running. It will also allow you to run applications that are not ported to FreeBSD.
>
>

---

### [Why you should migrate everything from Linux to BSD](https://www.unixsheikh.com/articles/why-you-should-migrate-everything-from-linux-to-bsd.html) ###

>
>
> As an operating system GNU/Linux has become a real mess because of the fragmented nature of the project, the bloatware in the kernel, and because of the jerking around by commercial interests.
>
>

* Response [Should you migrate from Linux to BSD? It depends.](https://fediverse.blog/~/AllGoodThings/should-you-migrate-from-linux-to-bsd-it-depends)

Beastie Bits
----------

* [Using the OpenBSD ports tree with dedicated users](https://dataswamp.org/~solene/2020-01-11-privsep.html)
* [broot on FreeBSD](https://vermaden.wordpress.com/2020/01/10/run-broot-on-freebsd/)
* [A Trip down Memory Lane](https://svnweb.freebsd.org/base/head/share/misc/bsd-family-tree?view=co)
* [Running syslog-ng in BastilleBSD](https://www.syslog-ng.com/community/b/blog/posts/running-syslog-ng-in-bastillebsd)
* [NASA : Using Software Packages in pkgsrc](https://www.nas.nasa.gov/hecc/support/kb/using-software-packages-in-pkgsrc_493.html)

---

Feedback/Questions
----------

* All of our questions this week were pretty technical in nature so I'm going to save those for the next episode so Allan can weigh in on them, since if we cover them now we're basically going to be deferring to Allan anyway.

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.