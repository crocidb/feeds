+++
title = "312: Why Package Managers"
description = "The UNIX Philosophy in 2019, why use package managers, touchpad interrupted, Porting wine to amd64 on NetBSD second evaluation report, Enhancing Syzkaller Support for NetBSD, all about the Pinebook Pro, killing a process and all of its descendants, fast software the best software"
date = "2019-08-22T03:00:00Z"
url = "https://www.bsdnow.tv/312"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.611254128Z"
seen = false
+++

The UNIX Philosophy in 2019, why use package managers, touchpad interrupted, Porting wine to amd64 on NetBSD second evaluation report, Enhancing Syzkaller Support for NetBSD, all about the Pinebook Pro, killing a process and all of its descendants, fast software the best software, and more.

Headlines
----------

### [The UNIX Philosophy in 2019](https://triosdevelopers.com/jason.eckert/blog/Entries/2019/6/1_Entry_1.html) ###

>
>
> Today, Linux and open source rules the world, and the UNIX philosophy is widely considered compulsory. Organizations are striving to build small, focused applications that work collaboratively in a cloud and microservices environment. We rely on the network, as well as HTTP (text) APIs for storing and referencing data. Moreover, nearly all configuration is stored and communicated using text (e.g. YAML, JSON or XML). And while the UNIX philosophy has changed dramatically over the past 5 decades, it hasn’t strayed too far from Ken Thompson’s original definition in 1973:
>
>

* We write programs that do one thing and do it well
* We write programs to work together
* And we write programs that handle text streams, because that is a universal interface

---

### [Why Use Package Managers?](https://uwm.edu/hpc/software-management/) ###

>
>
> Valuable research is often hindered or outright prevented by the inability to install software. This need not be the case.
>
>
>
> Since I began supporting research computing in 1999, I’ve frequently seen researchers struggle for days or weeks trying to install a single open source application. In most cases, they ultimately failed.
>
>
>
> In many cases, they could have easily installed the software in seconds with one simple command, using a package manager such as Debian packages, FreeBSD ports, MacPorts, or Pkgsrc, just to name a few.
>
>
>
> Developer websites often contain poorly written instructions for doing “caveman installs”; manually downloading, unpacking, patching, and building the software. The same laborious process must often be followed for other software packages on which it depends, which can sometimes number in the dozens. Many researchers are simply unaware that there are easier ways to install the software they need. Caveman installs are a colossal waste of man-hours. If 1000 people around the globe spend an average of 20 hours each trying to install the same program that could have been installed with a package manager (this is not uncommon), then 20,000 man-hours have been lost that could have gone toward science. How many important discoveries are delayed by this?
>
>
>
> The elite research institutions have ample funding and dozens of IT staff dedicated to research computing. They can churn out publications even if their operation is inefficient. Most institutions, however, have few or no IT staff dedicated to research, and cannot afford to squander precious man-hours on temporary, one-off software installs. The wise approach for those of us in that situation is to collaborate on making software deployment easier for everyone. If we do so, then even the smallest research groups can leverage that work to be more productive and make more frequent contributions to science.
>
>
>
> Fortunately, the vast majority of open source software installs can be made trivial for anyone to do for themselves. Modern package managers perform all the same steps as a caveman install, but automatically. Package managers also install dependencies for us automatically.
>
>

---

News Roundup
----------

### [Touchpad, Interrupted](https://jcs.org/2019/07/28/ihidev) ###

>
>
> For two years I've been driving myself crazy trying to figure out the source of a driver problem on OpenBSD: interrupts never arrived for certain touchpad devices. A couple weeks ago, I put out a public plea asking for help in case any non-OpenBSD developers recognized the problem, but while debugging an unrelated issue over the weekend, I finally solved it.
>
>
>
> It's been a long journey and it's a technical tale, but here it is.
>
>

---

### [Porting wine to amd64 on NetBSD, second evaluation report](https://blog.netbsd.org/tnf/entry/porting_wine_to_amd64_on2) ###

* Summary

>
>
> Presently, Wine on amd64 is in test phase. It seems to work fine with caveats like LD\_LIBRARY\_PATH which has to be set as 32-bit Xorg libs don't have ${PREFIX}/emul/netbsd32/lib in its rpath section. The latter is due to us extracting 32-bit libs from tarballs in lieu of building 32-bit Xorg on amd64. As previously stated, pkgsrc doesn't search for pkgconfig files in ${PREFIX}/emul/netbsd32/lib which might have inadvertent effects that I am unaware of as of now. I shall be working on these issues during the final coding period. I would like to thank @leot, @maya and @christos for saving me from shooting myself in the foot many a time. I, admittedly, have had times when multiple approaches, which all seemed right at that time, perplexed me. I believe those are times when having a mentor counts, and I have been lucky enough to have really good ones. Once again, thanks to Google for this wonderful opportunity.
>
>

