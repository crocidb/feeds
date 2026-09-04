+++
title = "197: Relaying the good news"
description = "We’re at BSDCan, but we have an interview with Michael W. Lucas which you don’t want to miss.This episode was brought to you byiXsystems - Enterprise Servers and Storage for Open Source[![DigitalOcean - Simple Cloud H"
date = "2017-06-07T12:00:00Z"
url = "https://www.bsdnow.tv/197"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.889555424Z"
seen = true
+++

We’re at BSDCan, but we have an interview with Michael W. Lucas which you don’t want to miss.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

We are off to BSDCan but we have an interview and news roundup for you.

---

Interview - Michael W. Lucas - [mwlucas@michaelwlucas.com](mailto:mwlucas@michaelwlucas.com) / [@mwlauthor](https://twitter.com/mwlauthor)
----------

* Books, conferences & how these two combine \*\*\*

News Roundup
----------

### [In The Name Of Sane Email: Setting Up OpenBSD's spamd(8) With Secondary MXes In Play](http://bsdly.blogspot.no/2012/05/in-name-of-sane-email-setting-up-spamd.html) ###

* “The Grumpy BSD Guy”, Peter Hansteen is at it again, they have produced an updated version of a full recipe for OpenBSD’s spamd for your primary AND secondary mail servers

>
>
> Recipes in our field are all too often offered with little or no commentary to help the user understand the underlying principles of how a specific configuration works. To counter the trend and offer some free advice on a common configuration, here is my recipe for a sane mail setup.  
>  Mailing lists can be fun. Most of the time the discussions on lists like openbsd-misc are useful, entertaining or both. But when your battle with spam fighting technology ends up blocking your source of information and entertainment (like in the case of the recent thread titled "spamd greylisting: false positives" - starting with this message), frustration levels can run high, and in the process it emerged that some readers out there place way too much trust in a certain site offering barely commented recipes (named after a rare chemical compound Cl-Hg-Hg-Cl).
>
>

* 4 easy steps:
  * Make sure your MXes (both primary and secondary) are able to receive mail for your domains
  * Set set up content filtering for all MXes, since some spambots actually speak SMTP
  * Set up spamd in front of all MXes
  * Set up synchronization between your spamds

>
>
> These are the basic steps. If you want to go even further, you can supplement your greylisting and publicly available blacklists with your own greytrapping, but greytrapping is by no means required.  
>  Once you have made sure that your mail exchangers will accept mail for your domains (checking that secondaries do receive and spool mail when you stop the SMTP service on the primary), it's time to start setting up the content filtering.
>
>

* The post provides links if you need help getting the basic mail server functionality going

>
>
> At this point you will more likely than not discover that any differences in filtering setups between the hosts that accept and deliver mail will let spam through via the weakest link. Tune accordingly, or at least until you are satisfied that you have a fairly functional configuration.  
>  As you will have read by now in the various sources I cited earlier, you need to set up rules to redirect traffic to your spamd as appropriate. Now let's take a peek at what I have running at my primary site's gateway.
>
>

* The articles provides a few different sets of rules
* The setup includes running all outgoing mail through spamd to auto-populate the whitelists, allowing replies to your emails to get through without greylisting

>
>
> At this point, you have seen how to set up two spamds, each running in front of a mail exchanger. You can choose to run with the default spamd.conf, or you can edit in your own customizations.
>
>

* There is also a link to Peter’s spamd.conf if you want to use “what works for me”

>
>
> The fourth and final required step for a spamd setup with backup mail exchangers it to set up synchronization between the spamds. The synchronization keeps your greylists in sync and transfers information on any greytrapped entries to the partner spamds. As the spamd man page explains, the synchronization options -y and -Y are command line options to spamd.
>
>

* The articles steps through the process of configuring spamd to listen for synchronization, and to send synchronization messages to its peer

>
>
> With these settings in place, you have more or less completed step four of our recipe.
>
>

* The article also shows you how to configure spamd to log to a separate log file, to make the messages easier to find and consolidate between your mail servers

>
>
> After noting the system load on your content filtering machines, restart your spamds. Then watch the system load values on the content filterers and take a note of them from time to time, say every 30 minutes or so  
>  Step 4) is the last required step for building a multi-MX configuration. You may want to just leave the system running for a while and watch any messages that turn up in the spamd logs or the mail exchanger's logs  
>  The final embellishment is to set up local greytrapping. The principle is simple: If you have one or more addresses in your domain that you know will never be valid, you add them to your list of trapping addresses  
>  any host that tries to deliver mail to [noreply@mydomain.nx](mailto:noreply@mydomain.nx) will be added to the local blacklist spamd-greytrap to be stuttered at for as long as it takes.  
>  Greytrapping can be fun, you can search for posts here tagged with the obvious keywords. To get you started, I offer up my published list of trap addresses, built mainly from logs of unsuccessful delivery attempts here, at The BSDly.net traplist page, while the raw list of trap email addresses is available here. If you want to use that list in a similar manner for your site, please do, only remember to replace the domain names with one or more that you will be receiving mail for.
>
>

* Let us know how this affects your inbox \*\*\*

Beastie Bits
----------

* [Status of FreeBSD’s capsicum on Linux](http://www.capsicum-linux.org/)
* [How to build a gateway, from 1979](http://www.networksorcery.com/enp/ien/ien109.txt)
* [Linux escapee Hamza Sheikh on “Why FreeBSD?”](https://bsdmag.org/why_freebsd/)
* [UNIX is still as relevant as ever](https://blog.opengroup.org/2012/05/17/unix-is-still-as-relevant-as-ever/)
* [Upcoming Summer 2017 FreeBSD Foundation Events](https://www.freebsdfoundation.org/blog/upcoming-summer-2017-freebsd-foundation-events/) \*\*\*