+++
title = "[$] Merging famfs?"
description = "The famfs filesystem, which is meant to provide shared access to huge memory-resident files on CXL and other devices, ret"
date = "2026-07-20T13:15:47Z"
url = "https://lwn.net/Articles/1082687/"
author = "jake"
text = ""
lastupdated = "2026-07-21T09:19:52.330353316Z"
seen = false
+++

The [famfs filesystem](https://github.com/cxl-micron-reskit/famfs#famfs-shared-memory-filesystem-framework---user-space-repo), which is meant to provide shared access to huge memory-resident files on [CXL](https://en.wikipedia.org/wiki/Compute_Express_Link) and other devices, returned to the [Linux Storage, Filesystem, Memory Management, and BPF Summit](https://events.linuxfoundation.org/lsfmmbpf/) (LSFMM+BPF) in 2026. It was [first discussed at LSFMM+BPF 2024](https://lwn.net/Articles/983105/) and a [new implementation was described at the 2025 gathering](https://lwn.net/Articles/1020170/), but it still has not made its way into the kernel; LWN [looked at a discussion about merging famfs](https://lwn.net/Articles/1068686/) back in April 2026.