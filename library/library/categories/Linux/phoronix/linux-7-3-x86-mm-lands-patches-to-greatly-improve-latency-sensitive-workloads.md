+++
title = "Linux 7.3 x86/mm Lands Patches To Greatly Improve Latency-Sensitive Workloads"
description = "The highlight of this week's x86/mm pull request of changes for the Linux 7.3 kernel are fixes that reduce the time that the TLB flushing code has interrupts disabled. This helps significantly with latency-sensitive workloads but Intel engineer Dave Hansen noted in the pull reque"
date = "2026-08-22T09:57:36Z"
url = "https://www.phoronix.com/news/Linux-7.3-x86-mm-Latency"
author = "Michael Larabel"
text = ""
lastupdated = "2026-08-24T15:49:15.238037173Z"
seen = false
+++

The highlight of this week's x86/mm pull request of changes for the Linux 7.3 kernel are fixes that reduce the time that the TLB flushing code has interrupts disabled. This helps significantly with latency-sensitive workloads but Intel engineer Dave Hansen noted in the pull request that "it's certainly something to keep an eye on" in looking out for any regressions...