+++
title = "ChaCha AVX-512 Optimization For Linux 7.5 Yields Up To 99% Improvement On AMD Zen 5"
description = "The Linux kernel's ChaCha symmetric stream cipher code has long had an AVX-512 optimized code path but it was catering to the early generations of Intel CPUs with AVX-512 (Skylake) that suffered from down-clocking under use. But now slated for arrival with Linux 7.5 is tuning the"
date = "2026-11-09T12:35:12Z"
url = "https://www.phoronix.com/news/ChaCha-AVX-512-Linux-7.5"
author = "Michael Larabel"
text = ""
lastupdated = "2026-11-11T16:05:18.612912887Z"
seen = false
+++

The Linux kernel's ChaCha symmetric stream cipher code has long had an AVX-512 optimized code path but it was catering to the early generations of Intel CPUs with AVX-512 (Skylake) that suffered from down-clocking under use. But now slated for arrival with Linux 7.5 is tuning the code to perform better on today's AVX-512 Intel and AMD processors that don't suffer from this limitation. In turn the ChaCha performance is as much as 99% faster with current-generation AMD Zen 5 processors...