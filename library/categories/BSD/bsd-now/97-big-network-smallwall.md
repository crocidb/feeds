+++
title = "97: Big Network, SmallWall"
description = "Coming up this time on the show, we'll be chatting with Lee Sharp. He's recently revived the m0n0wall codebase, now known as SmallWall, and we'll find out what the future holds for this new addition to the BSD family. Answers to your emails and all this week's news, on BSD Now - "
date = "2015-07-08T12:00:00Z"
url = "https://www.bsdnow.tv/97"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.125820632Z"
seen = false
+++

Coming up this time on the show, we'll be chatting with Lee Sharp. He's recently revived the m0n0wall codebase, now known as SmallWall, and we'll find out what the future holds for this new addition to the BSD family. Answers to your emails and all this week's news, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [BSDCan and pkgsrcCon videos](https://www.youtube.com/channel/UCAEx6zhR2sD2pAGKezasAjA/videos) ###

* Even more BSDCan 2015 videos are slowly but surely making their way to the internet
* Nigel Williams, [Multipath TCP for FreeBSD](https://www.youtube.com/watch?v=P3vB_FWtyIs)
* Stephen Bourne, [Early days of Unix and design of sh](https://www.youtube.com/watch?v=2kEJoWfobpA)
* John Criswell, [Protecting FreeBSD with Secure Virtual Architecture](https://www.youtube.com/watch?v=hRIC_aF_u24)
* Shany Michaely, [Expanding RDMA capability over Ethernet in FreeBSD](https://www.youtube.com/watch?v=stsaeKvF3no)
* John-Mark Gurney, [Adding AES-ICM and AES-GCM to OpenCrypto](https://www.youtube.com/watch?v=JaufZ7yCrLU)
* Sevan Janiyan, [Adventures in building](https://www.youtube.com/watch?v=-HMXyzybgdM) [open source software](https://www.youtube.com/watch?v=Xof-uKnQ6cY)
* And finally, [the BSDCan 2015 closing](https://www.youtube.com/watch?v=Ynm0bGnYdfY)
* Some [videos](https://vimeo.com/channels/pkgsrccon/videos) from this year's [pkgsrcCon](http://pkgsrc.org/pkgsrcCon/2015/) are also starting to appear online
* Sevan Janiyan, [A year of pkgsrc 2014 - 2015](https://vimeo.com/channels/pkgsrccon/132767946)
* Pierre Pronchery, [pkgsrc meets pkg-ng](https://vimeo.com/channels/pkgsrccon/132766052)
* Jonathan Perkin, [pkgsrc at Joyent](https://vimeo.com/channels/pkgsrccon/132760863)
* Jörg Sonnenberger, [pkg\_install script framework](https://vimeo.com/channels/pkgsrccon/132757658)
* Benny Siegert, [New Features in BulkTracker](https://vimeo.com/channels/pkgsrccon/132751897)
* This is the first time we've ever seen recordings from the conference - hopefully they continue this trend \*\*\*

### [OPNsense 15.7 released](https://forum.opnsense.org/index.php?topic=839.0) ###

* The OPNsense team has released version 15.7, almost exactly six months after [their initial debut](http://www.bsdnow.tv/episodes/2015_01_14-common_sense_approach)
* In addition to pulling in the latest security fixes from upstream FreeBSD, 15.7 also includes new integration of an intrusion detection system (and new GUI for it) as well as new blacklisting options for the proxy server
* Taking a note from upstream PF's playbook, ALTQ traffic shaping support has finally been retired as of this release (it was deprecated from OpenBSD a few years ago, and the code was [completely removed](http://undeadly.org/cgi?action=article&sid=20140419151959) just over a year ago)
* The LibreSSL flavor has been promoted to production-ready, and users can easily migrate over from OpenSSL via the GUI - switching between the two is simple; no commitment needed
* Various third party ports have also been bumped up to their latest versions to keep things fresh, and there's the usual round of bug fixes included
* Shortly afterwards, [15.7.1](https://forum.opnsense.org/index.php?topic=915.0) was released with a few more small fixes \*\*\*

### [NetBSD at Open Source Conference 2015 Okinawa](https://mail-index.netbsd.org/netbsd-advocacy/2015/07/04/msg000688.html) ###

* If you liked [last week's episode](http://www.bsdnow.tv/episodes/2015_07_01-lost_technology) then you'll probably know what to expect with this one
* The NetBSD users group of Japan hit another open source conference, this time in Okinawa
* This time, they had a few interesting NetBSD machines on display that we didn't get to see in the interview last week
* We'd love to see something like this in North America or Europe too - anyone up for installing BSD on some interesting devices and showing them off at a Linux con? \*\*\*

### [OpenBSD BGP and VRFs](http://firstyear.id.au/entry/21) ###

* "[VRFs](https://en.wikipedia.org/wiki/Virtual_routing_and_forwarding), or in OpenBSD rdomains, are a simple, yet powerful (and sometimes confusing) topic"
* This article aims to explain both BGP and rdomains, using network diagrams, for some network isolation goodness
* With multiple rdomains, it's also possible to have two upstream internet connections, but lock different groups of your internal network to just one of them
* The idea of a "guest network" can greatly benefit from this separation as well, even allowing for the same IP ranges to be used without issues
* Combining rdomains with the BGP protocol allows for some very selective and precise blocking/passing of traffic between networks, which is also covered in detail here
* The [BSDCan talk on rdomains](https://www.youtube.com/watch?v=BizrC8Zr-YY) expands on the subject a bit more if you haven't seen it, as well as a few [related](https://www.packetmischief.ca/2011/09/20/virtualizing-the-openbsd-routing-table/) [posts](http://cybermashup.com/2013/05/21/complex-routing-with-openbsd/) \*\*\*

Interview - Lee Sharp - [lee@smallwall.org](mailto:lee@smallwall.org)
----------

[SmallWall](http://smallwall.org), a continuation of m0n0wall

---

News Roundup
----------

### [Solaris adopts more BSD goodies](https://blogs.oracle.com/solarisfw/entry/pf_for_solaris) ###

* We mentioned a while back that Oracle developers have begun porting a current version of OpenBSD's PF firewall to their next version, even contributing back patches for SMP and other bug fixes
* They recently published an article about PF, talking about what's different about it on their platform compared to others - not especially useful for BSD users, but interesting to read if you like firewalls
* Darren Moffat, who was part of originally getting an SSH implementation into Solaris, has a [second blog post](https://blogs.oracle.com/darren/entry/openssh_in_solaris_11_3) up about their "SunSSH" fork
* Going forward, their next version is going to offer a completely vanilla OpenSSH option as well, with the plan being to phase out SunSSH after that
* The article talks a bit about the history of getting SSH into the OS, forking the code and also lists some of the differences between the two
* In [a third blog post](https://blogs.oracle.com/darren/entry/solaris_new_system_calls_getentropy), they talk about a new system call they're borrowing from OpenBSD, [getentropy(2)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man2/getentropy.2), as well as the addition of [arc4random](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man3/arc4random.3) to their libc
* With an up-to-date and SMP-capable PF, ZFS with native encryption, jail-like Zones, unaltered OpenSSH and secure entropy calls… is Solaris becoming *better than us*?
* Look forward to the upcoming "Solaris Now" podcast <sub>(not really)</sub> \*\*\*

### [EuroBSDCon 2015 talks and tutorials](https://2015.eurobsdcon.org/talks/) ###

* This year's EuroBSDCon is set to be held in Sweden at the beginning of October, and the preliminary list of accepted presentations has been published
* The list looks pretty well-balanced between the different BSDs, something Paul would be happy to see if he was still with us
* It even includes an interesting DragonFly talk and a couple talks from NetBSD developers, in addition to plenty of FreeBSD and OpenBSD of course
* There are also [a few tutorials](https://2015.eurobsdcon.org/tutorials/) planned for the event, some you've probably seen already and some you haven't
* Registration for the event will be opening very soon (likely this week or next) \*\*\*

### [Using ZFS replication to improve offsite backups](https://www.iceflatline.com/2015/07/using-zfs-replication-features-in-freebsd-to-improve-my-offsite-backups/) ###

* If you take backups seriously, you're probably using ZFS and probably keeping an offsite copy of the data
* This article covers doing just that, but with a focus on making use of the replication capability
* It'll walk you through taking a snapshot of your pool and then replicating it to another remote system, using "zfs send" and SSH - this has the benefit of only transferring the files that have changed since the last time you did it
* Steps are also taken to allow a regular user to take and manage snapshots, so you don't need to be root for the SSH transfer
* Data integrity is a long process - filesystem-level checksums, resistance to hardware failure, ECC memory, multiple copies in different locations... they all play a role in keeping your files secure; don't skip out on any of them
* One thing the author didn't mention in his post: having an **offline** copy of the data, ideally sealed in a safe place, is also important \*\*\*

### [Block encryption in OpenBSD](http://anadoxin.org/blog/blog/20150705/block-encryption-in-openbsd/) ###

* We've [covered](http://www.bsdnow.tv/tutorials/fde) ways to do fully-encrypted installations of OpenBSD (and FreeBSD) before, but that requires dedicating a whole drive or partition to the sensitive data
* This blog post takes you through the process of creating encrypted *containers* in OpenBSD, à la TrueCrypt - that is, a file-backed virtual device with an encrypted filesystem
* It goes through creating a file that looks like random data, pointing **vnconfig** at it, setting up the crypto and finally using it as a fake storage device
* The encrypted container method offers the advantage of being a bit more portable across installations than other ways \*\*\*

### [Docker hits FreeBSD ports](https://svnweb.freebsd.org/ports?view=revision&revision=391421) ###

* The inevitable has happened, and an early FreeBSD port of docker is finally here
* Some [details and directions](https://github.com/kvasdopil/docker/blob/freebsd-compat/FREEBSD-PORTING.md) are available to read if you'd like to give it a try, as well as a list of which features work and which don't
* There was also some [Hacker News discussion](https://news.ycombinator.com/item?id=9840025) on the topic \*\*\*

### [Microsoft donates to OpenSSH](http://undeadly.org/cgi?action=article&sid=20150708134520&mode=flat) ###

* We've talked about big businesses using BSD and contributing back before, even mentioning a few other large public donations - now it's Microsoft's turn
* With their recent decision to integrate OpenSSH into an upcoming Windows release, Microsoft has donated a large sum of money to the OpenBSD foundation, making them a gold-level sponsor
* They've also posted some contract work offers on the OpenSSH mailing list, and say that their changes will be upstreamed if appropriate - we're always glad to see this \*\*\*

Feedback/Questions
----------

* [Joe writes in](http://slexy.org/view/s2NqbhwOoH)
* [Mike writes in](http://slexy.org/view/s2T3NEia98)
* [Randy writes in](http://slexy.org/view/s20RlTK6Ha)
* [Tony writes in](http://slexy.org/view/s2rjCd0bGX)
* [Kevin writes in](http://slexy.org/view/s21PfSIyG5) \*\*\*