+++
title = "Notes for May 10-17"
description = "The weather has gone a tad cloudy again, which provided me some relief from my allergies–but not enough for proper overnight rest, so yet again I arrived at Friday afternoon totally exhausted.Still, the early mornings were pretty decent to get some writing and coding done, and my"
date = "2026-05-17T21:20:00Z"
url = "https://taoofmac.com/space/notes/2026/05/17/2120?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-05-20T09:23:14.762180624Z"
seen = false
+++

The weather has gone a tad cloudy again, which provided me some relief from my allergies–but not enough for proper overnight rest, so yet again I arrived at Friday afternoon totally exhausted.

Still, the early mornings were pretty decent to get some writing and coding done, and my sinuses are indeed marginally better.

Despite having wasted hours of my week trying to [get my homelab back into shape](/space/blog/2026/05/15/1330), I still managed to churn out [`ios-linuxkit`](/space/blog/2026/05/16/1130) and polish the default terminal app a bit (it now has nicer theming, font settings and external folder mounts), and I’ve been instrumenting the emulator to do hot-block statistics and adding a proper profiling layer for deciding on future optimizations.

*And* I have picked up a few apps to test it on. The first is [Terax](https://github.com/crynta/terax-ai?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), a little “AI terminal emulator” written in [Rust](/space/dev/rust) and Tauri, which works pretty well (with a few bugs due to the different ways it uses PTYs):

<img alt="Terax AI terminal running in ios-linuxkit" src="https://taoofmac.com/media/notes/2026/05/17/2120/4UVIgHXnqwdYykZ5gz_CDt_Oq7k=/terax.jpg" width="1280" height="877" style="max-width: 100% !important;height: auto !important;">Terax AI terminal running in ios-linuxkit

Code will be up soon–I want to do a bit more testing and polish both the integration and the UX, since Tauri made a bit of a mess of the iPad layout.

[

Tiny Macs
----------

](/space/notes/2026/05/17/2120#tiny-macs)

I’ve been neglecting my ARM64 [SheepShaver](https://github.com/rcarmo/macemu-jit?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) build, but I did find the time to fiddle with the [Cydintosh](/space/links/2026/04/15/0718) code–I got it to build for the displays I had a few weeks back, but the resistive touchscreens were so awful that I immediately decided to order capacitive (and bigger) ones:

<img alt="Cydintosh on two CYD displays" src="https://taoofmac.com/media/notes/2026/05/17/2120/JyQn4cxGL8lqFx0Y-2JsdQHP7bs=/cyd.jpg" width="1280" height="720" style="max-width: 100% !important;height: auto !important;">Cydintosh on two CYD displays

I’m still playing around with these in [my own fork](https://github.com/rcarmo/cydintosh?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), and will have a bit more to share soon.

[

Piclaw is Going Visual
----------

](/space/notes/2026/05/17/2120#piclaw-is-going-visual)

<img alt="Piclaw visual UI" src="https://taoofmac.com/media/notes/2026/05/17/2120/bEATrTk5c1yxIbVSvQVy92a1rFM=/visual.jpg" width="2048" height="1313" style="max-width: 100% !important;height: auto !important;">Piclaw visual UI

Thanks to a colleague of mine, [`piclaw`](https://rcarmo.github.io/projects/piclaw/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) is getting a new “visual” UI–and yes, I know what it reminds you of. It’s great, and it will be the default for the upcoming desktop builds, which will be a good test of my patience for packaging and testing stuff.

I should probably have spent less time at a computer this weekend, though…