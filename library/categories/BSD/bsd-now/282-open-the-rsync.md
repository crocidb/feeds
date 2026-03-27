+++
title = "282: Open the Rsync"
description = 'Project Trident 18.12 released, Spotifyd on NetBSD, OPNsense 18.7.10 is available, Ultra EPYC AMD Powered Sun Ultra 24 Workstation, OpenRsync, LLD porting to NetBSD, and more.\Headlines\AsiaBSDCon 2019 Call for Papers* You have unti'
date = "2019-01-24T16:00:00Z"
url = "https://www.bsdnow.tv/282"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.667357284Z"
seen = false
+++

Project Trident 18.12 released, Spotifyd on NetBSD, OPNsense 18.7.10 is available, Ultra EPYC AMD Powered Sun Ultra 24 Workstation, OpenRsync, LLD porting to NetBSD, and more.

\##Headlines

\###[AsiaBSDCon 2019 Call for Papers](https://2019.asiabsdcon.org/cfp.html.en)

* You have until Jan 30th to submit
* Full paper requirement is relaxed a bit this year (this year ONLY!) due to the short submission window. You don’t need all 10-12 pages, but it is still preferred.
* Send a message to [secretary@asiabsdcon.org](mailto:secretary@asiabsdcon.org) with your proposal. Could be either for a talk or a tutorial.
* Two days of tutorials/devsummit and two days of conference during Sakura season in Tokyo, Japan
* The conference is also looking for sponsors
* If accepted, flight and hotel is paid for by the conference

---

\###[Project Trident 18.12 Released](http://project-trident.org/post/2019-01-15_18.12-release_available/)

