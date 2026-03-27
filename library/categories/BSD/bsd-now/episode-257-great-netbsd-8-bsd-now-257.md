+++
title = "Episode 257: Great NetBSD 8 | BSD Now 257"
description = 'NetBSD 8.0 available, FreeBSD on Scaleway’s ARM64 VPS, encrypted backups with OpenBSD, Dragonfly server storage upgrade, zpool checkpoints, g2k18 hackathon reports, and more.  \Headlines   \NetBSD v8.0 Released'
date = "2018-08-02T07:00:00Z"
url = "https://www.bsdnow.tv/257"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.727342318Z"
seen = false
+++

NetBSD 8.0 available, FreeBSD on Scaleway’s ARM64 VPS, encrypted backups with OpenBSD, Dragonfly server storage upgrade, zpool checkpoints, g2k18 hackathon reports, and more.  

---

\##Headlines  
 \###[NetBSD v8.0 Released](https://www.netbsd.org/releases/formal-8/NetBSD-8.0.html)

>
>
> The NetBSD Project is pleased to announce NetBSD 8.0, the sixteenth major release of the NetBSD operating system.
>
>

>
>
> This release brings stability improvements, hundreds of bug fixes, and many new features.
>
>

* Some highlights of the NetBSD 8.0 release are:

* USB stack rework, USB3 support added.

* In-kernel audio mixer (audio\_system(9)).

* Reproducible builds (MKREPRO, see mk.conf(5)).

* Full userland debug information (MKDEBUG, see mk.conf(5)) available. While most install media do not come with them (for size reasons), the debug and xdebug sets can be downloaded and extracted as needed later. They provide full symbol information for all base system and X binaries and libraries and allow better error reporting and (userland) crash analysis.

* PaX MPROTECT (W^X) memory protection enforced by default on some architectures with fine-grained memory protection and suitable ELF formats: i386, amd64, evbarm, landisk.

* PaX ASLR (Address Space Layout Randomization) enabled by default on: i386, amd64, evbarm, landisk, sparc64.

* Position independent executables by default for userland on: i386, amd64, arm, m68k, mips, sh3, sparc64.

* A new socket layer can(4) has been added for communication of devices on a CAN bus.

* A special pseudo interface ipsecif(4) for route-based VPNs has been added.

* Parts of the network stack have been made MP-safe. The kernel option NET\_MPSAFE is required to enable this.

* Hardening of the network stack in general.

* Various WAPBL (the NetBSD file system “log” option) stability and performance improvements.

* Specific to i386 and amd64 CPUs:

* Meltdown mitigation: SVS (Separate Virtual Space), enabled by default.

* SpectreV2 mitigation: retpoline (support in gcc), used by default for kernels. Other hardware mitigations are also available.

* SpectreV4 mitigations available for Intel and AMD.

* PopSS workaround: user access to debug registers is turned off by default.

* Lazy FPU saving disabled on vulnerable Intel CPUs (“eagerfpu”).

* SMAP support.

* Improvement and hardening of the memory layout: W^X, fewer writable pages, better consistency, better performance.

* (U)EFI bootloader.

* Many evbarm kernels now use FDT (flat device tree) information (loadable at boot time from an external file) for device configuration, the number of kernels has decreased but the number of boards has vastly increased.

* Lots of updates to 3rd party software included:

* GCC 5.5 with support for Address Sanitizer and Undefined Behavior Sanitizer

* GDB 7.12

* GNU binutils 2.27

* Clang/LLVM 3.8.1

* OpenSSH 7.6

* OpenSSL 1.0.2k

* mdocml 1.14.1

* acpica 20170303

* ntp 4.2.8p11-o

* dhcpcd 7.0.6

* Lua 5.3.4

---

\###[Running FreeBSD on the ARM64 VPS from Scaleway](https://community.online.net/t/freebsd-on-arm64/6678)

>
>
> I’ve been thinking about this 6 since 2017, but only yesterday signed up for an account and played around with the ARM64 offering.  
>  Turns out it’s pretty great! KVM boots into UEFI, there’s a local VirtIO disk attached, no NBD junk required. So we can definitely run FreeBSD.  
>  I managed to “depenguinate” a running instance, the notes are below. Would be great if Scaleway offered an official image instead :wink:  
>  For some reason, unlike on x86 4, mounting additional volumes is not allowed 4 on ARM64 instances. So we’ll have to move the running Linux to a ramdisk using pivot\_root and then we can do whatever to our one and only disk.  
>  Spin up an instance with Ubuntu Zesty and ssh in.
>
>

