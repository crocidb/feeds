+++
title = "331: Why Computers Suck"
description = "How learning OpenBSD makes computers suck a little less, How Unix works, FreeBSD 12.1 Runs Well on Ryzen Threadripper 3970X, BSDCan CFP, HardenedBSD Infrastructure Goals, and more.Headlines[Why computers suck and how learning from OpenBSD can make them marginally le"
date = "2020-01-02T13:00:00Z"
url = "https://www.bsdnow.tv/331"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.575220215Z"
seen = true
+++

How learning OpenBSD makes computers suck a little less, How Unix works, FreeBSD 12.1 Runs Well on Ryzen Threadripper 3970X, BSDCan CFP, HardenedBSD Infrastructure Goals, and more.

Headlines
----------

### [Why computers suck and how learning from OpenBSD can make them marginally less horrible](https://telegra.ph/Why-OpenBSD-is-marginally-less-horrible-12-05) ###

>
>
> How much better could things actually be if we abandoned the enterprise development model?
>
>
>
> Next I will compare this enterprise development approach with non-enterprise development - projects such as OpenBSD, which do not hesitate to introduce ABI breaking changes to improve the codebase.
>
>
>
> One of the most commonly referred to pillars of the project's philosophy has long been its emphasis on clean functional code. Any code which makes it into OpenBSD is subject to ongoing aggressive audits for deprecated, or otherwise unmaintained code in order to reduce cruft and attack surface. Additionally the project creator, Theo de Raadt, and his team of core developers engage in ongoing development for proactive mitigations for various attack classes many of which are directly adopted by various multi-platform userland applications as well as the operating systems themselves (Windows, Linux, and the other BSDs). Frequently it is the case that introducing new features (not just deprecating old ones) introduces new incompatibilities against previously functional binaries compiled for OpenBSD.
>
>
>
> To prevent the sort of kernel memory bloat that has plagued so many other operating systems for years, the project enforces a hard ceiling on the number of lines of code that can ever be in ring 0 at a given time. Current estimates guess the number of bugs per line of code in the Linux kernel are around 1 bug per every 10,000 lines of code. Think of this in the context of the scope creep seen in the Linux kernel (which if I recall correctly is currently at around 100,000,000 lines of code), as well as the Windows NT kernel (500,000,000 lines of code) and you quickly begin to understand how adding more and more functionality into the most privileged components of the operating system without first removing old components begins to add up in terms of the drastic difference seen between these systems in the number of zero day exploits caught in the wild respectively.
>
>

---

### [How Unix Works: Become a Better Software Engineer](https://neilkakkar.com/unix.html) ###

>
>
> Unix is beautiful. Allow me to paint some happy little trees for you. I’m not going to explain a bunch of commands – that’s boring, and there’s a million tutorials on the web doing that already. I’m going to leave you with the ability to reason about the system.
>
>
>
> Every fancy thing you want done is one google search away.
>
>
>
> But understanding why the solution does what you want is not the same.
>
>
>
> That’s what gives you real power, the power to not be afraid.
>
>
>
> And since it rhymes, it must be true.
>
>

---

News Roundup
----------

### [FreeBSD 12.1 Runs Refreshingly Well With AMD Ryzen Threadripper 3970X](https://www.phoronix.com/scan.php?page=article&item=freebsd-amd-3970x&num=1) ###

>
>
> For those of you interested in AMD's new Ryzen Threadripper 3960X/3970X processors with TRX40 motherboards for running FreeBSD, the experience in our initial testing has been surprisingly pleasant. In fact, it works out-of-the-box which one could argue is better than the current Linux support that needs the MCE workaround for booting. Here are some benchmarks of FreeBSD 12.1 on the Threadripper 3970X compared to Linux and Windows for this new HEDT platform.
>
>
>
> It was refreshing to see FreeBSD 12.1 booting and running just fine with the Ryzen Threadripper 3970X 32-core/64-thread processor from the ASUS ROG ZENITH II EXTREME motherboard and all core functionality working including the PCIe 4.0 NVMe SSD storage, onboard networking, etc. The system was running with 4 x 16GB DDR4-3600 memory, 1TB Corsair Force MP600 NVMe SSD, and Radeon RX 580 graphics. It was refreshing to see FreeBSD 12.1 running well with this high-end AMD Threadripper system considering Linux even needed a boot workaround.
>
>
>
> While the FreeBSD 12.1 experience was trouble-free with the ASUS TRX40 motherboard (ROG Zenith II Extreme) and AMD Ryzen Threadripper 3970X, DragonFlyBSD unfortunately was not. Both DragonFlyBSD 5.6.2 stable and the DragonFlyBSD daily development snapshot from last week were yielding a panic on boot. So with that, DragonFlyBSD wasn't tested for this Threadripper 3970X comparison but just FreeBSD 12.1.
>
>
>
> FreeBSD 12.1 on the Threadripper 3970X was benchmarked both with its default LLVM Clang 8.0.1 compiler and again with GCC 9.2 from ports for ruling out compiler differences. The FreeBSD 12.1 performance was compared to last week's Windows 10 vs. Linux benchmarks with the same system.
>
>

---

### [BSDCan 2020 CFP](https://lists.bsdcan.org/pipermail/bsdcan-announce/2019-December/000180.html) ###

