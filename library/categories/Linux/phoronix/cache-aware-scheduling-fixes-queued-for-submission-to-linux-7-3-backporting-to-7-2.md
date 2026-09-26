+++
title = "Cache Aware Scheduling Fixes Queued For Submission To Linux 7.3, Backporting To 7.2"
description = "Later this week it looks like the latest round of Cache Aware Scheduling fixes will be merged for enhancing this kernel scheduler functionality for grouping related tasks together on CPU cores that share the same last level cache (LLC). Cache Aware Scheduling can lead to better c"
date = "2026-09-22T10:32:45Z"
url = "https://www.phoronix.com/news/Linux-7.3-CAS-Fixes-Coming"
author = "Michael Larabel"
text = ""
lastupdated = "2026-09-23T18:24:55.019417488Z"
seen = false
+++

Later this week it looks like the latest round of Cache Aware Scheduling fixes will be merged for enhancing this kernel scheduler functionality for grouping related tasks together on CPU cores that share the same last level cache (LLC). Cache Aware Scheduling can lead to better cache locality and lower latency by avoiding the costs of potential cache bouncing -- that is when bugs don't get in the way...