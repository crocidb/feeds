+++
title = "Episode 268: Netcat Demystified | BSD Now 268"
description = '6 metrics for zpool performance, 2FA with ssh on OpenBSD, ZFS maintaining file type information in dirs, everything old is new again, netcat demystified, and more.\Headlines   \[Six Metrics for Measuring ZFS Pool Performance Part 1](https://www.ixsystems.com/blog/zfs-pool-pe'
date = "2018-10-17T05:00:00Z"
url = "https://www.bsdnow.tv/268"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.699896170Z"
seen = true
+++

6 metrics for zpool performance, 2FA with ssh on OpenBSD, ZFS maintaining file type information in dirs, everything old is new again, netcat demystified, and more.

\##Headlines  
 \###[Six Metrics for Measuring ZFS Pool Performance Part 1](https://www.ixsystems.com/blog/zfs-pool-performance-1/)

>
>
> The layout of a ZFS storage pool has a significant impact on system performance under various workloads. Given the importance of picking the right configuration for your workload and the fact that making changes to an in-use ZFS pool is far from trivial, it is important for an administrator to understand the mechanics of pool performance when designing a storage system.
>
>

* To quantify pool performance, we will consider six primary metrics:
* Read I/O operations per second (IOPS)
* Write IOPS
* Streaming read speed
* Streaming write speed
* Storage space efficiency (usable capacity after parity versus total raw capacity)
* Fault tolerance (maximum number of drives that can fail before data loss)
* For the sake of comparison, we’ll use an example system with 12 drives, each one sized at 6TB, and say that each drive does 100MB/s streaming reads and writes and can do 250 read and write IOPS. We will visualize how the data is spread across the drives by writing 12 multi-colored blocks, shown below. The blocks are written to the pool starting with the brown block on the left (number one), and working our way to the pink block on the right (number 12).

>
>
> Note that when we calculate data rates and IOPS values for the example system, they are only approximations. Many other factors can impact pool access speeds for better (compression, caching) or worse (poor CPU performance, not enough memory).  
>  There is no single configuration that maximizes all six metrics. Like so many things in life, our objective is to find an appropriate balance of the metrics to match a target workload. For example, a cold-storage backup system will likely want a pool configuration that emphasizes usable storage space and fault tolerance over the other data-rate focused metrics.  
>  Let’s start with a quick review of ZFS storage pools before diving into specific configuration options. ZFS storage pools are comprised of one or more virtual devices, or vdevs. Each vdev is comprised of one or more storage providers, typically physical hard disks. All disk-level redundancy is configured at the vdev level. That is, the RAID layout is set on each vdev as opposed to on the storage pool. Data written to the storage pool is then striped across all the vdevs. Because pool data is striped across the vdevs, the loss of any one vdev means total pool failure. This is perhaps the single most important fact to keep in mind when designing a ZFS storage system. We will circle back to this point in the next post, but keep it in mind as we go through the vdev configuration options.  
>  Because storage pools are made up of one or more vdevs with the pool data striped over the top, we’ll take a look at pool configuration in terms of various vdev configurations. There are three basic vdev configurations: striping, mirroring, and RAIDZ (which itself has three different varieties). The first section will cover striped and mirrored vdevs in this post; the second post will cover RAIDZ and some example scenarios.  
>  A striped vdev is the simplest configuration. Each vdev consists of a single disk with no redundancy. When several of these single-disk, striped vdevs are combined into a single storage pool, the total usable storage space would be the sum of all the drives. When you write data to a pool made of striped vdevs, the data is broken into small chunks called “blocks” and distributed across all the disks in the pool. The blocks are written in “round-robin” sequence, meaning after all the disks receive one row of blocks, called a stripe, it loops back around and writes another stripe under the first. A striped pool has excellent performance and storage space efficiency, but absolutely zero fault tolerance. If even a single drive in the pool fails, the entire pool will fail and all data stored on that pool will be lost.  
>  The excellent performance of a striped pool comes from the fact that all of the disks can work independently for all read and write operations. If you have a bunch of small read or write operations (IOPS), each disk can work independently to fetch the next block. For streaming reads and writes, each disk can fetch the next block in line synchronized with its neighbors. For example, if a given disk is fetching block n, its neighbor to the left can be fetching block n-1, and its neighbor to the right can be fetching block n+1. Therefore, the speed of all read and write operations as well as the quantity of read and write operations (IOPS) on a striped pool will scale with the number of vdevs. Note here that I said the speeds and IOPS scale with the number of vdevs rather than the number of drives; there’s a reason for this and we’ll cover it in the next post when we discuss RAID-Z.  
>  Here’s a summary of the total pool performance (where N is the number of disks in the pool):
>
>

