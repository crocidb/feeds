+++
title = "Episode 277: Nmap Level Up | BSD Now 277"
description = '''The Open Source midlife crisis, Donald Knuth The Yoda of Silicon Valley, Certbot For OpenBSD's httpd, how to upgrade FreeBSD from 11 to 12, level up your nmap game, NetBSD desktop, and more.\Headlines   \[Open Source Confronts its midlife crisis](http://dtrace.org/blogs/bmc/'''
date = "2018-12-24T16:00:00Z"
url = "https://www.bsdnow.tv/277"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.676648917Z"
seen = true
+++

The Open Source midlife crisis, Donald Knuth The Yoda of Silicon Valley, Certbot For OpenBSD's httpd, how to upgrade FreeBSD from 11 to 12, level up your nmap game, NetBSD desktop, and more.

\##Headlines  
 \###[Open Source Confronts its midlife crisis](http://dtrace.org/blogs/bmc/2018/12/14/open-source-confronts-its-midlife-crisis/)

>
>
> Midlife is tough: the idealism of youth has faded, as has inevitably some of its fitness and vigor. At the same time, the responsibilities of adulthood have grown. Making things more challenging, while you are navigating the turbulence of teenagers, your own parents are likely entering life’s twilight, needing help in new ways from their adult children. By midlife, in addition to the singular joys of life, you have also likely experienced its terrible sorrows: death, heartbreak, betrayal. Taken together, the fading of youth, the growth in responsibility and the endurance of misfortune can lead to cynicism or (worse) drastic and poorly thought-out choices. Add in a little fear of mortality and some existential dread, and you have the stuff of which midlife crises are made…  
>  I raise this not because of my own adventures at midlife, but because it is clear to me that open source — now several decades old and fully adult — is going through its own midlife crisis. This has long been in the making: for years, I (and others) have been critical of service providers’ parasitic relationship with open source, as cloud service providers turn open source software into a service offering without giving back to the communities upon which they implicitly depend. At the same time, open source has been (rightfully) entirely unsympathetic to the proprietary software models that have been burned to the ground — but also seemingly oblivious as to the larger economic waves that have buoyed them.  
>  So it seemed like only a matter of time before the companies built around open source software would have to confront their own crisis of confidence: open source business models are really tough, selling software-as-a-service is one of the most natural of them, the cloud service providers are really good at it — and their commercial appetites seem boundless. And, like a new cherry red two-seater sports car next to a minivan in a suburban driveway, some open source companies are dealing with this crisis exceptionally poorly: they are trying to restrict the way that their open source software can be used. These companies want it both ways: they want the advantages of open source — the community, the positivity, the energy, the adoption, the downloads — but they also want to enjoy the fruits of proprietary software companies in software lock-in and its monopolistic rents. If this were entirely transparent (that is, if some bits were merely being made explicitly proprietary), it would be fine: we could accept these companies as essentially proprietary software companies, albeit with an open source loss-leader. But instead, these companies are trying to license their way into this self-contradictory world: continuing to claim to be entirely open source, but perverting the license under which portions of that source are available. Most gallingly, they are doing this by hijacking open source nomenclature. Of these, the laughably named commons clause is the worst offender (it is plainly designed to be confused with the purely virtuous creative commons), but others (including CockroachDB’s Community License, MongoDB’s Server Side Public License, and Confluent’s Community License) are little better. And in particular, as it apparently needs to be said: no, “community” is not the opposite of “open source” — please stop sullying its good name by attaching it to licenses that are deliberately not open source! But even if they were more aptly named (e.g. “the restricted clause” or “the controlled use license” or — perhaps most honest of all — “the please-don’t-put-me-out-of-business-during-the-next-reInvent-keynote clause”), these licenses suffer from a serious problem: they are almost certainly asserting rights that the copyright holder doesn’t in fact have.  
>  If I sell you a book that I wrote, I can restrict your right to read it aloud for an audience, or sell a translation, or write a sequel; these restrictions are rights afforded the copyright holder. I cannot, however, tell you that you can’t put the book on the same bookshelf as that of my rival, or that you can’t read the book while flying a particular airline I dislike, or that you aren’t allowed to read the book and also work for a company that competes with mine. (Lest you think that last example absurd, that’s almost verbatim the language in the new Confluent Community (sic) License.) I personally think that none of these licenses would withstand a court challenge, but I also don’t think it will come to that: because the vendors behind these licenses will surely fear that they wouldn’t survive litigation, they will deliberately avoid inviting such challenges. In some ways, this netherworld is even worse, as the license becomes a vessel for unverifiable fear of arbitrary liability.  
>  let me put this to you as directly as possible: cloud services providers are emphatically not going to license your proprietary software. I mean, you knew that, right? The whole premise with your proprietary license is that you are finding that there is no way to compete with the operational dominance of the cloud services providers; did you really believe that those same dominant cloud services providers can’t simply reimplement your LDAP integration or whatever? The cloud services providers are currently reproprietarizing all of computing — they are making their own CPUs for crying out loud! — reimplementing the bits of your software that they need in the name of the service that their customers want (and will pay for!) won’t even move the needle in terms of their effort.  
>  Worse than all of this (and the reason why this madness needs to stop): licenses that are vague with respect to permitted use are corporate toxin. Any company that has been through an acquisition can speak of the peril of the due diligence license audit: the acquiring entity is almost always deep pocketed and (not unrelatedly) risk averse; the last thing that any company wants is for a deal to go sideways because of concern over unbounded liability to some third-party knuckle-head. So companies that engage in license tomfoolery are doing worse than merely not solving their own problem: they are potentially poisoning the wellspring of their own community.  
>  in the end, open source will survive its midlife questioning just as people in midlife get through theirs: by returning to its core values and by finding rejuvenation in its communities. Indeed, we can all find solace in the fact that while life is finite, our values and our communities survive us — and that our engagement with them is our most important legacy.
>
>

