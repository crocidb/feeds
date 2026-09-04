+++
title = "Episode 263: Encrypt That Pool | BSD Now 263"
description = 'Mitigating Spectre/Meltdown on HP Proliant servers, omniOS installation setup, debugging a memory corruption issue on OpenBSD, CfT for OpenZFS native encryption, Asigra TrueNAS backup appliance shown at VMworld, NetBSD 6 EoL, and more.  \Headlines   \[How to mitigate Spec'
date = "2018-09-07T18:00:00Z"
url = "https://www.bsdnow.tv/263"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.710655940Z"
seen = true
+++

Mitigating Spectre/Meltdown on HP Proliant servers, omniOS installation setup, debugging a memory corruption issue on OpenBSD, CfT for OpenZFS native encryption, Asigra TrueNAS backup appliance shown at VMworld, NetBSD 6 EoL, and more.  

---

\##Headlines  
 \###[How to mitigate Spectre and Meltdown on an HP Proliant server with FreeBSD](https://www.adminbyaccident.com/freebsd/how-to-freebsd/how-to-mitigate-spectre-and-meltdown-on-an-hp-proliant-server-with-freebsd/)

>
>
> As recently announced in a previous article I wanted to write a couple of guides on how to mitigate Spectre and Meltdown vulnerabilities in GNU/Linux and UNIX environments. It is always a good and I hope a standard practice to have your systems patched and if they aren’t for whatever the reason (that legacy thing you’re carrying on for ages) you may take the necessary extra steps to protect your environment. I never planned to do any article on patching anything. Nowadays it’s a no brainer and operating systems have provided the necessary tools for this to be easy and as smooth as possible. So why this article?  
>  Spectre and Meltdown are both hardware vulnerabilities. Major ones. They are meaningful for several reasons among them the world wide impact since they affect Intel and AMD systems which are ubiquitous. And second because patching hardware is not as easy, for the manufacturer and for the users or administrators in charge of the systems. There is still no known exploit around left out in the open hitting servers or desktops anywhere. The question is not if it will ever happen. The question is when will it happen. And it may be sooner than later. This is why big companies, governments and people in charge of big deployments are patching or have already patched their systems. But have you done it to your system? I know you have a firewall. Have you thought about CVE-2018-3639? This particular one could make your browser being a vector to get into your system. So, no, there is no reason to skip this.  
>  Patching these set of vulnerabilities implies some more steps and concerns than updating the operating system. If you are a regular Windows user I find rare you to be here and many of the things you will read may be foreign to you. I am not planning to do a guide on Windows systems since I believe someone else has or will do it and will do it better than me since I am not a pro Windows user. However there is one basic and common thing for all OS’s when dealing with Spectre and Meltdown and that is a microcode update is necessary for the OS patches to effectively work.  
>  What is microcode? You can read the Wikipedia article but in short it is basically a layer of code that allows chip manufacturers to deal with modifications on the hardware they’ve produced and the operating systems that will manage that hardware. Since there’s been some issues (namely Spectre and Meltdown) Intel and AMD respectively have released a series of microcode updates to address those problems. First series did come with serious problems and some regressions, to the point GNU/Linux producers stopped releasing the microcode updates through their release channels for updates and placed the ball on Intel’s roof. Patching fast does always include risks, specially when dealing with hardware. OS vendors have resumed their microcode update releases so all seems to be fine now.  
>  In order to update the microcode we’re faced with two options. Download the most recent BIOS release from our vendor, provided it patches the Spectre and Meltdown vulnerabilities, or patch it from the OS. If your hardware vendor has decided not to provide support on your hardware you are forced to use the latter solution. Yes, you can still keep your hardware. They usually come accompanied with a “release notes” file where there are some explanatory notes on what is fixed, what is new, etc. To make the search easy for you a news site collected the vendors list and linked the right support pages for anyone to look. In some scenarios it would be desirable not to replace the whole BIOS but just update the microcode from the OS side. In my case I should update an HP Proliant ML110 G7 box and the download link for that would be this.  
>  Instead of using the full blown BIOS update path we’ll use the inner utilities to patch Spectre and Meltdown on FreeBSD. So let’s put our hands on it
>
>

* See the article for the technical breakdown

---

\###[A look beyond the BSD teacup: OmniOS installation](https://eerielinux.wordpress.com/2018/08/25/a-look-beyond-the-bsd-teacup-omnios-installation/)

