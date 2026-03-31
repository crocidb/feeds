+++
title = "194: Daemonic plans"
description = "This week on BSD Now we cover the latest FreeBSD Status Report, a plan for Open Source software development, centrally managing bhyve with Ansible, libvirt, and pkg-ssh, and a whole lot more.This episode was brought to you by[![iXsystems - Enterprise Servers and Storage"
date = "2017-05-17T12:00:00Z"
url = "https://www.bsdnow.tv/194"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.896892039Z"
seen = true
+++

This week on BSD Now we cover the latest FreeBSD Status Report, a plan for Open Source software development, centrally managing bhyve with Ansible, libvirt, and pkg-ssh, and a whole lot more.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeBSD Project Status Report (January to March 2017)](https://www.freebsd.org/news/status/report-2017-01-2017-03.html) ###

>
>
> While a few of these projects indicate they are a "plan B" or an "attempt III", many are still hewing to their original plans, and all have produced impressive results. Please enjoy this vibrant collection of reports, covering the first quarter of 2017.
>
>

* The quarterly report opens with notes from Core, The FreeBSD Foundation, the Ports team, and Release Engineering
* On the project front, the Ceph on FreeBSD project had made considerable advances, and is now usable as the net/ceph-devel port via the ceph-fuse module. Eventually they hope to have a kernel RADOS block device driver, so fuse is not required
* CloudABI update, including news that the Bitcoin reference implementation is working on a port to CloudABI
* eMMC Flash and SD card updates, allowing higher speeds (max speed changes from \~40 to \~80 MB/sec). As well, the MMC Stack can now also be backed by the CAM framework.
* Improvements to the Linuxulator
* More detail on the pNFS Server plan B that we discussed in a previous week
* Snow B.V. is sponsoring a dutch translation of the FreeBSD Handbook using the new .po system \*\*\*

### [A plan for open source software maintainers](http://www.daemonology.net/blog/2017-05-11-plan-for-foss-maintainers.html) ###

* Colin Percival describes in his blog “a plan for open source software maintainers”:

>
>
> I've been writing open source software for about 15 years now; while I'm still wet behind the ears compared to FreeBSD greybeards like Kirk McKusick and Poul-Henning Kamp, I've been around for long enough to start noticing some patterns. In particular:  
>  Free software is expensive. Software is expensive to begin with; but good quality open source software tends to be written by people who are recognized as experts in their fields (partly thanks to that very software) and can demand commensurate salaries.  
>  While that expensive developer time is donated (either by the developers themselves or by their employers), this influences what their time is used for: Individual developers like doing things which are fun or high-status, while companies usually pay developers to work specifically on the features those companies need. Maintaining existing code is important, but it is neither fun nor high-status; and it tends to get underweighted by companies as well, since maintenance is inherently unlikely to be the most urgent issue at any given time.  
>  Open source software is largely a "throw code over the fence and walk away" exercise. Over the past 15 years I've written freebsd-update, bsdiff, portsnap, scrypt, spiped, and kivaloo, and done a lot of work on the FreeBSD/EC2 platform. Of these, I know bsdiff and scrypt are very widely used and I suspect that kivaloo is not; but beyond that I have very little knowledge of how widely or where my work is being used. Anecdotally it seems that other developers are in similar positions: At conferences I've heard variations on "you're using my code? Wow, that's awesome; I had no idea" many times.  
>  I have even less knowledge of what people are doing with my work or what problems or limitations they're running into. Occasionally I get bug reports or feature requests; but I know I only hear from a very small proportion of the users of my work. I have a long list of feature ideas which are sitting in limbo simply because I don't know if anyone would ever use them — I suspect the answer is yes, but I'm not going to spend time implementing these until I have some confirmation of that.  
>  A lot of mid-size companies would like to be able to pay for support for the software they're using, but can't find anyone to provide it. For larger companies, it's often easier — they can simply hire the author of the software (and many developers who do ongoing maintenance work on open source software were in fact hired for this sort of "in-house expertise" role) — but there's very little available for a company which needs a few minutes per month of expertise. In many cases, the best support they can find is sending an email to the developer of the software they're using and not paying anything at all — we've all received "can you help me figure out how to use this" emails, and most of us are happy to help when we have time — but relying on developer generosity is not a good long-term solution.  
>  Every few months, I receive email from people asking if there's any way for them to support my open source software contributions. (Usually I encourage them to donate to the FreeBSD Foundation.) Conversely, there are developers whose work I would like to support (e.g., people working on FreeBSD wifi and video drivers), but there isn't any straightforward way to do this. Patreon has demonstrated that there are a lot of people willing to pay to support what they see as worthwhile work, even if they don't get anything directly in exchange for their patronage.
>
>
>
> It seems to me that this is a case where problems are in fact solutions to other problems. To wit:  
>  Users of open source software want to be able to get help with their use cases; developers of open source software want to know how people are using their code.  
>  Users of open source software want to support the the work they use; developers of open source software want to know which projects users care about.  
>  Users of open source software want specific improvements; developers of open source software may be interested in making those specific changes, but don't want to spend the time until they know someone would use them.  
>  Users of open source software have money; developers of open source software get day jobs writing other code because nobody is paying them to maintain their open source software.
>
>
>
> I'd like to see this situation get fixed. As I envision it, a solution would look something like a cross between Patreon and Bugzilla: Users would be able sign up to "support" projects of their choosing, with a number of dollars per month (possibly arbitrary amounts, possibly specified tiers; maybe including $0/month), and would be able to open issues. These could be private (e.g., for "technical support" requests) or public (e.g., for bugs and feature requests); users would be able to indicate their interest in public issues created by other users. Developers would get to see the open issues, along with a nominal "value" computed based on allocating the incoming dollars of "support contracts" across the issues each user has expressed an interest in, allowing them to focus on issues with higher impact.
>
>

* He poses three questions to users about whether or not people (users and software developers alike) would be interested in this and whether payment (giving and receiving, respectively) is interesting  

* Check out the comments (and those on [[https://news.ycombinator.com/item?id=14313804](reddit.com)](https://news.ycombinator.com/item?id=14313804](reddit.com))) as well for some suggestions and discussion on the topic \*\*\*

### [OpenBSD vmm hypervisor: Part 2](http://www.h-i-r.net/2017/04/openbsd-vmm-hypervisor-part-2.html) ###

* We asked for people to write up their experience using OpenBSD’s VMM. This blog post is just that

>
>
> This is going to be a (likely long-running, infrequently-appended) series of posts as I poke around in vmm. A few months ago, I demonstrated some basic use of the vmm hypervisor as it existed in OpenBSD 6.0-CURRENT around late October, 2016. We'll call that video Part 1.  
>  Quite a bit of development was done on vmm before 6.1-RELEASE, and it's worth noting that some new features made their way in. Work continues, of course, and I can only imagine the hypervisor technology will mature plenty for the next release. As it stands, this is the first release of OpenBSD with a native hypervisor shipped in the base install, and that's exciting news in and of itself  
>  To get our virtual machines onto the network, we have to spend some time setting up a virtual ethernet interface. We'll run a DHCP server on that, and it'll be the default route for our virtual machines. We'll keep all the VMs on a private network segment, and use NAT to allow them to get to the network. There is a way to directly bridge VMs to the network in some situations, but I won't be covering that today.  
>  Create an empty disk image for your new VM. I'd recommend 1.5GB to play with at first. You can do this without doas or root if you want your user account to be able to start the VM later. I made a "vmm" directory inside my home directory to store VM disk images in. You might have a different partition you wish to store these large files in.  
>  Boot up a brand new vm instance. You'll have to do this as root or with doas. You can download a -CURRENT install kernel/ramdisk (bsd.rd) from an OpenBSD mirror, or you can simply use the one that's on your existing system (/bsd.rd) like I'll do here.  
>  The command will start a VM named "test.vm", display the console at startup, use /bsd.rd (from our host environment) as the boot image, allocate 256MB of memory, attach the first network interface to the switch called "local" we defined earlier in /etc/vm.conf, and use the test image we just created as the first disk drive.  
>  Now that the VM disk image file has a full installation of OpenBSD on it, build a VM configuration around it by adding the below block of configuration (with modifications as needed for owner, path and lladdr) to /etc/vm.conf  
>  I've noticed that VMs with much less than 256MB of RAM allocated tend to be a little unstable for me. You'll also note that in the "interface" clause, I hard-coded the lladdr that was generated for it earlier. By specifying "disable" in vm.conf, the VM will show up in a stopped state that the owner of the VM (that's you!) can manually start without root access.
>
>

* Let us know how VMM works for you \*\*\*

News Roundup
----------

### [openbsd changes of note 621](http://www.tedunangst.com/flak/post/openbsd-changes-of-note-621) ###

* More stuff, more fun.
* Fix script to not perform tty operations on things that aren’t ttys. Detected by pledge.
* Merge libdrm 2.4.79.
* After a forced unmount, also unmount any filesystems below that mount point.
* Flip previously warm pages in the buffer cache to memory above the DMA region if uvm tells us it is available. Pages are not automatically promoted to upper memory. Instead it’s used as additional memory only for what the cache considers long term buffers. I/O still requires DMA memory, so writing to a buffer will pull it back down.
* Makefile support for systems with both gcc and clang. Make i386 and amd64 so.
* Take a more radical approach to disabling colours in clang.
* When the data buffered for write in tmux exceeds a limit, discard it and redraw. Helps when a fast process is running inside tmux running inside a slow terminal.
* Add a port of witness(4) lock validation tool from FreeBSD. Use it with mplock, rwlock, and mutex in the kernel.
* Properly save and restore FPU context in vmm.
* Remove KGDB. It neither compiles nor works.
* Add a constant time AES implementation, from BearSSL.
* Remove SSHv1 from ssh.
* and more... \*\*\*

### [Digging into BSD's choice of Unix group for new directories and files](https://utcc.utoronto.ca/~cks/space/blog/unix/BSDDirectoryGroupChoice) ###

>
>
> I have to eat some humble pie here. In comments on my entry on an interesting chmod failure, Greg A. Woods pointed out that FreeBSD's behavior of creating everything inside a directory with the group of the directory is actually traditional BSD behavior (it dates all the way back to the 1980s), not some odd new invention by FreeBSD. As traditional behavior it makes sense that it's explicitly allowed by the standards, but I've also come to think that it makes sense in context and in general. To see this, we need some background about the problem facing BSD.  
>  In the beginning, two things were true in Unix: there was no mkdir() system call, and processes could only be in one group at a time. With processes being in only one group, the choice of the group for a newly created filesystem object was easy; it was your current group. This was felt to be sufficiently obvious behavior that the V7 creat(2) manpage doesn't even mention it.  
>  Now things get interesting. 4.1c BSD seems to be where mkdir(2) is introduced and where creat() stops being a system call and becomes an option to open(2). It's also where processes can be in multiple groups for the first time. The 4.1c BSD open(2) manpage is silent about the group of newly created files, while the mkdir(2) manpage specifically claims that new directories will have your effective group (ie, the V7 behavior). This is actually wrong. In both mkdir() in sys\_directory.c and maknode() in ufs\_syscalls.c, the group of the newly created object is set to the group of the parent directory. Then finally in the 4.2 BSD mkdir(2) manpage the group of the new directory is correctly documented (the 4.2 BSD open(2) manpage continues to say nothing about this). So BSD's traditional behavior was introduced at the same time as processes being in multiple groups, and we can guess that it was introduced as part of that change.  
>  When your process can only be in a single group, as in V7, it makes perfect sense to create new filesystem objects with that as their group. It's basically the same case as making new filesystem objects be owned by you; just as they get your UID, they also get your GID. When your process can be in multiple groups, things get less clear. A filesystem object can only be in one group, so which of your several groups should a new filesystem object be owned by, and how can you most conveniently change that choice?  
>  One option is to have some notion of a 'primary group' and then provide ways to shuffle around which of your groups is the primary group.  
>  Another option is the BSD choice of inheriting the group from context. By far the most common case is that you want your new files and directories to be created in the 'context', ie the group, of the surrounding directory.  
>  If you fully embrace the idea of Unix processes being in multiple groups, not just having one primary group and then some number of secondary groups, then the BSD choice makes a lot of sense. And for all of its faults, BSD tended to relatively fully embrace its changes   
>  While it leads to some odd issues, such as the one I ran into, pretty much any choice here is going to have some oddities.
>
>
> ---
>

### [Centrally managed Bhyve infrastructure with Ansible, libvirt and pkg-ssh](http://www.shellguardians.com/2017/05/centrally-managed-bhyve-infrastructure.html) ###

>
>
> At work we've been using Bhyve for a while to run non-critical systems. It is a really nice and stable hypervisor even though we are using an earlier version available on FreeBSD 10.3. This means we lack Windows and VNC support among other things, but it is not a big deal.  
>  After some iterations in our internal tools, we realised that the installation process was too slow and we always repeated the same steps. Of course, any good sysadmin will scream "AUTOMATION!" and so did we. Therefore, we started looking for different ways to improve our deployments.  
>  We had a look at existing frameworks that manage Bhyve, but none of them had a feature that we find really important: having a centralized repository of VM images. For instance, SmartOS applies this method successfully by having a backend server that stores a catalog of VMs and Zones, meaning that new instances can be deployed in a minute at most. This is a game changer if you are really busy in your day-to-day operations.
>
>

* The following building blocks are used:
  * The ZFS snapshot of an existing VM. This will be our VM template.
  * A modified version of oneoff-pkg-create to package the ZFS snapshots.
  * pkg-ssh and pkg-repo to host a local FreeBSD repo in a FreeBSD jail.
  * libvirt to manage our Bhyve VMs.
  * The ansible modules virt, virt\_net and virt\_pool.

>
>
> Once automated, the installation process needs 2 minutes at most, compared with the 30 minutes needed to manually install VM plus allowing us to deploy many guests in parallel.
>
>
> ---
>

### [NetBSD maintainer in the QEMU project](https://blog.netbsd.org/tnf/entry/netbsd_maintainer_in_the_qemu) ###

>
>
> QEMU - the FAST! processor emulator - is a generic, Open Source, machine emulator and virtualizer. It defines state of the art in modern virtualization.  
>  This software has been developed for multiplatform environments with support for NetBSD since virtually forever. It's the primary tool used by the NetBSD developers and release engineering team. It is run with continuous integration tests for daily commits and execute regression tests through the Automatic Test Framework (ATF).  
>  The QEMU developers warned the Open Source community - with version 2.9 of the emulator - that they will eventually drop support for suboptimally supported hosts if nobody will step in and take the maintainership to refresh the support. This warning was directed to major BSDs, Solaris, AIX and Haiku.  
>  Thankfully the NetBSD position has been filled - making NetBSD to restore official maintenance.
>
>
> ---
>

Beastie Bits
----------

* [OpenBSD Community Goes Gold](http://undeadly.org/cgi?action=article&sid=20170510012526&mode=flat&count=0)
* [CharmBUG’s Tor Hack-a-thon has been pushed back to July due to scheduling difficulties](https://www.meetup.com/CharmBUG/events/238218840/)
* [Direct Rendering Manager (DRM) Driver for i915, from the Linux kernel to Haiku with the help of DragonflyBSD’s Linux Compatibility layer](https://www.haiku-os.org/blog/vivek/2017-05-05_[gsoc_2017]_3d_hardware_acceleration_in_haiku/)
* [TomTom lists OpenBSD in license](https://twitter.com/bsdlme/status/863488045449977864)
* [London Net BSD Meetup on May 22nd](https://mail-index.netbsd.org/regional-london/2017/05/02/msg000571.html)
* [KnoxBUG meeting May 30th, 2017 - Introduction to FreeNAS](http://knoxbug.org/2017-05-30) \*\*\*

Feedback/Questions
----------

* [Felix - Home Firewall](http://dpaste.com/35EWVGZ#wrap)
* [David - Docker Recipes for Jails](http://dpaste.com/0H51NX2#wrap)
* [Don - GoLang & Rust](http://dpaste.com/2VZ7S8K#wrap)
* [George - OGG feed](http://dpaste.com/2A1FZF3#wrap)
* [Roller - BSDCan Tips](http://dpaste.com/3D2B6J3#wrap) \*\*\*