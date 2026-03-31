+++
title = "209: Signals: gotta catch ‘em all"
description = "We read a trip report about FreeBSD in China, look at how Unix deals with Signals, a stats collector in DragonFlyBSD & much more!This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsystems.com/bsd"
date = "2017-08-30T12:00:00Z"
url = "https://www.bsdnow.tv/209"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.858050398Z"
seen = true
+++

We read a trip report about FreeBSD in China, look at how Unix deals with Signals, a stats collector in DragonFlyBSD & much more!

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Trip Report: FreeBSD in China at COPU and LinuxCon](https://www.freebsdfoundation.org/blog/trip-report-freebsd-in-china-at-copu-and-linuxcon/) ###

* This trip report is from Deb Goodkin, the Executive Director of the FreeBSD Foundation. She travelled to China in May 2017 to promote FreeBSD, meet with companies, and participate in discussions around Open Source.
* \> In May of 2017, we were invited to give a talk about FreeBSD at COPU’s (China Open Source Promotional Unit) Open Source China, Open Source World Summit, which took place June 21-22, in Beijing. This was a tremendous opportunity to talk about the advantages of FreeBSD to the open source leaders and organizations interested in open source. I was honored to represent the Project and Foundation and give the presentation “FreeBSD Advantages and Applications”.
* \> Since I was already going to be in Beijing, and LinuxCon China was being held right before the COPU event, Microsoft invited me to be part of a women-in-tech panel they were sponsoring. There were six of us on the panel including two from Microsoft, one from the Linux Foundation, one from Accenture of China, and one from Women Who Code. Two of us spoke in English, with everyone else speaking Chinese. It was disappointing that we didn’t have translators, because I would have loved hearing everyone’s answers. We had excellent questions from the audience at the end. I also had a chance to talk with a journalist from Beijing, where I emphasized how contributing to an open source project, like FreeBSD, is a wonderful way to get experience to boost your resume for a job.
* \> The first day of LinuxCon also happened to be FreeBSD Day. I had my posters with me and was thrilled to have the Honorary Chairman of COPU (also known as the “Father of Open Source in China”) hold one up for a photo op. Unfortunately, I haven’t been able to get a copy of that photo for proof (I’m still working on it!). We spent a long time discussing the strengths of FreeBSD. He believes there are many applications in China that could benefit from FreeBSD, especially for embedded devices, university research, and open source education. We had more time throughout the week to discuss FreeBSD in more detail.
* \> Since I was at LinuxCon, I had a chance to meet with people from the Linux Foundation, other open source projects, and some of our donors. With LinuxCon changing its name to Open Source Summit, I discussed how important it is to include minority voices like ours to contribute to improving the open source ecosystem. The people I talked to within the Linux Foundation agreed and suggested that we get someone from the Project to give a talk at the Open Source Summit in Prague this October. Jim Zemlin, the Linux Foundation Executive Director, suggested having a BSD track at the summits. We did miss the call for proposals for that conference, but we need to get people to consider submitting proposals for the Open Source Summits in 2018.
* \> I talked to a CTO from a company that donates to us and he brought up his belief that FreeBSD is much easier to get started on as a contributor. He talked about the steep path in Linux to getting contributions accepted due to having over 10,000 developers and the hierarchy of decision makers, from Linus to his main lieutenants to the layers beneath him. It can take 6 months to get your changes in!
* \> On Tuesday, Kylie and I met with a representative from Huawei, who we’ve been meeting over the phone with over the past few months. Huawei has a FreeBSD contributor and is looking to add more. We were thrilled to hear they decided to donate this year. We look forward to helping them get up to speed with FreeBSD and collaborate with the Project.
* \> Wednesday marked the beginning of COPU and the reason I flew all the way to Beijing! We started the summit with having a group photo of all the speakers:The honorary chairman, Professor Lu in the front middle.
* \> My presentation was called “FreeBSD Advantages and Applications”. A lot of the material came from Foundation Board President, George-Neville-Neil’s presentation, “FreeBSD is not a Linux Distribution”, which is a wonderful introduction to FreeBSD and includes the history of FreeBSD, who uses it and why, and which features stand out. My presentation went well, with Professor Lu and others engaged through the translators. Afterwards, I was invited to a VIP dinner, which I was thrilled about.
* \> The only hitch was that Kylie and I were running a FreeBSD meetup that evening, and both were important! Beijing during rush hour is crazy, even trying to go only a couple of miles is challenging. We made plans that I would go to the meetup and give the same presentation, and then head back to the dinner. Amazingly, it worked out.
* Check out the rest of her trip report and stay tuned for more news from the region as this is one of the focus areas of the Foundation. \*\*\*

### [Unix: Dealing with signals](http://www.networkworld.com/article/3211296/linux/unix-dealing-with-signals.html) ###

>
>
> Signals on Unix systems are critical to the way processes live and die. This article looks at how they're generated, how they work, and how processes receive or block them  
>  On Unix systems, there are several ways to send signals to processes—with a kill command, with a keyboard sequence (like control-C), or through a program  
>  Signals are also generated by hardware exceptions such as segmentation faults and illegal instructions, timers and child process termination.  
>  But how do you know what signals a process will react to? After all, what a process is programmed to do and able to ignore is another issue.  
>  Fortunately, the /proc file system makes information about how processes handle signals (and which they block or ignore) accessible with commands like the one shown below. In this command, we’re looking at information related to the login shell for the current user, the "$$" representing the current process.
>
>

* On FreeBSD, you can use *procstat -i PID* to get that and even more information, and easier to digest form

>
> >
> >
> > ```
> >         P  if signal is pending in the global process queue
> >         I  if signal delivery disposition is SIGIGN
> >         C  if signal delivery is to catch it
> >
> > ```
> >
> >
> >
> > Catching a signal requires that a signal handling function exists in the process to handle a given signal. The SIGKILL (9) and SIGSTOP (#) signals cannot be ignored or caught. For example, if you wanted to tell the kernel that ctrl-C's are to be ignored, you would include something like this in your source code:  
> >  signal(SIGINT, SIG\_IGN);  
> >  To ensure that the default action for a signal is taken, you would do something like this instead:  
> >  signal(SIGSEGV, SIG\_DFL);
> >
> >
> >
> > * The article then shows some ways to send signals from the command line, for example to send SIGHUP to a process with pid 1234: kill -HUP 1234
> > * You can get a list of the different signals by running kill -l On Unix systems, signals are used to send all kinds of information to running processes, and they come from user commands, other processes, and the kernel itself. Through /proc, information about how processes are handling signals is now easily accessible and, with just a little manipulation of the data, easy to understand. \*\*\*
> >
> >
>
>

### [links owned by NGZ erroneously marked as on loan](https://smartos.org/bugview/OS-6274) ###

* NGZ (Non-Global Zone), is IllumOS speak for their equivalent to a jail \> As reported by user brianewell in smartos-live#737, NGZ ip tunnels stopped persisting across zone reboot. This behavior appeared in the 20170202 PI and was not present in previous releases. After much spelunking I determined that this was caused by a regression introduced in commit 33df115 (part of the OS-5363 work). The regression was a one-line change to link\_activate() which marks NGZ links as on loan when they are in fact not loaned because the NGZ created and owns the link.
* “On loan” means the interface belongs to the host (GZ, Global Zone), and has been loaned to the NGZ (Jail)

>
>
> This regression was easy to introduce because of the subtle nature of this code and lack of comments. I'm going to remove the regressive line, add clarifying comments, and also add some asserts.  
>  The following is a detailed analysis of the issue, how I debugged it, and why my one-line change caused the regression:  
>  To start I verified that PI 20170119 work as expected:  
>  booted 20170119  
>  created iptun (named v4\_sys76) inside of a native NGZ (names sos-zone)  
>  performed a reboot of sos-zone  
>  zlogin to sos-zone and verify iptun still exists after reboot  
>  Then I booted the GZ into PI 20170202 and verified the iptun did not show up  
>  booted 20170202  
>  started sos-zone  
>  zlogin and verified the iptun was missing  
>  At this point I thought I would recreate the iptun and see if I could monitor the zone halt/boot process for the culprit, but instead I received an error from dladm: "object already exists".  
>  I didn't expect this. So I used mdb to inspect the dlmgmtd state. Sure enough the iptun exists in dlmgmtd.  
>  Okay, so if the link already exists, why doesn't it show up (in either the GZ or the NGZ)?  
>  If a link is not marked as active then it won't show up when you query dladm. When booting the zone on 20170119 the ll\_flags for the iptun contained the value 0x3. So the problem is the link is not marked as active on the 20170202 PI.  
>  The link\_activate() function is responsible for marking a link as active. I used dtrace to verify this function was called on the 20170202 PI and that the dlmgmt\_link\_t had the correct ll\_flags value.  
>  So the iptun link structure has the correct ll\_flags when link\_activate() returns but when I inspect the same structure with mdb afterwards the value has changed.  
>  Sometime after link\_activate() completes some other process changed the ll\_flags value. My next question was: where is link\_activate() called and what comes after it that might affect the ll\_flags? I did another trace and got this stack.  
>  The dlmgmt\_upid() function calls dlmgmt\_write\_db\_entry() after link\_activate() and that can change the flags. But dtrace proved the ll\_flags value was still 0x3 after returning from this function.  
>  With no obvious questions left I then asked cscope to show me all places where ll\_flags is modified. As I walked through the list I used dtrace to eliminate candidates one at a time -- until I reached dlmgmt\_destroy\_common(). I would not have expected this function to show up during zone boot but sure enough it was being called somehow, and by someone. Who?  
>  Since there is no easy way to track door calls it was at this point I decided to go nuclear and use the dtrace stop action to stop dlmgmtd when it hits dlmgmt\_destroy\_common(). Then I used mdb -k to inspect the door info for the dlmgmtd threads and look for my culprit.  
>  The culprit is do\_up\_iptun() caused by the dladm up-iptun call. Using ptree I then realized this was happening as part of the zone boot under the network/iptun svc startup. At this point it was a matter of doing a zlogin to sos-zone and running truss on dladm up-iptun to find the real reason why dladm\_destroy\_datalink\_id() is called.  
>  So the link is marked as inactive because dladm\_getsnap\_conf() fails with DLADM\_STATUS\_DENIED which is mapped to EACCESS. Looking at the dladm\_getsnap\_conf() code I see the following
>
>

* “The caller is in a non-global zone and the persistent configuration belongs to the global zone.”

>
>
> What this is saying is that if a link is marked "on loan" (meaning it's technically owned/created by the GZ but assigned/loaned to the NGZ) and the zone calling dladm\_getsnap\_conf() is an NGZ then return EACCESS because the configuration of the link is up to the GZ, not the NGZ. This code is correct and should be enforced, but why is it tripping in PI 20170202 and not 20170119? It comes back to my earlier observation that in the 20170202 PI we marked the iptun as "on loan" but not in the older one. Why?  
>  Well as it turns out while fixing OS-5363 I fixed what I thought was a bug in link\_activate()  
>  When I first read this code it was my understanding that anytime we added a link to a zone's datalink list, by calling zone\_add\_datalink(), that link was then considered "on loan". My understanding was incorrect. The link\_activate() code has a subtleness that eluded me. There are two cases in link\_activate():
>
>
>
> 1. The link is under an NGZ's datalink list but it's ll\_linkid doesn't reflect that (e.g., the link is found under zoneid 3 but ll\_linkid is 0). In this case the link is owned by the GZ but is being loaned to an NGZ and the link state should be updated accordingly. We get in this situation when dlmgmtd is restated for some reason (it must resync it's in-memory state with the state of the system).
> 2. The link is NOT under any NGZ's (zone\_check\_datalink() is only concerned with NGZs) datalink list but its ll\_zoneid holds the value of an NGZ. This indicates that the link is owned by an NGZ but for whatever reason is not currently under the NGZ's datalink list (e.g., because we are booting the zone and we now need to assign the link to its list). So the fix is to revert that one line change as well as add some clarifying comments and also some asserts to prevent further confusion in the future.
> 3. A nice breakdown by Ryan Zezeski of how he accidently introduced a regression, and how he tracked it down using dtrace and mdb \*\*\*
>
>

### [New experimental statistics collector in master](http://dpaste.com/2YP0X9C) ###

>
>
> Master now has an in-kernel statistics collector which is enabled by default, and a (still primitive) user land program to access it. This recorder samples the state of the machine once every 10 seconds and records it in a large FIFO, all in-kernel. The FIFO typically contains 8192 entries, or around the last 23 hours worth of data.  
>  Statistics recorded include current load, user/sys/idle cpu use, swap use, VM fault rate, VM memory statistics, and counters for syscalls, path lookups, and various interrupt types. A few more useful counters will probably be added... I'd like to tie cpu temperature, fork rate, and exec rate in at some point, as well as network and disk traffic.  
>  The statistics gathering takes essentially no real overhead and is always on, so any user at the spur of the moment with no prior intent can query the last 23 hours worth of data.  
>  There is a user frontend to the data called 'kcollect' (its tied into the buildworld now). Currently still primitive. Ultimately my intention is to integrate it with a dbm database for long-term statistical data retention (if desired) using an occasional (like once-an-hour) cron-job to soak up anything new, with plenty of wiggle room due to the amount of time the kernel keeps itself. This is better and less invasive than having a userland statistics gathering script running every few minutes from cron and has the advantage of giving you a lot of data on the spur of the moment without having to ask for it before-hand.  
>  If you have gnuplot installed (pkg install gnuplot), kcollect can generate some useful graphs based on the in-kernel data. Well, it will be boring if the machine isn't doing anything :-). There are options to use gnuplot to generate a plot window in X or a .jpg or .png file, and other options to set the width and height and such. At the moment the gnuplot output uses a subset of statically defined fields to plot but ultimately the field list it uses will be specifiable.
>
>

* [Sample image generated during a synth run](http://apollo.backplane.com/DFlyMisc/kcollect03.jpg)

---

News Roundup
----------

### [openbsd changes of note 626](https://www.tedunangst.com/flak/post/openbsd-changes-of-note-626) ###

* Hackerthon is imminent.
* There are two signals one can receive after accessing invalid memory, SIGBUS and SIGSEGV. Nobody seems to know what the difference is or should be, although some theories have been unearthed. Make some attempt to be slightly more consistent and predictable in OpenBSD.
* Introduces jiffies in an effort to appease our penguin oppressors.
* Clarify that IP.OF.UPSTREAM.RESOLVER is not actually the hostname of a server you can use.
* Switch acpibat to use \_BIX before \_BIF, which means you might see discharge cycle counts, too.
* Assorted clang compatibility. clang uses -Oz to mean optimize for size and -Os for something else, so make gcc accept -Oz so all makefiles can be the same. Adjust some hardlinks. Make sure we build gcc with gcc.
* The SSL\_check\_private\_key function is a lie.
* Switch the amd64 and i386 compiler to clang and see what happens.
* We are moving towards using wscons (wstpad) as the driver for touchpads.
* Dancing with the stars, er, NET\_LOCK().
* clang emits lots of warnings. Fix some of them. Turn off a bunch of clang builtins because we have a strong preference that code use our libc versions. Some other changes because clang is not gcc.
* Among other curiosities, static variables in the special .openbsd.randomdata are sometimes assumed to be all zero, leading the clang optimizer to eliminate reads of such variables.
* Some more pledge rules for sed. If the script doesn’t require opening new files, don’t let it.
* Backport a bajillion fixes to stable. Release errata.
* RFC 1885 was obsoleted nearly 20 years ago by RFC 2463 which was obsoleted over 10 years ago by RFC 4443. We are probably not going back.
* Update libexpat to 2.2.3.
* vmm: support more than 3855MB guest memory.
* Merge libdrm 2.4.82.
* Disable SSE optimizations on i386/amd64 for SlowBcopy. It is supposed to be slow. Prevents crashes when talking to memory mapped video memory in a hypervisor.

---

### [The $25 “FREEDOM Laptop!”](https://functionallyparanoid.com/2017/08/08/the-25-freedom-laptop/) ###

>
>
> Time to get back to the original intent of this blog – talking about my paranoid obsession with information security! So break out your tinfoil hats my friends because this will be a fun ride. I’m looking for the most open source / freedom respecting portable computing experience I can possibly find and I’m going to document my work in real-time so you will get to experience the ups (and possibly the downs) of that path through the universe. With that said, let’s get rolling.  
>  When I built my OpenBSD router using the APU2 board, I discovered that there are some amd64 systems that use open source BIOS. This one used Coreboot and after some investigation I discovered that there was an even more paranoid open source BIOS called Libreboot out there. That started to feel like it might scratch my itch.  
>   
>  Well, after playing around with some lower-powered systems like my APU2 board, my Thinkpad x230 and my SPARC64 boxes, I thought, if it runs amd64 code and I can run an open source operating system on it, the thing should be powerful enough for me to do most (if not all) of what I need it to do. At this point, I started looking for a viable machine. From a performance perspective, it looked like the Thinkpad x200, T400, T500 and W500 were all viable candidates. After paying attention on eBay for a while, I saw something that was either going to be a sweet deal, or a throwaway piece of garbage!  
>  I found a listing for a Thinkpad T500 that said it didn’t come with a power adapter and was 100% untested. From looking at the photos, it seemed like there was nothing that had been molested about it. Obviously, nobody was jumping on something this risky so I thought, “what the heck” and dropped a bit at the opening price of $24.99. Well, guess what. I won the auction. Now to see what I got.  
>  When the laptop showed up, I discovered it was minus its hard drive (but the outside plastic cover was still in place). I plugged in my x230’s power adapter and hit the button. I got lights and was dropped to the BIOS screen. To my eternal joy, I discovered that the machine I had purchased for $25 was 100% functional and included the T9400 2.54 GHz Core 2 Duo CPU and the 1680×1050 display panel. W00t!  
>  First things first, I need to get this machine a hard drive and get the RAM upgraded from the 2GB that it showed up with to 8GB. Good news is that these two purchases only totaled $50 for the pair. An aftermarket 9-cell replacement battery was another $20. Throw in a supported WiFi card that doesn’t require a non-free blob from Libreboot at $5.99 off of eBay and $5 for a hard drive caddy and I’m looking at about $65 in additional parts bringing the total cost of the laptop, fully loaded up at just over $100. Not bad at all…  
>  Once all of the parts arrived and were installed, now for the fun part. Disassembling the entire thing down to the motherboard so we can re-flash the BIOS with Libreboot. The guide looks particularly challenging for this but hey, I have a nice set of screwdrivers from iFixit and a remarkable lack of fear when it comes to disassembling things. Should be fun!  
>  Well, fun didn’t even come close. I wish I had shot some pictures along the way because at one point I had a heap of parts in one corner of my “workbench” (the dining room table) and just the bare motherboard, minus the CPU sitting in front of me. With the help of a clip and a bunch of whoops wires (patch cables), I connected my Beaglebone Black to the BIOS chip on the bare motherboard and attempted to read the chip. #fail  
>  I figured out after doing some more digging that you need to use the connector on the left side of the BBB if you hold it with the power connector facing away from you. In addition, you should probably read the entire process through instead of stopping at the exciting pinout connector diagram because I missed the bit about the 3.3v power supply need to have ground connected to pin 2 of the BIOS chip.  
>  Speaking of that infamous 3.3v power supply, I managed to bend a paperclip into a U shape and jam it into the connector of an old ATX power supply I had in a closet and source power from that. I felt like MacGyver for that one!  
>  I was able to successfully read the original Thinkpad BIOS and then flash the Libreboot + Grub2 VESA framebuffer image onto the laptop! I gulped loudly and started the reassembly process. Other than having some cable routing difficulties because the replacement WiFi card didn’t have a 5Ghz antenna, it all went back together. Now for the moment of truth! I hit the power button and everything worked!!!  
>  At this point I happily scurried to download the latest snapshot of OpenBSD – current and install it. Well, things got a little weird here. Looks like I have to use GRUB to boot this machine now and GRUB won’t boot an OpenBSD machine with Full Disk Encryption. That was a bit of a bummer for me. I tilted against that windmill for several days and then finally admitted defeat. So now what to do? Install Arch?  
>  Well, here’s where I think the crazy caught up to me. I decided to be an utter sell out and install Ubuntu Gnome Edition 17.04 (since that will be the default DE going forward) with full disk encryption. I figured I could have fun playing around in a foreign land and try to harden the heck out of that operating system. I called Ubuntu “grandma’s Linux” because a friend of mine installed it on his mom’s laptop for her but I figured what the heck – let’s see how the other half live!  
>  At this point, while I didn’t have what I originally set out to do – build a laptop with Libreboot and OpenBSD, I did have a nice compromise that is as well hardened as I can possibly make it and very functional in terms of being able to do what I need to do on a day to day basis. Do I wish it was more portable? Of course. This thing is like a six or seven pounder. However, I feel much more secure in knowing that the vast majority of the code running on this machine is open source and has all the eyes of the community on it, versus something that comes from a vendor that we cannot inspect. My hope is that someone with the talent (unfortunately I lack those skills) takes an interest in getting FDE working with Libreboot on OpenBSD and I will most happily nuke and repave this “ancient of days” machine to run that!
>
>
> ---
>

### [FreeBSD Programmers Report Ryzen SMT Bug That Hangs Or Resets Machines](https://hothardware.com/news/freebsd-programmers-report-ryzen-smt-bug-that-hangs-or-resets-machines) ###

>
>
> It's starting to look like there's an inherent bug with AMD's Zen-based chips that is causing issues on Unix-based operating systems, with both Linux and FreeBSD confirmed. The bug doesn't just affect Ryzen desktop chips, but also AMD's enterprise EPYC chips. It seems safe to assume that Threadripper will bundle it in, as well.  
>  It's not entirely clear what is causing the issue, but it's related to the CPU being maxed out in operations, thus causing data to get shifted around in memory, ultimately resulting in unstable software. If the bug is exercised a certain way, it can even cause machines to reset.  
>  The revelation about the issue on FreeBSD was posted to the official repository, where the issue is said to happen when threads can lock up, and then cause the system to become unstable. Getting rid of the issue seems as simple as disabling SMT, but that would then negate the benefits provided by having so many threads at-the-ready.  
>  On the Linux side of the Unix fence, Phoronix reports on similar issues, where stressing Zen chips with intensive benchmarks can cause one segmentation fault after another. The issue is so profound, that Phoronix Test Suite developer Michael Larabel introduced a special test that can be run to act as a bit of a proof-of-concept. To test another way, PTS can be run with this command:  
> `PTS_CONCURRENT_TEST_RUNS=4 TOTAL_LOOP_TIME=60 phoronix-test-suite stress-run build-linux-kernel build-php build-apache build-imagemagick`  
>  Running this command will compile four different software projects at once, over and over, for an hour. Before long, segfaults should begin to appear (as seen in the shot above).  
>  It's not entirely clear if both sets of issues here are related, but seeing as both involve stressing the CPU to its limit, it seems likely. Whether or not this could be patched on a kernel or EFI level is something yet to be seen.
>
>
> ---
>

### [TrueOS - UNSTABLE update: 8/7/17](https://www.trueos.org/blog/unstable-update-8717/) ###

* A new UNSTABLE update for TrueOS is available! Released regularly, UNSTABLE updates are the full “rolling release” of TrueOS. UNSTABLE includes experimental features, bugfixes, and other CURRENT FreeBSD work. It is meant to be used by those users interested in using the latest TrueOS and FreeBSD developments to help test and improve these projects.

  >
  >
  > WARNING: UNSTABLE updates are released primarily for TrueOS and FreeBSD testing/experimentation purposes. Update and run UNSTABLE “at your own risk”.  
  >  Note: There was a CDN issue over the weekend that caused issues for early updaters. Everything appears to be resolved and the update is fully available again. If you encountered instability or package issues from updating on 8/6 or 8/5, roll back to a previous boot environment and run the update again.
  >
  >

* Changes:

  * UNSTABLE .iso and .img files beginning with TrueOS-2017-08-3-x64 will be available to download from [http://download.trueos.org/unstable/amd64/](http://download.trueos.org/unstable/amd64/). Due to CDN issues, these are not quite available, look for them later today or tomorrow (8/8/17). This update resyncs all ports with FreeBSD as of 8.1.2017. This includes: New/updated FreeBSD Kernel and World & New DRM (Direct Rendering Manager) next.
  * Experimental patch for libhyve-remote: (From htps://github.com/trueos/freebsd/commit/a67a73e49538448629ea27, thanks araujobsd)

>
>
> The libhyve-remote aims to abstract functionalities from other third party libraries like libvncserver, freerdp, and spice to be used in hypervisor implementation. With a basic data structure it is easy to implement any remote desktop protocol without digging into the protocol specification or third part libraries – check some of our examples.We don’t statically link any third party library, instead we use a dynamic linker and load only the functionality necessary to launch the service.Our target is to abstract functionalities from libvncserver, freerdp and spice. Right now, libhyve-remote only supports libvncserver. It is possible to launch a VNC server with different screen resolution as well as with authentication.With this patch we implement support for bhyve to use libhyve-remote that basically abstract some functionalities from libvncserver. We can: Enable wait state, Enable authentication, Enable different resolutions\< Have a better compression. Also, we add a new -s flag for vncserver, if the libhyve-remote library is not present in the system, we fallback to bhyve RFB implementation. For example:  
> `-s 2,fbuf,tcp=0.0.0.0:5937,w=800,h=600,password=1234567,vncserver,wait`
>
>

* New SysAdm Client pages under the System Management category:
  * System Control: This is an interface to browse all the sysctl’s on the system.
  * Devices: This lists all known information about devices on the designated system.

* Lumina Theming: Lumina is testing new theming functionality! By default (in UNSTABLE), a heavily customized version of the Qt5ct engine is included and enabled. This is intended to allow users to quickly adjust themes/icon packs without needing to log out and back in. This also fixes a bug in Insight with different icons loading for the side and primary windows. Look for more information about this new functionality to be discussed on the Lumina Website.
* Update to Iridium Web Browser: Iridium is a Chromium based browser built with user privacy and security as the primary concern, but still maintaining the speed and usability of Chromium. It is now up to date – give it a try and let us know what you think (search for iridium-browser in AppCafe).

---

Beastie Bits
----------

* [GhostBSD 11.1 Alpha1 is ready](http://www.ghostbsd.org/11.1-ALPHA1)
* [A Special CharmBUG announcement](https://www.meetup.com/CharmBUG/events/242563414/)
* [Byhve Obfuscation Part 1 of Many](https://github.com/HardenedBSD/hardenedBSD/commit/59eabffdca53275086493836f732f24195f3a91d)
* [New BSDMag is out](https://bsdmag.org/download/bsd-magazine-overriding-libc-functions/)
* [git: kernel - Lower VM\_MAX\_USER\_ADDRESS to finalize work-around for Ryzen bug](http://lists.dragonflybsd.org/pipermail/commits/2017-August/626190.html)
* [Ken Thompson corrects one of his biggest regrets](https://twitter.com/_rsc/status/897555509141794817) \*\*\*

Feedback/Questions
----------

* [Hans - zxfer](http://dpaste.com/2SQYQV2)
* [Harza - Google Summer of Code](http://dpaste.com/2175GEB)
* [tadslot - Microphones, Proprietary software, and feedback](http://dpaste.com/154MY1H)
* [Florian - ZFS/Jail](http://dpaste.com/2V9VFAC)
  * [Modifying a ZFS root system to a beadm layout](http://dan.langille.org/2015/03/11/modifying-a-zfs-root-system-to-a-beadm-layout/) \*\*\*