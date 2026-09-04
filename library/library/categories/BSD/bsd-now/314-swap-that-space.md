+++
title = "314: Swap that Space"
description = "Unix virtual memory when you have no swap space, Dsynth details on Dragonfly, Instant Workstation on FreeBSD, new servers new tech, Experimenting with streaming setups on NetBSD, NetBSD’s progress towards Steam support thanks to GSoC, and more.Headlines[What has to "
date = "2019-09-05T00:00:00Z"
url = "https://www.bsdnow.tv/314"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.607405280Z"
seen = true
+++

Unix virtual memory when you have no swap space, Dsynth details on Dragonfly, Instant Workstation on FreeBSD, new servers new tech, Experimenting with streaming setups on NetBSD, NetBSD’s progress towards Steam support thanks to GSoC, and more.

Headlines
----------

### [What has to happen with Unix virtual memory when you have no swap space](https://utcc.utoronto.ca/~cks/space/blog/unix/NoSwapConsequence) ###

>
>
> Recently, Artem S. Tashkinov wrote on the Linux kernel mailing list about a Linux problem under memory pressure (via, and threaded here). The specific reproduction instructions involved having low RAM, turning off swap space, and then putting the system under load, and when that happened (emphasis mine):
>
>
>
> Once you hit a situation when opening a new tab requires more RAM than is currently available, the system will stall hard. You will barely be able to move the mouse pointer. Your disk LED will be flashing incessantly (I'm not entirely sure why). [...]
>
>
>
> I'm afraid I have bad news for the people snickering at Linux here; if you're running without swap space, you can probably get any Unix to behave this way under memory pressure. If you can't on your particular Unix, I'd actually say that your Unix is probably not letting you get full use out of your RAM.
>
>
>
> To simplify a bit, we can divide pages of user memory up into anonymous pages and file-backed pages. File-backed pages are what they sound like; they come from some specific file on the filesystem that they can be written out to (if they're dirty) or read back in from. Anonymous pages are not backed by a file, so the only place they can be written out to and read back in from is swap space. Anonymous pages mostly come from dynamic memory allocations and from modifying the program's global variables and data; file backed pages come mostly from mapping files into memory with mmap() and also, crucially, from the code and read-only data of the program.
>
>

* See link for the rest of the article

---

### [Dsynth details on Dragonfly](https://www.dragonflydigest.com/2019/08/27/23398.html) ###

>
>
> First, history: DragonFly has had binaries of dports available for download for quite some time. These were originally built using poudriere, and then using the synth tool put together by John Marino. Synth worked both to build all software in dports, and as a way to test DragonFly’s SMP capability under extreme load.
>
>
>
> Matthew Dillon is working on a new version, called dsynth. It is available now but not yet part of the build. He’s been working quickly on it and there’s plenty more commits than what I have linked here. It’s already led to finding more high-load fixes.
>
>

* dsynth

>
>
> DSynth is basically synth written in C, from scratch. It is designed to give us a bulk builder in base and be friendly to porting and jails down the line (for now its uses chroot's).
>
>
>
> The original synth was written by John R. Marino and its basic flow was used in writing this program, but as it was written in ada no code was directly copied.
>
>
>
> * The intent is to make dsynth compatible with synth's configuration files and directory structure.
>   
>   
> * This is a work in progress and not yet ready for prime-time. Pushing so we can get some more eyeballs. Most of the directives do not yet work (everything, and build works, and 'cleanup' can be used to clean up any dangling mounts).
>   
>   
>
>

* [dsynth code](https://gitweb.dragonflybsd.org/dragonfly.git/blob/HEAD:/usr.bin/dsynth/dsynth.1)

---

News Roundup
----------

### [Instant Workstation](https://euroquis.nl/freebsd/2019/08/12/instant-workstation.html) ###

>
>
> Some considerable time ago I wrote up instructions on how to set up a FreeBSD machine with the latest KDE Plasma Desktop. Those instructions, while fairly short (set up X, install the KDE meta-port, .. and that’s it) are a bit fiddly.
>
>
>
> So – prompted slightly by a Twitter exchange recently – I’ve started a mini-sub-project to script the installation of a desktop environment and the bits needed to support it. To give it at least a modicum of UI, dialog(1) is used to ask for an environment to install and a display manager.
>
>
>
> The tricky bits – pointed out to me after I started – are hardware support, although a best-effort is better than having nothing, I think.
>
>
>
> In any case, in a VBox host it’s now down to running a single script and picking Plasma and SDDM to get a usable system for me. Other combinations have not been tested, nor has system-hardware-setup. I’ll probably maintain it for a while and if I have time and energy it’ll be tried with nVidia (those work quite well on FreeBSD) and AMD (not so much, in my experience) graphics cards when I shuffle some machines around.
>
>

* [Here is the script in my GitHub repository with notes-for-myself.](https://raw.githubusercontent.com/adriaandegroot/FreeBSDTools/master/bin/instant-workstation)

---

### [New Servers, new Tech](https://www.dragonflydigest.com/2019/08/26/23396.html) ###

>
>
> Following up on an earlier post, the new servers for DragonFly are in place. The old 40-core machine used for bulk build, monster, is being retired. The power efficiency of the new machines is startling. Incidentally, this is where donations go – infrastructure.
>
>

* [New servers in the colo, monster is being retired](http://lists.dragonflybsd.org/pipermail/users/2019-August/358271.html)

>
>
> We have three new servers in the colo now that will be taking most/all bulk package building duties from monster and the two blades (muscles and pkgbox64) that previously did the work. Monster will be retired. The new servers are a dual-socket Xeon (sting) and two 3900X based systems (thor and loki) which all together burn only around half the wattage that monster burned (500W vs 1000W) and 3 times the performance. That's at least a 6:1 improvement in performance efficiency.
>
>
>
> With SSD prices down significantly the new machines have all-SSDs. These new machines allow us to build dports binary packages for release, master, and staged at the same time and reduces the full-on bulk build times for getting all three done down from 2 weeks to 2 days. It will allow us to more promptly synchronize updates to ports with dports and get binary packages up sooner.
>
>
>
> Monster, our venerable 48-core quad-socket opteron is being retired. This was a wonderful dev machine for working on DragonFly's SMP algorithms over the last 6+ years precisely because its inter-core and inter-socket latencies were quite high. If a SMP algorithm wasn't spot-on, you could feel it. Over the years DragonFly's performance on monster in doing things like bulk builds increased radically as the SMP algorithms got better and the cores became more and more localized. This kept monster relevant far longer than I thought it would be.
>
>
>
> But we are at a point now where improvements in efficiency are just too good to ignore. Monster's quad-socket opteron (4 x 12 core 6168's) pulls 1000W under full load while a single Ryzen 3900X (12 core / 24 thread) in a server configuration pulls only 150W, and is slightly faster on the same workload to boot.
>
>
>
> I would like to thank everyone's generous donations over the last few years! We burned a few thousand on the new machines (as well as the major SSD upgrades we did to the blades) and made very good use of the money, particularly this year as prices for all major components (RAM, SSDs, CPUs, Mobos, etc) have dropped significantly.
>
>

---

### [Experimenting with streaming setups on NetBSD](https://dressupgeekout.blogspot.com/2019/08/experimenting-with-streaming-setups-on.html?m=1) ###

>
>
> Ever since OBS was successfully ported to NetBSD, I’ve been trying it out, seeing what works and what doesn’t. I’ve only just gotten started, and there’ll definitely be a lot of tweaking going forward.
>
>
>
> Capturing a specific application’s windows seems to work okay. Capturing an entire display works, too. I actually haven’t tried streaming to Twitch or YouTube yet, but in a previous experiment a few weeks ago, I was able to run a FFmpeg command line and that could stream to Twitch mostly OK.
>
>
>
> My laptop combined with my external monitor allows me to have a dual-monitor setup wherein the smaller laptop screen can be my “broadcasting station” while the bigger screen is where all the action takes place. I can make OBS visible on all Xfce workspaces, but keep it tucked away on that display only. Altogether, the setup should let me use the big screen for the fun stuff but I can still monitor everything in the small screen.
>
>

---

### [NetBSD Made Progress Thanks To GSoC In Its March Towards Steam Support](https://www.phoronix.com/scan.php?page=news_item&px=NetBSD-Linux-DRM-Ioctl-GSoC2019) ###

>
>
> Ultimately the goal is to get Valve's Steam client running on NetBSD using their Linux compatibility layer while the focus the past few months with Google Summer of Code 2019 were supporting the necessary DRM ioctls for allowing Linux software running on NetBSD to be able to tap accelerated graphics support.
>
>
>
> Student developer Surya P spent the summer working on compat\_netbsd32 DRM interfaces to allow Direct Rendering Manager using applications running under their Linux compatibility layer.
>
>
>
> These interfaces have been tested and working as well as updating the "suse131" packages in NetBSD to make use of those interfaces. So the necessary interfaces are now in place for Linux software running on NetBSD to be able to use accelerated graphics though Steam itself isn't yet running on NetBSD with this layer.
>
>
>
> Those curious about this DRM ioctl GSoC project can learn more from [the NetBSD blog](https://blog.netbsd.org/tnf/entry/gsoc_2019_report_implementation_of). NetBSD has also been seeing work this summer on Wayland support and better Wine support to ultimately make this BSD a better desktop operating system and potentially a comparable gaming platform to Linux.
>
>

---

Beastie Bits
----------

* [FreeBSD in Wellington?](https://twitter.com/MengTangmu/status/1163265206660694016)
* [FreeBSD on GFE](https://twitter.com/onewilshire/status/1163792878642114560)
* [Clarification](https://twitter.com/onewilshire/status/1166323112620826624)
* [Distrotest.net now with BSDs](https://distrotest.net/)
* [Lecture: Anykernels meet fuzzing NetBSD](https://fahrplan.events.ccc.de/camp/2019/Fahrplan/events/10334.html)
* [Sun Microsystems business plan from 1982 [pdf]](https://www.khoslaventures.com/wp-content/uploads/SunMicrosystem_bus_plan.pdf)

---

Feedback/Questions
----------

* Alan - [Questions](http://dpaste.com/1Z8EGTW)
* Rodriguez - [Feedback and a question](http://dpaste.com/2PZFP4X#wrap)
* Jeff - [OpenZFS follow-up, FreeBSD Adventures](http://dpaste.com/02ZM6YE#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.