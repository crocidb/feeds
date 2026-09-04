+++
title = "202: Brokering Bind"
description = "We look at an OpenBSD setup on a new laptop, revel in BSDCan trip reports, and visit daemons and friendly ninjas.This episode was brought to you byiXsystems - Enterprise Servers and Storage for Open Source[![DigitalOc"
date = "2017-07-12T12:00:00Z"
url = "https://www.bsdnow.tv/202"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.877148353Z"
seen = true
+++

We look at an OpenBSD setup on a new laptop, revel in BSDCan trip reports, and visit daemons and friendly ninjas.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [OpenBSD and the modern laptop](http://bsdly.blogspot.de/2017/07/openbsd-and-modern-laptop.html) ###

* Peter Hansteen has a new blog post about [OpenBSD](http://www.openbsd.org/) on laptops:

>
>
> Did you think that OpenBSD is suitable only for firewalls and high-security servers? Think again. Here are my steps to transform a modern mid to high range laptop into a useful Unix workstation with OpenBSD.  
>  One thing that never ceases to amaze me is that whenever I'm out and about with my primary laptop at conferences and elsewhere geeks gather, a significant subset of the people I meet have a hard time believing that my laptop runs OpenBSD, and that it's the only system installed.  
>  and then it takes a bit of demonstrating that yes, the graphics runs with the best available resolution the hardware can offer, the wireless network is functional, suspend and resume does work, and so forth. And of course, yes, I do use that system when writing books and articles too. Apparently heavy users of other free operating systems do not always run them on their primary workstations.
>
>

* Peter goes on to describe the laptops he’s had over the years (all running OpenBSD) and after BSDCan 2017, he needed a new one due to cracks in the display.

>
>
> So the time came to shop around for a replacement. After a bit of shopping around I came back to Multicom, a small computers and parts supplier outfit in rural Åmli in southern Norway, the same place I had sourced the previous one.  
>  One of the things that attracted me to that particular shop and their own-branded offerings is that they will let you buy those computers with no operating system installed. That is of course what you want to do when you source your operating system separately, as we OpenBSD users tend to do.  
>  The last time around I had gone for a "Thin and lightweight" 14 inch model (Thickness 20mm, weight 2.0kg) with 16GB RAM, 240GB SSD for system disk and 1TB HD for /home (since swapped out for a same-size SSD, as the dmesg will show).   
>  Three years later, the rough equivalent with some added oomph for me to stay comfortable for some years to come ended me with a 13.3 inch model, 18mm and advertised as 1.3kg (but actually weighing in at 1.5kg, possibly due to extra components), 32GB RAM, 512GB SSD and 2TB harddisk. For now the specification can be viewed online [here](https://www.multicom.no/systemconfigurator.aspx?q=st:10637291;c:100559;fl:0#4091-10500502-1;4086-10637290-1;4087-8562157-2;4088-9101982-1;4089-9101991-1) (the site language is Norwegian, but product names and units of measure are not in fact different).  
>  The OpenBSD installer is a wonder of straightforward, no-nonsense simplicity that simply gets the job done. Even so, if you are not yet familiar with OpenBSD, it is worth spending some time reading the OpenBSD FAQ's installation guidelines and the INSTALL.platform file (in our case, INSTALL.amd64) to familiarize yourself with the procedure. If you're following this article to the letter and will be installing a snapshot, it is worth reading the notes on following -current too.  
>  The main hurdle back when I was installing the 2014-vintage 14" model was getting the system to consider the SSD which showed up as sd1 the automatic choice for booting (I solved that by removing the MBR, setting the size of the MBR on the hard drive that showed up as sd0 to 0 and enlarging the OpenBSD part to fill the entire drive).
>
>
>
> * He goes on to explain the choices he made in the installer and settings made after the reboot to set up his work environment. Peter closes with: If you have any questions on running OpenBSD as a primary working environment, I'm generally happy to answer but in almost all cases I would prefer that you use the mailing lists such as [misc@openbsd.org](mailto:misc@openbsd.org) or the [OpenBSD Facebook](https://www.facebook.com/groups/2210554563/) group so the question and hopefully useful answers become available to the general public. Browsing the slides for my recent [OpenBSD and you](https://home.nuug.no/~peter/openbsd_and_you/) user group talk might be beneficial if you're not yet familiar with the system. And of course, comments on this article are welcome. \*\*\*
>
>

### [BSDCan 2017 Trip Report: Roller Angel](https://www.freebsdfoundation.org/blog/2017-bsdcan-trip-report-roller-angel/) ###

* We could put this into next week’s show, because we have another trip report already that’s quite long.

>
>
> After dropping off my luggage, I headed straight over to the Goat BoF which took place at The Royal Oak. There were already a number of people there engaged in conversation with food and drink. I sat down at a table and was delighted that the people sitting with me were also into the BSD’s and were happy to talk about it the whole time. I felt right at home from the start as people were very nice to me, and were interested in what I was working on. I honestly didn’t know that I would fit in so well.  
>  I had a preconceived notion that people may be a bit hard to approach as they are famous and so technically advanced. At first, people seemed to only be working in smaller circles. Once you get more familiar with the faces, you realize that these circles don’t always contain the same people and that they are just people talking about specific topics. I found that it was easy to participate in the conversation and also found out that people are happy to get your feedback on the subject as well.  
>  I was actually surprised how easily I got along with everyone and how included I felt in the activities. I volunteered to help wherever possible and got to work on the video crew that recorded the audio and slides of the talks. The people at BSDCan are incredibly easy to talk to, are actually interested in what you’re doing with BSD, and what they can do to help. It’s nice to feel welcome in the community. It’s like going home. Dan mentioned in his welcome on the first day of BSDCan that the conference is like home for many in the community.
>
>

* The trip report is very detailed and chronicles the two days of the developer summit, and the two days of the conference

>
>
> There was some discussion about a new code of conduct by Benno Rice who mentioned that people are welcome to join a body of people that is forming that helps work out issues related to code of conduct and forwards their recommendations on to core. Next, Allan introduced the idea of creating a process for formally discussing big project changes or similar discussions that is going to be known as FCP or FreeBSD Community Proposal. In Python we have the Python Enhancement Proposal or PEP which is very similar to the idea of FCP. I thought this idea is a great step for FreeBSD to be implementing as it has been a great thing for Python to have.  
>  There was some discussion about taking non-code contributions from people and how to recognize those people in the project. There was a suggestion to have a FreeBSD Member status created that can be given to people whose non-code contributions are valuable to the project. This idea seemed to be on a lot of people’s minds as something that should be in place soon. The junior jobs on the FreeBSD Wiki were also brought up as a great place to look for ideas on how to get involved in contributing to FreeBSD.
>
>

* Roller wasted no time, and started contributing to EdgeBSD at the conference.

>
>
> On the first day of BSDCan I arrived at the conference early to coordinate with the team that records the talks. We selected the rooms that each of us would be in to do the recording and set up a group chat via WhatsApp for coordination.
>
>

* Thanks to Roller, Patrick McAvoy, Calvin Hendryx-Parker, and all of the others who volunteered their time to run the video and streaming production at BSDCan, as well as all others who volunteered, even if it was just to carry a box. BSDCan couldn’t happen without the army of volunteers.

>
>
> After the doc lounge, I visited the Hacker Lounge. There were already several tables full of people talking and working on various projects. In fact, there was a larger group of people who were collaborating on the new libtrue library that seemed to be having a great time. I did a little socializing and then got on my laptop and did some more work on the documentation using my new skills. I really enjoyed having a hacker lounge to go to at night.  
>  I want to give a big thank you to the FreeBSD Foundation for approving my travel grant. It was a great experience to meet the community and participate in discussions. I’m very grateful that I was able to attend my first BSDCan. After visiting the doc lounge a few times, I managed to get comfortable using the tools required to edit the documentation. By the end of the conference, I had submitted two documentation patches to the FreeBSD Bugzilla with several patches still in progress. Prior to the conference I expected that I would be spending a lot of time working on my Onion Omega and Edge Router Lite projects that I had with me, but I actually found that there was always something fun going on that I would rather do or work on. I can always work on those projects at home anyway. I had a good time working with the FreeBSD community and will continue working with them by editing the documentation and working with Bugzilla.
>
>

* One of the things I enjoy about these trip reports is when they help convince other people to make the trip to their first conference. Hopefully by sharing their experience, it will convince you to come to the next conference:
  * vBSDCon in Virginia, USA: Sept 7-9
  * EuroBSDCon in Paris, France: Sept 21-24
  * BSDTW in Taipei, Taiwan: November 11-12 (CFP ends July 31st) \*\*\*

### [BSDCan 2017 - Trip report double-p](http://undeadly.org/cgi?action=article&sid=20170629150641) ###

* Prologue

>
>
> Most overheard in Tokyo was "see you in Ottawaaaaah", so with additional "personal item" being Groff I returned home to plan the trip to BSDCan.  
>  Dan was very helpful with getting all the preparations (immigration handling), thanks for that. Before I could start, I had to fix something: the handling of the goat. With a nicely created harness, I could just hang it along my backpack.  
>  Done that it went to the airport of Hamburg and check-in for an itinerary of HAM-MUC-YUL. While the feeder leg was a common thing, boarding to YUL was great - cabin-crew likes Groff :)  
>  Arriving in Montreal was like entering a Monsoon zone or something, sad! After the night the weather was still rain-ish but improving and i shuttled to Dorval VIARail station to take me to Ottawa (ever avoid AirCanada, right?). Train was late, but the conductor (or so) was nice to talk to - and wanted to know about Groff's facebook page :-P.  
>  Picking a cab in Ottawa to take me to "Residence" was easy at first - just that it was the wrong one. Actually my fault and so I had a "nice, short" walk to the actual one in the rain with wrong directions. Eventually I made it and after unpacking, refreshment it was time to hit the Goat BOF!
>
>

* Day 1

>
>
> Since this was my first BSDCan I didnt exactly knew what to expect from this BOF. But it was like, we (Keeper, Dan, Allan, ..) would talk about "who's next" and things like that. How mistaken I was :). Besides the sheer amount of BSD people entering the not-so-yuuge Oak some Dexter sneaked in camouflage. The name-giver got a proper position to oversee the mess and I was glad I did not leave him behind after almost too many Creemores.
>
>

* Day 2

>
>
> Something happened it's crystal blue on the "roof" and sun is trying its best to wake me up. To start the day, I pick breakfast at 'Father+Sons' - I can really recommend that. Very nice home made fries (almost hashbrowns) and fast delivery! Stuffed up I trott along to get to phessler's tutorial about BGP-for-sysadmins-and-developers.  
>  Peter did a great job, but the "lab" couldn't happen, since - oh surprise - the wifi was sluggish as hell. Must love the first day on a conference every time.  
>  Went to Hackroom in U90 afterwards, just to fix stuff "at home". IPsec giving pains again.  
>  Time to pick food+beer afterwards and since it's so easy to reach, we went to the Oak again. Having a nice backyard patio experience it was about time to meet new people. Cheers to Tom, Aaron, Nick, Philip and some more, we'd an awesome night there. I also invited some not-really-computer local I know by other means who was completly overwhelmed by what kind of "nerds" gather around BSD. He planned to stay "a beer" - and it was rather some more and six hours. Looks like "we" made some impression on him :).
>
>

