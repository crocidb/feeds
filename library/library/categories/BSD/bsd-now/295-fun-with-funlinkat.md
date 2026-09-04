+++
title = "295: Fun with funlinkat()"
description = "Introducing funlinkat(), an OpenBSD Router with AT&T U-Verse, using NetBSD on a raspberry pi, ZFS encryption is still under development, Rump kernel servers and clients tutorial, Snort on OpenBSD 6.4, and more.Headlines[Introducing funlinkat](https://oshogbo.vexilli"
date = "2019-04-25T20:00:00Z"
url = "https://www.bsdnow.tv/295"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.644009382Z"
seen = true
+++

Introducing funlinkat(), an OpenBSD Router with AT&T U-Verse, using NetBSD on a raspberry pi, ZFS encryption is still under development, Rump kernel servers and clients tutorial, Snort on OpenBSD 6.4, and more.

Headlines
----------

### [Introducing funlinkat](https://oshogbo.vexillium.org/blog/63/) ###

* It turns out, every file you have ever deleted on a unix machine was probably susceptible to a race condition

>
>
> One of the first syscalls which was created in Unix-like systems is unlink. In FreeBSD this syscall is number 10 (source) and in Linux, the number is dependent on the architecture but for most of them is also the tenth syscall (source). This indicated that this is one of the primary syscalls. The unlink syscall is very simple and we provide one single path to the file that we want to remove. The “removing file” process itself is very interesting so let’s spend a moment to understand the it. First, by removing the file we are removing a link from the directory to it. In Unix-like systems we can have many links to a single file (hard links). When we remove all links to the file, the file system will mark the blocks used by the file as free (a different file system will behave differently but let’s not jump into a second digression). This is why the process is called unlinking and not “removing file”. While we unlink the file two or three things will happen:
>
>
>
> * We will remove an entry in the directory with the filename.
> * We will decrease a file reference count (in inode).
> * If links go to zero - the file will be removed from the disk (again this doesn't mean that the blocks from the disk will be filled with zeros, though this may happen depending on the file system and configuration. However, in most cases this means that the file system will mark those blocks to as free and use them to write new data later This mostly means that “removing file” from a directory is an operation on the directory and not on the file (inode) itself. Another interesting subject is what happens if our system will perform only first or second step from the list. This depends on the file system and this is also something we will leave for another time. The problem with the unlink and even unlinkat function is that we don’t have any guarantee of which file we really are unlinking.
>   * When you delete a file using its name, you have no guarantee that someone has not already deleted the file, or renamed it, and created a new file with the name you are about to delete. We have some stats about the file that we want to unlink. We performed some tests. In the same time another process removed our file and recreated it. When we finally try to remove our file it is no longer the same file. It’s a classic race condition.
>   * Many programs will perform checks before trying to remove a file, to make sure it is the correct file, that you have the correct permissions etc. However this exposes the ‘Time-of-Check / Time-of-Use’ class of bugs. I check if the file I am about to remove is the one I created yesterday, it is, so I call unlink() on it. However, between when I checked the date on the file, and when I call unlink, I, some program I am running, might have updated the file. Or a malicious user might have put some other file at that name, so I would be the one who deleted it. In Unix-like operating systems we can get a handle for our file called file - a descriptor. File descriptors guarantee us that all the operations that we will be performing on it are done on the same file (inode). Even if someone was to unlink a number of directories entries, the operating system will not free the structures behind the file descriptor, and we can detect the file that was removed by someone and recreated (or just unlinked). So, for example, we have an alternative functions fstat which allows us to get file status of the given descriptor We already know that the file may have many links on the disk which point to the single inode. What happens when we open the file? Simplifying: kernel creates a memory representation of the inode (the inode itself is stored on the disk) called vnode. This single representation is used by all processes to refer the inode to the disk. If in a process we open the same file (inode) using different names (for example through hard links) all those files will be linked to the single vnode. That means that the pathname is not stored in the kernel. This is basically the reason why we don’t have a funlink function so that instead of the path we are providing just the file descriptor to the file. If we performed the fdunlink syscall, the kernel wouldn’t know which directory entry you would like to remove. Another problem is more architectural: as we discussed earlier unlinking is really an operation on the directory not on the file (inode) itself, so using funlink(fd) may create some confusion because we are not removing the inode corresponding to the file descriptor, we are performing action on the directory which points to the file. After some discussion we decided that the only sensible option for FreeBSD would be to create a funlinkat() function. This syscall would only performs additional sanitary checks if we are removing a directory entry which corresponds to the inode stored which refers to the file descriptor. int funlinkat(int dfd, const char \*path, int fd, int flags); The API above will check if the path opened relative to the dfd points to the same vnode. Thanks to that we removed a race condition because all those sanitary checks are performed in the kernel mode while the file system is locked and there is no possibility to change it. The fd parameter may be set to the FD\_NONE value which will mean that the sanitary check should not be performed and funlinkat will behave just like unlinkat. As you can notice I often refer to the unlink syscall but at the end the APIs looks like unlinkat syscall. It is true that the unlink syscall is very old and kind of deprecated. That said I referred to unlink because it’s just simpler. These days unlink simply uses the same code as unlinkat.
>   
>   
>
>
> ---
>

### [Using an OpenBSD Router with AT&T U-Verse](https://jcs.org/2019/03/21/uverse) ###

>
>
> I upgraded to AT&T's U-verse Gigabit internet service in 2017 and it came with an Arris BGW-210 as the WiFi AP and router. The BGW-210 is not a terrible device, but I already had my own Airport Extreme APs wired throughout my house and an OpenBSD router configured with various things, so I had no use for this device. It's also a potentially-insecure device that I can't upgrade or fully disable remote control over. Fully removing the BGW-210 is not possible as we'll see later, but it is possible to remove it from the routing path. This is how I did it with OpenBSD.
>
>
> ---
>

News Roundup
----------

### [How to use NetBSD on a Raspberry Pi](https://opensource.com/article/19/3/netbsd-raspberry-pi) ###

>
>
> Do you have an old Raspberry Pi lying around gathering dust, maybe after a recent Pi upgrade? Are you curious about BSD Unix? If you answered "yes" to both of these questions, you'll be pleased to know that the first is the solution to the second, because you can run NetBSD, as far back as the very first release, on a Raspberry Pi. BSD is the Berkley Software Distribution of Unix. In fact, it's the only open source Unix with direct lineage back to the original source code written by Dennis Ritchie and Ken Thompson at Bell Labs. Other modern versions are either proprietary (such as AIX and Solaris) or clever re-implementations (such as Minix and GNU/Linux). If you're used to Linux, you'll feel mostly right at home with BSD, but there are plenty of new commands and conventions to discover. If you're still relatively new to open source, trying BSD is a good way to experience a traditional Unix. Admittedly, NetBSD isn't an operating system that's perfectly suited for the Pi. It's a minimal install compared to many Linux distributions designed specifically for the Pi, and not all components of recent Pi models are functional under NetBSD yet. However, it's arguably an ideal OS for the older Pi models, since it's lightweight and lovingly maintained. And if nothing else, it's a lot of fun for any die-hard Unix geek to experience another side of the POSIX world.
>
>
> ---
>

### [ZFS Encryption is still under development (as of March 2019)](https://utcc.utoronto.ca/~cks/space/blog/linux/ZFSEncryptionNotReady) ###

>
>
> One of the big upcoming features that a bunch of people are looking forward to in ZFS is natively encrypted filesystems. This is already in the main development tree of ZFS On Linux, will likely propagate to FreeBSD (since FreeBSD ZFS will be based on ZoL), and will make it to Illumos if the Illumos people want to pull it in. People are looking forward to native encryption so much, in fact, that some of them have started using it in ZFS On Linux already, using either the development tip or one of the 0.8.0 release candidate pre-releases (ZoL is up to 0.8.0-rc3 as of now). People either doing this or planning to do this show up on the ZoL mailing list every so often.
>
>
>
> * [CFT for FreeBSD + ZoL](https://lists.freebsd.org/pipermail/freebsd-stable/2019-April/090915.html)
>
>
> ---
>

### [Tutorial On Rump Kernel Servers and Clients](https://www.netbsd.org/docs/rump/sptut.html) ###

>
>
> The rump anykernel architecture allows to run highly componentized kernel code configurations in userspace processes. Coupled with the rump sysproxy facility it is possible to run loosely distributed client-server "mini-operating systems". Since there is minimum configuration and the bootstrap time is measured in milliseconds, these environments are very cheap to set up, use, and tear down on-demand. This document acts as a tutorial on how to configure and use unmodified NetBSD kernel drivers as userspace services with utilities available from the NetBSD base system. As part of this, it presents various use cases. One uses the kernel cryptographic disk driver (cgd) to encrypt a partition. Another one demonstrates how to operate an FFS server for editing the contents of a file system even though your user account does not have privileges to use the host's mount() system call. Additionally, using a userspace TCP/IP server with an unmodified web browser is detailed.
>
>
> ---
>

### [Installing Snort on OpenBSD 6.4](https://functionallyparanoid.com/2019/03/18/installing-snort-on-openbsd-6-4/) ###

>
>
> As you may recall from previous posts, I am running an OpenBSD server on an APU2 air-cooled 3 Intel NIC box as my router/firewall for my secure home network. Given that all of my Internet traffic flows through this box, I thought it would be a cool idea to run an Intrusion Detection System (IDS) on it. Snort is the big hog of the open source world so I took a peek in the packages directory on one of the mirrors and lo and behold we have the latest & greatest version of Snort available! Thanks devs!!! I did some quick Googling and didn’t find much “modern” howto help out there so, after some trial and error, I have it up and running. I thought I’d give back in a small way and share a quickie howto for other Googlers out there who are looking for guidance. Here’s hoping that my title is good enough “SEO” to get you here!
>
>
> ---
>

Beastie Bits
----------

* [os108](https://os108.org/)
* [AT&T Archives: The UNIX Operating System](https://www.youtube.com/watch?v=tc4ROCJYbm0&feature=youtu.be)
* [httpd(8): Adapt to industry wide current best security practices](https://marc.info/?l=openbsd-tech&m=155407864604288&w=2)
* [Quotes From A Book That Bashes Unix](https://codesmithdev.com/quotes-from-a-book-that-bashes-unix/)
* [OpenBSD QA wiki](https://github.com/ligurio/openbsd-tests/wiki)

---

Feedback/Questions
----------

* Malcolm - [Laptop Experience : Dell XPS 13](http://dpaste.com/1AFFTNJ)
* DJ - [Feedback](http://dpaste.com/0V74SZC#wrap)
* Alex - [GhostBSD and Wifi : FIXED](http://dpaste.com/1WVV1W7)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

 Your browser does not support the HTML5 video tag.