+++
title = "131: Lucas is Incompetent or Evil"
description = "Folks sometimes forget that OpenZFS Mastery has a co-author. Here’s a bit Allan Jude originally wrote. But what if Lucas is incompetent or evil? You give him access to take his own snapshots and he will try to create a million “just to see what would happen.” You know people like"
date = "2026-10-01T09:14:32Z"
url = "https://mwl.io/archives/24997"
author = "Michael Lucas"
text = ""
lastupdated = "2026-10-01T11:34:02.777874838Z"
seen = true
+++

Folks sometimes forget that [OpenZFS Mastery](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/) has a co-author. Here’s a bit Allan Jude originally wrote.

>
>
>  But what if Lucas is incompetent or evil? You give him access to take his own snapshots and he will try to create a million “just to see what would happen.” You know people like that.
>
>
>
> ZFS has your back when dealing with these difficult users. The snapshot\_limit and filesystem\_limit properties allow you to restrict the number of snapshots or child filesystems that can be created under a dataset. Set these properties to one greater than the number of snapshots or datasets you want the user to create. If you set snapshot\_limit to 10, the user can create nine snapshots. The tenth generates an error. The read-only filesystem\_count and snapshot\_count properties allow you to quickly see how many filesystems or snapshots exist, and compare that number to the limit. To contain the pure evil that is Lucas, here we restrain him to only two snapshots.
>
>

[OpenZFS Mastery](https://www.tiltedwindmillpress.com/product/openzfs-sponsor/) is looking for sponsors, and the [Twisted Presents Kickstarter](https://www.kickstarter.com/projects/mwlucas/twisted-presents) is open for a couple more days.