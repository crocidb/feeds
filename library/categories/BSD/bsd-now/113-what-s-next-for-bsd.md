+++
title = "113: What’s Next for BSD?"
description = 'Coming up on this week’s episode, we have an interviewThis episode was brought to you by src="/images/1.png" alt="iXsystems - Enterprise    Servers and Storage for Open Source" /\[ href="http://www.digitalocean.com/" title="Digit'
date = "2015-10-28T12:00:00Z"
url = "https://www.bsdnow.tv/113"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.093706308Z"
seen = true
+++

Coming up on this week’s episode, we have an interview

This episode was brought to you by
----------

[![]() src="/images/1.png" alt="iXsystems - Enterprise   
 Servers and Storage for Open Source" /\>](http://www.ixsystems.com/bsdnow)[ href="http://www.digitalocean.com/" title="DigitalOcean"\>![]() src="/images/2.png" alt="DigitalOcean - Simple Cloud   
 Hosting, Built for Developers" /\>]()[ href="http://www.tarsnap.com/bsdnow" title="Tarsnap"\>![]() src="/images/3.png" alt="Tarsnap - Online Backups   
 for the Truly Paranoid" /\>]()

#### [iX Systems Mission Complete](https://www.ixsystems.com/missioncomplete/) ####

* Submit your story of how you accomplished a mission with FreeBSD, FreeNAS, or iXsystems hardware, and you could win monthly prizes, and have your story featured in the FreeBSD Journal! \*\*\*

Headlines
----------

### [OpenBSD 5.8 is released on the 20th birthday of the OpenBSD project](http://bsdsec.net/articles/openbsd-5-8-released) ###

* 5.8 has landed, and just in time for the 20th birthday of OpenBSD, Oct 18th
* A long list of changes can be found on the release announcement, but here’s a small scattering of them
* Drivers for new hardware, such as:
  * rtwn = Realtek RTL8188CE wifi
  * hpb = HyperTransport bridge in IBM CPC945
  * Improved sensor support for upd driver (USB power devices)
  * Jumbo frame support on re driver, using RTL8168C/D/E/F/G and RTL8411

* Updated to installer, improve autoinstall, and questions about SSH setup
* Sudo in base has been replace with “doas”, sudo moved to package tree
* New file(1) command with sandboxing and priv separation
* The tame(2) API WiP
* Improvements to the httpd(8) daemon, such as support for lua pattern matching redirections
* Bugfixes and the security updates to OpenSMTPD 5.4.4
* LibreSSL security fixes, removed SSLv3 support from openssl(1) (Still working on nuking SSLv3 from all ports)
* And much more, too much to mention here, read the notes for all the gory details!

---

OpenBSD Developer Interviews
----------

* To go along with the 20th birthday, we have a whole slew of new interviews brought to us by the beastie.pl team. English and Polish are both provided, so be sure not to miss these!
  * [Dmitrij D. Czarkoff](http://beastie.pl/deweloperzy-openbsd-dmitrij-d-czarkoff/)
  * [Vadim Zhukov](http://beastie.pl/deweloperzy-openbsd-vadim-zhukov/)
  * [Marc Espie](http://beastie.pl/deweloperzy-openbsd-marc-espie/)
  * [Bryan Steele](http://beastie.pl/deweloperzy-openbsd-bryan-steele/)
  * [Ingo Schwarze](http://beastie.pl/deweloperzy-openbsd-ingo-schwarze/)
  * [Gilles Chehade](http://beastie.pl/deweloperzy-openbsd-gilles-chehade/)

---

### [Jean-Sébastien Pédron has submitted a call for testing out the neIntel i915 driver](http://lists.freebsd.org/pipermail/freebsd-x11/2015-October/016758.html) ###

* A very eagerly awaited feature, Haswell GPU support has begun the testing process
* The main developer, Jean-Sébastien Pédron [dumbbell@freebsd.org](mailto:dumbbell@freebsd.org) looking for users to test the patch, both those that have older supported cards (Sandybridge, Ivybridge) that are currently working, and users with Haswell devices that have, until now, not been supported
* Included is a link to the Wiki with instructions on how to enable debugging, and grab the updated branch of FreeBSD with the graphical improvements. Jean-Sébastien is calling for testers to send results both good and bad over to the freebsd-x11 mailing lists
* For those who want an “out of box solution” the next PC-BSD 11.0-CURRENT November images will include these changes as well

---

### [How to install FreeBSD on a Raspberry Pi 2](http://www.cyberciti.biz/faq/how-to-install-freebsd-on-raspberry-pi-2-model-b/) ###

* We have a nice walkthrough this week on how to install FreeBSD, both 10 or 11-CURRENT on a RPi 2!
* The walkthrough shows us how to use OSX to copy the image to SD card, then booting.
* In this case, we have him using a USB to serial cable to capture output with screen
* This is a pretty quick way for users sitting on a RPi2 to get up and running with FreeBSD

---

Interview - Jordan Hubbard - [jkh@ixsystems.com](mailto:email@email)
----------

[NextBSD](http://www.nextbsd.org/) | [NextBSD Github](https://github.com/NextBSD/NextBSD)

---

Beastie Bits
----------

[OpenBSD's Source Tree turned 20 on October 18th](https://marc.info/?l=openbsd-misc&m=144515087006177&w=2)

[GhostBSD working on Graphical ZFS Configuration Utility](https://plus.google.com/+GhostbsdOrg/posts/JoNZzrKrhtB)

[EuroBSDcon 2014 videos finally online](https://www.youtube.com/channel/UCz6C-szau90f9Vn07A6W2aA/videos)

[Postdoctoral research position at Memorial University is open](http://www.mun.ca/postdoc/tc-postdoc-2015.pdf)

[NetBSD Security Advisory: TCP LAST\_ACK memory exhaustion, reported by NetFlix and Juniper ](http://ftp.netbsd.org/pub/NetBSD/security/advisories/NetBSD-SA2015-009.txt.asc)

[DesktopBSD making a comeback?](http://www.desktopbsd.net/forums/threads/desktopbsd-2-0-roadmap.798/)

---

Feedback/Questions
----------

* [ Steve ](http://slexy.org/view/s20PllfFXt)
* [ Ben ](http://slexy.org/view/s21jJm1lFN)
* [ Frank ](http://slexy.org/view/s20TsrN3uq)
* [ Tyler ](http://slexy.org/view/s20AydOevW)

---