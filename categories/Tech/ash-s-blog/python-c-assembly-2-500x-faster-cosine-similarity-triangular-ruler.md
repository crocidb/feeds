---
title = "Python, C, Assembly - 2'500x Faster Cosine Similarity 📐"
description = "In this fourth article of the “Less Slow” series, I’m accelerating Unum’s open-source Vector Search primitives used by some great database and cloud providers to replace Meta’s [FAISS](https://github.com"
date = "2023-10-30T00:00:00Z"
url = "https://ashvardanian.com/posts/python-c-assembly-comparison/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.348605598Z"
seen = true
---

[In this fourth article of the “Less Slow” series](https://ashvardanian.com/tags/less-slow/), I’m accelerating [Unum’s open-source Vector Search primitives](https://github.com/unum-cloud) used by some great database and cloud providers to replace Meta’s [FAISS](https://github.com/facebookresearch/faiss) and scale-up search in their products. This time, our focus is on the most frequent operation for these tasks - computing the the Cosine Similarity/Distance between two vectors. It’s so common, even doubling it’s performance can have a noticeable impact on applications economics. But compared to a pure Python baseline our **single-threaded performance grew by a factor of 2'500x**. Let’s go through optimizations one by one: