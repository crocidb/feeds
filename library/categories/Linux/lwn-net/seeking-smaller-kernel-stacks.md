+++
title = "[$] Seeking smaller kernel stacks"
description = "Memory has always been a scarce resource in computing systems, but the problem seems to have worsened recently. In particular, the worldwide shortage of memory chips has led to a renewed focus by systems developers on reducing memory usage. During the memory-management microconfe"
date = "2026-10-23T14:59:24Z"
url = "https://lwn.net/Articles/1100271/"
author = "corbet"
text = ""
lastupdated = "2026-10-27T22:33:08.849629155Z"
seen = false
+++

Memory has always been a scarce resource in computing systems, but the problem seems to have worsened recently. In particular, the worldwide shortage of memory chips has led to a renewed focus by systems developers on reducing memory usage. During the memory-management microconference at the 2026 [Linux Plumbers Conference](https://lpc.events/), Will Deacon discussed one specific consumer of memory that is being re-examined: kernel stacks.