>
>
> Five years ago I wrote a post about taking a look beyond the Linux teacup. I was an Arch Linux user back then and since there were projects like ArchBSD (called PacBSD today) and Arch Hurd, I decided to take a look at and write about them. Things have changed. Today I’m a happy FreeBSD user, but it’s time again to take a look beyond the teacup of operating systems that I’m familiar with.
>
>

* Why Illumos / OmniOS?

>
>
> There are a couple of reasons. The Solaris derivatives are the other big community in the \*nix family besides Linux and the BSDs and we hadn’t met so far. Working with ZFS on FreeBSD, I now and then I read messages that contain a reference to Illumos which certainly helps to keep up the awareness. Of course there has also been a bit of curiosity – what might the OS be like that grew ZFS?  
>  Also the Ravenports project that I participate in planned to support Solaris/Illumos right from the beginning. I wanted to at least be somewhat “prepared” when support for that platform would finally land. So I did a little research on the various derivatives available and settled on the one that I had heard a talk about at last year’s conference of the German Unix Users Group: “OmniOS – Solaris for the Rest of Us”. I would have chosen SmartOS as I admire what Bryan Cantrill does but for getting to know Illumos I prefer a traditional installation over a run-from-RAM system.  
>  Of course FreeBSD is not run by corporations, especially when compared to the state of Linux. And when it comes to sponsoring, OpenBSD also takes the money… When it comes to FreeBSD developers, there’s probably some truth to the claim that some of them are using macOS as their desktop systems while OpenBSD devs are more likely to develop on their OS of choice. But then there’s the statement that “every innovation in the past decade comes from Solaris”. Bhyve alone proves this wrong. But let’s be honest: Two of the major technologies that make FreeBSD a great platform today – ZFS and DTrace – actually do come from Solaris. PAM originates there and a more modern way of managing services as well. Also you hear good things about their zones and a lot of small utilities in general.  
>  In the end it was a lack of time that made me cheat and go down the easiest road: Create a Vagrantfile and just pull a VM image of the net that someone else had prepared… This worked to just make sure that the Raven packages work on OmniOS. I was determined to return, though – someday. You know how things go: “someday” is a pretty common alias for “probably never, actually.”  
>  But then I heard about a forum post on the BSDNow! podcast. The title “Initial OmniOS impressions by a BSD user” caught my attention. I read that it was written by somebody who had used FreeBSD for years but loathed the new Code of Conduct enough to leave. I also oppose the Conduct and have made that pretty clear in my February post [ ! -z ${COC} ] && exit 1. As stated there, I have stayed with my favorite OS and continue to advocate it. I decided to stop reading the post and try things out on my own instead. Now I’ve finally found the time to do so.
>
>

* What’s next?

>
>
> That’s it for part one. In part two I’ll try to make the system useful. So far I have run into a problem that I haven’t been able to solve. But I have some time now to figure things out for the next post. Let’s see if I manage to get it working or if I have to report failure!
>
>

---

\###[What are all these types of memory in top(1)?](https://wiki.freebsd.org/Memory)

* Earlier this week I convinced Mark Johnston, one of the FreeBSD VM experts to update a page on the FreeBSD wiki that I saw was being referenced on stackoverflow and similar sites
* Mark updated the explanations to be more correct, and to include more technical detail for inquiring minds
* He also added the new type that appeared in FreeBSD somewhat recently

>
>
> Active - Contains memory “actively” (recently) being used by applications  
>  Inactive - Contains memory that has not been touched recently, or was released from the Buffer Cache  
>  Laundry - Contains memory that Inactive but still potentially contains useful data that needs to be stored before this memory can be used again  
>  Wired - Memory that cannot be swapped out, including the kernel, network stack, and the ZFS ARC  
>  Buf - Buffer Cache, used my UFS and most filesystems except ZFS (which uses the ARC)  
>  Free - Memory that is immediately available for use by the rest of the system
>
>

---

\##News Roundup  
 \###[OpenBSD saves me again! — Debug a memory corruption issue](https://nanxiao.me/en/openbsd-saves-me-again-debug-a-memory-corruption-issue/)

>
>
> Yesterday, I came across a third-part library issue, which crashes at allocating memory:
>
>

