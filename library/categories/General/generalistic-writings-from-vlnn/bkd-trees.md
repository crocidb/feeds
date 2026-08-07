+++
title = "BKD trees"
description = 'Block K-D tree — a disk-friendly variant of the k-d tree: classic k-d tree has one point per leaf — terrible for disk, \~100 bytes are stored in \~4KB disk block. The BKD variant packs points into large leaf blocks(512–1024 points in [Lucen'
date = "2026-08-05T00:00:00Z"
url = "https://vlnn.dev/?stack=bkd-trees"
author = "Generalistic writings from @vlnn"
text = ""
lastupdated = "2026-08-06T09:52:33.834130176Z"
seen = false
+++

**B**lock **K-D** tree — a disk-friendly variant of the [k-d tree](k-d-tree.md): classic [k-d tree](k-d-tree.md) has one point per leaf — terrible for disk, \~100 bytes are stored in \~4KB disk block. The BKD variant packs points into large leaf *blocks*(512–1024 points in [Lucene](lucene.md))

```test
Q: Why is a classic k-d tree terrible for disk?
A: One point per leaf — ~100 bytes stored in a ~4KB disk block.
Q: How does a BKD tree fix that?
A: It packs points into large leaf blocks — 512–1024 points per block in Lucene.

```

Related
----------

* [K-d Tree](k-d-tree.md)