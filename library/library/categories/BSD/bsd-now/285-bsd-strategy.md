+++
title = "285: BSD Strategy"
description = 'Strategic thinking to keep FreeBSD relevant, reflecting on the soul of a new machine, 10GbE Benchmarks On Nine Linux Distros and FreeBSD, NetBSD integrating LLVM sanitizers in base, FreeNAS 11.2 distrowatch review, and more.\Headlines   \[Strategic thinking, or what I think '
date = "2019-02-14T15:00:00Z"
url = "https://www.bsdnow.tv/285"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.661720529Z"
seen = true
+++

Strategic thinking to keep FreeBSD relevant, reflecting on the soul of a new machine, 10GbE Benchmarks On Nine Linux Distros and FreeBSD, NetBSD integrating LLVM sanitizers in base, FreeNAS 11.2 distrowatch review, and more.

\##Headlines  
 \###[Strategic thinking, or what I think what we need to do to keep FreeBSD relevant](http://www.leidinger.net/blog/2019/01/27/strategic-thinking-or-what-i-think-what-we-need-to-do-to-keep-freebsd-relevant/)

>
>
> Since I participate in the FreeBSD project there are from time to time some voices which say FreeBSD is dead, Linux is the way to go. Most of the time those voices are trolls, or people which do not really know what FreeBSD has to offer. Sometimes those voices wear blinders, they only see their own little world (were Linux just works fine) and do not see the big picture (like e.g. competition stimulates business, …) or even dare to look what FreeBSD has to offer.  
>  Sometimes those voices raise a valid concern, and it is up to the FreeBSD project to filter out what would be beneficial. Recently there were some mails on the FreeBSD lists in the sense of “What about going into direction X?”. Some people just had the opinion that we should stay where we are. In my opinion this is similarly bad to blindly saying FreeBSD is dead and following the masses. It would mean stagnation. We should not hold people back in exploring new / different directions. Someone wants to write a kernel module in (a subset of) C++ or in Rust… well, go ahead, give it a try, we can put it into the Ports Collection and let people get experience with it.  
>  This discussion on the mailinglists also triggered some kind of “where do we see us in the next years” / strategic thinking reflection. What I present here, is my very own opinion about things we in the FreeBSD project should look at, to stay relevant in the long term. To be able to put that into scope, I need to clarify what “relevant” means in this case.  
>  FreeBSD is currently used by companies like Netflix, NetApp, Cisco, Juniper, and many others as a base for products or services. It is also used by end‐users as a work‐horse (e.g. mailservers, webservers, …). Staying relevant means in this context, to provide something which the user base is interested in to use and which makes it more easy / fast for the user base to deliver whatever they want or need to deliver than with another kind of system. And this in terms of time to market of a solution (time to deliver a service like a web‐/mail‐/whatever‐server or product), and in terms of performance (which not only means speed, but also security and reliability and …) of the solution.  
>  I have categorized the list of items I think are important into (new) code/features, docs, polishing and project infrastructure. Links in the following usually point to documentation/HOWTOs/experiences for/with FreeBSD, and not to the canonical entry points of the projects or technologies. In a few cases the links point to an explanation in the wikipedia or to the website of the topic in question.
>
>

---

\###[Reflecting on The Soul of a New Machine](http://dtrace.org/blogs/bmc/2019/02/10/reflecting-on-the-soul-of-a-new-machine/)

>
>
> Long ago as an undergraduate, I found myself back home on a break from school, bored and with eyes wandering idly across a family bookshelf. At school, I had started to find a calling in computing systems, and now in the den, an old book suddenly caught my eye: Tracy Kidder’s The Soul of a New Machine. Taking it off the shelf, the book grabbed me from its first descriptions of Tom West, captivating me with the epic tale of the development of the Eagle at Data General. I — like so many before and after me — found the book to be life changing: by telling the stories of the people behind the machine, the book showed the creative passion among engineers that might otherwise appear anodyne, inspiring me to chart a course that might one day allow me to make a similar mark.  
>  Since reading it over two decades ago, I have recommended The Soul of a Machine at essentially every opportunity, believing that it is a part of computing’s literary foundation — that it should be considered our Odyssey. Recently, I suggested it as beach reading to Jess Frazelle, and apparently with perfect timing: when I saw the book at the top of her vacation pile, I knew a fuse had been lit. I was delighted (though not at all surprised) to see Jess livetweet her admiration of the book, starting with the compelling prose, the lucid technical explanations and the visceral anecdotes — but then moving on to the deeper technical inspiration she found in the book. And as she reached the book’s crescendo, Jess felt its full power, causing her to reflect on the nature of engineering motivation.  
>  Excited to see the effect of the book on Jess, I experienced a kind of reflected recommendation: I was inspired to (re-)read my own recommendation! Shortly after I started reading, I began to realize that (contrary to what I had been telling myself over the years!) I had not re-read the book in full since that first reading so many years ago. Rather, over the years I had merely revisited those sections that I remembered fondly. On the one hand, these sections are singular: the saga of engineers debugging a nasty I-cache data corruption issue; the young engineer who implements the simulator in an impossibly short amount of time because no one wanted to tell him that he was being impossibly ambitious; the engineer who, frustrated with a nanosecond-scale timing problem in the ALU that he designed, moved to a commune in Vermont, claiming a desire to deal with “no unit of time shorter than a season”. But by limiting myself to these passages, I was succumbing to the selection bias of my much younger self; re-reading the book now from start to finish has given new parts depth and meaning. Aspects that were more abstract to me as an undergraduate — from the organizational rivalries and absurdities of the industry to the complexities of West’s character and the tribulations of the team down the stretch — are now deeply evocative of concrete episodes of my own career.
>
>