`Program terminated with signal SIGSEGV, Segmentation fault.`  
`#0 0x00007f594a5a9b6b in _int_malloc () from /usr/lib/libc.so.6`  
`(gdb) bt`  
`#0 0x00007f594a5a9b6b in _int_malloc () from /usr/lib/libc.so.6`  
`#1 0x00007f594a5ab503 in malloc () from /usr/lib/libc.so.6`  
`#2 0x00007f594b13f159 in operator new (sz=5767168) at /build/gcc/src/gcc/libstdc++-v3/libsupc++/new_op.cc:50`

>
>
> It is obvious that the memory tags are corrupted, but who is the murder? Since the library involves a lot of maths computation, it is not an easy task to grasp the code quickly. So I need to find another way:  
>  (1) Open all warnings during compilation: -Wall. Nothing found.  
>  (2) Use valgrind, but unfortunately, valgrind crashes itself:
>
>

`valgrind: the 'impossible' happened:`  
`Killed by fatal signal`  
``  
`host stacktrace:`  
`==43326== at 0x58053139: get_bszB_as_is (m_mallocfree.c:303)`  
`==43326== by 0x58053139: get_bszB (m_mallocfree.c:315)`  
`==43326== by 0x58053139: vgPlain_arena_malloc (m_mallocfree.c:1799)`  
`==43326== by 0x5800BA84: vgMemCheck_new_block (mc_malloc_wrappers.c:372)`  
`==43326== by 0x5800BD39: vgMemCheck___builtin_vec_new (mc_malloc_wrappers.c:427)`  
`==43326== by 0x5809F785: do_client_request (scheduler.c:1866)`  
`==43326== by 0x5809F785: vgPlain_scheduler (scheduler.c:1433)`  
`==43326== by 0x580AED50: thread_wrapper (syswrap-linux.c:103)`  
`==43326== by 0x580AED50: run_a_thread_NORETURN (syswrap-linux.c:156)`  
``  
`sched status:`  
`running_tid=1`

>
>
> (3) Change compiler, use clang instead of gcc, and hope it can give me some clues. Still no effect.  
>  (4) Switch Operating System from Linux to OpenBSD, the program crashes again. But this time, it tells me where the memory corruption occurs:
>
>

`Program terminated with signal SIGSEGV, Segmentation fault.`  
`#0 0x000014b07f01e52d in addMod (r=<error reading variable>, a=4693443247995522, b=28622907746665631,`

>
>
> I figure out the issue quickly, and not bother to understand the whole code. OpenBSD saves me again, thanks!
>
>

---

\###[Native Encryption for ZFS on FreeBSD (Call for Testing)](https://lists.freebsd.org/pipermail/freebsd-current/2018-August/070832.html)

