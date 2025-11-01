---
title = "Some VORON 0 mods"
description = "I recently completed my VORON 0 build and I was determined to leave it as-is for a while and to start modding my VORON Trident…So before embarking om my larger Trident modding journey I decided to work on the VORON"
date = "2025-05-04T06:50:38Z"
url = "http://jonashietala.se/blog/2025/05/02/voron_0_mods/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.109345708Z"
seen = true
---

I recently completed [my VORON 0 build](/blog/2025/03/25/lets_build_a_voron_0) and I was determined to leave it as-is for a while and to start modding [my VORON Trident](/series/voron_trident)…

So before embarking om my larger Trident modding journey I decided to work on the VORON 0 just a little bit more.

[HEPA filter](#HEPA-filter)
----------

![](/images/voron_0_mods/zero_back_open_with_filter.jpg)

With the [Nevermore Micro V4](https://github.com/nevermore3d/Nevermore_MicroP) I had active carbon filtering but I also wanted a HEPA filter that would also provide negative air pressure to the printer. I found the [Hepa filter by JNP](https://mods.vorondesign.com/details/tgFNVfEZGqjWbxWIt8ss2A) for the VORON 0.1 and a [mount for the VORON 0.2](https://www.printables.com/model/878785-voron-0-top-back-panel-hepa-filter-by-jnp-mount) that I installed.

For the fans I used two [Noctua NF-A4x10 FLX](https://noctua.at/en/products/fan/nf-a4x10-flx) fans and I spliced them together with the Nevermore filter, allowing the MCU to control all the filter fans together. It might have been better to buy the 5V versions and connect them to the 5V output to have them always on, but by then I had already ordered the other version. Oh well.

[Back meshed panel](#Back-meshed-panel)
----------

![](/images/voron_0_mods/zero_back_meshed.jpg)

The small 5V fan for the Raspberry Pi was super loud and I wanted to replace it with something. Because the Raspberry Pi Zero doesn’t get that hot I removed the fan and replaced the back panel with [a meshed variant](https://www.printables.com/model/1190744-voron-02-back-panel), which I hope should provide enough airflow to keep the electronics cool.

(There are other variants with integrated fans if I realize this wasn’t enough.)

[Modesty mesh](#Modesty-mesh)
----------

![](/images/voron_0_mods/side_mesh.jpg)

The wiring is *super* ugly and I stumbled upon the [modesty mesh](https://mods.vorondesign.com/details/zQkxgPQUJw3HY5IHALTYA) that hides the wires well from the sides. Not at all necessary but they make the printer a little prettier.

[Full size panels](#Full-size-panels)
----------

![](/images/voron_0_mods/zero_with_mods.jpg)

One thing that bothered me with the stock VORON 0.2 was the gaps between the tophat and the side panels and front door. I went looking for a mod with fill-sized panels and found the [ZeroPanels mod](https://github.com/zruncho3d/ZeroPanels).

Instead of magnets the printed parts clips into the extrusions pretty hard while still allowing you to pull them off when you want to. It works really well honestly.

![](/images/voron_0_mods/trident_print_zero_clip.jpg) The clips were slightly difficult to print but manageable.

I was looking at the [BoxZero mod](https://github.com/zruncho3d/BoxZero) for a proper full-sized panels mod but I didn’t want to tear apart the printer and rebuild the belt path so I simply replaced the stock panels with full sized ones. This does leave some air gaps at the back and front of the printer right next to the belt that I simply covered with some tape:

![](/images/voron_0_mods/tape.jpg) Some tape to cover the gaps around the belts.

While the clips are good for panels you don’t remove that often, they’re too much to use for the front door. They have some magnetic clips you can use but I’m honestly perplexed on how to use them for good effect.

The standard VORON 0 handles don’t consider the extra 3mm the foam tape adds, leaving a gap that severely reduces the pulling force of the magnets. Similarly the magnet clips included in ZeroPanels surprisingly have the same issue.

For the door handle I used the stealth handle found in the [Voron 0.2 fullsize ZeroPanel mod](https://www.printables.com/model/583082-voron-02-fullsize-zeropanel-mod-stock-frame-full-p/files) that does take the foam tape into consideration.

![](/images/voron_0_mods/clips.jpg) Three different magnet holders; at the top the Stealth handles holders that come out 3mm, in the middle the 6mm holder, and at the bottom the standard magnet holder.

There’s a [variant of the clips for 6mm magnets](https://github.com/zruncho3d/ZeroPanels/pull/6) in the pull requests that I used by pushing in two 3x2mm magnets and super gluing one 10x3mm magnet on top, so it sticks out the 3mm extra distance the foam tape adds. (Yes, maybe just the 10x3mm magnet would be enough).

For the outside I used the standard [ZeroPanels](https://github.com/zruncho3d/ZeroPanels) holders for 10x3mm magnets, allowing the magnets close really tightly against each other.

![](/images/voron_0_mods/magnets_top.jpg) Extra magnets at the top of the printer to get a proper seal.

The panels I bought were just *slightly* too wide causing the side panels to bend a little and it made it hard to get a close seal for front and side panels. I had to file down the clips on the front door to avoid them from colliding with the side panel clips, and I had to add extra clips and magnets for the panels to close tightly against the foam tape.