+++
title = "348: BSD Community Collections"
description = "FuryBSD 2020Q2 Images Available, Technical reasons to choose FreeBSD over GNU/Linux, Ars technica reviews GhostBSD, “TLS Mastery” sponsorships open, BSD community show their various collections, a tale of OpenBSD secure memory allocator internals, learn to stop worrying and love "
date = "2020-04-30T12:00:00Z"
url = "https://www.bsdnow.tv/348"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.545051108Z"
seen = false
+++

FuryBSD 2020Q2 Images Available, Technical reasons to choose FreeBSD over GNU/Linux, Ars technica reviews GhostBSD, “TLS Mastery” sponsorships open, BSD community show their various collections, a tale of OpenBSD secure memory allocator internals, learn to stop worrying and love SSDs, and more.

Headlines
----------

### [FuryBSD 2020Q2 Images Available for XFCE and KDE](https://www.furybsd.org/furybsd-2020-q2-images-are-available-for-xfce-and-kde/) ###

>
>
> The Q2 2020 images are not a visible leap forward but a functional leap forward. Most effort was spent creating a better out of box experience for automatic Ethernet configuration, working WiFi, webcam, and improved hypervisor support.
>
>

---

### [Technical reasons to choose FreeBSD over GNU/Linux](https://unixsheikh.com/articles/technical-reasons-to-choose-freebsd-over-linux.html) ###

>
>
> Since I wrote my article "Why you should migrate everything from Linux to BSD" I have been wanting to write something about the technical reasons to choose FreeBSD over GNU/Linux and while I cannot possibly cover every single reason, I can write about some of the things that I consider worth noting.
>
>

---

News Roundup
----------

### + [Not actually Linux distro review deux: GhostBSD](https://arstechnica.com/gadgets/2020/04/not-actually-linux-distro-review-deux-ghostbsd/) ###

>
>
> When I began work on the FreeBSD 12.1-RELEASE review last week, it didn't take long to figure out that the desktop portion wasn't going very smoothly.
>
>
>
> I think it's important for BSD-curious users to know of easier, gentler alternatives, so I did a little looking around and settled on GhostBSD for a follow-up review.
>
>
>
> GhostBSD is based on TrueOS, which itself derives from FreeBSD Stable. It was originally a Canadian distro, but—like most successful distributions—it has transcended its country of origin and can now be considered worldwide. Significant GhostBSD development takes place now in Canada, Italy, Germany, and the United States.
>
>

---

### [“TLS Mastery” sponsorships open](https://mwl.io/archives/6265) ###

>
>
> My next book will be TLS Mastery, all about Transport Layer Encryption, Let’s Encrypt, OCSP, and so on.
>
>
>
> This should be a shorter book, more like my DNSSEC or Tarsnap titles, or the first edition of Sudo Mastery. I would like a break from writing doorstops like the SNMP and jails books.
>
>

---

### JT (our producer) shared his Open Source Retail Box Collection on twitter this past weekend and there was a nice response from a few in the BSD Community showing their collections: ###

