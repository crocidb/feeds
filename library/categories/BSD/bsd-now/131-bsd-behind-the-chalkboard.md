+++
title = "131: BSD behind the chalkboard"
description = "This week on the show, we have an interview with JamieThis episode was brought to you byiXsystems - Enterprise Servers and Storage for Open Source[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2"
date = "2016-03-02T13:00:00Z"
url = "https://www.bsdnow.tv/131"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.057245665Z"
seen = false
+++

This week on the show, we have an interview with Jamie

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [BSDCan 2016 List of Talks](http://www.bsdcan.org/2016/list-of-talks.txt) ###

* We are all looking forward to BSDCan
* Make sure you arrive in time for the Goat BoF, the evening of Tuesday June 7th at the Royal Oak, just up the street from the university residence
* There will also be a ZFS BoF during lunch of one of the conference days, be sure to grab your lunch and bring it to the BoF room
* Also, don’t forget to get signed up for the various DevSummits taking place at BSDCan. \*\*\*

### [What does Load Average really mean](https://utcc.utoronto.ca/~cks/space/blog/unix/ManyLoadAveragesOfUnix) ###

* Chris Siebenmann, a sysadmin at the University of Toronto, does some comparison of what “Load Average” means on different unix systems, including Solaris/IllumOS, FreeBSD, NetBSD, OpenBSD, and Linux
* It seems that no two OSes use the same definition, so comparing load averages is impossible
* On FreeBSD, where I/O does not affect load average, you can divide the load average by the number of CPU cores to be able to compare across machines with different core counts \*\*\*

### [GPL violations related to combining ZFS and Linux](http://sfconservancy.org/blog/2016/feb/25/zfs-and-linux/) ###

* As we mentioned in last week’s episode, Ubuntu was preparing to release their next version with native ZFS support. + As expected, the Software Freedom Conservancy has issued a statement detailing the legal argument why they believe this is a violation of the GPL license for the Linux kernel.
* It’s a pretty long and complete article, but we wanted to bring you the summary of the whole, and encourage you to read the rest, since it’s good to be knowledgeable about the various open-source projects and their license conditions.

>
>
> “We are sympathetic to Canonical's frustration in this desire to easily support more features for their users. However, as set out below, we have concluded that their distribution of zfs.ko violates the GPL. We have written this statement to answer, from the point of view of many key Linux copyright holders, the community questions that we've seen on this matter. Specifically, we provide our detailed analysis of the incompatibility between CDDLv1 and GPLv2 — and its potential impact on the trajectory of free software development — below.
>
>
>
> However, our conclusion is simple: Conservancy and the Linux copyright holders in the GPL Compliance Project for Linux Developers believe that distribution of ZFS binaries is a GPL violation and infringes Linux's copyright. We are also concerned that it may infringe Oracle's copyrights in ZFS. As such, we again ask Oracle to respect community norms against license proliferation and simply relicense its copyrights in ZFS under a GPLv2-compatible license.”
>
>

* [The Software Freedom Law Center’s take on the issue ](https://softwarefreedom.org/resources/2016/linux-kernel-cddl.html)
* [Linux SCSI subsystem Maintainer, James Bottomley, asks “where is the harm”](http://blog.hansenpartnership.com/are-gplv2-and-cddl-incompatible/)
* [FreeBSD and ZFS ](http://freebsdfoundation.blogspot.ca/2016/02/freebsd-and-zfs.html) \*\*\*

### [DragonFly i915 reaches Linux 4.2 ](https://www.phoronix.com/scan.php?page=news_item&px=DragonFlyBSD-i915-4.2) ###

* The port of the Intel i915 DRM/KMS Linux driver to DragonFlyBSD has been updated to match Linux kernel 4.2
* Various improvements and better support for new hardware are included
* One big difference, is that DragonFlyBSD will not require the binary firmware blob that Linux does
* François Tigeot explains: "starting from Linux 4.2, a separate firmware blob is required to save and restore the state of display engines in some low-power modes. These low-power modes have been forcibly disabled in the DragonFly version of this driver in order to keep it blob-free."
* Obviously this will have some disadvantage, but as those modes were never available on DragonFlyBSD before, users are not likely to miss them \*\*\*

Interview - Jamie McParland - [mcparlandj@newberg.k12.or.us](mailto:mcparlandj@newberg.k12.or.us) / [@nsdjamie](https://twitter.com/nsdjamie)
----------

* FreeBSD behind the chalkboard \*\*\*

iXsystems
----------

* [My New IXSystems Mail Server](https://www.reddit.com/r/LinuxActionShow/comments/48c9nt/my_new_ixsystems_mail_server/)

News Roundup
----------

### [Installing ELK on FreeBSD, Tutorial Part 1](https://blog.gufi.org/2016/02/15/elk-first-part/) ###

* Are you an ELK user, or interested in becoming one? If so, Gruppo Utenti has a nice blog post / tutorial on how to get started with it on FreeBSD.
* Maybe you haven’t heard of ELK, but its not the ELK in ports, specifically in this case he is referring to “ElasticSearch/Logstash/Kibana” as a stack.
* Getting started is relatively simply, first we install a few ports/packages:
  * textproc/elasticsearch
  * sysutils/logstash
  * textproc/kibana43
  * www/nginx

* After enabling the various services for those (hint: sysrc may be easier), he then takes us through the configuration of ElasticSearch and LogStash. For the most part they are fairly straightforward, but you can always copy and paste his example config files as a template.
* [Follow up to Installing ELK on FreeBSD](https://blog.gufi.org/2016/02/23/elk-second-part/)
* Jumping directly into the next blog entry, he then takes us through the “K” part of ELK, specifically setting up Kibana, and exposing it via nginx publically.
* At this point most of the CLI work is finished, and we have a great walkthrough of doing the Kibana configuration via their UI. We are still awaiting the final entry to the series, where the setup of ElastAlert will be detailed, and we will bring that to your attention when it lands. \*\*\*

### [From 1989: An Empirical Study of the Reliablity of Unix Utilities](http://ftp.cs.wisc.edu/paradyn/technical_papers/fuzz.pdf) ###

* A paper from 1989 on the results of fuzz testing various unix utilities across a range of available unix operating systems
* Very interesting results, it is interesting to look back at before the start of the modern BSD projects
* New problems are still being found in utilities using similar testing methodologies, like afl (American Fuzzy lop) \*\*\*

### Google Summer of Code ###

* Both [FreeBSD](https://summerofcode.withgoogle.com/organizations/4892834293350400/)
* and [NetBSD](https://summerofcode.withgoogle.com/organizations/6246531984261120/)
* Are running 2016 Google Summer of Code projects.
* Students can start submitting proposals on March 14th.
* In the meantime, if you have any ideas, please post them to the [Summer Of Code Ideas Page ](https://wiki.freebsd.org/SummerOfCodeIdeas) on the FreeBSD wiki
* Students can start looking at the list now and try to find mentors to get a jump start on their project. \*\*\*

### [High Availablity Sync for ipfw3 in Dragonfly](http://lists.dragonflybsd.org/pipermail/commits/2016-February/459424.html) ###

* Similar to pfsync, this new protocol allows firewall dynamic rules (state) to be synchronized between two firewalls that are working together in HA with CARP
* Does not yet sync NAT state, it seems libalias will need some modernization first
* Apparently it will be relatively easy to port to FreeBSD
* This is one of the only features ipfw lacks when compared to pf \*\*\*

### Beastie Bits ###

* [FreeBSD 10.3-BETA3 Now Available](https://lists.freebsd.org/pipermail/freebsd-stable/2016-February/084238.html)

* [LibreSSL isnt affected by the OpenSSL DROWN attack](http://undeadly.org/cgi?action=article&sid=20160301141941&mode=expanded)

* [NetBSD machines at the Open Source Conference 2016 in Toyko](http://mail-index.netbsd.org/netbsd-advocacy/2016/02/29/msg000703.html)

* [OpenBSD removes Linux Emulation](https://marc.info/?l=openbsd-ports-cvs&m=145650279825695&w=2)

* [Time is an illusion - George Neville-Neil](https://queue.acm.org/detail.cfm?id=2878574)

* [OpenSSH 7.2 Released](http://www.openssh.com/txt/release-7.2)

Feedback/Questions
----------

* [ Shane - IPSEC](http://slexy.org/view/s2qCKWWKv0)
* [ Darrall - 14TB Zpool](http://slexy.org/view/s20CP3ty5P)
* [ Pedja - ZFS setup](http://slexy.org/view/s2qp7K9KBG) \*\*\*