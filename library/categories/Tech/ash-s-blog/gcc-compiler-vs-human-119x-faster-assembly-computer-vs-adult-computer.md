---
title = "GCC Compiler vs Human - 119x Faster Assembly 💻🆚🧑‍💻"
description = "When our Python code is too slow, like most others we switch to C and often get 100x speed boosts, just like when we replaced SciPy distance computations with SimSIMD. But imagine going 100x faster than C code!It sounds craz"
date = "2023-10-23T00:00:00Z"
url = "https://ashvardanian.com/posts/gcc-12-vs-avx512fp16/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.350791325Z"
seen = true
---

When our Python code is too slow, like most others we switch to C and often get 100x speed boosts, just like when we [replaced SciPy distance computations with SimSIMD](https://ashvardanian.com/posts/simsimd-faster-scipy/). But imagine going 100x faster than C code!

It sounds crazy, especially for number-crunching tasks that are “data-parallel” and easy for compilers to optimize. In such spots the compiler will typically “unroll” the loop, vectorize the code, and use SIMD instructions to process multiple data elements in parallel. But I’ve found a simple case, where the [GNU C Compiler](https://en.wikipedia.org/wiki/GNU_Compiler_Collection) (GCC 12) failed to do so, and lost to hand-written SIMD code by a factor of **119**. Enough to make the friendly bull compiler cry.