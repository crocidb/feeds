---
title = "Beyond OpenMP in C++ & Rust: Taskflow, Rayon, Fork Union 🍴"
description = "TL;DR: Most C++ and Rust thread-pool libraries leave significant performance on the table - often running 10× slower than OpenMP on classic fork-join workloads and [micro-benchmarks](https://github.com/ashvardanian/ParallelReductionsBen"
date = "2025-05-20T00:00:00Z"
url = "https://ashvardanian.com/posts/beyond-openmp-in-cpp-rust/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.316243523Z"
seen = true
---

>
>
> TL;DR: Most C++ and Rust thread-pool libraries leave significant performance on the table - often running 10× slower than [OpenMP](https://en.wikipedia.org/wiki/OpenMP) on classic fork-join workloads and [micro-benchmarks](https://github.com/ashvardanian/ParallelReductionsBenchmark). So I’ve drafted a minimal \~300-line library called [Fork Union](https://github.com/ashvardanian/fork_union) that lands within 20% of OpenMP. It does not use advanced [NUMA](https://en.wikipedia.org/wiki/Non-uniform_memory_access) tricks; it uses only the C++ and Rust standard libraries and has no other dependencies.
>
>
>
> Update (Sep 2025): Since the [v2 release](https://github.com/ashvardanian/fork_union/releases/tag/v2.0.0), Fork Union supports NUMA and Huge Pages, as well as `tpause`, `wfet`, and other “pro” features. Check the [README for details](https://github.com/ashvardanian/fork_union?tab=readme-ov-file#pro-tips).
>
>