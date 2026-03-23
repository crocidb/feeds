+++
title = "Hold on to Your Hardware: BadRAM"
description = '''In this follow up post on the original \_Hold on to Your Hardware\_ write-up we're going to have a look at how to deal with faulty RAM on Linux, which is one of the major causes for system instability, crashes and data corruption on consumer hardware'''
date = "2026-03-20T12:16:29Z"
url = "https://xn--gckvb8fzb.com/hold-on-to-your-hardware-badram/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-03-23T12:35:21.236742026Z"
seen = false
+++

We’re living in unprecedented times, [once](https://en.wikipedia.org/wiki/2008_financial_crisis) [again](https://en.wikipedia.org/wiki/2020_stock_market_crash), in which [holding on to our existing hardware](/hold-on-to-your-hardware/) has become more important than ever before. With prices for solid state drives and especially RAM going through the roof, it can be *at the very least* frustrating to have a [computer](/computer/) malfunction due to faulty memory. In this post, I’d like to show how to check a system’s memory for defects and how to work around those defects to prolong a system’s life without needing to replace the RAM module(s), or worse the whole mainboard, right away.

**Note:** This guide is intended for Linux users, specifically systems with *GRUB* that do not use *secure boot*/*lockdown mode*. If you are a Windows user, look up the `bcdedit` command, specifically its `{badmemory}` subsection. If you’re on a Mac, you will probably have to dig into [tools like this](https://github.com/0nelight/macOs-Disable-RAM-Areas) or make use of the `maxmem` setting.

Verifying system memory
----------

The first thing we need to do is to check whether our RAM is the actual culprit of any system instability we might be experiencing. For that, we can use the open-source program [`Memtest86+`](https://github.com/memtest86plus/memtest86plus). Most Linux distributions either come with it pre-installed, have it as an installable package in their repos, or at the very least offer it on their installation live CD/DVD/USB media. If you start your computer and you see a bootloader entry for `Memtest86+` then you already have it installed. If not, consult the documentation of your specific distro on how to install it. Otherwise you can simply download any live media (e.g. *Ubuntu Desktop*, *Fedora Workstation*, etc.) and boot into `Memtest86+` from there.

As soon as `Memtest86+` launches you should go into its configuration, select all tests and set the output to *BadRAM patterns*. Depending on the amount of RAM in your system the test will take anything between a few hours to multiple days.

`Memtest86+` will use various patterns to test the RAM for errors and will either finish with a green `PASS` message or show a big red `FAIL` and output the relevant *BadRAM patterns* that can be used to blacklist the presumed faulty addresses.

Bear in mind that these test results can be flaky and should be validated by running `Memtest86+` repeatedly over a period of time to see whether issues show up consistently.

Test results
----------

The resulting list of *BadRAM patterns* can be used to blacklist the specific addresses, so that the Linux kernel does not try to access those areas. To do so, it is either possible to utilize the `GRUB_BADRAM` configuration in `/etc/default/grub`, or manually append the `memmap` kernel parameter, e.g. via `GRUB_CMDLINE_LINUX_DEFAULT`.

The advantage of `GRUB_BADRAM` is that you can simply copy-paste the output of `Memtest86+` into the `GRUB_BADRAM=""` setting and be done with it. However, the downside is that GRUB will generate a dedicated `badram` boot attribute from this, which, if faulty (e.g. due to typos or [bugs](https://unix.stackexchange.com/a/780991)) will brick the bootloader and require booting from a recovery medium to fix the issues.

The more manual `memmap` solution requires a bit more work but can be fixed right from within the *GRUB* boot prompt if anything goes wrong, by editing (`e` key) the boot entry. An example `memmap` entry could look as follows:

```
memmap=64K$0x2715d0000

```

Depending on the mask for every specific address you might need to adjust the size of the isolated area from `64K` to a value that fits the specific address.

To calculate the area, we take the mask, e.g. `0xfffffffffffdb8` and XOR it with `0xffffffffffffff` to get `0x00000000000247` or decimal `583`. This is our area of faulty RAM in bytes. We round the value up to the next power of 2, which is `1024`, which translates to the following `memmap`:

```
memmap=4K$0x00000010168001b8

```

Keep in mind that the minimum viable area is `4K`. It also makes sense to blacklist a slightly larger area, as it is likely that surrounding addresses will fail moving forward.

A complete *GRUB* configuration for several `memmap`s could look as follows:

```
GRUB_CMDLINE_LINUX_DEFAULT="memmap=64K\\\$0x2715d0000 memmap=64K\\\$0x27bd90000
memmap=64K\\\$0x27f4d1000 memmap=64K\\\$0x67c911000 memmap=64K\\\$0x67f450000"

```

Due to how `grub-mkconfig` works the `$` character has to be escaped, and the escape character has to be escaped as well. *Don’t even ask.*

The last step that remains is to actually run `grub-mkconfig -o /boot/grub/grub.cfg` to re-generate the `/boot/grub/grub.cfg` file. Make sure to double-check that afterwards to make sure that *GRUB* did not mess it up.

`memtest`
----------

The Linux kernel supports [a long list of parameters](https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html), one of which is `memtest=`. This parameter *“specifies the number of memtest passes to be performed. Each pass selects another test pattern from a given set of patterns. Memtest fills the memory with this pattern, validates memory contents and reserves bad memory regions that are detected.”*

We can append e.g. `memtest=4` to our `GRUB_CMDLINE_LINUX_DEFAULT` to enable this feature. The Linux kernel *memory test* takes around half a minute on my system with 64GB of RAM during boot and will ideally identify any new RAM issues and automatically mark those addresses as unusable.

Runtime insights
----------

For runtime insights into the system memory, it is possible to `cat /proc/meminfo`, `cat /proc/iomem` and `dmesg -T | grep -E '(RAM|mem)'`. You should be able to identify blacklisted regions within the output of these commands.

Disclaimer
----------

This is supposed to act as a **temporary measure** and not a long-term solution. Faulty RAM **will** cause headaches down the road and can lead to irreparable data corruption.