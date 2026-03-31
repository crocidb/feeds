+++
title = "136: This is GNN"
description = "This week on the show, we will be interviewing GNN of the FreeBSD project to talk about the new TeachBSD initiative. That plus the latest BSD headlines, all coming your way right now!This episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Ope"
date = "2016-04-06T12:00:00Z"
url = "https://www.bsdnow.tv/136"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.047403273Z"
seen = true
+++

This week on the show, we will be interviewing GNN of the FreeBSD project to talk about the new TeachBSD initiative. That plus the latest BSD headlines, all coming your way right now!

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeBSD 10.3-RELEASE Announcement ](https://www.freebsd.org/releases/10.3R/announce.html) ###

* FreeBSD 10.3 has landed, with extended support until April 30, 2018
* This is likely to be the last extended support release, as starting with 11, the new support model will encourage upgrading to the latest minor version by ending support for the previous minor version approximately 2 months after each point release. The Major version / stable branch will still be supported for the same 5 year term. This will allow the FreeBSD project to move forward more quickly, while still providing the same level of long term support
* The UEFI boot loader is much improved, and now supports booting root-on-ZFS, and the beastie menu
* The beastie menu itself has been updated with support for ZFS Boot Environments
* The CAM Target Layer (CTL) now supports High Availability, allowing the construction of much more advanced storage systems
* The 64bit Linux Emulation Layer was backported
* Reroot support was added, allowing the system to boot off of a minimal image, such as a mfsroot and then reload all of userland from a different root file system (such as iSCSI, NFS, etc)
* The version of xz(1) has been updated to support multi-threaded compression
* sesutil(8) has been introduced, making it easier to manage large storage nodes
* Various ZFS updates
* As usual, a huge number of driver updates are also included \*\*\*

### [How to use OpenBSD with Libreboot: detailed instructions ](https://lists.nongnu.org/archive/html/libreboot/2016-04/msg00010.html) ###

* This tutorial covers installing OpenBSD on a Thinkpad X200 using Libreboot, a replacement for the traditional BIOS/firmware that comes from the manufacturer
* “Since 5.9, OpenBSD supports EFI boot mode, which means that it also have had to support framebuffer out of the box, so lack of proprietary VGA BIOS blob is no longer a problem and you can boot it with unmodified Libreboot binary release 20150518.”
* “In order to install OpenBSD on such a machine you will need someadditional preparations, since regular install59.fs won't work because bsd.rd doesn't have a framebuffer console.”
* A few extra steps are required to get it going, but they are outlined in the post
* This may be very interesting to those who prefer not to depend on binary blobs \*\*\*

### [Linking the FreeBSD base system with lld -- status update](http://lists.llvm.org/pipermail/llvm-dev/2016-March/096449.html) ###

* The FreeBSD Foundation’s Ed Maste provides an update on the LLVM mailing list about the progress of replacing the GNU linker with the lld in the FreeBSD base system
* “I'm pleased to report that I can now build a runnable FreeBSD system using lld as the linker (for buildworld), with a few workarounds and work-in-progress patches. I have not yet extensively tested the result but it is possible to login to the resulting system, and basic sanity tests I've tried are successful. Note that the kernel is still linked with ld.bfd.”
* Outstanding Issues
  * Symbol version support (PR 23231). FreeBSD uses symbol versioning for backwards compatibility
  * Linker script expression support (PR 26731). The FreeBSD kernel linker scripts contain expressions not currently supported by lld
  * Library search paths. GNU LD automatically searches /lib, and lld does not
  * the -N flag makes the text and data sections RW and does not page-align data. It is used by boot loader components.
  * The -dc flag assigns space to common symbols when producing relocatable output (-r). It is used by the /rescue build, which is a single binary assembled from a collection of individual tools (sh, ls, fsck, ...)
  * -Y adds a path to the default library search path. It is used by the lib32 build, which provides i386 builds of the system libraries for compatibility with i386 applications.

* With the ongoing work, it might be possible for FreeBSD 11 to use lld by default, although it might be best to wait to throw that particular switch \*\*\*

### [Your favorite billion user company using BSD just flipped on encryption for all their users -- and it took 15 Engineers to do it](http://www.wired.com/2016/04/forget-apple-vs-fbi-whatsapp-just-switched-encryption-billion-people/) ###

* With the help of Moxie Marlinspike’s Open Whisper Systems, WhatsApp has integrated the ‘Signal’ encryption system for all messages, class, pictures, and videos sent between individuals or groups
* It uses public key cryptography, very similar to GPG, but with automated public key servers
* It also includes a system of QR codes to verify the identity of individuals in person, so you can be sure the person you are talking to is actually the person you met with
* WhatsApp runs their billion user network, using FreeBSD, with only about 50 engineers
* Only 15 of those engineers we needed to work on the project that has now deployed complete end-to-end encryption across the entire network
* The Wired article is very detailed and well worth the read \*\*\*

Interview - George Neville-Neil - [gnn@freebsd.org](mailto:gnn@freebsd.org) / [@gvnn3](https://twitter.com/gvnn3)
----------

Teaching BSD with Tracing

---

News Roundup
----------

### [Faces of FreeBSD 2016: Scott Long](https://www.freebsdfoundation.org/blog/faces-of-freebsd-2016-scott-long/) ###

* It’s been awhile since we’ve had a new entry into the “Faces of FreeBSD” series, but due to popular demand it’s back!
* This installment features developer Scott Long, who currently works at NetFlix, previously at Yahoo and Adaptec.
* Scott got a very early start into BSD, first discovering i386BSD 0.1 on a FTP server at Berkeley, back at 1992. From there on it’s been a journey, following along with FreeBSD since version 1.0 in 1993.
* So what stuff can we blame Scott for? In his own words:

>
>
> I’ve been a source committer since 2000. I got my start by taking over maintainership of the Adaptec ‘aac’ RAID driver. From 2002-2006 I was the Release Engineer and was responsible for the 5.x and 6.x releases. Though the early 5.x releases were not great, they were necessary stepping stones to the success of FreeBSD 6.x and beyond. I’m exceptionally proud of my role in helping FreeBSD move forward during that time.
>
>
>
> I authored and maintained the ‘mfi’ and ‘mps’ storage drivers, the ‘udf’ filesystem driver, and several smaller sound and USB drivers. I’ve maintained, or at least touched, most of the storage device drivers in the system to some extent, and I implemented medium-grained locking on the CAM storage stack. Recently I’ve been working on overall system scalability and performance.
>
>

---

### [ASCII Flow](http://asciiflow.com/) ###

* A website that lets to draw and share ASCII diagrams
* Great for network layout maps, rack diagrams, protocol analysis etc
* Use it in your presentations and slides
* [Sample ](https://drive.google.com/open?id=0BynxTTJrNUOKeWxCVm1ERExrNkU) \*\*\*

### [System Under Test: FreeBSD](http://lowlevelbits.org/system-under-test-freebsd/) ###

* Part of a series looking at testing across a number of projects
* Outlines the testing framework of FreeBSD
* Provides a mini-tutorial on how to run the tests
* There are some other tests that are now covered, but this is due to a lack of documentation on the fact that the tests exist, and how to run them
* There is much ongoing work in this area \*\*\*

### [Worst April Fools Joke EVER!](http://www.rhyous.com/2016/04/01/microsoft-announces-it-is-acquiring-freebsd-for-300-million/) ###

* While a bad April Fool’s joke, it also shows some common misconceptions
* The FreeBSD Foundation does not own the source repository, it is only the care taken of the trademark, and other things that require a single legal entity
* OpenBSD and NetBSD are not ‘sub brands’ of FreeBSD
* Bash was not ported to Windows, but rather Windows gained a system similar to FreeBSD’s linux\_compat
* It would be nice to have ZFS on Windows \*\*\*

Beastie Bits
----------

* [Credit where credit's due...](https://forums.freebsd.org/threads/55642/)

* [M:Tier's OpenBSD packages and binpatches updated for 5.9](https://stable.mtier.org/)

* [NYC BUG Meeting (2016-04-06) - Debugging with LLVM, John Wolfe](http://www.nycbug.org/index.cgi)

* [Need to create extremely high traffic loads? kq\_sendrecv is worth checking out](http://lists.dragonflybsd.org/pipermail/commits/2016-March/459651.html)

* [If you're in the Maryland region, CharmBug has a meetup next week](http://www.meetup.com/CharmBUG/events/230048300/)

* [How to get a desktop on DragonFly](https://www.dragonflybsd.org/docs/how_to_get_to_the_desktop/)

* [Linux vs BSD Development Models ](https://twitter.com/q5sys/status/717509675630084096)

Feedback/Question
----------

* [ Paulo - ZFS Setup](http://pastebin.com/raw/GrM0jKZK)
* [ Jonathan - Installation ](http://pastebin.com/raw/13KCkhMU)
* [ Andrew - Career / School](http://pastebin.com/wsx90L2m)

---