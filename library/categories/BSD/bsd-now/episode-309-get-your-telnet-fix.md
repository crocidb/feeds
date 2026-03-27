+++
title = "Episode 309: Get Your Telnet Fix"
description = "DragonFlyBSD Project Update - colo upgrade, future trends, resuming ZFS send, realtime bandwidth terminal graph visualization, fixing telnet fixes, a chapter from the FBI’s history with OpenBSD and an OpenSSH vuln, and more.Headlines[DragonFlyBSD Project Update - co"
date = "2019-08-01T03:45:00Z"
url = "https://www.bsdnow.tv/309"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.616875123Z"
seen = false
+++

DragonFlyBSD Project Update - colo upgrade, future trends, resuming ZFS send, realtime bandwidth terminal graph visualization, fixing telnet fixes, a chapter from the FBI’s history with OpenBSD and an OpenSSH vuln, and more.

Headlines
----------

### [DragonFlyBSD Project Update - colo upgrade, future trends](http://lists.dragonflybsd.org/pipermail/users/2019-July/358226.html) ###

>
>
> For the last week I've been testing out a replacement for Monster, our 48-core opteron server. The project will be removing Monster from the colo in a week or two and replacing it with three machines which together will use half the power that Monster did alone.
>
>
>
> The goal is to clear out a little power budget in the colo and to really beef-up our package-building capabilities to reduce the turn-around time needed to test ports syncs and updates to the binary package system.
>
>
>
> Currently we use two blades to do most of the building, plus monster sometimes. The blades take almost a week (120 hours+) to do a full synth run and monster takes around 27.5 hours. But we need to do three bulk builds more or less at the same time... one for the release branch, one for the development branch, and one for staging updates. It just takes too long and its been gnawing at me for a little while.
>
>
>
> Well, Zen 2 to the rescue! These new CPUs can take ECC, there's actually an IPMI mobo available, and they are fast as hell and cheap for what we get.
>
>
>
> The new machines will be two 3900X based servers, plus a dual-xeon system that I already had at home. The 3900X's can each do a full synth run in 24.5 hours and the Xeon can do it in around 31 hours. Monster will be retired. And the crazy thing about this? Monster burns 1000W going full bore. Each of the 3900X servers burns 160W and the Xeon burns 200W. In otherwords, we are replacing 1000W with only 520W and getting roughly 6x the performance efficiency in the upgrade. This tell you just how much more power-efficient machines have become in the last 9 years or so. \> This upgrade will allow us to do full builds for both release and dev in roughly one day instead of seven days, and do it without interfering with staging work that might be happening at the same time.
>
>
>
> Future trends - DragonFlyBSD has reached a bit of a cross-roads. With most of the SMP work now essentially complete across the entire system the main project focus is now on supplying reliable binary ports for release and developer branches, DRM (GPU) support and other UI elements to keep DragonFlyBSD relevant on workstations, and continuing Filesystem work on HAMMER2 to get multi-device and clustering going.
>
>

---

### [Resuming ZFS send](https://www.oshogbo.vexillium.org/blog/66/) ###

>
>
> One of the amazing functionalities of ZFS is the possibility of sending a whole dataset from one place to another. This mechanism is amazing to create backups of your ZFS based machines. Although, there were some issues with this functionality for a long time when a user sent a big chunk of data. What if you would do that over the network and your connection has disappeared? What if your machine was rebooted as you are sending a snapshot?
>
>
>
> For a very long time, you didn't have any options - you had to send a snapshot from the beginning. Now, this limitation was already bad enough. However, another downside of this approach was that all the data which you already send was thrown away. Therefore, ZFS had to go over all this data and remove them from the dataset. Imagine the terabytes of data which you sent via the network was thrown away because as you were sending the last few bytes, the network went off.
>
>
>
> In this short post, I don't want to go over the whole ZFS snapshot infrastructure (if you think that such a post would be useful, please leave a comment). Now, to get back to the point, this infrastructure is used to clone the datasets. Some time ago a new feature called “Resuming ZFS send” was introduced. That means that if there was some problem with transmitting the dataset from one point to another you could resume it or throw them away. But the point is, that yes, you finally have a choice.
>
>

