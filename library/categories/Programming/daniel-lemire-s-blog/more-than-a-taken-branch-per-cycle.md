+++
title = "More than a taken branch per cycle?"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/09/branching_branch_art-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async"Ou'
date = "2026-09-21T18:36:05Z"
url = "https://lemire.me/blog/2026/09/21/more-than-a-taken-branch-per-cycle/"
author = "Antonio Badia"
text = ""
lastupdated = "2026-09-23T18:24:59.498898734Z"
seen = false
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/09/branching_branch_art-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" loading="lazy">

Our processors can execute many instructions per cycle; they are *superscalar*. But not all instructions are equal.

Branches are particularly tricky. A branch occurs often when you use an if-then clause or a loop. We distinguish between a taken branch and a not taken branch.

A not-taken branch is often cheap. The processor just keeps going.

A taken branch jumps to a new location. A taken branch can be more expensive.

You will often hear that processors are limited to one taken branch per cycle.

I decided to test it out with a loop with an `if` inside it. Here is the function I tested in Go.

```
func lastHit(p []byte, thresh byte, last *byte) {
    n := len(p)
    if n == 0 {
        return
    }
    i := 0
    for {
        v := p[i]
        if v > thresh {
            *last = v
        }
        i++
        if i == n {
            break
        }
    }
}

```

Look at the main loop. We load a value from an array, we compare it with a threshold. If it is greater than the threshold, then we assign it to the `last` pointer. So the function effectively records the last seen value that is greater than the threshold. That’s pretty reasonable code.

Consider the case where you always miss. The values are always smaller than or equal to the threshold. In these cases, we get two taken branches in close proximity, but no store. (It is a bit confusing but that’s how the Go compiler does it.)

[![Cycles per iteration when the if always misses](https://lemire.me/blog/wp-content/uploads/2026/09/misses.webp)](https://lemire.me/blog/wp-content/uploads/2026/09/misses.webp)

The processor that struggles the most is the AMD Zen 4 processor. But AMD Zen 5 is much better.

So two processors are able to take two branches in less than 2 cycles on average in this test: the Apple processor (M4 Max) and the Granite Rapids processor.

This means that, yes, modern processors can execute more than one taken branch per cycle under some conditions.

The code is under `benchmark/experiments/ifloop` in the [GitHub repo](https://github.com/lemire/Code-used-on-Daniel-Lemire-s-blog/tree/master/2026/09/21).