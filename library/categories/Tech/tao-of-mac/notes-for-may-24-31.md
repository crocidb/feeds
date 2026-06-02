+++
title = "Notes for May 24–31"
description = "Today I realised that I could just spend the day doing essentially nothing and that nobody would hold it against me (at least in Western nations), so… I might well do just that, with a few caveats:Wi-Fi FalloutSomething *v"
date = "2026-05-31T10:00:00Z"
url = "https://taoofmac.com/space/notes/2026/05/31/1000?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-06-01T21:30:51.413329694Z"
seen = false
+++

Today I realised that I could just spend the day doing essentially *nothing* and that nobody would hold it against me (at least in Western nations), so… I might well do just that, with a few caveats:

[

Wi-Fi Fallout
----------

](/space/notes/2026/05/31/1000#wi-fi-fallout)

Something *very* weird happened after I published [my notes on last week’s Wi-Fi tweak](/space/blog/2026/05/26/1730) – it made it to [Hacker News](https://news.ycombinator.com/item?id=48282180&utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) (a day or so after I submitted it myself, because, as usual, most of my self-submitted links still appear to be shadow-banned despite 30K+ karma–and no, I don’t understand that either), and it was *very* popular among the usual band of armchair networking experts.

But then something *really* weird happened: I got an alert from Cloudflare that the lowercase-rewrite worker I’d deployed as a fallback for incorrect linking was exceeding the free-tier limit (100,000 runs, if I recall correctly), which made me curious enough to dig into the analytics:

<img src="https://taoofmac.com/media/notes/2026/05/31/1000/5_JzYknAAD1kLrZF11CTcu2WfkQ=/cf-page-views-spike.jpg" alt="Cloudflare page views control chart showing two out-of-control spikes reaching ~70,000 views/hour on 30 May" width="1920" height="951" style="max-width: 100% !important;height: auto !important;"> The control chart doesn't lie. Those orange dots are not normal.

I have CF’s anti-bot crawling settings active, I turned on CAPTCHAs again after the initial peak, and yet… 70,000 views in an hour, *twice*? Has to be crawlers. And how did CF let them through *and* count them?

So I went and plotted [Clarity](https://clarity.microsoft.com?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)’s chart of “human” visitors (always an undercount, since it only captures people without JS or ad-blocking, but useful as a sanity check):

<img src="https://taoofmac.com/media/notes/2026/05/31/1000/x8dlCKogJb9c9LO5G-0DMmtbIvI=/clarity-unique-visitors-spike.jpg" alt="Microsoft Clarity unique visitors chart showing the genuine HN-driven spike to ~8,000 unique visitors on 29 May, with traffic returning to normal shortly after" width="1920" height="952" style="max-width: 100% !important;height: auto !important;"> The real HN spike was Thursday. Everything after is noise.

Definitely bots after the initial HN flood. I have to wonder *why*, *why now*, and whether Cloudflare’s free tier is still even marginally effective at blocking them.

[

go-pherence
----------

](/space/notes/2026/05/31/1000#go-pherence)

The most interesting work this week was grafting speaker diarization onto [`go-pherence`](https://github.com/rcarmo/go-pherence?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link). Whisper tells you *what* was said; knowing *who* said it is a separate problem, and the standard answer is SpeechBrain plus a Python subprocess plus a fairly heavy PyTorch dependency. I did not want any of that. Instead I ported ECAPA-TDNN – the speaker embedding model SpeechBrain uses – to Go, and it all now *mostly* works with zero Python, even if it still needs a lot of tweaking.

There’s a `speakercheck` validation harness that runs spot-checks against windowed audio segments, scores against expected speaker labels, and outputs JSON reports, and a `diarize-vtt` command that accepts an optional ECAPA model and emits speaker-tagged VTT output. I expect to drop this onto one of my current hardware test subjects soon.

[

In Other News
----------

](/space/notes/2026/05/31/1000#in-other-news)

I’ve been tinkering with more new hardware, but some things just take time and I’m still putting together my notes on those.

On the other hand, I am still very much impressed with the [Minibook X](/space/reviews/2025/05/15/2230) running [Niri](/space/til/2026/05/20/2240), and I’m enjoying building little plugins for it as I go:

<img src="https://taoofmac.com/media/notes/2026/05/31/1000/ejZ4_eZn7bcZN1TeNq3ZS2u7l6U=/niri-display-layout-plugin.png" alt="Niri display layout plugin showing the Kuycon P20 external display and built-in DSI screen arranged in a stacked layout" width="642" height="702" style="max-width: 100% !important;height: auto !important;"> A Niri plugin to manage display layout, because of course I wrote one.

I will eventually publish these somewhere…