---

News Roundup
----------

### [Realtime bandwidth terminal graph visualization](https://dataswamp.org/~solene/2019-07-19-ttyplot-netstat-openbsd.html) ###

>
>
> If for some reasons you want to visualize your bandwidth traffic on an interface (in or out) in a terminal with a nice graph, here is a small script to do so, involving ttyplot, a nice software making graphics in a terminal.
>
>
>
> The following will works on OpenBSD. You can install ttyplot by pkg\_add ttyplot as root, ttyplot package appeared since OpenBSD 6.5.
>
>

---

### [fixing telnet fixes](https://flak.tedunangst.com/post/fixing-telnet-fixes) ###

>
>
> There’s a FreeBSD commit to telnet. fix a couple of snprintf() buffer overflows. It’s received a bit of attention for various reasons, telnet in 2019?, etc. I thought I’d take a look. Here’s a few random observations.
>
>
>
> 1. The first line is indented with spaces while the others use tabs.
>    
>    
> 2. The correct type for string length is size\_t not unsigned int.
>    
>    
> 3. sizeof(char) is always one. There’s no need to multiply by it.
>    
>    
> 4. If you do need to multiply by a size, this is an unsafe pattern. Use calloc or something similar. (OpenBSD provides reallocarray to avoid zeroing cost of calloc.)
>    
>    
> 5. Return value of malloc doesn’t need to be cast. In fact, should not be, lest you disguise a warning.
>    
>    
> 6. Return value of malloc is not checked for NULL.
>    
>    
> 7. No reason to cast cp to char \* when passing to snprintf. It already is that type. And if it weren’t, what are you doing?
>    
>    
> 8. The whole operation could be simplified by using asprintf.
>    
>    
> 9. Although unlikely (probably impossible here, but more generally), adding the two source lengths together can overflow, resulting in truncation with an unchecked snprintf call. asprintf avoids this failure case.
>    
>    
>
>

---

### [A Chapter from the FBI’s History with OpenBSD and an OpenSSH Vuln](https://twitter.com/RooneyMcNibNug/status/1152327783055601664) ###

>
>
> Earlier this year I FOIAed the FBI for details on allegations of backdoor installed in the IPSEC stack in 2010, originally discussed by OpenBSD devs ([https://marc.info/?l=openbsd-tech&m=129236621626462](https://marc.info/?l=openbsd-tech&m=129236621626462) …) Today, I got an interesting but unexpected responsive record:
>
>

* [Freedom of Information Act: FBI: OpenBSD](https://www.muckrock.com/foi/united-states-of-america-10/foia-fbi-openbsd-70084/)
* [GitHub Repo](<https://github.com/RooneyMcNibNug/FOIA/blob/master/Responsive Docs/OpenBSD/FBI_OpenBSD_response_OCRd.pdf>)

---

Beastie Bits
----------

* [“Sudo Mastery, 2nd Edition” open for tech review](https://mwl.io/archives/4378)
* [FreeBSD Journal: FreeBSD for Makers](https://www.freebsdnews.com/2019/07/12/freebsd-journal-freebsd-for-makers/)
* [OpenBSD and NetBSD machines at Open Source Conference 2019 Nagoya](http://mail-index.netbsd.org/netbsd-advocacy/2019/07/19/msg000808.html)
* [FreeBSD 12.0: WINE Gaming](https://www.youtube.com/watch?v=zuj9pRNR2oM)
* [Introduction to the Structure and Interpretation of TNF (The NetBSD Foundation)](https://www.netbsd.org/gallery/presentations/wiz/pkgsrccon2019/index.html#/)
* [vBSDcon speakers announced](https://www.vbsdcon.com/)

---

Feedback/Questions
----------

* Pat - [NYCBug Aug 7th](http://dpaste.com/21Y1PRM)
* Tyler - [SSH keys vs password](http://dpaste.com/3JEVVEF#wrap)
* Lars - [Tor-Talk](http://dpaste.com/0RAFMXZ)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.