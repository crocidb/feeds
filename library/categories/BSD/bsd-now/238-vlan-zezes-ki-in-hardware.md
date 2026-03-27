+++
title = "238: VLAN-Zezes-ki in Hardware"
description = "Looking at Lumina Desktop 2.0, 2 months of KPTI development in SmartOS, OpenBSD email service, an interview with Ryan Zezeski, NomadBSD released, and John Carmack's programming retreat with OpenBSD.This episode was brought to you by[![iXsystems - Enterprise Servers and "
date = "2018-03-21T12:00:00Z"
url = "https://www.bsdnow.tv/238"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.775907251Z"
seen = false
+++

Looking at Lumina Desktop 2.0, 2 months of KPTI development in SmartOS, OpenBSD email service, an interview with Ryan Zezeski, NomadBSD released, and John Carmack's programming retreat with OpenBSD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Looking at Lumina Desktop 2.0](https://www.trueos.org/blog/looking-lumina-desktop-2-0/) ###

>
>
> A few weeks ago I sat down with Lead Developer Ken Moore of the TrueOS Project to get answers to some of the most frequently asked questions about Lumina Desktop from the open source community. Here is what he said on Lumina Desktop 2.0. Do you have a question for Ken and the rest of the team over at the TrueOS Project? Make sure to read the interview and comment below. We are glad to answer your questions!
>
>
>
> Ken: Lumina Desktop 2.0 is a significant overhaul compared to Lumina 1.x. Almost every single subsystem of the desktop has been streamlined, resulting in a nearly-total conversion in many important areas.
>
>
>
> With Lumina Desktop 2.0 we will finally achieve our long-term goal of turning Lumina into a complete, end-to-end management system for the graphical session and removing all the current runtime dependencies from Lumina 1.x (Fluxbox, xscreensaver, compton/xcompmgr). The functionality from those utilities is now provided by Lumina Desktop itself.
>
>
>
> Going along with the session management changes, we have compressed the entire desktop into a single, multi-threaded binary. This means that if any rogue script or tool starts trying to muck about with the memory used by the desktop (probably even more relevant now than when we started working on this), the entire desktop session will close/crash rather than allowing targeted application crashes to bypass the session security mechanisms. By the same token, this also prevents man-in-the-middle type of attacks because the desktop does not use any sort of external messaging system to communicate (looking at you `dbus`). This also gives a large performance boost to Lumina Desktop
>
>
>
> The entire system for how a users settings get saved and loaded has been completely redone, making it a layered settings system which allows the default settings (Lumina) to get transparently replaced by system settings (OS/Distributor/SysAdmin) which can get replaced by individual user settings. This results in the actual changes in the user setting files to be kept to a minimum and allows for a smooth transition between updates to the OS or Desktop. This also provides the ability to restrict a users desktop session (based on a system config file) to the default system settings and read-only user sessions for certain business applications.
>
>
>
> The entire graphical interface has been written in QML in order to fully-utilize hardware-based GPU acceleration with OpenGL while the backend logic and management systems are still written entirely in C++. This results in blazing fast performance on the backend systems (myriad multi-threaded C++ objects) as well as a smooth and responsive graphical interface with all the bells and whistles (drag and drop, compositing, shading, etc).
>
>

* Q: Are there future plans to implement something like Lumina in a MAC Jail?

>
>
> While I have never tried out Lumina in a MAC jail, I do not see anything on that page which should stop it from running in one right now. Lumina is already designed to be run as an unpriviledged user and is very smart about probing the system to find out what is/not available before showing anything to the user. The only thing that comes to mind is that you might need to open up some other system devices so that X11 itself can draw to the display (graphical environment setup is a bit different than CLI environment).
>
>

* Q: I look forward to these changes. I know the last time I used it when I would scroll I would get flashes like the refresh rate was not high enough. It will be nice to have a fast system as well as I know with the more changes Linux is becoming slower. Not once it has loaded but in the loading process. I will do another download when these changes come out and install again and maybe stay this time.

>
>
> If I recall correctly, one of the very first versions of Lumina (pre-1.0) would occasionally flicker. If that is still happening, you might want to verify that you are using the proper video driver for your hardware and/or enable the compositor within the Lumina settings.
>
>

* Q: Why was enlightenment project not considered for TrueOS? It is BSD licensed and is written in C.

