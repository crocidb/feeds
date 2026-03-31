+++
title = "Episode 239: The Return To ptrace | BSD Now 239"
description = "OpenBSD firewalling Windows 10, NetBSD’s return to ptrace, TCP Alternative Backoff, the BSD Poetic license, and AsiaBSDcon 2018 videos available.RSS Feeds: MP3 Feed | [iTunes Feed](https://itunes.apple.com/us/podcast/bsd-now-mp3"
date = "2018-03-29T15:00:00Z"
url = "https://www.bsdnow.tv/239"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.773009393Z"
seen = true
+++

OpenBSD firewalling Windows 10, NetBSD’s return to ptrace, TCP Alternative Backoff, the BSD Poetic license, and AsiaBSDcon 2018 videos available.

### RSS Feeds: ###

[MP3 Feed](http://feeds.feedburner.com/BsdNowMp3) **|** [iTunes Feed](https://itunes.apple.com/us/podcast/bsd-now-mp3/id701045710?mt=2) **|** [HD Vid Feed](http://feeds.feedburner.com/BsdNowHd) **|** [HD Torrent Feed](http://bitlove.org/jupiterbroadcasting/bsdnowhd/feed)

### [Become a supporter on Patreon](http://www.patreon.com/jupitersignal): ###

[![Patreon](http://i.imgur.com/2ioAf3Q.png)](http://www.patreon.com/jupitersignal)

### - Show Notes: - ###

Headlines
----------

### [Preventing Windows 10 and untrusted software from having full access to the internet using OpenBSD](https://www.ibm.com/developerworks/community/blogs/karsten/entry/Preventing_Windows_10_and_untrusted_software_from_having_full_access_to_the_internet?lang=en) ###

>
>
> Whilst setting up one of my development laptops to port some software to Windows I noticed Windows 10 doing crazy things like installing or updating apps and games by default after initial setup. The one I noticed in particular was Candy Crush Soda Saga which for those who don't know of it is some cheesy little puzzle game originally for consumer devices. I honestly did not want software like this near to a development machine. It has also been reported that Windows 10 now also updates core system software without notifying the user. Surely this destroys any vaguely deterministic behaviour, in my opinion making Windows 10 by default almost useless for development testbeds.
>
>
>
> Deciding instead to start from scratch but this time to set the inbuilt Windows Firewall to be very restrictive and only allow a few select programs to communicate. In this case all I really needed to be online was Firefox, Subversion and Putty. To my amusement (and astonishment) I found out that the Windows firewall could be modified to give access very easily by programs during installation (usually because this task needs to be done with admin privileges). It also seems that Windows store Apps can change the windows firewall settings at any point. One way to get around this issue could be to install a 3rd party firewall that most software will not have knowledge about and thus not attempt to break through. However the only decent firewall I have used was Sygate Pro which unfortunately is no longer supported by recent operating systems. The last supported versions was 2003, XP and 2000. In short, I avoid 3rd party firewalls.
>
>
>
> Instead I decided to trap Windows 10 (and all of it's rogue updaters) behind a virtual machine running OpenBSD. This effectively provided me with a full blown firewall appliance. From here I could then allow specific software I trusted through the firewall (via a proxy) in a safe, controlled and deterministic manner. For other interested developers (and security conscious users) and for my own reference, I have listed the steps taken here:
>
>

* 1) First and foremost disable the Windows DHCP service - this is so no IP can be obtained on any interface. This effectively stops any communication with any network on the host system. This can be done by running services.msc with admin privileges and stopping and disabling the service called DHCP Client.

* 2) Install or enable your favorite virtualization software - I have tested this with both VirtualBox and Hyper-V. Note that on non-server versions of Windows, in order to get Hyper-V working, your processor also needs to support SLAT which is daft so to avoid faffing about, I recommend using VirtualBox to get round this seemingly arbitrary restriction.

* 3) Install OpenBSD on the VM - Note, if you decide to use Hyper-V, its hardware support isn't 100% perfect to run OpenBSD and you will need to disable a couple of things in the kernel. At the initial boot prompt, run the following commands.

` config -e -o /bsd /bsd disable acpi disable mpbios `

* 4) Add a host only virtual adapter to the VM - This is the one which we are going to connect through the VM with. Look at the IP that VirtualBox assigns this in network manager on the host machine. Mine was [b]192.168.56.1[/b]. Set up the adapter in the OpenBSD VM to have a static address on the same subnet. For example [b]192.168.56.2[/b]. If you are using Hyper-V and OpenBSD, make sure you add a "Legacy Interface" because no guest additions are available. Then set up a virtual switch which is host only.

