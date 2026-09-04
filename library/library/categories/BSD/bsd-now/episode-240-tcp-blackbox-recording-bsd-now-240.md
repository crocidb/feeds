+++
title = "Episode 240: TCP Blackbox Recording | BSD Now 240"
description = 'New ZFS features landing in FreeBSD, MAP\_STACK for OpenBSD, how to write safer C code with Clang’s address sanitizer, Michael W. Lucas on sponsor gifts, TCP blackbox recorder, and Dell disk system hacking.Headlines[A number of Upstream ZFS features landed in FreeBS'
date = "2018-04-07T19:00:00Z"
url = "https://www.bsdnow.tv/240"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.769877666Z"
seen = true
+++

New ZFS features landing in FreeBSD, MAP\_STACK for OpenBSD, how to write safer C code with Clang’s address sanitizer, Michael W. Lucas on sponsor gifts, TCP blackbox recorder, and Dell disk system hacking.

Headlines
----------

### [A number of Upstream ZFS features landed in FreeBSD this week] ###

* [9188 increase size of dbuf cache to reduce indirect block decompression](https://svnweb.freebsd.org/base?view=revision&revision=331711)

  >
  >
  > With compressed ARC (6950) we use up to 25% of our CPU to decompress indirect blocks, under a workload of random cached reads. To reduce this decompression cost, we would like to increase the size of the dbuf cache so that more indirect blocks can be stored uncompressed. If we are caching entire large files of recordsize=8K, the indirect blocks use 1/64th as much memory as the data blocks (assuming they have the same compression ratio). We suggest making the dbuf cache be 1/32nd of all memory, so that in this scenario we should be able to keep all the indirect blocks decompressed in the dbuf cache. (We want it to be more than the 1/64th that the indirect blocks would use because we need to cache other stuff in the dbuf cache as well.) In real world workloads, this won't help as dramatically as the example above, but we think it's still worth it because the risk of decreasing performance is low. The potential negative performance impact is that we will be slightly reducing the size of the ARC (by \~3%).
  >
  >

* [9166 zfs storage pool checkpoint](https://svnweb.freebsd.org/base?view=revision&revision=331701)

  >
  >
  > The idea of Storage Pool Checkpoint (aka zpool checkpoint) deals with exactly that. It can be thought of as a “pool-wide snapshot” (or a variation of extreme rewind that doesn’t corrupt your data). It remembers the entire state of the pool at the point that it was taken and the user can revert back to it later or discard it. Its generic use case is an administrator that is about to perform a set of destructive actions to ZFS as part of a critical procedure. She takes a checkpoint of the pool before performing the actions, then rewinds back to it if one of them fails or puts the pool into an unexpected state. Otherwise, she discards it. With the assumption that no one else is making modifications to ZFS, she basically wraps all these actions into a “high-level transaction”.
  >
  >

* [More information](https://sdimitro.github.io/post/zpool-checkpoint/)

* [8484 Implement aggregate sum and use for arc counters](https://svnweb.freebsd.org/base?view=revision&revision=331404)

  >
  >
  > In pursuit of improving performance on multi-core systems, we should implements fanned out counters and use them to improve the performance of some of the arc statistics. These stats are updated extremely frequently, and can consume a significant amount of CPU time.
  >
  >

* And a small bug fix authored by me:

* [9321 arc*loan*compressed*buf() can increment arc*loaned*bytes by the wrong value*](https://svnweb.freebsd.org/base?view=revision&revision=331709)
  >  *arc*loan*compressed*buf() increments arc*loaned*bytes by psize unconditionally In the case of zfs*compressed*arc*enabled=0, when the buf is returned via arc*return*buf(), if ARC*BUF*COMPRESSED(buf) is false, then arc*loaned*bytes is decremented by lsize, not psize. Switch to using arc*buf*size(buf), instead of psize, which will return psize or lsize, depending on the result of ARC*BUF\_COMPRESSED(buf).

---

### [MAP\_STACK for OpenBSD](https://marc.info/?l=openbsd-tech&m=152035796722258&w=2) ###

>
>
> Almost 2 decades ago we started work on W^X. The concept was simple. Pages that are writable, should not be executable. We applied this concept object by object, trying to seperate objects with different qualities to different pages. The first one we handled was the signal trampoline at the top of the stack. We just kept making changes in the same vein. Eventually W^X came to some of our kernel address spaces also. The fundamental concept is that an object should only have the permissions necessary, and any other operation should fault. The only permission separations we have are kernel vs userland, and then read, write, and execute. How about we add another new permission! This is not a hardware permission, but a software permission. It is opportunistically enforced by the kernel. the permission is MAP*STACK. If you want to use memory as a stack, you must mmap it with that flag bit. The kernel does so automatically for the stack region of a process's stack. Two other types of stack occur: thread stacks, and alternate signal stacks. Those are handled in clever ways. When a system call happens, we check if the stack-pointer register points to such a page. If it doesn't, the program is killed. We have tightened the ABI. You may no longer point your stack register at non-stack memory. You'll be killed. This checking code is MI, so it works for all platforms. Since page-permissions are generally done on page boundaries, there is caveat that thread and altstacks must now be page-sized and page-aligned, so that we can enforce the MAP*STACK attribute correctly. It is possible that a few ports need some massaging to satisfy this condition, but we haven't found any which break yet. A syslog\_r has been added so that we can identify these failure cases. Also, the faulting cases are quite verbose for now, to help identify the programs we need to repair.
>
>

---
 \*\*iXsystems\*\*

### [Writing Safer C with the Clang Address Sanitizer](https://dev.to/loderunner/writing-safer-c-with-clang-address-sanitizer) ###

>
>
> We wanted to improve our password strength algorithm, and decided to go for the industry-standard zxcvbn, from the people at Dropbox. Our web front-end would use the default Javascript library, and for mobile and desktop, we chose to use the C implementation as it was the lowest common denominator for all platforms. Bootstrapping all of this together was done pretty fast. I had toyed around with a few sample passwords so I decided to run it through the test suite we had for the previous password strength evaluator. The test generates a large number of random passwords according to different rules and expects the strength to be in a given range. But the test runner kept crashing with segmentation faults. It turns out the library has a lot of buffer overflow cases that are usually "harmless", but eventually crash your program when you run the evaluator function too much. I started fixing the cases I could see, but reading someone else's algorithms to track down tiny memory errors got old pretty fast. I needed a tool to help me. That's when I thought of Clang's Address Sanitizer. AddressSanitizer is a fast memory error detector. It consists of a compiler instrumentation module and a run-time library Let's try the sanitizer on a simple program. We'll allocate a buffer on the heap, copy each character of a string into it, and print it to standard output. + The site walks through a simple example which contains an error, it writes past the end of a buffer + The code works as expected, and nothing bad happens. It must be fine… + Then they compile it again with the address sanitizer actived So what can we gather from that pile of hex? Let's go through it line by line. AddressSanitizer found a heap buffer overflow at 0x60200000ef3d, a seemingly valid address (not NULL or any other clearly faulty value). + ASAN points directly to the line of code that is causing the problem We're writing outside of the heap in this instruction. And AddressSanitizer isn't having it. This is definitely one of my favorite indications. In addition to telling which line in the code failed and where in the memory the failure happened, you get a complete description of the closest allocated region in memory (which is probably the region you were trying to access). + They then walk through combining this with lldb, the Clang debugger, to actually interactively inspect the state of the problem when an invalid memory access happens Back to my practical case, how did I put the address sanitizer to good use? I simply ran the test suite, compiled with the sanitizer, with lldb. Sure enough, it stopped on every line that could cause a crash. It turns out there were many cases where zxcvbn-c wrote past the end of allocated buffers, on the heap and on the stack. I fixed those cases in the C library and ran the tests again. Not a segfault in sight! I've used memory tools in the past, but they were usually unwieldy, or put such a toll on performance that they were useless in any real-life case. Clang's address sanitizer turned out to be detailed, reliable, and surprisingly easy to use. I've heard of the miracles of Valgrind but macOS hardly supports it, making it a pain to use on my MacBook Pro. Coupled with Clang's static analyzer, AddressSanitizer is going to become a mandatory stop for evaluating code quality. It's also going to be the first tool I grab when facing confusing memory issues. There are many more case where I could use early failure and memory history to debug my code. For example, if a program crashes when accessing member of a deallocated object, we could easily trace the event that caused the deallocation, saving hours of adding and reading logs to retrace just what happened.
>
>

---

News Roundup
----------

### [On sponsor gifts](https://blather.michaelwlucas.com/archives/3131) ###

>
>
> Note the little stack of customs forms off to the side. It’s like I’ve learned a lesson from standing at the post office counter filling out those stupid forms. Sponsors should get their books soon.
>
>
>
> This seems like an apropos moment to talk about what I do for print sponsors. I say I send them “a gift,” but what does that really mean? The obvious thing to ship them is a copy of the book I’ve written. Flat-out selling print books online has tax implications, though.
>
>
>
> Sponsors might have guessed that they’d get a copy of the book. But I shipped them the hardcover, which isn’t my usual practice.
>
>
>
> That’s because I send sponsors a gift. As it’s a gift, I get to choose what I send. I want to send them something nice, to encourage them to sponsor another book. It makes no sense for me to send a sponsor a Singing Wedgie-O-Gram. (Well, maybe a couple sponsors. You know who you are.)
>
>
>
> The poor bastards who bought into my scam–er, sponsored my untitled book–have no idea what’s coming. As of right now, their sensible guesses are woefully incomplete.
>
>
>
> Future books? They might get a copy of the book. They might get book plus something. They might just get the something. Folks who sponsor the jails book might get a cake with a file in it. Who knows?
>
>
>
> It’s a gift. It’s my job to make that gift worthwhile.
>
>
>
> And to amuse myself. Because otherwise, what’s the point?
>
>

---

### [TCP Blackbox Recorder](https://svnweb.freebsd.org/base?view=revision&revision=331347) ###

 ``` Add the "TCP Blackbox Recorder" which we discussed at the developer summits at BSDCan and BSDCam in 2017. The TCP Blackbox Recorder allows you to capture events on a TCP connection in a ring buffer. It stores metadata with the event. It optionally stores the TCP header associated with an event (if the event is associated with a packet) and also optionally stores information on the sockets. It supports setting a log ID on a TCP connection and using this to correlate multiple connections that share a common log ID. You can log connections in different modes. If you are doing a coordinated test with a particular connection, you may tell the system to put it in mode 4 (continuous dump). Or, if you just want to monitor for errors, you can put it in mode 1 (ring buffer) and dump all the ring buffers associated with the connection ID when we receive an error signal for that connection ID. You can set a default mode that will be applied to a particular ratio of incoming connections. You can also manually set a mode using a socket option. This commit includes only basic probes. rrs@ has added quite an abundance of probes in his TCP development work. He plans to commit those soon. There are user-space programs which we plan to commit as ports. These read the data from the log device and output pcapng files, and then let you analyze the data (and metadata) in the pcapng files. Reviewed by: gnn (previous version) Obtained from: Netflix, Inc. Relnotes: yes Differential Revision: https://reviews.freebsd.org/D11085 ```
---
 \*\*Digital Ocean\*\*

### [Outta the way, KDE4](https://euroquis.nl/bobulate/?p=1812) ###

>
>
> KDE4 has been rudely moved aside on FreeBSD. It still installs (use x11/kde4) and should update without a problem, but this is another step towards adding modern KDE (Plasma 5 and Applications) to the official FreeBSD Ports tree. This has taken a long time mostly for administrative reasons, getting all the bits lined up so that people sticking with KDE4 (which, right now, would be everyone using KDE from official ports and packages on FreeBSD) don’t end up with a broken desktop. We don’t want that. But now that everything Qt4 and kdelibs4-based has been moved aside by suffixing it with -kde4, we have the unsuffixed names free to indicate the latest-and-greatest from upstream.
>
>
>
> KDE4 users will see a lot of packages moving around and being renamed, but no functional changes. Curiously, the KDE4 desktop depends on Qt5 and KDE Frameworks 5 — and it has for quite some time already, because the Oxygen icons are shared with KDE Frameworks, but primarily because FileLight was updated to the modern KDE Applications version some time ago (the KDE4 version had some serious bugs, although I can not remember what they were). Now that the names are cleaned up, we could consider giving KDE4 users the buggy version back.
>
>
>
> From here on, we’ve got the following things lined up:
>
>

* Qt 5.10 is being worked on, except for WebEngine (it would slow down an update way too much), because Plasma is going to want Qt 5.10 soon.
* CMake 3.11 is in the -rc stage, so that is being lined up.
* The kde5-import branch in KDE-FreeBSD’s copy of the FreeBSD ports tree (e.g. Area51) is being prepped and polished for a few big SVN commits that will add all the new bits.

>
>
> So we’ve been saying Real Soon Now ™ for years, but things are Realer Sooner Nower ™ now.
>
>

---

### [Dell FS12-NV7 and other 2U server (e.g. C6100) disk system hacking](http://blog.frankleonhardt.com/2017/del-fs12-nv7-and-other-2u-server-e-g-c6100-disk-system-hacking/) ###

>
>
> A while back I reviewed the Dell FS12-NV7 – a 2U rack server being sold cheap by all and sundry. It’s a powerful box, even by modern standards, but one of its big drawbacks is the disk system it comes with. But it needn’t be.
>
>
>
> There are two viable solutions, depending on what you want to do. You can make use of the SAS backplane, using SAS and/or SATA drives, or you can go for fewer SATA drives and free up one or more PCIe slots as Plan B. You probably have an FS12 because it looks good for building a drive array (or even FreeNAS) so I’ll deal with Plan A first.
>
>
>
> Like most Dell servers, this comes with a Dell PERC RAID SAS controller – a PERC6/i to be precise. This ‘I’ means it has internal connectors; the /E is the same but its sockets are external.
>
>
>
> The PERC connects to a twelve-slot backplane forming a drive array at the front of the box. More on the backplane later; it’s the PERCs you need to worry about.
>
>
>
> The PERC6 is actually an LSI Megaraid 1078 card, which is just the thing you need if you’re running an operating system like Windows that doesn’t support a volume manager, striping and other grown-up stuff. Or if your OS does have these features, but you just don’t trust it. If you are running such an OS you may as well stick to the PERC6, and good luck to you. If you’re using BSD (including FreeNAS), Solaris or a Linux distribution that handles disk arrays, read on. The PERC6 is a solution to a problem you probably don’t have, but in all other respects its a turkey. You really want a straightforward HBA (Host Bus Adapter) that allows your clever operating system to talk directly with the drives.
>
>
>
> Any SAS card based on the 1078 (such as the PERC6) is likely to have problems with drives larger than 2Tb. I’m not completely sure why, but I suspect it only applies to SATA. Unfortunately I don’t have any very large SAS drives to test this theory. A 2Tb limit isn’t really such a problem when you’re talking about a high performance array, as lots of small drives are a better option anyway. But it does matter if you’re building a very large datastore and don’t mind slower access and very significant resilvering times when you replace a drive. And for large datastores, very large SATA drives save you a whole lot of cash. The best capacity/cost ratio is for 5Gb SATA drives
>
>
>
> Some Dell PERCs can be re-flashed with LSI firmware and used as a normal HBA. Unfortunately the PERC6 isn’t one of them. I believe the PERC6/R can be, but those I’ve seen in a FS12 are just a bit too old. So the first thing you’ll need to do is dump them in the recycling or try and sell them on eBay.
>
>
>
> There are actually two PERC6 cards in most machine, and they each support eight SAS channels through two SFF-8484 connectors on each card. Given there are twelve drives slots, one of the PERCs is only half used. Sometimes they have a cable going off to a battery located near the fans. This is used in a desperate attempt to keep the data in the card’s cache safe in order to avoid write holes corrupting NTFS during a power failure, although the data on the on-drive caches won’t be so lucky. If you’re using a file system like that, make sure you have a UPS for the whole lot.
>
>
>
> But we’re going to put the PERCs out of our misery and replace them with some nice new LSI HBAs that will do our operating system’s bidding and let it talk to the drives as it knows best. But which to pick? First we need to know what we’re connecting.
>
>
>
> Moving to the front of the case there are twelve metal drive slots with a backplane behind. Dell makes machines with either backplanes or expanders. A backplane has a 1:1 SAS channel to drive connection; an expander takes one SAS channel and multiplexes it to (usually) four drives. You could always swap the blackplane with an expander, but I like the 1:1 nature of a backplane. It’s faster, especially if you’re configured as an array. And besides, we don’t want to spend more money than we need to, otherwise we wouldn’t be hot-rodding a cheap 2U server in the first place – expanders are expensive. Bizarrely, HBAs are cheap in comparison. So we need twelve channels of SAS that will connect to the sockets on the backplane.
>
>
>
> The HBA you will probably want to go with is an LSI, as these have great OS support. Other cards are available, but check that the drivers are also available. The obvious choice for SAS aficionados is the LSI 9211-8i, which has eight internal channels. This is based on an LSI 2000 series chip, the 2008, which is the de-facto standard. There’s also four-channel -4i version, so you could get your twelve channels using one of each – but the price difference is small these days, so you might as well go for two -8i cards. If you want cheaper there are 1068-based equivalent cards, and these work just fine at about half the price. They probably won’t work with larger disks, only operate at 3Gb and the original SAS standard. However, the 2000 series is only about £25 extra and gives you more options for the future. A good investment. Conversely, the latest 3000 series cards can do some extra stuff (particularly to do with active cables) but I can’t see any great advantage in paying megabucks for one unless you’re going really high-end – in which case the NV12 isn’t the box for you anyway. And you’d need some very fast drives and a faster backplane to see any speed advantage. And probably a new motherboard….
>
>
>
> Whether the 6Gb SAS2 of the 9211-8i is any use on the backplane, which was designed for 3Gb, I don’t know. If it matters that much to you you probably need to spend a lot more money. A drive array with a direct 3Gb to each drive is going to shift fast enough for most purposes.
>
>
>
> Once you have removed the PERCs and plugged in your modern-ish 9211 HBAs, your next problem is going to be the cable. Both the PERCs and the backplane have SFF-8484 multi-lane connectors, which you might not recognise. SAS is a point-to-point system, the same as SATA, and a multi-lane cable is simply four single cables in a bundle with one plug. (Newer versions of SAS have more). SFF-8484 multi-lane connectors are somewhat rare, (but unfortunately this doesn’t make them valuable if you were hoping to flog them on eBay). The world switched quickly to the SFF-8087 for multi-lane SAS. The signals are electrically the same, but the connector is not.
>
>
>
> Please generate and paste your ad code here. If left empty, the ad location will be highlighted on your blog pages with a reminder to enter your code. Mid-Post So there are two snags with this backplane. Firstly it’s designed to work with PERC controllers; secondly it has the old SFF-8484 connectors on the back, and any SAS cables you find are likely to have SFF-8087.
>
>
>
> First things first – there is actually a jumper on the backplane to tell it whether it’s talking to a PERC or a standard LSI HBA. All you need to do is find it and change it. Fortunately there are very few jumpers to choose from (i.e. two), and you know the link is already in the wrong place. So try them one at a time until it works. The one you want may be labelled J15, but I wouldn’t like to say this was the same on every variant.
>
>
>
> Second problem: the cable. You can get cables with an SFF-8087 on one end and an SFF-8484 on the other. These should work. But they’re usually rather expensive. If you want to make your own, it’s a PITA but at least you have the connectors already (assuming you didn’t bin the ones on the PERC cables).
>
>
>
> I don’t know what committee designed SAS cable connectors, but ease of construction wasn’t foremost in their collective minds. You’re basically soldering twisted pair to a tiny PCB. This is mechanically rubbish, of course, as the slightest force on the cable will lift the track. Therefore its usual to cover the whole joint in solidified gunk (technical term) to protect it. Rewiring SAS connectors is definitely not easy.
>
>
>
> I’ve tried various ways of soldering to them, none of which were satisfactory or rewarding. One method is to clip the all bare wires you wish to solder using something like a bulldog clip so they’re at lined up horizontally and then press then adjust the clamp so they’re gently pressed to the tracks on the board, making final adjustments with a strong magnifying glass and a fine tweezers. You can then either solder them with a fine temperature-controlled iron, or have pre-coated the pads with solder paste and flash across it with an SMD rework station. I’d love to know how they’re actually manufactured – using a precision jig I assume.
>
>
>
> The “easy” way is to avoid soldering the connectors at all; simply cut existing cables in half and join one to the other. I’ve used prototyping matrix board for this. Strip and twist the conductors, push them through a hole and solder. This keeps things compact but manageable. We’re dealing with twisted pair here, so maintain the twists as close as possible to the board – it actually works quite well.
>
>
>
> However, I’ve now found a reasonably-priced source of the appropriate cable so I don’t do this any more. Contact me if you need some in the UK.
>
>
>
> So all that remains is to plug your HBAs to the backplane, shove in some drives and you’re away. If you’re at this stage, it “just works”. The access lights for all the drives do their thing as they should. The only mystery is how you can get the ident LED to come on; this may be controlled by the PERC when it detects a failure using the so-called sideband channel, or it may be operated by the electronics on the backplane. It’s workings are, I’m afraid, something of a mystery still – it’s got too much electronics on board to be a completely passive backplane.
>
>
>
> Plan B: SATA
>
>
>
> If you plan to use only SATA drives, especially if you don’t intend using more than six, it makes little sense to bother with SAS at all. The Gigabyte motherboard comes with half a dozen perfectly good 3Gb SATA channels, and if you need more you can always put another controller in a PCIe slot, or even USB. The advantages are lower cost and you get to free up two PCIe slots for more interesting things.
>
>
>
> The down-side is that you can’t use the SAS backplane, but you can still use the mounting bays.
>
>
>
> Removing the backplane looks tricky, but it really isn’t when you look a bit closer. Take out the fans first (held in place by rubber blocks), undo a couple of screws and it just lifts and slides out. You can then slot and lock in the drives and connect the SATA connectors directly to the back of the drives. You could even slide them out again without opening the case, as long as the cable was long enough and you manually detached the cable it when it was withdrawn. And let’s face it – drives are likely to last for years so even with half a dozen it’s not that great a hardship to open the case occasionally.
>
>
>
> Next comes power. The PSU has a special connector for the backplane and two standard SATA power plugs. You could split these three ways using an adapter, but if you have a lot of drives you might want to re-wire the cables going to the backplane plug. It can definitely power twelve drives.
>
>
>
> And that’s almost all there is to it. Unfortunately the main fans are connected to the backplane, which you’ve just removed. You can power them from an adapter on the drive power cables, but there are unused fan connectors on the motherboard. I’m doing a bit more research on cooling options, but this approach has promising possibilities for noise reduction.
>
>

---

Beastie Bits
----------

* [Adriaan de Groot’s post FOSDEM blog post](https://euroquis.nl/bobulate/?p=1787)
* [My First FreeNAS](https://www.manios.ca/blog/2018/01/my-first-freenas/)
* [smart(8) Call for Testing by Michael Dexter](https://lists.freebsd.org/pipermail/freebsd-fs/2018-March/025997.html)
* [BSDCan 2018 Travel Grant Application Now Open](https://www.freebsdfoundation.org/blog/bsdcan-2018-travel-grant-application-now-open/)
* [BSD Developer Kristaps Dzonsons interviews Linus Torvalds, about diving](https://divelog.blue/linus_torvalds.html)
* [Twitter vote - The secret to a faster FreeBSD default build world...](https://twitter.com/michaeldexter/status/979236774667939840)
* [tmate - Instant terminal sharing](https://tmate.io/)

---

**Tarsnap**

Feedback/Questions
----------

* Vikash - [Getting a port added](http://dpaste.com/05X35B1#wrap)
* Chris Wells - [Quarterly Ports Branch](http://dpaste.com/05S7A6V#wrap)
* [FreeBSD-CI configs on Github](https://github.com/freebsd/freebsd-ci)
* [Jenkins on the FreeBSD Wiki](https://wiki.freebsd.org/Jenkins)
* Gordon - [Centralised storage suggestions](http://dpaste.com/0HSVFE7#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---