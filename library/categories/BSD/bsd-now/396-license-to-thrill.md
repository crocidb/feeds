+++
title = "396: License to thrill"
description = "FreeBSD Network Troubleshooting, The State of FreeBSD, dhcpleased, bhyve for Calamares Development, EFS automount and ebsnvme-id, Old Usenix pictures, and more.NOTES   This episode of BSDNow is brought to you by TarsnapHeadlines"
date = "2021-04-01T07:00:00Z"
url = "https://www.bsdnow.tv/396"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.467309328Z"
seen = false
+++

FreeBSD Network Troubleshooting, The State of FreeBSD, dhcpleased, bhyve for Calamares Development, EFS automount and ebsnvme-id, Old Usenix pictures, and more.

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [FreeBSD Network Troubleshooting](https://klarasystems.com/articles/freebsd-network-troubleshooting-understanding-network-performance/) ###

>
>
> FreeBSD has a full set of debugging features, and the network stack is able to report a ton of information. So much that it can be hard to figure out what is relevant and what is not.
>
>
> ---
>
>
> ### [The State of FreeBSD](https://www.theregister.com/2021/03/10/the_state_of_freebsd/) ###
>
>
>
> License to thrill: Ahead of v13.0, the FreeBSD team talks about Linux and the completed toolchain project that changes everything
>
>

---

News Roundup
----------

### [dhcpleased(8) - DHCP client daemon](http://undeadly.org/cgi?action=article;sid=20210227232424) ###

>
>
> With the following commit, Florian Obser (florian@) imported dhcpleased(8), DHCP daemon to acquire IPv4 address leases from servers, plus dhcpleasectl(8), a utility to control the daemon:
>
>
> ---
>
>
> ### [bhyve for Calamares Development](https://euroquis.nl//freebsd/2021/03/05/bhyve.html) ###
>
>
>
> bhyve (pronounced “bee hive”) is a hypervisor for BSD systems (and Illumos / openSolaris). It is geared towards server workloads, but does support desktop-oriented operation as well. I spent some time wayyyy back in November wrestling with it in order to replace VirtualBox for Calamares testing on FreeBSD. The “golden hint” as far as I’m concerned came from Karen Bruner and now I have a functioning Calamares test-ground that is more useful than before.  
>  “Calamares is a free and open-source independent and distro-agnostic system installer for Linux distributions.“
>
>
> ---
>
>
> ### [Some new FreeBSD/EC2 features: EFS automount and ebsnvme-id](https://www.daemonology.net/blog/2020-05-31-Some-new-FreeBSD-EC2-features.html) ###
>
>
>
> As my regular readers will be aware, I've been working on and gradually improving FreeBSD/EC2 for many years. Recently I've added two new features, which are available in the weekly HEAD and 12-STABLE snapshots and will appear in releases starting from 12.2-RELEASE.
>
>
> ---
>
>
> ### [Old Usenix pictures](http://lists.nycbug.org/pipermail/talk/2021-February/018304.html) ###
>
>
> ---
>
>
> Beastie Bits
> ----------
>
>
>
> ### [[https://2021.eurobsdcon.org/](CFP](https://2021.eurobsdcon.org/](CFP) is open until May 26th, 2021) ###
>
>
>
> EuroBSDcon is the European technical conference for users and developers of BSD-based systems. The conference is scheduled to take place September 16-19 2021 in Vienna, Austria or as an all-online event if COVID-19 developments dictate. The tutorials will be held on Thursday and Friday to registered participants and the talks are presented to conference attendees on Saturday and Sunday.  
>  The Call for Talk and Presentation proposals period will close on May 26th, 2021. Prospective speakers will be notified of acceptance or otherwise by June 1st, 2021.
>
>
> ---
>
>
> ### [[https://campgnd.com/](CFP](https://campgnd.com/](CFP) is open until 2021-04-15) ###
>
>
>
> campgndd will be held May 28th, 29th and 30th 2021, from wherever you happen to be.  
>  We're looking for submissions on anything you're enthusiastic and excited about. If you enjoy it, the odds are we will too! You don't need to be an expert to propose anything.  
>  Some example of things we are looking for are:  
>  Talks  
>  Walkthroughs  
>  Music
>
>
>
> ### From the Desk of Michael Lucas… ###
>
>
>
> ```
> New Release: Only Footnotes
> I’ve lost count of the number of people who have told me that they purchase my books only for the footnotes. That’s okay. I don’t care why people buy my books, only that they do buy them. Nevertheless, I am a businessman living under capitalism and feel compelled to respond to my market.
> Allow me to present my latest release: Only Footnotes, a handsome hardcover-only compilation of decades of footnotes. From the back cover:
> -----
> Only Footnotes. Because that’s why you read his books.
> Academics hate footnotes. Michael W Lucas loves them. What he does with them wouldn’t pass academic muster, but that doesn’t mean the reader should skip them. The footnotes are the best part! Why not read only the footnotes, and skip all that other junk?
> After literal minutes of effort, Only Footnotes collects every single footnote from all of Lucas’ books to date.* Recycle those cumbersome treatises stuffed with irrelevant facts! No more flipping through pages and pages of actual technical knowledge looking for the offhand movie reference or half-formed joke. This slender, elegant volume contains everything the man ever passed off as his dubious, malformed “wisdom.”
> Smart books have footnotes. Smarter books are only footnotes.
> *plus additional annotations from the author. Because sometimes even a footnote needs a footnote.
> ----
> With interior illustrations by OpenBSD’s akoshibe, this distinguished tome would make fine inspirational reading for a system administrator, network engineer, or anyone sentenced to a life in information technology. Available at all fine bookstores, and many mediocre ones!
>
> ```
>
>
>
> ### Tarsnap ###
>
>
>
> * This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.
> * Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv) \*\*\*
>
>

Special Guest: Tom Jones.