* JT's post: [https://twitter.com/q5sys/status/1251194823589138432](https://twitter.com/q5sys/status/1251194823589138432)

  * High Resolution Image to see the bottom shelf better: [https://photos.smugmug.com/photos/i-9QTs2RR/0/f1742096/O/i-9QTs2RR.jpg](https://photos.smugmug.com/photos/i-9QTs2RR/0/f1742096/O/i-9QTs2RR.jpg)
  * Closeup of the BSD Section: [https://twitter.com/q5sys/status/1251294290782928897](https://twitter.com/q5sys/status/1251294290782928897)

* Others jumped in with their collections:

  * Deb Goodkin's collection: [https://twitter.com/dgoodkin/status/1251294016139743232](https://twitter.com/dgoodkin/status/1251294016139743232) & [https://twitter.com/dgoodkin/status/1251298125672660992](https://twitter.com/dgoodkin/status/1251298125672660992)
  * FreeBSD Frau's FreeBSD Collection: [https://twitter.com/freebsdfrau/status/1251290430475350018](https://twitter.com/freebsdfrau/status/1251290430475350018)
  * Jason Tubnor's OpenBSD Collection: [https://twitter.com/Tubsta/status/1251265902214918144](https://twitter.com/Tubsta/status/1251265902214918144)

Do you have a nice collection, take a picture and send it in!

---

### [Tale of OpenBSD secure memory allocator internals - malloc(3)](https://bsdb0y.github.io/blog/deep-dive-into-the-OpenBSD-malloc-and-friends-internals-part-1.html) ###

>
>
> Hi there,
>
>
>
> It's been a very long time I haven't written anything after my last OpenBSD blogs, that is,
>
>
>
> OpenBSD Kernel Internals — Creation of process from user-space to kernel space.
>
>
>
> OpenBSD: Introduction to `execpromises` in the pledge(2)
>
>
>
> pledge(2): OpenBSD's defensive approach to OS Security
>
>
>
> So, again I started reading OpenBSD source codes with debugger after reducing my sleep timings and managing to get some time after professional life. This time I have picked one of my favourite item from my wishlist to learn and share, that is, OpenBSD malloc(3), secure allocator
>
>

---

### [How I learned to stop worrying and love SSDs](https://www.ixsystems.com/community/threads/how-i-learned-to-stop-worrying-and-love-ssds.82617/) ###

>
>
> my home FreeNAS runs two pools for data. One RAIDZ2 with four spinning disk drives and one mirror with two SSDs. Toying with InfluxDB and Grafana in the last couple of days I found that I seem to have a constant write load of 1 Megabyte (!) per second on the SSDs. What the ...?
>
>
>
> So I run three VMs on the SSDs in total. One with Windows 10, two with Ubuntu running Confluence, A wiki essentially, with files for attachments and MySQL as the backend database. Clearly the writes had to stop when the wikis were not used at all, just sitting idle, right?
>
>
>
> Well even with a full query log and quite some experience in the operation of web applications I could not figure out what Confluence is doing (productively, no doubt) but trust me, it writes a couple of hundred kbytes to the database each second just sitting idle.
>
>

---

### [My infrastructure as of 2019](https://chown.me/blog/infrastructure-2019.html) ###

>
>
> I've wanted to write about my infrastructure for a while, but I kept thinking, "I'll wait until after I've done $next\_thing\_on\_my\_todo." Of course this cycle never ends, so I decided to write about its state at the end of 2019. Maybe I'll write an update on it in a couple of moons; who knows?
>
>

---

For something different than our usual Beastie Bits… we bring you…
----------

We're all quarantined so lets install BSD on things! Install BSD on something this week, write it up and let us know about it, and maybe we'll feature you!
----------

* [Installation of NetBSD on a Mac Mini](https://e17i.github.io/articles-netbsd-install/)

* [OpenBSD on the HP Envy 13](https://icyphox.sh/blog/openbsd-hp-envy/)

* [Install NetBSD on a Vintage Computer](https://www.rs-online.com/designspark/install-netbsd-on-a-vintage-computer)

* [BSDCan Home Lab Panel recording session: May 5th at 18:00 UTC](https://twitter.com/allanjude/status/1251895348836143104)

* [Allan started a series of FreeBSD Office Hours](https://wiki.freebsd.org/OfficeHours)

---

BSDNow is going Independent
----------

* After being part of Jupiter Broadcasting since we started back in 2013, BSDNow is moving to become independent. We extend a very large thank you to Jupiter Broadcasting and Linux Academy for hosting us for so many years, and allowing us to bring you over 100 episodes without advertisements. What does this mean for you, the listener? Not much will change, just make sure your subscription is via the RSS feed at BSDNow.tv rather than one of the Jupiter Broadcasting feeds. We will update you with more news as things settle out.

Feedback/Questions
----------

* Todd - [LinusTechTips Claims about ZFS](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/348/feedback/Todd - LinusTechTips' claims on ZFS.md>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.