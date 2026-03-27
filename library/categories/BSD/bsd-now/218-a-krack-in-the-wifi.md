+++
title = "218: A KRACK in the WiFi"
description = "FreeBSD 10.4-RELEASE is here, more EuroBSDcon travel notes, the KRACK attack, ZFS and DTrace on NetBSD, and pfsense 2.4.This episode was brought to you byiXsystems - Enterprise Servers and Storage for Open Source[![Di"
date = "2017-11-01T12:00:00Z"
url = "https://www.bsdnow.tv/218"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.833871666Z"
seen = false
+++

FreeBSD 10.4-RELEASE is here, more EuroBSDcon travel notes, the KRACK attack, ZFS and DTrace on NetBSD, and pfsense 2.4.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeBSD 10.4-RELEASE Available](https://www.freebsd.org/releases/10.4R/announce.html) ###

* FreeBSD 10.4-RELEASE is out. The FreeBSD Project dedicates the FreeBSD 10.4-RELEASE to the memory of Andrey A. Chernov.
* Some of the highlights:

>
>
> 10.4-RELEASE is the first FreeBSD release to feature full support for eMMC storage, including eMMC partitions, TRIM and bus speed modes up to HS400. Please note, though, that availability of especially the DDR52, HS200 and HS400 modes requires support in the actual sdhci(4) front-end as well as by the hardware used. Also note, that the SDHCI controller part of Intel® Apollo Lake chipsets is affected by several severe silicon bugs. Apparently, it depends on the particular Apollo Lake platform whether the workarounds in place so far are sufficient to avoid timeouts on attaching sdhci(4) there.  
>  Also in case a GPT disk label is used, the fsck\_ffs(8) utility now is able to find alternate superblocks.  
>  The aesni(4) driver now no longer shares a single FPU context across multiple sessions in multiple threads, addressing problems seen when employing aesni(4) for accelerating ipsec(4).  
>  Support for the Kaby Lake generation of Intel® i219(4)/ i219(5) devices has been added to the em(4) driver.  
>  The em(4) driver is now capable of enabling Wake On LAN (WOL) also for Intel® i217, i218 and i219 chips. Note that stale interface configurations from previous unsuccessful attempts to enable WOL for these devices now will actually take effect. For example, an `ifconfig em0 wol` activates all WOL variants including wol\_mcast, which might be undesirable.  
>  Support for WOL has been added to the igb(4) driver, which was not able to activate this feature on any device before. The same remark regarding stale WOL configurations as for the em(4) driver applies.  
>  Userland coredumps can now trigger events such as generating a human readable crash report via devd(8). This feature is off by default.  
>  The firmware shipping with the qlxgbe(4) driver has been updated to version 5.4.66. Additionally, this driver has received some TSO and locking fixes, performance optimizations as well as SYSCTLs providing MAC, RX and TX statistics.  
>  Mellanox® ConnectX-4 series adapters are now supported by the newly added mlx5ib(4) driver.  
>  OpenSSH received an update to version 7.3p1.  
>  GNOME has been updated to version 3.18.  
>  Xorg-Server has been updated to version 1.18.4.
>
>

* Check out the full release notes and upgrade your systems to 10.4-RELEASE. Thanks to the FreeBSD Release Engineering Team for their efforts. \*\*\*

### [EuroBSDcon 2017: "travel notes" after the conference](https://blog.netbsd.org/tnf/entry/eurobsdcon_2017_travel_notes_after) ###

* Leonardo Taccari posted in the NetBSD blog about his experiences at EuroBSDcon 2017:

>
>
> Let me tell you about my experience at EuroBSDcon 2017 in Paris, France. We will see what was presented during the NetBSD developer summit on Friday and then we will give a look to all of the NetBSD and pkgsrc presentations given during the conference session on Saturday and Sunday. Of course, a lot of fun also happened on the "hall track", the several breaks during the conference and the dinners we had together with other \*BSD developers and community! This is difficult to describe and I will try to just share some part of that with photographs that we have taken. I can just say that it was a really beautiful experience, I had a great time with others and, after coming back home... ...I miss all of that! :) So, if you have never been in any BSD conferences I strongly suggest you to go to the next ones, so please stay tuned via NetBSD Events. Being there this is probably the only way to understand these feelings!
>
>

