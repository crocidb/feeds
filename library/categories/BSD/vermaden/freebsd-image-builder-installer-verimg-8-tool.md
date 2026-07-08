+++
title = "FreeBSD Image Builder/Installer verimg(8) Tool"
description = "Today I will focus on creating customized FreeBSD VM image(s) and also unattended installation part of simple PKGBASE based FreeBSD system. Initially I wanted to use release.sh from /usr/src/release … but despite using freshly installed FreeBSD 15.0-RELEASE in Bhyve VM with 8 CPU"
date = "2026-04-15T10:05:07Z"
url = "https://vermaden.wordpress.com/2026/04/15/freebsd-image-builder-installer-verimg-tool/"
author = "vermaden"
text = ""
lastupdated = "2026-07-07T12:18:11.906768945Z"
seen = true
+++

Today I will focus on creating customized FreeBSD VM image(s) and also unattended installation part of simple PKGBASE based FreeBSD system. Initially I wanted to use **release.sh** from **/usr/src/release** … but despite using freshly installed FreeBSD 15.0-RELEASE in Bhyve VM with 8 CPUs and 28 GB RAM and 200GB of NVMe storage … the **release.sh** failed me. Every. Single. Time.

I was not able to even make it finish building the stuff – always ended with different enigmatic error … and the documentation is some short introduction in **release(7)** man page … and in the **release.sh** script itself – along with its **Makefile(s)** in the **/usr/src/release** dir. Nothing in the *FreeBSD Handbook* … or other FreeBSD documentation. Kinda like VNET Jails not documented at all in the past.

I even tried to ask for help on *FreeBSD Mailing Lists* … but [no](https://lists.freebsd.org/archives/freebsd-hackers/2026-April/006140.html) [help](https://lists.freebsd.org/archives/freebsd-hackers/2026-April/006134.html) [either](https://lists.freebsd.org/archives/freebsd-hackers/2026-April/006136.html) … so I did again what I always do in such situations … I wrote my simpler solution.

verimg(8)
==========

Meet new **verimg(8)** tool for simple FreeBSD image building (and unattended installation).

<img data-attachment-id="10265" data-permalink="https://vermaden.wordpress.com/2026/04/15/freebsd-image-builder-installer-verimg-tool/verimg-help-options/" data-orig-file="https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-help-options.png" data-orig-size="720,680" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;,&quot;alt&quot;:&quot;&quot;}" data-image-title="verimg-help-options" data-image-description="" data-image-caption="" data-large-file="https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-help-options.png?w=720" class="alignnone size-full wp-image-10265" src="https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-help-options.png" alt="" width="625" height="590" srcset="https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-help-options.png?w=625&amp;h=590 625w, https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-help-options.png?w=150&amp;h=142 150w, https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-help-options.png?w=300&amp;h=283 300w, https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-help-options.png 720w" sizes="(max-width: 625px) 100vw, 625px">

The logic is simple:

* Fetch FreeBSD source (src).
* Build FreeBSD PKGBASE packages like that:  
  **\# cd /usr/src**  
  **\# make buildworld buildkernel update-packages**
* Create new sparse file with **truncate(8)** tool.
* Make **md(4)** node for that file in **/dev** dir.
* Create GPT schema and needed partitions.
* Create ZFS pool and ZFS datasets.
* Mount that pool on **/mnt** dir.
* Create local PKGBASE **pkg-repo(8)** in **/usr/obj** dir.
* Bootstrap **pkg(8)** inside **/mnt** dir.
* Install PKGBASE packages into **/mnt** dir.
* Add needed config files.
* Add wanted **pkg(8)** third party packages.
* Make that system bootable with ZFS **bootfs** property.

Done.

You now have your custom FreeBSD image ready.

… and steps like ‘Fetch’ and ‘Build’ are optional. You can even use this tool for unattended automated FreeBSD installation on bare metal … or a laptop.

… and yes – it does support *ZFS Boot Environments* ![🙂](https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/72x72/1f642.png)