* N-wide striped:
* Read IOPS: N \* Read IOPS of a single drive
* Write IOPS: N \* Write IOPS of a single drive
* Streaming read speed: N \* Streaming read speed of a single drive
* Streaming write speed: N \* Streaming write speed of a single drive
* Storage space efficiency: 100%
* Fault tolerance: None!

>
>
> Let’s apply this to our example system, configured with a 12-wide striped pool:
>
>

* 12-wide striped:
* Read IOPS: 3000
* Write IOPS: 3000
* Streaming read speed: 1200 MB/s
* Streaming write speed: 1200 MB/s
* Storage space efficiency: 72 TB
* Fault tolerance: None!
* Below is a visual depiction of our 12 rainbow blocks written to this pool configuration:

>
>
> The blocks are simply striped across the 12 disks in the pool. The LBA column on the left stands for “Logical Block Address”. If we treat each disk as a column in an array, each LBA would be a row. It’s also easy to see that if any single disk fails, we would be missing a color in the rainbow and our data would be incomplete. While this configuration has fantastic read and write speeds and can handle a ton of IOPS, the data stored on the pool is very vulnerable. This configuration is not recommended unless you’re comfortable losing all of your pool’s data whenever any single drive fails.  
>  A mirrored vdev consists of two or more disks. A mirrored vdev stores an exact copy of all the data written to it on each one of its drives. Traditional RAID-1 mirrors usually only support two drive mirrors, but ZFS allows for more drives per mirror to increase redundancy and fault tolerance. All disks in a mirrored vdev have to fail for the vdev, and thus the whole pool, to fail. Total storage space will be equal to the size of a single drive in the vdev. If you’re using mismatched drive sizes in your mirrors, the total size will be that of the smallest drive in the mirror.  
>  Streaming read speeds and read IOPS on a mirrored vdev will be faster than write speeds and IOPS. When reading from a mirrored vdev, the drives can “divide and conquer” the operations, similar to what we saw above in the striped pool. This is because each drive in the mirror has an identical copy of the data. For write operations, all of the drives need to write a copy of the data, so the mirrored vdev will be limited to the streaming write speed and IOPS of a single disk.
>
>

>
>
> Here’s a summary:
>
>

* N-way mirror:

* Read IOPS: N \* Read IOPS of a single drive

* Write IOPS: Write IOPS of a single drive

* Streaming read speed: N \* Streaming read speed of a single drive

* Streaming write speed: Streaming write speed of a single drive

* Storage space efficiency: 50% for 2-way, 33% for 3-way, 25% for 4-way, etc. [(N-1)/N]

* Fault tolerance: 1 disk per vdev for 2-way, 2 for 3-way, 3 for 4-way, etc. [N-1]

* For our first example configuration, let’s do something ridiculous and create a 12-way mirror. ZFS supports this kind of thing, but your management probably will not.

* 1x 12-way mirror:

* Read IOPS: 3000

* Write IOPS: 250

* Streaming read speed: 1200 MB/s

* Streaming write speed: 100 MB/s

* Storage space efficiency: 8.3% (6 TB)

* Fault tolerance: 11

>
>
> As we can clearly see from the diagram, every single disk in the vdev gets a full copy of our rainbow data. The chainlink icons between the disk labels in the column headers indicate the disks are part of a single vdev. We can lose up to 11 disks in this vdev and still have a complete rainbow. Of course, the data takes up far too much room on the pool, occupying a full 12 LBAs in the data array.
>
>

>
>
> Obviously, this is far from the best use of 12 drives. Let’s do something a little more practical and configure the pool with the ZFS equivalent of RAID-10. We’ll configure six 2-way mirror vdevs. ZFS will stripe the data across all 6 of the vdevs. We can use the work we did in the striped vdev section to determine how the pool as a whole will behave. Let’s first calculate the performance per vdev, then we can work on the full pool:
>
>

* 1x 2-way mirror:

* Read IOPS: 500

* Write IOPS: 250

* Streaming read speed: 200 MB/s

* Streaming write speed: 100 MB/s

* Storage space efficiency: 50% (6 TB)

* Fault tolerance: 1

* Now we can pretend we have 6 drives with the performance statistics listed above and run them through our striped vdev performance calculator to get the total pool’s performance:

* 6x 2-way mirror:

* Read IOPS: 3000

* Write IOPS: 1500

* Streaming read speed: 3000 MB/s

* Streaming write speed: 1500 MB/s

