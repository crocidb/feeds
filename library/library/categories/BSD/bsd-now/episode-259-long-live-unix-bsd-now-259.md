+++
title = "Episode 259: Long Live Unix | BSD Now 259"
description = "The strange birth and long life of Unix, FreeBSD jail with a single public IP, EuroBSDcon 2018 talks and schedule, OpenBSD on G4 iBook, PAM template user, ZFS file server, and reflections on one year of OpenBSD use.Picking the contest winner 1. Vincent2. Bostjan3. Andr"
date = "2018-08-16T07:00:00Z"
url = "https://www.bsdnow.tv/259"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.722231622Z"
seen = true
+++

The strange birth and long life of Unix, FreeBSD jail with a single public IP, EuroBSDcon 2018 talks and schedule, OpenBSD on G4 iBook, PAM template user, ZFS file server, and reflections on one year of OpenBSD use.

### []()Picking the contest winner ###

1. Vincent
2. Bostjan
3. Andrew
4. Klaus-Hendrik
5. Will
6. Toby
7. Johnny
8. David
9. manfrom
10. Niclas
11. Gary
12. Eddy
13. Bruce
14. Lizz
15. Jim

[Random number generator](https://www.random.org/integers/?num=1&min=0&max=15&col=1&base=10&format=html&rnd=new)

\##Headlines  
 \###[The Strange Birth and Long Life of Unix](https://spectrum.ieee.org/tech-history/cyberspace/the-strange-birth-and-long-life-of-unix)

>
>
> They say that when one door closes on you, another opens. People generally offer this bit of wisdom just to lend some solace after a misfortune. But sometimes it’s actually true. It certainly was for Ken Thompson and the late Dennis Ritchie, two of the greats of 20th-century information technology, when they created the Unix operating system, now considered one of the most inspiring and influential pieces of software ever written.  
>  A door had slammed shut for Thompson and Ritchie in March of 1969, when their employer, the American Telephone & Telegraph Co., withdrew from a collaborative project with the Massachusetts Institute of Technology and General Electric to create an interactive time-sharing system called Multics, which stood for “Multiplexed Information and Computing Service.” Time-sharing, a technique that lets multiple people use a single computer simultaneously, had been invented only a decade earlier. Multics was to combine time-sharing with other technological advances of the era, allowing users to phone a computer from remote terminals and then read e-mail, edit documents, run calculations, and so forth. It was to be a great leap forward from the way computers were mostly being used, with people tediously preparing and submitting batch jobs on punch cards to be run one by one.  
>  Over five years, AT&T invested millions in the Multics project, purchasing a GE-645 mainframe computer and dedicating to the effort many of the top researchers at the company’s renowned Bell Telephone Laboratories—­including Thompson and Ritchie, Joseph F. Ossanna, Stuart Feldman, M. Douglas McIlroy, and the late Robert Morris. But the new system was too ambitious, and it fell troublingly behind schedule. In the end, AT&T’s corporate leaders decided to pull the plug.  
>  After AT&T’s departure from the Multics project, managers at Bell Labs, in Murray Hill, N.J., became reluctant to allow any further work on computer operating systems, leaving some researchers there very frustrated. Although Multics hadn’t met many of its objectives, it had, as Ritchie later recalled, provided them with a “convenient interactive computing service, a good environment in which to do programming, [and] a system around which a fellowship could form.” Suddenly, it was gone.  
>  With heavy hearts, the researchers returned to using their old batch system. At such an inauspicious moment, with management dead set against the idea, it surely would have seemed foolhardy to continue designing computer operating systems. But that’s exactly what Thompson, Ritchie, and many of their Bell Labs colleagues did. Now, some 40 years later, we should be thankful that these programmers ignored their bosses and continued their labor of love, which gave the world Unix, one of the greatest computer operating systems of all time.  
>  The rogue project began in earnest when Thompson, Ritchie, and a third Bell Labs colleague, Rudd Canaday, began to sketch out on paper the design for a file system. Thompson then wrote the basics of a new operating system for the lab’s GE-645 mainframe. But with the Multics project ended, so too was the need for the GE-645. Thompson realized that any further programming he did on it was likely to go nowhere, so he dropped the effort.  
>  Thompson had passed some of his time after the demise of Multics writing a computer game called Space Travel, which simulated all the major bodies in the solar system along with a spaceship that could fly around them. Written for the GE-645, Space Travel was clunky to play—and expensive: roughly US $75 a game for the CPU time. Hunting around, Thompson came across a dusty PDP-7, a minicomputer built by Digital Equipment Corp. that some of his Bell Labs colleagues had purchased earlier for a circuit-analysis project. Thompson rewrote Space Travel to run on it.  
>  And with that little programming exercise, a second door cracked ajar. It was to swing wide open during the summer of 1969 when Thompson’s wife, Bonnie, spent a month visiting his parents to show off their newborn son. Thompson took advantage of his temporary bachelor existence to write a good chunk of what would become the Unix operating system for the discarded PDP‑7. The name Unix stems from a joke one of Thompson’s colleagues made: Because the new operating system supported only one user (Thompson), he saw it as an emasculated version of Multics and dubbed it “Un-multiplexed Information and Computing Service,” or Unics. The name later morphed into Unix.  
>  Initially, Thompson used the GE-645 to compose and compile the software, which he then downloaded to the PDP‑7. But he soon weaned himself from the mainframe, and by the end of 1969 he was able to write operating-system code on the PDP-7 itself. That was a step in the right direction. But Thompson and the others helping him knew that the PDP‑7, which was already obsolete, would not be able to sustain their skunkworks for long. They also knew that the lab’s management wasn’t about to allow any more research on operating systems.  
>  So Thompson and Ritchie got crea­tive. They formulated a proposal to their bosses to buy one of DEC’s newer minicomputers, a PDP-11, but couched the request in especially palatable terms. They said they were aiming to create tools for editing and formatting text, what you might call a word-processing system today. The fact that they would also have to write an operating system for the new machine to support the editor and text formatter was almost a footnote.  
>  Management took the bait, and an order for a PDP-11 was placed in May 1970. The machine itself arrived soon after, although the disk drives for it took more than six months to appear. During the interim, Thompson, Ritchie, and others continued to develop Unix on the PDP-7. After the PDP-11’s disks were installed, the researchers moved their increasingly complex operating system over to the new machine. Next they brought over the roff text formatter written by Ossanna and derived from the runoff program, which had been used in an earlier time-sharing system.  
>  Unix was put to its first real-world test within Bell Labs when three typists from AT&T’s patents department began using it to write, edit, and format patent applications. It was a hit. The patent department adopted the system wholeheartedly, which gave the researchers enough credibility to convince management to purchase another machine—a newer and more powerful PDP-11 model—allowing their stealth work on Unix to continue.  
>  During its earliest days, Unix evolved constantly, so the idea of issuing named versions or releases seemed inappropriate. But the researchers did issue new editions of the programmer’s manual periodically, and the early Unix systems were named after each such edition. The first edition of the manual was completed in November 1971.  
>  So what did the first edition of Unix offer that made it so great? For one thing, the system provided a hierarchical file system, which allowed something we all now take for granted: Files could be placed in directories—or equivalently, folders—that in turn could be put within other directories. Each file could contain no more than 64 kilobytes, and its name could be no more than six characters long. These restrictions seem awkwardly limiting now, but at the time they appeared perfectly adequate.  
>  Although Unix was ostensibly created for word processing, the only editor available in 1971 was the line-oriented ed. Today, ed is still the only editor guaranteed to be present on all Unix systems. Apart from the text-processing and general system applications, the first edition of Unix included games such as blackjack, chess, and tic-tac-toe. For the system administrator, there were tools to dump and restore disk images to magnetic tape, to read and write paper tapes, and to create, check, mount, and unmount removable disk packs.  
>  Most important, the system offered an interactive environment that by this time allowed time-sharing, so several people could use a single machine at once. Various programming languages were available to them, including BASIC, Fortran, the scripting of Unix commands, assembly language, and B. The last of these, a descendant of a BCPL (Basic Combined Programming Language), ultimately evolved into the immensely popular C language, which Ritchie created while also working on Unix.  
>  The first edition of Unix let programmers call 34 different low-level routines built into the operating system. It’s a testament to the system’s enduring nature that nearly all of these system calls are still available—and still heavily used—on modern Unix and Linux systems four decades on. For its time, first-­edition Unix provided a remarkably powerful environment for software development. Yet it contained just 4200 lines of code at its heart and occupied a measly 16 KB of main memory when it ran.  
>  Unix’s great influence can be traced in part to its elegant design, simplicity, portability, and serendipitous timing. But perhaps even more important was the devoted user community that soon grew up around it. And that came about only by an accident of its unique history.  
>  The story goes like this: For years Unix remained nothing more than a Bell Labs research project, but by 1973 its authors felt the system was mature enough for them to present a paper on its design and implementation at a symposium of the Association for Computing Machinery. That paper was published in 1974 in the Communications of the ACM. Its appearance brought a flurry of requests for copies of the software.  
>  This put AT&T in a bind. In 1956, AT&T had agreed to a U.S government consent decree that prevented the company from selling products not directly related to telephones and telecommunications, in return for its legal monopoly status in running the country’s long-distance phone service. So Unix could not be sold as a product. Instead, AT&T released the Unix source code under license to anyone who asked, charging only a nominal fee. The critical wrinkle here was that the consent decree prevented AT&T from supporting Unix. Indeed, for many years Bell Labs researchers proudly displayed their Unix policy at conferences with a slide that read, “No advertising, no support, no bug fixes, payment in advance.”  
>  With no other channels of support available to them, early Unix adopters banded together for mutual assistance, forming a loose network of user groups all over the world. They had the source code, which helped. And they didn’t view Unix as a standard software product, because nobody seemed to be looking after it. So these early Unix users themselves set about fixing bugs, writing new tools, and generally improving the system as they saw fit.  
>  The Usenix user group acted as a clearinghouse for the exchange of Unix software in the United States. People could send in magnetic tapes with new software or fixes to the system and get back tapes with the software and fixes that Usenix had received from others. In Australia, the University of New South Wales and the University of Sydney produced a more robust version of Unix, the Australian Unix Share Accounting Method, which could cope with larger numbers of concurrent users and offered better performance.  
>  By the mid-1970s, the environment of sharing that had sprung up around Unix resembled the open-source movement so prevalent today. Users far and wide were enthusiastically enhancing the system, and many of their improvements were being fed back to Bell Labs for incorporation in future releases. But as Unix became more popular, AT&T’s lawyers began looking harder at what various licensees were doing with their systems.  
>  One person who caught their eye was John Lions, a computer scientist then teaching at the University of New South Wales, in Australia. In 1977, he published what was probably the most famous computing book of the time, A Commentary on the Unix Operating System, which contained an annotated listing of the central source code for Unix.  
>  Unix’s licensing conditions allowed for the exchange of source code, and initially, Lions’s book was sold to licensees. But by 1979, AT&T’s lawyers had clamped down on the book’s distribution and use in academic classes. The anti­authoritarian Unix community reacted as you might expect, and samizdat copies of the book spread like wildfire. Many of us have nearly unreadable nth-­generation photocopies of the original book.  
>  End runs around AT&T’s lawyers indeed became the norm—even at Bell Labs. For example, between the release of the sixth edition of Unix in 1975 and the seventh edition in 1979, Thompson collected dozens of important bug fixes to the system, coming both from within and outside of Bell Labs. He wanted these to filter out to the existing Unix user base, but the company’s lawyers felt that this would constitute a form of support and balked at their release. Nevertheless, those bug fixes soon became widely distributed through unofficial channels. For instance, Lou Katz, the founding president of Usenix, received a phone call one day telling him that if he went down to a certain spot on Mountain Avenue (where Bell Labs was located) at 2 p.m., he would find something of interest. Sure enough, Katz found a magnetic tape with the bug fixes, which were rapidly in the hands of countless users.  
>  By the end of the 1970s, Unix, which had started a decade earlier as a reaction against the loss of a comfortable programming environment, was growing like a weed throughout academia and the IT industry. Unix would flower in the early 1980s before reaching the height of its popularity in the early 1990s.  
>  For many reasons, Unix has since given way to other commercial and noncommercial systems. But its legacy, that of an elegant, well-designed, comfortable environment for software development, lives on. In recognition of their accomplishment, Thompson and Ritchie were given the Japan Prize earlier this year, adding to a collection of honors that includes the United States’ National Medal of Technology and Innovation and the Association of Computing Machinery’s Turing Award. Many other, often very personal, tributes to Ritchie and his enormous influence on computing were widely shared after his death this past October.  
>  Unix is indeed one of the most influential operating systems ever invented. Its direct descendants now number in the hundreds. On one side of the family tree are various versions of Unix proper, which began to be commercialized in the 1980s after the Bell System monopoly was broken up, freeing AT&T from the stipulations of the 1956 consent decree. On the other side are various Unix-like operating systems derived from the version of Unix developed at the University of California, Berkeley, including the one Apple uses today on its computers, OS X. I say “Unix-like” because the developers of the Berkeley Software Distribution (BSD) Unix on which these systems were based worked hard to remove all the original AT&T code so that their software and its descendants would be freely distributable.  
>  The effectiveness of those efforts were, however, called into question when the AT&T subsidiary Unix System Laboratories filed suit against Berkeley Software Design and the Regents of the University of California in 1992 over intellectual property rights to this software. The university in turn filed a counterclaim against AT&T for breaches to the license it provided AT&T for the use of code developed at Berkeley. The ensuing legal quagmire slowed the development of free Unix-like clones, including 386BSD, which was designed for the Intel 386 chip, the CPU then found in many IBM PCs.  
>  Had this operating system been available at the time, Linus Torvalds says he probably wouldn’t have created Linux, an open-source Unix-like operating system he developed from scratch for PCs in the early 1990s. Linux has carried the Unix baton forward into the 21st century, powering a wide range of digital gadgets including wireless routers, televisions, desktop PCs, and Android smartphones. It even runs some supercomputers.  
>  Although AT&T quickly settled its legal disputes with Berkeley Software Design and the University of California, legal wrangling over intellectual property claims to various parts of Unix and Linux have continued over the years, often involving byzantine corporate relations. By 2004, no fewer than five major lawsuits had been filed. Just this past August, a software company called the TSG Group (formerly known as the SCO Group), lost a bid in court to claim ownership of Unix copyrights that Novell had acquired when it purchased the Unix System Laboratories from AT&T in 1993.  
>  As a programmer and Unix historian, I can’t help but find all this legal sparring a bit sad. From the very start, the authors and users of Unix worked as best they could to build and share, even if that meant defying authority. That outpouring of selflessness stands in sharp contrast to the greed that has driven subsequent legal battles over the ownership of Unix.  
>  The world of computer hardware and software moves forward startlingly fast. For IT professionals, the rapid pace of change is typically a wonderful thing. But it makes us susceptible to the loss of our own history, including important lessons from the past. To address this issue in a small way, in 1995 I started a mailing list of old-time Unix ­aficionados. That effort morphed into the Unix Heritage Society. Our goal is not only to save the history of Unix but also to collect and curate these old systems and, where possible, bring them back to life. With help from many talented members of this society, I was able to restore much of the old Unix software to working order, including Ritchie’s first C compiler from 1972 and the first Unix system to be written in C, dating from 1973.  
>  One holy grail that eluded us for a long time was the first edition of Unix in any form, electronic or otherwise. Then, in 2006, Al Kossow from the Computer History Museum, in Mountain View, Calif., unearthed a printed study of Unix dated 1972, which not only covered the internal workings of Unix but also included a complete assembly listing of the kernel, the main component of this operating system. This was an amazing find—like discovering an old Ford Model T collecting dust in a corner of a barn. But we didn’t just want to admire the chrome work from afar. We wanted to see the thing run again.  
>  In 2008, Tim Newsham, an independent programmer in Hawaii, and I assembled a team of like-minded Unix enthusiasts and set out to bring this ancient system back from the dead. The work was technically arduous and often frustrating, but in the end, we had a copy of the first edition of Unix running on an emulated PDP-11/20. We sent out messages announcing our success to all those we thought would be interested. Thompson, always succinct, simply replied, “Amazing.” Indeed, his brainchild was amazing, and I’ve been happy to do what I can to make it, and the story behind it, better known.
>
>

---

**Digital Ocean**  
[http://do.co/bsdnow](http://do.co/bsdnow)

\###[FreeBSD jails with a single public IP address](https://www.davd.eu/posts-freebsd-jails-with-a-single-public-ip-address/)

>
>
> Jails in FreeBSD provide a simple yet flexible way to set up a proper server layout. In the most setups the actual server only acts as the host system for the jails while the applications themselves run within those independent containers. Traditionally every jail has it’s own IP for the user to be able to address the individual services. But if you’re still using IPv4 this might get you in trouble as the most hosters don’t offer more than one single public IP address per server.
>
>

* Create the internal network

>
>
> In this case NAT (“Network Address Translation”) is a good way to expose services in different jails using the same IP address.  
>  First, let’s create an internal network (“NAT network”) at 192.168.0.0/24. You could generally use any private IPv4 address space as specified in RFC 1918. Here’s an overview: [https://en.wikipedia.org/wiki/Private\_network](https://en.wikipedia.org/wiki/Private_network). Using pf, FreeBSD’s firewall, we will map requests on different ports of the same public IP address to our individual jails as well as provide network access to the jails themselves.  
>  First let’s check which network devices are available. In my case there’s em0 which provides connectivity to the internet and lo0, the local loopback device.
>
>

```
  options=209b<RXCSUM,TXCSUM,VLAN_MTU,VLAN_HWTAGGING,VLAN_HWCSUM,WOL_MAGIC>
  [...]
  inet 172.31.1.100 netmask 0xffffff00 broadcast 172.31.1.255
  nd6 options=23<PERFORMNUD,ACCEPT_RTADV,AUTO_LINKLOCAL>
  media: Ethernet autoselect (1000baseT <full-duplex>)
  status: active

lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> metric 0 mtu 16384
  options=600003<RXCSUM,TXCSUM,RXCSUM_IPV6,TXCSUM_IPV6>
  inet6 ::1 prefixlen 128
  inet6 fe80::1%lo0 prefixlen 64 scopeid 0x2
  inet 127.0.0.1 netmask 0xff000000
  nd6 options=21<PERFORMNUD,AUTO_LINKLOCAL>```

> For our internal network, we create a cloned loopback device called lo1. Therefore we need to customize the /etc/rc.conf file, adding the following two lines:

```cloned_interfaces="lo1"
ipv4_addrs_lo1="192.168.0.1-9/29"```

> This defines a /29 network, offering IP addresses for a maximum of 6 jails:

```ipcalc 192.168.0.1/29
Address:   192.168.0.1          11000000.10101000.00000000.00000 001
Netmask:   255.255.255.248 = 29 11111111.11111111.11111111.11111 000
Wildcard:  0.0.0.7              00000000.00000000.00000000.00000 111
=>
Network:   192.168.0.0/29       11000000.10101000.00000000.00000 000
HostMin:   192.168.0.1          11000000.10101000.00000000.00000 001
HostMax:   192.168.0.6          11000000.10101000.00000000.00000 110
Broadcast: 192.168.0.7          11000000.10101000.00000000.00000 111
Hosts/Net: 6                     Class C, Private Internet```

> Then we need to restart the network. Please be aware of currently active SSH sessions as they might be dropped during restart. It’s a good moment to ensure you have KVM access to that server ;-)

```service netif restart```

> After reconnecting, our newly created loopback device is active:

```lo1: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> metric 0 mtu 16384
  options=600003<RXCSUM,TXCSUM,RXCSUM_IPV6,TXCSUM_IPV6>
  inet 192.168.0.1 netmask 0xfffffff8
  inet 192.168.0.2 netmask 0xffffffff
  inet 192.168.0.3 netmask 0xffffffff
  inet 192.168.0.4 netmask 0xffffffff
  inet 192.168.0.5 netmask 0xffffffff
  inet 192.168.0.6 netmask 0xffffffff
  inet 192.168.0.7 netmask 0xffffffff
  inet 192.168.0.8 netmask 0xffffffff
  inet 192.168.0.9 netmask 0xffffffff
  nd6 options=29<PERFORMNUD,IFDISABLED,AUTO_LINKLOCAL>```

+ Setting up

> pf part of the FreeBSD base system, so we only have to configure and enable it. By this moment you should already have a clue of which services you want to expose. If this is not the case, just fix that file later on. In my example configuration, I have a jail running a webserver and another jail running a mailserver:

 +  Public IP address
```IP_PUB="1.2.3.4"```

 +  Packet normalization
```scrub in all```

 +  Allow outbound connections from within the jails
```nat on em0 from lo1:network to any -> (em0)```

 +  webserver jail at 192.168.0.2
```rdr on em0 proto tcp from any to $IP_PUB port 443 -> 192.168.0.2```

 + just an example in case you want to redirect to another port within your jail
```rdr on em0 proto tcp from any to $IP_PUB port 80 -> 192.168.0.2 port 8080```

 + mailserver jail at 192.168.0.3
```rdr on em0 proto tcp from any to $IP_PUB port 25 -> 192.168.0.3```
```rdr on em0 proto tcp from any to $IP_PUB port 587 -> 192.168.0.3```
```rdr on em0 proto tcp from any to $IP_PUB port 143 -> 192.168.0.3```
```rdr on em0 proto tcp from any to $IP_PUB port 993 -> 192.168.0.3```

> Now just enable pf like this (which is the equivalent of adding pf_enable=YES to /etc/rc.conf):

```sysrc pf_enable="YES"```

> and start it:

```service pf start```

+ Install ezjail

> Ezjail is a collection of scripts by erdgeist that allow you to easily manage your jails.

```pkg install ezjail```

> As an alternative, you could install ezjail from the ports tree. Now we need to set up the basejail which contains the shared base system for our jails. In fact, every jail that you create get’s will use that basejail to symlink directories related to the base system like /bin and /sbin. This can be accomplished by running

```ezjail-admin install```

> In the next step, we’ll copy the /etc/resolv.conf file from our host to the newjail, which is the template for newly created jails (the parts that are not provided by basejail), to ensure that domain resolution will work properly within our jails later on:

```cp /etc/resolv.conf /usr/jails/newjail/etc/```

> Last but not least, we enable ezjail and start it:

```sysrc ezjail_enable="YES"```
```service ezjail start```

+ Create a jail

> Creating a jail is as easy as it could probably be:

```ezjail-admin create webserver 192.168.0.2```
```ezjail-admin start webserver```

> Now you can access your jail using:

```ezjail-admin console webserver```

> Each jail contains a vanilla FreeBSD installation.

+ Deploy services

> Now you can spin up as many jails as you want to set up your services like web, mail or file shares. You should take care not to enable sshd within your jails, because that would cause problems with the service’s IP bindings. But this is not a problem, just SSH to the host and enter your jail using ezjail-admin console.
***

###[EuroBSDcon 2018 Talks & Schedule](https://2018.eurobsdcon.org/talks-schedule/)
***

##News Roundup
###[OpenBSD on an iBook G4](https://bobstechsite.com/openbsd-on-an-ibook-g4/)
> I've mentioned on social media and on the BTS podcast a few times that I wanted to try installing OpenBSD onto an old "snow white" iBook G4 I acquired last summer to see if I could make it a useful machine again in the year 2018.  This particular eBay purchase came with a 14" 1024x768 TFT screen, 1.07GHz PowerPC G4 processor, 1.5GB RAM, 100GB of HDD space and an ATI Radeon 9200 graphics card with 32 MB of SDRAM. The optical drive, ethernet port, battery & USB slots are also fully-functional. The only thing that doesn't work is the CMOS battery, but that's not unexpected for a device that was originally released in 2004.

+ Initial experiments

> This iBook originally arrived at my door running Apple Mac OSX Leopard and came with the original install disk, the iLife & iWork suites for 2008, various instruction manuals, a working power cable and a spare keyboard. As you'll see in the pictures I took for this post the characters on the buttons have started to wear away from 14 years of intensive use, but the replacement needs a very good clean before I decide to swap it in!

> After spending some time exploring the last version of OSX to support the IBM PowerPC processor architecture I tried to see if the hardware was capable of modern computing with Linux. Something I knew ahead of trying this was that the WiFi adapter was unlikely to work because it's a highly proprietary component designed by Apple to work specifically with OSX and nothing else, but I figured I could probably use a wireless USB dongle later to get around this limitation.

> Unfortunately I found that no recent versions of mainstream Linux distributions would boot off this machine. Debian has dropped support 32-bit PowerPC architectures and the PowerPC variants of Ubuntu 16.04 LTS (vanilla, MATE and Lubuntu) wouldn't even boot the installer! The only distribution I could reliably install on the hardware was Lubuntu 14.04 LTS.

> Unfortunately I'm not the biggest fan of the LXDE desktop for regular work and a lot of ported applications were old and broken because it clearly wasn't being maintained by people that use the hardware anymore. Ubuntu 14.04 is also approaching the end of its support life in early 2019, so this limited solution also has a limited shelf-life.

+ Over to BSD

> I discussed this problem with a few people on Mastodon and it was pointed out to me that OSX is built on the Darwin kernel, which happens to be a variant of BSD. NetBSD and OpenBSD fans in particular convinced me that their communities still saw the value of supporting these old pieces of kit and that I should give BSD a try.

> So yesterday evening I finally downloaded the "macppc" version of OpenBSD 6.3 with no idea what to expect. I hoped for the best but feared the worst because my last experience with this operating system was trying out PC-BSD in 2008 and discovering with disappointment that it didn't support any of the hardware on my Toshiba laptop.

> When I initially booted OpenBSD I was a little surprised to find the login screen provided no visual feedback when I typed in my password, but I can understand the security reasons for doing that. The initial desktop environment that was loaded was very basic. All I could see was a console output window, a terminal and a desktop switcher in the X11 environment the system had loaded.

> After a little Googling I found this blog post had some fantastic instructions to follow for the post-installation steps: https://sohcahtoa.org.uk/openbsd.html. I did have to adjust them slightly though because my iBook only has 1.5GB RAM and not every package that page suggests is available on macppc by default. You can see a full list here: https://ftp.openbsd.org/pub/OpenBSD/6.3/packages/powerpc/.

+ Final thoughts

> I was really impressed with the performance of OpenBSD's "macppc" port. It boots much faster than OSX Leopard on the same hardware and unlike Lubuntu 14.04 it doesn't randomly hang for no reason or crash if you launch something demanding like the GIMP.

> I was pleased to see that the command line tools I'm used to using on Linux have been ported across too. OpenBSD also had no issues with me performing basic desktop tasks on XFCE like browsing the web with NetSurf, playing audio files with VLC and editing images with the GIMP. Limited gaming is also theoretically possible if you're willing to build them (or an emulator) from source with SDL support.

> If I wanted to use this system for heavy duty work then I'd probably be inclined to run key applications like LibreOffice on a Raspberry Pi and then connect my iBook G4 to those using VNC or an SSH connection with X11 forwarding. BSD is UNIX after all, so using my ancient laptop as a dumb terminal should work reasonably well.

> In summary I was impressed with OpenBSD and its ability to breathe new life into this old Apple Mac. I'm genuinely excited about the idea of trying BSD with other devices on my network such as an old Asus Eee PC 900 netbook and at least one of the many Raspberry Pi devices I use. Whether I go the whole hog and replace Fedora on my main production laptop though remains to be seen!

***

###[The template user with PAM and login(1)](http://oshogbo.vexillium.org/blog/48)
> When you build a new service (or an appliance) you need your users to be able to configure it from the command line. To accomplish this you can create system accounts for all registered users in your service and assign them a special login shell which provides such limited functionality. This can be painful if you have a dynamic user database.
> Another challenge is authentication via remote services such as RADIUS. How can we implement  services when we authenticate through it and log into it as a different user? Furthermore, imagine a scenario when RADIUS decides on which account we have the right to access by sending an additional attribute.
> To address these two problems we can use a "template" user. Any of the PAM modules can set the value of the PAM_USER item. The value of this item will be used to determine which account we want to login. Only the "template" user must exist on the local password database, but the credential check can be omitted by the module.
> This functionality exists in the login(1) used by FreeBSD, HardenedBSD, DragonFlyBSD and illumos. The functionality doesn't exist in the login(1) used in NetBSD, and OpenBSD doesn't support PAM modules at all. In addition what  is also noteworthy is that such functionality was also in the OpenSSH but they decided to remove it and call it a security vulnerability (CVE 2015-6563). I can see how some people may have seen it that way, that’s why I recommend reading this article from an OpenPAM author and a FreeBSD security officer at the time.
> Knowing the background let's take a look at an example.

```PAM_EXTERN int
pam_sm_authenticate(pam_handle_t *pamh, int flags __unused,
    int argc __unused, const char *argv[] __unused)
{
        const char *user, *password;
        int err;

        err = pam_get_user(pamh, &user, NULL);
        if (err != PAM_SUCCESS)
                return (err);

        err = pam_get_authtok(pamh, PAM_AUTHTOK, &password, NULL);
        if (err == PAM_CONV_ERR)
                return (err);
        if (err != PAM_SUCCESS)
                return (PAM_AUTH_ERR);

        err = authenticate(user, password);
        if (err != PAM_SUCCESS) {
                return (err);
        }

        return (pam_set_item(pamh, PAM_USER, "template"));
}

```

>
>
> In the listing above we have an example of a PAM module. The pam\_get\_user(3) provides a username. The pam\_get\_authtok(3) shows us a secret given by the user. Both functions allow us to give an optional prompt which should be shown to the user. The authenticate function is our crafted function which authenticates the user. In our first scenario we wanted to keep all users in an external database. If authentication is successful we then switch to a template user which has a shell set up for a script allowing us to configure the machine. In our second scenario the authenticate function authenticates the user in RADIUS.
>
>

>
>
> Another step is to add our PAM module to the /etc/pam.d/system or to the /etc/pam.d/login configuration:
>
>

`auth sufficient pam_template.so no_warn allow_local`

>
>
> Unfortunately the description of all these options goes beyond this article - if you would like to know more about it you can find them in the PAM manual. The last thing we need to do is to add our template user to the system which you can do by the adduser(8) command or just simply modifying the /etc/master.passwd file and use pwd\_mkdb(8) program:
>
>

`$ tail -n /etc/master.passwd`  
`template:*:1000:1000::0:0:User &:/:/usr/local/bin/templatesh`  
`$ sudo pwd_mkdb /etc/master.passwd`

>
>
> As you can see,the template user can be locked and we still can use it in our PAM module (the \* character after login).  
>  I would like to thank Dag-Erling Smørgrav for pointing this functionality out to me when I was looking for it some time ago.
>
>

---

**iXsystems**  
[iXsystems @ VMWorld](https://www.ixsystems.com/blog/vmworld2018-countdown/)

\###[ZFS file server](https://aravindh.net/posts/zfs_fileserver/)

* What is the need?

>
>
> At work, we run a compute cluster that uses an Isilon cluster as primary NAS storage. Excluding snapshots, we have about 200TB of research data, some of them in compressed formats, and others not. We needed an offsite backup file server that would constantly mirror our primary NAS and serve as a quick recovery source in case of a data loss in the the primary NAS. This offsite file server would be passive - will never face the wrath of the primary cluster workload.  
>  In addition to the role of a passive backup server, this solution would take on some passive report generation workloads as an ideal way of offloading some work from the primary NAS. The passive work is read-only.  
>  The backup server would keep snapshots in a best effort basis dating back to 10 years. However, this data on this backup server would be archived to tapes periodically.
>
>

* A simple guidance of priorities:

* Data integrity \> Cost of solution \> Storage capacity \> Performance.

* Why not enterprise NAS? NetApp FAS or EMC Isilon or the like?

>
>
> We decided that enterprise grade NAS like NetAPP FAS or EMC Isilon are prohibitively expensive and an overkill for our needs.  
>  An open source & cheaper alternative to enterprise grade filesystem with the level of durability we expect turned up to be ZFS. We’re already spoilt from using snapshots by a clever Copy-on-Write Filesystem(WAFL) by NetApp. ZFS providing snapshots in almost identical way was a big influence in the choice. This is also why we did not consider just a CentOS box with the default XFS filesystem.
>
>

* FreeBSD vs Debian for ZFS

>
>
> This is a backup server, a long-term solution. Stability and reliability are key requirements. ZFS on Linux may be popular at this time, but there is a lot of churn around its development, which means there is a higher probability of bugs like this to occur. We’re not looking for cutting edge features here. Perhaps, Linux would be considered in the future.
>
>

* FreeBSD + ZFS

>
>
> We already utilize FreeBSD and OpenBSD for infrastructure services and we have nothing but praises for the stability that the BSDs have provided us. We’d gladly use FreeBSD and OpenBSD wherever possible.
>
>

* Okay, ZFS, but why not FreeNAS?

>
>
> IMHO, FreeNAS provides a integrated GUI management tool over FreeBSD for a novice user to setup and configure FreeBSD, ZFS, Jails and many other features. But, this user facing abstraction adds an extra layer of complexity to maintain that is just not worth it in simpler use cases like ours. For someone that appreciates the commandline interface, and understands FreeBSD enough to administer it, plain FreeBSD + ZFS is simpler and more robust than FreeNAS.
>
>

* Specifications
* Lenovo SR630 Rackserver
* 2 X Intel Xeon silver 4110 CPUs
* 768 GB of DDR4 ECC 2666 MHz RAM
* 4 port SAS card configured in passthrough mode(JBOD)
* Intel network card with 10 Gb SFP+ ports
* 128GB M.2 SSD for use as boot drive
* 2 X HGST 4U60 JBOD
* 120(2 X 60) X 10TB SAS disks

---

\###[Reflection on one-year usage of OpenBSD](https://nanxiao.me/en/reflection-on-one-year-usage-of-openbsd/)

>
>
> I have used OpenBSD for more than one year, and it is time to give a summary of the experience:
>
>

* (1) What do I get from OpenBSD?

>
>
> a) A good UNIX tutorial. When I am curious about some UNIXcommands’ implementation, I will refer to OpenBSD source code, and I actually gain something every time. E.g., refresh socket programming skills from nc; know how to process file efficiently from cat.
>
>

>
>
> b) A better test bed. Although my work focus on developing programs on Linux, I will try to compile and run applications on OpenBSD if it is possible. One reason is OpenBSD usually gives more helpful warnings. E.g., hint like this:
>
>

`......`  
`warning: sprintf() is often misused, please use snprintf()`  
`......`

>
>
> Or you can refer this post which I wrote before. The other is sometimes program run well on Linux may crash on OpenBSD, and OpenBSD can help you find hidden bugs.
>
>

>
>
> c) Some handy tools. E.g. I find tcpbench is useful, so I ported it into Linux for my own usage (project is here).
>
>

