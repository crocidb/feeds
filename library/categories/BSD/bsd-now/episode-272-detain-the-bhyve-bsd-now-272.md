+++
title = "Episode 272: Detain the bhyve | BSD Now 272"
description = '''Byproducts of reading OpenBSD’s netcat code, learnings from porting your own projects to FreeBSD, OpenBSD’s unveil(), NetBSD’s Virtual Machine Monitor, what 'dependency' means in Unix init systems, jailing bhyve, and more.  \Headlines   \[The byproducts of reading OpenBSD ne'''
date = "2018-11-15T18:00:00Z"
url = "https://www.bsdnow.tv/272"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.689815797Z"
seen = false
+++

Byproducts of reading OpenBSD’s netcat code, learnings from porting your own projects to FreeBSD, OpenBSD’s unveil(), NetBSD’s Virtual Machine Monitor, what 'dependency' means in Unix init systems, jailing bhyve, and more.  

\##Headlines  
 \###[The byproducts of reading OpenBSD netcat code](https://nanxiao.me/en/the-byproducts-of-reading-openbsd-netcat-code/)

>
>
> When I took part in a training last year, I heard about netcat for the first time. During that class, the tutor showed some hacks and tricks of using netcat which appealed to me and motivated me to learn the guts of it. Fortunately, in the past 2 months, I was not so busy that I can spend my spare time to dive into OpenBSD‘s netcat source code, and got abundant byproducts during this process.  
>  (1) Brush up socket programming. I wrote my first network application more than 10 years ago, and always think the socket APIs are marvelous. Just \~10 functions (socket, bind, listen, accept…) with some IO multiplexing buddies (select, poll, epoll…) connect the whole world, wonderful! From that time, I developed a habit that is when touching a new programming language, network programming is an essential exercise. Even though I don’t write socket related code now, reading netcat socket code indeed refresh my knowledge and teach me new stuff.  
>  (2) Write a tutorial about netcat. I am mediocre programmer and will forget things when I don’t use it for a long time. So I just take notes of what I think is useful. IMHO, this “tutorial” doesn’t really mean teach others something, but just a journal which I can refer when I need in the future.  
>  (3) Submit patches to netcat. During reading code, I also found bugs and some enhancements. Though trivial contributions to OpenBSD, I am still happy and enjoy it.  
>  (4) Implement a C++ encapsulation of libtls. OpenBSD‘s netcat supports tls/ssl connection, but it needs you take full care of resource management (memory, socket, etc), otherwise a small mistake can lead to resource leak which is fatal for long-live applications (In fact, the two bugs I reported to OpenBSD are all related resource leak). Therefore I develop a simple C++ library which wraps the libtls and hope it can free developer from this troublesome problem and put more energy in application logic part.  
>  Long story to short, reading classical source code is a rewarding process, and you can consider to try it yourself.
>
>

---

\###[What I learned from porting my projects to FreeBSD](https://github.com/shlomif/what-i-learned-from-porting-to-freebsd#what-i-learned-from-porting-my-projects-to-freebsd)

* Introduction

>
>
> I set up a local FreeBSD VirtualBox VM to test something, and it seems to work very well. Due to the novelty factor, I decided to get my software projects to build and pass the tests there.
>
>

* The Projects

