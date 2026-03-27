+++
title = "316: git commit FreeBSD"
description = "NetBSD LLVM sanitizers and GDB regression test suite, Ada—The Language of Cost Savings, Homura - a Windows Games Launcher for FreeBSD, FreeBSD core team appoints a WG to explore transition to Git, OpenBSD 6.6 Beta tagged, Project Trident 12-U5 update now available, and more.Headl"
date = "2019-09-19T03:00:00Z"
url = "https://www.bsdnow.tv/316"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.603459413Z"
seen = false
+++

NetBSD LLVM sanitizers and GDB regression test suite, Ada—The Language of Cost Savings, Homura - a Windows Games Launcher for FreeBSD, FreeBSD core team appoints a WG to explore transition to Git, OpenBSD 6.6 Beta tagged, Project Trident 12-U5 update now available, and more.

Headlines
----------

### [LLVM santizers and GDB regression test suite.](http://blog.netbsd.org/tnf/entry/llvm_santizers_and_gdb_regression) ###

>
>
> As NetBSD-9 is branched, I have been asked to finish the LLVM sanitizer integration. This work is now accomplished and with MKLLVM=yes build option (by default off), the distribution will be populated with LLVM files for ASan, TSan, MSan, UBSan, libFuzzer, SafeStack and XRay.
>
>
>
> I have also transplanted basesystem GDB patched to my GDB repository and managed to run the GDB regression test-suite.
>
>

* NetBSD distribution changes

>
>
> I have enhanced and imported my local MKSANITIZER code that makes whole distribution sanitization possible. Few real bugs were fixed and a number of patches were newly written to reflect the current NetBSD sources state. I have also merged another chunk of the fruits of the GSoC-2018 project with fuzzing the userland (by plusun@).
>
>

* The following changes were committed to the sources:
  * ab7de18d0283 Cherry-pick upstream compiler-rt patches for LLVM sanitizers
  * 966c62a34e30 Add LLVM sanitizers in the MKLLVM=yes build
  * 8367b667adb9 telnetd: Stop defining the same variables concurrently in bss and data
  * fe72740f64bf fsck: Stop defining the same variable concurrently in bss and data
  * 40e89e890d66 Fix build of t\_ubsan/t\_ubsanxx under MKSANITIZER
  * b71326fd7b67 Avoid symbol clashes in tests/usr.bin/id under MKSANITIZER
  * c581f2e39fa5 Avoid symbol clashes in fs/nfs/nfsservice under MKSANITIZER
  * 030a4686a3c6 Avoid symbol clashes in bin/df under MKSANITIZER
  * fd9679f6e8b1 Avoid symbol clashes in usr.sbin/ypserv/ypserv under MKSANITIZER
  * 5df2d7939ce3 Stop defining \_rpcsvcdirty in bss and data
  * 5fafbe8b8f64 Add missing extern declaration of ib\_mach\_emips in installboot
  * d134584be69a Add SANITIZER\_RENAME\_CLASSES in bsd.prog.mk
  * 2d00d9b08eae Adapt tests/kernel/t\_subr\_prf for MKSANITIZER
  * ce54363fe452 Ship with sanitizer/lsan\_interface.h for GCC 7
  * 7bd5ee95e9a0 Ship with sanitizer/lsan\_interface.h for LLVM 7
  * d8671fba7a78 Set NODEBUG for LLVM sanitizers
  * 242cd44890a2 Add PAXCTL\_FLAG rules for MKSANITIZER
  * 5e80ab99d9ce Avoid symbol clashes in test/rump/modautoload/t\_modautoload with sanitizers
  * e7ce7ecd9c2a sysctl: Add indirection of symbols to remove clash with sanitizers
  * 231aea846aba traceroute: Add indirection of symbol to remove clash with sanitizers
  * 8d85053f487c sockstat: Add indirection of symbols to remove clash with sanitizers
  * 81b333ab151a netstat: Add indirection of symbols to remove clash with sanitizers
  * a472baefefe8 Correct the memset(3)'s third argument in i386 biosdisk.c
  * 7e4e92115bc3 Add ATF c and c++ tests for TSan, MSan, libFuzzer
  * 921ddc9bc97c Set NOSANITIZER in i386 ramdisk image
  * 64361771c78d Enhance MKSANITIZER support
  * 3b5608f80a2b Define target\_not\_supported\_body() in TSan, MSan and libFuzzer tests
  * c27f4619d513 Avoids signedness bit shift in db\_get\_value()
  * 680c5b3cc24f Fix LLVM sanitizer build by GCC (HAVE\_LLVM=no)
  * 4ecfbbba2f2a Rework the LLVM compiler\_rt build rules
  * 748813da5547 Correct the build rules of LLVM sanitizers
  * 20e223156dee Enhance the support of LLVM sanitizers
  * 0bb38eb2f20d Register syms.extra in LLVM sanitizer .syms files
  * Almost all of the mentioned commits were backported to NetBSD-9 and will land 9.0.

