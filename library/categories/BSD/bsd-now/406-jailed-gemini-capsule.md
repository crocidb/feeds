+++
title = "406: Jailed Gemini Capsule"
description = "Gemini Capsule in a FreeBSD Jail, FreeBSD Quarterly status report 2021Q1, NetBSD VM on bhyve (on TrueNAS), Interview with Michael Lucas, WireGuard Returns as Experimental Package in pfSense, CGI with Awk on OpenBSD httpd, and more.NOTES   This episode of BSDNow is brought t"
date = "2021-06-10T07:00:00Z"
url = "https://www.bsdnow.tv/406"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.451623450Z"
seen = false
+++

Gemini Capsule in a FreeBSD Jail, FreeBSD Quarterly status report 2021Q1, NetBSD VM on bhyve (on TrueNAS), Interview with Michael Lucas, WireGuard Returns as Experimental Package in pfSense, CGI with Awk on OpenBSD httpd, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [Gemini Capsule in a FreeBSD Jail](https://www.ecliptik.com/Gemini-Capsule-in-a-FreeBSD-Jail/) ###

>
>
> With the recent release of FreeBSD 13, I wanted to test it out on a spare RaspberryPi 3 that was part of my old Kubernetes cluster.  
>  In particular, FreeBSD Jails have always interested me, although I’ve never used them in practice. Over the years I’ve managed operating system virtualization through Solaris Zones and Docker containers, and Jails seem like and good middle ground between the two - easier to manage than zones and closer to the OS than Docker.  
>  I also want to run my own Gemini capsule locally to use some of the features that my other hosted capsules don’t have (like SCGI/CGI) and setting up a capsule in a Jail is a good way to learn both at the same time.
>
>

---

### [FreeBSD Quarterly status report 2021Q1](https://lists.freebsd.org/pipermail/freebsd-announce/2021-May/002033.html) ###

---

News Roundup
----------

### [NetBSD VM on bhyve (on TrueNAS)](https://bentsukun.ch/posts/bhyve-netbsd/) ###

>
>
> My new NAS at home is running TrueNAS Core. So far, it has been excellent, however I struggled a bit setting up a NetBSD VM on it. Part of the problem is that a lot of the docs and how-tos I found are stale, and the information in it no longer applies.  
>  TrueNAS Core allows running VMs using bhyve, which is FreeBSD’s hypervisor. NetBSD is not an officially supported OS, at least according to the guest OS chooser in the TrueNAS web UI :) But since the release of NetBSD 9 a while ago, things have become far simpler than they used to be – with one caveat (see below).
>
>

---

### [Interview with Michael Lucas \*BSD, Unix, IT and other books author](https://www.cyberciti.biz/interview/michael-lucas-bsd-unix-it-and-other-books-author/) ###

>
>
> Michael Lucas is a famous IT book author. Perhaps best know for FreeBSD, OpenBSD, and Unix book series. He worked as a system administrator for many years and has now become a full-time book writer. Lately, I did a quick Q and A with Michael about his journey as a professional book author and his daily workflow for writing books.  
>  \+
>
>
> ---
>
>
> ### [pfSense – WireGuard Returns as Experimental Package](https://www.netgate.com/blog/pfsense-wireguard-returns-as-an-experimental-package.html) ###
>
>
> ---
>
>
> ### [CGI with Awk on OpenBSD httpd](https://box.matto.nl/cgi-with-awk-on-openbsd-httpd.html) ###
>
>
> ---
>

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questionsing
----------

* [Adam - system state during upgrade](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/406/feedback/Adam - system state during upgrade>)
* [paul - BSD grep](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/406/feedback/paul - BSD grep>)
* [sub - feedback](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/406/feedback/sub - feedback>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*