>
>
> To anyone with an interest in native encryption in ZFS please test the projects/zfs-crypto-merge-0820 branch in my freebsd repo: [https://github.com/mattmacy/networking.git](https://github.com/mattmacy/networking.git)
>
>

`git clone https://github.com/mattmacy/networking.git -b projects/zfs-crypto-merge-0820`

>
>
> The UI is quite close to the Oracle Solaris ZFS crypto with minor differences for specifying key location.  
>  Please note that once a feature is enabled on a pool it can’t be disabled. This means that if you enable encryption support on a pool you will never be able to import it in to a ZFS without encryption support. For this reason I would strongly advise against using this on any pool that can’t be easily replaced until this change has made its way in to HEAD after the freeze has been lifted.  
>  By way of background the original ZoL commit can be found at:
>
>

* [https://github.com/zfsonlinux/zfs/pull/5769/commits/5aef9bedc801830264428c64cd2242d1b786fd49](https://github.com/zfsonlinux/zfs/pull/5769/commits/5aef9bedc801830264428c64cd2242d1b786fd49)

---

\###[VMworld 2018: Showcasing Hybrid Cloud, Persistent Memory and the Asigra TrueNAS Backup Appliance](https://www.ixsystems.com/blog/vmworld2018/)

>
>
> During its last year in Las Vegas before moving back to San Francisco, VMworld was abuzz with all the popular buzzwords, but the key focus was on supporting a more agile approach to hybrid cloud.  
>  Surveys of IT stakeholders and analysts agree that most businesses have multiple clouds spanning both public cloud providers and private data centers. While the exact numbers vary, well over half of businesses have a hybrid cloud strategy consisting of at least three different clouds.  
>  This focus on hybrid cloud provided the perfect timing for our announcement that iXsystems and Asigra are partnering to deliver the Asigra TrueNAS Backup Appliance, which combines Asigra Cloud Backup software backed by TrueNAS storage. Asigra TrueNAS Backup Appliances provide a self-healing and ransomware-resistent OpenZFS backup repository in your private cloud. The appliance can simultaneously be used as general-purpose file, block, and object storage. How does this tie in with the hybrid cloud? The Asigra Cloud Backup software can backup data from public cloud repositories – G Suite, Office 365, Salesforce, etc. – as well as intelligently move backed-up data to the public cloud for long-term retention.  
>  Another major theme at the technical sessions was persistent memory, as vSphere 6.7 added support for persistent memory – either as a storage tier or virtualized and presented to a guest OS. As detailed in our blog post from SNIA’s Persistent Memory Summit 2018, persistent memory is rapidly becoming mainstream. Persistent memory bridges the gap between memory and flash storage – providing near-memory latency storage that persists across reboots or power loss. vSphere allows both legacy and persistent memory-aware applications to leverage this ultra-fast storage tier. We were excited to show off our newly-introduced TrueNAS M-Series at VMworld, as all TrueNAS M40 and M50 models leverage NVDIMM persistent memory technology to provide a super-fast write cache, or SLOG, without any of the limitations of Flash technology.  
>  The iXsystems booth’s theme was “Enterprise Storage, Open Source Economics”. iXsystems leverages the power of Open Source software, combined with our enterprise-class hardware and support, to provide incredibly low TCO storage for virtualization environments. Our TrueNAS unified storage and server offerings are an ideal solution for your organization’s private cloud infrastructure. Combined with VMware NSX Hybrid Connect – formerly known as VMware Hybrid Cloud Extension – you can seamlessly shift running systems into a public cloud environment for a true hybrid cloud solution.  
>  Another special treat at this year’s booth was iXsystems Vice President of Engineering Kris Moore giving demos of an early version of “Project TrueView”, a single-pane of glass management solution for administration of multiple FreeNAS and TrueNAS systems. In addition to simplified administration and enhanced monitoring, Project TrueView will also provide Role-Based Access Control for finer-grained permissions management. A beta version of Project TrueView is expected to be available at the end of this year.  
>  Overall, we had a great week at VMworld 2018 with lots of good conversations with customers, press, analysts, and future customers about TrueNAS, the Asigra TrueNAS Backup Appliance, iXsystems servers, Project TrueView, and more – our booth was more popular than ever!
>
>

---

\###[End of life for NetBSD 6.x](https://blog.netbsd.org/tnf/entry/end_of_life_for_netbsd1)

>
>
> In keeping with NetBSD’s policy of supporting only the latest (8.x) and next most recent (7.x) major branches, the recent release of NetBSD 8.0 marks the end of life for NetBSD 6.x. As in the past, a month of overlapping support has been provided in order to ease the migration to newer releases.
>
>

* As of now, the following branches are no longer maintained:

* netbsd-6-1

* netbsd-6-0

* netbsd-6

* This means:

* There will be no more pullups to those branches (even for security issues)

* There will be no security advisories made for any those branches

* The existing 6.x releases on [ftp.NetBSD.org](http://ftp.NetBSD.org) will be moved into /pub/NetBSD-archive/

* May NetBSD 8.0 serve you well! (And if it doesn’t, please submit a PR!)

---

\##Beastie Bits

* [Blast from the past: OpenBSD 3.7 CD artwork](https://imgur.com/a/fkzTwYm)
* [People are asking about scale of BSD projects. Let’s figure it out…](https://twitter.com/romanzolotarev/status/1030345831751270400)
* [Tuesday, 21 August 18: me, on ed(1), at SemiBUG](https://mwl.io/archives/3642)
* [arm64 gains RETGUARD](https://undeadly.org/cgi?action=article;sid=20180813133939)
* [Call for participation](https://fosdem.org/2019/news/2018-08-10-call-for-participation/)
* [FreeBSD-UPB/bhyvearm64-utils](https://github.com/FreeBSD-UPB/bhyvearm64-utils)

---

\##Feedback/Questions

* Eric - [FreeNAS for Vacation](http://dpaste.com/2GY2S6T#wrap)
* Patrick - [Long Live Unix](http://dpaste.com/347WCR3)
* Jason - [Jason - Full MP3 Recordings](http://dpaste.com/1B7E8F5#wrap)
* Bostjan - [Question about jails and kernel](http://dpaste.com/34AQNSE#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---