+++
title = "337: Kubernetes on bhyve"
description = "Happinesses and stresses of full-time FOSS work, building a FreeBSD fileserver, Kubernetes on FreeBSD bhyve, NetBSD 9 RC1 available, OPNSense 20.1 is here, HardenedBSD’s idealistic future, and more.Headlines[The happinesses and stresses of full-time FOSS work](https"
date = "2020-02-13T16:30:00Z"
url = "https://www.bsdnow.tv/337"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.564294264Z"
seen = true
+++

Happinesses and stresses of full-time FOSS work, building a FreeBSD fileserver, Kubernetes on FreeBSD bhyve, NetBSD 9 RC1 available, OPNSense 20.1 is here, HardenedBSD’s idealistic future, and more.

Headlines
----------

### [The happinesses and stresses of full-time FOSS work](https://drewdevault.com//2020/01/21/Stress-and-happiness.html) ###

>
>
> In the past few days, several free software maintainers have come out to discuss the stresses of their work. Though the timing was suggestive, my article last week on the philosophy of project governance was, at best, only tangentially related to this topic - I had been working on that article for a while. I do have some thoughts that I’d like to share about what kind of stresses I’ve dealt with as a FOSS maintainer, and how I’ve managed (or often mismanaged) it.
>
>
>
> February will mark one year that I’ve been working on self-directed free software projects full-time. I was planning on writing an optimistic retrospective article around this time, but given the current mood of the ecosystem I think it would be better to be realistic. In this stage of my career, I now feel at once happier, busier, more fulfilled, more engaged, more stressed, and more depressed than I have at any other point in my life.
>
>
>
> The good parts are numerous. I’m able to work on my life’s passions, and my projects are in the best shape they’ve ever been thanks to the attention I’m able to pour into them. I’ve also been able to do more thoughtful, careful work; with the extra time I’ve been able to make my software more robust and reliable than it’s ever been. The variety of projects I can invest my time into has also increased substantially, with what was once relegated to minor curiosities now receiving a similar amount of attention as my larger projects were receiving in my spare time before. I can work from anywhere in the world, at any time, not worrying about when to take time off and when to put my head down and crank out a lot of code.
>
>
>
> The frustrations are numerous, as well. I often feel like I’ve bit off more than I can chew. This has been the default state of affairs for me for a long time; I’m often neglecting half of my projects in order to obtain progress by leaps and bounds in just a few. Working on FOSS full-time has cast this model’s disadvantages into greater relief, as I focus on a greater breadth of projects and spend more time on them.
>
>

---

### [Building a FreeBSD File Server](https://www.vmwareblog.org/building-freebsd-file-server/) ###

>
>
> Recently at my job, I was faced with a task to develop a file server explicitly suited for the requirements of the company. Needless to say, any configuration of a kind depends on what the infrastructure needs. So, drawing from my personal experience and numerous materials on the web, I came up with the combination FreeBSD+SAMBA+AD as the most appropriate. It appears to be a perfect choice for this environment, and harmonic addition to the existing network configuration since FreeBSD + SAMBA + AD enables admins with the broad range of possibilities for access control. However, as nothing is perfect, this configuration isn’t the best choice if your priority is data protection because it won’t be able to reach the necessary levels of reliability and fault tolerance without outside improvements.
>
>
>
> Now, since we’ve established that, let’s move on to the next point. This article’s describing the process of building a test environment while concentrating primarily on the details of the configuration. As the author, though, I must say I’m in no way suggesting that this is the only way! The following configuration will be presented in its initial stage, with the minimum requirements necessary to get the job done, and its purpose in one specific situation only. Here, look at this as a useful strategy to solve similar tasks. Well, let’s get started!
>
>

---

### [Report from the first Hamilton BSD Users Group Meeting](https://twitter.com/hambug_ca/status/1227664949914349569) ###

>
>
> February 11th was the first meeting of this new user group, founded by John Young and myself
>
>
>
> 11 people attended, and a lot of good discussions were had
>
>
>
> One of the attendees already owns a domain that fits well for the group, so we will be getting that setup over the next few weeks, as well as the twitter account, and other organization stuff.
>
>
>
> Special thanks to the illumos users who drove in from Buffalo to attend, although they may have actually had a shorter drive than a few of the other attendees.
>
>
>
> The next meeting is scheduled again for the 2nd Tuesday of the month, March 10th.
>
>
>
> We are still discussing if we should meet at a restaurant again, or try to get a space at the local college or innovation hub where we can have a projector etc.
>
>

---

News Roundup
----------

### [Kubernetes on FreeBSD Bhyve](https://www.bsdstore.ru/en/articles/cbsd_k8s_part1.html) ###

