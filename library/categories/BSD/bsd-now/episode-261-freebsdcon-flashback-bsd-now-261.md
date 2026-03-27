+++
title = "Episode 261: FreeBSDcon Flashback | BSD Now 261"
description = 'Insight into TrueOS and Trident, stop evildoers with pf-badhost, Flashback to FreeBSDcon ‘99, OpenBSD’s measures against TLBleed, play Morrowind on OpenBSD in 5 steps, DragonflyBSD developers shocked at Threadripper performance, and more.\Headlines   \[An Insight into the Fu'
date = "2018-08-30T07:00:00Z"
url = "https://www.bsdnow.tv/261"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.716605826Z"
seen = false
+++

Insight into TrueOS and Trident, stop evildoers with pf-badhost, Flashback to FreeBSDcon ‘99, OpenBSD’s measures against TLBleed, play Morrowind on OpenBSD in 5 steps, DragonflyBSD developers shocked at Threadripper performance, and more.

\##Headlines  
 \###[An Insight into the Future of TrueOS BSD and Project Trident](https://itsfoss.com/project-trident-interview/)

>
>
> Last month, TrueOS announced that they would be spinning off their desktop offering. The team behind the new project, named Project Trident, have been working furiously towards their first release. They did take a few minutes to answer some of our question about Project Trident and TrueOS. I would like to thank JT and Ken for taking the time to compile these answers.
>
>

* It’s FOSS: What is Project Trident?

>
>
> Project Trident: Project Trident is the continuation of the TrueOS Desktop. Essentially, it is the continuation of the primary “TrueOS software” that people have been using for the past 2 years. The continuing evolution of the entire TrueOS project has reached a stage where it became necessary to reorganize the project. To understand this change, it is important to know the history of the TrueOS project.
>
>

>
>
> Originally, Kris Moore created PC-BSD. This was a Desktop release of FreeBSD focused on providing a simple and user-friendly graphical experience for FreeBSD. PC-BSD grew and matured over many years. During the evolution of PC-BSD, many users began asking for a server focused version of the software. Kris agreed, and TrueOS was born as a scaled down server version of PC-BSD. In late 2016, more contributors and growth resulted in significant changes to the PC-BSD codebase. Because the new development was so markedly different from the original PC-BSD design, it was decided to rebrand the project.
>
>

>
>
> TrueOS was chosen as the name for this new direction for PC-BSD as the project had grown beyond providing only a graphical front to FreeBSD and was beginning to make fundamental changes to the FreeBSD operating system. One of these changes was moving PC-BSD from being based on each FreeBSD Release to TrueOS being based on the active and less outdated FreeBSD Current. Other major changes are using OpenRC for service management and being more aggressive about addressing long-standing issues with the FreeBSD release process. TrueOS moved toward a rolling release cycle, twice a year, which tested and merged FreeBSD changes directly from the developer instead of waiting months or even years for the FreeBSD review process to finish. TrueOS also deprecated and removed obsolete technology much more regularly.
>
>

>
>
> As the TrueOS Project grew, the developers found these changes were needed by other FreeBSD-based projects. These projects began expressing interest in using TrueOS rather than FreeBSD as the base for their project. This demonstrated that TrueOS needed to again evolve into a distribution framework for any BSD project to use. This allows port maintainers and source developers from any BSD project to pool their resources and use the same source repositories while allowing every distribution to still customize, build, and release their own self-contained project. The result is a natural split of the traditional TrueOS team. There were now naturally two teams in the TrueOS project: those working on the build infrastructure and FreeBSD enhancements – the “core” part of the project, and those working on end-user experience and utility – the “desktop” part of the project.
>
>

>
>
> When the decision was made to formally split the projects, the obvious question that arose was what to call the “Desktop” project. As TrueOS was already positioned to be a BSD distribution platform, the developers agreed the desktop side should pick a new name. There were other considerations too, one notable being that we were concerned that if we continued to call the desktop project “TrueOS Desktop”, it would prevent people from considering TrueOS as the basis for their distribution because of misconceptions that TrueOS was a desktop-focused OS. It also helps to “level the playing field” for other desktop distributions like GhostBSD so that TrueOS is not viewed as having a single “blessed” desktop version.
>
>