* 5) Add a bridged adapter to the VM - then assign it to whichever interface you wanted to connect to the external network with. Note that if using Wireless, set the bridged adapters MAC address to the same as your physical device or the access point will reject it. This is not needed (or possible) on Hyper-V because the actual device is "shared" rather than bridged so the same MAC address is used. Again, if you use Hyper-V, then add another virtual switch and attach it to your chosen external interface. VMs in Hyper-V "share" an adapter within a virtual switch and there is the option to also disable the hosts ability to use this interface at the same time which is fine for an additional level of security if those pesky rogue apps and updaters can also enable / disable DHCP service one day which wouldn't be too surprising.

* 6) Connect to your network in the host OS - In case of Wireless, select the correct network from the list and type in a password if needed. Windows will probably say "no internet available", it also does not assign an IP address which is fine.

* 7) Install the Squid proxy package on the OpenBSD guest and enable the daemon

```

#### pkg\_add squid ####

#### echo 'squid\_flags=""' \>\> /etc/rc.conf.local ####

#### /etc/rc.d/squid start ####

```

>
>
> We will use this service for a limited selection of "safe and trusted" programs to connect to the outside world from within the Windows 10 host. You can also use putty on the host to connect to the VM via SSH and create a SOCKS proxy which software like Firefox can also use to connect externally.
>
>

* 8) Configure the software you want to be able to access the external network with

  * Firefox - go to the connection settings and specify the VMs IP address for the proxy.
  * Subversion - modify the %HOME%\\AppData\\Roaming\\Subversion\\servers file and change the HTTP proxy field to the VMs IP. This is important to communicate with GitHub via https:// (Yes, GitHub also supports Subversion). For svn:// addresses you can use Putty to port forward.
  * Chromium/Chrome - unfortunately uses the global Windows proxy settings which defeats much of the purpose of this exercise if we were going to allow *all* of Windows access to the internet via the proxy. It would become mayhem again. However we can still use Putty to create a SOCKS proxy and then launch the browser with the following flags:

` --proxy-server="socks5://<VM IP>:<SOCKS PORT>" --host-resolver-rules="MAP * 0.0.0.0 , EXCLUDE <VM IP>" `

* 9) Congratulations, you are now done - Admittedly this process can be a bit fiddly to set up but it completely prevents Windows 10 from making a complete mess. This solution is probably also useful for those who like privacy or don't like the idea of their software "phoning home". Hope you find this useful and if you have any issues, please feel free to leave questions in the comments.

---

### [LLDB restoration and return to ptrace(2)](https://blog.netbsd.org/tnf/entry/lldb_restoration_and_return_to) ###

>
>
> I've managed to unbreak the LLDB debugger as much as possible with the current kernel and hit problems with ptrace(2) that are causing issues with further work on proper NetBSD support. Meanwhile, I've upstreamed all the planned NetBSD patches to sanitizers and helped other BSDs to gain better or initial support.
>
>

* LLDB

>
>
> Since the last time I worked on LLDB, we have introduced many changes to the kernel interfaces (most notably related to signals) that apparently fixed some bugs in Go and introduced regressions in ptrace(2). Part of the regressions were noted by the existing ATF tests. However, the breakage was only marked as a new problem to resolve. For completeness, the ptrace(2) code was also cleaned up by Christos Zoulas, and we fixed some bugs with compat32.
>
>
>
> I've fixed a crash in \*NetBSD::Factory::Launch(), triggered on startup of the lldb-server application.
>
>
>
> Here is the commit message:
>
>

``` We cannot call process\_up-\>SetState() inside the NativeProcessNetBSD::Factory::Launch function because it triggers a NULL pointer deference.

The generic code for launching a process in: GDBRemoteCommunicationServerLLGS::LaunchProcess sets the m*debugged*process*up pointer after a successful call to m*process*factory.Launch(). If we attempt to call process*up-\>SetState() inside a platform specific Launch function we end up dereferencing a NULL pointer in NativeProcessProtocol::GetCurrentThreadID().

Use the proper call process*up-\>SetState(,false) that sets notify*delegates to false. ```