* Storage space efficiency: 50% (36 TB)

* Fault tolerance: 1 per vdev, 6 total

* Again, we will examine the configuration from a visual perspective:

>
>
> Each vdev gets a block of data and ZFS writes that data to all of (or in this case, both of) the disks in the mirror. As long as we have at least one functional disk in each vdev, we can retrieve our rainbow. As before, the chain link icons denote the disks are part of a single vdev. This configuration emphasizes performance over raw capacity but doesn’t totally disregard fault tolerance as our striped pool did. It’s a very popular configuration for systems that need a lot of fast I/O. Let’s look at one more example configuration using four 3-way mirrors. We’ll skip the individual vdev performance calculation and go straight to the full pool:
>
>

* 4x 3-way mirror:
* Read IOPS: 3000
* Write IOPS: 1000
* Streaming read speed: 3000 MB/s
* Streaming write speed: 400 MB/s
* Storage space efficiency: 33% (24 TB)
* Fault tolerance: 2 per vdev, 8 total

>
>
> While we have sacrificed some write performance and capacity, the pool is now extremely fault tolerant. This configuration is probably not practical for most applications and it would make more sense to use lower fault tolerance and set up an offsite backup system.  
>  Striped and mirrored vdevs are fantastic for access speed performance, but they either leave you with no redundancy whatsoever or impose at least a 50% penalty on the total usable space of your pool. In the next post, we will cover RAIDZ, which lets you keep data redundancy without sacrificing as much storage space efficiency. We’ll also look at some example workload scenarios and decide which layout would be the best fit for each.
>
>

---

\###[2FA with ssh on OpenBSD](https://chown.me/blog/2FA-with-ssh-on-OpenBSD.html)

>
>
> Five years ago I wrote about using a yubikey on OpenBSD. The only problem with doing this is that there’s no validation server available on OpenBSD, so you need to use a different OTP slot for each machine. (You don’t want to risk a replay attack if someone succeeds in capturing an OTP on one machine, right?) Yubikey has two OTP slots per device, so you would need a yubikey for every two machines with which you’d like to use it. You could use a bastion—and use only one yubikey—but I don’t like the SPOF aspect of a bastion. YMMV.  
>  After I played with TOTP, I wanted to use them as a 2FA for ssh. At the time of writing, we can’t do that using only the tools in base. This article focuses on OpenBSD; if you use another operating system, here are two handy links.
>
>

* SEED CONFIGURATION

>
>
> The first thing we need to do is to install the software which will be used to verify the OTPs we submit.
>
>

`# pkg_add login_oath`

>
>
> We need to create a secret - aka, the seed - that will be used to calculate the Time-based One-Time Passwords. We should make sure no one can read or change it.
>
>

`$ openssl rand -hex 20 > ~/.totp-key`  
`$ chmod 400 ~/.totp-key`

>
>
> Now we have a hexadecimal key, but apps usually want a base32 secret. I initially wrote a small script to do the conversion.  
>  While writing this article, I took the opportunity to improve it. When I initially wrote this utility for my use, python-qrcode hadn’t yet been imported to the OpenBSD ports/packages system. It’s easy to install now, so let’s use it.  
>  Here’s the improved version. It will ask for the hex key and output the secret as a base32-encoded string, both with and without spacing so you can copy-paste it into your password manager or easily retype it. It will then ask for the information needed to generate a QR code. Adding our new OTP secret to any mobile app using the QR code will be super easy!
>
>

* SYSTEM CONFIGURATION

>
>
> We can now move to the configuration of the system to put our new TOTP to use. As you might guess, it’s going to be quite close to what we did with the yubikey.  
>  We need to tweak login.conf. Be careful and keep a root shell open at all times. The few times I broke my OpenBSD were because I messed with login.conf without showing enough care.
>
>

* SSHD CONFIGURATION

>
>
> Again, keeping a root shell around decreases the risk of losing access to the system and being locked outside.  
>  A good standard is to use PasswordAuthentication no and to use public key only. Except… have a guess what the P stands for in TOTP. Yes, congrats, you guessed it!  
>  We need to switch to PasswordAuthentication yes. However, if we made this change alone, sshd would then accept a public key OR a password (which are TOTP because of our login.conf). 2FA uses both at the same time.  
>  To inform sshd we intend to use both, we need to set AuthenticationMethods publickey,password. This way, the user trying to login will first need to perform the traditional publickey authentication. Once that’s done, ssh will prompt for a password and the user will need to submit a valid TOTP for the system.  
>  We could do this the other way around, but I think bots could try passwords, wasting resources. Evaluated in this order, failing to provide a public key leads to sshd immediately declining your attempt.
>
>

