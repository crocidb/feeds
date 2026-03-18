---
title = "StringZilla: 5x faster strings with SIMD & SWAR 🦖"
description = "A few years back, I found a simple trick in tandem with SIMD intrinsics to truly unleash the power of contemporary CPUs. I put the strstr of LibC and the std::search of the C++ Standard Templates Library to the test and hit a throughput of around 1.5 GB/s for substring search"
date = "2023-07-10T00:00:00Z"
url = "https://ashvardanian.com/posts/stringzilla/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.360834588Z"
seen = true
---

A few years back, I found a simple trick in tandem with SIMD intrinsics to truly unleash the power of contemporary CPUs. I put the `strstr` of LibC and the `std::search` of the C++ Standard Templates Library to the test and hit a throughput of around 1.5 GB/s for substring search on a solitary core. Not too shabby, right? But imagine, that the memory bandwidth could theoretically reach a striking 10-15 GB/s per core.