* Thursday (21/09): NetBSD developers dinner

>
>
> Arriving in Paris via a night train from Italy I literally sleep-walked through Paris getting lost again and again. After getting in touch with other developers we had a dinner together and went sightseeing for a<sup>Wseveral</sup> beers!  
>  Friday (22/09): NetBSD developers summit  
>  On Friday morning we met for the NetBSD developers summit kindly hosted by Arolla.  
>  NetBSD on Google Compute Engine -- Benny Siegert (bsiegert)  
>  Scripting DDB with Forth -- Valery Ushakov (uwe)  
>  News from the version control front -- Jörg Sonnenberger (joerg)  
>  Afternoon discussions and dinner  
>  After the lunch we had several non-scheduled discussions, some time for hacking, etc.  
>  We then had a nice dinner together (it was in a restaurant with a very nice waiter who always shouted after every order or after accidentally dropping and crashing dishes!, yeah! That's probably a bit weird but I liked that attitude! :)) and then did some sightseeing and had a beer together.
>
>

* Saturday (23/09): First day of conference session and Social Event

>
>
> A Modern Replacement for BSD spell(1) -- Abhinav Upadhyay (abhinav)  
>  Portable Hotplugging: NetBSD's uvm\_hotplug(9) API development -- Cherry G.  
>  Mathew (cherry)  
>  Hardening pkgsrc -- Pierre Pronchery (khorben)  
>  Reproducible builds on NetBSD -- Christos Zoulas (christos)
>
>

* Social event

>
>
> The social event on Saturday evening took place on a boat that cruised on the Seine river.  
>  It was a very nice and different way to sightsee Paris, eat and enjoy some drinks and socialize and discuss with other developers and community.
>
>
>
> * Sunday (24/09): Second day of conference session The school of hard knocks - PT1 -- Sevan Janiyan (sevan) The LLDB Debugger on NetBSD -- Kamil Rytarowski (kamil) What's in store for NetBSD 8.0? -- Alistair Crooks (agc)
>
>

* Sunday dinner

>
>
> After the conference we did some sightseeing in Paris, had a dinner together and then enjoyed some beers!
>
>

* Conclusion

>
>
> It was a very nice weekend and conference. It is worth to mention that EuroBSDcon 2017 was the biggest BSD conference (more than 300 people attended it!).  
>  I would like to thank the entire EuroBSDcon organising committee (Baptiste Daroussin, Antoine Jacoutot, Jean-Sébastien Pédron and Jean-Yves Migeon), EuroBSDcon programme committee (Antoine Jacoutot, Lars Engels, Ollivier Robert, Sevan Janiyan, Jörg Sonnenberger, Jasper Lievisse Adriaanse and Janne Johansson) and EuroBSDcon Foundation for organizing such a wonderful conference!  
>  I also would like to thank the speakers for presenting very interesting talks, all developers and community that attended the NetBSD devsummit and conference, in particular Jean-Yves and Jörg, for organizing and moderating the devsummit and Arolla that kindly hosted us for the NetBSD devsummit!  
>  A special thanks also to Abhinav (abhinav) and Martin (martin) for photographs and locals Jean-Yves (jym) and Stoned (seb) for helping us in not get lost in Paris' rues! :)
>
>

* Thank you! \*\*\*

### [WiFi Vulnerability in WPA2: KRACK](https://www.krackattacks.com/) ###

>
>
> We discovered serious weaknesses in WPA2, a protocol that secures all modern protected Wi-Fi networks. An attacker within range of a victim can exploit these weaknesses using key reinstallation attacks (KRACKs). Concretely, attackers can use this novel attack technique to read information that was previously assumed to be safely encrypted. This can be abused to steal sensitive information such as credit card numbers, passwords, chat messages, emails, photos, and so on. The attack works against all modern protected Wi-Fi networks. Depending on the network configuration, it is also possible to inject and manipulate data. For example, an attacker might be able to inject ransomware or other malware into websites.  
>  Note that if your device supports Wi-Fi, it is most likely affected. During our initial research, we discovered ourselves that Android, Linux, Apple, Windows, OpenBSD, MediaTek, Linksys, and others, are all affected by some variant of the attacks. For more information about specific products, consult the database of CERT/CC, or contact your vendor.
>
>

* [FreeBSD Advisory ](https://www.freebsd.org/security/advisories/FreeBSD-SA-17:07.wpa.asc)
* As of the date of this recording, a few weeks ahead of when this episode will air, the issue is fixed in FreeBSD 11.0 and 11.1, and a workaround has been provided for 10.3 and 10.4 (install newer wpa\_supplicant from ports). A fix for 10.3 and 10.4 is expected soon. They will more than likely be out by time you are watching this.
* The fix for 10.3 and 10.4 is more complicated because the version of wpa\_supplicant included in the base system is 2.0, from January 2013, so is nearly 5 years old, so the patches do not apply cleanly. The security team is still considering if it will try to patch 2.0, or just replace the version of wpa\_supplicant with 2.5 from FreeBSD 11.x.
* OpenBSD was unwilling to wait when the embargo was extended on this vulnerability and stealth fixed the issue on [Aug 30th](https://marc.info/?l=openbsd-cvs&m=150410571407760&w=2)
* [stsp@openbsd.org s Mastodon post](https://mastodon.social/@stsp/98837563531323569)
* [Lobste.rs conversation about flaw and OpenBSDs reaction](https://lobste.rs/s/dwzplh/krack_attacks_breaking_wpa2#c_pbhnfz)

>
>
> What happened is that he told me on July 15, and gave a 6 weeks embargo until end of August. We already complained back then that this was way too long and leaving people exposed. Then he got CERT (and, thus, US gov agencies) involved and had to extend the embargo even further until today. At that point we already had the ball rolling and decided to stick to the original agreement with him, and he gave us an agreeing nod towards that as well.  
>  In this situation, a request for keeping the problem and fix secret is a request to leave our users at risk and exposed to insiders who will potentially use the bug to exploit our users. And we have no idea who the other insiders are. We have to assume that information of this kind leaks and dissipates pretty fast in the security community.  
>  We chose to serve the needs of our users who are the vulnerable people in this drama. I stand by that choice.
>
>

* As a result of this:

>
>
> To avoid this problem in the future, OpenBSD will now receive vulnerability notifications closer to the end of an embargo.
>
>

* NetBSD: [patches for the WPA issues in KRACK Attacks were committed Oct 16th to HEAD & are pending pullup to 6/7/8 branches](http://mail-index.netbsd.org/source-changes/2017/10/16/msg088877.html)
* As of this recording, Dragonfly appears to use wpa\_supplicant 2.1 which they imported in 2014 and has [not been touched in over a year](https://github.com/DragonFlyBSD/DragonFlyBSD/commits/master/contrib/wpa_supplicant) \*\*\*

News Roundup
----------

### [NetBSD - dtrace and ZFS update](https://mail-index.netbsd.org/tech-kern/2017/10/13/msg022436.html) ###

* Chuck Silvers writes to the tech-kern mailing list of NetBSD:

>
>
> I've been working on updating netbsd's copy of the dtrace and zfs code to rebase from the existing ancient opensolaris version to a recent freebsd version. most of the freebsd changes are pretty close to what netbsd needs, so that seems like a more useful upstream for us. I have things working well enough now that I want to share the code in preparation for committing.
>
>

* this update improves upon our existing dtrace/zfs code in several ways:

>
>
> picks up all the upstream zfs fixes and enhancements from the last decade  
>  zfs now supports mmap on netbsd, so you can run executables stored in zfs  
>  dtrace fbt probes can now be used in kernel modules (such as zfs)
>
>

* A patch is provided here: [http://ftp.netbsd.org/pub/NetBSD/misc/chs/diff.cddl.20171012](http://ftp.netbsd.org/pub/NetBSD/misc/chs/diff.cddl.20171012) which needs to be applied using patch -E as it adds and removes files.
* He provides the following summary for the diff:

>
>
> freebsd's dtrace/zfs code as of r315983 (2017-03-26), adapted for netbsd.  
>  a few updates to our copy of freebsd's libproc.  
>  build system support for using -fno-omit-frame-pointer everywhere and disabling other compiler optimizations that confuse dtrace.  
>  sample kernel config changes for a couple evbarm configs (the ones I tested).  
>  module/ksyms enhancements for dtrace integration.  
>  genfs API enhancements to support zfs.  
>  an option to have mutexes not become no-ops during a panic.  
>  uvm\_aobj API change to support 64-bit aobj sizes (eg. for tmpfs).
>
>

* Known issues with the patch include:

>
>
> unloading the zfs module fails even with no zpools imported if you've done much with zfs since it was loaded. there's some refcounting problem that I haven't tracked down yet.  
>  the module refcounting for active fbt probes is bogus. currently module refcounting is protected by kernconfig\_lock(), but taking that lock down in the bowels of dtrace seems likely to create deadlocks. I plan to do something fancier but haven't gotten to it yet.  
>  the dtrace uregs[] stuff is probably still wrong.  
>  the CTF typeid overflow problem is still there (more on this below).
>
>

* Unsupported features include:

>
>
> the ".zfs" virtual directory, eg. ".zfs/snapshot/foo@bar"  
>  zvols  
>  ZFS ACLs (aka. NFSv4 ACLs)  
>  NFS exporting a ZFS file system  
>  setting dtrace probes in application code  
>  using ZFS as the root fs  
>  new crypto hashes SHA512\_256, skein, and edonr (the last one is not in freebsd yet either)  
>  zio delay injection (used for testing zfs)  
>  dtrace support for platforms other than x86 and arm
>
>

* A more detailed description of the CTF typeid overflow is also provided. Check out the full thread with followups and try out the patch if youre on NetBSD. \*\*\*

### [pfSense 2.4.0-RELEASE Now Available!](https://www.netgate.com/blog/pfsense-2-4-0-release-now-available.html) ###

* Jim Pingle writes about the new release:

>
>
> We are excited to announce the release of pfSense® software version 2.4, now available for new installations and upgrades!  
>  pfSense software version 2.4.0 was a herculean effort! It is the culmination of 18 months of hard work by Netgate and community contributors, with over 290 items resolved. According to git, 671 files were changed with a total 1651680 lines added, and 185727 lines deleted. Most of those added lines are from translated strings for multiple language support!
>
>
>
> * Highlights
>
>
>
> FreeBSD 11.1-RELEASE as the base Operating System  
>  New pfSense installer based on bsdinstall, with support for ZFS, UEFI, and multiple types of partition layouts (e.g. GPT, BIOS)  
>  Support for Netgate ARM devices such as the SG-1000  
>  OpenVPN 2.4.x support, which brings features like AES-GCM ciphers, speed improvements, Negotiable Crypto Parameters (NCP), TLS encryption, and dual stack/multihome  
>  Translation of the GUI into 13 different languages! For more information on contributing to the translation effort, read our previous blog post and visit the project on Zanata  
>  WebGUI improvements, such as a new login page, improved GET/POST CSRF handling, significant improvements to the Dashboard and its AJAX handling  
>  Certificate Management improvements including CSR signing and international character support  
>  Captive Portal has been rewritten to work without multiple instances of ipfw
>
>

* Important Information:

>
>
> 32-bit x86 and NanoBSD have been deprecated and are not supported on pfSense 2.4.
>
>

* Read the full release notes and let them know how you like the new release. \*\*\*

### [OpenBSD changes of note 629](https://www.tedunangst.com/flak/post/openbsd-changes-of-note-629) ###

* Use getrusage to measure CPU time in md5 benchmarking.
* Add guard pages at the end of kernel stacks so overflows dont run into important stuff.
  * This would be useful in FreeBSD, even just to detect the condition. I had all kinds of strange crashes when I was accidently overflowing the stack when working on the initial version of the ZSTD patches before ZSTD gained a working heap mode.

* Add dwxe driver for ethernet found on Allwinner A64, H3 and H5 SoCs.
* Fix a regression caused by removal of SIGIO from some devices.
* In malloc, always delay freeing chunks and change F option to perform a more extensive check for double free.
* Change sendsyslog prototype to take a string, since theres little point logging not strings.
* The config program tries to modify zero initialized variables. Previous versions of gcc were patched to place these in the data segment, instead of the bss, but clang has no such patches. Long long ago, this was the default behavior for compilers, which is why gcc was patched to maintain that existing behavior, but now we want a slightly less unusual toolchain. Fix the underlying issue for now by annotating such variables with a data section attribute. \*\*\*

### [t2k17 Hackathon Report: Philip Guenther: locking and libc](https://undeadly.org/cgi?action=article;sid=20170824080132) ###

* Next up in our series of t2k17 hackathon reports is this one from Philip Guenther:

>
>
> I showed up at t2k17 with a couple hold-over diffs from e2k17 that weren't stable then and hadn't gotten much better since, so after a red-eye through Chicago I arrived in the hackroom, fired up my laptop and synced trees.  
>  Meanwhile, people trickled in and the best part of hackathons, the conversations and "what do you think about this?" chats started. Theo introduced me to Todd Mortimer (mortimer@), who's been hacking on clang to implement RETGUARD for C programs. Over the hackathon we discussed a few loose ends that cropped up and what the correct behavior should be for them as well as the mechanics of avoiding 0xc3 bytes (the RET opcode) embedded in the middle of other multi-byte x86 machine code. Fun stuff.  
>  Martin (mpi@) and I had a conversation about the desirability of being able to sleep while holding netlock and pretty much came down on "oof, the scheduler does need work before the underlying issue driving this question can be resolved enough to answer it". :-(  
>  After some final hammering I got in an enhancement to pool(9) to let a pool use (sleeping) rwlocks instead of (spinning) mutexes and then immediately used that for the per-CPU pool cache pool as well as the futex pool. Further pools are likely to be converted as well kernel upper-level locking changes are made.  
>  Speaking of, a larger diff I had been working on for said upper-level locking was still suffering deadlock issues so I took a stab at narrowing it down to just a lock for the process tree, mostly mirroring the FreeBSD proctree\_lock. That appears to be holding up much better and I just have some code arrangement issues around sys\_ptrace() before that'll go out for final review.  
>  Then most of the way through the week, Bob (beck@) vocally complained that life would be easier for libressl if we had some version of pthread\_once() and the pthread mutex routines in libc. This would make some other stuff easier too (c.f. /usr/X11R6/lib/libpthread-stubs.\*) and the TIB work over the last couple years has basically eliminated the runtime costs of doing so, so I spent most the rest of the hackathon finding the right place to draw a line through libpthread and move everything on the one side of the line into libc. That code seems pretty stable and the xenocara and ports people seem to likeor at least acceptthe effects, so it will almost certainly go in with the next libc bump.  
>  Lots of other random conversations, hacking, meals, and beer. Many thanks to Ken (krw@) and local conspirators for another excellent Toronto hackathon!
>
>
> ---
>

Beastie Bits
----------

* [2017 NetBSD Foundation Officers](https://blog.netbsd.org/tnf/entry/2017_netbsd_foundation_officers)
* [New BSDMag is out - Military Grade Data Wiping in FreeBSD with BCWipe](https://bsdmag.org/download/military-grade-data-wiping-freebsd-bcwipe/)
* [LibertyBSD 6.1 released](http://libertybsd.net/) \*\*\*

Feedback/Questions
----------

* Eddy - [EuroBSDCon 2017 video and some help](http://dpaste.com/3WDNV05#wrap)
* Eric - [ZFS monitoring](http://dpaste.com/2RP0S60#wrap)
* Tom - [BSD Hosting](http://dpaste.com/31DGH3J#wrap) \*\*\*