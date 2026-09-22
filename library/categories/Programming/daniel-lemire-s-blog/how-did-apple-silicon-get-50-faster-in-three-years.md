+++
title = "How did Apple Silicon get 50% faster in three years?"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/09/apple-featured-150x150.jpg" class="webfeedsFeaturedVisual wp-post-image" alt="Four processor packages in a row on a desk" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" l'
date = "2026-09-19T16:13:41Z"
url = "https://lemire.me/blog/2026/09/19/how-did-apple-silicon-get-50-faster-in-three-years/"
author = "Daniel Lemire"
text = ""
lastupdated = "2026-09-21T09:42:46.662452478Z"
seen = false
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/09/apple-featured-150x150.jpg" class="webfeedsFeaturedVisual wp-post-image" alt="Four processor packages in a row on a desk" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" loading="lazy">

Recently, I looked at how AMD made its chips 50% faster within a span of two years, in [How did AMD Ryzen get 50% faster in two years?](https://lemire.me/blog/2026/09/18/how-did-amd-ryzen-get-50-faster-in-two-years/) Many people asked me to cover Apple processors. So let us go.

Consider the base Apple Silicon chips: M2 (2022), M3 (2023), M4 (2024) and M5 (2025). I am skipping the original one (M1) for simplicity and I am not considering the Pro and Max chips. The M6 is out there too, just released, but I am going to cover it at the end.

On Geekbench 6, performance went up by about 50% in three years. The increase is rather gradual. No big jump.

[<img loading="lazy" decoding="async" src="http://lemire.me/blog/wp-content/uploads/2026/09/geekbench-1024x424.jpg" alt="Geekbench 6 single-core and multi-core scores for Apple M2, M3, M4 and M5" width="660" height="273" class="alignnone size-large wp-image-22906" srcset="https://lemire.me/blog/wp-content/uploads/2026/09/geekbench-1024x424.jpg 1024w, https://lemire.me/blog/wp-content/uploads/2026/09/geekbench-300x124.jpg 300w, https://lemire.me/blog/wp-content/uploads/2026/09/geekbench-768x318.jpg 768w, https://lemire.me/blog/wp-content/uploads/2026/09/geekbench.jpg 1199w" sizes="auto, (max-width: 660px) 100vw, 660px">](http://lemire.me/blog/wp-content/uploads/2026/09/geekbench.jpg)

|           |2022  <br/> M2  <br/> 4P+4E|2023  <br/> M3  <br/> 4P+4E|2024  <br/> M4  <br/> 4P+6E|2025  <br/> M5  <br/> 4P+6E|
|-----------|---------------------------|---------------------------|---------------------------|---------------------------|
|Single-core|           2,401           |           2,767           |           3,278           |           3,642           |
|Multi-core |           9,814           |          11,544           |          15,345           |          17,955           |

The 2025 chip is 52% faster on a single core than the 2022 chip, and 83% faster with all cores.

Unlike AMD, Apple improved the CPU frequency quite a bit. The P-core went from 3.5 GHz to 4.6 GHz, a 30% increase. On its own, it can explain the bulk of the single-core performance increase.

[<img loading="lazy" decoding="async" src="http://lemire.me/blog/wp-content/uploads/2026/09/frequency-1024x753.jpg" alt="P-core and E-core max frequencies for Apple M2, M3, M4 and M5" width="660" height="485" class="alignnone size-large wp-image-22907" srcset="https://lemire.me/blog/wp-content/uploads/2026/09/frequency-1024x753.jpg 1024w, https://lemire.me/blog/wp-content/uploads/2026/09/frequency-300x221.jpg 300w, https://lemire.me/blog/wp-content/uploads/2026/09/frequency-768x564.jpg 768w, https://lemire.me/blog/wp-content/uploads/2026/09/frequency.jpg 1200w" sizes="auto, (max-width: 660px) 100vw, 660px">](http://lemire.me/blog/wp-content/uploads/2026/09/frequency.jpg)

|          |2022  <br/> M2|2023  <br/> M3|2024  <br/> M4|2025  <br/> M5|
|----------|--------------|--------------|--------------|--------------|
|P-core max|   3.5 GHz    |   4.0 GHz    |   4.4 GHz    |   4.6 GHz    |
|E-core max|   2.4 GHz    |   2.8 GHz    |   2.9 GHz    |   3.0 GHz    |

But still, even if we normalized the clock speed, an Apple M5 would be noticeably faster than an Apple M2.

Let us look at the transistor count. For the M5, I could not find any information. But there is otherwise a nice gradual increase. From the M2 to the M4, the number went up by about 40%, from 20 billion to 28 billion.

[<img loading="lazy" decoding="async" src="http://lemire.me/blog/wp-content/uploads/2026/09/transistors-1024x753.jpg" alt="Transistor counts for Apple M2, M3 and M4; M5 not disclosed" width="660" height="485" class="alignnone size-large wp-image-22908" srcset="https://lemire.me/blog/wp-content/uploads/2026/09/transistors-1024x753.jpg 1024w, https://lemire.me/blog/wp-content/uploads/2026/09/transistors-300x221.jpg 300w, https://lemire.me/blog/wp-content/uploads/2026/09/transistors-768x564.jpg 768w, https://lemire.me/blog/wp-content/uploads/2026/09/transistors.jpg 1200w" sizes="auto, (max-width: 660px) 100vw, 660px">](http://lemire.me/blog/wp-content/uploads/2026/09/transistors.jpg)

Where did they go?

The base M4 processor has two extra efficiency cores. This will not help with single-core performance, but it will help multicore performance.

[<img loading="lazy" decoding="async" src="http://lemire.me/blog/wp-content/uploads/2026/09/cores-1024x753.jpg" alt="Performance and efficiency core counts for Apple M2, M3, M4 and M5" width="660" height="485" class="alignnone size-large wp-image-22909" srcset="https://lemire.me/blog/wp-content/uploads/2026/09/cores-1024x753.jpg 1024w, https://lemire.me/blog/wp-content/uploads/2026/09/cores-300x221.jpg 300w, https://lemire.me/blog/wp-content/uploads/2026/09/cores-768x564.jpg 768w, https://lemire.me/blog/wp-content/uploads/2026/09/cores.jpg 1200w" sizes="auto, (max-width: 660px) 100vw, 660px">](http://lemire.me/blog/wp-content/uploads/2026/09/cores.jpg)

|                 |2022  <br/> M2|2023  <br/> M3|2024  <br/> M4|2025  <br/> M5|
|-----------------|--------------|--------------|--------------|--------------|
|Performance cores|      4       |      4       |      4       |      4       |
|Efficiency cores |      4       |      4       |      6       |      6       |

But what about each individual core?

An important variable at the core level is the number of instructions per cycle. And this went up. Decode width went from 8 instructions per cycle on the M2 to 10 on the M4 and the M5, which is higher than what most competitors can do. So you can get more compute per cycle.

[<img loading="lazy" decoding="async" src="http://lemire.me/blog/wp-content/uploads/2026/09/ipc-1024x753.jpg" alt="Decode width in instructions per cycle for Apple M2, M3, M4 and M5" width="660" height="485" class="alignnone size-large wp-image-22910" srcset="https://lemire.me/blog/wp-content/uploads/2026/09/ipc-1024x753.jpg 1024w, https://lemire.me/blog/wp-content/uploads/2026/09/ipc-300x221.jpg 300w, https://lemire.me/blog/wp-content/uploads/2026/09/ipc-768x564.jpg 768w, https://lemire.me/blog/wp-content/uploads/2026/09/ipc.jpg 1200w" sizes="auto, (max-width: 660px) 100vw, 660px">](http://lemire.me/blog/wp-content/uploads/2026/09/ipc.jpg)

Thus far, we do not see much difference between the M4 and the M5, and yet the M5 can be significantly faster. Let us look next at memory bandwidth.

And yeah, the M5 has much more memory bandwidth: 154 GB/s against 100 GB/s on the M2 and the M3. That helps on multicore processing tasks, as it is when you are most likely to run out of bandwidth.

[<img loading="lazy" decoding="async" src="http://lemire.me/blog/wp-content/uploads/2026/09/bandwidth-1024x751.jpg" alt="Memory bandwidth for Apple M2, M3, M4 and M5" width="660" height="484" class="alignnone size-large wp-image-22911" srcset="https://lemire.me/blog/wp-content/uploads/2026/09/bandwidth-1024x751.jpg 1024w, https://lemire.me/blog/wp-content/uploads/2026/09/bandwidth-300x220.jpg 300w, https://lemire.me/blog/wp-content/uploads/2026/09/bandwidth-768x563.jpg 768w, https://lemire.me/blog/wp-content/uploads/2026/09/bandwidth.jpg 1200w" sizes="auto, (max-width: 660px) 100vw, 660px">](http://lemire.me/blog/wp-content/uploads/2026/09/bandwidth.jpg)

|         |2022  <br/> M2|2023  <br/> M3|2024  <br/> M4|2025  <br/> M5|
|---------|--------------|--------------|--------------|--------------|
|Bandwidth|   100 GB/s   |   100 GB/s   |   120 GB/s   |   154 GB/s   |
| Memory  | LPDDR5-6400  | LPDDR5-6400  | LPDDR5X-7500 | LPDDR5X-9600 |

What about data parallelism? AMD improved data parallelism (SIMD) considerably. The story is much less interesting with Apple processors. They have four 128-bit execution units, all of them. Meanwhile the Zen 5 has four 512-bit units. It is four times more. What is new with the M4 and the M5 is the new 512-bit SME matrix unit.

[<img loading="lazy" decoding="async" src="http://lemire.me/blog/wp-content/uploads/2026/09/simd-1024x445.jpg" alt="Apple M-series four 128-bit NEON units versus AMD Zen 5 four 512-bit AVX-512 units" width="660" height="287" class="alignnone size-large wp-image-22912" srcset="https://lemire.me/blog/wp-content/uploads/2026/09/simd-1024x445.jpg 1024w, https://lemire.me/blog/wp-content/uploads/2026/09/simd-300x131.jpg 300w, https://lemire.me/blog/wp-content/uploads/2026/09/simd-768x334.jpg 768w, https://lemire.me/blog/wp-content/uploads/2026/09/simd.jpg 1200w" sizes="auto, (max-width: 660px) 100vw, 660px">](http://lemire.me/blog/wp-content/uploads/2026/09/simd.jpg)

But there is a new iteration. The M6.

[<img loading="lazy" decoding="async" src="http://lemire.me/blog/wp-content/uploads/2026/09/m6-1024x834.jpg" alt="Apple M6 processor" width="660" height="538" class="alignnone size-large wp-image-22913" srcset="https://lemire.me/blog/wp-content/uploads/2026/09/m6-1024x834.jpg 1024w, https://lemire.me/blog/wp-content/uploads/2026/09/m6-300x244.jpg 300w, https://lemire.me/blog/wp-content/uploads/2026/09/m6-768x625.jpg 768w, https://lemire.me/blog/wp-content/uploads/2026/09/m6.jpg 1086w" sizes="auto, (max-width: 660px) 100vw, 660px">](http://lemire.me/blog/wp-content/uploads/2026/09/m6.jpg)

The number of cores goes from 10 to 12. They added two ‘super’ cores. The bandwidth is up a bit. My expectation is that Apple will still again deliver a boost in performance.

In effect, what I am demonstrating is that CPUs are not boring. They are improving fast.

I already made the point that [processors are getting wider](https://lemire.me/blog/2025/09/01/processors-are-getting-wider/). See also [Memory-level parallelism: Apple M2 vs Apple M4](https://lemire.me/blog/2025/07/09/memory-level-parallelism-apple-m2-vs-apple-m4/).