>
>
> This was a common question about 4(?) years ago with the first release of the Lumina desktop and it basically boiled down to long-term support and reliability of the underlying toolkit. Some of the things we had to consider were: cross-platform/cross-architecture support, dependency reliability and support framework (Qt5 \> EFL), and runtime requirements and dependency tracking (Qt5 is lighter than the EFL). That plus the fact that the EFL specifically states that it is linux-focused and the BSDs are just an afterthought (especially at the time we were doing the evaluation).
>
>

* Q: I have two questions.
  * 1) The default layout of Unity(menu bar with actual menu entries on top and icon dock on the side) is one of the few things I liked about my first voyage into non-Windows systems, and have been missing since moving on to other distros(and now also other non-Linux systems). However in 1.4.0 screenshots on Luminas site, the OSX-like layout has the menu attached to the window. Will 2.0 be able to have the menus on the bar?
  * 2) Is there any timeline for a public release, or are you taking a when its ready approach?

>
>
> 1. In Lumina you can already put panels on the left/right side of the screen and give you something like the layout of the Unity desktop. The embedded menu system is not available in Lumina because that is not a specification supported by X11 and the window manager standards at the present time. The way that functionality is currently run on Linux is a hacky-bypass of the display system which only really works with the GTK3 and Qt5 toolkits, resulting in very odd overall desktop behavior in mixed environments where some apps use other graphical toolkits.
> 2. We are targetting the 18.06 STABLE release of TrueOS for Lumina 2, but that is just a guideline and if necessary we will push back the release date to allow for additional testing/fixing as needed.
>
>

---

### [A long two months](https://blog.cooperi.net/a-long-two-months) ###

* IllumOS/SmartOS developer Alex Wilson describes the journey of developing KPTI for IllumOS \> On Monday (January 1st) I had the day off work for New Year's day, as is usual in most of the western world, so I slept in late. Lou and her friend decided to go to the wax museum and see several tourist attractions around SF, and I decided to pass the day at home reading. That afternoon, work chat started talking about a Tumblr post by pythonsweetness about an Intel hardware security bug. At the time I definitely did not suspect that this was going to occupy most of my working life for the next (almost) two months.

