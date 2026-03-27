+++
title = "186: The Fast And the Firewall: Tokyo Drift"
description = "This week on BSDNow, reports from AsiaBSDcon, TrueOS and FreeBSD news, Optimizing IllumOS Kernel, your questions and more.This episode was brought to you byiXsystems - Enterprise Servers and Storage for Open Source[ h"
date = "2017-03-22T12:00:00Z"
url = "https://www.bsdnow.tv/186"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.935053729Z"
seen = false
+++

This week on BSDNow, reports from AsiaBSDcon, TrueOS and FreeBSD news, Optimizing IllumOS Kernel, your questions and more.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[ href="http://www.digitalocean.com/" title="DigitalOcean"\>![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)]()[ href="http://www.tarsnap.com/bsdnow" title="Tarsnap"\>![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)]()

---

Headlines
----------

### [AsiaBSDcon Reports and Reviews]() ###

* [AsiaBSDcon schedule](https://2017.asiabsdcon.org/program.html.en)
* [Schedule and slides from the 4th bhyvecon](http://bhyvecon.org/)
* [Michael Dexter’s trip report on the iXsystems blog](https://www.ixsystems.com/blog/ixsystems-attends-asiabsdcon-2017)
* [NetBSD AsiaBSDcon booth report](http://mail-index.netbsd.org/netbsd-advocacy/2017/03/13/msg000729.html) \*\*\*

### [TrueOS Community Guidelines are here!](https://www.trueos.org/blog/trueos-community-guidelines/) ###

* TrueOS has published its new Community Guidelines
* The TrueOS Project has existed for over ten years. Until now, there was no formally defined process for interested individuals in the TrueOS community to earn contributor status as an active committer to this long-standing project. The current core TrueOS developers (Kris Moore, Ken Moore, and Joe Maloney) want to provide the community more opportunities to directly impact the TrueOS Project, and wish to formalize the process for interested people to gain full commit access to the TrueOS repositories.
* These describe what is expected of community members and committers
* They also describe the process of getting commit access to the TrueOS repo:

>
>
> Previously, Kris directly handed out commit bits. Now, the Core developers have provided a small list of requirements for gaining a TrueOS commit bit:
>
>
>
> Create five or more pull requests in a TrueOS Project repository within a single six month period.
>
>
>
> Stay active in the TrueOS community through at least one of the available community channels (Gitter, Discourse, IRC, etc.).
>
>
>
> Request commit access from the core developers via [core@trueos.org](mailto:core@trueos.org) OR Core developers contact you concerning commit access.
>
>
>
> Pull requests can be any contribution to the project, from minor documentation tweaks to creating full utilities.
>
>
>
> At the end of every month, the core developers review the commit logs, removing elements that break the Project or deviate too far from its intended purpose. Additionally, outstanding pull requests with no active dissension are immediately merged, if possible. For example, a user submits a pull request which adds a little-used OpenRC script. No one from the community comments on the request or otherwise argues against its inclusion, resulting in an automatic merge at the end of the month. In this manner, solid contributions are routinely added to the project and never left in a state of “limbo”.
>
>

* The page also describes the perks of being a TrueOS committer:

>
>
> Contributors to the TrueOS Project enjoy a number of benefits, including:
>
>
>
> A personal TrueOS email alias: @trueos.org
>
>
>
> Full access for managing TrueOS issues on GitHub.
>
>
>
> Regular meetings with the core developers and other contributors.
>
>
>
> Access to private chat channels with the core developers.
>
>
>
> Recognition as part of an online Who’s Who of TrueOS developers.
>
>
>
> The eternal gratitude of the core developers of TrueOS.
>
>
>
> A warm, fuzzy feeling.
>
>

---

### [Intel Donates 250.000 $ to the FreeBSD Foundation](https://www.freebsdfoundation.org/news-and-events/latest-news/new-uranium-level-donation-and-collaborative-partnership-with-intel/) ###

* More details about the deal: Systems Thinking: [Intel and the FreeBSD Project](https://www.freebsdfoundation.org/blog/systems-thinking-intel-and-the-freebsd-project/)

>
>
> Intel will be more actively engaging with the FreeBSD Foundation and the FreeBSD Project to deliver more timely support for Intel products and technologies in FreeBSD.
>
>
>
> Intel has contributed code to FreeBSD for individual device drivers (i.e. NICs) in the past, but is now seeking a more holistic “systems thinking” approach.
>
>

* [Intel Blog Post ](https://01.org/blogs/imad/2017/intel-increases-support-freebsd-project)

>
>
> We will work closely with the FreeBSD Foundation to ensure the drivers, tools, and applications needed on Intel® SSD-based storage appliances are available to the community. This collaboration will also provide timely support for future Intel® 3D XPoint™ products.
>
>

* Thank you very much, Intel! \*\*\*

### [Applied FreeBSD: Basic iSCSI](https://globalengineer.wordpress.com/2017/03/05/applied-freebsd-basic-iscsi/) ###

>
>
> iSCSI is often touted as a low-cost replacement for fibre-channel (FC) Storage Area Networks (SANs). Instead of having to setup a separate fibre-channel network for the SAN, or invest in the infrastructure to run Fibre-Channel over Ethernet (FCoE), iSCSI runs on top of standard TCP/IP. This means that the same network equipment used for routing user data on a network could be utilized for the storage as well.
>
>
>
> This article will cover a very basic setup where a FreeBSD server is configured as an iSCSI Target, and another FreeBSD server is configured as the iSCSI Initiator. The iSCSI Target will export a single disk drive, and the initiator will create a filesystem on this disk and mount it locally. Advanced topics, such as multipath, ZFS storage pools, failover controllers, etc. are not covered.
>
>
>
> The real magic is the /etc/ctl.conf file, which contains all of the information necessary for ctld to share disk drives on the network. Check out the man page for /etc/ctl.conf for more details; below is the configuration file that I created for this test setup. Note that on a system that has never had iSCSI configured, there will be no existing configuration file, so go ahead and create it.
>
>

* Then, enable ctld and start it:

  * sysrc ctld\_enable=”YES”
  * service ctld start

* You can use the ctladm command to see what is going on:

root@bsdtarget:/dev # ctladm lunlist

(7:0:0/0):  Fixed Direct Access SPC-4 SCSI device

(7:0:1/1):  Fixed Direct Access SPC-4 SCSI device

root@bsdtarget:/dev # ctladm devlist

LUN Backend Size (Blocks) BS Serial Number Device ID

0 block 10485760 512 MYSERIAL 0 MYDEVID 0

1 block 10485760 512 MYSERIAL 1 MYDEVID 1

* Now, let’s configure the client side:

>
>
> In order for a FreeBSD host to become an iSCSI Initiator, the iscsd daemon needs to be started.
>
>

* sysrc iscsid\_enable=”YES”

* service iscsid start

>
>
> Next, the iSCSI Initiator can manually connect to the iSCSI target using the iscsictl tool. While setting up a new iSCSI session, this is probably the best option. Once you are sure the configuration is correct, add the configuration to the /etc/iscsi.conf file (see man page for this file). For iscsictl, pass the IP address of the target as well as the iSCSI IQN for the session:
>
>

```
+ iscsictl -A -p 192.168.22.128 -t iqn.2017-02.lab.testing:basictarget

```

* You should now have a new device (check dmesg), in this case, da1

* The guide them walks through partitioning the disk, and laying down a UFS file system, and mounting it

* This it walks through how to disconnect iscsi, incase you don’t want it anymore

* This all looked nice and easy, and it works very well. Now lets see what happens when you try to mount the iSCSI from Windows

* Ok, that wasn’t so bad.

* Now, instead of sharing an entire space disk on the host via iSCSI, share a zvol. Now your windows machine can be backed by ZFS. All of your problems are solved.

---

Interview - Philipp Buehler - [pbuehler@sysfive.com](mailto:pbuehler@sysfive.com)
----------

Technical Lead at SysFive, and Former OpenBSD Committer

News Roundup
----------

### [Half a dozen new features in mandoc -T html](http://undeadly.org/cgi?action=article&sid=20170316080827) ###

* [mandoc](http://man.openbsd.org/mandoc.1)’s HTML output mode got some new features

>
>
> Even though mdoc(7) is a semantic markup language, traditionally none of the semantic annotations were communicated to the reader. [...] Now, at least in -T html output mode, you can see the semantic function of marked-up words by hovering your mouse over them.
>
>
>
> In terminal output modes, we have the ctags(1)-like internal search facility built around the less(1) tag jump (:t) feature for quite some time now. We now have a similar feature in -T html output mode. To jump to (almost) the same places in the text, go to the address bar of the browser, type a hash mark ('#') after the URI, then the name of the option, command, variable, error code etc. you want to jump to, and hit enter.
>
>

* Check out the full report by Ingo Schwarze (schwarze@) and try out these new features \*\*\*

### [Optimizing IllumOS Kernel Crypto](http://zfs-create.blogspot.com/2014/05/optimizing-illumos-kernel-crypto.html) ###

* Sašo Kiselkov, of ZFS fame, looked into the performance of the OpenSolaris kernel crypto framework and found it lacking.
* The article also spends a few minutes on the different modes and how they work.

>
>
> Recently I've had some motivation to look into the KCF on Illumos and discovered that, unbeknownst to me, we already had an AES-NI implementation that was automatically enabled when running on Intel and AMD CPUs with AES-NI support. This work was done back in 2010 by Dan Anderson.This was great news, so I set out to test the performance in Illumos in a VM on my Mac with a Core i5 3210M (2.5GHz normal, 3.1GHz turbo).
>
>

* The initial tests of “what the hardware can do” were done in OpenSSL

>
>
> So now comes the test for the KCF. I wrote a quick'n'dirty crypto test module that just performed a bunch of encryption operations and timed the results.
>
>

* KCF got around 100 MB/s for each algorithm, except half that for AES-GCM
* OpenSSL had done over 3000 MB/s for CTR mode, 500 MB/s for CBC, and 1000 MB/s for GCM

>
>
> What the hell is that?! This is just plain unacceptable. Obviously we must have hit some nasty performance snag somewhere, because this is comical. And sure enough, we did.
>
>
>
> When looking around in the AES-NI implementation I came across this bit in aes\_intel.s that performed the CLTS instruction.
>
>
>
> This is a problem: 3.1.2 Instructions That Cause VM Exits ConditionallyCLTS. The CLTS instruction causes a VM exit if the bits in position 3 (corresponding to CR0.TS) are set in both the CR0 guest/host mask and the CR0 read shadow.
>
>
>
> The CLTS instruction signals to the CPU that we're about to use FPU registers (which is needed for AES-NI), which in VMware causes an exit into the hypervisor. And we've been doing it for every single AES block! Needless to say, performing the equivalent of a very expensive context switch every 16 bytes is going to hurt encryption performance a bit. The reason why the kernel is issuing CLTS is because for performance reasons, the kernel doesn't save and restore FPU register state on kernel thread context switches. So whenever we need to use FPU registers inside the kernel, we must disable kernel thread preemption via a call to kpreempt\_disable() and kpreempt\_enable() and save and restore FPU register state manually. During this time, we cannot be descheduled (because if we were, some other thread might clobber our FPU registers), so if a thread does this for too long, it can lead to unexpected latency bubbles
>
>
>
> The solution was to restructure the AES and KCF block crypto implementations in such a way that we execute encryption in meaningfully small chunks. I opted for 32k bytes, for reasons which I'll explain below. Unfortunately, doing this restructuring work was a bit more complicated than one would imagine, since in the KCF the implementation of the AES encryption algorithm and the block cipher modes is separated into two separate modules that interact through an internal API, which wasn't really conducive to high performance (we'll get to that later). Anyway, having fixed the issue here and running the code at near native speed, this is what I get:
>
>

AES-128/CTR: 439 MB/s

AES-128/CBC: 483 MB/s

AES-128/GCM: 252 MB/s

>
>
> Not disastrous anymore, but still, very, very bad. Of course, you've got keep in mind, the thing we're comparing it to, OpenSSL, is no slouch. It's got hand-written highly optimized inline assembly implementations of most of these encryption functions and their specific modes, for lots of platforms. That's a ton of code to maintain and optimize, but I'll be damned if I let this kind of performance gap persist.
>
>
>
> Fixing this, however, is not so trivial anymore. It pertains to how the KCF's block cipher mode API interacts with the cipher algorithms. It is beautifully designed and implemented in a fashion that creates minimum code duplication, but this also means that it's inherently inefficient.
>
>
>
> ECB, CBC and CTR gained the ability to pass an algorithm-specific "fastpath" implementation of the block cipher mode, because these functions benefit greatly from pipelining multiple cipher calls into a single place.
>
>
>
> ECB, CTR and CBC decryption benefit enormously from being able to exploit the wide XMM register file on Intel to perform encryption/decryption operations on 8 blocks at the same time in a non-interlocking manner. The performance gains here are on the order of 5-8x.CBC encryption benefits from not having to copy the previously encrypted ciphertext blocks into memory and back into registers to XOR them with the subsequent plaintext blocks, though here the gains are more modest, around 1.3-1.5x.
>
>
>
> After all of this work, this is how the results now look on Illumos, even inside of a VM:
>
>

Algorithm/Mode 128k ops

AES-128/CTR: 3121 MB/s

AES-128/CBC: 691 MB/s

AES-128/GCM: 1053 MB/s

* So the CTR and GCM speeds have actually caught up to OpenSSL, and CBC is actually faster than OpenSSL.

>
>
> On the decryption side of things, CBC decryption also jumped from 627 MB/s to 3011 MB/s. Seeing these performance numbers, you can see why I chose 32k for the operation size in between kernel preemption barriers. Even on the slowest hardware with AES-NI, we can expect at least 300-400 MB/s/core of throughput, so even in the worst case, we'll be hogging the CPU for at most \~0.1ms per run.
>
>
>
> Overall, we're even a little bit faster than OpenSSL in some tests, though that's probably down to us encrypting 128k blocks vs 8k in the "openssl speed" utility. Anyway, having fixed this monstrous atrocity of a performance bug, I can now finally get some sleep.
>
>

* To made these tests repeatable, and to ensure that the changes didn’t break the crypto algorithms, Saso created a crypto\_test kernel module.
* I have recently created a FreeBSD version of crypto\_test.ko, for much the same purposes
* Initial performance on FreeBSD is not as bad, if you have the aesni.ko module loaded, but it is not up to speed with OpenSSL. You cannot directly compare to the benchmarks Saso did, because the CPUs are vastly different.
* [Performance results](https://wiki.freebsd.org/OpenCryptoPerformance)
* I hope to do some more tests on a range of different sized CPUs in order to determine how the algorithms scale across different clock speeds.
* I also want to look at, or get help and have someone else look at, implementing some of the same optimizations that Saso did.
* It currently seems like there isn’t a way to perform addition crypto operations in the same session without regenerating the key table. Processing additional buffers in an existing session might offer a number of optimizations for bulk operations, although in many cases, each block is encrypted with a different key and/or IV, so it might not be very useful. \*\*\*

### [Brendan Gregg’s special freeware tools for sysadmins](http://www.brendangregg.com/specials.html) ###

* These tools need to be in every (not so) serious sysadmins toolbox.
* Triple ROT13 encryption algorithm (beware: export restrictions may apply)
* /usr/bin/maybe, in case true and false don’t provide too little choice...
* The bottom command lists you all the processes using the least CPU cycles.
* Check out the rest of the tools.
* You wrote similar tools and want us to cover them in the show? Send us an email to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*

### [A look at 2038 ](http://www.lieberbiber.de/2017/03/14/a-look-at-the-year-20362038-problems-and-time-proofness-in-various-systems/) ###

>
>
> I remember the Y2K problem quite vividly. The world was going crazy for years, paying insane amounts of money to experts to fix critical legacy systems, and there was a neverending stream of predictions from the media on how it’s all going to fail. Most didn’t even understand what the problem was, and I remember one magazine writing something like the following:  
>  Most systems store the current year as a two-digit value to save space. When the value rolls over on New Year’s Eve 1999, those two digits will be “00”, and “00” means “halt operation” in the machine language of many central processing units. If you’re in an elevator at this time, it will stop working and you may fall to your death.  
>  I still don’t know why they thought a computer would suddenly interpret data as code, but people believed them. We could see a nearby hydropower plant from my parents’ house, and we expected it to go up in flames as soon as the clock passed midnight, while at least two airplanes crashed in our garden at the same time. Then nothing happened. I think one of the most “severe” problems was the police not being able to open their car garages the next day because their RFID tokens had both a start and end date for validity, and the system clock had actually rolled over to 1900, so the tokens were “not yet valid”.  
>  That was 17 years ago. One of the reasons why Y2K wasn’t as bad as it could have been is that many systems had never used the “two-digit-year” representation internally, but use some form of “timestamp” relative to a fixed date (the “epoch”).  
>  The actual problem with time and dates rolling over is that systems calculate timestamp differences all day. Since a timestamp derived from the system clock seemingly only increases with each query, it is very common to just calculate diff = now - before and never care about the fact that now could suddenly be lower than before because the system clock has rolled over. In this case diff is suddenly negative, and if other parts of the code make further use of the suddenly negative value, things can go horribly wrong.  
>  A good example was a bug in the generator control units (GCUs) aboard Boeing 787 “Dreamliner” aircrafts, discovered in 2015. An internal timestamp counter would overflow roughly 248 days after the system had been powered on, triggering a shut down to “safe mode”. The aircraft has four generator units, but if all were powered up at the same time, they would all fail at the same time. This sounds like an overflow caused by a signed 32-bit counter counting the number of centiseconds since boot, overflowing after 248.55 days, and luckily no airline had been using their Boing 787 models for such a long time between maintenance intervals.  
>  The “obvious” solution is to simply switch to 64-Bit values and call it day, which would push overflow dates far into the future (as long as you don’t do it like the IBM S/370 mentioned before). But as we’ve learned from the Y2K problem, you have to assume that computer systems, computer software and stored data (which often contains timestamps in some form) will stay with us for much longer than we might think. The years 2036 and 2038 might be far in the future, but we have to assume that many of the things we make and sell today are going to be used and supported for more than just 19 years. Also many systems have to store dates which are far in the future. A 30 year mortgage taken out in 2008 could have already triggered the bug, and for some banks it supposedly did.  
>  sys\_gettimeofday() is one of the most used system calls on a generic Linux system and returns the current time in form of an UNIX timestamp (time\_t data type) plus fraction (suseconds\_t data type). Many applications have to know the current time and date to do things, e.g. displaying it, using it in game timing loops, invalidating caches after their lifetime ends, perform an action after a specific moment has passed, etc. In a 32-Bit UNIX system, time\_t is usually defined as a signed 32-Bit Integer.  
>  When kernel, libraries and applications are compiled, the compiler will turn this assumption machine code and all components later have to match each other. So a 32-Bit Linux application or library still expects the kernel to return a 32-Bit value even if the kernel is running on a 64-Bit architecture and has 32-Bit compatibility. The same holds true for applications calling into libraries. This is a major problem, because there will be a lot of legacy software running in 2038. Systems which used an unsigned 32-Bit Integer for time\_t push the problem back to 2106, but I don’t know about many of those.  
>  The developers of the GNU C library (glibc), the default standard C library for many GNU/Linux systems, have come up with a design for year 2038 proofness for their library. Besides the time\_t data type itself, a number of other data structures have fields based on time\_t or the combined struct timespec and struct timeval types. Many methods beside those intended for setting and querying the current time use timestamps  
>  32-Bit Windows applications, or Windows applications defining \_USE\_32BIT\_TIME\_T, can be hit by the year 2038 problem too if they use the time\_t data type. The \_\_time64\_t data type had been available since Visual C 7.1, but only Visual C 8 (default with Visual Studio 2015) expanded time\_t to 64 bits by default. The change will only be effective after a recompilation, legacy applications will continue to be affected.  
>  If you live in a 64-Bit world and use a 64-Bit kernel with 64-Bit only applications, you might think you can just ignore the problem. In such a constellation all instances of the standard time\_t data type for system calls, libraries and applications are signed 64-Bit Integers which will overflow in around 292 billion years. But many data formats, file systems and network protocols still specify 32-Bit time fields, and you might have to read/write this data or talk to legacy systems after 2038. So solving the problem on your side alone is not enough.
>
>

* Then the article goes on to describe how all of this will break your file systems. Not to mention your databases and other file formats.
* Also see [Theo De Raadt’s EuroBSDCon 2013 Presentation](https://www.openbsd.org/papers/eurobsdcon_2013_time_t/mgp00001.html) \*\*\*

Beastie Bits
----------

* [Michael Lucas: Get your name in “Absolute FreeBSD 3rd Edition”](https://blather.michaelwlucas.com/archives/2895)

* [ZFS compressed ARC stats to top](https://svnweb.freebsd.org/base?view=revision&revision=r315435)

* [Matthew Dillon discovered HAMMER was repeating itself when writing to disk. Fixing that issue doubled write speeds](https://www.dragonflydigest.com/2017/03/14/19452.html)

* [TedU on Meaningful Short Names ](http://www.tedunangst.com/flak/post/shrt-nms-fr-clrty)

* [vBSDcon and EuroBSDcon Call for Papers are open](https://www.freebsdfoundation.org/blog/submit-your-work-vbsdcon-and-eurobsdcon-cfps-now-open/)

Feedback/Questions
----------

* [Craig asks about BSD server management](http://pastebin.com/NMshpZ7n)
* [Michael asks about jails as a router between networks](http://pastebin.com/UqRwMcRk)
* [Todd asks about connecting jails ](http://pastebin.com/i1ZD6eXN)
* [Dave writes in with an interesting link](http://pastebin.com/QzW5c9wV) \> applications crash more often due to errors than corruptions. In the case of corruption, a few applications (e.g., Log-Cabin, ZooKeeper) can use checksums and redundancy to recover, leading to a correct behavior; however, when the corruption is transformed into an error, these applications crash, resulting in reduced availability. \*\*\*