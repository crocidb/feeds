+++
title = "288: Turing Complete Sed"
description = 'Software will never fix Spectre-type bugs, a proof that sed is Turing complete, managed jails using Bastille, new version of netdata, using grep with /dev/null, using GMail with mutt, and more.\Headlines   \[Google: Software is never going to be able to fix Spectre-type bugs'
date = "2019-03-07T15:00:00Z"
url = "https://www.bsdnow.tv/288"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.656117643Z"
seen = true
+++

Software will never fix Spectre-type bugs, a proof that sed is Turing complete, managed jails using Bastille, new version of netdata, using grep with /dev/null, using GMail with mutt, and more.

\##Headlines  
 \###[Google: Software is never going to be able to fix Spectre-type bugs](https://arstechnica.com/gadgets/2019/02/google-software-is-never-going-to-be-able-to-fix-spectre-type-bugs/)

* [Spectre is here to stay: An analysis of side-channels and speculative execution](https://arxiv.org/pdf/1902.05178.pdf)

>
>
> Researchers from Google investigating the scope and impact of the Spectre attack have published a paper asserting that Spectre-like vulnerabilities are likely to be a continued feature of processors and, further, that software-based techniques for protecting against them will impose a high performance cost. And whatever the cost, the researchers continue, the software will be inadequate—some Spectre flaws don’t appear to have any effective software-based defense. As such, Spectre is going to be a continued feature of the computing landscape, with no straightforward resolution.  
>  The discovery and development of the Meltdown and Spectre attacks was undoubtedly the big security story of 2018. First revealed last January, new variants and related discoveries were made throughout the rest of the year. Both attacks rely on discrepancies between the theoretical architectural behavior of a processor—the documented behavior that programmers depend on and write their programs against—and the real behavior of implementations.  
>  Specifically, modern processors all perform speculative execution; they make assumptions about, for example, a value being read from memory or whether an if condition is true or false, and they allow their execution to run ahead based on these assumptions. If the assumptions are correct, the speculated results are kept; if it isn’t, the speculated results are discarded and the processor redoes the calculation. Speculative execution is not an architectural feature of the processor; it’s a feature of implementations, and so it’s supposed to be entirely invisible to running programs. When the processor discards the bad speculation, it should be as if the speculation never even happened.
>
>

---

\###[A proof that Unix utility sed is Turing complete](https://catonmat.net/proof-that-sed-is-turing-complete)

>
>
> Many people are surprised when they hear that sed is Turing complete. How come a text filtering program is Turing complete, they wonder. Turns out sed is a tiny assembly language that has a comparison operation, a branching operation and a temporary buffer. These operations make sed Turing complete.  
>  I first learned about this from Christophe Blaess. His proof is by construction – he wrote a Turing machine in sed (download turing.sed). As any programming language that can implement a Turing machine is Turing complete we must conclude that sed is also Turing complete.  
>  Christophe offers his own introduction to Turing machines and a description of how his sed implementation works in his article Implementation of a Turing Machine as a sed Script.
>
>

>
>
> Christophe isn’t the first person to realize that sed is almost a general purpose programming language. People have written tetris, sokoban and many other programs in sed. Take a look at these:
>
>

* [Tetris](https://catonmat.net/ftp/sed/sedtris.sed)
* [Sokoban (game)](https://catonmat.net/ftp/sed/sokoban.sed)
* [Calculator](https://catonmat.net/ftp/sed/dc.sed)

---

\##News Roundup  
 \###[Bastille helps you quickly create and manage FreeBSD Jails.](https://bastillebsd.org/)

>
>
> Bastille helps you quickly create and manage FreeBSD Jails.  
>  Jails are extremely lightweight containers that provide a full-featured UNIX-like operating system inside. These containers can be used for software development, rapid testing, and secure production Internet services.  
>  Bastille provides an interface to create, manage and destroy these secure virtualized environments.
>
>

* Current version: 0.3.20190204-beta.
* Shell Script Source here: [https://github.com/BastilleBSD/bastille/blob/master/usr/local/bin/bastille](https://github.com/BastilleBSD/bastille/blob/master/usr/local/bin/bastille)

---

\###[netdata v1.12 released](https://github.com/netdata/netdata/releases)

>
>
> Netdata is distributed, real-time, performance and health monitoring for systems and applications. It is a highly optimized monitoring agent you install on all your systems and containers.  
>  Netdata provides unparalleled insights, in real-time, of everything happening on the systems it runs (including web servers, databases, applications), using highly interactive web dashboards. It can run autonomously, without any third party components, or it can be integrated to existing monitoring tool chains (Prometheus, Graphite, OpenTSDB, Kafka, Grafana, etc).  
>  Netdata is fast and efficient, designed to permanently run on all systems (physical & virtual servers, containers, IoT devices), without disrupting their core function.
>
>

* Patch release 1.12.1 contains 22 bug fixes and 8 improvements.

---

\###[Using grep with /dev/null, an old Unix trick](https://utcc.utoronto.ca/~cks/space/blog/unix/GrepDevNull)

>
>
> Every so often I will find myself writing a grep invocation like this:
>
>

`find .... -exec grep <something> /dev/null '{}' '+'`

>
>
> The peculiar presence of /dev/null here is an old Unix trick that is designed to force grep to always print out file names, even if your find only matches one file, by always insuring that grep has at least two files as arguments. You can wind up wanting to do the same thing with a direct use of grep if you’re not certain how many files your wildcard may match.
>
>

---

\###[USING GMAIL WITH MUTT](https://smalldata.tech/blog/2016/09/10/gmail-with-mutt)

>
>
> I recently switched to using mutt for email and while setting up mutt to use imap is pretty straightforward, this tutorial will also document some advanced concepts such as encrypting your account password and sending emails from a different From address.  
>  This tutorial assumes that you have some familiarity with using mutt and have installed it with sidebar support (sudo apt-get install mutt-patched for the ubuntu folks) and are comfortable with editing your muttrc.  
>  If you would just like to skip to the end, my mutt configuration file can be found [here](https://github.com/wheresvic/vic-config/blob/master/mutt/muttrc).
>
>

---

\##Beastie Bits

* [An Extensive UNIX Timeline](https://www.levenez.com/unix/)
* [Garbage.fm - OEF](https://garbage.fm/episodes/47)
* [brk() to sbrk()](https://www.dragonflydigest.com/2019/02/22/22586.html)
* [Fred models, found again](https://www.dragonflydigest.com/2019/02/20/22566.html)
* [Kafe: Can OS Kernels Forward Packets Fast Enough for Software Routers?](https://ieeexplore.ieee.org/document/8541105)
* [ARPANET: Celebrating 50 Years Since “LO”](https://meetings.aaas.org/arpanet-livestream/)

---

\##Feedback/Questions

* Pablo - [Topic suggestion: FreeBSD on a Laptop as daily driver](http://dpaste.com/2BXMP7M)
* Ron - [ZFS on the fly compression and seek](http://dpaste.com/16Y2HSR#wrap)
* Dave - [two zpool, or not two zpool, that is the question](http://dpaste.com/123AANV#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

 Your browser does not support the HTML5 video tag.