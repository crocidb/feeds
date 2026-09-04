+++
title = "328: EPYC Netflix Stack"
description = "LLDB Threading support now ready, Multiple IPSec VPN tunnels with FreeBSD, Netflix Optimized FreeBSD's Network Stack More Than Doubled AMD EPYC Performance, happy eyeballs with unwind(8), AWS got FreeBSD ARM 12, OpenSSH U2F/FIDO support, and more.Headlines[LLDB Thre"
date = "2019-12-12T12:00:00Z"
url = "https://www.bsdnow.tv/328"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.580747380Z"
seen = true
+++

LLDB Threading support now ready, Multiple IPSec VPN tunnels with FreeBSD, Netflix Optimized FreeBSD's Network Stack More Than Doubled AMD EPYC Performance, happy eyeballs with unwind(8), AWS got FreeBSD ARM 12, OpenSSH U2F/FIDO support, and more.

Headlines
----------

### [LLDB Threading support now ready for mainline](https://blog.netbsd.org/tnf/entry/lldb_threading_support_now_ready) ###

>
>
> Upstream describes LLDB as a next generation, high-performance debugger. It is built on top of LLVM/Clang toolchain, and features great integration with it. At the moment, it primarily supports debugging C, C++ and ObjC code, and there is interest in extending it to more languages.
>
>
>
> In February, I have started working on LLDB, as contracted by the NetBSD Foundation. So far I've been working on reenabling continuous integration, squashing bugs, improving NetBSD core file support, extending NetBSD's ptrace interface to cover more register types and fix compat32 issues and fixing watchpoint support. Then, I've started working on improving thread support which is taking longer than expected. You can read more about that in my September 2019 report.
>
>
>
> So far the number of issues uncovered while enabling proper threading support has stopped me from merging the work-in-progress patches. However, I've finally reached the point where I believe that the current work can be merged and the remaining problems can be resolved afterwards. More on that and other LLVM-related events happening during the last month in this report.
>
>

---

### [Multiple IPSec VPN tunnels with FreeBSD](https://blog.socruel.nu/text-only/how-to-multiple-ipsec-vpn-tunnels-on-freebsd.txt) ###

