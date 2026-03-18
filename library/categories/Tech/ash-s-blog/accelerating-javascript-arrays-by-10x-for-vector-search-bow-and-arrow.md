---
title = "Accelerating JavaScript arrays by 10x for Vector Search 🏹"
description = "You’ve probably heard about AI a lot this year. Lately, there’s been talk about something called Retrieval Augmented Generation (RAG). Unlike a regular chat with Cha"
date = "2023-10-21T00:00:00Z"
url = "https://ashvardanian.com/posts/javascript-ai-vector-search/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.352849964Z"
seen = true
---

You’ve probably heard about AI a lot this year. Lately, there’s been talk about something called [Retrieval Augmented Generation](https://towardsdatascience.com/retrieval-augmented-generation-intuitively-and-exhaustively-explain-6a39d6fe6fc9) (RAG). Unlike a regular chat with ChatGPT, RAG lets ChatGPT search through a database for helpful information. This makes the conversation better and the answers more on point.

![RAG Design](https://ashvardanian.com/javascript-ai-vector-search/rag.jpeg)

Usually, a Vector Search engine is used as the database. It’s good at finding similar data points in a big pile of data. These data points are often at least 256-dimensional, meaning they have many `Number`-s. If you use JavaScript, you might wonder whether to use the built-in `Array` type or the more specialized `TypedArray` for this job.