* Day 3

>
>
> Easy day, no tutorials at hand, so first picking up breakfast at F+S again and moving to hackroom in U90. Since I promised phessler to help with an localized lab-setup, I started to hack on a quick vagrant/ansible setup to mimic his BGP-lab and went quickly through most of it. Plus some more IPsec debugging and finally fixing it, we went early in the general direction of the Red Lion to pick our registration pack.  
>  But before that could happen it was called to have shawarma at 3brothers along. Given a tight hangover it wasn't the brightest idea to order a poutine m-(. Might be great the other day, it wasn't for me at the very time and had to throw away most of it :(. Eventually passing on to the Red Lion I made the next failure with just running into the pub - please stay at the front desk until "seated". I never get used to this concept.  
>  So after being "properly" seated, we take our beers and the registration can commence after we had half of it. So I register myself; btw it's a great idea to grant "not needed" stuff to charity. So dont pick "just because", think about it if you really need this or that gadget.  
>  Then I register Groff - he really needs badges - just to have Dru coming back to me some minutes later one to hand me the badge for Henning. That's just "amazing"; I dont know IF i want to break this vicious circle the other day, since it's so funny.  
>  Talked to Theo about the ongoing IPsec problems and he taught me about utrace(2) which looks "complicated" but might be an end of the story the other day. Also had a nice talk to Peter (H.) about some other ideas along books.  
>  BTW, did I pay for ongoing beers? I think Tom did - what a guy :).  
>  Arriving at the Residence, I had to find my bathroom door locked (special thing).. crazy thing is they dont have a master key at the venue, but to have to call in one from elsewhere.  
>  Short night shortened by another 30minutes :(.
>
>

* Day 4

>
>
> Weather is improving into beach+sun levels - and it's Conference Day! The opening keynote from Geist was very interesting ("citation needed"). Afterwards I went to zfs-over-ssh, nothing really new (sorry Allan). But then Jason had a super interesting talk on how about to apply BSD for the health-care system in Australia. I hope I can help him with the last bits (rdomain!) in the end.  
>  While lunch I tried to recall my memories about utrace(2) while talking to Theo.  
>  Then it was about to present my talk and I think it was well perceipted. One "not so good" feedback was about not taking the audience more into account. I think I was asking every other five slides or so - but, well. The general feedback (in spoken terms) was quite good. I was a bit "confused" and I did likely a better job in Tokyo, but well.  
>  Happened we ended up in the Oak again.. thanks to mwl, shirkdog, sng, pitrh, kurtm for having me there :)
>
>

