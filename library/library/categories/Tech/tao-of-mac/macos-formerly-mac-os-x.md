+++
title = "macOS (formerly Mac OS X)"
description = "OverviewThe modern Mac operating system is now termed macOS, after an entire generation of Mac OS X and its many variants (10.0, 10.1, 10.2, and the then-current 10.4) having"
date = "2006-07-26T09:26:00Z"
url = "https://taoofmac.com/space/com/apple/macos?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-09-01T19:33:17.057298110Z"
seen = false
+++

[](/space/com/apple/macos#overview)

[Overview](/space/com/apple/macos#overview)
----------

The modern [Mac](/space/com/apple/mac) operating system is now termed `macOS`, after an entire generation of Mac OS X and its many variants (10.0, 10.1, 10.2, and the then-current 10.4) having initially been given feline code names — [Cheetah](cheetah), [Puma](puma), [Jaguar](jaguar), [Panther](panther), [Tiger](/space/10.4), [Leopard](/space/10.5) — later replaced by grander place-based monikers like El Capitan, Sierra, etc.

It is essentially a current-day evolution of [NeXTSTEP](/space/os/nextstep) with the [Aqua](https://en.wikipedia.org/wiki/Aqua_(user_interface)?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) interface wrapped around it — that is to say, a [BSD](/space/os/bsd)-like [UNIX](/space/os/unix) system running atop the [Mach](/space/os/mach) microkernel.

[

Architecture
----------

](/space/com/apple/macos#architecture)

macOS (formerly Mac OS X) layers a number of foundational technologies:

* UI: Aqua, AppKit (Cocoa), SwiftUI (modern additions)
* Frameworks: Cocoa / Carbon (legacy), Core Foundation, Core Graphics, Core Audio, Core Animation
* Runtime: Objective-C runtime plus (later) Swift runtime
* Kernel: XNU hybrid (Mach + BSD + I/O Kit)
* Heritage: Direct lineage from NeXTSTEP (Objective-C, Display PostScript lineage, IPC model)

The kernel (XNU) blends the Mach microkernel (scheduling, VM, IPC primitives) with BSD services (POSIX processes, networking, VFS) and an object-oriented device driver framework (I/O Kit, C++ based). Many user‑space abstractions (launchd, Grand Central Dispatch, sandboxing) build atop these primitives.

The best (still) available overview of its internals is Amit Singh’s article [What Is Mac OS X?](http://www.kernelthread.com/mac/osx/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), which I recommend heartily to anyone coming from mainstream UNIX systems like [Linux](/space/os/linux) and BSD — it explains much of the rationale and heritage of Mac OS X in a clear, well written fashion, and draws appropriate comparisons along the way.

Amit also published a must‑have book on Mac OS X and made available a [vastly extended version](http://osxbook.com/book/bonus/chapter1/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) of its initial chapter covering the system’s precursors and history.

[O’Reilly](https://www.oreilly.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) also has a handy book for people coming to Mac OS X from other UNIXes: “Mac OS X for Unix Geeks”:

<img src="/space/com/apple/macos/macosx-unix-geeks-book-cover.gif?v=3ac3356bbef4" alt="Mac OS X for Unix Geeks book cover" width="127" height="190">Mac OS X for Unix Geeks book cover

<img src="/space/com/apple/macos/macos-retail-boxes.jpg?v=6e423f37e965" alt="Mac OS X retail packaging (early OS X family boxes)" width="580" height="170">Mac OS X retail packaging (early OS X family boxes)

[

Version Timeline (Early Releases)
----------

](/space/com/apple/macos#version-timeline-early-releases)

|Version|Code Name|Release Date|                           Highlights                            |
|-------|---------|------------|-----------------------------------------------------------------|
| 10.0  | Cheetah |  2001-03   |     First consumer release, Aqua debut, performance issues      |
| 10.1  |  Puma   |  2001-09   |Significant speedups, added DVD playback, better hardware support|
| 10.2  | Jaguar  |  2002-08   |        Quartz Extreme, improved networking, Address Book        |
| 10.3  | Panther |  2003-10   |              Exposé, FileVault (v1), faster Finder              |
| 10.4  |  Tiger  |  2005-04   |                Spotlight, Dashboard, Core Image                 |
| 10.5  | Leopard |  2007-10   |         Time Machine, Spaces, 64-bit userland expansion         |
[

Tools
----------

](/space/com/apple/macos#tools)

* [MacJanitor](http://personalpages.tds.net/~brian_hill/macjanitor.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), [MacSniffer](http://personalpages.tds.net/~brian_hill/macsniffer.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), [Pseudo](http://personalpages.tds.net/~brian_hill/pseudo.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), [xFiles](http://personalpages.tds.net/~brian_hill/xfiles.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)
* [Mac OS X Labs](http://www.macosxlabs.org/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)

[

Networking
----------

](/space/com/apple/macos#networking)

* [GSM](networking/gsm) and [GPRS](/space/standards/3gpp/gprs) [scripts](http://www.taniwha.org.uk/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) for the [Sony Ericsson T68i](/space/com/sonyericsson/t68i)
* [GSM/GPRS Dial-up](http://www.powerpage.org/story.lasso?newsID=9249&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)

[

Essentials
----------

](/space/com/apple/macos#essentials)

* [Boot Keys](/space/blog/2003/11/29)
* [My Hints For Newcomers To The Mac](blog/2003/12/21)

[

Unix
----------

](/space/com/apple/macos#unix)

* [Fink](https://en.wikipedia.org/wiki/Fink_(software)?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)
* [sendmail HOW-TO](http://www.bombich.com/mactips/sendmail.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (pre-[Panther](panther))
* [Mac OS X Ports](http://macosx.forked.net/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (not as interesting as Fink, but occasionally useful)
* [DarwinPorts](http://www.opendarwin.org/projects/darwinports/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)
* [Marc Liyanage – Ports](http://www.entropy.ch/software/macosx/welcome.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)
* [Common Problems and Troubleshooting](http://www.macattorney.com/tutorial.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)

[

Carbon and Cocoa
----------

](/space/com/apple/macos#carbon-and-cocoa)

* [OmniWeb](http://www.omnigroup.com/applications/omniweb/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)
* [Fugu](fugu) ([SSH](/space/cli/ssh)/[sftp](/space/cli/ssh))
* [HenWen](http://home.attbi.com/~dreamless/henwen.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) ([snort](/space/cli/snort) front-end)
* [NetNewsWire](http://ranchero.com/software/netnewswire/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) ([RSS](standards/rss) reader)

[

Mach and Mach-O
----------

](/space/com/apple/macos#mach-and-mach-o)

* [How Mac OS X executes applications](https://0xfe.blogspot.com/2006/03/how-os-x-executes-applications.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (on `otool` and `.dylib`s)

[

Neat Stuff
----------

](/space/com/apple/macos#neat-stuff)

* [Menu Items list](http://menu.jeweledplatypus.org/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (applications that use menu bar add-ons extensively)

* [Ambient Context](https://github.com/dragthelake/ambient-context?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) — macOS menu bar app that keeps a written record of work activity

* [Tomcat and Cocoon](http://homepage.blog/com/murraytodd/tomcat.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) ([Tomcat](cli/tomcat) 3.2.1 and [Cocoon](cli/cocoon) 1.8.2 as an installer package)

* [Java and Tomcat on Mac OS X](http://developer.apple.com/internet/java/tomcat1.html?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)

* [tun/tap driver](http://www-user.rhrk.uni-kl.de/~nissler/tuntap/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (useful for running [QEMU](https://www.qemu.org/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com))

* [Mac OS Through The Years](http://iindigo3d.com/blog/?page_id=40&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) — turns out I remember pre‑6.0 versions, even though I spent many years on 6.0.4 and 7.1…

[

Related
----------

](/space/com/apple/macos#related)

* [Classic Mac OS](classic)
* [Big Sur](bigsur)
* [Cheetah](cheetah), [Puma](puma), [Jaguar](jaguar), [Panther](panther), [Tiger](/space/10.4), [Leopard](/space/10.5), [Snow Leopard](/space/10.6), [Lion](lion), [Mountain Lion](mountain_lion), [Mavericks](mavericks)