The **verimg(8)** is available on my new [https://github.com/vermaden/verimg](https://github.com/vermaden/verimg) repo.

These are the **verimg(8)** options.

```
FreeBSD # verimg --help
usage:
  verimg: [OPTION(s)]

options:
  -f FILE  which file to use for VM image (default: VERIMG)
  -s SIZE  size of VM image (default: 10g)
  -r VERS  which FreeBSD version to use (default: releng/15.0)
  -i LIST  colon (:) separated packages list to install (default: beadm:lsblk)
  -m MNTD  mount directory for installation (default: /mnt)
  -p POOL  specify ZFS pool name (default: sys)
  -b BRCH  specify branch for pkg(8) (default: latest)
  -n       display options and exit
  -t TYPE  type of operation is one of options:
           = img
             - create FILE backend and do setup there (default)
           = mnt
             - do not use FILE backend and just setup at mount dir
  -R REPO  dir where PKGBASE packages are located
           (default: /usr/obj/usr/src/repo/FreeBSD:15:amd64/latest)
  -M MODE  mode in which 'verimg' to start:
           = fetch:build:setup (default)
             - fetch FreeBSD sources with git(1) clone into /usr/src
             - build FreeBSD from sources from /usr/src in /usr/obj
             - setup FreeBSD from /usr/obj PKGBASE repository
           = build:setup
             - build FreeBSD from sources from /usr/src in /usr/obj
             - setup FreeBSD from /usr/obj PKGBASE repository
           = setup
             - setup FreeBSD from /usr/obj PKGBASE repository

examples:
  # verimg.sh -f FILE -s 20g -r releng/15.0 -i python:ansible

```

By default **verimg(8)** fetches the FreeBSD sources … builds **world**/**kernel** and then PKGBASE packages … and installs new FreeBSD from local PKGBASE repo in **VERIMG** file … but you can easily overwrite these with options … and check what will be done with ‘dry run’ **-n** option too.

<img data-attachment-id="10266" data-permalink="https://vermaden.wordpress.com/2026/04/15/freebsd-image-builder-installer-verimg-tool/verimg-print-info/" data-orig-file="https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-print-info.png" data-orig-size="720,470" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;,&quot;alt&quot;:&quot;&quot;}" data-image-title="verimg-print-info" data-image-description="" data-image-caption="" data-large-file="https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-print-info.png?w=720" class="alignnone size-full wp-image-10266" src="https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-print-info.png" alt="" width="625" height="408" srcset="https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-print-info.png?w=625&amp;h=408 625w, https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-print-info.png?w=150&amp;h=98 150w, https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-print-info.png?w=300&amp;h=196 300w, https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-print-info.png 720w" sizes="(max-width: 625px) 100vw, 625px">

Here are the defaults printed.

```
FreeBSD # verimg -n
INFO: options that will be used
  ARG_MODE: fetch:build:setup
  ARG_TYPE: img
  ARG_FILE: VERIMG
  ARG_SIZE: 10g
  ARG_VERS: releng/15.0
  ARG_INST: beadm:lsblk
  ARG_MNTD: /mnt
  ARG_POOL: sys
  ARG_REPO: /usr/obj/usr/src/repo/FreeBSD:15:amd64/latest

```

Here is example **verimg(8)** run for unattended FreeBSD install in **VERIMG** file when FreeBSD sources were fetched earlier and **world**/**kernel** are already build with PKGBASE repo.

```
FreeBSD # verimg -M setup -t img
INFO: options that will be used
  ARG_MODE: setup
  ARG_TYPE: img
  ARG_FILE: VERIMG
  ARG_SIZE: 10g
  ARG_VERS: releng/15.0
  ARG_INST: beadm:lsblk
  ARG_MNTD: /mnt
  ARG_POOL: sys
  ARG_REPO: /usr/obj/usr/src/repo/FreeBSD:15:amd64/latest

# truncate -s 10g VERIMG

# mdconfig -a -t vnode -f VERIMG

# gpart create/add/bootcode ... md0
md0 created
md0p1 added
md0p2 added
md0p3 added
md0p4 added
partcode written to md0p1
bootcode written to md0

# newfs_msdos -F 32 -c 1 /dev/md0p2
/dev/md0p2: 80628 sectors in 80628 FAT32 clusters (512 bytes/cluster)
BytesPerSec=512 SecPerClust=1 ResSectors=32 FATs=2 Media=0xf0 SecPerTrack=63 Heads=255 HiddenSecs=0 HugeSectors=81920 FATsecs=630 RootCluster=2 FSInfo=1 Backup=2

# mkdir -p /mnt/efi

# mount_msdosfs /dev/md0p2 /mnt/efi

# mkdir -p /mnt/efi/EFI/BOOT

# cp /boot/loader.efi /mnt/efi/EFI/BOOT/bootx64.efi

# umount -f /mnt/efi

# zpool create -R /mnt -O compress=lz4 -O atime=off -m none -f sys md0p4

# zfs create ... sys

# cd /usr/obj/usr/src/repo/FreeBSD:15:amd64/latest

# pkg repo .
Creating repository in .: 100%
Packing files for repository: 100%

# mkdir -p /usr/obj/repos

# cat < /usr/obj/repos/FreeBSD-base.conf (...)

# mkdir -p /mnt/usr/share/keys (...)

# cat < /mnt/usr/share/keys/pkg/trusted/pkg.freebsd.org.2013102301 (...)

# cat < /mnt/usr/share/keys/pkgbase-15/trusted/backup-signing-15 (...)

# cat < /mnt/usr/share/keys/pkgbase-15/trusted/awskms-15 (...)

# mkdir -p /mnt/etc /mnt/boot

# echo nameserver 1.1.1.1 > /mnt/etc/resolv.conf

# cat < /mnt/etc/fstab (...)

# cat < /mnt/boot/loader.conf (...)

# cat < /mnt/etc/rc.conf (...)

# pkg --rootdir /mnt --repo-conf-dir /usr/obj/repos -o IGNORE_OSVERSION=yes update
Updating FreeBSD-base repository catalogue...
Fetching meta.conf: 100%     179 B   0.2 kB/s    00:01    
Fetching data: 100%    76 KiB  78.1 kB/s    00:01    
Processing entries: 100%
FreeBSD-base repository update completed. 492 packages processed.
All repositories are up to date.

# pkg --rootdir /mnt --repo-conf-dir /usr/obj/repos -o IGNORE_OSVERSION=yes install -r FreeBSD-base -U -y FreeBSD-set-base
Checking integrity... done (0 conflicting)
The following 207 package(s) will be affected (of 0 checked):

New packages to be INSTALLED:
        FreeBSD-acct: 15.0p5
        FreeBSD-acpi: 15.0p5
        FreeBSD-apm: 15.0p5
        (...)
        FreeBSD-zlib: 15.0p5
        FreeBSD-zlib-dev: 15.0p5
        FreeBSD-zoneinfo: 15.0p5

Number of packages to be installed: 207

The process will require 672 MiB more space.
[  1/207] Installing FreeBSD-acct-15.0p5...
[  1/207] Extracting FreeBSD-acct-15.0p5: 100%
[  2/207] Installing FreeBSD-acpi-15.0p5...
(...)
[205/207] Installing FreeBSD-set-minimal-15.0p5...
[206/207] Installing FreeBSD-set-optional-15.0p5...
[207/207] Installing FreeBSD-set-base-15.0p5...
==> Running trigger: mandoc.ucl

# mkdir -p /mnt/usr/local/etc/pkg/repos

# sed s/quarterly/latest/g /mnt/etc/pkg/FreeBSD.conf /mnt/usr/local/etc/pkg/repos/FreeBSD.conf

# echo 'FreeBSD-base: { enabled: yes }' >> /mnt/usr/local/etc/pkg/repos/FreeBSD.conf

# pkg --chroot /mnt update
Updating FreeBSD-ports repository catalogue...
Fetching meta.conf: 100%     179 B   0.2 kB/s    00:01    
Fetching data: 100%    11 MiB   1.9 MB/s    00:06    
Processing entries: 100%
FreeBSD-ports repository update completed. 36801 packages processed.
Updating FreeBSD-ports-kmods repository catalogue...
Fetching meta.conf: 100%     179 B   0.2 kB/s    00:01    
Fetching data: 100%    35 KiB  35.5 kB/s    00:01    
Processing entries: 100%
FreeBSD-ports-kmods repository update completed. 240 packages processed.
All repositories are up to date.

# pkg --chroot /mnt install -y beadm lsblk
Updating FreeBSD-ports repository catalogue...
FreeBSD-ports repository is up to date.
Updating FreeBSD-ports-kmods repository catalogue...
FreeBSD-ports-kmods repository is up to date.
All repositories are up to date.
The following 2 package(s) will be affected (of 0 checked):

New packages to be INSTALLED:
        beadm: 1.3.5_1 [FreeBSD-ports]
        lsblk: 4.1_1 [FreeBSD-ports]

Number of packages to be installed: 2

20 KiB to be downloaded.
[1/2] Fetching lsblk-4.1_1: 100%    9030 B   9.0 kB/s    00:01    
[2/2] Fetching beadm-1.3.5_1: 100%    11 KiB  11.0 kB/s    00:01    
Checking integrity... done (0 conflicting)
[1/2] Installing beadm-1.3.5_1...
[1/2] Extracting beadm-1.3.5_1: 100%
[2/2] Installing lsblk-4.1_1...
[2/2] Extracting lsblk-4.1_1: 100%

# zpool set bootfs=sys/ROOT/default sys

# zpool export sys

# mdconfig -d -u /dev/md0
FreeBSD #

```

Voila!

You new FreeBSD **VERIMG** image is ready.

```
FreeBSD # du -sm VERIMG
463     VERIMG

FreeBSD # du -smA VERIMG
10240   VERIMG

FreeBSD # file -s VERIMG
VERIMG: DOS/MBR boot sector; partition 1 : ID=0xee, start-CHS (0x0,0,2), end-CHS (0x3ff,255,63), startsector 1, 20971519 sectors

FreeBSD # mdconfig.sh -c VERIMG
IN: created vnode at /dev/md0

FreeBSD # mdconfig.sh -l
md0     vnode      10G  /home/vermaden/VERIMG   -

FreeBSD # gpart show md0
=>      40  20971440  md0  GPT  (10G)
        40      1024    1  freebsd-boot  (512K)
      1064     81920    2  efi  (40M)
     82984   2097152    3  freebsd-swap  (1.0G)
   2180136  16777216    4  freebsd-zfs  (8.0G)
  18957352   2014128       - free -  (983M)

FreeBSD # lsblk md0
DEVICE         MAJ:MIN  SIZE TYPE                                    LABEL MOUNT
md0              1:198   10G GPT                                         - -
  md0p1          1:199   10G freebsd-boot                 gpt/freebsd-boot -
  md0p2          1:200   10G efi                                   gpt/efi -
  md0p3          1:201   10G freebsd-swap                 gpt/freebsd-swap -
  md0p4          1:202   10G freebsd-zfs                          gpt/zfs0
           -:-    983M -                                           - -

FreeBSD # mdconfig.sh -d 0
IN: deleted vnode at /dev/md0

```

At the beginning my biggest riddle was how to properly bootstrap **pkg(8)** … unattended.

I know this worked … but it required pressing **[ENTER]** which killed the idea.

```
FreeBSD # export BSDINSTALL_CHROOT=/mnt

FreeBSD # export BSDINSTALL_PKG_REPOS_DIR=/usr/obj/usr/src/repos

FreeBSD # bsdinstall pkgbase

```

I managed to overcome that with a funny hack by sending that **[ENTER]** to the **bsdinstall(8)** command.

```
FreeBSD # echo '\n' | bsdinstall pkgbase

```

It has one drawback … the default selection of PKGBASE sets will be installed.

… but it all went unimportant after I started reading contents of **/usr/libexec/bsdinstall/pkgbase** file. Then everything was obvious.

I also checked **/usr/libexec/bsdinstall/zfsboot** file to (re)create the same ZFS datasets for a start that are used with ‘default’ FreeBSD installation.

ccache(1)
==========

To reduce building times from 4 hours to 40 minutes I used **ccache(1)**.

I also add small **verimg-ccache-setup(8)** helper script to setup it fast below.

```
FreeBSD # cat verimg-ccache-setup
#! /bin/sh

mkdir -p /var/ccache

cat << EOF >> /etc/make.conf
# ccache(1)
WITH_CCACHE_BUILD=yes
CCACHE_DIR=/var/ccache
EOF

cat << EOF > /var/ccache/ccache.conf
max_size = 0
cache_dir = /var/ccache
base_dir = /var/ccache
hash_dir = false
EOF

ln -sf /var/ccache/ccache.conf /usr/local/etc/ccache.conf

ccache -sv

```

I also commented all possible actions and commands within **verimg(8)** code so it will be very easy to modify and maintain. I also made sure to check it any of the instructions executed w/o errors … or it stops immediately.

<img data-attachment-id="10267" data-permalink="https://vermaden.wordpress.com/2026/04/15/freebsd-image-builder-installer-verimg-tool/verimg-code-comments/" data-orig-file="https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-code-comments.png" data-orig-size="570,710" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;,&quot;alt&quot;:&quot;&quot;}" data-image-title="verimg-code-comments" data-image-description="" data-image-caption="" data-large-file="https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-code-comments.png?w=570" class="alignnone size-full wp-image-10267" src="https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-code-comments.png" alt="" width="570" height="710" srcset="https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-code-comments.png 570w, https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-code-comments.png?w=120&amp;h=150 120w, https://vermaden.wordpress.com/wp-content/uploads/2026/04/verimg-code-comments.png?w=241&amp;h=300 241w" sizes="(max-width: 570px) 100vw, 570px">

