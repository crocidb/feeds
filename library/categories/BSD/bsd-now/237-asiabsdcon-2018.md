+++
title = "237: AsiaBSDcon 2018"
description = "AsiaBSDcon review, Meltdown and Spectre Patches in FreeBSD stable, Interview with MidnightBSD founder, 8 months with TrueOS, mysteries of GNU and BSD splitThis episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](ht"
date = "2018-03-14T12:00:00Z"
url = "https://www.bsdnow.tv/237"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.778742009Z"
seen = false
+++

AsiaBSDcon review, Meltdown and Spectre Patches in FreeBSD stable, Interview with MidnightBSD founder, 8 months with TrueOS, mysteries of GNU and BSD split

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [AsiaBSDCon 2018 has concluded](https://2018.asiabsdcon.org/) ###

* We have just returned from AsiaBSDCon in Tokyo, Japan last weekend
* Please excuse our jetlag
* The conference consisted two days of meeting followed by 2 days of paper presentations
* We arrived a few days early to see some sights and take a few extra delicious meals in Tokyo
* The first day of meetings was a FreeBSD developer summit (while Benedict was teaching his two tutorials) where we discussed the FreeBSD release cycle and our thoughts on improving it, the new Casper capsicum helper service, and developments in SDIO which will eventually enable WiFi and SD card readers on more embedded devices
* The second day of meetings consisted of bhyvecon, a miniconf that covered development in all hypervisors on all BSDs. It also included presentations on the porting of bhyve to IllumOS.
* Then the conference started
* There were a number of great presentations, plus an amazing hallway track as usual
* It was great to see many old friends and to spend time discussing the latest happenings in BSD. A couple of people came by and asked to take a picture with us and we were happy to do that. \*\*\*

### [FreeBSD releases Spectre and Meltdown mitigations for 11.1](https://www.freebsd.org/security/advisories/FreeBSD-SA-18:03.speculative_execution.asc) ###

>
>
> Speculative execution vulnerability mitigation is a work in progress. This advisory addresses the most significant issues for FreeBSD 11.1 on amd64 CPUs. We expect to update this advisory to include 10.x for amd64 CPUs. Future FreeBSD releases will address this issue on i386 and other CPUs. freebsd-update will include changes on i386 as part of this update due to common code changes shared between amd64 and i386, however it contains no functional changes for i386 (in particular, it does not mitigate the issue on i386).  
>  Many modern processors have implementation issues that allow unprivileged attackers to bypass user-kernel or inter-process memory access restrictions by exploiting speculative execution and shared resources (for example, caches).  
>  An attacker may be able to read secret data from the kernel or from a process when executing untrusted code (for example, in a web browser).
>
>
>
> * Meltdown: The mitigation is known as Page Table Isolation (PTI). PTI largely separates kernel and user mode page tables, so that even during speculative execution most of the kernel's data is unmapped and not accessible. A demonstration of the Meltdown vulnerability is available at [https://github.com/dag-erling/meltdown](https://github.com/dag-erling/meltdown). A positive result is definitive (that is, the vulnerability exists with certainty). A negative result indicates either that the CPU is not affected, or that the test is not capable of demonstrating the issue on the CPU (and may need to be modified). A patched kernel will automatically enable PTI on Intel CPUs. The status can be checked via the vm.pmap.pti sysctl PTI introduces a performance regression. The observed performance loss is significant in microbenchmarks of system call overhead, but is much smaller for many real workloads.
> * Spectre V2: There are two common mitigations for Spectre V2. This patch includes a mitigation using Indirect Branch Restricted Speculation, a feature available via a microcode update from processor manufacturers. The alternate mitigation, Retpoline, is a feature available in newer compilers. The feasibility of applying Retpoline to stable branches and/or releases is under investigation. The patch includes the IBRS mitigation for Spectre V2. To use the mitigation the system must have an updated microcode; with older microcode a patched kernel will function without the mitigation. IBRS can be disabled via the hw.ibrs\_disable sysctl (and tunable), and the status can be checked via the hw.ibrs\_active sysctl. IBRS may be enabled or disabled at runtime. Additional detail on microcode updates will follow.
> * [Wiki tracking the vulnerabilities and mitigations on different platforms](https://wiki.freebsd.org/SpeculativeExecutionVulnerabilities) \*\*\*
>
>

### [Interview with MidnightBSD Founder and Lead Dev Lucas Holt](https://itsfoss.com/midnightbsd-founder-lucas-holt/) ###

>
>
> Recently, I have taken a little dip into the world of BSD. As part of my attempt to understand the BSD world a little better, I connected with Lucas Holt (MidnightBSD founder and lead developer) to ask him a few questions about his project. Here are his answers.
>
>
>
> Its FOSS: Please explain MidnightBSD in a nutshell. How is it different than other BSDs?
>
>
>
> Lucas Holt: MidnightBSD is a desktop focused operating system. When its considered stable, it will provide a full desktop experience. This differs from other efforts such as TrueOS or GhostBSD in that its not a distro of FreeBSD, but rather a fork. MidnightBSD has its own package manager, mport as well as unique package cluster software and several features built into user land such as mDNSresponder, libdispatch, and customizations throughout the system.
>
>
>
> Its FOSS: Who is MidnightBSD aimed at?
>
>
>
> Lucas Holt: The goal with MidnightBSD has always been to provide a desktop OS thats usable for everyday tasks and that even somewhat non technical people can use. Early versions of Mac OS X were certainly an inspiration. In practice, were rather far from that goal at this point, but its been an excellent learning opportunity.
>
>
>
> Its FOSS: What is your background in computers?
>
>
>
> Lucas Holt: I started in technical support at a small ISP and moved into web design and system administration. While there, I learned BSDi, Solaris and Linux. I also started tinkering with programming web apps in ASP and a little perl CGI. I then did a mix of programming and system administration jobs through college and graduated with a bachelors in C.S. from Eastern Michigan University. During that time, I learned NetBSD and FreeBSD. I started working on several projects such as porting Apples HFS+ code to FreeBSD 6 and working on getting the nforce2 chipset SATA controller working with FreeBSD 6, with the latter getting committed. I got a real taste for BSD and after seeing the lack of interest in the community for desktop BSDs, I started MidnightBSD. I began work on it in late 2005.  
>  Currently, Im a Senior Software Engineer focusing on backend rest services by day and a part-time graduate student at the University of Michigan Flint.
>
>
>
> Its FOSS: I recently installed TrueOS. I was disappointed that a couple of the programs I wanted were not available. The FreeBSD port system looked mildly complicated for beginners. Im used to using pacman to get the job done quickly. How does MidnightBSD deal with ports?
>
>
>
> Lucas Holt: MidnightBSD has its own port system, mports, which shared similarities with FreeBSD ports as well as some ideas from OpenBSD. We decided early on that decent package management was essential for regular users. Power users will still use ports for certain software, but its just so time consuming to build everything. We started work on our own package manager, mport.  
>  Every package is a tar lzma archive with a sqlite3 manifest file as well as a sqlite 3 index thats downloaded from our server. This allows users to query and customize the package system with standard SQL queries. Were also building more user friendly graphical tools.  
>  Package availability is another issue that most BSDs have. Software tends to be written for one or two operating systems and many projects are reluctant to support other systems, particularly smaller projects like MidnightBSD. There are certainly gaps. All of the BSD projects need more volunteers to help with porting software and keeping it up to date.
>
>
>
> Its FOSS: During your June 2015 interview on BSDNow, you mentioned that even though you support both i386 and amd64, that you recommend people choose amd64. Do you have any plans to drop i386 support in the future, like many have done?
>
>
>
> Lucas Holt: Yes, we do plan to drop i386 support, mostly because of the extra work needed to build and maintain packages. Ive held off on this so far because I had a lot of feedback from users in South America that they still needed it. For now, the plan is to keep i386 support through 1.0 release. Thats probably a year or two out.
>
>
>
> Its FOSS: What desktop environments does MidnightBSD support?
>
>
>
> Lucas Holt: The original plan was to use Etoile as a desktop environment, but that project changed focus. We currently support Xfce, Gnome 3, WindowMaker + GNUstep + Gworkspace as primary choices. We also have several other window managers and desktop environments available such as Enlightenment, rat poison, afterstep, etc.  
>  Early versions offered KDE 3.x but we had some issues with KDE 4. We may revisit that with newer versions.
>
>
>
> Its FOSS: What is MidnightBSDs default filesystem? Do you support DragonflyBSDs HAMMER filesystem? What other filesystems?
>
>
>
> Lucas Holt: Boot volumes are UFS2. We also support ZFS for additional storage. We have read support for ExFat, NTFS, ext2, CD9660. NFS v3 and v4 are also supported for network file systems.  
>  We do not support HAMMER, although it was considered. I would love to see HAMMER2 get added to MidnightBSD eventually.
>
>
>
> Its FOSS: Is MidnightBSD affected by the recent Spectre and Meltdown issues?
>
>
>
> Lucas Holt: Yes. Most operating systems were affected by these issues. We were not informed of the issue until the general public became aware. Work is ongoing to come up with appropriate mitigations. Unfortunately, we do not have a patch yet.
>
>
>
> Its FOSS: The Raspberry Pi and its many clones have made the ARM platform very popular. Are there any plans to make MidnightBSD available on that platform?
>
>
>
> Lucas Holt: No immediate plans. ARM is an interesting architecture, but by the very nature of SoC designs, takes a lot of work to support a broad number of devices. It might be possible when we stop supporting i386 or if someone volunteers to work on the ARM port.  
>  Eventually, I think most hobby systems will need to run ARM chips. Intels planning on locking down hardware with UEFI 3 and this may make it difficult to run on commodity hardware in the future not only for MidnightBSD but other systems as well.  
>  At one point, MidinightBSD ran on sparc64. When workstations were killed off, we dropped support. A desktop OS on a server platform makes little sense.
>
>
>
> Its FOSS: Does MidnightBSD offer support for Linux applications?
>
>
>
> Lucas Holt: Yes, we offer Linux emulation. Its emulating a 2.6.16 kernel currently and that needs to be updated so support newer apps. Its possible to run semi-recent versions of Firefox, Thunderbird, Java, and OpenOffice on it though. Ive also used it to host game servers in the past and play older games such as Quake 3, enemy territory, etc.
>
>
>
> Its FOSS: Could you comment on the recent dust-up between the Pale Moon browser developers and the team behind the OpenBSD ports system?
>
>

* [Authors Note: For those who havent heard about this, let me summarize. Last month, someone from the OpenBSD team added the Pale Moon browser to their ports collection. A Pale Moon developer demanded that they include Pale Moons libraries instead of using system libraries. As the conversation continued, it got more hostile, especially on the Pale Moon side. The net result is that Pale Moon will not be available on OpenBSD, MidnightBSD, or FreeBSD.]

>
>
> Lucas Holt: I found this discussion frustrating. Many of the BSD projects hear a lot of complaints about browser availability and compatibility. With Firefox moving to Rust, it makes it even more difficult. Then you get into branding issues. Like Firefox, the Pale Moon developers have decided to protect their brand at the cost of users. Unlike the Firefox devs, theyve made even stranger requirements for branding. It is not possible to use a system library version of anything with Pale Moon and keep their branding requirements. As such, we cannot offer Pale Moon in MidnightBSD.  
>  The reason this is an issue for an open source project is that many third party libraries are used in something as complex as a web browser. For instance, Gecko-based browsers use several multimedia libraries, sqlite3 (for bookmarks), audio and video codecs, etc. Trying to maintain upstream patches for each of these items is difficult. Thats why the BSDs have ports collections to begin with. It allows us to track and manage custom patches to make all these libraries work. We go through a lot of effort in keeping these up to date. Sometimes upstream patches dont get included. That means our versions are the only working copies. With pale moons policy, wed need to submit separate patches to their customized versions of all these libraries too and any new release of the browser would not be available as changes occur. It might not even be possible to compile pale moon without a patch locally.  
>  With regard to Rust, it requires porting the language, as well as an appropriate version of LLVM before you can even start on the browser.
>
>
>
> Its FOSS: If someone wanted to contribute to your project, both financial and technical, how can they do that?
>
>
>
> Lucas Holt: Financial assistance for the project can be submitted online. We have a page outlining how to make donations with Patreon, Paypal or via bitcoin. Donations are not tax deductible. You can learn more at [http://www.midnightbsd.org/donate/](http://www.midnightbsd.org/donate/)  
>  We also need assistance with translations, porting applications, and working on the actual OS. Interested parties can contact us on the mailing list or through IRC on freenode #midnightbsd We also could use assistance with mirroring ISOs and packages.
>
>
>
> I would like to thank Lucas for taking the time to reply to my many questions. For more information about MidnightBSD or to download it, please visit their website. The most recent version of MidnightBSD is 0.8.6.
>
>

---

News Roundup
----------

### [8 months with TrueOS](https://inflo.ws/blog/post/2018-03-03-trueos-8th-month-review/) ###

* Purpose of this review - what it is and what it is not.

>
>
> I vowed to write down what I felt about TrueOS if I ever got to the six month mark of usage. This is just that. This is neither a tutorial, nor a piece of evangelism dedicated towards it.
>
>
>
> This is also not a review of specific parts of TrueOS such as Lumina or AppCafe, since I don't use them at all.
>
>
>
> In the spirit of presenting a screen shot, here is my i3wm displaying 4 windows in one screen - a configuration that I never use. [https://inflo.ws/blog/images/trues-screenshot.png](https://inflo.ws/blog/images/trues-screenshot.png)
>
>

* The primary tasks I get done with my computer.

>
>
> I need a tiling wm with multi-desktop capability. As regards what I do with a computer, it is fairly straightforward to describe if I just list down my most frequently used applications.
>
>

```
xterm (CLI)
Emacs (General editing and org mode)
Intellij IDEA (Java, Kotlin, SQL)
Firefox (Main web browser, with Multi-Account Containers)
Thunderbird (Work e-mail)
Notmuchmail (Personal e-mail)
Chromium/Iridium (Dumb web browser)
Telegram Desktop
weechat (with wee-slack)
cmus (Music player)
mpv (Video player)
mps-youtube (Youtube client)
transmission-gtk
Postgresql10 (daemon)
Rabbitmq (daemon)
Seafile (file sync)
Shotwell (manage pictures)
GIMP (Edit pictures)
Calibre (Manage e-books)
VirtualBox

```

>
>
> All of these are available as binary packages from the repository. Since I use Intellij Ultimate edition, I decided to download the no-jdk linux version from the website rather than install it. This would make sure that it gets updated regularly.
>
>

* Why did I pick TrueOS ?

>
>
> I ran various Linux distributions from 2001 all the way till 2009, till I discovered Arch, and continued with it till 2017. I tried out Void for two months before I switched to TrueOS.
>
>
>
> Over the last few years, I started feeling like no matter which Linux distribution I touched, they all just stopped making a lot of sense. Generally in the way things were organised, and particularly in terms of software like systemd, which just got pushed down my throat. I couldn't wrap my head around half the things going on in my computer.
>
>
>
> Mostly I found that Linux distributions stopped becoming a collection of applications that got developed together to something more coupled by software mechanisms like systemd - and that process was more and more opaque. I don't want to talk about the merits and de-merits of systemd, lets just say that I found it of no use and an unnecessary hassle.
>
>
>
> In February, I found myself in charge of the entire technology stack of a company, and I was free to make choices. A friend who was a long time FreeBSD user convinced me to try it on the servers. My requirement then was to run Postgres, Rabbitmq, Nginx and a couple of JVM processes. The setup was zero hassle and it hasn't changed much in a year.
>
>
>
> About three months of running FreeBSD-11.x on servers was enough for me to consider it for my laptop. I was very apprehensive of hardware support, but luckily my computer is a Thinkpad, and Thinkpads sort of work out of the box with various BSDs.
>
>
>
> My general requirements were:
>
>

* Must run Intellij IDEA.
* Must have proper graphics and sound driver support.
* Must be able to run VirtualBox.

>
>
> I had to pick from FreeBSD, NetBSD and OpenBSD, since these were the major BSDs that I was familiar with. One of my requirements was that I needed to be able to run VMs just in case I needed to test something on Windows/Linux. This ruled out OpenBSD. Then I was left with NetBSD and FreeBSD. NetBSD's driver support for newer Intel chip-sets were questionable, and FreeBSD was the only choice then.
>
>
>
> When I was digging through FreeBSD forums, I found out that running the 11.x RELEASE on my laptop was out of the question since it didn't have proper drivers for my chip-set either.
>
>
>
> A few more hours of digging led me to GhostBSD and TrueOS. I picked TrueOS straightaway because - well because TrueOS came from the old PC-BSD and it was built off FreeBSD-12-CURRENT with the latest drivers integrated.
>
>
>
> I downloaded the UNSTABLE version available in June 2017, backed up ALL my data and home directory, and then installed it. There were no glitches during installation - I simply followed the installation as described in the handbook and everything was fine.
>
>
>
> My entire switch from Arch/Void to TrueOS took about an hour, discounting the time it took to backup my data to an external hard disk. It was that easy. Everything I wanted to work just worked, everything was available in the repo.
>
>
>
> Tweaks from cooltrainer.org : I discovered this excellent tutorial that describes setting up a FreeBSD 11 desktop. It documents several useful tweaks, some of which I applied. A few examples - Fonts, VirtualBox, Firewall, UTF-8 sections.
>
>

* TrueOS (and FreeBSD) specific things I liked

  * Open-rc

>
>
> The open-rc init system is familiar and is well documented.  
>  TrueOS specific parts are described here.  
>  When I installed postgresql10-server, there was no open-rc script for it, but I could cobble one together in two hours with zero prior experience writing init scripts. Later on I figured out that the init script for postgresql9 would work for 10 as well, and used that.
>
>

* Boot Environments

>
>
> This was an alien concept to me, but the first time I did an update without waiting for a CDN sync to finish, my computer booted into the shell and remained there. The friendly people at TrueOS discourse asked me to roll back to an older BE and wait for sync to finish.  
>  I dug through the forums and found "ZFS / Snapshots basics & How-Tos for those new to TrueOS". This describes ZFS and BEs, and is well worth reading.
>
>

* ZFS

>
>
> My experience with boot environments was enough to convince me about the utility of ZFS. I am still reading about it and trying things out, and whatever I read just convinces me more about why it is good.
>
>

* File-system layout

>
>
> Coming from the Linux world, how the FreeBSD file-system is laid out seemed odd at first. Then I realised that it was the Linux distros that were doing the odd thing. e.g : The whole OS is split into base system and applications. All the non base system configurations and apps go into /usr/local. That made a lot of sense.  
>  The entire OS is developed along with its applications as a single coherent entity, and that shows.
>
>

* Documentation

>
>
> The handbooks for both TrueOS and FreeBSD are really really good. For e.g, I kept some files in an LUKS encrypted drive (when I used Arch Linux). To find an equivalent, all I had to do was read the handbook and look at the GELI section. It is actually nice being able to go to a source like Handbook and things from there just work.  
>  Arch Linux and Gentoo has excellent documentation as well, if anyone is wondering about Linux distros.
>
>

* Community

>
>
> The TrueOS community on both Telegram as well as on Discourse are very friendly and patient. They help out a lot and do not get upset when I pose really stupid questions. TrueOS core developers hangout in the Telegram chat-room too, and it is nice being able to talk to them directly about things.
>
>

* What did not work in TrueOS ?

>
>
> The following things that worked during my Linux tenure doesn't work in TrueOS.
>
>

* Netflix
* Google Hangouts
* Electron based applications (Slack, Skype)

>
>
> These are not major concerns for the kind of work I do, so it doesn't bother me much. I run a WinXP VM to play some old games, and a Bunsenlabs installation for Linux things like Hangouts/Netflix.
>
>
>
> I don't have a video calling system setup in TrueOS because I use my phone for both voice and video calls exclusively.
>
>

* Why am I staying on TrueOS ?

>
>
> Great community - whether on Discourse or on the telegram channel, the people make you feel welcome. If things go unanswered, someone will promise to work on it/file a bug/suggest work-arounds.
>
>
>
> Switching to TrueOS was philosophical as well - I thought a lot more about licenses, and I have arrived at the conclusion that I like BSD more than GPL. I believe it is a more practical license.
>
>
>
> I believe TrueOS is improving continuously, and is a great desktop UNIX if you put some time into it.
>
>

---

### [AsiaBSDCon 2016 videos now available](https://www.youtube.com/playlist?list=PLnTFqpZk5ebD-FfVScL-x6ZnZSecMA1jI) ###

* The videos from AsiaBSDCon 2016 have been posted to youtube, 30 videos in all
* Well cover the videos from 2017 next week
* The videos from 2018 should be posted in 4-6 weeks
* I are working on a new version of [https://papers.freebsd.org/](https://papers.freebsd.org/) that will make it easier to find the papers, slides, and videos of all talks related to FreeBSD \*\*\*

### [syspatches will be provided for both supported releases](https://undeadly.org/cgi?action=article;sid=20180307234243) ###

>
>
> Good news for people doing upgrades only once per year: syspatches will be provided for both supported releases. The commit from T.J. Townsend (tj@) speaks for itself:
>
>

```
Subject:    CVS: cvs.openbsd.org: www
From:       T.J. Townsend <tj () openbsd ! org>
Date:       2018-03-06 22:09:12

CVSROOT:    /cvs
Module name:    www
Changes by: tj@cvs.openbsd.org  2018/03/06 15:09:12

Modified files:
    .              : errata61.html stable.html
    faq            : faq10.html

Log message:
syspatches will now be provided for both supported releases.

```

>
>
> Thanks to all the developers involved in providing these!
>
>

* Update: An official announcement has been released:

```
I'm happy to announce that we are now able to provide two releases worth
of syspatches on the amd64 and i386 platforms. The binary patches for
6.1 will hit the mirrors shortly, so you will be able to catch up with
the errata on

   https://www.openbsd.org/errata61.html

using the syspatch utility. People running amd64 will thus get the
meltdown workaround.

This means in particular that 6.2 will remain supported by syspatch when
6.3 comes out.

Thanks to robert and ajacoutot for their amazing work on syspatch and
for all their help. Thanks also to tj and the volunteers from #openbsd
for their timely tests and of course to Theo for overseeing it all.

```

---

### [Exploring permutations and a mystery with BSD and GNU split filenames](https://www.lorainekv.com/permutations_split_and_gsplit/) ###

>
>
> Recently, I was playing around with the split command-line tool on Mac OS X, and I decided to chop a 4000-line file into 4000 separate single-line files. However, when I attempted to run split -l1, I ran into a funny error:
>
>

`split: too many files`

>
>
> Curious to see if any splitting had occurred, I ran ls and sure enough, a huge list of filenames appeared, such as:
>
>

```
xaa
xab
...
xzy
xzz

```

>
>
> Now I could see why you'd run out of unique filenames - there are only 26 letters in the alphabet and these filenames were only three letters long. Also, they all seemed to begin with the letter "x".
>
>

* BSD split's filename defaults

>
>
> I checked the manual for split's defaults and confirmed what I was seeing:
>
>
>
> each file into which the file is split is named by the prefix followed by a lexically ordered suffix using suffix\_length characters in the range 'a-z'. If -a is not specified, two letters are used as the suffix....with the prefix 'x' and with suffixes as above.
>
>
>
> Got it, so running split with the defaults for prefix name and suffix length will give me filenames that always start with the letter "x" followed by two-letter alphabetical permutations composed of a-z letters, with repeats allowed. I say "repeats allowed" because I noticed filenames such as xaa and xbb in the output.
>
>
>
> Side node: The reason why I say "permutations" rather than "combinations" is because letter order matters. For example, xab and xba are two distinct and legitimate filenames. Here's a nice explanation about the difference between permutations and combinations.
>
>

* Some permutation math

>
>
> So how many filenames can you get from the BSD split tool using the defaults? There are permutation formulas out there for repeating values and non-repeating values. Based on split's behavior, I wanted to use the repeating values formula:
>
>
>
> n<sup>r</sup> where n equals the number of possible values (26 for a-z) and r equals the number of values (2, since there are only 2 letters after "x" in the filename).
>
>
>
> 26<sup>2</sup> = 676
>
>
>
> So the total number of filename permutations allowed with BSD split's defaults should be 676.
>
>
>
> To double check, I ran ls | wc -l to get the total number of files in my split\_test directory. The output was 677. If you subtract my original input file, input.txt, then you have 676, or the number of permutations split would allow before running out of filenames!
>
>
>
> Neat. But I still wanted my 4000 files.
>
>

* Moar permutations pls

>
>
> While 26<sup>2</sup> permutations doesn't support 4000 different filenames, I wondered if I could increase r to 3. Then, I'd have 17,576 different filename permutations to play with - more than enough.
>
>
>
> Earlier, I remembered the manual mentioning suffix length:
>
>
>
> \-a suffix\_length  
>  Use suffix\_length letters to form the suffix of the file name.
>
>
>
> So I passed 3 in with the -a flag and guess what? I got my 4000 files!
>
>

```
split -l1 -a3 input.txt
ls | wc -l
4001

```

>
>
> But that was a lot of work. It would be great if split would just handle these permutations and suffix lengths by default!
>
>
>
> In fact, I vaguely remember splitting large files into smaller ones with numerical filenames, which I prefer. I also remember not having to worry about suffixes in the past. But numerical filenames didn't seem to be an option with split installed on Mac OS X - there was no mention of it in the manual.
>
>
>
> Turns out that I was remembering GNU split from using the Debian OS two years ago, a different flavor of the split tool with different defaults and behaviors.
>
>

---

Beastie Bits
----------

[Michael Lucas is speaking at mug.org 10 April 2018](https://blather.michaelwlucas.com/archives/3121)  
[PkgsrcCon 2018 July 7+8 Berlin](http://pkgsrc.org/pkgsrcCon/2018/)  
[Tint2 rocks](http://www.vincentdelft.be/post/post_20180310)  
[Open Source Summit Europe 2018 Call for Proposals](https://www.freebsdfoundation.org/news-and-events/call-for-papers/open-source-summit-europe-2018-call-for-proposals/)  
[Travel Grants for BSDCan 2018](https://www.freebsdfoundation.org/blog/bsdcan-2018-travel-grant-application-now-open/)  
[BSDCan 2018 FreeBSD Developers Summit Call for Proposals](https://www.freebsdfoundation.org/news-and-events/call-for-papers/bsdcan-2018-freebsd-developers-summit-call-for-proposals/)  
[OpenBSD vmm(4) update, by Mike Larkin](https://www.openbsd.org/papers/asiabsdcon2018-vmm-slides.pdf)

---

Feedback/Questions
----------

* [Morgan ZFS Install Question](http://dpaste.com/3NZN49P#wrap)

* [Andre - Splitting ZFS Array, or not](http://dpaste.com/3V09BZ5#wrap)

* [Jake - Python Projects](http://dpaste.com/2CY5MRE#wrap)

* [Dave - Screen Sharing & Video Conference](http://dpaste.com/257WGCB#wrap)

* [James - ZFS disk id switching](http://dpaste.com/3HAPZ90#wrap)

  ---