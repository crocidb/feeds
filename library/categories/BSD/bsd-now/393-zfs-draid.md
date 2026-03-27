+++
title = "393: ZFS dRAID"
description = "Lessons learned from a 27 years old UNIX book, Finally dRAID, Setting up a Signal Proxy using FreeBSD, Annotate your PDF files on OpenBSD, Things You Should Do Now, Just: More unixy than Make, and moreNOTES   This episode of BSDNow is brought to you by [Tarsnap](https://www"
date = "2021-03-11T08:00:00Z"
url = "https://www.bsdnow.tv/393"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.472246004Z"
seen = false
+++

Lessons learned from a 27 years old UNIX book, Finally dRAID, Setting up a Signal Proxy using FreeBSD, Annotate your PDF files on OpenBSD, Things You Should Do Now, Just: More unixy than Make, and more

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [Lessons learned from a 27 years old UNIX book](https://www.linux.it/~ema/posts/porsche-book/) ###

>
>
> One of the Amazon reviewers of "Sun Performance and Tuning: Java and the Internet" gave it 3/5 stars. While still a nice introduction, the book by Adrian Cockcroft has become dated — claimed Roland in 2003, which believe it or not was 18 years ago...
>
>
> ---
>
>
> ### [dRAID, Finally!](https://klarasystems.com/articles/openzfs-draid-finally/) ###
>
>
>
> Admins will often use wide RAID stripes to maximize usable storage given a number of spindles. RAID-Z deployments with large stripe widths, ten or larger, are subject to poor resilver performance for a number of reasons. Resilvering a full vdev means reading from every healthy disk and continuously writing to the new spare. This will saturate the replacement disk with writes while scattering seeks over the rest of the vdev. For 14 wide RAID-Z2 vdevs using 12TB spindles, rebuilds can take weeks. Resilver I/O activity is deprioritized when the system has not been idle for a minimum period. Full zpools get fragmented and require additional I/O’s to recalculate data during reslivering. A pool can degenerate into a never ending cycle of rebuilds or loss of the pool Aka: the Death Spiral.
>
>
> ---
>
>
> News Roundup
> ----------
>
>
>
> ### [Setting up a Signal Proxy using FreeBSD](https://www.neelc.org/posts/freebsd-signal-proxy/) ###
>
>
>
> With the events that the private messaging app Signal has been blocked in Iran, Signal has come up with an “proxy” solution akin to Tor’s Bridges, and have given instructions on how to do it.  
>  For people who prefer FreeBSD over Linux like myself, we obviously can’t run Docker, which is what Signal’s instructions focus on.  
>  Fortunately, the Docker image is just a fancy wrapper around nginx, and the configs can be ported to any OS. Here, I’ll show you how to set up a Signal Proxy on FreeBSD.
>
>
> ---
>

### [Annotate your PDF files on OpenBSD](https://www.tumfatig.net/20210126/annotate-your-pdf-files-on-openbsd) ###

>
>
> On my journey to leave macOS, I regularly look to mimic some of the features I use. Namely, annotating (or signing) PDF files is a really simple task using Preview. I couldn’t do it on OpenBSD using Zathura, Xpdf etc. But there is a software in the ports that can achieve this: Xournal.  
>  Xournal is “an application for notetaking, sketching, keeping a journal using a stylus“. And now that my touchscreen is calibrated, highlighting can even be done with the fingers :)
>
>
> ---
>

### [Things You Should Do Now](https://secure.phabricator.com/book/phabflavor/article/things_you_should_do_now/) ###

>
>
> Describes things you should do now when building software, because the cost to do them increases over time and eventually becomes prohibitive or impossible.
>
>
> ---
>
>
> ### [Just: A command runner. More unixy than Make because it does even less.](https://github.com/casey/just/) ###
>
>
>
> I think it's in the do-one-thing-well spirit of Unix, because it's just a command runner, no build system at all. Just has a bunch of nice features:
>
>

* Can be invoked from any subdirectory
* Arguments can be passed from the command line
* Static error checking that catches syntax errors and typos
* Excellent error messages with source context
* The ability to list recipes from the command line
* Recipes can be written in any language
* Works on Linux, macOS, and Windows
* And much more!

>
>
> Just doesn't replace Make, or any other build system, but it does replace reverse-searching your command history, telling colleagues the weird flags they need to pass to do the thing, and forgetting how to run old projects.
>
>

---

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Marc - Confused about Snapshots](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/393/feedback/Marc - Confused about Snapshots>) Dan’s gist: [https://gist.github.com/dlangille/3140e60a816226ed75365ba8af185085](https://gist.github.com/dlangille/3140e60a816226ed75365ba8af185085)
* [Pete - A Question](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/393/feedback/Pete - A Question>)
* [Rick - ZFS Idea](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/393/feedback/Rick - ZFS Idea>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*

Special Guest: Dan Langille.