+++
title = "191: I Know 64 & A Bunch More"
description = "We cover TrueOS/Lumina working to be less dependent on Linux, How the IllumOS network stack works, Throttling the password gropers & the 64 bit inode call for testing.This episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Open Source](/image"
date = "2017-04-26T12:00:00Z"
url = "https://www.bsdnow.tv/191"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.904962752Z"
seen = true
+++

We cover TrueOS/Lumina working to be less dependent on Linux, How the IllumOS network stack works, Throttling the password gropers & the 64 bit inode call for testing.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [vBSDCon CFP closed April 29th](https://easychair.org/conferences/?conf=vbsdcon2017) ###

### [EuroBSDCon CFP closes April 30th](https://2017.eurobsdcon.org/2017/03/13/call-for-proposals/) ###

### [Developer Commentary: Philosophy, Evolution of TrueOS/Lumina, and Other Thoughts.](https://www.trueos.org/blog/developer-commentary-philosophy-evolution-trueoslumina-thoughts/) ###

* Philosophy of Development
  * No project is an island. Every single project needs or uses some other external utility, library, communications format, standards compliance, and more in order to be useful.
  * A static project is typically a dead project. A project needs regular upkeep and maintenance to ensure it continues to build and run with the current ecosystem of libraries and utilities, even if the project has no considerable changes to the code base or feature set. Upstream decisions can have drastic consequences on your project.
  * Through no fault of yours, your project can be rendered obsolete or broken by changing standards in the global ecosystem that affect your projects dependencies.

* Operating system focus is key. What OS is the project originally designed for? This determines how the upstream dependencies list appears and which heartbeat to monitor.

* Evolution of PC-BSD, Lumina, and TrueOS. With these principles in mind  let's look at PC-BSD, Lumina, and TrueOS.

  * PC-BSD : PC-BSD was largely designed around KDE on FreeBSD. KDE/Plasma5 has been available for Linux OSs for well over a year, but is still not generally available on FreeBSD. It is still tucked away in the experimental area51 repository where people are trying to get it working first.
  * Lumina : As a developer with PC-BSD for a long time, and a tester from nearly the beginning of the project, I was keenly aware the winds of change were blowing in the open-source ecosystem.
  * TrueOS : All of these ecosystem changes finally came to a head for us near the beginning of 2016. KDE4 was starting to deteriorate underneath us, and the FreeBSD Release branch would never allow us to compete with the rate of graphics driver or standards changes coming out of the Linux camp.

* The Rename and Next Steps

>
>
> With all of these changes and the lack of a clear upgrade path from PC-BSD to the new systems, we decided it was necessary to change the project itself (name and all). To us, this was the only way to ensure people were aware of the differences, and that TrueOS really is a different kind of project from PC-BSD. Note this was not a hostile takeover of the PC-BSD project by rabid FreeBSD fanatics. This was more a refocusing of the PC-BSD project into something that could ensure longevity and reliability for the foreseeable future.
>
>

>  Does TrueOS have bugs and issues? Of course! That is the nature of rolling with upstream changes all the time. Not only do you always get the latest version of something (a good thing), you also find yourself on the front line for finding and reporting bugs in those same applications (a bad thing if you like consistency or stability). What you are also seeing is just how much churn happens in the open-source ecosystem at any given time. We are devoted to providing our users (and ourselves  dont forget we use TrueOS every day too!) a stable, reliable, and secure experience. Please be patient as we continue striving toward this goal in the best way possible, not just doing what works for the moment, but the projects future too.

---

### [Robert Mustacchi: Excerpts from The Soft Ring Cycle #1](https://www.youtube.com/watch?v=vnD10WQ2930) ###

* The author of the Turtles on the Wire post we featured the other week, is back with a video.
* Joyent has started a new series of lunchtime technical discussions to share information as they grow their engineering team
* This video focuses on the network stack, how it works, and how it relates to virtualization and multi-tenancy
* Basically, how the network stack on IllumOS works when you have virtual tenants, be they virtual machines or zones
* The video describes the many layers of the network stack, how they work together, and how they can be made to work quickly
* It also talks about the trade-offs between high throughput and low latency
* How security is enforced, so virtual tenants cannot send packets into VLANs they are not members of, or receive traffic that they are not allowed to by the administrator
* How incoming packets are classified, and eventually delivered to the intended destination
* How the system decides if it has enough available resources to process the packet, or if it needs to be dropped
* How interface polling works on IllumOS (a lot different than on FreeBSD)
* Then the last 20 minutes are about how the qemu interface of the KVM hypervisor interfaces with the network stack
* We look forward to seeing more of these videos as they come out \*\*\*

### [Forcing the password gropers through a smaller hole with OpenBSD's PF queues](http://bsdly.blogspot.com/2017/04/forcing-password-gropers-through.html) ###

>
>
> While preparing material for the upcoming [BSDCan PF and networking tutorial](http://www.bsdcan.org/2017/schedule/events/805.en.html), I realized that the pop3 gropers were actually not much fun to watch anymore. So I used the traffic shaping features of my OpenBSD firewall to let the miscreants inflict some pain on themselves. Watching logs became fun again.  
>  The actual useful parts of this article follow - take this as a walkthrough of how to mitigate a wide range of threats and annoyances.  
>  First, analyze the behavior that you want to defend against. In our case that's fairly obvious: We have a service that's getting a volume of unwanted traffic, and looking at our logs the attempts come fairly quickly with a number of repeated attempts from each source address.  
>  I've written about the rapid-fire ssh bruteforce attacks and their mitigation before (and of course it's in The Book of PF) as well as the slower kind where those techniques actually come up short. The traditional approach to ssh bruteforcers has been to simply block their traffic, and the state-tracking features of PF let you set up overload criteria that add the source addresses to the table that holds the addresses you want to block.  
>  For the system that runs our pop3 service, we also have a PF ruleset in place with queues for traffic shaping. For some odd reason that ruleset is fairly close to the HFSC traffic shaper example in The Book of PF, and it contains a queue that I set up mainly as an experiment to annoy spammers (as in, the ones that are already for one reason or the other blacklisted by our spamd).  
>  The queue is defined like this:
>
>

>  queue spamd parent rootq bandwidth 1K min 0K max 1K qlimit 300

>
>
> yes, that's right. A queue with a maximum throughput of 1 kilobit per second. I have been warned that this is small enough that the code may be unable to strictly enforce that limit due to the timer resolution in the HFSC code. But that didn't keep me from trying.  
>  Now a few small additions to the ruleset are needed for the good to put the evil to the task. We start with a table to hold the addresses we want to mess with. Actually, I'll add two, for reasons that will become clear later:
>
>

>  table  persist counters table  persist counters

>
>
> The rules that use those tables are:
>
>

>  block drop log (all) quick from  pass in quick log (all) on egress proto tcp from  to port pop3 flags S/SA keep state \\ (max-src-conn 2, max-src-conn-rate 3/3, overload  flush global, pflow) set queue spamd pass in log (all) on egress proto tcp to port pop3 flags S/SA keep state \\ (max-src-conn 5, max-src-conn-rate 6/3, overload  flush global, pflow)

>
>
> The last one lets anybody connect to the pop3 service, but any one source address can have only open five simultaneous connections and at a rate of six over three seconds.
>
>
>
> The results were immediately visible. Monitoring the queues using pfctl -vvsq shows the tiny queue works as expected:
>
>

>  queue spamd parent rootq bandwidth 1K, max 1K qlimit 300 [ pkts: 196136 bytes: 12157940 dropped pkts: 398350 bytes: 24692564 ] [ qlength: 300/300 ] [ measured: 2.0 packets/s, 999.13 b/s ]

>
>
> and looking at the pop3 daemon's log entries, a typical encounter looks like this:
>
>

>  Apr 19 22:39:33 skapet spop3d[44875]: connect from 111.181.52.216 Apr 19 22:39:33 skapet spop3d[75112]: connect from 111.181.52.216 Apr 19 22:39:34 skapet spop3d[57116]: connect from 111.181.52.216 Apr 19 22:39:34 skapet spop3d[65982]: connect from 111.181.52.216 Apr 19 22:39:34 skapet spop3d[58964]: connect from 111.181.52.216 Apr 19 22:40:34 skapet spop3d[12410]: autologout time elapsed - 111.181.52.216 Apr 19 22:40:34 skapet spop3d[63573]: autologout time elapsed - 111.181.52.216 Apr 19 22:40:34 skapet spop3d[76113]: autologout time elapsed - 111.181.52.216 Apr 19 22:40:34 skapet spop3d[23524]: autologout time elapsed - 111.181.52.216 Apr 19 22:40:34 skapet spop3d[16916]: autologout time elapsed - 111.181.52.216

>
>
> here the miscreant comes in way too fast and only manages to get five connections going before they're shunted to the tiny queue to fight it out with known spammers for a share of bandwidth.  
>  One important takeaway from this, and possibly the most important point of this article, is that it does not take a lot of imagination to retool this setup to watch for and protect against undesirable activity directed at essentially any network service.  
>  You pick the service and the ports it uses, then figure out what are the parameters that determine what is acceptable behavior. Once you have those parameters defined, you can choose to assign to a minimal queue like in this example, block outright, redirect to something unpleasant or even pass with a low probability.
>
>

---

### [64-bit inodes (ino64) Status Update and Call for Testing](https://lists.freebsd.org/pipermail/freebsd-fs/2017-April/024684.html) ###

>
>
> Inodes are data structures corresponding to objects in a file system, such as files and directories. FreeBSD has historically used 32-bit values to identify inodes, which limits file systems to somewhat under 2<sup>32</sup> objects. Many modern file systems internally use 64-bit identifiers and FreeBSD needs to follow suit to properly and fully support these file systems.
>
>
>
> The 64-bit inode project, also known as ino64, started life many years ago as a project by Gleb Kurtsou (gleb@). After that time several people have had a hand in updating it and addressing regressions, after mckusick@ picked up and updated the patch, and acted as a flag-waver.
>
>

1. Overview : The ino64 branch extends the basic system types ino\_t and dev\_t from 32-bit to 64-bit, and nlink\_t from 16-bit to 64-bit.
2. Motivation : The main risk of the ino64 change is the uncontrolled ABI breakage.
3. Quirks : We handled kinfo sysctl MIBs, but other MIBs which report structures depended on the changed type, are not handled in general. It was considered that the breakage is either in the management interfaces, where we usually allow ABI slip, or is not important.
4. Testing procedure : The ino64 project can be tested by cloning the project branch from GitHub or by applying the patch  to a working tree.
   * New kernel, old world.
   * New kernel, new world, old third-party applications.
   * 32bit compat.
   * Targeted tests.
   * NFS server and client test
   * Other filesystems
   * Test accounting

5. Ports Status with ino64 : A ports exp-run for ino64 is open in PR 218320. 5.1. LLVM : LLVM includes a component called Address Sanitizer or ASAN, which triesto intercept syscalls, and contains knowledge of the layout of many system structures. Since stat and lstat syscalls were removed and several types and structures changed, this has to be reflected in the ASAN hacks. 5.2. lang/ghc : The ghc compiler and parts of the runtime are written in Haskell, which means that to compile ghc, you need a working Haskell compiler for bootstrap. 5.3. lang/rust Rustc has a similar structure to GHC, and same issue. The same solution of patching the bootstrap was done.
6. Next Steps : The tentative schedule for the ino64 project:
   * 2017-04-20 Post wide call for testing : Investigate and address port failures with maintainer support
   * 2017-05-05 Request second exp-run with initial patches applied : Investigate and address port failures with maintainer support
   * 2017-05-19 Commit to HEAD : Address post-commit failures where feasible \*\*\*

News Roundup
----------

### [Sing, beastie, sing!](http://meka.rs/blog/2017/01/25/sing-beastie-sing/) ###

>
>
> FreeBSD digital audio workstation, or DAW for short, is now possible. At this very moment it's not user friendly that much, but you'll manage. What I want to say is that I worked on porting some of the audio apps to FreeBSD, met some other people interested in porting audio stuff and became heavily involved with DrumGizmo - drum sampling engine. Let me start with the basic setup.  
>  FreeBSD doesn't have hard real-time support, but it's pretty close. For the needs of audio, FreeBSD's implementation of real-time is sufficient and, in my opinion, superior to the one you can get on Linux with RT path (which is ugly, not supported by distributions and breaks apps like VirtualBox). As default install of FreeBSD is concerned with real-time too much, we have to tweak sysctl a bit, so append this to your /etc/sysctl.conf:
>
>

>  kern.timecounter.alloweddeviation=0 hw.usb.uaudio.buffer\_ms=2 # only on -STABLE for now hw.snd.latency=0 kern.coredump=0

* So let me go through the list. First item tells FreeBSD how many events it can aggregate (or wait for) before emitting them. The reason this is the default is because aggregating events saves power a bit, and currently more laptops are running FreeBSD than DAWs. Second one is the lowest possible buffer for USB audio driver. If you're not using USB audio, this won't change a thing. Third one has nothing to do with real-time, but dealing with programs that consume \~3GB of RAM, dumping cores around made a problem on my machine. Besides, core dumps are only useful if you know how to debug the problem, or someone is willing to do that for you. I like to not generate those files by default, but if some app is constantly crashing, I enable dumps, run the app, crash it, and disable dumps again. I lost 30GB in under a minute by examining 10 different drumkits of DrumGizmo and all of them gave me 3GB of core file, each.
* More setup instructions follow, including jackd setup and PulseAudio using virtual\_oss.

>
>
> With this setup I can play OSS, JACK and PulseAudio sound all at the same time, which I was not able to do on Linux.
>
>
> ---
>

### [FreeBSD 11 Unbound DNS server](https://itso.dk/?p=499) ###

>
>
> In FreeBSD, there is a built-in DNS server called Unbound.  
>  So why would run a local DNS server? I am in a region where internet traffic is still a bit expensive, that also implies slow, and high response times. To speed that a up a little, you can use own DNS server. It will speed up because for every homepage you visit, there will be several hooks to other domains: commercials, site components, and links to other sites. These, will now all be cached locally on your new DNS server. In my case I use an old PC-Engine Alix board for my home DNS server, but you can use almost everything, Raspberry Pi, old laptop/desktop and others. As long as it runs FreeBSD.
>
>

* Goes into more details about what commands to run and which services to start
* Try it out if you are in a similar situation \*\*\*

### [Why it is important that documentation and tutorials be correct and carefully reviewed](https://arxiv.org/pdf/1704.02786.pdf) ###

* A group of researchers found that a lot of online web programming tutorials contain serious security flaws. They decided to do a research project to see how this impacts software that is written possibly based on those tutorials.
* They used a number of simple google search terms to make a list of tutorials, and manually audited them for common vulnerabilities. They then crawled GitHub to find projects with very similar code snippets that might have been taken from those tutorials.

>
>
> The Web is replete with tutorial-style content on how to accomplish programming tasks. Unfortunately, even top-ranked tutorials suffer from severe security vulnerabilities, such as cross-site scripting (XSS), and SQL injection (SQLi). Assuming that these tutorials influence real-world software development, we hypothesize that code snippets from popular tutorials can be used to bootstrap vulnerability discovery at scale. To validate our hypothesis, we propose a semi-automated approach to find recurring vulnerabilities starting from a handful of top-ranked tutorials that contain vulnerable code snippets. We evaluate our approach by performing an analysis of tens of thousands of open-source web applications to check if vulnerabilities originating in the selected tutorials recur.  
>  Our analysis framework has been running on a standard PC, analyzed 64,415 PHP codebases hosted on GitHub thus far, and found a total of 117 vulnerabilities that have a strong syntactic similarity to vulnerable code snippets present in popular tutorials. In addition to shedding light on the anecdotal belief that programmers reuse web tutorial code in an ad hoc manner, our study finds disconcerting evidence of insufficiently reviewed tutorials compromising the security of open-source projects. Moreover, our findings testify to the feasibility of large-scale vulnerability discovery using poorly written tutorials as a starting point
>
>

* The researchers found 117 vulnerabilities, of these, at least 8 appear to be nearly exact copy/pastes of the tutorials that were found to be vulnerable. \*\*\*

### [1.3.0 Development Preview: New icon themes](https://lumina-desktop.org/1-3-0-development-preview-new-icon-themes/) ###

>
>
> As version 1.3.0 of the Lumina desktop starts getting closer to release, I want to take a couple weeks and give you all some sneak peaks at some of the changes/updates that we have been working on (and are in the process of finishing up).
>
>

* [New icon theme](https://lumina-desktop.org/1-3-0-development-preview-new-icon-themes/)
  * Material Design Light/Dark
  * There are a lot more icons available in the reference icon packs which we still have not gotten around to renaming yet, but this initial version satisfies all the XDG standards for an icon theme + all the extra icons needed for Lumina and its utilities + a large number of additional icons for application use.

>
>
> This highlights one the big things that I love about Lumina: it gives you an interface that is custom-tailored to YOUR needs/wants  rather than expecting YOU to change your routines to accomodate how some random developer/designer across the world thinks everybody should use a computer.
>
>

* [Lumina Media Player](https://lumina-desktop.org/1-3-0-development-preview-lumina-mediaplayer/)

>
>
> This is a small utility designed to provide the ability for the user to play audio and video files on the local system, as well as stream audio from online sources. For now, only the Pandora internet radio service is supported via the pianobar CLI utility, which is an optional runtime dependency. However, we hope to gradually add new streaming sources over time.   
>  For a long time I had been using another Pandora streaming client on my TrueOS desktop, but it was very fragile with respect to underlying changes: LibreSSL versions for example. The player would regularly stop functioning for a few update cycles until a version of LibreSSL which was compatible with the player was used. After enduring this for some time, I was finally frustrated enough to start looking for alternatives.   
>  A co-worker pointed me to a command-line utility called pianobar, which was also a small client for Pandora radio. After using pianobar for a couple weeks, I was impressed with how stable it was and how little overhead it required with regards to extra runtime dependencies. Of course, I started thinking I could write a Qt5 GUI for that!. Once I had a few free hours, I started writing what became lumina-mediaplayer. I started with the interface to pianobar itself to see how complicated it would be to interact with, but after a couple days of tinkering in my spare time, I realized I had a full client to Pandora radio basically finished.
>
>

---

Beastie Bits
----------

* [vBSDCon CFP closes April 29th](https://easychair.org/conferences/?conf=vbsdcon2017)
* [EuroBSDCon CFP closes April 30th](https://2017.eurobsdcon.org/2017/03/13/call-for-proposals/)
* [clang(1) added to base on amd64 and i386](http://undeadly.org/cgi?action=article&sid=20170421001933)
* [Theo: Most things come to an end, sorry.](https://marc.info/?l=openbsd-misc&m=149232307018311&w=2)
* [ASLR, PIE, NX, and other capital letters](https://www.dragonflydigest.com/2017/04/24/19609.html)
* [How SSH got port number 22](https://www.ssh.com/ssh/port)
* [Netflix Serving 90Gb/s+ From Single Machines Using Tuned FreeBSD](https://news.ycombinator.com/item?id=14128637)
* [Compressed zfs send / receive lands in FreeBSD HEAD](https://svnweb.freebsd.org/base?view=revision&revision=317414) \*\*\*

Feedback/Questions
----------

* [Steve - FreeBSD Jobs](http://dpaste.com/3QSMYEH#wrap)
* [Mike - CuBox i4Pro](http://dpaste.com/0NNYH22#wrap)
* [Steve - Year of the BSD Desktop?](http://dpaste.com/1QRZBPD#wrap)
* [Brad - Configuration Management](http://dpaste.com/2TFV8AJ#wrap) \*\*\*