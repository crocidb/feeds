+++
title = "115: Both Sides of a Mirror Have Errors"
description = "I’m working on OpenZFS Mastery’s discussion of self-healing with a completely plugged ear, so I have no idea how this sounds. OpenZFS uses hashes almost everywhere. A hash is an algorithm that takes a chunk of data and computes a fixed-length string from it. The interesting thing"
date = "2026-03-19T09:18:07Z"
url = "https://mwl.io/archives/24604"
author = "Michael Lucas"
text = ""
lastupdated = "2026-05-08T14:12:54.058027534Z"
seen = true
+++

I’m working on [OpenZFS Mastery’s](https://sponsor.mwl.io) discussion of self-healing with a completely plugged ear, so I have *no* idea how this sounds.

>
>
>  OpenZFS uses hashes almost everywhere. A hash is an algorithm that takes a chunk of data and computes a fixed-length string from it. The interesting thing about a hash is that minor changes in the original data dramatically change the data’s hash. Each block of storage includes the hash of its parent block, while each parent block includes the hash of all its immediate children. Whenever the system accesses data, it verifies the data’s correctness using these hashes. Upon discovering an error, OpenZFS corrects or self-heals them. If the underlying VDEVs have redundancy, ZFS either reconstructs the damaged block from RAID-Z or grabs the intact copy from the mirror. If both sides of a mirror have errors, ZFS can recover the files so long as the same blocks are not bad on both disks. If the VDEV has no redundancy, but a dataset has extra copies of the data (see Chapter 4), ZFS uses those extra copies instead.
>
>

[OpenZFS Mastery is still open for sponsoring.](https://sponsor.mwl.io)