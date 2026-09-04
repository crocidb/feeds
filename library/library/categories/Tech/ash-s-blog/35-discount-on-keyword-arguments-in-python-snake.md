---
title = "35% Discount on Keyword Arguments in Python 🐍"
description = "Python has a straightforward syntax for positional and keyword arguments. Positional arguments are arguments passed to a function in a specific order, while keyword arguments are passed to a function by name. Surprising to most Python developers, the choice of positional vs keywo"
date = "2024-09-08T00:00:00Z"
url = "https://ashvardanian.com/posts/discount-on-keyword-arguments-in-python/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.339223061Z"
seen = true
---

Python has a straightforward syntax for positional and keyword arguments. Positional arguments are arguments passed to a function in a specific order, while keyword arguments are passed to a function by name. Surprising to most Python developers, the choice of positional vs keyword arguments can have huge implications on readability **and performance**.

![35% Discount on Keyword Arguments in Python by Ash Vardanian](https://ashvardanian.com/discount-on-keyword-arguments-in-python/Discount-on-Keyword-Arguments-in-Python-with-Comments.jpg)

Let’s take the `cdist` interface as an example. It’s a function implemented in [SimSIMD](https://github.com/ashvardanian/simsimd?tab=readme-ov-file#many-to-many-all-pairs-distances), mimicking [SciPy](https://docs.scipy.org/doc/scipy/reference/generated/scipy.spatial.distance.cdist.html), that computes all pairwise distances between two sets of points, each represented by a matrix. It accepts up to 6 arguments: