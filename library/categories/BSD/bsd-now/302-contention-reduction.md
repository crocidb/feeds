+++
title = "302: Contention Reduction"
description = "DragonFlyBSD's kernel optimizations pay off, differences between OpenBSD and Linux, NetBSD 2019 Google Summer of Code project list, Reducing that contention, fnaify 1.3 released, vmctl(8): CLI syntax changes, and things that Linux distributions should not do when packaging.Headli"
date = "2019-06-13T03:00:00Z"
url = "https://www.bsdnow.tv/302"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.630182332Z"
seen = false
+++

DragonFlyBSD's kernel optimizations pay off, differences between OpenBSD and Linux, NetBSD 2019 Google Summer of Code project list, Reducing that contention, fnaify 1.3 released, vmctl(8): CLI syntax changes, and things that Linux distributions should not do when packaging.

Headlines
----------

### [DragonFlyBSD's Kernel Optimizations Are Paying Off](https://www.phoronix.com/scan.php?page=article&item=dragonfly-55-threadripper&num=1) ###

>
>
> DragonFlyBSD lead developer Matthew Dillon has been working on a big VM rework in the name of performance and other kernel improvements recently. Here is a look at how those DragonFlyBSD 5.5-DEVELOPMENT improvements are paying off compared to DragonFlyBSD 5.4 as well as FreeBSD 12 and five Linux distribution releases. With Dillon using an AMD Ryzen Threadripper system, we used that too for this round of BSD vs. Linux performance benchmarks.  
>  The work by Dillon on the VM overhaul and other changes (including more HAMMER2 file-system work) will ultimately culminate with the DragonFlyBSD 5.6 release (well, unless he opts for DragonFlyBSD 6.0 or so). These are benchmarks of the latest DragonFlyBSD 5.5-DEVELOPMENT daily ISO as of this week benchmarked across DragonFlyBSD 5.4.3 stable, FreeBSD 12.0, Ubuntu 19.04, Red Hat Enterprise Linux 8.0, Debian 9.9, Debian Buster, and CentOS 7 1810 as a wide variety of reference points both from newer and older Linux distributions. (As for no Clear Linux reference point for a speedy reference point, it currently has a regression with AMD + Samsung NVMe SSD support on some hardware, including this box, prohibiting the drive from coming up due to a presumed power management issue that is still being resolved.)  
>  With Matthew Dillon doing much of his development on an AMD Ryzen Threadripper system after he last year proclaimed the greatness of these AMD HEDT CPUs, for this round of testing I also used a Ryzen Threadripper 2990WX with 32 cores / 64 threads. Tests of other AMD/Intel hardware with DragonFlyBSD will come as the next stable release is near and all of the kernel work has settled down. For now it's mostly entertaining our own curiosity how well these DragonFlyBSD optimizations are paying off and how it's increasing the competition against FreeBSD 12 and Linux distributions.
>
>
> ---
>

### [What are the differences between OpenBSD and Linux?](https://cfenollosa.com/blog/what-are-the-differences-between-openbsd-and-linux.html) ###

>
>
> Maybe you have been reading recently about the release of OpenBSD 6.5 and wonder, "What are the differences between Linux and OpenBSD?"  
>  I've also been there at some point in the past and these are my conclusions.  
>  They also apply, to some extent, to other BSDs. However, an important disclaimer applies to this article.  
>  This list is aimed at people who are used to Linux and are curious about OpenBSD. It is written to highlight the most important changes from their perspective, not the absolute most important changes from a technical standpoint.  
>  Please bear with me.
>
>

* A terminal is a terminal is a terminal
* Practical differences
* Security and system administration
* Why philosophical differences matter
* So what do I choose?
* How to try OpenBSD \*\*\*

News Roundup
----------

### [NetBSD 2019 Google Summer of Code](http://blog.netbsd.org/tnf/entry/announcing_google_summer_of_code1) ###

>
>
> We are very happy to announce The NetBSD Foundation Google Summer of Code 2019 projects:
>
>

* Akul Abhilash Pillai - Adapting TriforceAFL for NetBSD kernel fuzzing
* Manikishan Ghantasala - Add KNF (NetBSD style) clang-format configuration
* Siddharth Muralee - Enhancing Syzkaller support for NetBSD
* Surya P - Implementation of COMPAT\_LINUX and COMPAT\_NETBSD32 DRM ioctls support for NetBSD kernel
* Jason High - Incorporation of Argon2 Password Hashing Algorithm into NetBSD
* Saurav Prakash - Porting NetBSD to HummingBoard Pulse
* Naveen Narayanan - Porting WINE to amd64 architecture on NetBSD

>
>
> The communiting bonding period - where students get in touch with mentors and community - started yesterday. The coding period will start from May 27 until August 19.  
>  Please welcome all our students and a big good luck to students and mentors! A big thank to Google and The NetBSD Foundation organization mentors and administrators! Looking forward to a great Google Summer of Code!
>
>

---

### [Reducing that contention](http://www.grenadille.net/post/2019/05/09/Reducing-that-contention) ###

>
>
> The opening keynote at EuroBSDCon 2016 predicted the future 10 years of BSDs. Amongst all the funny previsions, gnn@FreeBSD said that by 2026 OpenBSD will have its first implementation of SMP. Almost 3 years after this talk, that sounds like a plausible forecast... Why? Where are we? What can we do? Let's dive into the issue!
>
>

* State of affairs

