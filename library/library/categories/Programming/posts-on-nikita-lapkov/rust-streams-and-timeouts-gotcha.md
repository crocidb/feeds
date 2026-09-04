---
title = "Rust streams and timeouts gotcha"
description = "Imagine we have a list of paths to Parquet files on R2. We need to fetch Parquet footer of each file. However, we don’t know in advance whether we will need footers of all files and we want to avoid fetching extra.Rust has a streams abstraction. It is kind of like an iterator, bu"
date = "2025-05-27T00:00:00Z"
url = "https://laplab.me/posts/rust-streams-gotcha/"
author = "Posts on Nikita Lapkov"
text = ""
lastupdated = "2025-10-22T08:59:06.957981722Z"
seen = true
---

Imagine we have a list of paths to Parquet files on R2. We need to fetch Parquet footer of each file. However, we don’t know in advance whether we will need footers of all files and we want to avoid fetching extra.

Rust has a streams abstraction. It is kind of like an iterator, but with async operations permitted. Like iterators, streams are lazy - they don’t do anything unless explicitly polled. This sounds like it ticks all the boxes, so lets try to implement it: