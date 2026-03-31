+++
title = "Episode 244: C is a Lie | BSD Now 244"
description = "Arcan and OpenBSD, running OpenBSD 6.3 on RPI 3, why C is not a low-level language, HardenedBSD switching back to OpenSSL, how the Internet was almost broken, EuroBSDcon CfP is out, and the BSDCan 2018 schedule is available.Headlines[Towards Secure System Graphics: "
date = "2018-05-03T07:00:00Z"
url = "https://www.bsdnow.tv/244"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.760282673Z"
seen = true
+++

Arcan and OpenBSD, running OpenBSD 6.3 on RPI 3, why C is not a low-level language, HardenedBSD switching back to OpenSSL, how the Internet was almost broken, EuroBSDcon CfP is out, and the BSDCan 2018 schedule is available.

Headlines
----------

### [Towards Secure System Graphics: Arcan and OpenBSD](https://arcan-fe.com/2018/04/25/towards-secure-system-graphics-arcan-and-openbsd/) ###

>
>
> Let me preface this by saying that this is a (very) long and medium-rare technical article about the security considerations and minutiae of porting (most of) the Arcan ecosystem to work under OpenBSD. The main point of this article is not so much flirting with the OpenBSD crowd or adding further noise to software engineering topics, but to go through the special considerations that had to be taken, as notes to anyone else that decides to go down this overgrown and lonesome trail, or are curious about some less than obvious differences between how these things “work” on Linux vs. other parts of the world.
>
>
>
> A disclaimer is also that most of this have been discovered by experimentation and combining bits and pieces scattered in everything from Xorg code to man pages, there may be smarter ways to solve some of the problems mentioned – this is just the best I could find within the time allotted. I’d be happy to be corrected, in patch/pull request form that is 😉
>
>
>
> Each section will start with a short rant-like explanation of how it works in Linux, and what the translation to OpenBSD involved or, in the cases that are still partly or fully missing, will require. The topics that will be covered this time are:
>
>

* Graphics Device Access
* Hotplug
* Input
* Backlight
* Xorg
* Pledging
* Missing

---

### [Installing OpenBSD 6.3 (snapshots) on Raspberry pi 3](https://bijanebrahimi.github.io/blog/installing-openbsd-63-on-raspberry-pi-3.html) ###

* The Easy way

>
>
> Installing the OpenBSD on raspberry pi 3 is very easy and well documented which almost convinced me of not writing about it, but still I felt like it may help somebody new to the project (But again I really recommend reading the document if you are interested and have the time).
>
>
>
> Note: I'm always running snapshots and recommend anybody to do it as well. But the snapshots links will change to the next version every 6 month, so I changed the links to the 6.3 version to keep the blog post valid over times. If you're familiar to the OpenBSD flavors, feel free to use the snapshots links instead.
>
>

* Requirements

>
>
> Due to the lack of driver, the OpenBSD can not boot directly from the SD Card yet, So we'll need an USB Stick for the installtion target aside the SD Card for the U-Boot and installer. Also, a Serial Console connection is required. I Used a PL2303 USB to Serial (TTL) adapter connected to my Laptop via USB port and connected to the Raspberry via TX, RX and GND pins.
>
>

---

**iXsystems** https://www.ixsystems.com/blog/truenas-m-series-veeam-pr-2018/

### [Why Didn’t Larrabee Fail?](http://tomforsyth1000.github.io/blog.wiki.html#[[Whydidn'tLarrabeefail?]]) ###

>
>
> Every month or so, someone will ask me what happened to Larrabee and why it failed so badly. And I then try to explain to them that not only didn't it fail, it was a pretty huge success. And they are understandably very puzzled by this, because in the public consciousness Larrabee was like the Itanic and the SPU rolled into one, wasn't it? Well, not quite. So rather than explain it in person a whole bunch more times, I thought I should write it down.
>
>
>
> This is not a history, and I'm going to skip a TON of details for brevity. One day I'll write the whole story down, because it's a pretty decent escapade with lots of fun characters. But not today. Today you just get the very start and the very end.
>
>
>
> When I say "Larrabee" I mean all of Knights, all of MIC, all of Xeon Phi, all of the "Isle" cards - they're all exactly the same chip and the same people and the same software effort. Marketing seemed to dream up a new codeword every week, but there was only ever three chips:
>
>

* Knights Ferry / Aubrey Isle / LRB1 - mostly a prototype, had some performance gotchas, but did work, and shipped to partners.
* Knights Corner / Xeon Phi / LRB2 - the thing we actually shipped in bulk.
* Knights Landing - the new version that is shipping any day now (mid 2016).

