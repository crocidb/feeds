+++
title = "300: The Big Three"
description = "FreeBSD 11.3-beta 1 is out, BSDCan 2019 recap, OpenIndiana 2019.04 is out, Overview of ZFS Pools in FreeNAS, why open source firmware is important for security, a new Opnsense release, wireguard on OpenBSD, and more.Headlines[FreeBSD 11.3-b1 is out](https://lists.fr"
date = "2019-05-30T16:00:00Z"
url = "https://www.bsdnow.tv/300"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.634246580Z"
seen = false
+++

FreeBSD 11.3-beta 1 is out, BSDCan 2019 recap, OpenIndiana 2019.04 is out, Overview of ZFS Pools in FreeNAS, why open source firmware is important for security, a new Opnsense release, wireguard on OpenBSD, and more.

Headlines
----------

### [FreeBSD 11.3-b1 is out](https://lists.freebsd.org/pipermail/freebsd-stable/2019-May/091210.html) ###

### [BSDCan 2019 Recap](https://www.bsdcan.org/2019/) ###

* We’re back from BSDCan and it was a packed week as always.
* It started with [bhyvecon](http://bhyvecon.org/) on Tuesday. Meanwhile, Benedict spent the whole day in productive meetings: annual FreeBSD Foundation board meeting and FreeBSD Journal editorial board meeting.
* On Wednesday, tutorials for BSDCan started as well as the [FreeBSD Developer Summit](https://wiki.freebsd.org/DevSummit/201905). In the mornings, there were presentations in the big auditorium, while working groups about networking, failsafe bootcode, development web services, swap space management, and testing/CI were held. Friday had a similar format with an update from the FreeBSD core team and the “have, need, want” session for FreeBSD 13. In the afternoon, there were working groups about translation tools, package base, GSoC/Outreachy, or general hacking. Benedict held his Icinga tutorial in the afternoon with about 15 people attending. Devsummit presentation slides can be found on the wiki page and video recordings done by [ScaleEngine](https://www.scaleengine.com/) are available on [FreeBSD’s youtube channel](https://www.youtube.com/channel/UCxLxR_oW-NAmChIcSkAyZGQ).
* The conference program was a good mixture of sysadmin and tech talks across the major BSDs. Benedict saw the following talks: How ZFS snapshots really work by Matt Ahrens, 20 years in Jail by Michael W. Lucas, OpenZFS BOF session, the future of OpenZFS and FreeBSD, MQTT for system administrators by Jan-Piet Mens, and spent the rest of the time in between in the hallway track.
* Photos from the event are available on [Ollivier Robert’s talegraph ](https://www.talegraph.com/tales/Qg446T5bKT) and Diane Bruce’s website for [day 1](http://www.db.net/gallery/BSDCan/2019_BSDCan_day_1_web/), [day 2](http://www.db.net/gallery/BSDCan/2019_FreeBSD_Dev_Summit_day_2_web), [conference day 1](http://www.db.net/gallery/BSDCan/2019_BSDCan_day_1_web), and [conference day 2](http://www.db.net/gallery/BSDCan/2019_BSDCan_day_2_web).
* Thanks to all the sponsors, supporters, organizers, speakers, and attendees for making this yet another great BSDCan. Next year’s BSDCan will be from June 2 - 6, 2020.

---

### [OpenIndiana 2019.04 is out](https://www.openindiana.org/2019/05/12/openindiana-hipster-2019-04-is-here/) ###

>
>
> We have released a new OpenIndiana Hipster snapshot 2019.04. The noticeable changes:
>
>

* Firefox was updated to 60.6.3 ESR

* Virtualbox packages were added (including guest additions)

* Mate was updated to 1.22

* IPS has received updates from OmniOS CE and Oracle IPS repos, including automatic boot environment naming

* Some OI-specific applications have been ported from Python 2.7/GTK 2 to Python 3.5/GTK 3

* Quick Demo Video: https://www.youtube.com/watch?v=tQ0-fo3XNrg

---

News Roundup
----------

### [Overview of ZFS Pools in FreeNAS](https://www.ixsystems.com/blog/zfs-pools-in-freenas/) ###

>
>
> FreeNAS uses the OpenZFS (ZFS) file system, which handles both disk and volume management. ZFS offers RAID options mirror, stripe, and its own parity distribution called RAIDZ that functions like RAID5 on hardware RAID. The file system is extremely flexible and secure, with various drive combinations, checksums, snapshots, and replication all possible. For a deeper dive on ZFS technology, read the ZFS Primer section of the FreeNAS documentation.
>
>
>
> SUGGEST LAYOUT attempts to balance usable capacity and redundancy by automatically choosing an ideal vdev layout for the number of available disks.
>
>

* The following vdev layout options are available when creating a pool:
  * Stripe data is shared on two drives, similar to RAID0)
  * Mirror copies data on two drives, similar to RAID1 but not limited to 2 disks)
  * RAIDZ1 single parity similar to RAID5
  * RAIDZ2 double parity similar to RAID6
  * RAIDZ3 which uses triple parity and has no RAID equivalent

---

### [Why OpenSource Firmware is Important for Security](https://blog.jessfraz.com/post/why-open-source-firmware-is-important-for-security/) ###

* Roots of Trust

>
>
> The goal of the root of trust should be to verify that the software installed in every component of the hardware is the software that was intended. This way you can know without a doubt and verify if hardware has been hacked. Since we have very little to no visibility into the code running in a lot of places in our hardware it is hard to do this. How do we really know that the firmware in a component is not vulnerable or that is doesn’t have any backdoors? Well we can’t. Not unless it was all open source. Every cloud and vendor seems to have their own way of doing a root of trust. Microsoft has Cerberus, Google has Titan, and Amazon has Nitro. These seem to assume an explicit amount of trust in the proprietary code (the code we cannot see). This leaves me with not a great feeling. Wouldn’t it be better to be able to use all open source code? Then we could verify without a doubt that the code you can read and build yourself is the same code running on hardware for all the various places we have firmware. We could then verify that a machine was in a correct state without a doubt of it being vulnerable or with a backdoor. It makes me wonder what the smaller cloud providers like DigitalOcean or Packet have for a root of trust. Often times we only hear of these projects from the big three or five.
>
>

---

### [OPNsense](https://opnsense.org/opnsense-19-1-8-released/) ###

>
>
> This update addresses several privilege escalation issues in the access control implementation and new memory disclosure issues in Intel CPUs. We would like to thank Arnaud Cordier and Bill Marquette for the top-notch reports and coordination.
>
>

* Here are the full patch notes:

* system: address CVE-2019-11816 privilege escalation bugs[1] (reported by Arnaud Cordier)

* system: /etc/hosts generation without interface*has*gateway()

* system: show correct timestamp in config restore save message (contributed by nhirokinet)

* system: list the commands for the pluginctl utility when n+ argument is given

* system: introduce and use userIsAdmin() helper function instead of checking for 'page-all' privilege directly

* system: use absolute path in widget ACLs (reported by Netgate)

* system: RRD-related cleanups for less code exposure

* interfaces: add EN DUID Generation using OPNsense PEN (contributed by Team Rebellion)

* interfaces: replace legacy*getall*interface\_addresses() usage

* firewall: fix port validation in aliases with leading / trailing spaces

* firewall: fix outbound NAT translation display in overview page

* firewall: prevent CARP outgoing packets from using the configured gateway

* firewall: use CARP net.inet.carp.demotion to control current demotion in status page

* firewall: stop live log poller on error result

* dhcpd: change rule priority to 1 to avoid bogon clash

* dnsmasq: only admins may edit custom options field

* firmware: use insecure mode for base and kernel sets when package fingerprints are disabled

* firmware: add optional device support for base and kernel sets

* firmware: add Hostcentral mirror (HTTP, Melbourne, Australia)

* ipsec: always reset rightallowany to default when writing configuration

* lang: say "hola" to Spanish as the newest available GUI language

* lang: updates for Chinese, Czech, Japanese, German, French, Russian and Portuguese

* network time: only admins may edit custom options field

* openvpn: call openvpn*refresh*crls() indirectly via plugin\_configure() for less code exposure

* openvpn: only admins may edit custom options field to prevent privilege escalation (reported by Bill Marquette)

* openvpn: remove custom options field from wizard

* unbound: only admins may edit custom options field

* wizard: translate typehint as well

* plugins: os-freeradius 1.9.3 fixes string interpolation in LDAP filters (contributed by theq86)

* plugins: os-nginx 1.12[2]

* plugins: os-theme-cicada 1.17 (contributed by Team Rebellion)

* plugins: os-theme-tukan 1.17 (contributed by Team Rebellion)

* src: timezone database information update[3]

* src: install(1) broken with partially matching relative paths[4]

* src: microarchitectural Data Sampling (MDS) mitigation[5]

* ports: ca*root*nss 3.44

* ports: php 7.2.18[6]

* ports: sqlite 3.28.0[7]

* ports: strongswan custom XAuth generic patch removed

---

### [wiregaurd on OpenBSD](https://blog.jasper.la/wireguard-on-openbsd.html) ###

>
>
> Earlier this week I imported a port for WireGuard into the OpenBSD ports tree. At the moment we have the userland daemon and the tools available. The in-kernel implementation is only available for Linux. At the time of writing there are packages available for -current. Jason A. Donenfeld (WireGuard author) has worked to support OpenBSD in WireGuard and as such his post on ports@ last year got me interested in WireGuard, since then others have toyed with WireGuard on OpenBSD before and as such I've used Ted's article as a reference. Note however that some of the options mentioned there are no longer valid. Also, I'll be using two OpenBSD peers here. The setup will be as follows: two OpenBSD peers, of which we'll dub wg1 the server and wg2 the client. The WireGuard service on wg1 is listening on 100.64.4.3:51820.
>
>

* Conclusion

>
>
> WireGuard (cl)aims to be easier to setup and faster than OpenVPN and while I haven't been able to verify the latter, the first is certainly true...once you've figured it out. Most documentation out there is for Linux so I had to figure out the wireguard*go service and the tun parameters. But all in all, sure, it's easier. Especially the client configuration on iOS which I didn't cover here because it's essentially pkg*add libqrencode ; cat client.conf | qrencode -t ansiutf8, scan the code with the WireGuard app and you're good to go. What is particularly neat is that WireGuard on iOS supports Always-on.
>
>

---

Beastie Bits
----------

* [Serenity OS](https://github.com/SerenityOS/serenity)
* [vkernels vs pmap](https://www.dragonflydigest.com/2019/05/27/22985.html)
* [Brian Kernighan interviews Ken Thompson](https://www.youtube.com/watch?v=EY6q5dv_B-o)
* [Improvements in forking, threading, and signal code](http://blog.netbsd.org/tnf/entry/improvements_in_forking_threading_and)
* [DragonFly 5.4.3](https://www.dragonflydigest.com/2019/05/21/22946.html)
* [NetBSD on the Odroid C2](https://magazine.odroid.com/article/netbsd-for-the-the-odroid-c2/)

---

Feedback/Questions
----------

* Paulo - [Laptops](http://dpaste.com/3VXMGX8)
* A Listener - [Thanks](http://dpaste.com/0SWJNRX#wrap)
* Bostjan - [Extend a pool and lower RAM footprint](http://dpaste.com/35NRF40#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

 Your browser does not support the HTML5 video tag.