---

### [Homura - a Windows Games Launcher for FreeBSD](https://github.com/Alexander88207/Homura) ###

>
>
> Inspired by lutris (a Linux gaming platform), we would like to provide a game launcher to play windows games on FreeBSD.
>
>

* Makes it easier to run games on FreeBSD, by providing the tweaks and dependencies for you
* Dependencies
  * curl
  * bash
  * p7zip
  * zenity
  * webfonts
  * alsa-utils (Optional)
  * winetricks
  * vulkan-tools
  * mesa-demos
  * i386-wine-devel on amd64 or wine-devel on i386

---

News Roundup
----------

### [Ada—The Language of Cost Savings?](https://www.electronicdesign.com/embedded-revolution/ada-language-cost-savings) ###

>
>
> Many myths surround the Ada programming language, but it continues to be used and evolve at the same time. And while the increased adoption of Ada and SPARK, its provable subset, is slow, it’s noticeable. Ada already addresses more of the features found in found in heavily used embedded languages like C+ and C#. It also tackles problems addressed by upcoming languages like Rust.
>
>
>
> Chris concludes, “Development technologies have a profound impact on one of the largest and most variable costs associated with embedded-system engineering—labor. At a time when on-time system deployment can not only impact customer satisfaction, but access to services revenue streams, engineering team efficiency is at a premium. Our research showed that programming language choices can have significant influence in this area, leading to shorter projects, better schedules and, ultimately, lower development costs. While a variety of factors can influence and dictate language choice, our research showed that Ada’s evolution has made it an increasingly compelling option for engineering organizations, providing both technically and financially sound solution.”
>
>
>
> In general, Ada already makes embedded “programming in the large” much easier by handling issues that aren’t even addressed in other languages. Though these features are often provided by third-party software, it results in inconsistent practices among developers. Ada also supports the gamut of embedded platforms from systems like Arm’s Cortex-M through supercomputers. Learning Ada isn’t as hard as one might think and the benefits can be significant.
>
>

---

### [FreeBSD core team appoints a WG to explore transitioning from Subversion to Git.](https://www.freebsd.org/news/status/report-2019-04-2019-06.html#FreeBSD-Core-Team) ###

* The FreeBSD Core Team is the governing body of FreeBSD.

>
>
> Core approved source commit bits for Doug Moore (dougm), Chuck Silvers (chs), Brandon Bergren (bdragon), and a vendor commit bit for Scott Phillips (scottph).
>
>
>
> The annual developer survey closed on 2019-04-02. Of the 397 developers, 243 took the survey with an average completion time of 12 minutes. The public survey closed on 2019-05-13. It was taken by 3637 users and had a 79% completion rate. A presentation of the survey results took place at BSDCan 2019.
>
>
>
> The core team voted to appoint a working group to explore transitioning our source code 'source of truth' from Subversion to Git. Core asked Ed Maste to chair the group as Ed has been researching this topic for some time. For example, Ed gave a MeetBSD 2018 talk on the topic.
>
>
>
> There is a variety of viewpoints within core regarding where and how to host a Git repository, however core feels that Git is the prudent path forward.
>
>

---

### [OpenBSD 6.6 Beta tagged](https://undeadly.org/cgi?action=article;sid=20190810123243) ###

```
CVSROOT:    /cvs
Module name:    src
Changes by:    deraadt@cvs.openbsd.org    2019/08/09 21:56:02

Modified files:
    etc/root : root.mail
    share/mk : sys.mk
    sys/arch/macppc/stand/tbxidata: bsd.tbxi
    sys/conf : newvers.sh
    sys/sys : param.h
    usr.bin/signify: signify.1

Log message:
move to 6.6-beta

```