* Prepare the system and change the root to a tmpfs:

```
apt install gdisk
mount -t tmpfs tmpfs /tmp
cp -r /bin /sbin /etc /dev /root /home /lib /run /usr /var /tmp
mkdir /tmp/proc /tmp/sys /tmp/oldroot
mount /dev/vda /tmp/oldroot
mount --make-rprivate /
pivot_root /tmp /tmp/oldroot
for i in dev proc sys run; do mount --move /oldroot/$i /$i; done
systemctl daemon-reload
systemctl restart sshd

```

>
>
> Now reconnect to ssh from a second terminal (note: rm the connection file if you use ControlPersist in ssh config), then exit the old session. Kill the old sshd process, restart or stop the rest of the stuff using the old disk:
>
>

```
pkill -f notty
sed -ibak 's/RefuseManualStart.*$//g' /lib/systemd/system/dbus.service
systemctl daemon-reload
systemctl restart dbus
systemctl daemon-reexec
systemctl stop user@0 ntp cron systemd-logind
systemctl restart systemd-journald systemd-udevd
pkill agetty
pkill rsyslogd

```

>
>
> Check that nothing is touching /oldroot:
>
>

```
lsof | grep oldroot

```

>
>
> There will probably be an old dbus-daemon, kill it.  
>  And finally, unmount the old root and overwrite the hard disk with a memstick image:
>
>

```
umount -R /oldroot
wget https://download.freebsd.org/ftp/snapshots/arm64/aarch64/ISO-IMAGES/12.0/FreeBSD-12.0-CURRENT-arm64-aarch64-20180719-r336479-mini-memstick.img.xz
xzcat FreeBSD-12.0-CURRENT-arm64-aarch64-20180719-r336479-mini-memstick.img.xz | dd if=/dev/stdin of=/dev/vda bs=1M

```

>
>
> (Look for the newest snapshot, don’t copy paste the July 19 link above if you’re reading this in the future. Actually maybe use a release instead of CURRENT…)  
>  Now, fix the GPT: move the secondary table to the end of the disk and resize the table.  
>  It’s important to resize here, as FreeBSD does not do that and silently creates partitions that won’t persist across reboots
>
>

```
gdisk /dev/vda
x
e
s
4
w
y

```

And reboot. (You might actually want to hard reboot here: for some reason on the first reboot from Linux, pressing the any-key to enter the prompt in the loader hangs the console for me.)

I didn’t have to go into the ESC menu and choose the local disk in the boot manager, it seems to boot from disk automatically.

Now we’re in the FreeBSD EFI loader.  
 For some reason, the (recently fixed? 2) serial autodetection from EFI is not working correctly. Or something.  
 So you don’t get console output by default.  
 To fix, you have to run these commands in the boot loader command prompt:

```
set console=comconsole,efi
boot

```

Ignore the warning about comconsole not being a valid console.  
 Since there’s at least one (efi) that the loader thinks is valid, it sets the whole variable.)

(UPD: shouldn’t be necessary in the next snapshot)

Now it’s a regular installation process!  
 When asked about partitioning, choose Shell, and manually add a partition and set up a root filesystem:

```
gpart add -t freebsd-zfs -a 4k -l zroot vtbd0
zpool create -R /mnt -O mountpoint=none -O atime=off zroot /dev/gpt/zroot
zfs create -o canmount=off -o mountpoint=none zroot/ROOT
zfs create -o mountpoint=/ zroot/ROOT/default
zfs create -o mountpoint=/usr zroot/ROOT/default/usr
zfs create -o mountpoint=/var zroot/ROOT/default/var
zfs create -o mountpoint=/var/log zroot/ROOT/default/var/log
zfs create -o mountpoint=/usr/home zroot/home
zpool set bootfs=zroot/ROOT/default zroot
exit

```

(In this example, I set up ZFS with a beadm-compatible layout which allows me to use Boot Environments.)

In the post-install chroot shell, fix some configs like so:

```
echo 'zfs_load="YES"' >> /boot/loader.conf
echo 'console="comconsole,efi"' >> /boot/loader.conf
echo 'vfs.zfs.arc_max="512M"' >> /boot/loader.conf
sysrc zfs_enable=YES
exit

```

