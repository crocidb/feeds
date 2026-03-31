+++
title = "230: Your questions, Part III"
description = "We provide you with updates to Spectre and Meltdown from various BSD projects, a review of TrueOS from Linux, how to set up FreeBSD on ThinkPad x240, and a whole bunch of beastie bits.This episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Op"
date = "2018-01-24T13:00:00Z"
url = "https://www.bsdnow.tv/230"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.798213573Z"
seen = true
+++

We provide you with updates to Spectre and Meltdown from various BSD projects, a review of TrueOS from Linux, how to set up FreeBSD on ThinkPad x240, and a whole bunch of beastie bits.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [KPTI patch lands in FreeBSD -current](https://svnweb.freebsd.org/base?view=revision&revision=328083) ###

* After a heroic effort by Konstantin Belousov [kib@FreeBSD.org](mailto:kib@FreeBSD.org), the first meltdown patch has landed in FreeBSD
* This creates separate page tables for the Kernel and userland, and switches between them when executions enters the kernel, and when it returns to userland
* It is currently off by default, but you are encouraged to test it, so it can be merged back to the release branches. Set vm.pmap.pti=1 in /boot/loader.conf
* The existing implementation of PCID (process-context identifiers), is not compatible with the new PTI code, and is disabled when PTI is enabled, decreasing performance. A future patch will use PCID in a way that is compatible with PTI.
* PCID allows the OS to annotate memory mappings to specific processes, so that they can be flushed selectively, and so that they are only used when in the context of that application.
* Once the developers are relatively confident in the correctness of the code that has landed in -current, it will be ported back to FreeBSD 10 and 11, and released as a security advisory.
* Apparently porting back to FreeBSD 11 only has some relatively simple merge conflicts, but 10 will be more work.
* Former FreeBSD Security Officer Dag-Erling Smørgrav has created a [meltdown testing and PoC tool](https://github.com/dag-erling/meltdown) that you can use to check your system. It is not finished yet, and doesnt seem to work with newer processors (haswell and newer).
* The first partial [mitigation for Spectre variant 2](https://svnweb.freebsd.org/changeset/base/328011) for bhyve on AMD64 has also been committed
* [The latest information is always available on the FreeBSD Wiki](https://wiki.freebsd.org/action/edit/SpeculativeExecutionVulnerabilities) \*\*\*

### [Some thoughts on Spectre and Meltdown](http://www.daemonology.net/blog/2018-01-17-some-thoughts-on-spectre-and-meltdown.html) ###

* Colin Percival breaks down how these vulnerabilities work, with same nice analogies
* What is a side channel:

>
>
> I want to know when my girlfriend's passport expires, but she won't show me her passport (she complains that it has a horrible photo) and refuses to tell me the expiry date. I tell her that I'm going to take her to Europe on vacation in August and watch what happens: If she runs out to renew her passport, I know that it will expire before August; while if she doesn't get her passport renewed, I know that it will remain valid beyond that date. Her desire to ensure that her passport would be valid inadvertently revealed to me some information: Whether its expiry date was before or after August.
>
>

* Spectre Variant 1:

>
>
> I tell my girlfriend that I'm going to take her on vacation in June, but I don't tell her where yet; however, she knows that it will either be somewhere within Canada (for which she doesn't need a passport, since we live in Vancouver) or somewhere in Europe. She knows that it takes time to get a passport renewed, so she checks her passport and (if it was about to expire) gets it renewed just in case I later reveal that I'm going to take her to Europe. If I tell her later that I'm only taking her to Ottawa  well, she didn't need to renew her passport after all, but in the meantime her behaviour has already revealed to me whether her passport was about to expire. This is what Google refers to "variant 1" of the Spectre vulnerability: Even though she didn't need her passport, she made sure it was still valid just in case she was going to need it.
>
>

* Spectre Variant 2:

>
>
> I spend a week talking about how Oxford is a wonderful place to visit and I really enjoyed the years I spent there, and then I tell her that I want to take her on vacation. She very reasonably assumes that  since I've been talking about Oxford so much  I must be planning on taking her to England, and runs off to check her passport and potentially renew it... but in fact I tricked her and I'm only planning on taking her to Ottawa.
>
>

* Meltdown:

>
>
> I tell my girlfriend that I want to take her to the Korean peninsula. She knows that her passport is valid for long enough; but she immediately runs off to check that her North Korean visa hasn't expired. Why does she have a North Korean visa, you ask? Good question. She doesn't  but she runs off to check its expiry date anyway! Because she doesn't have a North Korean visa, she (somehow) checks the expiry date on someone else's North Korean visa, and then (if it is about to expire) runs out to renew it  and so by telling her that I want to take her to Korea for a vacation I find out something she couldn't have told me even if she wanted to.  
>  Final thoughts on vulnerability disclosure  
>  The way these issues were handled was a mess; frankly, I expected better of Google, I expected better of Intel, and I expected better of the Linux community. When I found that Hyper-Threading was easily exploitable, I spent five months notifying the security community and preparing everyone for my announcement of the vulnerability; but when the embargo ended at midnight UTC and FreeBSD published its advisory a few minutes later, the broader world was taken entirely by surprise. Nobody knew what was coming aside from the people who needed to know; and the people who needed to know had months of warning.  
>  Contrast that with what happened this time around. Google discovered a problem and reported it to Intel, AMD, and ARM on June 1st. Did they then go around contacting all of the operating systems which would need to work on fixes for this? Not even close. FreeBSD was notified the week before Christmas, over six months after the vulnerabilities were discovered. Now, FreeBSD can occasionally respond very quickly to security vulnerabilities, even when they arise at inconvenient times  on November 30th 2009 a vulnerability was reported at 22:12 UTC, and on December 1st I provided a patch at 01:20 UTC, barely over 3 hours later  but that was an extremely simple bug which needed only a few lines of code to fix; the Spectre and Meltdown issues are orders of magnitude more complex.  
>  To make things worse, the Linux community was notified and couldn't keep their mouths shut. Standard practice for multi-vendor advisories like this is that an embargo date is set, and **nobody does anything publicly prior to that date**. People don't publish advisories; they don't commit patches into their public source code repositories; and they definitely don't engage in arguments on public mailing lists about whether the patches are needed for different CPUs. As a result, despite an embargo date being set for January 9th, by January 4th anyone who cared knew about the issues and there was code being passed around on Twitter for exploiting them.  
>  This is not the first time I've seen people get sloppy with embargoes recently, but it's by far the worst case. As an industry we pride ourselves on the concept of responsible disclosure  ensuring that people are notified in time to prepare fixes before an issue is disclosed publicly  but in this case there was far too much disclosure and nowhere near enough responsibility. We can do better, and I sincerely hope that next time we do.
>
>

---

### [CPU microcode update code for amd64](https://undeadly.org/cgi?action=article;sid=20180115073406) ###

[](https://marc.info/?l=openbsd-tech&m=151588857304763&w=2)

* Patrick Wildt (patrick@) recently committed some code that will update the Intel microcode on many Intel CPUs, a diff initially written by Stefan Fritsch (sf@). The microcode of your CPU is basically the firmware that runs on your (Intel) processor, defining its instruction set in terms of so called "microinstructions". The new code depends, of course, on the corresponding firmware package, ported by Patrick which can be installed using a very recent fw\_update(1). Of course, this all plays into the recently revealed problems in Intel (and other) CPUs, Meltdown and Spectre.
* Now Theo has explained the workings of the code on openbsd-tech, detailing some of the challenges in updating microcode on CPUs where your OS is already starting to run.
* [Theo hints at future updates to the intel-firmware package in his mail:](https://marc.info/?l=openbsd-tech&m=151588857304763&w=2)

>
>
> Patrick and others committed amd64 Intel cpu microcode update code over the last few days. The approach isn't perfect, but it is good enough for a start. I want to explain the situation.  
>  When you fw\_update, you'll get the firmware files.  
>  Upon a reboot, it will attempt to update the microcode on your cpus.  
>  Maybe there isn't a new microcode. Maybe your BIOS has a copy of the microcode and installs it before booting OpenBSD.  
>  This firmware installation is done a little late. Doing it better will require some work in the bootblocks to find the firmware files, but time is a bit short to do that right now.  
>  The branch-target-cache flushing features added in new microcode are not being used yet. There is more code which has to be written, but again other work is happening first.  
>  Also, Intel is saying their new microcodes sucks and people should wait a little.  
>  "Hi, my name is Intel and I'm an cheating speculator".
>
>

* Several developers are working on mitigations for these issues, attacking the problem from several angles. Expect to see more updates to a CVS tree near you soon.

---

### [Intel: as a \*BSD user, I am fucking pissed!](https://malcont.net/2018/01/dont-like-meltdown-spectre-releated-bugs-handled/) ###

>
>
> I wasnt going to write anything on the recently found x64 architecture  related bugs. Im not a kernel developer nor even a programmer and I cant say that I have a solid understanding of what Meltdown and Spectre attacks are. Also there already is a ton of articles and posts written by people who have no grasp of the subject.  
>  Im however a malcontent and I find this a good way to express my feelings:
>
>
>
> Intel: as a \*BSD user, I am fucking pissed!
>
>

* Meltdown, Spectre and BSD  the pissed part

>
>
> Part of my work is UNIX-like systems administration  including BSDs and Linuces. As much as I am happy with Linux changes already made, I am beyond pissed about how the BSDs were handled by Intel  because they were not. FreeBSD Security Team received some heads-up just before Xmas, while OpenBSD, NetBSD and DragonflyBSD teams received no prior warnings.
>
>
>
> Meltdown and Spectre attacks are hard to perform. It is a hard work to mitigate them in the software, as the bugs lay in the CPUs and are not fixable by microcode updates. Developers are trying to mitigate these bugs in a way that will deliver smallest performance losses. A lot of time consuming work is needed to fix CPU vendors mistakes. Linux developers had this time. BSD developers did not.
>
>

* BSD user base too small?

>
>
> BSD user base is small in comparison to Linux. Seems that its too small for Intel. PlayStation4 consoles are FreeBSD-based (and use AMD CPUs) but I think its safe to say that gaming devices are not the most important systems to be fixed. Netflix serves their content off FreeBSD but the bugs are not remotely exploitable (possibly not including JavaScript, but its running someones code locally) so theres probably not much harm to be done here either.  
>  However gamers and Netflix arent the only ones who use \*BSD systems. Id say that there is more than a few FreeBSD, NetBSD, OpenBSD and DragonFlyBSD servers on the internet.
>
>
>
> In March 2017, Intel promised more timely support to FreeBSD. They knew about flaws in their CPUs in June and decided that a timely manner is the end of December  short before the embargo was to be lifted.
>
>
>
> Intel and Google (probably Intel more): it was your job to pick the correct people to whom the bugs can be disclosed. In my humble opinion you chose poorly by disclosing these issues with ONLY Apple, Microsoft, and the Linux Foundation, of OS vendors. You did much harm to the BSD community.
>
>
>
> Intel: Its your bugs. And you offered more support to the FreeBSD Foundation less than 3 months prior to being informed (my guess is that you knew much earlier) on the flaws in YOUR products. I dont want to write more here as the wording would be too strong.
>
>

---

Interview - Viewer Questions
----------

* These days, do you consider yourself more of an programmer or a sysadmin? Which one do you enjoy more?
* Does FreeBSD/BSD enable your business or would another OS suit your needs just as well?
* Youve hinted that you use FreeBSD as part of your business. Can you elaborate on that and give some technical detail on how its used in that environment?
* If you were allowed three wishes for anything at all to be implemented or changed in ZFS, what would they be, and why?
  * Per Dataset throughput and IOPS limiting
  * Per-File Cloning and/or zfsmv (move a file from one dataset to another, without copying)
  * Cluster support

* Allan, you have previously mentioned that you have worked on FreeBSD on MIPS, what made you choose the Onion Omega over something like the Raspberry Pi?
* What is BSD Nows association with Jupiter broadcasting, and how did the relationship come to be? Jupiter seems to be associated with several Linux-themed podcasts, and Im wondering how and why BSD Now joined Jupiter. The two communities (the Linuxes and BSDs) dont always seem to mix freely -- or do they?
* What kind of keyboard is that? Have you ever tried an ErgoDox? The ErgoDox EZ is made by a Canadian.
* You mentioned when doing one of your talks on UCL for FreeBSD that you had only recently learned C. I am also aware of your history also on contributing to the FreeBSD handbook and to documentation in general. Given you started with C relatively recently, what made you want to learn it, how quickly did you pick it up, and is it your favourite language? It is most inspiring to me, as you are clearly so talented, and of all the languages I have learned (including C++), I still prefer C in my heart of hearts. I'd be really interested to hear your answer, many thanks. \*\*\*

News Roundup
----------

### [LinuxAndUbuntu Review Of TrueOS A Unix Based OS](http://www.linuxandubuntu.com/home/linuxandubuntu-review-of-trueos-a-unix-based-os) ###

>
>
> Trust me, the name TrueOS takes me back to 1990s when Tru64 UNIX operating system made its presence. TrueOS is PC-BSDs new unified brand built upon FreeBSD-CURRENT code base. Note that TrueOS is not a Linux distro but is BSD Unix. FreeBSD is known for its cutting-edge features, security, scalability, and ability to work both as a server and desktop operating system. TrueOS aims at having user-friendliness with the power of FreeBSD OS. Let us start with going into details of different aspects of the TrueOS.
>
>

* TrueOS History  
   ?

  >
  >
  > TrueOS was founded by Kris Moore in 2005 with name PC-BSD. Initial version focused to make FreeBSD easy to use starting with providing GUI based installer (to relatively complicated FreeBSD installer). In the year 2006, PC-BSD was acquired by iXsystems. Before rebranding as TrueOS in Sept 2016, PC-BSD reached a stage starting considering better than vanilla FreeBSD. Older PC-BSD version used to support both x86 and x86-64 architecture.  
  >  Kris Moore, the developer founder, says about rebranding: Weve already been using TrueOS for the server side of PC-BSD, and it made sense to unify the names. PC-BSD doesnt reflect server or embedded well. TrueOS Desktop/Server/Embedded can be real products, avoids some of the alphabet soup, and gives us a more catchy name.
  >
  >

* TrueOS First Impression  
   ?

  >
  >
  > The startup is little longer; may be due to starting up of many services. The heavy KDE well suited to PC-BSD. The C++/Qt5 based Lumina desktop environment is light and fast. The Lumina offers an easy way to configure menu and panels. I did not face any problems for continuous use of two weeks on a virtual machine having the minimal configuration: 1 GB RAM, 20 GB hard disk and Intel 3.06 GHz i3 processor. The Lumina desktop is light and fast. The developers of Lumina know what they are doing and have a good idea of what makes a good IDE. As it happens with any new desktop environment, it needs some time to settle. Let us hope that they keep to the path they are on with it.
  >
  >

* Conclusion  
   ?

  >
  >
  > The TrueOS is impressive when consider it as relatively young. It is a daring step that TrueOS developers took FreeBSD Current rather than FreeBSD Stable code base. Overall it has created its own place from the legacy shadow of PC-BSD. Starting with easy installation TrueOS is a good combination of software and utilities that make the system ready to use. Go and get a TrueOS ISO to unleash the bleeding edge tag of FreeBSD
  >
  >

---

### [Thinkpad x240 - FreeBSD Setup](http://stygix.org/nix/x240-freebsd.php) ###

>
>
> What follows is a record of how I set up FreeBSD to be my daily driver OS on the Lenovo Thinkpad X240. Everything seems to work great. Although, the touchpad needs some tweaking. I've tried several configurations, even recompiling Xorg with EVDEV support and all that, to no avail. Eventually I will figure it out. Do not sleep the laptop from the command line. Do it from within Xorg, or it will not wake up. I don't know why. You can do it from a terminal within Xorg, just not from the naked command line without Xorg started. It also will not sleep by closing the lid. I included a sudo config that allows you to run /usr/sbin/zzz without a password, so what I do is I have a key combo assigned within i3wm to run "sudo /usr/sbin/zzz". It works fine this way.
>
>
>
> I go into detail when it comes to setting up Xorg with i3wm. You can skip this if you want, but if you've never used a tiling window manager, it will handle screen real estate very efficiently on a laptop with a 12.5-inch screen and a touchpad.
>
>
>
> First, download the amd64 image for 11.1-RELEASE and flash it to a USB pen drive. For the Unices, use this:
>
>

`# dd if=FreeBSD-11.1-RELEASE-amd64-memstick.img of=/dev/da0 bs=1M conv=sync`

>
>
> Obviously, you'll change /dev/da0 to whatever the USB pen drive is assigned. Plug it in, check dmesg.
>
>
>
> Leave it plugged in, restart the laptop. When prompted, tap Enter to halt the boot process, then F12 to select a bootable device. Choose the USB drive.
>
>
>
> I won't go through the actual install process, but it is pretty damn easy so just look at a guide or two and you'll be fine. If you can install Debian, you can install FreeBSD. I will, however, recommend ZFS if you have over 4GB of RAM (my particular variant of the X240 has 8GB of RAM, so yours should have at least 4GB), along with an encrypted disk, and an encrypted SWAP partition. When prompted to add an additional user, and you get to the question where it asks for additional groups, please make sure you add the user to "wheel". The rest should be self-explanatory during the install.
>
>
>
> Now for the good shit. You just booted into a fresh FreeBSD install. Now what? Well, time to fire up vi and open some config files...
>
>
> ---
>

### [CNN Article about CDROM.com and FreeBSD, from 1999](https://www.cnn.com/TECH/computing/9904/08/cdrom.idg/index.html) ###

>
>
> Walnut Creek CDROM sells a lot of CD-ROMs, but it gives away even more data. Specifically, anyone who has Internet access is free to log into wcarchive (ftp.cdrom.com) and start downloading bits.  
>  Even with a good Internet connection, however, you should expect to be at it for a while. At the present time, wcarchive resides on half a terabyte (500 GB) of RAID 5-disk storage. Even if your 56-Kbps modem can deliver seven kilobytes per second, downloading the complete archive would take you 70 million seconds. Even then, some of the files would be more than two years out of date, so a bit of "back and fill" would be needed.  
>  Of course, nobody uses wcarchive that way. Instead, they just drop in when they need the odd file or two. The FTP server is very accommodating; 3,600 simultaneous download sessions is the current limit and an upgrade to 10,000 sessions is in the works.  
>  This translates to about 800 GB per day of downloads. Bob Bruce (Walnut Creek's founder) says he's thinking about issuing a press release when they reach a terabyte a day. But 800 GB isn't all that shabby....
>
>

* The hardware

>
>
> Because FTP archives don't do a lot of thinking, wcarchive doesn't need a massive cluster of CPUs. In fact, it gets by with a single 200-MHz P6 Pentium Pro and a measly(!) 1 GB of RAM. The I/O support, however, is fairly impressive.  
>  A six-channel Mylex RAID controller (DAC960SXI; Ultra-Wide SCSI-SCSI) is the centerpiece of the I/O subsystem. Two channels link it to the PC ("Personal Computer"!?!), via a dual-channel Adaptec card (AHA-3940AUW; PCI to Ultra-Wide SCSI). An 256-MB internal cache helps it to eliminate recurring disk accesses.  
>  Four nine-drive disk arrays provide the actual storage. The two larger arrays use 18-GB IBM drives; the two smaller arrays use 9-GB Micropolis and Quantum drives. A separate 4-GB Quantum drive is used as the "system disk."  
>  The output side is handled by a single Intel 100Base-T controller (Pro/100B PCI), which feeds into the Internet through a number of shared DS3 (45 Mbps) and OC3 (155 Mbps) circuits.  
>  A detailed description of the system is available as ftp.cdrom.com/archive-info/configuration;
>
>

* The software

>
>
> The system software is rather prosaic: a copy of FreeBSD, supplemented by home-grown FTP mirroring and server code. Because of the massive hardware support, the software "only" needs to keep the I/O going in an efficient and reliable manner.  
>  FreeBSD, the "prosaic" operating system mentioned above, merits a bit more discussion. Like Linux, FreeBSD is open source. Anyone can examine, modify, and/or redistribute the source code. And, like Linux, an active user community helps the authors to find bugs, improve documentation, and generally support the OS.  
>  Unlike Linux, FreeBSD is derived from the Berkeley Unix code that forms the foundation for most commercial Unix variants. When you use the "fast file system" (cylinder groups, long file names, symbolic links, etc.), TCP/IP networking, termcap, or even vi, you are using Berkeley Unix additions.  
>  The version of BSD underlying FreeBSD, however, is "pure" BSD; don't look for the System V modifications you see in Solaris. Instead, think of it as SunOS, brought up to date with Kerberos, modern sendmail, an updated filesystem, and more. Solid, fast, and free!  
>  One of FreeBSD's finest innovations, the Ports Collection, makes FreeBSD a delight for open source application users. The Ports Collection automates the downloading, building, and installation (including de-installation) of 2,300+ open source packages.
>
>

* The company

>
>
> Walnut Creek CDROM has been around for several years now, so you are likely to be familiar with its offerings. You may not realize, however, that it provides the major financial support for FreeBSD.  
>  The FreeBSD support has two purposes. First, it provides the company with a solid base to run wcarchive and other massive projects. Second, it ties in with the company's mission of making software (and data) economically accessible.  
>  Bob Bruce, the firm's founder, is an interesting guy: laid back and somewhat conservative in manner, but productive and innovative in practice. Here is a possibly illustrative story.  
>  When Bob started selling CD-ROMs, disc caddies were selling for $15 each. Bob thought that was rather high, so he started investigating the marketplace. A long-distance call to Japan got him Sony's fax number; a series of faxes got him in touch with the salespeople.  
>  It turned out that caddies were available, in bulk, for only a few dollars each. Bulk, in this case, meant pallet-loads of 10,000 caddies. In an act of great faith, Bob purchased a pallet of caddies, then proceeded to sell them for five dollars each.  
>  The results were everything he might have wished. Folks who bought his CD-ROMs added caddies to their orders; folks who bought piles of caddies added in a disc or two. Either way, Walnut Creek CDROM was making a name for itself.  
>  Many pallet-loads later, the company is still selling caddies, making and distributing CD-ROMs, and giving away bits. Walnut Creek CDROM is a real open-source success story; its breadth and depth of offerings is well worth a look.
>
>

---

Beastie Bits
----------

* [OpenBSD adds kqueue event support to DRM, to detect device changes like HDMI cables being plugged in, and trigger randr events](https://github.com/openbsd/src/commit/b8584f4233dc11a328cd245a5843ec3d67462200)
* [Thesis describing QUAD3, a unix-like, multi-tasking operating system for the 6502 processor ](https://archive.org/details/AMultiTaskingOperatingSystemForMicrocomputers)
* [Windows is getting chmod and chown...](https://blogs.msdn.microsoft.com/commandline/2018/01/12/chmod-chown-wsl-improvements/)
* [Timeline: How they kept Meltdown and Spectre secret for so long ](https://www.theverge.com/platform/amp/2018/1/11/16878670/meltdown-spectre-disclosure-embargo-google-microsoft-linux)
* [bsd.network is a \*BSD-themed Mastodon Instance](https://bsd.network/): Peter Hessler is administering a new Mastodon instance, running in an OpenBSD VM on top of an OpenBSD vmm hypervisor
* [Computer-Aided Instruction on UNIX](https://virtuallyfun.com/wordpress/wp-content/uploads/2017/12/whfUb.pdf)
* [AsiaBSDCon 2018 Travel Grant Application Now Open](https://www.freebsdfoundation.org/blog/asiabsdcon-2018-travel-grant-application-now-open/)
* [AsiaBSDCon 2018 FreeBSD Developers Summit Call for Proposals](https://www.freebsdfoundation.org/news-and-events/call-for-papers/asiabsdcon-2018-freebsd-developers-summit-call-for-proposals/)
* [LinuxFest Northwest 2018 Call for Proposals](https://www.freebsdfoundation.org/news-and-events/call-for-papers/linuxfest-northwest-2018-call-for-proposals/)

---

Feedback/Questions
----------

* Jason - [Dont break my ports](http://dpaste.com/05PRNG2)
* Wilyarti - [show content](http://dpaste.com/1BG8GZW) [https://clinetworking.wordpress.com/2017/12/08/data-de-duplication-file-diff-ing-and-s3-style-object-storage-using-digital-ocean-spaces](https://clinetworking.wordpress.com/2017/12/08/data-de-duplication-file-diff-ing-and-s3-style-object-storage-using-digital-ocean-spaces)

* Scott - [Your show is Perfect!](http://dpaste.com/0KER8YE#wrap)

* Ken - [Community Culture](http://dpaste.com/0WT8285#wrap)

---