* (2) What I give back to OpenBSD?

>
>
> a) Patches. Although most of them are trivial modifications, they are still my contributions.
>
>

>
>
> b) Write blog posts to share experience about using OpenBSD.
>
>

>
>
> c) Develop programs for OpenBSD/\*BSD: lscpu and free.
>
>

>
>
> d) Porting programs into OpenBSD: E.g., I find google/benchmark is a nifty tool, but lacks OpenBSD support, I submitted PR and it is accepted. So you can use google/benchmark on OpenBSD now.
>
>

* Generally speaking, the time invested on OpenBSD is rewarding. If you are still hesitating, why not give a shot?

---

\##Beastie Bits

* [BSD Users Stockholm Meetup](https://www.meetup.com/BSD-Users-Stockholm/events/253447019/)
* [BSDCan 2018 Playlist](https://www.youtube.com/playlist?list=PLeF8ZihVdpFfkICtA2HFsZecdC28_mrQh)
* [OPNsense 18.7 released](https://forum.opnsense.org/index.php?PHPSESSID=hvuv2kg4js2nlfpm73ut5ro8p2&topic=9280.0)
* [Testing TrueOS (FreeBSD derivative) on real hardware ThinkPad T410](https://youtu.be/WLgdJwd5zcQ)
* [Kernel Hacker Wanted!](https://lists.freebsd.org/pipermail/freebsd-jobs/2018-July/000946.html)
* [Replace a pair of 8-bit writes to VGA memory with a single 16-bit write](https://svnweb.freebsd.org/changeset/base/337411)
* [Reduce taskq and context-switch cost of zio pipe](https://svnweb.freebsd.org/changeset/base/337229)
* [Proposed FreeBSD Memory Management change, expected to improve ZFS ARC interactions](https://reviews.freebsd.org/D16606)

---

**Tarsnap**

\##Feedback/Questions

* Anian\_Z - [Question](http://dpaste.com/093FC8R#wrap)
* Robert - [Pool question](http://dpaste.com/0GG7Q2A#wrap)
* Lain - [Congratulations](http://dpaste.com/2BWPX9C)
* Thomas - [L2arc](http://dpaste.com/25NGAP3#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---