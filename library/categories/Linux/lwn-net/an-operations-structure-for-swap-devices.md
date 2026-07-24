+++
title = "[$] An operations structure for swap devices"
description = "One of the ideas raised at the 2026 Linux Storage, Filesystem, Memory Management, and BPF Summit (LSFMM+BPF) was the creation of an operations structure for the s"
date = "2026-07-23T14:25:40Z"
url = "https://lwn.net/Articles/1083094/"
author = "corbet"
text = ""
lastupdated = "2026-07-23T22:52:44.008584365Z"
seen = false
+++

One of the ideas raised at the [2026 Linux Storage, Filesystem, Memory Management, and BPF Summit](https://lwn.net/Articles/lsfmmbpf2026/) (LSFMM+BPF) was the creation of [an operations structure](<https://lwn.net/Articles/1072657/#:~:text=Abstracting the swap backend>) for the swap subsystem. Like many parts of the kernel, the swap layer evolved over time, with pieces being added as needed; the end result of this evolution is rarely what one would expect had the subsystem been designed today. The interface between the swap layer and the devices it uses is just one example. It appears that one result of the swap subsystem's evolution — the lack of an abstraction layer to interface with underlying storage — will soon be addressed, but in a different way than was initially envisioned.