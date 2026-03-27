+++
title = "301: GPU Passthrough"
description = "GPU passthrough on bhyve, confusion with used/free disk space on ZFS, OmniOS Community Edition, pfSense 2.4.4 Release p3, NetBSD 8.1 RC1, FreeNAS as your Server OS, and more.Headlines[GPU Passthrough Reported Working on Bhyve](https://passthroughpo.st/gpu-passthroug"
date = "2019-06-06T03:15:00Z"
url = "https://www.bsdnow.tv/301"
author = "feedback@bsdnow.tv (JT Pennington)"
text = ""
lastupdated = "2026-03-26T14:37:50.631990181Z"
seen = false
+++

GPU passthrough on bhyve, confusion with used/free disk space on ZFS, OmniOS Community Edition, pfSense 2.4.4 Release p3, NetBSD 8.1 RC1, FreeNAS as your Server OS, and more.

Headlines
----------

### [GPU Passthrough Reported Working on Bhyve](https://passthroughpo.st/gpu-passthrough-reported-working-on-bhyve/) ###

>
>
> Normally we cover news focused on KVM and sometimes Xen, but something very special has happened with their younger cousin in the BSD world, Bhyve. For those that don’t know, Bhyve (pronounced bee-hive) is the native hypervisor in FreeBSD. It has many powerful features, but one that’s been a pain point for some years now is VGA passthrough. Consumer GPUs have not been useable until very recently despite limited success with enterprise cards. However, Twitter user Michael Yuji found a workaround that enables passing through a consumer card to any \*nix system configured to use X11:
>
>

* https://twitter.com/michael\_yuji/status/1127136891365658625

>
>
> All you have to do is add a line pointing the X server to the Bus ID of the passed card and the VM will boot, with acceleration and everything. He theorizes that this may not be possible on windows because of the way it looks for display devices, but it’s a solid start. As soon as development surrounding VGA passthrough matures on Bhyve, it will become a very attractive alternative to more common tools like Hyper-V and Qemu, because it makes many powerful features available in the host system like jails, boot environments, BSD networking, and tight ZFS integration. For example, you could potentially run your Router, NAS, preferred workstation OS and any number of other things in one box, and only have to spin up a single VM because of the flexibility afforded by jails over Linux-based containers. The user who found this workaround also announced they’d be writing it up at some point, so stay tuned for details on the process. It’s been slow going on Bhyve passthrough development for a while, but this new revelation is encouraging. We’ll be closely monitoring the situation and report on any other happenings.
>
>
> ---
>

### [Confusion with used/free disk space in ZFS](https://oshogbo.vexillium.org/blog/65/) ###

>
>
> I use ZFS extensively. ZFS is my favorite file system. I write articles and give lectures about it. I work with it every day. In traditional file systems we use df(1) to determine free space on partitions. We can also use du(1) to count the size of the files in the directory. But it’s different on ZFS and this is the most confusing thing EVER. I always forget which tool reports what disk space usage! Every time somebody asks me, I need to google it. For this reason I decided to document it here - for myself - because if I can’t remember it at least I will not need to google it, as it will be on my blog, but maybe you will also benefit from this blog post if you have the same problem or you are starting your journey with ZFS.
>
>
>
> The understanding of how ZFS is uses space and how to determine which value means what is a crucial thing. I hope thanks to this article I will finally remember it!
>
>

---

News Roundup
----------

### [OmniOS Community Edition](https://omniosce.org/article/release-030.html) ###

>
>
> The OmniOS Community Edition Association is proud to announce the general availability of OmniOS - r151030. OmniOS is published according to a 6-month release cycle, r151030 LTS takes over from r151028, published in November 2018; and since it is a LTS release it also takes over from r151022. The r151030 LTS release will be supported for 3 Years. It is the first LTS release published by the OmniOS CE Association since taking over the reins from OmniTI in 2017. The next LTS release is scheduled for May 2021. The old stable r151026 release is now end-of-life. See the release schedule for further details. This is only a small selection of the new features, and bug fixes in the new release; review the release notes for full details. If you upgrade from r22 and want to see all new features added since then, make sure to also read the release notes for r24, r26 and r28. The OmniOS team and the illumos community have been very active in creating new features and improving existing ones over the last 6 months.
>
>

---

### [pfSense 2.4.4 Release p3 is available](https://www.netgate.com/blog/pfsense-2-4-4-release-p3-now-available.html) ###

