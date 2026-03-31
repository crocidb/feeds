+++
title = "291: Storage Changes Software"
description = 'Storage changing software, what makes Unix special, what you need may be “pipeline +Unix commands”, running a bakery on Emacs and PostgreSQL, the ultimate guide to memorable tech talks, light-weight contexts, and more.\Headlines\[Tracking a storage issue led to software chan'
date = "2019-03-28T14:00:00Z"
url = "https://www.bsdnow.tv/291"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.650665907Z"
seen = true
+++

Storage changing software, what makes Unix special, what you need may be “pipeline +Unix commands”, running a bakery on Emacs and PostgreSQL, the ultimate guide to memorable tech talks, light-weight contexts, and more.

\##Headlines

\###[Tracking a storage issue led to software change](https://news.gandi.net/en/2019/03/tracking-a-storage-issue-led-to-software-change/)

>
>
> Early last year we completed a massive migration that moved our customers’ hosting data off of a legacy datacenter (that we called FR-SD2) onto several new datacenters (that we call FR-SD3, FR-SD5, and FR-SD6) with much more modern, up-to-date infrastructure.  
>  This migration required several changes in both the software and hardware we use, including switching the operating system on our storage units to FreeBSD.  
>  Currently, we use the NFS protocol to provide storage and export the filesystems on Simple Hosting, our web hosting service, and the FreeBSD kernel includes an NFS server for just this purpose.
>
>

* Problem

>
>
> While migrating virtual disks of Simple Hosting instances from FR-SD2, we noticed high CPU load spikes on the new storage units.
>
>

---

\###[What Makes Unix Special](https://www.softwaredevelopment.site/2019/02/what-makes-unix-special.html)

>
>
> Ever since Unix burst onto the scene within the early '70s, observers within the pc world have been fast to put in writing it off as a unusual working system designed by and for knowledgeable programmers. Regardless of their proclamations, Unix refuses to die. Means again in 1985, Stewart Cheifet puzzled if Unix would turn out to be the usual working system of the longer term on the PBS present “The Laptop Chronicles,” though MS-DOS was effectively in its heyday. In 2018, it is clear that Unix actually is the usual working system, not on desktop PCs, however on smartphones and tablets.
>
>

* What Makes Unix Special?

>
>
> It is also the usual system for net servers. The actual fact is, hundreds of thousands of individuals all over the world have interacted with Linux and Unix programs daily, most of whom have by no means written a line of code of their lives.  
>  So what makes Unix so beloved by programmers and different techie sorts? Let’s check out a few of issues this working system has going for it. (For some background on Unix, try The Historical past of Unix: From Bell Labs to the iPhone.)
>
>

---

\##News Roundup  
 \###[What you need may be “pipeline +Unix commands” only](https://nanxiao.me/en/what-you-need-may-be-pipeline-unix-commands-only/)

>
>
> I came across Taco Bell Programming recently, and think this article is worthy to read for every software engineer. The post mentions a scenario which you may consider to use Hadoop to solve but actually xargs may be a simpler and better choice. This reminds me a similar experience: last year a client wanted me to process a data file which has 5 million records. After some investigations, no novel technologies, a concise awk script (less than 10 lines) worked like a charm! What surprised me more is that awk is just a single-thread program, no nifty concurrency involved.  
>  The IT field never lacks “new” technologies: cloud computing, big data, high concurrency, etc. However, the thinkings behind these “fancy” words may date back to the era when Unix arose. Unix command line tools are invaluable treasure. In many cases, picking the right components and using pipeline to glue them can satisfy your requirement perfectly. So spending some time in reviewing Unixcommand line manual instead of chasing state-of-the-art techniques exhaustedly, you may gain more.  
>  BTW, if your data set can be disposed by an awk script, it should not be called “big data”.
>
>