* IMPROVING SECURITY WITHOUT IMPACTING UX

>
>
> My phone has a long enough password that most of the time, I fail to type it correctly on the first try. Of course, if I had to unlock my phone, launch my TOTP app and use my keyboard to enter what I see on my phone’s screen, I would quickly disable 2FA.  
>  To find a balance, I have whitelisted certain IP addresses and users. If I connect from a particular IP address or as a specific user, I don’t want to go through 2FA. For some users, I might not even enable 2FA.  
>  To sum up, we covered how to create a seed, how to perform a hexadecimal to base32 conversion and how to create a QR code for mobile applications. We configured the login system with login.conf so that ssh authentication uses the TOTP login system, and we told sshd to ask for both the public key and the Time-based One-Time Password. Now you should be all set to use two-factor ssh authentication on OpenBSD!
>
>

---

\##News Roundup  
 \###[How ZFS maintains file type information in directories](https://utcc.utoronto.ca/~cks/space/blog/solaris/ZFSAndDirectoryDType)

>
>
> As an aside in yesterday’s history of file type information being available in Unix directories, I mentioned that it was possible for a filesystem to support this even though its Unix didn’t. By supporting it, I mean that the filesystem maintains this information in its on disk format for directories, even though the rest of the kernel will never ask for it. This is what ZFS does.  
>  The easiest way to see that ZFS does this is to use zdb to dump a directory. I’m going to do this on an OmniOS machine, to make it more convincing, and it turns out that this has some interesting results. Since this is OmniOS, we don’t have the convenience of just naming a directory in zdb, so let’s find the root directory of a filesystem, starting from dnode 1 (as seen before).
>
>

`# zdb -dddd fs3-corestaff-01/h/281 1`  
`Dataset [....]`  
`[...]`  
`microzap: 512 bytes, 4 entries`  
`[...]`  
`ROOT = 3`  
``  
`# zdb -dddd fs3-corestaff-01/h/281 3`  
`Object lvl iblk dblk dsize lsize %full type`  
`3 1 16K 1K 8K 1K 100.00 ZFS directory`  
`[...]`  
`microzap: 1024 bytes, 8 entries`  
``  
`RESTORED = 4396504 (type: Directory)`  
`ckstst = 12017 (type: not specified)`  
`ckstst3 = 25069 (type: Directory)`  
`.demo-file = 5832188 (type: Regular File)`  
`.peergroup = 12590 (type: not specified)`  
`cks = 5 (type: not specified)`  
`cksimap1 = 5247832 (type: Directory)`  
`.diskuse = 12016 (type: not specified)`  
`ckstst2 = 12535 (type: not specified)`

>
>
> This is actually an old filesystem (it dates from Solaris 10 and has been transferred around with ‘zfs send | zfs recv’ since then), but various home directories for real and test users have been created in it over time (you can probably guess which one is the oldest one). Sufficiently old directories and files have no file type information, but more recent ones have this information, including .demo-file, which I made just now so this would have an entry that was a regular file with type information.  
>  Once I dug into it, this turned out to be a change introduced (or activated) in ZFS filesystem version 2, which is described in ‘zfs upgrade -v’ as ‘enhanced directory entries’. As an actual change in (Open)Solaris, it dates from mid 2007, although I’m not sure what Solaris release it made it into. The upshot is that if you made your ZFS filesystem any time in the last decade, you’ll have this file type information in your directories.  
>  How ZFS stores this file type information is interesting and clever, especially when it comes to backwards compatibility. I’ll start by quoting the comment from zfs\_znode.h:
>
>

`/*`  
`* The directory entry has the type (currently unused on`  
`* Solaris) in the top 4 bits, and the object number in`  
`* the low 48 bits. The "middle" 12 bits are unused.`  
`*/`

>
>
> In yesterday’s entry I said that Unix directory entries need to store at least the filename and the inode number of the file. What ZFS is doing here is reusing the 64 bit field used for the ‘inode’ (the ZFS dnode number) to also store the file type, because it knows that object numbers have only a limited range. This also makes old directory entries compatible, by making type 0 (all 4 bits 0) mean ‘not specified’. Since old directory entries only stored the object number and the object number is 48 bits or less, the higher bits are guaranteed to be all zero.  
>  The reason this needed a new ZFS filesystem version is now clear. If you tried to read directory entries with file type information on a version of ZFS that didn’t know about them, the old version would likely see crazy (and non-existent) object numbers and nothing would work. In order to even read a ‘file type in directory entries’ filesystem, you need to know to only look at the low 48 bits of the object number field in directory entries.
>
>