* [Twitter account if you want to keep up on project news](https://twitter.com/tridentproject)
* [Screenshots](https://twitter.com/TridentProject/status/1086010032662237185)
* [Project Trident Community Telegram Channel](https://t.me/ProjectTrident)
* [DistroWatch Page](https://distrowatch.com/?newsid=10442)
* [LinuxActionNews Review](https://linuxactionnews.com/89?t=395)
* [RoboNuggie’s in depth review](https://www.youtube.com/watch?v=QjiR1KiacrQ)

---

\###[Building Spotifyd on NetBSD](https://atomicules.co.uk/2019/01/17/Building-Spotifyd-on-NetBSD.html)

>
>
> These are the steps I went through to build and run Spotifyd (this commit at the time of writing) on NetBSD AMD64. It’s a Spotify Connect client so it means I still need to control Spotify from another device (typically my phone), but the audio is played through my desktop… which is where my speakers and headphones are plugged in - it means I don’t have to unplug stuff and re-plug into my phone, work laptop, etc. This is 100% a “good enough for now solution” for me; I have had a quick play with the Go based microcontroller from spotcontrol and that allows a completely NetBSD only experience (although it is just an example application so doesn’t provide many features - great as a basis to build on though).
>
>

---

\##News Roundup

\###[OPNsense 18.7.10 released](https://opnsense.org/opnsense-18-7-10-released/)

>
>
> 2019 means 19.1 is almost here. In the meantime accept this small  
>  incremental update with goodies such as Suricata 4.1, custom passwords  
>  for P12 certificate export as well as fresh fixes in the FreeBSD base.  
>  A lot of cleanups went into this update to make sure there will be a  
>  smooth transition to 19.1-RC for you early birds. We expect RC1 in 1-2  
>  weeks and the final 19.1 on January 29.
>
>

---

\###[Introducing the Ultra EPYC AMD Powered Sun Ultra 24 Workstation](https://www.servethehome.com/introducing-the-ultra-epyc-amd-powered-sun-ultra-24-workstation/)

>
>
> A few weeks ago, I got an itch to build a workstation with AMD EPYC. There are a few constraints. First, I needed a higher-clock part. Second, I knew the whole build would be focused more on being an ultra high-end workstation rather than simply utilizing gaming components. With that, I decided it was time to hit on a bit of nostalgia for our readers. Mainly, I wanted to do an homage to Sun Microsystems. Sun made the server gear that the industry ran on for years, and as a fun fact, if you go behind the 1 Hacker Way sign at Facebook’s campus, they left the Sun Microsystems logo. Seeing that made me wonder if we could do an ultimate AMD EPYC build in a Sun Microsystems workstation.
>
>

---

\###[OpenRsync](https://github.com/kristapsdz/openrsync)

>
>
> This is a clean-room implementation of rsync with a BSD (ISC) license. It is designed to be compatible with a modern rsync (3.1.3 is used for testing). It currently compiles and runs only on OpenBSD.  
>  This project is still very new and very fast-moving.  
>  It’s not ready for wide-spread testing. Or even narrow-spread beyond getting all of the bits to work. It’s not ready for strong attention. Or really any attention but by careful programming.  
>  Many have asked about portability. We’re just not there yet, folks. But don’t worry, the system is easily portable. The hard part for porters is matching OpenBSD’s pledge and unveil.
>
>

---

\###[The first report on LLD porting](https://blog.netbsd.org/tnf/entry/the_first_report_on_lld)

>
>
> LLD is the link editor (linker) component of Clang toolchain. Its main advantage over GNU ld is much lower memory footprint, and linking speed. It is of specific interest to me since currently 8 GiB of memory are insufficient to link LLVM statically (which is the upstream default).  
>  The first goal of LLD porting is to ensure that LLD can produce working NetBSD executables, and be used to build LLVM itself. Then, it is desirable to look into trying to build additional NetBSD components, and eventually into replacing /usr/bin/ld entirely with lld.  
>  In this report, I would like to shortly summarize the issues I have found so far trying to use LLD on NetBSD.
>
>

---

\###[Ring in the new](https://euroquis.nl/bobulate/?p=2044)

>
>
> It’s the second week of 2019 already, which means I’m curious what Nate is going to do with his series This week in usability … reset the numbering from week 1? That series is a great read, to keep up with all the little things that change in KDE source each week — aside from the release notes.  
>  For the big ticket items of KDE on FreeBSD, you should read this blog instead.
>
>

* In ports this week (mostly KDE, some unrelated):
* KDE Plasma has been updated to the latest release, 5.14.5.
* KDE Applications 18.12.1 were released today, so we’re right on top of them.
* Marble was fixed for FreeBSD-running-on-Power9.
* Musescore caught up on 18 months of releases.
* Phonon updated to 4.10.1, along with its backends.
* And in development, Qt WebEngine 5.12 has been prepared in the incongruously-named plasma-5.13 branch in Area51; that does contain all the latest bits described above, as well.

---

\##Beastie Bits

* [NomadBSD 1.2-RC1 Released](http://nomadbsd.org/index.html)
* [ZFS - The First Enterprise Blockchain](https://twitter.com/q5sys/status/1086443533681209350)
* [Powersaving with DragonFly laptop](https://www.dragonflybsd.org/docs/user/Powersave/?updated)
* [NetBSD reaches 100% reproducable builds](https://tests.reproducible-builds.org/netbsd/netbsd.html)
* [Potential Bhyve Web Interface?](https://old.reddit.com/r/freebsd/comments/ahs53y/bhyve_web_interface/)
* [LibGDX proof of concept on OpenBSD](https://www.reddit.com/r/openbsd_gaming/comments/adi9sm/libgdx_proof_of_concept_on_openbsd_slay_the_spire/) - [Video](https://youtu.be/F1loBeHKJt4)
* [LiteCLI is a user-friendly CommandLine client for SQLite database](https://www.pgcli.com/launching-litecli.html)
* [In honor of Donald Knuth’s 81 birthday Stanford uploaded 111 lectures on Youtube](https://www.youtube.com/playlist?list=PL94E35692EB9D36F3)
* [Portland BSD Pizza Night - 2018-01-31 19:00 - Sweet Heart Pizza](http://dpaste.com/3Q4F6C2)
* [Stockholm BSD February meetup](https://www.meetup.com/BSD-Users-Stockholm/events/257281738/)
* [Polish BSD User Group: Jan 25 18:15 - 21:00](https://bsd-pl.org/en)
* [AsiaBSDcon 2019 CfP](https://2019.asiabsdcon.org/cfp.html.en)

---

\##Feedback/Questions

* Greg - [VLANs and jails](http://dpaste.com/3A6T4HN)
* Tara - [ZFS on removable disks](http://dpaste.com/1X1E3XS#wrap)
* Casey - [Interview with Kirk McKusick](http://dpaste.com/08HZ6FP#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---