(Yeah, for some reason, the loader does not load zfs.ko’s dependency opensolaris.ko automatically here. idk what even. It does on my desktop and laptop.)

Now you can reboot into the installed system!!

Here’s how you can set up IPv6 (and root’s ssh key) auto configuration on boot:

```
Pkg bootstrap
pkg install curl
curl https://raw.githubusercontent.com/scaleway/image-tools/master/bases/overlay-common/usr/local/bin/scw-metadata > /usr/local/bin/scw-metadata
chmod +x /usr/local/bin/scw-metadata
echo '#\!/bin/sh' > /etc/rc.local
echo 'PATH=/usr/local/bin:$PATH' >> /etc/rc.local
echo 'eval $(scw-metadata)' >> /etc/rc.local
echo 'echo $SSH_PUBLIC_KEYS_0_KEY > /root/.ssh/authorized_keys' >> /etc/rc.local
echo 'chmod 0400 /root/.ssh/authorized_keys' >> /etc/rc.local
echo 'ifconfig vtnet0 inet6 $IPV6_ADDRESS/$IPV6_NETMASK' >> /etc/rc.local
echo 'route -6 add default $IPV6_GATEWAY' >> /etc/rc.local
mkdir /run
mkdir /root/.ssh
sh /etc/rc.local

```

>
>
> And to fix incoming TCP connections, configure the DHCP client to change the broadcast address:
>
>

`echo 'interface "vtnet0" { supersede broadcast-address 255.255.255.255; }' >> /etc/dhclient.conf`  
`killall dhclient`  
`dhclient vtnet0`

* Other random notes:
* keep in mind that -CURRENT snapshots come with a debugging kernel by default, which limits syscall performance by a lot, you might want to build your own 2 with config GENERIC-NODEBUG
* also disable heavy malloc debugging features by running ln -s ‘abort:false,junk:false’ /etc/malloc.conf (yes that’s storing config in a symlink)
* you can reuse the installer’s partition for swap

---

