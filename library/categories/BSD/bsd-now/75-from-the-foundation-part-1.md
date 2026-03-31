+++
title = "75: From the Foundation (Part 1)"
description = "This week on the show, we'll be starting a two-part series detailing the activities of various BSD foundations. Ed Maste from the FreeBSD foundation will be joining us this time, and we'll talk about what all they've been up to lately. All this week's news and answers to viewer-s"
date = "2015-02-04T13:00:00Z"
url = "https://www.bsdnow.tv/75"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.170085009Z"
seen = true
+++

This week on the show, we'll be starting a two-part series detailing the activities of various BSD foundations. Ed Maste from the FreeBSD foundation will be joining us this time, and we'll talk about what all they've been up to lately. All this week's news and answers to viewer-submitted questions, coming up on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Key rotation in OpenSSH 6.8](http://blog.djm.net.au/2015/02/key-rotation-in-openssh-68.html) ###

* [Damien Miller](http://www.bsdnow.tv/episodes/2013_12_18-cryptocrystalline) posted a new blog entry about one of the features in the upcoming OpenSSH 6.8
* Times changes, key types change, problems are found with old algorithms and we switch to new ones
* In OpenSSH (and the SSH protocol) however, there hasn't been an easy way to rotate host keys... until now
* With this change, when you connect to a server, it will log *all* the server's public keys in your known\_hosts file, instead of just the first one used during the key exchange
* Keys that are in your known\_hosts file but not on the server will get automatically removed
* This fixes the problem of old servers still authenticating with ancient DSA or small RSA keys, as well as providing a way for the server to rotate keys every so often
* There are some instructions in the blog post for how you'll be able to rotate host keys and eventually phase out the older ones - it's really simple
* There are a lot of big changes coming in OpenSSH 6.8, so we'll be sure to cover them all when it's released \*\*\*

### [NetBSD Banana Pi images](https://mail-index.netbsd.org/port-arm/2015/01/30/msg002809.html) ###

* We've talked about the [Banana Pi](http://www.bananapi.org/p/product.html) a bit before - it's a small ARM board that's comparable to the popular Raspberry Pi
* Some NetBSD -current images were posted on the mailing list, so now you can get some BSD action on one of these little devices
* There are even a set of prebuilt pkgsrc packages, so you won't have to compile everything initially
* The email includes some steps to get everything working and an overview of what comes with the image
* Also check [the wiki page](https://wiki.netbsd.org/ports/evbarm/allwinner/) for some related boards and further instructions on getting set up
* On a related note, NetBSD also recently [got GPU acceleration working](https://blog.netbsd.org/tnf/entry/raspberry_pi_gpu_acceleration_in) for the Raspberry Pi (which is a first for their ARM port) \*\*\*

### [LibreSSL shirts and other BSD goodies](https://www.marc.info/?l=openbsd-misc&m=142255048510669&w=2) ###

* If you've been keeping up with the LibreSSL saga and want a shirt to show your support, they're finally available to buy online
* There are two versions, either "[keep calm and use LibreSSL](https://shop.openbsdeurope.com/images/shop_openbsdeurope_com/products/large/TSHIRTLSSL.jpg)" or the slightly more snarky "[keep calm and abandon OpenSSL](https://shop.openbsdeurope.com/images/shop_openbsdeurope_com/products/large/TSHIRTOSSL.jpg)"
* While on the topic, we thought it would be good to make people aware of shirts for other BSD projects too
* You can get some FreeBSD, [PCBSD](https://www.freebsdmall.com/cgi-bin/fm/scan/fi=prod_bsd/se=pc-bsd) and FreeNAS [stuff](https://www.freebsdmall.com/cgi-bin/fm/scan/fi=prod_bsd/se=shirts) from the [FreeBSD mall site](https://www.freebsdmall.com/cgi-bin/fm/scan/fi=prod_bsd/se=tshirt)
* OpenBSD recently launched their [new store](https://www.openbsdstore.com), but the selection is still a bit limited right now
* NetBSD has a [couple places](https://www.netbsd.org/gallery/devotionalia.html#cafepress) where you can buy shirts and other apparel with the flag logo on it
* We couldn't find any DragonFlyBSD shirts unfortunately, which is a shame since [their logo](http://www.dragonflybsd.org/images/small_logo.png) is pretty cool
* Profits from the sale of the gear go back to the projects, so pick up some swag and support your BSD of choice (and of course wear them at any Linux events you happen to go to) \*\*\*

### [OPNsense 15.1.4 released](https://forum.opnsense.org/index.php?topic=35.0) ###

* The OPNsense guys have been hard at work since [we spoke to them](http://www.bsdnow.tv/episodes/2015_01_14-common_sense_approach), fixing lots of bugs and keeping everything up to date
* A number of versions have come out since then, with 15.1.4 being the latest (assuming they haven't updated it **again** by the time this airs)
* This version includes the latest round of FreeBSD kernel security patches, as well as minor SSL and GUI fixes
* They're doing a great job of getting upstream fixes pushed out to users quickly, a very welcome change
* A developer has also posted an interesting write-up titled "[Development Workflow in OPNsense](http://lastsummer.de/development-workflow-in-opnsense/)"
* If any of our listeners are trying OPNsense as their gateway firewall, let us know how you like it \*\*\*

Interview - Ed Maste - [board@freebsdfoundation.org](mailto:board@freebsdfoundation.org)
----------

[The FreeBSD foundation](https://www.freebsdfoundation.org/donate)'s activities

---

News Roundup
----------

### [Rolling with OpenBSD snapshots](http://homing-on-code.blogspot.com/2015/02/rolling-with-snapshots.html) ###

* One of the cool things about the -current branch of OpenBSD is that it doesn't require any compiling
* There are signed binary snapshots being continuously re-rolled and posted on the FTP sites for every architecture
* This provides an easy method to get onboard with the latest features, and you can also easily upgrade between them without reformatting or rebuilding
* This blog post will walk you through the process of using snapshots to stay on the bleeding edge of OpenBSD goodness
* After using -current for seven weeks, the author comes to the conclusion that it's not as unstable as people might think
* He's now helping test out patches and new ports since he's running the same code as the developers \*\*\*

### [Signing pkgsrc packages](https://mail-index.netbsd.org/tech-pkg/2015/02/02/msg014224.html) ###

* As of the time this show airs, the official [pkgsrc](http://www.bsdnow.tv/tutorials/pkgsrc) packages aren't cryptographically signed
* Someone from Joyent has been working on that, since they'd like to sign their pkgsrc packages for SmartOS
* Using GNUPG pulled in a lot of dependencies, and they're trying to keep the bootstrapping process minimal
* Instead, they're using netpgpverify, a fork of NetBSD's [netpgp](https://en.wikipedia.org/wiki/Netpgp) utility
* Maybe someday this will become the official way to sign packages in NetBSD? \*\*\*

### [FreeBSD support model changes](https://lists.freebsd.org/pipermail/freebsd-announce/2015-February/001624.html) ###

* Starting with 11.0-RELEASE, which won't be for a few months probably, FreeBSD releases are going to have a different support model
* The plan is to move "from a point release-based support model to a set of releases from a branch with a guaranteed support lifetime"
* There will now be a five-year lifespan for each major release, regardless of how many minor point releases it gets
* This new model should reduce the turnaround time for errata and security patches, since there will be a lot less work involved to build and verify them
* Lots more detail can be found in the mailing list post, including some important changes to the -STABLE branch, so give it a read \*\*\*

### [OpenSMTPD, Dovecot and SpamAssassin](http://guillaumevincent.com/2015/01/31/OpenSMTPD-Dovecot-SpamAssassin.html) ###

* We've been talking about setting up your own BSD-based mail server on the last couple episodes
* Here we have another post from a user setting up OpenSMTPD, including Dovecot for IMAP and SpamAssassin for spam filtering
* A **lot** of people [regularly ask the developers](http://permalink.gmane.org/gmane.mail.opensmtpd.general/2265) how to combine OpenSMTPD with spam filtering, and this post should finally reveal the dark secrets
* In addition, it also covers SSL certificates, PKI and setting up MX records - some things that previous posts have lacked
* Just be sure to replace those "apt-get" commands and "eth0" interface names with something a bit more sane…
* In related news, OpenSMTPD has got some interesting new features [coming soon](http://article.gmane.org/gmane.mail.opensmtpd.general/2272)
* They're also planning to [switch to LibreSSL by default](https://github.com/OpenSMTPD/OpenSMTPD/issues/534) for the portable version \*\*\*

### [FreeBSD 10 on the Thinkpad T400](http://lastsummer.de/freebsd-desktop-on-the-t400/) ###

* BSD laptop articles are becoming popular it seems - this one is about FreeBSD on a T400
* Like most of the ones we've mentioned before, it shows you how to get a BSD desktop set up with all the little tweaks you might not think to do
* This one differs in that it takes a more minimal approach to graphics: instead of a full-featured environment like XFCE or KDE, it uses the i3 tiling window manager
* If you're a commandline junkie that basically just uses X11 to run more than one terminal at once, this might be an ideal setup for you
* The post also includes some bits about the DRM and KMS in the 10.x branch, as well as vt \*\*\*

### [PC-BSD 10.1.1 Released](http://blog.pcbsd.org/2015/02/1810/) ###

* Automatic background updater now in
* Shiny new Qt5 utils
* OVA files for VM’s
* Full disk encryption with GELI v7 \*\*\*

Feedback/Questions
----------

* [Camio writes in](http://slexy.org/view/s2MsjllAyU)
* [Sha'ul writes in](http://slexy.org/view/s20eYELsAg)
* [John writes in](http://slexy.org/view/s20Y2GN1az)
* [Sean writes in](http://slexy.org/view/s20ARVQ1T6) ([TJ's lengthy reply](http://slexy.org/view/s212XezEYt))
* [Christopher writes in](http://slexy.org/view/s2DRgEv4j8) \*\*\*

Mailing List Gold
----------

* [Special Instructions](https://lists.freebsd.org/pipermail/freebsd-questions/2015-February/264010.html)
* [Pretending to be a VT220](https://mail-index.netbsd.org/netbsd-users/2015/01/19/msg015669.html) \*\*\*