>
>
> Like many people who work on system security, I had read Anders Fogh's post about a "Negative Result" in speculative execution research in July of 2017. At the time I thought it was an interesting writeup and I remember being glad that researchers were looking into this area. I sent the post to Bryan and asked him about his thoughts on it at the time, to which he replied saying that "it would be shocking if they left a way to directly leak out memory in the speculative execution". None of us seriously thought that there would be low-hanging fruit down that research path, but we also felt it was important that there was someone doing work in the area who was committed to public disclosure.
>
>
>
> At first, after reading the blog post on Monday, we thought (or hoped) that the bug might "just" be a KASLR bypass and wouldn't require a lot of urgency. We tried to reach out to Intel at work to get more information but were met with silence. (We wouldn't hear back from them until after the disclosure was already made public.) The speculation on Tuesday intensified, until finally on Wednesday morning I arrived at the office to find links to late Tuesday night tweets revealing exploits that allowed arbitrary kernel memory reads.
>
>
>
> Wednesday was not a happy day. Intel finally responded to our emails -- after they had already initiated public disclosure. We all spent a lot of time reading. An arbitrary kernel memory read (an info leak) is not that uncommon as far as bugs go, but for the most part they tend to be fairly easy to fix. The thing that makes the Meltdown and Spectre bugs particularly notable is that in order to mitigate them, a large amount of change is required in very deep low-level parts of the kernel. The kind of deep parts of the kernel where there are 20-year old errata workarounds that were single-line changes that you have to be very careful to not accidentally undo; the kind of parts where, as they say, mortals fear to tread.
>
>
>
> On Friday we saw the patches Matthew Dillon put together for DragonFlyBSD for the first time. These were the first patches for KPTI that were very straightforward to read and understand, and applied to a BSD-derived kernel that was similar to those I'm accustomed to working on.
>
>
>
> To mitigate Meltdown (and partially one of the Spectre variants), you have to make sure that speculative execution cannot reach any sensitive data from a user context. This basically means that the pages the kernel uses for anything potentially sensitive have to be unmapped when we are running user code. Traditionally, CPUs that were built to run a multi-user, UNIX-like OS did this by default (SPARC is an example of such a CPU which has completely separate address spaces for the kernel and userland). However, x86 descends from a single-address-space microcontroller that has grown up avoiding backwards-incompatible changes, and has never really introduced a clean notion of multiple address spaces (segmentation is the closest feature really, and it was thrown out for 64-bit AMD64). Instead, operating systems for x86 have generally wound up (at least in the post-AMD64 era) with flat address space models where the kernel text and data is always present in the page table no matter whether you're in user or kernel mode. The kernel mappings simply have the "supervisor" bit set on them so that user code can't directly access them.
>
>
>
> The mitigation is basically to stop doing this: to stop mapping the kernel text, data and other memory into the page table while we're running in userland. Unfortunately, the x86 design does not make this easy. In order to be able to take interrupts or traps, the CPU has to have a number of structures mapped in the current page table at all times. There is also no ability to tell an x86 CPU that you want it to switch page tables when an interrupt occurs. So, the code that we jump to when we take an interrupt, as well as space for a stack to push context onto have to be available in both page tables. And finally, of course, we need to be able to figure out somehow what the other page table we should switch to is when we enter the kernel.
>
>
>
> When we looked at the patches for Linux (and also the DragonFlyBSD patches at the time) on Friday and started asking questions, it became pretty evident that the initial work done by both was done under time constraints. Both had left the full kernel text mapped in both page tables, and the Linux trampoline design seemed over-complex. I started talking over some ideas with Robert Mustacchi about ways to fix these and who we should talk to, and reached out to some of my old workmates from the University of Queensland who were involved with OpenBSD. It seemed to me that the OpenBSD developers would care about these issues even more than we did, and would want to work out how to do the mitigation right.
>
>
>
> I ended up sending an email to Philip Guenther on Friday afternoon, and on Saturday morning I drove an hour or so to meet up with him for coffee to talk page tables and interrupt trampolines. We wound up spending a good 6 hours at the coffee shop, and I came back with several pages of notes and a half-decent idea of the shape of the work to come.
>
>
>
> One detail we missed that day was the interaction of per-CPU structures with per-process page tables. Much of the interrupt trampoline work is most easily done by using per-CPU structures in memory (and you definitely want a per-CPU stack!). If you combine that with per-process page tables, however, you have a problem: if you leave all the per-CPU areas mapped in all the processes, you will leak information (via Meltdown) about the state of one process to a different one when taking interrupts. In particular, you will leak things like %rip, which ruins all the work being done with PIE and ASLR pretty quickly. So, there are two options: you can either allocate the per-CPU structures per-process (so you end up with $NCPUS \* $NPROCS of them); or you can make the page tables per-CPU.
>
>
>
> OpenBSD, like Linux and the other implementations so far, decided to go down the road of per-CPU per-process pages to solve this issue. For illumos, we took the other route.
>
>
>
> In illumos, it turned out that we already had per-CPU page tables. Robert and I re-discovered this on the Sunday of that week. We use them for 32-bit processes due to having full P\>V PAE support in our kernel (which is, as it turns out, relatively uncommon amongst open-source OS). The logic to deal with creating and managing them and updating them was all already written, and after reading the code we concluded we could basically make a few small changes and re-use all of it. So we did.
>
>
>
> By the end of that second week, we had a prototype that could get to userland. But, when working on this kind of kernel change we have a rule of thumb we use: after the first 70% of the patch is done and we can boot again, now it's time for the second 70%. In fact it turned out to be more like the second 200% for us -- a tedious long tail of bugs to solve that ended up necessitating some changes in the design as well.
>
>
>
> At first we borrowed the method that Matt Dillon used for DragonFlyBSD, by putting the temporary "stack" space and state data for the interrupt trampolines into an extra page tacked onto the end of \*%gs (in illumos the structure that lives there is the cpu\_t).
>
>
>
> If you read the existing logic in interrupt handlers for dealing with %gs though, you will quickly notice that the corner cases start to build up. There are a bunch of situations where the kernel temporarily alters %gs, and some of the ways to mess it up have security consequences that end up being worse than the bug we're trying to fix. As it turns out, there are no less than 3 different ways that ISRs use to try to get to having the right cpu\_t in %gs on illumos, as it turns out, and they are all subtly different. Trying to tell which you should use when requires a bunch of test logic that in turn requires branches and changes to the CPU state, which is difficult to do in a trampoline where you're trying to avoid altering that state as much as possible until you've got the real stack online to push things into.
>
>
>
> I kept in touch with Philip Guenther and Mike Larkin from the OpenBSD project throughout the weeks that followed. In one of the discussions we had, we talked about the NMI/MCE handlers and the fact that their handling currently on OpenBSD neglected some nasty corner-cases around interrupting an existing trap handler. A big part of the solution to those issues was to use a feature called IST, which allows you to unconditionally change stacks when you take an interrupt.
>
>
>
> Traditionally, x86 only changes the stack pointer (%rsp on AMD64) while taking an interrupt when there is a privilege level change. If you take an interrupt while already in the kernel, the CPU does not change the stack pointer, and simply pushes the interrupt stack frame onto the stack you're already using. IST makes the change of stack pointer unconditional. If used unwisely, this is a bad idea: if you stay on that stack and turn interrupts back on, you could take another interrupt and clobber the frame you're already in. However, in it I saw a possible way to simplify the KPTI trampoline logic and avoid having to deal with %gs.
>
>
>
> A few weeks into the project, John Levon joined us at work. He had previously worked on a bunch of Xen-related stuff as well as other parts of the kernel very close to where we were, so he quickly got up to speed with the KPTI work as well. He and I drafted out a "crazy idea" on the whiteboard one afternoon where we would use IST for all interrupts on the system, and put the "stack" they used in the KPTI page on the end of the cpu\_t. Then, they could easily use stack-relative addresses to get the page table to change to, then pivot their stack to the real kernel stack memory, and throw away (almost) all the conditional logic. A few days later, we had convinced each other that this was the way to go.
>
>
>
> Two of the most annoying x86 issues we had to work around were related to the SYSENTER instruction. This instruction is used to make "fast" system calls in 32-bit userland. It has a couple of unfortunate properties: firstly, it doesn't save or restore RFLAGS, so the kernel code has to take care of this (and be very careful not to clobber any of it before saving or after restoring it). Secondly, if you execute SYSENTER with the TF ("trap"/single-step flag) set by a debugger, the resulting debug trap's frame points at kernel code instead of the user code where it actually happened. The first one requires some careful gymnastics on the entry and return trampolines specifically for SYSENTER, while the second is a nasty case that is incidentally made easier by using IST. With IST, we can simply make the debug trap trampoline check for whether we took the trap in another trampoline's code, and reset %cr3 and the destination stack. This works for single-stepping into any of the handlers, not just the one for SYSENTER.
>
>
>
> To make debugging easier, we decided that traps like the debug/single-step trap (as well as faults like page faults, #GP, etc.) would push their interrupt frame in a different part of the KPTI state page to normal interrupts. We applied this change to all the traps that can interrupt another trampoline (based on the instructions we used). These "paranoid" traps also set a flag in the KPTI struct to mark it busy (and jump to the double-fault handler if it is), to work around some bugs where double-faults are not correctly generated.
>
>
>
> It's been a long and busy two months, with lots of time spent building, testing, and validating the code. We've run it on as many kinds of machines as we could get our hands on, to try to make sure we catch issues. The time we've spent on this has been validated several times in the process by finding bugs that could have been nasty in production.
>
>
>
> One great example: our patches on Westmere-EP Xeons were causing busy machines to throw a lot of L0 I-cache parity errors. This seemed very mysterious at first, and it took us a few times seeing it to believe that it was actually our fault. This was actually caused by the accidental activation of a CPU errata for Westmere (B52, "Memory Aliasing of Code Pages May Cause Unpredictable System Behaviour") -- it turned out we had made a typo and put the "cacheable" flag into a variable named flags instead of attrs where it belonged when setting up the page tables. This was causing performance degradation on other machines, but on Westmere it causes cache parity errors as well. This is a great example of the surprising consequences that small mistakes in this kind of code can end up having. In the end, I'm glad that that erratum existed, otherwise it may have been a long time before we caught that bug.
>
>
>
> As of this week, Mike and Philip have committed the OpenBSD patches for KPTI to their repository, and the patches for illumos are out for review. It's a nice kind of symmetry that the two projects who started on the work together after the public disclosure at the same time are both almost ready to ship at the same time at the other end. I'm feeling hopeful, and looking forward to further future collaborations like this with our cousins, the BSDs.
>
>

* The IllumOS work has since landed, on [March 12th](https://github.com/joyent/illumos-joyent/commit/d85fbfe15cf9925f83722b6d62da49d549af615c) \*\*\*

### [OpenBSD Email Service](https://github.com/vedetta-com/caesonia) ###

* Features
  * Efficient: configured to run on min. 512MB RAM and 20GB SSD, a KVM (cloud) VPS for around $2.50/mo
  * 15GB+ uncompressed Maildir, rivals top free-email providers (grow by upgrading SSD)
  * Email messages are gzip compressed, at least 1/3 more space with level 6 default
  * Server side full text search (headers and body) can be enabled (to use the extra space)
  * Mobile data friendly: IMAPS connections are compressed
  * Subaddress (+tag) support, to filter and monitor email addresses
  * Virtual domains, aliases, and credentials in files, Berkeley DB, or SQLite3
  * Naive Bayes rspamd filtering with supervised learning: the lowest false positive spam detection rates
  * Carefree automated Spam/ and Trash/ cleaning service (default: older than 30 days)
  * Automated quota management, gently assists when over quota
  * Easy backup MX setup: using the same configuration, install in minutes on a different host
  * Worry-free automated master/master replication with backup MX, prevents accidental loss of email messages
  * Resilient: the backup MX can be used as primary, even when the primary is not down, both perfect replicas
  * Flexible: switching roles is easy, making the process of changing VPS hosts a breeze (no downtime)
  * DMARC (with DKIM and SPF) email-validation system, to detect and prevent email spoofing
  * Daily (spartan) stats, to keep track of things
  * Your sieve scripts and managesieve configuration, let's get started

* Considerations

>
>
> By design, email message headers need to be public, for exchanges to happen. The body of the message can be encrypted by the user, if desired. Moreover, there is no way to prevent the host from having access to the virtual machine. Therefore, full disk encryption (at rest) may not be necessary.
>
>
>
> Given our low memory requirements, and the single-purpose concept of email service, Roundcube or other web-based IMAP email clients should be on a different VPS.
>
>
>
> Antivirus software users (usually) have the service running on their devices. ClamAV can easily be incorporated into this configuration, if affected by the types of malware it protects against, but will require around 1GB additional RAM (or another VPS).
>
>
>
> Every email message is important, if properly delivered, for Bayes classification. At least 200 ham and 200 spam messages are required to learn what one considers junk. By default (change to use case), a rspamd score above 50% will send the message to Spam/. Moving messages in and out of Spam/ changes this score. After 95%, the message is flagged as "seen" and can be safely ignored.
>
>
>
> Spamd is effective at greylisting and stopping high volume spam, if it becomes a problem. It will be an option when IPv6 is supported, along with bgp-spamd.
>
>
>
> System mail is delivered to an alias mapped to a virtual user served by the service. This way, messages are guaranteed to be delivered via encrypted connection. It is not possible for real users to alias, nor mail an external mail address with the default configuration. e.g. [puffy@mercury.example.com](mailto:puffy@mercury.example.com) is wheel, with an alias mapped to (virtual) [puffy@example.com](mailto:puffy@example.com), and user (puffy) can be different for each.
>
>
> ---
>

Interview - Ryan Zezeski - [rpz@joyent.com](mailto:rpz@joyent.com) / [@rzezeski](https://twitter.com/rzezeski)
----------

---

News Roundup
----------

### [John Carmack's programming retreat to hermit coding with OpenBSD](https://www.facebook.com/permalink.php?story_fbid=2110408722526967&id=100006735798590) ###

>
>
> After a several year gap, I finally took another week-long programming retreat, where I could work in hermit mode, away from the normal press of work. My wife has been generously offering it to me the last few years, but Im generally bad at taking vacations from work.  
>  As a change of pace from my current Oculus work, I wanted to write some from-scratch-in-C++ neural network implementations, and I wanted to do it with a strictly base OpenBSD system. Someone remarked that is a pretty random pairing, but it worked out ok.  
>  Despite not having actually used it, I have always been fond of the idea of OpenBSD  a relatively minimal and opinionated system with a cohesive vision and an emphasis on quality and craftsmanship. Linux is a lot of things, but cohesive isnt one of them.  
>  Im not a Unix geek. I get around ok, but I am most comfortable developing in Visual Studio on Windows. I thought a week of full immersion work in the old school Unix style would be interesting, even if it meant working at a slower pace. It was sort of an adventure in retro computing  this was fvwm and vi. Not vim, actual BSD vi.  
>  In the end, I didnt really explore the system all that much, with 95% of my time in just the basic vi / make / gdb operations. I appreciated the good man pages, as I tried to do everything within the self contained system, without resorting to internet searches. Seeing references to 30+ year old things like Tektronix terminals was amusing.  
>  I was a little surprised that the C++ support wasnt very good. G++ didnt support C++11, and LLVM C++ didnt play nicely with gdb. Gdb crashed on me a lot as well, I suspect due to C++ issues. I know you can get more recent versions through ports, but I stuck with using the base system.  
>  In hindsight, I should have just gone full retro and done everything in ANSI C. I do have plenty of days where, like many older programmers, I think Maybe C++ isnt as much of a net positive as we assume.... There is still much that I like, but it isnt a hardship for me to build small projects in plain C.  
>  Maybe next time I do this I will try to go full emacs, another major culture that I dont have much exposure to.  
>  I have a decent overview understanding of most machine learning algorithms, and I have done some linear classifier and decision tree work, but for some reason I have avoided neural networks. On some level, I suspect that Deep Learning being so trendy tweaked a little bit of contrarian in me, and I still have a little bit of a reflexive bias against throw everything at the NN and let it sort it out!  
>  In the spirit of my retro theme, I had printed out several of Yann LeCuns old papers and was considering doing everything completely off line, as if I was actually in a mountain cabin somewhere, but I wound up watching a lot of the Stanford CS231N lectures on YouTube, and found them really valuable. Watching lecture videos is something that I very rarely do  it is normally hard for me to feel the time is justified, but on retreat it was great!  
>  I dont think I have anything particularly insightful to add about neural networks, but it was a very productive week for me, solidifying book knowledge into real experience.  
>  I used a common pattern for me: get first results with hacky code, then write a brand new and clean implementation with the lessons learned, so they both exist and can be cross checked.  
>  I initially got backprop wrong both times, comparison with numerical differentiation was critical! It is interesting that things still train even when various parts are pretty wrong  as long as the sign is right most of the time, progress is often made.  
>  I was pretty happy with my multi-layer neural net code; it wound up in a form that I can just drop it into future efforts. Yes, for anything serious I should use an established library, but there are a lot of times when just having a single .cpp and .h file that you wrote ever line of is convenient.  
>  My conv net code just got to the hacky but working phase, I could have used another day or two to make a clean and flexible implementation.  
>  One thing I found interesting was that when testing on MNIST with my initial NN before adding any convolutions, I was getting significantly better results than the non-convolutional NN reported for comparison in LeCun 98  right around 2% error on the test set with a single 100 node hidden layer, versus 3% for both wider and deeper nets back then. I attribute this to the modern best practices ReLU, Softmax, and better initialization.  
>  This is one of the most fascinating things about NN work  it is all so simple, and the breakthrough advances are often things that can be expressed with just a few lines of code. It feels like there are some similarities with ray tracing in the graphics world, where you can implement a physically based light transport ray tracer quite quickly, and produce state of the art images if you have the data and enough runtime patience.  
>  I got a much better gut-level understanding of overtraining / generalization / regularization by exploring a bunch of training parameters. On the last night before I had to head home, I froze the architecture and just played with hyperparameters. Training! Is definitely worse than Compiling! for staying focused.  
>  Now I get to keep my eyes open for a work opportunity to use the new skills!  
>  I am dreading what my email and workspace are going to look like when I get into the office tomorrow.
>
>
> ---
>

### [Stack-register Checking](https://undeadly.org/cgi?action=article;sid=20180310000858) ###

>
>
> Recently, Theo de Raadt (deraadt@) described a new type of mitigation he has been working on together with Stefan Kempf (stefan@):  
>  How about we add another new permission! This is not a hardware permission, but a software permission. It is opportunistically enforced by the kernel.  
>  The permission is MAP\_STACK. If you want to use memory as a stack, you must mmap it with that flag bit. The kernel does so automatically for the stack region of a process's stack. Two other types of stack occur: thread stacks, and alternate signal stacks. Those are handled  
>  in clever ways.  
>  When a system call happens, we check if the stack-pointer register points to such a page. If it doesn't, the program is killed. We have tightened the ABI. You may no longer point your stack register at non-stack memory. You'll be killed. This checking code is MI, so it works for all platforms.
>
>

* For more detail, see [Theo's original message](https://marc.info/?l=openbsd-tech&m=152035796722258&w=2).

>
>
> This is now available in snapshots, and people are finding the first problems in the ports tree already. So far, few issues have been uncovered, but as Theo points out, more testing is necessary:
>
>
>
> Fairly good results.  
>  A total of 4 problems have been found so far. go, SBCL, and two cases in src/regress which failed the new page-alignment requirement. The SBCL and go ones were found at buildtime, since they use themselves to complete build.  
>  But more page-alignment violations may be found in ports at runtime.  
>  This is something I worry about a bit. So please everyone out there can help: Use snapshots which contain the stack-check diff, update to new packages, and test all possible packages. Really need a lot of testing for this, so please help out.
>
>
>
> So, everybody, install the latest snapshot and try all your favorite ports. This is the time to report issues you find, so there is a good chance this additional security feature is present in 6.3 (and works with third party software from packages).
>
>

---

### [NomadBSD 1.0 has been released](https://freeshell.de/~mk/projects/nomadbsd.html) ###

* NomadBSD is a live system for flash drives, based on FreeBSD® 11.1 (amd64)
* Change Log
  * The setup process has been improved.
  * Support for optional geli encryption of the home partition has been added
  * Auto-detection of NVIDIA graphics cards and their corresponding driver has been added. (Thanks to holgerw and lme from BSDForen.de)
  * An rc script to start the GEOM disk scheduler on the root device has been added.

* More software has been added:
  * accessibility/redshift (starts automatically)
  * audio/cantata
  * audio/musicpd
  * audio/ncmpc
  * ftp/filezilla
  * games/bsdtris
  * mail/neomutt
  * math/galculator
  * net-p2p/transmission-qt5
  * security/fpm2
  * sysutils/bsdstats
  * x11/metalock
  * x11/xbindkeys
  * Several smaller improvements and bugfixes.

* Screenshots
  * [https://freeshell.de/\~mk/projects/nomadbsd-ss1.png](https://freeshell.de/~mk/projects/nomadbsd-ss1.png)
  * [https://freeshell.de/\~mk/projects/nomadbsd-ss2.png](https://freeshell.de/~mk/projects/nomadbsd-ss2.png)
  * [https://freeshell.de/\~mk/projects/nomadbsd-ss3.png](https://freeshell.de/~mk/projects/nomadbsd-ss3.png)
  * [https://freeshell.de/\~mk/projects/nomadbsd-ss4.png](https://freeshell.de/~mk/projects/nomadbsd-ss4.png)
  * [https://freeshell.de/\~mk/projects/nomadbsd-ss5.png](https://freeshell.de/~mk/projects/nomadbsd-ss5.png)
  * [https://freeshell.de/\~mk/projects/nomadbsd-ss6.png](https://freeshell.de/~mk/projects/nomadbsd-ss6.png)

---

Beastie Bits
----------

* [KnoxBug - Nagios](http://knoxbug.org/2018-03-27)
* [vBSDcon videos landing](https://www.youtube.com/playlist?list=PLfJr0tWo35bc9FG_reSki2S5S0G8imqB4)
* [AsiaBSDCon 2017 videos](https://www.youtube.com/playlist?list=PLnTFqpZk5ebBTyXedudGm6CwedJGsE2Py)
* [DragonFlyBSD Adds New "Ptr\_Restrict" Security Option](https://www.phoronix.com/scan.php?page=news_item&px=DragonFlyBSD-Ptr-Restrict)
* [A Dexter needs your help](https://twitter.com/michaeldexter/status/975603855407788032)
* [Mike Larkin at bhyvecon 2018: OpenBSD vmm(4) update](https://undeadly.org/cgi?action=article;sid=20180309064801)
* [[HEADS UP] - OFED/RDMA stack update](https://lists.freebsd.org/pipermail/freebsd-arch/2018-March/018900.html) \*\*\*

Feedback/Questions
----------

* Ron - [Interview someone using DragonflyBSD](http://dpaste.com/3BM6GSW#wrap)
* Brad - [Gaming and all](http://dpaste.com/3X4ZZK2#wrap)
* Mohammad - [Sockets vs TCP](http://dpaste.com/0PJMKRD#wrap)
* Paul - [All or at least most of Bryan Cantrill's Talks](http://dpaste.com/2WXVR1X#wrap) \*\*\*