+++
title = "377: Firewall ban-sharing"
description = "History of FreeBD: BSDi and USL Lawsuits, Building a Website on Google Compute Engine, Firewall ban-sharing across machines, OpenVPN as default gateway on OpenBSD, Sorting out what the Single Unix Specification is, Switching from Apple to a Thinkpad for development, and more*NO"
date = "2020-11-19T11:00:00Z"
url = "https://www.bsdnow.tv/377"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.498408604Z"
seen = true
+++

History of FreeBD: BSDi and USL Lawsuits, Building a Website on Google Compute Engine, Firewall ban-sharing across machines, OpenVPN as default gateway on OpenBSD, Sorting out what the Single Unix Specification is, Switching from Apple to a Thinkpad for development, and more

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [History of FreeBSD : Part 2 : BSDi and USL Lawsuits](https://klarasystems.com/articles/history-of-freebsd-part-2-bsdi-and-usl-lawsuits/) ###

>
>
> In this second part of our series on the history of FreeBSD, we continue to trace the pre-history of FreeBSD and the events that would eventually shape the project and the future of open source software.
>
>
> ---
>

### [Building a Web Site on Google Compute Engine](https://cromwell-intl.com/open-source/google-freebsd-tls/) ###

>
>
> Here's how I deployed a web site to the Google Cloud Platform. I used FreeBSD for good performance, stability, and minimal complexity. I set up HTTPS with free Let's Encrypt TLS certificates for both RSA and ECC. Then I adjusted the Apache configuration for a good score from the authoritative Qualys server analysis.
>
>
> ---
>

News Roundup
----------

### [Firewall ban-sharing across machines](https://chown.me/blog/acacia) ###

>
>
> As described in My infrastructure as of 2019, my machines are located in three different sites and are loosely coupled. Nonetheless, I wanted to set things up so that if an IP address is acting maliciously toward one machine, all my machines block that IP at once so the meanie won't get to try one machine after another.
>
>
> ---
>
>
> ### [OpenVPN as default gateway on OpenBSD](https://dataswamp.org/~solene/2020-10-27-openbsd-openvpn.html) ###
>
>
>
> If you plan to use an OpenVPN tunnel to reach your default gateway, which would make the tun interface in the egress group, and use tun0 in your pf.conf which is loaded before OpenVPN starts?  
>  Here are the few tips I use to solve the problems.
>
>
> ---
>
>
> ### [Sorting out what the Single Unix Specification is and covers](https://utcc.utoronto.ca/~cks/space/blog/unix/SingleUnixSpecificationWhat) ###
>
>
>
> Sorting out what the Single Unix Specification is and covers  
>  October 8, 2020  
>  I've linked to the Single Unix Specification any number of times, for various versions of it (when I first linked to it, it was at issue 6, in 2006; it's now up to a 2018 edition). But I've never been quite clear what it covered and didn't cover, and how it related to POSIX and similar things. After yesterday's entry got me looking at the SuS site again, I decided to try to sort this out once and for all.
>
>
> ---
>
>
> ### [Bye-bye, Apple](http://blog.cretaria.com/posts/bye-bye-apple.html) ###
>
>
>
> The days of Apple products are behind me. I had been developing on a Macbook for over twelve years, but now, I’ve switched to an ever trending setup: OpenBSD on a Thinkpad.  
>  The new platform is a winner. Everything is clean, quick, and configurable. When I ps uaxww, I’m not hogging ‘gigs’ of RAM just to have things up and running. There’s no black magic that derails me at every turn. In short, my sanity has been long restored.
>
>

---

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Chris - small projects](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/377/feedback/Chris - small projects.md>)
* [Jens - ZFS Question](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/377/feedback/Jens - ZFS Question.md>)
  * [One pool to rule them all](https://ftfl.ca/blog/2016-09-17-zfs-fde-one-pool-conversion.html)

* [Shroyer - Dotnet on FreeBSD for Jellyfin](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/377/feedback/Shroyer - Dotnet on FreeBSD for Jellyfin.md>) \*\*\*
* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*