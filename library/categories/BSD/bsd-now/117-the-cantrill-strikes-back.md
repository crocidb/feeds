+++
title = "117: The Cantrill Strikes Back: ..."
description = "This episode was brought to you byiXsystems - Enterprise Servers and Storage for Open SourceDigitalOcean - Simple Cloud Hosting, Built for Developers[![Tarsnap - Onlin"
date = "2015-11-24T13:00:00Z"
url = "https://www.bsdnow.tv/117"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.085856513Z"
seen = false
+++

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

#### [iX Systems Mission Complete](https://www.ixsystems.com/missioncomplete/) ####

* Submit your story of how you accomplished a mission with FreeBSD, FreeNAS, or iXsystems hardware, and you could win monthly prizes, and have your story featured in the FreeBSD Journal! \*\*\*

Headlines
----------

### [Why did I choose the DragonFlyBSD Operating System by Siju George](http://bsdmag.org/siju_george/) ###

* We have a new article this week by Siju George posted over at BSDMag, talking about his reasons for using DragonFlyBSD in production.
* He ran through periods of using both Free/OpenBSD, but different reasons led him away from each. Specifically problems doing port upgrades on FreeBSD, and the time required to do fsck / raid parity checks on OpenBSD.
* During his research, he had heard about the HAMMER file-system, but didn’t know of anybody running it in production. After some mailing list conversions, and pointers from Matthew Dillon, he took the plunge and switched.
* Now he has fallen in love with the operating system, some of the key strengths he notes at:
* Rolling-Release model, which can be upgraded every few weeks or whenever he has the time
  * No time-consuming fsck after a unclean shutdown
  * No RAID parity checks while still having redundancy
  * Able to add volumes to HAMMER on the fly

* He also mentions looking forward to HAMMER2, and its potential for easy clustering support, along with eventual CARP implementation so he can run two systems on the same IP. \*\*\*

### [The Devil & BSD - Larry Cafiero](http://fossforce.com/2015/11/devil-bsd-leaving-linux-behind/) ###

* A story that has been making the rounds on social media is by Larry Cafiero, on his reasons for deciding to switch from Linux over to the BSD side of things.
* While most of the reasons are over the conflicts surrounding behavior by Linux leaders towards those in the community, he does mention that he has converted his main workstation over to PC-BSD.
* According to Larry, “With a couple of hours of adding backup files and tweaking (augmented by a variety of “oh, look” moments which could easily make me the ADHD Foundation Poster Boy), it looks exactly like my personally modified Korora 22 Xfce which graced the machine earlier. “
* He also gave a great compliment to the quality of the docs / applications in PC-BSD: “In addition, you have to like a operating system which gives you a book — in this case, the PC-BSD Handbook — which should be the gold standard of documentation. It’s enviable, as in, “man, I wish I had written that.” Also programs like AppCafe provide a plethora of FOSS software, so there’s no shortage of programs. Side by side, there’s nothing on the Linux side of things that is lacking on the BSD side of things.”
* Regardless the initial reason for the switch, we are glad to have him and any other switchers join us on the BSD side of FOSS. \*\*\*

### [New resource for BSD-schoolin’](http://teachbsd.org/) ###