* [Taco Bell Programming](http://widgetsandshit.com/teddziuba/2010/10/taco-bell-programming.html)

---

\###[Running a bakery on Emacs and PostgreSQL](https://bofh.org.uk/2019/02/25/baking-with-emacs/)

>
>
> Just over a year ago now, I finally opened the bakery I’d been dreaming of for years. It’s been a big change in my life, from spending all my time sat in front of a computer, to spending most of it making actual stuff. And stuff that makes people happy, at that. It’s been a huge change, but I can’t think of a single job change that’s ever made me as happy as this one.  
>  One of the big changes that came with going pro was that suddenly I was having to work out how much stuff I needed to mix to fill the orders I needed. On the face of it, this is really simple, just work out how much dough you need, then work out what quantities to mix to make that much dough. Easy. You can do it with a pencil and paper. Or, in traditional bakers’ fashion, by scrawling with your finger on a floured work bench.  
>  And that’s how I coped for a few weeks early on. But I kept making mistakes, which makes for an inconsistent product (bread is very forgiving, you have to work quite hard to make something that isn’t bread, but consistency matters). I needed to automate.
>
>

---

\###[The Ultimate Guide To Memorable Tech Talks](https://medium.com/@nnja/the-ultimate-guide-to-memorable-tech-talks-e7c350778d4b)

>
>
> Imagine this. You’re a woman in a male-dominated field. English is not your first language. Even though you’re confident in your engineering work, the thought of public speaking and being recorded for the world to see absolutely terrifies you.  
>  That was me, five years ago. Since then, I’ve moved into a successful career in Developer Advocacy and spoken at dozens of technical events in the U.S. and worldwide.  
>  I think everyone has the ability to deliver stellar conference talks, which is why I took the time to write this post.
>
>

* The Ultimate Guide
* 1: Introduction
* 2: Choosing a Topic
* 3: Writing a Conference Proposal (or CFP)
* 4: Tools of the Trade
* 5: Planning and Time Estimation
* 6: Writing a Talk
* 7: Practice and Delivery

---

\###[Light-weight Contexts: An OS Abstraction for Safety and Performance (2016)](https://people.mpi-sws.org/~druschel/publications/osdi16.pdf)

>
>
> Abstract: “We introduce a new OS abstraction—light-weight con-texts (lwCs)—that provides independent units of protection, privilege, and execution state within a process. A process may include several lwCs, each with possibly different views of memory, file descriptors, and access capabilities. lwCs can be used to efficiently implement roll-back (process can return to a prior recorded state),isolated address spaces (lwCs within the process may have different views of memory, e.g., isolating sensitive data from network-facing components or isolating different user sessions), and privilege separation (in-process reference monitors can arbitrate and control access).  
>  lwCs can be implemented efficiently: the overhead of a lwC is proportional to the amount of memory exclusive to the lwC; switching lwCs is quicker than switching kernel threads within the same process. We describe the lwC abstraction and API, and an implementation of lwCs within the FreeBSD 11.0 kernel. Finally, we present an evaluation of common usage patterns, including fast roll-back, session isolation, sensitive data isolation, and in-process reference monitoring, using Apache, nginx, PHP,and OpenSSL.”
>
>

---

\##Beastie Bits

* [May 7th - BSD Users Stockholm Meetup #6 ](https://www.meetup.com/BSD-Users-Stockholm/events/259528492/)
* [sysutils/docker-freebsd: Searching for people to help](https://lists.freebsd.org/pipermail/freebsd-virtualization/2019-February/007218.html)
* [Cat Tax - Ever wonder what Midnight the cat was like?](https://twitter.com/midnightbsd/status/1104018684748677122)
* [Fixing Unix/Linux/POSIX Filenames](https://dwheeler.com/essays/fixing-unix-linux-filenames.html)
* [Metasploit on OpenBSD](https://chargen.one/h3artbl33d/metasploit-on-openbsd)
* [Run Your @wn Email Server! with NetBSD](https://schmonz.com/2019/01/25/devopsdays-nyc-run-your-own-email-server/slides/#1)
* [rdist(1)](http://johan.huldtgren.com/posts/2019/rdist)
* [Writing a Book with Unix](https://joecmarshall.com/posts/book-writing-environment/)
* [7 Unix Commands Every Data Scientist Should Know](https://neowaylabs.github.io/programming/unix-shell-for-data-scientists/)
* [Explaining Code using ASCII Art](https://blog.regehr.org/archives/1653)
* [FreeBSD Aberdeen Hackathon](https://wiki.freebsd.org/Hackathon/201904)
* [FreeBSD Vienna Hackathon](https://wiki.freebsd.org/Hackathon/201906)

---

\##Feedback/Questions

* Mike - [FreeBSD Update and Erased EFI files](http://dpaste.com/2405MF1#wrap)

* Charles - [Volunteer work](http://dpaste.com/2WFTXR2#wrap)

* Jake - [Bhyve Front Ends](http://dpaste.com/1AA6C55)

* We’ve hit that point where we are running low on your questions, so if you have any questions rolling around in your head that you’ve not thought of to ask yet… send them in!

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

 Your browser does not support the HTML5 video tag.