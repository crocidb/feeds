+++
title = "324: Emergency Space Mode"
description = "Migrating drives and zpool between hosts, OpenBSD in 2019, Dragonfly’s new zlib and dhcpcd, Batch renaming images and resolution with awk, a rant on the X11 ICCCM selection system, hammer 2 emergency space mode, and more.Headlines[Migrating drives and the zpool f"
date = "2019-11-14T12:00:00Z"
url = "https://www.bsdnow.tv/324"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.587739065Z"
seen = false
+++

Migrating drives and zpool between hosts, OpenBSD in 2019, Dragonfly’s new zlib and dhcpcd, Batch renaming images and resolution with awk, a rant on the X11 ICCCM selection system, hammer 2 emergency space mode, and more.

---

Headlines
----------

### [Migrating drives and the zpool from one host to another.](https://dan.langille.org/2019/10/26/migrating-drives-and-the-zpool-from-one-host-to-another/) ###

>
>
> Today is the day.
>
>
>
> Today I move a zpool from an R710 into an R720. The goal: all services on that zpool start running on the new host.
>
>
>
> Fortunately, that zpool is dedicated to jails, more or less. I have done some planning about this, including moving a poudriere on the R710 into a jail.
>
>
>
> Now it is almost noon on Saturday, I am sitting in the basement (just outside the server room), and I’m typing this up.
>
>

* In this post:

  * FreeBSD 12.0
  * Dell R710 (r710-01)
  * Dell R720 (r720-01)
  * drive caddies from eBay and now I know the difference between SATA and SATAu

