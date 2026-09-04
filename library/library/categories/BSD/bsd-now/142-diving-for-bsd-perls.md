+++
title = "142: Diving for BSD Perls"
description = "This week on the show, we have all the latest news and stories! Plus an interview with BSD developer Alfred Perlstein, that youThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems.com/bsdno"
date = "2016-05-18T12:00:00Z"
url = "https://www.bsdnow.tv/142"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.035953131Z"
seen = true
+++

This week on the show, we have all the latest news and stories! Plus an interview with BSD developer Alfred Perlstein, that you

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [The May issus of BSDMag is now out](https://bsdmag.org/download/reusing_openbsd/) ###

* GhostBSD
* Reusing OpenBSD's arc4random in multi-threaded user space programs
* Securing VPN's with GRE / Strongswan
* Installing XFCE 4.12 on NetBSD 7
* Interview with Fernando Rodriguez, the co-founder of KeepCoding \*\*\*

### [A rundown of the FPT\_W<sup>X_EXT.1</sup> security reqiurement for General Purpose Operating Systems by the NSA](http://blog.acumensecurity.net/fpt_wx_ext-1-a-rundown/) ###

* [NIST/NSA Validation Scheme Report](https://www.commoncriteriaportal.org/files/ppfiles/pp_os_v4.1-vr.pdf)
* The SFR or Security Functional Requirement requires that; "The OS shall prevent allocation of any memory region with both write and execute permissions except for [assignment: list of exceptions]."
* While nearly all operating systems currently support the use of the NX bit, or the equivalent on processors such as SPARC and ARM, and will correctly mark the stack as non-executable, the fact remains that this in and of itself is deemed insufficient by NIST and NSA.
* OpenBSD 5.8, FreeBSD, Solaris, RHEL, and most other Linux distro have failed.
* HardenedBSD passes all three tests out of the box.
* NetBSD will do so with a single sysctl tweak. Since they are using the PaX model, anything else using PaX, such as a grsecurity-enabled Linux distribution pass these assurance activities as well.
* OpenBSD 5.9 does not allow memory mapping due to W<sup>X</sup> being enforced by the kernel, however the kernel will panic if there are any attempts to create such mappings. \*\*\*

### [DistroWatch reviews new features in FreeBSD 10.3](https://distrowatch.com/weekly.php?issue=20160516#freebsd) ###

* DistroWatch did a review of FreeBSD 10.3
* They ran into a few problems, but hopefully those can be fixed
* An issue with beadm setting the canmount property incorrectly causing the ZFS BE menu to not work as expected should be resolved in the next version, thanks to a patch from kmoore
* The limitations of the Linux 64 support are what they are, CentOS 6 is still fairly popular with enterprise software, but hopefully some folks are interested in working on bringing the syscall emulation forward
* In a third issue, the reviewer seemed to have issues SSHing from inside the jail. This likely has to do with how they got a console in the jail. I remember having problems with this in the past, something about a secure console. \*\*\*

### [BSD Unix: Power to the people, from the code](https://www.salon.com/2000/05/16/chapter_2_part_one/) ###

* Salon.com has a very long article, chronicling much of the history behind BSD UNIX.
* It starts with detailing the humble origins of BSD, starting with Bill Joy in the mid-70’s, and then goes through details on how it rapidly grew, and the influence that the University of Berkeley had on open-source.

>
>
> “But too much focus on Joy, a favorite target for business magazine hagiography, obscures the larger picture. Berkeley’s most important contribution was not software; it was the way Berkeley created software. At Berkeley, a small core group — never more than four people at any one time — coordinated the contributions of an ever-growing network of far-flung, mostly volunteer programmers into progressive releases of steadily improving software. In so doing, they codified a template for what is now referred to as the “open-source software development methodology.” Put more simply, the Berkeley hackers set up a system for creating free software.”
>
>

* The article goes on to talk about some of the back and forth between Linux and BSD, and why Linux has captured more of the market in recent years, but BSD is far from throwing in the towel.

>
>
> “BSD patriots argue that the battle is far from over, that BSD is technically superior and will therefore win in the end. That’s for the future to determine. What’s indisputable is BSD’s contribution in the past. Even if, by 1975, Berkeley’s Free Speech Movement was a relic belonging to a fast-fading generation, on the fourth floor of Evans Hall, where Joy shared an office, the free-software movement was just beginning.”
>
>

* An excellent article (If a bit long), but well worth your time to understand the origins of what we consider modern day BSD, and how the University of Berkley helped shape it. \*\*\*

### [iXsystems](http://ixsystems.com) ###

* [#ServerEnvy: It's over 10,000 Terabytes!](https://www.ixsystems.com/blog/serverenvy-10000-terabytes/) \*\*\*

Interview - Alfred Perlstein - [alfred@freebsd.org](mailto:alfred@freebsd.org) / [@splbio](https://twitter.com/splbio)
----------

* Using BSD for projects \*\*\*

News Roundup
----------

### [.NET framework ported to NetBSD](https://github.com/dotnet/coreclr/pull/4504/files) ###

* This pull request adds basic support for the .NET framework on NetBSD 7.x amd64
* It includes documentation on how to get the .NET framework installed
* It uses pkgsrc to bootstrap the required tools
* pkgsrc-wip is used to get the actual .NET framework, as porting is still in progress
* The .NET Core-CLR is now available for: FreeBSD, Linux, NetBSD, and OS X \*\*\*

### [OpenBSD SROP mitigation – call for testing](https://marc.info/?l=openbsd-tech&m=146281531025185&w=2) ###

* A new technique for exploiting flaws in applications and operating systems has been developed, called SROP
* “we describe Sigreturn Oriented Programming (SROP), a novel technique for exploits and backdoors in UNIX-like systems. Like return-oriented programming (ROP), sigreturn oriented programming constructs what is known as a ‘weird machine’ that can be programmed by attackers to change the behavior of a process. To program the machine, attackers set up fake signal frames and initiate returns from signals that the kernel never really delivered. This is possible, because UNIX stores signal frames on the process’ stack.”
* “Sigreturn oriented programming is interesting for attackers, OS developers and academics. For attackers, the technique is very versatile, with pre-conditions that are different from those of existing exploitation techniques like ROP. Moreover, unlike ROP, sigreturn oriented programming programs are portable. For OS developers, the technique presents a problem that has been present in one of the two main operating system families from its inception, while the fixes (which we also present) are non-trivial. From a more academic viewpoint, it is also interesting because we show that sigreturn oriented programming is Turing complete.”
* [Paper describing SROP ](http://www.cs.vu.nl/~herbertb/papers/srop_sp14.pdf)
* OpenBSD has developed a mitigation against SROP
* “Utilizing a trick from kbind(2), the kernel now only accepts signal returns from the PC address of the sigreturn(2) syscall in the signal trampoline. Since the signal trampoline page is randomized placed per process, it is only known by directly returning from a signal handler.”
* “As well, the sigcontext provided to sigreturn(2) now contains a magic cookie constructed from a per-process cookie XOR'd against the address of the signal context.”
* This is just a draft of the patch, not yet considered production quality \*\*\*

### [Running Tor in a NetBSD rump unikernel](https://github.com/supradix/rumprun-packages/tree/33d9cc3a65a39e32b4bc8034c151a5d7e0b89f66/tor) ###

* We’ve talked about “rump” kernels before, and also Tor pretty frequently, but this new github project combines the two!
* Specifically, this set of Makefile and scripts will prep a system to run Tor via the Unikernel through Qemu.
* The script mainly describes how to do the initial setup on Linux, using iptables, but could easily be adapted to a BSD if somebody wants to do so. (Send them a pull request with the instructions!)
* All in all, this is a fascinating way to run a Tor node or relay, in the most minimal operating environment possible. \*\*\*

### [An update on SSH protocol 1 ("we're most of the way towards fully deprecating SSH protocol 1"](http://lists.mindrot.org/pipermail/openssh-unix-dev/2016-May/035069.html) ###

* Damien Miller has given us an update on the status of the “SSH protocol 1”, and the current plans to deprecate it in an upcoming version of openssh.

>
>
> “We've had this old protocol in various stages of deprecation for almost 10 years and it has been compile-time disabled for about a year.  
>  Downstream vendors, to their credit, have included this change in recent OS releases by shipping OpenSSH packages that disable protocol 1 by default and/or offering separate, non-default packages to enable it.
>
>
>
> This seems to have proceeded far more smoothly than even my most optimistic hopes, so this gives us greater confidence that we can complete the removal of protocol 1 soon. We want to do this partly to hasten the demise of this cryptographic trainwreck, but also because doing so removes a lot of legacy code from OpenSSH that inflates our attack surface. Having it gone will make our jobs quite a bit easier as we maintain and refactor.”
>
>

* The current time-line looks like removing server-size protocol 1 support this August after OpenSSH 7.4 is released, leaving client-side disabled.

* Then a year from now (June 2017) all protocol 1 code will be removed.

  ---

### Beastie Bits ###

* [Last day to get your BSDNow Shirts! Order now, wear at BSDCan!](https://teespring.com/bsdnow)

* [Move local government (Austin TX) from Microsoft Windows (incl. Office) to Linux and/or PC-BSD](https://github.com/atxhack4change/2016-project-proposals/issues/15)

* [Plan9 boot camp is back... and already at capacity. Another opportunity may come in September](http://lists.nycbug.org/pipermail/talk/2016-May/016642.html)

* [Smaller is better - building an openbsd based router](https://functionallyparanoid.com/2016/04/22/smaller-is-better/)

* [Baby Unix](https://i.redditmedia.com/KAjSscL9XOUdpIEWBQF1qi3QMr7zWgeETzQM6m3B4mY.jpg?w=1024&s=e8c08a7d4c4cea0256adb69b1e7c1887)

* [Security Update for FreeBSD](https://security.freebsd.org/advisories/FreeBSD-SA-16:19.sendmsg.asc) & [Another security update for FreeBSD](https://security.freebsd.org/advisories/FreeBSD-SA-16:18.atkbd.asc)

  ---

Feedback/Questions
----------

* [ Eric - The iX experience](http://pastebin.com/ZknTuKGv)
* [ Mike - Building Ports](http://pastebin.com/M760ZmHQ)
* [ David - ZFS Backups](http://pastebin.com/Pi0AFghV)
* [ James - BSD VPS](http://pastebin.com/EQ7envez)
* [ Rich - ZFS Followup](http://pastebin.com/p0HPDisH) \*\*\*