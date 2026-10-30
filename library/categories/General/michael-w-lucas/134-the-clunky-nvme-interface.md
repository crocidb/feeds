+++
title = "134: The Clunky NVMe Interface"
description = "One PHP Apocalypse later, here’s OpenZFS Mastery on NVMe. The slowest, most complicated, and most error-prone part of an SSD is the Flash Translation Layer. Pretending to be as stupid as a 1980s spinning disk is hard labor. Non-Volatile Memory Express (NVMe) uses very similar har"
date = "2026-10-22T17:21:36Z"
url = "https://mwl.io/archives/25019"
author = "Michael Lucas"
text = ""
lastupdated = "2026-10-27T22:33:11.047153915Z"
seen = false
+++

One PHP Apocalypse later, here’s [OpenZFS Mastery](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/) on NVMe.

>
>
> The slowest, most complicated, and most error-prone part of an SSD is the Flash Translation Layer. Pretending to be as stupid as a 1980s spinning disk is hard labor. Non-Volatile Memory Express (NVMe) uses very similar hardware but drops this clumsy pretense, instead offering an interface designed for fast flash memory. NVMe itself is a physical interface specification like SATA or SCSI/SAS, but designed for extremely fast access.
>
>
>
> Where spindles and SSDs have one queue per disk, NVMe allows 65,536 queues per device, of 65,536 commands each. Most NVMe drives use one read and one write queue per CPU. By spreading the load across CPUs, NVMe queues can be kept relatively shallow, allowing high-priority tasks fast responses and boosting general performance. The NVMe interface requires less locking while providing far greater parallelism and performance.
>
>

Still grinding to get a first draft done before my shoulder surgery next month. [I’d appreciate your support.](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/)