>
>
> The FreeBSD handbook describes an IPSec VPN tunnel between 2 FreeBSD hosts (see [https://www.freebsd.org/doc/en\_US.ISO8859-1/books/handbook/ipsec.html](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/ipsec.html))
>
>

But it is also possible to have multiple, 2 or more, IPSec VPN tunnels created and running on a FreeBSD host. How to implement and configure this is described below.

>
>
> The requirements is to have 3 locations (A, B and C) connected with IPSec VPN tunnels using FreeBSD (11.3-RELEASE).
>
>
>
> Each location has 1 IPSec VPN host running FreeBSD (VPN host A, B and C).
>
>
>
> VPN host A has 2 IPSec VPN tunnels: 1 to location B (VPN host B) and 1 to location C (VPN host C).
>
>

---

News Roundup
----------

### [Netflix Optimized FreeBSD's Network Stack More Than Doubled AMD EPYC Performance](https://www.phoronix.com/scan.php?page=news_item&px=Netflix-NUMA-FreeBSD-Optimized) ###

>
>
> Drew Gallatin of Netflix presented at the recent EuroBSDcon 2019 conference in Norway on the company's network stack optimizations to FreeBSD. Netflix was working on being able to deliver 200Gb/s network performance for video streaming out of Intel Xeon and AMD EPYC servers, to which they are now at 190Gb/s+ and in the process that doubled the potential of EPYC Naples/Rome servers and also very hefty upgrades too for Intel.
>
>
>
> Netflix has long been known to be using FreeBSD in their data centers particularly where network performance is concerned. But in wanting to deliver 200Gb/s throughput from individual servers led them to making NUMA optimizations to the FreeBSD network stack. Allocating NUMA local memory for kernel TLS crypto buffers and for backing files sent via sentfile were among their optimizations. Changes to network connection handling and dealing with incoming connections to Nginx were also made.
>
>
>
> For those just wanting the end result, Netflix's NUMA optimizations to FreeBSD resulted in their Intel Xeon servers going from 105Gb/s to 191Gb/s while the NUMA fabric utilization dropped from 40% to 13%.
>
>

---

### [unwind(8); "happy eyeballs"](https://marc.info/?l=openbsd-tech&m=157475113130337&w=2) ###

>
>
> In case you are wondering why happy eyeballs: It's a variation on this:  
> [https://en.wikipedia.org/wiki/Happy\_Eyeballs](https://en.wikipedia.org/wiki/Happy_Eyeballs)
>
>
>
> unwind has a concept of a best nameserver type. It considers a configured DoT nameserver to be better than doing it's own recursive resolving. Recursive resolving is considered to be better than asking the dhcp provided nameservers.
>
>
>
> This diff sorts the nameserver types by quality, as above (validation, resolving, dead...), and as a tie breaker it adds the median of the round trip time of previous queries into the mix.
>
>
>
> One other interesting thing about this is that it gets us past captive portals without a check URL, that's why this diff is so huge, it rips out all the captive portal stuff (please apply with patch -E):  
>  17 files changed, 385 insertions(+), 1683 deletions(-)
>
>
>
> Please test this. I'm particularly interested in reports from people who move between networks and need to get past captive portals.
>
>

---

### [Amazon now has FreeBSD ARM 12](https://aws.amazon.com/marketplace/pp/B081NF7BY7) ###

>
>
> Product Overview
>
>
>
> FreeBSD is an operating system used to power servers, desktops, and embedded systems. Derived from BSD, the version of UNIX developed at the University of California, Berkeley, FreeBSD has been continually developed by a large community for more than 30 years.
>
>
>
> FreeBSD's networking, security, storage, and monitoring features, including the pf firewall, the Capsicum and CloudABI capability frameworks, the ZFS filesystem, and the DTrace dynamic tracing framework, make FreeBSD the platform of choice for many of the busiest web sites and most pervasive embedded networking and storage systems.
>
>

---

### [OpenSSH U2F/FIDO support in base](https://www.undeadly.org/cgi?action=article;sid=20191115064850) ###

>
>
> I just committed all the dependencies for OpenSSH security key (U2F) support to base and tweaked OpenSSH to use them directly. This means there will be no additional configuration hoops to jump through to use U2F/FIDO2 security keys.
>
>
>
> Hardware backed keys can be generated using "ssh-keygen -t ecdsa-sk" (or "ed25519-sk" if your token supports it). Many tokens require to be touched/tapped to confirm this step.
>
>
>
> You'll get a public/private keypair back as usual, except in this case, the private key file does not contain a highly-sensitive private key but instead holds a "key handle" that is used by the security key to derive the real private key at signing time.
>
>
>
> So, stealing a copy of the private key file without also stealing your security key (or access to it) should not give the attacker anything.
>
>
>
> Once you have generated a key, you can use it normally - i.e. add it to an agent, copy it to your destination's authorized\_keys files (assuming they are running -current too), etc. At authentication time, you will be prompted to tap your security key to confirm the signature operation - this makes theft-of-access attacks against security keys more difficult too.
>
>
>
> Please test this thoroughly - it's a big change that we want to have stable before the next release.
>
>

---

Beastie Bits
----------

* [DragonFly - git: virtio - Fix LUN scan issue w/ Google Cloud](http://lists.dragonflybsd.org/pipermail/commits/2019-November/719945.html)
* [Really fast Markov chains in \~20 lines of sh, grep, cut and awk](https://0x0f0f0f.github.io/posts/2019/11/really-fast-markov-chains-in-~20-lines-of-sh-grep-cut-and-awk/)
* [FreeBSD Journal Sept/Oct 2019](https://www.freebsdfoundation.org/past-issues/security-3/)
* [Michael Dexter is raising money for Bhyve development](https://twitter.com/michaeldexter/status/1201231729228308480)
* [syscall call-from verification](https://marc.info/?l=openbsd-tech&m=157488907117170)
* [FreeBSD Forums Howto Section](https://forums.freebsd.org/forums/howtos-and-faqs-moderated.39/)

---

Feedback/Questions
----------

* Jeroen - [Feedback](http://dpaste.com/0PK1EG2#wrap)
* Savo - [pfsense ports](http://dpaste.com/0PZ03B7#wrap)
* Tin - [I want to learn C](http://dpaste.com/2GVNCYB#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.