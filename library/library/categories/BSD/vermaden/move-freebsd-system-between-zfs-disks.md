+++
title = "Move FreeBSD System Between ZFS Disks"
description = "I made a funny mistake in one of my clients when installing FreeBSD 15.1-RELEASE on their server … I have chosen wrong disk for the installation. The server had 4 local disks – 2 of them were some really low end SATA SSD drives (ada0 and ada1) and the server also had 2 fast NVMe "
date = "2026-08-13T22:59:56Z"
url = "https://vermaden.wordpress.com/2026/08/14/move-freebsd-between-zfs-disks/"
author = "vermaden"
text = ""
lastupdated = "2026-08-24T15:49:14.055141691Z"
seen = false
+++

I made a funny mistake in one of my clients when installing FreeBSD 15.1-RELEASE on their server … I have chosen wrong disk for the installation. The server had 4 local disks – 2 of them were some really low end SATA SSD drives (**ada0** and **ada1**) and the server also had 2 fast NVMe disks (**nda0** and **nda1**). I used **Auto (ZFS)** option in the **bsdinstall(8)** installer and chosen (wrongly) the **ada1** disk.

<img data-attachment-id="2262" data-permalink="https://vermaden.wordpress.com/2020/09/07/quare-freebsd/openzfs/" data-orig-file="https://vermaden.wordpress.com/wp-content/uploads/2020/09/openzfs.jpg" data-orig-size="630,230" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="openzfs" data-image-description="" data-image-caption="" data-large-file="https://vermaden.wordpress.com/wp-content/uploads/2020/09/openzfs.jpg?w=630" class="alignnone size-full wp-image-2262" src="https://vermaden.wordpress.com/wp-content/uploads/2020/09/openzfs.jpg" alt="" width="625" height="228" srcset="https://vermaden.wordpress.com/wp-content/uploads/2020/09/openzfs.jpg?w=625&amp;h=228 625w, https://vermaden.wordpress.com/wp-content/uploads/2020/09/openzfs.jpg?w=150&amp;h=55 150w, https://vermaden.wordpress.com/wp-content/uploads/2020/09/openzfs.jpg?w=300&amp;h=110 300w, https://vermaden.wordpress.com/wp-content/uploads/2020/09/openzfs.jpg 630w" sizes="(max-width: 625px) 100vw, 625px">

This is how my ZFS pool looked like after installation.

```
freebsd # zpool status zroot
  pool: zroot
 state: ONLINE
config:

	NAME        STATE     READ WRITE CKSUM
	zroot       ONLINE       0     0     0
	  ada1p4    ONLINE       0     0     0

```

… but this is the ZFS world – nothing stops You from adding as many drives to ZFS mirror as You want – so for a start I used FreeBSD **gpart(8)** tool to copy the partitions from **ada1** disk to the NVME **nda0** and **nda1** drives.

```
freebsd # gpart backup ada1 | gpart restore nda0

freebsd # gpart backup ada1 | gpart restore nda1

```

Then as FreeBSD was installed with **BIOS+UEFI** option I cloned the **freebsd-boot** partition and the UEFI partition.

```
freebsd # dd bs=1m if=/dev/ada1p1 of=/dev/nda0p1 status=progress

freebsd # dd bs=1m if=/dev/ada1p1 of=/dev/nda1p1 status=progress

freebsd # dd bs=1m if=/dev/ada1p2 of=/dev/nda0p2 status=progress

freebsd # dd bs=1m if=/dev/ada1p2 of=/dev/nda1p2 status=progress
```

Next I added these **nda0** and **nda1** as mirror devices for **ada1** disk. For the record – the **ada1p3** is a SWAP device – no need to clone it for obvious reasons.

```
freebsd # zpool attach zroot ada1p4 nda0p4

freebsd # zpool attach zroot ada1p4 nda1p4

```

This is when ZFS decided to do the **resilvering** process immediately (which is good).

```
freebsd # zpool status zroot
  pool: zroot
 state: ONLINE
status: One or more devices is currently being resilvered.  The pool will
	continue to function, possibly in a degraded state.
action: Wait for the resilver to complete.
  scan: resilver in progress since Thu Aug 13 18:47:35 2026
	199G / 199G scanned, 15.5G / 199G issued at 428M/s
	31.0G resilvered, 7.76% done, 00:07:20 to go
config:

	NAME        STATE     READ WRITE CKSUM
	zroot       ONLINE       0     0     0
	  mirror-0  ONLINE       0     0     0
	    ada1p4  ONLINE       0     0     0
	    nda0p4  ONLINE       0     0     0  (resilvering)
	    nda1p4  ONLINE       0     0     0  (resilvering)

errors: No known data errors

```