>
>
> Most of OpenBSD's kernel still runs under a single lock, ze KERNEL\_LOCK(). That includes most of the syscalls, most of the interrupt handlers and most of the fault handlers. Most of them, not all of them. Meaning we have collected & fixed bugs while setting up infrastructures and examples. Now this lock remains the principal responsible for the spin % you can observe in top(1) and systat(1).  
>  I believe that we opted for a difficult hike when we decided to start removing this lock from the bottom. As a result many SCSI & Network interrupt handlers as well as all Audio & USB ones can be executed without big lock. On the other hand very few syscalls are already or almost ready to be unlocked, as we incorrectly say. This explains why basic primitives like tsleep(9), csignal() and selwakeup() are only receiving attention now that the top of the Network Stack is running (mostly) without big lock.
>
>

* Next steps

>
>
> In the past years, most of our efforts have been invested into the Network Stack. As I already mentioned it should be ready to be parallelized. However think we should now concentrate on removing the KERNEL\_LOCK(), even if the code paths aren't performance critical.
>
>

* See the Article for the rest of the post

---

### [fnaify 1.3 released - more games are "fnaify & run" now](https://www.reddit.com/r/openbsd_gaming/comments/btste9/fnaify_13_released_more_games_are_fnaify_run_now/) ###

>
>
> This release finally addresses some of the problems that prevent simple running of several games.  
>  This happens for example when an old FNA.dll library comes with the games that doesn't match the API of our native libraries like SDL2, OpenAL, or MojoShader anymore. Some of those cases can be fixed by simply dropping in a newer FNA.dll. fnaify now asks if FNA 17.12 should be automatically added if a known incompatible FNA version is found. You simply answer yes or no.
>
>
>
> Another blocker happens when the game expects to check the SteamAPI - either from a running Steam process, or a bundled steam\_api library. OpenBSD 6.5-current now has steamworks-nosteam in ports, a stub library for Steamworks.NET that prevents games from crashing simply because an API function isn't found. The repo is here. fnaify now finds this library in /usr/local/share/steamstubs and uses it instead of the bundled (full) Steamworks.NET.dll.  
>  This may help with any games that use this layer to interact with the SteamAPI, mostly those that can only be obtained via Steam.
>
>

### [vmctl(8): command line syntax changed](https://www.openbsd.org/faq/current.html#r20190529) ###

>
>
> The order of the arguments in the create, start, and stop commands of vmctl(8) has been changed to match a commonly expected style. Manual usage or scripting with vmctl must be adjusted to use the new syntax.   
>  For example, the old syntax looked like this:
>
>

`# vmctl create disk.qcow2 -s 50G`

>
>
> The new syntax specifies the command options before the argument:
>
>

`# vmctl create -s 50G disk.qcow2`

---

### [Something that Linux distributions should not do when packaging things](https://utcc.utoronto.ca/~cks/space/blog/linux/PackageNameClashProblem) ###

>
>
> Right now I am a bit unhappy at Fedora for a specific packaging situation, so let me tell you a little story of what I, as a system administrator, would really like distributions to not do.  
>  For reasons beyond the scope of this blog entry, I run a Prometheus and Grafana setup on both my home and office Fedora Linux machines (among other things, it gives me a place to test out various things involving them). When I set this up, I used the official upstream versions of both, because I needed to match what we are running (or would soon be).  
>  Recently, Fedora decided to package Grafana themselves (as a RPM), and they called this RPM package 'grafana'. Since the two different packages are different versions of the same thing as far as package management tools are concerned, Fedora basically took over the 'grafana' package name from Grafana. This caused my systems to offer to upgrade me from the Grafana.com 'grafana-6.1.5-1' package to the Fedora 'grafana-6.1.6-1.fc29' one, which I actually did after taking reasonable steps to make sure that the Fedora version of 6.1.6 was compatible with the file layouts and so on from the Grafana version of 6.1.5.  
>  Why is this a problem? It's simple. If you're going to take over a package name from the upstream, you should keep up with the upstream releases. If you take over a package name and don't keep up to date or keep up to date only sporadically, you cause all sorts of heartburn for system administrators who use the package. The least annoying future of this situation is that Fedora has abandoned Grafana at 6.1.6 and I am going to 'upgrade' it with the upstream 6.2.1, which will hopefully be a transparent replacement and not blow up in my face. The most annoying future is that Fedora and Grafana keep ping-ponging versions back and forth, which will make 'dnf upgrade' into a minefield (because it will frequently try to give me a 'grafana' upgrade that I don't want and that would be dangerous to accept). And of course this situation turns Fedora version upgrades into their own minefield, since now I risk an upgrade to Fedora 30 actually reverting the 'grafana' package version on me.
>
>
> ---
>

Beastie Bits
----------

* [[talk] ZFS v UFS on APU2 msata SSD with FreeBSD](http://lists.nycbug.org:8080/pipermail/talk/2019-May/017885.html)
* [NetBSD 8.1 is out](http://www.netbsd.org/releases/formal-8/NetBSD-8.1.html)
* [lazyboi – the laziest possible way to send raw HTTP POST data](https://github.com/ctsrc/lazyboi)
* [A Keyboard layout that changes by markov frequency](https://github.com/shapr/markovkeyboard)
* [Open Source Game Clones](https://osgameclones.com/)
* [EuroBSDcon program & registration open](https://eurobsdcon.org) \*\*\*

Feedback/Questions
----------

* John - [A segment idea](http://dpaste.com/3YTBQTX#wrap)
* Johnny - [Audio only format please don't](http://dpaste.com/3WD0A25#wrap)
* Alex - [Thanks and some Linux Snaps vs PBI feedback](http://dpaste.com/1RQF4QM#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*

 Your browser does not support the HTML5 video tag.