+++
title = "310: My New Free NAS"
description = "OPNsense 19.7.1 is out, ZFS on Linux still has annoying issues with ARC size, Hammer2 is now default, NetBSD audio – an application perspective, new FreeNAS Mini, and more.HeadlinesOPNsense 19.7.1 We do not wi"
date = "2019-08-08T03:00:00Z"
url = "https://www.bsdnow.tv/310"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.615000504Z"
seen = true
+++

OPNsense 19.7.1 is out, ZFS on Linux still has annoying issues with ARC size, Hammer2 is now default, NetBSD audio – an application perspective, new FreeNAS Mini, and more.

Headlines
----------

### [OPNsense 19.7.1](https://opnsense.org/opnsense-19-7-1-released/) ###

>
>
> We do not wish to keep you from enjoying your summer time, but this  
>  is a recommended security update enriched with reliability fixes for the  
>  new 19.7 series. Of special note are performance improvements as well  
>  as a fix for a longstanding NAT before IPsec limitation.
>
>
>
> Full patch notes:
>
>

* system: do not create automatic copies of existing gateways
* system: do not translate empty tunables descriptions
* system: remove unwanted form action tags
* system: do not include Syslog-ng in rc.freebsd handler
* system: fix manual system log stop/start/restart
* system: scoped IPv6 "%" could confuse mwexecf(), use plain mwexec() instead
* system: allow curl-based downloads to use both trusted and local authorities
* system: fix group privilege print and correctly redirect after edit
* system: use cached address list in referrer check
* system: fix Syslog-ng search stats
* firewall: HTML-escape dynamic entries to display aliases
* firewall: display correct IP version in automatic rules
* firewall: fix a warning while reading empty outbound rules configuration
* firewall: skip illegal log lines in live log
* interfaces: performance improvements for configurations with hundreds of interfaces
* reporting: performance improvements for Python 3 NetFlow aggregator rewrite
* dhcp: move advanced router advertisement options to correct config section
* ipsec: replace global array access with function to ensure side-effect free boot
* ipsec: change DPD action on start to "dpdaction = restart"
* ipsec: remove already default "dpdaction = none" if not set
* ipsec: use interface IP address in local ID when doing NAT before IPsec
* web proxy: fix database reset for Squid 4 by replacing use of ssl\_crtd with security\_file\_certgen
* plugins: os-acme-client 1.24[1]
* plugins: os-bind 1.6[2]
* plugins: os-dnscrypt-proxy 1.5[3]
* plugins: os-frr now restricts characters BGP prefix-list and route-maps[4]
* plugins: os-google-cloud-sdk 1.0[5]
* ports: curl 7.65.3[6]
* ports: monit 5.26.0[7]
* ports: openssh 8.0p1[8]
* ports: php 7.2.20[9]
* ports: python 3.7.4[10]
* ports: sqlite 3.29.0[11]
* ports: squid 4.8[12]

>
>
> Stay safe and hydrated, Your OPNsense team
>
>

---

### [ZFS on Linux still has annoying issues with ARC size](https://utcc.utoronto.ca/~cks/space/blog/linux/ZFSOnLinuxARCShrinkage) ###

`One of the frustrating things about operating ZFS on Linux is that the ARC size is critical but ZFS's auto-tuning of it is opaque and apparently prone to malfunctions, where your ARC will mysteriously shrink drastically and then stick there.`

