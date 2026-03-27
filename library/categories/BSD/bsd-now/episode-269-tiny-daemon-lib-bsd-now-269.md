+++
title = "Episode 269: Tiny Daemon Lib | BSD Now 269"
description = 'FreeBSD Foundation September Update, tiny C lib for programming Unix daemons, EuroBSDcon trip reports, GhostBSD tested on real hardware, and a BSD auth module for duress.\Headlines   \[FreeBSD Foundation Update, September 2018](https://www.freebsdfoundation.org/news-and-even'
date = "2018-10-24T09:00:00Z"
url = "https://www.bsdnow.tv/269"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.697247461Z"
seen = false
+++

FreeBSD Foundation September Update, tiny C lib for programming Unix daemons, EuroBSDcon trip reports, GhostBSD tested on real hardware, and a BSD auth module for duress.

\##Headlines  
 \###[FreeBSD Foundation Update, September 2018](https://www.freebsdfoundation.org/news-and-events/newsletter/freebsd-foundation-update-september-2018/)

* MESSAGE FROM THE EXECUTIVE DIRECTOR

>
>
> Dear FreeBSD Community Member, It is hard to believe that September is over. The Foundation team had a busy month promoting FreeBSD all over the globe, bug fixing in preparation for 12.0, and setting plans in motion to kick off our 4th quarter fundraising and advocacy efforts. Take a minute to see what we’ve been up to and please consider making a donation to help us continue our efforts supporting FreeBSD!
>
>

* September 2018 Development Projects Update

>
>
> In preparation for the release of FreeBSD 12.0, I have been working on investigating and fixing a backlog of kernel bug reports. Of course, this kind of work is never finished, and we will continue to make progress after the release. In the past couple of months I have fixed a combination of long-standing issues and recent regressions. Of note are a pair of UNIX domain socket bugs which had been affecting various applications for years. In particular, Chromium tabs would frequently hang unless a workaround was manually applied to the system, and the bug had started affecting recent versions of Firefox as well. Fixing these issues gave me an opportunity to revisit and extend our regression testing for UNIX sockets, which, in turn, resulted in some related bugs being identified and fixed.  
>  Of late I have also been investigating reports of issues with ZFS, particularly, those reported on FreeBSD 11.2. A number of regressions, including a kernel memory leak and issues with ARC reclamation, have already been fixed for 12.0; investigation of other reports is ongoing. Those who closely follow FreeBSD-CURRENT know that some exciting work to improve memory usage on NUMA systems is now enabled by default. As is usually the case when new code is deployed in a diverse array of systems and workloads, a number of problems since have been identified. We are working on resolving them as soon as possible to ensure the quality of the release.  
>  I’m passionate about maintaining FreeBSD’s stability and dependability as it continues to expand and grow new features, and I’m grateful to the FreeBSD Foundation for sponsoring this work. We depend on users to report problems to the mailing lists and via the bug tracker, so please try running the 12.0 candidate builds and help us make 12.0 a great release.
>
>

* Fundraising Update: Supporting the Project

>
>
> It’s officially Fall here at Foundation headquarters and we’re heading full-steam into our final fundraising campaign of the year. We couldn’t even have begun to reach our funding goal of $1.25 million dollars without the support from the companies who have partnered with us this year. Thank you to Verisign for becoming a Silver Partner. They now join a growing list of companies like Xiplink, NetApp, Microsoft, Tarsnap, VMware, and NeoSmart Technologies that are stepping up and showing their commitment to FreeBSD!  
>  Funding from commercial users like these and individual users like yourself, help us continue our efforts of supporting critical areas of FreeBSD such as:
>
>

