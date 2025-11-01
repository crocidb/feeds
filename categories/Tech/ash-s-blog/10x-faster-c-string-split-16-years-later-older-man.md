---
title = "10x Faster C++ String Split, 16 Years Later 👴🏻"
description = "It’s 2025. Sixteen years ago, someone asked on StackOverflow how to split a string in C++. With 3000 upvotes, you might think this question has been definitively answered. However, the prov"
date = "2025-01-02T00:00:00Z"
url = "https://ashvardanian.com/posts/splitting-strings-cpp/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.330372632Z"
seen = true
---

It’s 2025. Sixteen years ago, someone [asked on StackOverflow how to split a string in C++](https://stackoverflow.com/questions/236129/how-do-i-iterate-over-the-words-of-a-string/). With 3000 upvotes, you might think this question has been definitively answered. However, the provided solutions can be greatly improved in terms of both flexibility and performance, yielding up to a 10x speedup.

![Splitting Strings in C++](https://ashvardanian.com/splitting-strings-cpp/splitting-strings-cpp.jpg)

In this post, we’ll explore three better ways to split strings in C++, including a solution I briefly mentioned in 2024 as [part](https://ashvardanian.com/posts/painful-strings/#split-and-search-lazy-ranges) of a longer review of the [Painful Pitfalls of C++ STL Strings](https://ashvardanian.com/posts/painful-strings).