* Day 5

>
>
> While the weather had to decide "what next", I rushed to the venue just to gather Reyk's talk about vmd(8). Afterwards it was MSTP from Paeps which was very interesting and we (OpenBSD) should look into it. Then happened BUG BOF and I invite all "coastal Germans" to cbug.de :)  
>  I had to run off for other reasons and came back to Dave's talk which was AWESOME.  
>  Following was Rod's talk.. well. While I see his case, that was very poor.  
>  The auction into closing was awesome again, and I spend $50 on a Tshirt. :)
>
>
>
> * Epilogue I *totally* got the exit dates wrong. So first cancel a booking of an Hotel and then rebook the train to YUL. So I have plenty of time "in the morning" to get breakfast with the local guy. After that he drives me to VIARail station and I dig into "business" cussions. Well, see you in Ottawa - or how about Paris, Taipei? \*\*\*
>
>

### [Bind Broker](http://www.tedunangst.com/flak/post/bind-broker) ###

* Ted Unangst writes about an interesting idea he has
* He has a single big server, and lots of users who would like to share it, many want to run web servers.

>
>
> This would be great, but alas, archaic decisions made long ago mean that network sockets aren’t really files and there’s this weird concept of privileged ports. Maybe we could assign each user a virtual machine and let them do whatever they want, but that seems wasteful. Think of the megabytes! Maybe we could setup nginx.conf to proxy all incoming connections to a process of the user’s choosing, but that only works for web sites and we want to be protocol neutral. Maybe we could use iptables, but nobody wants to do that.   
>  What we need is a bind broker. At some level, there needs to be some kind of broker that assigns IPs to users and resolves conflicts. It should be possible to build something of this nature given just the existing unix tools we have, instead of changing system design. Then we can deploy our broker to existing systems without upgrading or disrupting their ongoing operation. The bind broker watches a directory for the creation, by users, of unix domain sockets. Then it binds to the TCP port of the same name, and transfers traffic between them.  
>  A more complete problem specification is as follows. A top level directory, which contains subdirectories named after IP addresses. Each user is assigned a subdirectory, which they have write permission to. Inside each subdirectory, the user may create unix sockets named according to the port they wish to bind to. We might assign user alice the IP 10.0.0.5 and the user bob the IP 10.0.0.10. Then alice could run a webserver by binding to net/10.0.0.5/80 and bob could run a mail server by binding to net/10.0.0.10/25. This maps IP ownership (which doesn’t really exist in unix) to the filesystem namespace (which does have working permissions).
>
>