* Sanitizers

>
>
> I suspended development of new features in sanitizers last month, but I was still in the process of upstreaming of local patches. This process was time-consuming as it required rebasing patches, adding dedicated tests, and addressing all other requests and comments from the upstream developers.
>
>
>
> I'm not counting hot fixes, as some changes were triggering build or test issues on !NetBSD hosts. Thankfully all these issues were addressed quickly. The final result is a reduction of local delta size of almost 1MB to less than 100KB (1205 lines of diff). The remaining patches are rescheduled for later, mostly because they depend on extra work with cross-OS tests and prior integration of sanitizers with the basesystem distribution. I didn't want to put extra work here in the current state of affairs and, I've registered as a mentor for Google Summer of Code for the NetBSD Foundation and prepared Software Quality improvement tasks in order to outsource part of the labour.
>
>

* Userland changes

>
>
> I've also improved documentation for some of the features of NetBSD, described in man-pages. These pieces of information were sometimes wrong or incomplete, and this makes covering the NetBSD system with features such as sanitizers harder as there is a mismatch between the actual code and the documented code.
>
>
>
> Some pieces of software also require better namespacing support, these days mostly for the POSIX standard. I've fixed few low-hanging fruits there and requested pullups to NetBSD-8(BETA).
>
>
>
> I thank the developers for improving the landed code in order to ship the best solutions for users.
>
>

* BSD collaboration in LLVM

>
>
> A One-man-show in human activity is usually less fun and productive than collaboration in a team. This is also true in software development. Last month I was helping as a reviewer to port LLVM features to FreeBSD and when possible to OpenBSD. This included MSan/FreeBSD, libFuzzer/FreeBSD, XRay/FreeBSD and UBSan/OpenBSD.
>
>
>
> I've landed most of the submitted and reviewed code to the mainstream LLVM tree.
>
>
>
> Part of the code also verified the correctness of NetBSD routes in the existing porting efforts and showed new options for improvement. This is the reason why I've landed preliminary XRay/NetBSD code and added missing NetBSD bits to ToolChain::getOSLibName(). The latter produced setup issues with the prebuilt LLVM toolchain, as the directory name with compiler-rt goodies were located in a path like ./lib/clang/7.0.0/lib/netbsd8.99.12 with a varying OS version. This could stop working after upgrades, so I've simplified it to "netbsd", similar to FreeBSD and Solaris.
>
>

* Prebuilt toolchain for testers

>
>
> I've prepared a build of Clang/LLVM with LLDB and compiler-rt features prebuilt on NetBSD/amd64 v. 8.99.12:
>
>

`llvm-clang-compilerrt-lldb-7.0.0beta_2018-02-28.tar.bz2`

* Plan for the next milestone

>
>
> With the approaching NetBSD 8.0 release I plan to finish backporting a few changes there from HEAD:
>
>

* Remove one unused feature from ptrace(2), PT*SET*SIGMASK & PT*GET*SIGMASK. I've originally introduced these operations with criu/rr-like software in mind, but they are misusing or even abusing ptrace(2) and are not regular process debuggers. I plan to remove this operation from HEAD and backport this to NetBSD-8(BETA), before the release, so no compat will be required for this call. Future ports of criu/rr should involve dedicated kernel support for such requirements. Finish the backport of *UC*MACHINE\_FP() to NetBSD-8. This will allow use of the same code in sanitizers in HEAD and NetBSD-8.0.
* By popular demand, improve the regnsub(3) and regasub(3) API, adding support for more or less substitutions than 10.

>
>
> Once done, I will return to ptrace(2) debugging and corrections.
>
>

---

**DigitalOcean**

### [Working with the NetBSD kernel](https://t.pagef.lt/working-with-the-netbsd-kernel/) ###

* Overview