* [PLEASE READ THIS first: Migrating ZFS Storage Pools](https://docs.oracle.com/cd/E19253-01/819-5461/gbchy/index.html)

---

### [OpenBSD in 2019](https://blog.habets.se/2019/10/OpenBSD-in-2019.html) ###

>
>
> I’ve used OpenBSD on and off since 2.1. More back then than in the last 10 years or so though, so I thought I’d try it again.
>
>
>
> What triggered this was me finding a silly bug in GNU cpio that has existed with a “FIXME” comment since at least 1994. I checked OpenBSD to see if it had a related bug, but as expected no it was just fine.
>
>
>
> I don’t quite remember why I stopped using OpenBSD for servers, but I do remember filesystem corruption on “unexpected power disconnections” (even with softdep turned on), which I’ve never really seen on Linux.
>
>
>
> That and that fewer things “just worked” than with Linux, which matters more when I installed more random things than I do now. I’ve become a lot more minimalist. Probably due to less spare time. Life is better when you don’t run things like PHP (not that OpenBSD doesn’t support PHP, just an example) or your own email server with various antispam tooling, and other things.
>
>
>
> This is all experience from running OpenBSD on a server. On my next laptop I intend to try running OpenBSD on the dektop, and will see if that more ad-hoc environment works well. E.g. will gnuradio work? Lack of other-OS VM support may be a problem.
>
>

* Verdict

>
>
> Ouch, that’s a long list of bad stuff. Still, I like it. I’ll continue to run it, and will make sure my stuff continues working on OpenBSD.
>
>
>
> And maybe in a year I’ll have a review of OpenBSD on a laptop.
>
>

---

News Roundup
----------

### [New zlib, new dhcpcd](https://www.dragonflydigest.com/2019/10/29/23683.html) ###

>
>
> zlib and dhcpcd are both updated in DragonFly… but my quick perusal of the commits makes it sound like bugfix only; no usage changes needed.
>
>

* DHCPCD Commit: [http://lists.dragonflybsd.org/pipermail/commits/2019-October/719768.html](http://lists.dragonflybsd.org/pipermail/commits/2019-October/719768.html)
* ZLIB Commit: [http://lists.dragonflybsd.org/pipermail/commits/2019-October/719772.html](http://lists.dragonflybsd.org/pipermail/commits/2019-October/719772.html)

---

### [Batch renaming images, including image resolution, with awk](https://victoria.dev/verbose/batch-renaming-images-including-image-resolution-with-awk/) ###

>
>
> The most recent item on my list of “Geeky things I did that made me feel pretty awesome” is an hour’s adventure that culminated in this code:
>
>

```
$ file IMG* | awk 'BEGIN{a=0} {print substr($1, 1, length($1)-5),a++"_"substr($8,1, length($8)-1)}' | while read fn fr; do echo $(rename -v "s/$fn/img_$fr/g" *); done
IMG_20170808_172653_425.jpg renamed as img_0_4032x3024.jpg
IMG_20170808_173020_267.jpg renamed as img_1_3024x3506.jpg
IMG_20170808_173130_616.jpg renamed as img_2_3024x3779.jpg
IMG_20170808_173221_425.jpg renamed as img_3_3024x3780.jpg
IMG_20170808_173417_059.jpg renamed as img_4_2956x2980.jpg
IMG_20170808_173450_971.jpg renamed as img_5_3024x3024.jpg
IMG_20170808_173536_034.jpg renamed as img_6_4032x3024.jpg
IMG_20170808_173602_732.jpg renamed as img_7_1617x1617.jpg
IMG_20170808_173645_339.jpg renamed as img_8_3024x3780.jpg
IMG_20170909_170146_585.jpg renamed as img_9_3036x3036.jpg
IMG_20170911_211522_543.jpg renamed as img_10_3036x3036.jpg
IMG_20170913_071608_288.jpg renamed as img_11_2760x2760.jpg
IMG_20170913_073205_522.jpg renamed as img_12_2738x2738.jpg
// ... etc etc

```

>
>
> The last item on the aforementioned list is “TODO: come up with a shorter title for this list.”
>
>

---

### [I hate the X11 ICCCM selection system, and you should too - A Rant](http://www.call-with-current-continuation.org/rants/icccm.txt) ###

>
>
> d00d, that document is devilspawn. I've recently spent my nights in pain  
>  implementing the selection mechanism. WHY OH WHY OH WHY? why me? why did I choose to do this? and what sick evil twisted mind wrote this damn spec? I don't know why I'm working with it, I just wanted to make a useful program.
>
>
>
> I didn't know what I was getting myself in to. Nobody knows until they try it. And once you start, you're unable to stop. You can't stop, if you stop then you haven't completed it to spec. You can't fail on this, it's just a few pages of text, how can that be so hard? So what if they use Atoms for everything. So what if there's no explicit correlation between the target type of a SelectionNotify event and the type of the property it indicates?
>
>
>
> So what if the distinction is ambiguous? So what if the document is littered with such atrocities? It's not the spec's fault, the spec is authoritative. It's obviously YOUR (the implementor's) fault for misunderstanding it. If you didn't misunderstand it, you wouldn't be here complaining about it would you?
>
>

---

### [HAMMER2 emergency space mode](https://www.dragonflydigest.com/2019/10/22/23652.html) ###

>
>
> As anyone who has been running HAMMER1 or HAMMER2 has noticed, snapshots and copy on write and infinite history can eat a lot of disk space, even if the actual file volume isn’t changing much. There’s now an ‘emergency mode‘ for HAMMER2, where disk operations can happen even if there isn’t space for the normal history activity. It’s dangerous, in that the normal protections against data loss if power is cut go away, and snapshots created while in this mode will be mangled. So definitely don’t leave it on!
>
>

---

Beastie Bits
----------

* [The BastilleBSD community has started work on over 100 automation templates](https://twitter.com/BastilleBSD/status/1186659762458501120)
* [PAM perturbed](https://www.dragonflydigest.com/2019/10/23/23654.html)
* [OpenBSD T-Shirts now available](https://teespring.com/stores/openbsd)
* [FastoCloud (Opensource Media Service) now available on FreeBSD](https://old.reddit.com/r/freebsd/comments/dlyqtq/fastocloud_opensource_media_service_now_available/)
* [Unix: A History and a Memoir by Brian Kernighan now available](https://www.cs.princeton.edu/~bwk/)
* [OpenBSD Moonlight game streaming client from a Windows + Nvidia PC](https://www.reddit.com/r/openbsd_gaming/comments/d6xboo/openbsd_moonlight_game_streaming_client_from_a/) \*\*\*

Feedback/Questions
----------

* Tim - [Release Notes for Lumina 1.5](http://dpaste.com/38DNSXT#wrap)
  * [Answer Here](http://dpaste.com/3QJX8G3#wrap)

* Brad - [vBSDcon Trip Report](http://dpaste.com/316MGVX#wrap)
* Jacob - [Using terminfo on FreeBSD](http://dpaste.com/131N05J#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.