+++
title = "111: Xenocratic Oath"
description = "Coming up on this weeks episode, we have BSD news, tidbits and articles out the wazoo to share. Also, be sure to stick around for our interview with Brandon Mercer as he tells us about OpenBSD being used in the healthcare industry.This episode was brought to you by[![iX"
date = "2015-10-14T12:00:00Z"
url = "https://www.bsdnow.tv/111"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.097386115Z"
seen = true
+++

Coming up on this weeks episode, we have BSD news, tidbits and articles out the wazoo to share. Also, be sure to stick around for our interview with Brandon Mercer as he tells us about OpenBSD being used in the healthcare industry.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [NetBSD 7.0 Release Announcement](http://www.netbsd.org/releases/formal-7/NetBSD-7.0.html) ###

* DRM/KMS support brings accelerated graphics to x86 systems using modern Intel and Radeon devices (Linux 3.15)
* Multiprocessor ARM support.
* Support for many new ARM boards, including the Raspberry Pi 2 and BeagleBone Black
* Major NPF improvements:
  * BPF with just-in-time (JIT) compilation by default
  * support for dynamic rules

* support for static (stateless) NAT
* support for IPv6-to-IPv6 Network Prefix Translation (NPTv6) as per RFC 6296
* support for CDB based tables (uses perfect hashing and guarantees lock-free O(1) lookups)
* Multiprocessor support in the USB subsystem.
* GPT support in sysinst via the extended partitioning menu.
* Lua kernel scripting
* GCC 4.8.4, which brings support for C++11
* Experimental support for SSD TRIM in wd(4) and FFS
* tetris(6): Add colours and a 'down' key, defaulting to 'n'. It moves the block down a line, if it fits. \*\*\*

### [CloudFlare develops interesting new netmap feature ](https://blog.cloudflare.com/single-rx-queue-kernel-bypass-with-netmap/) ###

* Normally, when Netmap is enabled on an interface, the kernel is bypassed and all of the packets go to the Netmap consumers
* CloudFlare has developed a feature that allows all but one of the RX queues to remain connected to the kernel, and only a single queue be passed to Netmap
* The change is a simple modification to the nm\_open API, allowing the application to open only a specific queue of the NIC, rather than the entire thing
* The RSS or other hashing must be modified to not direct traffic to this queue
* Then specific flows are directed to the netmap application for matching traffic
* For example under Linux:
* ethtool -X eth3 weight 1 1 1 1 0 1 1 1 1 1
* ethtool -K eth3 lro off gro off
* ethtool -N eth3 flow-type udp4 dst-port 53 action 4
* Directs all name server traffic to NIC queue number 4
* Currently there is no tool like ethtool to accomplish this same under FreeBSD
* I wonder if the flows could be identified more specifically using something like ipfw-netmap \*\*\*

### [Building your own OpenBSD based Mail server!](http://www.theregister.co.uk/2015/09/12/feature_last_post_build_mail_server/?mt=1442858572214) ###

* [part 2](http://www.theregister.co.uk/2015/09/19/feature_last_post_build_mailserver_part_2/)
* [part 3](http://www.theregister.co.uk/2015/09/26/feature_last_post_build_mailserver_part_3/)
* The UK Register gives us a great writeup on getting your own mail server setup specifically on OpenBSD 5.7
* [In this article they used a MiniPC the Acer Revo One RL85, which is a decently priced little box for a mail server ](http://www.theregister.co.uk/2015/07/24/review_acer_revo_one_rl85_/)
* While a bit lengthy in 3 parts, it does provide a good walkthrough of getting OpenBSD setup, PostFix and DoveCot configured and working. In the final installment it also provides details on spam filtering and antivirus scanning.

### [Getting started with the UEFI bootloader on OpenBSD](http://blog.jasper.la/openbsd-uefi-bootloader-howto/) ###

* If you've been listening over the past few weeks, you've heard about OpenBSD.s new UEFI boot-loader. We now have a blog post with detailed instructions on how to get setup with this on your own system.
* The initial setup is pretty straightforward, and should only take a few minutes at most. In involves the usual fdisk commands to create a FAT EFI partition, and placing the bootx64.efi file in the correct location.
* As a bonus, we even get instructions on how to enable the frame-buffer driver on systems without native Intel video support (ThinkPad x250 in this example) \*\*\*

### [Recipe for building a 10Mpps FreeBSD based router](http://blog.cochard.me/2015/09/receipt-for-building-10mpps-freebsd.html) ###

* Olivier, (of FreeNAS and BSD Router Project fame) treats us this week to a neat blog post about building your own high-performance 10Mpps FreeBSD router
* As he first mentions, the hardware required will need to be beefy, no $200 miniPC here. In his setup he uses a 8 core Intel Xeon E5-2650, along with a Quad port 10 Gigabit Chelsio TS540-CR.
* He mentions that this doesn't work quite on stock FreeBSD yet, you will need to pull code in from the [projects/routing ](https://svnweb.freebsd.org/base/projects/routing/) which fixes an issue with scaling on cores, in this case he is shrinking the NIC queues down to 4 from 8.
* If you don't feel like doing the compiles yourself, he also includes links to experimental BSDRouter project images which he used to do the benchmarks
* Bonus! Nice graphic of the benchmarks from enabling IPFW or PF and what that does to the performance. \*\*\*

Interview - Brandon Mercer - [bmercer@openbsd.org](mailto:bmercer@openbsd.org) / [@knowmercymod](https://twitter.com/knowmercymod)
----------

OpenBSD in Healthcare

* Sorry about the audio quality degradation. The last 7 or 8 minutes of the interview had to be cut, a problem with the software that captures the audio from skype and adds it to our compositor. My local monitor is analogue and did not experience the issue, so I was unaware of the issue during the recording \*\*\*

News Roundup
----------

### [Nvidia releases new beta FreeBSD driver along with new kernel module](https://devtalk.nvidia.com/default/topic/884727/unix-graphics-announcements-and-news/linux-solaris-and-freebsd-driver-358-09-beta-/) ###

* Includes a new kernel module, nvidia-modeset.ko
* While this module does NOT have any user-settable features, it works with the existing nvidia.ko to provide kernel-mode setting (KMS) used by the integrated DRM within the kernel.
* The beta adds support for 805A and 960A nvidia cards
* Also fixes a memory leak and some regressions \*\*\*

### [MidnightBSD 0.7-RELEASE](http://www.midnightbsd.org/pipermail/midnightbsd-users/Week-of-Mon-20150914/003462.html) ###

* We missed this while away at Euro and elsewhere, but MidnightBSD (A desktop-focused FreeBSD 6.1 Fork) has come out with a new 0.7 release
* This release primarily focuses on stability, but also includes important security fixes as well.
* It cherry-picks updates to a variety of FreeBSD base-system updates, and some important ZFS features, such as TRIM and LZ4 compression
* Their custom .mports. system has also gotten a slew of updates, with almost 2000 packages now available, including a WiP of Gnome3. It also brings support for starting / stopping services automatically at pkg install or removal.
* They note that this will most likely be the last i386 release, joining the club of other projects that are going 64bit only. \*\*\*

### ["Open Source as a Career Path"](http://media.medfarm.uu.se/play/video/5400) ###

* The FreeBSD Project held a [panel discussion](<http://www.cb.uu.se/~kristina/WomENcourage/2014/2015-09-25_Friday/2015-09-25 113238.JPG>) of why Open Source makes a good career path at the ACM.s womENcourage conference in Uppsala, Sweden, the weekend before EuroBSDCon
* The Panel was lead by Dru Lavigne, and consisted of Deb Goodkin, Benedict Reuschling, Dan Langille, and myself
* We attempted to provide a cross section of experiences, including women in the field, the academic side, the community side, and the business side
* During the question period, Dan gave a [great answer](https://gist.github.com/dlangille/e262bccdea08b89b5360) to the question of .Why do open source projects still use old technologies like mailing lists and IRC.
* The day before, the FreeBSD Foundation also had a booth at the career fair. We were the only open source project that attended. Other exhibitors included: Cisco, Facebook, Intel, Google, and Oracle.
* The following day, Dan also [gave a workshop](<http://www.cb.uu.se/~kristina/WomENcourage/2014/2015-09-25_Friday/2015-09-25 113238.JPG>) on how to contribute to an open source project \*\*\*

### Beastie-Bits ###

[NetBSD 2015PkgSrc Freeze](http://mail-index.netbsd.org/pkgsrc-users/2015/09/12/msg022186.html)

[Support for 802.11N for RealTek USB in FreeBSD](https://github.com/freebsd/freebsd/commits/master/sys/dev/usb/wlan/if_rsu.c)

[Wayland ported to DragonFlyBSD ](https://github.com/DragonFlyBSD/DeltaPorts/pull/123)

[OpenSMTPd developer debriefs on audit report ](http://undeadly.org/cgi?action=article&sid=20151013161745)

[FreeBSD fixes issue with pf under Xen with TSO. Errata coming soon ](https://svnweb.freebsd.org/base?view=revision&revision=289316)

[Xinuos funds the HardenedBSD project ](http://slexy.org/view/s2EBjrxQ9M)

---

Feedback/Questions
----------

* [ Evan](http://slexy.org/view/s21PMmNFIs)
* [ Darin writes in](http://slexy.org/view/s20qH07ox0)
* [ Jochen writes in](http://slexy.org/view/s2d0SFmRlD) \*\*\*