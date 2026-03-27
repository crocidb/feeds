+++
title = "198: BSDNorth or You can’t handle the libtruth"
description = "This episode gives you the full dose of BSDCan 2017 recap as well as a blog post on conference speaking advice.HeadlinesPre-conference activities: Goat BoF, FreeBSD Foundation Board Meeting, and FreeBSD Journal Editorial Board Meeting * The FreeBSD Foundation has"
date = "2017-06-14T15:00:00Z"
url = "https://www.bsdnow.tv/198"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.887791235Z"
seen = false
+++

This episode gives you the full dose of BSDCan 2017 recap as well as a blog post on conference speaking advice.

Headlines
----------

### Pre-conference activities: Goat BoF, FreeBSD Foundation Board Meeting, and FreeBSD Journal Editorial Board Meeting ###

* The FreeBSD Foundation has a new President as Justin Gibbs is busy this year with building a house, so George Neville-Neil took up the task to serve as President, with Justin Gibbs as Secretary. Take a look at the updated [Board of Directors](https://www.freebsdfoundation.org/about/board-of-directors/).  

* We also have a new [staff member](https://www.freebsdfoundation.org/about/staff/): Scott Lamons joined the Foundation team as senior program manager.

>
>
> Scott’s work for the Foundation will focus on managing and evangelizing programs for advanced technologies in FreeBSD including preparing project plans, coordinating resources, and facilitating interactions between commercial vendors, the Foundation, and the FreeBSD community.
>
>

* The Foundation also planned various future activities, visits of upcoming conferences, and finding new ways to support and engage the community.
* The Foundation now has interns in the form of co-op students from the University of Waterloo, Canada. This is described further in the [May 2017 Development Projects Update](https://www.freebsdfoundation.org/blog/may-2017-development-projects-update/). Both students (Siva and Charlie) were also the conference, helping out at the Foundation table, demonstrating the tinderbox dashboard. Follow the [detailed instructions](https://www.freebsdfoundation.org/news-and-events/blog/blog-post/building-a-physical-freebsd-build-status-dashboard/) to build one of your own.
* The Foundation put out a [call for Project Proposal Solicitation for 2017](https://www.freebsdfoundation.org/blog/freebsd-foundation-2017-project-proposal-solicitation/). If you think you have a good proposal for work relating to any of the major subsystems or infrastructure for FreeBSD, we’d be happy to review it.
* Don’t miss the deadlines for travel grants to some of the upcoming conferences. You can find the necessary forms and deadlines at the [Travel Grant page](https://www.freebsdfoundation.org/what-we-do/travel-grants/travel-grants/) on the Foundation website.

* Pictures from the Goat BoF can be found on [Keltia.net](<https://assets.keltia.net/photos/BSDCan-2017/Royal Oak/index.html>)

* Overlapping with the GoatBoF, members of the FreeBSD Journal editorial board met in a conference room in the Novotel to plan the upcoming issues. Topics were found, authors identified, and new content was discussed to appeal to even more readers. Check out the [FreeBSD Journal website](https://www.freebsdfoundation.org/journal/) and subscribe if you like to support the Foundation in that way.

  ---

### [FreeBSD Devsummit Day 1 & 2](https://wiki.freebsd.org/DevSummit/201706) ###

* The first day of the Devsummit began with introductory slides by Gordon Tetlow, who organized the devsummit very well.
* Benno Rice of the FreeBSD core team presented the work done on the new Code of Conduct, which will become effective soon. A round of Q&A followed, with positive feedback from the other devsummit attendees supporting the new CoC.
* After that, Allan Jude joined to talk about the new [FreeBSD Community Proposal (FCP)](https://github.com/freebsd/fcp) process. Modelled after IETF RFCs, Joyent RFDs, and Python PEP, it is a new way for the project to reach consensus on the design or implementation of new features or processes. The FCP repo contains FCP#0 that describes the process, and a template for writing a proposal.
* Then, the entire core team (except John Baldwin, who could not make it this year) and core secretary held a core Q&A session, Answering questions, gathering feedback and suggestions.  

* After the coffee break, we had a presentation about Intel’s QAT integration in FreeBSD.
* When the lunch was over, people spread out into working groups about BearSSL, Transport (TCP/IP), and OpenZFS.
* [OpenZFS working group](https://pbs.twimg.com/media/DBu_IMsWAAId2sN.jpg:large):
  * Matt Ahrens lead the group, and spent most of the first session providing a status update about what features have been recently committed, are out for review, on the horizon, or in the design phase.

* **Existing Features**
  * Compressed ARC
  * Compressed Send/Recv
  * **Recently Upstreamed**
  * A recent commit improved RAID-Z write speeds by declaring writes to padding blocks to be optional, and to always write them if they can be aggregated with the next write. Mostly impacts large record sizes.
  * ABD (ARC buffer scatter/gather)

* **Upstreaming In Progress**
  * Native Encryption
  * Channel Programs
  * Device Removal (Mirrors and Stripes)
  * Redacted Send/recv
  * Native TRIM Support (FreeBSD has its own, but this is better and applies to all ZFS implementations)
  * Faster (mostly sequential) scrub/resilver
  * DRAID (A great deal of time was spent explaining how this works, with diagrams on the chalk board)
  * vdev metadata classes (store metadata on SSDs with data is on HDDs, or similar setups. Could also be modified to do dedup to SSD)
  * Multi-mount protection (“safe import”, for dual-headed storage shelves)
  * zpool checkpoint (rollback an entire pool, including zfs rename and zfs destroy)

* **Further Out**
  * Import improvements
  * Import with missing top-level vdevs (some blocks unreadable, but might let you get some data)
  * Improved allocator performance -- vdev spacemap log
  * ZIL performance
  * Persistent L2ARC
  * ZSTD Compression

* Day 2
  * Day two started with the Have/Want/Need session for FreeBSD 12.0. A number of features that various people have or are in the process of building, were discussed with an eye towards upstreaming them. Features we want to have in time for 12.0 (early 2019) were also discussed.
  * After the break was the Vendor summit, which continued the discussion of how FreeBSD and its vendors can work together to make a better operating system, and better products based on it
  * After lunch, the group broke up into various working groups: Testing/CI, Containers, Hardening UFS, and GELI Improvements
  * Allan lead the GELI Improvements session. The main thrust of the discussions was fixing an outstanding bug in GELI when using both key slots with passphrases. To solve this, and make GELI more extensible, the metadata format will be extended to allow it to store more than 512 bytes of data (currently 511 bytes are used).
  * The new format will allow arbitrarily large metadata, defined at creation time by selecting the number of user key slots desired.
  * The new extended metadata format will contain mostly the same fields, except the userkey will no longer be a byte array of IV-key, Data-key, HMAC, but a struct that will contain all data about that key
  * This new format will store the number of pkcs5v2 iterations per key, instead of only having a single location to store this number for all keys (the source of the original bug)
  * A new set of flags per key, to control some aspects of the key (does it require a keyfile, etc), as well as possibly the role of the key.
  * An auxdata field related to the flags, this would allow a specific key with a specific flag set, to boot a different partition, rather than decrypt the main partition.
  * A URI to external key material is also stored per key, allowing GELI to uniquely identify the correct data to load to be able to use a specific decryption key
  * And the three original parts of the key are stored in separate fields now. The HMAC also has a type field, allowing for a different HMAC algorithm to be used in the future.
  * The main metadata is also extended to include a field to store the number of user keys, and to provide an overall HMAC of the metadata, so that it can be verified using the master key (provide any of the user keys)

* Other topics discussed:

  * Ken Merry presented sedutil, a tool for managing Self Encrypting Drives, as may be required by certain governments and other specific use cases.
  * Creating a deniable version of GELI, where the metadata is also encrypted
  * The work to implemented GELI in the UEFI loader was discussed, and a number of developers volunteered to review and test the code

* Following the end of the Dev Summit, the “Newcomers orientation and mentorship” session was run by Michael W. Lucas, which attempts to pair up first time attendees with oldtimers, to make sure they always know a few people they can ask if they have questions, or if they need help getting introduced to the right people.

  ---

News Roundup
----------

### [Conference Day 1](http://www.bsdcan.org/2017/schedule/day_2017-06-09.en.html) ###

* The conference opened with some short remarks from Dan Langille, and then the opening keynote by Dr Michael Geist, a law professor at the University of Ottawa where he holds the Canada Research Chair in Internet and E-commerce Law. The keynote focused on what some of the currently issues are, and how the technical community needs to get involved at all levels. In Canada especially, contacting your representatives is quite effective, and when it does not happen, they only hear the other side of the story, and often end up spouting talking points from lobbyists as if they were facts.
* The question period for the keynote ran well overtime because of the number of good questions the discussion raised, including how do we fight back against large telcos with teams of lawyers and piles of money.
* Then the four tracks of talks started up for the day
* The day wrapped up with the Work In Progress (WIP) session.
  * Allan Jude presented work on ZSTD compression in ZFS
  * Drew Gallatin presented about work at Netflix on larger mbufs, to avoid the need for chaining and to allow more data to be pushed at once. Results in an 8% CPU time reduction when pushing 90 gbps of TLS encrypted traffic
  * Dan Langille presented about letsencrypt (the acme.sh tool specifically), and bacula
  * Samy Al Bahra presented about Concurrency Kit \*\*\*

### [Conference Day 2](http://www.bsdcan.org/2017/schedule/day_2017-06-10.en.html) ###

* Because Dan is a merciful soul, BSDCan starts an hour later on the second day
* Another great round of talks and BoF sessions over lunch
* The hallway track was great as always, and I spent most of the afternoon just talking with people
* Then the final set of talks started, and I was torn between all four of them
* Then there was the auction, and the closing party \*\*\*

### [BSDCan 2017 Auction Swag](https://blather.michaelwlucas.com/archives/2962) ###

* Groff Fundraiser Pins: During the conference, You could get a unique Groff pin, by donating more than the last person to either the FreeBSD or OpenBSD foundation
* Michael W. Lucas and his wife Liz donated some interesting home made and local items to the infamous Charity Auction
* I donated the last remaining copy of the “Canadian Edition” of “FreeBSD Mastery: Advanced ZedFS”, and a Pentium G4400 (Skylake) CPU (Supports ECC or non-ECC)
* Peter Hessler donated his pen (Have you read “Git Commit Murder” yet?)
* Theo De Raadt donated his autographed conference badge
* David Maxwell donated a large print of the group photo from last years FreeBSD Developers Summit, which was purchased by Allan
* There was also a FreeBSD Dev Summit T-Shirt (with the Slogan: What is Core doing about it?) autographed by all of the attending members of core, with a forged jhb@ signature.
* Lastly, someone wrote “I \<3 FreeBSD” on a left over conference t-shirt with magic marker, and the bidding began to make OpenBSD developer Henning Brauer wear it to the closing party. The top bid was $150 by Kristof Provost, the FreeBSD pf maintainer. \*\*\*

### [Henning Brauer loves FreeBSD](https://twitter.com/henningBrauer) ###

* In addition to the $150 donation that resulted in Henning wearing the I love FreeBSD t-shirt, he also took selfies with people in exchange for an additional donation of $10. A total of over $500 was raised.
* [Michael W. Lucas](https://twitter.com/mwlauthor/status/874656462433386497)
* [Michael Dexter](https://twitter.com/michaeldexter/status/874344686885904384)
* [FreeBSD Foundation Interns + Ed Maste + Eric Joyner](https://twitter.com/yzgyyang/status/873714734343880705)
* [Pierre Ponchery](https://twitter.com/khorben/status/873673295903825925)
* [Nick Danger ](https://twitter.com/niqdanger/status/873697176513380353)
* [Michael Shirk ](https://twitter.com/shirkdog/status/873687910175866881)
* [Calvin Hendryx-Parker](https://twitter.com/calvinhp/status/873686591692255233)
* [Reyk Floeter](https://twitter.com/reykfloeter/status/873673717884346368)
* [Rod Grimes](https://twitter.com/akpoff/status/873673432751370240)
* [Jim Thompson](https://twitter.com/gonzopancho/status/873700951651233792)
* [Sean Chittenden and Sam Gwydir, Henning wearing Theo de Raadt’s badge](https://twitter.com/SeanChittenden/status/873750297113501697)
* [David Duncan](https://twitter.com/davdunc/status/873807305162334208) \*\*\*

### [libtrue](https://github.com/libtrue/libtrue) ###

* At the hacker lounge, a joke email was sent to the FreeBSD developers list, making it look like a change to true(1)’s manpage had been committed to “document that true(1) supports libxo”
* While the change was not actually made, as you might expect this started a discussion about if this was really necessary.
* This spawned a new github repo
* While this all started as a joke, it then became an example of how rapid collaboration can happen, and an example of implementing a number of modern technologies in FreeBSD, including libxo (json output), and capsicum (security sandboxing)
* The project has an large number of open issues and enhancement suggestions, and a number of active pull requests including:
  * Add Vagrantfile and Ansible playbooks for VM
  * DTrace Support (Add the trueprov provider to allow tracing of true.
  * A Code of Conduct
  * libtrue.xyz website as a git submodule
  * a false binary
  * Python and Go bindings \*\*\*

### [On Conference Speaking](https://hynek.me/articles/speaking/) ###

* Phase 1: Idea

>
>
> Until now I’ve never had to sit down and ponder what I could speak about. Over the year, I run into at least one topic I know something about that appears to be interesting to the wider public. I’m positive that’s true for almost anyone if they keep their minds open and keep looking for it.
>
>

* Phase 2: Call for Proposals

>
>
> In the end I have to come up with a good pitch that speaks to as many people as possible and with a speculative outline. Since there are always many more submissions than talk slots, this is the first critical point. There are many reasons why a proposal can be refused, so put effort into not giving the program committee any additional, that are entirely avoidable.
>
>

* Phase 3: Waiting for the CFP Result

>
>
> ...do passive research: if I see something relevant, I add it to my mind map. At this point my mind map looks atypical though: it has a lot of unordered root nodes. I just throw in everything that looks interesting and add some of my own thoughts to it. In the case of the reliability topic, I spend a lot of time to stay on top it anyway so a lot of material emerged.
>
>

* Phase 4: The Road to an Outline

>
>
> Once the talk is accepted, research intensifies. Books and articles I’ve written down for further research are read and topics extracted. In 2017, this started on January 23. But before I start writing, I get the mind map into a shape that makes sense and that will support me. This is the second critical point: I have to come up with a compelling story using the material I’ve collected. Just enumerating facts and wisdom a good talk doesn’t make. It has to have a good flow that makes sense and that keeps people engaged.
>
>

* Phase 5: Slides

>
>
> I have a very strong opinion on slides: use few, big words. Don’t make people read your slides unless it’s code samples. Otherwise they’ll be distracted from what you say. You’ll see me rarely use fonts smaller than 100pt (code \~40–60pt) which is readable from everywhere and forces me to be as brief as possible.
>
>

* Phase 6: Polishing

>
>
> I firmly believe that this phase makes or breaks a talk. Only by practicing again and again you’ll notice rough spots, weak transitions, and redundancies. Each iteration makes the talk a bit better both regarding the slides and my ability to present it. Each iteration adds impressions that my subconscious mind chews on and makes things fall in place and give me inspiration in unlikely moments.
>
>

* Phase 7: Sneak Preview

>
>
> In the past years I was blessed with the opportunity to test my talks in front of a smaller audiences. Interestingly, I’ve come to take smaller events more seriously than the big ones. If a small conference pays for my travels and gives me a prominent slot, I have both more responsibility and attention than if I paid my way to an event where I’m one of many speakers.
>
>

* Phase 8: Refinement and More Polishing

>
>
> The first session is always just going through all slides, reacquainting myself with my deck. Then it always takes quite a bit of willpower until I do a full practice run again: the first time always pretty brutal because I tend to forget pretty fast. On the other hand, it rather quickly comes back too. Which makes it even harder to motivate myself to start. Ideally I’d have access to a video recording from phase 7 to have a closer look at what work could be improved. But since it’s usually smaller conferences, I don’t.
>
>

* Phase 9: Travel

>
>
> Whenever I travel to conferences I bring everything I need for my talk and then some. To make sure I don’t forget anything essential, I have a packing list for my business trips (and vacations too – the differences are so minimal that I use a unified list). My epic packing list for business trips. I print it out the day before departure and cross stuff off as I pack. I highly recommend to anyone to emulate this since packing is a lot less stressful if you just follow a checklist.
>
>

* Phase 10: Showtime!

>
>
> So this is it. The moment everything else led to. People who suffer from fear of public speaking think this is the worst part. But if you scroll back you’ll realize: this is the payoff! This is what you worked toward. This is the fun, easy part. Once you stand in front of the audience, the work is done and you get to enjoy the ride.
>
>
> ---
>

Beastie Bits
----------

* [Kris and Ken Moore - TrueOS Q&A](https://www.trueos.org/blog/discourse-trueos-qa-61617/)
* [New home for the repository conversions (NetBSD Git mirror is now on GitHub.com/NetBSD)](https://mail-index.netbsd.org/tech-repository/2017/06/10/msg000637.html)
* [Tab completion in OpenBSD's ksh](https://deftly.net/posts/2017-05-01-openbsd-ksh-tab-complete.html)
* [pkgsrcCon July 1&2](http://pkgsrc.org/pkgsrcCon/2017/)
* [OpenBSD 6.1 syspatch installed SP kernel on MP system](https://www.mail-archive.com/misc@openbsd.org/msg153421.html)
* [KNOXBug meeting this Friday](http://knoxbug.org/content/join-us-freebsd-day) \*\*\*

Feedback/Questions
----------

* [Rob - FreeNAS Corral](http://dpaste.com/2XEE9JA#wrap)
* [Brad - ZFS snapshot strategy](http://dpaste.com/27GSJK0#wrap)
* [Phil - ZFS Send via Snail Mail](http://dpaste.com/3D02RYZ#wrap)
* [Phillip - Network Limits for Public NTP Server](http://dpaste.com/0ZSMVWH#wrap)

  ---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

  ---