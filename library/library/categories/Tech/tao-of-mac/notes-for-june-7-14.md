+++
title = "Notes for June 7-14"
description = "Another week, another set of bank holidays that I tried to leverage strategically to do interesting things with my time, and… I ended up throwing out my back and having to sit very still for hours at a time, which made the whole thing feel like a waste of paid vacation with extra"
date = "2026-06-14T18:00:00Z"
url = "https://taoofmac.com/space/notes/2026/06/14/1800?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-06-16T20:08:31.052339892Z"
seen = false
+++

Another week, another set of bank holidays that I tried to leverage strategically to do interesting things with my time, and… I ended up throwing out my back and having to sit very still for hours at a time, which made the whole thing feel like a waste of paid vacation with extra ibuprofen.

The upside, if I can call it that, is that sitting still is reasonably compatible with finishing TV shows, staring at logs, profiling traces and dealing with broken model outputs for hours on end. Which sort of explains my notes for this week…

[

Local Models, Local Pain
----------

](/space/notes/2026/06/14/1800#local-models-local-pain)

I am a bit fed up with [AI](/space/ai). Not in the usual performative sense, but because models are still not that smart, the tooling around them is uneven, and I [still don’t have the hardware to play with it the way I want](/space/blog/2026/05/09/2130). The week was a slow burn of getting [`go-pherence`](https://github.com/rcarmo/go-pherence?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to become more than a bunch of random matmuls, which meant pushing [Ideogram 4](https://ideogram.ai/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) far enough to make cat pictures and then immediately running into the limits of my RTX 3060.

<img src="https://taoofmac.com/media/notes/2026/06/14/1800/kWugYc1R6wdu4bs6OoQhjliv1x8=/ideogram-cat.png" alt="A small generated cat image from Ideogram 4 running locally" width="256" height="256" style="max-width: 100% !important;height: auto !important;"> Of course I used AI to generate a cat picture, this is the Internet!

There is no way I can scale this out to do more than 256x256 low-quality pictures on that card without a lot of pain and slow iteration, and the iteration is the problem. The code can be made to run, but the gap between “this technically emits pixels” and “this is something I can use routinely” is just not worth it. I am very seriously considering [gathering donations](/space/site/donate) to get an NVIDIA GB10 or a Ryzen AI device, which seem like the bare minimum hardware to do barely half-assed local inference.

I also spent an outrageously unproductive amount of “learning” time on shoehorning DiffusionGemma into [`go-pherence`](https://github.com/rcarmo/go-pherence?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), on both the [K3](/space/reviews/2026/06/11/1830) and the RTX 3060 via `mmap` tricks, GPU expert caching, sparse self-conditioning and all the stupid details that decide whether an inference run takes minutes or merely feels like it does. Some of it worked surprisingly well (I got coherent answers), but none of my hardware is good enough for *useful* answers.

Regardless, the more I revisit AI-assisted projects from a few weeks ago, the more time I spend auditing whether the code matches the written `SPEC.md` rather than adding anything new. Code quality has been mostly OK in projects where I have my usual vetting and testing pipeline in place, but the common thread in the ones where I don’t is increasingly obvious: they were Anthropic-heavy. Opus keeps being very fluent about what it claims was implemented and very wrong about what is actually there. Go figure.

[

A Tailscale Rat
----------

](/space/notes/2026/06/14/1800#a-tailscale-rat)

I picked up a temp work laptop early in the week (a Snapdragon X Plus machine), and although it is still early days I was impressed enough with the hardware and battery life to hack together [`womprat`](https://github.com/rcarmo/womprat?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) so I could get at my personal machines from it without installing anything of consequence.

Since this is a loaner and I mostly live inside AVD anyway, the interesting bit was making something small, disposable and ARM-friendly. Me being me, I used [Go](/space/dev/golang), built it on Linux, and glued together a browser, SSH client and remote-display shell on top of [`tsnet`](https://tailscale.com/kb/1244/tsnet?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), WebView2, RDP and VNC bits. It is a pretty great combination, when it works, but I ended up having to wire up a Linux WebKitGTK test shell to have reproducible debugging.

[

More Agents
----------

](/space/notes/2026/06/14/1800#more-agents)

[`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) is still the thing I use to fix other things, so I kept poking at it even if I am a bit tired of the constant upstream churn from [`pi`](https://pi.dev/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and associated paper cuts that come with maintaining a [TypeScript](https://www.typescriptlang.org/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) application of its complexity. [`gi`](https://github.com/rcarmo/gi?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) is now able to bootstrap itself, but not a replacement I can trust (I used Opus 4.8 on it and am still paying that technical debt), so I’ve actually been considering shifting to [Codex](https://openai.com/codex/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) for most things and use [`pi`](https://pi.dev/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) solely through IPC mode, which would mean going back, full circle, to [`vibes`](https://github.com/rcarmo/vibes?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link).

[

Emulation
----------

](/space/notes/2026/06/14/1800#emulation)

After [last week’s foray into the topic](/space/notes/2026/06/07/1930) I tried (and failed) to enjoy some retro gaming this week (even though I did get a bit of a kick of further automating my Steam setup), but to compensate I took another pass at my [NeXT](https://github.com/rcarmo/previous?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and [Mac](https://github.com/rcarmo/macemu?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) JIT emulators, partly because I realised that (you guessed it) Opus *lied* and failed to implement MMU and I/O emulation correctly across the board.

[

Hardware and 3D Printing
----------

](/space/notes/2026/06/14/1800#hardware-and-3d-printing)

I have another Radxa board to test, and this time I decided to have a go at doing photogrammetry to capture enough of the relative dimensions to design a 3D printed case for it–and besides the App Store being crammed with scammy “3D scanner” apps that do very little else despite repackaging [SimpleObjectCapture](https://github.com/littleossa/SuperSimpleObjectCapture?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) (which, incidentally, you can now build for yourself in half an hour using Codex) I also confirmed iOS Object Capture is not really that great for fine detail, at least in the default settings:

<img alt="The yet untested Q8B" src="https://taoofmac.com/media/notes/2026/06/14/1800/taL-cTz-9rmiPmjoE9qBmHVP6E4=/radxa-q8b.png" width="1210" height="926" style="max-width: 100% !important;height: auto !important;">The yet untested Q8B

I suspect I will be getting back to CAD and 3D printing pretty intensely over the next few months (or whenever I can actually move around). My back is still complaining, but at least I have an entire work week of… more sitting to… look forward(?) to, starting tomorrow.