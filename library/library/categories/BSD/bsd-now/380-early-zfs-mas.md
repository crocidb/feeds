+++
title = "380: Early ZFS-mas"
description = "We read FreeBSD’s 3rd quarter status report, OpenZFS 2.0, adding check-hash checks in UFS filesystem, OpenSSL 3.0 /dev/crypto issues on FreeBSD, and more.NOTES   This episode of BSDNow is brought to you by TarsnapHeadlines[3rd"
date = "2020-12-10T11:00:00Z"
url = "https://www.bsdnow.tv/380"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.493754627Z"
seen = true
+++

We read FreeBSD’s 3rd quarter status report, OpenZFS 2.0, adding check-hash checks in UFS filesystem, OpenSSL 3.0 /dev/crypto issues on FreeBSD, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [3rd Quarter FreeBSD Report](https://www.freebsd.org/news/status/report-2020-07-2020-09.html) ###

>
>
> [The call for submissions for the 4th Quarter is out](https://lists.freebsd.org/pipermail/freebsd-quarterly-calls/2020/000007.html)
>
>
> ---
>

### [OpenZFS 2.0](https://arstechnica.com/gadgets/2020/12/openzfs-2-0-release-unifies-linux-bsd-and-adds-tons-of-new-features/) ###

>
>
> This Monday, ZFS on Linux lead developer Brian Behlendorf published the OpenZFS 2.0.0 release to GitHub. Along with quite a lot of new features, the announcement brings an end to the former distinction between "ZFS on Linux" and ZFS elsewhere (for example, on FreeBSD). This move has been a long time coming—the FreeBSD community laid out its side of the roadmap two years ago—but this is the release that makes it official.
>
>
> ---
>

News Roundup
----------

### [Revision 367034](https://svnweb.freebsd.org/changeset/base/367034) ###

>
>
> Various new check-hash checks have been added to the UFS filesystem  
>  over various major releases. Superblock check hashes were added for  
>  the 12 release and cylinder-group and inode check hashes will appear  
>  in the 13 release.
>
>
> ---
>
>
> ### [OpenSSL 3.0 /dev/crypto issues on FreeBSD](https://rubenerd.com/openssl-3-written-to-break-on-freebsd/) ###
>
>
>
> So, just learned that the OpenSSL devs decided to break /dev/crypto on FreeBSD.
>
>
> ---
>

### [OS108-9.1 XFCE amd64 released](https://forums.os108.org/d/32-os108-91-xfce-amd64-released) ###

* OS108 is a fast, open and Secure Desktop Operating System built on top of NetBSD. \> Installing OS108 to your hard drive is done by using the sysinst utility, the process is basically the same as installing NetBSD itself. Please refer to the NetBSD guide for installation details, [http://www.netbsd.org/docs/guide/en/part-install.html](http://www.netbsd.org/docs/guide/en/part-install.html)
* [Installation Video](https://youtu.be/cgAeY21gXR4) \*\*\*

Beastie Bits
----------

* [OpenBGPD 6.8p1 portable: released Nov 5th, 2020](http://www.openbgpd.org/ftp.html)
* [IRC Awk Bot](http://kflu.github.io/2020/08/15/2020-08-15-awk-irc-bot/)
* [Docker on FreeBSD using bhyve and sshfs](https://www.youtube.com/watch?v=ZVkJZJEdZNY)
* [The UNIX Command Language (1976)](https://github.com/susam/tucl) \*\*\*

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [santi - openrc](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/380/feedback/santi - openrc.md>)
* [trond - python2 and mailman](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/380/feedback/trond - python2 and mailmane and sshfs>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*