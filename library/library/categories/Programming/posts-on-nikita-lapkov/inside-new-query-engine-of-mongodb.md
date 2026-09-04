---
title = "Inside New Query Engine of MongoDB"
description = "SBE Article logoDiscussion on HackerNews and Lobsters.MongoDB has recently [releas"
date = "2023-09-18T00:00:00Z"
url = "https://laplab.me/posts/inside-new-query-engine-of-mongodb/"
author = "Posts on Nikita Lapkov"
text = ""
lastupdated = "2025-10-22T08:59:06.979485170Z"
seen = true
---

![SBE Article logo](https://laplab.me/posts/inside-new-query-engine-of-mongodb/article-logo.webp)

>
>
> Discussion on [HackerNews](https://news.ycombinator.com/item?id=37562942) and [Lobsters](https://lobste.rs/s/vbngne/inside_new_query_engine_mongodb).
>
>

MongoDB has recently [released](https://youtu.be/f3x5GzmlxNE) a new query engine coming in version 7.0. I was one of the people working on this engine during my 2 years in MongoDB and I would like to share some technical details about it.

**Disclaimer:** Prior to writing this article, I have contacted my ex-colleagues at MongoDB to ensure that it does not conflict with their plans. They gave me the green light, provided I send them the draft before publishing, which I did. They did not have any notes on it.