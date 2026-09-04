+++
title = "224: The Bus Factor"
description = "We try to answer what happens to an open source project after a developers death, we tell you about the last bootstrapped tech company in Silicon Valley, we have an update to the NetBSD Thread sanitizer, and show how to use use cabal on OpenBSDThis episode was brought to you by--"
date = "2017-12-13T13:00:00Z"
url = "https://www.bsdnow.tv/224"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.815048771Z"
seen = true
+++

We try to answer what happens to an open source project after a developers death, we tell you about the last bootstrapped tech company in Silicon Valley, we have an update to the NetBSD Thread sanitizer, and show how to use use cabal on OpenBSD

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [Life after death, for code](https://www.wired.com/story/giving-open-source-projects-life-after-a-developers-death/) ###

>
>
> YOU'VE PROBABLY NEVER heard of the late Jim Weirich or his software. But you've almost certainly used apps built on his work.  
>  Weirich helped create several key tools for Ruby, the popular programming language used to write the code for sites like Hulu, Kickstarter, Twitter, and countless others. His code was open source, meaning that anyone could use it and modify it. "He was a seminal member of the western world's Ruby community," says Justin Searls, a Ruby developer and co-founder of the software company Test Double.  
>  When Weirich died in 2014, Searls noticed that no one was maintaining one of Weirich's software-testing tools. That meant there would be no one to approve changes if other developers submitted bug fixes, security patches, or other improvements. Any tests that relied on the tool would eventually fail, as the code became outdated and incompatible with newer tech.  
>  The incident highlights a growing concern in the open-source software community. What happens to code after programmers pass away? Much has been written about what happens to social-media accounts after users die. But its been less of an issue among programmers. In part, thats because most companies and governments relied on commercial software maintained by teams of people. But today, more programs rely on obscure but crucial software like Weirich's.  
>  Some open-source projects are well known, such as the Linux operating system or Google's artificial-intelligence framework TensorFlow. But each of these projects depend on smaller libraries of open-source code. And those libraries depend on other libraries. The result is a complex, but largely hidden, web of software dependencies.  
>  That can create big problems, as in 2014 when a security vulnerability known as "Heartbleed" was found in OpenSSL, an open-source program used by nearly every website that processes credit- or debit-card payments. The software comes bundled with most versions of Linux, but was maintained by a small team of volunteers who didn't have the time or resources to do extensive security audits. Shortly after the Heartbleed fiasco, a security issue was discovered in another common open-source application called Bash that left countless web servers and other devices vulnerable to attack.  
>  There are surely more undiscovered vulnerabilities. Libraries.io, a group that analyzes connections between software projects, has identified more than 2,400 open-source libraries that are used in at least 1,000 other programs but have received little attention from the open-source community.  
>  Security problems are only one part of the issue. If software libraries aren't kept up to date, they may stop working with newer software. That means an application that depends on an outdated library may not work after a user updates other software. When a developer dies or abandons a project, everyone who depends on that software can be affected. Last year when programmer Azer Koçulu deleted a tiny library called Leftpad from the internet, it created ripple effects that reportedly caused headaches at Facebook, Netflix, and elsewhere.
>
>

* The Bus Factor

>
>
> The fewer people with ownership of a piece of software, the greater the risk that it could be orphaned. Developers even have a morbid name for this: the bus factor, meaning the number of people who would have to be hit by a bus before there's no one left to maintain the project. Libraries.io has identified about 3,000 open-source libraries that are used in many other programs but have only a handful of contributors.  
>  Orphaned projects are a risk of using open-source software, though commercial software makers can leave users in a similar bind when they stop supporting or updating older programs. In some cases, motivated programmers adopt orphaned open-source code.  
>  That's what Searls did with one of Weirichs projects. Weirich's most-popular projects had co-managers by the time of his death. But Searls noticed one, the testing tool Rspec-Given, hadn't been handed off, and wanted to take responsibility for updating it. But he ran into a few snags along the way.  
>  Rspec-Given's code was hosted on the popular code-hosting and collaboration site GitHub, home to 67 million codebases. Weirich's Rspec-Given page on GitHub was the main place for people to report bugs or to volunteer to help improve the code. But GitHub wouldnt give Searls control of the page, because Weirich had not named him before he died. So Searls had to create a new copy of the code, and host it elsewhere. He also had to convince the operators of Ruby Gems, a package-management system for distributing code, to use his version of Rspec-Given, instead of Weirich's, so that all users would have access to Searls changes. GitHub declined to discuss its policies around transferring control of projects.
>
>
>
> That solved potential problems related to Rspec-Given, but it opened Searls' eyes to the many things that could go wrong. Its easy to see open source as a purely technical phenomenon, Searls says. But once something takes off and is depended on by hundreds of other people, it becomes a social phenomenon as well.  
>  The maintainers of most package-management systems have at least an ad-hoc process for transferring control over a library, but that process usually depends on someone noticing that a project has been orphaned and then volunteering to adopt it. "We dont have an official policy mostly because it hasnt come up all that often," says Evan Phoenix of the Ruby Gems project. "We do have an adviser council that is used to decide these types of things case by case."  
>  Some package managers now monitor their libraries and flag widely used projects that haven't been updated in a long time. Neil Bowers, who helps maintain a package manager for the programming language Perl, says he sometimes seeks out volunteers to take over orphan projects. Bowers says his group vets claims that a project has been abandoned, and the people proposing to take it over.
>
>

* A 'Dead-Man's Switch'

>
>
> Taking over Rspec-Given inspired Searls, who was only 30 at the time, to make a will and a succession plan for his own open-source projects. There are other things developers can do to help future-proof their work. They can, for example, transfer the copyrights to a foundation, such as the Apache Foundation. But many open-source projects essentially start as hobbies, so programmers may not think to transfer ownership until it is too late.  
>  Searls suggests that GitHub and package managers such as Gems could add something like a "dead man's switch" to their platform, which would allow programmers to automatically transfer ownership of a project or an account to someone else if the creator doesnt log in or make changes after a set period of time.  
>  But a transition plan means more than just giving people access to the code. Michael Droettboom, who took over a popular mathematics library called Matplotlib after its creator John Hunter died in 2012, points out that successors also need to understand the code. "Sometimes there are parts of the code that only one person understands," he says. "The knowledge exists only in one person's head."  
>  That means getting people involved in a project earlier, ideally as soon as it is used by people other than the original developer. That has another advantage, Searls points out, in distributing the work of maintaining a project to help prevent developer burnout.
>
>

---

### [The Last Bootstrapped Tech Company In Silicon Valley](https://www.forbes.com/sites/forbestechcouncil/2017/12/12/the-last-bootstrapped-tech-company-in-silicon-valley/2/#4d53d50f1e4d) ###

>
>
> My business partner, Matt Olander, and I were intimately familiar with the ups and downs of the Silicon Valley tech industry when we acquired the remnants of our then-employer BSDis enterprise computer business in 2002 and assumed the roles of CEO and CTO. Fast-forward to today, and we still work in the same buildings where BSDi started in 1996, though youd hardly recognize them today.  
>  As the business grew from a startup to a global brand, our success came from always ensuring we ran a profitable business. While that may sound obvious, keep in mind that we are in the heart of Silicon Valley where venture capitalists hunt for the unicorn company that will skyrocket to a billion-dollar valuation. Unicorns like Facebook and Twitter unquestionably exist, but they are the exception.
>
>

* Live By The VC, Die By The VC

>
>
> After careful consideration, Matt and I decided to bootstrap our company rather than seek funding. The first dot-com bubble had recently burst, and we were seeing close friends lose their jobs right and left at VC-funded companies based on dubious business plans. While we did not have much cash on hand, we did have a customer base and treasured those customers as our greatest asset. We concluded that meeting their needs was the surest path to meeting ours, and the rest would simply be details to address individually. This strategy ended up working so well that we have many of the same customers to this day.  
>  After deciding to bootstrap, we made a decision on a matter that has left egg on the face of many of our competitors: We seated sales next to support under one roof at our manufacturing facility in Silicon Valley. Dell's decision to outsource some of its support overseas in the early 2000s was the greatest gift it could have given us. Some of our sales and support staff have worked with the same clients for over a decade, and we concluded that no amount of funding could buy that mutual loyalty. While accepting venture capital or an acquisition may make you rich, it does not guarantee that your customers, employees or even business will be taken care of. Our motto is, Treat your customers like friends and employees like family, and we have an incredibly low employee turnover to show for it.  
>  Thanks to these principles, iXsystems has remained employee-owned, debt-free and profitable from the day we took it over -- all without VC funding, which is why we call ourselves the "last bootstrapped tech company in Silicon Valley." As a result, we now provide enterprise servers to thousands of customers, including top Fortune 500 companies, research and educational institutions, all branches of the military, and numerous government entities.  
>  Over time, however, we realized that we were selling more and more third-party data storage systems with every order. We saw this as a new opportunity. We had partnered with several storage vendors to meet our customers needs, but every time we did, we opened a can of worms with regard to supporting our customers to our standards. Given a choice of risking being dragged down by our partners or outmaneuvered by competitors with their own storage portfolios, we made a conscious decision to develop a line of storage products that would not only complement our enterprise servers but tightly integrate with them.  
>  To accelerate this effort, we adopted the FreeNAS open-source software-defined storage project in 2009 and havent looked back. The move enabled us to focus on storage, fully leveraging our experience with enterprise hardware and our open source heritage in equal measures. We saw many storage startups appear every quarter, struggling to establish their niche in a sea of competitors. We wondered how theyd instantly master hardware to avoid the partnering mistakes that we made years ago, given that storage hardware and software are truly inseparable at the enterprise level. We entered the storage market with the required hardware expertise, capacity and, most importantly, revenue, allowing us to develop our storage line at our own pace.
>
>

* Grow Up, But On Your Own Terms

>
>
> By not having the external pressure from VCs or shareholders that your competitors have, you're free to set your own priorities and charge fair prices for your products. Our customers consistently tell us how refreshing our sales and marketing approaches are. We consider honesty, transparency and responsible marketing the only viable strategy when youre bootstrapped. Your reputation with your customers and vendors should mean everything to you, and we can honestly say that the loyalty we have developed is priceless.  
>  So how can your startup venture down a similar path? Here's our advice for playing the long game:
>
>

* Relate your experiences to each fad: Our industry is a firehose of fads and buzzwords, and it can be difficult to distinguish the genuine trends from the flops. Analyze every new buzzword in terms of your own products, services and experiences, and monitor customer trends even more carefully. Some buzzwords will even formalize things you have been doing for years.
* Value personal relationships: Companies come and go, but you will maintain many clients and colleagues for decades, regardless of the hat they currently wear. Encourage relationship building at every level of your company because you may encounter someone again.
* Trust your instincts and your colleagues: No contractual terms or credit rating system can beat the instincts you will develop over time for judging the ability of individuals and companies to deliver. You know your business, employees and customers best.

>
>
> Looking back, I don't think Id change a thing. We need to be in Silicon Valley for the prime customers, vendors and talent, and its a point of pride that our customers recognize how different we are from the norm. Free of a venture capital runway and driven by these principles, we look forward to the next 20 years in this highly-competitive industry.
>
>

---

### [Creating an AS for fun and profit](http://blog.thelifeofkenneth.com/2017/11/creating-autonomous-system-for-fun-and.html) ###

>
>
> At its core, the Internet is an interconnected fabric of separate networks. Each network which makes up the Internet is operated independently and only interconnects with other networks in clearly defined places.  
>  For smaller networks like your home, the interaction between your network and the rest of the Internet is usually pretty simple: you buy an Internet service plan from an ISP (Internet Service Provider), they give you some kind of hand-off through something like a DSL or cable modem, and give you access to "the entire Internet". Your router (which is likely also a WiFi access point and Ethernet switch) then only needs to know about two things; your local computers and devices are on one side, and the ENTIRE Internet is on the other side of that network link given to you by your ISP.  
>  For most people, that's the extent of what's needed to be understood about how the Internet works. Pick the best ISP, buy a connection from them, and attach computers needing access to the Internet. And that's fine, as long as you're happy with only having one Internet connection from one vendor, who will lend you some arbitrary IP address(es) for the extend of your service agreement, but that starts not being good enough when you don't want to be beholden to a single ISP or a single connection for your connectivity to the Internet.  
>  That also isn't good enough if you *are* an Internet Service Provider so you are literally a part of the Internet. You can't assume that the entire Internet is that way when half of the Internet is actually in the other direction. This is when you really have to start thinking about the Internet and treating the Internet as a very large mesh of independent connected organizations instead of an abstract cloud icon on the edge of your local network map. Which is pretty much never for most of us.  
>  Almost no one needs to consider the Internet at this level. The long flight of steps from DSL for your apartment up to needing to be an integral part of the Internet means that pretty much regardless of what level of Internet service you need for your projects, you can probably pay someone else to provide it and don't need to sit down and learn how BGP works and what an Autonomous System is. But let's ignore that for one second, and talk about how to become your own ISP.
>
>

* To become your own Internet Service Provider with customers who pay you to access the Internet, or be your own web hosting provider with customers who pay you to be accessible from the Internet, or your own transit provider who has customers who pay you to move their customer's packets to other people's customers, you need a few things:
  * Your own public IP address space allocated to you by an Internet numbering organization
  * Your own Autonomous System Number (ASN) to identify your network as separate from everyone else's networks
  * At least one router connected to a different autonomous system speaking the Border Gateway Protocol to tell the rest of the Internet that your address space is accessible from your autonomous system.

>
>
> So... I recently set up my own autonomous system... and I don't really have a fantastic justification for it...
>
>

* My motivation was twofold:
  * One of my friends and I sat down and figured it out that splitting the cost of a rack in Hurricane Electric's FMT2 data center marginally lowered our monthly hosting expenses vs all the paid services we're using scattered across the Internet which can all be condensed into this one rack.
  * And this first reason on its own is a perfectly valid justification for paying for co-location space at a data center like Hurricane Electric's, but isn't actually a valid reason for running it as an autonomous system, because Hurricane Electric will gladly let you use their address space for your servers hosted in their building. That's usually part of the deal when you pay for space in a data center: power, cooling, Internet connectivity, and your own IP addresses.
  * Another one of my friends challenged me to do it as an Autonomous System.
  * So admittedly, my justification for going through the additional trouble to set up this single rack of servers as an AS is a little more tenuous. I will readily admit that, more than anything else, this was a "hold my beer" sort of engineering moment, and not something that is at all needed to achieve what we actually needed (a rack to park all our servers in).

>
>
> But what the hell; I've figured out how to do it, so I figured it would make an entertaining blog post.
>
>

* So here's how I set up a multi-homed autonomous system on a shoe-string budget:
  * Step 1. Found a Company
  * Step 2. Get Yourself Public Address Space
  * Step 3. Find Yourself Multiple Other Autonomous Systems to Peer With
  * Step 4. Apply for an Autonomous System Number
  * Step 5. Source a Router Capable of Handling the Entire Internet Routing Table
  * Step 6. Turn it All On and Pray
  * And we're off to the races.

>
>
> At this point, Hurricane Electric is feeding us all \~700k routes for the Internet, we're feeding them our two routes for our local IPv4 and IPv6 subnets, and all that's left to do is order all our cross-connects to other ASes in the building willing to peer with us (mostly for fun) and load in all our servers to build our own personal corner of the Internet.  
>  The only major goof so far has been accidentally feeding the full IPv6 table to our first other peer that we turned on, but thankfully he has a much more powerful supervisor than the Sup720-BXL, so he just sent me an email to knock that off, a little fiddling with my BGP egress policies, and we were all set.  
>  In the end, setting up my own autonomous system wasn't exactly simple, it was definitely not justified, but some times in life you just need to take the more difficult path. And there's a certain amount of pride in being able to claim that I'm part of the actual Internet. That's pretty neat.   
>  And of course, thanks to all of my friends who variously contributed parts, pieces, resources, and know-how to this on-going project. I had to pull in a lot of favors to pull this off, and I appreciate it.
>
>

---

News Roundup
----------

### [One year checkpoint and Thread Sanitizer update](https://blog.netbsd.org/tnf/entry/one_year_checkpoint_and_thread) ###

>
>
> The past year has been started with bugfixes and the development of regression tests for ptrace(2) and related kernel features, as well as the continuation of bringing LLDB support and LLVM sanitizers (ASan + UBsan and partial TSan + Msan) to NetBSD. My plan for the next year is to finish implementing TSan and MSan support, followed by a long run of bug fixes for LLDB, ptrace(2), and other related kernel subsystems
>
>

* TSan

>
>
> In the past month, I've developed Thread Sanitizer far enough to have a subset of its tests pass on NetBSD, started with addressing breakage related to the memory layout of processes. The reason for this breakage was narrowed down to the current implementation of ASLR, which was too aggressive and which didn't allow enough space to be mapped for Shadow memory. The fix for this was to either force the disabling of ASLR per-process, or globally on the system. The same will certainly happen for MSan executables. After some other corrections, I got TSan to work for the first time ever on October 14th. This was a big achievement, so I've made a snapshot available. Getting the snapshot of execution under GDB was pure hazard.
>
>

```
$ gdb ./a.out                                  
GNU gdb (GDB) 7.12
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64--netbsd".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
.
Find the GDB manual and other documentation resources online at:
.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from ./a.out...done.
(gdb) r
Starting program: /public/llvm-build/a.out
[New LWP 2]

WARNING: ThreadSanitizer: data race (pid=1621)
  Write of size 4 at 0x000001475d70 by thread T1:
    #0 Thread1 /public/llvm-build/tsan.c:4:10 (a.out+0x46bf71)

  Previous write of size 4 at 0x000001475d70 by main thread:
    #0 main /public/llvm-build/tsan.c:10:10 (a.out+0x46bfe6)

  Location is global 'Global' of size 4 at 0x000001475d70 (a.out+0x000001475d70)

  Thread T1 (tid=2, running) created by main thread at:
    #0 pthread_create /public/llvm/projects/compiler-rt/lib/tsan/rtl/tsan_interceptors.cc:930:3 (a.out+0x412120)
    #1 main /public/llvm-build/tsan.c:9:3 (a.out+0x46bfd1)

SUMMARY: ThreadSanitizer: data race /public/llvm-build/tsan.c:4:10 in Thread1

Thread 2 received signal SIGSEGV, Segmentation fault.

```

>
>
> I was able to get the above execution results around 10% of the time (being under a tracer had no positive effect on the frequency of successful executions). I've managed to hit the following final results for this month, with another set of bugfixes and improvements:
>
>

```
check-tsan:
Expected Passes    : 248
Expected Failures  : 1
Unsupported Tests  : 83
Unexpected Failures: 44

```

>
>
> At the end of the month, TSan can now reliably executabe the same (already-working) program every time. The majority of failures are in tests verifying sanitization of correct mutex locking usage. There are still problems with NetBSD-specific libc and libpthread bootstrap code that conflicts with TSan. Certain functions (pthread\_create(3), pthread\_key\_create(3), \_cxa\_atexit()) cannot be started early by TSan initialization, and must be deferred late enough for the sanitizer to work correctly.
>
>

* MSan

>
>
> I've prepared a scratch support for MSan on NetBSD to help in researching how far along it is. I've also cloned and adapted the existing FreeBSD bits; however, the code still needs more work and isn't functional yet. The number of passed tests (5) is negligible and most likely does not work at all. The conclusion after this research is that TSan shall be finished first, as it touches similar code. In the future, there will be likely another round of iterating the system structs and types and adding the missing ones for NetBSD. So far, this part has been done before executing the real MSan code. I've added one missing symbol that was missing and was detected when attempting to link a test program with MSan.
>
>

* Sanitizers

>
>
> The GCC team has merged the LLVM sanitizer code, which has resulted in almost-complete support for ASan and UBsan on NetBSD. It can be found in the latest GCC8 snapshot, located in pkgsrc-wip/gcc8snapshot. Though, do note that there is an issue with getting backtraces from libasan.so, which can be worked-around by backtracing ASan events in a debugger. UBsan also passes all GCC regression tests and appears to work fine. The code enabling sanitizers on the GCC/NetBSD frontend will be submitted upstream once the backtracing issue is fixed and I'm satisfied that there are no other problems. I've managed to upstream a large portion of generic+TSan+MSan code to compiler-rt and reduce local patches to only the ones that are in progress. This deals with any rebasing issues, and allows me to just focus on the delta that is being worked on. I've tried out the LLDB builds which have TSan/NetBSD enabled, and they built and started fine. However, there were some false positives related to the mutex locking/unlocking code.
>
>

* Plans for the next milestone

>
>
> The general goals are to finish TSan and MSan and switch back to LLDB debugging. I plan to verify the impact of the TSan bootstrap initialization on the observed crashes and research the remaining failures.
>
>

* This work was sponsored by The NetBSD Foundation.

>
>
> The NetBSD Foundation is a non-profit organization and welcomes any donations to help us continue funding projects and services to the open-source community. Please consider visiting the following URL, and chip in what you can:
>
>

---

### [The scourge of systemd](https://blog.ungleich.ch/en-us/cms/blog/2017/12/10/the-importance-of-devuan/) ###

* While this article is actually couched in terms of promoting devuan, a de-systemd-ed version of debian, it would seem the same logic could be applied to all of the BSDs

>
>
> Let's say every car manufacturer recently discovered a new technology named "doord", which lets you open up car doors much faster than before. It only takes 0.05 seconds, instead of 1.2 seconds on average. So every time you open a door, you are much, much faster!  
>  Many of the manufacturers decide to implement doord, because the company providing doord makes it clear that it is beneficial for everyone. And additional to opening doors faster, it also standardises things. How to turn on your car? It is the same now everywhere, it is not necessarily to look for the keyhole anymore.  
>  Unfortunately though, sometimes doord does not stop the engine. Or if it is cold outside, it stops the ignition process, because it takes too long. Doord also changes the way your navigation system works, because that is totally related to opening doors, but leads to some users being unable to navigate, which is accepted as collateral damage. In the end, you at least have faster door opening and a standard way to turn on the car. Oh, and if you are in a traffic jam and have to restart the engine often, it will stop restarting it after several times, because that's not what you are supposed to do. You can open the engine hood and tune that setting though, but it will be reset once you buy a new car.  
>  Some of you might now ask themselves "Is systemd THAT bad?". And my answer to it is: No. It is even worse. Systemd developers split the community over a tiny detail that decreases stability significantly and increases complexity for not much real value. And this is not theoretical: We tried to build Data Center Light on Debian and Ubuntu, but servers that don't boot, that don't reboot or systemd-resolved that constantly interferes with our core network configuration made it too expensive to run Debian or Ubuntu.  
>  Yes, you read right: too expensive. While I am writing here in flowery words, the reason to use Devuan is hard calculated costs. We are a small team at ungleich and we simply don't have the time to fix problems caused by systemd on a daily basis. This is even without calculating the security risks that come with systemd.
>
>
> ---
>

### [Using cabal on OpenBSD](https://deftly.net/posts/2017-10-12-using-cabal-on-openbsd.html) ###

>
>
> Since [W<sup>X</sup> became mandatory in OpenBSD](https://undeadly.org/cgi?action=article&sid=20160527203200), W<sup>Xd</sup> binaries are only allowed to be executed from designated locations (mount points). If you used the auto partition layout during install, your /usr/local/ will be mounted with wxallowed. For example, here is the entry for my current machine:
>
>

```
/dev/sd2g on /usr/local type ffs (local, nodev, wxallowed, softdep)

```

>
>
> This is a great feature, but if you build applications outside of the wxallowed partition, you are going to run into some issues, especially in the case of cabal (python as well).  
>  Here is an example of what you would see when attempting to do cabal install pandoc:
>
>

```
qbit@slip[1]:~? cabal update
Config file path source is default config file.
Config file /home/qbit/.cabal/config not found.
Writing default configuration to /home/qbit/.cabal/config
Downloading the latest package list from hackage.haskell.org
qbit@slip[0]:~? cabal install pandoc
Resolving dependencies...
.....
cabal: user error (Error: some packages failed to install:
JuicyPixels-3.2.8.3 failed during the configure step. The exception was:
/home/qbit/.cabal/setup-exe-cache/setup-Simple-Cabal-1.22.5.0-x86_64-openbsd-ghc-7.10.3: runProcess: runInteractiveProcess: exec: permission denied (Permission denied)

```

>
>
> The error isnt actually what it says. The untrained eye would assume permissions issue. A quick check of dmesg reveals what is really happening:
>
>

```
/home/qbit/.cabal/setup-exe-cache/setup-Simple-Cabal-1.22.5.0-x86_64-openbsd-ghc-7.10.3(22924): W^X binary outside wxallowed mountpoint

```

>
>
> OpenBSD is killing the above binary because it is violating W<sup>X</sup> and hasnt been safely kept in its /usr/local corral!  
>  We could solve this problem quickly by marking our /home as wxallowed, however, this would be heavy handed and reckless (we dont want to allow other potentially unsafe binaries to execute.. just the cabal stuff).  
>  Instead, we will build all our cabal stuff in /usr/local by using a symlink!
>
>

```
doas mkdir -p /usr/local/{cabal,cabal/build} # make our cabal and build dirs
doas chown -R user:wheel /usr/local/cabal    # set perms
rm -rf ~/.cabal                              # kill the old non-working cabal
ln -s /usr/local/cabal ~/.cabal              # link it!

```

>
>
> We are almost there! Some cabal packages build outside of \~/.cabal:
>
>

```
cabal install hakyll
.....
Building foundation-0.0.14...                                                   Preprocessing library foundation-0.0.14...
hsc2hs: dist/build/Foundation/System/Bindings/Posix_hsc_make: runProcess: runInteractiveProcess: exec: permission denied (Permission denied)
Downloading time-locale-compat-0.1.1.3...
.....

```

>
>
> Fortunately, all of the packages I have come across that do this all respect the TMPDIR environment variable!
>
>

```
alias cabal='env TMPDIR=/usr/local/cabal/build/ cabal'

```

>
>
> With this alias, you should be able to cabal without issue (so far pandoc, shellcheck and hakyll have all built fine)!
>
>

* TL;DR

```
&#35; This assumes /usr/local/ is mounted as wxallowed.
&#35;
doas mkdir -p /usr/local/{cabal,cabal/build}
doas chown -R user:wheel /usr/local/cabal
rm -rf ~/.cabal
ln -s /usr/local/cabal ~/.cabal
alias cabal='env TMPDIR=/usr/local/cabal/build/ cabal'
cabal install pandoc

```

---

### [FreeBSD and APRS, or "hm what happens when none of this is well documented.."](https://adrianchadd.blogspot.co.uk/2017/10/freebsd-and-aprs-or-hm-what-happens.html) ###

>
>
> Here's another point along my quest for amateur radio on FreeBSD - bring up basic APRS support. Yes, someone else has done the work, but in the normal open source way it was .. inconsistently documented.
>
>

* First is figuring out the hardware platform. I chose the following:
  * A Baofeng UV5R2, since they're cheap, plentiful, and do both VHF and UHF;
  * A cable to do sound level conversion and isolation (and yes, I really should post a circuit diagram and picture..);
  * A USB sound device, primarily so I can whack it into FreeBSD/Linux devices to get a separate sound card for doing radio work;
  * FreeBSD laptop (it'll become a raspberry pi + GPS + sensor + LCD thingy later, but this'll do to start with.)
  * The Baofeng is easy - set it to the right frequency (VHF APRS sits on 144.390MHz), turn on VOX so I don't have to make up a PTT cable, done/done.

>
>
> The PTT bit isn't that hard - one of the microphone jack pins is actually PTT (if you ground it, it engages PTT) so when you make the cable just ensure you expose a ground pin and PTT pin so you can upgrade it later.
>
>
>
> The cable itself isn't that hard either - I had a baofeng handmic lying around (they're like $5) so I pulled it apart for the cable. I'll try to remember to take pictures of that.
>
>

* Here's a picture I found on the internet that shows the pinout: [image](https://3.bp.blogspot.com/-58HUyt-9SUw/Wdz6uMauWlI/AAAAAAAAVz8/e7OrnRzN3908UYGUIRI1EBYJ5UcnO0qRgCLcBGAs/s1600/aprs-cable.png)

>
>
> Now, I went a bit further. I bought a bunch of 600 ohm isolation transformers for audio work, so I wired it up as follows:  
>  From the audio output of the USB sound card, I wired up a little attenuator - input is 2k to ground, then 10k to the input side of the transformer; then the output side of the transformer has a 0.01uF greencap capacitor to the microphone input of the baofeng;  
>  From the baofeng I just wired it up to the transformer, then the output side of that went into a 0.01uF greencap capacitor in series to the microphone input of the sound card.  
>  In both instances those capacitors are there as DC blockers.
>
>
>
> Ok, so that bit is easy. Then on to the software side. The normal way people do this stuff is "direwolf" on Linux. So, "pkg install direwolf" installed it. That was easy.  
>  Configuring it up was a bit less easy. [I found this guide to be helpful](https://andrewmemory.wordpress.com/tag/direwolf/)  
>  FreeBSD has the example direwolf config in /usr/local/share/doc/direwolf/examples/direwolf.conf . Now, direwolf will run as a normal user (there's no rc.d script for it yet!) and by default runs out of the current directory. So:
>
>

```
$ cd ~
$ cp /usr/local/share/doc/direwolf/examples/direwolf.conf .
$ (edit it)
$ direwolf

```

>
>
> Editing it isn't that hard - you need to change your callsign and the audio device.
>
>
>
> OK, here is the main undocumented bit for FreeBSD - the sound device can just be /dev/dsp . It isn't an ALSA name! Don't waste time trying to use ALSA names. Instead, just find the device you want and reference it. For me the USB sound card shows up as /dev/dsp3 (which is very non specific as USB sound devices come and go, but that's a later problem!) but it's enough to bring it up.
>
>
>
> So yes, following the above guide, using the right sound device name resulted in a working APRS modem.
>
>
>
> Next up - something to talk to it. This is called 'xastir'. It's .. well, when you run it, you'll find exactly how old an X application it is. It's very nostalgically old. But, it is enough to get APRS positioning up and test both the TCP/IP side of APRS and the actual radio radio side.
>
>

* [Here's the guide I followed:](https://andrewmemory.wordpress.com/2015/03/22/setting-up-direwolfxastir-on-a-raspberry-pi/)

>
>
> So, that was it! So far so good. It actually works well enough to decode and watch APRS traffic around me. I managed to get out position information to the APRS network over both TCP/IP and relayed via VHF radio.
>
>

---

Beastie Bits
----------

* [Zebras All the Way Down - Bryan Cantrill](https://www.youtube.com/watch?v=fE2KDzZaxvE)
* [Your impact on FreeBSD](https://www.freebsdfoundation.org/blog/your-impact-on-freebsd/)
* [The Secret to a good Gui](https://bsdmag.org/secret-good-gui/)
* [containerd hits v1.0.0](https://github.com/containerd/containerd/releases/tag/v1.0.0)
* [FreeBSD 11.1 Custom Kernels Made Easy - Configuring And Installing A Custom Kernel](https://www.youtube.com/watch?v=lzdg_2bUh9Y&t=)
* [Debugging](https://pbs.twimg.com/media/DQgCNq6UEAEqa1W.jpg:large) \*\*\*

Feedback/Questions
----------

* Bostjan - [Backup Tapes](http://dpaste.com/22ZVJ12#wrap)
* Philipp - [A long time ago, there was a script](http://dpaste.com/13E8RGR#wrap)
* Adam - [ZFS Pool Monitoring](http://dpaste.com/3BQXXPM#wrap)
* Damian - [KnoxBug](http://dpaste.com/0ZZVM4R#wrap) \*\*\*