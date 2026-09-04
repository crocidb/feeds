+++
title = "Episode 249: Router On A Stick | BSD Now 249"
description = 'OpenZFS and DTrace updates in NetBSD, NetBSD network security stack audit, Performance of MySQL on ZFS, OpenSMTP results from p2k18, legacy Windows backup to FreeNAS, ZFS block size importance, and NetBSD as router on a stick.  \Headlines   \[ZFS and DTrace update lands i'
date = "2018-06-06T18:00:00Z"
url = "https://www.bsdnow.tv/249"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.748165263Z"
seen = true
+++

OpenZFS and DTrace updates in NetBSD, NetBSD network security stack audit, Performance of MySQL on ZFS, OpenSMTP results from p2k18, legacy Windows backup to FreeNAS, ZFS block size importance, and NetBSD as router on a stick.  

---

\##Headlines  
 \###[ZFS and DTrace update lands in NetBSD](https://mail-index.netbsd.org/source-changes/2018/05/28/msg095541.html)

>
>
> merge a new version of the CDDL dtrace and ZFS code. This changes the upstream vendor from OpenSolaris to FreeBSD, and this version is based on FreeBSD svn r315983.
>
>

* r315983 is from March 2017 (14 months ago), so there is still more work to do

>
>
> in addition to the 10 years of improvements from upstream, this version also has these NetBSD-specific enhancements:
>
>
>
> * dtrace FBT probes can now be placed in kernel modules.
> * ZFS now supports mmap().
>
>

* This brings NetBSD 10 years forward, and they should be able to catch the rest of the way up fairly quickly

---

\###[NetBSD network stack security audit](https://blog.netbsd.org/tnf/entry/network_security_audit)

* Maxime Villard has been working on an audit of the NetBSD network stack, a project sponsored by The NetBSD Foundation, which has served all users of BSD-derived operating systems.

>
>
> Over the last five months, hundreds of patches were committed to the source tree as a result of this work. Dozens of bugs were fixed, among which a good number of actual, remotely-triggerable vulnerabilities.
>
>

>
>
> Changes were made to strengthen the networking subsystems and improve code quality: reinforce the mbuf API, add many KASSERTs to enforce assumptions, simplify packet handling, and verify compliance with RFCs. This was done in several layers of the NetBSD kernel, from device drivers to L4 handlers.  
>  In the course of investigating several bugs discovered in NetBSD, I happened to look at the network stacks of other operating systems, to see whether they had already fixed the issues, and if so how. Needless to say, I found bugs there too.
>
>

* A lot of code is shared between the BSDs, so it is especially helpful when one finds a bug, to check the other BSDs and share the fix.

>
>
> The IPv6 Buffer Overflow: The overflow allowed an attacker to write one byte of packet-controlled data into ‘packet\_storage+off’, where ‘off’ could be approximately controlled too. This allowed at least a pretty bad remote DoS/Crash  
>  The IPsec Infinite Loop: When receiving an IPv6-AH packet, the IPsec entry point was not correctly computing the length of the IPv6 suboptions, and this, before authentication. As a result, a specially-crafted IPv6 packet could trigger an infinite loop in the kernel (making it unresponsive). In addition this flaw allowed a limited buffer overflow - where the data being written was however not controllable by the attacker.  
>  The IPPROTO Typo: While looking at the IPv6 Multicast code, I stumbled across a pretty simple yet pretty bad mistake: at one point the Pim6 entry point would return IPPROTO\_NONE instead of IPPROTO\_DONE. Returning IPPROTO\_NONE was entirely wrong: it caused the kernel to keep iterating on the IPv6 packet chain, while the packet storage was already freed.  
>  The PF Signedness Bug: A bug was found in NetBSD’s implementation of the PF firewall, that did not affect the other BSDs. In the initial PF code a particular macro was used as an alias to a number. This macro formed a signed integer. NetBSD replaced the macro with a sizeof(), which returns an unsigned result.  
>  The NPF Integer Overflow: An integer overflow could be triggered in NPF, when parsing an IPv6 packet with large options. This could cause NPF to look for the L4 payload at the wrong offset within the packet, and it allowed an attacker to bypass any L4 filtering rule on IPv6.  
>  The IPsec Fragment Attack: I noticed some time ago that when reassembling fragments (in either IPv4 or IPv6), the kernel was not removing the M\_PKTHDR flag on the secondary mbufs in mbuf chains. This flag is supposed to indicate that a given mbuf is the head of the chain it forms; having the flag on secondary mbufs was suspicious.  
>  What Now: Not all protocols and layers of the network stack were verified, because of time constraints, and also because of unexpected events: the recent x86 CPU bugs, which I was the only one able to fix promptly. A todo list will be left when the project end date is reached, for someone else to pick up. Me perhaps, later this year? We’ll see.  
>  This security audit of NetBSD’s network stack is sponsored by The NetBSD Foundation, and serves all users of BSD-derived operating systems. The NetBSD Foundation is a non-profit organization, and welcomes any donations that help continue funding projects of this kind.
>
>

