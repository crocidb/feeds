+++
title = "Maple-Preview"
description = '<img class="quicklook" src="/space/links/2026/08/05/0909/large.jpg?v=35d390defe52" alt="quicklook" width="320" height="240"This intrigues me quite a bit, since I’ve been lo'
date = "2026-08-05T09:09:00Z"
url = "https://taoofmac.com/space/links/2026/08/05/0909?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-06T09:52:38.172478405Z"
seen = false
+++

[<img class="quicklook" src="/space/links/2026/08/05/0909/large.jpg?v=35d390defe52" alt="quicklook" width="320" height="240">](https://deepgrove.ai/modelcard/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)

This intrigues me quite a bit, since I’ve been looking into ternary models myself. It isn’t hard (at all) to beat Gemma 4 on quality, or to push tokens quickly through consumer hardware if you accept the quality trade-offs, but there may be a sweet spot at the intersection of quantization, model size and–more importantly–memory bandwidth where local models become genuinely useful without what is now massively expensive prosumer hardware.

As usual, I have quibbles with the benchmarks–Qwen’s MoE models, especially with MTP, are hard to beat at this scale, and Maple’s own table has Qwen3.5 35B-A3B ahead overall. I’m taking the 218 tokens/s and SOTA framing with a large pinch of salt, but this is another useful data point on the number of optimization techniques people are trying.

>
>
> **Update, two days later:** I took a stab at [getting it to run on AVX2](https://github.com/rcarmo/llama-cpp?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and it’s… OK. Nothing special, and clearly I’m hamstrung by the hardware, but it works. If they release bigger weights I’ll be ready.
>
>