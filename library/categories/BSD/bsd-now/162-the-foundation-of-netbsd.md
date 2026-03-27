+++
title = "162: The Foundation of NetBSD"
description = "This week on the show, we’ll be talking to Petra about the NetBSD foundation, about how they operate and assist NetBSD behind the scenes. That plus lots of newsThis episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png"
date = "2016-10-05T12:00:00Z"
url = "https://www.bsdnow.tv/162"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.994368294Z"
seen = false
+++

This week on the show, we’ll be talking to Petra about the NetBSD foundation, about how they operate and assist NetBSD behind the scenes. That plus lots of news

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[ href="http://www.digitalocean.com/" title="DigitalOcean"\>![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)]()[ href="http://www.tarsnap.com/bsdnow" title="Tarsnap"\>![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)]()

---

Headlines
----------

### [What is new on EC2 for FreeBSD 11.0-RELEASE](http://www.daemonology.net/blog/2016-10-03-FreeBSD-EC2-11-0-RELEASE.html) ###

* “FreeBSD 11.0-RELEASE is just around the corner, and it will be bringing a long list of new features and improvements — far too many for me to list here. I think there are some improvements in FreeBSD 11.0 which are particularly noteworthy for EC2 users.”
* “First, the EC2 Console Screenshot functionality now works with FreeBSD. This provides a "VGA" output as opposed to the traditional "serial port" which EC2 has exposed as "console output" for the past decade, and is useful largely because the "VGA" output becomes available immediately whereas the "serial port" output can lag by several minutes. This improvement is a simple configuration change — older releases didn't waste time writing to a non-serial console because it didn't go anywhere until Amazon added support on their side — and can be enabled on older FreeBSD releases by changing the line console="comconsole" to boot\_multicons="YES" in /boot/loader.conf.”
* “The second notable change is support for EC2 "Enhanced Networking" using Intel 82599 hardware; on the C3, C4, R3, I2, D2, and M4 (excluding m4.16xlarge) families, this provides increased network throughput and reduced latency and jitter, since it allows FreeBSD to talk directly to the networking hardware rather than via a Xen paravirtual interface. Getting this working took much longer than I had hoped, but the final problem turned out not to be in FreeBSD at all — we were tickling an interrupt-routing bug in a version of Xen used in EC2. Unfortunately FreeBSD does not yet have support for the new "Elastic Network Adapter" enhanced networking used in P2 and X1 instance families and the m4.16xlarge instance type; I'm hoping that we'll have a driver for that before FreeBSD 11.1 arrives.”
* “The third notable change is an improvement in EC2 disk throughput. This comes thanks to enabling indirect segment I/Os in FreeBSD's blkfront driver; while the support was present in 10.3, I had it turned off by default due to performance anomalies on some EC2 instances. (Those EC2 performance problems have been resolved, and disk I/O performance in EC2 on FreeBSD 10.3 can now be safely improved by removing the line hw.xbd.xbd\_enable\_indirect="0" from /boot/loader.conf.)”
* “Finally, FreeBSD now supports all 128 CPUs in the x1.32xlarge instance type. This improvement comes thanks to two changes: The FreeBSD default kernel was modified in 2014 to support up to 256 CPUs (up from 64), but that resulted in a (fixed-size) section of preallocated memory being exhausted early in the boot process on systems with 92 or more CPUs; a few months ago I changed that value to tune automatically so that FreeBSD can now boot and not immediately panic with an out-of-the-box setup on such large systems.”
* “I think FreeBSD/EC2 users will be very happy with FreeBSD 11.0-RELEASE; but I'd like to end with an important reminder: No matter what you might see on FTP servers, in EC2, or available via freebsd-update, the new release has not been released until you see a GPG-signed email from the release engineer. This is not just a theoretical point: In my time as a FreeBSD developer I've seen multiple instances of last-minute release re-rolls happening due to problems being discovered very late, so the fact that you can see bits doesn't necessarily mean that they are ready to be downloaded. I hope you're looking forward to 11.0-RELEASE, but please be patient.” \*\*\*

### [Upgrading Amazon EC2 instance from 10.3 to 11.0-PRERELEASE results in hang at boot ](https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=213196) ###