* [](https://github.com/shlomif/shlomif-computer-settings/)[https://github.com/shlomif/shlomif-computer-settings/](https://github.com/shlomif/shlomif-computer-settings/) (my dotfiles).

* [](https://web-cpan.shlomifish.org/latemp/)[https://web-cpan.shlomifish.org/latemp/](https://web-cpan.shlomifish.org/latemp/)

* [](https://fc-solve.shlomifish.org/)[https://fc-solve.shlomifish.org/](https://fc-solve.shlomifish.org/)

* [](https://www.shlomifish.org/open-source/projects/black-hole-solitaire-solver/)[https://www.shlomifish.org/open-source/projects/black-hole-solitaire-solver/](https://www.shlomifish.org/open-source/projects/black-hole-solitaire-solver/)

* [](https://better-scm.shlomifish.org/source/)[https://better-scm.shlomifish.org/source/](https://better-scm.shlomifish.org/source/)

* [](http://perl-begin.org/source/)[http://perl-begin.org/source/](http://perl-begin.org/source/)

* [](https://www.shlomifish.org/meta/site-source/)[https://www.shlomifish.org/meta/site-source/](https://www.shlomifish.org/meta/site-source/)

* Written using a mix of C, Perl 5, Python, Ruby, GNU Bash, XML, CMake, XSLT, XHTML5, XHTML1.1, Website META Language, JavaScript and more.

* Work fine on several Linux distributions and have [](https://en.wikipedia.org/wiki/Travis_CI)[https://en.wikipedia.org/wiki/Travis\_CI](https://en.wikipedia.org/wiki/Travis_CI) using Ubuntu 14.04 hosts

* Some pass builds and tests on AppVeyor/Win64

* What I Learned:

* FreeBSD on VBox has become very reliable

* Some executables on FreeBSD are in /usr/local/bin instead of /usr/bin

* make on FreeBSD is not GNU make

* m4 on FreeBSD is not compatible with GNU m4

* Some CPAN Modules fail to install using local-lib there

* DocBook/XSL Does Not Live Under /usr/share/sgml

* FreeBSD’s grep does not have a “-P” flag by default

* FreeBSD has no “nproc” command

* Conclusion:

* It is easier to port a shell than a shell script. — Larry Wall

* I ran into some cases where my scriptology was lacking and suboptimal, even for my own personal use, and fixed them.

---

\##News Roundup  
 \###[OpenBSD’s unveil()](https://lwn.net/Articles/767137/)

>
>
> One of the key aspects of hardening the user-space side of an operating system is to provide mechanisms for restricting which parts of the filesystem hierarchy a given process can access. Linux has a number of mechanisms of varying capability and complexity for this purpose, but other kernels have taken a different approach. Over the last few months, OpenBSD has inaugurated a new system call named unveil() for this type of hardening that differs significantly from the mechanisms found in Linux.  
>  The value of restricting access to the filesystem, from a security point of view, is fairly obvious. A compromised process cannot exfiltrate data that it cannot read, and it cannot corrupt files that it cannot write. Preventing unwanted access is, of course, the purpose of the permissions bits attached to every file, but permissions fall short in an important way: just because a particular user has access to a given file does not necessarily imply that every program run by that user should also have access to that file. There is no reason why your PDF viewer should be able to read your SSH keys, for example. Relying on just the permission bits makes it easy for a compromised process to access files that have nothing to do with that process’s actual job.  
>  In a Linux system, there are many ways of trying to restrict that access; that is one of the purposes behind the Linux security module (LSM) architecture, for example. The SELinux LSM uses a complex matrix of labels and roles to make access-control decisions. The AppArmor LSM, instead, uses a relatively simple table of permissible pathnames associated with each application; that approach was highly controversial when AppArmor was first merged, and is still looked down upon by some security developers. Mount namespaces can be used to create a special view of the filesystem hierarchy for a set of processes, rendering much of that hierarchy invisible and, thus, inaccessible. The seccomp mechanism can be used to make decisions on attempts by a process to access files, but that approach is complex and error-prone. Yet another approach can be seen in the Qubes OS distribution, which runs applications in virtual machines to strictly control what they can access.  
>  Compared to many of the options found in Linux, unveil() is an exercise in simplicity. This system call, introduced in July, has this prototype:
>
>

`int unveil(const char *path, const char *permissions);`

>
>
> A process that has never called unveil() has full access to the filesystem hierarchy, modulo the usual file permissions and any restrictions that may have been applied by calling pledge(). Calling unveil() for the first time will “drop a veil” across the entire filesystem, rendering the whole thing invisible to the process, with one exception: the file or directory hierarchy starting at path will be accessible with the given permissions. The permissions string can contain any of “r” for read access, “w” for write, “x” for execute, and “c” for the ability to create or remove the path.  
>  Subsequent calls to unveil() will make other parts of the filesystem hierarchy accessible; the unveil() system call itself still has access to the entire hierarchy, so there is no problem with unveiling distinct subtrees that are, until the call is made, invisible to the process. If one unveil() call applies to a subtree of a hierarchy unveiled by another call, the permissions associated with the more specific call apply.  
>  Calling unveil() with both arguments as null will block any further calls, setting the current view of the filesystem in stone. Calls to unveil() can also be blocked using pledge(). Either way, once the view of the filesystem has been set up appropriately, it is possible to lock it so that the process cannot expand its access in the future should it be taken over and turn hostile.  
>  unveil() thus looks a bit like AppArmor, in that it is a path-based mechanism for restricting access to files. In either case, one must first study the program in question to gain a solid understanding of which files it needs to access before closing things down, or the program is likely to break. One significant difference (beyond the other sorts of behavior that AppArmor can control) is that AppArmor’s permissions are stored in an external policy file, while unveil() calls are made by the application itself. That approach keeps the access rules tightly tied to the application and easy for the developers to modify, but it also makes it harder for system administrators to change them without having to rebuild the application from source.  
>  One can certainly aim a number of criticisms at unveil() — all of the complaints that have been leveled at path-based access control and more. But the simplicity of unveil() brings a certain kind of utility, as can be seen in the large number of OpenBSD applications that are being modified to use it. OpenBSD is gaining a base level of protection against unintended program behavior; while it is arguably possible to protect a Linux system to a much greater extent, the complexity of the mechanisms involved keeps that from happening in a lot of real-world deployments. There is a certain kind of virtue to simplicity in security mechanisms.
>
>

---

\###[NetBSD Virtual Machine Monitor (NVVM)](http://m00nbsd.net/4e0798b7f2620c965d0dd9d6a7a2f296.html)

* NetBSD Virtual Machine Monitor

>
>
> The NVMM driver provides hardware-accelerated virtualization support on NetBSD. It is made of an \~MI frontend, to which MD backends can be plugged. A virtualization API is provided in libnvmm, that allows to easily create and manage virtual machines via NVMM. Two additional components are shipped as demonstrators, toyvirt and smallkern: the former is a toy virtualizer, that executes in a VM the 64bit ELF binary given as argument, the latter is an example of such binary.
>
>

* Download

>
>
> The source code of NVMM, plus the associated tools, can be downloaded here.
>
>

* Technical details

>
>
> NVMM can support up to 128 virtual machines, each having a maximum of 256 VCPUs and 4GB of RAM.  
>  Each virtual machine is granted access to most of the CPU registers: the GPRs (obviously), the Segment Registers, the Control Registers, the Debug Registers, the FPU (x87 and SSE), and several MSRs.  
>  Events can be injected in the virtual machines, to emulate device interrupts. A delay mechanism is used, and allows VMM software to schedule the interrupt right when the VCPU can receive it. NMIs can be injected as well, and use a similar mechanism.  
>  The host must always be x86\_64, but the guest has no constraint on the mode, so it can be x86\_32, PAE, real mode, and so on.  
>  The TSC of each VCPU is always re-based on the host CPU it is executing on, and is therefore guaranteed to increase regardless of the host CPU. However, it may not increase monotonically, because it is not possible to fully hide the host effects on the guest during #VMEXITs.  
>  When there are more VCPUs than the host TLB can deal with, NVMM uses a shared ASID, and flushes the shared-ASID VCPUs on each VM switch.  
>  The different intercepts are configured in such a way that they cover everything that needs to be emulated. In particular, the LAPIC can be emulated by VMM software, by intercepting reads/writes to the LAPIC page in memory, and monitoring changes to CR8 in the exit state.
>
>

---

\###[What ‘dependency’ means in Unix init systems is underspecified (utoronto.ca)](https://utcc.utoronto.ca/~cks/space/blog/sysadmin/InitDependencyUnclear)

>
>
> I was reading Davin McCall’s On the vagaries of init systems (via) when I ran across the following, about the relationship between various daemons (services, etc):  
>  I do not see any compelling reason for having ordering relationships without actual dependency, as both Nosh and Systemd provide for. In comparison, Dinit’s dependencies also imply an ordering, which obviates the need to list a dependency twice in the service description.  
>  Well, this may be an easy one but it depends on what an init system means by ‘dependency’. Let’s consider ®syslog and the SSH daemon. I want the syslog daemon to be started before the SSH daemon is started, so that the SSH daemon can log things to it from the beginning. However, I very much do not want the SSH daemon to not be started (or to be shut down) if the syslog daemon fails to start or later fails. If syslog fails, I still want the SSH daemon to be there so that I can perhaps SSH in to the machine and fix the problem.  
>  This is generally true of almost all daemons; I want them to start after syslog, so that they can syslog things, but I almost never want them to not be running if syslog failed. (And if for some reason syslog is not configured to start, I want enabling and starting, say, SSH, to also enable and start the syslog daemon.)  
>  In general, there are three different relationships between services that I tend to encounter:
>
>

* a hard requirement, where service B is useless or dangerous without service A. For instance, many NFS v2 and NFS v3 daemons basically don’t function without the RPC portmapper alive and active. On any number of systems, firewall rules being in place are a hard requirement to start most network services; you would rather your network services not start at all than that they start without your defenses in place.

* a want, where service B wants service A to be running before B starts up, and service A should be started even if it wouldn’t otherwise be, but the failure of A still leaves B functional. Many daemons want the syslog daemon to be started before they start but will run without it, and often you want them to do so so that at least some of the system works even if there is, say, a corrupt syslog configuration file that causes the daemon to error out on start. (But some environments want to hard-fail if they can’t collect security related logging information, so they might make rsyslogd a requirement instead of a want.)

* an ordering, where if service A is going to be started, B wants to start after it (or before it), but B isn’t otherwise calling for A to be started. We have some of these in our systems, where we need NFS mounts done before cron starts and runs people’s @reboot jobs but neither cron nor NFS mounts exactly or explicitly want each other. (The system as a whole wants both, but that’s a different thing.)

>
>
> Given these different relationships and the implications for what the init system should do in different situations, talking about ‘dependency’ in it systems is kind of underspecified. What sort of dependency? What happens if one service doesn’t start or fails later?  
>  My impression is that generally people pick a want relationship as the default meaning for init system ‘dependency’. Usually this is fine; most services aren’t actively dangerous if one of their declared dependencies fails to start, and it’s generally harmless on any particular system to force a want instead of an ordering relationship because you’re going to be starting everything anyway.
>
>

* (In my example, you might as well say that cron on the systems in question wants NFS mounts. There is no difference in practice; we already always want to do NFS mounts and start cron.)

---

\###[Jailing The bhyve Hypervisor](https://github.com/lattera/articles/blob/master/freebsd/2018-10-27_jailed_bhyve/article.md)

>
>
> As FreeBSD nears the final 12.0-RELEASE release engineering cycles, I’d like to take a moment to document a cool new feature coming in 12: jailed bhyve.  
>  You may notice that I use HardenedBSD instead of FreeBSD in this article. There is no functional difference in bhyve on HardenedBSD versus bhyve on FreeBSD. The only difference between HardenedBSD and FreeBSD is the aditional security offered by HardenedBSD.  
>  The steps I outline here work for both FreeBSD and HardenedBSD. These are the bare minimum steps, no extra work needed for either FreeBSD or HardenedBSD.
>
>

* A Gentle History Lesson

>
>
> At work in my spare time, I’m helping develop a malware lab. Due to the nature of the beast, we would like to use bhyve on HardenedBSD. Starting with HardenedBSD 12, non-Cross-DSO CFI, SafeStack, Capsicum, ASLR, and strict W<sup>X</sup> are all applied to bhyve, making it an extremely hardened hypervisor.  
>  So, the work to support jailed bhyve is sponsored by both HardenedBSD and my employer. We’ve also jointly worked on other bhyve hardening features, like protecting the VM’s address space using guard pages (mmap(…, MAP\_GUARD, …)). Further work is being done in a project called “malhyve.” Only those modifications to bhyve/malhyve that make sense to upstream will be upstreamed.
>
>

* Initial Setup

>
>
> We will not go through the process of creating the jail’s filesystem. That process is documented in the FreeBSD Handbook. For UEFI guests, you will need to install the uefi-edk2-bhyve package inside the jail.  
>  I network these jails with traditional jail networking. I have tested vnet jails with this setup, and that works fine, too. However, there is no real need to hook the jail up to any network so long as bhyve can access the tap device. In some cases, the VM might not need networking, in which case you can use a network-less VM in a network-less jail.  
>  By default, access to the kernel side of bhyve is disabled within jails. We need to set allow.vmm in our jail.conf entry for the bhyve jail.
>
>

* We will use the following in our jail, so we will need to set up devfs(8) rules for them:

* A ZFS volume

* A null-modem device (nmdm(4))

* UEFI GOP (no devfs rule, but IP assigned to the jail)

* A tap device

* Conclusion

>
>
> The bhyve hypervisor works great within a jail. When combined with HardenedBSD, bhyve is extremely hardened:
>
>

* PaX ASLR is fully applied due to compilation as a Position-Independent Executable (HardenedBSD enhancement)
* PaX NOEXEC is fully applied (strict W<sup>X)</sup> (HardenedBSD enhancement)
* Non-Cross-DSO CFI is fully applied (HardenedBSD enhancement)
* Full RELRO (RELRO + BIND\_NOW) is fully applied (HardenedBSD enhancement)
* SafeStack is applied to the application (HardenedBSD enhancement)
* Jailed (FreeBSD feature written by HardenedBSD)
* Virtual memory protected with guard pages (FreeBSD feature written by HardenedBSD)
* Capsicum is fully applied (FreeBSD feature)

>
>
> Bad guys are going to have a hard time breaking out of the userland components of bhyve on HardenedBSD. :)
>
>

---

\##Beastie Bits

* [GhostBSD 18.10 has been released](https://www.ghostbsd.org/18.10_release_announcement)
* [Project Trident RC3 has been released](http://project-trident.org/post/2018-11-10_rc3-available/)
* [The OpenBSD Foundation receives the first Silver contribution from a single individual](https://undeadly.org/cgi?action=article;sid=20181022130631)
* [Monitoring pf logs gource](http://www.echothrust.com/blogs/monitoring-pf-logs-gource)
* [NetBSD on the RISC-V is alive](https://twitter.com/zmcgrew/status/1055682596812730368)
* [The X hole](https://marc.info/?l=openbsd-tech&m=154050351216908&w=2)
* [Announcing the pkgsrc-2018Q3 release (2018-10-05)](http://mail-index.netbsd.org/pkgsrc-users/2018/10/05/msg027525.html)
* [NAT performance on EdgeRouter X and Lite with EdgeOS, OpenBSD, and OpenWRT](https://an.undulating.space/post/180927-er_alternate_firmware_benchmarks/)
* [UNIX (as we know it) might not have existed without Mrs. Thompson](https://www.princeton.edu/~hos/mike/transcripts/thompson.htm)
* [Free Pizza for your dev events](https://www.freepizza.io/)
* [Portland BSD Pizza Night: Nov 29th 7pm](https://calagator.org/events/1250474530)

---

\##Feedback/Questions

* Dennis - [Core developers leaving illumOS?](http://dpaste.com/36JB7EC#wrap)
* Ben - [Jumping from snapshot to snapshot](http://dpaste.com/1R36Z32#wrap)
* Ias - [Question about ZFS snapshots](http://dpaste.com/1CC86MX)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [](mailto:feedback@bsdnow.tv)[feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---