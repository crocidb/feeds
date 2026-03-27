+++
title = "Episode 245: ZFS User Conf 2018 | BSD Now 245"
description = "Allan’s recap of the ZFS User conference, first impressions of OmniOS by a BSD user, Nextcloud 13 setup on FreeBSD, OpenBSD on a fanless desktop computer, an intro to HardenedBSD, and DragonFlyBSD getting some SMP improvements.  HeadlinesZFS User Conference Recap"
date = "2018-05-10T12:00:00Z"
url = "https://www.bsdnow.tv/245"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.757940255Z"
seen = false
+++

Allan’s recap of the ZFS User conference, first impressions of OmniOS by a BSD user, Nextcloud 13 setup on FreeBSD, OpenBSD on a fanless desktop computer, an intro to HardenedBSD, and DragonFlyBSD getting some SMP improvements.  

---

Headlines
----------

### ZFS User Conference Recap ###

* Attendees met for breakfast on the fourth floor, in a lunchroom type area just outside of the theatre. One entire wall was made of lego base plates, and there were buckets of different coloured lego embedded in the wall.
* The talks started with Matt Ahrens discussing how the 2nd most requested feature of ZFS, Device Removal, has now landed, then pivoting into the MOST requested feature, RAID-Z expansion, and his work on that so far, which included the first functional prototype, on FreeBSD.
* Then our friend Calvin Hendryx-Parker presented how he solves all of his backup headaches with ZFS. I provided him some helpful hints to optimize his setup and improve the throughput of his backups
* Then Steven Umbehocker of OSNEXUS talked about their products, and how they manage large numbers of ZFS nodes
* After a very nice lunch, Orlando Pichardo of Micron talked about the future of flash, and their new 7.5TB SATA SSDs. Discussion of these devices after the talk may lead to enhancements to ZFS to better support these new larger flash devices that use larger logical sector sizes.
* Alek Pinchuk of Datto talked about Pool Layout Considerations
* then Tony Hutter of LLNL talked about the release process for ZFS on Linux
* Then Tom Caputi of Datto presented: Helping Developers Help You, guidance for users submitting bug reports, with some good and bad examples
* Then we had a nice cocktail party and dinner, and stayed late into the night talked about ZFS
* The next day, Jervin Real of Percona, presented: ZFS and MySQL on Linux, the Sweet Spots. Mostly outlining some benchmark they had done, some of the results were curious and some additional digging may turn up enhancements that can be made to ZFS, or just better tuning advice for high traffic MySQL servers.
* Then I presented my ZSTD compression work, which had been referenced in 2 of the previous talks, as people are anxious to get their hands on this code.
* Lastly, Eric Sproul of Circonus, gave his talk: Thank You, ZFS. It thanked ZFS and its Community for making their companies product possible, and then provided an update to his presentation from last year, where they were having problems with extremely high levels of ZFS fragmentation. This also sparked a longer conversation after the talk was over.
* Then we had a BBQ lunch, and after some more talking, the conference broke up.

---

### [Initial OmniOS impressions by a BSD user](https://www.linuxquestions.org/questions/solaris-opensolaris-20/initial-omnios-impressions-by-a-bsd-user-4175626757/) ###

>
>
> I had been using FreeBSD as my main web server OS since 2012 and I liked it so much that I even contributed money and code to it. However, since the FreeBSD guys (and gals) decided to install anti-tech feminism, I have been considering to move away from it for quite some time now.
>
>
>
> As my growing needs require stronger hardware, it was finally time to rent a new server. I do not intend to run FreeBSD on it. Although the most obvious choice would be OpenBSD (I run it on another server and it works just fine), I plan to have a couple of databases running on the new machine, and database throughput has never been one of OpenBSD's strong points. This is my chance to give illumos another try. As neither WiFi nor desktop environments are relevant on a no-X11 server, the server-focused OmniOS seemed to fit my needs.
>
>
>
> My current (to be phased out) setup on FreeBSD is:
>
>

* apache24 with SSL support, running five websites on six domains (both HTTP and HTTPS)
* a (somewhat large) Tiny Tiny RSS installation from git, updated via cronjob
* sbcl running a daily cronjob of my Web-to-RSS parser
* an FTP server where I share stuff with friends
* an IRC bouncer
* MariaDB and PostgreSQL for some of the hosted services

>
>
> I would not consider anything of that too esoteric for a modern operating system. Since I was not really using anything mod\_rewrite-related, I was perfectly ready to replace apache24 by nginx, remembering that the prepackaged apache24 on FreeBSD did not support HTTPS out of the box and I had ended up installing it from the ports. That is the only change in my setup which I am actively planning.
>
>
>
> So here's what I noticed.
>
>

* First impressions:

>
>
> Hooray, a BSD boot loader! Finally an operating system without grub - I made my experiences with that and I don't want to repeat them too often.
>
>
>
> It is weird that the installer won't accept "mydomain.org" as a hostname but sendmail complains that "mydomain" is not a valid hostname right from the start, OmniOS sent me into Maintenance Mode to fix that. A good start, right? So the first completely new thing I had to find out on my new shiny toy was how to change the hostname. There is no /etc/rc.conf in it and hostname mydomain.org was only valid for one login session. I found out that the hostname has to be changed in three different files under /etc on Solaris - the third one did not even exist for me. Changing the other two files seems to have solved this problem for me.
>
>

* Random findings:

>
>
> \~ I was wondering how many resources my (mostly idle) new web server was using - I always thought Solaris was rather fat, but it still felt fast to me.
>
>
>
> Ah, right - we're in Unixland and we need to think outside of the box. This table was really helpful: although a number of things are different between OmniOS and SmartOS, I found out that the \*stat tools do what top does. I could probably just install top from one of the package managers, but I failed to find a reason to do so. I had 99% idle CPU and RAM - that's all I wanted to know.
>
>
>
> \~ Trying to set up twtxt informed me that Python 3.6 (from pkgin) expects LANG and LC\_ALL to be set. Weird - did FreeBSD do that for me? It's been a while ... at least that was easy to fix.
>
>
>
> \~ SMF - Solaris's version of init - confuses me. It has "levels" similar to Gentoo's OpenRC, but it mostly shuts up during the boot process. Stuff from pkgsrc, e.g. nginx, comes with a description how to set up the particular service, but I should probably read more about it. What if, one day, I install a package which is not made ready for OmniOS? I'll have to find out how to write SMF scripts. But that should not be my highest priority.
>
>
>
> \~ The OmniOS documentation talks a lot about "zones" which, if I understand that correctly, mostly equal FreeBSD's "jails". This could be my chance to try to respect a better separation between my various services - if my lazyness won't take over again. (It probably will.)
>
>
>
> \~ OmniOS's default shell - rather un-unixy - seems to be the bash. Update: I was informed about a mistake here: the default shell is ksh93, there are bogus .bashrc files lying around though.
>
>
>
> \~ Somewhere in between, my sshd had a hiccup or, at least, logging into it took longer than usual. If that happens again, I should investigate.
>
>

* Conclusion:

>
>
> By the time of me writing this, I have a basic web server with an awesome performance and a lot of applications ready to be configured only one click away. The more I play with it, the more I have the feeling that I have missed a lot while wasting my time with FreeBSD. For a system that is said to be "dying", OmniOS feels well-thought and, when equipped with a reasonable package management, comes with everything I need to reproduce my FreeBSD setup without losing functionality.
>
>
>
> I'm looking forward to what will happen with it.
>
>

---

**DigitalOcean** http://do.co/bsdnow

### [Open Source Hardware Camp 2018 — Sat 30/06 & Sun 01/07, Lincoln, UK ###

