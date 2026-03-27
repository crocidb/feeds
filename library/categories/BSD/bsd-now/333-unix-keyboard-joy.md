+++
title = "333: Unix Keyboard Joy"
description = "Your Impact on FreeBSD in 2019, Wireguard on OpenBSD Router, Amazon now has FreeBSD/ARM 12, pkgsrc-2019Q4, The Joys of UNIX Keyboards, OpenBSD on Digital Ocean, and more.Headlines[Your Impact on FreeBSD in 2019](https://www.freebsdfoundation.org/blog/your-impact-on-"
date = "2020-01-16T13:00:00Z"
url = "https://www.bsdnow.tv/333"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.571141838Z"
seen = false
+++

Your Impact on FreeBSD in 2019, Wireguard on OpenBSD Router, Amazon now has FreeBSD/ARM 12, pkgsrc-2019Q4, The Joys of UNIX Keyboards, OpenBSD on Digital Ocean, and more.

Headlines
----------

### [Your Impact on FreeBSD in 2019](https://www.freebsdfoundation.org/blog/your-impact-on-freebsd-in-2019/) ###

>
>
> It’s hard to believe that 2019 is nearly over. It has been an amazing year for supporting the FreeBSD Project and community! Why do I say that? Because as I reflect over the past 12 months, I realize how many events we’ve attended all over the world, and how many lives we’ve touched in so many ways. From advocating for FreeBSD to implementing FreeBSD features, my team has been there to help make FreeBSD the best open source project and operating system out there.
>
>
>
> In 2019, we focused on supporting a few key areas where the Project needed the most help. The first area was software development. Whether it was contracting FreeBSD developers to work on projects like wifi support, to providing internal staff to quickly implement hardware workarounds, we’ve stepped in to help keep FreeBSD innovative, secure, and reliable. Software development includes supporting the tools and infrastructure that make the development process go smoothly, and we’re on it with team members heading up the Continuous Integration efforts, and actively involved in the clusteradmin and security teams.
>
>
>
> Our advocacy efforts focused on recruiting new users and contributors to the Project. We attended and participated in 38 conferences and events in 21 countries. From giving FreeBSD presentations and workshops to staffing tables, we were able to have 1:1 conversations with thousands of attendees.
>
>
>
> Our travels also provided opportunities to talk directly with FreeBSD commercial and individual users, contributors, and future FreeBSD user/contributors. We’ve seen an increase in use and interest in FreeBSD from all of these organizations and individuals. These meetings give us a chance to learn more about what organizations need and what they and other individuals are working on. The information helps inform the work we should fund.
>
>

---

### [Wireguard on OpenBSD Router](https://obscurity.xyz/bsd/open/wireguard.html) ###

>
>
> wireguard (wg) is a modern vpn protocol, using the latest class of encryption algorithms while at the same time promising speed and a small code base.
>
>
>
> modern crypto and lean code are also tenants of openbsd, thus it was a no brainer to migrate my router from openvpn over to wireguard.
>
>
>
> my setup : a collection of devices, both wired and wireless, that are nat’d through my router (openbsd 6.6) out via my vpn provider azire\* and out to the internet using wg-quick to start wg.
>
>
>
> running : doubtless this could be improved on, but currently i start wg manually when my router boots. this, and the nat'ing on the vpn interface mean its impossible for clients to connect to the internet without the vpn being up. as my router is on a ups and only reboots when a kernel patch requires it, it’s a compromise i can live with. run wg-quick (please replace vpn with whatever you named your wg .conf file.) and reload pf rules.
>
>

---

News Roundup
----------

### [Amazon now has FreeBSD/ARM 12](https://aws.amazon.com/marketplace/pp/B081NF7BY7) ###

>
>
> AWS, the cloud division of Amazon, announced in December the next generation of its ARM processors, the Graviton2. This is a custom chip design with a 7nm architecture. It is based on 64-bit ARM Neoverse cores.
>
>
>
> Compared to first-generation Graviton processors (A1), today’s new chips should deliver up to 7x the performance of A1 instances in some cases. Floating point performance is now twice as fast. There are additional memory channels and cache speed memory access should be much faster.
>
>
>
> The company is working on three types of Graviton2 EC2 instances that should be available soon. Instances with a “g” suffix are powered by Graviton2 chips. If they have a “d” suffix, it also means that they have NVMe local storage.
>
>
>
> * General-purpose instances (M6g and M6gd)
>   
>   
> * Compute-optimized instances (C6g and C6gd)
>   
>   
> * Memory-optimized instances (R6g and R6gd)
>   
>   
>
>
>
> You can choose instances with up to 64 vCPUs, 512 GiB of memory and 25 Gbps networking.
>
>
>
> And you can see that ARM-powered servers are not just a fad. AWS already promises a 40% better price/performance ratio with ARM-based instances when you compare them with x86-based instances.
>
>
>
> AWS has been working with operating system vendors and independent software vendors to help them release software that runs on ARM. ARM-based EC2 instances support Amazon Linux 2, Ubuntu, Red Hat, SUSE, Fedora, Debian and FreeBSD. It also works with multiple container services (Docker, Amazon ECS, and Amazon Elastic Kubernetes Service).
>
>

