+++
title = "175: How the Dtrace saved Christmas"
description = "This week on BSDNow, we’ve got all sorts of post-holiday goodies to share. New OpenSSL APIs, Dtrace, OpenBSDThis episode was brought to you byiXsystems - Enterprise Servers and Storage for Open Source[![DigitalOcean -"
date = "2017-01-04T13:00:00Z"
url = "https://www.bsdnow.tv/175"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.965584836Z"
seen = false
+++

This week on BSDNow, we’ve got all sorts of post-holiday goodies to share. New OpenSSL APIs, Dtrace, OpenBSD

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [OpenSSL 1.1 API migration path, or the lack thereof](https://www.mail-archive.com/tech@openbsd.org/msg36437.html) ###

>
>
> As many of you will already be aware, the OpenSSL 1.1.0 release intentionally introduced significant API changes from the previous release. In summary, a large number of data structures that were previously publically visible have been made opaque, with accessor functions being added in order to get and set some of the fields within these now opaque structs. It is worth noting that the use of opaque data structures is generally beneficial for libraries, since changes can be made to these data structures without breaking the ABI. As such, the overall direction of these changes is largely reasonable.
>
>
>
> However, while API change is generally necessary for progression, in this case it would appear that there is NO transition plan and a complete disregard for the impact that these changes would have on the overall open source ecosystem.
>
>
>
> So far it seems that the only approach is to place the migration burden onto each and every software project that uses OpenSSL, pushing significant code changes to each project that migrates to OpenSSL 1.1, while maintaining compatibility with the previous API. This is forcing each project to provide their own backwards compatibility shims, which is practically guaranteeing that there will be a proliferation of variable quality implementations; it is almost a certainty that some of these will contain bugs, potentially introducing security issues or memory leaks.
>
>

* I think this will be a bigger issue for other operating systems that do not have the flexibility of the ports tree to deliver a newer version of OpenSSL. If a project switches from the old API to the new API, and the OS only provides the older branch of OpenSSL, how can the application work?
* Of course, this leaves the issue, if application A wants OpenSSL 1.0, and application B only works with OpenSSL 1.1, how does that work?

>
>
> Due to a number of factors, software projects that make use of OpenSSL cannot simply migrate to the 1.1 API and drop support for the 1.0 API - in most cases they will need to continue to support both. Firstly, I am not aware of any platform that has shipped a production release with OpenSSL 1.1 - any software that supported OpenSSL 1.1 only, would effectively be unusable on every platform for the time being. Secondly, the OpenSSL 1.0.2 release is supported until the 31st of December 2019, while OpenSSL 1.1.0 is only supported until the 31st of August 2018 - any LTS style release is clearly going to consider shipping with 1.0.2 as a result.
>
>
>
> Platforms that are attempting to ship with OpenSSL 1.1 are already encountering significant challenges - for example, Debian currently has 257 packages (out of 518) that do not build against OpenSSL 1.1. There are also hidden gotchas for situations where different libraries are linked against different OpenSSL versions and then share OpenSSL data structures between them - many of these problems will be difficult to detect since they only fail at runtime.
>
>

* It will be interesting to see what happens with OpenSSL, and LibreSSL
* Hopefully, most projects will decide to switch to the cleaner APIs provided by s2n or libtls, although they do not provide the entire functionality of the OpenSSL API.
* [Hacker News comments](https://news.ycombinator.com/item?id=13284648) \*\*\*

### [exfiltration via receive timing](http://www.tedunangst.com/flak/post/exfiltration-via-receive-timing) ###

>
>
> Another similar way to create a backchannel but without transmitting anything is to introduce delays in the receiver and measure throughput as observed by the sender. All we need is a protocol with transmission control. Hmmm. Actually, it’s easier (and more reliable) to code this up using a plain pipe, but the same principle applies to networked transmissions.
>
>
>
> For every digit we want to “send” back, we sleep a few seconds, then drain the pipe. We don’t care about the data, although if this were a video file or an OS update, we could probably do something useful with it.
>
>
>
> Continuously fill the pipe with junk data. If (when) we block, calculate the difference between before and after. This is a our secret backchannel data. (The reader and writer use different buffer sizes because on OpenBSD at least, a writer will stay blocked even after a read depending on the space that opens up. Even simple demos have real world considerations.)
>
>
>
> In this simple example, the secret data (argv) is shared by the processes, but we can see that the writer isn’t printing them from its own address space. Nevertheless, it works.
>
>
>
> Time to add random delays and buffering to firewalls? Probably not.
>
>

* An interesting thought experiment that shows just how many ways there are to covertly convey a message \*\*\*

### [OpenBSD Desktop in about 30 Minutes](https://news.ycombinator.com/item?id=13223351) ###

* Over at hackernews we have a very non-verbose, but handy guide to getting to a OpenBSD desktop in about 30 minutes!
* First, the guide will assume you’ve already installed OpenBSD 6.0, so you’ll need to at least be at the shell prompt of your freshly installed system to begin.
* With that, now its time to do some tuning. Editing some resource limits in login.conf will be our initial task, upping some datasize tunables to 2GB
* Next up, we will edit some of the default “doas” settings to something a bit more workable for desktop computing
* Another handy trick, editing your .profile to have your PKG\_PATH variables set automatically will make
* One thing some folks may overlook, but disabling atime can speed disk performance (which you probably don’t care about atime on your desktop anyway), so this guide will show you what knobs to tweak in /etc/fstab to do so
* After some final WPA / Wifi configuration, we then drop to “mere mortal” mode and begin our package installations. In this particular guide, he will be setting up Lumina Desktop (Which yes, it is on OpenBSD)
* A few small tweaks later for xscreensaver and your xinitrc file, then you are ready to run “startx” and begin your desktop session!
* All in all, great guide which if you are fast can probably be done in even less than 30 minutes and will result in a rock-solid OpenBSD desktop rocking Lumina none-the-less. \*\*\*

### [How DTrace saved Christmas](https://hackernoon.com/dtrace-at-home-145ba773371e) ###

* Adam Leventhal, one of the co-creators of DTrace, wrote up this post about how he uses DTrace at home, to save Christmas

>
>
> I had been procrastinating making the family holiday card. It was a combination of having a lot on my plate and dreading the formulation of our annual note recapping the year; there were some great moments, but I’m glad I don’t have to do 2016 again. It was just before midnight and either I’d make the card that night or leave an empty space on our friends’ refrigerators.
>
>

* Adobe Illustrator had other ideas: “Unable to set maximum number of files to be opened”

>
>
> I’m not the first person to hit this. The problem seems to have existed since CS6 was released in 2016. None of the solutions were working for me, and — inspired by [Sara Mauskopf’s excellent post](https://medium.com/startup-grind/how-to-start-a-company-with-no-free-time-b70fbe7b918a#.uujdblxc6) — I was rapidly running out of the time bounds for the project. Enough; I’d just DTrace it.
>
>
>
> A colleague scoffed the other day, “I mean, how often do you actually use DTrace?” In his mind DTrace was for big systems, critical system, when dollars and lives were at stake. My reply: I use DTrace every day. I can’t imagine developing software without DTrace, and I use it when my laptop (not infrequently) does something inexplicable (I’m forever grateful to the Apple team that ported it to Mac OS X)
>
>
>
> Illustrator is failing on setrlimit(2) and blowing up as result. Let’s confirm that it is in fact returning -1:$ sudo dtrace -n 'syscall::setrlimit:return/execname == "Adobe Illustrato"/{ printf("%d %d", arg1, errno); }'  
>  dtrace: description 'syscall::setrlimit:return' matched 1 probe  
>  CPU ID FUNCTION:NAME  
>  0 532 setrlimit:return -1 1
>
>
>
> There it is. And setrlimit(2) is failing with errno 1 which is EPERM (value too high for non-root user). I already tuned up the files limit pretty high. Let’s confirm that it is in fact setting the files limit and check the value to which it’s being set. To write this script I looked at the documentation for setrlimit(2) (hooray for man pages!) to determine that the position of the resource parameter (arg0) and the type of the value parameter (struct rlimit). I needed the DTrace copyin() subroutine to grab the structure from the process’s address space:  
>  $ sudo dtrace -n 'syscall::setrlimit:entry/execname == "Adobe Illustrato"/{ this-\>r = \*(struct rlimit \*)copyin(arg1, sizeof (struct rlimit)); printf("%x %x %x", arg0, this-\>r.rlim\_cur, this-\>r.rlim\_max); }'
>
>
>
> dtrace: description 'syscall::setrlimit:entry' matched 1 probe  
>  CPU ID FUNCTION:NAME  
>  0 531 setrlimit:entry 1008 2800 7fffffffffffffff  
>  Looking through /usr/include/sys/resource.h we can see that 1008 corresponds to the number of files (RLIMIT\_NOFILE |   
>  \_RLIMIT\_POSIX\_FLAG)
>
>
>
> The quickest solution was to use DTrace again to whack a smaller number into that struct rlimit. Easy:  
>  $ sudo dtrace -w -n 'syscall::setrlimit:entry/execname == "Adobe Illustrato"/{ this-\>i = (rlim\_t \*)alloca(sizeof (rlim\_t)); \*this-\>i = 10000; copyout(this-\>i, arg1 + sizeof (rlim\_t), sizeof (rlim\_t)); }'
>
>
>
> dtrace: description 'syscall::setrlimit:entry' matched 1 probe  
>  dtrace: could not enable tracing: Permission denied
>
>
>
> Oh right. Thank you SIP (System Integrity Protection). This is a new laptop (at least a new motherboard due to some bizarre issue) which probably contributed to Illustrator not working when once it did. Because it’s new I haven’t yet disabled the part of SIP that prevents you from using DTrace on the kernel or in destructive mode (e.g. copyout()). It’s easy enough to disable, but I’m reboot-phobic — I hate having to restart my terminals — so I went to plan B: lldb
>
>
>
> * After using DTrace to get the address of the setrlimit function, Adam used lldb to change the result before it got back to the application: (lldb) break set -n \_init Breakpoint 1: 47 locations. (lldb) run … (lldb) di -s 0x1006e5b72 -c 1 0x1006e5b72: callq 0x1011628e0 ; symbol stub for: setrlimit (lldb) memory write 0x1006e5b72 0x31 0xc0 0x90 0x90 0x90 (lldb) di -s 0x1006e5b72 -c 4 0x1006e5b72: xorl %eax, %eax 0x1006e5b74: nop 0x1006e5b75: nop 0x1006e5b76: nop
>
>
>
> Next I just did a process detach and got on with making that holiday card…
>
>
>
> DTrace was designed for solving hard problems on critical systems, but the need to understand how systems behave exists in development and on consumer systems. Just because you didn’t write a program doesn’t mean you can’t fix it.
>
>

---

News Roundup
----------

### [Say my Blog's name!](https://functionallyparanoid.com/2016/12/22/say-my-blogs-name/) ###

* Brian Everly over at functionally paranoid has a treat for us today. Let us give you a moment to get the tin-foil hats on… Ok, done? Let’s begin!
* He starts off with a look at physical security. He begins by listing your options:

  >
  > 1. BIOS passwords – Not something I’m typically impressed with. Most can be avoided by opening up the machine, closing a jumper and powering it up to reset the NVRAM to factory defaults. I don’t even bother with them.
  > 2. Full disk encryption – This one really rings my bell in a positive way. If you can kill power to the box (either because the bad actor has to physically steal it and they aren’t carrying around a pile of car batteries and an inverter or because you can interrupt power to it some other way), then the disk will be encrypted. The other beauty of this is that if a drive fails (and they all do eventually) you don’t have to have any privacy concerns about chucking it into an electronics recycler (or if you are a bad, bad person, into a landfill) because that data is effectively gibberish without the key (or without a long time to brute force it).
  > 3. Two factor auth for logins – I like this one as well. I’m not a fan of biometrics because if your fingerprint is compromised (yes, it can happen – [read](https://www.washingtonpost.com/news/federal-eye/wp/2015/07/09/hack-of-security-clearance-system-affected-21-5-million-people-federal-authorities-say/) about the department of defense background checks that were extracted by a bad agent – they included fingerprint images) you can’t exactly send off for a new finger. Things like the [YubiKey](https://www.yubico.com/) are pretty slick. They require that you have the physical hardware key as well as the password so unless the bad actor lifted your physical key, they would have a much harder time with physical access to your hardware.
  >
  >

* Out of those options, Brian mentions that he uses disk encryption and yubi-key for all his secure network systems.

* Next up is network segmentation, in this case the first thing to do is change your admin password for any ISP supplied modem   
   / router. He goes on to scare us of javascript attacks being used not against your local machine, but instead non WAN exposed router admin interface. Scary Stuff!

* For added security, naturally he firewalls the router by plugging in the LAN port to a OpenBSD box which does the 2nd layer of firewall / router protection.

* What about privacy and browsing? Here’s some more of his tips:

>
>
> I use Unbound as my DNS resolver on my local network (with all UDP port 53 traffic redirected to it by pf so I don’t have to configure anything on the clients) and then forward the traffic to DNSCrypt Proxy, caching the results in Unbound. I notice ZERO performance penalty for this and it greatly enhances privacy. This combination of Unbound and DNSCrypt Proxy works very well together. You can even have redundancy by having multiple upstream resolvers running on different ports (basically run the DNSCrypt Proxy daemon multiple times pointing to different public resolvers).
>
>
>
> I also use Firefox exclusively for my web browsing. By leveraging the tips on [this page](https://www.privacytools.io/), you can lock it down to do a great job of privacy protection. The fact that your laptop’s battery drain rate can be used to fingerprint your browser completely trips me out but hey – that’s the world we live in.’
>
>

* What about the cloud you may ask? Well Brian has a nice solution for that as well:

>
>
> I recently decided I would try to live a cloud-free life and I’ll give you a bit of a synopsis on it. I discovered a wonderful Open Source project called [FreeNAS](http://www.freenas.org/). What this little gem does is allow you to install a FreeBSD/zfs file server appliance on amd64 hardware and have a slick administrative web interface for managing it. I picked up a nice SuperMicro motherboard and chassis that has 4 hot swap drive bays (and two internal bays that I used to mirror the boot volume on) and am rocking the zfs lifestyle! (Thanks Alan Jude!)
>
>
>
> One of the nicest features of the FreeNAS is that it provides the ability to leverage the FreeBSD jail functionality in an easy to use way. It also has plugins but the security on those is a bit sketchy (old versions of libraries, etc.) so I decided to roll my own. I created two jails – one to run OwnCloud (yeah, I know about NextCloud and might switch at some point) and the other to run a full SMTP/IMAP email server stack. I used [Lets Encrypt](https://letsencrypt.org/) to generate the SSL certificates and made sure I hit an A on [SSLLabs](https://www.ssllabs.com/) before I did anything else.
>
>

* His post then goes in to talk about Backups and IoT devices, something else you need to consider in this truely paranoid world we are forced to live in. We even get a nice shout-out near the end!

>
>
> Enter [TarSnap](http://www.tarsnap.com/) – a company that advertises itself as “Online Backups for the Truly Paranoid”. It brings a tear to my eye – a kindred spirit! :-) Thanks again to Alan Jude and Kris Moore from the [BSD Now podcast](http://www.bsdnow.tv/) for turning me onto this company. It has a very easy command syntax (yes, it isn’t a GUI tool – suck it up buttercup, you wanted to learn the shell didn’t you?) and even allows you to compile the thing from source if you want to.”
>
>

* We’ve only covered some of the highlights here, but you really should take a few moments of your time today and read this top to bottom. Lots of good tips here, already thinking how I can secure my home network better.

---

### [The open source book: “Producing Open Source Software”](http://producingoss.com/en/producingoss.pdf) ###

* “How to Run a Successful Free Software Project” by Karl Fogel
* 9 chapters and over 200 pages of content, plus many appendices
* Some interesting topics include:
  * Choosing a good name
  * version control
  * bug tracking
  * creating developer guidelines
  * setting up communications channels
  * choosing a license (although this guide leans heavily towards the GPL)
  * setting the tone of the project
  * joining or creating a Non-Profit Organization
  * the economics of open source
  * release engineering, packaging, nightly builds, etc
  * how to deal with forks

* A lot of good information packaged into this ebook
* This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License \*\*\*

### [DTrace Flamegraphs for node.js on FreeBSD ](http://www.venshare.com/dtrace-flamegraphs-for-freebsd-and-node-js-2/) ###

* One of the coolest tools built on top of DTrace is flamegraphs
* They are a very accurate, and visual way to see where a program is spending its time, which can tell you why it is slow, or where it could be improved. Further enhancements include off-cpu flame graphs, which tell you when the program is doing nothing, which can also be very useful \> Recently BSD UNIXes are being acknowledged by the application development community as an interesting operating system to deploy to. This is not surprising given that FreeBSD had jails, the original container system, about 17 years ago and a lot of network focused businesses such as netflix see it as the best way to deliver content. This developer interest has led to hosting providers supporting FreeBSD. e.g. Amazon, Azure, Joyent and you can get a 2 months free instance at Digital Ocean.

>
>
> DTrace is another vital feature for anyone who has had to deal with production issues and has been in FreeBSD since version 9. As of FreeBSD 11 the operating system now contains some great work by Fedor Indutny so you can profile node applications and create flamegraphs of node.js processes without any additional runtime flags or restarting of processes.
>
>

* This is one of the most important things about DTrace. Many applications include some debugging functionality, but they require that you stop the application, and start it again in debugging mode. Some even require that you recompile the application in debugging mode.
* Being able to attach DTrace to an application, while it is under load, while the problem is actively happening, can be critical to figuring out what is going on.
* In order to configure your FreeBSD instance to utilize this feature make the following changes to the configuration of the server.

  * Load the DTrace module at boot
  * Increase some DTrace limits
  * Install node with the optional DTrace feature compiled in
  * Follow the generic [node.js flamegraph tutorial](https://nodejs.org/en/blog/uncategorized/profiling-node-js/) \> I hope you find this article useful. The ability to look at a runtime in this manor has saved me twice this year and I hope it will save you in the future too. My next post on freeBSD and node.js will be looking at some scenarios on utilising the ZFS features.

* Also check out Brendan Gregg’s [ACM Queue Article](http://queue.acm.org/detail.cfm?id=2927301) “The Flame Graph: This visualization of software execution is a new necessity for performance profiling and debugging”

  ---

### [SSHGuard 2.0 Call for Testing](https://sourceforge.net/p/sshguard/mailman/message/35580961/) ###

* SSHGuard is a tool for monitoring brute force attempts and blocking them
* It has been a favourite of mine for a while because it runs as a pipe from syslogd, rather than reading the log files from the disk

>
>
> A lot of work to get SSHGuard working with new log sources (journalctl, macOS log) and backends (firewalld, ipset) has happened in 2.0. The new version also uses a configuration file.
>
>
>
> Most importantly, SSHGuard has been split into several processes piped into one another (sshg-logmon | sshg-parser | sshg-blocker | sshg-fw). sshg-parser can run with capsicum(4) and pledge(2). sshg-blocker can be sandboxed in its default configuration (without pid file, whitelist, blacklisting) and has not been tested sandboxed in other configurations.
>
>

* Breaking the processes up so that the sensitive bits can be sandboxes is very nice to see \*\*\*

Beastie Bits
----------

* [pjd’s 2007 paper from AsiaBSDCon: “Porting the ZFS file system to the FreeBSD operating system”](https://2007.asiabsdcon.org/papers/P16-paper.pdf)

* [A Message From the FreeBSD Foundation](https://vimeo.com/user60888329)

* [Remembering Roger Faulkner, Unix Champion](http://thenewstack.io/remembering-roger-faulkner/) and [A few HN comments (including Bryan Cantrill)](https://news.ycombinator.com/item?id=13293596)

---

Feedback/Questions
----------

* [ Peter - TrueOS Network](http://pastebin.com/QtyJeHMk)
* [ Chris - Remote Desktop](http://pastebin.com/ru726VTV)
* [ Goetz - Geli on Serial](http://pastebin.com/LQZPgF5g)
* [ Joe - BGP](http://pastebin.com/jFeL8zKX)
* [ Alejandro - BSD Router](http://pastebin.com/Xq9cbmfn) \*\*\*