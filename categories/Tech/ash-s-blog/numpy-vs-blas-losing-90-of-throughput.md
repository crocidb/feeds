---
title = "NumPy vs BLAS: Losing 90% of Throughput"
description = "Downloaded over 5 Billion times, NumPy is the most popular library for numerical computing in Python. It wraps low-level HPC libraries like BLAS and LAPACK, providing a high-level interface for matrix operations. BLAS is mainly implemented "
date = "2024-03-12T00:00:00Z"
url = "https://ashvardanian.com/posts/numpy-vs-blas-costs/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.341003301Z"
seen = true
---

[Downloaded over 5 Billion times](https://www.pepy.tech/projects/numpy), NumPy is the most popular library for numerical computing in Python. It wraps low-level HPC libraries like BLAS and LAPACK, providing a high-level interface for matrix operations. BLAS is mainly implemented in C, Fortran, or Assembly and is available for most modern chips, not just CPUs. BLAS is fast, but bindings aren’t generally free. So, how much of the BLAS performance is NumPy leaving on the table?