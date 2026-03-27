+++
title = "365: Whole year round"
description = "FreeBSD USB Audio, Kyua: An introduction for NetBSD users, Keeping backup ZFS on Linux kernel modules around, CLI Tools 235x Faster than Hadoop, FreeBSD Laptop Battery Life Status Command, and more.NOTES   This episode of BSDNow is brought to you by [Tarsnap](https://www.ta"
date = "2020-08-27T11:00:00Z"
url = "https://www.bsdnow.tv/365"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.517716089Z"
seen = false
+++

FreeBSD USB Audio, Kyua: An introduction for NetBSD users, Keeping backup ZFS on Linux kernel modules around, CLI Tools 235x Faster than Hadoop, FreeBSD Laptop Battery Life Status Command, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/)

Headlines
----------

### [FreeBSD USB Audio](https://www.davidschlachter.com/misc/freebsd-usb-audio) ###

>
>
> I recently got a Behringer UMC22 sound card for video conferencing and DJing. This page documents what I’ve learned about using this sound card, and USB audio in general, on FreeBSD.  
>  tl;dr: Everything works as long as the sound card follows the USB audio device class specification.
>
>
> ---
>
>
> ### [Kyua: An introduction for NetBSD users](https://wiki.netbsd.org/kyua/) ###
>
>
>
> Kyua's current goal is to reimplement only the ATF tools while maintaining backwards compatibility with the tests written with the ATF libraries (i.e. with the NetBSD test suite).  
>  Because Kyua is a replacement of some ATF components, the end goal is to integrate Kyua into the NetBSD base system (just as ATF is) and remove the deprecated ATF components. Removing the deprecated components will allow us to make the above-mentioned improvements to Kyua, as well as many others, without having to deal with the obsolete ATF code base. Discussing how and when this transition might happen is out of the scope of this document at the moment.
>
>
> ---
>

News Roundup
----------

### [Keeping backup ZFS on Linux kernel modules around](https://utcc.utoronto.ca/~cks/space/blog/linux/ZFSOnLinuxModuleBackups) ###

>
>
> I'm a long term user of ZFS on Linux and over pretty much all of the time I've used it, I've built it from the latest development version. Generally this means I update my ZoL build at the same time as I update my Fedora kernel, since a ZoL update requires a kernel reboot anyway. This is a little bit daring, of course, although the ZoL development version has generally been quite solid (and this way I get the latest features and improvements long before I otherwise would).
>
>
> ---
>

### [Command-line Tools can be 235x Faster than your Hadoop Cluster](https://adamdrake.com/command-line-tools-can-be-235x-faster-than-your-hadoop-cluster.html) ###

>
>
> As I was browsing the web and catching up on some sites I visit periodically, I found a cool article from Tom Hayden about using Amazon Elastic Map Reduce (EMR) and mrjob in order to compute some statistics on win/loss ratios for chess games he downloaded from the millionbase archive, and generally have fun with EMR. Since the data volume was only about 1.75GB containing around 2 million chess games, I was skeptical of using Hadoop for the task, but I can understand his goal of learning and having fun with mrjob and EMR. Since the problem is basically just to look at the result lines of each file and aggregate the different results, it seems ideally suited to stream processing with shell commands. I tried this out, and for the same amount of data I was able to use my laptop to get the results in about 12 seconds (processing speed of about 270MB/sec), while the Hadoop processing took about 26 minutes (processing speed of about 1.14MB/sec).
>
>

---

### [FreeBSD Laptop Find Out Battery Life Status Command](https://www.cyberciti.biz/faq/freebsd-finding-out-battery-life-state-on-laptop/) ###

>
>
> I know how to find out battery life status using Linux operating system. How do I monitor battery status on a laptop running FreeBSD version 9.x/10.x/11.x/12.x?  
>  You can use any one of the following commands to get battery status under FreeBSD laptop including remaining battery life and more.
>
>
> ---
>

Beastie Bits
----------

[BSD Beer](https://i.redd.it/hlh8luidzgg51.jpg)  
[Awk for JSON](https://github.com/mohd-akram/jawk)  
[Drawing Pictures The Unix Way - with pic and troff](https://youtu.be/oG2A_1vC6aM)  
[Refactoring the FreeBSD Kernel with Checked C](https://www.cs.rochester.edu/u/jzhou41/papers/freebsd_checkedc.pdf)

---

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Jason - German Locales](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/365/jason - german locale.md>)
* [pcwizz - Router Style Device](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/365/pcwizz - router style device.md>)
* [predrag - OpenBSD Router Hardware](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/365/predrag - openbsd router hardware.md>) \*\*\*
* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*