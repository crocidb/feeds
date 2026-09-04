+++
title = "159: Net Scaling Privacy (Flix Style)"
description = "This week on BSDNow! We’ve got Netflix + FreeBSD news to discuss, always a crowd pleaser, that plus EuroBSDCon is just around the corner. Stick around for your placeThis episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Open Source](/images/"
date = "2016-09-14T12:00:00Z"
url = "https://www.bsdnow.tv/159"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.000882328Z"
seen = true
+++

This week on BSDNow! We’ve got Netflix + FreeBSD news to discuss, always a crowd pleaser, that plus EuroBSDCon is just around the corner. Stick around for your place

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[ href="http://www.digitalocean.com/" title="DigitalOcean"\>![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)]()[ href="http://www.tarsnap.com/bsdnow" title="Tarsnap"\>![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)]()

---

Headlines
----------

### [Protecting Netflix Viewing Privacy at Scale, with FreeBSD](http://techblog.netflix.com/search/label/FreeBSD) ###

* This blog post from Netflix tells the story of how Netflix developed in-kernel TLS to speed up delivery of video via HTTPS

>
>
> Since the beginning of the Open Connect program we have significantly increased the efficiency of our OCAs - from delivering 8 Gbps of throughput from a single server in 2012 to over 90 Gbps from a single server in 2016. We contribute to this effort on the software side by optimizing every aspect of the software for our unique use case - in particular, focusing on the open source FreeBSD operating system and the NGINX web server that run on the OCAs.
>
>
>
> In the modern internet world, we have to focus not only on efficiency, but also security. There are many state-of-the-art security mechanisms in place at Netflix, including Transport Level Security (TLS) encryption of customer information, search queries, and other confidential data. We have always relied on pre-encoded Digital Rights Management (DRM) to secure our video streams. Over the past year, we’ve begun to use Secure HTTP (HTTP over TLS or HTTPS) to encrypt the transport of the video content as well. This helps protect member privacy, particularly when the network is insecure - ensuring that our members are safe from eavesdropping by anyone who might want to record their viewing habits.
>
>
>
> The goal is to ensure that your government, ISP, and wifi sniffing neighbour cannot tell which Netflix videos you are watching
>
>
>
> Netflix Open Connect serves over 125 million hours of content per day, all around the world. Given our scale, adding the overhead of TLS encryption calculations to our video stream transport had the potential to greatly reduce the efficiency of our global infrastructure.
>
>
>
> We evaluated available and applicable ciphers and decided to primarily use the Advanced Encryption Standard (AES) cipher in Galois/Counter Mode (GCM), available starting in TLS 1.2. We chose AES-GCM over the Cipher Block Chaining (CBC) method, which comes at a higher computational cost. The AES-GCM cipher algorithm encrypts and authenticates the message simultaneously - as opposed to AES-CBC, which requires an additional pass over the data to generate keyed-hash message authentication code (HMAC). CBC can still be used as a fallback for clients that cannot support the preferred method.
>
>
>
> All revisions of Open Connect Appliances also have Intel CPUs that support AES-NI, the extension to the x86 instruction set designed to improve encryption and decryption performance. We needed to determine the best implementation of AES-GCM with the AES-NI instruction set, so we investigated alternatives to OpenSSL, including BoringSSL and the Intel Intelligent Storage Acceleration Library (ISA-L).
>
>
>
> Netflix and NGINX had previously worked together to improve our HTTP client request and response time via the use of sendfile calls to perform a zero-copy data flow from storage (HDD or SSD) to network socket, keeping the data in the kernel memory address space and relieving some of the CPU burden. The Netflix team specifically added the ability to make the sendfile calls asynchronous - further reducing the data path and enabling more simultaneous connections. However, TLS functionality, which requires the data to be passed to the application layer, was incompatible with the sendfile approach.
>
>
>
> To retain the benefits of the sendfile model while adding TLS functionality, we designed a hybrid TLS scheme whereby session management stays in the application space, but the bulk encryption is inserted into the sendfile data pipeline in the kernel. This extends sendfile to support encrypting data for TLS/SSL connections.
>
>
>
> We tested the BoringSSL and ISA-L AES-GCM implementations with our sendfile improvements against a baseline of OpenSSL (with no sendfile changes), under typical Netflix traffic conditions on three different OCA hardware types. Our changes in both the BoringSSL and ISA-L test situations significantly increased both CPU utilization and bandwidth over baseline - increasing performance by up to 30%, depending on the OCA hardware version. We chose the ISA-L cipher implementation, which had slightly better results. With these improvements in place, we can continue the process of adding TLS to our video streams for clients that support it, without suffering prohibitive performance hits.
>
>

