+++
title = "296: It’s Alive: OpenBSD 6.5"
description = "OpenBSD 6.5 has been released, mount ZFS datasets anywhere, help test upcoming NetBSD 9 branch, LibreSSL 2.9.1 is available, Bail Bond Denied Edition of FreeBSD Mastery: Jails, and one reason ed(1) was a good editor back in the days in this week’s episode.Headlines["
date = "2019-05-03T17:00:00Z"
url = "https://www.bsdnow.tv/296"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.642169383Z"
seen = false
+++

OpenBSD 6.5 has been released, mount ZFS datasets anywhere, help test upcoming NetBSD 9 branch, LibreSSL 2.9.1 is available, Bail Bond Denied Edition of FreeBSD Mastery: Jails, and one reason ed(1) was a good editor back in the days in this week’s episode.

Headlines
----------

### [OpenBSD 6.5 Released](https://www.openbsd.org/65.html) ###

* [Changelog](https://www.openbsd.org/plus65.html)
* [Mirrors](https://www.openbsd.org/ftp.html)
* 6.5 Includes
  * OpenSMTPD 6.5.0
  * LibreSSL 2.9.1
  * OpenSSH 8.0
  * Mandoc 1.14.5
  * Xenocara
  * LLVM/Clang 7.0.1 (+ patches)
  * GCC 4.2.1 (+ patches) and 3.3.6 (+ patches)

* Many pre-built packages for each architecture:
  * aarch64: 9654
  * amd64: 10602
  * i386: 10535

---

### [Mount your ZFS datasets anywhere you want](https://dan.langille.org/2019/04/22/mount-your-zfs-datasets-anywhere-you-want/) ###

>
>
> ZFS is very flexible about mountpoints, and there are many features available to provide great flexibility. When you create zpool main*tank, the default mountpoint is /main*tank. You might be happy with that, but you don’t have to be content. You can do magical things.
>
>

* Some highlights are:
  * mount point can be inherited
  * not all filesystems in a zpool need to be mounted
  * each filesystem (directory) can have different ZFS characteristics
  * In my case, let’s look at this new zpool I created earlier today and I will show you some very simple alternatives. This zpool use NVMe devices which should be faster than SSDs especially when used with multiple concurrent writes. This is my plan: run all the Bacula regression tests concurrently.

---

News Roundup
----------

### [Branch for netbsd 9 upcoming, please help and test -current](https://mail-index.netbsd.org/current-users/2019/04/24/msg035645.html) ###

>
>
> Folks, once again we are quite late for branching the next NetBSD release (NetBSD 9). Initially planned to happen early in February 2019, we are now approaching May and it is unlikely that the branch will happen before that. On the positive side, lots of good things landed in -current in between, like new Mesa, new jemalloc, lots of ZFS improvements - and some of those would be hard to pull up to the branch later. On the bad side we saw lots of churn in -current recently, and there is quite some fallout where we not even have a good overview right now. And this is where you can help:
>
>
>
> * please test -current, on all the various machines you have
> * especially interesting would be test results from uncommon architectures or strange combinations (like the sparc userland on sparc64 kernel issue I ran in yesterday) Please test, report success, and file PRs for failures! We will likely announce the real branch date on quite short notice, the likely next candidates would be mid may or end of may. We may need to do extra steps after the branch (like switch some architectures back to old jemalloc on the branch). However, the less difference between -current and the branch, the easier will the release cycle go. Our goal is to have an unprecedented short release cycle this time. But.. we always say that upfront.
>
>
> ---
>

### [LibreSSL 2.9.1 Released](https://marc.info/?l=openbsd-announce&m=155590112606279&w=2) ###

>
>
> We have released LibreSSL 2.9.1, which will be arriving in the LibreSSL directory of your local OpenBSD mirror soon. This is the first stable release from the 2.9 series, which is also included with OpenBSD 6.5
>
>
>
> It includes the following changes and improvements from LibreSSL 2.8.x:
>
>

* API and Documentation Enhancements

  * CRYPTO\_LOCK is now automatically initialized, with the legacy callbacks stubbed for compatibility.
  * Added the SM3 hash function from the Chinese standard GB/T 32905-2016.
  * Added the SM4 block cipher from the Chinese standard GB/T 32907-2016.
  * Added more OPENSSL*NO*\* macros for compatibility with OpenSSL.
  * Partial port of the OpenSSL EC*KEY*METHOD API for use by OpenSSH.
  * Implemented further missing OpenSSL 1.1 API.
  * Added support for XChaCha20 and XChaCha20-Poly1305.
  * Added support for AES key wrap constructions via the EVP interface.

* Compatibility Changes

  * Added pbkdf2 key derivation support to openssl(1) enc.
  * Changed the default digest type of openssl(1) enc to sha256.
  * Changed the default digest type of openssl(1) dgst to sha256.
  * Changed the default digest type of openssl(1) x509 -fingerprint to sha256.
  * Changed the default digest type of openssl(1) crl -fingerprint to sha256.

* Testing and Proactive Security

  * Added extensive interoperability tests between LibreSSL and OpenSSL 1.0 and 1.1.
  * Added additional Wycheproof tests and related bug fixes.

* Internal Improvements

  * Simplified sigalgs option processing and handshake signing algorithm selection.
  * Added the ability to use the RSA PSS algorithm for handshake signatures.
  * Added bn*rand*interval() and use it in code needing ranges of random bn values.
  * Added functionality to derive early, handshake, and application secrets as per RFC8446.
  * Added handshake state machine from RFC8446.
  * Removed some ASN.1 related code from libcrypto that had not been used since around 2000.
  * Unexported internal symbols and internalized more record layer structs.
  * Removed SHA224 based handshake signatures from consideration for use in a TLS 1.2 handshake.

* Portable Improvements

  * Added support for assembly optimizations on 32-bit ARM ELF targets.
  * Added support for assembly optimizations on Mingw-w64 targets.
  * Improved Android compatibility

* Bug Fixes

  * Improved protection against timing side channels in ECDSA signature generation.

  * Coordinate blinding was added to some elliptic curves. This is the last bit of the work by Brumley et al. to protect against the Portsmash vulnerability.

  * Ensure transcript handshake is always freed with TLS 1.2.

>
>
> The LibreSSL project continues improvement of the codebase to reflect modern, safe programming practices. We welcome feedback and improvements from the broader community. Thanks to all of the contributors who helped make this release possible.
>
>
> ---
>

### [FreeBSD Mastery: Jails – Bail Bond Denied Edition](https://mwl.io/archives/4227) ###

>
>
> I had a brilliant, hideous idea: to produce a charity edition of FreeBSD Mastery: Jails featuring the cover art I would use if I was imprisoned and did not have access to a real cover artist. (Never mind that I wouldn’t be permitted to release books while in jail: we creative sorts scoff at mere legal and cultural details.) I originally wanted to produce my own take on the book’s cover art. My first attempt failed spectacularly. I downgraded my expectations and tried again. And again. And again. I’m pleased to reveal the final cover for FreeBSD Mastery: Jails–Bail Bond Edition! This cover represents the very pinnacle of my artistic talents, and is the result of literally hours of effort. But, as this book is available only to the winner of charity fund-raisers, purchase of this tome represents moral supremacy. I recommend flaunting it to your family, coworkers, and all those of lesser character. Get your copy by winning the BSDCan 2019 charity auction… or any other other auction-type event I deem worthwhile. As far as my moral fiber goes: I have learned that art is hard, and that artists are not paid enough. And if I am ever imprisoned, I do hope that you’ll contribute to my bail fund. Otherwise, you’ll get more covers like this one.
>
>

---

### [One reason ed(1) was a good editor back in the days of V7 Unix](https://utcc.utoronto.ca/~cks/space/blog/unix/EdDesignedForCookedInput) ###

>
>
> It is common to describe ed(1) as being line oriented, as opposed to screen oriented editors like vi. This is completely accurate but it is perhaps not a complete enough description for today, because ed is line oriented in a way that is now uncommon. After all, you could say that your shell is line oriented too, and very few people use shells that work and feel the same way ed does. The surface difference between most people's shells and ed is that most people's shells have some version of cursor based interactive editing. The deeper difference is that this requires the shell to run in character by character TTY input mode, also called raw mode. By contrast, ed runs in what Unix usually calls cooked mode, where it reads whole lines from the kernel and the kernel handles things like backspace. All of ed's commands are designed so that they work in this line focused way (including being terminated by the end of the line), and as a whole ed's interface makes this whole line input approach natural. In fact I think ed makes it so natural that it's hard to think of things as being any other way. Ed was designed for line at a time input, not just to not be screen oriented. This input mode difference is not very important today, but in the days of V7 and serial terminals it made a real difference. In cooked mode, V7 ran very little code when you entered each character; almost everything was deferred until it could be processed in bulk by the kernel, and then handed to ed all in a single line which ed could also process all at once. A version of ed that tried to work in raw mode would have been much more resource intensive, even if it still operated on single lines at a time.
>
>

---

Beastie Bits
----------

* [CFT for FreeBSD ZoL](https://lists.freebsd.org/pipermail/freebsd-fs/2019-April/027603.html)
* [Simple DNS Adblock](https://github.com/wilyarti/simple-dns-adblock)
* [AT&T Unix PC in 1985](https://twitter.com/unix_byte/status/1119904828182781958)
* [OpenBSD-current drm at 4.19, includes new support for Intel GPUs like Coffee Lake](https://marc.info/?l=openbsd-cvs&m=155523690813457&w=2)
* ["What are the differences between Linux and OpenBSD?" - Twitter thread](https://twitter.com/cfenollosa/status/1122069042083323904)
* [Announcing the pkgsrc-2019Q1 release (2019-04-10)](http://mail-index.netbsd.org/pkgsrc-users/2019/04/10/msg028308.html)

---

Feedback/Questions
----------

* Brad - [iocage](http://dpaste.com/0K2QFTM#wrap)
* Frank - [Video from Level1Tech and a question](http://dpaste.com/3110R96#wrap)
* Niall - [Revision Control](http://dpaste.com/0A32XDK#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

 Your browser does not support the HTML5 video tag.