+++
title = "Episode 241: Bowling in the LimeLight | BSD Now 241"
description = "Second round of ZFS improvements in FreeBSD, Postgres finds that non-FreeBSD/non-Illumos systems are corrupting data, interview with Kevin Bowling, BSDCan list of talks, and cryptographic right answers.Headlines[Other big ZFS improvements you might have missed] *"
date = "2018-04-12T13:00:00Z"
url = "https://www.bsdnow.tv/241"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.767397828Z"
seen = false
+++

Second round of ZFS improvements in FreeBSD, Postgres finds that non-FreeBSD/non-Illumos systems are corrupting data, interview with Kevin Bowling, BSDCan list of talks, and cryptographic right answers.

Headlines
----------

### [Other big ZFS improvements you might have missed] ###

* [9075 Improve ZFS pool import/load process and corrupted pool recovery](https://svnweb.freebsd.org/base?view=revision&revision=329798)
  >
  >
  > One of the first tasks during the pool load process is to parse a config provided from userland that describes what devices the pool is composed of. A vdev tree is generated from that config, and then all the vdevs are opened. The Meta Object Set (MOS) of the pool is accessed, and several metadata objects that are necessary to load the pool are read. The exact configuration of the pool is also stored inside the MOS. Since the configuration provided from userland is external and might not accurately describe the vdev tree of the pool at the txg that is being loaded, it cannot be relied upon to safely operate the pool. For that reason, the configuration in the MOS is read early on. In the past, the two configurations were compared together and if there was a mismatch then the load process was aborted and an error was returned. The latter was a good way to ensure a pool does not get corrupted, however it made the pool load process needlessly fragile in cases where the vdev configuration changed or the userland configuration was outdated. Since the MOS is stored in 3 copies, the configuration provided by userland doesn't have to be perfect in order to read its contents. Hence, a new approach has been adopted: The pool is first opened with the untrusted userland configuration just so that the real configuration can be read from the MOS. The trusted MOS configuration is then used to generate a new vdev tree and the pool is re-opened. When the pool is opened with an untrusted configuration, writes are disabled to avoid accidentally damaging it. During reads, some sanity checks are performed on block pointers to see if each DVA points to a known vdev; when the configuration is untrusted, instead of panicking the system if those checks fail we simply avoid issuing reads to the invalid DVAs. This new two-step pool load process now allows rewinding pools across vdev tree changes such as device replacement, addition, etc. Loading a pool from an external config file in a clustering environment also becomes much safer now since the pool will import even if the config is outdated and didn't, for instance, register a recent device addition. With this code in place, it became relatively easy to implement a long-sought-after feature: the ability to import a pool with missing top level (i.e. non-redundant) devices. Note that since this almost guarantees some loss Of data, this feature is for now restricted to a read-only import.
  >
  >

* * [7614 zfs device evacuation/removal](https://svnweb.freebsd.org/base?view=revision&revision=329732) This project allows top-level vdevs to be removed from the storage pool with “zpool remove”, reducing the total amount of storage in the pool. This operation copies all allocated regions of the device to be removed onto other devices, recording the mapping from old to new location. After the removal is complete, read and free operations to the removed (now “indirect”) vdev must be remapped and performed at the new location on disk. The indirect mapping table is kept in memory whenever the pool is loaded, so there is minimal performance overhead when doing operations on the indirect vdev. The size of the in-memory mapping table will be reduced when its entries become “obsolete” because they are no longer used by any block pointers in the pool. An entry becomes obsolete when all the blocks that use it are freed. An entry can also become obsolete when all the snapshots that reference it are deleted, and the block pointers that reference it have been “remapped” in all filesystems/zvols (and clones). Whenever an indirect block is written, all the block pointers in it will be “remapped” to their new (concrete) locations if possible. This process can be accelerated by using the “zfs remap” command to proactively rewrite all indirect blocks that reference indirect (removed) vdevs. Note that when a device is removed, we do not verify the checksum of the data that is copied. This makes the process much faster, but if it were used on redundant vdevs (i.e. mirror or raidz vdevs), it would be possible to copy the wrong data, when we have the correct data on e.g. the other side of the mirror. Therefore, mirror and raidz devices can not be removed.

* You can use ‘zpool detach’ to downgrade a mirror to a single top-level device, so that you can then remove it
* * [7446 zpool create should support efi system partition](https://svnweb.freebsd.org/base?view=revision&revision=329681)

* This one was not actually merged into FreeBSD, as it doesn’t apply currently, but I would like to switch the way FreeBSD deals with full disks to be closer to IllumOS to make automatic spare replacement a hands-off operation. Since we support whole-disk configuration for boot pool, we also will need whole disk support with UEFI boot and for this, zpool create should create efi-system partition. I have borrowed the idea from oracle solaris, and introducing zpool create -B switch to provide an way to specify that boot partition should be created. However, there is still an question, how big should the system partition be. For time being, I have set default size 256MB (thats minimum size for FAT32 with 4k blocks). To support custom size, the set on creation "bootsize" property is created and so the custom size can be set as: zpool create -B -o bootsize=34MB rpool c0t0d0. After the pool is created, the "bootsize" property is read only. When -B switch is not used, the bootsize defaults to 0 and is shown in zpool get output with no value. Older zfs/zpool implementations can ignore this property.

---
 \*\*Digital Ocean\*\*

### [PostgreSQL developers find that every operating system other than FreeBSD and IllumOS might corrupt your data](https://www.postgresql.org/message-id/flat/CAEepm=0B9f0O7jLE3ipUTqC3V6NO2LNbwE9Hp=3BxGbZPqEyQg@mail.gmail.com#CAEepm=0B9f0O7jLE3ipUTqC3V6NO2LNbwE9Hp=3BxGbZPqEyQg@mail.gmail.com) ###

>
>
> Some time ago I ran into an issue where a user encountered data corruption after a storage error. PostgreSQL played a part in that corruption by allowing checkpoint what should've been a fatal error. TL;DR: Pg should PANIC on fsync() EIO return. Retrying fsync() is not OK at least on Linux. When fsync() returns success it means "all writes since the last fsync have hit disk" but we assume it means "all writes since the last SUCCESSFUL fsync have hit disk". Pg wrote some blocks, which went to OS dirty buffers for writeback. Writeback failed due to an underlying storage error. The block I/O layer and XFS marked the writeback page as failed (AS*EIO), but had no way to tell the app about the failure. When Pg called fsync() on the FD during the next checkpoint, fsync() returned EIO because of the flagged page, to tell Pg that a previous async write failed. Pg treated the checkpoint as failed and didn't advance the redo start position in the control file. + All good so far. But then we retried the checkpoint, which retried the fsync(). The retry succeeded, because the prior fsync() \*cleared the AS*EIO bad page flag\*. The write never made it to disk, but we completed the checkpoint, and merrily carried on our way. Whoops, data loss. The clear-error-and-continue behaviour of fsync is not documented as far as I can tell. Nor is fsync() returning EIO unless you have a very new linux man-pages with the patch I wrote to add it. But from what I can see in the POSIX standard we are not given any guarantees about what happens on fsync() failure at all, so we're probably wrong to assume that retrying fsync() is safe. We already PANIC on fsync() failure for WAL segments. We just need to do the same for data forks at least for EIO. This isn't as bad as it seems because AFAICS fsync only returns EIO in cases where we should be stopping the world anyway, and many FSes will do that for us. + Upon further looking, it turns out it is not just Linux brain damage: Apparently I was too optimistic. I had looked only at FreeBSD, which keeps the page around and dirties it so we can retry, but the other BSDs apparently don't ([FreeBSD changed that in 1999](https://github.com/freebsd/freebsd/commit/e4e8fec98ae986357cdc208b04557dba55a59266)). From what I can tell from the sources below, we have: Linux, OpenBSD, NetBSD: retrying fsync() after EIO lies FreeBSD, Illumos: retrying fsync() after EIO tells the truth + [NetBSD PR to solve the issues ](http://gnats.netbsd.org/53152) + I/O errors are not reported back to fsync at all. + Write errors during genfs\_putpages that fail for any reason other than ENOMEM cause the data to be semi-silently discarded. + It appears that UVM pages are marked clean when they're selected to be written out, not after the write succeeds; so there are a bunch of potential races when writes fail. + It appears that write errors for buffercache buffers are semi-silently discarded as well.
>
>

---

Interview - Kevin Bowling: Senior Manager Engineering of LimeLight Networks - [kbowling@llnw.com](mailto:kbowling@llnw.com) / [@kevinbowling1](https://twitter.com/kevinbowling1)
----------

* BR: How did you first get introduced to UNIX and BSD?
* AJ: What got you started contributing to an open source project?
* BR: What sorts of things have you worked on it the past?
* AJ: Tell us a bit about LimeLight and how they use FreeBSD.
* BR: What are the biggest advantages of FreeBSD for LimeLight?
* AJ: What could FreeBSD do better that would benefit LimeLight?
* BR: What has LimeLight given back to FreeBSD?
* AJ: What have you been working on more recently?
* BR: What do you find to be the most valuable part of open source?
* AJ: Where do you think the most improvement in open source is needed?
* BR: Tell us a bit about your computing history collection. What are your three favourite pieces?
* AJ: How do you keep motivated to work on Open Source?
* BR: What do you do for fun?
* AJ: Anything else you want to mention?

---

News Roundup
----------

### [BSDCan 2018 Selected Talks](http://www.bsdcan.org/2018/schedule/) ###

* The schedule for BSDCan is up
* Lots of interesting content, we are looking forward to it
* We hope to see lots of you there. Make sure you come introduce yourselves to us. Don’t be shy.
* Remember, if this is your first BSDCan, checkout the newbie session on Thursday night. It’ll help you get to know a few people so you have someone you can ask for guidance.
* Also, check out the hallway track, the tables, and come to the hacker lounge.

---

**iXsystems**

### [Cryptographic Right Answers](http://latacora.singles/2018/04/03/cryptographic-right-answers.html) ###

* Crypto can be confusing. We all know we shouldn’t roll our own, but what should we use?
* Well, some developers have tried to answer that question over the years, keeping an updated list of “Right Answers”
* 2009: [Colin Percival](https://twitter.com/cperciva) of FreeBSD
* 2015: [Thomas H. Ptacek](https://twitter.com/tqbf)
* 2018: [Latacora](https://twitter.com/latacora_team) A consultancy that provides “Retained security teams for startups”, where Thomas Ptacek works.
  >
  >
  > We’re less interested in empowering developers and a lot more pessimistic about the prospects of getting this stuff right.
  >
  >

 There are, in the literature and in the most sophisticated modern systems, “better” answers for many of these items. If you’re building for low-footprint embedded systems, you can use STROBE and a sound, modern, authenticated encryption stack entirely out of a single SHA-3-like sponge constructions. You can use NOISE to build a secure transport protocol with its own AKE. Speaking of AKEs, there are, like, 30 different password AKEs you could choose from.

But if you’re a developer and not a cryptography engineer, you shouldn’t do any of that. You should keep things simple and conventional and easy to analyze; “boring”, as the Google TLS people would say.

* Cryptographic Right Answers

* Encrypting Data

>
>
> Percival, 2009: AES-CTR with HMAC. Ptacek, 2015: (1) NaCl/libsodium’s default, (2) ChaCha20-Poly1305, or (3) AES-GCM. Latacora, 2018: KMS or XSalsa20+Poly1305
>
>

* Symmetric key length

>
>
> Percival, 2009: Use 256-bit keys. Ptacek, 2015: Use 256-bit keys. Latacora, 2018: Go ahead and use 256 bit keys.
>
>

* Symmetric “Signatures”

>
>
> Percival, 2009: Use HMAC. Ptacek, 2015: Yep, use HMAC. Latacora, 2018: Still HMAC.
>
>

* Hashing algorithm

>
>
> Percival, 2009: Use SHA256 (SHA-2). Ptacek, 2015: Use SHA-2. Latacora, 2018: Still SHA-2.
>
>

* Random IDs

>
>
> Percival, 2009: Use 256-bit random numbers. Ptacek, 2015: Use 256-bit random numbers. Latacora, 2018: Use 256-bit random numbers.
>
>

* Password handling

>
>
> Percival, 2009: scrypt or PBKDF2. Ptacek, 2015: In order of preference, use scrypt, bcrypt, and then if nothing else is available PBKDF2. Latacora, 2018: In order of preference, use scrypt, argon2, bcrypt, and then if nothing else is available PBKDF2.
>
>

* Asymmetric encryption

>
>
> Percival, 2009: Use RSAES-OAEP with SHA256 and MGF1+SHA256 bzzrt pop ffssssssst exponent 65537. Ptacek, 2015: Use NaCl/libsodium (box / crypto*box). Latacora, 2018: Use Nacl/libsodium (box / crypto*box).
>
>

* Asymmetric signatures

>
>
> Percival, 2009: Use RSASSA-PSS with SHA256 then MGF1+SHA256 in tricolor systemic silicate orientation. Ptacek, 2015: Use Nacl, Ed25519, or RFC6979. Latacora, 2018: Use Nacl or Ed25519.
>
>

* Diffie-Hellman

>
>
> Percival, 2009: Operate over the 2048-bit Group #14 with a generator of 2. Ptacek, 2015: Probably still DH-2048, or Nacl. Latacora, 2018: Probably nothing. Or use Curve25519.
>
>

* Website security

>
>
> Percival, 2009: Use OpenSSL. Ptacek, 2015: Remains: OpenSSL, or BoringSSL if you can. Or just use AWS ELBs Latacora, 2018: Use AWS ALB/ELB or OpenSSL, with LetsEncrypt
>
>

* Client-server application security

>
>
> Percival, 2009: Distribute the server’s public RSA key with the client code, and do not use SSL. Ptacek, 2015: Use OpenSSL, or BoringSSL if you can. Or just use AWS ELBs Latacora, 2018: Use AWS ALB/ELB or OpenSSL, with LetsEncrypt
>
>

* Online backups

>
>
> Percival, 2009: Use Tarsnap. Ptacek, 2015: Use Tarsnap. Latacora, 2018: Store PMAC-SIV-encrypted arc files to S3 and save fingerprints of your backups to an ERC20-compatible blockchain. Just kidding. You should still use Tarsnap.
>
>

* Seriously though, use Tarsnap.

---

### [Adding IPv6 to an existing server](https://dan.langille.org/2018/03/19/adding-ipv6-to-an-existing-server/) ###

>
>
> I am adding IPv6 addresses to each of my servers. This post assumes the server is up and running FreeBSD 11.1 and you already have an IPv6 address block. This does not cover the creation of an IPv6 tunnel, such as that provided by HE.net. This assumes native IPv6.
>
>
>
> In this post, I am using the IPv6 addresses from the IPv6 Address Prefix Reserved for Documentation (i.e. 2001:DB8::/32). You should use your own addresses.
>
>
>
> The IPv6 block I have been assigned is 2001:DB8:1001:8d00/64.
>
>
>
> I added this to /etc/rc.conf:
>
>

` ipv6_activate_all_interfaces="YES" ipv6_defaultrouter="2001:DB8:1001:8d00::1" ifconfig_em1_ipv6="inet6 2001:DB8:1001:8d00:d389:119c:9b57:396b prefixlen 64 accept_rtadv" # ns1 `

>
>
> The IPv6 address I have assigned to this host is completely random (with the given block). I found a random IPv6 address generator and used it to select d389:119c:9b57:396b as the address for this service within my address block.
>
>
>
> I don’t have the reference, but I did read that randomly selecting addresses within your block is a better approach.
>
>
>
> In order to invoke these changes without rebooting, I issued these commands:
>
>

``` [dan@tallboy:\~] $ sudo ifconfig em1 inet6 2001:DB8:1001:8d00:d389:119c:9b57:396b prefixlen 64 accept\_rtadv [dan@tallboy:\~] $

[dan@tallboy:\~] $ sudo route add -inet6 default 2001:DB8:1001:8d00::1 add net default: gateway 2001:DB8:1001:8d00::1 ```

>
>
> If you do the route add first, you will get this error:
>
>

` [dan@tallboy:~] $ sudo route add -inet6 default 2001:DB8:1001:8d00::1 route: writing to routing socket: Network is unreachable add net default: gateway 2001:DB8:1001:8d00::1 fib 0: Network is unreachable `

---

Beastie Bits
----------

* [Ghost in the Shell – Part 1](https://vermaden.wordpress.com/2018/03/15/ghost-in-the-shell-part-1/)
* [Enabling compression on ZFS - a practical example](https://gist.github.com/dlangille/bcf918b22aaf9b3fd17408b39c97e8ce)
* [Modern and secure DevOps on FreeBSD (Goran Mekić)](https://0x7e2.bsidesljubljana.si/modern-secure-devops-freebsd-goran-mekic/)
* [LibreSSL 2.7.0 Released](https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.7.0-relnotes.txt)
* [zrepl version 0.0.3 is out!](https://zrepl.github.io/changelog.html)
* [ZFS User Conference](http://zfs.datto.com/]

---

**Tarsnap**

Feedback/Questions
----------

* Benjamin - [BSD Personal Mailserver](http://dpaste.com/1SXE1B9#wrap)
* Warren - [ZFS volume size limit (show #233)](http://dpaste.com/0RN0S8X#wrap)
* Lars - [AFRINIC](http://dpaste.com/3RAM4Z7#wrap)
* Brad - [OpenZFS vs OracleZFS](http://dpaste.com/0M7XD71#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)