* If you would like more detail, check out the papers from [AsiaBSDCon 2015](https://people.freebsd.org/~rrs/asiabsd_2015_tls.pdf) and the [updated one from 2016](https://people.freebsd.org/~rrs/asiabsd_tls_improved.pdf) \*\*\*

### [OpenBSD on HP Stream 7](http://www.tedunangst.com/flak/post/OpenBSD-on-HP-Stream-7) ###

>
>
> Recent events have rocked the mobile computing world to its core. OpenBSD retired the zaurus port, leaving users in desperate need of a new device. And not long before that, Microsoft released the Anniversary Update to Windows 10, but with free space requirements such that it’s nigh impossible to install on cheap 32GB eMMC equipped devices such as the HP Stream series, leaving users searching for a new lightweight operating system. With necessity as both mother and father, the scene is set for a truly epic pairing. OpenBSD on the HP Stream 7.
>
>
>
> The HP Stream line is a series of budget computers in a couple form factors. The Stream 11 is a fairly typical netbook. However, the Stream 7 and 8 are tablets. They look like cheap Android devices, but inside the case, they’re real boys, er PCs, with Intel Atom CPUs.
>
>
>
> To install OpenBSD on such a device, we need a few parts. Obviously, the tablet itself. There’s a dearth of ports on these things, but there is a micro USB port. Attaching anything useful requires an OTG “on the go” cable that creates a type A port. Attaching more than one useful thing requires a mini hub. And completing the install requires one each USB stick, keyboard, and network adapter.
>
>
>
> First, we need to prep the machine to boot from USB. Actually, before doing anything, make sure you have a full charge. It’s going to be battery only from here on out. Plug everything in. Flash drive, keyboard, and network into the hub, hub into the OTG cable, cable into the port on top of the Stream.
>
>
>
> Turn on the machine while holding the volume down button. This launches a mini menu from which we can enter the BIOS. There’s a little on screen keyboard in the corner, so this can be done even without a keyboard attached, but the USB keyboard should work. We need to change two settings in the boot section. First, turn off secure boot. Second, switch boot order to prefer USB. Save and exit. The first reboot reveals a confirmation screen checking that we really want to disable secure boot. We must enter a PIN and press enter. Enter the PIN shown on the screen and press enter. And we are go.
>
>

* Then boot up OpenBSD from the USB drive

* Ted then works there a number of kernel panics and device driver issues, but after disabling ACPI and IntelDRM, the device boots OpenBSD.

>
>
> Of course, there’s no X at this point. And definitely no touch screen. And no internal networking. However, by keeping our USB hub attached, we can drive the console and access the network. At least until the battery is depleted, even if we have no way of knowing how long that will be since we disabled all the ACPI devices, which also means no suspend or resume.
>
>

* With some xorg.conf hacking, he did get Xorg working \*\*\*

### [DragonflyBSD steps towards base LibreSSL](http://lists.dragonflybsd.org/pipermail/commits/2016-September/624493.html) ###

* [Project: DragonFlyBSD / Switch base to use private LibreSSL libraries](http://freshbsd.org/commit/dfbsd/304ca408000cd34559ef5319b4b5a6766d6eb35b)
* [DragonFly BSD adopts uses of LibreSSL](http://undeadly.org/cgi?action=article&sid=20160911231651)
* The number of projects beginning to switch over to LibreSSL is growing and it appears we can now throw DragonFly into that camp.
* Following something that sounds vaguely familiar (Allan!) DFLY is now creating “private” LibreSSL libraries which are only linked against by base system binaries.
* For the moment OpenSSL is *still* built, primarily so that various ports and 3rd party apps can continue to function as before.
* A NO\_OPENSSL option has also been added, but doesn’t really do much (yet), since it’ll still build and install headers / libraries even if set. \*\*\*

### OpenBSD g2k16 Hackathon ###

* [g2k16 Hackathon Report: Antoine Jacoutot on Binary Patches](http://undeadly.org/cgi?action=article&sid=20160911012316)
* [g2k16 Hackathon Report: Matthieu Herrb on xenodm](http://undeadly.org/cgi?action=article&sid=20160911231712)
* [g2k16 Hackathon Report: Vincent Gross on iked(8), armv7 and sys/netinet[6]](http://undeadly.org/cgi?action=article&sid=20160911000337)
* [g2k16 Hackathon Report: Florian Obser on httpd, networking, acme-client, and more](http://undeadly.org/cgi?action=article&sid=20160911000052)
* [g2k16 Hackathon Report: Jasper Lievisse Adriaanse on ddb(4) and more](http://undeadly.org/cgi?action=article&sid=20160909012520)
* [g2k16 Hackathon Report: Christian Weisgerber on gettext progress, RTC work, removing kernel cruft](http://undeadly.org/cgi?action=article&sid=20160908002430)
* [g2k16 Hackathon Report: Brent Cook on Chromebooks, crypto, and more](http://undeadly.org/cgi?action=article&sid=20160907131655)
* [g2k16 Hackathon Report: Ted Unangst on doas, signify, code removal](http://undeadly.org/cgi?action=article&sid=20160906230610)
* [g2k16 Hackathon Report: Marc Espie on package signing evolution](http://undeadly.org/cgi?action=article&sid=20160905235911)
* [g2k16 Hackathon Report: Adam Wolk on ports, wireless drivers and more](http://undeadly.org/cgi?action=article&sid=20160906004915)
* [g2k16 Hackathon Report: Mike Larkin on vmm + vmd progress](http://undeadly.org/cgi?action=article&sid=20160905134009&mode=expanded) \*\*\*

News Roundup
----------

### [OpenBSD (with encrypted softraid) on the Chromebook Pixel](https://jcs.org/notaweblog/2016/08/26/openbsd_chromebook/) ###

* Looking for a Laptop to make your OpenBSD road-warrior? If so, we have a great blog tutorial on getting OpenBSD setup on the Chromebook Pixel with encrypted softraid!
* Author Joshua Stein gives us a very verbose look at how to install and dial-in the laptop perfectly. But first for those wondering about the hardware in the pixel:

>
>
> The Chromebook Pixel LS (2015) has an Intel Core i7 processor (Broadwell) at 2.4Ghz, 16Gb of RAM, a 2560x1700 400-nit IPS screen (239ppi), and Intel 802.11ac wireless. It has a Kingston 64Gib flash chip, of which about 54Gib can be used by OpenBSD when dual-booting with a 1Gb Chrome OS partition.
>
>

* Due to this being a chromebook with seaBIOS, some manual key-press trickery will be required to initially get the OpenBSD Installer up and running.
* From here you’ll want to pay special close attention to the disk partitioning. In particular Joshua will show us how to shrink the existing encrypted /home that ChromeOS uses, keeping the dual-boot intact. This will become important if you ever plan on updating the device.
* From here, we move back to a more traditional setup, but with the added bonus of doing a soft-raid setup.
* But the fun isn’t over yet! If you want to make OpenBSD the default boot, that’ll require cracking the lid on the device and removing a special pink write-protect screw. And of course if you want to remove the default splash-screen image, Joshua has you covered as well, although some flashrom magic will be required.
* At this point you are nearly done. Final details on enabling specific bits of hardware are discussed. Most things work, apart from Audio and Bluetooth as of right now. \*\*\*

### [doas mastery](http://www.tedunangst.com/flak/post/doas-mastery) ###

* “doas” mastery - Paging MWL!
* Our buddy Ted Unangst has written up a great ‘mastery’ guide of the doas command, which can come in handy if you are among the un-initiated in doas land.

>
>
> UNIX systems have two classes of user, the super user and regular users. The super user is super, and everybody else is not. This concentration of power keeps things simple, but also means that often too much power is granted. Usually we only need super user powers to perform one task. We would rather not have such power all the time. Think of the responsibility that would entail! Like the sudo command, doas allows for subdivision of super user privileges, granting them only for specific tasks.
>
>

* He starts with the basic doas.conf setup, which starts with an empty config file
* The doas config is much like a pf ruleset, the default is to block everything \> We add the root rule second because doas evaluates rules in a last match manner. root is in the wheel group, so the first rule will match, and then we need to override that with a second rule. Remember to always start with general rules, then make them more specific. \*\*\*

### iXsystems ###

* [iXsystems to host MeetBSD](https://www.ixsystems.com/blog/ixsystems-host-meetbsd-california-2016-uc-berkeley/)

---

### FreeBSD Foundation Welcomes New Board Members ###

* [New Board Members](https://www.freebsdfoundation.org/blog/freebsd-foundation-welcomes-new-board-members/)
* The FreeBSD Foundation has added two new board members
* [Interview with Kylie Liang](https://www.freebsdfoundation.org/blog/new-board-member-interview-kylie-liang/)
* Kylie will focus on representing FreeBSD at conferences and businesses in China

>
>
> I live in China. There, I can act as a bridge between Chinese companies and the FreeBSD community to help drive FreeBSD adoption. Through my leadership role in the FreeBSD Foundation, I will help promote FreeBSD in China and also represent the Foundation at conferences and events in my region.
>
>

* Kylie leads the team the ensures FreeBSD runs well on Hyper-V and Azure, including providing commercial support for customers who run FreeBSD or FreeBSD based appliances on the Azure Cloud

>
>
> I joined Microsoft and started to lead the project called FreeBSD Integration Service to get FreeBSD running well on Hyper-V and Azure. To promote our work and to understand the FreeBSD ecosystem, I started to participate in FreeBSD events where I was inspired by this technical community.
>
>

* [Interview with Philip Paeps](https://www.freebsdfoundation.org/blog/new-board-member-interview-philip-paeps/)
* Philip started with FreeBSD in the early 2000s and got his commit bit in 2004

>
>
> The patches I submitted to make ACPI and input devices work on that laptop led to a src commit bit in 2004. While I haven’t worked on ACPI or input devices since, I have been contributing to different areas of the kernel. Taking up maintainership of some ports I cared about also got me a ports commit bit after some time.
>
>

* Philip will continue to help run EuroBSDCon, but is also spreading the word about FreeBSD in India and Africa

>
>
> Primarily, I think I can be useful! I attend (and organize) a number of conferences around the world every year, particularly in regions that have a mostly “stealthy” FreeBSD community. While I clearly don’t need to be on the FreeBSD Foundation board to advocate for FreeBSD, joining as a director will provide an additional asset when working in areas of the world where organizational affiliations are meaningful.
>
>

* Philip has also developed network drivers and various other bits and pieces, and has extensive experience working with and for hardware vendors and appliance vendors

>
>
> Despite intending to eventually contribute their code to the FreeBSD Project as open source, many hardware vendors still find it very difficult to engage directly with the FreeBSD development community. The Foundation helps bridge that gap and helps facilitate collaboration between commercial vendors and the FreeBSD community.
>
>
>
> I hope to make FreeBSD more visible in regions of the world where it is historically under-represented. I expect I will be attending even more conferences and getting myself invited to even more organizations.
>
>
> ---
>

### [more, less, and a story of typical Unix fossilization](https://utcc.utoronto.ca/~cks/space/blog/unix/MoreAndUnixFossilization) ###

* Chris Siebenmann from the University of Toronto digs into the history of the difference between ‘less’ and ‘more’

>
>
> In the beginning, by which we mean V7, Unix didn't have a pager at all. That was okay; Unix wasn't very visual in those days, partly because it was still sort of the era of the hard copy terminal. Then along came Berkeley and BSD. People at Berkeley were into CRT terminals, and so BSD Unix gave us things like vi and the first pager program, more (which showed up quite early, in 3BSD, although this isn't as early as vi, which appears in 2BSD). Calling a pager more is a little bit odd but it's a Unix type of name and from the beginning more prompted you with '--More--' at the bottom of the screen.
>
>
>
> All of the Unix vendors that based their work on BSD Unix (like Sun and DEC) naturally shipped versions of more along with the rest of the BSD programs, and so more spread around the BSD side of things. However, more was by no means the best pager ever; as you might expect, it was actually a bit primitive and lacking in features. So fairly early on Mark Nudelman wrote a pager with somewhat more features and it wound up being called less as somewhat of a joke.
>
>
>
> In a sane world, Unix vendors would have either replaced their version of more with the clearly superior less or at least updated their version of more to the 4.3 BSD version. Maybe less wouldn't have replaced more immediately, but certainly over say the next five years, when it kept on being better and most people kept preferring it when they had a choice.”
>
>
>
> * “This entire history has led to a series of vaguely absurd outcomes on various modern Unixes. On Solaris derivatives more is of course the traditional version with source code that can probably trace itself all the way back to 3BSD, carefully updated to SUS compliance. Solaris would never dream of changing what more is, not even if the replacement is better. Why, it might disturb someone.
>
>
>
> Oddly, FreeBSD has done the most sensible thing; they've outright replaced more with less. There is a /usr/bin/more but it's the same binary as less and as you can see the more manpage is just the less manpage. OpenBSD has done the same thing but has a specific manpage for more instead of just giving you the less manpage.
>
>
>
> So, now you can see why I say that less is more, or more, or both, at several levels. less is certainly more than more, and sometimes less literally is more (or rather more is less, to put it the right way around).
>
>
> ---
>

Beastie Bits
----------

* [PC-BSD listed in the top 8 'best' alternatives to Windows 10](http://www.computerworlduk.com/galleries/operating-systems/-free-alternatives-windows-10-3639433/)

* [Creating a quick DNS server with a Rapsberry Pi2 and FreeBSD 11.0-RC1](http://bsdimp.blogspot.co.uk/2016/08/creating-quick-dns-server-with.html)

* [Dual Boot OpenBSD and Linux + UEFI](https://bsdlaptops.wordpress.com/2016/03/07/vaio-pro-11-part-2/)

* [DesktopBSD 2.0 various versions available (Gnome, Lumina, KDE, LXDE)](http://desktopbsd.boards.net/board/10/announcements)

* FreeBSD gets new ZFS features including: [Compressed ARC ](https://svnweb.freebsd.org/base?view=revision&revision=305323) and [ZFS Allocation Throttle ](https://svnweb.freebsd.org/base?view=revision&revision=305331)

* [One Floppy NetBSD Distribution](https://github.com/user340/fdgw2)

* [A Compendium of BUGs](https://github.com/q5sys/BUGtracker)

  ---

Feedback/Questions
----------

* [ Galahad - OpenBSD X setup](http://pastebin.com/b7W6NHqs)
* [ Tang - Subtitles](http://pastebin.com/P4MUs3Pa)
* [ Ivan - Zpool Options](http://pastebin.com/LQ8yTp0G)
* [ Brad - Replication Issue](http://pastebin.com/XTK5gXMU)
* [ MJ - HBA](http://pastebin.com/TdYTMSj9) \*\*\*