* So this will be a bit different than jails. The idea is to use filesystem permissions to control which users can bind to which IP addresses and ports

>
>
> The broker is responsible for watching each directory. As new sockets are created, it should respond by binding to the appropriate port. When a socket is deleted, the network side socket should be closed as well. Whenever a connection is accepted on the network side, a matching connection is made on the unix side, and then traffic is copied across.
>
>

* A full set of example code is provided

>
>
> There’s no completely portable way to watch a directory for changes. I’m using a kevent extension. Otherwise we might consider a timeout and polling with fstat, or another system specific interface (or an abstraction layer over such an interface). Otherwise, if one of our mappings is ready to read (accept), we have a new connection to handle.   
>  The first half is straightforward. We accept the connection and make a matching connect call to the unix side. Then I broke out the big cheat stick and just spliced the sockets together. In reality, we’d have to set up a read/copy/write loop for each end to copy traffic between them. That’s not very interesting to read though.   
>  The full code, below, comes in at 232 lines according to wc. Minus includes, blank lines, and lines consisting of nothing but braces, it’s 148 lines of stuff that actually gets executed by the computer. Add some error handling, and working read/write code, and 200 lines seems about right.
>
>

* A very interesting idea. I wonder about creating a virtual file system that would implement this and maybe do a bit more to fully flesh out this idea.
* What do you think? \*\*\*

