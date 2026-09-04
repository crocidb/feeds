+++
title = "Episode 275: OpenBSD in Stereo | BSD Now 275"
description = "DragonflyBSD 5.4 has been released, down the Gopher hole with OpenBSD, OpenBSD in stereo with VFIO, BSD/OS the best candidate for legally tested open source Unix, OpenBGPD adds diversity to the routing server landscape, and more.Headlines[DragonflyBSD 5.4 released]("
date = "2018-12-09T09:00:00Z"
url = "https://www.bsdnow.tv/275"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.682067393Z"
seen = true
+++

DragonflyBSD 5.4 has been released, down the Gopher hole with OpenBSD, OpenBSD in stereo with VFIO, BSD/OS the best candidate for legally tested open source Unix, OpenBGPD adds diversity to the routing server landscape, and more.

Headlines
----------

### [DragonflyBSD 5.4 released](https://www.dragonflybsd.org/release54/) ###

> DragonFly version 5.4 brings a new system compiler in GCC 8, improved NUMA support, a large of number network and virtual machine driver updates, and updates to video support. This release is 64-bit only, as with previous releases. The details of all commits between the 5.2 and 5.4 branches are available in the associated commit messages for 5.4.0rc and 5.4.0.

* Big-ticket items
* Much better support for asymmetric NUMA (Non-Uniform Memory Access) configurations. In particular, both the memory subsystem and the scheduler now understand the Threadripper 2990WX’s architecture. The scheduler will prioritize CPU nodes with direct-attached memory and the memory subsystem will normalize memory queues for CPU nodes without direct-attached memory (which improves cache locality on those CPUs).
* Incremental performance work. DragonFly as a whole is very SMP friendly. The type of performance work we are doing now mostly revolves around improving fairness for shared-vs-exclusive lock clashes, reducing cache ping-ponging due to non-contending SMP locks (i.e. massive use of shared locks on shared resources), and so forth.
* Major updates to dports brings us to within a week or two of FreeBSD’s ports as of this writing, in particular major updates to chromium, and making the whole mess work with gcc-8.
* Major rewriting of the tty clist code and the tty locking code, significantly improving concurrency across multiple ttys and ptys.
* GCC 8
* DragonFly now ships with GCC 8.0, and runs as the default compiler. It is also now used for building dports.
* GCC 4.7.4 and GCC 5.4.1 are still installed. 4.7.4 is our backup compiler, and 5.4.1 is still there to ensure a smooth transition, but should generally not be used. buildworld builds all three by default to ensure maximum compatibility.
* Many passes through world sources were made to address various warnings and errors the new GCC brought with it.
* HAMMER2
* HAMMER2 is recommended as the default root filesystem in non-clustered mode.
* Clustered support is not yet available.
* Increased bulkfree cache to reduce the number of iterations required.
* Fixed numerous bugs.
* Improved support on low-memory machines.
* Significant pre-work on the XOP API to help support future networked operations.
* Details
* Checksums `MD5 (dfly-x86_64-5.4.0_REL.img) = 7277d7cffc92837c7d1c5dd11a11b98f` `MD5 (dfly-x86_64-5.4.0_REL.iso) = 6da7abf036fe9267479837b3c3078408` `MD5 (dfly-x86_64-5.4.0_REL.img.bz2) = a77a072c864f4b72fd56b4250c983ff1` `MD5 (dfly-x86_64-5.4.0_REL.iso.bz2) = 4dbfec6ccfc1d59c5049455db914d499`
* Downloads Links

> DragonFly BSD is 64-bit only, as announced during the 3.8 release.

* USB: dfly-x86\_64-5.4.0\_REL.img as bzip2 file
* ISO: dfly-x86\_64-5.4.0\_REL.iso as bzip2 file
* Uncompressed ISO: dfly-x86\_64-5.4.0\_REL.iso (For use with VPS providers as an install image.)

---

### [Down the Gopher hole with OpenBSD, Gophernicus, and TLS](https://cryogenix.net/gophernicus.html) ###

> In the early 2000s I thought I had seen the worst of the web - Java applets, Macromedia (\>Adobe) Flash, animated GIFs, javascript snow that kept you warm in the winter by burning out your CPU, and so on. For a time we learned from these mistakes, and started putting the burden on the server-side - then with improvements in javascript engines we started abusing it again with JSON/AJAX and it all went down hill from there.