>
>
> When working on complex systems, such as OS kernels, your attention span and cognitive energy are too valuable to be wasted on inefficiencies pertaining to ancillary tasks. After experimenting with different environmental setups for kernel debugging, some of which were awkward and distracting from my main objectives, I have arrived to my current workflow, which is described here. This approach is mainly oriented towards security research and the study of kernel internals.
>
>
>
> Before delving into the details, this is the general outline of my environment:
>
>
>
> My host system runs Linux. My target system is a QEMU guest.
>
>
>
> I’m tracing and debugging on my host system by attaching GDB (with NetBSD x86-64 ABI support) to QEMU’s built-in GDB server. I work with NetBSD-current. All sources are built on my host system with the cross-compilation toolchain produced by build.sh. I use NFS to share the source tree and the build artifacts between the target and the host. I find IDEs awkward, so for codebase navigation I mainly rely on vim, tmux and ctags. For non-intrusive instrumentation, such as figuring out control flow, I’m using dtrace.
>
>

* Preparing the host system

  * QEMU
  * GDB
  * NFS Exports

* Building NetBSD-current

* A word of warning

  * Now is a great time to familiarize yourself with the build.sh tool and its options. Be especially carefull with the following options:

` -r Remove contents of TOOLDIR and DESTDIR before building. -u Set MKUPDATE=yes; do not run "make clean" first. Without this, everything is rebuilt, including the tools. `

>
>
> Chance are, you do not want to use these options once you’ve successfully built the cross-compilation toolchain and your entire userland, because building those takes time and there aren’t many good reasons to recompile them from scratch. Here’s what to expect:
>
>
>
> On my desktop, running a quad-core Intel i5-3470 at 3.20GHz with 24GB of RAM and underlying directory structure residing on a SSD drive, the entire process took about 55 minutes. I was running make with -j12, so the machine was quite busy. On an old Dell D630 laptop, running Intel Core 2 Duo T7500 at 2.20GHz with 4GB of RAM and a slow hard drive (5400RPM), the process took approximatelly 2.5 hours. I was running make with -j4. Based on the temperature alerts and CPU clock throttling messages, it was quite a struggle.
>
>

* Acquiring the sources
* Compiling the sources

  * Preparing the guest system

* Provisioning your guest
* Pkgin and NFS shares
* Tailoring the kernel for debugging
* Installing the new kernel
* Configuring DTrace
* Debugging the guest’s kernel

---

News Roundup
----------

### [Add support for the experimental Internet-Draft "TCP Alternative Backoff”](https://svnweb.freebsd.org/base?view=revision&revision=331214) ###

``` Add support for the experimental Internet-Draft "TCP Alternative Backoff with ECN (ABE)" proposal to the New Reno congestion control algorithm module. ABE reduces the amount of congestion window reduction in response to ECN-signalled congestion relative to the loss-inferred congestion response.

More details about ABE can be found in the Internet-Draft: https://tools.ietf.org/html/draft-ietf-tcpm-alternativebackoff-ecn

The implementation introduces four new sysctls:

* net.inet.tcp.cc.abe defaults to 0 (disabled) and can be set to non-zero to enable ABE for ECN-enabled TCP connections.

* net.inet.tcp.cc.newreno.beta and net.inet.tcp.cc.newreno.beta*ecn set the multiplicative window decrease factor, specified as a percentage, applied to the congestion window in response to a loss-based or ECN-based congestion signal respectively. They default to the values specified in the draft i.e. beta=50 and beta*ecn=80.

* net.inet.tcp.cc.abe\_frlossreduce defaults to 0 (disabled) and can be set to non-zero to enable the use of standard beta (50% by default) when repairing loss during an ECN-signalled congestion recovery episode. It enables a more conservative congestion response and is provided for the purposes of experimentation as a result of some discussion at IETF 100 in Singapore.

The values of beta and beta*ecn can also be set per-connection by way of the TCP*CCALGOOPT TCP-level socket option and the new CC*NEWRENO*BETA or CC*NEWRENO*BETA\_ECN CC algo sub-options.

Submitted by: Tom Jones [tj@enoti.me](mailto:tj@enoti.me) Tested by: Tom Jones [tj@enoti.me](mailto:tj@enoti.me), Grenville Armitage [garmitage@swin.edu.au](mailto:garmitage@swin.edu.au) Relnotes: Yes Differential Revision: https://reviews.freebsd.org/D11616 ```

---

### [Meltdown-mitigation syspatch/errata now available](https://undeadly.org/cgi?action=article;sid=20180228225937) ###

