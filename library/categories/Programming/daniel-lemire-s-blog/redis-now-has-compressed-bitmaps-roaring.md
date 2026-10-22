+++
title = "Redis now has compressed bitmaps (Roaring)"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/10/redis-roaring-cover-150x150.jpg" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async"Red'
date = "2026-10-15T22:46:54Z"
url = "https://lemire.me/blog/2026/10/15/redis-now-has-compressed-bitmaps-roaring/"
author = "Daniel Lemire"
text = ""
lastupdated = "2026-10-21T11:46:11.323162009Z"
seen = false
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/10/redis-roaring-cover-150x150.jpg" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" loading="lazy">

[Redis](https://redis.io) is an in-memory database. Salvatore Sanfilippo started it in 2009, and it is now one of the most widely deployed pieces of server software. It is often used as a cache in front of a slower database.

You talk to it over the network with short text commands such as `SET user:42 "Alice"` and `GET user:42`. Each key maps to a value, and the value can be more than a string: Redis has lists, hashes, sets, sorted sets, streams and more, each with its own commands. 

We often represent sets of integers as bitmaps (or bitsets). The simplest bimtap is a single machine word of, say, 8 bits. It can be used to represent all sets of integers smaller than 8. By adding more words, you can represent sets of integers smaller than 16, or any value you like. You can then do fast operations over bitmaps such as intersections and unions. They translate into a few bit-wise operations such as AND, OR, XOR. 

Redis has supported bitmaps for a long time. You call `SETBIT key offset 1`, and Redis stores a plain bitmap inside an ordinary Redis string: bit *i* of the bitmap is bit *i* of the string. It is simple and fast. But the string takes one byte per eight bit positions, up to the largest offset you ever set, however many bits are actually set. Setting a single bit at offset four billion allocates 512 MB, and every `BITCOUNT` or `BITOP` has to scan all of it.

A compressed bitmap avoids this cost: it stores a set of integers in a form that takes little room when the set is sparse, and it computes counts, intersections and unions without decompressing. [Roaring](https://roaringbitmap.org) is probably the most widely used compressed bitmap format. Rather than compressing a long string of bits, Roaring adapts its storage to the data: sparse regions are stored as short lists of integers, dense regions as plain bitsets, and long stretches of consecutive values as runs. It is often both smaller and faster than an uncompressed bitset. Roaring is used by [many systems you already know](https://roaringbitmap.org): Elasticsearch, Apache Spark, ClickHouse …

Antonio Viggiano has brought Roaring into Redis itself. It should ship in Redis 8.12. There is a new type: `TYPE key` returns `bitmap` and `OBJECT ENCODING key` returns `bitmap-roaring`. It is opt-in: `CONFIG SET bitmap-default-roaring yes`.

I built Redis at the merge commit and ran the server on one core of an Intel Xeon Gold 6548N. For each workload, I create two bitmaps, `a` and `b`, once as strings and once as Roaring bitmaps, with the same content, and I time the commands. My workloads:

* *0.1% random*: 100,000 random ids out of 100 million (think: the users who used a given feature today);
* *50% random*: 50 million random ids out of 100 million;
* *runs*: ten runs of one million consecutive ids in a range of 100 million (think: cohorts of users who signed up in the same week);
* *hashed 32-bit ids*: 100,000 random 32-bit values, so the string is 512 MB.

![BITCOUNT](https://lemire.me/blog/wp-content/uploads/2026/10/redis-bitcount.webp)

![BITOP AND](https://lemire.me/blog/wp-content/uploads/2026/10/redis-bitop-and.webp)

![BITOP OR](https://lemire.me/blog/wp-content/uploads/2026/10/redis-bitop-or.webp)

You can see that Roaring can be much faster than a standard uncompressed bitmap in some cases. The hashed ids are even more compelling. The string must span all four billion bit positions, and each `BITOP` scans 512 MB. 

![BITOP AND, hashed ids](https://lemire.me/blog/wp-content/uploads/2026/10/redis-bitop-and-hashed.webp)

Compressed bitmaps like Roaring are not always better. There are many tradeoffs. But turning them on will soon take one configuration setting. [Check out the Roaring bitmap website for more information](https://roaringbitmap.org).