News Roundup
----------

### [Daemons and friendly Ninjas](https://euroquis.nl/bobulate/?p=1600) ###

>
>
> There’s quite a lot of software that uses CMake as a (meta-)buildsystem. A quick count in the FreeBSD ports tree shows me 1110 ports (over a thousand) that use it. CMake generates buildsystem files which then direct the actual build — it doesn’t do building itself.  
>  There are multiple buildsystem-backends available: in regular usage, CMake generates Makefiles (and does a reasonable job of producing Makefiles that work for GNU Make and for BSD Make). But it can generate Ninja, or Visual Studio, and other buildsystem files. It’s quite flexible in this regard.  
>  Recently, the KDE-FreeBSD team has been working on Qt WebEngine, which is horrible. It contains a complete Chromium and who knows what else. Rebuilding it takes forever.  
>  But Tobias (KDE-FreeBSD) and Koos (GNOME-FreeBSD) noticed that building things with the Ninja backend was considerably faster for some packages (e.g. Qt WebEngine, and Evolution data-thingy). Tobias wanted to try to extend the build-time improvements to all of the CMake-based ports in FreeBSD, and over the past few days, this has been a success.  
>  Ports builds using CMake now default to using Ninja as buildsystem-backend.  
>  Here’s a bitty table of build-times. These are one-off build times, so hardly scientifically accurate — but suggestive of a slight improvement in build time.
>
>

```
Name        Size        GMake    Ninja
liblxt        50kB        0:32    0:31
llvm38        1655kB    *    19:43
musescore    47590kB    4:00    3:54
webkit2-gtk3    14652kB    44:29    37:40

```

>
>
> Or here’s a much more thorough table of results from tcberner@, who did 5 builds of each with and without ninja. I’ve cut out the raw data, here are just the average-of-five results, showing usually a slight improvement in build time with Ninja.
>
>

```
Name        av make    av ninj    Delta    D/Awo
compiler-rt    00:08        00:07    -00:01    -14%
openjpeg    00:06        00:07    +00:01    +17%
marble        01:57        01:43    -00:14    -11%
uhd        01:49        01:34    -00:15    -13%
opencacscade    04:08        03:23    -00:45    -18%
avidemux    03:01        02:49    -00:12    – 6%
kdevelop    01:43        01:33    -00:10    – 9%
ring-libclient    00:58        00:53    -00:05    – 8%

```