* As if to underscore that last point, a last minute bug was found on sunday night
* A user reported that they used freebsd-update to upgrade an EC2 instance from 10.3 to 11.0 and it started hanging during boot
* After some quick investigation by Colin, the problem was reproduced
* Since I had done a lot of work in the loader recently, I helped Colin build a version of the loader with a lot of the debugging enabled, and some more added to try to isolate where in the loader the freeze was happening
* Colin and I worked late into the night, but eventually found the read from disk that was causing the hang
* Unlike most of the other reads, that were going into the heap, this read was into a very low memory address, right near the 640kb border. This initially distracted us from the real cause of the problem
* With more debugging added, it was determined that the problem was in the GELIBoot code, when reading the last sector of each partition to determine if it is encrypted. In cases where the partition is not 4k aligned, and butts up against the end of the disk, the formula used could result in a read past the end of the disk
* The formula rounds the last sector byte address down to the nearest factor of 4096, then reads 4096 bytes. Then that buffer is examined to determine if the partition is encrypted. If it is a 512b sector drive, the metadata will be in the last 512 bytes of that 4096 byte buffer.
* However, if the partition is not 4k aligned, the rounding will produce a value that is less than 4096 bytes from the end of the disk, and attempting to read 4096 bytes, will read past the end of the disk
* Normally this isn’t that big of a problem, the BIOS will just return an error. The loader will retry up to three times, then give up and move on, continuing to boot normally.
* Some BIOSes are buggy, and will initiate their own retries, and the combination might result in a stall of up to 30 seconds for each attempt to read past the end of the disk
* But it seems that Amazon EC2 instances, (and possibly other virtual instances), will just hang in this case.
* This bug has existed for 6 months, but was not caught because almost all installations are 4k aligned thanks to changes made to the installer over the last few years, and most hardware continues to boot with no sign of a problem
* Even the EC2 snapshot images of 11.0 do not have the problem, as they use a newer disk layout that is 4k aligned by default now. The problem only seems to happen when older disk images are upgraded
* The fix has been committed and will be merged the the branches over the next few days
* An Errata notice will be issues, and the fix will be available via freebsd-update
* It is recommended that EC2 users, and anyone who wants to be especially cautious, wait until this errata notice goes out before attempting to upgrade from FreeBSD 10.3 to 11.0
* You can determine if your partitions are 4k aligned by running ‘gpart show’. If there is free space after your last partition, you won’t have any issues. \*\*\*

### [OpenBSD 6.0 Limited Edition CD set (signed by developers)](http://undeadly.org/cgi?action=article&sid=20160929230557&mode=expanded) ###