As its the 0.1 version – there are some things that are hardcoded right now – like **1.1.1.1** DNS … or other things that I did not yet thought about to ‘optionalize’ … but even now it works really well and does for me in minutes what **release.sh** was not able to do in hours. Of course **release.sh** also builds ‘cloud’ images while **verimg(8)** does not.

I can also add **geli(8)** support – that is not a problem.

Currently **verimg(8)** creates VM image in RAW mode … but one can convert it to other formats such as QCOW2 or VMDK with **qemu-img(8)** tool easily.

Summary
==========

So here we are with new **verimg(8)** tool to build/create FreeBSD images and a tool that also can be done for unattended FreeBSD installations.

Feel free to suggest improvements and tell me how can it be even better.

<a name="UPDATE1"></a>

UPDATE 1 – Additional Features and Clarification
----------

For a start these changes happened between **0.1** nad **0.2** (current) releases:

* New **-S SRCD** option to choose directory for FreeBSD source (default: **/usr/src**).
* Define new **\_\_verimg\_clean()** function to clean up mess if something does not work.
* Add **\_\_verimg\_check()** function to check various things before work.

Some people suggested that **poudriere-image(8)** has more features then **verimg(8)** … but it does not.

For a start – I do not see options for PKGBASE in the **poudriere-image(8)** man page … so I am not sure if I end up with PKGBASE system (probably not) or classic *Distribution Sets* system – but that can (can?) be probably configured some undocumented way.

