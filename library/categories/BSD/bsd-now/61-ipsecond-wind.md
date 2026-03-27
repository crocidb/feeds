+++
title = "61: IPSECond Wind"
description = "This week on the show, we sat down with John-Mark Gurney to talk about modernizing FreeBSD's IPSEC stack. We'll learn what he's adding, what needed to be fixed and how we'll benefit from the changes. As always, answers to your emails and all of this week's news, on BSD Now - the "
date = "2014-10-29T12:00:00Z"
url = "https://www.bsdnow.tv/61"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:51.199574217Z"
seen = false
+++

This week on the show, we sat down with John-Mark Gurney to talk about modernizing FreeBSD's IPSEC stack. We'll learn what he's adding, what needed to be fixed and how we'll benefit from the changes. As always, answers to your emails and all of this week's news, on BSD Now - the place to B.. SD.

This episode was brought to you by
----------

[![iXsystems - Enterprise servers and storage for open source](/images/iXlogo2.png)](http://www.ixsystems.com/bsdnow)[![Tarsnap - online backups for the truly paranoid](/images/tarsnap1.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [BSD panel at Phoenix LUG](https://www.youtube.com/watch?v=3AOF7fm-TJ0) ###

* The Phoenix, Arizona Linux users group had a special panel so they could learn a bit more about BSD
* It had one FreeBSD user and one OpenBSD user, and they answered questions from the organizer and the people in the audience
* They covered a variety of topics, including filesystems, firewalls, different development models, licenses and philosophy
* It was a good "real world" example of things potential switchers are curious to know about
* They closed by concluding that more diversity is always better, and even if you've got a lot of Linux boxes, putting a few BSD ones in the mix is a good idea \*\*\*

### [Book of PF signed copy auction](http://bsdly.blogspot.com/2014/10/the-book-of-pf-3rd-edition-is-here.html) ###

* Peter Hansteen (who we've [had on the show](http://www.bsdnow.tv/episodes/2014_04_30-puffy_firewall)) is auctioning off the first signed copy of the new Book of PF
* All the profits from the sale will go to the [OpenBSD Foundation](http://www.openbsd.org/donations.html)
* The updated edition of the book includes all the latest pf syntax changes, but also provides examples for FreeBSD and NetBSD's versions (which still use ALTQ, among other differences)
* If you're interested in firewalls, security or even just advanced networking, this book is a great one to have on your shelf - and the money will also go to a good cause
* [Michael Lucas](http://www.bsdnow.tv/episodes/2013_11_06-year_of_the_bsd_desktop) has [challenged Peter](https://www.marc.info/?l=openbsd-misc&m=141429413908567&w=2) to raise more for the foundation than his last book selling - let's see who wins
* Pause the episode, [go bid on it](http://www.ebay.com/itm/321563281902) and then come back! \*\*\*

### [FreeBSD Foundation goes to EuroBSDCon](http://freebsdfoundation.blogspot.com/2014/10/freebsd-foundation-goes-to-eurobsdcon.html) ###

* Some people from the FreeBSD Foundation went to EuroBSDCon this year, and come back with a nice trip report
* They also sponsored four other developers to go
* The foundation was there "to find out what people are working on, what kind of help they could use from the Foundation, feedback on what we can be doing to support the FreeBSD Project and community, and what features/functions people want supported in FreeBSD"
* They also have [a second report](http://freebsdfoundation.blogspot.com/2014/10/eurobsdcon-trip-report-kamil-czekirda.html) from Kamil Czekirda
* A total of $2000 was raised at the conference \*\*\*

### [OpenBSD 5.6 released](http://www.openbsd.org/56.html) ###

* **Note**: we're doing this story a couple days early - it's actually being released on November 1st (this Saturday), but we have next week off and didn't want to let this one slip through the cracks - it may be out by the time you're watching this
* Continuing their always-on-time six month release cycle, the OpenBSD team has released version 5.6
* It includes support for new hardware, lots of driver updates, network stack improvements (SMP, in particular) and new security features
* 5.6 is the first formal release with LibreSSL, their fork of OpenSSL, and lots of ports have been fixed to work with it
* You can now hibernate your laptop when using a fully-encrypted filesystem (see [our tutorial](http://www.bsdnow.tv/tutorials/fde) for that)
* ALTQ, Kerberos, Lynx, Bluetooth, TCP Wrappers and Apache were all removed
* This will serve as a "transitional" release for a lot of services: moving from Sendmail to OpenSMTPD, from nginx to [httpd](http://www.bsdnow.tv/episodes/2014_09_03-its_hammer_time) and from BIND to Unbound
* Sendmail, nginx and BIND will be gone in the next release, so either migrate to the new stuff between now and then or switch to the ports versions
* As always, 5.6 comes with its own [song and artwork](http://www.openbsd.org/lyrics.html#56) - the theme this time was obviously LibreSSL
* Be sure to check the [full changelog](http://www.openbsd.org/plus56.html) (*it's huge*) and pick up [a CD or tshirt](http://www.openbsd.org/orders.html) to support their efforts
* If you don't already have the public key releases are signed with, getting a physical CD is a good "out of bounds" way to obtain it safely
* Here are some cool [images of the set](https://imgur.com/a/5PtFe)
* After you do your installation or [upgrade](http://www.openbsd.org/faq/upgrade56.html), don't forget to head over to [the errata page](http://www.openbsd.org/errata56.html) and apply any patches listed there \*\*\*

Interview - John-Mark Gurney - [jmg@freebsd.org](mailto:jmg@freebsd.org) / [@encthenet](https://twitter.com/encthenet)
----------

Updating FreeBSD's IPSEC stack

---

News Roundup
----------

### [Clang in DragonFly BSD](https://www.dragonflydigest.com/2014/10/22/14942.html) ###

* As we all know, FreeBSD got rid of GCC in 10.0, and now uses Clang almost exclusively on i386/amd64
* Some DragonFly developers are considering migrating over as well, and one of them is doing some work to make the OS more Clang-friendly
* We'd love to see more BSDs switch to Clang/LLVM eventually, it's a lot more modern than the old GCC most are using \*\*\*

### [reallocarray(): integer overflow detection for free](http://lteo.net/blog/2014/10/28/reallocarray-in-openbsd-integer-overflow-detection-for-free/) ###

* One of the less obvious features in OpenBSD 5.6 is a new libc function: "reallocarray()"
* It's a replacement function for realloc(3) that provides integer overflow detection at basically no extra cost
* Theo and a few other developers have [already started](https://secure.freshbsd.org/search?project=openbsd&q=reallocarray) a mass audit of the entire source tree, replacing many instances with this new feature
* OpenBSD's explicit\_bzero was recently imported into FreeBSD, maybe someone could also port over this too \*\*\*

### [Switching from Linux blog](http://bothsidesofthence.tumblr.com/) ###

* A listener of the show has started a new blog series, detailing his experiences in switching over to BSD from Linux
* After over ten years of using Linux, he decided to give BSD a try after listening to our show (which is awesome)
* So far, he's put up a few posts about his initial thoughts, some documentation he's going through and his experiments so far
* It'll be an ongoing series, so we may check back in with him again later on \*\*\*

### [Owncloud in a FreeNAS jail](https://www.youtube.com/watch?v=z6VQwOl4wE4) ###

* One of the most common emails we get is about running Owncloud in FreeNAS
* Now, finally, someone made a video on how to do just that, and it's even jailed
* A member of the FreeNAS community has uploaded a video on how to set it up, with lighttpd as the webserver backend
* If you're looking for an easy way to back up and sync your files, this might be worth a watch \*\*\*

Feedback/Questions
----------

* [Ernõ writes in](http://slexy.org/view/s2XEsQdggZ)
* [David writes in](http://slexy.org/view/s21EizH2aR)
* [Kamil writes in](http://slexy.org/view/s24SAJ5im6)
* [Torsten writes in](http://slexy.org/view/s20ABZe0RD)
* [Dominik writes in](http://slexy.org/view/s208jQs9c6) \*\*\*

Mailing List Gold
----------

* [That's not our IP](https://mail-index.netbsd.org/source-changes/2014/10/17/msg059564.html)
* [Is this thing on?](https://lists.freebsd.org/pipermail/freebsd-acpi/2014-June/008644.html) \*\*\*