* See the article for the rest

---

\###[Donald Knuth - The Yoda of Silicon Valley](https://www.nytimes.com/2018/12/17/science/donald-knuth-computers-algorithms-programming.html)

>
>
> For half a century, the Stanford computer scientist Donald Knuth, who bears a slight resemblance to Yoda — albeit standing 6-foot-4 and wearing glasses — has reigned as the spirit-guide of the algorithmic realm.  
>  He is the author of “The Art of Computer Programming,” a continuing four-volume opus that is his life’s work. The first volume debuted in 1968, and the collected volumes (sold as a boxed set for about $250) were included by American Scientist in 2013 on its list of books that shaped the last century of science — alongside a special edition of “The Autobiography of Charles Darwin,” Tom Wolfe’s “The Right Stuff,” Rachel Carson’s “Silent Spring” and monographs by Albert Einstein, John von Neumann and Richard Feynman.  
>  With more than one million copies in print, “The Art of Computer Programming” is the Bible of its field. “Like an actual bible, it is long and comprehensive; no other book is as comprehensive,” said Peter Norvig, a director of research at Google. After 652 pages, volume one closes with a blurb on the back cover from Bill Gates: “You should definitely send me a résumé if you can read the whole thing.”  
>  The volume opens with an excerpt from “McCall’s Cookbook”:
>
>

`Here is your book, the one your thousands of letters have asked us to publish. It has taken us years to do, checking and rechecking countless recipes to bring you only the best, only the interesting, only the perfect.`

>
>
> Inside are algorithms, the recipes that feed the digital age — although, as Dr. Knuth likes to point out, algorithms can also be found on Babylonian tablets from 3,800 years ago. He is an esteemed algorithmist; his name is attached to some of the field’s most important specimens, such as the Knuth-Morris-Pratt string-searching algorithm. Devised in 1970, it finds all occurrences of a given word or pattern of letters in a text — for instance, when you hit Command+F to search for a keyword in a document.  
>  Now 80, Dr. Knuth usually dresses like the youthful geek he was when he embarked on this odyssey: long-sleeved T-shirt under a short-sleeved T-shirt, with jeans, at least at this time of year. In those early days, he worked close to the machine, writing “in the raw,” tinkering with the zeros and ones.
>
>

* See the article for the rest

---

\##News Roundup  
 \###[Let’s Encrypt: Certbot For OpenBSD’s httpd](https://dev.to/nabbisen/lets-encrypt-certbot-for-openbsds-httpd-3ofd)

* Intro

>
>
> Let’s Encrypt is “a free, automated, and open Certificate Authority”.  
>  Certbot is “an easy-to-use automatic client that fetches and deploys SSL/TLS certificates for your web server”, well known as “the official Let’s Encrypt client”.  
>  I remember well how excited I felt when I read Let’s Encrypt’s “Our First Certificate Is Now Live” in 2015.  
>  How wonderful the goal of them is; it’s to “give people the digital certificates they need in order to enable HTTPS (SSL/TLS) for websites, for free” “to create a more secure and privacy-respecting Web”!  
>  Since this year, they have begun to support even ACME v2 and Wildcard Certificate!  
>  Well, in OpenBSD as well as other operating systems, it’s easy and comfortable to have their big help 😊
>
>

* Environment
* OS: OpenBSD 6.4 amd64
* Web Server: OpenBSD’s httpd
* Certification: Let’s Encrypt with Certbot 0.27
* Reference: OpenBSD’s httpd

---

\###[FreeBSD 12 released: Here is how to upgrade FreeBSD 11 to 12](https://www.cyberciti.biz/open-source/freebsd-12-released-here-is-how-to-upgrade-freebsd/)

>
>
> The FreeBSD project announces the availability of FreeBSD 12.0-RELEASE. It is the first release of the stable/12 branch. The new version comes with updated software and features for a wild variety of architectures. The latest release provides performance improvements and better support for FreeBSD jails and more. One can benefit greatly using an upgraded version of FreeBSD.
>
>

>
>
> FreeBSD 12.0 supports amd64, i386, powerpc, powerpc64, powerpcspe, sparc64, armv6, armv7, and aarch64 architectures. One can run it on a standalone server or desktop system. Another option is to run it on Raspberry PI computer. FreeBSD 12 also runs on popular cloud service providers such as AWS EC2/Lightsail or Google compute VM.
>
>