>
>
> That's it. There were some other codenames I've forgotten over the years, but they're all of one of the above chips. Behind all the marketing smoke and mirrors there were only three chips ever made (so far), and only four planned in total (we had a thing called LRB3 planned between KNC and KNL for a while). All of them are "Larrabee", whether they do graphics or not.
>
>
>
> When Larrabee was originally conceived back in about 2005, it was called "SMAC", and its original goals were, from most to least important:
>
>

* 1. Make the most powerful flops-per-watt machine for real-world workloads using a huge array of simple cores, on systems and boards that could be built into bazillo-core supercomputers.

* 1. Make it from x86 cores. That means memory coherency, store ordering, memory protection, real OSes, no ugly scratchpads, it runs legacy code, and so on. No funky DSPs or windowed register files or wacky programming models allowed. Do not build another Itanium or SPU!

* 1. Make it soon. That means keeping it simple.

* 1. Support the emerging GPGPU market with that same chip. Intel were absolutely not going to build a 150W PCIe card version of their embedded graphics chip (known as "Gen"), so we had to cover those programming models. As a bonus, run normal graphics well.

* 1. Add as little graphics-specific hardware as you can get away with.

>
>
> That ordering is important - in terms of engineering and focus, Larrabee was never primarily a graphics card. If Intel had wanted a kick-ass graphics card, they already had a very good graphics team begging to be allowed to build a nice big fat hot discrete GPU - and the Gen architecture is such that they'd build a great one, too. But Intel management didn't want one, and still doesn't. But if we were going to build Larrabee anyway, they wanted us to cover that market as well.
>
>
>
> ... the design of Larrabee was of a CPU with a very wide SIMD unit, designed above all to be a real grown-up CPU - coherent caches, well-ordered memory rules, good memory protection, true multitasking, real threads, runs Linux/FreeBSD, etc. Larrabee, in the form of KNC, went on to become the fastest supercomputer in the world for a couple of years, and it's still making a ton of money for Intel in the HPC market that it was designed for, fighting very nicely against the GPUs and other custom architectures. Its successor, KNL, is just being released right now (mid 2016) and should do very nicely in that space too. Remember - KNC is literally the same chip as LRB2. It has texture samplers and a video out port sitting on the die. They don't test them or turn them on or expose them to software, but they're still there - it's still a graphics-capable part.
>
>
>
> But it's still actually running FreeBSD on that card, and under FreeBSD it's just running an x86 program called DirectXGfx (248 threads of it).
>
>

---

News Roundup
----------

### [C Is Not a Low-level Language : Your computer is not a fast PDP-11.](https://queue.acm.org/detail.cfm?id=3212479) ###

>
>
> In the wake of the recent Meltdown and Spectre vulnerabilities, it's worth spending some time looking at root causes. Both of these vulnerabilities involved processors speculatively executing instructions past some kind of access check and allowing the attacker to observe the results via a side channel. The features that led to these vulnerabilities, along with several others, were added to let C programmers continue to believe they were programming in a low-level language, when this hasn't been the case for decades.
>
>
>
> Processor vendors are not alone in this. Those of us working on C/C++ compilers have also participated.
>
>

* What Is a Low-Level Language?

>
>
> Computer science pioneer Alan Perlis defined low-level languages this way: "A programming language is low level when its programs require attention to the irrelevant."
>
>
>
> While, yes, this definition applies to C, it does not capture what people desire in a low-level language. Various attributes cause people to regard a language as low-level. Think of programming languages as belonging on a continuum, with assembly at one end and the interface to the Starship Enterprise's computer at the other. Low-level languages are "close to the metal," whereas high-level languages are closer to how humans think.
>
>
>
> For a language to be "close to the metal," it must provide an abstract machine that maps easily to the abstractions exposed by the target platform. It's easy to argue that C was a low-level language for the PDP-11. They both described a model in which programs executed sequentially, in which memory was a flat space, and even the pre- and post-increment operators cleanly lined up with the PDP-11 addressing modes.
>
>

Fast PDP-11 Emulators