>
>
> We are pleased to announce the release of pfSense® software version 2.4.4-p3, now available for new installations and upgrades! pfSense software version 2.4.4-p3 is a maintenance release, bringing a number of security enhancements as well as a handful of fixes for issues present in the 2.4.4-p2 release. pfSense 2.4.4-RELEASE-p3 updates and installation images are available now! To see a complete list of changes and find more detail, see the Release Notes. We had hoped to bring you this release a few days earlier, but given the announcement last Tuesday of the Intel Microarchitectural Data Sampling (MDS) issue, we did not have sufficient time to fully incorporate those corrections and properly test for release on Thursday. We felt that it was worth delaying for a few days, rather than making multiple releases within a week.
>
>

* Upgrade Notes

>
>
> Due to the significant nature of the changes in 2.4.4 and later, warnings and error messages, particularly from PHP and package updates, are likely to occur during the upgrade process. In nearly all cases these errors are a harmless side effect of the changes between FreeBSD 11.1 and 11.2 and between PHP 5.6 and PHP 7.2. Always take a backup of the firewall configuration prior to any major change to the firewall, such as an upgrade. Do not update packages before upgrading pfSense! Either remove all packages or do not update packages before running the upgrade. The upgrade will take several minutes to complete. The exact time varies based on download speed, hardware speed, and other factors such installed packages. Be patient during the upgrade and allow the firewall enough time to complete the entire process. After the update packages finish downloading it could take 10-20 minutes or more until the upgrade process ends. The firewall may reboot several times during the upgrade process. Monitor the upgrade from the firewall console for the most accurate view.
>
>

---

### [NetBSD 8.1 RC1 is out](https://www.netbsd.org/releases/formal-8/NetBSD-8.1.html) ###

>
>
> The NetBSD Project is pleased to announce NetBSD 8.1, the first update of the NetBSD 8 release branch. It represents a selected subset of fixes deemed important for security or stability reasons, as well as new features and enhancements.
>
>
>
> Some highlights of the 8.1 release are:
>
>

* x86: Mitigation for INTEL-SA-00233 (MDS)
* Various local user kernel data leaks fixed.
* x86: new rc.conf(5) setting smtoff to disable Simultaneous Multi-Threading
* Various network driver fixes and improvements.
* Fixes for thread local storage (TLS) in position independent executables (PIE).
* Fixes to reproducible builds.
* Fixed a performance regression in tmpfs.
* DRM/KMS improvements.
* bwfm(4) wireless driver for Broadcom FullMAC PCI and USB devices added.
* Various sh(1) fixes.
* mfii(4) SAS driver added.
* hcpcd(8) updated to 7.2.2
* httpd(8) updated.

---

### [FreeNAS as your Server OS](https://www.ixsystems.com/blog/freenas-as-your-server-os/) ###

>
>
> What if you could have a server OS that had built in RAID, NAS and SAN functionality, and could manage packages, containers and VMs in a GUI? What if that server OS was also free to download and install? Wouldn’t that be kind of awesome? Wouldn’t that be FreeNAS? FreeNAS is the world’s number one, open source storage OS, but it also comes equipped with all the jails, plugins, and VMs you need to run additional server-level services for things like email and web site hosting. File, Block, and even Object storage is all built-in and can be enabled with a few clicks. The ZFS file system scales to more drives than you could ever buy, with no limits for dataset sizes, snapshots, and restores. FreeNAS is also 100% FreeBSD. This is the OS used in the Netflix CDN, your PS4, and the basis for iOS. Set up a jail and get started downloading packages like Apache or NGINX for web hosting or Postfix for email service. Just released, our new TrueCommand management platform also streamlines alerts and enables multi-system monitoring.
>
>

---

Beastie Bits
----------

* [Keep Crashing Daemons Running on FreeBSD](https://www.babaei.net/blog/keep-crashing-daemons-running-on-freebsd/)
* [Look what I found today... my first set of BSD CDs...](https://old.reddit.com/r/freebsd/comments/btksgf/look_what_i_found_today_my_first_set_of_bsd_cds/)
* [NetBSD - Intel MDS](https://wiki.netbsd.org/security/intel_mds/)
* [FreeBSD 11.3-BETA2 -- Please test!](https://lists.freebsd.org/pipermail/freebsd-stable/2019-May/091227.html)

---

Feedback/Questions
----------

* Anthony - [Question](http://dpaste.com/33S61HH#wrap)
* Guntbert - [Podcast](http://dpaste.com/0NDACM2)
* Guillaume - [Another suggestion for Ales from Serbia](http://dpaste.com/0N3Q9TN)

---

* Send questions, comments, show ideas/topics, or stories you want mentioned on the show to [feedback@bsdnow.tv](mailto:feedback@bsdnow.tv)

---

 Your browser does not support the HTML5 video tag.