>
>
> Linux's regular filesystem disk cache is very predictable; if you do disk IO, the cache will relentlessly grow to use all of your free memory. This sometimes disconcerts people when free reports that there's very little memory actually free, but at least you're getting value from your RAM. This is so reliable and regular that we generally don't think about 'is my system going to use all of my RAM as a disk cache', because the answer is always 'yes'. (The general filesystem cache is also called the page cache.)
>
>
>
> This is unfortunately not the case with the ZFS ARC in ZFS on Linux (and it wasn't necessarily the case even on Solaris). ZFS has both a current size and a 'target size' for the ARC (called 'c' in ZFS statistics). When your system boots this target size starts out as the maximum allowed size for the ARC, but various events afterward can cause it to be reduced (which obviously limits the size of your ARC, since that's its purpose). In practice, this reduction in the target size is both pretty sticky and rather mysterious (as ZFS on Linux doesn't currently expose enough statistics to tell why your ARC target size shrunk in any particular case).
>
>
>
> The net effect is that the ZFS ARC is not infrequently quite shy and hesitant about using memory, in stark contrast to Linux's normal filesystem cache. The default maximum ARC size starts out as only half of your RAM (unlike the regular filesystem cache, which will use all of it), and then it shrinks from there, sometimes very significantly, and once shrunk it only recovers slowly (if at all).
>
>

---

News Roundup
----------

### [Hammer2 is now default](http://lists.dragonflybsd.org/pipermail/commits/2019-June/718989.html) ###

```
commit a49112761c919d42d405ec10252eb0553662c824
Author: Matthew Dillon <dillon at apollo.backplane.com>
Date:   Mon Jun 10 17:53:46 2019 -0700

    installer - Default to HAMMER2

    * Change the installer default from HAMMER1 to HAMMER2.

    * Adjust the nrelease build to print the location of the image files
      when it finishes.

Summary of changes:
 nrelease/Makefile                          |  2 +-
 usr.sbin/installer/dfuibe_installer/flow.c | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

http://gitweb.dragonflybsd.org/dragonfly.git/commitdiff/a49112761c919d42d405ec10252eb0553662c824

```

---

### [NetBSD audio – an application perspective](https://netbsd.org/gallery/presentations/nia/netbsd-audio/) ###

>
>
> NetBSD audio – an application perspective ... or, "doing it natively, because we can"
>
>

* audio options for NetBSD in pkgsrc

  * Use NetBSD native audio (sun audio/audioio.h)
  * Or OSS emulation layer: Basically a wrapper around sun audio in the kernel. Incomplete and old version, but works for simple stuff

* Many many abstraction layers available:

  * OpenAL-Soft
  * alsa-lib (config file required)
  * libao, GStreamer (plugins!)
  * PortAudio, SDL
  * PulseAudio, JACK
  * ... lots more!? some obsolete stuff (esd, nas?)

* Advantages of using NetBSD audio directly

  * Low latency, low CPU usage: Abstraction layers differ in latency (SDL2 vs ALSA/OpenAL)
  * Query device information: Is /dev/audio1 a USB microphone or another sound card?
  * Avoid bugs from excessive layering
  * Nice API, well documented: [nia note: I had no idea how to write audio code. I read a man page and now I do.]
  * Your code might work on illumos too

* [nia note: SDL2 seems very sensitive to the blk\_ms sysctl being high or low, with other implementations there seems to be a less noticable difference. I don't know why.]

---

### [New FreeNAS Mini](https://www.ixsystems.com/blog/new-freenas-mini-models-release-pr/) ###

>
>
> Two new FreeNAS Mini systems join the very popular FreeNAS Mini and Mini XL:
>
>
>
> FreeNAS Mini XL+: This powerful 10 Bay platform (8x 3.5” and 1x 2.5” hot-swap, 1x 2.5” internal) includes the latest, compact server technology and provides dual 10GbE ports, 8 CPU cores and 32 GB RAM for high performance workgroups. The Mini XL+ scales beyond 100TB and is ideal for very demanding applications, including hosting virtual machines and multimedia editing. Starting at $1499, the Mini XL+ configured with cache SSD and 80 TB capacity is $4299, and consumes about 100 Watts.
>
>
>
> FreeNAS Mini E: This cost-effective 4 Bay platform provides the resources required for SOHO use with quad GbE ports and 8 GB of RAM. The Mini E is ideal for file sharing, streaming and transcoding video at 1080p. Starting at $749, the Mini E configured with 8 TB capacity is $999, and consumes about 36 Watts.
>
>

---

Beastie Bits
----------

* [Welcome to NetBSD 9.99.1!](https://mail-index.netbsd.org/source-changes/2019/07/30/msg107671.html)
* [Berkeley smorgasbord — part II](http://blog.snailtext.com/posts/berkeley-smorgasbord-part-2.html)
* [dtracing postgres](https://www.youtube.com/watch?v=Brt41xnMZqo&list=PLuJmmKtsV1dOTmlImlD9U5j1P1rLxS2V8&index=20&t=0s)
* [Project Trident 19.07-U1 now available](https://project-trident.org/post/2019-07-30_19.07-u1_available/)
* [Need a Secure Operating System? Take a Look at OpenBSD](https://www.devprojournal.com/technology-trends/operating-systems/need-a-secure-operating-system-take-a-look-at-openbsd/)

---

Feedback/Questions
----------

* Jeff - [OpenZFS Port Testing Feedback](http://dpaste.com/2AT7JGP#wrap)
* Malcolm - [Best Practices for Custom Ports](http://dpaste.com/1R170D7)
* Michael - [Little Correction](http://dpaste.com/0CERP6R)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.