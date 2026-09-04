---
title = "Hiding x86 Port Latency for 330 GB/s/core Reductions 🫣"
description = "For High-Performance Computing engineers, here’s the gist:On Intel CPUs, the vaddps instruction (vectorized float addition) executes on ports 0 and 5. The vfmadd132ps instruction (vectorized fused float multiply-add, or FMA) also executes on ports 0 and 5.On "
date = "2025-01-19T00:00:00Z"
url = "https://ashvardanian.com/posts/cpu-ports/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.325287041Z"
seen = true
---

For High-Performance Computing engineers, here’s the gist:

>
>
> On Intel CPUs, the `vaddps` instruction (vectorized `float` addition) executes on ports 0 and 5. The `vfmadd132ps` instruction (vectorized fused `float` multiply-add, or FMA) **also** executes on ports 0 and 5.
>
>
>
> On AMD CPUs, however, the `vaddps` instruction takes ports 2 and 3, and the `vfmadd132ps` instruction takes ports 0 and 1. Since FMA is equivalent to simple addition when one of the arguments is 1, we can drastically increase the throughput of addition-heavy numerical kernels.
>
>