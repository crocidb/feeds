+++
title = "How I backed up and locally booted my entire VPS"
description = "Like many enthusiasts, I have a free-tier Ampere A1 instance from Oracle. And like many Oracle users, I live in constant paranoia that Oracle will do what they do best and [fuck me over with zero warning](https://www.reddit.com/r/oraclecloud/comments/1u4lzkk/new_free_tier_limits_"
date = "2026-07-03T00:00:00Z"
url = "https://igerman.cc/blog/oracle-backup/"
author = "german s."
text = ""
lastupdated = "2026-07-03T12:10:55.498636112Z"
seen = false
+++

Like many enthusiasts, I have a free-tier Ampere A1 instance from Oracle. And like many Oracle users, I live in constant paranoia that Oracle will do what they do best and [fuck me over with zero warning](https://www.reddit.com/r/oraclecloud/comments/1u4lzkk/new_free_tier_limits_confirmed_by_oracle_support/).

The problem[#](#the-problem)
----------

I already had a file-level Borg backup for my data, but I wanted a concrete, sovereign, block-level backup of the entire drive - something I could simply boot up locally as a VM if disaster struck. Since Oracle won't let me do this nicely, they get a middle finger.

<img src="https://igerman.cc/processed_images/my-way.1ebcec3f0f641add.jpg" alt="A frame from the SpongeBob episode 'Another Way', depicting Finn The Human angrily splitting water with a sentient bush while shouting. Text at the bottom says 'MY WAY!!!'" width="888" height="499" sizes="(min-width: 920px) 784px, (min-width: 700px) calc(82vw + 46px), calc(100vw - 40px)" srcset="https://igerman.cc/processed_images/my-way.e92318dccae9ccab.jpg 640w,
             https://igerman.cc/processed_images/my-way.b3e710c20f467bfe.jpg 784w" loading="lazy">

My local Mac didn’t have enough disk space for a 200GB raw image, but I have a 24TB TrueNAS SCALE setup that I could access over Tailscale. 4 hours later, I've been through fire and flames, but I fucking got it. This is not a tutorial, there are most definitely better ways to do this.

To avoid writing a massive 200GB file to the VPS drive itself (would cause write-tearing and run out of space anyway), I decided to stream the block-level dd copy directly to my NAS over Tailscale. This is an *insane* thing to do.

Precautions, and a bit of luck[#](#precautions-and-a-bit-of-luck)
----------

To handle my notoriously unreliable internet connection, I chose NFS with a hard mount over Tailscale. A couple clicks in TrueNAS, then a command:

```
sudo mount -t nfs -o hard,timeo=600,retrans=2,tcp TAILSCALE_IP:/mnt/nas_share /mnt/nas_backup
```

And I was good to go. This turned out to be the best decision I could have made by a long shot.

Before cloning, I cleaned up any caches, logs, and anything that didn't strictly need to exist in a backup. Just to be safe, I then zeroed out the empty space on the VPS (`dd if=/dev/zero of=/zerofile`) and deleted it once it ran out of space. This made it possible for zstd to compress the empty space to nothing.

I stopped my heavy services (Docker, PM2, Caddy, etc.) to quiet the drive activity, prayed to Torvalds a little, and ran the streaming backup:

```
sudo dd if=/dev/sda bs=16M status=progress | zstd -3 -T0 > /mnt/nas_backup/oracle_backup.img.zst
```

The inevitable death of my god damn internet[#](#the-inevitable-death-of-my-god-damn-internet)
----------

Mid-transfer, my primary internet connection died. My local router failed over to a backup modem, changing my public IP. Three minutes later, the primary modem rebooted, and it failed back, changing my public IP again.

Because of this, the Tailscale daemon on the VPS locked up. My SSH terminal froze. I thought I was fucked. Under any standard TCP connection, the backup would have died here, forcing me to restart 100+ GB of transfer from scratch.

But because of the NFS hard mount, the kernel simply placed the dd and zstd processes into State D, freezing them but not crashing.

I logged into the VPS using the Oracle Serial Console, since SSH apparently completely died and restarted the Tailscale daemon.

It worked. Tailscale was back. In a few minutes, the kernel woke everything up, and the transfer resumed on the exact byte it left off. This had to be done two times.

It finished at exactly 214 748 364 800 bytes. The entire 215GB drive compressed down to a dinky neat 26 GB on the NAS. Granted, the real compression ratio was not as impressive and came out to be about 2.3x due to the actual real disk usage on my VPS.

The fun part - booting it in QEMU[#](#the-fun-part-booting-it-in-qemu)
----------

I really wanted to boot it. Seemed sane, on some level at least, to try it out with QEMU on my M1 MacBook.

First things first, I decompressed the zstd image and made an overlay image to not damage the original:

```
qemu-img create -f qcow2 -b /Volumes/oracle_dd_backup/oracle_ubuntu_full.img -F raw ~/Desktop/oracle_test_boot.qcow2
```

Yes, you read that right. This is earnestly pointing directly at my NAS, mounted via SMB on my Mac. And all of that was done over Wi-Fi. This is absolutely fucking disgusting. I love it. Please don't do this.

Because both the Mac and the VPS are ARM64, I theorized I could virtualize it at really good speeds. Indeed I could. One command later, I had it actually booting the kernel:

```
qemu-system-aarch64 \
  -M virt,highmem=on \
  -accel hvf \
  -cpu host \
  -smp 4 \
  -m 4096 \
  -bios /opt/homebrew/share/qemu/edk2-aarch64-code.fd \
  -drive file=/Users/myself/Desktop/oracle_test_boot.qcow2,if=virtio,file.locking=off,backing.file.locking=off \
  -device virtio-net-pci,netdev=net0 \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -nographic
```

\*macOS's SMB client does not support the specific byte-range locks QEMU wants to put on network files. To fix it, I had to explicitly disable locking on both the local overlay and the remote backing file.

---

On the first boot, the kernel loaded but instantly remounted the root filesystem as Read-Only. Because the block copy was taken live, ext4 flagged a block bitmap inconsistency. This killed the boot.

I knew I needed to run `fsck`, but catching the GRUB boot menu in QEMU over an SMB share was almost impossible.

Since TrueNAS SCALE is Debian-based, I bypassed the VM entirely. I SSH’d into my NAS, mapped the raw .img file as a loop device, and let the NAS repair the filesystem directly:

```
sudo losetup -fP --show oracle_ubuntu_full.img
sudo e2fsck -y -f /dev/loop0p1
sudo losetup -d /dev/loop0
```

It fixed the FS in about a minute.

Holy Shit, it booted[#](#holy-shit-it-booted)
----------

And finally, after all of that, it freaking booted. Fast. I got SSH, I got all my files, Docker containers were starting to spin up. And now, Oracle can fuck right off. Hell yeah to sovereignty and data portability.

I do not recommend anyone do this. It is a very bad idea for a massive number of reasons. But it worked for me, and I am very happy about it, because now if Oracle fucks me, I'll fuck 'em right back.

<img src="https://igerman.cc/processed_images/it-booted-yippee.8be3f31498de031e.jpg" alt="A screenshot of a terminal app running QEMU on the left showing the TTY output of a normal Linux boot, and a window on the right showing a successful SSH connection. A comment has been typed after the prompt - '# this is running on my mac!!!'" width="1280" height="695" sizes="(min-width: 920px) 784px, (min-width: 700px) calc(82vw + 46px), calc(100vw - 40px)" srcset="https://igerman.cc/processed_images/it-booted-yippee.4de814b45a982898.jpg 640w,
             https://igerman.cc/processed_images/it-booted-yippee.69ffd57949fd8af1.jpg 784w,
             https://igerman.cc/processed_images/it-booted-yippee.36a31bf701d43da3.jpg 1280w,
             https://igerman.cc/processed_images/it-booted-yippee.b605aeadbf5cb924.jpg 1920w,
             https://igerman.cc/processed_images/it-booted-yippee.7206b62a90e2c494.jpg 2560w" loading="lazy">

<sup style="">Written by a human, Mistakes, swears and all.</sup>