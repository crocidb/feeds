---
title = "Counting Strings in C++: 30x Throughput Difference 💬"
description = "Some of the most common questions in programming interviews are about strings - reversing them, splitting, joining, counting, etc. These days, having to interview more and more developers across the whole spectrum, we see how vastly the solutions, even to the most straightforward"
date = "2023-05-09T00:00:00Z"
url = "https://ashvardanian.com/posts/count-unique-strings/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.364644056Z"
seen = true
---

Some of the most common questions in programming interviews are about strings - reversing them, splitting, joining, counting, etc. These days, having to interview more and more developers across the whole spectrum, we see how vastly the solutions, even to the most straightforward problems, differ depending on experience. Let’s imagine a test with the following constraints:

* You must find the first occurrence of every unique string in a non-empty array.
* You are only allowed to use the standard library, no other dependencies.
* You have 20 minutes.

In Python, the solution may look like this: