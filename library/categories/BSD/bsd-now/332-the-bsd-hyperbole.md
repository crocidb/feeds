+++
title = "332: The BSD Hyperbole"
description = "Announcing HyperbolaBSD, IPFW In-Kernel NAT setup on FreeBSD, Wayland and WebRTC enabled for NetBSD 9/Linux, LLDB Threading support ready for mainline, OpenSSH U2F/FIDO support in base, Dragonfly drm/i915: Update, and more.Headlines[HyperbolaBSD Announcement](https:"
date = "2020-01-09T13:00:00Z"
url = "https://www.bsdnow.tv/332"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.573122807Z"
seen = false
+++

Announcing HyperbolaBSD, IPFW In-Kernel NAT setup on FreeBSD, Wayland and WebRTC enabled for NetBSD 9/Linux, LLDB Threading support ready for mainline, OpenSSH U2F/FIDO support in base, Dragonfly drm/i915: Update, and more.

Headlines
----------

### [HyperbolaBSD Announcement](https://www.hyperbola.info/news/announcing-hyperbolabsd-roadmap/) ###

>
>
> Due to the Linux kernel rapidly proceeding down an unstable path, we are planning on implementing a completely new OS derived from several BSD implementations.
>
>
>
> This was not an easy decision to make, but we wish to use our time and resources to create a viable alternative to the current operating system trends which are actively seeking to undermine user choice and freedom.
>
>
>
> This will not be a "distro", but a hard fork of the OpenBSD kernel and userspace including new code written under GPLv3 and LGPLv3 to replace GPL-incompatible parts and non-free ones.
>
>

* Reasons for this include:
  * Linux kernel forcing adaption of DRM, including HDCP.
  * Linux kernel proposed usage of Rust (which contains freedom flaws and a centralized code repository that is more prone to cyber attack and generally requires internet access to use.)
  * Linux kernel being written without security and in mind. (KSPP is basically a dead project and Grsec is no longer free software)
  * Many GNU userspace and core utils are all forcing adaption of features without build time options to disable them. E.g. (PulseAudio / SystemD / Rust / Java as forced dependencies)
  * As such, we will continue to support the Milky Way branch until 2022 when our legacy Linux-libre kernel reaches End of Life.

>
>
> Future versions of Hyperbola will be using HyperbolaBSD which will have the new kernel, userspace and not be ABI compatible with previous versions.
>
>
>
> HyperbolaBSD is intended to be modular and minimalist so other projects will be able to re-use the code under free license.
>
>

* [Forum Post](https://forums.hyperbola.info/viewtopic.php?id=315)

---

### [A simple IPFW In-Kernel NAT setup on FreeBSD](https://www.neelc.org/posts/freebsd-ipfw-nat/) ###

>
>
> After graduating college, I am moving from Brooklyn, NY to Redmond, WA (guess where I got a job). I always wanted to re-do my OPNsense firewall (currently a HP T730) with stock FreeBSD and IPFW’s in-kernel NAT.
>
>
>
> Why IPFW? Benchmarks have shown IPFW to be faster which is especially good for my Tor relay, and because I can! However, one downside of IPFW is less documentation vs PF, even less without natd (which we’re not using), and this took me time to figure this out.
>
>
>
> But since my T730 is already packed, I am testing this on a old PC with two NICs, and my laptop [1] as a client with an USB-to-Ethernet adapter.
>
>

---

News Roundup
----------

### [HEADS UP: Wayland and WebRTC enabled for NetBSD 9/Linux](https://mail-index.netbsd.org/pkgsrc-users/2020/01/05/msg030124.html) ###

>
>
> This is just a heads up that the Wayland option is now turned on by
>
>

default for NetBSD 9 and Linux in cases where it peacefully coexists  
 with X11.

* Right now, this effects the following packages:
  * graphics/MesaLib
  * devel/SDL2
  * www/webkit-gtk
  * x11/gtk3

>
>
> The WebRTC option has also been enabled by default on NetBSD 9 for two Firefox versions: www/firefox, www/firefox68
>
>
>
> Please keep me informed of any fallout. Hopefully, there will be none.
>
>
>
> If you want to try out Wayland-related things on NetBSD 9, wm/velox/MESSAGE may be interesting for you.
>
>

---

### [LLDB Threading support now ready for mainline](https://blog.netbsd.org/tnf/entry/lldb_threading_support_now_ready) ###

>
>
> Upstream describes LLDB as a next generation, high-performance debugger. It is built on top of LLVM/Clang toolchain, and features great integration with it. At the moment, it primarily supports debugging C, C++ and ObjC code, and there is interest in extending it to more languages.
>
>
>
> In February, I have started working on LLDB, as contracted by the NetBSD Foundation. So far I've been working on reenabling continuous integration, squashing bugs, improving NetBSD core file support, extending NetBSD's ptrace interface to cover more register types and fix compat32 issues and fixing watchpoint support. Then, I've started working on improving thread support which is taking longer than expected. You can read more about that in my September 2019 report.
>
>
>
> So far the number of issues uncovered while enabling proper threading support has stopped me from merging the work-in-progress patches. However, I've finally reached the point where I believe that the current work can be merged and the remaining problems can be resolved afterwards. More on that and other LLVM-related events happening during the last month in this report.
>
>

---

### [OpenSSH U2F/FIDO support in base](https://www.undeadly.org/cgi?action=article;sid=20191115064850) ###

>
>
> Hardware backed keys can be generated using "ssh-keygen -t ecdsa-sk" (or "ed25519-sk" if your token supports it). Many tokens require to be touched/tapped to confirm this step.
>
>
>
> You'll get a public/private keypair back as usual, except in this case, the private key file does not contain a highly-sensitive private key but instead holds a "key handle" that is used by the security key to derive the real private key at signing time.
>
>
>
> So, stealing a copy of the private key file without also stealing your security key (or access to it) should not give the attacker anything.
>
>

---

### [drm/i915: Update to Linux 4.8.17](http://lists.dragonflybsd.org/pipermail/commits/2019-December/720257.html) ###

* drm/i915: Update to Linux 4.8.17
  * Broxton, Valleyview and Cherryview support improvements
  * Broadwell and Gen9/Skylake support improvements
  * Broadwell brightness fixes from OpenBSD
  * Atomic modesetting improvements
  * Various bug fixes and performance enhancements

---

Beastie Bits
----------

* [Visual Studio Code port for FreeBSD](https://github.com/tagattie/FreeBSD-VSCode)
* [OpenBSD syscall call-from verification](https://marc.info/?l=openbsd-tech&m=157488907117170&w=2)
* [Peertube on OpenBSD](https://www.22decembre.eu/en/2019/12/09/peertube-14-openbsd/)
* [Fuzzing Filesystems on NetBSD via AFL+KCOV by Maciej Grochowski](https://www.youtube.com/watch?v=bbNCqFdQEyk&feature=youtu.be)
* [Twitter Bot for Prop65](https://twitter.com/prop65bot/status/1199003319307558912)
* [Interactive vim tutorial](https://www.openvim.com/)
* [First BSD user group meeting in Hamilton, February 11, 2020 18:30 - 21:00, Boston Pizza on Upper James St](http://studybsd.com/) \*\*\*

Feedback/Questions
----------

* Samir - [cgit](http://dpaste.com/2B22M24#wrap)
* Russell - [R](http://dpaste.com/0J5TYY0#wrap)
* Wolfgang - [Question](http://dpaste.com/3MQAH27#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.