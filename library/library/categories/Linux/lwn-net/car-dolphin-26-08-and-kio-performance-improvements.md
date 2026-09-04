+++
title = "Car: Dolphin 26.08 and KIO performance improvements"
description = "Méven Car has written a pair of interesting blog posts (part 1, part 2). The first post is largely about so"
date = "2026-08-28T20:00:27Z"
url = "https://lwn.net/Articles/1091177/"
author = "jzb"
text = ""
lastupdated = "2026-09-01T19:33:14.074784530Z"
seen = false
+++

Méven Car has written a pair of interesting blog posts ([part 1](https://blogs.kde.org/2026/08/26/dolphin-26.08-and-kio-perf-improvements/), [part 2](https://blogs.kde.org/2026/08/27/dolphin-26.08-and-kio-part-two-what-got-faster-and-smaller/)). The first post is largely about some of the recent new features and performance work that have gone into the [Dolphin](https://apps.kde.org/dolphin/) file manager 26.08 release, as well as the [KIO](https://en.wikipedia.org/wiki/KIO) framework. The second looks at the performance improvements and benchmarks for previous, current, and upcoming releases.

>
>
> Copying many small files is more than twice as fast as it was in April. The gain falls off as files get larger, which is what you would expect: the fix is to the per-file overhead, and once each file carries a megabyte of actual I/O the overhead stops being what you are waiting for.
>
>
>
> There is still a gap with cp, discussed at length in [the July post](https://blogs.kde.org/2026/07/28/making-kio-copy-many-files-fast/). KIO is doing more than cp does, but not five times more, and the batching work that closes most of the rest of that gap is still in progress.
>
>