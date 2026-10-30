+++
title = "133: Cleverness Is Your Only Option"
description = "Here’s a tidbit of OpenZFS Mastery about replication. Replication also greatly simplifies migrating data, even huge amounts of data over ridiculous distances. With enough data, even 40-gigabit Ethernet in the same datacenter seems slow! Maybe you have to migrate a massive dataset"
date = "2026-10-16T14:13:39Z"
url = "https://mwl.io/archives/25014"
author = "Michael Lucas"
text = ""
lastupdated = "2026-10-27T22:33:11.048435660Z"
seen = false
+++

Here’s a tidbit of [OpenZFS Mastery](https://mwl.io/sponsor) about replication.

>
>
> Replication also greatly simplifies migrating data, even huge amounts of data over ridiculous distances. With enough data, even 40-gigabit Ethernet in the same datacenter seems slow! Maybe you have to migrate a massive dataset to the other side of the country, or across the planet. Suppose you have many tebibytes of data undergoing constant minor churn, such as an orders database for a busy ecommerce site. Copying that data across the country or around the world will take days—but by then, the data will have changed. An rsync-based replication process takes so long that it will probably never catch up. Your database administrators are smart folks, and probably can brew up with a clever migration plan with complicated data segmentation. “Clever” is a bad word in system administration but sometimes, cleverness is your only option. These plans increase risk and even when successful impose frustration and stress. When they go wrong, they go wrong big.
>
>

I’m pushing to get a first draft done by the middle of the next month, before my shoulder surgery leaves me unable to work until the end of the year.[ Your support would be appreciated.](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/)