+++
title = "315: Recapping vBSDcon 2019"
description = "vBSDcon 2019 recap, Unix at 50, OpenBSD on fan-less Tuxedo InfinityBook, humungus - an hg server, how to configure a network dump in FreeBSD, and more.HeadlinesvBSDcon Recap Allan and Benedict attended vBSDcon 2019, which ended last week.It was held again at the "
date = "2019-09-12T05:45:00Z"
url = "https://www.bsdnow.tv/315"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.605459562Z"
seen = false
+++

vBSDcon 2019 recap, Unix at 50, OpenBSD on fan-less Tuxedo InfinityBook, humungus - an hg server, how to configure a network dump in FreeBSD, and more.

Headlines
----------

### vBSDcon Recap ###

Allan and Benedict attended vBSDcon 2019, which ended last week.

It was held again at the Hyatt Regency Reston and the main conference was organized by Dan Langille of BSDCan fame.The two day conference was preceded by a one day FreeBSD hackathon, where FreeBSD developers had the chance to work on patches and PRs. In the evening, a reception was held to welcome attendees and give them a chance to chat and get to know each other over food and drinks.

The first day of the conference was opened with a Keynote by Paul Vixie about DNS over HTTPS (DoH). He explained how we got to the current state and what challenges (technical and social) this entails.

* If you missed this talk and are dying to see it, it will also be presented at EuroBSDCon next week

