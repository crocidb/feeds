+++
title = "Quake Champions on Linux"
description = "I just wanted to write down what I had to do to make Quake Champions more playable on my Kubuntu setup. It had lots of stuttering problems for me, so here's what I did to fix it.Move the game to SSD I had QC on my NVME/M.2 drive at first, but I sea"
date = "2021-08-21T00:00:00Z"
url = "https://akselmo.dev/posts/quake-champion-on-linux/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.146478836Z"
seen = true
+++

I just wanted to write down what I had to do to make Quake Champions more playable on my Kubuntu setup. It had lots of stuttering problems for me, so here's what I did to fix it.

### [Move the game to SSD](#move-the-game-to-ssd) ###

I had QC on my NVME/M.2 drive at first, but I searched the interwebs a bit and found that if NVME drives heat up too much, the games may start stuttering. Considering my NVME drive is right near my GPU, it probably heats a lot during gaming, so I moved the game to my SSD, which is better cooled.

### [Disable Nvidia low latency whatever thing](#disable-nvidia-low-latency-whatever-thing) ###

In QC settings, there's somekind of Nvidia low latency "Reflex" settings. Just disable it. It didn't add any boost to my game, just made it have lots of micro stuttering.

### [Use Proton-GE](#use-proton-ge) ###

I still had some issues with stuttering, especially when things were loading in. It seems that default Steam Proton doesn't load assets asynchronously and causes the main thread to halt. This is really bad when you're trying to frag someone, and someone on other side of the map jumps, letting out a new sound your game hasn't loaded yet... And the game halts.

To fix this, I downloaded [Proton-6.15-GE-2](https://github.com/GloriousEggroll/proton-ge-custom/releases/tag/6.15-GE-2) and installed it, following the [installation directions](https://github.com/GloriousEggroll/proton-ge-custom#installation), then enabled it for the Quake Champions.

Then, the actual fix: You have to add following line to the game **launch options**:

```
DXVK_ASYNC=1 gamemoderun %command%

```

[Thanks d3rh4ns and Ph42oN](https://www.protondb.com/app/611500#TRkg3ijCW)!

This will make sure the assets are loaded asynchronously and not halting the thread whenever new things are loaded in.

That should be it, for me the game now works pretty much like it did on Windows: Mostly smooth but some hitches here and there, but those are because of the game engine isn't really the best, I guess.

Hope this helps someone who has same issue!