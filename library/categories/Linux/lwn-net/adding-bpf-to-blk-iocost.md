+++
title = "[$] Adding BPF to blk-iocost"
description = "The scheduling of block I/O requests has long been a challenge for operating-system kernels. For many years, the performance characteristics of rotating drives meant that putting considerable resources into request ordering was worthwhile. In a world with fast, solid-state drives"
date = "2026-09-15T14:37:30Z"
url = "https://lwn.net/Articles/1093661/"
author = "corbet"
text = ""
lastupdated = "2026-09-21T09:42:43.315791687Z"
seen = false
+++

The scheduling of block I/O requests has long been a challenge for operating-system kernels. For many years, the performance characteristics of rotating drives meant that putting considerable resources into request ordering was worthwhile. In a world with fast, solid-state drives, scheduling is more concerned with enforcing fairness between competing users while being fast enough to keep up with drives that can perform millions of I/O operations per second. The blk-iocost I/O controller was designed for the solid-state world and generally performs well, but there is always a desire to do better. [This patch series](https://lwn.net/ml/all/20260914073356.791518-1-cui.tao@linux.dev) from Tao Cui aims to make blk-iocost more flexible by enabling the loading of a BPF program to make cost decisions.