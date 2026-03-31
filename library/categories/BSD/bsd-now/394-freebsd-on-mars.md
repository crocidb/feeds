+++
title = "394: FreeBSD on Mars"
description = "Onboard Scheduler for the Mars 2020 Rover, Practical Guide to Storage of Large Amounts of Microscopy Data, OpenBSD guest with bhyve - OmniOS, NextCloud on OpenBSD, MySQL Transactions - the physical side, TrueNAS 12.0-U2.1 is released, HardenedBSD 2021 State of the Hardened Union,"
date = "2021-03-18T07:00:00Z"
url = "https://www.bsdnow.tv/394"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.470511795Z"
seen = true
+++

Onboard Scheduler for the Mars 2020 Rover, Practical Guide to Storage of Large Amounts of Microscopy Data, OpenBSD guest with bhyve - OmniOS, NextCloud on OpenBSD, MySQL Transactions - the physical side, TrueNAS 12.0-U2.1 is released, HardenedBSD 2021 State of the Hardened Union, and more

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/bsdnow)

Headlines
----------

### [Prototyping an Onboard Scheduler for the Mars 2020 Rover](https://ai.jpl.nasa.gov/public/documents/papers/rabideau_iwpss2017_prototyping.pdf) ###

* The mars rover runs VxWorks, which is based on BSD, and uses the FreeBSD networking stack. While there has been a lot of type about the little helicopter that was inside the rover running Linux, the rover itself runs BSD. \*\*\* ### [Practical Guide to Storage of Large Amounts of Microscopy Data](https://www.cambridge.org/core/journals/microscopy-today/article/practical-guide-to-storage-of-large-amounts-of-microscopy-data/D3CE39447BFF5BBF9B3ED8A0C35C6F36) \> Biological imaging tools continue to increase in speed, scale, and resolution, often resulting in the collection of gigabytes or even terabytes of data in a single experiment. In comparison, the ability of research laboratories to store and manage this data is lagging greatly. This leads to limits on the collection of valuable data and slows data analysis and research progress. Here we review common ways researchers store data and outline the drawbacks and benefits of each method. We also offer a blueprint and budget estimation for a currently deployed data server used to store large datasets from zebrafish brain activity experiments using light-sheet microscopy. Data storage strategy should be carefully considered and different options compared when designing imaging experiments. \*\*\* ## News Roundup ### [OpenBSD guest with bhyve - OmniOS](https://www.pbdigital.org/omniosce/bhyve/openbsd/2020/06/08/bhyve-zones-omnios.html) \> Today I will be creating a OpenBSD guest via bhyve on OmniOS. I will also be adding a Pass Through Ethernet Controller so I can have a multi-homed guest that will serve as a firewall/router. \> This post will cover setting up bhyve on OmniOS, so it will also be a good introduction to bhyve. As well, I look into OpenBSD’s uEFI boot loader so if you have had trouble with this, then you are in the right place. \*\*\* ### [NextCloud on OpenBSD](https://h3artbl33d.nl/blog/nextcloud-on-openbsd) \> NextCloud and OpenBSD are complimentary to one another. NextCloud is an awesome, secure and private alternative for propietary platforms, whereas OpenBSD forms the most secure and solid foundation to serve it on. Setting it up in the best way isn’t hard, especially using this step by step tutorial.

---

### [MySQL Transactions - the physical side](https://blog.koehntopp.info/2020/07/27/mysql-transactions.html) ###

>
>
> So you talk to a database, doing transactions. What happens actually, behind the scenes? Let’s have a look.
>
>
> ---
>
>
> ### [TrueNAS 12.0-U2.1 is released](https://www.truenas.com/docs/hub/intro/release-notes/12.0u2.1/) ###
>
>
> ---
>
>
> ### [HardenedBSD 2021 State of the Hardened Union - NYCBUG - 2021-04-07](https://www.nycbug.org/index?action=view&id=10682) ###
>
>
> ---
>

Beastie Bits
----------

* [FreeBSD Journal: Case Studies](https://freebsdfoundation.org/our-work/journal/) \*\*\* ###Tarsnap
* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [Al - BusyNAS](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/394/feedback/Al - BusyNAS>)

* [Jeff - ZFS and NFS on FreeBSD](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/394/feedback/Jeff - ZFS and NFS on FreeBSD>)

* [Michael - remote unlock for encrypted systems](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/394/feedback/Michael - remote unlock for encrypted systems>)

  ---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

  ---