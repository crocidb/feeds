+++
title = "297: Dragonfly In The Wild"
description = "FreeBSD ZFS vs. ZoL performance, Dragonfly 5.4.2 has been release, containing web services with iocell, Solaris 11.4 SRU8, Problem with SSH Agent forwarding, OpenBSD 6.4 to 6.5 upgrade guide, and more.Headlines[FreeBSD ZFS vs. ZoL Performance, Ubuntu ZFS On Linux Re"
date = "2019-05-09T04:00:00Z"
url = "https://www.bsdnow.tv/297"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.640082535Z"
seen = true
+++

FreeBSD ZFS vs. ZoL performance, Dragonfly 5.4.2 has been release, containing web services with iocell, Solaris 11.4 SRU8, Problem with SSH Agent forwarding, OpenBSD 6.4 to 6.5 upgrade guide, and more.

Headlines
----------

### [FreeBSD ZFS vs. ZoL Performance, Ubuntu ZFS On Linux Reference](https://www.phoronix.com/scan.php?page=article&item=freebsd-zol-april&num=1) ###

>
>
> With iX Systems having released new images of FreeBSD reworked with their ZFS On Linux code that is in development to ultimately replace their existing FreeBSD ZFS support derived from the code originally found in the Illumos source tree, here are some fresh benchmarks looking at the FreeBSD 12 performance of ZFS vs. ZoL vs. UFS and compared to Ubuntu Linux on the same system with EXT4 and ZFS. Using an Intel Xeon E3-1275 v6 with ASUS P10S-M WS motherboard, 2 x 8GB DDR4-2400 ECC UDIMMs, and Samsung 970 EVO Plus 500GB NVMe solid-state drive was used for all of this round of testing. Just a single modern NVMe SSD was used for this round of ZFS testing while as the FreeBSD ZoL code matures I'll test on multiple systems using a more diverse range of storage devices. FreeBSD 12 ZoL was tested using the iX Systems image and then fresh installs done of FreeBSD 12.0-RELEASE when defaulting to the existing ZFS root file-system support and again when using the aging UFS file-system. Ubuntu 18.04.2 LTS with the Linux 4.18 kernel was used when testing its default EXT4 file-system and then again when using the Ubuntu-ZFS ZoL support. Via the Phoronix Test Suite various BSD/Linux I/O benchmarks were carried out. Overall, the FreeBSD ZFS On Linux port is looking good so far and we are looking forward to it hopefully maturing in time for FreeBSD 13.0. Nice job to iX Systems and all of those involved, especially the ZFS On Linux project. Those wanting to help in testing can try the FreeBSD ZoL spins. Stay tuned for more benchmarks and on more diverse hardware as time allows and the FreeBSD ZoL support further matures, but so far at least the performance numbers are in good shape.
>
>

---

### [DragonFlyBSD 5.4.2 is out](https://www.dragonflybsd.org/release54/) ###