>
>
> Not everything builds properly with Ninja. This is usually due to missing dependencies that CMake does not discover; this shows up when foo depends on bar but no rule is generated for it. Depending on build order and speed, bar may be there already by the time foo gets around to being built. Doxygen showed this, where builds on 1 CPU core were all fine, but 8 cores would blow up occasionally.  
>  In many cases, we’ve gone and fixed the missing implicit dependencies in ports and upstreams. But some things are intractable, or just really need GNU Make. For this, the FreeBSD ports infrastructure now has a knob attached to CMake for switching a port build to GNU Make.
>
>
>
> Normal: USES=cmake  
>  Out-of-source: USES=cmake:outsource  
>  GNU Make: USES=cmake:noninja gmake  
>  OoS, GMake: USES=cmake:outsource,noninja gmake  
>  Bad: USES=cmake gmake
>
>
>
> For the majority of users, this has no effect, but for our package-building clusters, and for KDE-FreeBSD developers who build a lot of CMake-buildsystem software in a day it may add up to an extra coffee break. So I’ll raise a shot of espresso to friendship between daemons and ninjas.
>
>
> ---
>

### [Announcing the pkgsrc-2017Q2 release](http://mail-index.netbsd.org/pkgsrc-users/2017/07/10/msg025237.html) ###

* For the 2017Q2 release we welcome the following notable package additions and changes to the pkgsrc collection:
  * Firefox 54
  * GCC 7.1
  * MATE 1.18
  * Ruby 2.4
  * Ruby on Rails 4.2
  * TeX Live 2017
  * Thunderbird 52.1
  * Xen 4.8

* We say goodbye to:
  * Ruby 1.8
  * Ruby 2.1

