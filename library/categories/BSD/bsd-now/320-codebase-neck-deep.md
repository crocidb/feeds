+++
title = "320: Codebase: Neck Deep"
description = "HeadlinesFreeBSD and custom firmware on the Google Pixelbook * FreeBSD and custom firmware on the Google PixelbookBack in 2015, I jumped on the ThinkPad bandwagon b"
date = "2019-10-17T03:00:00Z"
url = "https://www.bsdnow.tv/320"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.595295129Z"
seen = false
+++

Headlines
----------

### [FreeBSD and custom firmware on the Google Pixelbook](https://unrelenting.technology/articles/FreeBSD-and-custom-firmware-on-the-Google-Pixelbook) ###

* FreeBSD and custom firmware on the Google Pixelbook

>
>
> Back in 2015, I jumped on the ThinkPad bandwagon by getting an X240 to run FreeBSD on. Unlike most people in the ThinkPad crowd, I actually liked the clickpad and didn\\u2019t use the trackpoint much. But this summer I\\u2019ve decided that it was time for something newer. I wanted something..
>
>

* lighter and thinner (ha, turns out this is actually important, I got tired of carrying a T H I C C laptop - Apple was right all along);
* with a 3:2 display (why is Lenovo making these Serious Work\\u2122 laptops 16:9 in the first place?? 16:9 is awful in below-13-inch sizes especially);
* with a HiDPI display (and ideally with a good size for exact 2x scaling instead of fractional);
* with USB-C ports;
* without a dGPU, especially without an NVIDIA GPU;
* assembled with screws and not glue (I don\\u2019t necessarily need expansion and stuff in a laptop all that much, but being able to replace the battery without dealing with a glued chassis is good);
* supported by FreeBSD of course (\\u201csome development required\\u201d is okay but I\\u2019m not going to write big drivers);
* how about something with open source firmware, that would be fun.

>
>
> I was considering a ThinkPad X1 Carbon from an old generation - the one from the same year as the X230 is corebootable, so that\\u2019s fun. But going back in processor generations just doesn\\u2019t feel great. I want something more efficient, not less!
>
>
>
> And then I discovered the Pixelbook. Other than the big huge large bezels around the screen, I liked everything about it. Thin aluminum design, a 3:2 HiDPI screen, rubber palm rests (why isn\\u2019t every laptop ever doing that?!), the \\u201cconvertibleness\\u201d (flip the screen around to turn it into.. something rather big for a tablet, but it is useful actually), a Wacom touchscreen that supports a pen, mostly reasonable hardware (Intel Wi-Fi), and that famous coreboot support (Chromebooks\\u2019 stock firmware is coreboot + depthcharge).
>
>
>
> So here it is, my new laptop, a Google Pixelbook.
>
>

* Conclusion

>
>
> Pixelbook, FreeBSD, coreboot, EDK2 good.
>
>
>
> Seriously, I have no big words to say, other than just recommending this laptop to FOSS enthusiasts :)
>
>

---

### [Porting NetBSD to the AMD x86-64: a case study in OS portability](https://www.usenix.org/legacy/publications/library/proceedings/bsdcon02/full_papers/linden/linden_html/index.html) ###

* Abstract

>
>
> NetBSD is known as a very portable operating system, currently running on 44 different architectures (12 different types of CPU). This paper takes a look at what has been done to make it portable, and how this has decreased the amount of effort needed to port NetBSD to a new architecture. The new AMD x86-64 architecture, of which the specifications were published at the end of 2000, with hardware to follow in 2002, is used as an example.
>
>

* Portability

>
>
> Supporting multiple platforms was a primary goal of the NetBSD project from the start. As NetBSD was ported to more and more platforms, the NetBSD kernel code was adapted to become more portable along the way.
>
>

* General

>
>
> Generally, code is shared between ports as much as possible. In NetBSD, it should always be considered if the code can be assumed to be useful on other architectures, present or future. If so, it is machine-independent and put it in an appropriate place in the source tree. When writing code that is intended to be machine-independent, and it contains conditional preprocessor statements depending on the architecture, then the code is likely wrong, or an extra abstraction layer is needed to get rid of these statements.
>
>

* Types

