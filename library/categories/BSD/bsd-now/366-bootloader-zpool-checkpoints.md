+++
title = "366: Bootloader zpool checkpoints"
description = "OpenZFS with ZSTD lands in FreeBSD 13, LibreSSL doc status update, FreeBSD on SPARC64 (is dead), Bringing zpool checkpoints to a FreeBSD bootloader, and moreNOTES   This episode of BSDNow is brought to you by TarsnapHeadlines[OpenZF"
date = "2020-09-03T10:00:00Z"
url = "https://www.bsdnow.tv/366"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.516031580Z"
seen = false
+++

OpenZFS with ZSTD lands in FreeBSD 13, LibreSSL doc status update, FreeBSD on SPARC64 (is dead), Bringing zpool checkpoints to a FreeBSD bootloader, and more

***NOTES***  
 This episode of BSDNow is brought to you by [Tarsnap](https://www.tarsnap.com/)

Headlines
----------

### [OpenZFS with ZSTD land in FreeBSD 13](https://svnweb.freebsd.org/base?view=revision&revision=364746) ###

* [ZStandard Compression for OpenZFS](https://github.com/openzfs/zfs/commit/10b3c7f5e424f54b3ba82dbf1600d866e64ec0a0) \> The primary benefit is maintaining a completely shared code base with the community allowing FreeBSD to receive new features sooner and with less effort. \> I would advise against doing 'zpool upgrade' or creating indispensable pools using new features until this change has had a month+ to soak.
* Rebasing FreeBSD’s OpenZFS on the new upstream was sponsored by iXsystems
* The competition of ZSTD support for OpenZFS was sponsored by the FreeBSD Foundation \*\*\*

### [LibreSSL documentation status update](https://undeadly.org/cgi?action=article;sid=20200817063735) ###

>
>
> More than six years ago, LibreSSL was forked from OpenSSL, and almost two years ago, i explained the status of LibreSSL documentation during EuroBSDCon 2018 in Bucuresti. So it seems providing an update might be in order.  
>  Note that this is not an update regarding LibreSSL status in general because i'm not the right person to talk about the big picture of working on the LibreSSL code, my work has been quite focussed on documentation. All the same, it is fair to say that even though the number of developers working on it is somewhat limited, the LibreSSL project is quite alive, typically having a release every few months. Progress continues being made with respect to porting and adding new functionality (for example regarding TLSv1.3, CMS, RSA-PSS, RSA-OAEP, GOST, SM3, SM4, XChaCha20 during the last two years), OpenSSL compatibility improvements (including providing additional OpenSSL-1.1 APIs), and lots of bug fixes and code cleanup.
>
>

---

### [FreeBSD on SPARC64 (is dead)](https://eerielinux.wordpress.com/2020/02/15/freebsd-on-sparc64-is-dead/) ###

>
>
> ’m coming pretty late to the party, because SPARC64 support in FreeBSD is apparently doomed: After the POWER platform made the switch to a LLVM/Clang-based toolchain, SPARC64 is one of the last ones that still uses the ancient GCC 4.2-based toolchain that the project wants to finally get rid off (it has already happened as I was writing this – looks like the firm plan was not so firm after all, since they killed it off early). And compared to the other platforms it has seen not too much love in recent times… SPARC64 being a great platform, I’d be quite sad to see it go. But before that happens let’s see what the current status is and what would need to be done if it were to survive, shall we?
>
>

---

News Roundup
----------

### [Bringing zpool checkpoints to a FreeBSD bootloader](https://www.oshogbo.vexillium.org/blog/79/) ###

>
>
> Almost two years ago I wrote a blog post about checkpoints in ZFS. I didn’t hide that I was a big fan of them. That said, after those two years, I still feel that there are underappreciated features in the ZFS world, so I decided to do something about that.  
>  Currently, one of the best practices for upgrading your operating system is to use boot environments. They are a great feature for managing multiple kernels and userlands. They are based on juggling which ZFS datasets are mounted. Each dataset has its own version of the system. Unfortunately, boot environments have their limitations. If we, for example, upgrade our ZFS pool, we may not be able to use older versions of the system anymore.   
>  The big advantage of boot environments is that they have very good tools. Two main tools are beadm (which was created by vermaden) and bectl (which currently is in the FreeBSD base system). These tools allow us to create and manage boot environments.
>
>

---

Beastie Bits
----------

* [The First Unix Port](https://documents.uow.edu.au/content/groups/public/@web/@inf/@scsse/documents/doc/uow103747.pdf)
* [TLS Mastery updates, August 2020](https://mwl.io/archives/7346)
* [What is the Oldest BSD Distribution still around today](https://www.youtube.com/watch?v=ww60o940kEk)

---

### Tarsnap ###

* This weeks episode of BSDNow was sponsored by our friends at Tarsnap, the only secure online backup you can trust your data to. Even paranoids need backups.

Feedback/Questions
----------

* [ben - zfs send questions](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/366/feedback/ben - zfs send questions.md>)
* [lars - zfs pool question](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/366/feedback/lars - zfs pool question.md>)
* [neutron - bectl vs beadm](<https://github.com/BSDNow/bsdnow.tv/blob/master/episodes/366/feedback/neutron - bectl vs beadm.md>)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---