* Operating System Improvements: Providing staff to immediately respond to urgent problems and implement new features and functionality allowing for the innovation and stability you’ve come to rely on.
* Security: Providing engineering resources to bolster the capacity and responsiveness of the Security team providing your users with piece of mind when security issues arise.
* Release Engineering: Continue providing a full-time release engineer, resulting in timely and reliable releases you can plan around.
* Quality Assurance: Improving and increasing test coverage, continuous integration, and automated testing with a full-time software engineer to ensure you receive the highest quality, secure, and reliable operating system.
* New User Experience: Improving the process and documentation for getting new people involved with FreeBSD, and supporting those people as they become integrated into the FreeBSD Community providing the resources you may need to get new folks up to speed.
* Training: Supporting more FreeBSD training for undergraduates, graduates, and postgraduates. Growing the community means reaching people and catching their interest in systems software as early as possible and providing you with a bigger pool of candidates with the FreeBSD skills you’re looking for.
* Face-to-Face Opportunities: Facilitating collaboration among members of the community, and building connections throughout the industry to support a healthy and growing ecosystem and make it easier for you to find resources when questions emerge .

>
>
> We can continue the above work, if we meet our goal this year!  
>  If your company uses FreeBSD, please consider joining our growing list of 2018 partners. If you haven’t made your donation yet, please consider donating today. We are indebted to the individual donors, and companies listed above who have already shown their commitment to open source.  
>  Thank you for supporting FreeBSD and the Foundation!
>
>

* September 2018 Release Engineering Update

