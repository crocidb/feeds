---
title = "Failing to Reach DDR4 Bandwidth 🚌"
description = "A bit of history. Not so long ago, we tried to use GPU acceleration from Python. We benchmarked NumPy vs CuPy in the most common number-crunching tasks. We took the highest-end desktop CPU and the highest-end desktop GPU and put them to"
date = "2022-01-29T00:00:00Z"
url = "https://ashvardanian.com/posts/ddr4-bandwidth/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.371487737Z"
seen = true
---

A bit of history. Not so long ago, we tried to use GPU acceleration from Python. We [benchmarked NumPy vs CuPy](https://unum.cloud/blog/2022-01-26-cupy/) in the most common number-crunching tasks. We took the highest-end desktop CPU and the highest-end desktop GPU and put them to the test. The GPU, expectedly, won, but not just in Matrix Multiplications.

Sorting arrays, finding medians, and even simple accumulation was vastly faster. So we implemented multiple algorithms for [parallel reductions in C++ and CUDA](https://ashvardanian.com/posts/cuda-parallel-reductions/), just to compare efficiency. CUDA was obviously harder, than using `std::accumulate`, but there is a shortcut: `thrust::reduce`.