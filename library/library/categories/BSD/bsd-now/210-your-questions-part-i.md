+++
title = "210: Your questions, part I"
description = "In this episode, we take a look at the reimplementation of NetBSD using a Microkernel, check out what makes DHCP faster, and see what high-process count support for DragonflyBSD has to offer, and we answer the questions you’ve always wanted to ask us.This episode was brought to y"
date = "2017-09-06T12:00:00Z"
url = "https://www.bsdnow.tv/210"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.855308190Z"
seen = true
+++

In this episode, we take a look at the reimplementation of NetBSD using a Microkernel, check out what makes DHCP faster, and see what high-process count support for DragonflyBSD has to offer, and we answer the questions you’ve always wanted to ask us.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [A Reimplementation Of Netbsd Using a Microkernel](http://theembeddedboard.review/a-reimplementation-of-netbsd-using-a-microkernel-part-1-of-2/) ###

* Minix author Andy Tanenbaum writes in [Part 1 of a-reimplementation-of-netbsd-using-a-microkernel](http://theembeddedboard.review/a-reimplementation-of-netbsd-using-a-microkernel-part-1-of-2/)

>
>
> Based on the MINIX 3 microkernel, we have constructed a system that to the user looks a great deal like NetBSD. It uses pkgsrc, NetBSD headers and libraries, and passes over 80% of the KYUA tests). However, inside, the system is completely different. At the bottom is a small (about 13,000 lines of code) microkernel that handles interrupts, message passing, low-level scheduling, and hardware related details. Nearly all of the actual operating system, including memory management, the file system(s), paging, and all the device drivers run as user-mode processes protected by the MMU. As a consequence, failures or security issues in one component cannot spread to other ones. In some cases a failed component can be replaced automatically and on the fly, while the system is running, and without user processes noticing it. The talk will discuss the history, goals, technology, and status of the project.  
>  Research at the Vrije Universiteit has resulted in a reimplementation of NetBSD using a microkernel instead of the traditional monolithic kernel. To the user, the system looks a great deal like NetBSD (it passes over 80% of the KYUA tests). However, inside, the system is completely different. At the bottom is a small (about 13,000 lines of code) microkernel that handles interrupts, message passing, low-level scheduling, and hardware related details. Nearly all of the actual operating system, including memory management, the file system(s), paging, and all the device drivers run as user-mode processes protected by the MMU. As a consequence, failures or security issues in one component cannot spread to other ones. In some cases a failed component can be replaced automatically and on the fly, while the system is running.  
>  The latest work has been adding live update, making it possible to upgrade to a new version of the operating system WITHOUT a reboot and without running processes even noticing. No other operating system can do this.  
>  The system is built on MINIX 3, a derivative of the original MINIX system, which was intended for education. However, after the original author, Andrew Tanenbaum, received a 2 million euro grant from the Royal Netherlands Academy of Arts and Sciences and a 2.5 million euro grant from the European Research Council, the focus changed to building a highly reliable, secure, fault tolerant operating system, with an emphasis on embedded systems. The code is open source and can be downloaded from [www.minix3.org](http://www.minix3.org). It runs on the x86 and ARM Cortex V8 (e.g., BeagleBones). Since 2007, the Website has been visited over 3 million times and the bootable image file has been downloaded over 600,000 times. The talk will discuss the history, goals, technology, and status of the project.
>
>

* [Part 2](http://theembeddedboard.review/a-reimplementation-of-netbsd-using-a-microkernel-part-2-of-2/) is also available. \*\*\*

### [Rapid DHCP: Or, how do Macs get on the network so fast?](https://cafbit.com/post/rapid_dhcp_or_how_do/) ###

* One of life's minor annoyances is having to wait on my devices to connect to the network after I wake them from sleep. All too often, I'll open the lid on my EeePC netbook, enter a web address, and get the dreaded "This webpage is not available" message because the machine is still working on connecting to my Wi-Fi network. On some occasions, I have to twiddle my thumbs for as long as 10-15 seconds before the network is ready to be used. The frustrating thing is that I know it doesn't have to be this way. I know this because I have a Mac. When I open the lid of my MacBook Pro, it connects to the network nearly instantaneously. In fact, no matter how fast I am, the network comes up before I can even try to load a web page. My curiosity got the better of me, and I set out to investigate how Macs are able to connect to the network so quickly, and how the network connect time in other operating systems could be improved.

>
>
> I figure there are three main categories of time-consuming activities that occur during network initialization:  
>  Link establishment. This is the activity of establishing communication with the network's link layer. In the case of Wi-Fi, the radio must be powered on, the access point detected, and the optional encryption layer (e.g. WPA) established. After link establishment, the device is able to send and receive Ethernet frames on the network.  
>  Dynamic Host Configuration Protocol (DHCP). Through DHCP handshaking, the device negotiates an IP address for its use on the local IP network. A DHCP server is responsible for managing the IP addresses available for use on the network.  
>  Miscellaneous overhead. The operating system may perform any number of mundane tasks during the process of network initialization, including running scripts, looking up preconfigured network settings in a local database, launching programs, etc.  
>  My investigation thus far is primarily concerned with the DHCP phase, although the other two categories would be interesting to study in the future. I set up a packet capture environment with a spare wireless access point, and observed the network activity of a number of devices as they initialized their network connection. For a worst-case scenario, let's look at the network activity captured while an Android tablet is connecting:  
>  This tablet, presumably in the interest of "optimization", is initially skipping the DHCP discovery phase and immediately requesting its previous IP address. The only problem is this is a different network, so the DHCP server ignores these requests. After about 4.5 seconds, the tablet stubbornly tries again to request its old IP address. After another 4.5 seconds, it resigns itself to starting from scratch, and performs the DHCP discovery needed to obtain an IP address on the new network.  
>  In all fairness, this delay wouldn't be so bad if the device was connecting to the same network as it was previously using. However, notice that the tablet waits a full 1.13 seconds after link establishment to even think about starting the DHCP process. Engineering snappiness usually means finding lots of small opportunities to save a few milliseconds here and there, and someone definitely dropped the ball here.  
>  In contrast, let's look at the packet dump from the machine with the lightning-fast network initialization, and see if we can uncover the magic that is happening under the hood:  
>  The key to understanding the magic is the first three unicast ARP requests. It looks like Mac OS remembers certain information about not only the last connected network, but the last several networks. In particular, it must at least persist the following tuple for each of these networks:  
>  \> 1. The Ethernet address of the DHCP server  
>  \> 2. The IP address of the DHCP server  
>  \> 3. Its own IP address, as assigned by the DHCP server  
>  During network initialization, the Mac transmits carefully crafted unicast ARP requests with this stored information. For each network in its memory, it attempts to send a request to the specific Ethernet address of the DHCP server for that network, in which it asks about the server's IP address, and requests that the server reply to the IP address which the Mac was formerly using on that network. Unless network hosts have been radically shuffled around, at most only one of these ARP requests will result in a response—the request corresponding to the current network, if the current network happens to be one of the remembered networks.  
>  This network recognition technique allows the Mac to very rapidly discover if it is connected to a known network. If the network is recognized (and presumably if the Mac knows that the DHCP lease is still active), it immediately and presumptuously configures its IP interface with the address it knows is good for this network. (Well, it does perform a self-ARP for good measure, but doesn't seem to wait more than 13ms for a response.) The DHCP handshaking process begins in the background by sending a DHCP request for its assumed IP address, but the network interface is available for use during the handshaking process. If the network was not recognized, I assume the Mac would know to begin the DHCP discovery phase, instead of sending blind requests for a former IP address as the Galaxy Tab does.  
>  The Mac's rapid network initialization can be credited to more than just the network recognition scheme. Judging by the use of ARP (which can be problematic to deal with in user-space) and the unusually regular transmission intervals (a reliable 1.0ms delay between each packet sent), I'm guessing that the Mac's DHCP client system is entirely implemented as tight kernel-mode code. The Mac began the IP interface initialization process a mere 10ms after link establishment, which is far faster than any other device I tested. Android devices such as the Galaxy Tab rely on the user-mode dhclient system (part of the dhcpcd package) dhcpcd program, which no doubt brings a lot of additional overhead such as loading the program, context switching, and perhaps even running scripts.  
>  The next step for some daring kernel hacker is to implement a similarly aggressive DHCP client system in the Linux kernel, so that I can enjoy fast sign-on speeds on my Android tablet, Android phone, and Ubuntu netbook. There already exists a minimal DHCP client implementation in the Linux kernel, but it lacks certain features such as configuring the DNS nameservers. Perhaps it wouldn't be too much work to extend this code to support network recognition and interface with a user-mode daemon to handle such auxillary configuration information received via DHCP. If I ever get a few spare cycles, maybe I'll even take a stab at it.
>
>

* You can also find other ways of optimizing the dhclient program and how it works in the [dhclient tutorial on Calomel.org](https://calomel.org/dhclient.html). \*\*\*

### [BSDCam Trip Report](https://www.freebsdfoundation.org/blog/bsdcam-2017-trip-report-michael-lucas/) ###

>
>
> Over the decades, FreeBSD development and coordination has shifted from being purely on-line to involving more and more in-person coordination and cooperation. The FreeBSD Foundation sponsors a devsummit right before BSDCan, EuroBSDCon, and AsiaBSDCon, so that developers traveling to the con can leverage their airfare and hammer out some problems. Yes, the Internet is great for coordination, but nothing beats a group of developers spending ten minutes together to sketch on a whiteboard and figuring out exactly how to make something bulletproof.  
>  In addition to the coordination efforts, though, conference devsummits are hierarchical. There’s a rigid schedule, with topics decided in advance. Someone leads the session. Sessions can be highly informative, passionate arguments, or anything in between.  
>  BSDCam is… a little different. It’s an invaluable part of the FreeBSD ecosystem. However, it’s something that I wouldn’t normally attend.  
>  But right now, is not normal. I’m writing a new edition of Absolute FreeBSD. To my astonishment, people have come to rely on this book when planning their deployments and operations. While I find this satisfying, it also increases the pressure on me to get things correct. When I wrote my first FreeBSD book back in 2000, a dozen mailing lists provided authoritative information on FreeBSD development. One person could read every one of those lists. Today, that’s not possible—and the mailing lists are only one narrow aspect of the FreeBSD social system.  
>  Don’t get me wrong—it’s pretty easy to find out what people are doing and how the system works. But it’s not that easy to find out what people will be doing and how the system will work. If this book is going to be future-proof, I needed to leave my cozy nest and venture into the wilds of Cambridge, England. Sadly, the BSDCam chair agreed with my logic, so I boarded an aluminum deathtrap—sorry, a “commercial airliner”—and found myself hurtled from Detroit to Heathrow.  
>  And one Wednesday morning, I made it to the William Gates building of Cambridge University, consciousness nailed to my body by a thankfully infinite stream of proper British tea.  
>  BSDCam attendance is invitation only, and the facilities can only handle fifty folks or so. You need to be actively working on FreeBSD to wrangle an invite. Developers attend from all over the world. Yet, there’s no agenda. Robert Watson is the chair, but he doesn’t decide on the conference topics. He goes around the room and asks everyone to introduce themselves, say what they’re working on, and declare what they want to discuss during the conference. The topics of interest are tallied. The most popular topics get assigned time slots and one of the two big rooms. Folks interested in less popular topics are invited to claim one of the small breakout rooms.  
>  Then the real fun begins. I started by eavesdropping in the virtualization workshop. For two hours, people discussed FreeBSD’s virtualization needs, strengths, and weaknesses. What needs help? What should this interface look like? What compatibility is important, and what isn’t? By the end of the session, the couple dozen people had developed a reasonable consensus and, most importantly, some folks had added items to their to-do lists.  
>  Repeat for a dozen more topics. I got a good grip on what’s really happening with security mitigation techniques, FreeBSD’s cloud support, TCP/IP improvements, advances in teaching FreeBSD, and more. A BSDCan devsummit presentation on packaging the base system is informative, but eavesdropping on two dozen highly educated engineers arguing about how to nail down the final tidbits needed to make that a real thing is far more educational.  
>  To my surprise, I was able to provide useful feedback for some sessions. I speak at a lot of events outside of the FreeBSD world, and was able to share much of what I hear at Linux conferences. A tool that works well for an experienced developer doesn’t necessarily work well for everyone.  
>  Every year, I leave BSDCan tired. I left BSDCam entirely exhausted. These intense, focused discussions stretched my brain.  
>  But, I have a really good idea where key parts of FreeBSD development are actually headed. This should help future-proof the new Absolute FreeBSD, as much as any computer book can be future-proof.  
>  Plus, BSDCam throws the most glorious conference dinner I’ve ever seen.  
>  I want to thank Robert Watson for his kind invitation, and the FreeBSD Foundation for helping defray the cost of this trip
>
>
> ---
>

Interview - The BSDNow Crew
----------

* As a kid, what did you dream of to become as an adult?

>
>
> JT: An Astronaut  
>  BR: I wanted to be a private detective, because of all the crime novels that I read back  
>  then. I didn’t get far with it. However, I think the structured analysis skills (who did what, when, and such) help me in debugging and sysadmin work.  
>  AJ: Didn’t think about it much
>
>

* How do you manage to stay organized day to day with so much things you're actively doing each day? (Day job, wife/girlfriend, conferences, hobbies, friends, etc.)

>
>
> JT: Who said I was organized?  
>  BR: A lot of stuff in my calendar as reminders, open browser tabs as “to read later” list. A few things like task switching when getting stuck helps. Also, focus on a single goal for the day, even though there will be distractions. Slowly, but steadily chip away at the things you’re working on. Rather than to procrastinate and put things back to review later, get started early with easy things for a big task and then tackle the hard part. Often, things look totally chaotic and unmanageable, until you start working on them.   
>  AJ: I barely manage. Lots of Google Calendar reminders, and the entire wall of my office is covered in whiteboard sheet todo lists. I use pinboard.in to deal with finding and organizing bookmarks. Write things down, don’t trust your memory.
>
>

* What hobbies outside of IT do you have?

>
>
> JT: I love photography, but I do that Professional part time, so I’m not sure if that counts as a hobby anymore. I guess it’d have to be working in the garage on my cars.  
>  BR: I do Tai Chi to relax once a week in a group, but can also do it alone, pretty much everywhere. Way too much Youtube watching and browsing the web. I did play some games before studying at the university and I’m still proud that I could control it to the bare minimum not to impact my studies. A few “lapses” from time to time, revisiting the old classics since the newer stuff won’t run on my machines anyway. Holiday time is pretty much spent for BSD conferences and events, this is where I can relax and talk with like-minded people from around the world, which is fascinating. Plus, it gets me to various places and countries I never would have dared to visit on my own.  
>  AJ: I play a few video games, and I like to ski, although I don’t go very often as most of my vacation time is spent hanging out with my BSD friends at various conferences
>
>

* How do you relax?

>
>
> JT: What is this word ‘relax’ and what does it mean?  
>  BR: My Tai Chi plays a big part in it I guess. I really calms you and the constant stream of thoughts for a while. It also gives you better clarity of what’s important in life. Watching movies, sleeping long.  
>  AJ: Usually watching TV or Movies. Although I have taken to doing most of my TV watching on my exercise bike now, but it is still mentally relaxing
>
>

* If FreeBSD didn't exist, which BSD flavour would you use? Why?

>
>
> JT: I use TrueOS, but if FreeBSD didn’t exist, that project might not either… so… My other choice would be HardenedBSD, but since it’s also based on FreeBSD I’m in the same dillema.  
>   
>  BR: I once installed NetBSD to see what It can do. If FreeBSD wouldn’t exist, I would probably try my luck with it. OpenBSD is also appealing, but I’ve never installed it.  
>  AJ: When I started using FreeBSD in 2000, the only other BSD I had heard of at the time was OpenBSD. If FreeBSD wasn’t around, I don’t think the world would look like it does, so it is hard to speculate.
>
>

* If any of the BSD's weren't around and you had to use Linux, which camp would belong to? (Redhat, SUSE, Debian, Ubuntu, Gentoo?)

>
>
> JT: I learned Linux in the mid 90s using Slackware, which I used consistently up until the mid 2000s, when I joined the PuppyLinux community and eventually became a developer (FYI, Puppy was/is/can be based on Slackware -- its complicated). So I’d go back to using either Slackware or PuppyLinux.  
>  BR: I tried various Linux distributions until I landed at Debian. I used is pretty extensively as my desktop OS at home, building custom kernels and packages to install them until I discovered FreeBSD. I ran both side by side for a few months for learning until one day I figured out that I had not booted Debian in a while, so I switched completely.   
>  AJ: The first Linux I played with was Slackware, and it is the most BSD like, but the bits of Linux I learned in school were Redhat and so I can somewhat wrap my head around it, although now that they are changing everything to systemd, all of that old knowledge is more harmful than useful.
>
>

* Are you still finding yourself in need to use Windows/Mac OS? Why?

>
>
> JT: I work part time as a professional Photographer, so I do use Windows for my photography work. While I can do everything I need to do in Linux, it comes down to being pragmatic about my time. What takes me several hours to accomplish in Linux I can accomplish in 20 minutes on Windows.  
>  BR: I was a long time Windows-only user before my Unix days. But back when Vista was about to come out and I needed a new laptop, my choice was basically learning to cope with Vistas awful features or learn MacOS X. I did the latter, it increased my productivity since it’s really a good Unix desktop experience (at least, back then). I only have to use Windows at work from time to time as I manage our Windows Terminal server, which keeps the exposure low enough and I only connect to it to use a certain app not available for the Mac or the BSDs.  
>  AJ: I still use Windows to play games, for a lot of video conferencing, and to produce BSD Now. Some of it could be done on BSD but not as easily. I have promised myself that I will switch to 100% BSD rather than upgrade to Windows 10, so we’ll see how that goes.
>
>

* Please describe your home networking setup. Router type, router OS, router hardware, network segmentation, wifi apparatus(es), other devices connected, and anything else that might be interesting about your home network.

>
>
> BR: Very simple and boring: Apple Airport Express base station and an AVM FritzBox for DNS, DHCP, and the link to my provider. A long network cable to my desktop machine. That I use less and less often. I just bought an RPI 3 for some home use in the future to replace it. Mostly my brother’s and my Macbook Pro’s are connected, our phones and the iPad of my mother.
>
>
>
> AJ: I have a E3-1220 v3 (dual 3.1ghz + HT) with 8 GB of ram, and 4x Intel gigabit server NICs as my router, and it runs vanilla FreeBSD (usually some snapshot of -current). I have 4 different VLANs, Home, Office, DMZ, and Guest WiFi. WiFi is served via a tiny USB powered device I bought in Tokyo years ago, it serves 3 different SSIDs, one for each VLAN except the DMZ. There are ethernet jacks in every room wired for 10 gigabit, although the only machines with 10 gigabit are my main workstation, file server, and some machines in the server rack. There are 3 switches, one for the house (in the laundry room), one for the rack, and one for 10gig stuff. There is a rack in the basement spare bedroom, it has 7 servers in it, mostly storage for live replicas of customer data for my company.
>
>

* How do guys manage to get your work done on FreeBSD desktops? What do you do when you need to a Linux or Windows app that isn't ported, or working? I've made several attempts to switch to FreeBSD, but each attempt failed because of tools not being available (e.g. Zoom, Dropbox, TeamViewer, Crashplan) or broken (e.g. VirtualBox).

>
>
> BR: I use VIrtualBox for everything that is not natively available or Windows-only. Unfortunately, that means no modern games. I mostly do work in the shell when I’m on FreeBSD and when it has to be a graphical application, then I use Fluxbox as the DE. I want to get work done, not look at fancy eye-candy that get’s boring after a while. Deactivated the same stuff on my mac due to the same reason. I look for alternative software online, but my needs are relatively easy to satisfy as I’m not doing video editing/rendering and such.
>
>
>
> AJ: I generally find that I don’t need these apps. I use Firefox, Thunderbird, OpenSSH, Quassel, KomodoEdit, and a few other apps, so my needs are not very demanding. It is annoying when packages are broken, but I usually work around this with boot environments, and being able to just roll back to a version that worked for a few days until the problem is solved. I do still have access to a windows machine for the odd time I need specific VPN software or access to Dell/HP etc out-of-band management tools.
>
>

* Which desktop environments are your favorite, and why? For example, I like i3, Xfce, and I'm drawn to Lumina's ethos, but so far always seem to end up back on Xfc because of its ease of use, flexibility, and dashing good looks.

>
>
> JT: As a Lumina Desktop developer, I think my preference is obvious. ;) I am also a long   
>  timeOpenBox user, so I have a soft place in my heart for that as well.
>
>
>
> BR: I use Fluxbox when I need to work with a lot of windows or an application demands X11. KDE and others are too memory heavy for me and I rarely use even 20% of the features they provide.  
>  AJ: I was a long time KDE user, but I have adopted Lumina. I find it fast, and that it gets out of my way and lets me do what I want. It had some annoyances early on, but I’ve nagged the developers into making it work for me.
>
>

* Which command-line shells do you prefer, why, and how (if at all) have you customised the environment or prompt?

>
>
> BR: I use zsh, but without all the fancy stuff you can find online. It might make you more productive, yes. But again, I try to keep things simple. I’m slowly learning tmux and want to work more in it in the future. I sometimes look at other BSD people’s laptops and am amazed at what they do with window-management in tmux. My prompt looks like this:
>
>
>
> ```
> bcr@Voyager:~>                             20:20 17-08-17
> Put this in your .zshrc to get the same result:
> PROMPT='%n@%m:%~>'
> RPROMPT='%T %D'
>
> ```
>
>
>
> AJ: I started using tcsh early on, because it was the shell on the first box I had access to, and because one of the first things I read in “BSD Hacks” was how to enable ‘typo correction”, which made my life a lot better especially on dial up in the early days. My shell prompt looks like this: allan@CA-TOR1-02:/usr/home/allan%
>
>

* What is one thing (or more) missing in FreeBSD you would import from another project or community? Could be tech, process, etc.

>
>
> JT: AUFS from Linux
>
>
>
> BR: Nohup from Illumos where you can detach an already running process and put it in the background. I often forget that and I’m not in tmux when that happens, so I can see myself use that feature a lot.
>
>
>
> AJ: Zones (more complete Jails) from IllumOS
>
>

* how do you manage your time to learn about and work on FreeBSD? Does your work/employment enable what you do, or are your contributions mainly done in private time?

>
>
> JT: These days I’m mostly learning things I need for work, so it just falls into something I’m doing while working on work projects.
>
>
>
> BR: We have a lot of time during the semester holidays to learn on our own, it’s part of the idea of being in a university to keep yourself updated, at least for me. Especially in the fast moving world of IT. I also read a lot in my free time. My interests can shift sometimes, but then I devour everything I can find on the topic. Can be a bit excessive, but has gotten me where I am now and I still need a lot to learn (and want to). Since I work with FreeBSD at work (my owndoing), I can try out many things there.
>
>
>
> AJ: My work means a spend a lot of time working with FreeBSD, but not that much time working ON it. My contributions are mostly done outside of work, but as I own the company I do get more flexibility to take time off for conferences and other FreeBSD related stuff.
>
>

* we know we can bribe Michael W Lucas with gelato (*good* gelato that is), but what can we use to bribe *you* guys? Like when I want to have Allan to work on fixing a bug which prevents me from running ZFS on this fancy rock64 board?

>
>
> BR: Desserts of various kinds.
>
>
>
> AJ: I am probably not the right person to look at your rock64 board. Most people in the project have taken to bribing me with chocolate. In general, my todo list is so long, the best way is a trade, you take this task and I’ll take that task.
>
>

* Is your daily mobile device iOS, Android, Windows Mobile, or other? Why?

>
>
> JT: These days I’m using Android on my Blackberry Priv, but until recently I was still a heavy user of Sailfish OS. I would use SailfishOS everyday, if I could find a phone with a keyboard that I could run it on.
>
>
>
> BR: iOS on the iPhone 7 currently. Never used an Android phone, saw it on other people’s devices and what they can do with it (much more). But the infrequent security updates (if any at all) keep me away from it.
>
>
>
> AJ: I have a Google Nexus 6 (Android 7.1). I wanted the ‘pure’ Android experience, and I had been happy with my previous Nexus S. I don’t run a custom OS/ROM or anything because I use the phone to verify that video streams work on an ‘average users device’. I am displeased that support for my device will end soon. I am not sure what device I will get next, but it definitely won’t be an iPhone.
>
>
> ---
>

News Roundup
----------

### [Beta Update - Request for (more) Testing](http://undeadly.org/cgi?action=article&sid=20170808065718&mode=flat&count=30) ###

* [https://beta.undeadly.org/](https://beta.undeadly.org/) has received an update. The most significant changes include:

>
>
> The site has been given a less antiquated "look". (As the topic icons have been eliminated, we are no longer seeking help with those graphics.)  
>  The site now uses a moderate amount of semantic HTML5.  
>  Several bugs in the HTML fragment validator (used for submissions and comments) have been fixed.  
>  To avoid generating invalid HTML, submission content which fails validation is no longer displayed in submission/comment previews.  
>  Plain text submissions are converted to HTML in a more useful fashion. (Instead of just converting each EOL to   
> , the converter now generates proper paragraphs and interprets two or more consecutive EOLs as indicating a paragraph break.)
>
>

* The redevelopment remains a work-in-progress. Many thanks to those who have contributed!

>
>
> As before, constructive feedback would be appreciated. Of particular interest are reports of bugs in behaviour (for example, in the HTML validator or in authentication) that would preclude the adoption of the current code for the main site.
>
>
> ---
>

### [High-process-count support added to master](http://lists.dragonflybsd.org/pipermail/users/2017-August/313552.html) ###

>
>
> We've fixed a number of bottlenecks that can develop when the number of user processes runs into the tens of thousands or higher. One thing led to another and I said to myself, "gee, we have a 6-digit PID, might as well make it work to a million!". With the commits made today, master can support at least 900,000 processes with just a kern.maxproc setting in  
>  /boot/loader.conf, assuming the machine has the memory to handle it.  
>  And, in fact, as today's machines start to ratchet up there in both memory capacity and core count, with fast storage (NVMe) and fast networking (10GigE and higher), even in consumer boxes, this is actually something that one might want to do. With AMD's threadripper and EPYC chips now out, the Intel\<-\>AMD cpu wars are back on! Boasting up to 32 cores (64 threads) per socket and two sockets on EPYC, terabytes of ram, and motherboards with dual 10GigE built-in, the reality is that these numbers are already achievable in a useful manner.  
>  In anycase, I've tested these changes on a dual-socket xeon. I can in-fact start 900,000 processes. They don't get a whole lot of cpu and running 'ps' would be painful, but it works and the system is still responsive from the shell with all of that going on.  
>  xeon126# uptime  
>  1:42PM up 9 mins, 3 users, load averages: 890407.00, 549381.40, 254199.55  
>  In fact, judging from the memory use, these minimal test processes only eat around 60KB each. 900,000 of them ate only 55GB on a 128GB machine. So even a million processes is not out of the question, depending on the cpu requirements for those processes. Today's modern machines can be stuffed with enormous amounts of memory.  
>  Of course, our PIDs are currently limited to 6 digits, so a million is kinda the upper limit in terms of discrete user processes (verses pthreads which are less restricted). I'd rather not go to 7 digits (yet).
>
>
> ---
>

### [CFT: Driver for generic MS Windows 7/8/10 - compatible USB HID multi-touch touchscreens](https://lists.freebsd.org/pipermail/freebsd-current/2017-August/066783.html) ###

* Following patch [1] adds support for generic MS Windows 7/8/10 - compatible USB HID multi-touch touchscreens via evdev protocol. It is intended to be a native replacement of hid-multitouch.c driver found in Linux distributions and multimedia/webcamd port.
* Patch is made for 12-CURRENT and most probably can be applied to recent 11-STABLE and 11.1-RELEASE (not tested)
* How to test"

```
1. Apply patch [1]
2. To compile this driver into the kernel, place the following lines
into your kernel configuration file:
       device wmt
       device usb
       device evdev
    Alternatively, to load the driver as a module at boot time, place the
following line in loader.conf(5):
       wmt_load="YES"
3. Install x11-drivers/xf86-input-evdev or
x11-drivers/xf86-input-libinput port
4. Tell XOrg to use evdev or libinput driver for the device:

```

```
Section "ServerLayout"
     InputDevice    "TouchScreen0" "SendCoreEvents"
EndSection

Section "InputDevice"
     Identifier  "TouchScreen0"
     Driver      "evdev"
&#35;   Driver      "libinput"
     Option      "Device" "/dev/input/eventXXX"
EndSection

```

* Exact value of "/dev/input/eventXXX" can be obtained with evemu-record utility from devel/evemu.
* Note1: Currently, driver does not support pens or touchpads.
* Note2: wmt.ko should be kld-loaded before uhid driver to take precedence over it! Otherwise uhid can be kld-unloaded after loading of wmt.
* wmt review: [https://reviews.freebsd.org/D12017](https://reviews.freebsd.org/D12017)
* Raw diff: [https://reviews.freebsd.org/D12017.diff](https://reviews.freebsd.org/D12017.diff) \*\*\*

Beastie Bits
----------

* [BSDMag Programing Languages Infographic](https://bsdmag.org/programm_history/)
* [t2k17 Hackathon Report: Bob Beck on buffer cache tweaks, libressl and pledge progress](http://undeadly.org/cgi?action=article&sid=20170815171854)
* [New FreeBSD Journal](https://www.freebsdfoundation.org/past-issues/resource-control/)
* [NetBSD machines at Open Source Conference 2017 Kyoto](http://mail-index.netbsd.org/netbsd-advocacy/2017/08/10/msg000744.html) \*\*\*

Feedback/Questions
----------

* [Dan - HDD question](http://dpaste.com/3H6TDJV)
* [Benjamin - scrub of death](http://dpaste.com/10F086V)
* [Jason - Router Opinion](http://dpaste.com/2D9102K)
* [Sohrab - Thanks](http://dpaste.com/1XYYTWF) \*\*\*