>
>
> BSDCan 2020 will be held 5-6 (Fri-Sat) June, 2020 in Ottawa, at the University of Ottawa. It will be preceded by two days of tutorials on 3-4 June (Wed-Thu).
>
>
>
> NOTE the change of month in 2020 back to June Also: do not miss out on the Goat BOF on Tuesday 2 June.
>
>
>
> We are now accepting proposals for talks. The talks should be designed with a very strong technical content bias. Proposals of a business development or marketing nature are not appropriate for this venue.
>
>

* See [http://www.bsdcan.org/2020/](http://www.bsdcan.org/2020/)

>
>
> If you are doing something interesting with a BSD operating system, please submit a proposal. Whether you are developing a very complex system using BSD as the foundation, or helping others and have a story to tell about how BSD played a role, we want to hear about your experience. People using BSD as a platform for research are also encouraged to submit a proposal. Possible topics include:
>
>

* How we manage a giant installation with respect to handling spam.
* and/or sysadmin.
* and/or networking.
* Cool new stuff in BSD
* Tell us about your project which runs on BSD
* other topics (see next paragraph)

>
>
> From the BSDCan website, the Archives section will allow you to review the wide variety of past BSDCan presentations as further examples.
>
>
>
> Both users and developers are encouraged to share their experiences.
>
>

---

### [HardenedBSD Infrastructure Goals](https://github.com/lattera/articles/blob/master/hardenedbsd/2019-12-01_infrastructure/article.md) ###

>
>
> 2019 has been an extremely productive year with regards to HardenedBSD's infrastructure. Several opportunities aligned themselves in such a way as to open a door for a near-complete rebuild with a vast expansion.
>
>
>
> The last few months especially have seen a major expansion of our infrastructure. We obtained a number of to-be-retired Dell R410 servers. The crash of our nightly build server provided the opportunity to deploy these R410 servers, doubling our build capacity.
>
>
>
> My available time to spend on HardenedBSD has decreased compared to this time last year. As part of rebuilding our infrastructure, I wanted to enable the community to be able to contribute. I'm structuring the work such that help is just a pull request away. Those in the HardenedBSD community who want to contribute to the infrastructure work can simply open a pull request. I'll review the code, and deploy it after a successful review. Users/contributors don't need access to our servers in order to improve them.
>
>
>
> My primary goal for the rest of 2019 and into 2020 is to become fully self-hosted, with the sole exception of email. I want to transition the source-of-truth git repos to our own infrastructure. We will still provide a read-only mirror on GitHub.
>
>
>
> As I develop this infrastructure, I'm doing so with human rights in mind. HardenedBSD is in a very unique position. In 2020, I plan to provide production Tor Onion Services for the various bits of our infrastructure. HardenedBSD will provide access to its various internal services to its developers and contributors. The entire development lifecycle, going from dev to prod, will be able to happen over Tor.
>
>
>
> Transparency will be key moving forward. Logs for the auto-sync script are now published directly to GitHub. Build logs will be, soon, too. Logs of all automated processes, and the code for those processes, will be tracked publicly via git. This will be especially crucial for development over Tor.
>
>
>
> Integrating Tor into our infrastructure so deeply increases risk and maintenance burden. However, I believe that through added transparency, we will be able to mitigate risk. Periodic audits will need to be performed and published.
>
>
>
> I hope to migrate HardenedBSD's site away from Drupal to a static site generator. We don't really need the dynamic capabilities Drupal gives us. The many security issues Drupal and PHP both bring also leave much to be desired.
>
>
>
> So, that's about it. I spent the last few months of 2019 laying the foundation for a successful 2020. I'm excited to see how the project grows.
>
>

---

Beastie Bits
----------

* [FuryBSD - KDE plasma flavor now available](https://www.furybsd.org/kde-plasma-flavor-now-available/)
* [DragonFly - git: virtio - Fix LUN scan issue w/ Google Cloud](http://lists.dragonflybsd.org/pipermail/commits/2019-November/719945.html)
* [LPI is looking for BSD Specialist learning material writers](https://wiki.lpi.org/wiki/BSD_Specialist_Objectives_V1.0)
* [ZFS sync/async + ZIL/SLOG, explained](https://jrs-s.net/2019/05/02/zfs-sync-async-zil-slog/)
* [BSD-Licensed Combinatorics library/utility](https://lists.freebsd.org/pipermail/freebsd-announce/2019-December/001921.html)
* [SSL client vs server certificates and bacula-fd](https://dan.langille.org/2019/11/29/ssl-client-vs-server-certificates-and-bacula-fd/)
* [MaxxDesktop planning to come to FreeBSD](https://www.facebook.com/maxxdesktop/posts/2761326693888282) [Project Page](https://www.facebook.com/maxxdesktop/)

---

Feedback/Questions
----------

* Tom - [ZFS Mirror with different speeds](http://dpaste.com/3ZGYNS3#wrap)
* Jeff - [Knowledge is power](http://dpaste.com/1H9QDCR#wrap)
* Johnny - [Episode 324 response to Jacob](http://dpaste.com/1A7Q9EV)
* Pat - [NYC\*BUG meeting Jan Meeting Location](http://dpaste.com/0QPZ2GC)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.