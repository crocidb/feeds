+++
title = "Lenovo XClarity Administrator in FreeBSD Bhyve VM"
description = "This is another entry that is sponsored by fme AG company. If You have multiple Lenovo ThinkServer systems to manage You may do that by hand with entering UEFI/BIOS setup and doing needed things by hand … or You can setup a Lenovo XClarity Administrator VM. The problem is that th"
date = "2026-08-28T00:45:59Z"
url = "https://vermaden.wordpress.com/2026/08/28/lenovo-xclarity-administrator-in-freebsd-bhyve-vm/"
author = "vermaden"
text = ""
lastupdated = "2026-09-01T19:33:12.477181286Z"
seen = false
+++

This is another entry that is sponsored by [**fme AG**](https://fme.de/) company. If You have multiple **Lenovo ThinkServer** systems to manage You may do that by hand with entering UEFI/BIOS setup and doing needed things by hand … or You can setup a [**Lenovo XClarity Administrator**](https://support.lenovo.com/us/en/solutions/ht116184) VM.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/logo-freebsd-xclarity.png)

The problem is that this VM from **Lenovo** comes by default in three versions … and none of them is by default suited for FreeBSD Bhyve hypervisor.

* **VHD** for Windows Hyper-V hypervisor.
* **OVA** for VirtualBox and others that support OVA format.
* **QCOW2** for Linux KVM based hypervisors.

As usual I decided not to give up at that point and tried harder … and that trying led me to some interesting conclusions.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/lenovo-download-qcow2.png)