---

**DigitalOcean**

\###[MySQL on ZFS Performance](https://www.percona.com/blog/2018/05/15/about-zfs-performance/)

>
>
> I used sysbench to create a table of 10M rows and then, using export/import tablespace, I copied it 329 times. I ended up with 330 tables for a total size of about 850GB. The dataset generated by sysbench is not very compressible, so I used lz4 compression in ZFS. For the other ZFS settings, I used what can be found in my earlier ZFS posts but with the ARC size limited to 1GB. I then used that plain configuration for the first benchmarks. Here are the results with the sysbench point-select benchmark, a uniform distribution and eight threads. The InnoDB buffer pool was set to 2.5GB.  
>  In both cases, the load is IO bound. The disk is doing exactly the allowed 3000 IOPS. The above graph appears to be a clear demonstration that XFS is much faster than ZFS, right? But is that really the case? The way the dataset has been created is extremely favorable to XFS since there is absolutely no file fragmentation. Once you have all the files opened, a read IOP is just a single fseek call to an offset and ZFS doesn’t need to access any intermediate inode. The above result is about as fair as saying MyISAM is faster than InnoDB based only on table scan performance results of unfragmented tables and default configuration. ZFS is much less affected by the file level fragmentation, especially for point access type.
>
>

>
>
> ZFS stores the files in B-trees in a very similar fashion as InnoDB stores data. To access a piece of data in a B-tree, you need to access the top level page (often called root node) and then one block per level down to a leaf-node containing the data. With no cache, to read something from a three levels B-tree thus requires 3 IOPS.
>
>

>
>
> The extra IOPS performed by ZFS are needed to access those internal blocks in the B-trees of the files. These internal blocks are labeled as metadata. Essentially, in the above benchmark, the ARC is too small to contain all the internal blocks of the table files’ B-trees. If we continue the comparison with InnoDB, it would be like running with a buffer pool too small to contain the non-leaf pages. The test dataset I used has about 600MB of non-leaf pages, about 0.1% of the total size, which was well cached by the 3GB buffer pool. So only one InnoDB page, a leaf page, needed to be read per point-select statement.
>
>

>
>
> To correctly set the ARC size to cache the metadata, you have two choices. First, you can guess values for the ARC size and experiment. Second, you can try to evaluate it by looking at the ZFS internal data. Let’s review these two approaches.
>
>

>
>
> You’ll read/hear often the ratio 1GB of ARC for 1TB of data, which is about the same 0.1% ratio as for InnoDB. I wrote about that ratio a few times, having nothing better to propose. Actually, I found it depends a lot on the recordsize used. The 0.1% ratio implies a ZFS recordsize of 128KB. A ZFS filesystem with a recordsize of 128KB will use much less metadata than another one using a recordsize of 16KB because it has 8x fewer leaf pages. Fewer leaf pages require less B-tree internal nodes, hence less metadata. A filesystem with a recordsize of 128KB is excellent for sequential access as it maximizes compression and reduces the IOPS but it is poor for small random access operations like the ones MySQL/InnoDB does.
>
>