>
>
> Assumptions about the size of any type are not made. Assumptions made about type sizes on 32-bit platforms were a large problem when 64-bit platforms came around. Most of the problems of this kind had to be dealt with when NetBSD was ported to the DEC Alpha in 1994. A variation on this problem had to be dealt with with the UltraSPARC (sparc64) port in 1998, which is 64-bit, but big endian (vs. the little-endianness of the Alpha). When interacting with datastructures of a fixed size, such as on-disk metadata for filesystems, or datastructures directly interpreted by device hardware, explicitly sized types are used, such as uint32\_t, int8\_t, etc.
>
>

* Conclusions and future work

>
>
> The port of NetBSD to AMD's x86-64 architecture was done in six weeks, which confirms NetBSD's reputation as being a very portable operating system. One week was spent setting up the cross-toolchain and reading the x86-64 specifications, three weeks were spent writing the kernel code, one week was spent writing the userspace code, and one week testing and debugging it all. No problems were observed in any of the machine-independent parts of the kernel during test runs; all (simulated) device drivers, file systems, etc, worked without modification.
>
>

---

News Roundup
----------

### [ZFS performance really does degrade as you approach quota limits](https://utcc.utoronto.ca/~cks/space/blog/solaris/ZFSFullQuotaPerformanceIssue) ###

>
>
> Every so often (currently monthly), there is an "OpenZFS leadership meeting". What this really means is 'lead developers from the various ZFS implementations get together to talk about things'. Announcements and meeting notes from these meetings get sent out to various mailing lists, including the ZFS on Linux ones.
>
>

* In the September meeting notes, I read a very interesting (to me) agenda item:
  * Relax quota semantics for improved performance (Allan Jude)
  * Problem: As you approach quotas, ZFS performance degrades.
  * Proposal: Can we have a property like quota-policy=strict or loose, where we can optionally allow ZFS to run over the quota as long as performance is not decreased.

>
>
> This is very interesting to me because of two reasons. First, in the past we have definitely seen significant problems on our OmniOS machines, both when an entire pool hits a quota limit and when a single filesystem hits a refquota limit. It's nice to know that this wasn't just our imagination and that there is a real issue here. Even better, it might someday be improved (and perhaps in a way that we can use at least some of the time).
>
>
>
> Second, any number of people here run very close to and sometimes at the quota limits of both filesystems and pools, fundamentally because people aren't willing to buy more space. We have in the past assumed that this was relatively harmless and would only make people run out of space. If this is a known issue that causes serious performance degradation, well, I don't know if there's anything we can do, but at least we're going to have to think about it and maybe push harder at people. The first step will have to be learning the details of what's going on at the ZFS level to cause the slowdown. (It's apparently similar to what happens when the pool is almost full, but I don't know the specifics of that either.)
>
>
>
> With that said, we don't seem to have seen clear adverse effects on our Linux fileservers, and they've definitely run into quota limits (repeatedly). One possible reason for this is that having lots of RAM and SSDs makes the effects mostly go away. Another possible reason is that we haven't been looking closely enough to see that we're experiencing global slowdowns that correlate to filesystems hitting quota limits. We've had issues before with somewhat subtle slowdowns that we didn't understand (cf), so I can't discount that we're having it happen again.
>
>

---

### [Fixing up KA9Q-unix, or "neck deep in 30 year old codebases.."](http://adrianchadd.blogspot.com/2019/09/fixing-up-ka9q-unix-or-neck-deep-in-30.html) ###

