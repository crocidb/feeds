+++
title = "Inverted Index"
description = 'tokenizing and rotating the index:doc1: "the quick brown fox"doc2: "the lazy dog"doc3: "quick dog"becomesbrown → [1]dog   → [2, 3]fox   → [1]lazy  → [2]quick → [1, 3]the   → [1, 2]'
date = "2026-08-05T00:00:00Z"
url = "https://vlnn.dev/?stack=inverted-index"
author = "Generalistic writings from @vlnn"
text = ""
lastupdated = "2026-08-06T09:52:33.854163434Z"
seen = false
+++

tokenizing and rotating the index:

```
doc1: "the quick brown fox"
doc2: "the lazy dog"
doc3: "quick dog"

```

becomes

```
brown → [1]
dog   → [2, 3]
fox   → [1]
lazy  → [2]
quick → [1, 3]
the   → [1, 2]

```