* In order to improve ZFS performance, I had 3 options:
* Increase the ARC size to 7GB
* Use a larger Innodb page size like 64KB
* Add a L2ARC

>
>
> I was reluctant to grow the ARC to 7GB, which was nearly half the overall system memory. At best, the ZFS performance would only match XFS. A larger InnoDB page size would increase the CPU load for decompression on an instance with only two vCPUs; not great either. The last option, the L2ARC, was the most promising.
>
>

>
>
> ZFS is much more complex than XFS and EXT4 but, that also means it has more tunables/options. I used a simplistic setup and an unfair benchmark which initially led to poor ZFS results. With the same benchmark, very favorable to XFS, I added a ZFS L2ARC and that completely reversed the situation, more than tripling the ZFS results, now 66% above XFS.
>
>

* Conclusion

>
>
> We have seen in this post why the general perception is that ZFS under-performs compared to XFS or EXT4. The presence of B-trees for the files has a big impact on the amount of metadata ZFS needs to handle, especially when the recordsize is small. The metadata consists mostly of the non-leaf pages (or internal nodes) of the B-trees. When properly cached, the performance of ZFS is excellent. ZFS allows you to optimize the use of EBS volumes, both in term of IOPS and size when the instance has fast ephemeral storage devices. Using the ephemeral device of an i3.large instance for the ZFS L2ARC, ZFS outperformed XFS by 66%.
>
>

---

\###[OpenSMTPD new config](https://poolp.org/posts/2018-04-30/opensmtpd-new-config/)

```
TL;DR:
OpenBSD #p2k18 hackathon took place at Epitech in Nantes.
I was organizing the hackathon but managed to make progress on OpenSMTPD.
As mentioned at EuroBSDCon the one-line per rule config format was a design error.
A new configuration grammar is almost ready and the underlying structures are simplified.
Refactor removes ~750 lines of code and solves _many_ issues that were side-effects of the design error.
New features are going to be unlocked thanks to this.

```

* Anatomy of a design error

>
>
> OpenSMTPD started ten years ago out of dissatisfaction with other solutions, mainly because I considered them way too complex for me not to get things wrong from time to time.  
>  The initial configuration format was very different, I was inspired by pyr@’s hoststated, which eventually became relayd, and designed my configuration format with blocks enclosed by brackets.  
>  When I first showed OpenSMTPD to pyr@, he convinced me that PF-like one-line rules would be awesome, and it was awesome indeed.  
>  It helped us maintain our goal of simple configuration files, it helped fight feature creeping, it helped us gain popularity and become a relevant MTA, it helped us get where we are now 10 years later.  
>  That being said, I believe this was a design error. A design error that could not have been predicted until we hit the wall to understand WHY this was an error. One-line rules are semantically wrong, they are SMTP wrong, they are wrong.  
>  One-line rules are making the entire daemon more complex, preventing some features from being implemented, making others more complex than they should be, they no longer serve our goals.  
>  To get to the point: we should move to two-line rules :-)
>
>

Anatomy of a design error  
 OpenSMTPD started ten years ago out of dissatisfaction with other solutions, mainly because I considered them way too complex for me not to get things wrong from time to time.

The initial configuration format was very different, I was inspired by pyr@’s hoststated, which eventually became relayd, and designed my configuration format with blocks enclosed by brackets.

When I first showed OpenSMTPD to pyr@, he convinced me that PF-like one-line rules would be awesome, and it was awesome indeed.

It helped us maintain our goal of simple configuration files, it helped fight feature creeping, it helped us gain popularity and become a relevant MTA, it helped us get where we are now 10 years later.

That being said, I believe this was a design error. A design error that could not have been predicted until we hit the wall to understand WHY this was an error. One-line rules are semantically wrong, they are SMTP wrong, they are wrong.

One-line rules are making the entire daemon more complex, preventing some features from being implemented, making others more complex than they should be, they no longer serve our goals.

To get to the point: we should move to two-line rules :-)