(includes 'Open-source RISC-V core quickstart' and 'An introductory workshop to NetBSD on embedded platforms')](http://oshug.org/pipermail/oshug/2018-April/000635.html)

``` Hi All,

I'm pleased to announce that we have 10 talks and 7 workshops confirmed for Open Source Hardware Camp 2018, with the possibility of one or two more. Registration is now open!

For the first time ever we will be hosting OSHCamp in Lincoln and a huge thanks to Sarah Markall for helping to make this happen.

As in previous years, there will be a social event on the Saturday evening and we have a room booked at the Wig and Mitre. Food will be available.

There will likely be a few of us meeting up for pre-conference drinks on the Friday evening also.

Details of the programme can be found below and, as ever, we have an excellent mix of topics being covered.

Cheers,

Andrew ```

* Open Source Hardware Camp 2018

>
>
> On the 30th June 2018, 09:00 Saturday morning - 16:00 on the Sunday afternoon at The Blue Room, The Lawn, Union Rd, Lincoln, LN1 3BU.
>
>

* Registration: http://oshug.org/event/oshcamp2018
* Open Source Hardware Camp 2018 will be hosted in the historic county town of Lincoln — home to, amongst others, noted engine builders Ruston & Hornsby (now Siemens, via GEC and English Electric).
* Lincoln is well served by rail, reachable from Leeds and London within 2-2.5 hours, and 4-5 hours from Edinburgh and Southampton.
* There will be a social at the Wig and Mitre on the Saturday evening.
* For travel and accommodation information information please see the event page on oshug.org.

---

News Roundup
----------

### [Nextcloud 13 on FreeBSD](https://vermaden.wordpress.com/2018/04/04/nextcloud-13-on-freebsd/) ###

>
>
> Today I would like to share a setup of Nextcloud 13 running on a FreeBSD system. To make things more interesting it would be running inside a FreeBSD Jail. I will not describe the Nextcloud setup itself here as its large enough for several blog posts.
>
>
>
> Official Nextcloud 13 documentation recommends following setup:
>
>

* MySQL/MariaDB
* PHP 7.0 (or newer)
* Apache 2.4 (with mod\_php)

>
>
> I prefer PostgreSQL database to MySQL/MariaDB and I prefer fast and lean Nginx web server to Apache, so my setup is based on these components:
>
>

* PostgreSQL 10.3
* PHP 7.2.4
* Nginx 1.12.2 (with php-fpm)
* Memcached 1.5.7

>
>
> The Memcached subsystem is least important, it can be easily changed into something more modern like Redis for example. I prefer not to use any third party tools for FreeBSD Jails management. Not because they are bad or something like that. There are just many choices for good FreeBSD Jails management and I want to provide a GENERIC example for Nextcloud 13 in a Jail, not for a specific management tool.
>
>

* Host

>
>
> Lets start with preparing the FreeBSD Host with needed settings. We need to allow using raw sockets in Jails. For the future optional upgrades of the Jail we will also allow using chflags(1) in Jails.
>
>

---

### [OpenBSD on my fanless desktop computer](https://www.romanzolotarev.com/setup.html) ###

>
>
> You asked me about my setup. Here you go.
>
>
>
> I’ve been using OpenBSD on servers for years as a web developer, but never had a chance to dive in to system administration before. If you appreciate the simplicity of OpenBSD and you have to give it a try on your desktop.
>
>
>
> Bear in mind, this is a relatively cheap ergonomic setup, because all I need is xterm(1) with Vim and Firefox, I don’t care about CPU/GPU performance or mobility too much, but I want a large screen and a good keyboard.
>
>

` Item Price, USD Zotac CI527 NANO-BE $371 16GB RAM Crucial DDR4-2133 $127 250GB SSD Samsung 850 EVO $104 Asus VZ249HE 23.8" IPS Full HD $129 ErgoDox EZ V3, Cherry MX Brown, blank DCS $325 Kensington Orbit Trackball $33 Total $1,107 `

* OpenBSD

>
>
> I tried few times to install OpenBSD on my MacBooks—I heard some models are compatible with it,—but in my case it was a bit of a fiasco (thanks to Nvidia and Broadcom). That’s why I bought a new computer, just to be able to run this wonderful operating system.
>
>
>
> Now I run -stable on my desktop and servers. Servers are supposed to be reliable, that’s obvious, why not run -current on a desktop? Because -stable is shipped every six months and I that’s is often enough for me. I prefer slow fashion.
>
>

---

**iXsystems** iX Ad Spot [NAB 2018 – Michael Dexter’s Recap](https://www.ixsystems.com/blog/nab-2018-recap-2/)

### [Introduction to HardenedBSD World](https://vermaden.wordpress.com/2018/04/06/introduction-to-hardenedbsd-world/) ###

>
>
> HardenedBSD is a security enhanced fork of FreeBSD which happened in 2014. HardenedBSD is implementing many exploit mitigation and security technologies on top of FreeBSD which all started with implementation of Address Space Layout Randomization (ASLR). The fork has been created for ease of development.
>
>
>
> To cite the https://hardenedbsd.org/content/about page – “HardenedBSD aims to implement innovative exploit mitigation and security solutions for the FreeBSD community. (…) HardenedBSD takes a holistic approach to security by hardening the system and implementing exploit mitigation technologies.”
>
>
>
> Most FreeBSD enthusiasts know mfsBSD project by Martin Matuska – http://mfsbsd.vx.sk/ – FreeBSD system loaded completely into memory. The mfsBSD synonym for the HardenedBSD world is SoloBSD – http://www.solobsd.org/ – which is based on HardenedBSD sources.
>
>
>
> One may ask how HardenedBSD project compared to more well know for its security OpenBSD system and it is very important question. The OpenBSD developers try to write ‘good’ code without dirty hacks for performance or other reasons. Clean and secure code is most important in OpenBSD world. The OpenBSD project even made security audit of all OpenBSD code available, line by line. This was easier to achieve in FreeBSD or HardenedBSD because OpenBSD code base its about ten times smaller. This has also other implications, possibilities. While FreeBSD (and HardenedBSD) offer many new features like mature SMP subsystem even with some NUMA support, ZFS filesystem, GEOM storage framework, Bhyve virtualization, Virtualbox option and many other new modern features the OpenBSD remains classic UNIX system with UFS filesystem and with very ‘theoretical’ SMP support. The vmm project tried to implement new hypervisor in OpenBSD world, but because of lack of support for graphics its for OpenBSD, Illumos and Linux currently, You will not virtualize Windows or Mac OS X there. This is also only virtualization option for OpenBSD as there are no Jails on OpenBSD. Current Bhyve implementation allows one even to boot latest Windows 2019 Technology Preview.
>
>
>
> A HardenedBSD project is FreeBSD system code base with LOTS of security mechanisms and mitigations that are not available on FreeBSD system. For example entire lib32 tree has been disabled by default on HardenedBSD to make it more secure. Also LibreSSL is the default SSL library on HardenedBSD, same as OpenBSD while FreeBSD uses OpenSSL for compatibility reasons.
>
>
>
> Comparison between LibreSSL and OpenSSL vulnerabilities.
>
>

* https://en.wikipedia.org/wiki/LibreSSL#Security
* https://wiki.freebsd.org/LibreSSL#LibreSSL*.28and*OpenSSL.29*Security*Vulnerabilities

>
>
> One may see HardenedBSD as FreeBSD being successfully pulled up to the OpenBSD level (at least that is the goal), but as FreeBSD has tons more code and features it will be harder and longer process to achieve the goal.
>
>
>
> As I do not have that much competence on the security field I will just repost the comparison from the HardenedBSD project versus other BSD systems. The comparison is also available here – https://hardenedbsd.org/content/easy-feature-comparison – on the HardenedBSD website.
>
>

---

### [Running my own git server](https://www.tomatkinson.uk/git.html) ###

>
>
> Note: This article is predominantly based on work by Hiltjo Posthuma who you should read because I would have spent far too much time failing to set things up if it wasn’t for their post. Not only have they written lots of very interesting posts, they write some really brilliant programs
>
>
>
> Since I started university 3 years ago, I started using lots of services from lots of different companies. The “cloud” trend led me to believe that I wanted other people to look after my data for me. I was wrong. Since finding myself loving the ethos of OpenBSD, I found myself wanting to apply this ethos to the services I use as well. Not only is it important to me because of the security benefits, but also because I like the minimalist style OpenBSD portrays. This is the first in a mini-series documenting my move from bloated, hosted, sometimes proprietary services to minimal, well-written, free, self-hosted services.
>
>

* Tools & applications

>
>
> These are the programs I am going to be using to get my git server up and running:
>
>

` httpd(8) acme-client(1) git(1) cgit(1) slowcgi(8) `

* Setting up httpd

>
>
> Ensure you have the necessary flags enabled in your /etc/rc.conf.local:
>
>

* Configuring cgit

>
>
> When using the OpenBSD httpd(8), it will serve it’s content in a chrooted environment,which defaults to the home directory of the user it runs as, which is www in this case. This means that the chroot is limited to the directory /var/www and it’s contents.
>
>
>
> In order to configure cgit, there must be a cgitrc file available to cgit. This is found at the location stored in $CGIT\_CONFIG, which defaults to /conf/cgitrc. Because of the chroot, this file is actually stored at /var/www/conf/cgitrc.
>
>

---

Beastie Bits
----------

* [My Penguicon 2018 Schedule](https://blather.michaelwlucas.com/archives/3173)
* [sigaction: see who killed you (and more)](https://rachelbythebay.com/w/2018/04/16/signal/)
* [Takeshi steps down from NetBSD core team after 13 years](http://mail-index.netbsd.org/netbsd-announce/2018/04/20/msg000284.html)
* [DragonFlyBSD Kernel Gets Some SMP Improvements – Phoronix](https://www.phoronix.com/scan.php?page=news_item&px=DragonFlyBSD-More-Perf-For-5.4)
* [Writing FreeBSD Malware](https://m.youtube.com/watch?v=bT_k06Xg-BE)

**Tarsnap ad**

Feedback/Questions
----------

* Troels - [Question regarding ZFS xattr](http://dpaste.com/35K0BD7#wrap)
* Mike - [Sharing your screen](http://dpaste.com/33X1K80#wrap)
* Wilyarti - [Adlocking on FreeBSD](http://dpaste.com/0D452Q0#wrap)
* Brad - [Recommendations for snapshot strategy](http://dpaste.com/08XAHNY#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---