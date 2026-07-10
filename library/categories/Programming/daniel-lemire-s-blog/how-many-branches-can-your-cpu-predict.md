+++
title = "How many branches can your CPU predict?"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/03/Capture-decran-le-2026-03-18-a-17.52.22-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" '
date = "2026-03-18T21:52:53Z"
url = "https://lemire.me/blog/2026/03/18/how-many-branches-can-your-cpu-predict/"
author = "Daniel Lemire"
text = ""
lastupdated = "2026-03-19T16:26:22.785020783Z"
seen = false
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/03/Capture-decran-le-2026-03-18-a-17.52.22-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async">

Modern processors have the ability to execute many instructions per cycle, on a single core. To be able to execute many instructions per cycle in practice, processors predict branches. I have made the point over the years that modern CPUs have an incredible ability to [predict branches](https://lemire.me/blog/2019/10/16/benchmarking-is-hard-processors-learn-to-predict-branches/).

It makes benchmarking difficult because if you test on small datasets, you can get surprising results that might not work on real data.

My go-to benchmark is a function like so:

```
while (howmany != 0) {
    val = generate_random_value()
    if(val is odd) write to buffer
    decrement howmany
}

```

The processor tries to predict the branch (`if` clause). Because we use random values, the processor should mispredict one time out of two.

However, if we repeat multiple times the benchmark, always using the same random values, the processor learns the branches. How many can processors learn? I test using three recent processors.

* The AMD Zen 5 processor can predict perfectly 30,000 branches.
* The Apple M4 processor can predict perfectly 10,000 branches.
* Intel Emerald Rapids can predict perfectly 5,000 branches.

Once more I am disappointed by Intel. AMD is doing wonderfully well on this benchmark.

[<img fetchpriority="high" decoding="async" class="alignnone size-full wp-image-22549" src="http://lemire.me/blog/wp-content/uploads/2026/03/branch_mispredictions-2.png" alt="" width="1000" height="600" srcset="https://lemire.me/blog/wp-content/uploads/2026/03/branch_mispredictions-2.png 1000w, https://lemire.me/blog/wp-content/uploads/2026/03/branch_mispredictions-2-300x180.png 300w, https://lemire.me/blog/wp-content/uploads/2026/03/branch_mispredictions-2-768x461.png 768w" sizes="(max-width: 1000px) 100vw, 1000px">](http://lemire.me/blog/wp-content/uploads/2026/03/branch_mispredictions-2.png)![](branch_mispredictions.png)

[My source code is available](https://github.com/lemire/Code-used-on-Daniel-Lemire-s-blog/tree/master/2026/03/18/benchmark).