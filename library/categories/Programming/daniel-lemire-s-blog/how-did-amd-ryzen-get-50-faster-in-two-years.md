+++
title = "How did AMD Ryzen get 50% faster in two years?"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-featured-150x150.jpg" class="webfeedsFeaturedVisual wp-post-image" alt="Three desktop processors in a row, from nearest to farthest" style="display: block; margin-bottom: 5px; clear:both;ma'
date = "2026-09-18T17:26:04Z"
url = "https://lemire.me/blog/2026/09/18/how-did-amd-ryzen-get-50-faster-in-two-years/"
author = "Daniel Lemire"
text = ""
lastupdated = "2026-09-21T09:42:46.666645787Z"
seen = false
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-featured-150x150.jpg" class="webfeedsFeaturedVisual wp-post-image" alt="Three desktop processors in a row, from nearest to farthest" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" loading="lazy">

People still tell me that CPUs are boring. That nothing much happens anymore.

Let us look at AMD Ryzen 7 processors from 2022 to 2024: the 5800X3D (Zen 3), the 7800X3D (Zen 4) and the 9800X3D (Zen 5). They are comparable 8-core chips with 3D V-Cache. I have written about them before, in [How stagnant is CPU technology?](https://lemire.me/blog/2026/01/14/how-stagnant-is-cpu-technology/)

On Geekbench 6, performance went up by about 50% in two years.

[<img loading="lazy" decoding="async" src="http://lemire.me/blog/wp-content/uploads/2026/09/ryzen-geekbench6-1024x424.jpg" alt="Geekbench 6 single-core and multi-core scores for Ryzen 7 5800X3D, 7800X3D and 9800X3D" width="660" height="273" class="alignnone size-large wp-image-22891" srcset="https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-geekbench6-1024x424.jpg 1024w, https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-geekbench6-300x124.jpg 300w, https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-geekbench6-768x318.jpg 768w, https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-geekbench6.jpg 1199w" sizes="auto, (max-width: 660px) 100vw, 660px">](http://lemire.me/blog/wp-content/uploads/2026/09/ryzen-geekbench6.jpg)

|           |2022  <br/> 5800X3D  <br/> Zen 3|2023  <br/> 7800X3D  <br/> Zen 4|2024  <br/> 9800X3D  <br/> Zen 5|
|-----------|--------------------------------|--------------------------------|--------------------------------|
|Single-core|             2,016              |             2,426              |             2,969              |
|Multi-core |             11,832             |             15,508             |             18,751             |

The 2024 chip is 47% faster on a single core than the 2022 chip, and 58% faster with all cores.

The clock did not do that. Max boost went from 4.5 GHz to 5.2 GHz, a 15% increase.

[<img loading="lazy" decoding="async" src="http://lemire.me/blog/wp-content/uploads/2026/09/ryzen-frequency-1024x753.jpg" alt="Base and max boost frequencies for Ryzen 7 5800X3D, 7800X3D and 9800X3D" width="660" height="485" class="alignnone size-large wp-image-22892" srcset="https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-frequency-1024x753.jpg 1024w, https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-frequency-300x221.jpg 300w, https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-frequency-768x564.jpg 768w, https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-frequency.jpg 1200w" sizes="auto, (max-width: 660px) 100vw, 660px">](http://lemire.me/blog/wp-content/uploads/2026/09/ryzen-frequency.jpg)

|         |2022  <br/> Zen 3|2023  <br/> Zen 4|2024  <br/> Zen 5|
|---------|-----------------|-----------------|-----------------|
|  Base   |     3.4 GHz     |     4.2 GHz     |     4.7 GHz     |
|Max boost|     4.5 GHz     |     5.0 GHz     |     5.2 GHz     |

The number of transistors is way up, by about 50%, from roughly 11 billion to 16 billion. Most of the extra transistors went into the core, not the cache.

[<img loading="lazy" decoding="async" src="http://lemire.me/blog/wp-content/uploads/2026/09/ryzen-transistors-1024x564.jpg" alt="Transistor counts for Ryzen 7 5800X3D, 7800X3D and 9800X3D, split into core, I/O and cache" width="660" height="364" class="alignnone size-large wp-image-22893" srcset="https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-transistors-1024x564.jpg 1024w, https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-transistors-300x165.jpg 300w, https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-transistors-768x423.jpg 768w, https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-transistors.jpg 1200w" sizes="auto, (max-width: 660px) 100vw, 660px">](http://lemire.me/blog/wp-content/uploads/2026/09/ryzen-transistors.jpg)

How do you turn extra transistors into extra performance?

You make the core wider, and you give it more to work with. Dispatch width went from a maximum of 6 instructions per cycle to 8. The L2 cache per core doubled, from 512 KB to 1 MB. The L1 data cache went from 32 KB to 48 KB. Integer ALUs went from 4 to 6. The reorder buffer grew from 256 to 448 entries, so the processor can keep more instructions in flight and schedule them better.

[<img loading="lazy" decoding="async" src="http://lemire.me/blog/wp-content/uploads/2026/09/ryzen-core-changes-1024x596.jpg" alt="Cache sizes, dispatch width, integer ALUs and reorder buffer from Zen 3 to Zen 5" width="660" height="384" class="alignnone size-large wp-image-22894" srcset="https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-core-changes-1024x596.jpg 1024w, https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-core-changes-300x175.jpg 300w, https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-core-changes-768x447.jpg 768w, https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-core-changes.jpg 1200w" sizes="auto, (max-width: 660px) 100vw, 660px">](http://lemire.me/blog/wp-content/uploads/2026/09/ryzen-core-changes.jpg)

|                 |Zen 3  <br/> 2022|Zen 4  <br/> 2023|Zen 5  <br/> 2024|
|-----------------|-----------------|-----------------|-----------------|
|L2 cache per core|     512 KB      |      1 MB       |      1 MB       |
|  L1 data cache  |      32 KB      |      32 KB      |      48 KB      |
| Dispatch width  |        6        |        6        |        8        |
|  Integer ALUs   |        4        |        4        |        6        |
| Reorder buffer  |       256       |       320       |       448       |

For data parallelism (SIMD), Zen 5 is a different machine. Zen 3 and Zen 4 had four 256-bit SIMD arithmetic units. Zen 5 has four 512-bit units. Loads and stores widened the same way: two 512-bit loads per cycle, one 512-bit store.

[<img loading="lazy" decoding="async" src="http://lemire.me/blog/wp-content/uploads/2026/09/ryzen-simd-1024x341.jpg" alt="SIMD arithmetic units, loads per cycle and stores per cycle from Zen 3 to Zen 5" width="660" height="220" class="alignnone size-large wp-image-22895" srcset="https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-simd-1024x341.jpg 1024w, https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-simd-300x100.jpg 300w, https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-simd-768x256.jpg 768w, https://lemire.me/blog/wp-content/uploads/2026/09/ryzen-simd.jpg 1199w" sizes="auto, (max-width: 660px) 100vw, 660px">](http://lemire.me/blog/wp-content/uploads/2026/09/ryzen-simd.jpg)

|                     |Zen 3  <br/> 2022|Zen 4  <br/> 2023|Zen 5  <br/> 2024|
|---------------------|-----------------|-----------------|-----------------|
|SIMD arithmetic units|   4 × 256-bit   |   4 × 256-bit   |   4 × 512-bit   |
|   Loads per cycle   |   2 × 256-bit   |   2 × 256-bit   |   2 × 512-bit   |
|  Stores per cycle   |   1 × 256-bit   |   1 × 256-bit   |   1 × 512-bit   |

I already made the point that [processors are getting wider](https://lemire.me/blog/2025/09/01/processors-are-getting-wider/). This is what that looks like on a desktop chip you can buy.

What about the next step? Zen 6 is arriving. AMD is talking about a 256-core Epyc part (Venice) with a gigabyte of L3 cache. We do not yet know what the desktop cores will look like. It could be wild.

Further reading: [AMD’s 256-core Epyc 9996 ‘Venice’](https://www.tomshardware.com/pc-components/cpus/amds-256-core-epyc-9996-venice-claims-up-to-a-3-4x-jump-over-intel-xeon-competition-20-percent-over-nvidia-vera-zen-6-comes-with-up-to-1024mb-of-l3-16-channel-memory-and-5ghz-clock-speeds) (Tom’s Hardware).