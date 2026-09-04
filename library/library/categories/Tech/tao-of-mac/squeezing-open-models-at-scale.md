+++
title = "Squeezing Open Models At Scale"
description = '<img class="quicklook" src="/space/links/2026/08/04/1335/large.jpg?v=447a5d975e82" alt="quicklook" width="320" height="240"This is the kind of infer'
date = "2026-08-04T13:35:00Z"
url = "https://taoofmac.com/space/links/2026/08/04/1335?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-06T09:52:38.176975672Z"
seen = false
+++

[<img class="quicklook" src="/space/links/2026/08/04/1335/large.jpg?v=447a5d975e82" alt="quicklook" width="320" height="240">](https://blog.cloudflare.com/smaller-faster-safer-models?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)

This is the kind of inference optimisation work I have been doing in [`go-pherence`](https://github.com/rcarmo/go-pherence?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and [my personal `llama.cpp` fork](https://github.com/rcarmo/llama-cpp?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), but at Cloudflare scale. I have been trying to squeeze more useful models into the hardware I already own; they are trying to squeeze more requests into a global GPU fleet, and many of the trade-offs are the same.

I expect “mid-tier” open-weight models to become much more popular throughout the rest of the year as optimisations like these make them cheaper to serve, hopefully putting a ceiling on OpenAI and Anthropic pricing and forcing some competition. I would like this to help burst the AI bubble, but OpenAI and Anthropic’s fantasy pricing is hardly the only thing keeping it aloft.