* [Coverage of AWS Announcement ](https://techcrunch.com/2019/12/03/aws-announces-new-arm-based-instances-with-graviton2-processors/)

---

### [Announcing the pkgsrc-2019Q4 release](https://mail-index.netbsd.org/pkgsrc-users/2020/01/06/msg030130.html) ###

>
>
> The pkgsrc developers are proud to announce the 65th quarterly release of pkgsrc, the cross-platform packaging system. pkgsrc is available with more than 20,000 packages, running on 23 separate platforms; more information on pkgsrc itself is available at [https://www.pkgsrc.org/](https://www.pkgsrc.org/)
>
>
>
> In total, 190 packages were added, 96 packages were removed, and 1,868 package updates (to 1388 unique packages) were processed since the pkgsrc-2019Q3 release. As usual, a large number of updates and additions were processed for packages for go (14), guile (11), perl (170), php (10), python (426), and ruby (110). This continues pkgsrc's tradition of adding useful packages, updating many packages to more current versions, and pruning unmaintained packages that are believed to have essentially no users.
>
>

---

### [The Joys of UNIX Keyboards](https://donatstudios.com/UNIX-Keyboards) ###

>
>
> I fell in love with a dead keyboard layout.
>
>
>
> A decade or so ago while helping a friends father clean out an old building, we came across an ancient Sun Microsystems server. We found it curious. Everything about it was different from what we were used to. The command line was black on white, the connectors strange and foreign, and the keyboard layout was bizarre.
>
>
>
> We never did much with it; turning it on made all the lights in his home dim, and our joint knowledge of UNIX was nonexistent. It sat in his bedroom for years supporting his television at the foot of his bed.
>
>
>
> I never forgot that keyboard though. The thought that there was this alternative layout out there seemed intriguing to me.
>
>

---

### [OpenBSD on Digital Ocean](https://www.going-flying.com/blog/openbsd-on-digitalocean.html) ###

>
>
> Last night I had a need to put together a new OpenBSD machine. Since I already use DigitalOcean for one of my public DNS servers I wanted to use them for this need but sadly like all too many of the cloud providers they don't support OpenBSD. Now they do support FreeBSD and I found a couple writeups that show how to use FreeBSD as a shim to install OpenBSD.
>
>
>
> They are both sort of old at this point and with OpenBSD 6.6 out I ran into a bit of a snag. The default these days is to use a GPT partition table to enable EFI booting. This is generally pretty sane but it looks to me like the FreeBSD droplet doesn't support this. After the installer rebooted the VM failed to boot, being unable to find the bootloader.
>
>
>
> Thankfully DigitalOcean has a recovery ISO that you can boot by simply switching to it and powering off and then on your Droplet.
>
>

---

Beastie Bits
----------

* [FreeBSD defaults to LLVM on PPC](https://svnweb.freebsd.org/base?view=revision&revision=356111)
* [Theo De Raadt Interview between Ottawa 2019 Hackathon and BSDCAN 2019](https://undeadly.org/cgi?action=article;sid=20191231214356)
* [Bastille Poll about what people would like to see in 2020](https://twitter.com/BastilleBSD/status/1211475103143251968)
* [Notes on the classic book : The Design of the UNIX Operating System](https://github.com/suvratapte/Maurice-Bach-Notes)
* [Multics History](https://www.multicians.org/)
* [First meeting of the Hamilton BSD user group, February 11, 2020 18:30 - 21:00, Boston Pizza on Upper James St](http://studybsd.com/)

---

Feedback/Questions
----------

* Bill - [1.1 CDROM](http://dpaste.com/2H9CW6R)
* Greg - [More 50 Year anniversary information](http://dpaste.com/2SGA3KY)
* Dave - [Question time for Allan](http://dpaste.com/3ZAEKHD#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.