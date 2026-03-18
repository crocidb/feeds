---
title = "Processing Strings 109x Faster than Nvidia on H100"
description = "StringZilla bannerI’ve just shipped StringZilla v4, the first [CUDA](https://en.wikipedia.org/wiki/C"
date = "2025-09-15T00:00:00Z"
url = "https://ashvardanian.com/posts/stringwars-on-gpus/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.313922056Z"
seen = true
---

[![StringZilla banner](https://ashvardanian.com/stringwars-on-gpus/StringZilla-v4.jpg)](http://github.com/ashvardanian/StringZilla)

I’ve just shipped [StringZilla v4](https://github.com/ashvardanian/StringZilla/releases/tag/v4.0.0), the first [CUDA](https://en.wikipedia.org/wiki/CUDA)-capable release of my [SIMD](https://en.wikipedia.org/wiki/Single_instruction,_multiple_data)-first string processing library. Which in English means that it is now fast not only on CPUs, but also on GPUs!

* I’ve wanted to add [ROCm](https://en.wikipedia.org/wiki/ROCm)-acceleration for AMD GPUs 🤦‍♂️
* I’ve wanted to include a parallel multi-pattern search algorithm 🤦‍♂️
* I’ve wanted to publish it back in December 2024 🤦‍♂️

So not everything went to plan, but “StringZilla 4 CUDA” is finally here, bringing 500+ GigaCUPS of edit-distance calculations in a `pip install`-able package, and a few more tricks up its sleeve, aimed at large-scale Information Retrieval, **Databases** and Datalake systems, as well as **Bioinformatics** workloads. All under a permissive Apache 2.0 open-source license, free for commercial use. So in this post, we’ll cover some of the most interesting parts of this release, including: