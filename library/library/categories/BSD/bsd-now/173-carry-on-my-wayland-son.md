+++
title = "173: Carry on my Wayland son"
description = "This week on the show, we’ve got some great stories to bring you, a look at the odder side of UNIX historyThis episode was brought to you byiXsystems - Enterprise Servers and <brStorage for Open Source[![](/images/2."
date = "2016-12-21T13:00:00Z"
url = "https://www.bsdnow.tv/173"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.969307943Z"
seen = true
+++

This week on the show, we’ve got some great stories to bring you, a look at the odder side of UNIX history

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and <br>
Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![](/images/2.png) alt="DigitalOcean - Simple Cloud Hosting, Built for Developers" /\>](http://www.digitalocean.com/)[ title="Tarsnap"\>![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [syspatch in testing state](http://marc.info/?l=openbsd-tech&m=148058309126053&w=2) ###

* Antoine Jacoutot ajacoutot@ openbsd has posted a call for testing for OpenBSD’s new syspatch tool
* “syspatch(8), a "binary" patch system for -release is now ready for early testing. This does not use binary diffing to update the system, but regular signed tarballs containing the updated files (ala installer).”
* “I would appreciate feedback on the tool. But please send it directly to *me*, there's no need to pollute the list. This is obviously WIP and the tool may or may not change in drastic ways.”
* “These test binary patches are *not* endorsed by the OpenBSD project and should not be trusted, I am only providing them to get early feedback on the tool. If all goes as planned, I am hoping that syspatch will make it into the 6.1 release; but for it to happen, I need to know how it breaks your systems :-)”
* [Instructions](http://syspatch.openbsd.org/pub/OpenBSD/6.0/syspatch/amd64/README.txt)
* If you test it, report back and let us know how it went \*\*\*

### [Weston working](https://lists.freebsd.org/pipermail/freebsd-current/2016-December/064198.html) ###

* Over the past few years we’ve had some user-interest in the state of Wayland / Weston on FreeBSD. In the past day or so, Johannes Lundberg has sent in a progress report to the FreeBSD mailing lists.
* Without further ADO:

>
>
> We had some progress with Wayland that we'd like to share.
>
>
>
> Wayland (v1.12.0)  
>  Working
>
>
>
> Weston (v1.12.0)  
>  Working (Porting WIP)
>
>
>
> Weston-clients (installed with wayland/weston port)  
>  Working
>
>
>
> XWayland (run X11 apps in Wayland compositor)  
>  Works (maximized window only) if started manually but not when  
>  launching X11 app from Weston. Most likely problem with Weston IPC.
>
>
>
> Sway (i3-compatible Wayland compositor)  
>  Working
>
>
>
> SDL20 (Wayland backend)  
>  games/stonesoup-sdl briefly tested.  
> [https://twitter.com/johalun/status/811334203358867456](https://twitter.com/johalun/status/811334203358867456)
>
>
>
> GDM (with Wayland)  
>  Halted - depends on logind.
>
>
>
> GTK3  
>  gtk3-demo runs fine on Weston (might have to set GDK\_BACKEND=wayland  
>  first.  
>  GTK3 apps working (gedit, gnumeric, xfce4-terminal tested, xfce desktop  
>  (4.12) does not yet support GTK3)“
>
>

* Johannes goes on to give instructions on how / where you can fetch their WiP and do your own testing. At the moment you’ll need Matt Macy’s newer Intel video work, as well as their ports tree which includes all the necessary software bits.
* Before anybody asks, yes we are watching this for TrueOS! \*\*\*

### [Where the rubber meets the road (part two)](https://functionallyparanoid.com/2016/12/15/where-the-rubber-meets-the-road-part-two/) ###

* Continuing with our story from Brian Everly from a week ago, we have an update today on the process to dual-boot OpenBSD with Arch Linux.
* As we last left off, Arch was up and running on the laptop, but some quirks in the hardware meant OpenBSD would take a bit longer.
* With those issues resolved and the HD seen again, the next issue that reared its head was OpenBSD not seeing the partition tables on the disk. After much frustration, it was time to nuke and pave, starting with OpenBSD first this time.
* After a successful GPT partitioning and install of OpenBSD, he went back to installing Arch, and then the story got more interesting.

>
>
> “I installed Arch as I detailed in my last post; however, when I fired up gdisk I got a weird error message:
>
>
>
> “Warning! Disk size is smaller than the main header indicates! Loading secondary header from the last sector of the disk! You should use ‘v’ to verify disk integrity, and perhaps options on the expert’s menu to repair the disk.”
>
>
>
> Immediately after this, I saw a second warning:
>
>
>
> “Caution: Invalid backup GPT header, but valid main header; regenerating backup header from main header.”
>
>
>
> And, not to be outdone, there was a third:
>
>
>
> “Warning! Main and backup partition tables differ! Use the ‘c’ and ‘e’ options on the recovery & transformation menu to examine the two tables.”
>
>
>
> Finally (not kidding), there was a fourth:
>
>
>
> “Warning! One or more CRCs don’t match. You should repair the disk!”
>
>
>
> Given all of that, I thought to myself, “This is probably why I couldn’t see the disk properly when I partitioned it under Linux on the OpenBSD side. I’ll let it repair things and I should be good to go.” I then followed the recommendation and repaired things, using the primary GPT table to recreate the backup one. I then installed Arch and figured I was good to go.“
>
>

* After confirming through several additional re-installs that the behavior was reproducible, he then decided to go full on crazy,and partition with MBR. That in and of itself was a challenge, since as he mentions, not many people dual-boot OpenBSD with Linux on MBR, especially using luks and lvm!
* If you want to see the details on how that was done, check it out.
* The story ends in success though! And better yet:

>
>
> “Now that I have everything working, I’ll restore my config and data to Arch, configure OpenBSD the way I like it and get moving. I’ll take some time and drop a note on the tech@ mailing list for OpenBSD to see if they can figure out what the GPT problem was I was running into. Hopefully it will make that part of the code stronger to get an edge-case bug report like this.”
>
>

* Take note here, if you run into issues like this with any OS, be sure to document in detail what happened so developers can explore solutions to the issue. \*\*\*

### [FreeBSD and ZFS as a time capsule for OS X ](https://blog.feld.me/posts/2016/12/using-freebsd-as-a-time-capsule-for-osx/) ###

* Do you have any Apple users in your life? Perhaps you run FreeBSD for ZFS somewhere else in the house or office. Well today we have a blog post from Mark Felder which shows how you can use FreeBSD as a time-capsule for your OSX systems.
* The setup is quite simple, to get started you’ll need packages for netatalk3 and avahi-app for service discovery.
* Next up will be your AFP configuration. He helpfully provides a nice example that you should be able to just cut-n-paste. Be sure to check the hosts allow lines and adjust to fit your network. Also of note will be the backup location and valid users to adjust.
* A little easier should be the avahi setup, which can be a straight copy-n-paste from the site, which will perform the service advertisements.
* The final piece is just enabling specific services in /etc/rc.conf and either starting them by hand, or rebooting. At this point your OSX systems should be able to discover the new time-capsule provider on the network and DTRT. \*\*\*

News Roundup
----------

### [netbenches - FreeBSD network forwarding performance benchmark results](https://github.com/ocochard/netbenches) ###

* Olivier Cochard-Labbé, original creator of FreeNAS, and leader of the BSD Router Project, has a github repo of network benchmarks
* There are many interesting results, and all of the scripts, documentation, and configuration files to run the tests yourself
* [IPSec Performance on an Atom C2558, 12-head vs IPSec Performance Branch ](https://github.com/ocochard/netbenches/tree/master/Atom_C2558_4Cores-Intel_i350/ipsec/results/fbsd12.projects-ipsec.equilibrium)
* Compared to: [Xeon L5630 2.13GHz ](https://github.com/ocochard/netbenches/tree/2f3bb1b3c51e454736f1fcc650c3328071834f8d/Xeon_L5630-4Cores-Intel_82599EB/ipsec/results/fbsd11.0)
* and [IPSec with Authentication ](https://github.com/ocochard/netbenches/tree/305235114ba8a3748ad9681c629333f87f82613a/Atom_C2558_4Cores-Intel_i350/ipsec.ah/results/fbsd12.projects-ipsec.equilibrium)
* I look forward to seeing tests on even more hardware, as people with access to different configurations try out these benchmarks \*\*\*

### [A tcpdump Tutorial and Primer with Examples](https://danielmiessler.com/study/tcpdump/) ###

* Most users will be familiar with the basics of using tcpdump, but this tutorial/primer is likely to fill in a lot of blanks, and advance many users understanding of tcpdump
* “tcpdump is the premier network analysis tool for information security professionals. Having a solid grasp of this über-powerful application is mandatory for anyone desiring a thorough understanding of TCP/IP. Many prefer to use higher level analysis tools such as Wireshark, but I believe this to usually be a mistake.”
* tcpdump is an important tool for any system or network administrator, it is not just for security. It is often the best way to figure out why the network is not behaving as expected.
* “In a discipline so dependent on a true understanding of concepts vs. rote learning, it’s important to stay fluent in the underlying mechanics of the TCP/IP suite. A thorough grasp of these protocols allows one to troubleshoot at a level far beyond the average analyst, but mastery of the protocols is only possible through continued exposure to them.”
* Not just that, but TCP/IP is a very interesting protocol, considering how little it has changed in its 40+ year history
* “First off, I like to add a few options to the tcpdump command itself, depending on what I’m looking at. The first of these is -n, which requests that names are not resolved, resulting in the IPs themselves always being displayed. The second is -X, which displays both hex and ascii content within the packet.”
* “It’s also important to note that tcpdump only takes the first 96 bytes of data from a packet by default. If you would like to look at more, add the -s number option to the mix, where number is the number of bytes you want to capture. I recommend using 0 (zero) for a snaplength, which gets everything.”
* The page has a nice table of the most useful options
* It also has a great primer on doing basic filtering
* If you are relatively new to using tcpdump, I highly recommend you spend a few minutes reading through this article \*\*\*

### [How Unix made it to the top](http://minnie.tuhs.org/pipermail/tuhs/2016-December/007519.html) ###

* Doug McIlroy gives us a nice background post on how “Unix made it to the top”
* It’s fairly short / concise, so I felt it would be good to read in its entirety.

>
>
> “It has often been told how the Bell Labs law department became the first non-research department to use Unix, displacing a newly acquired stand-alone word-processing system that fell short of the department's hopes because it couldn't number the lines on patent applications, as USPTO required. When Joe Ossanna heard of this, he told them about roff and promised to give it line-numbering capability the next day. They tried it and were hooked. Patent secretaries became remote members of the fellowship of the Unix lab. In due time the law department got its own machine.
>
>
>
> Less well known is how Unix made it into the head office of AT&T. It seems that the CEO, Charlie Brown, did not like to be seen wearing glasses when he read speeches. Somehow his PR assistant learned of the CAT phototypesetter in the Unix lab and asked whether it might be possible to use it to produce scripts in large type. Of course it was. As connections to the top never hurt, the CEO's office was welcomed as another ouside user. The cost--occasionally having to develop film for the final copy of a speech--was not onerous.
>
>
>
> Having teethed on speeches, the head office realized that Unix could also be useful for things that didn't need phototypesetting. Other documents began to accumulate in their directory. By the time we became aware of it, the hoard came to include minutes of AT&T board meetings. It didn't seem like a very good idea for us to be keeping records from the inner sanctum of the corporation on a computer where most everybody had super-user privileges. A call to the PR guy convinced him of the wisdom of keeping such things on their own premises. And so the CEO's office bought a Unix system.
>
>
>
> Just as one hears of cars chosen for their cupholders, so were theseusers converted to Unix for trivial reasons: line numbers and vanity.“
>
>

---

### [Odd Comments and Strange Doings in Unix](http://orkinos.cmpe.boun.edu.tr/~kosar/odd.html) ###

* Everybody loves easter-eggs, and today we have some fun odd ones from the history throughout UNIX told by Dennis Ritchie.
* First up, was a fun one where the “mv” command could sometimes print the following “values of b may give rise to dom!”
*

>
>
> “Like most of the messages recorded in these compilations, this one was produced in some situation that we considered unlikely or as result of abuse; the details don't matter. I'm recording why the phrase was selected.
>
>
>
> The very first use of Unix in the "real business" of Bell Labs was to type and produce patent applications, and for a while in the early 1970s we had three typists busily typing away in the grotty lab on the sixth floor. One day someone came in and observed on the paper sticking out of one of the Teletypes, displayed in magnificent isolation, this ominous phrase: values of b may give rise to dom!
>
>
>
> It was of course obvious that the typist had interrupted a printout (generating the "!" from the ed editor) and moved up the paper, and that the context must have been something like "varying values of beta may give rise to domain wall movement" or some other fragment of a physically plausible patent application.But the phrase itself was just so striking! Utterly meaningless, but it looks like what... a warning? What is "dom?"
>
>
>
> At the same time, we were experimenting with text-to-voice software by Doug McIlroy and others, and of course the phrase was tried out with it. For whatever reason, its rendition of "give rise to dom!" accented the last word in a way that emphasized the phonetic similarity between "doom" and the first syllable of "dominance." It pronounced "beta" in the British style, "beeta." The entire occurrence became a small, shared treasure.The phrase had to be recorded somewhere, and it was, in the v6 source. Most likely it was Bob Morris who did the deed, but it could just as easily have been Ken. I hope that your browser reproduces the b as a Greek beta.“
>
>

* Next up is one you might have heard before:

>
>
> /\* You are not expected to understand this \*/\> Every now and then on Usenet or elsewhere I run across a reference to a certain comment in the source code of the Sixth   
>  Edition Unix operating system.
>
>
>
> I've even been given two sweatshirts that quote it.
>
>
>
> Most probably just heard about it, but those who saw it in the flesh either had Sixth Edition Unix (ca. 1975) or read the annotated version of this system by John Lions (which was republished in 1996: ISBN 1-57298-013-7, Peer-to-Peer Communications).It's often quoted as a slur on the quantity or quality of the comments in the Bell Labs research releases of Unix. Not an unfair observation in general, I fear, but in this case unjustified.
>
>
>
> So we tried to explain what was going on. "You are not expected to understand this" was intended as a remark in the spirit of "This won't be on the exam," rather than as an impudent challenge.
>
>

* There’s a few other interesting stories as well, if the odd/fun side of UNIX history at all interests you, I would recommend checking it out.

---

Beastie Bits
----------

* [With patches in review the #FreeBSD base system builds 100% reproducibly](https://twitter.com/ed_maste/status/811289279611682816)

* [BSDCan 2017 Call for Participation](https://www.freebsdfoundation.org/news-and-events/call-for-papers/bsdcan-2017/)

* [ioCell 2.0 released ](https://github.com/bartekrutkowski/iocell/releases)

* [who even calls link\_ntoa?](http://www.tedunangst.com/flak/post/who-even-calls-link-ntoa)

* [Booting Androidx86 under bhyve](https://twitter.com/pr1ntf/status/809528845673996288)

---

Feedback/Questions
----------

* [ Chris - VNET](http://pastebin.com/016BfvU9)
* [ Brian - Package Base](http://pastebin.com/8JJeHuRT)
* [ Wim - TrueOS Desktop All-n-one](http://pastebin.com/VC0DPQUF)
* [ Daniel - Long Boots](http://pastebin.com/q7pFu7pR)
* [ Bryan - ZFS / FreeNAS](http://pastebin.com/xgUnbzr7)
* [ Bryan - FreeNAS Security](http://pastebin.com/qqCvVTLB) \*\*\*