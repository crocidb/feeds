---
title = "Scaling Elections with GPUs and Mojo 🔥"
description = "Last summer, me, Chris Lattner, and a bunch of other people across the industry gathered together for a GPU-programming hackathon at the AGI House in San Francisco. After one too many LLM optimizations, I decided to accelerate something nobody asked for!Most elections use simple "
date = "2025-10-28T00:00:00Z"
url = "https://ashvardanian.com/posts/scaling-elections/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-28T15:53:09.978730434Z"
seen = true
---

Last summer, me, Chris Lattner, and a bunch of other people across the industry gathered together for a GPU-programming hackathon at the AGI House in San Francisco. After one too many LLM optimizations, I decided to accelerate something nobody asked for!

Most elections use simple plurality voting — whoever gets the most votes wins. But there are “fairer” methods that consider ranked preferences, like the Schulze method used by Wikimedia Foundation, Debian, and pirate parties worldwide. The catch? It scales $O(n³)$ with the number of candidates.