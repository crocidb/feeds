+++
title = "137: Paired with a Ghost"
description = "Here’s a snippet of OpenZFS Mastery on the Adaptive Replacement Cache. The ARC also caches files that have been recently read from disk. Instead of a single list, the ARC has multiple lists. One is the Most Recently Used, or MRU, list, tracking accessed filesystem blocks much lik"
date = "2026-11-12T08:12:05Z"
url = "https://mwl.io/archives/25049"
author = "Michael Lucas"
text = ""
lastupdated = "2026-11-19T14:05:14.482784010Z"
seen = false
+++

Here’s a snippet of [OpenZFS Mastery](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/) on the Adaptive Replacement Cache.

>
>
>  The ARC also caches files that have been recently read from disk. Instead of a single list, the ARC has multiple lists. One is the Most Recently Used, or MRU, list, tracking accessed filesystem blocks much like the buffer cache. The second is the Most Frequently Used (MFU) list, tracking filesystem blocks that get used regularly.  
>  The addition of the MFU list reduces the impact of cache-thrashing processes like the hypothetical backup job. Scanning the entire pool still purges the MRU list, but doesn’t affect the MFU list. Scanning a block once to back it up is not “frequent.” The most frequently used files remain cached in memory. The backup still impacts disk I/O, reducing write performance, but the system serves the most popular files from the copy cached in memory.
>
>
>
> Each list is paired with a ghost list, which contains the information about blocks that have been recently evicted from each of the lists. When the MRU or MFU lists fill up, the blocks at the bottom of the list fall off. By tracking blocks dropped from the caches, the ARC can prevent a block from constantly cycling in and out of the cache.
>
>

The book is out for a preliminary tech review, [but if you sponsor now you’ll get a PDF of the incomplete uncorrected work in progress](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/).