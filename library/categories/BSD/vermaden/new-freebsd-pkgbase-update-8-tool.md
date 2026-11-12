+++
title = "New FreeBSD pkgbase-update(8) Tool"
description = "We all know that PKGBASE is ‘the’ way for the FreeBSD future – but there are some things that need to be polished. FreeBSD 15.x is the last version that will allows usage of freebsd-update(8) command to update/upgrade FreeBSD system. Starting with FreeBSD 16.0-RELEASE the PKGBASE"
date = "2026-11-10T01:37:08Z"
url = "https://vermaden.wordpress.com/2026/11/10/freebsd-pkgbase-update-tool/"
author = "vermaden"
text = ""
lastupdated = "2026-11-11T16:05:17.651598147Z"
seen = false
+++

We all know that [PKGBASE](https://vermaden.wordpress.com/2025/10/20/brave-new-pkgbase-world/) is ‘the’ way for the FreeBSD future – but there are some things that need to be polished. FreeBSD 15.x is the last version that will allows usage of **freebsd-update(8)** command to update/upgrade FreeBSD system. Starting with FreeBSD 16.0-RELEASE the PKGBASE will be the ONLY way of installing/updating/upgrading the FreeBSD *Base System*.

First 15.2-BETA1 version of upcoming FreeBSD 15.2-RELEASE has been [announced](https://lists.freebsd.org/archives/freebsd-stable/2026-November/004356.html). I was really waiting to see new upgrade instructions and features with FreeBSD 15.2-BETA1 message … but I was disappointed.

Instead of something brain dead easy as **freebsd-update(8)** update instructions such as:

```
freebsd # freebsd-update upgrade -r 15.2-BETA1

freebsd # freebsd-update install
(...)

```

We got something like that … instead:

```
freebsd # pkg upgrade -yr FreeBSD-ports pkg

freebsd # mkdir /tmp/upgrade-15.2

freebsd # echo 'FreeBSD-base: {
          url: "pkg+https://pkg.FreeBSD.org/${ABI}/base_release_2_beta1"
        }' > /tmp/upgrade-15.2/upgrade.conf

freebsd # pkg -o REPOS_DIR=/etc/pkg,/usr/local/etc/pkg/repos,/tmp/upgrade-15.2 \
              -o IGNORE_OSVERSION=yes
              upgrade -r FreeBSD-base

freebsd # pkg -o REPOS_DIR=/etc/pkg,/usr/local/etc/pkg/repos,/tmp/upgrade-15.2 \
              upgrade -r FreeBSD-ports-kmods

freebsd (amd64)   # cp /boot/loader.efi /boot/efi/efi/boot/BOOTX64.EFI

freebsd (aarch64) # cp /boot/loader.efi /boot/efi/efi/boot/BOOTAA64.EFI

freebsd (armv7)   # cp /boot/loader.efi /boot/efi/efi/boot/BOOTARM.EFI

freebsd # find /etc /usr/local/etc -name '*.pkgnew' -ls

freebsd # rm -r /tmp/upgrade-15.2

freebsd # shutdown -r now

freebsd # pkg which $(kldstat -v | awk -F '[()]' '/\.ko/ {print $2}')

```

… and the first thing that I though about was like … “*Really?*”

I mean … how hard can it be to script it and automate it? … and do not get me started on AI – what I did here is all by my own hands and fingers in a classic sysadmin way – character by character – line by line – command after command – exception by exception … and it took me like 2-3 hours most.

The Microslop GitHub repository is available here – [https://github.com/vermaden/pkgbase-update](https://github.com/vermaden/pkgbase-update) – released under BSD license as usual. The most important and crucial part of the code is this ‘part’ below.

<img data-attachment-id="10749" data-permalink="https://vermaden.wordpress.com/2026/11/10/freebsd-pkgbase-update-tool/code-3/" data-orig-file="https://vermaden.wordpress.com/wp-content/uploads/2026/11/code.png" data-orig-size="680,1589" data-comments-opened="1" data-image-title="code" data-image-description="" data-image-caption="" data-large-file="https://vermaden.wordpress.com/wp-content/uploads/2026/11/code.png?w=438" class="alignnone size-full wp-image-10749" src="https://vermaden.wordpress.com/wp-content/uploads/2026/11/code.png" alt="" width="625" height="1460" srcset="https://vermaden.wordpress.com/wp-content/uploads/2026/11/code.png?w=625&amp;h=1460 625w, https://vermaden.wordpress.com/wp-content/uploads/2026/11/code.png?w=64&amp;h=150 64w, https://vermaden.wordpress.com/wp-content/uploads/2026/11/code.png?w=128&amp;h=300 128w, https://vermaden.wordpress.com/wp-content/uploads/2026/11/code.png 680w" sizes="(max-width: 625px) 100vw, 625px">

Now for the features … what the new **pkgbase-update(8)** tool has to offer?

```
freebsd # pkgbase-update
usage:
  pkgbase-update upgrade -r VERSION
  pkgbase-update install
  pkgbase-update loader
  pkgbase-update pkgnew
  pkgbase-update modules
```

Quite standard replacement of **freebsd-update(8)** to be honest … just in a PKGBASE world. It just upgrades existing FreeBSD system in PKGBASE way to the specified target – just like **freebsd-update(8)** did … and in a very similar way.

Example Upgrade Run
==========

Below is a fresh FreeBSD 15.1-RELEASE system installed with **pkgbase-update(8)** tool doing the upgrade to now available 15.2-BETA1 version. The only thing that could be tweaked is the **'y'** answer in the middle – I can make it ‘forced’ and automatic so it will just ‘happen’ – but it seamed reasonable to keep that choice at least for a start.

I mean … its the first public version of **pkgbase-update(8)** code – so no need to rush ‘forces’ choices.

Now – without further ado – this is how it looks like to upgrade FreeBSD 15.1-RELEASE system to a 15.2-BETA1 one with **pkgbase-update(8)** command. All the **INFO: (anything here)** messages are the ones generated by the **pkgbase-update(8)** command.

```
freebsd # pkgbase-update upgrade -r 15.2-BETA1
INFO: upgrading from '15.1-RELEASE' to '15.2-BETA1' version
Updating FreeBSD-base repository catalogue...
pkg: Repository FreeBSD-base has a wrong packagesite, need to re-create database
Fetching meta.conf: 100%     179 B   0.2 kB/s    00:01    
Fetching data: 100%  7563 KiB   7.7 MB/s    00:01    
Processing entries: 100%
FreeBSD-base repository update completed. 509 packages processed.
FreeBSD-base is up to date.
New version of pkg detected; it needs to be installed first.
The following 1 package(s) will be affected (of 0 checked):

Installed packages to be UPGRADED:
        pkg: 2.6.2_1 -> 2.8.4 [FreeBSD-base]

Number of packages to be upgraded: 1

The process will require 22 MiB more space.
13 MiB to be downloaded.

Proceed with this action? [y/N]: y
[1/1] Fetching pkg-2.8.4: 100%    13 MiB   6.9 MB/s    00:02    
Checking integrity... done (0 conflicting)
[1/1] Upgrading pkg from 2.6.2_1 to 2.8.4...
[1/1] Extracting pkg-2.8.4: 100%
pkg: option REPOS_DIR is defined in the environment to '/etc/pkg,/usr/local/etc/pkg/repos,/tmp/15.2-BETA1' but command line option redefines it
pkg: option IGNORE_OSVERSION is defined in the environment to 'yes' but command line option redefines it
Updating FreeBSD-base repository catalogue...
pkg: need to re-create repo FreeBSD-base to upgrade schema version
Fetching meta.conf: 100%     179 B   0.2 kB/s    00:01    
Fetching data: 100%  7563 KiB   7.7 MB/s    00:01    
Processing entries: 100%
FreeBSD-base repository update completed. 509 packages processed.
Fetching filesite: 100%   670 KiB 686.4 kB/s    00:01    
Compressing files: 100%
FreeBSD-base is up to date.
Checking for upgrades (213 candidates): 100%
Processing candidates (213 candidates): 100%
The following 213 package(s) will be affected (of 0 checked):

Installed packages to be UPGRADED:
        FreeBSD-acct: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-acpi: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-apm: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-at: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-atf: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-atf-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-atf-lib: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-audit: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-audit-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-audit-lib: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-autofs: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-bhyve: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-blocklist: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-blocklist-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-bluetooth: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-bluetooth-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-bluetooth-lib: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-bmake: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-bootloader: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-bootloader-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-bsdconfig: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-bsdinstall: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-bsnmp: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-bsnmp-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-bzip2: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-bzip2-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-bzip2-lib: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-caroot: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ccdconfig: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-certctl: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-clang: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-clang-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-clibs: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-clibs-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-console-tools: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-cron: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-csh: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ctf: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ctf-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ctf-lib: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ctl: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-cxgbe-tools: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-devd: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-devmatch: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-devmatch-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-dhclient: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-diff3: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-dma: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-dtrace: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-dtrace-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-dwatch: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ee: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-efi-tools: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-efi-tools-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-examples: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-fd: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-fetch: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-fetch-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-firmware-iwm: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-flua: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-flua-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ftp: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-fwget: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-games: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-geom: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ggate: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-gssd: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-hast: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-hostapd: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-hyperv-tools: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-inetd: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ipf: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ipfw: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-iscsi: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-jail: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-kerberos: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-kerberos-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-kerberos-kdc: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-kerberos-lib: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-kernel-generic: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-kernel-man: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-kyua: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-lib9p: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-lib9p-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libarchive: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libarchive-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libbegemot: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libbegemot-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libblocksruntime: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libblocksruntime-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libbsdstat: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libbsdstat-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libcasper: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libcasper-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libcompat-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libcompiler_rt-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libcuse: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libcuse-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libdwarf: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libdwarf-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libevent1: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libevent1-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libexecinfo: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libexecinfo-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libipt: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libipt-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libldns: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libldns-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libmagic: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libmagic-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libmilter: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libmilter-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libpathconv: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libpathconv-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-librpcsec_gss: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-librpcsec_gss-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-librss: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-librss-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libsqlite3: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libsqlite3-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libthread_db: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libthread_db-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libucl: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libucl-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libvgl: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libvgl-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libvmmapi: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libvmmapi-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libyaml: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-libyaml-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-lld: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-lldb: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-local-unbound: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-local-unbound-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-locales: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-lp: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-mandoc: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-mlx-tools: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-mtree: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-natd: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-natd-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ncurses: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ncurses-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ncurses-lib: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-netmap: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-netmap-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-newsyslog: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-nfs: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ntp: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-nuageinit: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-nvme-tools: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-openssl: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-openssl-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-openssl-lib: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-pam: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-pam-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-pam-lib: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-periodic: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-pf: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-pf-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-pkg-bootstrap: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-pmc: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-pmc-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-powerd: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ppp: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-quotacheck: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-rc: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-rcmds: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-rdma: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-rescue: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-resolvconf: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-rip: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-runtime: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-runtime-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-sendmail: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-set-base: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-set-devel: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-set-minimal: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-set-optional: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-smbutils: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-smbutils-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-sound: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-sound-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ssh: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ssh-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-syscons-data: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-syslogd: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-tcpd: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-tcpd-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-telnet: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-toolchain: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-toolchain-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ufs: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ufs-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-ufs-lib: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-utilities: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-utilities-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-vi: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-vt-data: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-wpa: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-xz: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-xz-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-xz-lib: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-yp: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-zfs: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-zfs-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-zfs-lib: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-zlib: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-zlib-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-zoneinfo: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-zstd: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-zstd-dev: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]
        FreeBSD-zstd-lib: 15.1 -> 15.2.b1.20261106025213 [FreeBSD-base]

Number of packages to be upgraded: 213

The process will require 17 MiB more space.
223 MiB to be downloaded.

Proceed with this action? [y/N]: y
[  1/213] Fetching FreeBSD-libmilter-dev-15.2.b1.20261106025213: 100%    86 KiB  87.8 kB/s    00:01    
[  2/213] Fetching FreeBSD-libsqlite3-dev-15.2.b1.20261106025213: 100%  2258 KiB   2.3 MB/s    00:01    
[  3/213] Fetching FreeBSD-libldns-dev-15.2.b1.20261106025213: 100%   668 KiB 684.5 kB/s    00:01    
[  4/213] Fetching FreeBSD-hast-15.2.b1.20261106025213: 100%   103 KiB 105.2 kB/s    00:01    
[  5/213] Fetching FreeBSD-tcpd-15.2.b1.20261106025213: 100%    44 KiB  44.9 kB/s    00:01    
[  6/213] Fetching FreeBSD-bluetooth-15.2.b1.20261106025213: 100%   220 KiB 225.2 kB/s    00:01    
[  7/213] Fetching FreeBSD-flua-15.2.b1.20261106025213: 100%   157 KiB 160.3 kB/s    00:01    
[  8/213] Fetching FreeBSD-dwatch-15.2.b1.20261106025213: 100%    28 KiB  28.7 kB/s    00:01    
[  9/213] Fetching FreeBSD-nvme-tools-15.2.b1.20261106025213: 100%    84 KiB  86.3 kB/s    00:01    
[ 10/213] Fetching FreeBSD-bsnmp-dev-15.2.b1.20261106025213: 100%   179 KiB 183.7 kB/s    00:01    
[ 11/213] Fetching FreeBSD-libipt-dev-15.2.b1.20261106025213: 100%   251 KiB 257.2 kB/s    00:01    
[ 12/213] Fetching FreeBSD-ntp-15.2.b1.20261106025213: 100%  1913 KiB   2.0 MB/s    00:01    
[ 13/213] Fetching FreeBSD-bzip2-lib-15.2.b1.20261106025213: 100%    36 KiB  37.0 kB/s    00:01    
[ 14/213] Fetching FreeBSD-bsdconfig-15.2.b1.20261106025213: 100%   189 KiB 193.7 kB/s    00:01    
[ 15/213] Fetching FreeBSD-tcpd-dev-15.2.b1.20261106025213: 100%    65 KiB  66.8 kB/s    00:01    
[ 16/213] Fetching FreeBSD-runtime-15.2.b1.20261106025213: 100%  2561 KiB   2.6 MB/s    00:01    
[ 17/213] Fetching FreeBSD-libarchive-15.2.b1.20261106025213: 100%   377 KiB 385.7 kB/s    00:01    
[ 18/213] Fetching FreeBSD-atf-lib-15.2.b1.20261106025213: 100%    68 KiB  70.0 kB/s    00:01    
[ 19/213] Fetching FreeBSD-caroot-15.2.b1.20261106025213: 100%   354 KiB 362.3 kB/s    00:01    
[ 20/213] Fetching FreeBSD-bhyve-15.2.b1.20261106025213: 100%   265 KiB 271.8 kB/s    00:01    
[ 21/213] Fetching FreeBSD-netmap-15.2.b1.20261106025213: 100%    18 KiB  18.0 kB/s    00:01    
[ 22/213] Fetching FreeBSD-lldb-15.2.b1.20261106025213: 100%  4648 KiB   4.8 MB/s    00:01    
[ 23/213] Fetching FreeBSD-openssl-15.2.b1.20261106025213: 100%   636 KiB 651.3 kB/s    00:01    
[ 24/213] Fetching FreeBSD-sound-15.2.b1.20261106025213: 100%  1387 KiB   1.4 MB/s    00:01    
[ 25/213] Fetching FreeBSD-libblocksruntime-15.2.b1.20261106025213: 100%    5150 B   5.2 kB/s    00:01    
[ 26/213] Fetching FreeBSD-rip-15.2.b1.20261106025213: 100%    91 KiB  92.7 kB/s    00:01    
[ 27/213] Fetching FreeBSD-wpa-15.2.b1.20261106025213: 100%   639 KiB 654.0 kB/s    00:01    
[ 28/213] Fetching FreeBSD-ee-15.2.b1.20261106025213: 100%    62 KiB  63.0 kB/s    00:01    
[ 29/213] Fetching FreeBSD-libipt-15.2.b1.20261106025213: 100%    46 KiB  47.2 kB/s    00:01    
[ 30/213] Fetching FreeBSD-libbegemot-15.2.b1.20261106025213: 100%    5658 B   5.7 kB/s    00:01    
[ 31/213] Fetching FreeBSD-libvmmapi-dev-15.2.b1.20261106025213: 100%    54 KiB  54.8 kB/s    00:01    
[ 32/213] Fetching FreeBSD-libsqlite3-15.2.b1.20261106025213: 100%   565 KiB 578.6 kB/s    00:01    
[ 33/213] Fetching FreeBSD-zstd-lib-15.2.b1.20261106025213: 100%   264 KiB 270.3 kB/s    00:01    
[ 34/213] Fetching FreeBSD-bzip2-dev-15.2.b1.20261106025213: 100%    95 KiB  97.7 kB/s    00:01    
[ 35/213] Fetching FreeBSD-bmake-15.2.b1.20261106025213: 100%   236 KiB 241.5 kB/s    00:01    
[ 36/213] Fetching FreeBSD-natd-dev-15.2.b1.20261106025213: 100%   170 KiB 173.6 kB/s    00:01    
[ 37/213] Fetching FreeBSD-atf-15.2.b1.20261106025213: 100%    73 KiB  74.5 kB/s    00:01    
[ 38/213] Fetching FreeBSD-libldns-15.2.b1.20261106025213: 100%   156 KiB 159.7 kB/s    00:01    
[ 39/213] Fetching FreeBSD-smbutils-15.2.b1.20261106025213: 100%    40 KiB  41.0 kB/s    00:01    
[ 40/213] Fetching FreeBSD-nuageinit-15.2.b1.20261106025213: 100%    21 KiB  21.9 kB/s    00:01    
[ 41/213] Fetching FreeBSD-devmatch-dev-15.2.b1.20261106025213: 100%    15 KiB  14.9 kB/s    00:01    
[ 42/213] Fetching FreeBSD-sound-dev-15.2.b1.20261106025213: 100%  1354 KiB   1.4 MB/s    00:01    
[ 43/213] Fetching FreeBSD-blocklist-15.2.b1.20261106025213: 100%    53 KiB  54.1 kB/s    00:01    
[ 44/213] Fetching FreeBSD-lib9p-15.2.b1.20261106025213: 100%    36 KiB  37.3 kB/s    00:01    
[ 45/213] Fetching FreeBSD-ufs-15.2.b1.20261106025213: 100%   250 KiB 255.5 kB/s    00:01    
[ 46/213] Fetching FreeBSD-mlx-tools-15.2.b1.20261106025213: 100%    6693 B   6.7 kB/s    00:01    
[ 47/213] Fetching FreeBSD-audit-15.2.b1.20261106025213: 100%   111 KiB 114.0 kB/s    00:01    
[ 48/213] Fetching FreeBSD-bsnmp-15.2.b1.20261106025213: 100%   390 KiB 399.1 kB/s    00:01    
[ 49/213] Fetching FreeBSD-fetch-dev-15.2.b1.20261106025213: 100%   119 KiB 122.2 kB/s    00:01    
[ 50/213] Fetching FreeBSD-flua-dev-15.2.b1.20261106025213: 100%    5465 B   5.5 kB/s    00:01    
[ 51/213] Fetching FreeBSD-certctl-15.2.b1.20261106025213: 100%    13 KiB  13.5 kB/s    00:01    
[ 52/213] Fetching FreeBSD-devmatch-15.2.b1.20261106025213: 100%    18 KiB  18.3 kB/s    00:01    
[ 53/213] Fetching FreeBSD-mandoc-15.2.b1.20261106025213: 100%   300 KiB 307.0 kB/s    00:01    
[ 54/213] Fetching FreeBSD-openssl-lib-15.2.b1.20261106025213: 100%  2242 KiB   2.3 MB/s    00:01    
[ 55/213] Fetching FreeBSD-toolchain-15.2.b1.20261106025213: 100%   559 KiB 572.7 kB/s    00:01    
[ 56/213] Fetching FreeBSD-toolchain-dev-15.2.b1.20261106025213: 100%    20 KiB  20.3 kB/s    00:01    
[ 57/213] Fetching FreeBSD-vi-15.2.b1.20261106025213: 100%   278 KiB 285.2 kB/s    00:01    
[ 58/213] Fetching FreeBSD-set-minimal-15.2.b1.20261106025213: 100%     877 B   0.9 kB/s    00:01    
[ 59/213] Fetching FreeBSD-zoneinfo-15.2.b1.20261106025213: 100%   130 KiB 133.6 kB/s    00:01    
[ 60/213] Fetching FreeBSD-librss-15.2.b1.20261106025213: 100%    3485 B   3.5 kB/s    00:01    
[ 61/213] Fetching FreeBSD-games-15.2.b1.20261106025213: 100%    15 KiB  15.6 kB/s    00:01    
[ 62/213] Fetching FreeBSD-mtree-15.2.b1.20261106025213: 100%    46 KiB  47.1 kB/s    00:01    
[ 63/213] Fetching FreeBSD-ncurses-lib-15.2.b1.20261106025213: 100%   223 KiB 227.9 kB/s    00:01    
[ 64/213] Fetching FreeBSD-natd-15.2.b1.20261106025213: 100%    59 KiB  60.5 kB/s    00:01    
[ 65/213] Fetching FreeBSD-fwget-15.2.b1.20261106025213: 100%    8434 B   8.4 kB/s    00:01    
[ 66/213] Fetching FreeBSD-dtrace-dev-15.2.b1.20261106025213: 100%  1241 KiB   1.3 MB/s    00:01    
[ 67/213] Fetching FreeBSD-libexecinfo-dev-15.2.b1.20261106025213: 100%    18 KiB  18.7 kB/s    00:01    
[ 68/213] Fetching FreeBSD-examples-15.2.b1.20261106025213: 100%   150 KiB 153.5 kB/s    00:01    
[ 69/213] Fetching FreeBSD-librss-dev-15.2.b1.20261106025213: 100%    8321 B   8.3 kB/s    00:01    
[ 70/213] Fetching FreeBSD-ssh-15.2.b1.20261106025213: 100%  1035 KiB   1.1 MB/s    00:01    
[ 71/213] Fetching FreeBSD-pf-dev-15.2.b1.20261106025213: 100%    12 KiB  12.8 kB/s    00:01    
[ 72/213] Fetching FreeBSD-csh-15.2.b1.20261106025213: 100%   371 KiB 379.4 kB/s    00:01    
[ 73/213] Fetching FreeBSD-dtrace-15.2.b1.20261106025213: 100%   302 KiB 308.8 kB/s    00:01    
[ 74/213] Fetching FreeBSD-rcmds-15.2.b1.20261106025213: 100%    40 KiB  40.6 kB/s    00:01    
[ 75/213] Fetching FreeBSD-diff3-15.2.b1.20261106025213: 100%    14 KiB  13.9 kB/s    00:01    
[ 76/213] Fetching FreeBSD-libexecinfo-15.2.b1.20261106025213: 100%    5264 B   5.3 kB/s    00:01    
[ 77/213] Fetching FreeBSD-fd-15.2.b1.20261106025213: 100%    28 KiB  28.4 kB/s    00:01    
[ 78/213] Fetching FreeBSD-ipf-15.2.b1.20261106025213: 100%   292 KiB 298.6 kB/s    00:01    
[ 79/213] Fetching FreeBSD-hostapd-15.2.b1.20261106025213: 100%   573 KiB 586.6 kB/s    00:01    
[ 80/213] Fetching FreeBSD-efi-tools-dev-15.2.b1.20261106025213: 100%   111 KiB 113.4 kB/s    00:01    
[ 81/213] Fetching FreeBSD-inetd-15.2.b1.20261106025213: 100%    31 KiB  32.0 kB/s    00:01    
[ 82/213] Fetching FreeBSD-firmware-iwm-15.2.b1.20261106025213: 100%  1532 KiB   1.6 MB/s    00:01    
[ 83/213] Fetching FreeBSD-libvgl-dev-15.2.b1.20261106025213: 100%    62 KiB  63.2 kB/s    00:01    
[ 84/213] Fetching FreeBSD-ncurses-dev-15.2.b1.20261106025213: 100%  1850 KiB   1.9 MB/s    00:01    
[ 85/213] Fetching FreeBSD-hyperv-tools-15.2.b1.20261106025213: 100%    20 KiB  20.4 kB/s    00:01    
[ 86/213] Fetching FreeBSD-libyaml-15.2.b1.20261106025213: 100%    43 KiB  44.2 kB/s    00:01    
[ 87/213] Fetching FreeBSD-powerd-15.2.b1.20261106025213: 100%    12 KiB  12.6 kB/s    00:01    
[ 88/213] Fetching FreeBSD-newsyslog-15.2.b1.20261106025213: 100%    30 KiB  31.0 kB/s    00:01    
[ 89/213] Fetching FreeBSD-resolvconf-15.2.b1.20261106025213: 100%    24 KiB  25.1 kB/s    00:01    
[ 90/213] Fetching FreeBSD-libbsdstat-dev-15.2.b1.20261106025213: 100%    10 KiB  10.3 kB/s    00:01    
[ 91/213] Fetching FreeBSD-clang-dev-15.2.b1.20261106025213: 100%    15 MiB   5.2 MB/s    00:03    
[ 92/213] Fetching FreeBSD-libmagic-dev-15.2.b1.20261106025213: 100%   299 KiB 306.0 kB/s    00:01    
[ 93/213] Fetching FreeBSD-locales-15.2.b1.20261106025213: 100%  1565 KiB   1.6 MB/s    00:01    
[ 94/213] Fetching FreeBSD-libcuse-dev-15.2.b1.20261106025213: 100%    19 KiB  19.0 kB/s    00:01    
[ 95/213] Fetching FreeBSD-librpcsec_gss-dev-15.2.b1.20261106025213: 100%    73 KiB  75.2 kB/s    00:01    
[ 96/213] Fetching FreeBSD-ctf-15.2.b1.20261106025213: 100%    62 KiB  63.3 kB/s    00:01    
[ 97/213] Fetching FreeBSD-libblocksruntime-dev-15.2.b1.20261106025213: 100%    15 KiB  15.4 kB/s    00:01    
[ 98/213] Fetching FreeBSD-zstd-dev-15.2.b1.20261106025213: 100%  1303 KiB   1.3 MB/s    00:01    
[ 99/213] Fetching FreeBSD-xz-lib-15.2.b1.20261106025213: 100%    94 KiB  95.9 kB/s    00:01    
[100/213] Fetching FreeBSD-lld-15.2.b1.20261106025213: 100%   784 KiB 803.2 kB/s    00:01    
[101/213] Fetching FreeBSD-efi-tools-15.2.b1.20261106025213: 100%    56 KiB  57.5 kB/s    00:01    
[102/213] Fetching FreeBSD-kerberos-lib-15.2.b1.20261106025213: 100%   613 KiB 627.5 kB/s    00:01    
[103/213] Fetching FreeBSD-ftp-15.2.b1.20261106025213: 100%    82 KiB  83.5 kB/s    00:01    
[104/213] Fetching FreeBSD-bootloader-15.2.b1.20261106025213: 100%  1353 KiB   1.4 MB/s    00:01    
[105/213] Fetching FreeBSD-netmap-dev-15.2.b1.20261106025213: 100%    46 KiB  47.3 kB/s    00:01    
[106/213] Fetching FreeBSD-atf-dev-15.2.b1.20261106025213: 100%   692 KiB 708.4 kB/s    00:01    
[107/213] Fetching FreeBSD-openssl-dev-15.2.b1.20261106025213: 100%    13 MiB   6.7 MB/s    00:02    
[108/213] Fetching FreeBSD-utilities-15.2.b1.20261106025213: 100%  7994 KiB   8.2 MB/s    00:01    
[109/213] Fetching FreeBSD-utilities-dev-15.2.b1.20261106025213: 100%  5415 KiB   5.6 MB/s    00:01    
[110/213] Fetching FreeBSD-iscsi-15.2.b1.20261106025213: 100%    43 KiB  44.1 kB/s    00:01    
[111/213] Fetching FreeBSD-libthread_db-dev-15.2.b1.20261106025213: 100%    51 KiB  52.0 kB/s    00:01    
[112/213] Fetching FreeBSD-blocklist-dev-15.2.b1.20261106025213: 100%    27 KiB  27.5 kB/s    00:01    
[113/213] Fetching FreeBSD-bootloader-dev-15.2.b1.20261106025213: 100%    8320 B   8.3 kB/s    00:01    
[114/213] Fetching FreeBSD-cxgbe-tools-15.2.b1.20261106025213: 100%   449 KiB 459.4 kB/s    00:01    
[115/213] Fetching FreeBSD-libthread_db-15.2.b1.20261106025213: 100%    11 KiB  11.1 kB/s    00:01    
[116/213] Fetching FreeBSD-acct-15.2.b1.20261106025213: 100%    48 KiB  48.7 kB/s    00:01    
[117/213] Fetching FreeBSD-gssd-15.2.b1.20261106025213: 100%    16 KiB  16.3 kB/s    00:01    
[118/213] Fetching FreeBSD-libbsdstat-15.2.b1.20261106025213: 100%    3793 B   3.8 kB/s    00:01    
[119/213] Fetching FreeBSD-lib9p-dev-15.2.b1.20261106025213: 100%   169 KiB 173.3 kB/s    00:01    
[120/213] Fetching FreeBSD-librpcsec_gss-15.2.b1.20261106025213: 100%    13 KiB  13.4 kB/s    00:01    
[121/213] Fetching FreeBSD-libucl-dev-15.2.b1.20261106025213: 100%   240 KiB 245.4 kB/s    00:01    
[122/213] Fetching FreeBSD-rescue-15.2.b1.20261106025213: 100%  6789 KiB   7.0 MB/s    00:01    
[123/213] Fetching FreeBSD-libevent1-dev-15.2.b1.20261106025213: 100%    66 KiB  67.1 kB/s    00:01    
[124/213] Fetching FreeBSD-libucl-15.2.b1.20261106025213: 100%    59 KiB  60.8 kB/s    00:01    
[125/213] Fetching FreeBSD-telnet-15.2.b1.20261106025213: 100%    67 KiB  68.5 kB/s    00:01    
[126/213] Fetching FreeBSD-libvgl-15.2.b1.20261106025213: 100%    19 KiB  20.0 kB/s    00:01    
[127/213] Fetching FreeBSD-zfs-15.2.b1.20261106025213: 100%   621 KiB 635.7 kB/s    00:01    
[128/213] Fetching FreeBSD-bluetooth-lib-15.2.b1.20261106025213: 100%    15 KiB  15.6 kB/s    00:01    
[129/213] Fetching FreeBSD-libcuse-15.2.b1.20261106025213: 100%    6201 B   6.2 kB/s    00:01    
[130/213] Fetching FreeBSD-kyua-15.2.b1.20261106025213: 100%   515 KiB 527.1 kB/s    00:01    
[131/213] Fetching FreeBSD-geom-15.2.b1.20261106025213: 100%   152 KiB 155.7 kB/s    00:01    
[132/213] Fetching FreeBSD-bzip2-15.2.b1.20261106025213: 100%    25 KiB  25.1 kB/s    00:01    
[133/213] Fetching FreeBSD-kerberos-kdc-15.2.b1.20261106025213: 100%   369 KiB 377.7 kB/s    00:01    
[134/213] Fetching FreeBSD-libyaml-dev-15.2.b1.20261106025213: 100%   162 KiB 165.9 kB/s    00:01    
[135/213] Fetching FreeBSD-quotacheck-15.2.b1.20261106025213: 100%    13 KiB  13.4 kB/s    00:01    
[136/213] Fetching FreeBSD-zfs-dev-15.2.b1.20261106025213: 100%  7888 KiB   4.0 MB/s    00:02    
[137/213] Fetching FreeBSD-libmagic-15.2.b1.20261106025213: 100%   848 KiB 868.6 kB/s    00:01    
[138/213] Fetching FreeBSD-nfs-15.2.b1.20261106025213: 100%   171 KiB 175.3 kB/s    00:01    
[139/213] Fetching FreeBSD-ufs-lib-15.2.b1.20261106025213: 100%    27 KiB  27.5 kB/s    00:01    
[140/213] Fetching FreeBSD-pam-15.2.b1.20261106025213: 100%    93 KiB  95.3 kB/s    00:01    
[141/213] Fetching FreeBSD-fetch-15.2.b1.20261106025213: 100%    48 KiB  49.5 kB/s    00:01    
[142/213] Fetching FreeBSD-ppp-15.2.b1.20261106025213: 100%   260 KiB 266.6 kB/s    00:01    
[143/213] Fetching FreeBSD-ufs-dev-15.2.b1.20261106025213: 100%    87 KiB  89.3 kB/s    00:01    
[144/213] Fetching FreeBSD-xz-dev-15.2.b1.20261106025213: 100%   493 KiB 504.6 kB/s    00:01    
[145/213] Fetching FreeBSD-rdma-15.2.b1.20261106025213: 100%    61 KiB  62.7 kB/s    00:01    
[146/213] Fetching FreeBSD-rc-15.2.b1.20261106025213: 100%   147 KiB 150.6 kB/s    00:01    
[147/213] Fetching FreeBSD-dma-15.2.b1.20261106025213: 100%    36 KiB  36.6 kB/s    00:01    
[148/213] Fetching FreeBSD-local-unbound-dev-15.2.b1.20261106025213: 100%  2191 KiB   2.2 MB/s    00:01    
[149/213] Fetching FreeBSD-runtime-dev-15.2.b1.20261106025213: 100%  2689 KiB   2.8 MB/s    00:01    
[150/213] Fetching FreeBSD-lp-15.2.b1.20261106025213: 100%   125 KiB 127.6 kB/s    00:01    
[151/213] Fetching FreeBSD-libcompiler_rt-dev-15.2.b1.20261106025213: 100%   233 KiB 238.9 kB/s    00:01    
[152/213] Fetching FreeBSD-kernel-man-15.2.b1.20261106025213: 100%  2859 KiB   2.9 MB/s    00:01    
[153/213] Fetching FreeBSD-bluetooth-dev-15.2.b1.20261106025213: 100%    65 KiB  66.2 kB/s    00:01    
[154/213] Fetching FreeBSD-zstd-15.2.b1.20261106025213: 100%    81 KiB  83.4 kB/s    00:01    
[155/213] Fetching FreeBSD-ctl-15.2.b1.20261106025213: 100%   178 KiB 182.6 kB/s    00:01    
[156/213] Fetching FreeBSD-clang-15.2.b1.20261106025213: 100%    35 MiB   4.6 MB/s    00:08    
[157/213] Fetching FreeBSD-kerberos-15.2.b1.20261106025213: 100%   184 KiB 188.0 kB/s    00:01    
[158/213] Fetching FreeBSD-cron-15.2.b1.20261106025213: 100%    39 KiB  40.4 kB/s    00:01    
[159/213] Fetching FreeBSD-libdwarf-dev-15.2.b1.20261106025213: 100%   870 KiB 890.7 kB/s    00:01    
[160/213] Fetching FreeBSD-libvmmapi-15.2.b1.20261106025213: 100%    13 KiB  13.2 kB/s    00:01    
[161/213] Fetching FreeBSD-pam-lib-15.2.b1.20261106025213: 100%    21 KiB  21.8 kB/s    00:01    
[162/213] Fetching FreeBSD-bsdinstall-15.2.b1.20261106025213: 100%    84 KiB  85.8 kB/s    00:01    
[163/213] Fetching FreeBSD-jail-15.2.b1.20261106025213: 100%    66 KiB  67.7 kB/s    00:01    
[164/213] Fetching FreeBSD-audit-dev-15.2.b1.20261106025213: 100%   246 KiB 252.1 kB/s    00:01    
[165/213] Fetching FreeBSD-zfs-lib-15.2.b1.20261106025213: 100%  1561 KiB   1.6 MB/s    00:01    
[166/213] Fetching FreeBSD-audit-lib-15.2.b1.20261106025213: 100%    37 KiB  37.6 kB/s    00:01    
[167/213] Fetching FreeBSD-vt-data-15.2.b1.20261106025213: 100%   123 KiB 126.3 kB/s    00:01    
[168/213] Fetching FreeBSD-pf-15.2.b1.20261106025213: 100%   280 KiB 286.8 kB/s    00:01    
[169/213] Fetching FreeBSD-set-base-15.2.b1.20261106025213: 100%     584 B   0.6 kB/s    00:01    
[170/213] Fetching FreeBSD-libcasper-dev-15.2.b1.20261106025213: 100%    33 KiB  33.9 kB/s    00:01    
[171/213] Fetching FreeBSD-pmc-15.2.b1.20261106025213: 100%   779 KiB 797.9 kB/s    00:01    
[172/213] Fetching FreeBSD-zlib-15.2.b1.20261106025213: 100%    50 KiB  51.7 kB/s    00:01    
[173/213] Fetching FreeBSD-pkg-bootstrap-15.2.b1.20261106025213: 100%   152 KiB 156.1 kB/s    00:01    
[174/213] Fetching FreeBSD-syscons-data-15.2.b1.20261106025213: 100%    91 KiB  93.1 kB/s    00:01    
[175/213] Fetching FreeBSD-local-unbound-15.2.b1.20261106025213: 100%   692 KiB 708.4 kB/s    00:01    
[176/213] Fetching FreeBSD-yp-15.2.b1.20261106025213: 100%   152 KiB 156.1 kB/s    00:01    
[177/213] Fetching FreeBSD-sendmail-15.2.b1.20261106025213: 100%   545 KiB 557.8 kB/s    00:01    
[178/213] Fetching FreeBSD-ctf-lib-15.2.b1.20261106025213: 100%    29 KiB  29.5 kB/s    00:01    
[179/213] Fetching FreeBSD-ccdconfig-15.2.b1.20261106025213: 100%    9171 B   9.2 kB/s    00:01    
[180/213] Fetching FreeBSD-pam-dev-15.2.b1.20261106025213: 100%   366 KiB 375.1 kB/s    00:01    
[181/213] Fetching FreeBSD-libarchive-dev-15.2.b1.20261106025213: 100%  1677 KiB   1.7 MB/s    00:01    
[182/213] Fetching FreeBSD-libmilter-15.2.b1.20261106025213: 100%    23 KiB  24.0 kB/s    00:01    
[183/213] Fetching FreeBSD-devd-15.2.b1.20261106025213: 100%    43 KiB  43.8 kB/s    00:01    
[184/213] Fetching FreeBSD-kernel-generic-15.2.b1.20261106025213: 100%    46 MiB   3.7 MB/s    00:13    
[185/213] Fetching FreeBSD-set-devel-15.2.b1.20261106025213: 100%    1075 B   1.1 kB/s    00:01    
[186/213] Fetching FreeBSD-periodic-15.2.b1.20261106025213: 100%    24 KiB  24.2 kB/s    00:01    
[187/213] Fetching FreeBSD-xz-15.2.b1.20261106025213: 100%    69 KiB  70.5 kB/s    00:01    
[188/213] Fetching FreeBSD-zlib-dev-15.2.b1.20261106025213: 100%   179 KiB 183.5 kB/s    00:01    
[189/213] Fetching FreeBSD-dhclient-15.2.b1.20261106025213: 100%    70 KiB  71.9 kB/s    00:01    
[190/213] Fetching FreeBSD-syslogd-15.2.b1.20261106025213: 100%    42 KiB  43.4 kB/s    00:01    
[191/213] Fetching FreeBSD-libpathconv-15.2.b1.20261106025213: 100%    2823 B   2.8 kB/s    00:01    
[192/213] Fetching FreeBSD-libbegemot-dev-15.2.b1.20261106025213: 100%    16 KiB  16.4 kB/s    00:01    
[193/213] Fetching FreeBSD-libcasper-15.2.b1.20261106025213: 100%    40 KiB  41.0 kB/s    00:01    
[194/213] Fetching FreeBSD-libevent1-15.2.b1.20261106025213: 100%    18 KiB  18.3 kB/s    00:01    
[195/213] Fetching FreeBSD-console-tools-15.2.b1.20261106025213: 100%   118 KiB 120.6 kB/s    00:01    
[196/213] Fetching FreeBSD-ncurses-15.2.b1.20261106025213: 100%   177 KiB 181.5 kB/s    00:01    
[197/213] Fetching FreeBSD-at-15.2.b1.20261106025213: 100%    21 KiB  21.6 kB/s    00:01    
[198/213] Fetching FreeBSD-clibs-15.2.b1.20261106025213: 100%  1388 KiB   1.4 MB/s    00:01    
[199/213] Fetching FreeBSD-autofs-15.2.b1.20261106025213: 100%    36 KiB  37.1 kB/s    00:01    
[200/213] Fetching FreeBSD-ipfw-15.2.b1.20261106025213: 100%   131 KiB 133.7 kB/s    00:01    
[201/213] Fetching FreeBSD-set-optional-15.2.b1.20261106025213: 100%    1210 B   1.2 kB/s    00:01    
[202/213] Fetching FreeBSD-ggate-15.2.b1.20261106025213: 100%    27 KiB  27.4 kB/s    00:01    
[203/213] Fetching FreeBSD-pmc-dev-15.2.b1.20261106025213: 100%  1124 KiB   1.2 MB/s    00:01    
[204/213] Fetching FreeBSD-kerberos-dev-15.2.b1.20261106025213: 100%  3787 KiB   3.9 MB/s    00:01    
[205/213] Fetching FreeBSD-ssh-dev-15.2.b1.20261106025213: 100%  1615 KiB   1.7 MB/s    00:01    
[206/213] Fetching FreeBSD-smbutils-dev-15.2.b1.20261106025213: 100%    96 KiB  97.9 kB/s    00:01    
[207/213] Fetching FreeBSD-apm-15.2.b1.20261106025213: 100%    7979 B   8.0 kB/s    00:01    
[208/213] Fetching FreeBSD-libpathconv-dev-15.2.b1.20261106025213: 100%    10 KiB  10.1 kB/s    00:01    
[209/213] Fetching FreeBSD-libdwarf-15.2.b1.20261106025213: 100%    70 KiB  71.5 kB/s    00:01    
[210/213] Fetching FreeBSD-libcompat-dev-15.2.b1.20261106025213: 100%    20 KiB  21.0 kB/s    00:01    
[211/213] Fetching FreeBSD-clibs-dev-15.2.b1.20261106025213: 100%    17 MiB   4.5 MB/s    00:04    
[212/213] Fetching FreeBSD-acpi-15.2.b1.20261106025213: 100%   591 KiB 605.0 kB/s    00:01    
[213/213] Fetching FreeBSD-ctf-dev-15.2.b1.20261106025213: 100%   138 KiB 141.0 kB/s    00:01    
Checking integrity... done (0 conflicting)
[  1/213] Upgrading FreeBSD-acct from 15.1 to 15.2.b1.20261106025213...
[  1/213] Extracting FreeBSD-acct-15.2.b1.20261106025213: 100%
[  2/213] Upgrading FreeBSD-acpi from 15.1 to 15.2.b1.20261106025213...
[  2/213] Extracting FreeBSD-acpi-15.2.b1.20261106025213: 100%
[  3/213] Upgrading FreeBSD-apm from 15.1 to 15.2.b1.20261106025213...
[  3/213] Extracting FreeBSD-apm-15.2.b1.20261106025213: 100%
[  4/213] Upgrading FreeBSD-atf from 15.1 to 15.2.b1.20261106025213...
[  4/213] Extracting FreeBSD-atf-15.2.b1.20261106025213: 100%
[  5/213] Upgrading FreeBSD-atf-dev from 15.1 to 15.2.b1.20261106025213...
[  5/213] Extracting FreeBSD-atf-dev-15.2.b1.20261106025213: 100%
[  6/213] Upgrading FreeBSD-atf-lib from 15.1 to 15.2.b1.20261106025213...
[  6/213] Extracting FreeBSD-atf-lib-15.2.b1.20261106025213: 100%
[  7/213] Upgrading FreeBSD-audit from 15.1 to 15.2.b1.20261106025213...
[  7/213] Extracting FreeBSD-audit-15.2.b1.20261106025213: 100%
[  8/213] Upgrading FreeBSD-audit-dev from 15.1 to 15.2.b1.20261106025213...
[  8/213] Extracting FreeBSD-audit-dev-15.2.b1.20261106025213: 100%
[  9/213] Upgrading FreeBSD-audit-lib from 15.1 to 15.2.b1.20261106025213...
[  9/213] Extracting FreeBSD-audit-lib-15.2.b1.20261106025213: 100%
[ 10/213] Upgrading FreeBSD-autofs from 15.1 to 15.2.b1.20261106025213...
[ 10/213] Extracting FreeBSD-autofs-15.2.b1.20261106025213: 100%
[ 11/213] Upgrading FreeBSD-bhyve from 15.1 to 15.2.b1.20261106025213...
[ 11/213] Extracting FreeBSD-bhyve-15.2.b1.20261106025213: 100%
[ 12/213] Upgrading FreeBSD-blocklist from 15.1 to 15.2.b1.20261106025213...
[ 12/213] Extracting FreeBSD-blocklist-15.2.b1.20261106025213: 100%
[ 13/213] Upgrading FreeBSD-blocklist-dev from 15.1 to 15.2.b1.20261106025213...
[ 13/213] Extracting FreeBSD-blocklist-dev-15.2.b1.20261106025213: 100%
[ 14/213] Upgrading FreeBSD-bluetooth-lib from 15.1 to 15.2.b1.20261106025213...
[ 14/213] Extracting FreeBSD-bluetooth-lib-15.2.b1.20261106025213: 100%
[ 15/213] Upgrading FreeBSD-bmake from 15.1 to 15.2.b1.20261106025213...
[ 15/213] Extracting FreeBSD-bmake-15.2.b1.20261106025213: 100%
[ 16/213] Upgrading FreeBSD-bootloader from 15.1 to 15.2.b1.20261106025213...
[ 16/213] Extracting FreeBSD-bootloader-15.2.b1.20261106025213: 100%
[ 17/213] Upgrading FreeBSD-bootloader-dev from 15.1 to 15.2.b1.20261106025213...
[ 17/213] Extracting FreeBSD-bootloader-dev-15.2.b1.20261106025213: 100%
[ 18/213] Upgrading FreeBSD-bsnmp from 15.1 to 15.2.b1.20261106025213...
[ 18/213] Extracting FreeBSD-bsnmp-15.2.b1.20261106025213: 100%
[ 19/213] Upgrading FreeBSD-bsnmp-dev from 15.1 to 15.2.b1.20261106025213...
[ 19/213] Extracting FreeBSD-bsnmp-dev-15.2.b1.20261106025213: 100%
[ 20/213] Upgrading FreeBSD-bzip2 from 15.1 to 15.2.b1.20261106025213...
[ 20/213] Extracting FreeBSD-bzip2-15.2.b1.20261106025213: 100%
[ 21/213] Upgrading FreeBSD-bzip2-dev from 15.1 to 15.2.b1.20261106025213...
[ 21/213] Extracting FreeBSD-bzip2-dev-15.2.b1.20261106025213: 100%
[ 22/213] Upgrading FreeBSD-bzip2-lib from 15.1 to 15.2.b1.20261106025213...
[ 22/213] Extracting FreeBSD-bzip2-lib-15.2.b1.20261106025213: 100%
[ 23/213] Upgrading FreeBSD-ccdconfig from 15.1 to 15.2.b1.20261106025213...
[ 23/213] Extracting FreeBSD-ccdconfig-15.2.b1.20261106025213: 100%
[ 24/213] Upgrading FreeBSD-clibs from 15.1 to 15.2.b1.20261106025213...
[ 24/213] Extracting FreeBSD-clibs-15.2.b1.20261106025213: 100%
[ 25/213] Upgrading FreeBSD-clibs-dev from 15.1 to 15.2.b1.20261106025213...
[ 25/213] Extracting FreeBSD-clibs-dev-15.2.b1.20261106025213: 100%
[ 26/213] Upgrading FreeBSD-console-tools from 15.1 to 15.2.b1.20261106025213...
[ 26/213] Extracting FreeBSD-console-tools-15.2.b1.20261106025213: 100%
[ 27/213] Upgrading FreeBSD-cron from 15.1 to 15.2.b1.20261106025213...
[ 27/213] Extracting FreeBSD-cron-15.2.b1.20261106025213: 100%
[ 28/213] Upgrading FreeBSD-csh from 15.1 to 15.2.b1.20261106025213...
[ 28/213] Extracting FreeBSD-csh-15.2.b1.20261106025213: 100%
[ 29/213] Upgrading FreeBSD-ctf from 15.1 to 15.2.b1.20261106025213...
[ 29/213] Extracting FreeBSD-ctf-15.2.b1.20261106025213: 100%
[ 30/213] Upgrading FreeBSD-ctf-dev from 15.1 to 15.2.b1.20261106025213...
[ 30/213] Extracting FreeBSD-ctf-dev-15.2.b1.20261106025213: 100%
[ 31/213] Upgrading FreeBSD-ctf-lib from 15.1 to 15.2.b1.20261106025213...
[ 31/213] Extracting FreeBSD-ctf-lib-15.2.b1.20261106025213: 100%
[ 32/213] Upgrading FreeBSD-ctl from 15.1 to 15.2.b1.20261106025213...
[ 32/213] Extracting FreeBSD-ctl-15.2.b1.20261106025213: 100%
[ 33/213] Upgrading FreeBSD-cxgbe-tools from 15.1 to 15.2.b1.20261106025213...
[ 33/213] Extracting FreeBSD-cxgbe-tools-15.2.b1.20261106025213: 100%
[ 34/213] Upgrading FreeBSD-devmatch from 15.1 to 15.2.b1.20261106025213...
[ 34/213] Extracting FreeBSD-devmatch-15.2.b1.20261106025213: 100%
[ 35/213] Upgrading FreeBSD-devmatch-dev from 15.1 to 15.2.b1.20261106025213...
[ 35/213] Extracting FreeBSD-devmatch-dev-15.2.b1.20261106025213: 100%
[ 36/213] Upgrading FreeBSD-diff3 from 15.1 to 15.2.b1.20261106025213...
[ 36/213] Extracting FreeBSD-diff3-15.2.b1.20261106025213: 100%
[ 37/213] Upgrading FreeBSD-dma from 15.1 to 15.2.b1.20261106025213...
[ 37/213] Extracting FreeBSD-dma-15.2.b1.20261106025213: 100%
[ 38/213] Upgrading FreeBSD-dtrace from 15.1 to 15.2.b1.20261106025213...
[ 38/213] Extracting FreeBSD-dtrace-15.2.b1.20261106025213: 100%
[ 39/213] Upgrading FreeBSD-dtrace-dev from 15.1 to 15.2.b1.20261106025213...
[ 39/213] Extracting FreeBSD-dtrace-dev-15.2.b1.20261106025213: 100%
[ 40/213] Upgrading FreeBSD-dwatch from 15.1 to 15.2.b1.20261106025213...
[ 40/213] Extracting FreeBSD-dwatch-15.2.b1.20261106025213: 100%
[ 41/213] Upgrading FreeBSD-ee from 15.1 to 15.2.b1.20261106025213...
[ 41/213] Extracting FreeBSD-ee-15.2.b1.20261106025213: 100%
[ 42/213] Upgrading FreeBSD-efi-tools from 15.1 to 15.2.b1.20261106025213...
[ 42/213] Extracting FreeBSD-efi-tools-15.2.b1.20261106025213: 100%
[ 43/213] Upgrading FreeBSD-efi-tools-dev from 15.1 to 15.2.b1.20261106025213...
[ 43/213] Extracting FreeBSD-efi-tools-dev-15.2.b1.20261106025213: 100%
[ 44/213] Upgrading FreeBSD-examples from 15.1 to 15.2.b1.20261106025213...
[ 44/213] Extracting FreeBSD-examples-15.2.b1.20261106025213: 100%
[ 45/213] Upgrading FreeBSD-fd from 15.1 to 15.2.b1.20261106025213...
[ 45/213] Extracting FreeBSD-fd-15.2.b1.20261106025213: 100%
[ 46/213] Upgrading FreeBSD-fetch from 15.1 to 15.2.b1.20261106025213...
[ 46/213] Extracting FreeBSD-fetch-15.2.b1.20261106025213: 100%
[ 47/213] Upgrading FreeBSD-fetch-dev from 15.1 to 15.2.b1.20261106025213...
[ 47/213] Extracting FreeBSD-fetch-dev-15.2.b1.20261106025213: 100%
[ 48/213] Upgrading FreeBSD-firmware-iwm from 15.1 to 15.2.b1.20261106025213...
[ 48/213] Extracting FreeBSD-firmware-iwm-15.2.b1.20261106025213: 100%
[ 49/213] Upgrading FreeBSD-flua from 15.1 to 15.2.b1.20261106025213...
[ 49/213] Extracting FreeBSD-flua-15.2.b1.20261106025213: 100%
[ 50/213] Upgrading FreeBSD-flua-dev from 15.1 to 15.2.b1.20261106025213...
[ 50/213] Extracting FreeBSD-flua-dev-15.2.b1.20261106025213: 100%
[ 51/213] Upgrading FreeBSD-ftp from 15.1 to 15.2.b1.20261106025213...
[ 51/213] Extracting FreeBSD-ftp-15.2.b1.20261106025213: 100%
[ 52/213] Upgrading FreeBSD-fwget from 15.1 to 15.2.b1.20261106025213...
[ 52/213] Extracting FreeBSD-fwget-15.2.b1.20261106025213: 100%
[ 53/213] Upgrading FreeBSD-games from 15.1 to 15.2.b1.20261106025213...
[ 53/213] Extracting FreeBSD-games-15.2.b1.20261106025213: 100%
[ 54/213] Upgrading FreeBSD-geom from 15.1 to 15.2.b1.20261106025213...
[ 54/213] Extracting FreeBSD-geom-15.2.b1.20261106025213: 100%
[ 55/213] Upgrading FreeBSD-ggate from 15.1 to 15.2.b1.20261106025213...
[ 55/213] Extracting FreeBSD-ggate-15.2.b1.20261106025213: 100%
[ 56/213] Upgrading FreeBSD-gssd from 15.1 to 15.2.b1.20261106025213...
[ 56/213] Extracting FreeBSD-gssd-15.2.b1.20261106025213: 100%
[ 57/213] Upgrading FreeBSD-hast from 15.1 to 15.2.b1.20261106025213...
[ 57/213] Extracting FreeBSD-hast-15.2.b1.20261106025213: 100%
[ 58/213] Upgrading FreeBSD-hostapd from 15.1 to 15.2.b1.20261106025213...
[ 58/213] Extracting FreeBSD-hostapd-15.2.b1.20261106025213: 100%
[ 59/213] Upgrading FreeBSD-hyperv-tools from 15.1 to 15.2.b1.20261106025213...
[ 59/213] Extracting FreeBSD-hyperv-tools-15.2.b1.20261106025213: 100%
[ 60/213] Upgrading FreeBSD-inetd from 15.1 to 15.2.b1.20261106025213...
[ 60/213] Extracting FreeBSD-inetd-15.2.b1.20261106025213: 100%
[ 61/213] Upgrading FreeBSD-ipf from 15.1 to 15.2.b1.20261106025213...
[ 61/213] Extracting FreeBSD-ipf-15.2.b1.20261106025213: 100%
[ 62/213] Upgrading FreeBSD-ipfw from 15.1 to 15.2.b1.20261106025213...
[ 62/213] Extracting FreeBSD-ipfw-15.2.b1.20261106025213: 100%
[ 63/213] Upgrading FreeBSD-iscsi from 15.1 to 15.2.b1.20261106025213...
[ 63/213] Extracting FreeBSD-iscsi-15.2.b1.20261106025213: 100%
[ 64/213] Upgrading FreeBSD-jail from 15.1 to 15.2.b1.20261106025213...
[ 64/213] Extracting FreeBSD-jail-15.2.b1.20261106025213: 100%
[ 65/213] Upgrading FreeBSD-kerberos from 15.1 to 15.2.b1.20261106025213...
[ 65/213] Extracting FreeBSD-kerberos-15.2.b1.20261106025213: 100%
[ 66/213] Upgrading FreeBSD-kerberos-dev from 15.1 to 15.2.b1.20261106025213...
[ 66/213] Extracting FreeBSD-kerberos-dev-15.2.b1.20261106025213: 100%
[ 67/213] Upgrading FreeBSD-kerberos-kdc from 15.1 to 15.2.b1.20261106025213...
[ 67/213] Extracting FreeBSD-kerberos-kdc-15.2.b1.20261106025213: 100%
[ 68/213] Upgrading FreeBSD-kerberos-lib from 15.1 to 15.2.b1.20261106025213...
[ 68/213] Extracting FreeBSD-kerberos-lib-15.2.b1.20261106025213: 100%
[ 69/213] Upgrading FreeBSD-kernel-generic from 15.1 to 15.2.b1.20261106025213...
[ 69/213] Extracting FreeBSD-kernel-generic-15.2.b1.20261106025213: 100%
[ 70/213] Upgrading FreeBSD-kernel-man from 15.1 to 15.2.b1.20261106025213...
[ 70/213] Extracting FreeBSD-kernel-man-15.2.b1.20261106025213: 100%
[ 71/213] Upgrading FreeBSD-kyua from 15.1 to 15.2.b1.20261106025213...
[ 71/213] Extracting FreeBSD-kyua-15.2.b1.20261106025213: 100%
[ 72/213] Upgrading FreeBSD-lib9p from 15.1 to 15.2.b1.20261106025213...
[ 72/213] Extracting FreeBSD-lib9p-15.2.b1.20261106025213: 100%
[ 73/213] Upgrading FreeBSD-lib9p-dev from 15.1 to 15.2.b1.20261106025213...
[ 73/213] Extracting FreeBSD-lib9p-dev-15.2.b1.20261106025213: 100%
[ 74/213] Upgrading FreeBSD-libarchive from 15.1 to 15.2.b1.20261106025213...
[ 74/213] Extracting FreeBSD-libarchive-15.2.b1.20261106025213: 100%
[ 75/213] Upgrading FreeBSD-libarchive-dev from 15.1 to 15.2.b1.20261106025213...
[ 75/213] Extracting FreeBSD-libarchive-dev-15.2.b1.20261106025213: 100%
[ 76/213] Upgrading FreeBSD-libbegemot from 15.1 to 15.2.b1.20261106025213...
[ 76/213] Extracting FreeBSD-libbegemot-15.2.b1.20261106025213: 100%
[ 77/213] Upgrading FreeBSD-libbegemot-dev from 15.1 to 15.2.b1.20261106025213...
[ 77/213] Extracting FreeBSD-libbegemot-dev-15.2.b1.20261106025213: 100%
[ 78/213] Upgrading FreeBSD-libblocksruntime from 15.1 to 15.2.b1.20261106025213...
[ 78/213] Extracting FreeBSD-libblocksruntime-15.2.b1.20261106025213: 100%
[ 79/213] Upgrading FreeBSD-libblocksruntime-dev from 15.1 to 15.2.b1.20261106025213...
[ 79/213] Extracting FreeBSD-libblocksruntime-dev-15.2.b1.20261106025213: 100%
[ 80/213] Upgrading FreeBSD-libbsdstat from 15.1 to 15.2.b1.20261106025213...
[ 80/213] Extracting FreeBSD-libbsdstat-15.2.b1.20261106025213: 100%
[ 81/213] Upgrading FreeBSD-libbsdstat-dev from 15.1 to 15.2.b1.20261106025213...
[ 81/213] Extracting FreeBSD-libbsdstat-dev-15.2.b1.20261106025213: 100%
[ 82/213] Upgrading FreeBSD-libcasper from 15.1 to 15.2.b1.20261106025213...
[ 82/213] Extracting FreeBSD-libcasper-15.2.b1.20261106025213: 100%
[ 83/213] Upgrading FreeBSD-libcasper-dev from 15.1 to 15.2.b1.20261106025213...
[ 83/213] Extracting FreeBSD-libcasper-dev-15.2.b1.20261106025213: 100%
[ 84/213] Upgrading FreeBSD-libcompat-dev from 15.1 to 15.2.b1.20261106025213...
[ 84/213] Extracting FreeBSD-libcompat-dev-15.2.b1.20261106025213: 100%
[ 85/213] Upgrading FreeBSD-libcompiler_rt-dev from 15.1 to 15.2.b1.20261106025213...
[ 85/213] Extracting FreeBSD-libcompiler_rt-dev-15.2.b1.20261106025213: 100%
[ 86/213] Upgrading FreeBSD-libcuse from 15.1 to 15.2.b1.20261106025213...
[ 86/213] Extracting FreeBSD-libcuse-15.2.b1.20261106025213: 100%
[ 87/213] Upgrading FreeBSD-libcuse-dev from 15.1 to 15.2.b1.20261106025213...
[ 87/213] Extracting FreeBSD-libcuse-dev-15.2.b1.20261106025213: 100%
[ 88/213] Upgrading FreeBSD-libdwarf from 15.1 to 15.2.b1.20261106025213...
[ 88/213] Extracting FreeBSD-libdwarf-15.2.b1.20261106025213: 100%
[ 89/213] Upgrading FreeBSD-libdwarf-dev from 15.1 to 15.2.b1.20261106025213...
[ 89/213] Extracting FreeBSD-libdwarf-dev-15.2.b1.20261106025213: 100%
[ 90/213] Upgrading FreeBSD-libevent1 from 15.1 to 15.2.b1.20261106025213...
[ 90/213] Extracting FreeBSD-libevent1-15.2.b1.20261106025213: 100%
[ 91/213] Upgrading FreeBSD-libevent1-dev from 15.1 to 15.2.b1.20261106025213...
[ 91/213] Extracting FreeBSD-libevent1-dev-15.2.b1.20261106025213: 100%
[ 92/213] Upgrading FreeBSD-libexecinfo from 15.1 to 15.2.b1.20261106025213...
[ 92/213] Extracting FreeBSD-libexecinfo-15.2.b1.20261106025213: 100%
[ 93/213] Upgrading FreeBSD-libexecinfo-dev from 15.1 to 15.2.b1.20261106025213...
[ 93/213] Extracting FreeBSD-libexecinfo-dev-15.2.b1.20261106025213: 100%
[ 94/213] Upgrading FreeBSD-libipt from 15.1 to 15.2.b1.20261106025213...
[ 94/213] Extracting FreeBSD-libipt-15.2.b1.20261106025213: 100%
[ 95/213] Upgrading FreeBSD-libipt-dev from 15.1 to 15.2.b1.20261106025213...
[ 95/213] Extracting FreeBSD-libipt-dev-15.2.b1.20261106025213: 100%
[ 96/213] Upgrading FreeBSD-libldns from 15.1 to 15.2.b1.20261106025213...
[ 96/213] Extracting FreeBSD-libldns-15.2.b1.20261106025213: 100%
[ 97/213] Upgrading FreeBSD-libldns-dev from 15.1 to 15.2.b1.20261106025213...
[ 97/213] Extracting FreeBSD-libldns-dev-15.2.b1.20261106025213: 100%
[ 98/213] Upgrading FreeBSD-libmagic from 15.1 to 15.2.b1.20261106025213...
[ 98/213] Extracting FreeBSD-libmagic-15.2.b1.20261106025213: 100%
[ 99/213] Upgrading FreeBSD-libmagic-dev from 15.1 to 15.2.b1.20261106025213...
[ 99/213] Extracting FreeBSD-libmagic-dev-15.2.b1.20261106025213: 100%
[100/213] Upgrading FreeBSD-libmilter from 15.1 to 15.2.b1.20261106025213...
[100/213] Extracting FreeBSD-libmilter-15.2.b1.20261106025213: 100%
[101/213] Upgrading FreeBSD-libmilter-dev from 15.1 to 15.2.b1.20261106025213...
[101/213] Extracting FreeBSD-libmilter-dev-15.2.b1.20261106025213: 100%
[102/213] Upgrading FreeBSD-libpathconv from 15.1 to 15.2.b1.20261106025213...
[102/213] Extracting FreeBSD-libpathconv-15.2.b1.20261106025213: 100%
[103/213] Upgrading FreeBSD-libpathconv-dev from 15.1 to 15.2.b1.20261106025213...
[103/213] Extracting FreeBSD-libpathconv-dev-15.2.b1.20261106025213: 100%
[104/213] Upgrading FreeBSD-librpcsec_gss from 15.1 to 15.2.b1.20261106025213...
[104/213] Extracting FreeBSD-librpcsec_gss-15.2.b1.20261106025213: 100%
[105/213] Upgrading FreeBSD-librpcsec_gss-dev from 15.1 to 15.2.b1.20261106025213...
[105/213] Extracting FreeBSD-librpcsec_gss-dev-15.2.b1.20261106025213: 100%
[106/213] Upgrading FreeBSD-librss from 15.1 to 15.2.b1.20261106025213...
[106/213] Extracting FreeBSD-librss-15.2.b1.20261106025213: 100%
[107/213] Upgrading FreeBSD-librss-dev from 15.1 to 15.2.b1.20261106025213...
[107/213] Extracting FreeBSD-librss-dev-15.2.b1.20261106025213: 100%
[108/213] Upgrading FreeBSD-libsqlite3 from 15.1 to 15.2.b1.20261106025213...
[108/213] Extracting FreeBSD-libsqlite3-15.2.b1.20261106025213: 100%
[109/213] Upgrading FreeBSD-libsqlite3-dev from 15.1 to 15.2.b1.20261106025213...
[109/213] Extracting FreeBSD-libsqlite3-dev-15.2.b1.20261106025213: 100%
[110/213] Upgrading FreeBSD-libthread_db from 15.1 to 15.2.b1.20261106025213...
[110/213] Extracting FreeBSD-libthread_db-15.2.b1.20261106025213: 100%
[111/213] Upgrading FreeBSD-libthread_db-dev from 15.1 to 15.2.b1.20261106025213...
[111/213] Extracting FreeBSD-libthread_db-dev-15.2.b1.20261106025213: 100%
[112/213] Upgrading FreeBSD-libucl from 15.1 to 15.2.b1.20261106025213...
[112/213] Extracting FreeBSD-libucl-15.2.b1.20261106025213: 100%
[113/213] Upgrading FreeBSD-libucl-dev from 15.1 to 15.2.b1.20261106025213...
[113/213] Extracting FreeBSD-libucl-dev-15.2.b1.20261106025213: 100%
[114/213] Upgrading FreeBSD-libvgl from 15.1 to 15.2.b1.20261106025213...
[114/213] Extracting FreeBSD-libvgl-15.2.b1.20261106025213: 100%
[115/213] Upgrading FreeBSD-libvgl-dev from 15.1 to 15.2.b1.20261106025213...
[115/213] Extracting FreeBSD-libvgl-dev-15.2.b1.20261106025213: 100%
[116/213] Upgrading FreeBSD-libvmmapi from 15.1 to 15.2.b1.20261106025213...
[116/213] Extracting FreeBSD-libvmmapi-15.2.b1.20261106025213: 100%
[117/213] Upgrading FreeBSD-libvmmapi-dev from 15.1 to 15.2.b1.20261106025213...
[117/213] Extracting FreeBSD-libvmmapi-dev-15.2.b1.20261106025213: 100%
[118/213] Upgrading FreeBSD-libyaml from 15.1 to 15.2.b1.20261106025213...
[118/213] Extracting FreeBSD-libyaml-15.2.b1.20261106025213: 100%
[119/213] Upgrading FreeBSD-libyaml-dev from 15.1 to 15.2.b1.20261106025213...
[119/213] Extracting FreeBSD-libyaml-dev-15.2.b1.20261106025213: 100%
[120/213] Upgrading FreeBSD-lld from 15.1 to 15.2.b1.20261106025213...
[120/213] Extracting FreeBSD-lld-15.2.b1.20261106025213: 100%
[121/213] Upgrading FreeBSD-clang from 15.1 to 15.2.b1.20261106025213...
[121/213] Extracting FreeBSD-clang-15.2.b1.20261106025213: 100%
[122/213] Upgrading FreeBSD-clang-dev from 15.1 to 15.2.b1.20261106025213...
[122/213] Extracting FreeBSD-clang-dev-15.2.b1.20261106025213: 100%
[123/213] Upgrading FreeBSD-lldb from 15.1 to 15.2.b1.20261106025213...
[123/213] Extracting FreeBSD-lldb-15.2.b1.20261106025213: 100%
[124/213] Upgrading FreeBSD-locales from 15.1 to 15.2.b1.20261106025213...
[124/213] Extracting FreeBSD-locales-15.2.b1.20261106025213: 100%
[125/213] Upgrading FreeBSD-lp from 15.1 to 15.2.b1.20261106025213...
[125/213] Extracting FreeBSD-lp-15.2.b1.20261106025213: 100%
[126/213] Upgrading FreeBSD-mandoc from 15.1 to 15.2.b1.20261106025213...
[126/213] Extracting FreeBSD-mandoc-15.2.b1.20261106025213: 100%
[127/213] Upgrading FreeBSD-mlx-tools from 15.1 to 15.2.b1.20261106025213...
[127/213] Extracting FreeBSD-mlx-tools-15.2.b1.20261106025213: 100%
[128/213] Upgrading FreeBSD-mtree from 15.1 to 15.2.b1.20261106025213...
[128/213] Extracting FreeBSD-mtree-15.2.b1.20261106025213: 100%
[129/213] Upgrading FreeBSD-natd from 15.1 to 15.2.b1.20261106025213...
[129/213] Extracting FreeBSD-natd-15.2.b1.20261106025213: 100%
[130/213] Upgrading FreeBSD-natd-dev from 15.1 to 15.2.b1.20261106025213...
[130/213] Extracting FreeBSD-natd-dev-15.2.b1.20261106025213: 100%
[131/213] Upgrading FreeBSD-ncurses from 15.1 to 15.2.b1.20261106025213...
[131/213] Extracting FreeBSD-ncurses-15.2.b1.20261106025213: 100%
[132/213] Upgrading FreeBSD-ncurses-dev from 15.1 to 15.2.b1.20261106025213...
[132/213] Extracting FreeBSD-ncurses-dev-15.2.b1.20261106025213: 100%
[133/213] Upgrading FreeBSD-ncurses-lib from 15.1 to 15.2.b1.20261106025213...
[133/213] Extracting FreeBSD-ncurses-lib-15.2.b1.20261106025213: 100%
[134/213] Upgrading FreeBSD-netmap from 15.1 to 15.2.b1.20261106025213...
[134/213] Extracting FreeBSD-netmap-15.2.b1.20261106025213: 100%
[135/213] Upgrading FreeBSD-netmap-dev from 15.1 to 15.2.b1.20261106025213...
[135/213] Extracting FreeBSD-netmap-dev-15.2.b1.20261106025213: 100%
[136/213] Upgrading FreeBSD-newsyslog from 15.1 to 15.2.b1.20261106025213...
[136/213] Extracting FreeBSD-newsyslog-15.2.b1.20261106025213: 100%
[137/213] Upgrading FreeBSD-nfs from 15.1 to 15.2.b1.20261106025213...
[137/213] Extracting FreeBSD-nfs-15.2.b1.20261106025213: 100%
[138/213] Upgrading FreeBSD-ntp from 15.1 to 15.2.b1.20261106025213...
[138/213] Extracting FreeBSD-ntp-15.2.b1.20261106025213: 100%
[139/213] Upgrading FreeBSD-nuageinit from 15.1 to 15.2.b1.20261106025213...
[139/213] Extracting FreeBSD-nuageinit-15.2.b1.20261106025213: 100%
[140/213] Upgrading FreeBSD-nvme-tools from 15.1 to 15.2.b1.20261106025213...
[140/213] Extracting FreeBSD-nvme-tools-15.2.b1.20261106025213: 100%
[141/213] Upgrading FreeBSD-openssl from 15.1 to 15.2.b1.20261106025213...
[141/213] Extracting FreeBSD-openssl-15.2.b1.20261106025213: 100%
[142/213] Upgrading FreeBSD-certctl from 15.1 to 15.2.b1.20261106025213...
[142/213] Extracting FreeBSD-certctl-15.2.b1.20261106025213: 100%
[143/213] Upgrading FreeBSD-caroot from 15.1 to 15.2.b1.20261106025213...
[143/213] Extracting FreeBSD-caroot-15.2.b1.20261106025213: 100%
[144/213] Upgrading FreeBSD-openssl-dev from 15.1 to 15.2.b1.20261106025213...
[144/213] Extracting FreeBSD-openssl-dev-15.2.b1.20261106025213: 100%
[145/213] Upgrading FreeBSD-openssl-lib from 15.1 to 15.2.b1.20261106025213...
[145/213] Extracting FreeBSD-openssl-lib-15.2.b1.20261106025213: 100%
[146/213] Upgrading FreeBSD-pam from 15.1 to 15.2.b1.20261106025213...
[146/213] Extracting FreeBSD-pam-15.2.b1.20261106025213: 100%
[147/213] Upgrading FreeBSD-pam-dev from 15.1 to 15.2.b1.20261106025213...
[147/213] Extracting FreeBSD-pam-dev-15.2.b1.20261106025213: 100%
[148/213] Upgrading FreeBSD-pam-lib from 15.1 to 15.2.b1.20261106025213...
[148/213] Extracting FreeBSD-pam-lib-15.2.b1.20261106025213: 100%
[149/213] Upgrading FreeBSD-pf from 15.1 to 15.2.b1.20261106025213...
[149/213] Extracting FreeBSD-pf-15.2.b1.20261106025213: 100%
[150/213] Upgrading FreeBSD-pf-dev from 15.1 to 15.2.b1.20261106025213...
[150/213] Extracting FreeBSD-pf-dev-15.2.b1.20261106025213: 100%
[151/213] Upgrading FreeBSD-pkg-bootstrap from 15.1 to 15.2.b1.20261106025213...
[151/213] Extracting FreeBSD-pkg-bootstrap-15.2.b1.20261106025213: 100%
[152/213] Upgrading FreeBSD-pmc from 15.1 to 15.2.b1.20261106025213...
[152/213] Extracting FreeBSD-pmc-15.2.b1.20261106025213: 100%
[153/213] Upgrading FreeBSD-pmc-dev from 15.1 to 15.2.b1.20261106025213...
[153/213] Extracting FreeBSD-pmc-dev-15.2.b1.20261106025213: 100%
[154/213] Upgrading FreeBSD-powerd from 15.1 to 15.2.b1.20261106025213...
[154/213] Extracting FreeBSD-powerd-15.2.b1.20261106025213: 100%
[155/213] Upgrading FreeBSD-ppp from 15.1 to 15.2.b1.20261106025213...
[155/213] Extracting FreeBSD-ppp-15.2.b1.20261106025213: 100%
[156/213] Upgrading FreeBSD-bluetooth from 15.1 to 15.2.b1.20261106025213...
[156/213] Extracting FreeBSD-bluetooth-15.2.b1.20261106025213: 100%
[157/213] Upgrading FreeBSD-bluetooth-dev from 15.1 to 15.2.b1.20261106025213...
[157/213] Extracting FreeBSD-bluetooth-dev-15.2.b1.20261106025213: 100%
[158/213] Upgrading FreeBSD-quotacheck from 15.1 to 15.2.b1.20261106025213...
[158/213] Extracting FreeBSD-quotacheck-15.2.b1.20261106025213: 100%
[159/213] Upgrading FreeBSD-rdma from 15.1 to 15.2.b1.20261106025213...
[159/213] Extracting FreeBSD-rdma-15.2.b1.20261106025213: 100%
[160/213] Upgrading FreeBSD-rescue from 15.1 to 15.2.b1.20261106025213...
[160/213] Extracting FreeBSD-rescue-15.2.b1.20261106025213: 100%
[161/213] Upgrading FreeBSD-resolvconf from 15.1 to 15.2.b1.20261106025213...
[161/213] Extracting FreeBSD-resolvconf-15.2.b1.20261106025213: 100%
[162/213] Upgrading FreeBSD-dhclient from 15.1 to 15.2.b1.20261106025213...
[162/213] Extracting FreeBSD-dhclient-15.2.b1.20261106025213: 100%
[163/213] Upgrading FreeBSD-local-unbound from 15.1 to 15.2.b1.20261106025213...
[163/213] Extracting FreeBSD-local-unbound-15.2.b1.20261106025213: 100%
[164/213] Upgrading FreeBSD-local-unbound-dev from 15.1 to 15.2.b1.20261106025213...
[164/213] Extracting FreeBSD-local-unbound-dev-15.2.b1.20261106025213: 100%
[165/213] Upgrading FreeBSD-rip from 15.1 to 15.2.b1.20261106025213...
[165/213] Extracting FreeBSD-rip-15.2.b1.20261106025213: 100%
[166/213] Upgrading FreeBSD-runtime from 15.1 to 15.2.b1.20261106025213...
[166/213] Extracting FreeBSD-runtime-15.2.b1.20261106025213: 100%
[167/213] Upgrading FreeBSD-at from 15.1 to 15.2.b1.20261106025213...
[167/213] Extracting FreeBSD-at-15.2.b1.20261106025213: 100%
[168/213] Upgrading FreeBSD-bsdconfig from 15.1 to 15.2.b1.20261106025213...
[168/213] Extracting FreeBSD-bsdconfig-15.2.b1.20261106025213: 100%
[169/213] Upgrading FreeBSD-bsdinstall from 15.1 to 15.2.b1.20261106025213...
[169/213] Extracting FreeBSD-bsdinstall-15.2.b1.20261106025213: 100%
[170/213] Upgrading FreeBSD-devd from 15.1 to 15.2.b1.20261106025213...
[170/213] Extracting FreeBSD-devd-15.2.b1.20261106025213: 100%
[171/213] Upgrading FreeBSD-periodic from 15.1 to 15.2.b1.20261106025213...
[171/213] Extracting FreeBSD-periodic-15.2.b1.20261106025213: 100%
[172/213] Upgrading FreeBSD-rc from 15.1 to 15.2.b1.20261106025213...
[172/213] Extracting FreeBSD-rc-15.2.b1.20261106025213: 100%
[173/213] Upgrading FreeBSD-runtime-dev from 15.1 to 15.2.b1.20261106025213...
[173/213] Extracting FreeBSD-runtime-dev-15.2.b1.20261106025213: 100%
[174/213] Upgrading FreeBSD-sendmail from 15.1 to 15.2.b1.20261106025213...
[174/213] Extracting FreeBSD-sendmail-15.2.b1.20261106025213: 100%
[175/213] Upgrading FreeBSD-smbutils from 15.1 to 15.2.b1.20261106025213...
[175/213] Extracting FreeBSD-smbutils-15.2.b1.20261106025213: 100%
[176/213] Upgrading FreeBSD-smbutils-dev from 15.1 to 15.2.b1.20261106025213...
[176/213] Extracting FreeBSD-smbutils-dev-15.2.b1.20261106025213: 100%
[177/213] Upgrading FreeBSD-sound from 15.1 to 15.2.b1.20261106025213...
[177/213] Extracting FreeBSD-sound-15.2.b1.20261106025213: 100%
[178/213] Upgrading FreeBSD-sound-dev from 15.1 to 15.2.b1.20261106025213...
[178/213] Extracting FreeBSD-sound-dev-15.2.b1.20261106025213: 100%
[179/213] Upgrading FreeBSD-ssh from 15.1 to 15.2.b1.20261106025213...
[179/213] Extracting FreeBSD-ssh-15.2.b1.20261106025213: 100%
[180/213] Upgrading FreeBSD-ssh-dev from 15.1 to 15.2.b1.20261106025213...
[180/213] Extracting FreeBSD-ssh-dev-15.2.b1.20261106025213: 100%
[181/213] Upgrading FreeBSD-syscons-data from 15.1 to 15.2.b1.20261106025213...
[181/213] Extracting FreeBSD-syscons-data-15.2.b1.20261106025213: 100%
[182/213] Upgrading FreeBSD-syslogd from 15.1 to 15.2.b1.20261106025213...
[182/213] Extracting FreeBSD-syslogd-15.2.b1.20261106025213: 100%
[183/213] Upgrading FreeBSD-tcpd from 15.1 to 15.2.b1.20261106025213...
[183/213] Extracting FreeBSD-tcpd-15.2.b1.20261106025213: 100%
[184/213] Upgrading FreeBSD-tcpd-dev from 15.1 to 15.2.b1.20261106025213...
[184/213] Extracting FreeBSD-tcpd-dev-15.2.b1.20261106025213: 100%
[185/213] Upgrading FreeBSD-telnet from 15.1 to 15.2.b1.20261106025213...
[185/213] Extracting FreeBSD-telnet-15.2.b1.20261106025213: 100%
[186/213] Upgrading FreeBSD-toolchain from 15.1 to 15.2.b1.20261106025213...
[186/213] Extracting FreeBSD-toolchain-15.2.b1.20261106025213: 100%
[187/213] Upgrading FreeBSD-toolchain-dev from 15.1 to 15.2.b1.20261106025213...
[187/213] Extracting FreeBSD-toolchain-dev-15.2.b1.20261106025213: 100%
[188/213] Upgrading FreeBSD-ufs from 15.1 to 15.2.b1.20261106025213...
[188/213] Extracting FreeBSD-ufs-15.2.b1.20261106025213: 100%
[189/213] Upgrading FreeBSD-ufs-dev from 15.1 to 15.2.b1.20261106025213...
[189/213] Extracting FreeBSD-ufs-dev-15.2.b1.20261106025213: 100%
[190/213] Upgrading FreeBSD-ufs-lib from 15.1 to 15.2.b1.20261106025213...
[190/213] Extracting FreeBSD-ufs-lib-15.2.b1.20261106025213: 100%
[191/213] Upgrading FreeBSD-utilities from 15.1 to 15.2.b1.20261106025213...
[191/213] Extracting FreeBSD-utilities-15.2.b1.20261106025213: 100%
[192/213] Upgrading FreeBSD-rcmds from 15.1 to 15.2.b1.20261106025213...
[192/213] Extracting FreeBSD-rcmds-15.2.b1.20261106025213: 100%
[193/213] Upgrading FreeBSD-utilities-dev from 15.1 to 15.2.b1.20261106025213...
[193/213] Extracting FreeBSD-utilities-dev-15.2.b1.20261106025213: 100%
[194/213] Upgrading FreeBSD-vi from 15.1 to 15.2.b1.20261106025213...
[194/213] Extracting FreeBSD-vi-15.2.b1.20261106025213: 100%
[195/213] Upgrading FreeBSD-vt-data from 15.1 to 15.2.b1.20261106025213...
[195/213] Extracting FreeBSD-vt-data-15.2.b1.20261106025213: 100%
[196/213] Upgrading FreeBSD-wpa from 15.1 to 15.2.b1.20261106025213...
[196/213] Extracting FreeBSD-wpa-15.2.b1.20261106025213: 100%
[197/213] Upgrading FreeBSD-xz from 15.1 to 15.2.b1.20261106025213...
[197/213] Extracting FreeBSD-xz-15.2.b1.20261106025213: 100%
[198/213] Upgrading FreeBSD-xz-dev from 15.1 to 15.2.b1.20261106025213...
[198/213] Extracting FreeBSD-xz-dev-15.2.b1.20261106025213: 100%
[199/213] Upgrading FreeBSD-xz-lib from 15.1 to 15.2.b1.20261106025213...
[199/213] Extracting FreeBSD-xz-lib-15.2.b1.20261106025213: 100%
[200/213] Upgrading FreeBSD-yp from 15.1 to 15.2.b1.20261106025213...
[200/213] Extracting FreeBSD-yp-15.2.b1.20261106025213: 100%
[201/213] Upgrading FreeBSD-zfs from 15.1 to 15.2.b1.20261106025213...
[201/213] Extracting FreeBSD-zfs-15.2.b1.20261106025213: 100%
[202/213] Upgrading FreeBSD-zfs-dev from 15.1 to 15.2.b1.20261106025213...
[202/213] Extracting FreeBSD-zfs-dev-15.2.b1.20261106025213: 100%
[203/213] Upgrading FreeBSD-zfs-lib from 15.1 to 15.2.b1.20261106025213...
[203/213] Extracting FreeBSD-zfs-lib-15.2.b1.20261106025213: 100%
[204/213] Upgrading FreeBSD-zlib from 15.1 to 15.2.b1.20261106025213...
[204/213] Extracting FreeBSD-zlib-15.2.b1.20261106025213: 100%
[205/213] Upgrading FreeBSD-zlib-dev from 15.1 to 15.2.b1.20261106025213...
[205/213] Extracting FreeBSD-zlib-dev-15.2.b1.20261106025213: 100%
[206/213] Upgrading FreeBSD-zoneinfo from 15.1 to 15.2.b1.20261106025213...
[206/213] Extracting FreeBSD-zoneinfo-15.2.b1.20261106025213: 100%
[207/213] Upgrading FreeBSD-zstd from 15.1 to 15.2.b1.20261106025213...
[207/213] Extracting FreeBSD-zstd-15.2.b1.20261106025213: 100%
[208/213] Upgrading FreeBSD-zstd-dev from 15.1 to 15.2.b1.20261106025213...
[208/213] Extracting FreeBSD-zstd-dev-15.2.b1.20261106025213: 100%
[209/213] Upgrading FreeBSD-set-devel from 15.1 to 15.2.b1.20261106025213...
[210/213] Upgrading FreeBSD-zstd-lib from 15.1 to 15.2.b1.20261106025213...
[210/213] Extracting FreeBSD-zstd-lib-15.2.b1.20261106025213: 100%
[211/213] Upgrading FreeBSD-set-minimal from 15.1 to 15.2.b1.20261106025213...
[212/213] Upgrading FreeBSD-set-optional from 15.1 to 15.2.b1.20261106025213...
[213/213] Upgrading FreeBSD-set-base from 15.1 to 15.2.b1.20261106025213...
==> Running trigger: mandoc.ucl
Generating apropos(1) database for /usr/share/man...
Generating apropos(1) database for /usr/share/openssl/man...
=====
Message from FreeBSD-local-unbound-15.2.b1.20261106025213:

--
After upgrading local-unbound, the configuration file should be regenerated
by running "service local_unbound setup" before restarting the service.
INFO: review pkg(8) info - sometimes 'service <name> setup' is needed
Updating FreeBSD-ports-kmods repository catalogue...
Fetching meta.conf: 100%     168 B   0.2 kB/s    00:01    
Fetching data: 100%    45 KiB  45.8 kB/s    00:01    
Processing entries: 100%
FreeBSD-ports-kmods repository update completed. 290 packages processed.
FreeBSD-ports-kmods is up to date.
Checking for upgrades (0 candidates): 100%
Processing candidates (0 candidates): 100%
Checking integrity... done (0 conflicting)
Your packages are up to date.
INFO: checking for configs installed as '.pkgnew' files ...
INFO: if any files listed above - manually compare them
INFO:   # diff -u /etc/rc.conf /etc/rc.conf.pkgnew
INFO: and merge any necessary manual changes
INFO: you successfully finished the upgrade process
INFO: you may now restart the system with usual command
INFO:   # shutdown -r now

freebsd # uname -a
FreeBSD test 15.1-RELEASE FreeBSD 15.1-RELEASE releng/15.1-n283562-96841ea08dcf GENERIC amd64

freebsd # freebsd-version
15.2-BETA1

freebsd # freebsd-version -kur
15.2-BETA1
15.1-RELEASE
15.2-BETA1

freebsd # shutdown -r now

(after reboot)

freebsd # uname -a
FreeBSD test 15.2-BETA1 FreeBSD 15.2-BETA1 releng/15.2-n286673-8a2424427375 GENERIC amd64

freebsd # freebsd-version
15.2-BETA1

freebsd # freebsd-version -kur
15.2-BETA1
15.2-BETA1
15.2-BETA1

```

Summary
==========

After the reboot You end up with 15.2-BETA1 system as desired.

Nothing more to be added here. I am of course open to Your suggestions and comments.

EOF