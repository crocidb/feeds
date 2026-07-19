+++
title = "121: Possibilities Multiply"
description = "OpenZFS Mastery is starting to roll lunch again. Hoping to get some intertia with it. But create a dataset for each team, and give each site its own dataset within that parent dataset, and possibilities multiply. A team needs a copy of a web site for testing? Clone it. With tradi"
date = "2026-07-16T20:33:30Z"
url = "https://mwl.io/archives/24901"
author = "Michael Lucas"
text = ""
lastupdated = "2026-07-18T14:48:04.122091490Z"
seen = false
+++

[OpenZFS Mastery](https://mwl.io/sponsor) is starting to roll lunch again. Hoping to get some intertia with it.

>
>
> But create a dataset for each team, and give each site its own dataset within that parent dataset, and possibilities multiply. A team needs a copy of a web site for testing? Clone it. With traditional filesystems, you’d have to copy the whole site directory, doubling the space used and taking much, much longer. Clones use only the amount of space for the differences between the datasets and can be created instantaneously. When the team is about to deploy a new version of a site but wants a backup of the old site, they can create a snapshot. This new site probably uses a whole bunch of the same files as the old one, so you’ll reduce disk space usage. When the deployment inevitably goes horribly wrong, they can restore the old version by reverting to the snapshot. A particular web site needs filesystem-level performance tweaks, or compression, or some locally created property? Set it for that site. When you must change a ZFS property on all of the sites, make the change to the parent dataset and let the children inherit it.
>
>

[OpenZFS Mastery is yet again open for sponsorships. ](https://mwl.io/sponsor)Just like yesterday, and last month, and seemingly forever.