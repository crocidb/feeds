---
title = "Writing JIT Compiler on the Plane"
description = "PlaneFeel free to join the discussion on HackerNews.Compilers always seemed a little bit like magic to me. You write the code in some language and then "
date = "2022-05-23T21:32:34Z"
url = "https://laplab.me/posts/writing-jit-compiler-on-the-plane/"
author = "Posts on Nikita Lapkov"
text = ""
lastupdated = "2025-10-22T08:59:06.991834148Z"
seen = true
---

![Plane](https://laplab.me/posts/writing-jit-compiler-on-the-plane/plane.webp)

>
>
> Feel free to join the [discussion on HackerNews](https://news.ycombinator.com/item?id=31493765).
>
>

Compilers always seemed a little bit like magic to me. You write the code in some language and then it spits out bitcode that a small crystall inside your computer understands.

Some databases ship with a specialized compiler inside them. This compiler can generate assembly code for parts of the query that are executed often. Such technique is called JIT compilation and can greatly reduce the interpretation overhead during query execution. The same technique is used in some virtual machines (for instance, JVM and Dart).