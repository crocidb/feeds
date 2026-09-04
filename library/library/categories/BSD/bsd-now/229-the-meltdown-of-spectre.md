+++
title = "229: The Meltdown of Spectre"
description = "We review Meltdown and Spectre responses from various BSD projects, show you how to run CentOS with bhyve, GhostBSD 11.1 is out, and we look at the case against the fork syscall.This episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Open Sou"
date = "2018-01-17T13:00:00Z"
url = "https://www.bsdnow.tv/229"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.801027382Z"
seen = true
+++

We review Meltdown and Spectre responses from various BSD projects, show you how to run CentOS with bhyve, GhostBSD 11.1 is out, and we look at the case against the fork syscall.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### More Meltdown ###

* Much has been happened this week, but before we get into a status update of the various mitigations on the other BSDs, some important updates:

  * [Intel has recalled the microcode update they issued on January 8th. It turns out this update can cause Haswell and Broadwell based systems to randomly reboot, with some frequency.](https://newsroom.intel.com/news/intel-security-issue-update-addressing-reboot-issues/)
  * [AMD has confirmed that its processors are vulnerable to both variants of Spectre, and the the fix for variant #2 will require a forthcoming microcode update, in addition to OS level mitigations](https://www.amd.com/en/corporate/speculative-execution)
  * [Fujitsu has provided a status report for most of its products, including SPARC hardware](https://sp.ts.fujitsu.com/dmsp/Publications/public/Intel-Side-Channel-Analysis-Method-Security-Review-CVE2017-5715-vulnerability-Fujitsu-products.pdf)

* [The Register of course has some commentary](https://www.theregister.co.uk/2018/01/12/intel_warns_meltdown_spectre_fixes_make_broadwells_haswells_unstable/)

>
>
> If new code is needed, Intel will need to get it right: the company already faces numerous class action lawsuits. Data centre operators already scrambling to conduct unplanned maintenance will not be happy about the fix reducing stability.  
>  AMD has said that operating system patches alone will address the Spectre bounds check bypass bug. Fixing Spectres branch target injection flaw will require firmware fixes that AMD has said will start to arrive for Ryzen and EPYC CPUs this week.  
>  The Register has also asked other server vendors how theyre addressing the bugs. Oracle has patched its Linux, but has told us it has No comment/statement on this as of now in response to our query about its x86 systems, x86 cloud, Linux and Solaris on x86. The no comment regarding Linux is odd as fixes for Oracle Linux landed [here](https://linux.oracle.com/errata/ELSA-2018-4006.html) on January 9th.  
>  SPARC-using Fujitsu, meanwhile, has published advice (PDF) revealing how it will address the twin bugs in its servers and PCs, and also saying its SPARC systems are under investigation.
>
>

* [Response from OpenBSD:](https://undeadly.org/cgi?action=article;sid=20180106082238)

['Meltdown, aka "Dear Intel, you suck"'](https://marc.info/?t=151521438600001&r=1&w=2)

* [Theo de Raadt's response to Meltdown](https://www.itwire.com/security/81338-handling-of-cpu-bug-disclosure-incredibly-bad-openbsd-s-de-raadt.html)

* [That time in 2007 when Theo talked about how Intel x86 had major design problems in their chips](https://marc.info/?l=openbsd-misc&m=118296441702631&w=2)

* [OpenBSD gets a Microcode updater](https://marc.info/?l=openbsd-cvs&m=151570987406841&w=2)

* [Response from Dragonfly BSD:](http://lists.dragonflybsd.org/pipermail/users/2018-January/313758.html)  
   The longer response in four commits

  * [One](http://lists.dragonflybsd.org/pipermail/commits/2018-January/627151.html)
  * [Two](http://lists.dragonflybsd.org/pipermail/commits/2018-January/627152.html)
  * [Three](http://lists.dragonflybsd.org/pipermail/commits/2018-January/627153.html)
  * [Four](http://lists.dragonflybsd.org/pipermail/commits/2018-January/627154.html)

* [Even more Meltdown](https://www.dragonflydigest.com/2018/01/10/20718.html)

* [DragonflyBSD master now has full IBRS and IBPB support](http://lists.dragonflybsd.org/pipermail/users/2018-January/335643.html)

  * IBRS (Indirect Branch Restricted Speculation): The x86 IBRS feature requires corresponding microcode support. It mitigates the variant 2 vulnerability.
  * If IBRS is set, near returns and near indirect jumps/calls will not allow their predicted target address to be controlled by code that executed in a less privileged prediction mode before the IBRS mode was last written with a value of 1 or on another logical processor so long as all RSB entries from the previous less privileged prediction mode are overwritten.
  * Speculation on Skylake and later requires these patches ("dynamic IBRS") be used instead of retpoline. If you are very paranoid or you run on a CPU where IBRS=1 is cheaper, you may also want to run in "IBRS always" mode.
  * IBPB (Indirect Branch Prediction Barrier): Setting of IBPB ensures that earlier code's behavior does not control later indirect branch predictions. It is used when context switching to new untrusted address space. Unlike IBRS, IBPB is a command MSR and does not retain its state.

* [DragonFlyBSD's Meltdown Fix Causing More Slowdowns Than Linux](https://www.phoronix.com/scan.php?page=article&item=dragonfly-bsd-meltdown&num=1)

* [NetBSD HOTPATCH()](http://mail-index.netbsd.org/source-changes/2018/01/07/msg090945.html)

* [NetBSD SVS (Separate Virtual Space)](http://mail-index.netbsd.org/source-changes/2018/01/07/msg090952.html)

---

### [Running CentOS with Bhyve](https://www.daemon-security.com/2018/01/bhyve-centos-0110.html) ###

>
>
> With the addition of UEFI in FreeBSD (since version 11), users of bhyve can use the UEFI boot loader instead of the grub2-bhyve port for booting operating systems such as Microsoft Windows, Linux and OpenBSD. The following page provides information necessary for setting up bhyve with UEFI boot loader support:  
> [https://wiki.freebsd.org/bhyve/UEFI](https://wiki.freebsd.org/bhyve/UEFI)  
>  Features have been added to vmrun.sh to make it easier to setup the UEFI boot loader, but the following is required to install the UEFI firmware pkg:
>
>
>
> `# pkg install -y uefi-edk2-bhyve`
>
>
>
> With graphical support, you can use a vnc client like tigervnc, which can be installed with the following command:
>
>
>
> `# pkg install -y tigervnc`
>
>
>
> In the case of most corporate or government environments, the Linux of choice is RHEL, or CentOS. Utilizing bhyve, you can test and install CentOS in a bhyve VM the same way you would deploy a Linux VM in production. The first step is to download the CentOS iso (for this tutorial I used the CentOS minimal ISO): [http://isoredirect.centos.org/centos/7/isos/x86\_64/CentOS-7-x86\_64-Minimal-1708.iso](http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1708.iso)
>
>
>
> I normally use a ZFS Volume (zvol) when running bhyve VMs. Run the following commands to create a zvol (ensure you have enough disk space to perform these operations):
>
>
>
> `# zfs create -V20G -o volmode=dev zroot/centos0`
>
>

* (zroot in this case is the zpool I am using)

>
>
> Similar to my previous post about vmrun.sh, you need certain items to be configured on FreeBSD in order to use bhyve. The following commands are necessary to get things running:
>
>
>
> ```
> # echo "vfs.zfs.vol.mode=2" >> /boot/loader.conf
> # kldload vmm
> # ifconfig tap0 create
> # sysctl net.link.tap.up_on_open=1
> net.link.tap.up_on_open: 0 -> 1
> # ifconfig bridge0 create
> # ifconfig bridge0 addm em0 addm tap0
> # ifconfig bridge0 up
>
> ```
>
>

* (replace em0 with whatever your physical interface is).

>
>
> There are a number of utilities that can be used to manage bhyve VMs, and I am sure there is a way to use vmrun.sh to run Linux VMs, but since all of the HowTos for running Linux use the bhyve command line, the following script is what I use for running CentOS with bhyve.
>
>
>
> ```
> #!/bin/sh
> #
> # General bhyve install/run script for CentOS
> # Based on scripts from pr1ntf and lattera
>
> HOST="127.0.0.1"
> PORT="5901"
> ISO="/tmp/centos.iso"
> VMNAME="centos"
> ZVOL="centos0"
> SERIAL="nmda0A"
> TAP="tap1"
> CPU="1"
> RAM="1024M"
> HEIGHT="800"
> WIDTH="600"
>
> if [ "$1" == "install" ];
> then
>
> #Kill it before starting it
> bhyvectl --destroy --vm=$VMNAME
>
> bhyve -c $CPU -m $RAM -H -P -A \
> -s 0,hostbridge \
> -s 2,virtio-net,$TAP \
> -s 3,ahci-cd,$ISO \
> -s 4,virtio-blk,/dev/zvol/zroot/$ZVOL \
> -s 29,fbuf,tcp=$HOST:$PORT,w=$WIDTH,h=$HEIGHT \
> -s 30,xhci,tablet \
> -s 31,lpc -l com1,/dev/$SERIAL \
> -l bootrom,/usr/local/share/uefi-firmware/BHYVE_UEFI.fd \
> $VMNAME
>
> #kill it after
> bhyvectl --destroy --vm=$VMNAME
>
> elif [ "$1" == "run" ];
> then
>
> #Kill it before starting it
> bhyvectl --destroy --vm=centos
>
> bhyve -c $CPU -m $RAM -w -H \
> -s 0,hostbridge \
> -s 2,virtio-net,$TAP \
> -s 4,virtio-blk,/dev/zvol/zroot/$ZVOL \
> -s 29,fbuf,tcp=$HOST:$PORT,w=$WIDTH,h=$HEIGHT \
> -s 30,xhci,tablet \
> -s 31,lpc -l com1,/dev/$SERIAL \
> -l bootrom,/usr/local/share/uefi-firmware/BHYVE_UEFI.fd \
> $VMNAME &
>
> else
> echo "Please type install or run";
> fi
>
> ```
>
>
>
> The variables at the top of the script can be adjusted to fit your own needs. With the addition of the graphics output protocol in UEFI (or UEFI-GOP), a VNC console is launched and hosted with the HOST and PORT setting. There is a password option available for the VNC service, but the connection should be treated as insecure. It is advised to only listen on localhost with the VNC console and tunnel into the host of the bhyve VM. Now with the ISO copied to /tmp/centos.iso, and the script saved as centos.sh you can run the following command to start the install:
>
>
>
> `# ./centos.sh install`
>
>
>
> At this point, using vncviewer (on the local machine, or over an SSH tunnel), you should be able to bring up the console and run the CentOS installer as normal. The absolutely most critical item is to resolve an issue with the booting of UEFI after the installation has completed. Because of the path used in bhyve, you need to run the following to be able to boot CentOS after the installation:
>
>

`# cp -f /mnt/sysimage/boot/efi/EFI/centos/grubx64.efi /mnt/sysimage/boot/efi/EFI/BOOT`

>
>
> With this setting changed, the same script can be used to launch your CentOS VM as needed:
>
>

`# ./centos.sh run`

>
>
> If you are interested in a better solution for managing your Linux VM, take a look at the various bhyve management ports in the FreeBSD ports tree.
>
>

---

Interview - newnix architect - [@newnix](https://bsd.network/@newnix)
----------

News Roundup
----------

### [GhostBSD 11.1 - FreeBSD for the desktop](https://distrowatch.com/weekly.php?issue=20180108#ghostbsd) ###

>
>
> GhostBSD is a desktop oriented operating system which is based on FreeBSD. The project takes the FreeBSD operating system and adds a desktop environment, some popular applications, a graphical package manager and Linux binary compatibility. GhostBSD is available in two flavours, MATE and Xfce, and is currently available for 64-bit x86 computers exclusively. I downloaded the MATE edition which is available as a 2.3GB ISO file.
>
>

* Installing

>
>
> GhostBSD's system installer is a graphical application which begins by asking us for our preferred language, which we can select from a list. We can then select our keyboard's layout and our time zone. When it comes to partitioning we have three main options: let GhostBSD take over the entire disk using UFS as the file system, create a custom UFS layout or take over the entire disk using ZFS as the file system. UFS is a classic file system and quite popular, it is more or less FreeBSD's equivalent to Linux's ext4. ZFS is a more advanced file system with snapshots, multi-disk volumes and optional deduplication of data. I decided to try the ZFS option.
>
>
>
> Once I selected ZFS I didn't have many more options to go through. I was given the chance to set the size of my swap space and choose whether to set up ZFS as a plain volume, with a mirrored disk for backup or in a RAID arrangement with multiple disks. I stayed with the plain, single disk arrangement. We are then asked to create a password for the root account and create a username and password for a regular user account. The installer lets us pick our account's shell with the default being fish, which seemed unusual. Other shells, including bash, csh, tcsh, ksh and zsh are available. The installer goes to work copying files and offers to reboot our computer when it is done.
>
>

* Early impressions

>
>
> The newly installed copy of GhostBSD boots to a graphical login screen where we can sign into the account we created during the install process. Signing into our account loads the MATE 1.18 desktop environment. I found MATE to be responsive and applications were quick to open. Early on I noticed odd window behaviour where windows would continue to slide around after I moved them with the mouse, as if the windows were skidding on ice. Turning off compositing in the MATE settings panel corrected this behaviour. I also found the desktop's default font (Montserrat Alternates) to be hard on my eyes as the font is thin and, for lack of a better term, bubbly. Fonts can be easily adjusted in the settings panel.
>
>
>
> A few minutes after I signed into my account, a notification appeared in the system tray letting me know software updates were available. Clicking the update icon brings up a small window showing us a list of package updates and, if any are available, updates to the base operating system. FreeBSD, and therefore GhostBSD, both separate the core operating system from the applications (packages) which run on the operating system. This means we can update the core of the system separately from the applications. GhostBSD's core remains relatively static and minimal while applications are updated using a semi-rolling schedule.
>
>
>
> When we are updating the core operating system, the update manager will give us the option of rebooting the system to finish the process. We can dismiss this prompt to continue working, but the wording of the prompt may be confusing. When asked if we want to reboot to continue the update process, the options presented to us are "Continue" or "Restart". The Continue option closes the update manager and returns us to the MATE desktop.
>
>
>
> The update manager worked well for me and the only issue I ran into was when I dismissed the update manager and then wanted to install updates later. There are two launchers for the update manager, one in MATE's System menu and one in the settings panel. Clicking either of these launchers didn't accomplish anything. Running the update manager from the command line simply caused the process to lock up until killed. I found if I had dismissed the update manager once, I'd have to wait until I logged in again to use it. Alternatively, I could use a command line tool or use the OctoPkg package manager to install package updates.
>
>

* Conclusions

>
>
> Most of my time with GhostBSD, I was impressed and happy with the operating system. GhostBSD builds on a solid, stable FreeBSD core. We benefit from FreeBSD's performance and its large collection of open source software packages. The MATE desktop was very responsive in my trial and the system is relatively light on memory, even when run on ZFS which has a reputation for taking up more memory than other file systems.
>
>

---

### [FreeBSD Looks At Making Wayland Support Available By Default](https://www.phoronix.com/scan.php?page=news_item&px=FreeBSD-Wayland-Availability) ###

>
>
> There's an active discussion this week about making Wayland support available by default on FreeBSD.
>
>
>
> FreeBSD has working Wayland support -- well, assuming you have working Intel / Radeon graphics -- and do have Weston and some other Wayland components available via FreeBSD Ports. FreeBSD has offered working Wayland support that is "quite usable" for more than one year. But, it's not too easy to get going with Wayland on FreeBSD.
>
>
>
> Right now those FreeBSD desktop users wanting to use/develop with Wayland currently need to rebuild the GTK3 tool-kit, Mesa, and other packages with Wayland support enabled. This call for action now is about allowing the wayland=on to be made the default.
>
>
>
> This move would then allow these dependencies to be built with Wayland support by default, but for the foreseeable future FreeBSD will continue defaulting to X.Org-based sessions.
>
>
>
> The FreeBSD developers mostly acknowledge that Wayland is the future and the cost of enabling Wayland support by default is just slightly larger packages, but that weight is still leaner than the size of the X.Org code-base and its dependencies.
>
>

* [FreeBSD vote thread](https://lists.freebsd.org/pipermail/freebsd-ports/2017-December/111906.html)
* [TrueOS Fliped the switch already](https://github.com/trueos/trueos-core/commit/f48dba9d4e8cefc45d6f72336e7a0b5f42a2f6f1)

---

### [fork is not my favorite syscall](https://sircmpwn.github.io/2018/01/02/The-case-against-fork.html) ###

>
>
> This article has been on my to-write list for a while now. In my opinion, fork is one of the most questionable design choices of Unix. I dont understand the circumstances that led to its creation, and I grieve over the legacy rationale that keeps it alive to this day.
>
>
>
> Lets set the scene. Its 1971 and youre a fly on the wall in Bell Labs, watching the first edition of Unix being designed for the PDP-11/20. This machine has a 16-bit address space with no more than 248 kilobytes of memory. Theyre discussing how theyre going to support programs that spawn new programs, and someone has a brilliant idea. What if we copied the entire address space of the program into a new process running from the same spot, then let them overwrite themselves with the new program? This got a rousing laugh out of everyone present, then they moved on to a better design which would become immortalized in the most popular and influential operating system of all time.
>
>
>
> At least, thats the story Id like to have been told. In actual fact, the laughter becomes consensus. Theres an obvious problem with this approach: every time you want to execute a new program, the entire process space is copied and promptly discarded when the new program begins. Usually when I complain about fork, this the point when its supporters play the virtual memory card, pointing out that modern operating systems dont actually have to copy the whole address space. Well get to that, but first  First Edition Unix does copy the whole process space, so this excuse wouldnt have held up at the time. By Fourth Edition Unix (the next one for which kernel sources survived), they had wisened up a bit, and started only copying segments when they faulted.
>
>
>
> This model leads to a number of problems. One is that the new process inherits all of the parents process descriptors, so you have to close them all before you exec another process. However, unless youre manually keeping tabs on your open file descriptors, there is no way to know what file handles you must close! The hack that solves this is CLOEXEC, the first of many hacks that deal with forks poor design choices. This file descriptors problem balloons a bit - consider for example if you want to set up a pipe. You have to establish a piped pair of file descriptors in the parent, then close every fd but the pipe in the child, then dup2 the pipe file descriptor over the (now recently closed) file descriptor 1. By this point youve probably had to do several non-trivial operations and utilize a handful of variables from the parent process space, which hopefully were on the stack so that we dont end up copying segments into the new process space anyway.
>
>
>
> These problems, however, pale in comparison to my number one complaint with the fork model. Fork is the direct cause of the stupidest component Ive ever heard of in an operating system: the out-of-memory (aka OOM) killer. Say you have a process which is using half of the physical memory on your system, and wants to spawn a tiny program. Since fork copies the entire process, you might be inclined to think that this would make fork fail. But, on Linux and many other operating systems since, it does not fail! They agree that its stupid to copy the entire process just to exec something else, but because fork is Important for Backwards Compatibility, they just fake it and reuse the same memory map (except read-only), then trap the faults and actually copy later. The hope is that the child will get on with it and exec before this happens.
>
>
>
> However, nothing prevents the child from doing something other than exec - its free to use the memory space however it desires! This approach now leads to memory overcommittment - Linux has promised memory it does not have. As a result, when it really does run out of physical memory, Linux will just kill off processes until it has some memory back. Linux makes an awfully big fuss about never breaking userspace for a kernel that will lie about memory it doesnt have, then kill programs that try to use the back-alley memory they were given. That this nearly 50 year old crappy design choice has come to this astonishes me.
>
>
>
> Alas, I cannot rant forever without discussing the alternatives. There are better process models that have been developed since Unix!
>
>
>
> The first attempt I know of is BSDs vfork syscall, which is, in a nutshell, the same as fork but with severe limitations on what you do in the child process (i.e. nothing other than calling exec straight away). There are loads of problems with vfork. It only handles the most basic of use cases: you cannot set up a pipe, cannot set up a pty, and cant even close open file descriptors you inherited from the parent. Also, you couldnt really be sure of what variables you were and werent editing or allowed to edit, considering the limitations of the C specification. Overall this syscall ended up being pretty useless.
>
>
>
> Another model is posix\_spawn, which is a hell of an interface. Its far too complicated for me to detail here, and in my opinion far too complicated to ever consider using in practice. Even if it could be understood by mortals, its a really bad implementation of the spawn paradigm  it basically operates like fork backwards, and inherits many of the same flaws. You still have to deal with children inheriting your file descriptors, for example, only now you do it in the parent process. Its also straight-up impossible to make a genuine pipe with posix\_spawn. (Note: a reader corrected me - this is indeed possible via posix\_spawn\_file\_actions\_adddup2.)
>
>
>
> Lets talk about the good models - rfork and spawn (at least, if spawn is done right). rfork originated from plan9 and is a beautiful little coconut of a syscall, much like the rest of plan9. They also implement fork, but its a special case of rfork. plan9 does not distinguish between processes and threads - all threads are processes and vice versa. However, new processes in plan9 are not the everything-must-go fuckfest of your typical fork call. Instead, you specify exactly what the child should get from you. You can choose to include (or not include) your memory space, file descriptors, environment, or a number of other things specific to plan9. Theres a cool flag that makes it so you dont have to reap the process, too, which is nice because reaping children is another really stupid idea. It still has some problems, mainly around creating pipes without tremendous file descriptor fuckery, but its basically as good as the fork model gets. Note: Linux offers this via the clone syscall now, but everyone just fork+execs anyway.
>
>
>
> The other model is the spawn model, which I prefer. This is the approach I took in my own kernel for KnightOS, and I think its also used in NT (Microsofts kernel). I dont really know much about NT, but I can tell you how it works in KnightOS. Basically, when you create a new process, it is kept in limbo until the parent consents to begin. You are given a handle with which you can configure the process - you can change its environment, load it up with file descriptors to your liking, and so on. When youre ready for it to begin, you give the go-ahead and its off to the races. The spawn model has none of the flaws of fork.
>
>
>
> Both fork and exec can be useful at times, but spawning is much better for 90% of their use-cases. If I were to write a new kernel today, Id probably take a leaf from plan9s book and find a happy medium between rfork and spawn, so you could use spawn to start new threads in your process space as well. To the brave OS designers of the future, ready to shrug off the weight of legacy: please reconsider fork.
>
>
> ---
>

### [Enable ld.lld as bootstrap linker by default on amd64](https://svnweb.freebsd.org/changeset/base/327783) ###

* Enable ld.lld as bootstrap linker by default on amd64

>
>
> For some time we have been planning to migrate to LLVM's lld linker.  
>  Having a man page was the last blocking issue for using ld.lld to link  
>  the base system kernel + userland, now addressed by r327770. Link the  
>  kernel and userland libraries and binaries with ld.lld by default, for  
>  additional test coverage.
>
>
>
> This has been a long time in the making. On 2013-04-13 I submitted an  
>  upstream tracking issue in LLVM PR 23214: [META] Using LLD as FreeBSD's  
>  system linker. Since then 85 individual issues were identified, and  
>  submitted as dependencies. These have been addressed along with two  
>  and a half years of other lld development and improvement.
>
>
>
> I'd like to express deep gratitude to upstream lld developers Rui  
>  Ueyama, Rafael Espindola, George Rimar and Davide Italiano. They put in  
>  substantial effort in addressing the issues we found affecting  
>  FreeBSD/amd64.
>
>
>
> To revert to using ld.bfd as the bootstrap linker, in /etc/src.conf set
>
>
>
> WITHOUT\_LLD\_BOOTSTRAP=yes
>
>
>
> If you need to set this, please follow up with a PR or post to the  
>  freebsd-toolchain mailing list explaining how default WITH\_LLD\_BOOTSTRAP  
>  failed for your use case.
>
>
>
> Note that GNU ld.bfd is still installed as /usr/bin/ld, and will still  
>  be used for linking ports. ld.lld can be installed as /usr/bin/ld by  
>  setting in /etc/src.conf
>
>
>
> ```
> WITH_LLD_IS_LLD=yes
>
> ```
>
>
>
> A followup commit will set WITH\_LLD\_IS\_LD by default, possibly after  
>  Clang/LLVM/lld 6.0 is merged to FreeBSD.
>
>
>
> Release notes: Yes  
>  Sponsored by: The FreeBSD Foundation
>
>

* Followup: [https://www.mail-archive.com/svn-src-all@freebsd.org/msg155493.html](https://www.mail-archive.com/svn-src-all@freebsd.org/msg155493.html) \*\*\*

Beastie Bits
----------

* [BSDCAN2017 Interview with Peter Hessler, Reyk Floeter, and Henning Brauer](https://undeadly.org/cgi?action=article;sid=20171229080944)
* [video](https://www.youtube.com/watch?v=e-Xim3_rJns)
* [DSBMD](https://freeshell.de/~mk/projects/dsbmd.html)
* [ccc34 talk - May contain DTraces of FreeBSD](https://media.ccc.de/v/34c3-9196-may_contain_dtraces_of_freebsd)
* [scripts to run an OpenBSD mirror, rsync and verify])([https://github.com/bluhm/mirror-openbsd](https://github.com/bluhm/mirror-openbsd))
* [Old School PC Fonts](https://int10h.org/oldschool-pc-fonts/readme/)

---

Feedback/Questions
----------

* David - [Approach and Tools for Snapshots and Remote Replication](http://dpaste.com/33HKKEM#wrap)
* Brian - [Help getting my FreeBSD systems talking across the city](http://dpaste.com/3QWFEYR#wrap)
* Malcolm - [First BSD Meetup in Stockholm happened and it was great](http://dpaste.com/1Z9Y8H1)
* Brad - [Update on TrueOS system](http://dpaste.com/3EC9RGG#wrap) \*\*\*