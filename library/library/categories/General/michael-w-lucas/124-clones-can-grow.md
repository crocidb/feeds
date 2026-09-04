+++
title = "124: Clones Can Grow"
description = "I’m writing about space usage OpenZFS Mastery. ZFS offers tools to transparently increase the amount of data you can fit on a disk. Rather than requiring the system administrator to compress and decompress individual files, ZFS uses efficient compression at the filesystem level. "
date = "2026-08-13T11:02:58Z"
url = "https://mwl.io/archives/24951"
author = "Michael Lucas"
text = ""
lastupdated = "2026-08-24T15:49:16.009313151Z"
seen = false
+++

I’m writing about space usage [OpenZFS Mastery](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/).

>
>
> ZFS offers tools to transparently increase the amount of data you can fit on a disk. Rather than requiring the system administrator to compress and decompress individual files, ZFS uses efficient compression at the filesystem level. While compressing logs during rotation makes the files look smaller in ls(1), it doesn’t change how many disk blocks those logs use. Snapshots and clones let you duplicate entire datasets with only a tiny amount of space. ZFS can also perform deduplication of files, improving disk usage at the cost of memory. We’ll see how to evaluate these options and determine when to use each.
>
>
>
> If ZFS is so transparent, why is space usage complicated? Child datasets affect their parents. Those space-efficient clones can grow, and snapshots can prevent freeing space.
>
>

[I’d appreciate your help keeping the lights on while I finish this book.](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/)