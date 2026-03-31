+++
title = "289: Microkernel Failure"
description = 'A kernel of failure, IPv6 fragmentation vulnerability in OpenBSD’s pf, a guide to the terminal, using a Yubikey for SSH public key authentication, FreeBSD desktop series, and more.\Headlines\[A Kernel Of Failure -   How IBM bet big on the microkernel being the next big thing'
date = "2019-03-14T23:00:00Z"
url = "https://www.bsdnow.tv/289"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.654221604Z"
seen = true
+++

A kernel of failure, IPv6 fragmentation vulnerability in OpenBSD’s pf, a guide to the terminal, using a Yubikey for SSH public key authentication, FreeBSD desktop series, and more.

\##Headlines

\###[A Kernel Of Failure -  
 How IBM bet big on the microkernel being the next big thing in operating systems back in the ’90s—and spent billions with little to show for it.](https://tedium.co/2019/02/28/ibm-workplace-os-taligent-history/)

>
>
> Today in Tedium: In the early 1990s, we had no idea where the computer industry was going, what the next generation would look like, or even what the driving factor would be. All the developers back then knew is that the operating systems available in server rooms or on desktop computers simply weren’t good enough, and that the next generation needed to be better—a lot better. This was easier said than done, but this problem for some reason seemed to rack the brains of one company more than any other: IBM. Throughout the decade, the company was associated with more overwrought thinking about operating systems than any other, with little to show for it in the end. The problem? It might have gotten caught up in kernel madness. Today’s Tedium explains IBM’s odd operating system fixation, and the belly flops it created.
>
>

---

\###[CVE-2019-5597IPv6 fragmentation vulnerability in OpenBSD Packet Filter](https://www.synacktiv.com/ressources/Synacktiv_OpenBSD_PacketFilter_CVE-2019-5597_ipv6_frag.pdf)

>
>
> Packet Filter is OpenBSD’s service for filtering network traffic and performing Network Address Translation. Packet Filter is also capable of normalizing and conditioning TCP/IP traffic, as well as providing bandwidth control and packet prioritization.  
>  Packet Filter has been a part of the GENERIC kernel since OpenBSD 5.0.Because other BSD variants import part of OpenBSD code, Packet Filter is also shipped with at least the following distributions that are affected in a lesser extent: FreeBSD, pfSense, OPNSense, Solaris.
>
>

>
>
> Note that other distributions may also contain Packet Filter but due to the imported version they might not be vulnerable. This advisory covers the latest OpenBSD’s Packet Filter. For specific details about other distributions, please refer to the advisory of the affected product.
>
>

* Kristof Provost, who maintains the port of pf in FreeBSD added a [test for the vulnerability in FreeBSD head](https://svnweb.freebsd.org/base?view=revision&revision=344793).

---

\##News Roundup  
 \###[How I’m still not using GUIs in 2019: A guide to the terminal](https://www.lucasfcosta.com/2019/02/10/terminal-guide-2019.html)

>
>
> TL;DR: Here are my dotfiles. Use them and have fun.
>
>

>
>
> GUIs are bloatware. I’ve said it before. However, rather than just complaining about IDEs I’d like to provide an understandable guide to a much better alternative: the terminal.  
>  IDE stands for Integrated Development Environment. This might be an accurate term, but when it comes to a real integrated development environment, the terminal is a lot better.  
>  In this post, I’ll walk you through everything you need to start making your terminal a complete development environment: how to edit text efficiently, configure its appearance, run and combine a myriad of programs, and dynamically create, resize and close tabs and windows.
>
>

* Don’t forget rule number one.

>
>
> Whenever in doubt, read the manual.
>
>

---

\###[Using a Yubikey as smartcard for SSH public key authentication](https://undeadly.org/cgi?action=article;sid=20190302235509)

>
>
> SSH is an awesome tool. Logging into other machines securely is so pervasive to us sysadmins nowadays that few of us think about what’s going on underneath. Even more so once you start using the more advanced features such as the ssh-agent, agent-forwarding and ProxyJump. When doing so, care must be taken in order to not compromise one’s logins or ssh keys.  
>  You might have heard of Yubikeys.  
>  These are USB authentication devices that support several different modes: they can be used for OTP (One Time Password) authentication, they can store OpenPGP keys, be a 2-factor authentication token and they can act as a SmartCard.  
>  In OpenBSD, you can use them for Login (with login\_yubikey(8)) with OTP since 2012, and there are many descriptions available(1) how to set this up.
>
>

---

\###The 18 Part FreeBSD Desktop Series by Vermaden

* [FreeBSD Desktop – Part 1 – Simplified Boot](https://vermaden.wordpress.com/2018/03/29/freebsd-desktop-part-1-simplified-boot/)
* [FreeBSD Desktop – Part 2 – Install (FreeBSD 11)](https://vermaden.wordpress.com/2018/04/11/freebsd-desktop-part-2-install/)
* [FreeBSD Desktop – Part 2.1 – Install FreeBSD 12](https://vermaden.wordpress.com/2018/11/20/freebsd-desktop-part-2-1-install-freebsd-12/)
* [FreeBSD Desktop – Part 3 – X11 Window System](https://vermaden.wordpress.com/2018/05/22/freebsd-desktop-part-3-x11-window-system/)
* [FreeBSD Desktop – Part 4 – Key Components – Window Manager](https://vermaden.wordpress.com/2018/06/15/freebsd-desktop-part-4-key-components-window-manager/)
* [FreeBSD Desktop – Part 5 – Key Components – Status Bar](https://vermaden.wordpress.com/2018/06/16/freebsd-desktop-part-5-key-components-status-bar/)
* [FreeBSD Desktop – Part 6 – Key Components – Task Bar](https://vermaden.wordpress.com/2018/06/21/freebsd-desktop-part-6-key-components-task-bar/)
* [FreeBSD Desktop – Part 7 – Key Components – Wallpaper Handling](https://vermaden.wordpress.com/2018/06/21/freebsd-desktop-part-7-key-components-wallpaper-handling/)
* [FreeBSD Desktop – Part 8 – Key Components – Application Launcher](https://vermaden.wordpress.com/2018/06/21/freebsd-desktop-part-8-key-components-application-launcher/)
* [FreeBSD Desktop – Part 9 – Key Components – Keyboard/Mouse Shortcuts](https://vermaden.wordpress.com/2018/06/22/freebsd-desktop-part-9-key-components-keyboard-mouse-shortcuts/)
* [FreeBSD Desktop – Part 10 – Key Components – Locking Solution](https://vermaden.wordpress.com/2018/06/23/freebsd-desktop-part-10-key-components-locking-solution/)
* [FreeBSD Desktop – Part 11 – Key Components – Blue Light Spectrum Suppress](https://vermaden.wordpress.com/2018/06/28/freebsd-desktop-part-11-key-components-blue-light-spectrum-suppress/)
* [FreeBSD Desktop – Part 12 – Configuration – Openbox](https://vermaden.wordpress.com/2018/07/01/freebsd-desktop-part-12-configuration-openbox/)
* [FreeBSD Desktop – Part 13 – Configuration – Dzen2](https://vermaden.wordpress.com/2018/07/05/freebsd-desktop-part-13-configuration-dzen2/)
* [FreeBSD Desktop – Part 14 – Configuration – Tint2](https://vermaden.wordpress.com/2018/07/11/freebsd-desktop-part-14-configuration-tint2/)
* [FreeBSD Desktop – Part 15 – Configuration – Fonts & Frameworks](https://vermaden.wordpress.com/2018/08/18/freebsd-desktop-part-15-configuration-fonts-frameworks/)
* [FreeBSD Desktop – Part 16 – Configuration – Pause Any Application](https://vermaden.wordpress.com/2018/09/19/freebsd-desktop-part-16-configuration-pause-any-application/)
* [FreeBSD Desktop – Part 17 – Automount Removable Media](https://vermaden.wordpress.com/2018/10/11/freebsd-desktop-part-17-automount-removable-media/)

---

\##Beastie Bits

* [Drist with persistent SSH](https://dataswamp.org/~solene/2019-02-18-drist-1.04.html)
* [ARPANET: Celebrating 50 Years Since “LO”](https://meetings.aaas.org/arpanet-livestream/)
* [Termtris - a tetris game for ANSI/VT220 terminals](http://nuclear.mutantstargoat.com/sw/termtris/)
* [Poor Man’s CI - Hosted CI for BSD with shell scripting and duct tape](https://github.com/billziss-gh/pmci)
* [Why I use the IBM Model M keyboard that is older than me?](http://yeokhengmeng.com/2018/07/why-i-use-the-ibm-model-m-keyboard-that-is-older-than-me/)
* [A privilege separated and sandboxed IPv6 Stateless Address AutoConfiguration Daemon](https://www.openbsd.org/papers/florian_slaacd_bsdcan2018.pdf)
* [Google-free Android Setup](https://niftylettuce.com/posts/google-free-android-setup/#google-free-android-setup)
* [BSD Users Stockholm Meetup #6](https://www.meetup.com/BSD-Users-Stockholm/events/259528492/)

---

\##Feedback/Questions

* Sijmen - [Hi, and a Sunday afternoon toy project](http://dpaste.com/1K3ZXB2#wrap)
* Clint - [Tuning ZFS for NVME](http://dpaste.com/24QF6J1)
* James - [Show question](http://dpaste.com/04SDXH9)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

 Your browser does not support the HTML5 video tag.