---

### [Enhancing Syzkaller Support for NetBSD, Part 2](https://blog.netbsd.org/tnf/entry/enchancing_syzkaller_support_for_netbsd) ###

>
>
> As a part of Google Summer of Code’19, I am working on improving the support for Syzkaller kernel fuzzer. Syzkaller is an unsupervised coverage-guided kernel fuzzer, that supports a variety of operating systems including NetBSD. This report details the work done during the second coding period.
>
>
>
> You can also take a look at the first report to learn more about the initial support that we added. : [https://blog.netbsd.org/tnf/entry/enhancing\_syzkaller\_support\_for\_netbsd](https://blog.netbsd.org/tnf/entry/enhancing_syzkaller_support_for_netbsd)
>
>

---

### [July Update: All about the Pinebook Pro](https://www.pine64.org/2019/07/05/july-update-all-about-the-pinebook-pro/) ###

>
>
> "So I said I won’t be talking about the BSDs, but I feel like I should at the very least give you a general overview of the RK3399 \*BSD functionality. I’ll make it quick. I’ve spoken to \*BSD devs whom worked on the RockPro64 and from what I’ve gathered (despite the different \*BSDs having varying degree of support for the RK3399 SOC) many of the core features are already supported, which bodes well for \*BSD on the Pro. That said, some of the things you’d require on a functional laptop – such as the LCD (using eDP) for instance – will not work on the Pinebook Pro using \*BSD as of today. So clearly a degree of work is yet needed for a BSD to run on the device. However, keep in mind that \*BSD developers will be receiving their units soon and by the time you receive yours some basic functionality may be available."
>
>

---

### [Killing a process and all of its descendants](http://morningcoffee.io/killing-a-process-and-all-of-its-descendants.html) ###

>
>
> Killing processes in a Unix-like system can be trickier than expected. Last week I was debugging an odd issue related to job stopping on Semaphore. More specifically, an issue related to the killing of a running process in a job. Here are the highlights of what I learned:
>
>
>
> Unix-like operating systems have sophisticated process relationships. Parent-child, process groups, sessions, and session leaders. However, the details are not uniform across operating systems like Linux and macOS. POSIX compliant operating systems support sending signals to process groups with a negative PID number.
>
>
>
> Sending signals to all processes in a session is not trivial with syscalls.
>
>
>
> Child processes started with exec inherit their parent signal configuration. If the parent process is ignoring the SIGHUP signal, for example, this configuration is propagated to the children.
>
>
>
> The answer to the “What happens with orphaned process groups” question is not trivial.
>
>

---

### [Fast Software, the Best Software](https://craigmod.com/essays/fast_software/) ###

>
>
> I love fast software. That is, software speedy both in function and interface. Software with minimal to no lag between wanting to activate or manipulate something and the thing happening. Lightness.
>
>
>
> Software that’s speedy usually means it’s focused. Like a good tool, it often means that it’s simple, but that’s not necessarily true. Speed in software is probably the most valuable, least valued asset. To me, speedy software is the difference between an application smoothly integrating into your life, and one called upon with great reluctance. Fastness in software is like great margins in a book — makes you smile without necessarily knowing why.
>
>
>
> But why is slow bad? Fast software is not always good software, but slow software is rarely able to rise to greatness. Fast software gives the user a chance to “meld” with its toolset. That is, not break flow. When the nerds upon Nerd Hill fight to the death over Vi and Emacs, it’s partly because they have such a strong affinity for the flow of the application and its meldiness. They have invested. The Tool Is Good, so they feel. Not breaking flow is an axiom of great tools.
>
>
>
> A typewriter is an excellent tool because, even though it’s slow in a relative sense, every aspect of the machine itself operates as quickly as the user can move. It is focused. There are no delays when making a new line or slamming a key into the paper. Yes, you have to put a new sheet of paper into the machine at the end of a page, but that action becomes part of the flow of using the machine, and the accumulation of paper a visual indication of work completed. It is not wasted work. There are no fundamental mechanical delays in using the machine. The best software inches ever closer to the physical directness of something like a typewriter. (The machine may break down, of course, ribbons need to be changed — but this is maintenance and separate from the use of the tool. I’d be delighted to “maintain” Photoshop if it would lighten it up.)
>
>

---

Beastie Bits
----------

* [Register for vBSDCon 2019, Sept 5-7 in Reston VA](https://vbsdcon.com/registration)
* [Register for EuroBSDCon 2019, Sept 19-22 in Lillehammer, Norway](https://2019.eurobsdcon.org/registration/)

---

Feedback/Questions
----------

* Paulo - [FreeNAS Question](http://dpaste.com/2GDG7WR#wrap)
* Marc - [Changing VT without function keys?](http://dpaste.com/1AKC7A1#wrap)
* Caleb - [Patch, update, and upgrade management](http://dpaste.com/2D6J482#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.