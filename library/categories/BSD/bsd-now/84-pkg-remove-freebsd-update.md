+++
title = "84: pkg remove freebsd-update"
description = "On this week's mini-episode, we'll be talking with Baptiste Daroussin about packaging the FreeBSD base system with pkgng. Is this the best way going forward, or are we getting dangerously close to being Linux-like? We'll find out, and also get to a couple of your emails while we'"
date = "2015-04-08T12:00:00Z"
url = "https://www.bsdnow.tv/84"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.151947583Z"
seen = false
+++

On this week's mini-episode, we'll be talking with Baptiste Daroussin about packaging the FreeBSD base system with pkgng. Is this the best way going forward, or are we getting dangerously close to being Linux-like? We'll find out, and also get to a couple of your emails while we're at it, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Xen dom0 in FreeBSD 11-CURRENT](https://svnweb.freebsd.org/ports?view=revision&revision=382965) ###

* FreeBSD has just gotten [dom0](http://wiki.xen.org/wiki/Dom0) support for the Xen hypervisor, something [NetBSD has had](http://wiki.netbsd.org/ports/xen/howto/#netbsd-dom0) for a while now
* The ports tree will now have a Xen kernel and toolstack, meaning that they can be updated much more rapidly than if they were part of base
* It's currently limited to Intel boxes with EPT and a working IOMMU, running a recent version of the -CURRENT branch, but we'll likely see it when 11.0 comes out
* How will this affect interest in Bhyve? \*\*\*

### [A tale of two educational moments](http://blog.anthrobsd.net/044.html) ###

* Here we have a blog post from an OpenBSD developer about some experiences he had helping people get involved with the project
* It's split into two stories: one that could've gone better, and one that went really well
* For the first one, he found that someone was trying to modify a package from their ports tree to have fewer dependencies
* Experience really showed its worth, and he was able to write a quick patch to do exactly what the other person had been working on for a few hours - but wasn't so encouraging about getting it committed
* In the second story, he discussed updating a different port with a user of a forum, and ended up improving the new user's workflow considerably with just a few tips
* The lesson to take away from this is that we can all help out to encourage and assist new users - everyone was a newbie once \*\*\*

### [What's coming in NetBSD 7](http://saveosx.org/NetBSD7/) ###

* We first mentioned NetBSD 7.0 on the show in July of 2014, but it still hasn't been released and there hasn't been much public info about it
* This blog post outlines some of the bigger features that we can expect to see when it actually does come out
* Their total platform count is now over 70, so you'd be hard-pressed to find something that it doesn't run on
* There have been a lot of improvements in the graphics area, particularly with DRM/KMS, including Intel Haswell and Nouveau (for nVidia cards)
* Many ARM boards now have full SMP support
* Clang has also finally made its way into the base system, something we're glad to see, and it should be able to build the base OS on i386, AMD64 and ARM - other architectures are still a WIP
* In the crypto department: their PNRG has switched from the broken RC4 to the more modern ChaCha20, OpenSSL has been updated in base and LibreSSL is in pkgsrc
* NetBSD's in-house firewall, npf, has gotten major improvements since its initial debut in NetBSD 6.0
* Looking to the future, NetBSD hopes to integrate a stable ZFS implementation later on \*\*\*

### [OpenZFS office hours](https://www.youtube.com/watch?v=mS4bfbEq46I) ###

* We mentioned a couple weeks back that the OpenZFS office hours series was starting back up
* They've just uploaded the recording of their most recent freeform discussion, with [Justin Gibbs](http://www.bsdnow.tv/episodes/2015_03_11-the_pcbsd_tour_ii) being the main presenter
* In it, they cover how Justin got into ZFS, running in virtualized environments, getting patches into the different projects, getting more people involved, reviewing code, spinning disks vs SSDs, defragging, speeding up resilvering, zfsd and much more \*\*\*

Interview - Baptiste Daroussin - [bapt@freebsd.org](mailto:bapt@freebsd.org)
----------

Packaging the FreeBSD base system with pkgng

---

Discussion
----------

### Packaging the FreeBSD base system with pkgng (follow-up) ###

---

Feedback/Questions
----------

* [Jeff writes in](http://slexy.org/view/s20AWp6Av1)
* [Anonymous writes in](http://slexy.org/view/s20QiFcdh8)
* [Alex writes in](http://slexy.org/view/s2YzZlswaB)
* [Joris writes in](http://slexy.org/view/s21Mx9TopQ) \*\*\*

Mailing List Gold
----------

* [ok feedback@](https://www.marc.info/?l=openbsd-ports&m=142679136422432&w=2) \*\*\*