John Baldwin followed up by giving an overview of the work on “In-Kernel TLS Framing and Encryption for FreeBSD” [abstract](https://www.vbsdcon.com/schedule/2019-09-06.html#talk:132615) and the recent commit we covered in episode 313.

Meanwhile, Brian Callahan was giving a separate session in another room about “Learning to (Open)BSD through its porting system: an attendee-driven educational session” where people had the chance to learn about how to create ports for the BSDs.

David Fullard’s talk about “Transitioning from FreeNAS to FreeBSD” was his first talk at a BSD conference and described how he built his own home NAS setup trying to replicate FreeNAS’ functionality on FreeBSD, and why he transitioned from using an appliance to using vanilla FreeBSD.

Shawn Webb followed with his overview talk about the “State of the Hardened Union”.

Benedict’s talk about “Replacing an Oracle Server with FreeBSD, OpenZFS, and PostgreSQL” was well received as people are interested in how we liberated ourselves from the clutches of Oracle without compromising functionality.

Entertaining and educational at the same time, Michael W. Lucas talk about “Twenty Years in Jail: FreeBSD Jails, Then and Now” closed the first day. Lucas also had a table in the hallway with his various tech and non-tech books for sale.

People formed small groups and went into town for dinner. Some returned later that night to some work in the hacker lounge or talk amongst fellow BSD enthusiasts.

Colin Percival was the keynote speaker for the second day and had an in-depth look at “23 years of software side channel attacks”.

Allan reprised his “ELI5: ZFS Caching” talk explaining how the ZFS adaptive replacement cache (ARC) work and how it can be tuned for various workloads.

“By the numbers: ZFS Performance Results from Six Operating Systems and Their Derivatives” by Michael Dexter followed with his approach to benchmarking OpenZFS on various platforms.

Conor Beh was also a new speaker to vBSDcon. His talk was about “FreeBSD at Work: Building Network and Storage Infrastructure with pfSense and FreeNAS”.

Two OpenBSD talks closed the talk session: Kurt Mosiejczuk with “Care and Feeding of OpenBSD Porters” and Aaron Poffenberger with “Road Warrior Disaster Recovery: Secure, Synchronized, and Backed-up”.

A dinner and reception was enjoyed by the attendees and gave more time to discuss the talks given and other things until late at night.

We want to thank the vBSDcon organizers and especially Dan Langille for running such a great conference. We are grateful to Verisign as the main sponsor and The FreeBSD Foundation for sponsoring the tote bags. Thanks to all the speakers and attendees!

### [humungus - an hg server](https://humungus.tedunangst.com/r/humungus) ###

* Features
  * View changes, files, changesets, etc. Some syntax highlighting.
  * Read only.
  * Serves multiple repositories.
  * Allows cloning via the obvious URL. Supports go get.
  * Serves files for downloads.
  * Online documentation via mandoc.
  * Terminal based admin interface.

---

News Roundup
----------

### [OpenBSD on fan-less Tuxedo InfinityBook 14″ v2.](https://hazardous.org/archive/blog/openbsd/2019/09/02/OpenBSD-on-Infinitybook14) ###

>
>
> The InfinityBook 14” v2 is a fanless 14” notebook. It is an excellent choice for running OpenBSD - but order it with the supported wireless card (see below.).
>
>
>
> I’ve set it up in a dual-boot configuration so that I can switch between Linux and OpenBSD - mainly to spot differences in the drivers. TUXEDO allows a variety of configurations through their webshop.
>
>
>
> The dual boot setup with grub2 and EFI boot will be covered in a separate blogpost. My tests were done with OpenBSD-current - which is as of writing flagged as 6.6-beta.
>
>

* See Article for breakdown of CPU, Wireless, Video, Webcam, Audio, ACPI, Battery, Touchpad, and MicroSD Card Reader

---

### [Unix at 50: How the OS that powered smartphones started from failure](https://arstechnica.com/gadgets/2019/08/unix-at-50-it-starts-with-a-mainframe-a-gator-and-three-dedicated-researchers/) ###

>
>
> Maybe its pervasiveness has long obscured its origins. But Unix, the operating system that in one derivative or another powers nearly all smartphones sold worldwide, was born 50 years ago from the failure of an ambitious project that involved titans like Bell Labs, GE, and MIT. Largely the brainchild of a few programmers at Bell Labs, the unlikely story of Unix begins with a meeting on the top floor of an otherwise unremarkable annex at the sprawling Bell Labs complex in Murray Hill, New Jersey.
>
>
>
> It was a bright, cold Monday, the last day of March 1969, and the computer sciences department was hosting distinguished guests: Bill Baker, a Bell Labs vice president, and Ed David, the director of research. Baker was about to pull the plug on Multics (a condensed form of MULTiplexed Information and Computing Service), a software project that the computer sciences department had been working on for four years. Multics was two years overdue, way over budget, and functional only in the loosest possible understanding of the term.
>
>
>
> Trying to put the best spin possible on what was clearly an abject failure, Baker gave a speech in which he claimed that Bell Labs had accomplished everything it was trying to accomplish in Multics and that they no longer needed to work on the project. As Berk Tague, a staffer present at the meeting, later told Princeton University, “Like Vietnam, he declared victory and got out of Multics.”
>
>
>
> Within the department, this announcement was hardly unexpected. The programmers were acutely aware of the various issues with both the scope of the project and the computer they had been asked to build it for.
>
>
>
> Still, it was something to work on, and as long as Bell Labs was working on Multics, they would also have a $7 million mainframe computer to play around with in their spare time. Dennis Ritchie, one of the programmers working on Multics, later said they all felt some stake in the success of the project, even though they knew the odds of that success were exceedingly remote.
>
>
>
> Cancellation of Multics meant the end of the only project that the programmers in the Computer science department had to work on—and it also meant the loss of the only computer in the Computer science department. After the GE 645 mainframe was taken apart and hauled off, the computer science department’s resources were reduced to little more than office supplies and a few terminals.
>
>

* Some of Allan’s favourite excerpts:

>
>
> In the early '60s, Bill Ninke, a researcher in acoustics, had demonstrated a rudimentary graphical user interface with a DEC PDP-7 minicomputer. Acoustics still had that computer, but they weren’t using it and had stuck it somewhere out of the way up on the sixth floor.
>
>
>
> And so Thompson, an indefatigable explorer of the labs’ nooks and crannies, finally found that PDP-7 shortly after Davis and Baker cancelled Multics.
>
>
>
> With the rest of the team’s help, Thompson bundled up the various pieces of the PDP-7—a machine about the size of a refrigerator, not counting the terminal—moved it into a closet assigned to the acoustics department, and got it up and running. One way or another, they convinced acoustics to provide space for the computer and also to pay for the not infrequent repairs to it out of that department’s budget.
>
>
>
> McIlroy’s programmers suddenly had a computer, kind of. So during the summer of 1969, Thompson, Ritchie, and Canaday hashed out the basics of a file manager that would run on the PDP-7. This was no simple task. Batch computing—running programs one after the other—rarely required that a computer be able to permanently store information, and many mainframes did not have any permanent storage device (whether a tape or a hard disk) attached to them. But the time-sharing environment that these programmers had fallen in love with required attached storage. And with multiple users connected to the same computer at the same time, the file manager had to be written well enough to keep one user’s files from being written over another user’s. When a file was read, the output from that file had to be sent to the user that was opening it.
>
>
>
> It was a challenge that McIlroy’s team was willing to accept. They had seen the future of computing and wanted to explore it. They knew that Multics was a dead-end, but they had discovered the possibilities opened up by shared development, shared access, and real-time computing. Twenty years later, Ritchie characterized it for Princeton as such: “What we wanted to preserve was not just a good environment in which to do programming, but a system around which a fellowship could form.”
>
>
>
> Eventually when they had the file management system more or less fleshed out conceptually, it came time to actually write the code. The trio—all of whom had terrible handwriting—decided to use the Labs’ dictating service. One of them called up a lab extension and dictated the entire code base into a tape recorder. And thus, some unidentified clerical worker or workers soon had the unenviable task of trying to convert that into a typewritten document.
>
>
>
> Of course, it was done imperfectly. Among various errors, “inode” came back as “eye node,” but the output was still viewed as a decided improvement over their assorted scribbles.
>
>
>
> In August 1969, Thompson’s wife and son went on a three-week vacation to see her family out in Berkeley, and Thompson decided to spend that time writing an assembler, a file editor, and a kernel to manage the PDP-7 processor. This would turn the group’s file manager into a full-fledged operating system. He generously allocated himself one week for each task.
>
>
>
> Thompson finished his tasks more or less on schedule. And by September, the computer science department at Bell Labs had an operating system running on a PDP-7—and it wasn’t Multics.
>
>
>
> By the summer of 1970, the team had attached a tape drive to the PDP-7, and their blossoming OS also had a growing selection of tools for programmers (several of which persist down to this day). But despite the successes, Thompson, Canaday, and Ritchie were still being rebuffed by labs management in their efforts to get a brand-new computer.
>
>
>
> It wasn’t until late 1971 that the computer science department got a truly modern computer. The Unix team had developed several tools designed to automatically format text files for printing over the past year or so. They had done so to simplify the production of documentation for their pet project, but their tools had escaped and were being used by several researchers elsewhere on the top floor. At the same time, the legal department was prepared to spend a fortune on a mainframe program called “AstroText.” Catching wind of this, the Unix crew realized that they could, with only a little effort, upgrade the tools they had written for their own use into something that the legal department could use to prepare patent applications.
>
>
>
> The computer science department pitched lab management on the purchase of a DEC PDP-11 for document production purposes, and Max Mathews offered to pay for the machine out of the acoustics department budget. Finally, management gave in and purchased a computer for the Unix team to play with. Eventually, word leaked out about this operating system, and businesses and institutions with PDP-11s began contacting Bell Labs about their new operating system. The Labs made it available for free—requesting only the cost of postage and media from anyone who wanted a copy.
>
>
>
> The rest has quite literally made tech history.
>
>

* See the link for the rest of the article

---

### [How to configure a network dump in FreeBSD?](https://www.oshogbo.vexillium.org/blog/68/) ###

>
>
> A network dump might be very useful for collecting kernel crash dumps from embedded machines and machines with a larger amount of RAM then available swap partition size. Besides net dumps we can also try to compress the core dump. However, often this may still not be enough swap to keep whole core dump. In such situation using network dump is a convenient and reliable way for collecting kernel dump.
>
>
>
> So, first, let’s talk a little bit about history. The first implementation of the network dumps was implemented around 2000 for the FreeBSD 4.x as a kernel module. The code was implemented in 2010 with the intention of being part of FreeBSD 9.0. However, the code never landed in FreeBSD. Finally, in 2018 with the commit r333283 by Mark Johnston the netdump client code landed in the FreeBSD. Subsequently, many other commitments were then implemented to add support for the different drivers (for example r333289). The first official release of FreeBSD, which support netdump is FreeBSD 12.0.
>
>
>
> Now, let’s get back to the main topic. How to configure the network dump? Two machines are needed. One machine is to collect core dump, let’s call it server. We will use the second one to send us the core dump - the client.
>
>

* See the link for the rest of the article

---

Beastie Bits
----------

* [Sudo Mastery 2nd edition is not out](https://mwl.io/archives/4530)
* [Empirical Notes on the Interaction Between Continuous Kernel Fuzzing and Development](http://users.utu.fi/kakrind/publications/19/vulnfuzz_camera.pdf)
* [soso](https://github.com/ozkl/soso)
* [GregKH - OpenBSD was right](https://youtu.be/gUqcMs0svNU?t=254)
* [Game of Trees](https://gameoftrees.org/faq.html)

---

Feedback/Questions
----------

* BostJan - [Another Question](http://dpaste.com/1ZPCCQY#wrap)
* Tom - [PF](http://dpaste.com/3ZSCB8N#wrap)
* JohnnyK - [Changing VT without keys](http://dpaste.com/3QZQ7Q5#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---
 Your browser does not support the HTML5 video tag.