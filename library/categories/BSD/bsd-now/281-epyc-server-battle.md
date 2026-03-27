+++
title = "281: EPYC Server Battle"
description = 'SCP client vulnerabilities, BSDs vs Linux benchmarks on a Tyan EPYC Server, fame for the Unix inventors, Die IPv4, GhostBSD 18.12 released, Unix in pictures, and more.\Headlines   \[scp client multiple vulnerabilities](https://sintonen.fi/advisories/scp-client-multiple-vulne'
date = "2019-01-17T15:00:00Z"
url = "https://www.bsdnow.tv/281"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.669275703Z"
seen = false
+++

SCP client vulnerabilities, BSDs vs Linux benchmarks on a Tyan EPYC Server, fame for the Unix inventors, Die IPv4, GhostBSD 18.12 released, Unix in pictures, and more.

\##Headlines  
 \###[scp client multiple vulnerabilities](https://sintonen.fi/advisories/scp-client-multiple-vulnerabilities.txt)

* Overview
* SCP clients from multiple vendors are susceptible to a malicious scp server performing  
   unauthorized changes to target directory and/or client output manipulation.
* Description
* Many scp clients fail to verify if the objects returned by the scp server match those  
   it asked for. This issue dates back to 1983 and rcp, on which scp is based. A separate  
   flaw in the client allows the target directory attributes to be changed arbitrarily.  
   Finally, two vulnerabilities in clients may allow server to spoof the client output.
* Impact
* Malicious scp server can write arbitrary files to scp target directory, change the  
   target directory permissions and to spoof the client output.
* Details

>
>
> The discovered vulnerabilities, described in more detail below, enables the attack  
>  described here in brief.
>
>

* 1. The attacker controlled server or Man-in-the-Middle(\*) attack drops .bash\_aliases file to victim’s home directory when the victim performs scp operation from the server. The transfer of extra files is hidden by sending ANSI control sequences via stderr. For example:

`user@local:~$ scp user@remote:readme.txt .`  
`readme.txt 100% 494 1.6KB/s 00:00`  
`user@local:~$`

* 1. Once the victim launches a new shell, the malicious commands in .bash\_aliases get executed.

* \*) Man-in-the-Middle attack does require the victim to accept the wrong host fingerprint.

---

\###[FreeBSD 12.0 vs. DragonFlyBSD 5.4 vs. TrueOS 18.12 vs. Linux On A Tyan EPYC Server](https://www.phoronix.com/scan.php?page=article&item=dfly-freebsd-tyanamd&num=1)

>
>
> Last month when running FreeBSD 12.0 benchmarks on a 2P EPYC server I wasn’t able to run any side-by-side benchmarks with the new DragonFlyBSD 5.4 as this BSD was crashing during the boot process on that board. But fortunately on another AMD EPYC server available, the EPYC 1P TYAN Transport SX TN70A-B8026, DragonFlyBSD 5.4.1 runs fine. So for this first round of BSD benchmarking in 2019 are tests of FreeBSD 11.2, FreeBSD 12.0, DragonFlyBSD 5.4.1, the new TrueOS 18.12, and a few Linux distributions (CentOS 7, Ubuntu 18.04.1 LTS, and Clear Linux) on this EPYC 7601 server in a variety of workloads.
>
>

>
>
> DragonFlyBSD 5.4.1 ran fine on this Tyan server and could boot fine unlike the issue encountered on the Dell PowerEdge R7425 for this particular BSD. But on the Tyan server, DragonFlyBSD 5.2.2 wouldn’t boot so only this latest DragonFlyBSD release series was used as part of the comparison.
>
>

* A summary of the operating systems tested for this EPYC 7601 OS benchmark comparison included:

* DragonFlyBSD 5.4.1 - The latest release of Matthew Dillon’s operating system while using the HAMMER2 file-system and GCC 8.1 compiler that is now the default system compiler for this BSD.

* FreeBSD 11.2 - The previous stable release of FreeBSD. Installed with a ZFS file-system.

* FreeBSD 12.0 - The latest stable release of FreeBSD and installed with its ZFS option.

* TrueOS 18.12 - The latest release of the iX systems’ FreeBSD derivative. TrueOS 18.12 is based on FreeBSD 13.0-CURRENT and uses ZFS by default and was using the Clang 7.0.1 compiler compared to Clang 6.0.1 on FreeBSD 12.0.

* CentOS Linux 7 - The latest EL7 operating system performance.

* Ubuntu 18.04.1 LTS - The latest Ubuntu Long Term Support release.

* Clear Linux 27120 - The latest rolling release as of testing out of Intel’s Open-Source Technology Center. Clear Linux often reflects as close to the gold standard for performance as possible with its insanely tuned software stack for offering optimal performance on x86\_64 performance for generally showing best what the hardware is capable of.