We can even track the status of that replication.

```
freebsd # zpool iostat -v zroot 5
              capacity     operations     bandwidth
pool        alloc   free   read  write   read  write
----------  -----  -----  -----  -----  -----  -----
zroot        199G   229G     25    758  3.11M  42.6M
  mirror-0   199G   229G  3.21K  95.9K   402M  5.38G
    ada1p4      -      -     25    693  3.11M  36.5M
    nda0p4      -      -      0  4.15K    281   403M
    nda1p4      -      -      0  4.41K    305   413M
----------  -----  -----  -----  -----  -----  -----
              capacity     operations     bandwidth
pool        alloc   free   read  write   read  write
----------  -----  -----  -----  -----  -----  -----
zroot        199G   229G  2.89K  8.29K   369M   850M
  mirror-0   199G   229G  2.89K  8.29K   369M   850M
    ada1p4      -      -  2.89K    383   369M  37.1M
    nda0p4      -      -      0  4.00K      0   406M
    nda1p4      -      -      0  3.91K      0   406M
----------  -----  -----  -----  -----  -----  -----
              capacity     operations     bandwidth
pool        alloc   free   read  write   read  write
----------  -----  -----  -----  -----  -----  -----
zroot        199G   229G  2.99K  7.30K   378M   827M
  mirror-0   199G   229G  2.99K  7.30K   378M   827M
    ada1p4      -      -  2.99K    185   378M  19.9M
    nda0p4      -      -      0  3.54K  7.20K   404M
    nda1p4      -      -      0  3.58K      0   404M
----------  -----  -----  -----  -----  -----  -----

```

After **resilvering** process is finished we can **detach** the **ada1** drive from the ZFS mirror.

```
freebsd # zpool detach zroot ada1p4

```

… and after all these quite simple and predictable operations – everything when the system was still running – we have FreeBSD installation migrated from **ada1** disk to ZFS mirror on two NVMe **nda0** and **nda1** disks as shown below.

```
freebsd # zpool status zroot
  pool: zroot
 state: ONLINE
  scan: scrub repaired 0B in 00:00:08 with 0 errors on Thu Aug 13 23:20:15
2026
config:

	NAME        STATE     READ WRITE CKSUM
	zroot       ONLINE       0     0     0
	  mirror-0  ONLINE       0     0     0
	    nda0p4  ONLINE       0     0     0
	    nda1p4  ONLINE       0     0     0

errors: No known data errors

```

Its kinda short article (for my standards) but it shows what was needed and possible with ZFS and other FreeBSD tools to do the job. One more thing that its needed to be done is that in BIOS/UEFI you need to add boot option specifying the path to the **loader.efi** file – separate one for each NVMe drive.

UPDATE 1 – BIOS/UEFI Boot Option
----------

Someone asked me how this is exactly done … and it is done differently in each BIOS/UEFI manufacturer – below one is from some **Lenovo ThinkServer** system server.

First enter into BIOS/UEFI and go to **Boot Settings** part.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/01-uefi-boot-manager-settings.jpg)

Next select **Add UEFI Full Path Boot Option** there.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/02-uefi-boot-manager-add-path-option.jpg)

In the next ‘window’ use **Select Device Path Option** position.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/03-uefi-boot-manager-select-device.jpg)

Next select the drive You know You installed FreeBSD on – this is one of the two NVMe drives I moved FreeBSD to.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/04-uefi-boot-manager-device.jpg)

Next click **\<efi\>** dir.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/05-uefi-boot-manager-path.jpg)

Next click **\<freebsd\>** dir.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/06-uefi-boot-manager-path.jpg)

Next select **loader.efi** file.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/07-uefi-boot-manager-path.jpg)

Next add wanted name – I used **FreeBSD/nda0** there.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/08-uefi-boot-manager-name.jpg)

Click **Commit Changes and Exit** option.

Next click Change Boot Order and set that **FreeBSD/nda0** option as first one.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/09-uefi-boot-manager-order.jpg)

Do the same for another NVMe disk and add another **FreeBSD/nda1** option there.

Alternatively You can do that from within FreeBSD system using **efibootmgr(8)** command – [**Important efibootmgr(8) Command**](https://vermaden.wordpress.com/2024/02/27/important-efibootmgr-command/) – details here.

EOF