* See Article for rest…

---

\##News Roundup

\###[Out-Of-The-Box 10GbE Network Benchmarks On Nine Linux Distributions Plus FreeBSD 12](https://www.phoronix.com/scan.php?page=article&item=10gbe-linux-freebsd12&num=1)

>
>
> Last week I started running some fresh 10GbE Linux networking performance benchmarks across a few different Linux distributions. That testing has now been extended to cover nine Linux distributions plus FreeBSD 12.0 to compare the out-of-the-box networking performance.  
>  Tested this round alongside FreeBSD 12.0 was Antergos 19.1, CentOS 7, Clear Linux, Debian 9.6, Fedora Server 29, openSUSE Leap 15.0, openSUSE Tumbleweed, Ubuntu 18.04.1 LTS, and Ubuntu 18.10.  
>  All of the tests were done with a Tyan S7106 1U server featuring two Intel Xeon Gold 6138 CPUs, 96GB of DDR4 system memory, and Samsung 970 EVO SSD. For the 10GbE connectivity on this server was an add-in HP NC523SFP PCIe adapter providing two 10Gb SPF+ ports using a QLogic 8214 controller.  
>  Originally the plan as well was to include Windows Server 2016/2019. Unfortunately the QLogic driver download site was malfunctioning since Cavium’s acquisition of the company and the other Windows Server 2016 driver options not panning out and there not being a Windows Server 2019 option. So sadly that Windows testing was thwarted so I since started testing over with a Mellanox Connectx-2 10GbE NIC, which is well supported on Windows Server and so that testing is ongoing for the next article of Windows vs. Linux 10 Gigabit network performance plus some “tuned” Linux networking results too.
>
>

---

\###[Integration of the LLVM sanitizers with the NetBSD base system](https://blog.netbsd.org/tnf/entry/integration_of_the_llvm_sanitziers)

>
>
> Over the past month I’ve merged the LLVM compiler-rt sanitizers (LLVM svn r350590) with the base system. I’ve also managed to get a functional set of Makefile rules to build all of them, namely:  
>  ASan, UBSan, TSan, MSan, libFuzzer, SafeStack, XRay.  
>  In all supported variations and modes that are supported by the original LLVM compiler-rt package.
>
>

---

\###[Distrowatch FreeNAS 11.2 review](https://distrowatch.com/weekly.php?issue=20190204#freenas)

>
>
> The project’s latest release is FreeNAS 11.2 and, at first, I nearly overlooked the new version because it appeared to be a minor point release. However, a lot of work went into the new version and 11.2 offers a lot of changes when compared next to 11.1, “including a major revamp of the web interface, support for self-encrypting drives, and new, backwards-compatible REST and WebSocket APIs. This update also introduces iocage for improved plugins and jails management and simplified plugin development.”
>
>

---

\##Beastie Bits

* [Instructions for installing rEFInd to dual boot a computer with FreeBSD and windows (and possibly other OSes as well).](https://gist.github.com/zeising/5d2402d92b4cf421c7402d663b2d9e41)
* [NetBSD desktop pt.6: “vi(1) editor, tmux and unicode $TERM”](https://www.unitedbsd.com/d/12-netbsd-desktop-pt-6-vi1-editor-tmux-and-unicode-term)
* [Unix flowers](https://www.geekrant.org/2005/04/01/unix-flowers/)
* [FreeBSD upgrade procedure using GPT](https://oshogbo.vexillium.org/blog/62/)
* [Pull-based Backups using OpenBSD base\*](https://chargen.one/steve/backups-on-chargen-one)
* [Developing WireGuard for NetBSD](https://github.com/ozaki-r/netbsd-src/tree/wireguard)
* [OpenZFS User Conference, April 18-19, Norwalk CT](https://zfs.datto.com/)
* [KnoxBug Feb 25th](http://knoxbug.org/2019-02-25)

---

\##Feedback/Questions

* Jake - [C Programming](http://dpaste.com/3X7KVVX#wrap)
* Farhan - [Explanation of rtadvd](http://dpaste.com/067WW0P)
* Nelson - [Bug Bounties on Open-Source Software](http://dpaste.com/2BYGFSV)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---