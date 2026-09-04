---
title = "The Painful Pitfalls of C++ STL Strings 🧵"
description = "Criticizing software is easy, yet the C++ and C standard libraries have withstood the test of time admirably. Nevertheless, they are not perfect. Especially the <string, <string_view, and <string.hheaders. The first two alone bring in [over 20,000 lines of code](https:/"
date = "2024-02-12T00:00:00Z"
url = "https://ashvardanian.com/posts/painful-strings/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.342828201Z"
seen = true
---

Criticizing software is easy, yet the C++ and C standard libraries have withstood the test of time admirably. Nevertheless, they are not perfect. Especially the `<string>`, `<string_view>`, and `<string.h>` headers. The first two alone bring in [over 20,000 lines of code](https://artificial-mind.net/projects/compile-health/), slowing the compilation of every translation unit by over 100 milliseconds. Most of that code seems **dated, much slower than LibC, and equally error-prone**, with interfaces that are very hard to distinguish.