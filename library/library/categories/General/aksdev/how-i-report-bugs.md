+++
title = "How I report bugs"
description = '''As someone who has been doing test automation for past \~3,5 years (and desperately wanting out towards doing just development), I have done a lot of bug reports.Then I switched to Linux based OS and that amount has doubled. :DI have been asked what are good bug reports. Since I''''
date = "2023-04-16T00:00:00Z"
url = "https://akselmo.dev/posts/how-i-report-bugs/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.090335113Z"
seen = true
+++

As someone who has been doing test automation for past \~3,5 years (and desperately wanting out towards doing just development), I have done a lot of bug reports.

Then I switched to Linux based OS and that amount has doubled. :D

I have been asked what are good bug reports. Since I'm both dev and tester, I'd say I have an alright idea of how to do it. So, here's what I've learned about making good bug reports.

[Find the right place to report](#find-the-right-place-to-report)
==========

Sometimes you may not know where to actually report the bug.

Usually, I follow this route:

1. If it happens with specific software, report it to the specific software.
2. If it happens with hardware around multiple software, report it to the hardware driver repo
3. If still in doubt, ask around in Matrix/IRC channels related to the software/hardware.

Someone will know, usually. So just don't be afraid to ask if you really can't figure out where the report should be made.

[Always follow the template](#always-follow-the-template)
==========

None of the things I say here are good if you do not follow the given bug reporting template. Often, projects have their own bug report template.

I can't emphasize this enough: **Follow it as closely as you can**.

Many bug reports are often not very useful because they just ignore the template. The actually good information gets hidden inside something (usually a rant) and as a developer you are often scouring through *a lot* of bug reports, especially in big projects. There just is not time to read the lengthy rant *and* decipher what the problem actually is.

Give the specifics the template asks, put everything else in "additional information" section in the end of the report.

But if there's no template, these are the ones I'd like to see every bug report to have.

[Summary of the bug](#summary-of-the-bug)
==========

What the bug actually is? What happens wrong? What do you think is wrong? Maybe it's a feature?

Write a short summary what is going on, but give it more detail than "screen no work."

Example:

```

Bug summary:

Screen shuts down during gameplay of CoolGame69. I also can hear the GPU
fans ramping up rapidly before the freeze.

This happens also other CoolGames, that seem to use CoolEngine.

```

**Basically**, give the situation where the bug happened but in very concise manner. You can write more details in "Additional Information" section.

[Steps to reproduce the bug](#steps-to-reproduce-the-bug)
==========

To fix a bug, one must be able to reproduce (also known as "repro") the bug. Developer needs to see what is going on, what goes wrong. Then they can debug with tools or the good ol' `print("bug here")` debugging.

So, write down to the bug report what did you do to cause it. You don't have to write down the whole day from when you got up from the bed, but try to aim around \~5 steps before the bug happened. Also, you should write down if you could make the bug happen again.

Example:

```

1. I updated my PC
2. I restarted PC
3. I launched the game
4. When in level SpookyTown, I punch a skeleton
5. The game shuts down the GPU

I restarted PC and tried playing again, but it crashed again.
But on third time, it did not crash my GPU.

```

This already gives the developer a lot of information. It can be assumed that before the update, punching skeletons in SpookyTown did not shut down the GPU. So the problem is in some update component. However, it does not happen every time, so there's probably some weird timing issue. Or something else.. Creative juices start flowing!

**Basically**, give step-by-step directions how one could make the bug happen *on your PC*. Also if you can, mention how often the bug happens.

[System Information](#system-information)
==========

This is VERY important, and here's couple commands for Linux systems I can give you to get Good Info.

First, try not to use neofetch. It gives info, yes, but it's usually not enough.

`inxi --full` gives you usually everything you need.

**Remember to check the full log for any personally identifiable info!**

You can get even more data by appending `sudo`. So `sudo inxi --full`. But this may show more personally identifiable info.

`inxi` may not be installed in your system by default, so you may have to do that first.

If the problem is about USB device, you can use `lsusb -v`.

But with `inxi` you can get quite far. The developer/template will ask for specific commands to run if needed. So again, check the template if there's some specific info it asks. Often they have the command to run as well.

Example:

```

inxi --full

System:
  Host: fedora Kernel: 6.2.10-200.fc37.x86_64 arch: x86_64 bits: 64
    Desktop: KDE Plasma v: 5.27.4 Distro: Fedora release 37 (Thirty Seven)
Machine:
  Type: Desktop Mobo: ASUSTeK model: ROG STRIX B450-F GAMING II v: Rev 1.xx
    serial: <superuser required> UEFI: American Megatrends v: 4007
    date = 12/08/2020
CPU:
  Info: 6-core model: AMD Ryzen 5 3600 bits: 64 type: MT MCP cache: L2: 3 MiB
  Speed (MHz): avg: 2992 min/max: 2200/4208 cores: 1: 4199 2: 2199 3: 2196
    4: 3927 5: 4199 6: 2022 7: 4200 8: 2095 9: 2150 10: 2646 11: 3874 12: 2200
Graphics:
  Device-1: AMD Navi 23 [Radeon RX 6600/6600 XT/6600M] driver: amdgpu
    v: kernel
  Display: wayland server: X.org v: 1.20.14 with: Xwayland v: 22.1.9
    compositor: kwin_wayland driver: X: loaded: amdgpu
    unloaded: fbdev,modesetting,radeon,vesa dri: radeonsi gpu: amdgpu
    resolution: 1: 1920x1080 2: 1920x1080
  API: OpenGL v: 4.6 Mesa 22.3.7 renderer: AMD Radeon RX 6600 (navi23 LLVM
    15.0.7 DRM 3.49 6.2.10-200.fc37.x86_64)
Audio:
  Device-1: AMD Navi 21/23 HDMI/DP Audio driver: snd_hda_intel
  Device-2: AMD Starship/Matisse HD Audio driver: snd_hda_intel
  Device-3: DSEA A/S EPOS GSA 70 type: USB
    driver: hid-generic,snd-usb-audio,usbhid
  API: ALSA v: k6.2.10-200.fc37.x86_64 status: kernel-api
  Server-1: PipeWire v: 0.3.69 status: active
Network:
  Device-1: Intel I211 Gigabit Network driver: igb
  IF: enp3s0 state: up speed: 1000 Mbps duplex: full mac: secret
Drives:
  Local Storage: total: 2.73 TiB used: 1.52 TiB (55.5%)
  ID-1: /dev/nvme0n1 vendor: Kingston model: SA2000M81000G size: 931.51 GiB
  ID-2: /dev/sda vendor: Samsung model: SSD 860 EVO 2TB size: 1.82 TiB
Partition:
  ID-1: / size: 929.93 GiB used: 360.1 GiB (38.7%) fs: btrfs
    dev: /dev/nvme0n1p3
  ID-2: /boot size: 973.4 MiB used: 545.6 MiB (56.1%) fs: ext4
    dev: /dev/nvme0n1p2
  ID-3: /boot/efi size: 598.8 MiB used: 17.4 MiB (2.9%) fs: vfat
    dev: /dev/nvme0n1p1
  ID-4: /home size: 929.93 GiB used: 360.1 GiB (38.7%) fs: btrfs
    dev: /dev/nvme0n1p3
Swap:
  ID-1: swap-1 type: zram size: 8 GiB used: 34.2 MiB (0.4%) dev: /dev/zram0
Sensors:
  System Temperatures: cpu: 57.0 C mobo: 42.0 C gpu: amdgpu temp: 58.0 C
  Fan Speeds (RPM): cpu: 2008 case-1: 849 case-2: 0 case-3: 0 gpu: amdgpu
    fan: 0
Info:
  Processes: 466 Uptime: 1h 20m Memory: 15.51 GiB used: 5.33 GiB (34.4%)
  Shell: Zsh inxi: 3.3.26

```

Now the developer can look at the versions of your drivers. There may already be a known issue with the game with specific driver.

**Basically**: Make sure that your system information includes version numbers of everything, and all the pertinent data. Follow the template for the commands and system info needed, if it's given. But always add system information.

[Additional information](#additional-information)
==========

If there is any specific information to add, do that in the end of the file.

You can for example mention how knowledgeable about the topic you are, if the bug appeared before with different system, anything that may be relevant.

Example:

```
I don't think I've had this bug before. The CoolGame69 did update recently though,
I can't remember exactly when. My PC has been the same for years.

```

**Basically**: Any info that could be related but does not fit the other sections.

[Logs!](#logs)
==========

Often it can also be useful to include logs with the bug, if possible. In this example I've chosen to share amdgpu logs.

The templates often also have a log command/file to be attached. If there is none and you want to check if your logfiles have anything useful, use this command:

`journalctl --since="10 minutes ago" > bug.log`

You can change the "10 minutes ago" to anything, like "2 hours ago" or similar. Set it to a time before the crash, and scour the bug.log file for anything possibly interesting.

If you can't find anything interesting, you can omit the log and ask the developers if there is any log files you should include.

**Basically**: Check the template if logs are needed, and if not, check `journalctl` or similar command for any possible data related to the bug.

[And the usual end result](#and-the-usual-end-result)
==========

Now that you have filled your bug report well enough, following things can happen:

1. Developer asks for more detailed info if they have something in mind.
2. Developer can't reproduce the bug and asks your help to fix it, often by using the git version of the thing the bug relates to.
3. The bug has already been fixed but you have to wait for update.
4. Some bug report systems can have a bug report duplicate checking. In that case, do not create a duplicate, but append to the existing bug with the above info.

Example end for the above issue :)

```
Hey, dev here. CoolGame69 got new particle effect shaders and it
kept crashing the GPU drivers because x y z a b c.

We've pushed a hotfix to the GPU drivers, so inform your distro about this in
their channels.

```

And yes, you likely have to poke someone handling the distro about this, since all distributions handle the updates in different paces and such. Basically look for contact information or a forum to talk about it. I've found mailing lists and emails tend to be effective, but Matrix/IRC channels work as well.

[A simple template](#a-simple-template)
==========

Here's a simple template from the above information:

```

# Bug summary:

# Reproduction steps:

1.
2.
3.
4.
5.

Bug appearance rate: Every time/Sometimes/Rarely/More detailed answer...

# System info:

Gathered with `inxi --full`

# Additional information:

I've included bug.log as an attachment

```

I hope this will answer some of the questions about reporting bugs.

But anyhow, just be very to-the-point and give any info around the bug you can. Follow any templates, append to other reports if it's already reported and be respectful. :)