[Upgrading guide](http://lists.dragonflybsd.org/pipermail/users/2019-April/358160.html)

>
>
> Here's the tag commit, for what has changed from [5.4.1 to 5.4.2](http://lists.dragonflybsd.org/pipermail/commits/2019-April/718697.html) The normal ISO and IMG files are available for download and install, plus an uncompressed ISO image for those installing remotely. I uploaded them to mirror-master.dragonflybsd.org last night so they should be at your local mirror or will be soon. This version includes Matt's fix for the HAMMER2 corruption bug he identified recently. If you have an existing 5.4 system and are running a generic kernel, the normal upgrade process will work.
>
>

```
> cd /usr/src
> git pull
> make buildworld.
> make buildkernel.
> make installkernel.
> make installworld
> make upgrade

```

>
>
> After your next reboot, you can optionally update your rescue system:
>
>

```
> cd /usr/src
> make initrd

```

>
>
> As always, make sure your packages are up to date:
>
>

```
> pkg update
> pkg upgrade

```

---

News Roundup
----------

### [Containing web services with iocell](https://gioarc.me/2017/03/05/containing-web-services-with-iocell/) ###

>
>
> I'm a huge fan of the FreeBSD jails feature. It is a great system for splitting services into logical units with all the performance of the bare metal system. In fact, this very site runs in its own jail! If this is starting to sound like LXC or Docker, it might surprise you to learn that OS-level virtualization has existed for quite some time. Kudos to the Linux folks for finally getting around to it. 😛 If you're interested in the history behind Jails, there is an excellent talk from Papers We Love on the subject: https://www.youtube.com/watch?v=hgN8pCMLI2U
>
>

* Getting started

>
>
> There are plenty of options when it comes to setting up the jail system. Ezjail and Iocage seem popular, or you could do things manually. Iocage was recently rewritten in python, but was originally a set of shell scripts. That version has since been forked under the name Iocell, and I think it's pretty neat, so this tutorial will be using Iocell.
>
>

* To start, you'll need the following:
  * A FreeBSD install (we'll be using 11.0)
  * The iocell package (available as a package, also in the ports tree)
  * A ZFS pool for hosting the jails

>
>
> Once you have installed iocell and configured your ZFS pool, you'll need to run a few commands before creating your first jail. First, tell iocell which ZFS pool to use by issuing iocell activate $POOLNAME. Iocell will create a few datasets.
>
>
>
> As you can imagine, your jails are contained within the /iocell/jails dataset. The /iocell/releases dataset is used for storing the next command we need to run, iocell fetch. Iocell will ask you which release you'd like to pull down. Since we're running 11.0 on the host, pick 11.0-RELEASE. Iocell will download the necessary txz files and unpack them in /iocell/releases.
>
>

* See Article for the rest of the walkthrough.

---

### [Oracle Solaris 11.4 SRU8](https://blogs.oracle.com/solaris/announcing-oracle-solaris-114-sru8) ###

>
>
> Today we are releasing the SRU 8 for Oracle Solaris 11.4. It is available via 'pkg update' from the support repository or by downloading the SRU from My Oracle Support Doc ID 2433412.1.
>
>
>
> * This SRU introduces the following enhancements:
>   * Integration of 28060039 introduced an issue where any firmware update/query commands will log eereports and repeated execution of such commands led to faulty/degraded NIC. The issue has been addressed in this SRU.
>   * UCB (libucb, librpcsoc, libdbm, libtermcap, and libcurses) libraries have been reinstated for Oracle Solaris 11.4
>   * Re-introduction of the service fc-fabric.
>   * ibus has been updated to 1.5.19
>   
>   
>
>

* The following components have also been updated to address security issues:
  * NTP has been updated to 4.2.8p12
  * Firefox has been updated to 60.6.0esr
  * BIND has been updated to 9.11.6
  * OpenSSL has been updated to 1.0.2r
  * MySQL has been updated to 5.6.43 & 5.7.25
  * libxml2 has been updated to 2.9.9
  * libxslt has been updated to 1.1.33
  * Wireshark has been updated to 2.6.7
  * ncurses has been updated to 6.1.0.20190105
  * Apache Web Server has been updated to 2.4.38
  * perl 5.22
  * pkg.depot

---

### [The Problem with SSH Agent Forwarding](https://defn.io/2019/04/12/ssh-forwarding/) ###

>
>
> After hacking the matrix.org website today, the attacker opened a series of GitHub issues mentioning the flaws he discovered. In one of those issues, he mentions that “complete compromise could have been avoided if developers were prohibited from using [SSH agent forwarding].” Here’s what man ssh\_config has to say about ForwardAgent: "Agent forwarding should be enabled with caution. Users with the ability to bypass file permissions on the remote host (for the agent’s Unix-domain socket) can access the local agent through the forwarded connection. An attacker cannot obtain key material from the agent, however they can perform operations on the keys that enable them to authenticate using the identities loaded into the agent."" Simply put: if your jump box is compromised and you use SSH agent forwarding to connect to another machine through it, then you risk also compromising the target machine! Instead, you should use either ProxyCommand or ProxyJump (added in OpenSSH 7.3). That way, ssh will forward the TCP connection to the target host via the jump box and the actual connection will be made on your workstation. If someone on the jump box tries to MITM your connection, then you will be warned by ssh.
>
>

---

### [[OpenBSD Upgrade Guide: 6.4 to 6.5](https://www.openbsd.org/faq/upgrade65.html) ###

>
>
> Start by performing the pre-upgrade steps. Next, boot from the install kernel, bsd.rd: use bootable install media, or place the 6.5 version of bsd.rd in the root of your filesystem and instruct the boot loader to boot this kernel. Once this kernel is booted, choose the (U)pgrade option and follow the prompts. Apply the configuration changes and remove the old files. Finish up by upgrading the packages: pkg\_add -u. Alternatively, you can use the manual upgrade process. You may wish to check the errata page or upgrade to the stable branch to get any post-release fixes.
>
>

* Before rebooting into the install kernel
* Configuration and syntax changes
* Files to remove
* Special packages
* Upgrade without the install kernel

---

Beastie Bits
----------

* [2019 FreeBSD Community Survey](https://lists.freebsd.org/pipermail/freebsd-announce/2019-April/001873.html)
* [Seagate runs Mach.2 demo on FreeBSD](https://blog.seagate.com/craftsman-ship/seagate-shows-dual-actuator-speed-gains-in-real-world-setup/)
* [FreeBSD: Resizing and Growing Disks](https://www.youtube.com/watch?v=2KoD-jXjHok&t=7s)
* [Loading 4.9 on an old Tandy 4025LX - 386, 16MB, 1GB HD. Good old external SCSI CD](https://old.reddit.com/r/freebsd/comments/bh1abv/loading_49_on_an_old_tandy_4025lx_386_16mb_1gb_hd/)
* [OS108 MATE 20190422 released](https://forums.os108.org/d/6-os108-mate-20190422-released)

---

Feedback/Questions
----------

* Casey - [Oklahoma City & James](http://dpaste.com/39VJ7NH#wrap)
* Michael - [Question on SAS backplane (camcontrol?)](http://dpaste.com/2VSKEGW#wrap)
* Ales - [OpenBSD, FreeNAS, OpenZFS questions](http://dpaste.com/0AD0HBY#wrap)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

 Your browser does not support the HTML5 video tag.