>
>
> The FreeBSD Release Engineering team continued working on the upcoming 12.0 RELEASE. At present, the 12.0 schedule had been adjusted by one week to allow for necessary works-in-progress to be completed.  
>  Of note, one of the works-in-progress includes updating OpenSSL from 1.0.2 to 1.1.1, in order to avoid breaking the application binary interface (ABI) on an established stable branch.  
>  Due to the level of non-trivial intrusiveness that had already been discovered and addressed in a project branch of the repository, it is possible (but not yet definite) that the schedule will need to be adjusted by another week to allow more time for larger and related updates for this particular update.  
>  Should the 12.0-RELEASE schedule need to be adjusted at any time during the release cycle, the schedule on the FreeBSD project website will be updated accordingly. The current schedule is available at:  
> [https://www.freebsd.org/releases/12.0R/schedule.html](https://www.freebsd.org/releases/12.0R/schedule.html)
>
>

* BSDCam 2018 Trip Report: Marie Helene Kvello-Aune

>
>
> I’d like to start by thanking the FreeBSD Foundation for sponsoring my trip to BSDCam(bridge) 2018. I wouldn’t have managed to attend otherwise. I’ve used FreeBSD in both personal and professional deployments since the year 2000, and over the last few years I have become more involved with development and documentation.  
>  I arrived in Gatwick, London at midnight. On Monday, August 13, I took the train to Cambridge, and decided to do some touristy activities as I walked from the train station to Churchill College. I ran into Allan outside the hotel right before the sky decided it was time for a heavy rainfall. Monday was mostly spent settling in, recouping after travel, and hanging out with Allan, Brad, Will and Andy later in the afternoon/evening. Read more…
>
>

* Continuous Integration Update

>
>
> The FreeBSD Foundation has sponsored the development of the Project’s continuous integration system, available at [https://ci.FreeBSD.org](https://ci.FreeBSD.org), since June. Over the summer, we improved both the software and hardware infrastructure, and also added some new jobs for extending test coverage of the -CURRENT and -STABLE branches. Following are some highlights.
>
>

* New Hardware

>
>
> The Foundation purchased 4 new build machines for scaling up the computation power for the various test jobs. These newer, faster machines substantially speed up the time it takes to test amd64 builds, so that failing changes can be identified more quickly. Also, in August, we received a donation of 2 PINE A64-LTS boards from [PINE64.org](http://PINE64.org), which will be put in the hardware test lab as one part of the continuous tests.
>
>

* CI Staging Environment

>
>
> We used hardware from a previous generation CI system to build a staging environment for the CI infrastructure, which is available at  
> [https://ci-dev.freebsd.org](https://ci-dev.freebsd.org). It executes the configurations and scripts from the “staging” branch of the FreeBSD-CI repository, and the development feature branches. We also use it to experiment with the new version of the jenkins server and plugins. Having a staging environment avoids affecting the production CI environment, reducing downtime.
>
>

* Mail Notification

>
>
> In July, we turned on failure notification for all the kernel and world build jobs. Committers will receive email containing the build information and failure log to inform them of possible problems with their modification on certain architectures. For amd64 of the -CURRENT branch, we also enabled the notification on failing regression test cases. Currently mail is sent only to the individual committers, but with help from postmaster team, we have created a dev-ci mailing list and will soon be also sending notifications there.
>
>

* New Test Job

>
>
> In August, we updated the embedded script of the virtual machine image. Originally it only executed pre-defined tests, but now this behavior can be modified by the data on the attached disk. This mechanism is used for adding new ZFS tests jobs. We are also working on analyzing and fixing the failing and skipped test cases.
>
>

* Work in Progress

>
>
> In August and September, we had two developer summits, one in Cambridge, UK and one in Bucharest, Romania. In these meetings, we discussed running special tests, such as ztest, which need a longer run time. We also planned the network testing for TCP/IP stack
>
>

---

\###[Daemonize - a Tiny C Library for Programming the UNIX Daemons](https://chaoticlab.io/c/c++/unix/2018/10/01/daemonize.html)

>
>
> Whatever they say, writing System-V style UNIX daemons is hard. One has to follow many rules to make a daemon process behave correctly on diverse UNIX flavours. Moreover, debugging such a code might be somewhat tricky. On the other hand, the process of daemon initialisation is rigid and well defined so the corresponding code has to be written and debugged once and later can be reused countless number of times.  
>  Developers of BSD UNIX were very aware of this, as there a C library function daemon() was available starting from version 4.4. The function, although non-standard, is present on many UNIXes. Unfortunately, it does not follow all the required steps to reliably run a process in the background on systems which follow System-V semantics (e.g. Linux). The details are available at the corresponding Linux man page. The main problem here, as I understand it, is that daemon() does not use the double-forking technique to avoid the situation when zombie processes appear.  
>  Whenever I encounter a problem like this one, I know it is time to write a tiny C library which solves it. This is exactly how ‘daemonize’ was born (GitHub mirror). The library consists of only two files which are meant to be integrated into the source tree of your project. Recently I have updated the library and realised that it would be good to describe how to use it on this site.  
>  If for some reason you want to make a Windows service, I have a battle tested template code for you as well.
>
>

* System-V Daemon Initialisation Procedure

>
>
> To make discussion clear we shall quote the steps which have to be performed during a daemon initialisation (according to daemon(7) manual page on Linux). I do it to demonstrate that this task is more tricky than one might expect.
>
>

* So, here we go:

* Close all open file descriptors except standard input, output, and error (i.e. the first three file descriptors 0, 1, 2). This ensures that no accidentally passed file descriptor stays around in the daemon process. On Linux, this is best implemented by iterating through /proc/self/fd, with a fallback of iterating from file descriptor 3 to the value returned by getrlimit() for RLIMIT\_NOFILE.

* Reset all signal handlers to their default. This is best done by iterating through the available signals up to the limit of \_NSIG and resetting them to SIG\_DFL.

* Reset the signal mask using sigprocmask().

* Sanitize the environment block, removing or resetting environment variables that might negatively impact daemon runtime.

* Call fork(), to create a background process.

* In the child, call setsid() to detach from any terminal and create an independent session.

* In the child, call fork() again, to ensure that the daemon can never re-acquire a terminal again.

* Call exit() in the first child, so that only the second child (the actual daemon process) stays around. This ensures that the daemon process is re-parented to init/PID 1, as all daemons should be.

* In the daemon process, connect /dev/null to standard input, output, and error.

* In the daemon process, reset the umask to 0, so that the file modes passed to open(), mkdir() and suchlike directly control the access mode of the created files and directories.

* In the daemon process, change the current directory to the root directory (/), in order to avoid that the daemon involuntarily blocks mount points from being unmounted.

* In the daemon process, write the daemon PID (as returned by getpid()) to a PID file, for example /run/foobar.pid (for a hypothetical daemon “foobar”) to ensure that the daemon cannot be started more than once. This must be implemented in race-free fashion so that the PID file is only updated when it is verified at the same time that the PID previously stored in the PID file no longer exists or belongs to a foreign process.

* In the daemon process, drop privileges, if possible and applicable.

* From the daemon process, notify the original process started that initialization is complete. This can be implemented via an unnamed pipe or similar communication channel that is created before the first fork() and hence available in both the original and the daemon process.

* Call exit() in the original process. The process that invoked the daemon must be able to rely on that this exit() happens after initialization is complete and all external communication channels are established and accessible.

>
>
> The discussed library does most of the above-mentioned initialisation steps as it becomes immediately evident that implementation details for some of them heavily dependent on the internal logic of an application itself, so it is not possible to implement them in a universal library. I believe it is not a flaw, though, as the missed parts are safe to implement in an application code.
>
>

* The Library’s Application Programming Interface

>
>
> The generic programming interface was loosely modelled after above-mentioned BSD’s daemon() function. The library provides two user available functions (one is, in fact, implemented on top of the other) as well as a set of flags to control a daemon creation behaviour.
>
>

* Conclusion

>
>
> The objective of the library is to hide all the trickery of programming a daemon so you could concentrate on the more creative parts of your application. I hope it does this well.  
>  If you are not only interested in writing a daemon, but also want to make yourself familiar with the techniques which are used to accomplish that, the source code is available. Moreover, I would advise anyone, who starts developing for a UNIX environment to do that, as it shows many intricacies of programming for these platforms.
>
>

---

\##News Roundup  
 \###[EuroBSDCon 2018 travel report and obligatory pics](https://blog.netbsd.org/tnf/entry/eurobsdcon_2018)

>
>
> This was my first big BSD conference. We also planned - planned might be a big word - thought about doing a devsummit on Friday. Since the people who were in charge of that had a change of plans, I was sure it’d go horribly wrong.  
>  The day before the devsummit and still in the wrong country, I mentioned the hours and venue on the wiki, and booked a reservation for a restaurant.  
>  It turns out that everything was totally fine, and since the devsummit was at the conference venue (that was having tutorials that day), they even had signs pointing at the room we were given. Thanks EuroBSDCon conference organizers!  
>  At the devsummit, we spent some time hacking. A few people came with “travel laptops” without access to anything, like Riastradh, so I gave him access to my own laptop. This didn’t hold very long and I kinda forgot about it, but for a few moments he had access to a NetBSD source tree and an 8 thread, 16GB RAM machine with which to build things.  
>  We had a short introduction and I suggested we take some pictures, so here’s the ones we got. A few people were concerned about privacy, so they’re not pictured. We had small team to hold the camera :-)  
>  At the actual conference days, I stayed at the speaker hotel with the other speakers. I’ve attempted to make conversation with some visibly FreeBSD/OpenBSD people, but didn’t have plans to talk about anything, so there was a lot of just following people silently.  
>  Perhaps for the next conference I’ll prepare a list of questions to random BSD people and then very obviously grab a piece of paper and ask, “what was…”, read a bit from it, and say, “your latest kernel panic?”, I’m sure it’ll be a great conversation starter.  
>  At the conference itself, was pretty cool to have folks like Kirk McKusick give first person accounts of some past events (Kirk gave a talk about governance at FreeBSD), or the second keynote by Ron Broersma.  
>  My own talk was hastily prepared, it was difficult to bring the topic together into a coherent talk. Nevertheless, I managed to talk about stuff for a while 40 minutes, though usually I skip over so many details that I have trouble putting together a sufficiently long talk.  
>  I mentioned some of my coolest bugs to solve (I should probably make a separate article about some!). A few people asked for the slides after the talk, so I guess it wasn’t totally incoherent.  
>  It was really fun to meet some of my favourite NetBSD people. I got to show off my now fairly well working laptop (it took a lot of work by all of us!).  
>  After the conference I came back with a conference cold, and it took a few days to recover from it. Hopefully I didn’t infect too many people on the way back.
>
>

---

\###[GhostBSD tested on real hardware T410 – better than TrueOS?](https://panoramacircle.com/2018/09/23/ghostbsd-tested-on-real-hardware-t410-better-than-trueos/)

>
>
> You might have heard about FreeBSD which is ultimately derived from UNIX back in the days. It is not Linux even though it is similar in many ways because Linux was designed to follow UNIX principles. Seeing is believing, so check out the video of the install and some apps as well!
>
>

>
>
> Nowadays if you want some of that BSD on your personal desktop how to go about? Well there is a full package or distro called GhostBSD which is based on FreeBSD current with a Mate or XFCE desktop preconfigured. I did try another package called TrueOS before and you can check out my blog post as well.
>
>

>
>
> Let’s give it a try on my Lenovo ThinkPad T410. You can download the latest version from [ghostbsd.org](http://ghostbsd.org). Creating a bootable USB drive was surprisingly difficult as rufus did not work and created a corrupted drive. You have to follow this procedure under Windows: download the 2.5GB .iso file and rename the extension to .img. Download Win32 Disk imager and burn the img file to an USB drive and boot from it. You will be able to start a live session and use the onboard setup to install GhostBSD unto a disk.
>
>

>
>
> I did encounter some bugs or quirks along the way. The installer failed the first time for some unknown reason but worked on the second attempt. The first boot stopped upon initialization of the USB3 ports (the T410 does not have USB3) but I could use some ‘exit’ command line magic to continue. The second boot worked fine. Audio was only available through headphones, not speakers but that could partially be fixed using the command line again. Lot’s of installed apps did not show up in the start menu and on goes the quirks list.
>
>

>
>
> Overall it is still better than TrueOS for me because drivers did work very well and I could address most of the existing bugs.
>
>

* On the upside:

* Free and open source FreeBSD package ready to go

* Mate or XFCE desktop (Mate is the only option for daily builds)

* Drivers work fine including LAN, WiFi, video 2D & 3D, audio, etc

* UFS or ZFS advanced file systems available

* Some downsides:

* Less driver and direct app support than Linux

* Installer and desktop have some quirks and bugs

* App-store is cumbersome, inferior to TrueOS

---

\##Beastie Bits

* [EuroBSDCon 2018 and NetBSD sanitizers](https://blog.netbsd.org/tnf/entry/eurobsdcon_2018_and_netbsd_sanitizers)
* [New mandoc feature: -T html -O toc](https://undeadly.org/cgi?action=article;sid=20181002175838)
* [EuroBSDcon 2018](https://www.geeklan.co.uk/?p=2307)
* [Polish BSD User Group](https://oshogbo.vexillium.org/blog/55/)
* [garbage[43]: What year is it?](https://garbage.fm/episodes/43)
* [The Demo @ 50](https://thedemoat50.org/)
* [Microsoft ports DTrace from FreeBSD to Windows 10](https://youtu.be/tG8R5SQGPck?t=660)
* [OpenBSD joins Twitter](https://twitter.com/openbsd)
* [NetBSD curses ripoffline improvements](https://roy.marples.name/blog/netbsd-curses-ripoffline-improvements)
* [FCP-0101: Deprecating most 10/100 Ethernet drivers](https://lists.freebsd.org/pipermail/freebsd-stable/2018-October/089717.html)
* [Announcing the pkgsrc-2018Q3 release](https://mail-index.netbsd.org/tech-pkg/2018/10/05/msg020326.html)
* [Debian on OpenBSD vmd (without qemu or another debian system)](http://www.netzbasis.de/openbsd/vmd-debian/index.html)
* [A BSD authentication module for duress passwords (Joshua Stein)](https://github.com/jcs/login_duress)
* [Disk Price/Performance Analysis](https://twitter.com/oshogbovx/status/1019334534935007232?s=03)

---

\##Feedback/Questions

* DJ - [Zombie ZFS](http://dpaste.com/0YV8WC6#wrap)
* Josua - [arm tier 1? how to approach it](http://dpaste.com/25B1EA8)
* -Gamah - [5ghz](http://dpaste.com/2SMSGPB)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---