>
>
> I'll preface this by saying - yes, I'm still neck deep in FreeBSD's wifi stack and 802.11ac support, but it turns out it's slow work to fix 15 year old locking related issues that worked fine on 11abg cards, kinda worked ok on 11n cards, and are terrible for these 11ac cards. I'll .. get there.
>
>
>
> Anyhoo, I've finally been mucking around with AX.25 packet radio. I've been wanting to do this since I was a teenager and found out about its existence, but back in high school and .. well, until a few years ago really .. I didn't have my amateur radio licence. But, now I do, and I've done a bunch of other stuff with a bunch of other radios. The main stumbling block? All my devices are either Apple products or run FreeBSD - and none of them have useful AX.25 stacks. The main stacks of choice these days run on Linux, Windows or are a full hardware TNC.
>
>
>
> So yes, I was avoiding hacking on AX.25 stuff because there wasn't a BSD compatible AX.25 stack. I'm 40 now, leave me be.
>
>
>
> But! A few weeks ago I found that someone was still running a packet BBS out of San Francisco. And amazingly, his local node ran on FreeBSD! It turns out Jeremy (KK6JJJ) ported both an old copy of KA9Q and N0ARY-BBS to run on FreeBSD! Cool!
>
>
>
> I grabbed my 2m radio (which is already cabled up for digital modes), compiled up his KA9Q port, figured out how to get it to speak to Direwolf, and .. ok. Well, it worked. Kinda.
>
>

---

### [HAMMER2 and fsck for review](https://www.dragonflydigest.com/2019/09/24/23540.html) ###

>
>
> HAMMER2 is Copy on Write, meaning changes are made to copies of existing data. This means operations are generally atomic and can survive a power outage, etc. (You should read up on it!) However, there\\u2019s now a fsck command, useful if you want a report of data validity rather than any manual repair process.
>
>

---

### [The return of startx(1) for non-root users [with some caveats](https://undeadly.org/cgi?action=article;sid=20190917091236) ###

Mark Kettenis (kettenis@) has recently committed changes which restore a certain amount of startx(1)/xinit(1) functionality for non-root users. The commit messages explain the situation:

```
CVSROOT:    /cvs
Module name:    src
Changes by:    kettenis@cvs.openbsd.org    2019/09/15 06:25:41

Modified files:
    etc/etc.amd64  : fbtab
    etc/etc.arm64  : fbtab
    etc/etc.hppa   : fbtab
    etc/etc.i386   : fbtab
    etc/etc.loongson: fbtab
    etc/etc.luna88k: fbtab
    etc/etc.macppc : fbtab
    etc/etc.octeon : fbtab
    etc/etc.sgi    : fbtab
    etc/etc.sparc64: fbtab

Log message:
Add ttyC4 to lost of devices to change when logging in on ttyC0 (and in some cases also the serial console) such that X can use it as its VT when running without root privileges.

ok jsg@, matthieu@
CVSROOT:    /cvs
Module name:    xenocara
Changes by:    kettenis@cvs.openbsd.org    2019/09/15 06:31:08

Modified files:
    xserver/hw/xfree86/common: xf86AutoConfig.c

Log message:
Add modesetting driver as a fall-back when appropriate such that we can use it when running without root privileges which prevents us from scanning the PCI bus.

This makes startx(1)/xinit(1) work again on modern systems with inteldrm(4), radeondrm(4) and amdgpu(4).  In some cases this will result in using a different driver than with xenodm(4) which may expose issues (e.g. when we prefer the intel Xorg driver) or loss of acceleration (e.g. older cards supported by radeondrm(4)).

ok jsg@, matthieu@

```

---

Beastie Bits
----------

* [ASCII table and history. Or, why does Ctrl+i insert a Tab in my terminal?](https://bestasciitable.com/)
* [Sourcehut makes BSD software better](https://sourcehut.org/blog/2019-09-12-sourcehut-makes-bsd-software-better/)
* [Chaosnet for Unx](https://github.com/LM-3/chaos)
* [The Vim-Inspired Editor with a Linguistic Twist](https://cosine.blue/2019-09-06-kakoune.html)
* [bhyvearm64: CPU and Memory Virtualization on Armv8.0-A](https://papers.freebsd.org/2019/bsdcan/elisei-bhyvearm64_cpu_and_memory_virtualization_on_armv8.0_a/)
* [DefCon25 - Are all BSD created Equally - A Survey of BSD Kernel vulnerabilities](https://www.youtube.com/watch?v=a2m56Yq-EIs)

---

Feedback/Questions
----------

* Tim - [GSoC project ideas for pf rule syntax translation](http://dpaste.com/1RCSFK7#wrap)
* Brad - [Steam on FreeBSD](http://dpaste.com/2SKA9YB#wrap)
* Ruslan - [FreeBSD Quarterly Status Report - Q2 2019](http://dpaste.com/0DQM3Q1)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.