About the other arguments:

* I already have system with built packages – so 3rd party packages ready in some repo.
* I already have a system that builds PKGBASE repo – so PKGBASE packages are ready.

So when I will try to use **poudriere-image(8)** instead of **verimg(8)** I would have these downgrades:

* I need to build PKGBASE FreeBSD *Base System* everytime from source (which I do not need/want).
* I need to build 3rd party **pkg(8)** packages from FreeBSD Ports (which I do not need/want).
* I can not create custom/additional ZFS datasets and custom ZFS filesystem sizes.
* I can not create additional FAT32 filesystems with configs for **cloud-init(1)** use.
* I am not sure if **poudriere-image(8)** supports **geli(8)** – which I also sometimes need in images – and I plan to add **geli(8)** support to **verimg(8)** … and I doubt it will be added to **poudriere-image(8)** anytime soon.

With **verimg(8)** I just use PKGBASE packages as *Base System* from repo I previously built and then add 3rd party **pkg(8)** packages from other repo that I already built. That way I ‘suffer’ compilation time once and then I can build various images in minutes/seconds – not in long hours compiling everything each time.

One can also ask question … why FreeBSD as a project maintains 3 different ‘building systems’?

1. We have classic **# make buildworld buildkernel update-packages** at **/usr/src** dir.

