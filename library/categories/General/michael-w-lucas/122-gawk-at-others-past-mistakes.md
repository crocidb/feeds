+++
title = "122: Gawk at Others’ Past Mistakes"
description = "OpenZFS Mastery is starting to pick up momentum. Don’t look at it too closely. You might scare it. First, note how ridiculously wide this VDEV is. A fourteen-disk VDEV will have suboptimal performance and experience slow death by fragmentation. Also, the devices were named badly."
date = "2026-07-23T12:05:54Z"
url = "https://mwl.io/archives/24905"
author = "Michael Lucas"
text = ""
lastupdated = "2026-07-23T22:52:35.228199345Z"
seen = false
+++

[OpenZFS Mastery](https://mwl.io/sponsor) is starting to pick up momentum. Don’t look at it too closely. You might scare it.

>
>
>  First, note how ridiculously wide this VDEV is. A fourteen-disk VDEV will have suboptimal performance and experience slow death by fragmentation. Also, the devices were named badly. Now that drives have failed, it matters. But we’re not here to gawk at others’ past mistakes—uh, learning experiences. We’re looking at hardware failures.
>
>
>
> This RAID-Z2 pool is in a degraded state. It’s missing not one but two disks. One of the drives showed a red light and was removed. The other failed silently. A RAID-Z2 VDEV can handle up to two disk failures. This pool has lost all redundancy. One more disk failure will destroy the pool. A pool without redundancy cannot self-heal, so if a file suffers bit rot, it will not be corrected. This pool is very vulnerable.
>
>

[I’d appreciate your support while writing this silly thing.](https://mwl.io/sponsor)