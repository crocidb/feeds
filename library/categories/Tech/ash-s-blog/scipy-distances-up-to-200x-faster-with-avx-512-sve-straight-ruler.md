---
title = "SciPy distances... up to 200x faster with AVX-512 & SVE 📏"
description = "Over the years, Intel’s 512-bit Advanced Vector eXtensions (AVX-512) stirred extensive discussions. While introduced in 2014, it wasn’t until recently that CPUs began providing comprehensive support. Similarly, Arm Scalable Vector Extensions (SVE), primarily designed for Arm "
date = "2023-10-07T00:00:00Z"
url = "https://ashvardanian.com/posts/simsimd-faster-scipy/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.356873661Z"
seen = true
---

Over the years, Intel’s 512-bit *Advanced Vector eXtensions* (AVX-512) stirred extensive discussions. While introduced in 2014, it wasn’t until recently that CPUs began providing comprehensive support. Similarly, *Arm Scalable Vector Extensions (SVE)*, primarily designed for Arm servers, have also started making waves only lately. The computing landscape now looks quite different with powerhouses like Intel’s [Sapphire Rapids](https://en.wikipedia.org/wiki/Sapphire_Rapids) CPUs, [AWS Graviton 3](https://aws.amazon.com/ec2/graviton/), and [Ampere Altra](https://amperecomputing.com/products/processors) entering the fray. Their arrival brings compelling advantages over the traditional AVX2 and NEON extensions: