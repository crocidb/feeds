+++
title = "HNSW graphs"
description = "Hierarchical Navigable Small World graph is a data structure for nearest-neighbor search: in: query vector, out: k closest vectors out of millions (without comparing against all of them)Resolved with hierarchy: several linked layers with increasing density.`testQ: W"
date = "2026-08-05T00:00:00Z"
url = "https://vlnn.dev/?stack=hnsw-graphs"
author = "Generalistic writings from @vlnn"
text = ""
lastupdated = "2026-08-06T09:52:33.851152916Z"
seen = false
+++

Hierarchical Navigable Small World graph is a data structure for nearest-neighbor search:

* **in**: query vector,
* **out**: `k` closest vectors out of millions (without comparing against all of them)

Resolved with hierarchy: several linked layers with increasing density.

```test
Q: What goes in and what comes out of an HNSW search?
A: In: a query vector. Out: the `k` closest vectors out of millions, without comparing against all of them.
Q: How does HNSW avoid comparing the query against every vector?
A: Hierarchy — several linked layers with increasing density.

```