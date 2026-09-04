+++
title = "125: A Useful Quirk"
description = "I’m trying to finish up the OpenZFS Mastery chapter on disk space use today. Well, my part of it. I’m planning to dump–delegate, delegate–the section on deduplication to Allan. When you have a co-author expert, use them. Zstd offers compression levels from 1 to 19. The default is"
date = "2026-08-20T11:38:17Z"
url = "https://mwl.io/archives/24958"
author = "Michael Lucas"
text = ""
lastupdated = "2026-08-24T15:49:16.006386703Z"
seen = false
+++

I’m trying to finish up the [OpenZFS Mastery](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/) chapter on disk space use today. Well, my part of it. I’m planning to dump–delegate, *delegate*–the section on deduplication to Allan. When you have a co-author expert, use them.

>
>
> Zstd offers compression levels from 1 to 19. The default is zstd-3, a reasonable compromise between performance and efficiency. Writing data at higher compression levels require more CPU but might save more space. Zstd has a useful quirk where decompressing higher levels uses no more processing power than decompressing lower levels. If you have data that must be written once but read many times, increasing the compression level makes sense.
>
>
>
> ZFS still supports gzip compression, but Zstd is always faster and achieves better results while using less processor and memory.
>
>
>
> ZFS also offers the ZLE algorithm, for data with long runs of zeroes. Some file formats, such as GIFs and certain scientific data, include long runs of zeroes. If you have a dataset for such data, you might find ZLE compression useful.
>
>

How does one realistically tell if your data has long runs of zeroes? The simplest way I know is to pass it across a T1 with 23 channels set to b8zs but one channel stuck on AMI. Such a circuit cannot pass large all-zero packets. Sadly, this recommendation does not suit a book on filesystems.

[I would appreciate your help keeping the lights on as I finish this book.](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/)