2. We have **release.sh** inside **/usr/src/release** dir.

3. We have **poudriere-image(8)** for similar purposes.

4. We also have **mkimg(8)** which is used by both **release.sh** and **poudriere-image(8)** tools.

But as they exists … I can only assume that they all are needed.

Someone asked why I did not used **bsdinstall script /tmp/script.cfg** instead …

… and as usual I answered.

Its complicated.

PKGBASE is one thing.

With my **verimg(8)** I can use custom FreeBSD code – then compile it the way I want … then package it into PKGBASE and then add configs and custom partitions all the way … and anything else.

For example with **release.sh** if you want to build VM images with **cloud-init(1)** … its not a real **cloud-init(1)** but **nuageinit(1)** because Python is a dependency for **cloud-init(1)** … and **cloud-init(1)** supports FAT32 or ISO9660 filesystems as source for configs … while in GPT version of the scripts there is no function to create such partitions with **release.sh** because there only exists a function for NTFS … and not for FAT32 or ISO9660 … the function for FAT32 exists but for … MBR scheme … but who uses MBR in 2026?

The problem with **bsdinstall(8)** is – besides PKGBASE – is that it expects the ISO or *Distribution Sets* – if You want them from custom FreeBSD source tree – you still need to provide them in some more or less expected way/place and in the expected format … and after that you will still struggle how to put needed files and configs … and additional packages with that **bsdinstall(8)** way.

Instead of wasting time on how to manage and use all these things … especially as the documentation for them is often in some outdated blog posts instead of *FreeBSD Handbook* or man pages … I wanted to use my time the best possible way and with results that I am sure that will provide – and that is why **verimg(8)** happened and why I will improve it even more over time.

Hope that helps.

EOF