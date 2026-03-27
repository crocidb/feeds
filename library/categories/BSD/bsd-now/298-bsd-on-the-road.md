+++
title = "298: BSD On The Road"
description = "36 year old UFS bug fixed, a BSD for the road, automatic upgrades with OpenBSD, DTrace ext2fs support in FreeBSD, Dedicated SSH tunnel user, upgrading VMM VMs to OpenBSD 6.5, and more.Headlines[36+ year old bug in FFS/UFS discovered and patched ](https://svnweb.free"
date = "2019-05-16T03:00:00Z"
url = "https://www.bsdnow.tv/298"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.638028107Z"
seen = false
+++

36 year old UFS bug fixed, a BSD for the road, automatic upgrades with OpenBSD, DTrace ext2fs support in FreeBSD, Dedicated SSH tunnel user, upgrading VMM VMs to OpenBSD 6.5, and more.

Headlines
----------

### [36+ year old bug in FFS/UFS discovered and patched ](https://svnweb.freebsd.org/base?view=revision&revision=347066) ###

>
>
> This update eliminates a kernel stack disclosure bug in UFS/FFS directory entries that is caused by uninitialized directory entry padding written to the disk.
>
>
>
> * When the directory entry is written to disk, it is written as a full 32bit entry, and the unused bytes were not initialized, so could possibly contain sensitive data from the kernel stack It can be viewed by any user with read access to that directory. Up to 3 bytes of kernel stack are disclosed per file entry, depending on the the amount of padding the kernel needs to pad out the entry to a 32 bit boundary. The offset in the kernel stack that is disclosed is a function of the filename size. Furthermore, if the user can create files in a directory, this 3 byte window can be expanded 3 bytes at a time to a 254 byte window with 75% of the data in that window exposed. The additional exposure is done by removing the entry, creating a new entry with a 4-byte longer name, extracting 3 more bytes by reading the directory, and repeating until a 252 byte name is created. This exploit works in part because the area of the kernel stack that is being disclosed is in an area that typically doesn't change that often (perhaps a few times a second on a lightly loaded system), and these file creates and unlinks themselves don't overwrite the area of kernel stack being disclosed. It appears that this bug originated with the creation of the Fast File System in 4.1b-BSD (Circa 1982, more than 36 years ago!), and is likely present in every Unix or Unix-like system that uses UFS/FFS. Amazingly, nobody noticed until now. This update also adds the -z flag to fsck\_ffs to have it scrub the leaked information in the name padding of existing directories. It only needs to be run once on each UFS/FFS filesystem after a patched kernel is installed and running. Submitted by: David G. Lawrence [dg@dglawrence.com](mailto:dg@dglawrence.com)
> * So a patched kernel will no longer leak this data, and running the `fsck_ffs -z` command will erase any leaked data that may exist on your system
> * [OpenBSD commit with additional detail on mitigations](https://marc.info/?l=openbsd-cvs&m=155699268122858&w=2) The impact on OpenBSD is very limited: 1 - such stack bytes can be found in raw-device reads, from group operator. If you can read the raw disks you can undertake other more powerful actions. 2 - read(2) upon directory fd was disabled July 1997 because I didn't like how grep \* would display garbage and mess up the tty, and applying vis(3) for just directory reads seemed silly. read(2) was changed to return 0 (EOF). Sep 2016 this was further changed to EISDIR, so you still cannot see the bad bytes. 3 - In 2013 when guenther adapted the getdents(2) directory-reading system call to 64-bit ino\_t, the userland data format changed to 8-byte-alignment, making it incompatible with the 4-byte-alignment UFS on-disk format. As a result of code refactoring the bad bytes were not copied to userland. Bad bytes will remain in old directories on old filesystems, but nothing makes those bytes user visible. There will be no errata or syspatch issued. I urge other systems which do expose the information to userland to issue errata quickly, since this is a 254 byte infoleak of the stack which is great for ROP-chain building to attack some other bug. Especially if the kernel has no layout/link-order randomization ...
>
>
> ---
>

### [NomadBSD, a BSD for the Road](https://itsfoss.com/nomadbsd/) ###

>
>
> As regular It’s FOSS readers should know, I like diving into the world of BSDs. Recently, I came across an interesting BSD that is designed to live on a thumb drive. Let’s take a look at NomadBSD. NomadBSD is different than most available BSDs. NomadBSD is a live system based on FreeBSD. It comes with automatic hardware detection and an initial config tool. NomadBSD is designed to “be used as a desktop system that works out of the box, but can also be used for data recovery, for educational purposes, or to test FreeBSD’s hardware compatibility.” This German BSD comes with an OpenBox-based desktop with the Plank application dock. NomadBSD makes use of the DSB project. DSB stands for “Desktop Suite (for) (Free)BSD” and consists of a collection of programs designed to create a simple and working environment without needing a ton of dependencies to use one tool. DSB is created by Marcel Kaiser one of the lead devs of NomadBSD. Just like the original BSD projects, you can contact the NomadBSD developers via a mailing list.
>
>

* Version 1.2 Released

>
>
> NomadBSD recently released version 1.2 on April 21, 2019. This means that NomadBSD is now based on FreeBSD 12.0-p3. TRIM is now enabled by default. One of the biggest changes is that the initial command-line setup was replaced with a Qt graphical interface. They also added a Qt5 tool to install NomadBSD to your hard drive. A number of fixes were included to improve graphics support. They also added support for creating 32-bit images.
>
>

* Thoughts on NomadBSD

>
>
> I first discovered NomadBSD back in January when they released 1.2-RC1. At the time, I had been unable to install Project Trident on my laptop and was very frustrated with BSDs. I downloaded NomadBSD and tried it out. I initially ran into issues reaching the desktop, but RC2 fixed that issue. However, I was unable to get on the internet, even though I had an Ethernet cable plugged in. Luckily, I found the wifi manager in the menu and was able to connect to my wifi. Overall, my experience with NomadBSD was pleasant. Once I figured out a few things, I was good to go. I hope that NomadBSD is the first of a new generation of BSDs that focus on mobility and ease of use. BSD has conquered the server world, it’s about time they figured out how to be more user-friendly.
>
>
> ---
>

News Roundup
----------

### [OpenBSD automatic ###

upgrade](https://www.tumfatig.net/20190426/openbsd-automatic-upgrade/)

>
>
> OpenBSD 6.5 advertises for an installer improvement: rdsetroot(8) (a build-time tool) is now available for general use. Used in combination with autoinstall.8, it is now really easy to do automatic upgrades of your OpenBSD instances. I first manually upgraded my OpenBSD sandbox to 6.5. Once that was done, I could use the stock rdsetroot(8) tool. The plan is quite simple: write an unattended installation response file, insert it to a bsd.rd 6.5 installation image and reboot my other OpenBSD instances using that image.
>
>

* Extra notes

>
>
> There must be a way to run onetime commands (in the manner of fw\_update) to automatically run sysmerge and packages upgrades. As for now, I’d rather do it manually. This worked like a charm on two Synology KVM instances using a single sd0 disk, on my Thinkpad X260 using Encrypted root with Keydisk and on a Vultr instance using Encrypted root with passphrase. And BTW, the upgrade on the X260 used the (iwn0) wireless connection. I just read that florian@ has released the sysupgrade(8) utility which should be released with OpenBSD 6.6. That will make upgrades even easier! Until then, happy upgrading.
>
>

---

### [FreeBSD Dtrace ext2fs Support](https://reviews.freebsd.org/D19848) ###

* Which logs were replaced by dtrace-probes:

  * Misc printf's under DEBUG macro in the blocks allocation path.
  * Different on-disk structures validation errors, now the filesystem will silently return EIO's.
  * Misc checksum errors, same as above.

* The only debug macro, which was leaved is EXT2FS*PRINT*EXTENTS.

* It is impossible to replace it by dtrace-probes, because the additional logic is required to walk thru file extents.

* The user still be able to see mount errors in the dmesg in case of:

  * Filesystem features incompatibility.

  * Superblock checksum error.

---

### [Create a dedicated user for ssh tunneling only](https://dataswamp.org/~solene/2019-04-17-ssh-tunneling.html) ###

>
>
> I use ssh tunneling A LOT, for everything. Yesterday, I removed the public access of my IMAP server, it’s now only available through ssh tunneling to access the daemon listening on localhost. I have plenty of daemons listening only on localhost that I can only reach through a ssh tunnel. If you don’t want to bother with ssh and redirect ports you need, you can also make a VPN (using ssh, openvpn, iked, tinc…) between your system and your server. I tend to avoid setting up VPN for the current use case as it requires more work and more maintenance than running ssh server and a ssh client. The last change, for my IMAP server, added an issue. I want my phone to access the IMAP server but I don’t want to connect to my main account from my phone for security reasons. So, I need a dedicated user that will only be allowed to forward ports. This is done very easily on OpenBSD. The steps are: 1. generate ssh keys for the new user 2. add an user with no password 3. allow public key for port forwarding Obviously, you must allow users (or only this one) to make port forwarding in your sshd\_config.
>
>
> ---
>

### [That was easy. Some info on upgrading VMM VMs to 6.5](https://openbsd.amsterdam/upgrade.html) ###

>
>
> We're running dedicated vmm(4)/vmd(8) servers to host opinionated VMs. OpenBSD 6.5 is released! There are two ways you can upgrade your VM. Either do a manual upgrade or leverage autoinstall(8). You can take care of it via the console with vmctl(8).
>
>

* Upgrade yourself

>
>
> To get connected to the console you need to have access to the host your VM is running on. The same username and public SSH key, as provided for the VM, are used to create a local user on the host. When this is done you can use vmctl(8) to manage your VM. The options you have are:
>
>

```
```$ vmctl start id [-c]```

```

$ vmctl stop id [-fw]```

```
```-w Wait until the VM has been terminated.```

```

\-c Automatically connect to the VM console.```

* See the Article for the rest of the guide

---

Beastie Bits
----------

* [powerpc64 architecture support in FreeBSD ports](https://inks.tedunangst.com/l/3791)
* [GhostBSD 19.04 overview](https://twitter.com/ribalinux/status/1117856218251517956)
* [HardenedBSD will have two user selectable ASLR implementations](https://twitter.com/lattera/status/1119018409575026688)
* [NYCBUG 2016 Talk Shell-Fu Uploaded](https://www.youtube.com/watch?v=S_aTzXVRRlM&feature=youtu.be)
* [What is ZIL anyway?](http://blog.zarfhome.com/2019/04/what-is-zil-anyway.html)

---

Feedback/Questions
----------

* Quentin - [Organize an Ada/BSD interview](http://dpaste.com/0K9PQW9#wrap)
* DJ - [Update](http://dpaste.com/3KTQ45G#wrap)
* Patrick - [Bhyve frontends](http://dpaste.com/07V6ZJN)
* A small programming note: After BSDNow episode 300, the podcast will switch to audio-only, using a new higher quality recording and production system. The live stream will likely still include video.

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

 Your browser does not support the HTML5 video tag.