[Preliminary release notes](https://www.openbsd.org/66.html)

Improved hardware support, including:

* clang(1) is now provided on powerpc.
* IEEE 802.11 wireless stack improvements:
* Generic network stack improvements:
* Installer improvements:
* Security improvements:
* + Routing daemons and other userland network improvements
* + The ntpd(8) daemon now gets and sets the clock in a secure way when booting even when a battery-backed clock is absent.
* + bgdp(8) improvements
* + Assorted improvements:
* + The filesystem buffer cache now more aggressively uses memory outside the DMA region, to improve cache performance on amd64 machines.
* The BER API previously internal to ldap(1), ldapd(8), ypldap(8), and snmpd(8) has been moved into libutil. See ber\_read\_elements(3).
* Support for specifying boot device in vm.conf(5).
* OpenSMTPD 6.6.0
* LibreSSL 3.0.X
* API and Documentation Enhancements
* Completed the port of RSA\_METHOD accessors from the OpenSSL 1.1 API.
* Documented undescribed options and removed unfunctional options description in openssl(1) manual.
* OpenSSH 8.0

---

### [Project Trident 12-U5 update now available](https://project-trident.org/post/2019-09-04_stable12-u5_available/) ###

>
>
> This is the fifth general package update to the STABLE release repository based upon TrueOS 12-Stable.
>
>

* Package changes from Stable 12-U4
* Package Summary

  * New Packages: 20
  * Deleted Packages: 24
  * Updated Packages: 279

* New Packages (20)

  * artemis (biology/artemis) : 17.0.1.11
  * catesc (games/catesc) : 0.6
  * dmlc-core (devel/dmlc-core) : 0.3.105
  * go-wtf (sysutils/go-wtf) : 0.20.0\_1
  * instead (games/instead) : 3.3.0\_1
  * lidarr (net-p2p/lidarr) : 0.6.2.883
  * minerbold (games/minerbold) : 1.4
  * onnx (math/onnx) : 1.5.0
  * openzwave-devel (comms/openzwave-devel) : 1.6.897
  * polkit-qt-1 (sysutils/polkit-qt) : 0.113.0\_8
  * py36-traitsui (graphics/py-traitsui) : 6.1.2
  * rubygem-aws-sigv2 (devel/rubygem-aws-sigv2) : 1.0.1
  * rubygem-default\_value\_for32 (devel/rubygem-default\_value\_for32) : 3.2.0
  * rubygem-ffi110 (devel/rubygem-ffi110) : 1.10.0
  * rubygem-zeitwerk (devel/rubygem-zeitwerk) : 2.1.9
  * sems (net/sems) : 1.7.0.g20190822
  * skypat (devel/skypat) : 3.1.1
  * tvm (math/tvm) : 0.4.1440
  * vavoom (games/vavoom) : 1.33\_15
  * vavoom-extras (games/vavoom-extras) : 1.30\_4

* Deleted Packages (24)

  * geeqie (graphics/geeqie) : Unknown reason
  * iriverter (multimedia/iriverter) : Unknown reason
  * kde5 (x11/kde5) : Unknown reason
  * kicad-doc (cad/kicad-doc) : Unknown reason
  * os-nozfs-buildworld (os/buildworld) : Unknown reason
  * os-nozfs-userland (os/userland) : Unknown reason
  * os-nozfs-userland-base (os/userland-base) : Unknown reason
  * os-nozfs-userland-base-bootstrap (os/userland-base-bootstrap) : Unknown reason
  * os-nozfs-userland-bin (os/userland-bin) : Unknown reason
  * os-nozfs-userland-boot (os/userland-boot) : Unknown reason
  * os-nozfs-userland-conf (os/userland-conf) : Unknown reason
  * os-nozfs-userland-debug (os/userland-debug) : Unknown reason
  * os-nozfs-userland-devtools (os/userland-devtools) : Unknown reason
  * os-nozfs-userland-docs (os/userland-docs) : Unknown reason
  * os-nozfs-userland-lib (os/userland-lib) : Unknown reason
  * os-nozfs-userland-lib32 (os/userland-lib32) : Unknown reason
  * os-nozfs-userland-lib32-development (os/userland-lib32-development) : Unknown reason
  * os-nozfs-userland-rescue (os/userland-rescue) : Unknown reason
  * os-nozfs-userland-sbin (os/userland-sbin) : Unknown reason
  * os-nozfs-userland-tests (os/userland-tests) : Unknown reason
  * photoprint (print/photoprint) : Unknown reason
  * plasma5-plasma (x11/plasma5-plasma) : Unknown reason
  * polkit-qt5 (sysutils/polkit-qt) : Unknown reason
  * secpanel (security/secpanel) : Unknown reason

---

Beastie Bits
----------

* [DragonFlyBSD - msdosfs updates](https://www.dragonflydigest.com/2019/09/10/23472.html)
* [Stand out as a speaker](https://science.sciencemag.org/content/365/6455/834.full)
* [Not a review of the 7th Gen X1 Carbon](http://akpoff.com/archive/2019/not_a_review_of_the_lenovo_x1c7.html)
* [FreeBSD Meets Linux At The Open Source Summit](https://www.tfir.io/2019/08/24/freebsd-meets-linux-at-the-open-source-summit/)
* [QEMU VM Escape](https://blog.bi0s.in/2019/08/24/Pwn/VM-Escape/2019-07-29-qemu-vm-escape-cve-2019-14378/)
* [Porting wine to amd64 on NetBSD, third evaluation report.](http://blog.netbsd.org/tnf/entry/porting_wine_to_amd64_on1)
* [OpenBSD disabled DoH by default in Firefox](https://undeadly.org/cgi?action=article;sid=20190911113856)

---

Feedback/Questions
----------

* Reinis - [GELI with UEFI](http://dpaste.com/0SG8630#wrap)
* Mason - [Beeping](http://dpaste.com/1FQN173)

[CHVT feedback]  
 DJ - [Feedback](http://dpaste.com/08M3XNH#wrap)  
 Ben - [chvt](http://dpaste.com/274RVCE#wrap)  
 Harri - [Marc's chvt question](http://dpaste.com/23R1YMK#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.