---

\###[Everything old is new again](https://euroquis.nl/bobulate/?p=1976)

>
>
> Just because KDE4-era software has been deprecated by the KDE-FreeBSD team in the official ports-repository, doesn’t mean we don’t care for it while we still need to. KDE4 was released on January 11th, 2008 — I still have the T-shirt — which was a very different C++ world than what we now live in. Much of the code pre-dates the availability of C11 — certainly the availability of compilers with C11 support. The language has changed a great deal in those ten years since the original release.  
>  The platforms we run KDE code on have, too — FreeBSD 12 is a long way from the FreeBSD 6 or 7 that were current at release (although at the time, I was more into OpenSolaris). In particular, since then the FreeBSD world has switched over to Clang, and FreeBSD current is experimenting with Clang 7. So we’re seeing KDE4-era code being built, and running, on FreeBSD 12 with Clang 7. That’s a platform with a very different idea of what constitutes correct code, than what the code was originally written for. (Not quite as big a difference as Helio’s KDE1 efforts, though)  
>  So, while we’re counting down to removing KDE4 from the FreeBSD ports tree, we’re also going through and fixing it to work with Clang 7, which defaults to a newer C++ standard and which is quite picky about some things. Some time in the distant past, when pointers were integers and NULL was zero, there was some confusion about booleans. So there’s lots of code that does list.contains(element) \> 0 … this must have been a trick before booleans were a supported type in all our compilers. In any case it breaks with Clang 7, since contains() returns a QBool which converts to a nullptr (when false) which isn’t comparable to the integer 0. Suffice to say I’ve spent more time reading KDE4-era code this month, than in the past two years.  
>  However, work is proceeding apace, so if you really really want to, you can still get your old-school kicks on a new platform. Because we care about packaging things right, even when we want to get rid of it.
>
>

---

\###[OpenBSD netcat demystified](https://nanxiao.gitbooks.io/openbsd-netcat-demystified/)

>
>
> Owing to its versatile functionalities, netcat earns the reputation as “TCP/IP Swiss army knife”. For example, you can create a simple chat app using netcat:
>
>

* (1) Open a terminal and input following command:

`# nc -l 3003`

>
>
> This means a netcat process will listen on 3003 port in this machine (the IP address of current machine is 192.168.35.176).
>
>

* (2) Connect aforemontioned netcat process in another machine, and send a greeting:

`# nc 192.168.35.176 3003`  
`hello`

>
>
> Then in the first machine’s terminal, you will see the “hello” text:
>
>

`# nc -l 3003`  
`hello`

>
>
> A primitive chatroom is built successfully. Very cool! Isn’t it? I think many people can’t wait to explore more features of netcatnow. If you are among them, congratulations! This tutorial may be the correct place for you.  
>  In the following parts, I will delve into OpenBSD’s netcatcode to give a detailed anatomy of it. The reason of picking OpenBSD’s netcat rather than others’ is because its code repository is small (\~2000 lines of code) and neat. Furthermore, I also hope this little book can assist you learn more socket programming knowledge not just grasping usage of netcat.  
>  We’re all set. Let’s go!
>
>

---

\##Beastie Bits

* [What’s in store for NetBSD 9.0](https://www.geeklan.co.uk/files/eurobsdcon2018.pdf)
* [NetBSD machines at Open Source Conference 2018 Hiroshima](https://mail-index.netbsd.org/netbsd-advocacy/2018/09/25/msg000783.html)
* [nmctl adapted with limited privileges: nmctl-0.6.0](http://vincentdelft.be/post/post_20180922)
* [Submit Your Work: Check out SCALE 17x and FOSDEM ’19 CFPs](https://www.freebsdfoundation.org/blog/submit-your-work-check-out-scale-17x-and-fosdem-19-cfps/)
* [OpenBSD 6.4 site is up! (with a partial list of new features)](https://www.openbsd.org/64.html)
* [Using Alpine to Read Your Email on OpenBSD](https://www.blackcatenterprises.us/using-alpine-to-read-your-email/)

---

\##Feedback/Questions

* Morgan - [Send/Receive to Manage Fragmentation?](http://dpaste.com/0EXPWQK#wrap)
* Ryan - [ZFS and mmap](http://dpaste.com/0B6C0Y0)
* Marcus - [Linux Compat](http://dpaste.com/1DT26S8#wrap)
* Ben - [Multiple Pools](http://dpaste.com/20GTHZE#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---