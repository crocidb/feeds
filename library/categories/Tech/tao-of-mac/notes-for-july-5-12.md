+++
title = "Notes for July 5-12"
description = "This was a weird week, during which I went back to studiously disconnecting from work as soon as possible because, well, a lot of stuff is going on. My back has also been acting up again (perhaps because of the added stress), and even though the weather "
date = "2026-07-12T12:30:00Z"
url = "https://taoofmac.com/space/notes/2026/07/12/1230?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-07-16T14:37:13.559534828Z"
seen = false
+++

This was a weird week, during which I went back to studiously disconnecting from work as soon as possible because, well, [a lot of stuff is going on](/space/site/disclaimer). My back has also been acting up again (perhaps because of the added stress), and even though the weather has been marginally cooler, meetings still make it impossible to leave the house during the cooler morning hours. To be honest, [all of it](/space/blog/2026/07/08/2130) has been affecting my motivation and well-being.

To compensate, I ended up writing a fair bit more than usual and taking the time to play around with some novelties (like [the new SOTA models](/space/blog/2026/07/11/1500)). But all this additional personal entropy/dispersion overhead also put me behind on my review schedule, and I have been chastising myself for not turning off as many distractions as possible, reminding myself that all it takes is another interesting project for me to become passionate about work again, and generally trying to do better across the board.

But hey, sometimes welcome distractions literally drop out of the sky.

[

New 3D Printer
----------

](/space/notes/2026/07/12/1230#new-3d-printer) <img src="https://taoofmac.com/media/notes/2026/07/12/1230/fNZ7cmXI2f5jCZx4Ca6iuOlVd1s=/flashforge-creator-5-pro.jpg" alt="The Flashforge Creator 5 Pro in my office" width="540" height="720" style="max-width: 100% !important;height: auto !important;"> It's... imposing, for sure.

My new Flashforge Creator 5 Pro arrived this week–if you’ve been paying attention, you’ll know that I have taken my usual long, circuitous (and, let’s face it, miserly) approach to buying a new 3D printer since I started tracking both the [Flashforge AD5X](/space/com/flashforge/ad5x) and the [Snapmaker U1](/space/com/snapmaker/u1) early last year, and it’s finally here.

I will write a dedicated review when I’ve poked at it enough, but the background story is, in short, that:

* I still quite like (and intend to keep using) my [SK1](/space/com/two_trees/sk1) and [KP3S Pro](/space/com/kingroon/kp3s_pro), but have long felt I needed a better printer for technical filaments
* I don’t intend to print multi-colour frippery, but rather to use *multi-material* printing
* I hate the waste from single-nozzle multi-colour systems, so a toolchanger is the only thing that ever made sense to me
* I took a bet on Flashforge’s Kickstarter because, well, I’m not made of money

Even so, this was something I’d been saving up for since *before* I got the [SK1](/space/com/two_trees/sk1) as a review unit, so it wasn’t really a splurge or impulse thing–as a somewhat depressing comparison, I have been putting money aside to upgrade my Mac mini for about as long, aiming for a four-year replacement cycle–but after the recent price hikes, I’m now looking at… eight at this rate?

The only thing I regret is that it arrived while my enthusiasm was at a fairly low ebb, so it will take me a while to make full use of it. But at least [OrcaSlicer](/space/apps/orcaslicer) already supports it fully, and even though Flashforge has decided not to expose the full [Klipper](/space/3d/printing/klipper) UI, I have started building [a native Swift app](https://github.com/rcarmo/swift-flashforgeui?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) (based on an existing Electron app) to monitor it; I essentially tossed [UI.md](https://github.com/praeclarum/UI.md?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and the Electron source code into a blender, and thanks to Codex and GPT-5.6, I had this working in under four hours:

<img src="https://taoofmac.com/media/notes/2026/07/12/1230/QrP_riSvuLz1nnfq8QYatMqS1_4=/flashforgeui-overview.png" alt="FlashForgeUI showing live status, camera, telemetry and material data from the Creator 5 Pro" width="1920" height="1492" style="max-width: 100% !important;height: auto !important;"> This is already live data from the printer. [

3D Reconstructions
----------

](/space/notes/2026/07/12/1230#3d-reconstructions)

Following up on [my photogrammetry trials](/space/notes/2026/06/28/1200) from a couple of weeks ago, I took a look at AI-assisted mesh (re)construction, with pretty interesting results:

<img src="https://taoofmac.com/media/notes/2026/07/12/1230/znytP97eotr4j25UpUCXsm0nevo=/orange-pi-6-plus-reconstruction.png" alt="AI-reconstructed mesh of an Orange Pi 6 Plus in Blender" width="1920" height="1058" style="max-width: 100% !important;height: auto !important;"> This is the Orange Pi 6 Plus, without a heatsink.

The papers I found are, as such things go, already somewhat dated ([the first](https://arxiv.org/abs/2405.14832?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and [its sibling](https://arxiv.org/abs/2501.12202?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) were published in 2024 and 2025). What surprised me was how trivial the process is.

The mesh above was the result of feeding [Hunyuan3D-2 MV](https://github.com/Tencent-Hunyuan/Hunyuan3D-2?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) a couple of semi-random, non-orthogonal shots of an SBC I found through an image search. It clearly got some of the connectors wrong, but is still *much* better than my earlier results.

I stumbled upon this completely by accident while researching 3D mesh generation, and to my delight I was able to get [Direct3D](https://github.com/DreamTechAI/Direct3D?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) (which is, incidentally, an unfortunate and nearly impossible name to search for…) to work on my puny RTX 3060, which then led me to [Direct3D-S2](https://github.com/DreamTechAI/Direct3D-S2?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and [Hunyuan3D-2 MV](https://github.com/Tencent-Hunyuan/Hunyuan3D-2?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link).

The idea of going straight from diffusion to a mesh (and then using marching cubes) is pretty neat, and even though a bazillion people are using this to create game assets, 3D-print miniatures and the like, having a passable, proportionally correct shim for bootstrapping SBC enclosures from just two photos seems worth poking at–even if some of my friends keep pointing out that I’d have them done by now if I just used a pair of callipers.

[

Remote CAD
----------

](/space/notes/2026/07/12/1230#remote-cad)

At the other end of the process, I’ve decided to reinvent the wheel and bootstrap my own Wayland environment, which is going… slowly. I’ve started by upstreaming some of my changes to [IronRDP](https://github.com/Devolutions/IronRDP?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and have a mostly working solution, although I did spend an embarrassingly long amount of time patching `labwc` (which is the compositor I’m vendoring) so that it rendered Platinum-like window decorations:

<img src="https://taoofmac.com/media/notes/2026/07/12/1230/W5dDtCAXncrc_e-HnZAnzIwP5sI=/remote-cad-platinum-desktop.png" alt="A remote Wayland desktop with Platinum-style window decorations running a WebGL aquarium" width="1920" height="1354" style="max-width: 100% !important;height: auto !important;"> GPU-accelerated Platinum-style window decorations, because apparently this is what I do now to relax.

I also had yet another go at getting [Shapr3D](/space/apps/shapr3d) to run under WINE, but it is so dependent on unimplemented Windows APIs that I gave up after a few hours. I may try again later since I would very much like to have a semi-permanent remote CAD setup, but for now I am content to use my iPad to run it.

[

Other Stuff
----------

](/space/notes/2026/07/12/1230#other-stuff)

Besides maintaining [`piclaw`](https://rcarmo.github.io/projects/piclaw/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), I have been [poking at Shelf](/space/apps/shelf) and creating the Flashforge monitoring app I discussed above. Both are native [Swift](/space/dev/swift) apps, a departure from my usual stance of hacking the least possible amount of code to wrap something as a Mac app.

Neither is fully usable yet, but I’ve learned quite a bit in the process, including that using `/goal` in Codex to explore the limited printer API and figure out what else we could do can have hilarious effects when it involves running a Swift app repeatedly over lunchtime:

<img src="https://taoofmac.com/media/notes/2026/07/12/1230/PxohvNhgWLjIKAgVU9UkPsW6DCU=/flashforgeui-local-network-prompts.png" alt="Dozens of overlapping macOS local network permission prompts triggered by FlashForgeUI" width="1920" height="810" style="max-width: 100% !important;height: auto !important;"> In my defense, I was supervising it from my iPad...

Now if you’ll excuse me, I need to get back to testing some of the hardware that has been piling up on my desk, some of which had to be relocated hastily when I swapped out the [SK1](/space/com/two_trees/sk1) for the Creator 5 Pro and needed to find a new place for it…

>
>
> **Update:** Also, a minor home automation note: [my hacky doorbell extender](/space/blog/2019/01/27/2130) finally gave up the ghost after seven years of faithful service because its micro-USB connector got torn off. I replaced it with a [Tuya ZA03](https://www.zigbee2mqtt.io/devices/ZA03.html?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), but I actually miss the buzzer. Either way, this is a chance to move the debouncer logic out of Node-RED, and another lovely inconsequential-but-satisfactory micro-project to have on hand in case of further workplace madness.
>
>