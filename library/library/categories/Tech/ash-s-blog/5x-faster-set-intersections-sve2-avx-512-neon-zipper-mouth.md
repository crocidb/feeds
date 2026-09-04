---
title = "5x Faster Set Intersections: SVE2, AVX-512, & NEON 🤐"
description = "Set intersections are one of the standard operations in databases and search engines. They are used in: TF-IDF ranking in search engines, Table Joins) in OLAP databases,* Graph Algorithms.Chances"
date = "2024-09-16T00:00:00Z"
url = "https://ashvardanian.com/posts/simd-set-intersections-sve2-avx512/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.337267303Z"
seen = true
---

Set intersections are one of the standard operations in databases and search engines. They are used in:

* [TF-IDF ranking](https://en.wikipedia.org/wiki/Tf–idf) in search engines,
* [Table Joins](https://en.wikipedia.org/wiki/Join_(SQL)) in OLAP databases,
* Graph Algorithms.

Chances are, you rely on them every day, but you may not realize that they are some of the most complex operations to accelerate with [SIMD instructions](https://en.wikipedia.org/wiki/Single_instruction,_multiple_data). SIMD instructions make up the majority of modern Assembly instruction sets on x86 and Arm. They can yield 10x speedups, but due to their complexity, they are almost never used in production codebases.