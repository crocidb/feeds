+++
title = "Episode 265: Software Disenchantment | BSD Now 265"
description = 'We report from our experiences at EuroBSDcon, disenchant software, LLVM 7.0.0 has been released, Thinkpad BIOS update options, HardenedBSD Foundation announced, and ZFS send vs. rsync.\Headlines\[FreeBSD DevSummit & EuroBSDcon 2018 in Romania]* Your hosts are back from EuroB'
date = "2018-09-27T08:00:00Z"
url = "https://www.bsdnow.tv/265"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.705903735Z"
seen = false
+++

We report from our experiences at EuroBSDcon, disenchant software, LLVM 7.0.0 has been released, Thinkpad BIOS update options, HardenedBSD Foundation announced, and ZFS send vs. rsync.

\##Headlines

\###[FreeBSD DevSummit & EuroBSDcon 2018 in Romania]

* Your hosts are back from EuroBSDcon 2018 held in Bucharest, Romania this year. The first two days of the conference are used for tutorials and devsummits (FreeBSD and NetBSD), while the last two are for talks.
* Although Benedict organized the devsummit in large parts, he did not attend it this year. He held his Ansible tutorial in the morning of the first day, followed by Niclas Zeising’s new ports and poudriere tutorial (which had a record attendance). It was intended for beginners that had never used poudriere before and those who wanted to create their first port. The tutorial was well received and Niclas already has ideas for extending it for future conferences.
* On the second day, Benedict took Kirk McKusick’s “An Introduction to the FreeBSD Open-Source Operating System” tutorial, held as a one full day class this year. Although it was reduced in content, it went into enough depth of many areas of the kernel and operating system to spark many questions from attendees. Clearly, this is a good start into kernel programming as Kirk provides enough material and backstories to understand why certain things are implemented as they are.
* Olivier Robert took [[https://www.talegraph.com/tales/l2o9ltrvsE](https://www.talegraph.com/tales/l2o9ltrvsE)](pictures from the devsummit) and created a nice gallery out of it.
* Devsummit evenings saw dinners at two restaurants that allowed developers to spend some time talking over food and drinks.
* The conference opened on the next day with the opening session held by Mihai Carabas. He introduced the first keynote speaker, a colleague of his who presented “Lightweight virtualization with LightVM and Unikraft”.
* Benedict helped out at the FreeBSD Foundation sponsor table and talked to people. He saw the following talks in between:

>
>
> Selfhosting as an alternative to the public cloud (by Albert Dengg)  
>  Using Boot Environments at Scale (by Allan Jude)  
>  Livepatching FreeBSD kernel (by Maciej Grochowski)  
>  FreeBSD: What to (Not) Monitor (by Andrew Fengler)  
>  FreeBSD Graphics (by Niclas Zeising)
>
>

* Allan spent a lot of time talking to people and helping track down issues they were having, in addition to attending many talks:
  >
  >
  > Hacking together a FreeBSD presentation streaming box – For as little as possible (by Tom Jones)  
  >  Introduction of FreeBSD in new environments (by Baptiste Daroussin)  
  >  Keynote: Some computing and networking historical perspectives (by Ron Broersma)  
  >  Livepatching FreeBSD kernel (by Maciej Grochowski)  
  >  FreeBSD: What to (Not) Monitor (by Andrew Fengler)  
  >  Being a BSD user (by Roller Angel)  
  >  From “Hello World” to the VFS Layer: building a beadm for DragonFly BSD (by Michael Voight)
  >
  >

* We also met the winner of our Power Bagel raffle from [Episode 2^8](http://www.bsdnow.tv/episodes/2018_07_25-2_8_because_computers). He received the item in the meantime and had it with him at the conference, providing a power outlet to charge other people’s devices.
* During the closing session, [GroffTheBSDGoat](https://twitter.com/groffthebsdgoat) was handed over to Deb Goodkin, who will bring the little guy to the [Grace Hopper Celebration of Women in Computing conference](https://ghc.anitab.org/) and then to [MeetBSD](http://meetbsd.com) later this year. It was also revealed that next year’s EuroBSDcon will be held in Lillehammer, Norway.
* Thanks to all the speakers, helpers, sponsors, organizers, and attendees for making it a successful conferences. There were no talks recorded this year, but the slides will be uploaded to the [EuroBSDcon website](http://eurobsdcon.org) in a couple of weeks. The [OpenBSD talks](https://www.openbsd.org/events.html#eurobsdcon2018) are already available, so check them out.

\###[Software disenchantment](http://tonsky.me/blog/disenchantment/)

>
>
> I’ve been programming for 15 years now. Recently our industry’s lack of care for efficiency, simplicity, and excellence started really getting to me, to the point of me getting depressed by my own career and the IT in general.  
>  Modern cars work, let’s say for the sake of argument, at 98% of what’s physically possible with the current engine design. Modern buildings use just enough material to fulfill their function and stay safe under the given conditions. All planes converged to the optimal size/form/load and basically look the same.  
>  Only in software, it’s fine if a program runs at 1% or even 0.01% of the possible performance. Everybody just seems to be ok with it. People are often even proud about how much inefficient it is, as in “why should we worry, computers are fast enough”:  
>  @tveastman: I have a Python program I run every day, it takes 1.5 seconds. I spent six hours re-writing it in rust, now it takes 0.06 seconds. That efficiency improvement means I’ll make my time back in 41 years, 24 days :-)  
>  You’ve probably heard this mantra: “programmer time is more expensive than computer time”. What it means basically is that we’re wasting computers at an unprecedented scale. Would you buy a car if it eats 100 liters per 100 kilometers? How about 1000 liters? With computers, we do that all the time.
>
>

* Everything is unbearably slow

>
>
> Look around: our portable computers are thousands of times more powerful than the ones that brought man to the moon. Yet every other webpage struggles to maintain a smooth 60fps scroll on the latest top-of-the-line MacBook Pro. I can comfortably play games, watch 4K videos but not scroll web pages? How is it ok?  
>  Google Inbox, a web app written by Google, running in Chrome browser also by Google, takes 13 seconds to open moderately-sized emails:  
>  It also animates empty white boxes instead of showing their content because it’s the only way anything can be animated on a webpage with decent performance. No, decent doesn’t mean 60fps, it’s rather “as fast as this web page could possibly go”. I’m dying to see web community answer when 120Hz displays become mainstream. Shit barely hits 60Hz already.  
>  Windows 10 takes 30 minutes to update. What could it possibly be doing for that long? That much time is enough to fully format my SSD drive, download a fresh build and install it like 5 times in a row.  
>  Pavel Fatin: Typing in editor is a relatively simple process, so even 286 PCs were able to provide a rather fluid typing experience.  
>  Modern text editors have higher latency than 42-year-old Emacs. Text editors! What can be simpler? On each keystroke, all you have to do is update tiny rectangular region and modern text editors can’t do that in 16ms. It’s a lot of time. A LOT. A 3D game can fill the whole screen with hundreds of thousands (!!!) of polygons in the same 16ms and also process input, recalculate the world and dynamically load/unload resources. How come?  
>  As a general trend, we’re not getting faster software with more features. We’re getting faster hardware that runs slower software with the same features. Everything works way below the possible speed. Ever wonder why your phone needs 30 to 60 seconds to boot? Why can’t it boot, say, in one second? There are no physical limitations to that. I would love to see that. I would love to see limits reached and explored, utilizing every last bit of performance we can get for something meaningful in a meaningful way.
>
>

* Everything is HUUUUGE

>
>
> And then there’s bloat. Web apps could open up to 10× faster if you just simply block all ads. Google begs everyone to stop shooting themselves in their feet with AMP initiative—a technology solution to a problem that doesn’t need any technology, just a little bit of common sense. If you remove bloat, the web becomes crazy fast. How smart do you have to be to understand that?  
>  Android system with no apps takes almost 6 Gb. Just think for a second how obscenely HUGE that number is. What’s in there, HD movies? I guess it’s basically code: kernel, drivers. Some string and resources too, sure, but those can’t be big. So, how many drivers do you need for a phone?  
>  Windows 95 was 30Mb. Today we have web pages heavier than that! Windows 10 is 4Gb, which is 133 times as big. But is it 133 times as superior? I mean, functionally they are basically the same. Yes, we have Cortana, but I doubt it takes 3970 Mb. But whatever Windows 10 is, is Android really 150% of that?  
>  Google keyboard app routinely eats 150 Mb. Is an app that draws 30 keys on a screen really five times more complex than the whole Windows 95? Google app, which is basically just a package for Google Web Search, is 350 Mb! Google Play Services, which I do not use (I don’t buy books, music or videos there)—300 Mb that just sit there and which I’m unable to delete.  
>  All that leaves me around 1 Gb for my photos after I install all the essential (social, chats, maps, taxi, banks etc) apps. And that’s with no games and no music at all! Remember times when an OS, apps and all your data fit on a floppy?  
>  Your desktop todo app is probably written in Electron and thus has userland driver for Xbox 360 controller in it, can render 3d graphics and play audio and take photos with your web camera.  
>  A simple text chat is notorious for its load speed and memory consumption. Yes, you really have to count Slack in as a resource-heavy application. I mean, chatroom and barebones text editor, those are supposed to be two of the less demanding apps in the whole world. Welcome to 2018.  
>  At least it works, you might say. Well, bigger doesn’t imply better. Bigger means someone has lost control. Bigger means we don’t know what’s going on. Bigger means complexity tax, performance tax, reliability tax. This is not the norm and should not become the norm. Overweight apps should mean a red flag. They should mean run away scared.
>
>

* Better world manifesto

>
>
> I want to see progress. I want change. I want state-of-the-art in software engineering to improve, not just stand still. I don’t want to reinvent the same stuff over and over, less performant and more bloated each time. I want something to believe in, a worthy end goal, a future better than what we have today, and I want a community of engineers who share that vision.  
>  What we have today is not progress. We barely meet business goals with poor tools applied over the top. We’re stuck in local optima and nobody wants to move out. It’s not even a good place, it’s bloated and inefficient. We just somehow got used to it.  
>  So I want to call it out: where we are today is bullshit. As engineers, we can, and should, and will do better. We can have better tools, we can build better apps, faster, more predictable, more reliable, using fewer resources (orders of magnitude fewer!). We need to understand deeply what are we doing and why. We need to deliver: reliably, predictably, with topmost quality. We can—and should–take pride in our work. Not just “given what we had…”—no buts!  
>  I hope I’m not alone at this. I hope there are people out there who want to do the same. I’d appreciate if we at least start talking about how absurdly bad our current situation in the software industry is. And then we maybe figure out how to get out.
>
>

---

\##News Roundup  
 \###[[llvm-announce] LLVM 7.0.0 Release](https://lists.llvm.org/pipermail/llvm-announce/2018-September/000080.html)

```
I am pleased to announce that LLVM 7 is now available.

Get it here: https://llvm.org/releases/download.html#7.0.0

The release contains the work on trunk up to SVN revision 338536 plus
work on the release branch. It is the result of the community's work
over the past six months, including: function multiversioning in Clang
with the 'target' attribute for ELF-based x86/x86_64 targets, improved
PCH support in clang-cl, preliminary DWARF v5 support, basic support
for OpenMP 4.5 offloading to NVPTX, OpenCL C++ support, MSan, X-Ray
and libFuzzer support for FreeBSD, early UBSan, X-Ray and libFuzzer
support for OpenBSD, UBSan checks for implicit conversions, many
long-tail compatibility issues fixed in lld which is now production
ready for ELF, COFF and MinGW, new tools llvm-exegesis, llvm-mca and
diagtool. And as usual, many optimizations, improved diagnostics, and
bug fixes.

For more details, see the release notes:
https://llvm.org/releases/7.0.0/docs/ReleaseNotes.html
https://llvm.org/releases/7.0.0/tools/clang/docs/ReleaseNotes.html
https://llvm.org/releases/7.0.0/tools/clang/tools/extra/docs/ReleaseNotes.html
https://llvm.org/releases/7.0.0/tools/lld/docs/ReleaseNotes.html

Thanks to everyone who helped with filing, fixing, and code reviewing
for the release-blocking bugs!

Special thanks to the release testers and packagers: Bero
Rosenkränzer, Brian Cain, Dimitry Andric, Jonas Hahnfeld, Lei Huang
Michał Górny, Sylvestre Ledru, Takumi Nakamura, and Vedant Kumar.

For questions or comments about the release, please contact the
community on the mailing lists. Onwards to LLVM 8!

Cheers,
Hans

```

---

\###[Update your Thinkpad’s bios with Linux or OpenBSD](https://blog.raveland.org/post/thinkpad_update_bios/)

* Get your new bios

>
>
> At first, go to the Lenovo website and download your new bios:
>
>

* Go to lenovo support
* Use the search bar to find your product (example for me, x270)
* Choose the right product (if necessary) and click search
* On the right side, click on Update Your System
* Click on BIOS/UEFI
* Choose \*BIOS Update (Bootable CD) for Windows \*
* Download

>
>
> For me the file is called like this : r0iuj25wd.iso
>
>

* Extract bios update

>
>
> Now you will need to install geteltorito.
>
>

* With OpenBSD:

`$ doas pkg_add geteltorito`  
`quirks-3.7 signed on 2018-09-09T13:15:19Z`  
`geteltorito-0.6: ok`

* With Debian:

`$ sudo apt-get install genisoimage`

* Now we will extract the bios update :

`$ geteltorito -o bios_update.img r0iuj25wd.iso`  
`Booting catalog starts at sector: 20`  
`Manufacturer of CD: NERO BURNING ROM VER 12`  
`Image architecture: x86`  
`Boot media type is: harddisk`  
`El Torito image starts at sector 27 and has 43008 sector(s) of 512 Bytes`  
``  
`Image has been written to file "bios_update.img".`  
`This will create a file called bios_update.img.`

* Put the image on an USB key
* CAREFULL : on my computer, my USB key is sda1 on Linux and sd1 on OpenBSD.

>
>
> Please check twice on your computer the name of your USB key.
>
>

* With OpenBSD :

`$ doas dd if=bios_update.img of=/dev/rsd1c`

* With Linux :

`$ sudo dd if=bios_update.img of=/dev/sda`

>
>
> Now all you need is to reboot, to boot on your USB key and follow the instructions. Enjoy 😉
>
>

---

\###[Announcing The HardenedBSD Foundation](https://hardenedbsd.org/article/shawn-webb/2018-09-17/announcing-hardenedbsd-foundation)

>
>
> In June of 2018, we announced our intent to become a not-for-profit, tax-exempt 501©(3) organization in the United States. It took a dedicated team months of work behind-the-scenes to make that happen. On 06 September 2018, HardenedBSD Foundation Corp was granted 501©(3) status, from which point all US-based persons making donations can deduct the donation from their taxes.  
>  We are grateful for those who contribute to HardenedBSD in whatever way they can. Thank you for making HardenedBSD possible. We look forward to a bright future, driven by a helpful and positive community.
>
>

---

\###[How you migrate ZFS filesystems matters](https://utcc.utoronto.ca/~cks/space/blog/solaris/ZFSSendRecvVsRsync)

>
>
> If you want to move a ZFS filesystem around from one host to another, you have two general approaches; you can use ‘zfs send’ and ‘zfs receive’, or you can use a user level copying tool such as rsync (or ‘tar -cf | tar -xf’, or any number of similar options). Until recently, I had considered these two approaches to be more or less equivalent apart from their convenience and speed (which generally tilted in favour of ‘zfs send’). It turns out that this is not necessarily the case and there are situations where you will want one instead of the other.  
>  We have had two generations of ZFS fileservers so far, the Solaris ones and the OmniOS ones. When we moved from the first generation to the second generation, we migrated filesystems across using ‘zfs send’, including the filesystem with my home directory in it (we did this for various reasons). Recently I discovered that some old things in my filesystem didn’t have file type information in their directory entries. ZFS has been adding file type information to directories for a long time, but not quite as long as my home directory has been on ZFS.  
>  This illustrates an important difference between the ‘zfs send’ approach and the rsync approach, which is that zfs send doesn’t update or change at least some ZFS on-disk data structures, in the way that re-writing them from scratch from user level does. There are both positives and negatives to this, and a certain amount of rewriting does happen even in the ‘zfs send’ case (for example, all of the block pointers get changed, and ZFS will re-compress your data as applicable).  
>  I knew that in theory you had to copy things at the user level if you wanted to make sure that your ZFS filesystem and everything in it was fully up to date with the latest ZFS features. But I didn’t expect to hit a situation where it mattered in practice until, well, I did. Now I suspect that old files on our old filesystems may be partially missing a number of things, and I’m wondering how much of the various changes in ‘zfs upgrade -v’ apply even to old data.  
>  (I’d run into this sort of general thing before when I looked into ext3 to ext4 conversion on Linux.)  
>  With all that said, I doubt this will change our plans for migrating our ZFS filesystems in the future (to our third generation fileservers). ZFS sending and receiving is just too convenient, too fast and too reliable to give up. Rsync isn’t bad, but it’s not the same, and so we only use it when we have to (when we’re moving only some of the people in a filesystem instead of all of them, for example).  
>  PS: I was going to try to say something about what ‘zfs send’ did and didn’t update, but having looked briefly at the code I’ve concluded that I need to do more research before running my keyboard off. In the mean time, you can read the OpenZFS wiki page on ZFS send and receive, which has plenty of juicy technical details.  
>  PPS: Since eliminating all-zero blocks is a form of compression, you can turn zero-filled files into sparse files through a ZFS send/receive if the destination has compression enabled. As far as I know, genuine sparse files on the source will stay sparse through a ZFS send/receive even if they’re sent to a destination with compression off.
>
>

---

\##Beastie Bits

* [BSD Users Stockholm Meetup #4: Tuesday, November 13, 2018 at 18:00](https://www.meetup.com/BSD-Users-Stockholm/events/254235663/)
* [BSD Poland User Group: Next Meeting: October 11, 2018, 18:15 - 21:15 at Warsaw University of Technology](https://bsd-pl.org/en)
* [n2k18 Hackathon report: Ken Westerback (krw@) on disklabel(8) work, dhclient(8) progress](https://undeadly.org/cgi?action=article;sid=20180915112028)
* [Running MirageOS Unikernels on OpenBSD in vmm (Now Works)](https://lists.xenproject.org/archives/html/mirageos-devel/2018-09/msg00013.html)
* [vmm(4) gets support for qcow2](https://undeadly.org/cgi?action=article;sid=20180910070407)
* [MeetBSD and SecurityBsides](https://oshogbo.vexillium.org/blog/52/)
* [Colin Percival reduced FreeBSD startup time from 10627ms (11.2) to 4738ms (12.0)](https://twitter.com/cperciva/status/1041433506453155840)
* [FreeBSD 11.1 end-of-life](https://lists.freebsd.org/pipermail/freebsd-announce/2018-September/001842.html)
* [KnoxBug: Monday, October 1, 2018 at 18:00: Real-world Performance Advantages of NVDIMM and NVMe: Case Study with OpenZFS](https://www.meetup.com/KnoxBUG-BSD-Linux-and-FOSS-Users-Unite/events/254759084)

---

\##Feedback/Questions

* Todd - [2 Nics, 1 bhyve and a jail cell](http://dpaste.com/2QZEZPA)
* Thomas - [Deep Dive](http://dpaste.com/3SFM1YP#wrap)
* Morgan - [Send/Receive to Manage Fragmentation?](http://dpaste.com/07EK4RK#wrap)
* Dominik - [hierarchical jails -\> networking](http://dpaste.com/0SZJ0V4#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---