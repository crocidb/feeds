+++
title = "The Beelink Mate Pro"
description = "Even though I already have probably too many desks (my main work desk, a standing desk that has probably been improvised for far too long, and an occasional tactical take-over of our dining table), I spend around a third of my working hours on a lap"
date = "2026-08-01T21:30:00Z"
url = "https://taoofmac.com/space/reviews/2026/08/01/2130?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-06T09:52:38.190627075Z"
seen = false
+++

Even though I already have probably too many desks (my main work desk, a [standing desk](/space/blog/2020/07/19/1630) that has probably been improvised for far too long, and an occasional tactical take-over of our dining table), I spend around a third of my working hours on a laptop of some kind.

There are also three more people in the house, so the plight of the semi-nomadic laptop user who needs a quick, unobtrusive way to recharge while working or a temporary makeshift desk has become somewhat of a family thing, which in turn means I’ve been casually looking for a simple, functional, non-eyesore laptop dock for a while.

<img src="/space/reviews/2026/08/01/2130/beelink-hero.jpg?v=a756f70152ab" alt="The Mate Pro in action, charging my earbuds" width="2048" height="1152"> The Mate Pro in action, charging my earbuds.

That I ended up finding something that can act as a high-speed backup drive, HDMI dock and conference speaker I could take on vacation was, as Bob Ross would put it, just a happy accident.

