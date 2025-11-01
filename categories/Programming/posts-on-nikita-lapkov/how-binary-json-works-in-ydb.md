---
title = "How Binary JSON Works in YDB"
description = "BinaryJsonFeel free to join the discussion on HackerNews.In the early 2020 I was working in the Distributed Queries team of YDB. [YDB](https://ydb.tec"
date = "2022-06-08T13:04:25Z"
url = "https://laplab.me/posts/how-binary-json-works-in-ydb/"
author = "Posts on Nikita Lapkov"
text = ""
lastupdated = "2025-10-22T08:59:06.989661120Z"
seen = true
---

![BinaryJson](https://laplab.me/posts/how-binary-json-works-in-ydb/article-logo.webp)

>
>
> Feel free to join the [discussion on HackerNews](https://news.ycombinator.com/item?id=31766692).
>
>

In the early 2020 I was working in the Distributed Queries team of YDB. [YDB](https://ydb.tech/) is a Distributed SQL Database that combines high availability and scalability with strong consistency and ACID transactions. One of my key tasks there was to develop new storage format for JSON data. YDB recently became open source, so I can now share some interesting technical details behind this journey.