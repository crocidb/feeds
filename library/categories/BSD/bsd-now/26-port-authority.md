+++
title = "26: Port Authority"
description = "On today's show we have an interview with Joe Marcus Clark, one of the original portmgr members in FreeBSD, and one of the key GNOME porters. Keeping along with that topic, we have a FreeBSD ports tutorial for you as well. The latest news and answers to your BSD questions, right "
date = "2014-02-26T13:00:00Z"
url = "https://www.bsdnow.tv/26"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.264230887Z"
seen = false
+++

On today's show we have an interview with Joe Marcus Clark, one of the original portmgr members in FreeBSD, and one of the key GNOME porters. Keeping along with that topic, we have a FreeBSD ports tutorial for you as well. The latest news and answers to your BSD questions, right here on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage For Open Source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)

---

Headlines
----------

### [Tailoring OpenBSD for an old, strange computer](http://multixden.blogspot.com/2014/02/tailoring-openbsd-for-old-strange.html) ###

* The author of this article had an [OmniBook 800CT](http://hpmuseum.net/display_item.php?hw=233), which comes with a pop-out mouse, black and white display, 32MB of RAM and a 133MHz CPU
* Obviously he had to install some kind of BSD on it!
* This post goes through all his efforts of trimming down OpenBSD to work on such a limited device
* He goes through the trial and error of "compile, break it, rebuild, try again"
* After cutting a lot out from the kernel, saving a precious megabyte here and there, he eventually gets it working \*\*\*

### [pkgsrcCon and BSDCan](http://www.pkgsrc.org/pkgsrcCon/2014/) ###

* pkgsrccon is "a technical conference for people working on the NetBSD Packages Collection, focusing on existing technologies, research projects, and works-in-progress in pkgsrc infrastructure"
* This year it will be on June 21st and 22nd
* The [schedule](http://www.pkgsrc.org/pkgsrcCon/2014/schedule.html) is still being worked out, so if you want to give a talk, submit it
* BSDCan's [schedule](https://www.bsdcan.org/2014/schedule/events.en.html) was also announced
* We'll be having presentations about ARM on NetBSD and FreeBSD, PF on OpenBSD, Capsicum and casperd, ASLR in FreeBSD, more about migrating from Linux to BSD, FreeNAS stuff and much more
* Kris' presentation was accepted!
* Tons of topics, look forward to the recorded versions of all of them hopefully! \*\*\*

### [Two factor auth with pushover](http://www.tedunangst.com/flak/post/login-pushover) ###

* A new write-up from our friend [Ted Unangst](http://www.bsdnow.tv/episodes/2014_02_05-time_signatures)
* Pushover is "a web hook to smartphone push notification gateway" - you sent a POST to a web server and it sends a code to your phone
* His post goes through the steps of editing your login.conf and setting it all up to work
* Now you can get a two factor authenticated login for ssh! \*\*\*

### [The status of GNOME 3 on BSD](http://undeadly.org/cgi?action=article&sid=20140219085851) ###

* It's no secret that the GNOME team is a Linux-obsessed bunch, almost to the point of being hostile towards other operating systems
* OpenBSD keeps their GNOME 3 ports up to date very well, and Antoine Jacoutot writes about his work on that and how easy it is to use
* This post goes through the process of how simple it is to get GNOME 3 set up on OpenBSD and even includes [a screencast](https://www.bsdfrog.org/tmp/undeadly-gnome.webm)
* A few [recent](http://blogs.gnome.org/mclasen/2014/02/19/on-portability/) [posts](http://blogs.gnome.org/desrt/2014/02/19/on-portability/) from some GNOME developers show that they're finally working with the BSD guys to improve portability
* The FreeBSD and OpenBSD teams are working together to bring the latest GNOME to all of us - it's a beautiful thing
* This goes right along with our interview today! \*\*\*

Interview - Joe Marcus Clark - [marcus@freebsd.org](mailto:marcus@freebsd.org)
----------

The life and daily activities of portmgr, GNOME 3, Tinderbox, portlint, various topics

---

Tutorial
----------

### [The FreeBSD Ports Collection](http://www.bsdnow.tv/tutorials/ports) ###

---

News Roundup
----------

### [DragonflyBSD 3.8 goals and 3.6.1 release](http://bugs.dragonflybsd.org/versions/4) ###

* The Dragonfly team is thinking about what should be in version 3.8
* On their bug tracker, it lists some of the things they'd like to get done before then
* In the meantime, [3.6.1](http://lists.dragonflybsd.org/pipermail/commits/2014-February/199294.html) was released with lots of bugfixes \*\*\*

### [NYCBSDCon 2014 wrap-up piece](http://www.informit.com/blogs/blog.aspx?uk=NYCBSDCon-2014-Rocked-a-Cold-February-Weekend) ###

* We've got a nice wrap-up titled "NYCBSDCon 2014 Heats Up a Cold Winter Weekend"
* The author also interviews [GNN](http://www.bsdnow.tv/episodes/2014_01_29-journaled_news_updates) about the conference
* There's even a little "beginner introduction" to BSD segment
* Includes a mention of the recently-launched journal and lots of pictures from the event \*\*\*

### [FreeBSD and Linux, a comparative analysis](https://www.youtube.com/watch?&v=5mv_oKFzACM#t=418) ###

* GNN in yet another story - he gave a presentation at the NYLUG about the differences between FreeBSD and Linux
* He mentions the history of BSD, the patch set and 386BSD, the lawsuit, philosophy and license differences, a complete system vs "distros," development models, BSD-only features and technologies, how to become a committer, overall comparisons, different hats and roles, the different bsds and their goals and actual code differences
* Serves as a good introduction you can show your Linux friends \*\*\*

### [PCBSD CFT and weekly digest](http://blog.pcbsd.org/2014/02/call-for-testers-new-major-upgrade-methodology/) ###

* Upgrade tools have gotten a major rewrite
* You have to help test it, there is no choice! Read more [here](http://blog.pcbsd.org/2014/02/pc-bsd-weekly-feature-digest-18/)
* How dare Kris be "unimpressed with" freebsd-update and pkgng!?
* Various updates and fixes \*\*\*

Feedback/Questions
----------

* [Jeffrey writes in](http://slexy.org/view/s213KxUdVj)
* [Shane writes in](http://slexy.org/view/s20lwkjLVK)
* [Ferdinand writes in](http://slexy.org/view/s21DqJs77g)
* [Curtis writes in](http://slexy.org/view/s20eXKEqJc)
* [Clint writes in](http://slexy.org/view/s21XMVFuVu)
* [Peter writes in](http://slexy.org/view/s20Xk05MHe) \*\*\*