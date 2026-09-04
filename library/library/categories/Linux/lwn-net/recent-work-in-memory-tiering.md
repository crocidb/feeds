+++
title = "[$] Recent work in memory tiering"
description = "Tiered-memory systems are built with multiple types of memory, each of which has different performance characteristics. In addition to the usual DRAM, a tiered system might also provide faster high-bandwidth memory or slower CXL memory. On these systems, the placement of memory a"
date = "2026-09-03T14:11:26Z"
url = "https://lwn.net/Articles/1092001/"
author = "corbet"
text = ""
lastupdated = "2026-09-03T22:47:40.619471675Z"
seen = false
+++

Tiered-memory systems are built with multiple types of memory, each of which has different performance characteristics. In addition to the usual DRAM, a tiered system might also provide faster high-bandwidth memory or slower CXL memory. On these systems, the placement of memory allocations has a significant effect on the performance that a workload will obtain. While work on tiered-memory improvements has been ongoing for years, it feels like the pace has slowed a bit recently. Even so, there are a few efforts underway, but they are facing questions about whether the tiering design makes sense.