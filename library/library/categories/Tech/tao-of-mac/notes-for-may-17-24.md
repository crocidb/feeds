+++
title = "Notes for May 17-24"
description = "My sinuses are still giving me grief, but this week was much more successful at pretending to be enjoyable, at least. For starters, we watched [Project Hail Mary](https://www.imdb.com/title/t12042730?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_cont"
date = "2026-05-24T14:45:00Z"
url = "https://taoofmac.com/space/notes/2026/05/24/1445?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-05-26T11:29:23.129821233Z"
seen = false
+++

My sinuses are still giving me grief, but this week was much more successful at pretending to be enjoyable, at least. For starters, we watched [Project Hail Mary](https://www.imdb.com/title/t12042730?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), and it was every bit as good as I would expect it to be, which is very rare in movies these days.

[

Meetings Suck More In Summer
----------

](/space/notes/2026/05/24/1445#meetings-suck-more-in-summer)

Insomnia seems to be fading, but as the weather improves, the time windows for leaving the house and enjoying exercise before the heat kicks in have become narrower and are in full-on collision with typical meeting schedules, and that has become a major drag on my optimism since I have to wonder why, as an industry, we haven’t really solved meetings.

The technology is fine–it’s a *culture* problem. Stand-ups, project syncs, account planning, everything requires far too many unproductive meetings that just accrete overhead because a) people don’t really prepare for them and b) people don’t have time to prepare for the meetings that matter *because of all the other meetings*.

And, of course, everyone thinks their meetings are the ones that matter.

[

Couch Time
----------

](/space/notes/2026/05/24/1445#couch-time)

Either way, I’ve finally started having more enjoyment off-work. A good deal of it stems from the fact that I can now use [`piclaw`](https://rcarmo.github.io/projects/piclaw/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) as an interactive notebook across all of my projects and just scribble on a tablet screen (including annotating images and text to feed back into the agent).

<img alt="Using piclaw on the couch" src="https://taoofmac.com/media/notes/2026/05/24/1445/jJif7yE569EnosunkmjVjYjkAU8=/piclaw-ipad.jpg" width="2048" height="1365" style="max-width: 100% !important;height: auto !important;">Using piclaw on the couch

I have already gotten most of the annotation experience to work on my [Nomad](/space/reviews/2025/01/18/2335) as well (and with a local agent to boot), so I’m starting to wonder when OpenAI or Anthropic will pick up on this (neither of them has a decent tablet UX, and they clearly don’t seem to care about that).

In the meantime, I’m looking for an Android tablet that would be *at least* as good as a Samsung one, but without any of their UI junk–the TCL NEXPaper ones seem *very* interesting, but it’s apparently impossible to reach any of their marketing people…

[

Joking Around
----------

](/space/notes/2026/05/24/1445#joking-around)

One of the things I’ve been playing with *a la longue* is [Joker](https://github.com/rcarmo/go-joker?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), my souped-up version of a [Clojure](/space/dev/clojure) runtime for [Go](/space/dev/golang). Well, [go-joker](https://github.com/rcarmo/go-joker?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) now has a proper notebook interface–cells with run states, rich outputs, inline SVG rendering, WASM-backed bitmap demos, and a parallelised Mandelbrot cell that renders fast enough to feel interactive.

This is another step towards the [Mathematica](/space/apps/mathematica)-for-code thing I [wrote about](/space/blog/2026/05/12/0720) a few weeks ago, except it’s running in a Clojure interpreter that I developed in [another notebook-like interface](https://rcarmo.github.io/projects/piclaw/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link):

<img src="https://taoofmac.com/media/notes/2026/05/24/1445/KnpHoNCBsf41MlDJeGFg7erYAnw=/go-joker-notebook.png" alt="go-joker notebook with Mandelbrot rendering" width="1216" height="1480" style="max-width: 100% !important;height: auto !important;"> go-joker notebook with Mandelbrot rendering

The irony of constantly working on notebooks within notebooks is not lost on me, but it does look very good right now.

[

Inference Hardware
----------

](/space/notes/2026/05/24/1445#inference-hardware)

I just got a [SpacemiT K3](https://www.spacemit.com/products/keystone/k3?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) board to test, which is both my [second or third RISC-V device](/space/reviews/2025/05/12/2230) and a refreshing take on the ecosystem, because a) it was *zero* hassle to set up b) came with 32GB of RAM and c) has a promising (if weird) NPU arrangement that I fully intend to exploit, even if (as usual) source code and documentation is a little sparse.

On the GPU side, I’ve been trying to shoehorn a Qwen model with MTP and KV cache optimizations into my 12GB 3060 in parallel (without any real usable solution yet), so alternative hardware is [most welcome](/space/site/donate) even if (at least right now) it poses a completely different set of problems to solve.

[

Emulation Progress
----------

](/space/notes/2026/05/24/1445#emulation-progress)

My long-delayed [Maclock](/space/reviews/2025/11/24/1900) build draws near–after pondering my options I ordered the [mini-macintosh](https://github.com/wr/macintosh-mini?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) PCBs and parts (5 of them, even though I only have 2 Maclocks) and have been poking at the Mac JITed emulators a bit, but I got sidetracked into getting the MMU to work in [previous-jit](https://github.com/rcarmo/previous-jit?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and… I haven’t really paid much attention to any of the other bits.

I *did* try to get [ios-linuxkit](https://github.com/rcarmo/ios-linuxkit?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) to run faster through a variety of strategies, but the truth is that performance work on interpreters is humbling–most ideas that sound good measure worse, and none of it panned out except some iOS fixes–terminal input latency, soft keyboard lag, DNS fallback, and iPhone canvas scaling.

The gap between “works on my iPad Pro” and “works on an iPhone” is always wider than expected, and in this case I am actually considering removing [`ghostty-web`](https://github.com/rcarmo/ghostty-web?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) from the iPhone version given the added overhead.