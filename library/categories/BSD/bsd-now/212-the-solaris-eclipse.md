+++
title = "212: The Solaris Eclipse"
description = "We recap vBSDcon, give you the story behind a PF EN, reminisce in Solaris memories, and show you how to configure different DEs on FreeBSD.This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http://www.ixsyste"
date = "2017-09-20T12:00:00Z"
url = "https://www.bsdnow.tv/212"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.850268784Z"
seen = true
+++

We recap vBSDcon, give you the story behind a PF EN, reminisce in Solaris memories, and show you how to configure different DEs on FreeBSD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [vBSDCon] ###

* vBSDCon was held September 7 - 9th. We recorded this only a few days after getting home from this great event.
* Things started on Wednesday night, as attendees of the thursday developer summit arrived and broke into smallish groups for disorganized dinner and drinks.
* We then held an unofficial hacker lounge in a medium sized seating area, working and talking until we all decided that the developer summit started awfully early tomorrow.
* The developer summit started with a light breakfast and then then we dove right in
* Ed Maste started us off, and then Glen Barber gave a presentation about lessons learned from the 11.1-RELEASE cycle, and comparing it to previous releases. 11.1 was released on time, and was one of the best releases so far. The slides are linked on the [DevSummit wiki page](https://wiki.freebsd.org/DevSummit/20170907).
* The group then jumped into hackmd.io a collaborative note taking application, and listed of various works in progress and upstreaming efforts. Then we listed wants and needs for the 12.0 release.
* After lunch we broke into pairs of working groups, with additional space for smaller meetings. The first pair were, ZFS and Toolchain, followed by a break and then a discussion of IFLIB and network drivers in general. After another break, the last groups of the day met, pkgbase and secure boot.
* Then it was time for the vBSDCon reception dinner. This standing dinner was a great way to meet new people, and for attendees to mingle and socialize.
* The official hacking lounge Thursday night was busy, and included some great storytelling, along with a bunch of work getting done.
* It was very encouraging to watch a struggling new developer getting help from a seasoned veteran. Watching the new developers eyes light up as the new information filled in gaps and they now understood so much more than just a few minutes before, and they raced off to continue working, was inspirational, and reminded me why these conferences are so important.
* The hacker lounge shut down relatively early by BSD conference standards, but, the conference proper started at 8:45 sharp the next morning, so it made sense.
* Friday saw a string of good presentations, I think my favourite was Jonathan Andersons talk on Oblivious sandboxing. Jonathan is a very energetic speaker, and was able to keep everyone focused even during relatively complicated explanations.
* Friday night I went for dinner at Big Bowl, a stir-fry bar, with a largish group of developers and users of both FreeBSD and OpenBSD. The discussions were interesting and varied, and the food was excellent. Benedict had dinner with JT and some other folks from iXsystems.
* Friday night the hacker lounge was so large we took over a bigger room (it had better WiFi too).
* Saturday featured more great talks. The talk I was most interested in was from Eric McCorkle, who did the EFI version of my GELIBoot work. I had reviewed some of the work, but it was interesting to hear the story of how it happened, and to see the parallels with my own story.
* My favourite speaker was Paul Vixie, who gave a very interesting talk about the gets() function in libc. gets() was declared unsafe before the FreeBSD project even started. The original import of the CSRG code into FreeBSD includes the compile time, and run-time warnings against using gets(). OpenBSD removed gets() in version 5.6, in 2014. Following Pauls presentation, various patches were raised, to either cause use of gets() to crash the program, or to remove gets() entirely, causing such programs to fail to link.
* The last talk before the closing was Benedicts [BSD Systems Management with Ansible](https://people.freebsd.org/~bcr/talks/vBSDcon2017_Ansible.pdf).
* Shortly after, Allan won a MacBook Pro by correctly guessing the number of components in a jar that was standing next to the registration desk (Benedict was way off, but had a good laugh about the unlikely future Apple user).
* Saturday night ended with the Conference Social, and excellent dinner with more great conversations
* On Sunday morning, a number of us went to the Smithsonian Air and Space Museum site near the airport, and saw a Concorde, an SR-71, and the space shuttle Discovery, among many other exhibits.
* Check out the [full photo album by JT](https://t.co/KRmSNzUSus), our producer.
* Thanks to all the sponsors for vBSDcon and all the organizers from Verisign, who made it such a great event. \*\*\*

### [The story behind FreeBSD-EN-17.08.pf](https://www.sigsegv.be//blog/freebsd/FreeBSD-EN-17.08.pf) ###

* After our previous deep dive on a bug in episode 209, Kristof Provost, the maintainer of pf on FreeBSD (he is going to hate me for saying that) has written the story behind a recent ERRATA notice for FreeBSD

>
>
> First things first, so I have to point out that I think Allan misremembered things. The heroic debugging story is PR 219251, which I'll try to write about later.   
>  FreeBSD-EN-17:08.pf is an issue that affected some FreeBSD 11.x systems, where FreeBSD would panic at startup. There were no reports for CURRENT.  
>  There's very little to go on here, but we do know the cause of the panic ("integer divide fault"), and that the current process was "pf purge". The pf purge thread is part of the pf housekeeping infrastructure. It's a housekeeping kernel thread which cleans up things like old states and expired fragments.  
>  The lack of mention of pf functions in the backtrace is a hint unto itself. It suggests that the error is probably directly in pf\_purge\_thread(). It might also be in one of the static functions it calls, because compilers often just inline those so they don't generate stack frames.   
>  Remember that the problem is an "integer divide fault". How can integer divisions be a problem? Well, you can try to divide by zero. The most obvious suspect for this is this code:  
>  idx = pf\_purge\_expired\_states(idx, pf\_hashmask / (V\_pf\_default\_rule.timeout[PFTM\_INTERVAL] \* 10));  
>  However, this variable is both correctly initialised (in pfattach\_vnet()) and can only be modified through the DIOCSETTIMEOUT ioctl() call and that one checks for zero.   
>  At that point I had no idea how this could happen, but because the problem did not affect CURRENT I looked at the commit history and found this commit from Luiz Otavio O Souza:  
>  Do not run the pf purge thread while the VNET variables are not initialized, this can cause a divide by zero (if the VNET initialization takes to long to complete).  
>  Obtained from: pfSense  
>  Sponsored by: Rubicon Communications, LLC (Netgate)  
>  That sounds very familiar, and indeed, applying the patch fixed the problem. Luiz explained it well: it's possible to use V\_pf\_default\_rule.timeout before it's initialised, which caused this panic.   
>  To me, this reaffirms the importance of writing good commit messages: because Luiz mentioned both the pf purge thread and the division by zero I was easily able to find the relevant commit. If I hadn't found it this fix would have taken a lot longer.
>
>

* Next week well look at the more interesting story I was interested in, which I managed to nag Kristof into writing \*\*\*

### [The sudden death and eternal life of Solaris](http://dtrace.org/blogs/bmc/2017/09/04/the-sudden-death-and-eternal-life-of-solaris/) ###

* A blog post from Bryan Cantrill about the death of Solaris

>
>
> As had been rumored for a while, Oracle effectively killed Solaris. When I first saw this, I had assumed that this was merely a deep cut, but in talking to Solaris engineers still at Oracle, it is clearly much more than that. It is a cut so deep as to be fatal: the core Solaris engineering organization lost on the order of 90% of its people, including essentially all management.  
>  Of note, among the engineers I have spoken with, I heard two things repeatedly: this is the end and (from those who managed to survive Friday) I wish I had been laid off. Gone is any of the optimism (however tepid) that I have heard over the years  and embarrassed apologies for Oracles behavior have been replaced with dismay about the clumsiness, ineptitude and callousness with which this final cut was handled. In particular, that employees who had given their careers to the company were told of their termination via a pre-recorded call  robo-RIFd in the words of one employee  is both despicable and cowardly. To their credit, the engineers affected saw themselves as Sun to the end: they stayed to solve hard, interesting problems and out of allegiance to one another  not out of any loyalty to the broader Oracle. Oracle didnt deserve them and now it doesnt have them  they have been liberated, if in a depraved act of corporate violence.  
>  Assuming that this is indeed the end of Solaris (and it certainly looks that way), it offers a time for reflection. Certainly, the demise of Solaris is at one level not surprising, but on the other hand, its very suddenness highlights the degree to which proprietary software can suffer by the vicissitudes of corporate capriciousness. Vulnerable to executive whims, shareholder demands, and a fickle public, organizations can simply change direction by fiat. And because  in the words of the late, great Roger Faulkner  it is easier to destroy than to create, these changes in direction can have lasting effect when they mean stopping (or even suspending!) work on a project. Indeed, any engineer in any domain with sufficient longevity will have one (or many!) stories of exciting projects being cancelled by foolhardy and myopic management. For software, though, these cancellations can be particularly gutting because (in the proprietary world, anyway) so many of the details of software are carefully hidden from the users of the product  and much of the innovation of a cancelled software project will likely die with the project, living only in the oral tradition of the engineers who knew it. Worse, in the long run  to paraphrase Keynes  proprietary software projects are all dead. However ubiquitous at their height, this lonely fate awaits all proprietary software.   
>  There is, of course, another way  and befitting its idiosyncratic life and death, Solaris shows us this path too: software can be open source. In stark contrast to proprietary software, open source does not  cannot, even  die. Yes, it can be disused or rusty or fusty, but as long as anyone is interested in it at all, it lives and breathes. Even should the interest wane to nothing, open source software survives still: its life as machine may be suspended, but it becomes as literature, waiting to be discovered by a future generation. That is, while proprietary software can die in an instant, open source software perpetually endures by its nature  and thrives by the strength of its communities. Just as the existence of proprietary software can be surprisingly brittle, open source communities can be crazily robust: they can survive neglect, derision, dissent  even sabotage.  
>  In this regard, I speak from experience: from when Solaris was open sourced in 2005, the OpenSolaris community survived all of these things. By the time Oracle bought Sun five years later in 2010, the community had decided that it needed true independence  illumos was born. And, it turns out, illumos was born at exactly the right moment: shortly after illumos was announced, Oracle  in what remains to me a singularly loathsome and cowardly act  silently re-proprietarized Solaris on August 13, 2010. We in illumos were indisputably on our own, and while many outsiders gave us no chance of survival, we ourselves had reason for confidence: after all, open source communities are robust because they are often united not only by circumstance, but by values, and in our case, we as a community never lost our belief in ZFS, Zones, DTrace and myriad other technologies like MDB, FMA and Crossbow.  
>  Indeed, since 2010, illumos has thrived; illumos is not only the repository of record for technologies that have become cross-platform like OpenZFS, but we have also advanced our core technologies considerably, while still maintaining highest standards of quality. Learning some of the mistakes of OpenSolaris, we have a model that allows for downstream innovation, experimentation and differentiation. For example, Joyents SmartOS has always been focused on our need for a cloud hypervisor (causing us to develop big features like hardware virtualization and Linux binary compatibility), and it is now at the heart of a massive buildout for Samsung (who acquired Joyent a little over a year ago). For us at Joyent, the Solaris/illumos/SmartOS saga has been formative in that we have seen both the ill effects of proprietary software and the amazing resilience of open source software  and it very much informed our decision to open source our entire stack in 2014.  
>  Judging merely by its tombstone, the life of Solaris can be viewed as tragic: born out of wedlock between Sun and AT&T and dying at the hands of a remorseless corporate sociopath a quarter century later. And even that may be overstating its longevity: Solaris may not have been truly born until it was made open source, and  certainly to me, anyway  it died the moment it was again made proprietary. But in that shorter life, Solaris achieved the singular: immortality for its revolutionary technologies. So while we can mourn the loss of the proprietary embodiment of Solaris (and we can certainly lament the coarse way in which its technologists were treated!), we can rejoice in the eternal life of its technologies  in illumos and beyond!
>
>
> ---
>

News Roundup
----------

### [OpenBSD on the Lenovo Thinkpad X1 Carbon (5th Gen)](https://jcs.org/2017/09/01/thinkpad_x1c) ###

* Joshua Stein writes about his experiences running OpenBSD on the 5th generation Lenovo Thinkpad X1 Carbon:

>
>
> ThinkPads have sort of a cult following among OpenBSD developers and users because the hardware is basic and well supported, and the keyboards are great to type on. While no stranger to ThinkPads myself, most of my OpenBSD laptops in recent years have been from various vendors with brand new hardware components that OpenBSD does not yet support. As satisfying as it is to write new kernel drivers or extend existing ones to make that hardware work, it usually leaves me with a laptop that doesn't work very well for a period of months.  
>  After exhausting efforts trying to debug the I2C touchpad interrupts on the Huawei MateBook X (and other 100-Series Intel chipset laptops), I decided to take a break and use something with better OpenBSD support out of the box: the fifth generation Lenovo ThinkPad X1 Carbon.
>
>

* Hardware

>
>
> Like most ThinkPads, the X1 Carbon is available in a myriad of different internal configurations. I went with the non-vPro Core i7-7500U (it was the same price as the Core i5 that I normally opt for), 16Gb of RAM, a 256Gb NVMe SSD, and a WQHD display.  
>  This generation of X1 Carbon finally brings a thinner screen bezel, allowing the entire footprint of the laptop to be smaller which is welcome on something with a 14" screen. The X1 now measures 12.7" wide, 8.5" deep, and 0.6" thick, and weighs just 2.6 pounds. While not available at initial launch, Lenovo is now offering a WQHD IPS screen option giving a resolution of 2560x1440. Perhaps more importantly, this display also has much better brightness than the FHD version, something ThinkPads have always struggled with.  
>  On the left side of the laptop are two USB-C ports, a USB-A port, a full-size HDMI port, and a port for the ethernet dongle which, despite some reviews stating otherwise, is not included with the laptop. On the right side is another USB-A port and a headphone jack, along with a fan exhaust grille. On the back is a tray for the micro-SIM card for the optional WWAN device, which also covers the Realtek microSD card reader. The tray requires a paperclip to eject which makes it inconvenient to remove, so I think this microSD card slot is designed to house a card semi-permanently as a backup disk or something.  
>  On the bottom are the two speakers towards the front and an exhaust grille near the center. The four rubber feet are rather plastic feeling, which allows the laptop to slide around on a desk a bit too much for my liking. I wish they were a bit softer to be stickier.  
>  Charging can be done via either of the two USB-C ports on the left, though I wish more vendors would do as Google did on the Chromebook Pixel and provide a port on both sides. This makes it much more convenient to charge when not at one's desk, rather than having to route a cable around to one specific side. The X1 Carbon includes a 65W USB-C PD with a fixed USB-C cable and removable country-specific power cable, which is not very convenient due to its large footprint. I am using an Apple 61W USB-C charger and an Anker cable which charge the X1 fine (unlike HP laptops which only work with HP USB-C chargers).  
>  Wireless connectivity is provided by a removable Intel 8265 802.11a/b/g/n/ac WiFi and Bluetooth 4.1 card. An Intel I219-V chip provides ethernet connectivity and requires an external dongle for the physical cable connection.  
>  The screen hinge is rather tight, making it difficult to open with one hand. The tradeoff is that the screen does not wobble in the least bit when typing.  
>  The fan is silent at idle, and there is no coil whine even under heavy load. During a make -j4 build, the fan noise is reasonable and medium-pitched, rather than a high-pitched whine like on some laptops. The palm rest and keyboard area remain cool during high CPU utilization.  
>  The full-sized keyboard is backlit and offers two levels of adjustment. The keys have a soft surface and a somewhat clicky feel, providing very quiet typing except for certain keys like Enter, Backspace, and Escape. The keyboard has a reported key travel of 1.5mm and there are dedicated Page Up and Page Down keys above the Left and Right arrow keys. Dedicated Home, End, Insert, and Delete keys are along the top row. The Fn key is placed to the left of Control, which some people hate (although Lenovo does provide a BIOS option to swap it), but it's in the same position on Apple keyboards so I'm used to it. However, since there are dedicated Page Up, Page Down, Home, and End keys, I don't really have a use for the Fn key anyway.
>
>

* Firmware

>
>
> The X1 Carbon has a very detailed BIOS/firmware menu which can be entered with the F1 key at boot. F12 can be used to temporarily select a different boot device.  
>  A neat feature of the Lenovo BIOS is that it supports showing a custom boot logo instead of the big red Lenovo logo. From Windows, download the latest BIOS Update Utility for the X1 Carbon (my model was 20HR). Run it and it'll extract everything to C:\\drivers\\flash(some random string). Drop a logo.gif file in that directory and run winuptp.exe. If a logo file is present, it'll ask whether to use it and then write the new BIOS to its staging area, then reboot to actually flash it.
>
>
>
> * OpenBSD support
>
>
>
> Secure Boot has to be disabled in the BIOS menu, and the "CSM Support" option must be enabled, even when "UEFI/Legacy Boot" is left on "UEFI Only". Otherwise the screen will just go black after the OpenBSD kernel loads into memory.
>
>

* Based on this component list, it seems like everything but the fingerprint sensor works fine on OpenBSD. \*\*\*

### [Configuring 5 different desktop environments on FreeBSD](https://www.linuxsecrets.com/en/entry/51-freebsd/2017/09/04/2942-configure-5-freebsd-x-environments) ###

* This fairly quick tutorial over at LinuxSecrets.com is a great start if you are new to FreeBSD, especially if you are coming from Linux and miss your favourite desktop environment
* It just goes to show how easy it is to build the desktop you want on modern FreeBSD
* The tutorial covers: GNOME, KDE, Xfce, Mate, and Cinnamon
* The instructions for each boil down to some variation of:
* Install the desktop environment and a login manager if it is not included: \> sudo pkg install gnome3
* Enable the login manager, and usually dbus and hald: \> sudo sysrc dbus\_enable="YES" hald\_enable="YES" gdm\_enable="YES" gnome\_enable="YES"?
* If using a generic login manager, add the DE startup command to your .xinitrc: \> echo "exec cinnamon" \> \~/.xinitrc
* And that is about it.
* The tutorial goes into more detail on other configuration you can do to get your desktop just the way you like it.
* To install Lumina: \> sudo pkg install lumina pcbsd-utils-qt5
* This will install Lumina and the pcbsd utilities package which includes pcdm, the login manager. In the near future we hear the login manager and some of the other utilities will be split into separate packages, making it easier to use them on vanilla FreeBSD. \> sudo sysrc pcdm\_enable=YES dbus\_enable="YES" hald\_enable="YES"
* Reboot, and you should be greeted with the graphical login screen \*\*\*

### [A return-oriented programming defense from OpenBSD](https://lwn.net/Articles/732201/) ###

* We talked a bit about RETGUARD last week, presenting Theos email announcing the new feature
* Linux Weekly News has a nice breakdown on just how it works

>
>
> Stack-smashing attacks have a long history; they featured, for example, as a core part of the Morris worm back in 1988. Restrictions on executing code on the stack have, to a great extent, put an end to such simple attacks, but that does not mean that stack-smashing attacks are no longer a threat. Return-oriented programming (ROP) has become a common technique for compromising systems via a stack-smashing vulnerability. There are various schemes out there for defeating ROP attacks, but a mechanism called "RETGUARD" that is being implemented in OpenBSD is notable for its relative simplicity.  
>  In a classic stack-smashing attack, the attack code would be written directly to the stack and executed there. Most modern systems do not allow execution of on-stack code, though, so this kind of attack will be ineffective. The stack does affect code execution, though, in that the call chain is stored there; when a function executes a "return" instruction, the address to return to is taken from the stack. An attacker who can overwrite the stack can, thus, force a function to "return" to an arbitrary location.  
>  That alone can be enough to carry out some types of attacks, but ROP adds another level of sophistication. A search through a body of binary code will turn up a great many short sequences of instructions ending in a return instruction. These sequences are termed "gadgets"; a large program contains enough gadgets to carry out almost any desired task  if they can be strung together into a chain. ROP works by locating these gadgets, then building a series of stack frames so that each gadget "returns" to the next.  
>  There is, of course, a significant limitation here: a ROP chain made up of exclusively polymorphic gadgets will still work, since those gadgets were not (intentionally) created by the compiler and do not contain the return-address-mangling code. De Raadt acknowledged this limitation, but said: "we believe once standard-RET is solved those concerns become easier to address separately in the future. In any case a substantial reduction of gadgets is powerful".  
>  Using the compiler to insert the hardening code greatly eases the task of applying RETGUARD to both the OpenBSD kernel and its user-space code. At least, that is true for code written in a high-level language. Any code written in assembly must be changed by hand, though, which is a fair amount of work. De Raadt and company have done that work; he reports that: "We are at the point where userland and base are fully working without regressions, and the remaining impacts are in a few larger ports which directly access the return address (for a variety of reasons)". It can be expected that, once these final issues are dealt with, OpenBSD will ship with this hardening enabled.
>
>

* The article wonders about applying the same to Linux, but notes it would be difficult because the Linux kernel cannot currently be compiled using LLVM

>
>
> If any benchmarks have been run to determine the cost of using RETGUARD, they have not been publicly posted. The extra code will make the kernel a little bigger, and the extra overhead on every function is likely to add up in the end. But if this technique can make the kernel that much harder to exploit, it may well justify the extra execution overhead that it brings with it. All that's needed is somebody to actually do the work and try it out.
>
>
> ---
>

### [Videos from BSDCan have started to appear!](https://www.youtube.com/playlist?list=PLeF8ZihVdpFfVEsCxNWGDmcATJfRZacHv) ###

* [Henning Brauer: tcp synfloods - BSDCan 2017](https://www.youtube.com/watch?v=KuHepyI0_KY)
* [Benno Rice: The Trouble with FreeBSD - BSDCan 2017](https://www.youtube.com/watch?v=1DM5SwoXWSU)
* [Li-Wen Hsu: Continuous Integration of The FreeBSD Project - BSDCan 2017](https://www.youtube.com/watch?v=SCLfKWaUGa8)
* [Andrew Turner: GENERIC ARM - BSDCan 2017](https://www.youtube.com/watch?v=gkYjvrFvPJ0)
* [Bjoern A. Zeeb: From the outside - BSDCan 2017](https://www.youtube.com/watch?v=sYmW_H6FrWo)
* [Rodney W. Grimes: FreeBSD as a Service - BSDCan 2017](https://www.youtube.com/watch?v=Zf9tDJhoVbA)
* [Reyk Floeter: The OpenBSD virtual machine daemon - BSDCan 2017](https://www.youtube.com/watch?v=Os9L_sOiTH0)
* [Brian Kidney: The Realities of DTrace on FreeBSD - BSDCan 2017](https://www.youtube.com/watch?v=NMUf6VGK2fI)
* The rest will continue to trickle out, likely not until after EuroBSDCon \*\*\*

Beastie Bits
----------

* [Oracle has killed sun](https://meshedinsights.com/2017/09/03/oracle-finally-killed-sun/)
* [Configure Thunderbird to send patch friendly](http://nanxiao.me/en/configure-thunderbird-to-send-patch-friendly/)
* [FreeBSD 10.4-BETA4 Available](https://www.freebsd.org/news/newsflash.html#event20170909:01)
* [iXsystems looking to hire kernel and zfs developers (especially Sun/Oracle Refugees)](https://www.facebook.com/ixsystems/posts/10155403417921508)
* [Speaking of job postings, UnitedBSD.com has few job postings related to BSD](https://unitedbsd.com/)

Call for papers
----------

* [USENIX FAST 18 - February 12-15, 2018, Due: September 28 2017](https://www.freebsdfoundation.org/news-and-events/call-for-papers/usenix-fast-18-call-for-papers/)
* [Scale 16x - March 8-11, 2018, Due: October 31, 2017 ](https://www.freebsdfoundation.org/news-and-events/call-for-papers/scale-16x-call-for-participation/)
* [FOSDEM 18 - February 3-4, 2018, Due: November 3 2017 ](https://www.freebsdfoundation.org/news-and-events/call-for-papers/fosdem-18-call-for-participation/)

---

Feedback/Questions
----------

* [Jason asks about cheap router hardware](http://dpaste.com/340KRHG)
* [Prashant asks about latest kernels with freebsd-update](http://dpaste.com/2J7DQQ6)
* [Matt wants know about VM Performance & CPU Steal Time](http://dpaste.com/1H5SZ81)
* [John has config questions regarding Dell precision 7720, FreeBSD, NVME, and ZFS](http://dpaste.com/0X770SY) \*\*\*