>
>
> There are quite a few solutions for container orchestration, but the most popular (or the most famous and highly advertised, is probably, a Kubernetes) Since I plan to conduct many experiments with installing and configuring k8s, I need a laboratory in which I can quickly and easily deploy a cluster in any quantities for myself. In my work and everyday life I use two OS very tightly - Linux and FreeBSD OS. Kubernetes and docker are Linux-centric projects, and at first glance, you should not expect any useful participation and help from FreeBSD here. As the saying goes, an elephant can be made out of a fly, but it will no longer fly. However, two tempting things come to mind - this is very good integration and work in the FreeBSD ZFS file system, from which it would be nice to use the snapshot mechanism, COW and reliability. And the second is the bhyve hypervisor, because we still need the docker and k8s loader in the form of the Linux kernel. Thus, we need to connect a certain number of actions in various ways, most of which are related to starting and pre-configuring virtual machines. This is typical of both a Linux-based server and FreeBSD. What exactly will work under the hood to run virtual machines does not play a big role. And if so - let's take a FreeBSD here!
>
>

---

### [NetBSD 9 RC1 Available](http://blog.netbsd.org/tnf/entry/first_release_candidate_for_netbsd) ###

>
>
> We hope this will lead to the best NetBSD release ever (only to be topped by NetBSD 10 next year).
>
>

* Here are a few highlights of the new release:

  * Support for Arm AArch64 (64-bit Armv8-A) machines, including "Arm ServerReady" compliant machines (SBBR+SBSA)
  * Enhanced hardware support for Armv7-A
  * Updated GPU drivers (e.g. support for Intel Kabylake)
  * Enhanced virtualization support
  * Support for hardware-accelerated virtualization (NVMM)
  * Support for Performance Monitoring Counters
  * Support for Kernel ASLR
  * Support several kernel sanitizers (KLEAK, KASAN, KUBSAN)
  * Support for userland sanitizers
  * Audit of the network stack
  * Many improvements in NPF
  * Updated ZFS
  * Reworked error handling and NCQ support in the SATA subsystem
  * Support a common framework for USB Ethernet drivers (usbnet)

* You can download binaries of NetBSD 9.0\_RC1 from our Fastly-provided CDN: [https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0\_RC1/](https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0_RC1/)

---

### [OPNsense 20.1 Keen Kingfisher released](https://opnsense.org/opnsense-20-1-keen-kingfisher-released/) ###

>
>
> For over 5 years now, OPNsense is driving innovation through modularising and hardening the open source firewall, with simple and reliable firmware upgrades, multi-language support, HardenedBSD security, fast adoption of upstream software updates as well as clear and stable 2-Clause BSD licensing.
>
>
>
> 20.1, nicknamed "Keen Kingfisher", is a subtle improvement on sustainable firewall experience. This release adds VXLAN and additional loopback device support, IPsec public key authentication and elliptic curve TLS certificate creation amongst others. Third party software has been updated to their latest versions. The logging frontend was rewritten for MVC with seamless API support. On the far side the documentation increased in quality as well as quantity and now presents itself in a familiar menu layout.
>
>

---

### [Idealistic Future for HardenedBSD](https://hardenedbsd.org/article/shawn-webb/2020-01-26/idealistic-future-hardenedbsd) ###

>
>
> Over the past month, we purchased and deployed the new 13-CURRENT/amd64 package building server. We published our first 13-CURRENT/amd64 production package build using that server. We then rebuilt the old package building server to act as the 12-STABLE/amd64 package building server. This post signifies a very important milestone: we have now fully recovered from last year's death of our infrastructure. Our 12-STABLE/amd64 repo, previously out-of-date by many months, is now fully up-to-date!
>
>
>
> HardenedBSD is in a very unique position to provide innovative solutions to at-risk and underprivileged populations. As such, we are making human rights endeavors a defining area of focus. Our infrastructure will integrate various privacy and anonymity enhancing technologies and techniques to protect lives. Our operating system's security posture will increase, especially with our focus on exploit mitigations.
>
>
>
> Navigating the intersection between human rights and information security directly impacts lives. HardenedBSD's 2020 mission and focus is to deliver an entire hardened ecosystem that is unfriendly towards those who would oppress or censor their people. This includes a subtle shift in priorities to match this new mission and focus. While we implement exploit mitigations and further harden the ecosystem, we will seek out opportunities to contribute a tangible and unique impact on human rights issues. Providing Tor Onion Services for our core infrastructure is the first step in likely many to come towards securely helping those in need.
>
>

---

Beastie Bits
----------

* [Warner Losh's FOSDEM talk](https://fosdem.org/2020/interviews/warner-losh/)
* [Relational Pipes v0.15](https://relational-pipes.globalcode.info/v_0/release-v0.15.xhtml)
* [A reminder for where to find NetBSD ARM images](http://www.armbsd.org/arm/)
* [New Safe Memory Reclamation feature in UMA](https://lists.freebsd.org/pipermail/freebsd-arch/2020-January/019866.html)
* [BSD Users Stockholm Meetup](https://twitter.com/niclaszeising/status/1216667359831842817)

---

Feedback/Questions
----------

* ZFS - [Rosetta Stone Document?](http://dpaste.com/13EK8YH#wrap)
* Pat - [Question](http://dpaste.com/2DN5RA4#wrap)
* Sigflup - [Wayland on the BSDs](http://dpaste.com/03Y4FQ7#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.