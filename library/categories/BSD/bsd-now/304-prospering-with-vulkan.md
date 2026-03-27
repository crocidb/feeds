+++
title = "304: Prospering with Vulkan"
description = "DragonflyBSD 5.6 is out, OpenBSD Vulkan Support, bad utmp implementations in glibc and FreeBSD, OpenSSH protects itself against Side Channel attacks, ZFS vs OpenZFS, and more.HeadlinesDragonflyBSD 5.6 is out * Version 5.6"
date = "2019-06-27T07:45:00Z"
url = "https://www.bsdnow.tv/304"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.626409605Z"
seen = false
+++

DragonflyBSD 5.6 is out, OpenBSD Vulkan Support, bad utmp implementations in glibc and FreeBSD, OpenSSH protects itself against Side Channel attacks, ZFS vs OpenZFS, and more.

Headlines
----------

### [DragonflyBSD 5.6 is out](https://www.dragonflybsd.org/release56) ###

* Version 5.6.0 released 17 June 2019
* [Version 5.6.1 released 19 June 2019](https://www.dragonflydigest.com/2019/06/19/23091.html)

* Big-ticket items

* Improved VM

  * Informal test results showing the changes from 5.4 to 5.6 are available.
  * Reduce stalls in the kernel vm\_page\_alloc() code (vm\_page\_list\_find()).
  * Improve page allocation algorithm to avoid re-iterating the same queues as the search is widened.
  * Add a vm\_page\_hash\*() API that allows the kernel to do heuristical lockless lookups of VM pages.
  * Change vm\_hold() and vm\_unhold() semantics to not require any spin-locks.
  * Change vm\_page\_wakeup() to not require any spin-locks.
  * Change wiring vm\_page's no longer manipulates the queue the page is on, saving a lot of overhead. Instead, the page will be removed from its queue only if the pageout demon encounters it. This allows pages to enter and leave the buffer cache quickly.
  * Refactor the handling of fictitious pages.
  * Remove m-\>md.pv\_list entirely. VM pages in mappings no longer allocate pv\_entry's, saving an enormous amount of memory when multiple processes utilize large shared memory maps (e.g. postgres database cache).
  * Refactor vm\_object shadowing, disconnecting the backing linkages from the vm\_object itself and instead organizing the linkages in a new structure called vm\_map\_backing which hangs off the vm\_map\_entry.
  * pmap operations now iterate vm\_map\_backing structures (rather than spin-locked page lists based on the vm\_page and pv\_entry's), and will test/match operations against the PTE found in the pmap at the requisite location. This doubles VM fault performance on shared pages and reduces the locking overhead for fault and pmap operations.
  * Simplify the collapse code, removing most of the original code and replacing it with simpler per-vm\_map\_entry optimizations to limit the shadow depth.

* DRM

  * Major updates to the radeon and ttm (amd support code) drivers. We have not quite gotten the AMD support up to the more modern cards or Ryzen APUs yet, however.
  * Improve UEFI framebuffer support.
  * A major deadlock has been fixed in the radeon/ttm code.
  * Refactor the startup delay designed to avoid conflicts between the i915 driver initialization and X startup.
  * Add DRM\_IOCTL\_GET\_PCIINFO to improve mesa/libdrm support.
  * Fix excessive wired memory build-ups.
  * Fix Linux/DragonFly PAGE\_MASK confusion in the DRM code.
  * Fix idr\_\*() API bugs.

* HAMMER2

  * The filesystem sync code has been rewritten to significantly improve performance.
  * Sequential write performance also improved.
  * Add simple dependency tracking to prevent directory/file splits during create/rename/remove operations, for better consistency after a crash.
  * Refactor the snapshot code to reduce flush latency and to ensure a consistent snapshot.
  * Attempt to pipeline the flush code against the frontend, improving flush vs frontend write concurrency.
  * Improve umount operation.
  * Fix an allocator race that could lead to corruption.
  * Numerous other bugs fixed.
  * Improve verbosity of CHECK (CRC error) console messages.

---

### [OpenBSD Vulkan Support](https://www.phoronix.com/scan.php?page=news_item&px=OpenBSD-Vulkan-Support) ###

>
>
> Somewhat surprisingly, OpenBSD has added the Vulkan library and ICD loader support as their newest port.   
>  This new graphics/vulkan-loader port provides the generic Vulkan library and ICD support that is the common code for Vulkan implementations on the system. This doesn't enable any Vulkan hardware drivers or provide something new not available elsewhere, but is rare seeing Vulkan work among the BSDs. There is also in ports the related components like the SPIR-V headers and tools, glsllang, and the Vulkan tools and validation layers.   
>  This is of limited usefulness, at least for the time being considering OpenBSD like the other BSDs lag behind in their DRM kernel driver support that is ported over from the mainline Linux kernel tree but generally years behind the kernel upstream. Particularly with Vulkan, newer kernel releases are needed for some Vulkan features as well as achieving decent performance. The Vulkan drivers of relevance are the open-source Intel ANV Vulkan driver and Radeon RADV drivers, both of which are in Mesa though we haven't seen any testing results to know how well they would work if at all currently on OpenBSD, but they're at least in Mesa and obviously open-source.
>
>
>
> * A note: The BSDs are no longer that far behind.
> * FreeBSD 12.0 uses DRM from Linux 4.16 (April 2018), and the drm-devel port is based on Linux 5.0 (March 2019)
> * OpenBSD -current as of April 2019 uses DRM from Linux 4.19.34 \*\*\*
>
>

News Roundup
----------

### [Bad utmp implementations in glibc and freebsd](https://davmac.wordpress.com/2019/05/04/bad-utmp-implementations-in-glibc-and-freebsd/) ###

>
>
> I recently released another version – 0.5.0 – of Dinit, the service manager / init system. There were a number of minor improvements, including to the build system (just running “make” or “gmake” should be enough on any of the systems which have a pre-defined configuration, no need to edit mconfig by hand), but the main features of the release were S6-compatible readiness notification, and support for updating the utmp database.  
>  In other words, utmp is a record of who is currently logged in to the system (another file, “wtmp”, records all logins and logouts, as well as, potentially, certain system events such as reboots and time updates). This is a hint at the main motivation for having utmp support in Dinit – I wanted the “who” command to correctly report current logins (and I wanted boot time to be correctly recorded in the wtmp file).  
>  I wondered: If the files consist of fixed-sized records, and are readable by regular users, how is consistency maintained? That is – how can a process ensure that, when it updates the database, it doesn’t conflict with another process also attempting to update the database at the same time? Similarly, how can a process reading an entry from the database be sure that it receives a consistent, full record and not a record which has been partially updated? (after all, POSIX allows that a write(2) call can return without having written all the requested bytes, and I’m not aware of Linux or any of the \*BSDs documenting that this cannot happen for regular files). Clearly, some kind of locking is needed; a process that wants to write to or read from the database locks it first, performs its operation, and then unlocks the database. Once again, this happens under the hood, in the implementation of the getutent/pututline functions or their equivalents.  
>  Then I wondered: if a user process is able to lock the utmp file, and this prevents updates, what’s to stop a user process from manually acquiring and then holding such a lock for a long – even practically infinite – duration? This would prevent the database from being updated, and would perhaps even prevent logins/logouts from completing. Unfortunately, the answer is – nothing; and yes, it is possible on different systems to prevent the database from being correctly updated or even to prevent all other users – including root – from logging in to the system.
>
>
>
> * A good find
> * On FreeBSD, even though write(2) can be asynchronous, once the write syscall returns, the data is in the buffer cache (or ARC), and any future read(2) will see that new data even if it has not yet been written to disk. \*\*\*
>
>

### [OpenSSH gets an update to protect against Side Channel attacks](https://securityboulevard.com/2019/06/openssh-code-gets-an-update-to-protect-against-side-channel-attacks/) ###

>
>
> Last week, Damien Miller, a Google security researcher, and one of the popular OpenSSH and OpenBSD developers announced an update to the existing OpenSSH code that can help protect against the side-channel attacks that leak sensitive data from computer’s memory. This protection, Miller says, will protect the private keys residing in the RAM against Spectre, Meltdown, Rowhammer, and the latest RAMBleed attack.  
>  SSH private keys can be used by malicious threat actors to connect to remote servers without the need of a password. According to CSO, “The approach used by OpenSSH could be copied by other software projects to protect their own keys and secrets in memory”.  
>  However, if the attacker is successful in extracting the data from a computer or server’s RAM, they will only obtain an encrypted version of an SSH private key, rather than the cleartext version.  
>  In an email to OpenBSD, Miller writes, “this change encrypts private keys when they are not in use with a symmetric key that is derived from a relatively large ‘prekey’ consisting of random data (currently 16KB).”
>
>

---

### [ZFS vs OpenZFS](https://www.ixsystems.com/blog/zfs-vs-openzfs/) ###

>
>
> You’ve probably heard us say a mix of “ZFS” and “OpenZFS” and an explanation is long-overdue.   
>  From its inception, “ZFS” has referred to the “Zettabyte File System” developed at Sun Microsystems and published under the CDDL Open Source license in 2005 as part of the OpenSolaris operating system. ZFS was revolutionary for completely decoupling the file system from specialized storage hardware and even a specific computer platform. The portable nature and advanced features of ZFS led FreeBSD, Linux, and even Apple developers to start porting ZFS to their operating systems and by 2008, FreeBSD shipped with ZFS in the 7.0 release. For the first time, ZFS empowered users of any budget with enterprise-class scalability and data integrity and management features like checksumming, compression and snapshotting, and those features remain unrivaled at any price to this day. On any ZFS platform, administrators use the zpool and zfs utilities to configure and manage their storage devices and file systems respectively. Both commands employ a user-friendly syntax such as‘zfs create mypool/mydataset’ and I welcome you to watch the appropriately-titled webinar “Why we love ZFS & you should too” or try a completely-graphical ZFS experience with FreeNAS.  
>  Oracle has steadily continued to develop its own proprietary branch of ZFS and Matt Ahrens points out that over 50% of the original OpenSolaris ZFS code has been replaced in OpenZFS with community contributions. This means that there are, sadly, two politically and technologically-incompatible branches of “ZFS” but fortunately, OpenZFS is orders of magnitude more popular thanks to its open nature. The two projects should be referred to as “Oracle ZFS” and “OpenZFS” to distinguish them as development efforts, but the user still types the ‘zfs’ command, which on FreeBSD relies on the ‘zfs.ko’ kernel module. My impression is that the terms of the CDDL license under which the OpenZFS branch of ZFS is published protects its users from any patent and trademark risks. Hopefully, this all helps you distinguish the OpenZFS project from the ZFS technology.
>
>
>
> * There was further discussion of how the ZFSOnLinux repo will become the OpenZFS repo in the future once it also contains the bits to build on FreeBSD as well during the June 25th ZFS Leadership Meeting. The videos for all of the meetings are available [here](https://www.youtube.com/channel/UC0IK6Y4Go2KtRueHDiQcxow) \*\*\*
>
>

Beastie Bits
----------

* [How to safely and portably close a file descriptor in a multithreaded process without running into problems with EINTR](https://twitter.com/cperciva/status/1141852451756105729?s=03)
* [KnoxBug Meetup June 27th at 6pm](http://knoxbug.org/2019-06-27)
* [BSD Pizza Night, June 27th at 7pm, Flying Pie Pizzeria, 3 Monroe Pkwy, Ste S, Lake Oswego, OR](https://www.flying-pie.com/locations/lake-oswego/)
* [Difference between $x and ${x}](https://moopost.blogspot.com/2019/06/difference-between-x-and-x.html)
* [Beware of Software Engineering Media Sites](https://www.nemil.com/on-software-engineering/beware-engineering-media.html)
* [How Verizon and a BGP optimizer knocked large parts of the internet offline today](https://blog.cloudflare.com/how-verizon-and-a-bgp-optimizer-knocked-large-parts-of-the-internet-offline-today/)
* [DragonflyBSD - MDS mitigation added a while ago](http://lists.dragonflybsd.org/pipermail/commits/2019-May/718899.html)
* [Reminder: Register for EuroBSDcon 2019 in Lillehammer, Norway](https://eurobsdcon.org)

---

Feedback/Questions
----------

* Dave - [CheriBSD](http://dpaste.com/38233JC)
* Neb - [Hello from Norway](http://dpaste.com/0B8XKXT#wrap)
* Lars - [Ansible tutorial?](http://dpaste.com/3N85SHR)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*

 Your browser does not support the HTML5 video tag.