+++
title = "208: Faces of Open Source"
description = "DragonflyBSD 4.8.1 has been released, we explore how the X11 clipboard works, and look at OpenBSD gaming resources.This episode was brought to you byiXsystems - Enterprise Servers and Storage for Open Source[![Digital"
date = "2017-08-23T12:00:00Z"
url = "https://www.bsdnow.tv/208"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.861071716Z"
seen = false
+++

DragonflyBSD 4.8.1 has been released, we explore how the X11 clipboard works, and look at OpenBSD gaming resources.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [LLVM, Clang and compiler-rt support enhancements](https://blog.netbsd.org/tnf/entry/llvm_clang_and_compiler_rt) ###

>
>
> In the last month I started with upstream of the code for sanitizers: the common layer and ubsan. I worked also on the elimination of unexpected failures in LLVM and Clang. I've managed to achieve, with a pile of local patches, the number of 0 unexpected bugs within LLVM (check-llvm) and 3 unexpected bugs within Clang (check-clang) (however these ones were caused by hardcoded environment -lstdc++ vs -lc++). The number of failures in sanitizers (check-sanitizer) is also low, it's close to zero.
>
>

* LLVM

>
>
> In order to achieve the goals of testability concerning the LLVM projects, I had to prepare a new pkgsrc-wip package called llvm-all-in-one that contains 12 active LLVM projects within one tree. The set of these projects is composed of: llvm, clang, compiler-rt, libcxx, libcxxabi, libunwind, test-suite, openmp, llgo, lld, lldb, clang-tools-extra. These were required to build and execute test-suites in the LLVM's projects. Ideally the tests should work in standalone packages - built out-of-LLVM-sources - and with GCC/Clang, however the real life is less bright and this forced me to use Clang as the system compiler an all-in-one package in order to develop the work environment with the ability to build and execute unit tests.  
>  There were four threads within LLVM:
>
>

* Broken std::call\_once with libstdc++. This is an old and well-known bug, which was usually worked around with a homegrown implementation llvm::call\_once. I've discovered that the llvm::call\_once workaround isn't sufficient for the whole LLVM functionality, as std::call\_once can be called internally inside the libstdc++ libraries - like within the C++11 futures interface. This bug has been solved by Joerg Sonnenberger in the ELF dynamic linker.
* Unportable shell construct hardcoded in tests "\>&". This has been fixed upstream.
* LLVM JIT. The LLVM Memory generic allocator (or page mapper) was designed to freely map pages with any combination of the protection bits: R,W,X. This approach breaks on NetBSD with PaX MPROTECT and requires redesign of the interfaces. This is the continuation of the past month AllocateRWX and ReleaseRWX compatibility with NetBSD improvements. I've prepared few variations of local patches addressing these issues and it's still open for discussion with upstream. My personal preference is to remove the current API entirely and introduce a newer one with narrowed down functionality to swap between readable (R--), writable (RW-) and executable (R-X) memory pages. This would effectively enforce W<sup>X.</sup>
* Sanitizers support. Right now, I keep the patches locally in order to upstream the common sanitizer code in compiler-rt.

>
>
> The LLVM JIT API is the last cause of unexpected failures in check-llvm. This breaks MCJIT, ORCJIT and ExecutionEngine libraries and causes around 200 unexpected failures within tests.
>
>

* Clang

>
>
> I've upstreamed a patch that enables ubsan and asan on Clang's frontend for NetBSD/amd64. This support isn't complete, and requires sanitizers' support code upstreamed to compiler-rt.
>
>

* compiler-rt
  * The current compiler-rt tasks can be divided into:
  * upstream sanitizer common code shared with POSIX platforms
  * upstream sanitizer common code shared with Linux and FreeBSD
  * upstream sanitizer common code shared with FreeBSD
  * upstream sanitizer common code specific to NetBSD
  * build, execute and pass tests for sanitizer common code in check-santizer

>
>
> This means that ubsan, asan and the rest of the specific sanitizers wait in queue.  
>  All the mentioned tasks are being worked on simultaneously, with a soft goal to finish them one after another from the first to the last one.  
>  The last point with check-sanitizer unveiled so far two generic bugs on NetBSD:
>
>

* Return errno EFAULT instead of EACCES on memory fault with read(2)/write(2)-like syscalls.
* Honor PTHREAD\_DESTRUCTOR\_ITERATIONS in libpthread.

>
>
> These bugs are not strictly real bugs, but they were introducing needless differences with other modern POSIX systems. The fixes were introduced by Christos Zoulas and backported to NetBSD-8.
>
>

* Plan for the next milestone

>
>
> I have decided not to open new issues in with the coming month and focus on upstreaming the remaining LLVM code. The roadmap for the next month is to continue working on the goals of the previous months. std::call\_once is an example that every delayed bug keeps biting again and again in future.  
>  LLVM 5.0.0 is planned to be released this month (August) and there is a joint motivation with the upstream maintainer to push compatibility fixes for LLVM JIT. There is an option to submit a workaround now and introduce refactoring for the trunk and next version (6.0.0).
>
>

* This work was sponsored by The NetBSD Foundation.
* The NetBSD Foundation is a non-profit organization and welcomes any donations to help us continue funding projects and services to the open-source community. Please consider visiting the following URL, and chip in what you can: [http://netbsd.org/donations/#how-to-donate](http://netbsd.org/donations/#how-to-donate) \*\*\*

### [DragonFly BSD 4.8.1 released](http://lists.dragonflybsd.org/pipermail/commits/2017-August/626150.html) ###

\+Updates by dev:

* Antonio Huete Jimenez (1):
  * libc/gmon: Replace sbrk() with mmap()

* Francois Tigeot (3):
  * drm: bring in Linux compability changes from master
  * drm/linux: make flush\_work() more robust
  * drm/i915: Update to Linux 4.7.10

* Imre VadÃ¡sz (4):
  * drm - Fix hrtimer, don't reset timer-\>function to NULL in timeout handler.
  * sound - Delete devfs clone handler for /dev/dsp and /dev/mixer on unload.
  * if\_vtnet - Allocate struct vtnet\_tx\_header entries from a queue.
  * Make sure that cam(4)'s dashutdown handler runs before DEVICE\_SHUTDOWN().

* Matthew Dillon (24):
  * kernel - MFC b48dd28447fc (sigtramp workaround)
  * kernel - Fix deadlock in sound system
  * kernel - Fix broken wakeup in crypto code
  * kernel - Add KERN\_PROC\_SIGTRAMP
  * gcc - Adjust the unwind code to use the new sigtramp probe sysctl
  * kernel - Implement NX
  * kernel - Implement NX (2)
  * kernel - Implement machdep.pmap\_nx\_enable TUNABLE
  * kernel - Implement NX (3) - cleanup
  * kernel - Temporarily set the default machdep.pmap\_nx\_enable to 0
  * param - Change \_\_DragonFly\_version to 400801
  * kernel - Fix i915 deadlock
  * pthreads - Change PTHREAD\_STACK\_MIN
  * libc - Fix bug in rcmdsh()
  * ppp - Fix minor overflow in protocol search
  * libtelnet - Fix improper statement construction (not a bug in the binary)
  * libdevstat - Limit sscanf field, fix redundant condition
  * openssh - Fix a broken assignment
  * window - Fix Graphics capability enable test
  * kernel - Fix event preset
  * mfiutil - Fix static buffer overflow
  * mixer - Fix sscanf() overflow
  * gcore - fix overflow in sscanf
  * kernel - Fix improper parens

* Sascha Wildner (17):
  * libkvm: Fix char pointer dereference.
  * Fix some cases where an index was used before its limits check.
  * Really ensure that our world/kernel are built under POSIX locale ("C").
  * zoneinfo: Create a /usr/share/zoneinfo/UTC link.
  * kernel/cam: Add CAM\_SCSI\_IT\_NEXUS\_LOST (in preparation for virtio\_scsi(4)).
  * kernel: Add FreeBSD's virtio\_scsi(4) driver.
  * ccdconfig(8): Add missing free().
  * libpuffs: Fix two asserts.
  * kernel/acpi: Untangle the wakecode generation during buildkernel.
  * kernel/acpica: Better check AcpiOsPredefinedOverride()'s InitVal argument
  * kernel/acpica: ACPI\_THREAD\_ID is unsigned.
  * kernel/acpica: Return curthread as thread id from AcpiOsGetThreadId().
  * kernel/acpica: Remove no longer needed #include.
  * kernel/acpi: Call AcpiInitializeSubsystem() before AcpiInitializeTables().
  * kernel/urtwn: Add missing braces.
  * kernel/ieee80211: Add missing braces.
  * libthread\_xu: Fix checking of pthread\_barrier\_init()'s count argument.

* Sepherosa Ziehau (7):
  * sound/hda: Sync device ID table with FreeBSD
  * inet6: Restore mbuf hash after defragmentation.
  * pf: Normalized, i.e. defragged, packets requiring rehash.
  * em: Enable MSI by default on devices has PCI advanced features capability.
  * sched: Change CPU\_SETSIZE to signed int, same as FreeBSD/Linux.
  * usched: Allow process to change self cpu affinity
  * ix: Fixup TX/RX ring settings for X550, which supports 64/64 TX/RX rings.

* zrj (1):
  * Revert "Always use unix line endings" \*\*\*

### [Porting Unix to the 386: A Practical Approach](http://www.informatica.co.cr/unix-source-code/research/1991/0101.html) ###

>
>
> The University of California's Berkeley Software Distribution (BSD) has been the catalyst for much of the innovative work done with the UNIX operating system in both the research and commercial sectors. Encompassing over 150 Mbytes (and growing) of cutting-edge operating systems, networking, and applications software, BSD is a fully functional and nonproprietary complete operating systems software distribution (see Figure 1). In fact, every version of UNIX available from every vendor contains at least some Berkeley UNIX code, particularly in the areas of filesystems and networking technologies. However, unless one could pay the high cost of site licenses and equipment, access to this software was simply not within the means of most individual programmers and smaller research groups.  
>  The 386BSD project was established in the summer of 1989 for the specific purpose of porting BSD to the Intel 80386 microprocessor platform so that the tools this software offers can be made available to any programmer or research group with a 386 PC. In coordination with the Computer Systems Research Group (CSRG) at the University of California at Berkeley, we successively ported a basic research system to a common AT class machine (see, Figure 2), with the result that approximately 65 percent of all 32-bit systems could immediately make use of this new definition of UNIX. We have been refining and improving this base port ever since.  
>  By providing the base 386BSD port to CSRG, our hope is to foster new interest in Berkeley UNIX technology and to speed its acceptance and use worldwide. We hope to see those interested in this technology build on it in both commercial and noncommercial ventures.  
>  In this and following articles, we will examine the key aspects of software, strategy, and experience that encompassed a project of this magnitude. We intend to explore the process of the 386BSD port, while learning to effectively exploit features of the 386 architecture for use with an advanced operating system. We also intend to outline some of the tradeoffs in implementation goals which must be periodically reexamined. Finally, we will highlight extensions which remain for future work, perhaps to be done by some of you reading this article today. Note that we are assuming familiarity with UNIX, its concepts and structures, and the basic functions of the 386, so we will not present exhaustive coverage of these areas.  
>  In this installment, we discuss the beginning of our project and the initial framework that guided our efforts, in particular, the development of the 386BSD specification. Future articles will address specific topics of interest and actual nonproprietary code fragments used in 386BSD. Among the future areas to be covered are:
>
>

* 386BSD process context switching
* Executing the first 386BSD process on the PC
* 386BSD kernel interrupt and exception handling
* 386BSD INTERNET networking
* ISA device drivers and system support
* 386BSD bootstrap process \*\*\*

### [X11: How does “the” clipboard work](https://www.uninformativ.de/blog/postings/2017-04-02/0/POSTING-en.html) ###

* \> If you have used another operating system before you switched to something that runs X11, you will have noticed that there is more than one clipboard: \> Sometimes, you can use the mouse to select some text, switch to another window, and then hit the middle mouse button to paste text. \> Sometimes, you can select text, then hit some hotkey, e.g. Ctrl+C, switch to another window, hit another hotkey, e.g. Ctrl+V, and paste said text. \> Sometimes, you can do both.
* \> Selections as a form of IPC
* >
  >
  > First things first, in X11 land, “clipboards” are called “selections”.  
  >  Yes, there is more than one selection and they all work independently. In fact, you can use as many selections as you wish. In theory, that is. When using selections, you make different clients communicate with each other. This means that those clients have to agree on which selections to use. You can’t just invent your own selection and then expect Firefox to be compatible with it.
  >
  >

* >
  >
  > How are selections identified?
  >
  >

* >
  >
  > There are three “standard” selection names:  
  >  PRIMARY: The “middle mouse clipboard”  
  >  SECONDARY: Virtually unused these days  
  >  CLIPBOARD: The “Ctrl+C clipboard”
  >
  >

* >
  >
  > Program 1: Query selection owners
  >
  >

* >
  >
  > Content type and conversion
  >
  >

* >
  >
  > Program 2: Get clipboard as UTF-8
  >
  >

* >
  >
  > Program 3: Owning a selection
  >
  >

* >
  >
  > Program 4: Content type TARGETS
  >
  >

* >
  >
  > Handling binary data using xclip
  >
  >

* >
  >
  > Large amounts of data
  >
  >

* >
  >
  > Clipboard managers
  >
  >

* >
  >
  > Summary
  >
  >

---

News Roundup
----------

### [TrueOS Documentation: A great way to give back!](https://www.trueos.org/blog/trueos-documentation-great-way-give-back/) ###

>
>
> The TrueOS project is always looking for community contribution. Documentation changes are a great way for users to not only make a solid contribution to the project, but learn more about it too! Over the last few months, many users have asked for both simple and detailed instructions on making documentation changes. These are now added to the TrueOS handbook in the Contributing to TrueOS section.  
>  If interested in making a small alteration to the TrueOS handbook, here are some instructions for submitting a patch through the GitHub website. These instructions are also applicable to the Lumina and SysAdm handbooks. Lumina documentation is in the the lumina-docs repository, and SysAdm guides are in sysadm-docs.
>
>

* Make a Doc change!

>
>
> A GitHub account is required to submit patches to the TrueOS docs. Open a web browser and sign in to GitHub or make a new account. When making a new account, be sure to use an often checked email address, as all communication regarding patches and pull requests are sent to this address. Navigate to the trueos-docs GitHub repository. Click on the trueos-handbook directory to view all the documentation files. Open the .rst file corresponding to the chapter needing an update. The chapter names are reflected in the title of the .rst files. For example, open install.rst to fix an error spotted in handbook chapter 3: “Install”. This first image shows the trueos-docs repository and the contents of the trueos-handbook directory  
>  Open the desired chapter file by clicking its entry in the list. The trueos.rst file is an index file and should be ignored. Begin editing the file by clicking the Pencil icon in the upper right corner above the file’s text. The file moves to edit mode, where it is now possible to make changes, as the next image shows.
>
>

* Editing install.rst with GitHub

>
>
> When making a simple change, it is recommended to avoid adjusting the specific formatting elements and instead work within or around them. Once satisfied, scroll to the bottom of the page and write a detailed commit summary of the new changes. Click Propose file change (green button), then Create pull request to submit the changes to the project. GitHub then does an automated merge check. Click Create pull request again to submit the change to the repository. In the final step, a developer or project committer reviews the changes, merging them into the project or asking for more changes as necessary.
>
>

* Learn more about TrueOS documentation

>
>
> To learn more about the underlying structure of TrueOS documentation like the Sphinx Documentation Generator and reStructuredText markup, browse the Advanced Documentation Changes section of the TrueOS handbook. This section also contains instructions for forking the repository and configuring a local clone, build testing, updating the translation files, and other useful information. The Sphinx website is also a valuable resource.
>
>
> ---
>

### [libHijack Revival](https://www.soldierx.com/news/Hijack-Revival) ###

>
>
> Over a decade ago, while standing naked and vulnerable in the comfort of my steaming hot shower, I gathered my thoughts as humans typically attempt to do in the wee hours of the morning. Thoughts of a post-exploitation exercise raced in my mind, the same thoughts that made sleeping the night before difficult. If only I could inject into Apache some code that would allow me to hook into its parsing engine without requiring persistance. Putting a file-backed entry into /proc/pid/maps would tip off the security team to a compromise.  
>  The end-goal was to be able to send Apache a special string and have Apache perform a unique action based on the special string.  
>  FelineMenace's Binary Protection Schemes whitepaper provided inspiration. Silvio Cesare paved the way into PLT/GOT redirection attacks. Various Phrack articles selflessly contributed to the direction I was to head.  
>  Alas, in the aforementioned shower, an epiphany struck me. I jumped as an awkward stereotypical geek does: like an elaborate Elaine Benes dance rehearsal in the air. If I used PTrace, ELF, and the PLT/GOT to my advantage, I could cause the victim application to allocate anonymous memory mappings arbitrarily. In the newly-created memory mapping, I could inject arbitrary code. Since a typical operating system treats debuggers as God-like applications, the memory mapping could be mapped without write access, but as read and execute only. Thus enabling the stealth that I sought.  
>  The project took a few years to develop in my spare time. I ended up creating several iterations, taking a rough draft/Proof-of-Concept style code and rewriting it to be more efficient and effective.  
>  I had toyed with FreeBSD off-and-on for over a decade by this point, but by-and-large I was still mostly using Linux. FreeBSD gained DTrace and ZFS support, winning me over from the Linux camp. I ported libhijack to FreeBSD, giving it support for both Linux and FreeBSD simultaneously.  
>  In 2013, I started work on helping Oliver Pinter with his ASLR implementation, which was originally destined to be upstreamed to FreeBSD. It took a lot of work, and my interest in libhijack faded. As a natural consequence, I handed libhijack over to SoldierX, asking the community to take it and enhance it.  
>  Over four years went by without a single commit. The project was essentially abandoned. My little baby was dead.  
>  This past week, I wondered if libhijack could even compile on FreeBSD anymore. Given that four years have passed by and major changes have happened in those four years, I thought libhijack would need a major overhaul just to compile, let alone function. Imagine my surprise when libhijack needed only a few fixups to account for changes in FreeBSD's RTLD.  
>  Today, I'm announcing the revival of libhijack. No longer is it dead, but very much alive. In order to develop the project faster, I've decided to remove support for Linux, focusing instead on FreeBSD. I've removed hundreds of lines of code over the past few days. Supporting both FreeBSD and Linux meant some code had to be ugly. Now the beautification process has begun.  
>  I'm announcing the availability of libhijack 0.7.0 today. The ABI and API should be considered unstable as they may change without notice.  
>  Note that HardenedBSD fully mitigates libhijack from working with two security features: setting security.bsd.unprivileged\_proc\_debug to 0 by default and the implementation of PaX NOEXEC.  
>  The security.bsd.unprivileged\_proc\_debug sysctl node prevents PTrace access for applications the debugger itself did not fork+execve for unprivileged (non-root) users. Privileged users (the root account) can use PTrace to its fullest extent.  
>  HardenedBSD's implementation of PaX NOEXEC prevents the creation of memory mappings that are both writable and executable. It also prevents using mprotect to toggle between writable and executable. In libhijack's case, FreeBSD grants libhijack the ability to write to memory mappings that are not marked writable. Debuggers do this to set breakpoints. HardenedBSD behaves differently due to PaX NOEXEC.  
>  Each memory mapping has a notion of a maximum protection level. When a memory mapping is created, if the write bit is set, then HardenedBSD drops the execute bit from the maximum protection level. When the execute bit is set at memory mapping creation time, then the write bit is dropped from the maximum protection level. If both the write and execute bits are set, then the execute bit is silently dropped from both the mapping creation request and the maximum protection level.   
>  The maximum protection level is always obeyed, even for debuggers. Thus we see that PaX NOEXEC is 100% effective in preventing libhijack from injecting code into a process. Here is a screenshot showing PaX NOEXEC preventing libhijack from injecting shellcode into a newly-created memory mapping.
>
>

* What's next for libhijack? Here's what we have planned, in no particular order:
  * Python bindings
  * Port to arm64
  * This requires logic for handling machine-dependent code. High priority.
  * Finish anonymous shared object injection.
  * This requires implementing a custom RTLD from within libhijack.
  * More cleanups. Adhere to style(9).

* libhijack can be found on GitHub @ [https://github.com/SoldierX/libhijack](https://github.com/SoldierX/libhijack) \*\*\*

### [Contributing to FreeBSD](https://blather.michaelwlucas.com/archives/2988) ###

>
>
> I’ve talked to a whole bunch of folks who say things like “I’m a junior programmer. I’m looking for a way to help. I have no specific expertise, but I’m willing to learn.” Today, I present such junior programmers with an opportunity. An opportunity for you to learn skills that will be incredibly valuable to your career, and will simultaneously expand your career opportunities.  
>  For decades, FreeBSD has relied on its users for testing. They expect users to install pre-release versions of the OS and exercise them to identify regressions. That’s necessary, but it’s nowhere near enough.  
>  The FreeBSD Testing Project is building an automated test suite for the entire operating system. They have a whole mess of work to do. There’s only four people on the team, so each additional person that contributes can have a serious impact. They have tutorials on how to write tests, and sample tests.  
>  There’s a whole bunch of tests left to be written. You have an almost open field. They need tests for everything from ls(1) to bhyve. (Yes, ls(1) broke at one point in the last few years.) Everything needs testing. Learning to write, submit, and commit small tests is valuable experience for developing the big tests.  
>  What’s more, learning to write tests for a system means learning the system. Developing tests will transform you into a FreeBSD expert. Once you’ve demonstrated your competence, worth, and ability to work within the project, other FreeBSD teams will solicit your help and advice. The Project will suck you in.  
>  Testing is perhaps the most valuable contribution anyone can make to an open source project. And this door into the FreeBSD Project is standing wide, wide open.
>
>
> ---
>

### [OpenBSD Gaming Resource](https://mrsatterly.com/openbsd_games.html) ###

* \> What isn't there to love about playing video games on your favorite operating system? OpenBSD and video games feels like a natural combination to me. My resource has software lists, links to free games not in ports, lists of nonfree games, and recommendations.
* The Table of Contents has these high-level items for you:
* \> General Resources
* \> OpenBSD Exclusive
* \> Ports
* \> Network Clients
* \> Browser Games
* \> Game Engines
* \> Multiple Game Engines
* \> Multiple System Emulation
* \> Computer Emulation
* \> Game Console Emulation
* \> Live Media Emulation
* \> Operating System Emulation
* \> Games in Other Software
* Have fun with these games! \*\*\*

Beastie Bits
----------

* [Dragonfly introduces kcollect(8)](https://www.dragonflydigest.com/2017/08/07/20061.html)
* [The Faces of Open Source](http://facesofopensource.com/unix/)
* [Edgemesh CEO, Jake Loveless and Joyent CTO, Bryan Cantrill join together for a fireside chat to discuss distributed caching at scale, Docker, Node.js, Mystery Science Theater 3000, and more!](https://www.joyent.com/blog/joyent-edgemesh-cache-me-if-you-can)
* [UFS: Place the information needed to find alternate superblocks to the end of the area reserved for the boot block](https://svnweb.freebsd.org/base?view=revision&revision=322297)
* [Let ‘localhost’ be localhost](https://tools.ietf.org/html/draft-west-let-localhost-be-localhost-04)
* Hurry up and register for [vBSDCon September 7-9](http://www.verisign.com/en_US/internet-technology-news/verisign-events/vbsdcon/index.xhtml?dmn=vBSDcon.com) and [EuroBSDCon September 21-24](https://2017.eurobsdcon.org/) \*\*\*

Feedback/Questions
----------

* Morgan - [btrfs deprecated](http://dpaste.com/0JEYE1K)
* Ben - [UEFI, GELI, BEADM, and more](http://dpaste.com/2TP90HD)
* Brad - [Hostname Clarification](http://dpaste.com/1MQH1BD)
* M Rod - [BSD Laptop](http://dpaste.com/39C6PGN)
* Jeremy - [Contributing to BSDs](http://dpaste.com/3SVP5SF) \*\*\*