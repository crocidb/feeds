+++
title = "168: The Post Show Show"
description = "This week on BSDNow. Allan and I are back from MeetBSD! A good time was had by all, lots to discuss, so let’s jump right into it on your place to B...SD!This episode was brought to you by[iXsystems - Enterprise Servers and Storage for Open Source](http"
date = "2016-11-16T13:00:00Z"
url = "https://www.bsdnow.tv/168"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.981516693Z"
seen = false
+++

This week on BSDNow. Allan and I are back from MeetBSD! A good time was had by all, lots to discuss, so let’s jump right into it on your place to B...SD!

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Build a FreeBSD 11.0-release Openstack Image with bsd-cloudinit](https://raymii.org/s/tutorials/FreeBSD_11.0-release_Openstack_Image.html) ###

>
>
> We are going to prepare a FreeBSD image for Openstack deployment. We do this by creating a FreeBSD 11.0-RELEASE instance, installing it and converting it using bsd-cloudinit. We'll use the CloudVPS public Openstack cloud for this. Create an account there and install the Openstack command line tools, like nova, cinder and glance.
>
>
>
> A FreeBSD image with Cloud Init will automatically resize the disk to the size of the flavor and it will add your SSH key right at boot. You can use Cloud Config to execute a script at first boot, for example, to bootstrap your system into Puppet or Ansible. If you use Ansible to manage OpenStack instances you can integrate it without manually logging in or doing anything manually.
>
>
>
> Since FreeBSD 10.2-RELEASE there is an rc script which, when the file /firstboot exists, expands the root filesystem to the full disk. While bsd-cloudinit does this as well, if you don't need the whole cloudinit stack, (when you use a static ssh key for example), you can touch that file to make sure the disk is expanded at the first boot
>
>

* A detailed tutorial that shows how to create customized cloud images using the FreeBSD install media
* There is also the option of using the FreeBSD release tools to build custom cloud images in a more headless fashion
* Someone should make a tutorial out of that \*\*\*

### [iXsystems Announces TrueOS Launch](https://www.ixsystems.com/blog/ixsystems-announces-trueos-launch/) ###

* As loyal listeners to this show, you’ve no doubt heard by now that we are in the middle of undergoing a shift in moving PC-BSD -\> TrueOS.
* Last week during MeetBSD this was made “official” with iX issuing our press release and I was able to give a talk detailing many of the reasons and things going on with this change.
* The talk should be available online here soon(ish), but for a quick recap:
* TrueOS is moving to a rolling-release model based on FreeBSD -CURRENT
* Lumina has become the default desktop for TrueOS
* LibreSSL is enabled top to bottom
* We are in the middle of working on conversion to OpenRC for run-control replacement
* The TrueOS pico was announced, which is our “Thin-Client” solution, right now allowing you to use a TrueOS server pared with a RPI2 device. \*\*\*

### [Running FreeBSD 11 on Raspberry Pi](https://vzaigrin.wordpress.com/2016/10/16/running-freebsd-11-on-raspberry-pi/) ###

* This article covers some of the changes you will notice if you upgrade your RPI to FreeBSD 11.0
* It covers some of the changes to WiFi in 11.0
* Pro Tip: you can get a list of WiFi devices by doing: sysctl net.wlan.devices
* There are official binary packages for ARM with 11.0, so you can just ‘pkg install’ your favourite apps
* Many of the LEDs are exposed via the /dev/led/ interface, which you can just echo 0 or 1 to, or use morse(6) to send a message
* gpioctl can be used to control the various GPIO pins
* The post also covers how to setup the real-time clock on the Raspberry Pi
* There is also limited support for adjusting the CPU frequency of the Pi
* There are also tips on configuring a one-wire temperature sensor \*\*\*

### [void-zones-tools for FreeBSD](https://github.com/cyclaero/void-zones-tools) ###

* Adblock has been in the news a bit recently, with some of the more popular browser plugins now accepting brib<sup>...contributions</sup> to permit specific ads through.
* Well today the ad-blockers strike back. We have a great tutorial up on GitHub which demonstrates one of the useful features of using Unbound in FreeBSD to do your own ad-blocking with void-zones.
* Specifically, void-zones are a way to return NXDOMAIN when DNS requests are made to known malicious or spam sites.
* Using void-zones-tools software will make managing this easy, by being able to pull in known lists of sites to block from several 3rd party curators.
* When coupled with our past tutorials on setting up your own FreeBSD router, this may become very useful for a lot of folks who want to do ad-blocking ad at a lower level, allowing it to filter smart-phones or any other devices on a network. \*\*\*

News Roundup
----------

### [BSD Socket API Revamp](https://raw.githubusercontent.com/sustrik/dsock/master/rfc/sock-api-revamp-01.txt) ###

* Martin Sustrik has started a draft RFC to revamp the BSD Sockets API:

>
>
> The progress in the area of network protocols is distinctively lagging behind. While every hobbyist new to the art of programming writes and publishes their small JavaScript libraries, there's no such thing going on with network protocols. Indeed, it looks like the field of network protocols is dominated by big companies and academia, just like programming as a whole used to be before the advent of personal computers.
>
>
>
> the API proposed in this document doesn't try to virtualize all possible aspects of all possible protocols and provide a single set of functions to deal with all of them. Instead, it acknowledges how varied the protocol landscape is and how much the requirements for individual protocols differ. Therefore, it lets each protocol define its own API and asks only for bare minimum of standardised behaviour needed to implement protocol composability.
>
>
>
> As a consequence, the new API is much more lightweight and flexible than BSD socket API and allows to decompose today's monolithic protocol monsters into small single-purpose microprotocols that can be easily combined together to achieve desired functionality.
>
>

* The idea behind the new design is to allow the software author to define their own protocols via a generic interface, and easily stack them on top of the existing network protocols, be they the basic protocols like TCP/IP, or a layer 7 protocol like HTTP
* Example of creating a stack of four protocols: \~\~ int s1 = tcp\_connect("192.168.0.111:5555"); int s2 = foo\_start(s1, arg1, arg2, arg3); int s3 = bar\_start(s2); int s4 = baz\_start(s3, arg4, arg5); \~\~
* It also allows applying generic transformations to the protocols: \~\~ int tcps = tcp\_connect("192.168.0.111:80"); /\* Websockets is a connected protocol. */ int ws = websock\_connect(tcps); uint16\_t compression\_algoritm; mrecv(ws, &compression\_algorithm, 2, -1); /* Compression socket is unconnected. */ int cs = compress\_start(ws, compression\_algorithm); \~\~ \**\*

### [Updated version of re(4) for DragonflyBSD](http://lists.dragonflybsd.org/pipermail/users/2016-November/313140.html) ###

* Sephe over at the Dragonfly project has issued a CFT for a newer version of the “re” driver
* For those who don’t know, that is for Realtek nics, specifically his updates add features:

>
>
> I have made an updated version of re(4), which leverages Realtek driver's chip/PHY reset/initialization code. I hope it can resolve all kinds of weirdness we encountered on this chip so far.
>
>

* Testers, you know what to do! Give this a whirl and let him know if you run into any new issues, or better yet, give feedback if it fixes some long-standing problems you’ve run into in the past. \*\*\*

### Hackathon reports from OpenBSD’s B2K16 ###

* [b2k16 hackathon report: Jeremy Evans on ports cleaning, progress on postgres, nginx, ruby and more](http://undeadly.org/cgi?action=article&sid=20161112112023)

* [b2k16 hackathon report: Landry Breuil on various ports progress](http://undeadly.org/cgi?action=article&sid=20161112095902)

* [b2k16 hackathon report: Antoine Jacoutot on GNOME's path forward, various ports progress](http://undeadly.org/cgi?action=article&sid=20161109030623)

* We have a trio of hackathon reports from OpenBSD’s B2K16 (Recently held in Budapest)

* First up - Jeremy Evans give us his rundown which starts with sweeping some of the cruft out of the barn:

>
>
> I started off b2k16 by channeling tedu@, and removing a lot of ports, including lang/ruby/2.0, lang/io, convertors/ruby-json, databases/dbic++, databases/ruby-swift, databases/ruby-jdbc-\*, x11/ruby-profiligacy, and mail/ruby-mailfactory.
>
>

* After that, he talks about improvements made to postgres, nginx and ruby ports, fixing things such as pg\_upgrade support, breaking nginx down into sub-packages and a major ruby update to about 50% of the packages.
* Next up - Landry Breuil tells us about his trip, which also started with some major ports pruning, including some stale XFCE bits and drupal6.
* One of the things he mentions is the Tor browser:

>
>
> Found finally some time again to review properly the pending port for Tor Browser, even if i don't like the way it is developed (600+ patches against upstream firefox-esr !? even if relationship is improving..) nor will endorse its use, i feel that the time that was spent on porting it and updating it and maintaining it shouldn't be lost, and it should get commited - there are only some portswise minor tweaks to fix. Had a bit of discussions about that with other porters...
>
>

* Lastly, Antoine Jacoutot gives us a smaller update on his work:

>
>
> First task of this hackathon was for Jasper and I to upgrade to GNOME 3.22.1 (version 3.22.2 hit the ports tree since). As usual I already updated the core libraries a few days before so that we could start with a nice set of fully updated packages. It ended up being the fastest GNOME update ever, it all went very smoothly. We're still debating the future of GNOME on OpenBSD though. More and more features require systemd interfaces and without a replacement it may not make sense to keep it around. Implementing these interfaces requires time which Jasper and I don't really have these days... Anyway, we'll see.
>
>

* All-n-all, a good trip it sounds like with some much needed hacking taking place. Good to see the cruft getting cleaned up, along with some new exciting ports landing. \*\*\*

### [July to September 2016 Status Report](https://www.freebsd.org/news/status/report-2016-07-2016-09.html) ###

* The latest FreeBSD quarterly status report is out
* It includes the induction of the new Core team, and reports from all of the other teams, including Release Engineering, Port Manager, and the FreeBSD Foundation
* Some other highlights:
* Capsicum Update
  * The Graphics Stack on FreeBSD
  * Using lld, the LLVM Linker, to Link FreeBSD
  * VirtualBox Shared Folders Filesystem

* evdev support (better mouse, keyboard, and multi-touch support)
  * ZFS Code Sync with Latest OpenZFS/Illumos
    * The ARC now mostly stores compressed data, the same as is stored on disk, decompressing them on demand.
    * The L2ARC now stores the same (compressed) data as the ARC without recompression, and its RAM usage was further reduced.
    * The largest size of indirect block possible has been increased from 16KB to 128KB, and speculative prefetching of indirect blocks is now performed.

* Improved ordering of space allocation.
* The SHA-512t256 and Skein hashing algorithms are now supported. \*\*\*

Beastie Bits
----------

* [How to Host Your Own Private GitHub with Gogs](http://www.cs.cmu.edu/afs/cs/user/predragp/www/git.html)
* [Nvidia Adds Telemetry To Latest Drivers](https://yro.slashdot.org/story/16/11/07/1427257/nvidia-adds-telemetry-to-latest-drivers)
* [KnoxBUG Upcoming Meeting](http://knoxbug.org/2016-11-29)

---

Feedback/Questions
----------

* [ William - Show Music](http://pastebin.com/skvEgkLK)
* [ Ray - Mounting a Cell Phone](http://pastebin.com/nMDeSFGM)
* [ Ron - TrueOS + Radeon](http://pastebin.com/p5bC1jKU) (Follow-up - He used nvidia card)
* [ Kurt - ZFS Migration](http://pastebin.com/ud9vEK2C)
* [ Matt Dillon (Yes that Matt Dillon) - vkernels](http://pastebin.com/VPQfsUks) \*\*\*