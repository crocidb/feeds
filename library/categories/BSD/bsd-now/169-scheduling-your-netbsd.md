+++
title = "169: Scheduling your NetBSD"
description = "On today’s episode, we are loaded and ready to go. Lots of OpenBSD news, a look at LetsEncrypt usage, the NetBSD scheduler (oh my) and much more. Keep it tuned to your place to B...SD!This episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Op"
date = "2016-11-23T13:00:00Z"
url = "https://www.bsdnow.tv/169"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.979358985Z"
seen = false
+++

On today’s episode, we are loaded and ready to go. Lots of OpenBSD news, a look at LetsEncrypt usage, the NetBSD scheduler (oh my) and much more. Keep it tuned to your place to B...SD!

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Production ready](http://www.tedunangst.com/flak/post/production-ready) ###

* Ted Unangst brings us a piece on what it means to be Production Ready
* He tells the story of a project he worked on that picked a framework that was “production ready”
* They tested time zones, and it all seemed to work
* They tested the unicode support in english and various european languages, and it was all good
* They sent some emails with it, and it just worked
* The framework said “Production Ready” on the tin, and it passed all the tests. What is the worst that could happen?

>
>
> Now, we built our product on top of this. Some of the bugs were caught internally. Others were discovered by customers, who were of course a little dismayed. Like, how could you possibly ship this? Indeed. We were doing testing, quite a bit really, but when every possible edge case has a bug, it’s hard to find them all.
>
>

* A customer from Arizona, which does not observe Daylight Saving Time, crashed the app
* Some less common unicode characters caused a buffer overflow
* The email system did not properly escape a period on its own line, truncating the email
* “Egregious performance because of a naive N<sup>2</sup> algorithm for growing a buffer.”
* “Egregious performance on some platforms due to using the wrong threading primitives.”
* “Bizarre database connection bugs for some queries that I can’t at all explain.”
* “In short, everything was “works for me” quality. But is that really production quality?”
* “There are some obvious contenders for the title of today’s most “production ready” software, but it’s a more general phenomenon. People who have success don’t know what they don’t know, what they didn’t test, what unused features will crash and burn.”

---

### [Using Let's Encrypt within FreeBSD.org](https://blog.crashed.org/letsencrypt-in-freebsd-org/) ###

>
>
> I decided to give Let's Encrypt certificates a shot on my personal web servers earlier this year after a disaster with StartSSL. I'd like to share what I've learned.
>
>
>
> The biggest gotcha is that people tend to develop bad habits when they only have to deal with certificates once a year or so. The beginning part of the process is manual and the deployment of certificates somehow never quite gets automated, or things get left out.
>
>
>
> That all changes with Let's Encrypt certificates. Instead of 1-5 year lifetime certificates the Let's Encrypt certificates are only valid for 90 days. Most people will be wanting to renew every 60-80 days. This forces the issue - you really need to automate and make it robust.
>
>
>
> The Let's Encrypt folks provide tools to do this for you for the common cases. You run it on the actual machine, it manages the certificates and adjusts the server configuration files for you. Their goal is to provide a baseline shake-n-bake solution. I was not willing to give that level of control to a third party tool for my own servers - and it was absolutely out of the question for for the FreeBSD.org cluster.
>
>
>
> I should probably mention that we do things on the FreeBSD.org cluster that many people would find a bit strange. The biggest problem that we have to deal with is that the traditional model of a firewall/bastion between "us" and "them" does not apply. We design for the assumption that hostile users are already on the "inside" of the network. The cluster is spread over 8 distinct sites with naked internet and no vpn between them. There is actually very little trust between the systems in this network - eg: ssh is for people only - no headless users can ssh. There are no passwords. Sudo can't be used. The command and control systems use signing. We don't trust anything by IPv4/IPv6 address because we have to assume MITM is a thing. And so on. In general, things are constructed to be trigger / polling / pull based.
>
>
>
> The downside is that this makes automation and integration of Let's Encrypt clients interesting. If server configuration files can't be modified; and replicated web infrastructure is literally read-only (via jails/nullfs); and DNS zone files are static; and headless users can't ssh and therefore cannot do commits, how do you do the verification tokens in an automated fashion? Interesting, indeed.
>
>
>
> We wanted to be able to use certificates on things like ldap and smtp servers. You can't do http file verification on those so we had to use dns validation of domains.
>
>

* First, a signing request is generated, and the acme-challenge is returned
* Peter’s post then walks through how the script adds the required TXT record to prove control of the domain, regenerates the zone file, DNSSEC signs it, and waits for it to be published, then continues the letsencrypt process.
* Letsencrypt then issues the actual certificate

>
>
> We export the fullchain files into a publication location. There is another jail that can read the fullchain certificates via nullfs and they are published with our non-secrets update mechanism
>
>
>
> Since we are using DNSSEC, here is a good opportunity to maintain signed TLSA fingerprints. The catch with TLSA record updates is managing the update event horizon. You are supposed to have both fingerprints listed across the update cycle. We use 'TLSA 3 1 1' records to avoid issues with propagation delays for now. TLSA 3 0 1 changes with every renewal, while 3 1 1 only changes when you generate a new private key.
>
>
>
> The majority of TLS/SSL servers require a full restart to re-load the certificates if the filename is unchanged. I found out the hard way.
>
>

* There is a great deal more detail in the blog post, I recommend you check it out

---

### Learning more about the NetBSD scheduler (... than I wanted to know) ###

* [Part 1](http://www.feyrer.de/NetBSD/bx/blosxom.cgi/nb_20161105_1754.html)
* [Part 2](http://www.feyrer.de/NetBSD/bx/blosxom.cgi/nb_20161109_0059.html)
* [Part 3](http://www.feyrer.de/NetBSD/bx/blosxom.cgi/nb_20161113_0122.html)

>
>
> Today I had a need to do some number crunching using a home-brewn C program. In order to do some manual load balancing, I was firing up some Amazon AWS instances (which is Xen) with NetBSD 7.0. In this case, the system was assigned two CPUs I started two instances of my program, with the intent to have each one use one CPU. Which is not what happened! Here is what I observed, and how I fixed things for now.
>
>

\~\~  
 load averages: 2.14, 2.08, 1.83; up 0+00:45:56 18:01:32  
 27 processes: 4 runnable, 21 sleeping, 2 on CPU  
 CPU0 states: 100% user, 0.0% nice, 0.0% system, 0.0% interrupt, 0.0% idle  
 CPU1 states: 0.0% user, 0.0% nice, 0.0% system, 0.0% interrupt, 100% idle  
 Memory: 119M Act, 7940K Exec, 101M File, 3546M Free  
 \~\~

\~\~  
 PID USERNAME PRI NICE SIZE RES STATE TIME WCPU CPU COMMAND  
 2791 root 25 0 8816K 964K RUN/0 16:10 54.20% 54.20% myprog  
 2845 root 26 0 8816K 964K RUN/0 17:10 47.90% 47.90% myprog  
 \~\~

>
>
> I expected something like WCPU and CPU being around 100%, assuming that each process was bound to its own CPU. The values I actually saw (and listed above) suggested that both programs were fighting for the same CPU. Huh?! NetBSD allows to create "processor sets", assign CPU(s) to them and then assign processes to the processor sets. Let's have a look!
>
>

\~\~  
 \# psrset -c  
 1  
 \# psrset -b 0 2791  
 \# psrset -b 1 2845  
 load averages: 2.02, 2.05, 1.94; up 0+00:59:32 18:15:08  
 27 processes: 1 runnable, 24 sleeping, 2 on CPU  
 CPU0 states: 100% user, 0.0% nice, 0.0% system, 0.0% interrupt, 0.0% idle  
 CPU1 states: 100% user, 0.0% nice, 0.0% system, 0.0% interrupt, 0.0% idle  
 Memory: 119M Act, 7940K Exec, 101M File, 3546M Free

```
  PID USERNAME PRI NICE   SIZE   RES STATE      TIME   WCPU    CPU COMMAND
 2845 root      25    0  8816K  964K CPU/1     26:14   100%   100% myprog
 2791 root      25    0  8816K  964K RUN/0     25:40   100%   100% myprog

```

\~\~

>
>
> Things are as expected now, with each program being bound to its own CPU. Now why this didn't happen by default is left as an exercise to the reader.
>
>
>
> I had another look at this today, and was able to reproduce the behaviour using VMWare Fusion with two CPU cores on both NetBSD 7.0\_STABLE as well as -current
>
>
>
> The one hint that I got so far was from Michael van Elst that there may be a rouding error in sched\_balance(). Looking at the code, there is not much room for a rounding error. But I am not familiar enough (at all) with the code, so I cannot judge if crucial bits are dropped here, or how that function fits in the whole puzzle.
>
>
>
> Pondering on the "rounding error", I've setup both VMs with 4 CPUs, and the behaviour shown there is that load is distributed to about 3 and a half CPU - three CPUs under full load, and one not reaching 100%. There's definitely something fishy in there.
>
>
>
> With multiple CPUs, each CPU has a queue of processes that are either "on the CPU" (running) or waiting to be serviced (run) on that CPU. Those processes count as "migratable" in runqueue\_t. Every now and then, the system checks all its run queues to see if a CPU is idle, and can thus "steal" (migrate) processes from a busy CPU. This is done in sched\_balance().
>
>
>
> Such "stealing" (migration) has the positive effect that the process doesn't have to wait for getting serviced on the CPU it's currently waiting on. On the other side, migrating the process has effects on CPU's data and instruction caches, so switching CPUs shouldn't be taken too easy.
>
>
>
> All in all, I'd say the patch is a good step forward from the current situation, which does not properly distribute pure CPU hogs, at all.
>
>

---

### [Building Cost-Effective 100-Gbps Firewalls for HPC with FreeBSD](https://www.nas.nasa.gov/SC16/demos/demo9.html) ###

>
>
> The continuous growth of the NASA Center for Climate Simulation (NCCS) requires providing high-performance security tools and enhancing the network capacity. In order to support the requirements of emerging services, including the Advanced Data Analytics Platform (ADAPT) private cloud, the NCCS security team has proposed an architecture to provide extremely cost-effective 100-gigabit-per-second (Gbps) firewalls.
>
>
>
> The aim of this project is to create a commodity-based platform that can process enough packets per second (pps) to sustain a 100-Gbps workload within the NCCS computational environment. The test domain consists of several existing systems within the NCCS, including switches (Dell S4084), routers (Dell R530s), servers (Dell R420s, and C6100s), and host card adapters (10-Gbps Mellanox ConnectX2 and Intel 8259 x Ethernet cards).
>
>
>
> Previous NCCS work testing the FreeBSD operating system for high-performance routing reached a maximum of 4 million pps. Building on this work, we are comparing FreeBSD-11.0 and FreeBSD-Current along with implementing the netmap-fwd Application Programming Interface (API) and tuning the 10-gigabit Ethernet cards. We used the tools iperf3, nuttcp, and netperf to monitor the performance of the maximum bandwidth through the cards. Additional testing has involved enabling the Common Address Redundancy Protocol (CARP) to achieve an active/active architecture.
>
>
>
> The tests have shown that at the optimally tuned and configured FreeBSD system, it is possible to create a system that can manage the huge amounts of pps needed to create a 100-Gbps firewall with commodity components.
>
>

* Some interesting findings:
  * FreeBSD was able to send more pps as a client than Centos 6.
  * Netmap-fwd increased the pps rate significantly.
  * The choice of network card can have a significant impact on pps, tuning, and netmap support.

>
>
> Further tests will continue verifying the above results with even more capable systems-such as 40-gigabit and 100-gigabit Ethernet cards-to achieve even higher performance. In addition to hardware improvements, updates to the network capabilities in the FreeBSD-Current version will be closely monitored and applied as appropriate. The final result will be a reference architecture with representative hardware and software that will enable the NCCS to build, deploy, and efficiently maintain extremely cost-effective 100-Gbps firewalls.
>
>
>
> Netflix has already managed to saturate a 100 Gbps interface using only a single CPU Socket (rather than a dual socket server). Forwarding/routing is a bit different, but it is definitely on track to get there. Using a small number of commodity servers to firewall 100 Gbps of traffic just takes some careful planning and load balancing. Soon it will be possible using a single host.
>
>

---

News Roundup
----------

### [iocell - A FreeBSD jail manager.](https://github.com/bartekrutkowski/iocell) ###

* Another jail manager has arrived on the scene, iocell, which begins life as a fork of the “classic” iocage.
* Due to its shared heritage, it offers much of the same functionality and flags as iocage users will be familiar with.
* For those who aren’t up to speed with either products, some of those features include:
  * Templates, clones, basejails, fully independent jails
  * Ease of use
  * Zero configuration files
  * Rapid thin provisioning within seconds
  * Automatic package installation
  * Virtual networking stacks (vnet)
  * Shared IP based jails (non vnet)
  * Resource limits (CPU, MEMORY, DISK I/O, etc.)
  * Filesystem quotas and reservations
  * Dedicated ZFS datasets inside jails
  * Transparent ZFS snapshot management
  * Binary updates
  * Differential jail packaging
  * Export and import
  * And many more!

* The program makes extensive use of ZFS for performing jail operations, so a zpool will be required (But doesn’t have to be your boot-pool)
* It still looks “very” fresh, even using original iocage filenames in the repo, so a safe guess is that you’ll be able to switch between iocage and iocell with relative ease.

---

### [Fail2ban on OpenBSD 6.0](http://blog.gordonturner.ca/2016/11/20/fail2ban-on-openbsd-6-0/) ###

* We’ve used Fail2Ban in PC-BSD before, due to it’s ability to detect and block brute force attempts against a variety of services, including SSH, mail, and others. It even can work to detect jail brute force attempts, blocking IPs on the hosts firewall.
* However what about OpenBSD users? Well, Gordon Turner comes to the rescue today with a great writeup on deploying Fail2Ban specifically for that platform.
* Now, Fail2Ban is a python program, so you’ll need to pkg install Python first, then he provides instructions on how to manually grab the F2B sources and install on OpenBSD.
* Helpfully Gordon gives us some handy links to scripts and modifications to get F2B running via RC as well, which is a bit different since F2B has both a server and client that must run together.
* With the installation bits out of the way, we get to next hit the “fun” stuff, which comes in the way of SSH brute force detection.
* Naturally we will be configuring F2B to use “pf” to do our actual blocking, but the examples shown give us full control over the knobs used to detect, and then ultimately call ‘pfctl’ to do our heavy lifting.
* The last bits of the article give us a runthrough on how to “prime” pf with the correct block tables and performing basic administrative tasks to control F2B in production.
* A great article, and if you run an OpenBSD box exposed to the internet, you may want to bookmark this one.

---

### [openbsd changes of note](http://www.tedunangst.com/flak/post/openbsd-changes-of-note) ###

* Continuing with our OpenBSD news for the week, we have a new blog post by TedU, which gives us a bunch of notes on the things which have changed over there as of late:
* Some of the notables include:

  * *mcl2k2 pools* and the *em conversion*. The details are in the commits, but the short story is that due to hardware limitations, a number of tradeoffs need to be made between performance and memory usage. The em chip can (mostly) only be programmed to write to 2k buffers. However, ethernet payloads are not nicely aligned. They’re two bytes off. Leading to a costly choice. Provide a 2k buffer, and then copy all the data after the fact, which is slow. Or allocate a larger than 2k buffer, and provide em with a pointer that’s 2 bytes offset. Previously, the next size up from 2k was 4k, which is quite wasteful. The new 2k2 buffer size still wastes a bit of memory, but much less.  

  * *FreeType 2.7 is prettier than ever*.
  * *vmm for i386*. *Improve security*. vmm is still running with a phenomenal set of privileges, but perhaps some cross-VM attacks may be limited. On the other side of the world, *hyperv support is getting better*.
  * *Remove setlocale*. setlocale was sprinkled all throughout the code base many years ago, even though it did nothing, in anticipation of a day when it would do something. We’ve since decided that day will never come, and so many setlocale calls can go.
  * *syspatch is coming*. Lots of commits actually. Despite the name, it’s more like a system update, since it replaces entire binaries. Then again, replacing a few binaries in a system is like patching small parts of the whole. A syspatch update will be smaller than an entire release.
  * *There’s a new build system*. It kind of works like before, but a lot of the details have changed to support less root. Actually, it’d be accurate to say the whole build privilege system has been flipped. Start as root, which drops down to the build user to do the heavy lifting, instead of starting as a user that can elevate to root at any time. This no longer requires the build user to be pseudo-root; in fact, the goal is that the build user can’t elevate.

* There’s several other items on this list, take a look for more details, and he also helpfully provides commit-links if you want to see more about any of these topics.

---

### [It came from Bell Labs](http://media.bemyapp.com/came-bell-labs/#) ###

* A little late for a halloween episode, we have “It came from Bell Labs”, a fascinating article talking about the successor to UNIX, Plan9

>
>
> There was once an operating system that was intended to be the successor to Unix. Plan 9 From Bell Labs was its name, and playing with it for five minutes is like visiting an alternate dimension where computers are done differently. It was so ahead of its time that it would be considered cutting edge, even today. Find out the weird and woolly history to Plan Nine’s inception and eventual consignment as a footnote of operating systems today.
>
>

* So, if you’ve never heard of Plan 9, how did it exactly differ from the UNIX we know and love today?

>
>
> Here’s just a few of the key features under Plan 9’s hood + 9P – The distributed file system protocol. Everything runs through this, there is no escaping it. Since everything runs on top of 9P, that makes everything running on a Plan 9 box distributed as well. This means, for example, you can import /dev/audio from another machine on the network to use its sound card when your own machine doesn’t have one. + ndb – The namespace server. In conjunction with 9P, it bosses all the programs around and forces them to comply to the Plan 9 way. + Instead of Unix sockets, all the networking just runs through 9P. Thus, everything from ethernet packets to network cards are all just one more kind of file. + While Unicode is implemented ad-hoc in other systems, it’s baked into Plan 9 from the first int main(). In fact, even users who don’t like Plan 9 have to admit that the character encoding support, together with the beautiful built-in rio font, makes every other operating system look primitive. + The system’s own internal programs are built to be a rounded set of user tools from the ground up. So, for instance, it comes with its own editor, acme, built to be its own weird morphing thing that plays nice with the 9P protocol.
>
>

* Sounds neat, but how did it work in the real world?

>
>
> The result was a mixture of both breathtaking efficiency and alienating other-worldliness. Trying out the system is like a visit to an alternate reality where time-traveling gremlins changed how computers are made and used. You can execute anycommand anywhere just by typing its name and middle-clicking on it, even in the middle of reading a file. You can type out your blog post in the middle of a man page and save it right there. Screenshots are made by pointing /dev/screen to a file. When you execute a program in a terminal, the terminal morphs into the program you launched instead of running in the background. The window manager, rio, can be invoked within rio to create an instance of itself running inside itself. You can just keep going like that, until, like Inception, you get lost in which layer you’re in. Get used to running Plan 9 long enough, and you will find yourself horribly ill-adapted for dealing with the normal world.
>
>
>
> While system administrators can’t stop praising it, the average home user won’t see much benefit unless they happen to run about eight desktop machines scattered all over. But to quote legendary hacker tribal bard Eric S. Raymond: “…Plan 9 failed simply because it fell short of being a compelling enough improvement on Unix to displace its ancestor.”
>
>

* A fascinating article, worth your time to read it through, even though we’ve pulled some of the best bits here. Nice look at the alternative dimension that could have been.

---

Beastie Bits
----------

* [inks -- Basically Reddit or Hacker News, but without the disagreeable trolls and military industrial complex shills downvoting everything to hide the truth](http://www.tedunangst.com/flak/post/inks)
* [“PAM is Un-American” talk now online](https://youtu.be/Mc2p6sx2s7k)
* [Reddit advertising of “PAM Mastery”](http://blather.michaelwlucas.com/archives/2818)
* [MeetBSD 2016 Report by Michael Dexter](https://www.ixsystems.com/blog/meetbsd-2016-report-michael-dexter/)
* [Various CBSD Tutorials](https://www.bsdstore.ru/en/tutorial.html)

---

Feedback/Questions
----------

* [Dylan - Kaltura Alt](http://pastebin.com/6B96pVcm)
* [Scott - ZFS in Low-Mem](http://pastebin.com/Hrp8qwkP)
* [J - Mixing Ports / Pkgs](http://pastebin.com/85q4Q3Xx)
* [Trenton - Dtract & PC-BSD](http://pastebin.com/RFKY0ERs)
* [Ivan - ZFS Backups](http://pastebin.com/31uqW6vW)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---