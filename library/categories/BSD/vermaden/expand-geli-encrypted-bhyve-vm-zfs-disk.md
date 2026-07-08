+++
title = "Expand GELI Encrypted Bhyve VM ZFS Disk"
description = "The ZFS partition/volume expansion is generally not an ultra hard task … but needs one step at a time approach. Today we will follow them one by one to expand GELI encrypted ZFS disk. There is only one potential problem – and I faced that recently with one of the other VMs I mana"
date = "2026-06-17T19:44:06Z"
url = "https://vermaden.wordpress.com/2026/06/17/expand-geli-encrypted-bhyve-vm-zfs-disk/"
author = "vermaden"
text = ""
lastupdated = "2026-07-07T12:18:11.876210293Z"
seen = true
+++

The ZFS partition/volume expansion is generally not an ultra hard task … but needs one step at a time approach.

                        ![](https://vermaden.wordpress.com/wp-content/uploads/2020/09/openzfs.jpg)

                        Today we will follow them one by one to expand GELI encrypted ZFS disk.

                        There is only one potential problem – and I faced that recently with one of the other VMs I manage.

                         If FreeBSD VM guest version is older – I have tested with 14.1-RELEASE for example – then even these will not help:

                        ```
                        guest # camcontrol rescan all
                        guest # camcontrol reprobe ${RESIZED_DISK}
                        ```

                        You will have to reboot.

                         But with FreeBSD 15.0-RELEASE VM guest the new disk size was picked up quite fast and no reboot needed.

                         The list of steps to be taken:

                        Increasing VM disk on FreeBSD Bhyve hypervisor for that VM. Potential **reboot(8)** for some older FreeBSD releases. Recover partition table with **gpart(8)** tool. Resizing partition **gpart(8)** layer. The GELI layer will ‘notice’ automatically. ZFS resizing.

So lets get to work – first – resize VM Disk on FreeBSD Bhyve hypervisor host.

 Its a ZFS ZVOL for the record this time.

 The FreeBSD host also has **vm-bhyve** installed and used to manage Bhyve guests.

```
host # zfs list | grep vm-guestzroot/vm/vm-guest            572G   358G  2.79G  /vm/vm-guestzroot/vm/vm-guest/disk0      569G   384G   251G  -
```

 We will resize disk for **vm-guest** VM now.

 The guest VM can be running – resizing can be done online.

```
host # vm list | grep -e NAME -e vm-guestNAME      DATASTORE  LOADER     CPU  MEMORY  VNC  AUTO     STATEvm-guest  default    bhyveload  4    8G      -    No        Running (69638)
```

 Lets check where is the guest VM disk.

```
host # vm info vm-guest | grep -A 32 virtual-disk  virtual-disk    number: 0    device-type: zvol    emulation: nvme    options: -    system-path: /dev/zvol/zroot/vm/vm-guest/disk0    bytes-size: 268435456000 (250.000G)    bytes-used: 269879066624 (251.344G)
```

 … and that we have enough space in ZFS pool for expansion.

```
host # zpool list zrootNAME      SIZE  ALLOC   FREE  CKPOINT  EXPANDSZ   FRAG    CAP  DEDUP    HEALTH  ALTROOTzroot    1.67T  1.15T   530G        -         -    62%    69%  1.00x    ONLINE  -
```

 Now – below is the actual command to expand ZFS ZVOL.

```
host # zfs set volsize=350g zroot/vm/vm-guest/disk0
```

 We should now see increased size.

```
host # vm info vm-guest | grep -A 32 virtual-disk  virtual-disk    number: 0    device-type: zvol    emulation: nvme    options: -    system-path: /dev/zvol/zroot/vm/vm-guest/disk0    bytes-size: 375809638400 (350.000G)    bytes-used: 269879066624 (251.344G)
```

 If the disk would be a file on filesystem – then we would resize it this way instead.

 same as with ZVOL we just specify the new size.

```
host # truncate -s 350g /vm/vm-guest/disk.img
```

 Now next step is to recover the partition table with **gpart(8)** tool.

```
guest # gpart show=>       40  734003120  nda0  GPT  (350G) [CORRUPT]         40       1024     1  freebsd-boot  (512K)       1064        984        - free -  (492K)       2048   16777216     2  freebsd-swap  (8.0G)   16779264   20971520     3  freebsd-swap  (10G)   37750784    4194304     4  freebsd-zfs  (2.0G)   41945088  482340864     5  freebsd-zfs  (230G)guest # gpart recover nda0nda0 recovered
```

 Now next step is to expand last partition with **gpart(8)** command.

 We will add additional **100 GB** of space.

```
guest # gpart show=>       40  734003120  nda0  GPT  (350G)         40       1024     1  freebsd-boot  (512K)       1064        984        - free -  (492K)       2048   16777216     2  freebsd-swap  (8.0G)   16779264   20971520     3  freebsd-swap  (10G)   37750784    4194304     4  freebsd-zfs  (2.0G)   41945088  482340864     5  freebsd-zfs  (230G)  524285952  209717208        - free -  (100G)
```

 Below command will use all that space for last partition on the disk.

```
guest # gpart resize -i 5 nda0nda0p5 resizedguest # gpart show=>       40  734003120  nda0  GPT  (350G)         40       1024     1  freebsd-boot  (512K)       1064        984        - free -  (492K)       2048   16777216     2  freebsd-swap  (8.0G)   16779264   20971520     3  freebsd-swap  (10G)   37750784    4194304     4  freebsd-zfs  (2.0G)   41945088  692058072     5  freebsd-zfs  (330G)
```

 GELI layer should resize automatically.

```
guest # geli status         Name  Status  Components   nda0p4.eli  ACTIVE  nda0p4   nda0p5.eli  ACTIVE  nda0p5gpt/swap0.eli  ACTIVE  gpt/swap0guest # dmesg | grep -E 'GEOM.*size.*changed'GEOM_ELI: Device nda0p5.eli size changed from 219518685184 to 314963316736.guest # geli list nda0p5.eliGeom name: nda0p5.eliState: ACTIVEEncryptionAlgorithm: AES-XTSKeyLength: 256AuthenticationAlgorithm: HMAC/SHA256Crypto: accelerated softwareVersion: 7UsedKey: 1Flags: BOOT, AUTH, NODELETE, AUTORESIZEKeysAllocated: 660KeysTotal: 660Providers:1. Name: nda0p5.eli   Mediasize: 314963316736 (293G)   Sectorsize: 4096   Mode: r1w1e1Consumers:1. Name: nda0p5   Mediasize: 354333732864 (330G)   Sectorsize: 512   Stripesize: 0   Stripeoffset: 21475885056   Mode: r1w1e1
```

 Now we need to expand ZFS.

 First we need to enable **autoexpand** for that ZFS pool.

```
guest # zpool get all zroot | grep autoexpandzroot  autoexpand                     off                            defaultguest # zpool set autoexpand=on zroot
```

 Next check **zpool status** command to get exact names of the ZFS pool and VDEV to resize.

```
guest # gpart show=>       40  734003120  nda0  GPT  (350G)         40       1024     1  freebsd-boot  (512K)       1064        984        - free -  (492K)       2048   16777216     2  freebsd-swap  (8.0G)   16779264   20971520     3  freebsd-swap  (10G)   37750784    4194304     4  freebsd-zfs  (2.0G)   41945088  692058072     5  freebsd-zfs  (330G)guest # zpool status zroot  pool: zroot state: ONLINEconfig:    NAME          STATE     READ WRITE CKSUM    zroot         ONLINE       0     0     0      nda0p5.eli  ONLINE       0     0     0errors: No known data errors
```

 In next step the ZFS pool resize happens.

```
guest # zpool online -e zroot nda0p5.eli
```

 Done.

 You may verify with **df(1)** or **zpool(8)** commands.

```
guest # df -g /Filesystem           1G-blocks Used Avail Capacity  Mounted onzroot/ROOT/default       154    2   151     2%    /guest # zpool list zrootNAME   SIZE  ALLOC   FREE  CKPOINT  EXPANDSZ   FRAG    CAP  DEDUP    HEALTH  ALTROOTzroot  292G   131G   161G        -         -    21%    44%  1.00x    ONLINE  -
```

 Nothing more to be added here from my side – take care.

EOF