>
>
> Throughout all of this testing, the Tyan 2U server was kept to its same configuration of an AMD EPYC 7601 (32 cores / 64 threads) at stock speeds, 8 x 16GB DDR4-2666 ECC memory, and 280GB Intel Optane 900p SSD benchmarks.
>
>

---

\##News Roundup  
 \###[National Inventors Hall of Fame honors creators of Unix](https://www.engadget.com/2019/01/08/national-inventors-hall-of-fame-class-of-2019/)

>
>
> Dennis Ritchie (Posthumous) and Ken Thompson: UNIX Operating System  
>  Thompson and Ritchie’s creation of the UNIX operating system and the C programming language were pivotal developments in the progress of computer science. Today, 50 years after its beginnings, UNIX and UNIX-like systems continue to run machinery from supercomputers to smartphones. The UNIX operating system remains the basis of much of the world’s computing infrastructure, and C language – written to simplify the development of UNIX – is one of the most widely used languages today.
>
>

---

\###[Die IPV4, Die](https://ungleich.ch/en-us/cms/blog/2019/01/09/die-ipv4-die/)

>
>
> Imagine, it is 2019. Easy, ha? Imagine, it is 2019 and you want to turn off IPv4. Like, off off. Really off. Not disabling IPv6, but disabling IPv4.
>
>

* Two steps back

>
>
> You might be coming here wondering, why would anybody want to do what we are asking to be done. Well, it is dead simple: We are running data centers (like Data Center Light) with a lot of IPv6 only equipment. There simply is no need for IPv4. So why would we want to have it enabled?  
>  Also, here at ungleich, we defined 2019 as the year to move away from IPv4.
>
>

* The challenge

>
>
> Do you like puzzles? Competitions? Challenges? Hacking? Well. If ANY of this is of your interest, here is a real challenge for you:  
>  We offer a 100 CHF (roughly 100 USD) for anyone who can give us a detailed description of how to turn IPv4 completely off in an operating system and allowing it to communicate with IPv6 only. This should obviously include a tiny proof that your operating system is really unable to use IPv4 at all. Just flushing IPv4 addresses and keeping the IPv4 stack loaded, does not count.
>
>

---

\###[GhostBSD 18.12 released](http://www.ghostbsd.org/18.12_release_announcement)

>
>
> GhostBSD 18.12 is an updated iso of GhostBSD 18.10 with some little changes to the live DVD/USB and with updated packages.
>
>

* What has changed since 18.10
* removed default call of kernel modules for AMD and Intel
* replaced octopkg by software-station
* added back gop hacks to the live system
* added ghostbsd-drivers and ghostbsd-utils
* we updated the packages to the latest build

---

\###[And Now for a laugh : #unixinpictures](https://threader.app/thread/1083054050315243521)

---

\##Beastie Bits

* [We are now closer to the Y2038 bug than the Y2K bug](https://www.jwz.org/blog/2019/01/we-are-now-closer-to-the-y2038-bug-than-the-y2k-bug/)
* [OpenBSD Enterprise use](https://old.reddit.com/r/openbsd/comments/ae6b77/openbsd_enterprise_use/)
* [AT&T Unix Books](https://old.reddit.com/r/unix/comments/af0kij/note_the_whole_book_series_in_the_background/)
* [Process title and missing memory space](https://oshogbo.vexillium.org/blog/54/)
* [The History of a Security Hole](http://www.os2museum.com/wp/the-history-of-a-security-hole/)
* [unbound-adblock: The ultimate network adblocker!](https://www.geoghegan.ca/unbound-adblock.html)
* [FreeBSD’s name/value pairs library](https://github.com/wheelsystems/nvlist)
* [Pid Rollover](https://utcc.utoronto.ca/~cks/space/blog/unix/PidRollover)
* [Booting OpenBSD kernels in EFI mode with QEMU](https://www.cambus.net/booting-openbsd-kernels-in-efi-mode-with-qemu/)
* [OpenBSD CVS commit: Make mincore lie](https://marc.info/?l=openbsd-cvs&m=154715734504845&w=2)
* [BSDCan 2019 CfP ending January 19 - Submit!](http://www.bsdcan.org/2019/papers.php)
* [OpenZFS User Conference - April 18-19](https://www.eventbrite.com/e/zfs-user-conference-2019-tickets-54530403906)
* [FreeBSD Journal is a free publication now](https://www.freebsdfoundation.org/journal/)

---

\##Feedback/Questions

* Chris - [Boot environments and SSDs](http://dpaste.com/101P5HA)
* Jonathan - [Bytes issued during a zpool scrub](http://dpaste.com/0YTPYV4)
* Bostjan - [ZFS Record Size and my mistakes](http://dpaste.com/0Q97J7H#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---