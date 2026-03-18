---
title = "Alpine Linux on a Bare Metal Server"
description = 'A brief write-up on Alpine Linux, as a server operating system, on a bare metal system, on the example of a \_Hetzner dedicated root server\_.'
date = "2025-10-08T08:24:00Z"
url = "https://xn--gckvb8fzb.com/alpine-linux-on-a-bare-metal-server/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2025-10-24T09:36:19.639811637Z"
seen = true
---

When I began work on [📨🚕 (*MSG.TAXI*)](/msgtaxi/), I kept things deliberately low-key, since I didn’t want it turning into a playground for [architecture astronauts](https://en.wikipedia.org/wiki/Architecture_astronaut). For the web console’s tech stack, I went with [the most boring yet easy-to-master CRUD stack I could find](https://rubyonrails.org), that doesn’t depend on [JavaScript](https://www.youtube.com/watch?v=lc5Np9OqDHU). And while **deploying** Rails in a sane way (without resorting to *cOnTaInErS*) is a massive PITA, thanks to the Rails cargo-cult mentality and the author’s followers latching onto every half-baked wannabe-revolutionary idea, like *Kamal* and more recently *Omarchy*, as if it were a philosopher’s stone, from a development perspective it’s still the most effective getting-shit-done framework I’ve used to date. Best of all, it doesn’t rely on JavaScript (aside from `Destroy` actions, which can be avoided with a little extra effort).

Similarly, on the infrastructure side, I wanted a foundation that was as lightweight as possible and wouldn’t get in my way. And while I’m absolutely the type of person who would run a [Gentoo](/tag/gentoo/) server, I ultimately went with [Alpine Linux](https://drewdevault.com/2021/05/06/Praise-for-Alpine-Linux.html) due to its easier installation, relatively sane defaults (with a few exceptions, [more on that later](#annoyances)), and its preference for straightforward, no-nonsense tooling that doesn’t try to hide *magic* behind the scenes.

*“Why not NixOS?”* you might ask. Since I’m deploying a lightweight, home-brewed Ruby/Rails setup alongside a few other components, I didn’t see the point of wrapping everything as Nix packages just to gain the theoretical benefits of NixOS. In particular, the CI would have taken significantly longer, while the actual payoff in my case would have been negligible.

Since I’m paying for 📨🚕 out of my own pocket, I wanted infrastructure that’s cheap yet reliable. With plenty of people on the internet praising *Hetzner*, I ended up renting AMD hardware in one of their Finnish datacenters.

Hetzner doesn’t offer as many Linux deployment options as cloud providers like [Vultr](https://www.vultr.com/?ref=9671208-9J), so I had to set up Alpine myself, which was pretty straightforward. To kickstart an Alpine installation on a Hetzner system, you just need to access the server’s iPXE console, either by renting a Hetzner KVM for an hour or by using their free *vKVM* feature.

From there, you can launch the [Alpine Linux `boot.ipxe`](https://boot.alpinelinux.org/boot.ipxe) by initializing the network interface and chain-loading the file:

```
dhcp
chain https://boot.alpinelinux.org/boot.ipxe

```

From that point on setup should be easy thanks to Alpine’s installer routine.

vKVM
----------

If you’re using Hetzner’s *vKVM* feature to install Alpine, this chapter is for you. Otherwise, feel free to skip ahead.

*vKVM* is a somewhat hacky yet ingenious trick Hetzner came up with, and it deserves a round of applause. If you’re curious about how it works under the hood, rent a real KVM once and reboot your server into *vKVM* mode. What you’ll see is that after enabling *vKVM* in Hetzner’s *Robot*, iPXE loads a network image, which boots a custom Linux OS. Within that OS, Hetzner launches a QEMU VM that uses your server’s drives to boot whatever you have installed. It’s basically [*Inception*](https://en.wikipedia.org/wiki/Inception) at the OS level. As long as *vKVM* is active (meaning the iPXE image stays loaded), your server is actually running inside this virtualized environment, with display output forwarded to your browser. Run `lspci` while in *vKVM* mode and you’ll see, for example, your NIC showing up as a VirtIO device.

Here’s the catch: When you install Alpine through this virtualized KVM environment, it won’t generate the `initramfs` your physical server actually needs. For instance, if your server uses an NVMe drive, you may discover that `/etc/mkinitfs/mkinitfs.conf` doesn’t include the `nvme` module, causing the OS to fail on boot. Hetzner’s documentation doesn’t mention this, and it can easily bite you later.

**Tl;dr:** If you installed your system via *vKVM*, make sure your `initramfs` includes all necessary modules. After updating `mkinitfs.conf`, regenerate the `initramfs`. There are several ways to do this, but I prefer `apk fix linux-lts`. Always double-check that the regenerated `initramfs` really contains everything you need. Unfortunately Alpine doesn’t provide tools for this, so [here’s a .tar.gz](lsi.tar.gz) with Debian’s `lsinitramfs` and `unmkinitramfs`. Extract it into `/usr/local/bin/`, and note that you may need to `apk add cpio tar gzip` for them to work properly, due to Alpine’s somewhat annoying defaults (more on that [later](#annoyances)).

Finally, after rebooting, make sure you’ve actually left the *vKVM* session. You can double check by running `lspci`. If the session is still active (default: 1h), your system may have just booted back into the VM, which you can identify by its Virt-devices.

First steps
----------

As soon as your Alpine Linux system is up and running there are a couple of things that I found important to change right off the bat.

### Boot timeout ###

Alpine’s default boot timeout is just 1 second, set in `/etc/update-extlinux.conf` (`timeout`). If you ever need to debug a boot-related issue over a high-latency KVM connection, you **will dread** that 1-second window. I recommend increasing it to 5 seconds and running `update-extlinux -v` to apply the change.

In practice, you hopefully won’t be rebooting the server that often, so the extra four seconds won’t matter day-to-day.

### Networking ###

Alpine uses the classic `/etc/network/interfaces` to configure network settings. On Hetzner’s dedicated servers, you can either continue using DHCP for IPv4 or set the assigned IP address statically. For IPv6, you’ll be given a `/64` subnet from which you can choose your own address. Keep in mind that the first usable IPv6 on Hetzner’s dedicated servers is `::2`:

```
iface eth0 inet6 static
        address 2a01:04f9:006b:55ec::2
        netmask 64
        gateway fe80::1

```

### SSH ###

Amongst the first things you do should be disabling root login and password authentication via SSH:

```
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys

```

Apart from that you might want to limit the type of key exchange methods and algorithms that your SSH server allows, depending on the type of keys that you’re using.

**Security by obscurity:** Move your SSH server from its default port (22) to something higher up and more random to make it harder for port-scanners to hit it.

**Finicky but more secure:** Implement [port knocking](https://wiki.archlinux.org/title/Port_knocking) and use a [handy client](https://f-droid.org/en/packages/me.impa.knockonports/) to open the SSH port for you only, for a limited time only.

**Secure:** Set up a small cloud instance to act as Wireguard peer and configure your server’s SSH port to only accept connections from the cloud instance using a [firewall rule](#firewall). Use Tailscale if a dedicated Wireguard instance is beyond your expertise.

### Tools ###

You will likely want to have proper (GNU) tools around, over the defaults that Alpine comes with ([see below](#annoyances)). Some of the obvious choices include the following:

```
apk add coreutils cpio curl git gzip ripgrep shadow tar taceroute

```

In addition, I also like to keep a handful of convenience tools around:

```
apk add mosh msmtp neovim tmux zsh

```

### Monitoring ###

This is a tricky part because everyone’s monitoring setup looks different. However, there are a few things that make sense in general.

#### Logs ####

Regardless what you do with your logs it’s generally a good idea to switch from *BusyBox* to something that allows for more advanced configurations, like *syslog-ng*:

```
apk add syslog-ng logrotate

```

```
rc-update del syslog boot
rc-update add syslog-ng boot
rc-update stop syslog
rc-update start syslog-ng

```

#### Hardware ####

You probably should have an overview of how your hardware is doing.

```
apk add lm-sensors lm-sensors-detect lshw pciutils

```

Depending on what type of hard drives your server has, you might want to install the `nvme-cli` or `smartmontools` packages.

### Security ###

#### Firewall ####

[UFW](https://wiki.alpinelinux.org/wiki/Uncomplicated_Firewall) is generally considered an uncomplicated way to implement firewalling without having to complete a *CCNP Security* certification beforehand:

```
apk add ip6tables ufw

```

#### Fail2Ban ####

Depending on your SSH setup and whether you are running any other services that could benefit from it, installing [Fail2Ban](https://wiki.alpinelinux.org/wiki/Fail2ban) might make sense:

```
apk add fail2ban
rc-update add fail2ban
rc-service fail2ban start

```

The configuration files are located at `/etc/fail2ban` and you should normally only create/edit the `*.local` files.

### Backups ###

The easiest way to backup all the changes that you’ve made to the general configuration is by using [`lbu`](https://wiki.alpinelinux.org/wiki/Alpine_local_backup), the integrated *Alpine local backup* solution that was originally intended as a tool to manage [diskless mode](https://wiki.alpinelinux.org/wiki/Diskless_Mode) installations.

I would, however, recommend to manually back up installed packages (`apk list --installed`) and use [Restic](https://github.com/restic/restic/) for the rest of the system, including configuration files and important data, e.g.:

```
restic -v -r "$RESTIC_REPO" backup \
  "/etc" \
  "/root" \
  "$MY_DATA_DIR_1" \
  "$MY_DATA_DIR_2"

```

However, backups depend on the data that your system produces and your desired backup target. If you’re looking for an easy to use, hosted but not-too-expensive one-off option, then *Tarsnap* might be for you.

### Et cetera ###

You should as well look into topics like local mail delivery, system integrity checks (e.g. *AIDE*) and intrusion detection/prevention (e.g. *CrowdSec*). Also, if you would like to get notified for various server events, check [📨🚕 (*MSG.TAXI*)](https://msg.taxi)! :-)

Annoyances
----------

One of the biggest annoyances with Alpine is *BusyBox*:

>
>
> You need SSH? That’s BusyBox.  
>  The logs? Yeah, BusyBox.  
>  Mail? That’s BusyBox, too.  
>  You want to untar an archive? BusyBox.  
>  What? It’s gzipped? Guess what, you son of a gun, gzip is also BusyBox.
>
>

[![](/alpine-linux-on-a-bare-metal-server/images/busybox_hu_5b9d30656d6cf0e1.webp)](/alpine-linux-on-a-bare-metal-server/images/busybox.jpg)

I understand why Alpine chose **BusyBox** for pretty much everything, given the context that Alpine is most often used in (*cOnTaInErS*). Unfortunately, most BusyBox implementations are incomplete or incompatible with their full GNU counterparts, leaving you wondering why something that worked flawlessly on your desktop Linux fails on the Alpine box.

By the time I finished setting up the server, there was barely any *BusyBox* tooling left. However, I occasionally had to [resort to some odd trickery](https://wiki.alpinelinux.org/wiki/Relay_email_to_gmail_(msmtp,_mailx,_sendmail#Sendmail_alias) to get things working.

Ready to go
----------

You now have a good basis to set up whatever it is that you’re planning to use the machine for. Have fun!

**Footnote:** The artwork was generated using AI and further botched by me using the [*greatest image manipulation program*](https://www.gimp.org).