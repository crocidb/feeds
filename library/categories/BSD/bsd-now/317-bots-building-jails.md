+++
title = "317: Bots Building Jails"
description = "Setting up buildbot in FreeBSD jails, Set up a mail server with OpenSMTPD, Dovecot and Rspamd, OpenBSD amateur packet radio with HamBSD, DragonFlyBSD's HAMMER2 gets fsck, return of startx for users.HeadlinesEuroBSDcon 2019 Recap "
date = "2019-09-26T06:00:00Z"
url = "https://www.bsdnow.tv/317"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.601142515Z"
seen = false
+++

Setting up buildbot in FreeBSD jails, Set up a mail server with OpenSMTPD, Dovecot and Rspamd, OpenBSD amateur packet radio with HamBSD, DragonFlyBSD's HAMMER2 gets fsck, return of startx for users.

Headlines
----------

### [EuroBSDcon 2019 Recap](https://2019.eurobsdcon.org/) ###

>
>
> We’re back from EuroBSDcon in Lillehammer, Norway. It was a great conference with 212 people attending. 2 days of [tutorials](https://2019.eurobsdcon.org/tutorial-speakers/), parallel to the [FreeBSD Devsummit](https://wiki.freebsd.org/DevSummit/201909), followed by two days of [talks](https://2019.eurobsdcon.org/program/). Some speakers uploaded their slides to [papers.freebsd.org](https://papers.freebsd.org/2019/eurobsdcon/) already with more to come.
>
>
>
> The social event was also interesting. We visited an open air museum with building preserved from different time periods. In the older section they had a collection of farm buildings, a church originally built in the 1200s and relocated to the museum, and a school house. In the more modern area, they had houses from 1915, and each decade from 1930 to 1990, plus a “house of the future” as imagined in 2001. Many had open doors to allow you to tour the inside, and some were even “inhabited”. The latter fact gave a much more interactive experience and we could learn additional things about the history of that particular house. The town at the end included a general store, a post office, and more. Then, we all had a nice dinner together in the museum’s restaurant.
>
>

* The opening keynote by Patricia Aas was very good. Her talk on embedded ethics, from her perspective as someone trying to defend the sanctity of Norwegian elections, and a former developer for the Opera web browser, provided a great deal of insight into the issues. Her points about how the tech community has unleashed a very complex digital work upon people with barely any technical literacy were well taken. Her stories of trying to explain the problems with involving computers in the election process to journalists and politicians struck a chord with many of us, who have had to deal with legislation written by those who do not truly understand the issues with technology.

---

### [Setting up buildbot in FreeBSD jails](https://andidog.de/blog/2018-04-22-buildbot-setup-freebsd-jails) ###

>
>
> In this article, I would like to present a tutorial to set up buildbot, a continuous integration (CI) software (like Jenkins, drone, etc.), making use of FreeBSD’s containerization mechanism "jails". We will cover terminology, rationale for using both buildbot and jails together, and installation steps. At the end, you will have a working buildbot instance using its sample build configuration, ready to play around with your own CI plans (or even CD, it’s very flexible!). Some hints for production-grade installations are given, but the tutorial steps are meant for a test environment (namely a virtual machine). Buildbot’s configuration and detailed concepts are not in scope here.
>
>

---

### [Setting up a mail server with OpenSMTPD, Dovecot and Rspamd](https://poolp.org/posts/2019-09-14/setting-up-a-mail-server-with-opensmtpd-dovecot-and-rspamd/) ###

* Self-hosting and encouraging smaller providers is for the greater good

>
>
> First of all, I was not clear enough about the political consequences of centralizing mail services at Big Mailer Corps.
>
>
>
> It doesn’t make sense for Random Joe, sharing kitten pictures with his family and friends, to build a personal mail infrastructure when multiple Big Mailer Corps offer “for free” an amazing quality of service. They provide him with an e-mail address that is immediately available and which will generally work reliably. It really doesn’t make sense for Random Joe not to go there, and particularly if even techies go there without hesitation, proving it is a sound choice.
>
>
>
> There is nothing wrong with Random Joes using a service that works.
>
>
>
> What is terribly wrong though is the centralization of a communication protocol in the hands of a few commercial companies, EVERY SINGLE ONE OF THEM coming from the same country (currently led by a lunatic who abuses power and probably suffers from NPD), EVERY SINGLE ONE OF THEM having been in the news and/or in a court for random/assorted “unpleasant” behaviors (privacy abuses, eavesdropping, monopoly abuse, sexual or professional harassment, you just name it…), and EVERY SINGLE ONE OF THEM growing user bases that far exceeds the total population of multiple countries combined.
>
>

---

News Roundup
----------

### [The HamBSD project aims to bring amateur packet radio to OpenBSD](https://hambsd.org/) ###

>
>
> The HamBSD project aims to bring amateur packet radio to OpenBSD, including support for TCP/IP over AX.25 and APRS tracking/digipeating in the base system.
>
>
>
> HamBSD will not provide a full AX.25 stack but instead only implement support for UI frames. There will be a focus on simplicity, security and readable code.
>
>
>
> The amateur radio community needs a reliable platform for packet radio for use in both leisure and emergency scenarios. It should be expected that the system is stable and resilient (but as yet it is neither).
>
>

---

### [DragonFlyBSD's HAMMER2 Gets Basic FSCK Support](https://www.dragonflydigest.com/2019/09/24/23540.html) ###

>
>
> HAMMER2 is Copy on Write, meaning changes are made to copies of existing data. This means operations are generally atomic and can survive a power outage, etc. (You should read up on it!) However, there’s now a fsck command, useful if you want a report of data validity rather than any manual repair process.
>
>

* [commit](https://gitweb.dragonflybsd.org/dragonfly.git/commitdiff/5554cc8b81fbfcfd347f50be3f3b1b9a54b871b)

>
>
> Add initial fsck support for HAMMER2, although CoW fs doesn't require fsck as a concept. Currently no repairing (no write), just verifying.
>
>
>
> Keep this as a separate command for now.  
> [https://i.redd.it/vkdss0mtdpo31.jpg](https://i.redd.it/vkdss0mtdpo31.jpg)
>
>
> ---
>

### [The return of startx for users](http://undeadly.org/cgi?action=article;sid=20190917091236) ###

>
>
> Add modesetting driver as a fall-back when appropriate such that we can use it when running without root privileges which prevents us from scanning the PCI bus.
>
>
>
> This makes startx(1)/xinit(1) work again on modern systems with inteldrm(4), radeondrm(4) and amdgpu(4). In some cases this will result in using a different driver than with xenodm(4) which may expose issues (e.g. when we prefer the intel Xorg driver) or loss of acceleration (e.g. older cards supported by radeondrm(4)).
>
>

---

Beastie Bits
----------

* [Ori Bernstein will be giving the October talk at NYCBUG](http://lists.nycbug.org:8080/pipermail/talk/2019-September/018046.html)
* [BSD Pizza Night: 2019/09/26, 7–9PM, Portland, Oregon, USA](http://calagator.org/events/1250476200)
* [Nick Wolff : Home Lab Show & Tell](http://knoxbug.org/2019-09-30)
* [Installing the Lumina Desktop in DragonflyBSD](https://www.youtube.com/watch?v=eWkCjj4_xsk)
* [dhcpcd 8.0.6 added](https://www.dragonflydigest.com/2019/09/20/23519.html)

---

Feedback/Questions
----------

* Bruce - [FOSDEM videos](http://dpaste.com/15ABRRB#wrap)
* Lars - [Super Cluster of BSD on Rock64Pr](http://dpaste.com/1X9FEJJ)
* Madhukar - [Question](http://dpaste.com/0TWF1NB#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.