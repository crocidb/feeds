+++
title = "[$] Initiating writeback earlier"
description = "Writeback is the process of ensuring that dirty pages or folios in the page cache are flushed to the disk, so that changes to those files are made persistent. In a filesystem-track session at the 2026 [Linux Storage, Filesystem, Memory Management, and BPF Summit](https://events.l"
date = "2026-06-26T17:14:30Z"
url = "https://lwn.net/Articles/1078767/"
author = "jake"
text = ""
lastupdated = "2026-06-29T12:19:28.836440473Z"
seen = true
+++

Writeback is the process of ensuring that dirty pages or folios in the page cache are flushed to the disk, so that changes to those files are made persistent. In a filesystem-track session at the 2026 [Linux Storage, Filesystem, Memory Management, and BPF Summit](https://events.linuxfoundation.org/lsfmmbpf/), Jeff Layton wanted to discuss whether the writeback operation should be initiated earlier than it is today. The consensus seemed to be that it should be done earlier, but the path toward making that happen was less clear.