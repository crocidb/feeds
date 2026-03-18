---
title = "Parsing JSON in C & C++: Singleton Tax"
description = "I’d argue that almost every open-source developer gets an extra spark of joy when someone reads the documentation and uses their tool in a way that goes beyond the classic 101 examples. It’s a rare treat even for popular projects like JSON pa"
date = "2025-01-07T00:00:00Z"
url = "https://ashvardanian.com/posts/parsing-json-with-allocators-cpp/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.327754677Z"
seen = true
---

I’d argue that almost every open-source developer gets an extra spark of joy when someone reads the documentation and uses their tool in a way that goes beyond the classic 101 examples. It’s a rare treat even for popular projects like [JSON](https://en.wikipedia.org/wiki/JSON) parsers, but if you are building high-throughput software, such as [analyzing millions of network packets per second](https://news.ycombinator.com/item?id=35042316), you’ll have to dig deeper.

The first thing I generally check in such libraries is the memory usage pattern and whether I can override the default memory allocator. It is the most common singleton of them all!