* The following infrastructure changes were introduced:
  * Implement optional new pkgtasks and init infrastructure for pkginstall.
  * Various enhancements and fixes for building with ccache.
  * Add support to USE\_LANGUAGES for newer C++ standards.
  * Enhanced support for SSP, FORTIFY, and RELRO.
  * The GitHub mirror has migrated to [https://github.com/NetBSD/pkgsrc](https://github.com/NetBSD/pkgsrc)
  * In total, 210 packages were added, 43 packages were removed, and 1,780 package updates were processed since the pkgsrc-2017Q1 release. \*\*\*

### [OpenBSD changes of note 624](http://www.tedunangst.com/flak/post/openbsd-changes-of-note-624) ###

* There are a bunch, but here are a few that jump out:

  * Start plugging some leaks. Compile kernels with umask 007. Install them minus read permissions.
  * Pure preprocessor implementation of the roff .ec and .eo requests, though you are warned that very bad things will happen to anybody trying to use these macros in OpenBSD manuals.
  * Random linking for arm64. And octeon. And alpha. And hppa. There’s some variation by platform, because every architecture has the kernel loaded with different flavors of initial physical and virtual mappings. And landisk. And loongson. And sgi. And macppc. And a gap file for sparc64, but nobody yet dares split locore. And arm7.
  * Errata for perl File::Path race condition.
  * Some fixes for potential link attacks against cron.
  * Add pledge violations to acct reporting.
  * Take random linking to the next stage. More about KARL - kernel address randomized link. As noted, a few difficulties with hibernate and such, but the plan is coming together. Add a new function reorder\_kernel() that relinks and installs the new kernel in the background on system startup. Add support for the bootblocks to detect hibernate and boot the previous kernel.
  * Remove the poorly described “stuff” from ksh.
  * Replace usage of TIOCSTI in csh using a more common IO loop. Kind of like the stuff in ksh, but part of the default command line editing and parsing code, csh would read too many characters, then send the ones it didn’t like back into the terminal. Which is weird, right? Also, more importantly, eliminating the code that uses TIOCSTI to inject characters into ttys means that maybe TIOCSTI can be removed.
  * Revamp some of the authentication logging in ssh.
  * Add a verbose flag to rm so you can panic immediately upon seeing it delete the wrong file instead of waiting to discover your mistake after the fact.
  * Update libexpat to version 2.2.1 which has some security fixes. Never trust an expat, that’s my motto.
  * Update inteldrm to code based on Linux 4.4.70. This brings us support for Skylake and Cherryview and better support for Broadwell and Valleyview. Also adds MST support. Fun times for people with newish laptops. \*\*\*

### [OPNsense 17.1.9 released](https://opnsense.org/opnsense-17-1-9-released/) ###

* firewall: move gateway switching from system to firewall advanced settings
* firewall: keep category selection when changing tabs
* firewall: do not skip gateway switch parsing too early (contributed by Stephane Lesimple)
* interfaces: show VLAN description during edit
* firmware: opnsense-revert can now handle multiple packages at once
* firmware: opnsense-patch can now handle permission changes from patches
* dnsmasq: use canned –bogus-priv for no\_private\_reverse
* dnsmasq: separate log file, ACL and menu entries
* dynamic dns: fix update for IPv6 (contributed by Alexander Leisentritt)
* dynamic dns: remove usage of CURLAUTH\_ANY (contributed by Alexander Leisentritt)
* intrusion detection: suppress “fast mode available” boot warning in PCAP mode
* openvpn: plugin framework adaption
* unbound: add local-zone type transparent for PTR zone (contributed by Davide Gerhard)
* unbound: separate log file, ACL and menu entries
* wizard: remove HTML from description strings
* mvc: group relation to something other than uuid if needed
* mvc: rework “item in” for our Volt templates
* lang: Czech to 100% translated (contributed by Pavel Borecki)
* plugins: zabbix-agent 1.1 (contributed by Frank Wall)
* plugins: haproxy 1.16 (contributed by Frank Wall)
* plugins: acme-client 1.8 (contributed by Frank Wall)
* plugins: tinc fix for switch mode (contributed by Johan Grip)
* plugins: monit 1.3 (contributed by Frank Brendel)
* src: support dhclient supersede statement for option 54 (contributed by Fabian Kurtz)
* src: add Intel Atom Cherryview SOC HSUART support
* src: add the ID for the Huawei ME909S LTE modem
* src: HardenedBSD Stack Clash mitigations[1]
* ports: sqlite 3.19.3[2]
* ports: openvpn 2.4.3[3]
* ports: sudo 1.8.20p2[4]
* ports: dnsmasq 2.77[5]
* ports: openldap 2.4.45[6]
* ports: php 7.0.20[7]
* ports: suricata 3.2.2[8]
* ports: squid 3.5.26[9]
* ports: ca\_root\_nss 3.31
* ports: bind 9.11.1-P2[10]
* ports: unbound 1.6.3[11]
* ports: curl 7.54.1[12] \*\*\*

Beastie Bits
----------

* [Thinkpad x230 - trying to get TrackPoint / Touchpad working in X](http://lists.dragonflybsd.org/pipermail/users/2017-July/313519.html)
* [FreeBSD deprecates all r-cmds (rcp, rlogin, etc.)](http://marc.info/?l=freebsd-commits-all&m=149918307723723&w=2)
* [Bashfill - art for your terminal](https://max.io/bash.html)
* [Go 1.9 release notes: NetBSD support is broken, please help](https://github.com/golang/go/commit/32002079083e533e11209824bd9e3a797169d1c4)
* [Jest, A ReST api for creating and managing FreeBSD jails written in Go](https://github.com/altsrc-io/Jest) \*\*\*

Feedback/Questions
----------

* [John - zfs send/receive](http://dpaste.com/3ANETHW#wrap)
* [Callum - laptops](http://dpaste.com/11TV0BJ) & [An update](http://dpaste.com/3A14BQ6#wrap)
* [Lars - Snapshot of VM datadisk](http://dpaste.com/0MM37NA#wrap)
* [Daryl - Jail managers](http://dpaste.com/0CDQ9EK#wrap) \*\*\*