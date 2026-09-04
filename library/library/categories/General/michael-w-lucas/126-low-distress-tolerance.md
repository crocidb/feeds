+++
title = "126: Low Distress Tolerance"
description = "I finished the OpenZFS Mastery chapter on volumes earlier this week. Zvols support sparse volumes, also known as thin provisioning or overcommitting storage. A sparse volume is a volume that reserves less space than the volume actually needs. Sparse volumes permit allocating more"
date = "2026-08-27T10:05:20Z"
url = "https://mwl.io/archives/24961"
author = "Michael Lucas"
text = ""
lastupdated = "2026-09-01T19:33:13.912210420Z"
seen = false
+++

I finished the [OpenZFS Mastery](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/) chapter on volumes earlier this week.

>
>
> Zvols support sparse volumes, also known as thin provisioning or overcommitting storage. A sparse volume is a volume that reserves less space than the volume actually needs. Sparse volumes permit allocating more space than the pool has available. You could, for example, create ten 1-exabyte sparse volumes on your 1 TiB dataset. So long as your volumes are never heavily used, nobody will notice that you’re overcommitted. Sparse volumes can be useful if you’re prepared to add more disks. Using a sparse volume means you can tell the Windows host that a disk is a specific large size, even if the underlying pool doesn’t have that much free space.
>
>
>
> Sparse volumes are not generally recommended. If the pool fills up but the sparse volumes think they have space remaining, writes will fail with an “out of space” error. Guests will get errors they can’t hope to resolve. Windows in particular has low distress tolerance.
>
>

[I’d appreciate your support keeping the rats fed as I finish writing this book.](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/)