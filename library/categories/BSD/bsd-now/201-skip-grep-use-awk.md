+++
title = "201: Skip grep, use awk"
description = "In which we interview a unicorn, FreeNAS 11.0 is out, show you how to run Nextcloud in a FreeBSD jail, and talk about the connection between oil changes and software patches.This episode was brought to you by[![iXsystems - Enterprise Servers and Storage for Open Source]"
date = "2017-07-05T12:00:00Z"
url = "https://www.bsdnow.tv/201"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.879715641Z"
seen = false
+++

In which we interview a unicorn, FreeNAS 11.0 is out, show you how to run Nextcloud in a FreeBSD jail, and talk about the connection between oil changes and software patches.

This episode was brought to you by
----------

[![iXsystems - Enterprise Servers and Storage for Open Source](/images/1.png)](http://www.ixsystems.com/bsdnow)[![DigitalOcean - Simple Cloud Hosting, Built for Developers](/images/2.png)](http://www.digitalocean.com/)[![Tarsnap - Online Backups for the Truly Paranoid](/images/3.png)](http://www.tarsnap.com/bsdnow)

---

Headlines
----------

### [FreeNAS 11.0 is Now Here](http://www.freenas.org/blog/freenas-11-0/) ###

* The FreeNAS blog informs us:

>
>
> After several FreeNAS Release Candidates, FreeNAS 11.0 was released today. This version brings new virtualization and object storage features to the Worlds Most Popular Open Source Storage Operating System. FreeNAS 11.0 adds bhyve virtual machines to its popular SAN/NAS, jails, and plugins, letting you use host web-scale VMs on your FreeNAS box. It also gives users S3-compatible object storage services, which turns your FreeNAS box into an S3-compatible server, letting you avoid reliance on the cloud.  
>  FreeNAS 11.0 also introduces the beta version of a new administration GUI. The new GUI is based on the popular Angular framework and the FreeNAS team expects the GUI to be themeable and feature complete by 11.1. The new GUI follows the same flow as the existing GUI, but looks better. For now, the FreeNAS team has released it in beta form to get input from the FreeNAS community. The new GUI, as well as the classic GUI, are selectable from the login screen.  
>  Also new in FreeNAS 11 is an Alert Service page which configures the system to send critical alerts from FreeNAS to other applications and services such as Slack, PagerDuty, AWS, Hipchat, InfluxDB, Mattermost, OpsGenie, and VictorOps. FreeNAS 11.0 has an improved Services menu that adds the ability to manage which services and applications are started at boot.  
>  The FreeNAS community is large and vibrant. We invite you to join us on the [FreeNAS forum](https://forums.freenas.org/index.php) and the #freenas IRC channel on Freenode. To download FreeNAS and sign-up for the FreeNAS Newsletter, visit [freenas.org/download](http://www.freenas.org/download/).
>
>

---

### [Building an IPsec Gateway With OpenBSD](https://www.exoscale.ch/syslog/2017/06/26/building-an-ipsec-gateway-with-openbsd/) ###

* Pierre-Yves Ritschard wrote the following blog article:

>
>
> With private networks just released on Exoscale, there are now more options to implement secure access to Exoscale cloud infrastructure. While we still recommend the bastion approach, as detailed in [this article](https://www.exoscale.ch/syslog/2016/01/15/secure-your-cloud-computing-architecture-with-a-bastion/), there are applications or systems which do not lend themselves well to working this way.  
>  In these cases, the next best thing is building IPsec gateways. IPsec is a protocol which works directly at layer 3. It uses its configuration to determine which network flows should be sent encrypted on the wire. Once IPsec is correctly configured, selected network flows are transparently encrypted and applications do not need to modify anything to benefit from secured traffic.
>
>

* In addition to encryption, IPSec also authenticates the end points, so you can be sure you are exchanging packets with a trusted host

>
>
> For the purposes of this article we will work under the following assumptions: We want a host to network setup, providing access to cloud-hosted infrastructure from a desktop environment.  
>  Only stock tooling should be used on desktop environment, no additional VPN client should be needed.  
>  In this case, to ensure no additional software is needed on the client, we will configure an L2TP/IPsec gateway. This article will use OpenBSD as the operating system to implement the gateway. While this choice may sound surprising, OpenBSD excels at building gateways of all sorts thanks to its simple configuration formats and inclusion of all necessary software and documentation to do so in the base system.
>
>

* The tutorial assumes you have setup a local network between the hosts in the cloud, and walks through the configuration of an OpenBSD host as a IPsec gateway

>
>
> On the OpenBSD host, all necessary software is already installed. We will configure the system, as well as pf, npppd, and ipsec
>
>
>
> * Configure L2TP
> * Configure IPsec
> * Configure NAT
> * Enabled services: ipsec isakmpd npppd
>
>

* The tutorial then walks through configuring a OS X client, but other desktops will be very similar \*\*\*

### [Running Nextcloud in a jail on FreeBSD](https://ramsdenj.com/2017/06/05/nextcloud-in-a-jail-on-freebsd.html) ###

>
>
> I recently setup Nextcloud 12 inside a FreeBSD jail in order to allow me access to files i might need while at University. I figured this would be a optimal solution for files that I might need access to unexpectedly, on computers where I am not in complete control. My Nextcloud instance is externally accessible, and yet if someone were to get inside my Jail, I could rest easy knowing they still didnt have access to the rest of my host server. I chronicled the setup process including jail setup using iocage, https with Lets Encrypt, and full setup of the web stack.  
>  Nextcloud has a variety of features such as calendar synchronization, email, collaborative editing, and even video conferencing. I havent had time to play with all these different offerings and have only utilized the file synchronization, but even if file sync is not needed, Nextcloud has many offerings that make it worth setting up.
>
>

* MariaDB, PHP 7.0, and Apache 2.4

>
>
> To manage my jails Im using iocage. In terms of jail managers its a fairly new player in the game of jail management and is being very actively developed. It just had a full rewrite in Python, and while the code in the background might be different, the actual user interface has stayed the same.  
>  Iocage makes use of ZFS clones in order to create base jails, which allow for sharing of one set of system packages between multiple jails, reducing the amount of resources necessary. Alternatively, jails can be completely independent from each other; however, using a base jail makes it easier to update multiple jails as well.
>
>
>
> * pkg install iocage
> * sysrc iocage\_enable=YES
> * iocage fetch -r 11.0-RELEASE
> * iocage create tag="stratus" jail\_zfs=on vnet=off boot=on ip4\_addr="sge0|172.20.0.100/32" -r 11.0-RELEASE
> * iocage start stratus
> * iocage console stratus
>
>
>
> I have chosen to provide storage to the Nextcloud Jail by mounting a dataset over NFS on my host box. This means my server can focus on serving Nextcloud and my storage box can focus on housing the data. The Nextcloud Jail is not even aware of this since the NFS Mount is simply mounted by the host server into the jail. The other benefit of this is the Nextcloud jail doesnt need to be able to see my storage server, nor the ability to mount the NFS share itself.  
>  Using a separate server for storage isnt necessary and if the storage for my Nextcloud server was being stored on the same server I would have created a ZFS dataset on the host and mounted it into the jail.  
>  Next I set up a dataset for the database and delegated it into the jail. Using a separate dataset allows me to specify certain properties that are better for a database, it also makes migration easier in case I ever need to move or backup the database.  
>  With most of the requirements in place it was time to start setting up Nextcloud. The requirements for Nextcloud include your basic web stack of a web server, database, and PHP.
>
>

* Also covers the setup of acme.sh for LetsEncrypt. This is now available as a package, and doesnt need to be manually fetched
* Install a few more packages, and do a bit of configuration, and you have a NextCloud server \*\*\*

### [Historical: My first OpenBSD Hackathon](http://bad.network/historical-my-first-openbsd-hackathon.html) ###

* This is a blog post by our friend, and OpenBSD developer: Peter Hessler

>
>
> This is a story about encouragement. Every time I use the word "I", you should think "I as in me, not I as in the author".   
>  In 2003, I was invited to my first OpenBSD Hackathon. Way before I was into networking, I was porting software to my favourite OS. Specifically, I was porting games.  
>  On the first night most of the hackathon attendees end up at the bar for food and beer, and I'm sitting next to Theo de Raadt, the founder of OpenBSD. At some point during the evening, he's telling me about all of these "crazy" ideas he has about randomizing libraries, and protections that can be done in ld.so. (ld.so is the part of the OS that loads the libraries your program needs. It's, uh, kinda important.) Theo is encouraging me to help implement some of these ideas! At some point I tell Theo "I'm just a porter, I don't know C."  
>  Theo responds with "It isn't hard, I'll have Dale (Rahn) show you how ld.so works, and you can do it." I was hoping that all of this would be forgotten by the next day, but sure enough Dale comes by. "Hey, are you Peter? Theo wanted me to show you how ld.so works" Dale spends an hour or two showing me how it works, the code structure, and how to recover in case of failure.  
>  At first I had lots of failures. Then more failures. And even more failures. Once, I broke my machine so badly I had to reinstall it. I learned a lot about how an OS works during this. But, I eventually started doing changes without it breaking. And some even did what I wanted! By the end of the hackathon I had came up with a useful patch, that was committed as part of a larger change.  
>  I was a nobody. With some encouragement, enough liquid courage to override my imposter syndrome, and a few hours of mentoring, I'm now doing big projects. The next time you're sitting at a table with someone new to your field, ask yourself: how can you encourage them? You just might make the world better.  
>  Thank you Dale. And thank you Theo.
>
>

* Everyone has to start somewhere.
* One of the things that sets the BSDs apart from certain other open source operating systems, is the welcoming community, and the tradition of mentorship.
* Sure, someone else in the OpenBSD project could have done the bits that Peter did, likely a lot more quickly, but then OpenBSD wouldnt have gained a new committer.
* So, if you are interested in working on one of the BSDs, reach out, and well try to help you find a mentor.
* What part of the system do you want to work on? \*\*\*

#### Interview - Dan McDonald - [allcoms@gmail.com](mailto:allcoms@gmail.com) (danboid) ####

---

News Roundup
----------

### [FreeBSD 11.1-RC1 Available](https://lists.freebsd.org/pipermail/freebsd-stable/2017-July/087340.html) ###

* 11.1-RC1 Installation images are available for:
  * amd64, i386
  * powerpc, powerpc64
  * sparc64
  * armv6 BANANAPI, BEAGLEBONE, CUBIEBOARD, CUBIEBOARD2, CUBOX-HUMMINGBOARD, GUMSTIX, RPI-B, RPI2, PANDABOARD, WANDBOARD
  * aarch64 (aka arm64), including the RPI3, Pine64, OverDrive 1000, and Cavium Server

* A summary of changes since BETA3 includes:
  * Several build toolchain related fixes.
  * A use-after-free in RPC client code has been corrected.
  * The ntpd(8) leap-seconds file has been updated.
  * Various VM subsystem fixes.
  * The '\_' character is now allowed in newfs(8) labels.
  * A potential sleep while holding a mutex has been corrected in the sa(4) driver.
  * A memory leak in an ioctl handler has been fixed in the ses(4) driver.

* Virtual Machine Disk Images are available for the amd64 and i386 architectures.
* Amazon EC2 AMI Images of FreeBSD/amd64 EC2 AMIs are available
  * The freebsd-update(8) utility supports binary upgrades of amd64 and i386 systems running earlier FreeBSD releases. Systems running earlier FreeBSD releases can upgrade as follows:

>
>
> freebsd-update upgrade -r 11.1-RC1
>
>

* During this process, freebsd-update(8) may ask the user to help by merging some configuration files or by confirming that the automatically performed merging was done correctly.

>
>
> freebsd-update install
>
>

* The system must be rebooted with the newly installed kernel before continuing.

>
>
> shutdown -r now
>
>

* After rebooting, freebsd-update needs to be run again to install the new userland components:

>
>
> freebsd-update install
>
>

* It is recommended to rebuild and install all applications if possible, especially if upgrading from an earlier FreeBSD release, for example, FreeBSD 10.x. Alternatively, the user can install misc/compat10x and other compatibility libraries, afterwards the system must be rebooted into the new userland:

>
>
> shutdown -r now
>
>

* Finally, after rebooting, freebsd-update needs to be run again to remove stale files:

>
>
> freebsd-update install
>
>
> ---
>

### [Oil changes, safety recalls, and software patches](http://www.daemonology.net/blog/2017-06-14-oil-changes-safety-recalls-software-patches.html) ###

>
>
> Every few months I get an email from my local mechanic reminding me that it's time to get my car's oil changed. I generally ignore these emails; it costs time and money to get this done (I'm sure I could do it myself, but the time it would cost is worth more than the money it would save) and I drive little enough  about 2000 km/year  that I'm not too worried about the consequences of going for a bit longer than nominally advised between oil changes. I do get oil changes done... but typically once every 8-12 months, rather than the recommended 4-6 months. From what I've seen, I don't think I'm alone in taking a somewhat lackadaisical approach to routine oil changes.   
>  On the other hand, there's another type of notification which elicits more prompt attention: Safety recalls. There are two good reasons for this: First, whether for vehicles, food, or other products, the risk of ignoring a safety recall is not merely that the product will break, but rather that the product will be actively unsafe; and second, when there's a safety recall you don't have to pay for the replacement or fix  the cost is covered by the manufacturer.   
>  I started thinking about this distinction  and more specifically the difference in user behaviour  in the aftermath of the "WannaCry" malware. While WannaCry attracted widespread attention for its "ransomware" nature, the more concerning aspect of this incident is how it propagated: By exploiting a vulnerability in SMB for which Microsoft issued patches two months earlier. As someone who works in computer security, I find this horrifying  and I was particularly concerned when I heard that the NHS was postponing surgeries because they couldn't access patient records. Think about it: If the NHS couldn't access patient records due to WannaCry, it suggests WannaCry infiltrated systems used to access patient records  meaning that someone else exploiting the same vulnerabilities could have accessed those records. The SMB subsystem in Windows was not merely broken; until patches were applied, it was actively unsafe.   
>  I imagine that most people in my industry would agree that security patches should be treated in the same vein as safety recalls  unless you're certain that you're not affected, take care of them as a matter of urgency  but it seems that far more users instead treat security patches more like oil changes: something to be taken care of when convenient... or not at all, if not convenient. It's easy to say that such users are wrong; but as an industry it's time that we think about why they are wrong rather than merely blaming them for their problems.   
>  There are a few factors which I think are major contributors to this problem. First, the number of updates: When critical patches occur frequently enough to become routine, alarm fatigue sets in and people cease to give the attention updates deserve, even if on a conscious level they still recognize the importance of applying updates.
>
>

* Colin also talks about his time as the FreeBSD Security Officer, and the problems in ensuring the patches are correct and do not break the system when installed
* He also points out the problem of systems like Windows Update, the combines optional updates, and things like its license checking tool, in the same interface that delivers important updates. Or my recent machines, that gets constant popups about how some security updates will not be delivered because my processor is too new.

>
>
> My bank sends me special offers in the mail but phones if my credit card usage trips fraud alarms; this is the sort of distinction in intrusiveness we should see for different types of software updates  
>  Finally, I think there is a problem with the mental model most people have of computer security. Movies portray attackers as geniuses who can break into any system in minutes; journalists routinely warn people that "nobody is safe"; and insurance companies offer insurance against "cyberattacks" in much the same way as they offer insurance against tornados. Faced with this wall of misinformation, it's not surprising that people get confused between 400 pound hackers sitting on beds and actual advanced persistent threats. Yes, if the NSA wants to break into your computer, they can probably do it  but most attackers are not the NSA, just like most burglars are not Ethan Hunt. You lock your front door, not because you think it will protect you from the most determined thieves, but because it's an easy step which dramatically reduces your risk from opportunistic attack; but users don't see applying security updates as the equivalent of locking their front door when they leave home.
>
>
> ---
>

### [SKIP grep, use AWK](http://blog.jpalardy.com/posts/skip-grep-use-awk/) ###

* This is a tip from Jonathan Palardy in a series of blog posts about awk. It is especially helpful for people who write a lot of shell scripts or are using a lot of pipes with awk and grep.

>
>
> Over the years, Ive seen many people use this pattern (filter-map):
>
>
>
> $ [data is generated] | grep something | awk '{print $2}'
>
>
>
> but it can be shortened to:
>
>
>
> $ [data is generated] | awk '/something/ {print $2}'
>
>

* AWK can take a regular expression (the part between the slashes) and matches that to the input. Anything that matches is being passed to the print $2 action (to print the second column).

>
>
> Why would I do this?
>
>
>
> I can think of 4 reasons:  
>  \*its shorter to type  
>  \*it spawns one less process  
>  \*awk uses modern (read Perl) regular expressions, by default  like grep -E  
>  \*its ready to augment with more awk
>
>

* How about matching the inverse (search for patterns that do NOT match)?

>
>
> But grep -v is OK  
>  Many people have pointed out that grep -v can be done more concisely with:
>
>
>
> $ [data is generated] | awk '! /something/'
>
>

* See if you have such combinations of grep piped to awk and fix those in your shell scripts. It saves you one process and makes your scripts much more readable. Also, check out the other intro links on the blog if you are new to awk. \*\*\*

### [vim Adventures](https://vim-adventures.com) ###

* This website, created by Doron Linder, will playfully teach you how to use vim.
* Hit any key to get started and follow the instructions on the playing field by moving the cursor around.
* There is also a menu in the bottom left corner to save your game.
* Try it out, increase your vim-fu, and learn how to use a powerful text editor more efficiently. \*\*\*

Beastie Bits
----------

* [Slides from PkgSrcCon](http://pkgsrc.org/pkgsrcCon/2017/talks.html)
* [OpenBSDs doas adds systemd compat shim](http://marc.info/?l=openbsd-tech&m=149902196520920&w=2)
* [Deadlock Empire -- Each challenge below is a computer program of two or more threads. You take the role of the Scheduler - and a cunning one! Your objective is to exploit flaws in the programs to make them crash or otherwise malfunction.](https://deadlockempire.github.io/)
* [EuroBSDcon 2017 Travel Grant Application Now Open](https://www.freebsdfoundation.org/blog/eurobsdcon-2017-travel-grant-application-now-open/)
* [Registration for vBSDCon is open ](http://www.vbsdcon.com/) - Registration is only $100 if you register before July 31. Discount hotel rooms arranged at the Hyatt for only $100/night while supplies last.
* [BSD Taiwan call for papers opens, closes July 31st](https://bsdtw.org/)Windows Application Versand \*\*\*

Feedback/Questions
----------

* [Joseph - Server Monitoring](http://dpaste.com/2AM6C2H#wrap)
* [Paulo - Updating Jails](http://dpaste.com/1Z4FBE2#wrap)
* [Kevin - openvpn server](http://dpaste.com/2MNM9GJ#wrap)
* [Todd - several questions](http://dpaste.com/17BVBJ3#wrap) \*\*\*