* The problem with one-line rules

>
>
> OpenSMTPD decides to accept or reject messages based on one-line rules such as:
>
>

`accept from any for domain poolp.org deliver to mbox`

>
>
> Which can essentially be split into three units:
>
>

* the decision: accept/reject
* the matching: from any for domain [poolp.org](http://poolp.org)
* the (default) action: deliver to mbox

>
>
> To ensure that we meet the requirements of the transactions, the matching must be performed during the SMTP transaction before we take a decision for the recipient.  
>  Given that the rule is atomic, that it doesn’t have an identifier and that the action is part of it, the two only ways to make sure we can remember the action to take later on at delivery time is to either:
>
>

* save the action in the envelope, which is what we do today
* evaluate the envelope again at delivery
* And this this where it gets tricky… both solutions are NOT ok.

>
>
> The first solution, which we’ve been using for a decade, was to save the action within the envelope and kind of carve it in stone. This works fine… however it comes with the downsides that errors fixed in configuration files can’t be caught up by envelopes, that delivery action must be validated way ahead of time during the SMTP transaction which is much trickier, that the parsing of delivery methods takes place as the \_smtpd user rather than the recipient user, and that envelope structures that are passed all over OpenSMTPD carry delivery-time informations, and more, and more, and more. The code becomes more complex in general, less safe in some particular places, and some areas are nightmarish to deal with because they have to deal with completely unrelated code that can’t be dealt with later in the code path.
>
>

>
>
> The second solution can’t be done. An envelope may be the result of nested rules, for example an external client, hitting an alias, hitting a user with a .forward file resolving to a user. An envelope on disk may no longer match any rule or it may match a completely different rule If we could ensure that it matched the same rule, evaluating the ruleset may spawn new envelopes which would violate the transaction. Trying to imagine how we could work around this leads to more and more and more RFC violations, incoherent states, duplicate mails, etc…
>
>

>
>
> There is simply no way to deal with this with atomic rules, the matching and the action must be two separate units that are evaluated at two different times, failure to do so will necessarily imply that you’re either using our first solution and all its downsides, or that you are currently in a world of pain trying to figure out why everything is burning around you. The minute the action is written to an on-disk envelope, you have failed.
>
>

>
>
> A proper ruleset must define a set of matching patterns resolving to an action identifier that is carved in stone, AND a set of named action set that is resolved dynamically at delivery time.
>
>

* Follow the link above to see the rest of the article

---

**Break**

\##News Roundup  
 \###[Backing up a legacy Windows machine to a FreeNAS with rsync](http://fortysomethinggeek.blogspot.com/2012/09/legacy-windows-rsync-backup-to-freenas.html)

>
>
> I have some old Windows servers (10 years and counting) and I have been using rsync to back them up to my FreeNAS box. It has been working great for me.
>
>

>
>
> First of all, I do have my Windows servers backup in virtualized format. However, those are only one-time snapshops that I run once in a while. These are classic ASP IIS web servers that I can easily put up on a new VM. However, many of these legacy servers generate gigabytes of data a day in their repositories. Running VM conversion daily is not ideal.
>
>

>
>
> My solution was to use some sort of rsync solution just for the data repos. I’ve tried some applications that didn’t work too well with Samba shares and these old servers have slow I/O. Copying files to external sata or usb drive was not ideal. We’ve moved on from Windows to Linux and do not have any Windows file servers of capacity to provide network backups. Hence, I decided to use Delta Copy with FreeNAS. So here is a little write up on how to set it up. I have 4 Windows 2000 servers backing up daily with this method.
>
>

>
>
> First, download Delta Copy and install it. It is open-source and pretty much free. It is basically a wrapper for cygwin’s rsync. When you install it, it will ask you to install the Server services which allows you to run it as a Rsync server on Windows. You don’t need to do this. Instead, you will be just using the Delta Copy Client application. But before we do that, we will need to configure our Rsync service for our Windows Clients on FreeNAS.
>
>

* In FreeNAS, go under Services , Select Rsync \> Rsync Modules \> Add Rsync Module.
* Then fill out the form; giving the module a name and set the path. In my example, I simply called it WIN and linked it to a user called backupuser.
* This process is much easier than trying to configure the daemon rsyncd.conf file by hand.
* Now, on the Windows Client, start the DeltaCopy Client. You will create a new Profile.
* You will need to enter the IP of the Rsync server (FreeNAS) and specify the module name which will be called “Virtual Directory Name.” When you pull the select menu, the list of Rsync Modules you created earlier in FreeNAS will populate.
* You can set authentication. On the server, you can restrict by IP and do other things to lock down your rsync.
* Next, you will add folders (and/or files) you want to synchronize.
* Once the paths are set up, you can run a sync by right clicking the profile name.
* Here, I made a test sync to a home folder of a virtualized windows box. As you can see, I mounted the rsync volume on my mac to see the progress. The rsync worked beautifully. DeltaCopy did what it was told.
* Once you get everything working. The next thing to do is set schedules. If you done tasks schedules in Windows before, it is pretty straightforward. DeltaCopy has a link in the application to directly create a new task for you. I set my backups to run nightly and it has been working great.

>
>
> There you have it. Windows rsync to FreeNAS using DeltaCopy.  
>  The nice thing about FreeNAS is you don’t have to modify /etc/rsyncd.conf files. Everything can be done in the web admin.
>
>

---

**iXsystems**

\###[How to write ATF tests for NetBSD](https://r3xnation.wordpress.com/2018/04/10/how-to-write-atf-tests-for-netbsd/amp/)

>
>
> I have recently started contributing to the amazing NetBSD foundation. I was thinking of trying out a new OS for a long time. Switching to the NetBSD OS has been a fun change.
>
>

>
>
> My first contribution to the NetBSD foundation was adding regression tests for the Address Sanitizer (ASan) in the Automated Testing Framework(ATF) which NetBSD has. I managed to complete it with the help of my really amazing mentor Kamil. This post is gonna be about the ATF framework that NetBSD has and how to you can add multiple tests with ease.
>
>

* Intro

>
>
> In ATF tests we will basically be talking about test programs which are a suite of test cases for a specific application or program.
>
>

* The ATF suite of Commands

>
>
> There are a variety of commands that the atf suite offers. These include :
>
>

* atf-check: The versatile command that is a vital part of the checking process. man page

* atf-run: Command used to run a test program. man page

* atf-fail: Report failure of a test case.

* atf-report: used to pretty print the atf-run. man page

* atf-set: To set atf test conditions.

* We will be taking a better look at the syntax and usage later.

* Let’s start with the Basics

>
>
> The ATF testing framework comes preinstalled with a default NetBSD installation. It is used to write tests for various applications and commands in NetBSD. One can write the Test programs in either the C language or in shell script. In this post I will be dealing with the Bash part.
>
>

* Follow the link above to see the rest of the article

---

\###[The Importance of ZFS Block Size](http://brian.candler.me/posts/the-importance-of-zfs-blocksize/)

* Warning! WARNING! Don’t just do things because some random blog says so

>
>
> One of the important tunables in ZFS is the recordsize (for normal datasets) and volblocksize (for zvols). These default to 128KB and 8KB respectively.  
>  As I understand it, this is the unit of work in ZFS. If you modify one byte in a large file with the default 128KB record size, it causes the whole 128KB to be read in, one byte to be changed, and a new 128KB block to be written out.  
>  As a result, the official recommendation is to use a block size which aligns with the underlying workload: so for example if you are using a database which reads and writes 16KB chunks then you should use a 16KB block size, and if you are running VMs containing an ext4 filesystem, which uses a 4KB block size, you should set a 4KB block size  
>  You can see it has a 16GB total file size, of which 8.5G has been touched and consumes space - that is, it’s a “sparse” file. The used space is also visible by looking at the zfs filesystem which this file resides in  
>  Then I tried to copy the image file whilst maintaining its “sparseness”, that is, only touching the blocks of the zvol which needed to be touched. The original used only 8.42G, but the copy uses 14.6GB - almost the entire 16GB has been touched! What’s gone wrong?  
>  I finally realised that the difference between the zfs filesystem and the zvol is the block size. I recreated the zvol with a 128K block size  
>  That’s better. The disk usage of the zvol is now exactly the same as for the sparse file in the filesystem dataset
>
>

* It does impact the read speed too. 4K blocks took 5:52, and 128K blocks took 3:20
* Part of this is the amount of metadata that has to be read, see the MySQL benchmarks from earlier in the show
* And yes, using a larger block size will increase the compression efficiency, since the compressor has more redundant data to optimize.
* Some of the savings, and the speedup is because a lot less metadata had to be written
* Your zpool layout also plays a big role, if you use 4Kn disks, and RAID-Z2, using a volblocksize of 8k will actually result in a large amount of wasted space because of RAID-Z padding. Although, if you enable compression, your 8k records may compress to only 4k, and then all the numbers change again.

---

\###[Using a Raspberry Pi 2 as a Router on a Stick Starring NetBSD](https://www.fukr.org.uk/?p=184)

* Sorry we didn’t answer you quickly enough

>
>
> A few weeks ago I set about upgrading my feeble networking skills by playing around with a Cisco 2970 switch. I set up a couple of VLANs and found the urge to set up a router to route between them. The 2970 isn’t a modern layer 3 switch so what am I to do?
>
>

>
>
> Why not make use of the Raspberry Pi 2 that I’ve never used and put it to some good use as a ‘router on a stick’.
>
>

>
>
> I could install a Linux based OS as I am quite familiar with it but where’s the fun in that? In my home lab I use SmartOS which by the way is a shit hot hypervisor but as far as I know there aren’t any Illumos distributions for the Raspberry Pi. On the desktop I use Solus OS which is by far the slickest Linux based OS that I’ve had the pleasure to use but Solus’ focus is purely desktop. It’s looking like BSD then!
>
>

>
>
> I believe FreeBSD is renowned for it’s top notch networking stack and so I wrote to the BSDNow show on Jupiter Broadcasting for some help but it seems that the FreeBSD chaps from the show are off on a jolly to some BSD conference or another(love the show by the way).
>
>

>
>
> It looks like me and the luvverly NetBSD are on a date this Saturday. I’ve always had a secret love for NetBSD. She’s a beautiful, charming and promiscuous lover(looking at the supported architectures) and I just can’t stop going back to her despite her misgivings(ahem, zfs). Just my type of grrrl!
>
>

>
>
> Let’s crack on…
>
>

* Follow the link above to see the rest of the article

---

\##Beastie Bits

* [BSD Jobs](https://www.bsdjobs.com/)
* [University of Aberdeen’s Internet Transport Research Group is hiring](https://lists.freebsd.org/pipermail/freebsd-jobs/2018-May/000944.html)
* [VR demo on OpenBSD via OpenHMD with OSVR HDK2](https://youtu.be/YnNpgtjrM9U)
* [patch runs ed, and ed can run anything (mentions FreeBSD and OpenBSD)](https://rachelbythebay.com/w/2018/04/05/bangpatch/)
* [Alacritty (OpenGL-powered terminal emulator) now supports OpenBSD](https://github.com/jwilm/alacritty/blob/master/README.md)
* [MAP\_STACK Stack Register Checking Committed to -current](https://undeadly.org/cgi?action=article;sid=20180413065457)
* [EuroBSDCon CfP till June 17, 2018](https://2018.eurobsdcon.org/call-for-papers/)

---

**Tarsnap**

\##Feedback/Questions

* NeutronDaemon - [Tutorial request](http://dpaste.com/3E0SR5Y#wrap)
* Kurt - [Question about transferability/bi-directionality of ZFS snapshots and send/receive](http://dpaste.com/01CWKM5#wrap)
* Peter - [A Question and much love for BSD Now](http://dpaste.com/3N1BGQF#wrap)
* Peter - [netgraph state](http://dpaste.com/20R2DTG)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---