* “The [initial repository](https://github.com/teachbsd/course) contains all of the material for the practitioner and masters style courses as well as a PDF for the teaching guide. All of the material is licensed under a BSD doc team license, also visible in the repo and on the github site.”
* “we expect all other work, including the extension of the practitioner course to 5 days, and the adaptation of the graduate course to undergraduates will be in the github repo”
* “Our goal now is to recruit a small number of universities to partner with us to teach this material. We will keep you posted on our progress.”
* We are working on getting an interview lined up to talk more about this project
* If I somehow find the time, I am try to contribute towards a sysadmin course similar to what I used to teach at an Arts&Tech College here in Canada \*\*\*

### [A Few thoughts on OpenBSD 5.8](http://lippard.blogspot.co.uk/2015/11/a-few-thoughts-on-openbsd-58.html) ###

* A user details their thoughts, reactions, and concerns after upgrading to OpenBSD 5.8
* Among the changes:
* sudo was removed and replaced as doas. The user decided to make the switch, but ran into a bug with line continuation (\\ to escape newline to continue a long line)
* The removal of TCP Wrappers support from ssh - this caused a number of rules in hosts.allow to no longer be respected.
* The FreeBSD port of openssh-portable has a patch to readd TCP wrappers because many people find it useful, including myself, when the ssh is in a jail and cannot run a firewall
* The removal of the pf\_rules= rc.conf variable. “I used to just put the default pf.conf rules file in place with each release and upgrade, and keep my changes in a pf.conf.local file that was specified in the pf\_rules variable. The effect was that from the period after the upgrade until I noticed the change, my systems were using the default rules and thus more exposed than they were supposed to be”
* This is what is often called a “POLA Violation”, Policy of Least Astonishment. When deciding what the system should do after some change or new feature is introduced, it should be the thing that will be the least “surprising” to the user. Having your firewall rules suddenly not apply, is surprising.
* “A minor annoying change that was made in 5.8 was putting the file /var/unbound/db/root.key into /etc/changelist, so that the file gets checked daily by the security script. The issue with this is that if you are actually using unbound with DNSSEC, this file changes daily, though only in the comments”
* It is very helpful to see a list of feedback like this after a release, so that the next release can be better
* I would be interested in seeing similar feedback for the other BSDs \*\*\*

Interview - Bryan Cantrill - [@bcantrill](https://twitter.com/bcantrill)
----------

Linux Interface Rants

---

News Roundup
----------

### [FreeBSD AMI building AMI - Colin’s Corner](http://www.daemonology.net/blog/2015-11-21-FreeBSD-AMI-builder-AMI.html) ###

* Colin Percival (Of TarSnap Fame) has brought us a new article this week on how to create your own custom EC2 AMI builds.
* This new tool and instructions allows the creation of AMI files, without needing to go through the hassle of doing a fresh FreeBSD release build each time.
* Essentially it works similar to Colin’s previous “de-penguinator” utility, by running a FreeBSD in a memory instance, allowing the disk to be unmounted and prepped for becoming an AMI.
* The hope is that this new work allows easier creation of a new variety of “customized” FreeBSD instances, for end users to download and deploy at will. \*\*\*

### [Peter Hessler on OpenBSD / OpenBGPd](https://ripe71.ripe.net/archives/video/1200/) ###

* Last week a new video landed of Peter Hessler giving us a status update on OpenBSD tech, and OpenBGPd specifically
* Of interest, he notes that LibreSSL is being used in iOS / OSX, and of course PF is used all over, Apple, BSD, Solaris and even a Windows port!
* OpenNTPD gets a mention as well, still ZERO CVEs for the lifetime of the project
* On the OpenBGPd side, it is considered production ready, so no reason to hold back deployment
* Very “feature-complete”, able to handle Edge Router, Route server, Multi-RIB. Slew of optional features like route reflector, looking glass, mrt dumps, mpls / mpls vpn.
* Bugs fixed, crashers, memory constraints and performance has been improved
* Filtering Performance, in example provided, importing 561K rules / 60K prefixes, went from 35 minutes down to 30 seconds. \*\*\*

### [Onion Omega Updates](https://github.com/freebsd/freebsd-wifi-build/wiki/Onion-Omega) ###

* I have a newer kernel config that will be committed soon that hooks up the system LED, and the three LEDs on the expansion dock via /dev/led
* I also have the I2C interface working to talk to the Relay and Servo expansions
* I have not determined the exact protocol for the Servo expansions, but the relay expansion is fairly simple to operate
* Instructions have been added to the wiki
* I have managed to use the GPIO to toggle external LEDs and to read the value from a switch
* I have also used the Servo PWM controller to dim an LED and control the speed of a PWM computer case fan
* My plan is to operate a 32x32 multi colour LED matrix from the device for an interactive christmas display \*\*\*

### [FreeBSD Mastery: ZFS Book review](http://www.cyberciti.biz/datacenter/book-review-freebsd-mastery-zfs/) ###

* Book can be [purchased here](http://smile.amazon.com/FreeBSD-Mastery-ZFS-7/dp/0692452354/)
* or [from the list of vendors including directly from the author here](http://www.zfsbook.com/) \*\*\*

Beastie Bits
----------

[Computer History Museum is looking for Bell Labs UNIX](http://www.computerhistory.org/artifactdonation/)

[ACM Queue Portrait: Robert Watson ](https://youtu.be/rA_5Cz99z28)

[Video Collection about BSD History, put together by FreeBSDNews](https://www.freebsdnews.com/2015/11/12/bsd-videos/)

[Minix announces its 2016 conference](http://www.minix3.org/conference/2016/)

[Chris Henschen from fP Technologies' talk about BSD is now online](http://bsdtalk.blogspot.com/2015/10/bsdtalk258-chris-henschen-from-fp.html)

[Mike Larkin and Theo de Raadt's talks from Hackfest this year in Quebec are online](http://undeadly.org/cgi?action=article&sid=20151123161651&mode=expanded)

[FreeBSD on a BeagleBoneBlack with a Touchscreen Display](http://kernelnomicon.org/?p=534)

[Dan Langille will be talking at CINLUG](http://www.cinlug.org/meetings/2015/December)

Feedback/Questions
----------

* [John - Rpi2 and BSD](http://slexy.org/view/s2Gm06eC0Y)
* [Roger - Win10 + FreeBSD](http://slexy.org/view/s2Kf2FG84H)
* [ Anonymous - Sharing Socket](http://slexy.org/view/s21bOG5UhS)
* [ Brad - Scrub Repaired](http://slexy.org/view/s20bKjCNXW)
* [ Kelly - Automated Provisioning](http://slexy.org/view/s2qb07BC2G) \*\*\*