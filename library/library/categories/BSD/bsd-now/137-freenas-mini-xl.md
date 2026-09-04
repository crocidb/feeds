+++
title = "137: FreeNAS Mini XL"
description = "This week on BSD Now, I’m out of town for the week, but we have a special unboxing video to share with you, that you won’t want to miss. That, plus the latest BSD news, is coming your way right now!This episode was brought to you by[![iXsystems - Enterprise Servers and "
date = "2016-04-13T12:00:00Z"
url = "https://www.bsdnow.tv/137"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.045493134Z"
seen = true
+++

This week on BSD Now, I’m out of town for the week, but we have a special unboxing video to share with you, that you won’t want to miss. That, plus the latest BSD news, is coming your way right now!

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Example of a FreeBSD bug hunting session by a simple user](http://blog.cochard.me/2016/01/example-of-freebsd-bug-hunting-session.html) ###

* Don’t be fooled, Olivier Cochard-Labbé is a bit more than just a FreeBSD user
* Original founder of the FreeNAS project many years ago, and currently leads the BSD Router Project (designed as a replacement for “Big Iron” routers like Cisco’s etc)
* However, he is not actually a committer on any of the BSD projects, and is mostly focused on networking, rather than development, so it is fair to call him a user
* He walks us through a bug hunting session that started when he updated his wireless router
* “My wireless-router configuration was complex: it involves routing, wireless in hostap mode, ipfw, snort, bridge, openvpn, etc.”
* Provides helpful advice on writing problem reports to developers, including trying to reproduce your issue with as minimal a setup as possible. This both reduces the amount of setup a developer has to do to try to recreate your issue, and can often make it more obvious where the problem actually lies
* As you might expect, the more he researched the problem, the more questions he had
* The journey goes through the kernel debugger, learning dtrace, and reading some source code
* In the end it seems the problem is that the bridge interface marks itself as down if none of the interfaces are in an ‘UP’ state. The wireless interface was in the unknown state, and was actually up, but when the wired interface was disconnected, this caused the bridge to mark it self as down. \*\*\*

### [How-to Install OpenBSD 5.9 plus XFCE desktop and basic applications](http://ribalinux.blogspot.com/2016/04/how-to-install-openbsd-59-plus-xfce.html) ###

* Now this is the way to do videos. Over at the RibaLinux blogspot site, we have a great video showing how to setup and install OpenBSD 5.9 with XFCE and basic desktop applications.
* Along with the video tutorial, another nicety is the commands-used script, so you can see exactly how the setup was done, without having to pause/rewind the video to keep up. [How to install PC-BSD 10.3](http://ribalinux.blogspot.com/2016/04/how-to-install-pc-bsd-103.html)
* In addition to the OpenBSD 5.9 setup video, they just published a PC-BSD 10.3 installation video as well, check it out! \*\*\*

### [FreeBSD on xhyve tutorial](https://gist.github.com/tanb/f8fefa22332edc7a641d) ###

* Originally only able to boot linux, xhyve, a “sort of” port of bhyve to OS X, can now run FreeBSD
* This tutorial makes it much easier, providing a script
* There are a few small command line flag differences from bhyve on FreeBSD
* The tutorial also covers sharing a directory between the guest and the host, resizing and growing the disk for the guest, and converting a QEMU image to be run under xhyve \*\*\*

### [How to Configure SSHguard With IPFW Firewall On FreeBSD](http://www.unixmen.com/configure-sshguard-ipfw-firewall-freebsd) ###

* It’s been a while, but UNIXMen has dropped on us another FreeBSD tutorial, this time on how to setup IPFW and ‘sshguard’ to protect your system.
* In this tutorial they first lay down the rationale for picking IPFW as the firewall, but the reasons mainly boil down to IPFW being developed primarily on FreeBSD, and as such isn’t lagging behind when it comes to features / support.
* Interestingly enough, they also go the route of adding their own /usr/local/etc/rc.firewall script which will be used to specify TCP/UDP ports to open through IPFW via the rc.conf file
* Once that setup is complete (which you can just copy-n-paste) they then move onto ‘sshguard’ setup.
* Specifically you’ll need to be sure to install the correct port/pkg, sshguard-ipfw in order to work in this setup, although sshguard-pf and friends are available also.
* The article mentions that the name ‘sshguard’ can also be misleading, since it can be used to detect brute force attempts into a number of services.
* From there a bunch of configuration is thrown at you, which will allow you to start making the most out of sshguard’s potential, well worth your read if you are using IPFW, or even PF and want to get the basics down of using sshguard properly. \*\*\*

FreeNAS Mini XL Video Unboxing
----------

---

Beastie Bits
----------

[Amazon lists FreeBSD as 'Other Linux'](https://i.imgur.com/NJ7lpso.png)

[sbin/hammer: Make hammer commands print root volume path](http://lists.dragonflybsd.org/pipermail/commits/2016-April/459667.html)

[sbin/hammer: Print volume list after volume-add|del](http://lists.dragonflybsd.org/pipermail/commits/2016-April/459674.html)

[Front cover reveal for the upcoming 'FreeBSD Mastery: Advanced ZFS" book](https://twitter.com/mwlauthor/status/716328414072872960)

If you don’t already have one, get your [FreeBSD Pillow](http://linuxpillow.blogspot.com/2016/03/world-backup-day.html)

---

Feedback/Questions
----------

* [ Daniel - SysVIPC](http://pastebin.com/raw/JBbMj87t)
* [ Shane - OpenToonz](http://pastebin.com/raw/54ngYVEN) \*\*\*