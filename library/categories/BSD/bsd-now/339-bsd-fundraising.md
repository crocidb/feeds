+++
title = "339: BSD Fundraising"
description = "Meet FuryBSD, NetBSD 9.0 has been released, OpenBSD Foundation 2019 campaign wrapup, a retrospective on OmniOS ZFS-based NFS fileservers, NetBSD Fundraising 2020 goal, OpenSSH 8.2 released, and more.Headlines[Meet FuryBSD: A New Desktop BSD Distribution](https://itsfoss.co"
date = "2020-02-27T13:00:00Z"
url = "https://www.bsdnow.tv/339"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.560442046Z"
seen = false
+++

Meet FuryBSD, NetBSD 9.0 has been released, OpenBSD Foundation 2019 campaign wrapup, a retrospective on OmniOS ZFS-based NFS fileservers, NetBSD Fundraising 2020 goal, OpenSSH 8.2 released, and more.## Headlines

### [Meet FuryBSD: A New Desktop BSD Distribution](https://itsfoss.com/furybsd/) ###

>
>
> At its heart, FuryBSD is a very simple beast. According to the site, “FuryBSD is a back to basics lightweight desktop distribution based on stock FreeBSD.” It is basically FreeBSD with a desktop environment pre-configured and several apps preinstalled. The goal is to quickly get a FreeBSD-based system running on your computer.
>
>
>
> You might be thinking that this sounds a lot like a couple of other BSDs that are available, such as NomadBSD and GhostBSD. The major difference between those BSDs and FuryBSD is that FuryBSD is much closer to stock FreeBSD. For example, FuryBSD uses the FreeBSD installer, while others have created their own installers and utilities.
>
>
>
> As it states on the site, “Although FuryBSD may resemble past graphical BSD projects like PC-BSD and TrueOS, FuryBSD is created by a different team and takes a different approach focusing on tight integration with FreeBSD. This keeps overhead low and maintains compatibility with upstream.” The lead dev also told me that “One key focus for FuryBSD is for it to be a small live media with a few assistive tools to test drivers for hardware.”
>
>
>
> Currently, you can go to the FuryBSD homepage and download either an XFCE or KDE LiveCD. A GNOME version is in the works.
>
>

---

### [NetBSD 9.0](https://www.netbsd.org/releases/formal-9/NetBSD-9.0.html) ###

>
>
> The NetBSD Project is pleased to announce NetBSD 9.0, the seventeenth major release of the NetBSD operating system.
>
>
>
> This release brings significant improvements in terms of hardware support, quality assurance, security, along with new features and hundreds of bug fixes. Here are some highlights of this new release.
>
>

---

News Roundup
----------

### [OpenBSD Foundation 2019 campaign wrapup](http://undeadly.org/cgi?action=article;sid=20200217001107) ###

>
>
> Our target for 2019 was CDN$300K. Our community's continued generosity combined with our corporate donors exceeded that nicely. In addition we received the largest single donation in our history, CDN$380K from Smartisan. The return of Google was another welcome event. Altogether 2019 was our most successful campaign to date, yielding CDN$692K in total.
>
>
>
> We thank all our donors, Iridium (Smartisan), Platinum (Yandex, Google), Gold (Microsoft, Facebook) Silver (2Keys) and Bronze (genua, Thinkst Canary). But especially our community of smaller donors whose contributions are the bedrock of our support. Thank you all!
>
>

* [OpenBSD Foundation 2019 Fundraising Goal Exceeded](https://www.openbsdfoundation.org/campaign2019.html)

---

### [A retrospective on our OmniOS ZFS-based NFS fileservers](https://utcc.utoronto.ca/~cks/space/blog/solaris/OmniOSFileserverRetrospective) ###

>
>
> Our OmniOS fileservers have now been out of service for about six months, which makes it somewhat past time for a retrospective on them. Our OmniOS fileservers followed on our Solaris fileservers, which I wrote a two part retrospective on (part 1, part 2), and have now been replaced by our Linux fileservers. To be honest, I have been sitting on my hands about writing this retrospective because we have mixed feelings about our OmniOS fileservers.
>
>
>
> I will put the summary up front. OmniOS worked reasonably well for us over its lifespan here and looking back I think it was almost certainly the right choice for us at the time we made that choice (which was 2013 and 2014). However it was not without issues that marred our experience with it in practice, although not enough to make me regret that we ran it (and ran it for as long as we did). Part of our issues are likely due to a design mistake in making our fileservers too big, although this design mistake was probably magnified when we were unable to use Intel 10G-T networking in OmniOS.
>
>
>
> On the one hand, our OmniOS fileservers worked, almost always reliably. Like our Solaris fileservers before them, they ran quietly for years without needing much attention, delivering NFS fileservice to our Ubuntu servers; specifically, we ran them for about five years (2014 through 2019, although we started migrating away at the end of 2018). Over this time we had only minor hardware issues and not all that many disk failures, and we suffered no data loss (with ZFS checksums likely saving us several times, and certainly providing good reassurances). Our overall environment was easy to manage and was pretty much problem free in the face of things like failed disks. I'm pretty sure that our users saw a NFS environment that was solid, reliable, and performed well pretty much all of the time, which is the important thing. So OmniOS basically delivered the fileserver environment we wanted.
>
>

---

### [NetBSD Fundraising 2020 goal](http://blog.netbsd.org/tnf/entry/fundraising_2020) ###

>
>
> Is it really more than 10 years since we last had an official fundraising drive?
>
>
>
> Looking at old TNF financial reports I noticed that we have been doing quite well financially over the last years, with a steady stream of small and medium donations, and most of the time only moderate expenditures. The last fundraising drive back in 2009 was a giant success, and we have lived off it until now.
>
>

---

### [OpenSSH 8.2 released February 14, 2020](http://www.openssh.com/txt/release-8.2) ###

>
>
> OpenSSH 8.2 was released on 2020-02-14. It is available from the mirrors listed at [https://www.openssh.com/](https://www.openssh.com/).
>
>
>
> OpenSSH is a 100% complete SSH protocol 2.0 implementation and includes sftp client and server support.
>
>
>
> Once again, we would like to thank the OpenSSH community for their continued support of the project, especially those who contributed code or patches, reported bugs, tested snapshots or donated to the project. More information on donations may be found at:
>
>

* [https://www.openssh.com/donations.html](https://www.openssh.com/donations.html)

---

Beastie Bits
----------

* [FreeNAS vs. Unraid: GRUDGE MATCH!](https://www.youtube.com/watch?v=aXsRIrC5bjg)
* [Unix Toolbox](http://cb.vu/unixtoolbox.xhtml)
* [Rigs of Rods - OpenBSD Physics Game](https://docs.rigsofrods.org/)
* [NYCBug - Dr Vixie](http://dpaste.com/0V35MAB#wrap)
* Hamilton BSD User group will meet again on March 10th]([http://studybsd.com/](http://studybsd.com/))
* [BSD Stockholm - Meetup March 3rd 2020](https://www.meetup.com/BSD-Users-Stockholm/events/267873938/)

---

Feedback/Questions
----------

* Shirkdog - [Question](http://dpaste.com/36E2BZ1)
* Master One - [ZFS + Suspend/resume](http://dpaste.com/3B9M814#wrap)
* Micah Roth - [ZFS write caching](http://dpaste.com/0D4GDX1#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.