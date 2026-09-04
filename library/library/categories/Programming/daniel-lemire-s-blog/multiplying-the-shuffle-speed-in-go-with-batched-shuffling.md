+++
title = "Multiplying the Shuffle Speed in Go with Batched Shuffling"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/12/pcgshuffle_benchmark-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" lo'
date = "2025-12-15T01:42:10Z"
url = "https://lemire.me/blog/2025/12/15/multiplying-the-shuffle-speed-in-go-with-batched-shuffling/"
author = "Daniel Lemire"
text = ""
lastupdated = "2026-03-19T16:26:22.825719469Z"
seen = true
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/12/pcgshuffle_benchmark-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" loading="lazy">

Programmers often want to randomly shuffle arrays. Evidently, we want to do so as efficiently as possible. Maybe surprisingly, I found that the performance of random shuffling was not limited by memory bandwidth or latency, but rather by computation. Specifically, it is the computation of the random indexes itself that is slow.

[Earlier in 2025](https://lemire.me/blog/2025/04/06/faster-shuffling-in-go-with-batching/), I reported how you could more than double the speed of a random shuffle in Go using a new algorithm ([Brackett-Rozinsky and Lemire, 2025](https://arxiv.org/pdf/2408.06213)). However, I was using custom code that could not serve as a drop-in replacement for the standard Go Shuffle function. I decided to write a [proper library called `batchedrand`](https://github.com/lemire/batchedrand). You can use it just like the `math/rand/v2` standard library.

```
rng := batchedrand.Rand{rand.New(rand.NewPCG(1, 2))}

data := []int{1, 2, 3, 4, 5}
rng.Shuffle(len(data), func(i, j int) {
    data[i], data[j] = data[j], data[i]
})

```

How fast is it? The standard library provides two generators, PCG and ChaCha8. ChaCha8 should be slower than PCG, because it has better cryptographic guarantees. However, both have somewhat comparable speeds because ChaCha8 is heavily optimized with assembly code in the Go runtime while the PCG implementation is conservative and not focused on speed.  
 On my Apple M4 processor with Go 1.25, I get the following results. I report the time per input element, not the total time.

|  Benchmark  | Size |Batched (ns/item)|Standard (ns/item)|speedup|
|-------------|------|-----------------|------------------|-------|
|ChaChaShuffle|  30  |       1.8       |       4.6        |  2.6  |
|ChaChaShuffle| 100  |       1.8       |       4.7        |  2.5  |
|ChaChaShuffle|500000|       2.6       |       5.1        |  1.9  |
| PCGShuffle  |  30  |       1.5       |       3.9        |  2.6  |
| PCGShuffle  | 100  |       1.5       |       4.2        |  2.8  |
| PCGShuffle  |500000|       1.9       |       3.8        |  2.0  |

Thus, from tiny to large arrays, the batched approach is two to three times faster. Not bad for a drop-in replacement!

Get the Go library at [https://github.com/lemire/batchedrand](https://github.com/lemire/batchedrand)

[<img loading="lazy" decoding="async" class="alignnone size-full wp-image-22370" src="http://lemire.me/blog/wp-content/uploads/2025/12/pcgshuffle_benchmark.png" alt="" width="1000" height="600" srcset="https://lemire.me/blog/wp-content/uploads/2025/12/pcgshuffle_benchmark.png 1000w, https://lemire.me/blog/wp-content/uploads/2025/12/pcgshuffle_benchmark-300x180.png 300w, https://lemire.me/blog/wp-content/uploads/2025/12/pcgshuffle_benchmark-768x461.png 768w" sizes="auto, (max-width: 1000px) 100vw, 1000px">](http://lemire.me/blog/wp-content/uploads/2025/12/pcgshuffle_benchmark.png)

**Further reading:**

* Nevin Brackett-Rozinsky, Daniel Lemire, [Batched Ranged Random Integer Generation](https://arxiv.org/pdf/2408.06213), Software: Practice and Experience 55 (1), 2025
* Daniel Lemire, Fast Random Integer Generation in an Interval, ACM Transactions on Modeling and Computer Simulation, Volume 29 Issue 1, February 2019