\*\* Digital Ocean \*\*  
[http://do.co/bsdnow](http://do.co/bsdnow)

\###[Easy encrypted backups on OpenBSD with base tools](https://dataswamp.org/~solene/2018-06-26-openbsd-easy-backup.html)

>
>
> Today’s topic is “Encrypted backups” using only OpenBSD base tools. I am planning to write a bigger article later about backups but it’s a wide topic with a lot of software to cover and a lot of explanations about the differents uses cases, needs, issues an solutions. Here I will stick on explaining how to make reliable backups for an OpenBSD system (my laptop).  
>  What we need is the dump command (see man 8 dump for its man page). It’s an utility to make a backup for a filesystem, it can only make a backup of one filesystem at a time. On my laptop I only backup /home partition so this solution is suitable for me while still being easy.  
>  Dump can do incremental backups, it means that it will only save what changed since the last backup of lower level. If you do not understand this, please refer to the dump man page.  
>  What is very interesting with dump is that it honors nodump flag which is an extended attribute of a FFS filesystem. One can use the command chflags nodump /home/solene/Downloads to tells dump not do save that folder (under some circumstances). By default, dump will not save thoses files, EXCEPT for a level 0 backup.
>
>

* Important features of this backup solution:
* save files with attributes, permissions and flags
* can recreate a partition from a dump, restore files interactively, from a list or from its inode number (useful when you have files in lost+found)
* one dump = one file

>
>
> My process is to make a huge dump of level 0 and keep it on a remote server, then, once a week I make a level 1 backup which will contain everything changed since the last dump of level 0, and everyday I do a level 2 backup of my files. The level 2 will contain latest files and the files changing a lot, which are often the most interesting. The level 1 backup is important because it will offload a lot of changes for the level 2.  
>  Let me explain: let says my full backup is 60 GB, full of pictures, sources files, GUI applications data files etc… A level 1 backup will contain every new picture, new projects, new GUI files etc… since the full backup, which will produce bigger and bigger dump over time, usually it is only 100 MB to 1GB. As I don’t add new pictures everyday or use new software everyday, the level 2 will take care of most littles changes to my data, like source code edited, little works on files etc… The level 2 backup is really small, I try to keep it under 50 MB so I can easily send it on my remote server everyday.  
>  One could you more dump level, up to level 9, but keep in mind that those are incremental. In my case, if I need to restore all my partition, I will need to use level 0, 1 and 2 to get up to latest backup state. If you want to restore a file deleted a few days ago, you need to remember in which level its latest version is.  
>  History note: dump was designed to be used with magnetic tapes.
>
>

* See the article for the remainder of the article

---

\##News Roundup  
 \###[Status of DFly server storage upgrades (Matt Dillon)](http://lists.dragonflybsd.org/pipermail/users/2018-July/357809.html)

>
>
> Last month we did some storage upgrades, particularly of internet-facing machines for package and OS distribution. Yesterday we did a number of additional upgrades, described below. All using funds generously donated by everyone!
>
>

>
>
> The main repository server received a 2TB SSD to replace the HDDs it was using before. This will improve access to a number of things maintained by this server, including the mail archives, and gives the main repo server more breathing room for repository expansion. Space was at a premium before. Now there’s plenty.
>
>

>
>
> Monster, the quad socket opteron which we currently use as the database builder and repository that we export to our public grok service ([grok.dragonflybsd.org](http://grok.dragonflybsd.org)) received a 512G SSD to add swap space for swapcache, to help cache the grok meta-data. It now has 600GB of swapcache configured. Over the next few weeks we will also be changing the grok updates to ping-pong between the two 4TB data drives it received in the last upgrade so we can do concurrent updates and web accesses without them tripping over each other performance-wise.
>
>

>
>
> The main developer box, Leaf, received a 2TB SSD and we are currently in the midst of migrating all the developer accounts in /home and /build from its old HDDs to its new SSD. This machine serves developer repos, developer web stuff, our home page and wiki, etc, so those will become snappier as well.
>
>

>
>
> Hard drives are becoming real dinosaurs. We still have a few left from the old days but in terms of active use the only HDDs we feel we really need to keep now are the ones we use for backups and grok data, owing to the amount of storage needed for those functions.
>
>

>
>
> Five years ago when we received the blade server that now sits in the colo, we had a small 256G SSD for root on every blade, and everything else used HDDs. To make things operate smoothly, most of that 256G root SSD was assigned to swapcache (200G of it, in fact, in most cases). Even just 2 years ago replacing all those HDDs with SSDs, even just the ones being used to actively serve data and support developers, would have been cost prohibitive. But today it isn’t and the only HDDs we really need anywhere are for backups or certain very large bits of bulk data (aka the grok source repository and index). The way things are going, even the backup drives will probably become SSDs over the next two years.
>
>

---

\###iX ad spot  
[OSCON 2018 Recap](https://www.ixsystems.com/blog/oscon2018/)

---

\###[zpool checkpoints](http://oshogbo.vexillium.org/blog/46/)

>
>
> In March, to FreeBSD landed a very interesting feature called ‘zpool checkpoints’. Before we jump straight into the topic, let’s take a step back and look at another ZFS feature called ‘snapshot’. Snapshot allows us to create an image of our single file systems. This gives us the option to modify data on the dataset without the fear of losing some data.
>
>

>
>
> A very good example of how to use ZFS snapshot is during an upgrade of database schema. Let us consider a situation where we have a few scripts which change our schema. Sometimes we are unable to upgrade in one transaction (for example, when we attempt to alter a table and then update it in single transaction). If our database is on dataset, we can just snapshot it, and if something goes wrong, simply rollback the file system to its previous state.
>
>

>
>
> The problem with snapshot is that it works only on a single dataset. If we added some dataset, we wouldn’t then be able to create the snapshot which would rollback that operation. The same with changing the attributes of a dataset. If we change the compression on the dataset, we cannot rollback it. We would need to change that manually.
>
>

>
>
> Another interesting problem involves upgrading the whole operating system when we upgrade system with a new ZFS version. What if we start upgrading our dataset and our kernel begins to crash? (If you use FreeBSD, I doubt you will ever have had that experience but still…). If we rollback to the old kernel, there is a chance the dataset will stop working because the new kernel doesn’t know how to use the new features.
>
>

>
>
> Zpool checkpoints is the solution to all those problems. Instead of taking a single snapshot of the dataset, we can now take a snapshot of the whole pool. That means we will not only rollback the data but also all the metadata. If we rewind to the checkpoint, all our ZFS properties will be rolled back; the upgrade will be rolledback, and even the creation/deletion of the dataset, and the snapshot, will be rolledback.
>
>

* Zpool Checkpoint has introduced a few simple functions:
* For a creating checkpoint:

`zpool checkpoint <pool>`

* Rollbacks state to checkpoint and remove the checkpoint:

`zpool import -- rewind-to-checkpoint <pool>`

* Mount the pool read only - this does not rollback the data:

`zpool import --read-only=on --rewind-to-checkpoint`

* Remove the checkpoint

`zpool checkpoint --discard <pool> or zpool checkpoint -d <pool>`

* With this powerful feature we need to remember some safety rules:
* Scrub will work only on data that isn’t in checkpool.
* You can’t remove vdev if you have a checkpoint.
* You can’t split mirror.
* Reguid will not work either.
* Create a checkpoint when one of the disks is removed…

>
>
> For me, this feature is incredibly useful, especially when upgrading an operating system, or when I need to experiment with additional data sets. If you speak Polish, I have some additional information for you. During the first Polish BSD user group meeting, I had the opportunity to give a short talk about this feature. Here you find the video of that talk, and here is the slideshow.
>
>

>
>
> I would like to offer my thanks to Serapheim Dimitropoulos for developing this feature, and for being so kind in sharing with me so many of its intricacies. If you are interested in knowing more about the technical details of this feature, you should check out Serapheim’s blog, and his video about checkpoints.
>
>

---

\###g2k18 Reports

* [g2k18 hackathon report: Ingo Schwarze on sed(1) bugfixing with Martijn van Duren, and about other small userland stuff](https://undeadly.org/cgi?action=article;sid=20180728110010)
* [g2k18 hackathon report: Kenneth Westerback on dhcpd(8) fixes, disklabel(8) refactoring and more](https://undeadly.org/cgi?action=article;sid=20180726184322)
* [g2k18 Hackathon Report: Marc Espie on ports and packages progress](https://undeadly.org/cgi?action=article;sid=20180716193511)
* [g2k18 hackathon report: Antoine Jacoutot on porting](https://undeadly.org/cgi?action=article;sid=20180716202456)
* [g2k18 hackathon report: Matthieu Herrb on font caches and xenodm](https://undeadly.org/cgi?action=article;sid=20180717074543)
* [g2k18 hackathon report: Florian Obser on rtadvd(8) -\> rad(8) progress (actually, rewrite)](https://undeadly.org/cgi?action=article;sid=20180718060313)
* [g2k18 Hackathon Report: Klemens Nanni on improvements to route(8), pfctl(8), and mount(2)](https://undeadly.org/cgi?action=article;sid=20180719100833)
* [g2k18 hackathon report: Carlos Cardenas on vmm/vmd progress, LACP](https://undeadly.org/cgi?action=article;sid=20180721053002)
* [g2k18 hackathon report: Claudio Jeker on OpenBGPD developments](https://undeadly.org/cgi?action=article;sid=20180721053011)
* [Picture of the last day of the g2k18 hackathon in Ljubljana, Slovenia](https://i.imgur.com/3t3cJF6.jpg)

---

\##Beastie Bits

* [Something blogged (on pkgsrcCon 2018)](https://www.geeklan.co.uk/?p=2266)
* [GSoC 2018 Reports: Configuration files versioning in pkgsrc, Part 1](https://blog.netbsd.org/tnf/entry/gsoc_2018_reports_configuration_files)
* [There should be a global ‘awareness’ week for developers](https://bsd.network/@mulander/100390180499807877)
* [Polish BSD User Group – Upcoming Meeting: Aug 9th 2018](https://bsd-pl.org/en)
* [London BSD User Group – Upcoming Meeting: Aug 14th 2018](http://ukopenbsdusers.saneusergroup.org.uk/pipermail/uk-openbsd-users/2018-July/000430.html)
* [Phillip Smith’s collection of reasons why ZFS is better so that he does not have to repeat  
   himself all the time](http://whyzfsisbetter.com/)
* [EuroBSDCon 2018: Sept 20-23rd in Romania – Register NOW!](https://2018.eurobsdcon.org/registration-is-open/)
* [MeetBSD 2018: Oct 19-20 in Santa Clara, California. Call for Papers closes on Aug 12](https://www.meetbsd.com/call-for-papers/)

---

**Tarsnap**

\##Feedback/Questions

* Dale - [L2ARC recommendations & drive age question](http://dpaste.com/1K452Y7#wrap)
* Todd - [ZFS & S3](http://dpaste.com/0WWHZ3E#wrap)
* efraim - [License Poem](http://dpaste.com/36YP39B#wrap)
* Henrick - [Yet another ZFS question](http://dpaste.com/21D1KWA#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---