I downloaded the QCOW2 version listed as [**lnvgy\_sw\_lxca\_120-4.3.0\_kvm\_x86-64.qcow2**](https://download.lenovo.com/servers/mig/2025/06/18/62669/lnvgy_sw_lxca_120-4.3.0_kvm_x86-64.qcow2) file – its about **3.2 GB** in size.

Then I created the Bhyve VM for that Linux system.

```
freebsd # vm create lxca

```

As I had the **Lenovo** image in QCOW2 format I used **qemu-img(1)** from the **emulators/qemu** package to convert it to RAW format that is suitable for FreeBSD Bhyve hypervisor. One important thing to note before doing the conversion … the size of RAW disk will be **192 GB**. It will not matter on ZFS with compression enabled – but it can fill Your disk if You have compression disabled.

```
freebsd # zfs get -d 0 compression
NAME   PROPERTY     VALUE           SOURCE
zroot  compression  lz4             local

freebsd # du -smh \
            lnvgy_sw_lxca_120-4.3.0_kvm_x86-64.qcow2 \
            /vm/lxca/disk0.img
3.2G    lnvgy_sw_lxca_120-4.3.0_kvm_x86-64.qcow2
4.6G    /vm/lxca/disk0.img

freebsd # du -smhA \
              lnvgy_sw_lxca_120-4.3.0_kvm_x86-64.qcow2 \
              /vm/lxca/disk0.img
3.2G    lnvgy_sw_lxca_120-4.3.0_kvm_x86-64.qcow2
192G    /vm/lxca/disk0.img

```

Now the conversion.

```
freebsd # pkg which -o $( which qemu-img )
/usr/local/bin/qemu-img was installed by package emulators/qemu

freebsd # \
  qemu-img convert -f qcow2 -O raw \
    lnvgy_sw_lxca_120-4.3.0_kvm_x86-64.qcow2 \
    /vm/lxca/disk0.img

```

I then investigated what actually is on that raw disk and FreeBSD **md(4)** driver helped here beautifully. We will also use my [**mdconfig.sh**](https://raw.githubusercontent.com/vermaden/scripts/refs/heads/master/mdconfig.sh) script to make it easier.

```
freebsd # mdconfig.sh -c disk0.img
IN: created vnode at /dev/md0

freebsd # lsblk md0
DEVICE         MAJ:MIN  SIZE TYPE                                    LABEL MOUNT
md0              1:183  192G MBR                                         - -
  <FREE>         -:-    993K -                                           - -
  md0s1          1:184   24G linux-data                         ext2fs/ELR -
  md0s2          1:205    8G linux-data                 ext2fs/ELR_VAR_LOG -
  md0s3          1:206  160G linux-data               ext2fs/ELR_LXCA_DATA -

```

So … now we know that its an MBR partitioning scheme … which means UEFI boot is not possible – and this is where it gets ugly because Bhyve is not VirtualBox (and I admit this is one of the Bhyve downsides) which means we now have to find needed parameters for Bhyve to boot that Linux VM.

We can at least mount these partitions to check what is in them … and also check the GRUB config. We will use **lklfuse(8)** from the **filesystems/lkl** package for that – lets try with the 1st partition.

```
freebsd # pkg which -o $( which lklfuse )
/usr/local/bin/lklfuse was installed by package filesystems/lkl

freebsd # mkdir -p /mnt/tmp

freebsd # lklfuse -o type=ext4 /dev/md0s1 /mnt/tmp

freebsd # ls -l /mnt/tmp
total 76
drwxr-xr-x   2 root wheel     4096 Feb 19  2025 bin
drwxr-xr-x   3 root wheel     4096 Apr  9  2025 boot
lrwxrwxrwx   1 root wheel       28 Jun  6  2025 chroot -> /opt/lenovo/lxca/data/chroot
drwxr-xr-x   2 root wheel     4096 Feb 19  2025 dev
lrwxrwxrwx   1 800  800         26 Jun  6  2025 dump -> /opt/lenovo/lxca/data/dump
drwxr-xr-x  66 root wheel     4096 Aug 28 00:40 etc
drwxr-xr-x  12 root wheel     4096 Aug 28 00:40 home
drwxr-xr-x   8 root wheel     4096 Feb 19  2025 lib
lrwxrwxrwx   1 root wheel        3 Jun  6  2025 lib64 -> lib
drwx------   2 root wheel    16384 Jun  6  2025 lost+found
drwxr-xr-x   2 root wheel     4096 Feb 19  2025 media
drwxrwxr-x   2 root wheel     4096 Feb 19  2025 mnt
drwxr-xr-x   7 root wheel     4096 Jun  6  2025 opt
dr-xr-xr-x   2 root wheel     4096 Feb 19  2025 proc
drwxr-xr-x  10 root wheel     4096 Jun  6  2025 run
drwxr-xr-x   2 root wheel     4096 Feb 19  2025 sbin
dr-xr-xr-x   2 root wheel     4096 Feb 19  2025 sys
lrwxrwxrwx   1 root wheel        8 Jun  6  2025 tmp -> /var/tmp
drwxr-xr-x  11 root wheel     4096 Feb 19  2025 usr
drwxr-xr-x  11 root wheel     4096 Jun  6  2025 var

freebsd # ls -l /mnt/tmp/boot
total 14176
lrwxrwxrwx   1 root wheel       16 Jun  6  2025 bzImage -> bzImage-5.15.178
-rw-r--r--   1 root wheel 11837760 Feb 19  2025 bzImage-5.15.178
drwxr-xr-x   2 root wheel     4096 Jun  6  2025 grub
-rw-r--r--   1 root wheel  2670312 Feb 19  2025 initrd
freebsd # cat /mnt/tmp/boot/grub/grub.conf
default=0
timeout=1

title System Management Platform
        root (hd0,0)
        kernel /boot/bzImage ro console=tty0 console=ttyS0 root=LABEL=ELR clocksource_failover=acpi_pm net.ifnames=0 clocksource_failover=acpi_pm
        initrd /boot/initrd

freebsd # cd /

freebsd # umount /mnt/tmp

freebsd # mdconfig.sh -d 0
IN: deleted vnode at /dev/md0

```

So … we know what the GRUB config looks like – lets try to translate that into FreeBSD Bhyve VM config. After playing some time I settled on this **lxca** VM config as shown below.

```
freebsd # env EDITOR=cat vm config lxca
loader="grub"
grub_run_partition="msdos1"
grub_run_dir="/boot/grub"
grub_run0="linux /boot/bzImage ro console=tty0 console=ttyS0 root=LABEL=ELR clocksource_failover=acpi_pm net.ifnames=0 clocksource_failover=acpi_pm"
grub_run1="initrd /boot/initrd"
cpu=3
memory=16G
network0_type="e1000"
network0_switch="public"
network0_mac="58:9c:fc:06:2e:71"
network1_type="e1000"
network1_switch="public"
network1_mac="58:9c:fc:02:3b:c0"
disk0_type="virtio-blk"
disk0_name="disk0.img"
uuid="53211072-22f1-43f0-97c4-fae86903b2fc"

```

Then we need to start the VM with usual command.

```
freebsd # vm start lxca
```

You may (and should) trace the boot process with **vm console {VM}** command of course.

```
freebsd # vm console lxca
```

You will see lots of Linux boot messages both first from the Linux kernel itself and later from the booting process of applications/daemons/databases needed to start **Lenovo XClarity Administrator** appliance. After some time – definitely longer then shorter – You will see something like that below.

```
**************************************************************
 This interface is not for user or customer usage    *********
**************************************************************

------------------------------------------
Lenovo LXCA - Version 4.3.0 build 120
------------------------------------------

eth0: flags=4163  mtu 1500
        inet 10.1.1.52  netmask 255.255.255.0  broadcast 10.1.1.255
        inet6 fe80::5a9c:fcff:fe06:2e71  prefixlen 64  scopeid 0x20
        ether 58:9c:fc:06:2e:71  txqueuelen 1000  (Ethernet)
        RX errors 0  dropped 0  overruns 0  frame 0

eth1:      Disabled

localhost login:

```

This means that You can how try to access [**https://10.1.1.52/**](https://10.1.1.52/) in Your browser … and after I tried that I (of course) needed to accept the self generated certificate and then I saw this.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/lenovo-interface.png)

Voila! It works! ![🙂](https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/72x72/1f642.png)

Now You can configure it from the browser as needed.

Guide that really helped me to setup all these things right was the [**Lenovo XClarity Administrator – Users Guide**](https://pubs.lenovo.com/lxca/lxca_users_guide.pdf) that has this in its contents.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/lenovo-guide.png)

It shows TWO network interfaces here – **eth0** and **eth1** – not just one – and when I used only one – everything failed – after I added 2nd network interface – everything started to work as desired.

I do not have anything more to add here – I am really glad that I persisted hard to try all available options here – take care ![🙂](https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/72x72/1f642.png)

<a name="UPDATE1"></a>

UPDATE 1 – Lenovo XClarity One
----------

Graham Perrin commented on one of the places where I shared the article that **XClarity Administrator** will not be supported after **2027/06/30** and that **XClarity One** is now the future … so I tried to setup **XClarity One** under FreeBSD Bhyve VM and this update will show You the details.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/xclarity-one-notice.png)

The **Lenovo XClarity One** can be downloaded as QCOW2 image [here](https://support.lenovo.com/us/en/solutions/ht518002) – so I did. Now it seams that there are TWO disks instead of just ONE – but that does not bring any problems for Bhyve – we will attach them both.

```
freebsd # vm create lxco

freebsd # cd /vm/lxco

freebsd # du -smh ~/lnvgy_sw_xc1_26p.2.0_kvm_indiv.tgz                       
5.0G    /home/vermaden/lnvgy_sw_xc1_26p.2.0_kvm_indiv.tgz

freebsd # du -smhA ~/lnvgy_sw_xc1_26p.2.0_kvm_indiv.tgz
5.0G    /home/vermaden/lnvgy_sw_xc1_26p.2.0_kvm_indiv.tgz

freebsd # tar -xvf ~/lnvgy_sw_xc1_26p.2.0_kvm_indiv.tgz
x ./lnvgy_sw_xc1_7909-uat_kvm_x86_64_disk1.qcow2
x ./lnvgy_sw_xc1_7909-uat_kvm_x86_64_disk2.qcow2

freebsd # qemu-img convert -f qcow2 -O raw lnvgy_sw_xc1_7909-uat_kvm_x86_64_disk1.qcow2 disk0.img

freebsd # qemu-img convert -f qcow2 -O raw lnvgy_sw_xc1_7909-uat_kvm_x86_64_disk2.qcow2 disk1.img

freebsd # ls -l /vm/lxco
total 13534815
-rw-r--r--  1 root wheel 257699151872 Aug 28 21:27 disk0.img
-rw-r--r--  1 root wheel 536870912000 Aug 28 21:25 disk1.img
-rw-r--r--  1 root wheel  16380461056 Jul 16 13:58 lnvgy_sw_xc1_7909-uat_kvm_x86_64_disk1.qcow2
-rw-r--r--  1 root wheel       204608 Jul 16 13:58 lnvgy_sw_xc1_7909-uat_kvm_x86_64_disk2.qcow2
-rw-r--r--  1 root wheel          213 Aug 28 21:18 lxco.conf
-rw-r--r--  1 root wheel           66 Aug 28 21:18 vm-bhyve.log

freebsd # ls -lh /vm/lxco
total 13534815
-rw-r--r--  1 root wheel 240G Aug 28 21:27 disk0.img
-rw-r--r--  1 root wheel 500G Aug 28 21:25 disk1.img
-rw-r--r--  1 root wheel  15G Jul 16 13:58 lnvgy_sw_xc1_7909-uat_kvm_x86_64_disk1.qcow2
-rw-r--r--  1 root wheel 200K Jul 16 13:58 lnvgy_sw_xc1_7909-uat_kvm_x86_64_disk2.qcow2
-rw-r--r--  1 root wheel 213B Aug 28 21:18 lxco.conf
-rw-r--r--  1 root wheel  66B Aug 28 21:18 vm-bhyve.log

```

I believe at least some things could have change – so lets have a look inside ![🙂](https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/72x72/1f642.png)

```
freebsd # mdconfig.sh -c disk0.img
IN: created vnode at /dev/md0

freebsd # lsblk md0
DEVICE         MAJ:MIN  SIZE TYPE                                    LABEL MOUNT
md0              1:182  240G MBR                                         - -
           -:-    993K -                                           - -
  md0s1          1:183    2G linux-data                     gpt/linux-data -
  md0s2          1:184   20G linux-data                     gpt/linux-data -
  md0s3          1:206   20G linux-data                     gpt/linux-data -
  md0s4          2:7    198G EBR                                   gpt/ebr -
    md0s4+00000001   2:9     99G linux-data                                  - -
    md0s4+03295525   2:11    99G linux-data                                  - -
           -:-     62K -                                           - -

freebsd # lklfuse -o type=ext4 /dev/md0s1 /mnt/tmp

freebsd # ls -l /mnt/tmp
total 16400
-rw-r--r--  1 root wheel 16749568 Oct  9  2025 bzImage
drwxr-xr-x  3 root wheel     4096 Oct  9  2025 grub
drwx------  2 root wheel    16384 Oct  9  2025 lost+found

freebsd # ls -l /mnt/tmp/grub
total 16
-rw-r--r--  1 root wheel   129 Oct  9  2025 grub.cfg
drwxr-xr-x  2 root wheel 12288 Oct  9  2025 i386-pc

freebsd # cat /mnt/tmp/grub/grub.cfg
set timeout=10
  menuentry 'XClarity Portal' {
  linux /bzImage root=PARTUUID=f869306a-02 rw net.ifnames=0 loglevel=4 console=tty1
}

```

So … no more **initrd** and different **linux** line … not much. This is how the new **vm-bhyve** config looks like.

```
freebsd # cat /vm/lxco/lxco.conf
loader="grub"
grub_run_dir="/grub"
grub_run_partition="msdos1"
grub_run0="linux /bzImage root=PARTUUID=f869306a-02 rw net.ifnames=0 loglevel=4 console=tty1"
cpu=8
memory=16G
network0_type="e1000"
network0_switch="public"
network0_mac="58:9c:fc:0a:cf:eb"
network1_type="e1000"
network1_switch="public"
network1_mac="58:9c:fc:03:25:d7"
disk0_type="virtio-blk"
disk0_name="disk0.img"
disk1_type="virtio-blk"
disk1_name="disk1.img"
uuid="d2eb04ed-1884-45c8-987f-f5df7e412664"

```

Lets start this thing.

```
freebsd # vm start lxco

freebsd # vm console lxco

```

Seems to boot without errors – this is what is visible on the console.

```
(...)

        Welcome to XClarity One Portal 26p.2.0-7909

VM Information:
---------------
-                IPv4:
-             Netmask: 0.0.0.0
-             Gateway:
-        Internal CNI: 192.168.255.0/25
-                UUID: 89705D12214F40249DB75E00D2D1C522
System Information:
-------------------
-         CPU # Cores: 8
-     CPU Utilization: 28.83 %
-  Memory Utilization: 2.31 % (370 MB of 15999 MB)
- Storage Utilization: 47.25 % (113.41 GB of 240 GB)

xc1p login:

        Welcome to XClarity One Portal 26p.2.0-7909

VM Information:
---------------
-                IPv4: 10.1.1.36
-             Netmask: 255.255.255.0
-             Gateway: 10.1.1.1
-        Internal CNI: 192.168.255.0/25
-                UUID: 89705D12214F40249DB75E00D2D1C522
System Information:
-------------------
-         CPU # Cores: 8
-     CPU Utilization: 18.96 %
-  Memory Utilization: 6.77 % (1083 MB of 15999 MB)
- Storage Utilization: 47.25 % (113.41 GB of 240 GB)

xc1p login:

```

It generally ‘refreshes’ or just ‘adds’ new CPU/RAM/… status once in a while. This is how it looks like in the web browser (after accepting self signed certificate warning). As You see it takes a while for it to pick up the DHCP IP address.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/xclarity-one-web-interface.png)

Seems to work … till next time.

EOF