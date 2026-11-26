+++
title = "Benchmarking The Performance Benefit Of FRED On AMD Zen 6"
description = 'With the new EPYC 9006 SP7 Venice processors now shipping, one of the curious follow-up benchmarks I have been wanting to pursue is around quantifying the performance impact of Flexible Return and Event Delivery "FRED". After all, FRED showed very nice gains for Intel Panther Lak'
date = "2026-11-25T01:55:19Z"
url = "https://www.phoronix.com/news/AMD-Zen-6-FRED-Benefits"
author = "Michael Larabel"
text = ""
lastupdated = "2026-11-25T14:41:59.617738336Z"
seen = false
+++

With the new EPYC 9006 SP7 Venice processors now shipping, one of the curious follow-up benchmarks I have been wanting to pursue is around quantifying the performance impact of Flexible Return and Event Delivery "FRED". After all, FRED showed very nice gains for Intel Panther Lake for first featuring FRED. Since then the Linux kernel has enabled FRED usage by default with capable CPUs, so all the EPYC 9006 benchmarks on Phoronix have already been with FRED, so here are some numbers when going ahead and forcing FRED off in the Linux kernel...