* New features and highlights:

* OpenSSL version 1.1.1a (LTS)

* OpenSSH server 7.8p1

* Unbound server 1.8.1

* Clang and co 6.0.1

* The FreeBSD installer supports EFI+GELI as an installation option

* VIMAGE FreeBSD kernel configuration option has been enabled by default. VIMAGE was the main reason I custom compiled FreeBSD for the last few years. No more custom compile for me.

* Graphics drivers for modern ATI/AMD and Intel graphics cards are now available in the FreeBSD ports collection

* ZFS has been updated to include new sysctl(s), vfs.zfs.arc\_min\_prefetch\_ms and vfs.zfs.arc\_min\_prescient\_prefetch\_ms, which improve performance of the zpool scrub subcommand

* The pf packet filter is now usable within a jail using vnet

* KDE updated to version 5.12.5

* The NFS version 4.1 includes pNFS server support

* Perl 5.26.2

* The default PAGER now defaults to less for most commands

* The dd utility has been updated to add the status=progress option to match GNU/Linux dd command to show progress bar while running dd

* FreeBSD now supports ext4 for read/write operation

* Python 2.7

* much more

---

\###[Six Ways to Level Up Your nmap Game](https://zwischenzugs.com/2018/11/25/six-ways-to-level-up-your-nmap-game/)

>
>
> nmap is a network exploration tool and security / port scanner.  
>  If you’ve heard of it, and you’re like me, you’ve most likely used it like this:  
>  ie, you’ve pointed it at an IP address and observed the output which tells you the open ports on a host.  
>  I used nmap like this for years, but only recently grokked the manual to see what else it could do. Here’s a quick look and some of the more useful things I found out.
>
>

* 1. Scan a Network

* 1. Scan All Ports

* 1. Get service versions

* 1. Use -A for more data

* 1. Find out what nmap is up to

* 1. Script your own scans with NSE

---

\###[NetBSD Desktop]

* [Part 1: Manual NetBSD installation on GPT/UEFI](https://unitedbsd.com/t/netbsd-desktop-part-1-manual-netbsd-installation-on-gpt-uefi/284)
* [NetBSD desktop pt.2: Set up wireless networking on NetBSD with wpa\_supplicant and dhcpcd](https://unitedbsd.com/t/netbsd-desktop-pt-2-set-up-wireless-networking-on-netbsd-with-wpa-supplicant-and-dhcpcd/281)
* [Part 3: Simple stateful firewall with NPF](https://unitedbsd.com/t/netbsd-desktop-pt-3-simple-stateful-firewall-with-npf/286)
* [Part 4: 4: The X Display Manager (XDM)](https://unitedbsd.com/t/netbsd-desktop-pt-4-the-x-display-manager-xdm/292)
* [Part 5: automounting with Berkeley am-utils](https://unitedbsd.com/t/netbsd-desktop-pt-5-automounting-with-berkeley-am-utils/294/3)

---

\##Beastie Bits

* [Call For Testing: ZFS on FreeBSD Project](https://lists.freebsd.org/pipermail/freebsd-current/2018-December/072422.html)
* [DragonFlyBSD 5.4.1 release within a week](https://www.dragonflydigest.com/2018/12/18/22223.html)
* [You Can’t Opt Out of the Patent System. That’s Why Patent Pandas Was Created!](https://www.bunniestudios.com/blog/?p=5421)
* [Announcing Yggdrasil Network v0.3](https://yggdrasil-network.github.io/2018/12/12/announcing-v0-3.html)
* [OpenBSD Network Engineer Job listing](https://www.ziprecruiter.com/c/The-Good-Seed/Job/OpenBSD-Network-Engineer/-in-Los-Angeles,CA?jobid=35a52212-57d4d705)
* [FreeBSD 12.0 Stable Version Released!](https://itsfoss.com/freebsd-12-release/)
* [LibreSSL 2.9.0 released](http://bsdsec.net/articles/libressl-2-9-0-released)
* [Live stream test: Sgi Octane light bar repair / soldering!](https://www.youtube.com/watch?v=Nq8sLqtzCEQ)
* [Configure a FreeBSD Email Server Using Postfix, Dovecot, MySQL, DAVICAL and SpamAssassin](https://www.sophimail.com/configure-freebsd-email-server-using-postfix-dovecot-mysql-spamassassin/)
* [Berkeley smorgasbord](http://blog.obligd.com/posts/berkeley-smorgasbord.html)
* [FOSDEM BSD Devroom schedule](https://fosdem.org/2019/schedule/track/bsd/)

---

\##Feedback/Questions

* Warren - [Ep.273: OpenZFS on OS X](http://dpaste.com/1V1XS01#wrap)
* cogoman - [tarsnap security and using SSDs in raid](http://dpaste.com/0P0MWFC#wrap)
* Andrew - [Portland BSD Pizza Night](http://dpaste.com/3H9M5M0)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---