> Like cloud computing, blockchains, machine learning and a tonne of other a la mode technologies around today - most users and service providers don’t need websites that consume 1GB of memory processing JS and downloading 50MB of compressed data just to read Alice’s one-page travel blog or Bob’s notes on porting NetBSD to his blood-pressure monitor.

> Before the HTTP web we relied on Prestel/Minitel style systems, BBS systems, and arguably the most accessible of all - Gopher! Gopher was similar to the locally accessed AmigaGuide format, in that it allowed users to search and retrieve documents interactively, with links and cross-references. Its efficiency and distraction-free nature make it attractive to those who are tired of the invasive, clickbait, ad-filled, javascript-laden web2/3.x. But enough complaining and evangelism - here’s how to get your own Gopher Hole!

> Gophernicus is a modern gopher daemon which aims to be secure (although it still uses inetd -\_-); it’s even in OpenBSD ports so at least we can rely on it to be reasonably audited.

> If you need a starting point with Gopher, SDF-EU’s wiki has a good article here.

* [https://sdfeu.org/w/tutorials:gopher](https://sdfeu.org/w/tutorials:gopher)

> Finally, if you don’t like gopher(1) - there’s always lynx(1) or NCSA Mosaic!

* [https://cryogenix.net/NCSA\_Mosaic\_OpenBSD.html](https://cryogenix.net/NCSA_Mosaic_OpenBSD.html)

> I’ve added TLS support to Gophernicus so you don’t need to use stunnel anymore. The code is ugly and unpolished though so I wouldn’t recommend for production use.

* [https://github.com/0x16h/gophernicus](https://github.com/0x16h/gophernicus)
* [https://github.com/0x16h/gophernicus/blob/master/INSTALL.openbsd](https://github.com/0x16h/gophernicus/blob/master/INSTALL.openbsd)

---

News Roundup
----------

### [OpenBSD in Stereo with Linux VFIO](https://jcs.org/2018/11/12/vfio) ###

> I use a Huawei Matebook X as my primary OpenBSD laptop and one aspect of its hardware support has always been lacking: audio never played out of the right-side speaker. The speaker did actually work, but only in Windows and only after the Realtek Dolby Atmos audio driver from Huawei was installed. Under OpenBSD and Linux, and even Windows with the default Intel sound driver, audio only ever played out of the left speaker. Now, after some extensive reverse engineering and debugging with the help of VFIO on Linux, I finally have audio playing out of both speakers on OpenBSD.

* VFIO

> The Linux kernel has functionality called VFIO which enables direct access to a physical device (like a PCI card) from userspace, usually passing it to an emulator like QEMU. To my surprise, these days, it seems to be primarily by gamers who boot Linux, then use QEMU to run a game in Windows and use VFIO to pass the computer’s GPU device through to Windows. By using Linux and VFIO, I was able to boot Windows 10 inside of QEMU and pass my laptop’s PCI audio device through to Windows, allowing the Realtek audio drivers to natively control the audio device. Combined with QEMU’s tracing functionality, I was able to get a log of all PCI I/O between Windows and the PCI audio device.

* Using VFIO

> To use VFIO to pass-through a PCI device, it first needs to be stubbed out so the Linux kernel’s default drivers don’t attach to it. GRUB can be configured to instruct the kernel to ignore the PCI audio device (8086:9d71) and explicitly enable the Intel IOMMU driver by adding the following to /etc/default/grub and running update-grub With the audio device stubbed out, a new VFIO device can be created from it Then the VFIO device (00:1f.3) can be passed to QEMU I was using my own build of QEMU for this, due to some custom logging I needed (more on that later), but the default QEMU package should work fine. The events.txt was a file of all VFIO events I wanted logged (which was all of them). Since I was frequently killing QEMU and restarting it, Windows 10 wanted to go through its unexpected shutdown routine each time (and would sometimes just fail to boot again). To avoid this and to get a consistent set of logs each time, I used qemu-img to take a snapshot of a base image first, then boot QEMU with that snapshot. The snapshot just gets thrown away the next time qemu-img is run and Windows always starts from a consistent state. QEMU will now log each VFIO event which gets saved to a debug-output file. With a full log of all PCI I/O activity from Windows, I compared it to the output from OpenBSD and tried to find the magic register writes that enabled the second speaker. After days of combing through the logs and annotating them by looking up hex values in the documentation, diffing runtime register values, and even brute-forcing it by mechanically duplicating all PCI I/O activity in the OpenBSD driver, nothing would activate the right speaker. One strange thing that I noticed was if I booted Windows 10 in QEMU and it activated the speaker, then booted OpenBSD in QEMU without resetting the PCI device’s power in-between (as a normal system reboot would do), both speakers worked in OpenBSD and the configuration that the HDA controller presented was different, even without any changes in OpenBSD.

> A Primer on Intel HDA Most modern computers with integrated sound chips use an Intel High Definition Audio (HDA) Controller device, with one or more codecs (like the Realtek ALC269) hanging off of it. These codecs do the actual audio processing and communicate with DACs and ADCs to send digital audio to the connected speakers, or read analog audio from a microphone and convert it to a digital input stream. In my Huawei Matebook X, this is done through a Realtek ALC298 codec. On OpenBSD, these HDA controllers are supported by the azalia(4) driver, with all of the per-codec details in the lengthy azalia\_codec.c file. This file has grown quite large with lots of codec- and machine-specific quirks to route things properly, toggle various GPIO pins, and unmute speakers that are for some reason muted by default. The azalia driver talks to the HDA controller and sets up various buffers and then walks the list of codecs. Each codec supports a number of widget nodes which can be interconnected in various ways. Some of these nodes can be reconfigured on the fly to do things like turning a microphone port into a headphone port. The newer Huawei Matebook X Pro released a few months ago is also plagued with this speaker problem, although it has four speakers and only two work by default. A fix is being proposed for the Linux kernel which just reconfigures those widget pins in the Intel HDA driver. Unfortunately no pin reconfiguration is enough to fix my Matebook X with its two speakers. While reading more documentation on the HDA, I realized there was a lot more activity going on than I was able to see through the PCI tracing. For speed and efficiency, HDA controllers use a DMA engine to transfer audio streams as well as the commands from the OS driver to the codecs. In the output above, the CORBWP=0; size=256 and RIRBRP=0, size=256 indicate the setup of the CORB (Command Output Ring Buffer) and RIRB (Response Input Ring Buffer) each with 256 entries. The HDA driver allocates a DMA address and then writes it to the two CORBLBASE and CORBUBASE registers, and again for the RIRB. When the driver wants to send a command to a codec, such as CORB\_GET\_PARAMETER with a parameter of COP\_VOLUME\_KNOB\_CAPABILITIES, it encodes the codec address, the node index, the command verb, and the parameter, and then writes that value to the CORB ring at the address it set up with the controller at initialization time (CORBLBASE/CORBUBASE) plus the offset of the ring index. Once the command is on the ring, it does a PCI write to the CORBWP register, advancing it by one. This lets the controller know a new command is queued, which it then acts on and writes the response value on the RIRB ring at the same position as the command (but at the RIRB’s DMA address). It then generates an interrupt, telling the driver to read the new RIRBWP value and process the new results. Since the actual command contents and responses are handled through DMA writes and reads, these important values weren’t showing up in the VFIO PCI trace output that I had gathered. Time to hack QEMU.

* Logging DMA Memory Values in QEMU

> Since DMA activity wouldn’t show up through QEMU’s VFIO tracing and I obviously couldn’t get Windows to dump these values like I could in OpenBSD, I could make QEMU recognize the PCI write to the CORBWP register as an indication that a command has just been written to the CORB ring. My custom hack in QEMU adds some HDA awareness to remember the CORB and RIRB DMA addresses as they get programmed in the controller. Then any time a PCI write to the CORBWP register is done, QEMU fetches the new CORB command from DMA memory, decodes it into the codec address, node address, command, and parameter, and prints it out. When a PCI read of the RIRBWP register is requested, QEMU reads the response and prints the corresponding CORB command that it stored earlier. With this hack in place, I now had a full log of all CORB commands and RIRB responses sent to and read from the codec: An early version of this patch left me stumped for a few days because, even after submitting all of the same CORB commands in OpenBSD, the second speaker still didn’t work. It wasn’t until re-reading the HDA spec that I realized the Windows driver was submitting more than one command at a time, writing multiple CORB entries and writing a CORBWP value that was advanced by two. This required turning my CORB/RIRB reading into a for loop, reading each new command and response between the new CORBWP/RIRBWP value and the one previously seen. Sure enough, the magic commands to enable the second speaker were sent in these periods where it submitted more than one command at a time.

* Minimizing the Magic

> The full log of VFIO PCI activity from the Windows driver was over 65,000 lines and contained 3,150 CORB commands, which is a lot to sort through. It took me a couple more days to reduce that down to a small subset that was actually required to activate the second speaker, and that could only be done through trial and error:

* Boot OpenBSD with the full list of CORB commands in the azalia driver
* Comment out a group of them
* Compile kernel and install it, halt the QEMU guest
* Suspend and wake the laptop, resetting PCI power to the audio device to reset the speaker/Dolby initialization and ensure the previous run isn’t influencing the current test (I’m guessing there is an easier to way to reset PCI power than suspending the laptop, but oh well)
* Start QEMU, boot OpenBSD with the new kernel
* Play an MP3 with mpg123 which has alternating left- and right-channel audio and listen for both channels to play

> This required a dozen or so iterations because sometimes I’d comment out too many commands and the right speaker would stop working. Other times the combination of commands would hang the controller and it wouldn’t process any further commands. At one point the combination of commands actually flipped the channels around so the right channel audio was playing through the left speaker.

* The Result

> After about a week of this routine, I ended up with a list of 662 CORB commands that are needed to get the second speaker working. Based on the number of repeated-but-slightly-different values written with the 0x500 and 0x400 commands, I’m guessing this is some kind of training data and that this is doing the full Dolby/Atmos system initialization, not just turning on the second speaker, but I could be completely wrong. In any case, the stereo sound from OpenBSD is wonderful now and I can finally stop downmixing everything to mono to play from the left speaker. In case you ever need to do this, sndiod can be run with -c 0:0 to reduce the channels to one. Due to the massive size of the code needed for this quirk, I’m not sure if I’ll be committing it upstream in OpenBSD or just saving it for my own tree. But at least now the hardware support chart for my Matebook is all yeses for the things I care about. I’ve also updated the Linux bug report that I opened before venturing down this path, hoping one of the maintainers of that HDA code that works at Intel or Realtek knew of a solution I could just port to OpenBSD. I’m curious to see what they’ll do with it.

---

### [Why BSD/OS is the best candidate for being the only tested legally open UNIX](https://virtuallyfun.com/wordpress/2018/11/26/why-bsd-os-is-the-best-candidate-for-being-the-only-tested-legally-open-unix/) ###

* Introduction

> The UNIX® system is an old operating system, possibly older than many of the readers of this post. However, despite its age, it still has not been open sourced completely. In this post, I will try to detail which parts of which UNIX systems have not yet been open sourced. I will focus on the legal situation in Germany in particular, taking it representative of European law in general – albeit that is a stretch, knowing the diversity of European jurisdictions. Please note that familiarity with basic terms of copyright law is assumed.

* Ancient UNIX

> The term “Ancient UNIX” refers to the versions of UNIX up to and including Seventh Edition UNIX (1979) including the 32V port to the VAX. Ancient UNIX was created at Bell Laboratories, a subsidiary of AT&T at the time. It was later transferred of the AT&T UNIX Support Group, then AT&T Information Systems and finally the AT&T subsidiary UNIX System Laboratories, Inc. (USL). The legal situation differs between the United States of America and Germany. In a ruling as part of the UNIX System Laboratories, Inc. v. Berkeley Software Design, Inc. (USL v. BSDi) case, a U.S. court found that USL had no copyright to the Seventh Edition UNIX system and 32V – arguably, by extension, all earlier versions of Ancient UNIX as well – because USL/AT&T had failed to affix copyright notices and could not demonstrate a trade secret. Due to the obsessive tendency of U.S. courts to consider themselves bound to precedents (cf. the infamous Pierson v. Post case), it can be reasonably expected that this ruling would be honored and applied in subsequent cases. Thus under U.S. law, Ancient UNIX can be safely assumed to belong in the public domain. The situation differs in Germany. Unlike the U.S., copyright never needed registration in order to exist. Computer programs are works in the sense of the German 1965 Act on Copyright and Related Rights (Copyright Act, henceforth CopyA) as per CopyA § 2(1) no. 1. Even prior to the amendment of CopyA § 2(1) to include computer programs, computer programs have been recognized as copyrightable works by the German Supreme Court (BGHZ 112, 264 Betriebssystem, no. 19); CopyA § 137d(1) rightly clarifies that. The copyright holder at 1979 would still have been USL via Bell Labs and AT&T. Copyright of computer programs is transferred to the employer upon creation under CopyA § 69(1). Note that this does not affect expiry (Daniel Kaboth/Benjamin Spies, commentary on CopyA §§ 69a‒69g, in: Hartwig Ahlberg/Horst-Peter Götting (eds.), Urheberrecht: UrhG, KUG, VerlG, VGG, Kommentar, 4th ed., C. H. Beck, 2018, no. 16 ad CopyA § 69b; cf. Bundestag-Drucksache [BT-Drs.] 12/4022, p. 10). Expiry occurs 70 years after the death of the (co-)author that died most recently as per CopyA § 65(1) and 64; this has been the case since at least the 1960s, meaning there is no way for copyright to have expired already (old version, as per Bundesgesetzblatt Part I No. 51 of September 16, 1965, pp. 1273‒1294). In Germany, private international law applies the so-called “Territorialitätsprinzip” for intellectual property rights. This means that the effect of an intellectual property right is limited to the territory of a state (Anne Lauber-Rönsberg, KollisionsR, in: Hartwig Ahlberg/Horst-Peter Götting (eds.), ibid., pp. 2241 et seqq., no. 4). Additionally, the “Schutzlandprinzip” applies; this means that protection of intellectual property follows the lex loci protectionis, i.e. the law of the country for which protection is sought (BGH GRUR 2015, 264 HiHotel II, no. 25; BGH GRUR 2003, 328 Sender Felsberg, no. 24), albeit this is criticized in parts of doctrine (Lauber-Rönsberg, ibid., no. 10). The “Schutzlandprinzip” requires that the existence of an intellectual property right be verified as well (BGH ZUM 2016, 522 Wagenfeld-Leuchte II, no. 19). Thus, in Germany, copyright on Ancient UNIX is still alive and well. Who has it, though? A ruling by the U.S. Court of Appeals, Tenth Circuit, in the case of The SCO Group, Inc. v. Novell, Inc. (SCO v. Novell) in the U.S. made clear that Novell owns the rights to System V – thus presumably UNIX System III as well – and Ancient UNIX, though SCO acquired enough rights to develop UnixWare/OpenServer (Ruling 10-4122 [D.C. No. 2:04-CV-00139-TS], pp. 19 et seq.). Novell itself was purchased by the Attachmate Group, which was in turn acquired by the COBOL vendor Micro Focus. Therefore, the rights to SVRX and – outside the U.S. – are with Micro Focus right now. If all you care about is the U.S., you can stop reading about Ancient UNIX here. So how does the Caldera license factor into all of this? For some context, the license was issued January 23, 2002 and covers Ancient UNIX (V1 through V7 including 32V), specifically excluding System III and System V. Caldera, Inc. was founded in 1994. The Santa Cruz Operation, Inc. sold its rights to UNIX to Caldera in 2001, renamed itself to Tarantella Inc. and Caldera renamed itself The SCO Group. Nemo plus iuris ad alium transferre potest quam ipse habet; no one can transfer more rights than he has. The question now becomes whether Caldera had the rights to issue the Caldera license. I’ve noted it above but it needs restating: Foreign decisions are not necessarily accepted in Germany due to the “Territorialitätsprinzip” and “Schutzlandprinzip” – however, I will be citing a U.S. ruling for its assessment of the facts for the sake of simplicity. As per ruling 10-4122, “The district court found the parties intended for SCO to serve as Novell’s agent with respect to the old SVRX licenses and the only portion of the UNIX business transferred outright under the APA [asset purchase agreement] was the ability to exploit and further develop the newer UnixWare system. SCO was able to protect that business because it was able to copyright its own improvements to the system. The only reason to protect the earlier UNIX code would be to protect the existing SVRX licenses, and the court concluded Novell retained ultimate control over that portion of the business under the APA.” The relevant agreements consist of multiple pieces: the base Asset Purchase Agreement “APA” (Part I) the base Asset Purchase Agreement “APA” (Part II) the Operating Agremeent and Amendment 1 to the APA the Amendment 2 to the APA The APA dates September 19, 1995, from before the Caldera license. Caldera cannot possibly have acquired rights that The Santa Cruz Operation, Inc. itself never had. Furthermore, I’ve failed to find any mention of Ancient UNIX; all that is transferred is rights to SVRX. Overall, I believe that the U.S. courts’ assesment of the facts represents the situation accurately. Thus for all intents and purposes, UNIX up to and including System V remained with Novell/Attachmate/Micro Focus. Caldera therefore never had any rights to Ancient UNIX, which means it never had the rights to issue the Caldera license. The Caldera license is null and void – in the U.S. because the copyright has been lost due to formalities, everywhere else because Caldera never had the rights to issue it. The first step to truly freeing UNIX would this be to get Micro Focus to re-issue the Caldera license for Ancient UNIX, ideally it would now also include System III and System V.

* BSD/OS

> Another operating system near UNIX is of interest. The USL v. BSDi lawsuit includes two parties: USL, which we have seen above, and Berkeley Software Design, Inc. BSDi sold BSD/386 (later BSD/OS), which was a derivative of 4.4BSD. The software parts of the BSDi company were acquired by Wind River Systems, whereas the hardware parts went to iXsystems. Copyright is not disputed there, though Wind River Systems ceased selling BSD/OS products 15 years ago, in 2003. In addition, Wind River System let their trademark on BSD expire, though this is without consequence for copyright. BSD/OS is notable in the sense that it powered much of early internet infrastructure. Traces of its legacy can still be found on Richard Stevens’ FAQ. To truly make UNIX history free, BSD/OS would arguably also need to see a source code release. BSD/OS at least in its earliest releases under BSDi would ship with source code, though under a non-free license, far from BSD or even GPL licensing.

* System V

> The fate of System V as a whole is difficult to determine. Various licenses have been granted to a number of vendors (Dell UNIX comes to mind; HP for HP-UX, IBM for AIX, SGI UNIX, etc.). Sun released OpenSolaris – notoriously, Oracle closed the source to Solaris again after its release –, which is a System V Release 4 descendant. However, this means nothing for the copyright or licensing status of System V itself. Presumably, the rights with System V still remain with Novell (now Micro Focus): SCO managed to sublicense rights to develop and sell UnixWare/OpenServer, themselves System V/III descendants, to unXis, Inc. (now known as Xinuos, Inc.), which implies that Xinuos is not the copyright holder of System V. Obviously, to free UNIX, System V and its entire family of descendants would also need to be open sourced. However, I expect tremendous resistance on part of all the companies mentioned. As noted in the “Ancient UNIX” section, Micro Focus alone would probably be sufficient to release System V, though this would mean nothing for the other commercial System V derivatives.

* Newer Research UNIX

> The fate of Bell Labs would be a different one; it would go on to be purchased by Lucent, now part of Nokia. After commercial UNIX got separated out to USL, Research UNIX would continue to exist inside of Bell Labs. Research UNIX V8, V9 and V10 were not quite released by Alcatel-Lucent USA Inc. and Nokia in 2017. However, this is merely a notice that the companies involved will not assert their copyrights only with respect to any non-commercial usage of the code. It is still not possible, over 30 years later, to freely use the V8 code.

* Conclusion In the U.S., Ancient UNIX is freely available. People located everywhere else, however, are unable to legally obtain UNIX code for any of the systems mentioned above. The exception being BSD/OS, assuming a purchase of a legitimate copy of the source code CD. This is deeply unsatisfying and I implore all involved companies to consider open sourcing (preferably under a BSD-style license) their code older than a decade, if nothing else, then at least for the sake of historical purposes. I would like to encourage everybody reading this to consider reaching out to Micro Focus and Wind River Systems about System V and BSD/OS, respectively. Perhaps the masses can change their minds.

> A small note about patents: Some technologies used in newer iterations of the UNIX system (in particular the System V derivatives) may be encumbered with software patents. An open source license will not help against patent infringement claims. However, the patents on anything used in the historical operating systems will certainly have expired by now. In addition, European readers can ignore this entirely – software patents just aren’t a thing.

---

### [OpenBGPD - Adding Diversity to the Route Server Landscape](https://labs.ripe.net/Members/claudio_jeker/openbgpd-adding-diversity-to-route-server-landscape) ###

* Introduction

> As of last year, there was effectively only a single solution in the Route Server vendor market: the BIRD Internet routing daemon. [NIC.CZ](http://NIC.CZ) (the organisation developing BIRD) has done fantastic work on maintaining their BGP-4 implementation, however, it’s not healthy to have virtually every Internet Exchange Point (IXP) in the RIPE NCC service region depend on a single open source project. The current situation can be compared to the state of the DNS root nameservers back in 2002 - their dependence on the BIND nameserver daemon and the resulting development of NSD as an alternative by NLnet, in cooperation with the RIPE NCC. OpenBGPD used to be one of the most popular Route Server implementations until the early 2010s. OpenBGPD’s main problem was that its performance couldn’t keep up with the Internet’s growth, so it lost market share. An analysis by Job Snijders suggested that a modernised OpenBGPD distribution would be a most viable option to regain diversity on the Route Server level.

* Missing features in OpenBGPD

> The following main missing features were identified in OpenBGPD:

* Performance

> In previous versions of OpenBGPD, the filtering performance didn’t allow proper filtering of all EBGP sessions. Current best practice at IXP Route Servers is to carefully evaluate and validate of all routes learned from EBGP peers. The OpenBGPD ruleset required to do correct filtering (in many deployment scenarios) was simply too lengthy - and negatively impacted service performance during configuration reloads. While filtering performance is the biggest bottleneck, general improvements to the Routing Information Base were also made to improve scalability. IXP Route Servers with a few hundred peering sessions are commonplace and adding new sessions shouldn’t impact the Route Servers’ service to other peers. We found that performance was the most pressing issue that needed to be tackled.

* Lack of RPKI Origin Validation

> As we’ve seen, Internet operators are moving to adopt RPKI based BGP Origin Validation. While it was theoretically possible to emulate RFC 6811-style Origin Validation in previous versions of OpenBGPD, the required configuration wasn’t optimised for performance and wasn’t user friendly. We believe that BGP Origin Validation should be as easy as possible - this requires BGP-4 vendors to implement native, optimised routines for Origin Validation. Of course, enabling Origin Validation shouldn’t have an impact on performance either when processing BGP updates or when updating the Route Origin Authorisation (ROA) table itself.

* Portability

> OpenBGPD is an integral part of OpenBSD, but IXPs may prefer to run their services infrastructure on an operating system of their choice. Making sure that there’s a portable OpenBGPD version which follows the OpenBSD project release cycle will give IXPs this option.

* Development steps

> By addressing the issues mentioned above, we could bring back OpenBGPD as a viable Route Server implementation. Since I was one of the core OpenBGPD developers, I was asked if I wanted to pick up this project again. Thanks to the funding from the RIPE NCC Project Fund, this was possible. Starting in June 2018, I worked full time on this important community project. Over the last few months, many of the problems are already addressed and are now part of the OpenBSD 6.4 release. So far, 154 commits were made to OpenBGPD during the 6.4 development cycle - around 8% of all commits ever to OpenBGPD! This shows that due to funding and dedicated resources, a lot of work could be pushed into the latest release of OpenBGPD.

* OpenBGPD 6.4

> The OpenBGPD version, as part of OpenBSD 6.4 release, demonstrates great progress. Even though there have been many changes to the core of OpenBGPD, the released version is as solid and reliable as previous releases and the many bug fixes and improvements make this the best OpenBGPD release so far. The changes in the filter language allow users to write more efficient rulesets while the introduction of RPKI origination validation fixes an important missing feature. For IXPs, OpenBGPD now is an alternative again. There are still open issues, but the gap is closing!

* Feature highlights

> The following changes should be highlighted:

* Introduction of background soft-reconfiguration on config reload. Running the soft-reconfiguration task in the background allows for new updates and withdraws to be processed at the same time. This improves convergence time - one of the key metrics for Route Servers.
* BGP Origin Validation when a roa-set is configured Every EBGP route announcement is validated against the locally configured VRP table entries. Depending on the validation process’s outcome, the validation state is set to valid, invalid or not found. The filter language has been extended to allow checking for the origin validation state, and thanks to this, it is possible to deny invalid prefixes or regard valid prefixes different to the ones that aren’t found. The roa-set table is read from the configuration file and updated during configuration reloads. On production systems reloading the roa-set and applying it to all prefixes is done in a couple of seconds.
* Fast prefix-set lookups In OpenBSD 6.3 prefix-sets got introduced in OpenBGPD. A prefix-set combines many prefix lookups into a single filter rule. The original implementation wasn’t optimised but now a fast trie lookup is used. Thanks to this, large IRR DB prefix tables can now be implemented efficiently.
* Introduction of as-sets Similar to prefix-sets, as-sets help group many AS numbers into a single lookup. Thanks to this, large IRR DB origin AS tables can be implemented efficiently. Introduction of origin-sets
* Looking at the configurations of Route Servers doing full filtering, it was noticed that a common lookup was binding a prefix to an origin AS - similar to how a roa-set is used for RPKI. These origin-set tables are used to extend the IRR prefix lookup and generated from alternative sources.
* Improving third party tools

> Users can only benefit from the changes introduced in OpenBGPD 6.4 when the surrounding 3rd party tools are adjusted accordingly. Two opensource projects such as bgpq3 and arouteserver are frequently used by network operators and IXPs to generate BGP configurations. Thanks to our contributions to those projects, we were able to get them ready for all the new features in OpenBGPD.

* bgpq3 was extended to create as-set and prefix-set tables based on IRR DB entries. This is replacing the old way of doing the same with a large amount of filter rules. Thanks to the quick response from the bgpq3 maintainer, it was possible to ship OpenBSD 6.4 with a bgpq3 package that includes all the new features.
* arouteserver was adjusted to implement RPKI roa-set, as-set, prefix-set, and origin-set to generate a much better-performing configurations for the 6.4 version. With the v0.20.0 release of arouteserver, IXPs are able to generate an OpenBGPD configuration which is a ton faster but also implements the new functionalities. Looking at YYCIX (the resident IXP in Calgary, Canada) the ruleset generated by arouteserver was reduced from 370,000 rules to well under 6,000 rules. This resulted in the initial convergence time dropping from over 1 hour to less than 2 minutes, and subsequent configuration reloads are hitless and no longer noticeable.
* What still needs to be done

> A sizeable chunk of work still left on the table is the rework of the RIB data structures in OpenBGPD - these haven’t been changed since the initial design of OpenBGPD in 2003. There’s currently ongoing work (in small steps, to avoid jeopardising the stability of OpenBGPD) to modernise these data-structures. The goal is to provide better decoupling of the filter step from storing RIB database changes, to pave the way to multi-threaded operations at a later point.

* Looking forward
* Job Snijders oversaw this year’s fundraising and project management, he adds:

> It’s been incredibly productive to create an environment where a core developer is allowed to work full time on the OpenBGPD code base. However, it’s important to note there still is room for a number of new features to help improve its operational capabilities (such as BMP, RFC 7313, ADD\_PATH, etc). It’d be beneficial to the Internet community at large if we can extend Claudio Jeker’s involvement for another year. Open source software doesn’t grow on trees! Strategic investments are the only way to keep OpenBGPD’s roadmap aligned with Internet growth and operator requirements.

---

Beastie Bits
----------

* [DragonFly - git: annotated tag v5.5.0 created](http://lists.dragonflybsd.org/pipermail/commits/2018-November/718130.html)
* [Torchlight 2 on NetBSD](https://www.youtube.com/watch?v=Qvj7Mkr13d8)
* [Older, but still good USENIX Login Article on Capsicum](https://www.usenix.org/system/files/login/articles/login_dec14_03_dawidek.pdf)
* [The Super Capsicumizer 9000](https://github.com/myfreeweb/capsicumizer)
* [Dedicated and Virtual Server PXE provisioning tool](https://www.noc-ps.com/)
* [Cirrus CI have announced FreeBSD support](https://cirrus-ci.org/guide/FreeBSD/)
* [NetBSD PineBook Gameplay](https://twitter.com/astr0baby/status/1065353771952336897)
* [BSDCan 2019 CfP is out](http://www.bsdcan.org/2019/papers.php)
* Allan’s first ZFS array, Zulu, turned 7 years old on Nov 29th

---

Feedback/Questions
----------

* Malcom - [Installing Drivers in Development](http://dpaste.com/35TNNX4)
* Samir - [Introduction to ZFS](http://dpaste.com/2RCB37Y#wrap)
* Newnix - [Drive Failures](http://dpaste.com/01YJ4EB#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---