+++
title = "macintosh-mini"
description = '[<img class="quicklook" src="https://taoofmac.com/thumb/links/2026/05/03/1430/640,480/4-fpoNCFxDVyHKBun-e9_lXJ928=/large.jpg" width="320" height="240" style="max-width: 100% !important;height: auto !important;"](https://github.com/wr/macintosh-mini?utm_source=taoofmac.com&utm_me'
date = "2026-05-03T14:30:00Z"
url = "https://taoofmac.com/space/links/2026/05/03/1430?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-05-05T08:25:09.933842916Z"
seen = true
+++

[<img class="quicklook" src="https://taoofmac.com/thumb/links/2026/05/03/1430/640,480/4-fpoNCFxDVyHKBun-e9_lXJ928=/large.jpg" width="320" height="240" style="max-width: 100% !important;height: auto !important;">](https://github.com/wr/macintosh-mini?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)

Of all the [Maclock](/space/links/2026/02/10/0818) mods I’ve seen since I [wrote up my review](/space/reviews/2025/11/24/1900), this is probably the best all-round solution. It uses a custom PCB to drive a properly fitted display from a Pi Zero 2W running [SheepShaver](/space/emulation), and the result is a clean, self-contained build with none of the cable-routing bodges that plague most of these projects–*and* still uses the battery, which is great.

I’ve been deliberately *not* finishing my own Maclock mod, and this is serendipitous–sometimes waiting yields the exact solution you’d have spent weeks converging on from a worse starting point. The custom PCB is the key bit: it solves the button re-use and display connection in one go, which is the part I kept stalling on.

I’ll be using my own [macemu](https://github.com/rcarmo/macemu-jit?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) build on it, now that the ARM64 JIT work has made SheepShaver fast enough to make even a regular Pi Zero feel snappy…