>
>
> The recent changes in -current mitigating the Meltdown vulnerability have been backported to the 6.1 and 6.2 (amd64) releases, and the syspatch update (for 6.2) is now available.
>
>

* [6.1](https://marc.info/?l=openbsd-cvs&m=151964860620856&w=2)

``` Changes by: bluhm@cvs.openbsd.org 2018/02/26 05:36:18 Log message: Implement a workaround against the Meltdown flaw in Intel CPUs. The following changes have been backported from OpenBSD -current.

Changes by: guenther@cvs.openbsd.org 2018/01/06 15:03:13 Log message: Handle %gs like %[def]s and reset set it in cpu\_switchto() instead of on every return to userspace.

Changes by: mlarkin@cvs.openbsd.org 2018/01/06 18:08:20 Log message: Add identcpu.c and specialreg.h definitions for the new Intel/AMD MSRs that should help mitigate spectre. This is just the detection piece, these features are not yet used. Part of a larger ongoing effort to mitigate meltdown/spectre. i386 will come later; it needs some machdep.c cleanup first.

Changes by: mlarkin@cvs.openbsd.org 2018/01/07 12:56:19 Log message: remove all PG\_G global page mappings from the kernel when running on Intel CPUs. Part of an ongoing set of commits to mitigate the Intel "meltdown" CVE. This diff does not confer any immunity to that vulnerability - subsequent commits are still needed and are being worked on presently. ok guenther, deraadt

Changes by: mlarkin@cvs.openbsd.org 2018/01/12 01:21:30 Log message: IBRS -\> IBRS,IBPB in identifycpu lines

Changes by: guenther@cvs.openbsd.org 2018/02/21 12:24:15 Log message: Meltdown: implement user/kernel page table separation. On Intel CPUs which speculate past user/supervisor page permission checks, use a separate page table for userspace with only the minimum of kernel code and data required for the transitions to/from the kernel (still marked as supervisor-only, of course): - the IDT (RO) - three pages of kernel text in the .kutext section for interrupt, trap, and syscall trampoline code (RX) - one page of kernel data in the .kudata section for TLB flush IPIs (RW) - the lapic page (RW, uncachable) - per CPU: one page for the TSS+GDT (RO) and one page for trampoline stacks (RW) When a syscall, trap, or interrupt takes a CPU from userspace to kernel the trampoline code switches page tables, switches stacks to the thread's real kernel stack, then copies over the necessary bits from the trampoline stack. On return to userspace the opposite occurs: recreate the iretq frame on the trampoline stack, switch stack, switch page tables, and return to userspace. mlarkin@ implemented the pmap bits and did 90% of the debugging, diagnosing issues on MP in particular, and drove the final push to completion. Many rounds of testing by naddy@, sthen@, and others Thanks to Alex Wilson from Joyent for early discussions about trampolines and their data requirements. Per-CPU page layout mostly inspired by DragonFlyBSD. ok mlarkin@ deraadt@

Changes by: bluhm@cvs.openbsd.org 2018/02/22 13:18:59 Log message: The GNU assembler does not understand 1ULL, so replace the constant with 1. Then it compiles with gcc, sign and size do not matter here.

Changes by: bluhm@cvs.openbsd.org 2018/02/22 13:27:14 Log message: The compile time assertion for cpu info did not work with gcc. Rephrase the condition in a way that both gcc and clang accept it.

Changes by: guenther@cvs.openbsd.org 2018/02/22 13:36:40 Log message: Set the PG\_G (global) bit on the special page table entries that are shared between the u-k and u+k tables, because they're actually in *all* tables.

OpenBSD 6.1 errata 037 ```

* 6.2

``` Changes by: bluhm@cvs.openbsd.org 2018/02/26 05:29:48 Log message: Implement a workaround against the Meltdown flaw in Intel CPUs. The following changes have been backported from OpenBSD -current.

Changes by: guenther@cvs.openbsd.org 2018/01/06 15:03:13 Log message: Handle %gs like %[def]s and reset set it in cpu\_switchto() instead of on every return to userspace.

Changes by: mlarkin@cvs.openbsd.org 2018/01/06 18:08:20 Log message: Add identcpu.c and specialreg.h definitions for the new Intel/AMD MSRs that should help mitigate spectre. This is just the detection piece, these features are not yet used. Part of a larger ongoing effort to mitigate meltdown/spectre. i386 will come later; it needs some machdep.c cleanup first.

Changes by: mlarkin@cvs.openbsd.org 2018/01/07 12:56:19 Log message: remove all PG\_G global page mappings from the kernel when running on Intel CPUs. Part of an ongoing set of commits to mitigate the Intel "meltdown" CVE. This diff does not confer any immunity to that vulnerability - subsequent commits are still needed and are being worked on presently.

Changes by: mlarkin@cvs.openbsd.org 2018/01/12 01:21:30 Log message: IBRS -\> IBRS,IBPB in identifycpu lines

Changes by: guenther@cvs.openbsd.org 2018/02/21 12:24:15 Log message: Meltdown: implement user/kernel page table separation. On Intel CPUs which speculate past user/supervisor page permission checks, use a separate page table for userspace with only the minimum of kernel code and data required for the transitions to/from the kernel (still marked as supervisor-only, of course): - the IDT (RO) - three pages of kernel text in the .kutext section for interrupt, trap, and syscall trampoline code (RX) - one page of kernel data in the .kudata section for TLB flush IPIs (RW) - the lapic page (RW, uncachable) - per CPU: one page for the TSS+GDT (RO) and one page for trampoline stacks (RW) When a syscall, trap, or interrupt takes a CPU from userspace to kernel the trampoline code switches page tables, switches stacks to the thread's real kernel stack, then copies over the necessary bits from the trampoline stack. On return to userspace the opposite occurs: recreate the iretq frame on the trampoline stack, switch stack, switch page tables, and return to userspace. mlarkin@ implemented the pmap bits and did 90% of the debugging, diagnosing issues on MP in particular, and drove the final push to completion. Many rounds of testing by naddy@, sthen@, and others Thanks to Alex Wilson from Joyent for early discussions about trampolines and their data requirements. Per-CPU page layout mostly inspired by DragonFlyBSD.

Changes by: bluhm@cvs.openbsd.org 2018/02/22 13:18:59 Log message: The GNU assembler does not understand 1ULL, so replace the constant with 1. Then it compiles with gcc, sign and size do not matter here.

Changes by: bluhm@cvs.openbsd.org 2018/02/22 13:27:14 Log message: The compile time assertion for cpu info did not work with gcc. Rephrase the condition in a way that both gcc and clang accept it.

Changes by: guenther@cvs.openbsd.org 2018/02/22 13:36:40 Log message: Set the PG\_G (global) bit on the special page table entries that are shared between the u-k and u+k tables, because they're actually in *all* tables.

OpenBSD 6.2 errata 009 ```

* [syspatch](https://man.openbsd.org/syspatch)

---

**iXsystems**

### [a2k18 Hackathon Report: Ken Westerback on dhclient and more](https://undeadly.org/cgi?action=article;sid=20180302002131) ###

>
>
> Ken Westerback (krw@) has sent in the first report from the (recently concluded) a2k18 hackathon:
>
>

* [YYZ -\> YVR -\> MEL -\> ZQN -\> CHC -\> DUD -\> WLG -\> AKL -\> SYD -\> BNE -\> YVR -\> YYZ](http://www.gcmap.com/mapui?P=YYZ-YVR-MEL-ZQN-CHC-DUD,DUD-WLG-AKL-SYD-BNE-YVR-YYZ)

* For those of you who don’t speak Airport code:

* Toronto -\> Vancouver -\> Melbourne -\> Queenstown -\> Christchurch -\> Dunedin
* Then: Dunedin -\> Wellington -\> Auckland -\> Sydney -\> Brisbane -\> Vancouver -\> Toronto

```

Whew.

Once in Dunedin the hacking commenced. The background was a regular tick of new meltdown diffs to test in addition to whatever work one was actually engaged in. I was lucky (?) in that none of the problems with the various versions cropped up on my laptop. ```

``` I worked with rpe@ and tb@ to make the install script create the 'correct' FQDN when dhclient was involved. I worked with tb@ on some code cleanup in various bits of the base. dhclient(8) got some nice cleanup, further pruning/improving log messages in particular. In addition the oddball -q option was flipped into the more normal -v. I.e. be quiet by default and verbose on request.

More substantially the use of recorded leases was made less intrusive by avoiding continual reconfiguration of the interface with the same information. The 'request', 'require' and 'ignore' dhclient.conf(5) statement were changed so they are cumulative, making it easier to build longer lists of affected options.

I tweaked softraid(4) to remove a handrolled version of duid\_format().

I sprinkled a couple of M\_WAITOK into amd64 and i386 mpbios to document that there is really no need to check for NULL being returned from some malloc() calls.

I continued to help test the new filesystem quiescing logic that deraadt@ committed during the hackathon.

I only locked myself out of my room once!

Fueled by the excellent coffee from local institutions The Good Earth Cafe and The Good Oil Cafe, and the excellent hacking facilities and accommodations at the University of Otago it was another enjoyable and productive hackathon south of the equator. And I even saw penguins.

Thanks to Jim Cheetham and the support from the project and the OpenBSD Foundation that made it all possible ```

---

### [Poetic License](https://blog.gerv.net/2018/03/poetic-license/) ###

>
>
> I found this when going through old documents. It looks like I wrote it and never posted it. Perhaps I didn’t consider it finished at the time. But looking at it now, I think it’s good enough to share. It’s a redrafting of the BSD licence, in poetic form. Maybe I had plans to do other licences one day; I can’t remember.
>
>
>
> I’ve interleaved it with the original license text so you can see how true, or otherwise, I’ve been to it. Enjoy :-)
>
>

``` Copyright (c) ,  All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: ```

>
>
> You may redistribute and use – as source or binary, as you choose, and with some changes or without – this software; let there be no doubt. But you must meet conditions three, if in compliance you wish to be.
>
>

` 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. 3. Neither the name of the nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. `

>
>
> The first is obvious, of course – To keep this text within the source. The second is for binaries Place in the docs a copy, please. A moral lesson from this ode – Don’t strip the copyright on code.
>
>
>
> The third applies when you promote: You must not take, from us who wrote, our names and make it seem as true we like or love your version too. (Unless, of course, you contact us And get our written assensus.)
>
>

` THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. `

>
>
> One final point to be laid out (You must forgive my need to shout): THERE IS NO WARRANTY FOR THIS WHATEVER THING MAY GO AMISS. EXPRESS, IMPLIED, IT’S ALL THE SAME – RESPONSIBILITY DISCLAIMED.
>
>
>
> WE ARE NOT LIABLE FOR LOSS NO MATTER HOW INCURRED THE COST THE TYPE OR STYLE OF DAMAGE DONE WHATE’ER THE LEGAL THEORY SPUN. THIS STILL REMAINS AS TRUE IF YOU INFORM US WHAT YOU PLAN TO DO.
>
>
>
> When all is told, we sum up thus – Do what you like, just don’t sue us.
>
>

---

---

Beastie Bits
----------

* [AsiaBSDCon 2018 Videos](https://www.youtube.com/playlist?list=PLnTFqpZk5ebDZwT-bmYcIwv76yhmTfl0l)
* [The January/February 2018 FreeBSD Journal is Here](https://www.freebsdfoundation.org/past-issues/storage/)
* [Announcing the pkgsrc-2017Q4 release (2018-01-04)](https://mail-index.netbsd.org/pkgsrc-users/2018/01/04/msg026073.html)
* [BSD Hamburg Event](https://www.bsdhh.org/bsdhh-de-index.html)
* [ZFS User conference](http://zfs.datto.com/)
* [Unreal Engine 4 Being Brought Natively To FreeBSD By Independent Developer](https://www.phoronix.com/scan.php?page=news_item&px=Unreal-Engine-4-FreeBSD)

---

Tarsnap ad

---

Feedback/Questions
----------

* Philippe - [I heart FreeBSD and other questions](http://dpaste.com/2643BF5#wrap)
* Cyrus - [BSD Now is excellent](http://dpaste.com/3NTH14J#wrap)
* Architect - [Combined Feedback](http://dpaste.com/317BP8X#wrap)
* Dale - [ZFS on Linux moving to ZFS on FreeBSD](http://dpaste.com/284G4TQ#wrap)
* Tommi - [New BUG in Finland](http://dpaste.com/1KGMRGM#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---