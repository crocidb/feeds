+++
title = "120: I’m talking about the man in the middle"
description = "This week on BSDNow, we are going to be talking to Pawel about how hisThis episode was brought to you byiXsystems - Enterprise Servers and Storage for Open Source[![DigitalOcean - Simple Cloud Hosting, Built for Devel"
date = "2015-12-16T13:00:00Z"
url = "https://www.bsdnow.tv/120"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.079832268Z"
seen = false
+++

This week on BSDNow, we are going to be talking to Pawel about how his

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

#### [iX Systems Mission Complete](https://www.ixsystems.com/missioncomplete/) ####

* Submit your story of how you accomplished a mission with FreeBSD, FreeNAS, or iXsystems hardware, and you could win monthly prizes, and have your story featured in the FreeBSD Journal! \*\*\*

Headlines
----------

### Note the recent passing of 2 members of the BSD community ###

* [Juergen Lock / Nox](https://www.freebsd.org/doc/en_US.ISO8859-1/articles/contributors/contrib-develinmemoriam.html)
* [Benjamin Perrault / creepingfur](https://twitter.com/michaeldexter/status/676290499389485057) [Memories from Michael Dexter ](http://pastebin.com/4BQ5uVsT)
* [Additional Memories ](http://www.filis.org/rip_ben.txt)
  * [Benjamin and Allan at Ben’s local bar ](http://www.allanjude.com/bsd/bp/IMG_20151101_161727-auto.jpg)
  * [Benjamin treated Allan and Michael Dexter to their first ever Bermese food ](http://www.allanjude.com/bsd/bp/IMG_20151101_191344-auto.jpg)
  * [Benjamin enjoying the hallway track at EuroBSDCon 2015 ](http://www.allanjude.com/bsd/bp/IMG_20151003_105457-auto.jpg) \*\*\*

### [NGINX as Reverse Proxy for Apache on FreeBSD 10.2](http://linoxide.com/linux-how-to/install-nginx-reverse-proxy-apache-freebsd-10-2/) ###

* A tutorial on setting up NGINX as a reverse proxy for Apache
* Sometimes your users or application require some feature of Apache, that cannot be easily replicated in NGINX, like .htaccess files or a custom apache module
* In addition, because the default worker model in Apache does not accept new work until it is finished sending the request, a user with a slow connection can tie down that worker for a long time
* With NGINX as a reverse proxy, it will receive the data from the Apache worker over localhost, freeing that worker to answer the next request, while NGINX takes care of sending the data to the user
* The tutorial walks through the setup, which is very easy on modern FreeBSD
* One could also add mod\_rpaf2 to the Apache, to securely pass through the users’ real IP address for use by Apache’s logging and the PHP scripts \*\*\*

### [FreeBSD and FreeNAS in Business by Randy Westlund](http://bsdmag.org/freebsd_freenas/) ###

* The story of how a Tent & Awning company switched from managing orders with paper, to a computerized system backed by a FreeNAS
* “At first, I looked at off-the-shelf solutions. I found a number of cloud services that were like Dropbox, but with some generic management stuff layered on top. Not only did these all feel like a poor solution, they were very expensive. If the provider were to go out of business, what would happen to my dad’s company?”
* “Fortunately, sourcing the hardware and setting up the OS was the easiest part; I talked to iXsystems. I ordered a FreeNAS Mini and a nice workstation tower”
* “I have r2d2 (the tower, which hosts the database) replicating ZFS snapshots to c3po (the FreeNAS mini), and the data is backed up off-site regularly. This data is absolutely mission-critical, so I can’t take any risks. I’m glad I have ZFS on my side.”
* “I replaced Dropbox with Samba on c3po, and the Windows machines in the office now store important data on the NAS, rather than their local drives.”
* “I also replaced their router with an APU board running pfSense and replaced their PPTP VPN with OpenVPN and certificate authorization.”
* “FreeBSD (in three different incarnations) helped me focus on improving the company’s workflow without spending much time on the OS. And now there’s an awning company that is, in a very real sense, powered by FreeBSD.” \*\*\*

### [Tutorial, Windows running under bhyve](http://pr1ntf.xyz/windowsunderbhyve.html) ###

* With the recent passing of the world’s foremost expert on running Windows under bhyve on FreeBSD, this tutorial will help you get up to speed
* “The secret sauce to getting Windows running under bhyve is the new UEFI support. This is pretty great news, because when you utilize UEFI in bhyve, you don't have to load the operating system in bhyveload or grub-bhyve first.”
* The author works on iohyve, and wanted to migrate away from VirtualBox, the only thing stopping that was support for Windows Guests
* iohyve now has support for managing Windows VMs
* The tutorial uses a script to extract the Windows Server 2008 ISO and set up AutoUnattend.xml to handle the installation of Windows, including setting the default administrator password, this is required because there is no graphical console yet
* The AutoUnattended setup also includes setting the IP address, laying out the partitions, and configuring the serial console
* A second script is then used to make a new ISO with the modifications
* The user is directed to fetch the UEFI firmware and some other bits
* Then iohyve is used to create the Windows VM
* The first boot uses the newly created ISO to install Windows Server 2008
* Subsequent boots start Windows directly from the virtual disk
* Remote Desktop is enabled, so the user can manage the Windows Server graphically, using FreeRDP or a Windows client
* iohyve can then be used to take snapshots of the machine, and clone it \*\*\*

### [BSD Router Project has released 1.58](http://sourceforge.net/projects/bsdrp/files/BSD_Router_Project/1.58/) ###

* The BSD Router project has announced the release of version 1.58 with some notable new features
* Update to FreeBSD 10.2-RELEASE-p8
* Disabled some Chelsio Nic features not used by a router
* Added new easy installation helper option, use with “system install ”
* Added the debugging symbols for userland
* Includes the iperf package, and flashrom package, which allows updating system BIOS on supported boxes
* IMPORTANT: Corrects an important UFS label bug introduced on 1.57. If you are running 1.57, you will need to fetch their fixlabel.sh script before upgrading to 1.58 \*\*\*

### [OPNsense 15.7.22 Released](https://opnsense.org/opnsense-15-7-22-released/) ###

* An update to OPNsense has landed this week which includes the important updates to OpenSSL 1.0.2e and LibreSSL 2.2.5
* A long-standing annoying bug with filter reload timeouts has finally been identified and sorted out as well, allowing the functionality to run quickly and “glitch free” again.
* Some newer ports for curl (7.46), squid (3.5.12) and lighttpd (1.4.38) have also been thrown in for good measure
* Some other minor UI fixes have also been included as well
* With the holidays coming up, if you are still running a consumer router, this may be a good time to convert over to a OPNsense or PFsense box and get yourself ready for the new year. \*\*\*

iXsystems
----------

* [iXSystems releases vCenter Web Client Plug-in for TrueNAS](https://www.ixsystems.com/whats-new/2015/12/vcenter-web-client-plug-in-for-truenas-now-available/)

Interview - Pawel Jakub Dawidek - [pjd@FreeBSD.org](mailto:pjd@FreeBSD.org)
----------

---

News Roundup
----------

### [Developer claims the PS4 has been jail-broken](http://www.networkworld.com/article/3014714/security/developer-claims-ps4-officially-jailbroken.html) ###

* While not exactly a well-kept secret, the PS4’s proprietary “OrbOS” is FreeBSD based.
* Using this knowledge and a Kernel exploit, developer CTurt ([https://twitter.com/CTurtE/](https://twitter.com/CTurtE/)) claims he was able jailbreak a WebKit process and gain access to the system.
* He has posted a small tease to GitHub, detailing some of the information gleaned from the exploit, such as PID list and root FS dump
* As such with these kinds of jailbreaks, he already requested that users stop sending him requests about game piracy, but the ability to hack on / run homebrew apps on the PS4 seems intriguing \*\*\*

### [Sepherosa Ziehau is looking for testers if you have a em(4), emx(4), or igb(4) Intel device](http://lists.dragonflybsd.org/pipermail/users/2015-December/228461.html) ###

* DragonFly Testers wanted! Sephe has posted a request for users of the em(4), emx(4) and igb(4) intel drivers to test his latest branch and report back results
* He mentions that he has tested the models 82571, 82574 and 82573 (em/emx); 82575, 82576, 82580 and i350 specifically, so if you have something different, I’m sure he would be much appreciative of the help.
* It looks like the em(4) driver has been updated to 7.5.2, and igb(4) 2.4.3, and adds support for the I219-LM and I219-V NICS. \*\*\*

### [OpenBSD Xen Support](https://marc.info/?l=openbsd-tech&m=144933933119525&w=2) ###

* Filed under the “Ohh, look what’s coming soon” section, it appears that patches are starting to surface for OpenBSD Xen DOMU support.
* For those who aren’t up on their Xen terminology, DomU is the unprivileged domain (I.E. Guest mode)
* Right now the patch exists at the link above, and adds a new (commented out) device to the GENERIC kernel, but this gives Xen users something new to watch for updates to. \*\*\*

### [Thinkpad Backlit Keyboard support being worked on](http://freshbsd.org/commit/openbsd/b355449caa22e7bb6c460f7a647874836ef604f0) ###

* Another reason why Lenovo / ThinkPads are some of the best laptops currently to use with BSD, the kettenis over at the OpenBSD project has committed a patch to enable support for the “ThinkLight”
* For those who don’t know, this is the little light that helps illuminate the laptop’s keyboard under low-light situations.
* While the initial patch only supports the “real-deal” ThinkLight, he does mention that support will be added soon for the others on ThinkPads
* No sysctl’s to fiddle with, this works directly with the ACPI / keyboard function keys directly, nice! \*\*\*

### [Deadline is approaching for Submissions of Tutorial Proposals for AsiaBSDCon 2016](https://2016.asiabsdcon.org/cfp.html) ###

[Call for Papers for BSDCAN 2016 now open](http://www.bsdcan.org/2016/papers.php)

* The next two major BSD conferences both have their CFP up right now. First up is AsiaBSDCon in Tokyo from March 10th-13th, followed by BSDCan in Ottawa, June 8th-11th.
* If you are working on anything interesting in the BSD community, this is a good way to get the word out about your project, plus the conference pays for Hotel / Travel.
* If you can make it to both, DO SO, you won’t regret it. Both Allan and Kris will be attending and we would look forward to meeting you. \*\*\*

### [iohyve lands in ports](https://github.com/pr1ntf/iohyve) ###

([http://www.freshports.org/sysutils/iohyve/](http://www.freshports.org/sysutils/iohyve/))

* Something we’ve mentioned in passing has taken its first steps in becoming reality for users! “iohyve” has now landed in the FreeBSD ports tree
* While it shares a similar name to “iocage” its not directly related, different developers and such. However it does share a very similar syntax and some principles of ZFS usage
* The current version is 0.7, but it already has a rather large feature set
* Among the current features are ISO Management, resource management, snapshot support (via ZFS), and support for OpenBSD, NetBSD and Linux (Using grub-bhyve port) \*\*\*

BeastieBits
----------

[hammer mount is forced noatime by default](http://lists.dragonflybsd.org/pipermail/users/2015-November/228445.html)

[Show your support for FreeBSD](http://freebsdfoundation.blogspot.com/2015/12/show-your-support-for-freebsd.html)

[OpenBSD running in an Amazon EC2 t2.micro](https://gist.github.com/reyk/e23fde95354d4bc35a40)

[NetBSD's 2015Q4 Package freeze is coming](http://mail-index.netbsd.org/tech-pkg/2015/12/05/msg016059.html)

[‘Screenshots from Developers’ that we covered previously from 2002, updated for 2015 ](https://anders.unix.se/2015/12/10/screenshots-from-developers--2002-vs.-2015/)

---

Feedback/Questions (slexy was down when I made these, I only did 3, since the last is really long, save rest for next week)
----------

* [ Mark - BSD laptops](http://pastebin.com/g0DnFG95)
* [ Jamie - zxfer](http://pastebin.com/BNCmDgTe)
* [ Anonymous - Long Story](http://pastebin.com/iw0dXZ9P) \*\*\*