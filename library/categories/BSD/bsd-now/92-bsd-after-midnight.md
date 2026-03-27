+++
title = "92: BSD After Midnight"
description = "Coming up this week, we'll be chatting with Lucas Holt, founder of MidnightBSD. It's a slightly lesser-known fork of FreeBSD, with a focus on easy desktop use. We'll find out what's different about it and why it was created. Answers to your emails and all this week's news, on BSD"
date = "2015-06-03T12:00:00Z"
url = "https://www.bsdnow.tv/92"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.135912265Z"
seen = false
+++

Coming up this week, we'll be chatting with Lucas Holt, founder of MidnightBSD. It's a slightly lesser-known fork of FreeBSD, with a focus on easy desktop use. We'll find out what's different about it and why it was created. Answers to your emails and all this week's news, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Zocker, it's like docker on FreeBSD](http://toni.yweb.fi/2015/05/zocker-diy-docker-on-freebsd.html) ###

* Containment is always a hot topic, and docker has gotten a lot of hype in Linux land in the last couple years - they're working on native FreeBSD support at the moment
* This blog post is about a docker-*like* script, mainly for ease-of-use, that uses only jails and ZFS in the base system
* In total, it's [1,500 lines of shell script](https://github.com/toddnni/zocker)
* The post goes through the process of using the tool, showing off all the subcommands and explaining the configuration
* In contrast to something like ezjail, Zocker utilizes the jail.conf system in the 10.x branch \*\*\*

### [Patrol Read in OpenBSD](https://www.marc.info/?l=openbsd-cvs&m=143285964216970&w=4) ###

* OpenBSD has recently imported some new code to support the [Patrol Read](http://www.intel.com/support/motherboards/server/sb/CS-028742.htm) function of some RAID controllers
* In a nutshell, Patrol Read is a function that lets you check the health of your drives in the background, similar to a zpool "scrub" operation
* The goal is to protect file integrity by detecting drive failures before they can damage your data
* It detects bad blocks and prevents silent data corruption, while marking any bad sectors it finds \*\*\*

### [HAMMER 2 improvements](http://lists.dragonflybsd.org/pipermail/commits/2015-May/418653.html) ###

* DragonFly BSD has been working on the second generation HAMMER FS
* It now uses LZ4 compression by default, which we've been big fans of in ZFS
* They've also switched to a [faster CRC](http://lists.dragonflybsd.org/pipermail/commits/2015-May/418652.html) algorithm, further improving HAMMER's performance, [especially](http://lists.dragonflybsd.org/pipermail/commits/2015-May/418651.html) when using iSCSI \*\*\*

### [FreeBSD foundation May update](https://www.freebsdfoundation.org/press/2015mayupdate.pdf) ###

* The FreeBSD foundation has published another update newsletter, detailing some of the things they've been up to lately
* In it, you'll find some development status updates: notably more ARM64 work and the addition of 64 bit Linux emulation
* Some improvements were also made to FreeBSD's release building process for non-X86 architectures
* There's also an AsiaBSDCon recap that covers some of the presentations and the dev events
* They also have an accompanying [blog post](http://freebsdfoundation.blogspot.com/2015/05/another-data-center-site-visit-nyi.html) where Glen Barber talks about more sysadmin and clusteradm work at NYI \*\*\*

Interview - Lucas Holt - [questions@midnightbsd.org](mailto:questions@midnightbsd.org) / [@midnightbsd](https://twitter.com/midnightbsd)
----------

MidnightBSD

---

News Roundup
----------

### [The launchd on train is never coming](http://homepage.ntlworld.com/jonathan.deboynepollard/FGA/launchd-on-bsd.html) ###

* Replacement of init systems has been quite controversial in the last few years
* Fortunately, the BSDs have avoided most of that conflict thus far, but there have been a few efforts made to port [launchd from OS X](https://en.wikipedia.org/wiki/Launchd)
* This blog post details the author's opinion on why he thinks we're never going to have launchd in any of the BSDs
* Email us your thoughts on the matter \*\*\*

### [Native SSH comes to… Windows](http://blogs.msdn.com/b/looking_forward_microsoft__support_for_secure_shell_ssh1/archive/2015/06/02/managing-looking-forward-microsoft-support-for-secure-shell-ssh.aspx) ###

* In what may be the first (and last) mention of Microsoft on BSD Now...
* They've just recently announced that PowerShell will get native SSH support in the near future
* It's not based on the commercial SSH either, it's the same one from OpenBSD that we already use everywhere
* Up until now, interacting between BSD and Windows has required something like PuTTY, WinSCP, FileZilla or Cygwin - most of which are based on really outdated versions
* The announcement also promises that they'll be working with the OpenSSH community, so we'll see how many Microsoft-submitted patches make it upstream (or how many [donations](http://www.openbsdfoundation.org/index.html) they make) \*\*\*

### [Moving to FreeBSD](http://www.textplain.net/blog/2015/moving-to-freebsd/) ###

* This blog post describes a long-time Linux user's first BSD switching experience
* The author first talks about his Linux journey, eventually coming to love the more customization-friendly systems, but the journey ended with systemd
* After doing a bit of research, he gave FreeBSD a try and ended up liking it - the rest of the post mostly covers why that is
* He also plans to write about his experience with other BSDs, and is writing some tutorials too - we'll check in with him again later on \*\*\*

Feedback/Questions
----------

* [Adam writes in](http://slexy.org/view/s29hS2cI05)
* [Dan writes in](http://slexy.org/view/s20VRZYBsw)
* [Ivan writes in](http://slexy.org/view/s20bumJ5u9)
* [Josh writes in](http://slexy.org/view/s21BU6Pnka) \*\*\*