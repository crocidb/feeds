---
title = "Databases = Frameworks for Distributed Systems"
description = "Title imageThis article was originally posted on dev.to, but it turns out that HackerNews banned this website, so "
date = "2022-05-21T11:08:13Z"
url = "https://laplab.me/posts/databases-are-frameworks-for-distributed-systems/"
author = "Posts on Nikita Lapkov"
text = ""
lastupdated = "2025-10-22T08:59:06.994106235Z"
seen = true
---

![Title image](https://laplab.me/posts/databases-are-frameworks-for-distributed-systems/ship.webp)

>
>
> This article was originally [posted on dev.to](https://dev.to/laplab/databases-frameworks-for-distributed-systems-29bo), but it turns out that HackerNews banned this website, so I decided to create my own.
>
>

>
>
> Feel free to join the [discussion on HackerNews](https://news.ycombinator.com/item?id=31459745).
>
>

Lego of the database world
----------

It is quite common for a distributed database to have the following components:

* **Distributed Storage** Usually, this component has an interface of a key-value store: `Get(key)` and `Set(key, value)`, where `key` and `value` are some binary strings. This component knows nothing about the data - it can be rows from the table, JSON documents or something else entirely. Usually, this component provides guarantee of “durability”, meaning that data will not be lost in some failure scenario. A common example of such scenario is “less than half of the servers are down”.