* It’s FOSS: What features will TrueOS add to the FreeBSD base?

>
>
> Project Trident: TrueOS has already added a number of features to FreeBSD:  
>  OpenRC replaces rc.d for service management  
>  LibreSSL in base  
>  Root NSS certificates out-of-box  
>  Scriptable installations (pc-sysinstall)  
>  The full list of changes can be seen on the TrueOS repository ([https://github.com/trueos/trueos/blob/trueos-master/README.md](https://github.com/trueos/trueos/blob/trueos-master/README.md)). This list does change quite regularly as FreeBSD development itself changes.
>
>

* It’s FOSS: I understand that TrueOS will have a new feature that will make creating a desktop spin of TrueOS very easy. Could you explain that new feature?

>
>
> Project Trident: Historically, one of the biggest hurdles for creating a desktop version of FreeBSD is that the build options for packages are tuned for servers rather than desktops. This means a desktop distribution cannot use the pre-built packages from FreeBSD and must build, use, and maintain a custom package repository. Maintaining a fork of the FreeBSD ports tree is no trivial task. TrueOS has created a full distribution framework so now all it takes to create a custom build of FreeBSD is a single JSON manifest file. There is now a single “source of truth” for the source and ports repositories that is maintained by the TrueOS team and regularly tagged with “stable” build markers. All projects can use this framework, which makes updates trivial.
>
>

* It’s FOSS: Do you think that the new focus of TrueOS will lead to the creation of more desktop-centered BSDs?

>
>
> Project Trident: That is the hope. Historically, creating a desktop-centered BSD has required a lot of specialized knowledge. Not only do most people not have this knowledge, but many do not even know what they need to learn until they start troubleshooting. TrueOS is trying to drastically simplify this process to enable the wider Open Source community to experiment, contribute, and enjoy BSD-based projects.
>
>

* It’s FOSS: What is going to happen to TrueOS Pico? Will Project Trident have ARM support?

>
>
> Project Trident: Project Trident will be dependent on TrueOS for ARM support. The developers have talked about the possibility of supporting ARM64 and RISC-V architectures, but it is not possible at the current time. If more Open Source contributors want to help develop ARM and RISC-V support, the TrueOS project is definitely willing to help test and integrate that code.
>
>

* It’s FOSS: What does this change (splitting Trus OS into Project Trident) mean for the Lumina desktop environment?

>
>
> Project Trident: Long-term, almost nothing. Lumina is still the desktop environment for Project Trident and will continue to be developed and enhanced alongside Project Trident just as it was for TrueOS. Short-term, we will be delaying the release of Lumina 2.0 and will release an updated version of the 1.x branch (1.5.0) instead. This is simply due to all the extra overhead to get Project Trident up and running. When things settle down into a rhythm, the development of Lumina will pick up once again.
>
>

* It’s FOSS: Are you planning on including any desktop environments besides Lumina?

>
>
> Project Trident: While Lumina is included by default, all of the other popular desktop environments will be available in the package repo exactly as they had been before.
>
>

* It’s FOSS: Any plans to include Steam to increase the userbase?

>
>
> Project Trident: Steam is still unavailable natively on FreeBSD, so we do not have any plans to ship it out of the box currently. In the meantime, we highly recommend installing the Windows version of Steam through the PlayOnBSD utility.
>
>

* It’s FOSS: What will happen to the AppCafe?

>
>
> Project Trident: The AppCafe is the name of the graphical interface for the “pkg” utility integrated into the SysAdm client created by TrueOS. This hasn’t changed. SysAdm, the graphical client, and by extension AppCafe are still available for all TrueOS-based distributions to use.
>
>

* It’s FOSS: Does Project Trident have any corporate sponsors lined up? If not, would you be open to it or would you prefer that it be community supported?

>
>
> Project Trident: iXsystems is the first corporate sponsor of Project Trident and we are always open to other sponsorships as well. We would prefer smaller individual contributions from the community, but we understand that larger project needs or special-purpose goals are much more difficult to achieve without allowing larger corporate sponsorships as well. In either case, Project Trident is always looking out for the best interests of the community and will not allow intrusive or harmful code to enter the project even if a company or individual tries to make that code part of a sponsorship deal.
>
>

* It’s FOSS: BSD always seems to be lagging in terms of support for newer devices. Will TrueOS be able to remedy that with a quicker release cycle?

>
>
> Project Trident: Yes! That was a primary reason for TrueOS to start tracking the CURRENT branch of FreeBSD in 2016. This allows for the changes that FreeBSD developers are making, including new hardware support, to be available much sooner than if we followed the FreeBSD release cycle.
>
>

* It’s FOSS: Do you have any idea when Project Trident will have its first release?

>
>
> Project Trident: Right now we are targeting a late August release date. This is because Project Trident is “kicking the wheels” on the new TrueOS distribution system. We want to ensure everything is working smoothly before we release. Going forward, we plan on having regular package updates every week or two for the end-user packages and a new release of Trident with an updated OS version every 6 months. This will follow the TrueOS release schedule with a small time offset.
>
>

---

\###[pf-badhost: Stop the evil doers in their tracks!](https://www.geoghegan.ca/pfbadhost.html)

>
>
> pf-badhost is a simple, easy to use badhost blocker that uses the power of the pf firewall to block many of the internet’s biggest irritants. Annoyances such as ssh bruteforcers are largely eliminated. Shodan scans and bots looking for webservers to abuse are stopped dead in their tracks. When used to filter outbound traffic, pf-badhost blocks many seedy, spooky malware containing and/or compromised webhosts.  
>  Filtering performance is exceptional, as the badhost list is stored in a pf table. To quote the OpenBSD FAQ page regarding tables: “the lookup time on a table holding 50,000 addresses is only slightly more than for one holding 50 addresses.”  
>  pf-badhost is simple and powerful. The blocklists are pulled from quality, trusted sources. The ‘Firehol’, ‘Emerging Threats’ and ‘Binary Defense’ block lists are used as they are popular, regularly updated lists of the internet’s most egregious offenders. The [pf-badhost.sh](http://pf-badhost.sh) script can easily be expanded to use additional or alternate blocklists.  
>  pf-badhost works best when used in conjunction with unbound-adblock for the ultimate badhost blocking.
>
>

* Notes:
* If you are trying to run pf-badhost on a LAN or are using NAT, you will want to add a rule to your pf.conf appearing BEFORE the pf-badhost rules allowing traffic to and from your local subnet so that you can still access your gateway and any DNS servers.
* Conversely, adding a line to [pf-badhost.sh](http://pf-badhost.sh) that removes your subnet range from the \<pfbadhost\> table should also work. Just make sure you choose a subnet range / CIDR block that is actually in the list. 192.168.0.0/16, 172.16.0.0/12 and 10.0.0.0/8 are the most common home/office subnet ranges.

---

**DigitalOcean**  
[https://do.co/bsdnow](https://do.co/bsdnow)

\###[FLASHBACK: FreeBSDCon’99: Fans of Linux’s lesser-known sibling gather for the first time](http://edition.cnn.com/TECH/computing/9911/01/freebsd.con99.idg/)

>
>
> FreeBSD, a port of BSD Unix to Intel, has been around almost as long as Linux has – but without the media hype. Its developer and user community recently got a chance to get together for the first time, and they did it in the city where BSD – the Berkeley Software Distribution – was born some 25 years ago.  
>  October 17, 1999 marked a milestone in the history of FreeBSD – the first FreeBSD conference was held in the city where it all began, Berkeley, CA. Over 300 developers, users, and interested parties attended from around the globe.  
>  This was easily 50 percent more people than the conference organizers had expected. This first conference was meant to be a gathering mostly for developers and FreeBSD advocates. The turnout was surprisingly (and gratifyingly) large.  
>  In fact, attendance exceeded expectations so much that, for instance, Kirk McKusick had to add a second, identical tutorial on FreeBSD internals, because it was impossible for everyone to attend the first!  
>  But for a first-ever conference, I was impressed by how smoothly everything seemed to go. Sessions started on time, and the sessions I attended were well-run; nothing seemed to be too cold, dark, loud, late, or off-center.  
>  Of course, the best part about a conference such as this one is the opportunity to meet with other people who share similar interests. Lunches and breaks were a good time to meet people, as was the Tuesday night beer bash.  
>  The Wednesday night reception was of a type unusual for the technical conferences I usually attend – a three-hour Hornblower dinner cruise on San Francisco Bay. Not only did we all enjoy excellent food and company, but we all got to go up on deck and watch the lights of San Francisco and Berkeley as we drifted by. Although it’s nice when a conference attracts thousands of attendees, there are some things that can only be done with smaller groups of people; this was one of them.  
>  In short, this was a tiny conference, but a well-run one.
>
>

* Sessions

>
>
> Although it was a relatively small conference, the number and quality of the sessions belied the size. Each of the three days of the conference featured a different keynote speaker. In addition to Jordan Hubbard, Jeremy Allison spoke on “Samba Futures” on day two, and Brian Behlendorf gave a talk on “FreeBSD and Apache: A Perfect Combo” to start off the third day.  
>  The conference sessions themselves were divided into six tracks: advocacy, business, development, networking, security, and panels. The panels track featured three different panels, made up of three different slices of the community: the FreeBSD core team, a press panel, and a prominent user panel with representatives from such prominent commercial users as Yahoo! and USWest.  
>  I was especially interested in Apple Computer’s talk in the development track. Wilfredo Sanchez, technical lead for open source projects at Apple (no, that’s not an oxymoron!) spoke about Apple’s Darwin project, the company’s operating system road map, and the role of BSD (and, specifically, FreeBSD) in Apple’s plans.  
>  Apple and Unix have had a long and uneasy history, from the Lisa through the A/UX project to today. Personally, I’m very optimistic about the chances for the Darwin project to succeed. Apple’s core OS kernel team has chosen FreeBSD as its reference platform. I’m looking forward to what this partnership will bring to both sides.  
>  Other development track sessions included in-depth tutorials on writing device drivers, basics of the Vinum Volume Manager, Fibre Channel, development models (the open repository model), and the FreeBSD Documentation Project (FDP). If you’re interested in contributing to the FreeBSD project, the FDP is a good place to start.  
>  Advocacy sessions included “How One Person Can Make a Difference” (a timeless topic that would find a home at any technical conference!) and “Starting and Managing A User Group” (trials and tribulations as well as rewards).  
>  The business track featured speakers from three commercial users of FreeBSD: Cybernet, USWest, and Applix. Applix presented its port of Applixware Office for FreeBSD and explained how Applix has taken the core services of Applixware into open source.  
>  Commercial applications and open source were once a rare combination; we can only hope the trend away from that state of affairs will continue.
>
>

* Commercial use of FreeBSD

>
>
> The use of FreeBSD in embedded applications is increasing as well – and it is increasing at the same rate that hardware power is. These days, even inexpensive systems are able to run a BSD kernel.  
>  The BSD license and the solid TCP/IP stack prove significant enticements to this market as well. (Unlike the GNU Public License, the BSD license does not require that vendors make derivative works open source.)  
>  Companies such as USWest and Verio use FreeBSD for a wide variety of different Internet services.  
>  Yahoo! and Hotmail are examples of companies that use FreeBSD extensively for more specific purposes. Yahoo!, for example, has many hundreds of FreeBSD boxes, and Hotmail has almost 2000 FreeBSD machines at its data center in the San Francisco Bay area.  
>  Hotmail is owned by Microsoft, so the fact that it runs FreeBSD is a secret. Don’t tell anyone…  
>  When asked to comment on the increasing commercial interest in BSD, Hubbard said that FreeBSD is learning the Red Hat lesson. “Walnut Creek and others with business interests in FreeBSD have learned a few things from the Red Hat IPO,” he said, “and nobody is just sitting around now, content with business as usual. It’s clearly business as unusual in the open source world today.”  
>  Hubbard had also singled out some of BSD’s commercial partners, such as Whistle Communications, for praise in his opening day keynote. These partners play a key role in moving the project forward, he said, by contributing various enhancements and major new systems, such as Netgraph, as well as by contributing paid employee time spent on FreeBSD.  
>  Even short FreeBSD-related contacts can yield good results, Hubbard said. An example of this is the new jail() security code introduced in FreeBSD 3.x and 4.0, which was contributed by R & D Associates. A number of ISPs are also now donating the hardware and bandwidth that allows the project to provide more resource mirrors and experimental development sites.
>
>

* See you next year

>
>
> And speaking of corporate sponsors, thanks go to Walnut Creek for sponsoring the conference, and to Yahoo! for covering all the expenses involved in bringing the entire FreeBSD core team to Berkeley.  
>  As a fan of FreeBSD, I’m happy to see that the project has finally produced a conference. It was time: many of the 16 core team members had been working together on a regular basis for nearly seven years without actually meeting face to face.  
>  It’s been an interesting year for open source projects. I’m looking forward to the next year – and the next BSD conference – to be even better.
>
>

---

\##News Roundup  
 \###[OpenBSD Recommends: Disable SMT/Hyperthreading in all Intel BIOSes](https://marc.info/?l=openbsd-tech&m=153504937925732&w=2)

```
Two recently disclosed hardware bugs affected Intel cpus:

     - TLBleed

     - T1TF (the name "Foreshadow" refers to 1 of 3 aspects of this
             bug, more aspects are surely on the way)

Solving these bugs requires new cpu microcode, a coding workaround,
*AND* the disabling of SMT / Hyperthreading.

SMT is fundamentally broken because it shares resources between the two
cpu instances and those shared resources lack security differentiators.
Some of these side channel attacks aren't trivial, but we can expect
most of them to eventually work and leak kernel or cross-VM memory in
common usage circumstances, even such as javascript directly in a
browser.

There will be more hardware bugs and artifacts disclosed.  Due to the
way SMT interacts with speculative execution on Intel cpus, I expect SMT
to exacerbate most of the future problems.

A few months back, I urged people to disable hyperthreading on all
Intel cpus.  I need to repeat that:

    DISABLE HYPERTHREADING ON ALL YOUR INTEL MACHINES IN THE BIOS.

Also, update your BIOS firmware, if you can.

OpenBSD -current (and therefore 6.4) will not use hyperthreading if it
is enabled, and will update the cpu microcode if possible.

But what about 6.2 and 6.3?

The situation is very complex, continually evolving, and is taking too
much manpower away from other tasks.  Furthermore, Intel isn't telling
us what is coming next, and are doing a terrible job by not publically
documenting what operating systems must do to resolve the problems.  We
are having to do research by reading other operating systems.  There is
no time left to backport the changes -- we will not be issuing a
complete set of errata and syspatches against 6.2 and 6.3 because it is
turning into a distraction.

Rather than working on every required patch for 6.2/6.3, we will
re-focus manpower and make sure 6.4 contains the best solutions
possible.

So please try take responsibility for your own machines: Disable SMT in
the BIOS menu, and upgrade your BIOS if you can.

I'm going to spend my money at a more trustworthy vendor in the future.

```

---

\###[Get Morrowind running on OpenBSD in 5 simple steps](https://medium.com/@enzuru/get-morrowind-running-on-openbsd-in-5-simple-steps-b65e20f3f0c)

>
>
> This article contains brief instructions on how to get one of the greatest Western RPGs of all time, The Elder Scrolls III: Morrowind, running on OpenBSD using the OpenMW open source engine recreation. These instructions were tested on a ThinkPad X1 Carbon Gen 3. The information was adapted from this OpenMW forum thread: [https://forum.openmw.org/viewtopic.php?t=3510](https://forum.openmw.org/viewtopic.php?t=3510)
>
>

* 1. Purchase and download the DRM-free version from GOG (also considered the best version due to the high quality PDF guide that it comes with): [https://www.gog.com/game/the\_elder\_scrolls\_iii\_morrowind\_goty\_edition](https://www.gog.com/game/the_elder_scrolls_iii_morrowind_goty_edition)

* 1. Install the required packages built from the ports tree as root. openmw is the recreated game engine, and innoextract is how we will get the game data files out of the win32 executable.

`pkg_add openmw innoextract`

* 1. Move the file from GOG setup\_tes\_morrowind\_goty\_2.0.0.7.exe into its own directory morrowind/ due to innoextract’s default behaviour of extracting into the current directory. Then type:

`innoextract setup_tes_morrowind_goty_2.0.0.7.exe`

* 1. Type openmw-wizard and follow the straightforward instructions. Note that you have a pre-existing installation, and select the morrowind/app/Data Files folder that innoextract extracted.

* 1. Type in openmw-launcher, toggle the settings to your preferences, and then hit play!

---

**iXsystems**  
[https://twitter.com/allanjude/status/1034647571124367360](https://twitter.com/allanjude/status/1034647571124367360)

\###[My First Clang Bug](https://euroquis.nl/bobulate/?p=1937)

>
>
> Part of the role of being a packager is compiling lots (and lots) of packages. That means compiling lots of code from interesting places and in a variety of styles. In my opinion, being a good packager also means providing feedback to upstream when things are bad. That means filing upstream bugs when possible, and upstreaming patches.  
>  One of the “exciting” moments in packaging is when tools change. So each and every major CMake update is an exercise in recompiling 2400 or more packages and adjusting bits and pieces. When a software project was last released in 2013, adjusting it to modern tools can become quite a chore (e.g. Squid Report Generator). CMake is excellent for maintaining backwards compatibility, generally accommodating old software with new policies. The most recent 3.12 release candidate had three issues filed from the FreeBSD side, all from fallout with older software. I consider the hours put into good bug reports, part of being a good citizen of the Free Software world.  
>  My most interesting bug this week, though, came from one line of code somewhere in Kleopatra: Q\_UNUSED(gpgagent\_data);  
>  That one line triggered a really peculiar link error in KDE’s FreeBSD CI system. Yup … telling the compiler something is unused made it fall over. Commenting out that line got rid of the link error, but introduced a warning about an unused function. Working with KDE-PIM’s Volker Krause, we whittled the problem down to a six-line example program — two lines if you don’t care much for coding style. I’m glad, at that point, that I could throw it over the hedge to the LLVM team with some explanatory text. Watching the process on their side reminds me ever-so-strongly of how things work in KDE (or FreeBSD for that matter): Bugzilla, Phabricator, and git combine to be an effective workflow for developers (perhaps less so for end-users).  
>  Today I got a note saying that the issue had been resolved. So brief a time for a bug. Live fast. Get squashed young.
>
>

---

\###[DragonFlyBSD Now Runs On The Threadripper 2990WX, Developer Shocked At Performance](https://www.phoronix.com/scan.php?page=news_item&px=Threadripper-2990WX-DragonFly)

>
>
> Last week I carried out some tests of BSD vs. Linux on the new 32-core / 64-thread Threadripper 2990WX. I tested FreeBSD 11, FreeBSD 12, and TrueOS – those benchmarks will be published in the next few days. I tried DragonFlyBSD, but at the time it wouldn’t boot with this AMD HEDT processor. But now the latest DragonFlyBSD development kernel can handle the 2990WX and the lead DragonFly developer calls this new processor “a real beast” and is stunned by its performance potential.
>
>

>
>
> When I tried last week, the DragonFlyBSD 5.2.2 stable release nor DragonFlyBSD 5.3 daily snapshot would boot on the 2990WX. But it turns out Matthew Dillon, the lead developer of DragonFlyBSD, picked up a rig and has it running now. So in time for the next 5.4 stable release or those using the daily snapshots can have this 32-core / 64-thread Zen+ CPU running on this operating system long ago forked from FreeBSD.
>
>

>
>
> In announcing his success in bringing up the 2990WX under DragonFlyBSD, which required a few minor changes, he shared his performance thoughts and hopes for the rig. “The cpu is a real beast, packing 32 cores and 64 threads. It blows away our dual-core Xeon to the tune of being +50% faster in concurrent compile tests, and it also blows away our older 4-socket Opteron (which we call ‘Monster’) by about the same margin. It’s an impressive CPU. For now the new beast is going to be used to help us improve I/O performance through the filesystem, further SMP work (but DFly scales pretty well to 64 threads already), and perhaps some driver to work to support the 10gbe on the mobo.”
>
>

>
>
> Dillon shared some results on the system as well. " The Threadripper 2990WX is a beast. It is at *least* 50% faster than both the quad socket opteron and the dual socket Xeon system I tested against. The primary limitation for the 2990WX is likely its 4 channels of DDR4 memory, and like all Zen and Zen+ CPUs, memory performance matters more than CPU frequency (and costs almost no power to pump up the performance). That said, it still blow away a dual-socket Xeon with 3x the number of memory channels. That is impressive!"
>
>

>
>
> The well known BSD developer also added, “This puts the 2990WX at par efficiency vs a dual-socket Xeon system, and better than the dual-socket Xeon with slower memory and a power cap. This is VERY impressive. I should note that the 2990WX is more specialized with its asymetric NUMA architecture and 32 cores. I think the sweet spot in terms of CPU pricing and efficiency is likely going to be with the 2950X (16-cores/32-threads). It is clear that the 2990WX (32-cores/64-threads) will max out 4-channel memory bandwidth for many workloads, making it a more specialized part. But still awesome…This thing is an incredible beast, I’m glad I got it.”
>
>

>
>
> While I have the FreeBSD vs. Linux benchmarks from a few days ago, it looks like now on my ever growing TODO list will be re-trying out the newest DragonFlyBSD daily snapshot for seeing how the performance compares in the mix. Stay tuned for the numbers that should be in the next day or two.
>
>

---

\##Beastie Bits

* [X11 on really small devices](https://undeadly.org/cgi?action=article;sid=20180810075449)
* [mandoc-1.14.4 released](https://undeadly.org/cgi?action=article;sid=20180810131231)
* [The pfSense Book is now available to everyone](https://www.netgate.com/blog/pfSense-book-available-to-everyone.html)
* [MWL: Burn it down! Burn it all down!](https://mwl.io/archives/3619)
* [Configuring OpenBSD: System and user config files for a more pleasant laptop](https://github.com/begriffs/obsd)
* [FreeBSD Security Advisory: Resource exhaustion in TCP reassembly](https://www.freebsd.org/security/advisories/FreeBSD-SA-18:08.tcp.asc)
* [OpenBSD Foundation gets first 2018 Iridium donation](https://discoverbsd.com/p/92d80d1497)
* [New ZFS commit solves issue a few users reported in the feedback segment](https://svnweb.freebsd.org/base?view=revision&revision=337653)
* [Project Trident should have a beta release by the end of next week](https://twitter.com/TridentProject/status/1034620476553867264)
* [Reminder about Stockholm BUG: September 5, 17:30-22:00](https://www.meetup.com/BSD-Users-Stockholm/events/253447019/)
* [BSD-PL User Group: September 13, 18:30-21:00](https://bsd-pl.org/en)

---

**Tarsnap**

\##Feedback/Questions

* Malcom - [Having different routes per interface](http://dpaste.com/15VVVCP)
* Bostjan - [ZFS and integrity of data](http://dpaste.com/1Q14C6H#wrap)
* Michael - [Suggestion for Monitoring](http://dpaste.com/2JD17BP#wrap)
* Barry - [Feedback](http://dpaste.com/2GJ3RMG#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)