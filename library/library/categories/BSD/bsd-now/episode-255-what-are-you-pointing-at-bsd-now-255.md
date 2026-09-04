+++
title = "Episode 255: What Are You Pointing At | BSD Now 255"
description = 'What ZFS blockpointers are, zero-day rewards offered, KDE on FreeBSD status, new FreeBSD core team, NetBSD WiFi refresh, poor man’s CI, and the power of Ctrl+T.\Headlines   \[What ZFS block pointers are and what’s in them](https://utcc.utoronto.ca/~cks/space/blog/solaris/ZFS'
date = "2018-07-18T07:00:00Z"
url = "https://www.bsdnow.tv/255"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.733385603Z"
seen = true
+++

What ZFS blockpointers are, zero-day rewards offered, KDE on FreeBSD status, new FreeBSD core team, NetBSD WiFi refresh, poor man’s CI, and the power of Ctrl+T.

\##Headlines  
 \###[What ZFS block pointers are and what’s in them](https://utcc.utoronto.ca/~cks/space/blog/solaris/ZFSBlockPointers)

>
>
> I’ve mentioned ZFS block pointers in the past; for example, when I wrote about some details of ZFS DVAs, I said that DVAs are embedded in block pointers. But I’ve never really looked carefully at what is in block pointers and what that means and implies for ZFS.
>
>

>
>
> The very simple way to describe a ZFS block pointer is that it’s what ZFS uses in places where other filesystems would simply put a block number. Just like block numbers but unlike things like ZFS dnodes, a block pointer isn’t a separate on-disk entity; instead it’s an on disk data format and an in memory structure that shows up in other things. To quote from the (draft and old) ZFS on-disk specification (PDF):
>
>

>
>
> A block pointer (blkptr\_t) is a 128 byte ZFS structure used to physically locate, verify, and describe blocks of data on disk.
>
>

>
>
> Block pointers are embedded in any ZFS on disk structure that points directly to other disk blocks, both for data and metadata. For instance, the dnode for a file contains block pointers that refer to either its data blocks (if it’s small enough) or indirect blocks, as I saw in this entry. However, as I discovered when I paid attention, most things in ZFS only point to dnodes indirectly, by giving their object number (either in a ZFS filesystem or in pool-wide metadata).
>
>

>
>
> So what’s in a block pointer itself? You can find the technical details for modern ZFS in spa.h, so I’m going to give a sort of summary. A regular block pointer contains:
>
>

* various metadata and flags about what the block pointer is for and what parts of it mean, including what type of object it points to.
* Up to three DVAs that say where to actually find the data on disk. There can be more than one DVA because you may have set the copies property to 2 or 3, or this may be metadata (which normally has two copies and may have more for sufficiently important metadata).
* The logical size (size before compression) and ‘physical’ size (the nominal size after compression) of the disk block. The physical size can do odd things and is not necessarily the asize (allocated size) for the DVA(s).
* The txgs that the block was born in, both logically and physically (the physical txg is apparently for dva[0]). The physical txg was added with ZFS deduplication but apparently also shows up in vdev removal.
* The checksum of the data the block pointer describes. This checksum implicitly covers the entire logical size of the data, and as a result you must read all of the data in order to verify it. This can be an issue on raidz vdevs or if the block had to use gang blocks.

>
>
> Just like basically everything else in ZFS, block pointers don’t have an explicit checksum of their contents. Instead they’re implicitly covered by the checksum of whatever they’re embedded in; the block pointers in a dnode are covered by the overall checksum of the dnode, for example. Block pointers must include a checksum for the data they point to because such data is ‘out of line’ for the containing object.
>
>

>
>
> (The block pointers in a dnode don’t necessarily point straight to data. If there’s more than a bit of data in whatever the dnode covers, the dnode’s block pointers will instead point to some level of indirect block, which itself has some number of block pointers.)
>
>

>
>
> There is a special type of block pointer called an embedded block pointer. Embedded block pointers directly contain up to 112 bytes of data; apart from the data, they contain only the metadata fields and a logical birth txg. As with conventional block pointers, this data is implicitly covered by the checksum of the containing object.
>
>

