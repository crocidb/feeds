+++
title = "118: Several Thousand Minor Details"
description = "I’m not back at work full-time, but I am starting back and paging the OpenZFS Mastery manuscript back into my skull’s RAM. Here’s a tidbit. Compression is a key feature of OpenZFS. A computer has four classic bottlenecks: CPU, memory, disk I/O, and network. CPU cycles are the mos"
date = "2026-06-25T10:37:05Z"
url = "https://mwl.io/archives/24871"
author = "Michael Lucas"
text = ""
lastupdated = "2026-06-29T12:19:25.737393092Z"
seen = true
+++

I’m not back at work full-time, but I am starting back and paging the [OpenZFS Mastery](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/) manuscript back into my skull’s RAM. Here’s a tidbit.

>
>
> Compression is a key feature of OpenZFS. A computer has four classic bottlenecks: CPU, memory, disk I/O, and network. CPU cycles are the most plentiful in modern computers, while disk I/O and memory are much more constrained. Footnote This paragraph is being written on a machine with a 96-core CPU, and all but two of them are bored stupid. By compressing data before breaking it up into blocks, OpenZFS can store more data on each block. Similarly, compressing data before it goes into the kernel’s cache reduces memory usage. We’ll discuss tuning compression methods for particular situations, but the defaults work for almost everyone.
>
>
>
> Now that you know the bare basics of ZFS, the rest of this book merely fills in several thousand minor details.
>
>

[OpenZFS Mastery sponsorships are still open.](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/)