>
>
> The root cause of the Spectre and Meltdown vulnerabilities was that processor architects were trying to build not just fast processors, but fast processors that expose the same abstract machine as a PDP-11. This is essential because it allows C programmers to continue in the belief that their language is close to the underlying hardware.
>
>
>
> C code provides a mostly serial abstract machine (until C11, an entirely serial machine if nonstandard vendor extensions were excluded). Creating a new thread is a library operation known to be expensive, so processors wishing to keep their execution units busy running C code rely on ILP (instruction-level parallelism). They inspect adjacent operations and issue independent ones in parallel. This adds a significant amount of complexity (and power consumption) to allow programmers to write mostly sequential code. In contrast, GPUs achieve very high performance without any of this logic, at the expense of requiring explicitly parallel programs.
>
>
>
> The quest for high ILP was the direct cause of Spectre and Meltdown. A modern Intel processor has up to 180 instructions in flight at a time (in stark contrast to a sequential C abstract machine, which expects each operation to complete before the next one begins). A typical heuristic for C code is that there is a branch, on average, every seven instructions. If you wish to keep such a pipeline full from a single thread, then you must guess the targets of the next 25 branches. This, again, adds complexity; it also means that an incorrect guess results in work being done and then discarded, which is not ideal for power consumption. This discarded work has visible side effects, which the Spectre and Meltdown attacks could exploit.
>
>
>
> On a modern high-end core, the register rename engine is one of the largest consumers of die area and power. To make matters worse, it cannot be turned off or power gated while any instructions are running, which makes it inconvenient in a dark silicon era when transistors are cheap but powered transistors are an expensive resource. This unit is conspicuously absent on GPUs, where parallelism again comes from multiple threads rather than trying to extract instruction-level parallelism from intrinsically scalar code. If instructions do not have dependencies that need to be reordered, then register renaming is not necessary.
>
>
>
> Consider another core part of the C abstract machine's memory model: flat memory. This hasn't been true for more than two decades. A modern processor often has three levels of cache in between registers and main memory, which attempt to hide latency.
>
>
>
> The cache is, as its name implies, hidden from the programmer and so is not visible to C. Efficient use of the cache is one of the most important ways of making code run quickly on a modern processor, yet this is completely hidden by the abstract machine, and programmers must rely on knowing implementation details of the cache (for example, two values that are 64-byte-aligned may end up in the same cache line) to write efficient code.
>
>