[The first one went for .$4,200.00](http://www.ebay.com/itm/-/331985953783)

* Looking for your piece of OpenBSD history? At the recent g2k16 hackathon in Cambridge UK, 40 OpenBSD developers put pen to paper and signed 5 copies of the new 6.0 release.
* Each of these will be auctioned off on ebay, with the proceeds to benefit the OpenBSD foundation.
* The first auction has already ended, and CD set went for a whopping $4200!
* The next set only has 2 days left, and currently stands at $3000! ([http://www.ebay.com/itm/-/331990536246](http://www.ebay.com/itm/-/331990536246))
* Get your bids in soon, these are VERY unique, the odds of getting the same 40 developers in a room together and signing a new .0 release may make this a once-in-a-lifetime opportunity.
* Additionally, if you are just starting your OpenBSD collection, here’s a nice image to make you envious: [A nice collection of OpenBSD CD Sets](http://i.imgur.com/OrE0Gsa.png) \*\*\*

### [What typing <sup>D</sup> really does on Unix ###

]([https://utcc.utoronto.ca/\~cks/space/blog/unix/TypingEOFEffects](https://utcc.utoronto.ca/~cks/space/blog/unix/TypingEOFEffects))

* How often have you used a <sup>D</sup> to generate an EOF? Do you really know what that does?
* Chris Siebenmann has posted a look at this on his blog, which might not be what you think

>
>
> “Typing <sup>D</sup> causes the tty driver to immediately finish a read().”
>
>

* He continues on:

>
>
> Normally doing a read() from a terminal is line-buffered inside the tty driver; your program only wakes up when the tty driver sees the newline, at which point you get back the full   
>  line. (Note that this buffering is distinct from anything that your language's IO system may be doing.)
>
>
>
> Typing <sup>D</sup> causes the tty driver to stop waiting for a newline and immediately return from the read() with however much of the line has been accumulated to date. If you haven't   
>  typed anything on the line yet, there is nothing accumulated and the read() will return 0 bytes, which is conveniently the signal for end of file. If you have typed something the   
>  program will get it; because it doesn't have a trailing newline, the program's own line-buffering may take over and keep read()ing to get the rest of the line.
>
>
>
> (Other programs will immediately process the partial line with no buffering; cat is one example of this.)
>
>
>
> Once you've typed <sup>D</sup> on a partial line, that portion of the line is immutable because it's already been given to the program. Most Unixes won't let you backspace over such partial   
>  lines; effectively they become output, not input.
>
>
>
> (Note that modern shells are not good examples of this, because they don't do line-buffered input; to support command line editing, they switch terminal input into an uninterpreted   
>  mode. So they get the raw <sup>D</sup> and can do whatever they want with it, and they can let you edit as much of the pending line as they want.)
>
>

* Fascinating stuff, and interesting to see behind the curtain at exactly what’s going on with your programs buffering and tty driver interaction.

---

Interview - Petra Zeidler - [spz@netbsd.org](mailto:spz@netbsd.org)
----------

* NetBSD Foundation \*\*\*

News Roundup
----------

### [Running FreeBSD in Travis-CI Thanks to KQEmu](http://erouault.blogspot.com/2016/09/running-freebsd-in-travis-ci.html) ###

* Travis-CI is the most popular testing framework on Github, but it doesn’t support any of the BSDs
* This didn’t discourage Even Rouault, who managed to run FreeBSD in KQEMU on the Linux instances provided by Travis-CI
* “Travis-CI has a free offer for software having public repository at GitHub. Travis-CI provides cloud instances running Linux or Mac OS X. To increase portability tests of GDAL, I wondered if it was somehow possible to run another operating system with Travis-CI, for example FreeBSD. A search lead me to this [question](https://github.com/travis-ci/travis-ci/issues/1818) in their bug tracker but the outcome seems to be that it is not possible, nor in their medium or long term plans.”
* “One idea that came quickly to mind was to use the QEMU machine emulator that can simulate full machines, of several hardware architectures.”
* They found an existing image of FreeBSD 9.2 and configured the Travis job to download it and fire it up in QEMU.
* “Here we go: ./configure && make ! That works, but 50 minutes later (the maximum length of a Travis-CI job), our job is killed with perhaps only 10% of the GDAL code base being compiled. The reason is that we used the pure software emulation mode of QEMU that involves on-the-fly disassembling of the code to be run and re-assembling.”
* Travis-CI runs in Google Compute Engine, which does not allow nested virtualization, so hardware virtualization is not an option to speed up QEMU
* “Here comes the time for good old memories and a bit of software archeology. QEMU was started by Fabrice Bellard. If you didn't know his name yet, F. Bellard created FFMPEG and QEMU, holds a world record for the number of decimals of Pi computed on a COTS PC, has ported QEMU in JavaScript to run the Linux kernel in your browser, devised BPG, a new compression based on HEVC, etc....”
* “At the time where his interest was focused on QEMU, he created KQemu, a kernel module (for Linux, Windows, FreeBSD hosts), that could significantly enhance QEMU performance when the guest and hosts are x86/x86\_64 and does not require (nor use) hardware virtualization instructions.”
* “Running it on Travis-CI was successful too, with the compilation being done in 20 minutes, so probably half of the speed of bare metal, which is good enough.”
* “I could also have potentially tried VirtualBox because, as mentioned above, it supports software virtualization with acceleration. But that is only for 32 bit guests (and I didn't find a ready-made FreeBSD 32bit image that you can directly ssh into). For 64 bit guests, VirtualBox require hardware virtualization to be available in the host. To the best of my knowledge, KQemu is (was) the only solution to enable acceleration of 64 bit guests without hardware requirements.”
* It will be interesting to see if enough people do this hack, maybe Travis-CI will consider properly supporting FreeBSD \*\*\*

### [OpenBSD EuroBSDcon 2016 Papers are online](https://www.openbsd.org/events.html) ###

* Slides from the OpenBSD talks at EuroBSDCon are online now
  * Landry Breuil, [Building packages on exotic architectures](https://rhaalovely.net/~landry/eurobsdcon2016/)
  * Peter Hessler, [Bidirectional Forwarding Detection (BFD) implementation and support in OpenBSD](https://www.openbsd.org/papers/eurobsdcon2016-bfd.pdf)
  * Ingo Schwarze, [Why and how you ought to keep multibyte character support simple](https://www.openbsd.org/papers/eurobsdcon2016-utf8.pdf) (roff/mm/gpresent [source code](https://www.openbsd.org/papers/eurobsdcon2016-utf8.roff))
  * Stefan Sperling, [OpenBSD meets 802.11n](https://www.openbsd.org/papers/eurobsdcon2016-openbsd-11n.pdf)
  * Antoine Jacoutot, [OpenBSD rc.d(8)](https://www.bsdfrog.org/pub/events/openbsd-rcd-EuroBSDcon2016.pdf)
  * Marc Espie, [Retrofitting privsep into dpb and pkg\_add](https://www.openbsd.org/papers/eurobsdcon2016-privsep.pdf)
  * Martin Pieuchot, [Embracing the BSD routing table](https://www.openbsd.org/papers/eurobsdcon2016-embracingbsdrt.pdf)

* I am working to build a similar website for the FreeBSD project, but there is still a lot of work to do
* I also managed to find the slides from the keynotes:
* [Opening Keynote: George Neville-Neil: Looking Backwards: The coming decades of BSD ](https://papers.freebsd.org/2016/EuroBSDCon/LookingBackwards.pdf)
* [Closing Keynote: Gert Döring: Internet Attacks, Self-Governance, and the Consequences ](http://www.monobsd.com/files/16_ddos_and_consequences.pptx) \*\*\*

### [VirtualBox Shared Folders on FreeBSD: progress report](https://kernelnomicon.org/?p=650) ###

* In the past month or so, VirtualBox in the FreeBSD ports tree got bumped to version 5, which while bringing new features, did cause a regression in Shared Folders.
* FreeBSD developer gonzo@ (Oleksandr Tymoshenko) has been tackling this issue in recent days and provides us with a look behind the curtain at the challenges involved.
* Specifically he started by implementing the various needed VOPs: “lookup, access, readdir, read, getattr, readlink, remove, rmdir, symlink, close, create, open, write.”
* He then continues with details about how complete this is:

““Kind of implemented” means that I was able to mount directory, traverse it, read file, calculate md5 sums and compare with host’s md5sum, create/remove directories,   
 unzip zip file, etc but I doubt it would survive stress-test. Locking is all wrong at the moment and read/write VOPs allocate buffers for every operation.”

* The bigger issue faced is with the rename VOP though:

>
>
> I hit a roadblock with rename VOP: it involves some non-trivial locking logic and also there is a problem with cached paths. VBox hypervisor operates on full paths so we cache them   
>  in vboxfs nodes, but if one of parent directories is renamed, all cached names should be modified accordingly. I am going to tackle these two problems once I have long enough stretch   
>  of time time sit and concentrate on task.
>
>
>
> * We wish him luck in getting those issues solved. I know quite a few of our users rely on shared folders as well. \*\*\*
>
>

### [FreeBSD News Issue #1](http://support.rossw.net/FreeBSD-Issue1.pdf) ###

* Issue #1 of FreeBSD News, from summer of 1997
* Contains an article by Yahoo! co-founder David Filo about their early use of FreeBSD, on 100mhz Pentium machines with 64MB of ram
* Java Development Kit 1.0.2 ported to FreeBSD
* What is FreeBSD?
* Running the world’s busiest FTP site (cdrom.com) on FreeBSD
* Xi Graphics announces the release of CDE Business Desktop, the first and only integrated desktop for FreeBSD, on AcceleratedX, a fully supported commercial grade X display server
* Get FreeBSD 2.2.2 Today! \*\*\*

Beastie Bits
----------

* [Call for testing: newly MPSAFE nvme(4)](http://mail-index.netbsd.org/current-users/2016/09/21/msg030183.html)

* [Thinking about starting a BUG in Indianapolis, IN USA](http://lists.dragonflybsd.org/pipermail/users/2016-September/313061.html)

* [The cost of forsaking C: Why students still need to learn C ](https://medium.com/bradfield-cs/the-cost-of-forsaking-c-113986438784#.o2m5gv8y7)

* [OpenBSD (U)EFI bootloader howto](https://blog.jasper.la/openbsd-uefi-bootloader-howto/)

* [Michael Lucas sets his eyes on OpenBSD's web stack for his next book](http://blather.michaelwlucas.com/archives/2780)

* [LibreSSL 2.5.0 released](http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.5.0-relnotes.txt)

* [OPNsense 16.7.5 released](https://opnsense.org/opnsense-16-7-5-released/)

---

Feedback/Questions
----------

* [ Jonas - ZFS on DO ](http://pastebin.com/XeJhK0AJ)
* [ Ricardo - OpenBSD Encrypted Disk](http://pastebin.com/Z9JRjcvb)
* [ WiskerTickle - Storage Benchmark ](http://pastebin.com/XAD0UevP)
* [ Phil - Thanks](http://pastebin.com/N52JhYru)
* [ Luis - Misc Questions](http://pastebin.com/57qS0wrx) \*\*\*