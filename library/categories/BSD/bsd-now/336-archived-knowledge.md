+++
title = "336: Archived Knowledge"
description = "Linux couldn’t duplicate OpenBSD, FreeBSD Q4 status report, OPNsense 19.7.9 released, archives retain and pass on knowledge, HardenedBSD Tor Onion Service v3 Nodes, and more.Headlines[OpenBSD has to be a BSD Unix and you couldn't duplicate it with Linux](https://utc"
date = "2020-02-06T13:00:00Z"
url = "https://www.bsdnow.tv/336"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.565992962Z"
seen = true
+++

Linux couldn’t duplicate OpenBSD, FreeBSD Q4 status report, OPNsense 19.7.9 released, archives retain and pass on knowledge, HardenedBSD Tor Onion Service v3 Nodes, and more.

Headlines
----------

### [OpenBSD has to be a BSD Unix and you couldn't duplicate it with Linux](https://utcc.utoronto.ca/~cks/space/blog/unix/OpenBSDMustBeABSD?showcomments) ###

>
>
> OpenBSD has a well deserved reputation for putting security and a clean system (for code, documentation, and so on) first, and everything else second. OpenBSD is of course based on BSD (it's right there in the name) and descends from FreeBSD NetBSD (you can read the history here). But one of the questions you could ask about it is whether it had to be that way, and in particular if you could build something like OpenBSD on top of Linux. I believe that the answer is no.
>
>
>
> Linux and the \*BSDs have a significantly different model of what they are. BSDs have a 'base system' that provides an integrated and fully operational core Unix, covering the kernel, C library and compiler, and the normal Unix user level programs, all maintained and distributed by the particular BSD. Linux is not a single unit this way, and instead all of the component parts are maintained separately and assembled in various ways by various Linux distributions. Both approaches have their advantages, but one big one for the BSD approach is that it enables global changes.
>
>
>
> Making global changes is an important part of what makes OpenBSD's approach to improving security, code maintenance, and so on work. Because it directly maintains everything as a unit, OpenBSD is in a position to introduce new C library or kernel APIs (or change them) and then immediately update all sorts of things in user level programs to use the new API. This takes a certain amount of work, of course, but it's possible to do it at all. And because OpenBSD can do this sort of ambitious global change, it does.
>
>
>
> This goes further than just the ability to make global changes, because in theory you can patch in global changes on top of a bunch of separate upstream projects. Because OpenBSD is in control of its entire base system, it's not forced to try to reconcile different development priorities or integrate clashing changes. OpenBSD can decide (and has) that only certain sorts of changes will be accepted into its system at all, no matter what people want. If there are features or entire programs that don't fit into what OpenBSD will accept, they just lose out.
>
>

---

### [FreeBSD Quarterly Status Report 2019Q4](https://lists.freebsd.org/pipermail/freebsd-announce/2020-January/001923.html) ###

>
>
> Here is the last quarterly status report for 2019. As you might remember from last report, we changed our timeline: now we collect reports the last month of each quarter and we edit and publish the full document the next month. Thus, we cover here the period October 2019 - December 2019.
>
>
>
> If you thought that the FreeBSD community was less active in the Christmas' quarter you will be glad to be proven wrong: a quick glance at the summary will be sufficient to see that much work has been done in the last months.
>
>
>
> Have a nice read!
>
>

---

News Roundup
----------

### [OPNsense 19.7.9 released](https://opnsense.org/opnsense-19-7-9-released/) ###

>
>
> As 20.1 nears we will be making adjustments to the scope of the release with an announcement following shortly.
>
>
>
> For now, this update brings you a GeoIP database configuration page for aliases which is now required due to upstream database policy changes and a number of prominent third-party software updates we are happy to see included.
>
>

---

### [Archives are important to retain and pass on knowledge](https://dan.langille.org/2020/01/07/archives-are-important-to-retain-and-pass-on-knowledge/) ###

>
>
> Archives are important. When they are public and available for searching, it retains and passes on knowledge. It saves vast amounts of time.
>
>

---

### [HardenedBSD Tor Onion Service v3 Nodes](https://hardenedbsd.org/article/shawn-webb/2020-01-30/hardenedbsd-tor-onion-service-v3-nodes) ###

>
>
> I've been working today on deploying Tor Onion Service v3 nodes across our build infrastructure. I'm happy to announce that the public portion of this is now completed. Below you will find various onion service hostnames and their match to our infrastructure.
>
>

* hardenedbsd.org: lkiw4tmbudbr43hbyhm636sarn73vuow77czzohdbqdpjuq3vdzvenyd.onion
* ci-01.nyi.hardenedbsd.org: qspcqclhifj3tcpojsbwoxgwanlo2wakti2ia4wozxjcldkxmw2yj3yd.onion
* ci-03.md.hardenedbsd.org: eqvnohly4tjrkpwatdhgptftabpesofirnhz5kq7jzn4zd6ernpvnpqd.onion
* ci-04.md.hardenedbsd.org: rfqabq2w65nhdkukeqwf27r7h5xfh53h3uns6n74feeyl7s5fbjxczqd.onion
* git-01.md.hardenedbsd.org: dacxzjk3kq5mmepbdd3ai2ifynlzxsnpl2cnkfhridqfywihrfftapid.onion

---

Beastie Bits
----------

* [The Missing Semester of Your CS Education (MIT Course)](https://missing.csail.mit.edu/)
* [An old Unix Ad](https://i.redd.it/503390rf7md41.png)
* [OpenBSD syscall call-from verification](https://marc.info/?l=openbsd-tech&m=157488907117170&w=2)
* [OpenBSD/arm64 on Pinebook](https://twitter.com/bluerise/status/1220963106563579909)
* [Reminder: First Southern Ontario BSD user group meeting, February 11th (this coming Tuesday!) 18:30 at Boston Pizza on Upper James st, Hamilton.](http://studybsd.com/)
* [NYCBUG: March meeting will feature Dr. Paul Vixie and his new talk “Operating Systems as Dumb Pipes”](https://www.nycbug.org/)
* [8th Meetup of the Stockholm BUG: March 3 at 18:00](https://www.meetup.com/de-DE/BSD-Users-Stockholm/events/267873938/)
* [Polish BSD User Group meets on Feb 11, 2020 at 18:15](https://bsd-pl.org/en)

---

Feedback/Questions
----------

* Sean - [ZFS and Creation Dates](http://dpaste.com/3W5WBV0#wrap)
* Christopher - [Help on ZFS Disaster Recovery](http://dpaste.com/3SE43PW)
* Mike - [Encrypted ZFS Send](http://dpaste.com/00J5JZG#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.