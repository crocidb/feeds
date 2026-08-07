+++
title = "[$] Buffer sizes for FUSE io_uring"
description = "The Filesystem in Userspace (FUSE) subsystem provides a way to service filesystem requests from a user-space server, which moves the format-handling code out of the kernel. The FUSE server can [use](https://www.kernel.org/doc/html/next"
date = "2026-08-03T16:05:10Z"
url = "https://lwn.net/Articles/1085618/"
author = "jake"
text = ""
lastupdated = "2026-08-06T09:52:34.758470693Z"
seen = false
+++

The [Filesystem in Userspace](https://docs.kernel.org/filesystems/fuse/) (FUSE) subsystem provides a way to service filesystem requests from a user-space server, which moves the format-handling code out of the kernel. The FUSE server can [use](https://www.kernel.org/doc/html/next/filesystems/fuse-io-uring.html) the [io\_uring](https://man7.org/linux/man-pages/man7/io_uring.7.html) facility for better performance, but Bernd Schubert is concerned that memory is being wasted because the current implementation has a single, large buffer size that is excessive for small I/O operations. He led a discussion on that topic in the filesystem track of the 2026 [Linux Storage, Filesystem, Memory Management, and BPF Summit](https://events.linuxfoundation.org/lsfmmbpf/) in Zagreb, Croatia.