* [Backup URL](https://web.archive.org/web/20180501170011/https://queue.acm.org/detail.cfm?id=3212479)
* [Hacker News Commentary](https://news.ycombinator.com/item?id=16967675)

---

### [HardenedBSD Switching Back to OpenSSL](https://hardenedbsd.org/article/shawn-webb/2018-04-30/hardenedbsd-switching-back-openssl) ###

>
>
> Over a year ago, HardenedBSD switched to LibreSSL as the default cryptographic library in base for 12-CURRENT. 11-STABLE followed suit later on. Bernard Spil has done an excellent job at keeping our users up-to-date with the latest security patches from LibreSSL.
>
>
>
> After recently updating 12-CURRENT to LibreSSL 2.7.2 from 2.6.4, it has become increasingly clear to us that performing major upgrades requires a team larger than a single person. Upgrading to 2.7.2 caused a lot of fallout in our ports tree. As of 28 Apr 2018, several ports we consider high priority are still broken. As it stands right now, it would take Bernard a significant amount of his spare personal time to fix these issues.
>
>
>
> Until we have a multi-person team dedicated to maintaining LibreSSL in base along with the patches required in ports, HardenedBSD will use OpenSSL going forward as the default cryptographic library in base. LibreSSL will co-exist with OpenSSL in the source tree, as it does now. However, MK\_LIBRESSL will default to "no" instead of the current "yes". Bernard will continue maintaining LibreSSL in base along with addressing the various problematic ports entries.
>
>
>
> To provide our users with ample time to plan and perform updates, we will wait a period of two months prior to making the switch. The switch will occur on 01 Jul 2018 and will be performed simultaneously in 12-CURRENT and 11-STABLE. HardenedBSD will archive a copy of the LibreSSL-centric package repositories and binary updates for base for a period of six months after the switch (expiring the package repos on 01 Jan 2019). This essentially gives our users eight full months for an upgrade path.
>
>
>
> As part of the switch back to OpenSSL, the default NTP daemon in base will switch back from OpenNTPd to ISC NTP. Users who have local*openntpd*enable="YES" set in rc.conf will need to switch back to ntpd\_enable="YES".
>
>
>
> Users who build base from source will want to fully clean their object directories. Any and all packages that link with libcrypto or libssl will need to be rebuilt or reinstalled.
>
>
>
> With the community's help, we look forward to the day when we can make the switch back to LibreSSL. We at HardenedBSD believe that providing our users options to rid themselves of software monocultures can better increase security and manage risk.
>
>

---

**DigitalOcean** http://do.co/bsdnow -- $100 credit for 60 days

### [How Dan Kaminsky Almost Broke the Internet](https://duo.com/decipher/hacker-history-how-dan-kaminsky-almost-broke-the-internet) ###

>
>
> In the summer of 2008, security researcher Dan Kaminsky disclosed how he had found a huge flaw in the Internet that could let attackers redirect web traffic to alternate servers and disrupt normal operations. In this Hacker History video, Kaminsky describes the flaw and notes the issue remains unfixed.
>
>
>
> “We were really concerned about web pages and emails 'cause that’s what you get to compromise when you compromise DNS,” Kaminsky says. “You think you’re sending an email to IBM but it really goes to the bad guy.”
>
>
>
> As the phone book of the Internet, DNS translates easy-to-remember domain names into IP addresses so that users don’t have to remember strings of numbers to reach web applications and services. Authoritative nameservers publish the IP addresses of domain names. Recursive nameservers talk to authoritative servers to find addresses for those domain names and saves the information into its cache to speed up the response time the next time it is asked about that site. While anyone can set up a nameserver and configure an authoritative zone for any site, if recursive nameservers don’t point to it to ask questions, no one will get those wrong answers.
>
>
>
> We made the Internet less flammable.
>
>
>
> Kaminsky found a fundamental design flaw in DNS that made it possible to inject incorrect information into the nameserver's cache, or DNS cache poisoning. In this case, if an attacker crafted DNS queries looking for sibling names to existing domains, such as 1.example.com, 2.example.com, and 3.example.com, while claiming to be the official "www" server for example.com, the nameserver will save that server IP address for “www” in its cache.
>
>
>
> “The server will go, ‘You are the official. Go right ahead. Tell me what it’s supposed to be,’” Kaminsky says in the video.
>
>
>
> Since the issue affected nearly every DNS server on the planet, it required a coordinated response to address it. Kaminsky informed Paul Vixie, creator of several DNS protocol extensions and application, and Vixie called an emergency summit of major IT vendors at Microsoft’s headquarters to figure out what to do.
>
>
>
> The “fix” involved combining the 16-bit transaction identifier that DNS lookups used with UDP source ports to create 32-bit transaction identifiers. Instead of fixing the flaw so that it can’t be exploited, the resolution focused on making it take more than ten seconds, eliminating the instantaneous attack.
>
>
>
> “[It’s] not like we repaired DNS,” Kaminsky says. “We made the Internet less flammable.”
>
>
>
> DNSSEC (Domain Name System Security Extensions), is intended to secure DNS by adding a cryptographic layer to DNS information. The root zone of the internet was signed for DNSSEC in July 2010 and the .com Top Level Domain (TLD) was finally signed for DNSSEC in April 2011. Unfortunately, adoption has been slow, even ten years after Kaminsky first raised the alarm about DNS, as less than 15 percent of users pass their queries to DNSSEC validating resolvers.
>
>
>
> The Internet was never designed to be secure. The Internet was designed to move pictures of cats.
>
>
>
> No one expected the Internet to be used for commerce and critical communications. If people lose faith in DNS, then all the things that depend on it are at risk.
>
>
>
> “What are we going to do? Here is the answer. Some of us gotta go out fix it,” Kaminsky says.
>
>

---

### [OpenIndiana Hipster 2018.04 is here](https://www.openindiana.org/2018/04/28/openindiana-hipster-2018-04-is-here/) ###

* We have released a new OpenIndiana Hipster snapshot 2018.04. The noticeable changes:

  * Userland software is rebuilt with GCC 6.
  * KPTI was enabled to mitigate recent security issues in Intel CPUs.
  * Support of Gnome 2 desktop was removed.
  * Linked images now support zoneproxy service.
  * Mate desktop applications are delivered as 64-bit-only.
  * Upower support was integrated.
  * IIIM was removed.

* More information can be found in [2018.04 Release notes](https://wiki.openindiana.org/oi/2018.04+Release+notes) and new medias can be downloaded from [http://dlc.openindiana.org](http://dlc.openindiana.org/).

---

Beastie Bits
----------

* [EuroBSDCon - Call for Papers](https://2018.eurobsdcon.org/call-for-papers/)
* [OpenSSH 7.7](https://www.openssh.com/txt/release-7.7)
* [pkgsrc-2018Q1 released](https://mail-index.netbsd.org/pkgsrc-users/2018/04/05/msg026461.html)
* [BSDCan Schedule](https://www.bsdcan.org/2018/schedule/)
* [Michael Dexter's LFNW talk](https://www.youtube.com/watch?v=CehSeSVgEUA&feature=youtu.be)

---

---

Tarsnap ad

---

Feedback/Questions
----------

* Bob - [Help locating FreeBSD Help](http://dpaste.com/02T6P91#wrap)
* Alex - [Convert directory to dataset](http://dpaste.com/04RQ46X#wrap)
* Adam - [FreeNAS Question](http://dpaste.com/3GT988W#wrap)
* Florian - [Three Questions](http://dpaste.com/3RGQRVR#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

iX Ad spot: [iXsystems TrueNAS M-Series Blows Away Veeam Backup Certification Tests](https://www.ixsystems.com/blog/truenas-m-series-veeam-pr-2018/)