>
>
> Since block pointers directly contain the address of things on disk (in the form of DVAs), they have to change any time that address changes, which means any time ZFS does its copy on write thing. This forces a change in whatever contains the block pointer, which in turn ripples up to another block pointer (whatever points to said containing thing), and so on until we eventually reach the Meta Object Set and the uberblock. How this works is a bit complicated, but ZFS is designed to generally make this a relatively shallow change with not many levels of things involved (as I discovered recently).
>
>

>
>
> As far as I understand things, the logical birth txg of a block pointer is the transaction group in which the block pointer was allocated. Because of ZFS’s copy on write principle, this means that nothing underneath the block pointer has been updated or changed since that txg; if something changed, it would have been written to a new place on disk, which would have forced a change in at least one DVA and thus a ripple of updates that would update the logical birth txg.
>
>

>
>
> However, this doesn’t quite mean what I used to think it meant because of ZFS’s level of indirection. If you change a file by writing data to it, you will change some of the file’s block pointers, updating their logical birth txg, and you will change the file’s dnode. However, you won’t change any block pointers and thus any logical birth txgs for the filesystem directory the file is in (or anything else up the directory tree), because the directory refers to the file through its object number, not by directly pointing to its dnode. You can still use logical birth txgs to efficiently find changes from one txg to another, but you won’t necessarily get a filesystem level view of these changes; instead, as far as I can see, you will basically get a view of what object(s) in a filesystem changed (effectively, what inode numbers changed).
>
>

>
>
> (ZFS has an interesting hack to make things like ‘zfs diff’ work far more efficiently than you would expect in light of this, but that’s going to take yet another entry to cover.)
>
>

---

\###[Rewards of Up to $500,000 Offered for FreeBSD, OpenBSD, NetBSD, Linux Zero-Days](https://www.bleepingcomputer.com/news/security/rewards-of-up-to-500-000-offered-for-freebsd-openbsd-netbsd-linux-zero-days/)

>
>
> Exploit broker Zerodium is offering rewards of up to $500,000 for zero-days in UNIX-based operating systems like OpenBSD, FreeBSD, NetBSD, but also for Linux distros such as Ubuntu, CentOS, Debian, and Tails.  
>  The offer, first advertised via Twitter earlier this week, is available as part of the company’s latest zero-day acquisition drive. Zerodium is known for buying zero-days and selling them to government agencies and law enforcement.  
>  The company runs a regular zero-day acquisition program through its website, but it often holds special drives with more substantial rewards when it needs zero-days of a specific category.
>
>

* BSD zero-day rewards will be on par with Linux payouts

>
>
> The US-based company held a previous drive with increased rewards for Linux zero-days in February, with rewards going as high as $45,000.  
>  In another zero-day acquisition drive announced on Twitter this week, the company said it was looking again for Linux zero-days, but also for exploits targeting BSD systems. This time around, rewards can go up to $500,000, for the right exploit.  
>  Zerodium told Bleeping Computer they’ll be aligning the temporary rewards for BSD systems with their usual payouts for Linux distros.  
>  The company’s usual payouts for Linux privilege escalation exploits can range from $10,000 to $30,000. Local privilege escalation (LPE) rewards can even reach $100,000 for “an exploit with an exceptional quality and coverage,” such as, for example, a Linux kernel exploit affecting all major distributions.  
>  Payouts for Linux remote code execution (RCE) exploits can bring in from $50,000 to $500,000 depending on the targeted software/service and its market share. The highest rewards are usually awarded for LPEs and RCEs affecting CentOS and Ubuntu distros.
>
>

* Zero-day price varies based on exploitation chain

>
>
> The acquisition price of a submitted zero-day is directly tied to its requirements in terms of user interaction (no click, one click, two clicks, etc.), Zerodium said.  
>  Other factors include the exploit reliability, its success rate, the number of vulnerabilities chained together for the final exploit to work (more chained bugs means more chances for the exploit to break unexpectedly), and the OS configuration needed for the exploit to work (exploits are valued more if they work against default OS configs).
>
>

* Zero-days in servers “can reach exceptional amounts”

>
>
> “Price difference between systems is mostly driven by market shares,” Zerodium founder Chaouki Bekrar told Bleeping Computer via email.  
>  Asked about the logic behind these acquisition drives that pay increased rewards, Bekrar told Bleeping Computer the following:  
>  "Our aim is to always have, at any time, two or more fully functional exploits for every major software, hardware, or operating systems, meaning that from time to time we would promote a specific software/system on our social media to acquire new codes and strengthen our existing capabilities or extend them.”  
>  “We may also react to customers’ requests and their operational needs,” Bekrar said.
>
>