>
>
> **Disclaimer:** [Beelink](https://www.bee-link.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) sent me a [Mate Pro](https://www.bee-link.com/products/beelink-ex-mate-pro?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) free of charge, and, as usual, this review follows [my review policy](/space/site/review_policy).
>
>

[

In The Box
----------

](/space/reviews/2026/08/01/2130#in-the-box)

Opening the box yielded a nice surprise–a compact carrying case with the [Mate Pro](https://www.bee-link.com/products/beelink-ex-mate-pro?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), power, HDMI and USB-C PD cables neatly stowed, which I was totally not expecting. This makes it great not just for our (very) occasional weekend/countryside jaunts, but also for tidily putting it away when not in use:

<img src="/space/reviews/2026/08/01/2130/beelink-montage.jpg?v=9c1e44476412" alt="The Mate Pro, carrying case, cables and ports" width="2048" height="1924"> A rather tidy package.

The box itself is just… cute and compact (it’s a roughly one-litre cube, measuring 99×99×98.3mm), and unlike most Thunderbolt docks I’ve looked at, it is most definitely not a metallic dark eyesore. If you put away the cables and leave it on a table or desk just plugged into power, *nobody* in the family will object to how it looks, which is certainly a plus for something that is meant to be a desktop “hub”.

[

Hardware
----------

](/space/reviews/2026/08/01/2130#hardware)

The port selection is pretty comprehensive–besides the front USB-C (USB4v2) and USB-A ports, the back has, under its built-in speaker:

* [IEC 60320](https://en.wikipedia.org/wiki/IEC_60320?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) C8 240V connector, which goes into the built-in 140W power supply
* HDMI 2.0 (full-sized) that is exposed to the host via DisplayPort over USB-C
* USB-A
* 2.5GbE Ethernet port (using a Realtek chipset)
* USB-C (USB4v2), rated for 96W PD fast charging

Additionally, the [Mate Pro](https://www.bee-link.com/products/beelink-ex-mate-pro?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) provides Bluetooth 6.0 and a 4-mic array for conference calls. The microphones sit next to a set of touch controls for volume, mute and media playback on the top:

<img src="/space/reviews/2026/08/01/2130/beelink-top.jpg?v=d10c338609d7" alt="The Mate Pro speaker grille and touch controls" width="2048" height="2048">The Mate Pro speaker grille and touch controls

[

### Local USB-C Breakdown ###

](/space/reviews/2026/08/01/2130#local-usb-c-breakdown)

Of course, the first thing I did was try to divine how the internals worked with a Linux machine. The NVMe Thunderbolt connection wasn’t visible since I had no drives installed at the time, but under Linux the dock enumerates as separate USB 2.0 and SuperSpeed branches:

![Mate Pro USB device topology, showing its USB 2.0 and USB 3.x branches](/space/reviews/2026/08/01/2130/mate-pro-usb-topology.svg?v=9be363c95d16)Mate Pro USB device topology, showing its USB 2.0 and USB 3.x branches

Digging a little further gave me a pretty good idea of the components used:

|  Path   | Device ID |              Descriptor               |                                                          Function                                                          |
|---------|-----------|---------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
|  `1-6`  |`1d5c:5801`|    `Fresco Logic, Inc. USB2.0 Hub`    |                                       USB 2.0 side of USB-A/audio/control expansion                                        |
| `1-6.2` |`3654:4a55`|`Jieli Technology USB Composite Device`|Built-in speaker, microphone path and top controls, with stereo playback at 44.1/48/96kHz and mono capture at 16/44.1/48kHz.|
| `1-6.3` |`05e3:0610`|       `GenesysLogic USB2.1 Hub`       |                               Additional USB 2.0 downstream hub path, with power management                                |
| `1-6.4` |`8087:0a02`|     `AZW USB4V2 Docking Station`      |                          USB4/USB-C billboard and vendor control function, using an Intel chipset                          |
|  `2-1`  |`8087:5787`|     `Intel Corporation USB3 HUB`      |                             SuperSpeed/USB3 side of dock expansion, also with power management                             |
| `2-1.4` |`05e3:0625`|       `GenesysLogic USB3.2 Hub`       |                                    Downstream USB3 hub path feeding high-speed devices                                     |
|`2-1.4.1`|`0bda:8156`|   `Realtek USB 10/100/1G/2.5G LAN`    |                                                      2.5GbE RJ45 port                                                      |
[

### Video Output ###

](/space/reviews/2026/08/01/2130#video-output)

The DP-to-HDMI bridge and NVMe switch/bridge hardware wasn’t visible, but after plugging in a monitor Linux saw DRM connector `DP-1`, not `HDMI-A-*`, which confirms this as a DisplayPort over USB-C connection:

```
Intel Alder Lake-N iGPU / i915
└─ USB-C DisplayPort path, DRM connector DP-1
   └─ dock DP-to-HDMI bridge/retimer path, exact chip not exposed over USB
      └─ HDMI sink EDID: PNP(HJW) MACROSILICON, product 0x1836

```

The great thing about this is that the connection is completely transparent, so besides seeing your monitor’s EDIDs you can also see its native advertised HDMI modes–I fooled it with a 4K capture dongle, and got exactly what I expected:

|   Mode class    |                                                         Advertised modes                                                         |
|-----------------|----------------------------------------------------------------------------------------------------------------------------------|
|Current/preferred|                                                         1280×720 @ 60Hz                                                          |
|      1080p      |                                                    1920×1080 @ 50/59.94/60Hz                                                     |
|      1080i      |                                                  1920×1080 interlaced @ 50/60Hz                                                  |
|     4K UHD      |                                         3840×2160 @ 23.976/24/25/29.97/30/50/59.94/60Hz                                          |
|     DCI 4K      |                                         4096×2160 @ 23.976/24/25/29.97/30/50/59.94/60Hz                                          |
|    PC modes     |1600×1200, 1680×1050, 1440×900, 1400×1050, 1366×768, 1360×768, 1280×1024, 1280×960, 1280×800, 1280×768, 1024×768, 800×600, 640×480|

There should be *zero* issues driving a 4K@60Hz display–I ended up testing less demanding ones (more on that later), but everything worked when plugged in to all my machines, including video, audio and networking.

[

### Audio ###

](/space/reviews/2026/08/01/2130#audio)

The very day the [Mate Pro](https://www.bee-link.com/products/beelink-ex-mate-pro?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) arrived I used it to join a Teams call using a Windows on ARM laptop, and… it just worked. It was instantly detected, with very good audio on my end and no complaints on the other side. During a follow-up call with one of my colleagues we fooled around a bit, and we could not distinguish the [Mate Pro](https://www.bee-link.com/products/beelink-ex-mate-pro?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)’s mic array from the laptop’s, and there was zero background noise (Teams does a lot of processing, but it still has issues with open mics, and I suspect the mic array was doing a fair bit of cleanup).

And, as you’d expect, the mute button “just worked” with Teams.

Audio also worked flawlessly with my iPad Pro and my MacBook, as well as (after some fiddling) my Linux laptop, and although we did not spend a lot of time listening to music on it on a short trip, [Bluetooth](/space/networking/bluetooth) worked first try with my iPhone as well. There was enough depth and clarity to the speaker that I would not think twice about using it.

The active cooling fan was barely audible throughout all my testing, only really being noticeable at night.

[

### Storage and Internals ###

](/space/reviews/2026/08/01/2130#storage-and-internals)

After returning with it from a short trip, I decided to explore the internals–to do that, you need to remove four little rubber bungs that hide the bottom screws (which could just as well be easier to reach) and pop off the lid:

<img src="/space/reviews/2026/08/01/2130/beelink-storage.jpg?v=59f3d406f31b" alt="The Mate Pro cooling fan, speaker, SSD slots and power supply" width="2048" height="1365"> The internals are very neatly packed and easy to access.

If you’ve been paying attention to [Beelink](https://www.bee-link.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)’s range of compact NAS devices, the relationship to the [ME mini](https://www.bee-link.com/products/beelink-me-mini-n150?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is pretty obvious–you get a central ventilated column that you slot your NVMe drives against (4×M.2 PCIe 4.0×1 slots, two on each side), with built-in thermal pads and mounting holes for 2280/2260/2242 sizes. It’s compact, neat and tidy. Beelink says each slot can support up to 8TB, which, were it economically feasible these days, would mean you could have 32TB on tap.

I don’t exactly have spare SSDs lying around, but I installed a [Corsair MP600 Micro](https://www.amazon.es/gp/product/B0F5BTQHGM/ref=as_li_tl?_encoding=UTF8&camp=3638&creative=24630&linkCode=ur2&tag=taoofmac-21&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) PCIe 4.0 drive I keep around as a spare (you apparently can’t get these anymore, not without paying almost three times what I paid for it a year ago) and got *very* close to PCIe speeds on my MacBook (read-only, since I didn’t want to destroy the data I had on it), and slightly less on my Windows ARM laptop (which is probably due to its Qualcomm chipset).

I am *very* curious to try this with at least two matching drives, since depending on how the Thunderbolt bridge works, this would make a killer direct-attached storage solution for video editing (technically it is already more than fast enough for 1080p video, the only question is how it would perform for editing sizable 4K video projects–which I don’t do myself).

[

### Mac Specifics ###

](/space/reviews/2026/08/01/2130#mac-specifics)

As you would expect, everything just worked–I am using it as a temporary, rather over-the-top 2.5GbE Ethernet adapter for my Mac Mini even as I type this. I have been using the [Mate Pro](https://www.bee-link.com/products/beelink-ex-mate-pro?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) away from my home office, as we’ll discuss later, and my MacBook had zero issues detecting and using any of the hardware:

Could not read file

```
/space/reviews/2026/08/01/2130/mate-pro-macos.jpg?v=dd0d6edafec7
```

 The Mate Pro as seen by macOS System Information. [

Real Life and Off-Label Uses
----------

](/space/reviews/2026/08/01/2130#real-life-and-off-label-uses)

But in between my initial testing and gathering all the notes for this piece, I decided to give the [Mate Pro](https://www.bee-link.com/products/beelink-ex-mate-pro?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) a real-life test and took it with me on a short trip–besides a power bank (which I also recharged using its USB-C port), it replaced my usual gaggle of power adapters and was the sole source of power for my laptop, phone and earbuds.

That’s not really its intended use, but it worked perfectly. I also paired it with a USB HDMI capture dongle to debug another machine, turning it into part of a compact monitoring rig rather than merely a laptop dock. The tiny dongle fit into the carrying case, making the whole arrangement easier to pack than a pile of separate adapters.

But the real reason I am having trouble holding on to the [Mate Pro](https://www.bee-link.com/products/beelink-ex-mate-pro?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and will have to “return” it to another place in the house is a bit different.

[

Who This Is For
----------

](/space/reviews/2026/08/01/2130#who-this-is-for)

The best example I have is our temporary work-from-home setup, which we pioneered during the pandemic but still gets regularly redeployed. Whenever all the adults end up working from home, we inevitably bring out a folding table with an HDMI monitor and a spare [Logitech Brio](https://www.amazon.es/gp/product/B0F1V3N383/ref=as_li_tl?_encoding=UTF8&camp=3638&creative=24630&linkCode=ur2&tag=taoofmac-21&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) camera for my family to have calls in a quiet part of the house (it’s either that or them taking over my office, which as you might understand is sub-optimal).

But setting things up ordinarily means juggling the laptop’s power brick, a USB hub and a small nest of cables, plus depending on the laptop we might also need to rely on the Brio’s microphone (which is good but not stellar) and the monitor speakers (which are just… bad) for calls.

All of that mess completely goes away with the [Mate Pro](https://www.bee-link.com/products/beelink-ex-mate-pro?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)–the monitor and camera plug into it, the laptop only needs a single USB-C cable for audio, video and power, and when you’re done with your calls (or when the table is put away) it can also be used as a [Bluetooth](/space/networking/bluetooth) speaker, not to mention that it will also charge our phones via the front ports.

This is where the [Mate Pro](https://www.bee-link.com/products/beelink-ex-mate-pro?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) makes the most sense to me: minimalist desks, temporary workspaces and anywhere a laptop setup has to be assembled and cleared away regularly.

But even if you have a laptop-only permanent desk that you just want to keep minimalist and uncluttered, the fact that the [Mate Pro](https://www.bee-link.com/products/beelink-ex-mate-pro?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is also a storage device (and a fast one at that) is just icing on the cake for Mac users–even if you don’t intend to use all the NVMe slots, a single “cheap” 1TB drive will be able to provide speedy Time Machine backups, and with four slots, you can certainly have dedicated drives for work, video editing, project workspaces, etc.

[

Verdict
----------

](/space/reviews/2026/08/01/2130#verdict)

The [Mate Pro](https://www.bee-link.com/products/beelink-ex-mate-pro?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is compact, unobtrusive and easy to leave on a home-office desk. It’s not going to be a replacement for people who want multiple-monitor Thunderbolt docks or huge screens, but it is perfectly good for a home office (especially if, like me, you hate wearing headsets for calls), and is going to become an integral part of our folding table setup.

It will certainly be carted away whenever I’m heading for a place where I need a temporary desk myself, and were it not for the insane storage prices we’re “enjoying” right now, I might also call it a great solution for direct-attached storage (it is certainly a cleverly cooled one).

If I ever manage to get a set of matched SSDs (or, rather, more than *one* spare SSD), I will certainly give that a decent try and update this post.