+++
title = "FreeBSD PKGBASE Minor Upgrades"
description = "The PKGBASE way of things on FreeBSD is still not fully mature (and officially marked as experimental). I tried to cover all PKGBASE things in the Brave New PKGBASE World article but I need to add one another thing. One of the things freebsd-update(8) did was upgrades between min"
date = "2026-05-10T00:23:18Z"
url = "https://vermaden.wordpress.com/2026/05/10/freebsd-pkgbase-minor-upgrades/"
author = "vermaden"
text = ""
lastupdated = "2026-07-07T12:18:11.899449672Z"
seen = true
+++

The PKGBASE way of things on FreeBSD is still not fully mature (and officially marked as experimental). I tried to cover all PKGBASE things in the **[Brave New PKGBASE World](https://vermaden.wordpress.com/2025/10/20/brave-new-pkgbase-world/)** article but I need to add one another thing.

One of the things **freebsd-update(8)** did was upgrades between minor releases – like from 15.0 to 15.1 … but it seems that this part was not covered by PKGBASE team as Colin just notified me.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/05/pkgbase-minor-upgrades-colin.png)

I wrote in the past about upgrading FreeBSD within *ZFS Boot Environments* here:

* [**Upgrade FreeBSD with ZFS Boot Environments**](https://vermaden.wordpress.com/2021/02/23/upgrade-freebsd-with-zfs-boot-environments/)
* [**Other FreeBSD Version in ZFS Boot Environment**](https://vermaden.wordpress.com/2021/10/19/other-freebsd-version-in-zfs-boot-environment/)

… and it will be more or less the same this time.

I was able to upgrade FreeBSD 15.0-RELEASE to FreeBSD 15.1-BETA2 with *ZFS Boot Environments* like that:

```
host # uname -prism
FreeBSD 15.0-RELEASE amd64 amd64 GENERIC

```

Create new ZFS BE and **chroot(8)** into it.

```
host # beadm create NEW

host # beadm mount NEW /tmp/NEW

host # chroot /tmp/NEW

BE # mount -t devfs devfs /dev

```

Create **/usr/local/etc/pkg/repos/FreeBSD.conf** file with following contents.

```
BE # cat /usr/local/etc/pkg/repos/FreeBSD.conf
FreeBSD-base: {
  url: "pkg+https://pkg.FreeBSD.org/${ABI}/base_release_1",
  mirror_type: "srv",
  signature_type: "fingerprints",
  fingerprints: "/usr/share/keys/pkgbase-${VERSION_MAJOR}",
  enabled: yes
}

```

Update pkg(8) databases.

```
BE # pkg update -f

```

Next upgrade **pkg(8)** tool.

```
BE # pkg upgrade -r FreeBSD-ports pkg

```

Then upgrade FreeBSD PKGBASE *Base System* with **pkg(8)** command and **reboot(8)**.

```
BE # pkg upgrade -r FreeBSD-base

BE # exit

host # umount /tmp/NEW/dev

host # beadm list
BE      Active Mountpoint  Space Created
default NR     /          630.2M 2026-03-13 13:29
NEW     -      /tmp/NEW   854.2M 2026-05-09 23:15

host # reboot

```

At **loader(8)** hit **8. Boot Environments** and then hit **2. Active** to see something like this there:

```
  2. Active: zfs:zroot/ROOT/NEW (2 of 2)

```

This is how it looks graphically.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/05/freebsd-loader-8.png)

![](https://vermaden.wordpress.com/wp-content/uploads/2026/05/freebsd-loader-2.png)

Then hit **[ENTER]** key too boot.

After boot process you will see that FreeBSD 15.0-RELEASE got upgraded to FreeBSD 15.1-BETA2 version.

```
host # uname -prism
FreeBSD 15.1-BETA2 amd64 amd64 GENERIC

```

If you are satisfied with the result You may make this *ZFS Boot Environment* as the default – rename it – and upgrade 3rd party **pkg(8)** packages.

```
host # beadm activate NEW
Activated successfully

host # beadm rename NEW 15.1
Renamed successfully

host # pkg upgrade -r FreeBSD-ports -r FreeBSD-ports-kmods
```

One more important thing – sometimes its needed to also upgrade the **BIOS**/**UEFI** boot code – details about doing it are in the **UPDATE 1** for the [Other FreeBSD Version in ZFS Boot Environment](https://vermaden.wordpress.com/2021/10/19/other-freebsd-version-in-zfs-boot-environment#UPDATE1) article.

Hope that helps.

Let me know please if You have better way of minor PKGBASE FreeBSD upgrade.

<a name="UPDATE1"></a>

UPDATE 1 – Alternative Upgrade Way
----------

Instead editing **/usr/local/etc/pkg/repos/FreeBSD.conf** file you may use alternative **pkg(8)** command instead. Also as **pkg(8)** supports **--chroot** option we will also use that to not mount and later unmount the **devfs(5)** filesystem.

```
host # beadm create NEW
Created successfully

host # beadm mount NEW /tmp/NEW

host # pkg --chroot=/tmp/NEW upgrade -r FreeBSD-ports pkg

host # pkg -o ABI=FreeBSD:15:$(uname -p) \
           -o OSVERSION=1501000 \
           --chroot=/tmp/NEW \
           upgrade

host # shutdown -r now

```

Here we also upgraded the kernel modules that are outside *Base System* and later third party packages from *FreeBSD Ports* tree.

Now same as before at the FreeBSD **loader(8)** hit **8. Boot Environments** and then hit **2. Active** to select **NEW** ZFS BE.

… and You still need to remember about updating **BIOS**/**UEFI** boot code as specified in the **UPDATE 1** for the [Other FreeBSD Version in ZFS Boot Environment](https://vermaden.wordpress.com/2021/10/19/other-freebsd-version-in-zfs-boot-environment#UPDATE1) article.

<a name="UPDATE2"></a>

UPDATE 2 – Official Upgrade Method
----------

Right now FreeBSD project officially started to add PKGBASE upgarde instructions along older **freebsd-update(8)** ones to its regular FreeBSD *Mailing Lists* posts. Below I will copy/paste what is available in the most recent [FreeBSD 15.1-RC1 Now Available](https://lists.freebsd.org/archives/freebsd-stable/2026-May/004103.html) annoncement.

### Upgrading with Base System Packages ###

If your system was installed with base system packages, you cannot use **freebsd-update(8)**. Instead, use the following procedure to upgrade to 15.1-RC1.

First, update **pkg(8)** itself to ensure you have the latest version:

```
# pkg upgrade -yr FreeBSD-ports pkg

```

Second, upgrade the base system. Create a temporary repository configuration that points exactly to the 15.1-RC1 package repository:

```
# mkdir /tmp/upgrade-15.1
# echo 'FreeBSD-base: {
    url: "pkg+https://pkg.FreeBSD.org/${ABI}/base_release_1_rc1"
}' > /tmp/upgrade-15.1/upgrade.conf

```

Then upgrade the base system:

```
# pkg -o REPOS_DIR=/etc/pkg,/usr/local/etc/pkg/repos,/tmp/upgrade-15.1 \
      -o IGNORE_OSVERSION=yes upgrade -r FreeBSD-base

```

After the upgrade, review any messages printed by **pkg(8)**. Some base packages may require additional configuration steps (e.g., running ‘**service setup**‘). Follow those instructions as needed.

Third, update any third-party kernel modules (**kmods**) that you may have installed from packages (e.g. **drm-kmod**, **acpi\_call**). Use the same temporary repository configuration:

```
# pkg -o REPOS_DIR=/etc/pkg,/usr/local/etc/pkg/repos,/tmp/upgrade-15.1 \
      upgrade -r FreeBSD-ports-kmods

```

Fourth, update the UEFI boot loader. Back up the existing loader file (if any), then copy the new loader ‘**/boot/loader.efi**‘ to the appropriate location on the EFI System Partition (ESP). Common default destinations:

```
amd64:   cp /boot/loader.efi /boot/efi/efi/boot/BOOTX64.EFI
aarch64: cp /boot/loader.efi /boot/efi/efi/boot/BOOTAA64.EFI
armv7:   cp /boot/loader.efi /boot/efi/efi/boot/BOOTARM.EFI

```

If your system uses a non-standard loader path (e.g., ‘**/efi/freebsd/loader.efi**‘), find the correct destination with ‘**efibootmgr -v**‘ and look for the ‘**File(...)**‘ entry of the active boot option.

Fifth, check for configuration file updates that may have been installed as ‘**.pkgnew**‘ files:

```
# find /etc /usr/local/etc -name '*.pkgnew' -ls

```

If such files exist, manually compare them with the originals (e.g. ‘**diff /etc/rc.conf /etc/rc.conf.pkgnew**‘) and merge any necessary changes.

After verifying the configuration files, remove the temporary repository configuration:

```
# rm -r /tmp/upgrade-15.1

```

Finally, reboot to load the new kernel and userland:

```
# shutdown -r now

```

Later, when 15.1-RELEASE is out, a plain ‘**pkg upgrade**‘ will move you from the BETA to the final RELEASE automatically.

### How to Determine Your Base System Type ###

Run the following command:

```
# pkg which /usr/bin/uname

```

If the output shows a package name starting with ‘**FreeBSD-**‘ (for example ‘**FreeBSD-runtime-15.0**‘), then your base system is managed by pkg (pkgbase). If the output says ‘**/usr/bin/uname was not installed by a package**‘, then your system uses the traditional layout (**freebsd-update(8)**  
 is the appropriate upgrade method).

To check whether you have any third-party kernel modules (**kmods**) installed from packages, run the following command:

```
# pkg which $(kldstat -v | awk -F '[()]' '/\.ko/ {print $2}')

```

Modules located in ‘**/boot/kernel/**‘ (such as ‘**zfs.ko**‘) are part of the base system packages, and belong to a ‘**FreeBSD-kernel-\***‘ package. Modules located in ‘**/boot/modules/**‘ (such as ‘**sysctlinfo.k**‘) are third-party kmods installed from the ports/pkg repository. If the command shows any packages with names that do not start with ‘**FreeBSD-**‘, those are third-party kmods. If no such packages appear, you have no third-party kmods installed.

I assume that when FreeBSD 15.1-RELEASE will be released – even more detailed instructions could be available in the *Release Notes* document.

EOF