* It’s becoming a crowded market

>
>
> Since Zerodium drew everyone’s attention to the exploit brokerage market in 2015, the market has gotten more and more crowded, but also more sleazy, with some companies being accused of selling zero-days to government agencies in countries with oppressive or dictatorial regimes, where they are often used against political oponents, journalists, and dissidents, instead of going after real criminals.  
>  The latest company who broke into the zero-day brokerage market is Crowdfense, who recently launched an acquisition program with prizes of $10 million, of which it already paid $4.5 million to researchers.
>
>

[Twitter Announcement](https://twitter.com/Zerodium/status/1012007051466162177)

---

**Digital Ocean**  
[http://do.co/bsdnow](http://do.co/bsdnow)

\###[KDE on FreeBSD – June 2018](https://euroquis.nl/bobulate/?p=1915)

>
>
> The KDE-FreeBSD team (a half-dozen hardy individuals, with varying backgrounds and varying degrees of involvement depending on how employment is doing) has a status message in the #kde-freebsd channel on freenode. Right now it looks like this:
>
>

```
http://FreeBSD.kde.org | Bleeding edge
http://FreeBSD.kde.org/area51.php | Released: Qt 5.10.1, KDE SC 4.14.3, KF5 5.46.0, Applications 18.04.1, Plasma-5.12.5, Kdevelop-5.2.1, Digikam-5.9.0

```

>
>
> It’s been a while since I wrote about KDE on FreeBSD, what with Calamares and third-party software happening as well. We’re better at keeping the IRC topic up-to-date than a lot of other sources of information (e.g. the FreeBSD quarterly reports, or the f.k.o website, which I’ll just dash off and update after writing this).
>
>

* In no particular order:
* Qt 5.10 is here, in a FrankenEngine incarnation: we still use WebEnging from Qt 5.9 because — like I’ve said before — WebEngine is such a gigantic pain in the butt to update with all the necessary patches to get it to compile.
* Our collection of downstream patches to Qt 5.10 is growing, slowly. None of them are upstreamable (e.g. libressl support) though.
* KDE Frameworks releases are generally pushed to ports within a week or two of release. Actually, now that there is a bigger stack of KDE software in FreeBSD ports the updates take longer because we have to do exp-runs.
* Similarly, Applications and Plasma releases are reasonably up-to-date. We dodged a bullet by not jumping on Plasma 5.13 right away, I see. Tobias is the person doing almost all of the drudge-work of these updates, he deserves a pint of something in Vienna this summer.
* The [freebsd.kde.org](http://freebsd.kde.org) website has been slightly updated; it was terribly out-of-date.

>
>
> So we’re mostly-up-to-date, and mostly all packaged up and ready to go. Much of my day is spent in VMs packaged by other people, but it’s good to have a full KDE developer environment outside of them as well. (PS. Gotta hand it to Tomasz for [the amazing application for downloading and displaying a flamingo](https://www.angrycane.com.br/wp-content/uploads/2018/06/download_flamingo_and_display.txt) … niche usecases FTW)
>
>

---

\##News Roundup  
 \###[New FreeBSD Core Team Elected](https://lists.freebsd.org/pipermail/freebsd-announce/2018-July/001836.html)

>
>
> Active committers to the project have elected your tenth FreeBSD Core  
>  Team.
>
>

* Allan Jude (allanjude)
* Benedict Reuschling (bcr)
* Brooks Davis (brooks)
* Hiroki Sato (hrs)
* Jeff Roberson (jeff)
* John Baldwin (jhb)
* Kris Moore (kmoore)
* Sean Chittenden (seanc)
* Warner Losh (imp)

>
>
> Let’s extend our gratitude to the outgoing Core Team members:
>
>

* Baptiste Daroussin (bapt)
* Benno Rice (benno)
* Ed Maste (emaste)
* George V. Neville-Neil (gnn)
* Matthew Seaman (matthew)

>
>
> Matthew, after having served as the Core Team Secretary for the past  
>  four years, will be stepping down from that role.
>
>

>
>
> The Core Team would also like to thank Dag-Erling Smørgrav for running a  
>  flawless election.
>
>

* To read about the responsibilities of the Core Team, refer to [https://www.freebsd.org/administration.html#t-core](https://www.freebsd.org/administration.html#t-core).

---

\###[NetBSD WiFi refresh](https://mail-index.netbsd.org/tech-net/2018/06/26/msg006943.html)

>
>
> The NetBSD Foundation is pleased to announce a summer 2018 contract with Philip Nelson (phil%[NetBSD.org](http://NetBSD.org)@localhost) to update the IEEE 802.11 stack basing the update on the FreeBSD current code. The goals of the project are:
>
>

* Minimizing the differences between the FreeBSD and NetBSD IEEE 802.11 stack so future updates are easier.
* Adding support for the newer protocols 801.11/N and 802.11/AC.
* Improving SMP support in the IEEE 802.11 stack.
* Adding Virtual Access Point (VAP) support.
* Updating as many NIC drivers as time permits for the updated IEEE 802.11 stack and VAP changes.

>
>
> Status reports will be posted to tech-net%[NetBSD.org](http://NetBSD.org)@localhost every other week  
>  while the contract is active.
>
>

---

**iXsystems**

\###[Poor Man’s CI - Hosted CI for BSD with shell scripting and duct tape](https://github.com/billziss-gh/pmci)

>
>
> Poor Man’s CI (PMCI - Poor Man’s Continuous Integration) is a collection of scripts that taken together work as a simple CI solution that runs on Google Cloud. While there are many advanced hosted CI systems today, and many of them are free for open source projects, none of them seem to offer a solution for the BSD operating systems (FreeBSD, NetBSD, OpenBSD, etc.)
>
>

>
>
> The architecture of Poor Man’s CI is system agnostic. However in the implementation provided in this repository the only supported systems are FreeBSD and NetBSD. Support for additional systems is possible.
>
>

>
>
> Poor Man’s CI runs on the Google Cloud. It is possible to set it up so that the service fits within the Google Cloud “Always Free” limits. In doing so the provided CI is not only hosted, but is also free! (Disclaimer: I am not affiliated with Google and do not otherwise endorse their products.)
>
>

* ARCHITECTURE

>
>
> A CI solution listens for “commit” (or more usually “push”) events, builds the associated repository at the appropriate place in its history and reports the results. Poor Man’s CI implements this very basic CI scenario using a simple architecture, which we present in this section.
>
>

* Poor Man’s CI consists of the following components and their interactions:

* Controller: Controls the overall process of accepting GitHub push events and starting builds. The Controller runs in the Cloud Functions environment and is implemented by the files in the controller source directory. It consists of the following components:

  * Listener: Listens for GitHub push events and posts them as work messages to the workq PubSub.
  * Dispatcher: Receives work messages from the workq PubSub and a free instance name from the Builder Pool. It instantiates a builder instance named name in the Compute Engine environment and passes it the link of a repository to build.
  * Collector: Receives done messages from the doneq PubSub and posts the freed instance name back to the Builder Pool.

* PubSub Topics:

  * workq: Transports work messages that contain the link of the repository to build.
  * poolq: Implements the Builder Pool, which contains the name’s of available builder instances. To acquire a builder name, pull a message from the poolq. To release a builder name, post it back into the poolq.
  * doneq: Transports done messages (builder instance terminate and delete events). These message contain the name of freed builder instances.

* builder: A builder is a Compute Engine instance that performs a build of a repository and shuts down when the build is complete. A builder is instantiated from a VM image and a startx (startup-exit) script.

* Build Logs: A Storage bucket that contains the logs of builds performed by builder instances.

* Logging Sink: A Logging Sink captures builder instance terminate and delete events and posts them into the doneq.

* BUGS

>
>
> The Builder Pool is currently implemented as a PubSub; messages in the PubSub contain the names of available builder instances. Unfortunately a PubSub retains its messages for a maximum of 7 days. It is therefore possible that messages will be discarded and that your PMCI deployment will suddenly find itself out of builder instances. If this happens you can reseed the Builder Pool by running the commands below. However this is a serious BUG that should be fixed. For a related discussion see [https://tinyurl.com/ybkycuub](https://tinyurl.com/ybkycuub).
>
>

`$ ./pmci queue_post poolq builder0`  
`# ./pmci queue_post poolq builder1`  
`# ... repeat for as many builders as you want`

>
>
> The Dispatcher is implemented as a Retry Background Cloud Function. It accepts work messages from the workq and attempts to pull a free name from the poolq. If that fails it returns an error, which instructs the infrastructure to retry. Because the infrastructure does not provide any retry controls, this currently happens immediately and the Dispatcher spins unproductively. This is currently mitigated by a “sleep” (setTimeout), but the Cloud Functions system still counts the Function as running and charges it accordingly. While this fits within the “Always Free” limits, it is something that should eventually be fixed (perhaps by the PubSub team). For a related discussion see [https://tinyurl.com/yb2vbwfd](https://tinyurl.com/yb2vbwfd).
>
>

---

\###[The Power of Ctrl-T](https://blog.danielisz.org/2018/06/21/the-power-of-ctrlt/)

>
>
> Did you know that you can check what a process is doing by pressing CTRL+T?  
>  Has it happened to you before that you were waiting for something to be finished that can take a lot of time, but there is no easy way to check the status. Like a dd, cp, mv and many others. All you have to do is press CTRL+T where the process is running. This will output what’s happening and will not interrupt or mess with it in any way. This causes the operating system to output the SIGINFO signal.  
>  On FreeBSD it looks like this:
>
>

```
ping pingtest.com
PING pingtest.com (5.22.149.135): 56 data bytes
64 bytes from 5.22.149.135: icmp_seq=0 ttl=51 time=86.232 ms
64 bytes from 5.22.149.135: icmp_seq=1 ttl=51 time=85.477 ms
64 bytes from 5.22.149.135: icmp_seq=2 ttl=51 time=85.493 ms
64 bytes from 5.22.149.135: icmp_seq=3 ttl=51 time=85.211 ms
64 bytes from 5.22.149.135: icmp_seq=4 ttl=51 time=86.002 ms
load: 1.12 cmd: ping 94371 [select] 4.70r 0.00u 0.00s 0% 2500k
5/5 packets received (100.0%) 85.211 min / 85.683 avg / 86.232 max
64 bytes from 5.22.149.135: icmp_seq=5 ttl=51 time=85.725 ms
64 bytes from 5.22.149.135: icmp_seq=6 ttl=51 time=85.510 ms

```

>
>
> As you can see it not only outputs the name of the running command but the following parameters as well:
>
>

```
94371 – PID
4.70r – since when is the process running
0.00u – user time
0.00s – system time
0% – CPU usage
2500k – resident set size of the process or RSS
``

> An even better example is with the following cp command:

```

cp FreeBSD-11.1-RELEASE-amd64-dvd1.iso /dev/null  
 load: 0.99 cmd: cp 94412 [runnable] 1.61r 0.00u 0.39s 3% 3100k  
 FreeBSD-11.1-RELEASE-amd64-dvd1.iso -\> /dev/null 15%  
 load: 0.91 cmd: cp 94412 [runnable] 2.91r 0.00u 0.80s 6% 3104k  
 FreeBSD-11.1-RELEASE-amd64-dvd1.iso -\> /dev/null 32%  
 load: 0.91 cmd: cp 94412 [runnable] 4.20r 0.00u 1.23s 9% 3104k  
 FreeBSD-11.1-RELEASE-amd64-dvd1.iso -\> /dev/null 49%  
 load: 0.91 cmd: cp 94412 [runnable] 5.43r 0.00u 1.64s 11% 3104k  
 FreeBSD-11.1-RELEASE-amd64-dvd1.iso -\> /dev/null 64%  
 load: 1.07 cmd: cp 94412 [runnable] 6.65r 0.00u 2.05s 13% 3104k  
 FreeBSD-11.1-RELEASE-amd64-dvd1.iso -\> /dev/null 79%  
 load: 1.07 cmd: cp 94412 [runnable] 7.87r 0.00u 2.43s 15% 3104k  
 FreeBSD-11.1-RELEASE-amd64-dvd1.iso -\> /dev/null 95%

```

> I prcessed CTRL+T six times.  Without that, all the output would have been is the first line.

> Another example how the process is changing states:

```

wget [https://download.freebsd.org/ftp/releases/amd64/amd64/ISO-IMAGES/11.1/FreeBSD-11.1-RELEASE-amd64-dvd1.iso](https://download.freebsd.org/ftp/releases/amd64/amd64/ISO-IMAGES/11.1/FreeBSD-11.1-RELEASE-amd64-dvd1.iso)  
 –2018-06-17 18:47:48– [https://download.freebsd.org/ftp/releases/amd64/amd64/ISO-IMAGES/11.1/FreeBSD-11.1-RELEASE-amd64-dvd1.iso](https://download.freebsd.org/ftp/releases/amd64/amd64/ISO-IMAGES/11.1/FreeBSD-11.1-RELEASE-amd64-dvd1.iso)  
 Resolving [download.freebsd.org](http://download.freebsd.org) ([download.freebsd.org](http://download.freebsd.org))… 96.47.72.72, 2610:1c1:1:606c::15:0  
 Connecting to [download.freebsd.org](http://download.freebsd.org) ([download.freebsd.org](http://download.freebsd.org))|96.47.72.72|:443… connected.  
 HTTP request sent, awaiting response… 200 OK  
 Length: 3348465664 (3.1G) [application/octet-stream]  
 Saving to: ‘FreeBSD-11.1-RELEASE-amd64-dvd1.iso’

FreeBSD-11.1-RELEASE-amd64-dvd1.iso 1%[\> ] 41.04M 527KB/s eta 26m 49sload: 4.95 cmd: wget 10152 waiting 0.48u 0.72s  
 FreeBSD-11.1-RELEASE-amd64-dvd1.iso 1%[\> ] 49.41M 659KB/s eta 25m 29sload: 12.64 cmd: wget 10152 waiting 0.55u 0.85s  
 FreeBSD-11.1-RELEASE-amd64-dvd1.iso 2%[=\> ] 75.58M 6.31MB/s eta 20m 6s load: 11.71 cmd: wget 10152 running 0.73u 1.19s  
 FreeBSD-11.1-RELEASE-amd64-dvd1.iso 2%[=\> ] 85.63M 6.83MB/s eta 18m 58sload: 11.71 cmd: wget 10152 waiting 0.80u 1.32s  
 FreeBSD-11.1-RELEASE-amd64-dvd1.iso 14%[==============\> ] 460.23M 7.01MB/s eta 9m 0s 1

```

> The bad news is that CTRl+T doesn’t work with Linux kernel, but you can use it on MacOS/OS-X:

```

—\> Fetching distfiles for gmp  
 —\> Attempting to fetch gmp-6.1.2.tar.bz2 from [https://distfiles.macports.org/gmp](https://distfiles.macports.org/gmp)  
 —\> Verifying checksums for gmp  
 —\> Extracting gmp  
 —\> Applying patches to gmp  
 —\> Configuring gmp  
 load: 2.81 cmd: clang 74287 running 0.31u 0.28s

```

> PS: If I recall correctly Feld showed me CTRL+T, thank you!

***

##Beastie Bits
+ [Half billion tries for a HAMMER2 bug](http://lists.dragonflybsd.org/pipermail/commits/2018-May/672263.html)
+ OpenBSD with various Desktops
 + [OpenBSD 6.3 running twm window manager](https://youtu.be/v6XeC5wU2s4)
 + [OpenBSD 6.3 jwm and rox desktop](https://youtu.be/jlSK2oi7CBc)
 + [OpenBSD 6.3 cwm youtube video](https://youtu.be/mgqNyrP2CPs)
+ [pf: Increase default state table size](https://svnweb.freebsd.org/base?view=revision&revision=336221)
***

**Tarsnap**

##Feedback/Questions
+ Ben Sims - [Full feed?](http://dpaste.com/3XVH91T#wrap)
+ Scott - [Questions and Comments](http://dpaste.com/08P34YN#wrap)
+ Troels - [Features of FreeBSD 11.2 that deserve a mention](http://dpaste.com/3DDPEC2#wrap)
+ [Fred - Show Ideas](http://dpaste.com/296ZA0P#wrap)
***

- Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)
***

***

iXsystems [It's all NAS](https://www.ixsystems.com/blog/its-all-nas/)

```