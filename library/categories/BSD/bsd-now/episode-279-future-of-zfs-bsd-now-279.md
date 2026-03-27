+++
title = "Episode 279: Future of ZFS | BSD Now 279"
description = "The future of ZFS in FreeBSD, we pick highlights from the FreeBSD quarterly status report, flying with the raven, modern KDE on FreeBSD, many ways to launch FreeBSD in EC2, GOG installers on NetBSD, and more.Headlines[The future of ZFS in FreeBSD](https://lists.free"
date = "2019-01-03T16:00:00Z"
url = "https://www.bsdnow.tv/279"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.673077260Z"
seen = false
+++

The future of ZFS in FreeBSD, we pick highlights from the FreeBSD quarterly status report, flying with the raven, modern KDE on FreeBSD, many ways to launch FreeBSD in EC2, GOG installers on NetBSD, and more.

Headlines
----------

### [The future of ZFS in FreeBSD](https://lists.freebsd.org/pipermail/freebsd-current/2018-December/072422.html) ###

> The sources for FreeBSD’s ZFS support are currently taken directly from Illumos with local ifdefs to support the peculiarities of FreeBSD where the Solaris Portability Layer (SPL) shims fall short. FreeBSD has regularly pulled changes from Illumos and tried to push back any bug fixes and new features done in the context of FreeBSD. In the past few years the vast majority of new development in ZFS has taken place in DelphixOS and zfsonlinux (ZoL). Earlier this year Delphix announced that they will be moving to ZoL: [https://www.delphix.com/blog/kickoff-future-eko-2018](https://www.delphix.com/blog/kickoff-future-eko-2018) This shift means that there will be little to no net new development of Illumos. While working through the git history of ZoL I have also discovered that many races and locking bugs have been fixed in ZoL and never made it back to Illumos and thus FreeBSD. This state of affairs has led to a general agreement among the stakeholders that I have spoken to that it makes sense to rebase FreeBSD’s ZFS on ZoL. Brian Behlendorf has graciously encouraged me to add FreeBSD support directly to ZoL [https://github.com/zfsonfreebsd/ZoF](https://github.com/zfsonfreebsd/ZoF) so that we might all have a single shared code base. A port for ZoF can be found at [https://github.com/miwi-fbsd/zof-port](https://github.com/miwi-fbsd/zof-port) Before it can be committed some additional functionality needs to be added to the FreeBSD opencrypto framework. These can be found at [https://reviews.freebsd.org/D18520](https://reviews.freebsd.org/D18520) This port will provide FreeBSD users with multi modifier protection, project quotas, encrypted datasets, allocation classes, vectorized raidz, vectorized checksums, and various command line improvements.

---

### [FreeBSD Quarterly Status Update](https://www.freebsd.org/news/status/report-2018-01-2018-09.html) ###

> With FreeBSD having gone all the way to 12, it is perhaps useful to take a look back at all the things that have been accomplished, in terms of many visible changes, as well as all the things that happen behind the scenes to ensure that FreeBSD continues to offer an alternative in both design, implementation, and execution. The things you can look forward to reading about are too numerous to summarize, but cover just about everything from finalizing releases, administrative work, optimizations and depessimizations, features added and fixed, and many areas of improvement that might just surprise you a little. Please have a cup of coffee, tea, hot cocoa, or other beverage of choice, and enjoy this culmulative set of reports covering everything that’s been done since October, 2017. —Daniel Ebdrup

---

News Roundup
----------

### [One year of flying with the Raven: Ready for the Desktop?](https://eerielinux.wordpress.com/2018/11/30/one-year-of-flying-with-the-raven-ready-for-the-desktop/) ###

> It has been a little over one year now that I’m with the Ravenports project. Time to reflect my involvement, my expectations and hopes.

* Ravenports

> Ravenports is a universal packaging framework for \*nix operating systems. For the user it provides easy access to binary packages of common software for multiple platforms. It has been the long-lasting champion on Repology’s top 10 repositories regarding package freshness (rarely dropping below 96 percent while all other projects keep below 90!).

> For the porter it offers a well-designed and elegant means of writing cross-platform buildsheets that allow building the same version of the software with (completely or mostly) the same compile-time configuration on different operating systems or distributions.

> And for the developer it means a real-world project that’s written in modern Ada (ravenadm) and C (pkg) – as well as some Perl for support scripts and make. Things feel very optimized and fast. Not being a programmer though, I cannot really say anything about the actual code and thus leave it to the interested reader’s judgement.

---

### [Modern KDE on FreeBSD](https://euroquis.nl/bobulate/?p=2040) ###

> New stuff in the official FreeBSD repositories! The X11 team has landed a newer version of libinput, opening up the way for KDE Plasma 5.14 in ports. That’s a pretty big update and it may frighten people with a new wallpaper. What this means is that the graphical stack is once again on-par with what Plasma upstream expects, and we can get back to chasing releases as soon as they happen, rather than gnashing our teeth at missing dependencies. The KDE-FreeBSD CI servers are in the process of being upgraded to 12-STABLE, and we’re integrating with the new experimental CI systems as well. This means we are chasing sensibly-modern systems (13-CURRENT is out of scope).

---

### [The many ways to launch FreeBSD in EC2](http://www.daemonology.net/blog/2018-12-26-the-many-ways-to-launch-FreeBSD-in-EC2.html) ###

> Talking to FreeBSD users recently, I became aware that while I’ve created a lot of tools, I haven’t done a very good job of explaining how, and more importantly when to use them. So for all of the EC2-curious FreeBSD users out there: Here are the many ways to launch and configure FreeBSD in EC2 — ranging from the simplest to the most complicated (but most powerful):

* Launch FreeBSD and SSH in
* Launch FreeBSD and provide user-data
* Use the AMI Builder to create a customized FreeBSD AMI
* Build a FreeBSD AMI from a modified FreeBSD source tree
* Build your own disk image

> I hope I’ve provided tools which help you to run FreeBSD in EC2, no matter how common or unusual your needs are. If you find my work useful, please consider supporting my work in this area; while this is both something I enjoy working on and something which is useful for my day job (Tarsnap, my online backup service), having support would make it easier for me to prioritize FreeBSD/EC2 issues over other projects.

---

### [Using the GOG.com installers for Linux, on NetBSD](https://dressupgeekout.blogspot.com/2018/12/using-gogcom-installers-for-linux-on.html) ###

> [GOG.com](http://GOG.com) prefers that you use their GOG Galaxy desktop app to download, install and manage all of your GOG games. But customers always have the option to install the game on their own terms, with a platform-specific installer. GOG offers these installers for Mac, Windows and/or Linux, depending on which platforms the game is available for.

* The installers truly are platform-specific:
* macOS games are distributed in a standard .pkg
* Windows games are distributed in a setup wizard .exe
* Linux games are distributed in a goofy shell archive

> Of course, none of those are NetBSD. So, if I wanted to even attempt to play a game distributed by [GOG.com](http://GOG.com) on NetBSD, which one should I pick? The obvious choice is the Linux installer, since Linux is the most similar to NetBSD, right? Au contraire! In practice, I found that it is easier to download the Windows installer.

> Here’s what I mean. For example, I ported the open source version of Aquaria to pkgsrc, but that package is only the game’s engine, not the multimedia data. The multimedia data is still copyrighted. Therefore, you need to get it from somewhere else. GOG is usually a good choice, because they distribute their games without DRM. And as mentioned earlier, picking the Linux installer seemed like a natural choice.

> Now, actually PLAYING the games on NetBSD is a separate matter entirely. The game I’ve got here, though, my current obsession Pyre, is built with MonoGame and therefore could theoretically work on NetBSD, too, with the help of a library called FNA and a script for OpenBSD called fnaify. I do hope to create a pkgsrc package for FNA and port the fnaify script to NetBSD at some point.

---

Beastie Bits
----------

* [Software as a Reflection of Values With Bryan Cantrill](https://corecursive.com/024-software-as-a-reflection-of-values-with-bryan-cantrill/)
* [Collection of bmc talks, updated 2018](http://dtrace.org/blogs/bmc/2018/02/03/talks/)
* [wump: incorrect wumpus movement probability](https://marc.info/?l=openbsd-bugs&m=154529364730319&w=2)
* [Debugging Rust with VSCode on FreeBSD](https://venshare.com/debugging-rust-with-vscode-on-freebsd/)
* [SMB/CIFS on FreeBSD](https://vermaden.wordpress.com/2018/12/27/smb-cifs-on-freebsd/)
* [BSD Tattoo](https://old.reddit.com/r/freebsd/comments/aaihdk/bsd_tattoo/)
* [pkgsrc-2018Q4 branch announcement](https://mail-index.netbsd.org/pkgsrc-users/2018/12/30/msg027871.html)
* [toying with wireguard on openbsd](https://https.www.google.com.tedunangst.com/flak/post/toying-with-wireguard-on-openbsd)
* [new USB audio class v2.0 driver](https://marc.info/?l=openbsd-tech&m=154627230907954&w=2)
* [Todd Mortimer Removing ROP Gadgets from OpenBSD EuroBSDCon 2018](https://www.youtube.com/watch?v=ZvSSHtRv5Mg)
* [OpenBSD 6.5 release page is online](https://www.openbsd.org/65.html)
* [shell access to historical Unix versions in your browser](https://twitter.com/jschauma/status/1071069217968013313?s=03)

---

Feedback/Questions
----------

* Brad - [ZFS Features and Upgrades](http://dpaste.com/2CVAF1E#wrap)
* Andre - [Splitting ZFS array](http://dpaste.com/1XXFPHN#wrap)
* Michael - [Priority/nice value for Jails?](http://dpaste.com/2S8GFD0#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---