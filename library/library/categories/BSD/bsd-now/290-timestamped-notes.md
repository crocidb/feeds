+++
title = "290: Timestamped Notes"
description = 'FreeBSD on Cavium ThunderX, looking at NetBSD as an OpenBSD user, taking time-stamped notes in vim, OpenBSD 6.5 has been tagged, FreeBSD and NetBSD in GSoC 2019, SecBSD: an UNIX-like OS for Hackers, and more.\Headlines   \[ARM’d and dangerous: FreeBSD on Cavium ThunderX (aar'
date = "2019-03-21T14:00:00Z"
url = "https://www.bsdnow.tv/290"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.652370866Z"
seen = true
+++

FreeBSD on Cavium ThunderX, looking at NetBSD as an OpenBSD user, taking time-stamped notes in vim, OpenBSD 6.5 has been tagged, FreeBSD and NetBSD in GSoC 2019, SecBSD: an UNIX-like OS for Hackers, and more.

\##Headlines  
 \###[ARM’d and dangerous: FreeBSD on Cavium ThunderX (aarch64)](https://eerielinux.wordpress.com/2019/02/25/armd-and-dangerous-freebsd-on-cavium-thunderx-aarch64/)

>
>
> While I don’t remember for how many years I’ve had an interest in CPU architectures that could be an alternative to AMD64, I know pretty well when I started proposing to test 64-bit ARM at work. It was shortly after the disaster named Spectre / Meltdown that I first dug out server-class ARM hardware and asked whether we should get one such server and run some tests with it.  
>  While the answer wasn’t a clear “no” it also wasn’t exactly “yes”. I tried again a few times over the course of 2018 and each time I presented some more points why I thought it might be a good thing to test this. But still I wasn’t able to get a positive answer. Finally in January 2019 year I got a definitive answer – and it was “yes, go ahead”! The fact that Amazon had just presented their Graviton ARM Processor may have helped the decision.
>
>

---

\###[Looking at NetBSD from an OpenBSD user perspective](https://www.tumfatig.net/20190301/looking-at-netbsd-from-an-openbsd-user-perspective/)

>
>
> I use to use NetBSD quite a lot. From 2.0 to 6.99. But for some reasons, I stopped using it about 2012, in favor of OpenBSD. Reading on the new 8 release, I wanted to see if all the things I didn’t like on NetBSD were gone. Here is a personal Pros / Cons list. No Troll, hopefully. Just trying to be objective.
>
>

* What I liked (pros)
* Things I didn’t like (cons)
* Conclusion

>
>
> So that was it. I didn’t spend more than 30 minutes of it. But I didn’t want to spend more time on it. I did stop using NetBSD because of the need to compile each and every packages ; it was in the early days of pkgin. I also didn’t like the way system maintenance was to be done. OpenBSD’s 6-months release seemed far more easy to manage. I still think NetBSD is a great OS. But I believe you have to spent more time on it than you would have to do with OpenBSD.  
>  That said, I’ll keep using my Puffy OS.
>
>

---

\##News Roundup  
 \###[Using Vim to take time-stamped notes](https://www.codesections.com/blog/vim-timestamped/)

>
>
> I frequently find myself needing to take time-stamped notes. Specifically, I’ll be in a call, meeting, or interview and need to take notes that show how long it’s been since the meeting started.  
>  My first thought was that there’s be a plugin to add time stamps, but a quick search didn’t turn anything up. However, I little digging did turn up the fact that vim has the built-in ability to tell time.  
>  This means that writing a bit of vimscript to insert a time stamp is pretty easy. After a bit of fiddling, I came up with something that serves my needs, and I decided it might be useful enough to others to be worth sharing.
>
>

* [John Baldwin’s notes on bhyve meetings](https://github.com/bsdjhb/meetings)

---

\###[OpenBSD 6.5-beta has been tagged](https://www.undeadly.org/cgi?action=article;sid=20190228062751)

>
>
> It’s that time of year again; Theo (deraadt@) has just tagged 6.5-beta. A good reminder for us all run an extra test install and see if your favorite port still works as you expect.
>
>

`CVSROOT: /cvs`  
`Module name: src`  
`Changes by: deraadt@cvs.openbsd.org 2019/02/26 15:24:41`  
``  
`Modified files:`  
`etc/root : root.mail`  
`share/mk : sys.mk`  
`sys/conf : newvers.sh`  
`sys/sys : ktrace.h param.h`  
`usr.bin/signify: signify.1`  
`sys/arch/macppc/stand/tbxidata: bsd.tbxi`  
``  
`Log message:`  
`crank to 6.5-beta`  
``

---

\###[The NetBSD Foundation participating in Google Summer of Code 2019](https://blog.netbsd.org/tnf/entry/the_netbsd_foundation_participating_in)

>
>
> For the 4th year in a row and for the 13th time The NetBSD Foundation will participate in Google Summer of Code 2019!  
>  If you are a student and would like to learn more about Google Summer of Code please go to the Google Summer of Code homepage.  
>  You can find a list of projects in Google Summer of Code project proposals in the wiki.  
>  Do not hesitate to get in touch with us via #netbsd-code IRC channel on Freenode and via NetBSD mailing lists!
>
>

---

\###[SecBSD: an UNIX-like OS for Hackers](https://discoverbsd.com/p/d83c2c66dc)

>
>
> SecBSD is an UNIX-like operating system focused on computer security based on OpenBSD. Designed for security testing, hacking and vulnerability assessment, it uses full disk encryption and ProtonVPN + OpenVPN by default.  
>  A security BSD enviroment for security researchers, penetration testers, bug hunters and cybersecurity experts. Developed by Dark Intelligence Team for private use and will be public release coming soon.
>
>

---

\##Beastie Bits

* [Why OpenBSD Rocks](https://why-openbsd.rocks/fact/)
* [Rich’s sh (POSIX shell) tricks](http://www.etalabs.net/sh_tricks.html)
* [Drinking coffee with AWK](https://opensource.com/article/19/2/drinking-coffee-awk)
* [Civilisational HTTP Error Codes](https://github.com/AMEE/8XX-rfc)
* [MidnightBSD Roadmap](https://www.midnightbsd.org/news/)
* [NetBSD on Nintendo64](https://gist.github.com/murachue/531ed3ca201ab4155d22442272d92ed2#file-201902140007-txt)
* [From Vimperator to Tridactyl](https://nullprogram.com/blog/2018/09/20/)

---

\##Feedback/Questions

* Russell - [BSD Now Question :: ZFS & FreeNAS](http://dpaste.com/3QRYM70#wrap)
* Alan - [Tutorial, install ARM \*BSD with no other BSD box pls](http://dpaste.com/1KQZPN6)
* Johnny - [New section to add to the show](http://dpaste.com/2ZKRC2A)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

 Your browser does not support the HTML5 video tag.