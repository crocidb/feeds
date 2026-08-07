+++
title = "Lucene"
description = "Lucene is a Java library for full-text search, which is used by Elasticsearch, Apache Solr, Opensearch.The main staple is the immutability: A Lucene index is a collection of segments, and a segment, once written, is never modified. N"
date = "2026-08-05T00:00:00Z"
url = "https://vlnn.dev/?stack=lucene"
author = "Generalistic writings from @vlnn"
text = ""
lastupdated = "2026-08-06T09:52:33.865758008Z"
seen = false
+++

[Lucene](lucene.md) is a Java library for full-text search, which is used by Elasticsearch, Apache Solr, Opensearch.

The main staple is the [immutability](immutability.md): A [Lucene](lucene.md) index is a collection of *segments*, and a segment, once written, is never modified. No insert means better compression and no cache invalidation.

```test
Q: What is Lucene and who builds on it?
A: A Java library for full-text search, used by Elasticsearch, Apache Solr and OpenSearch.
Q: What is the main staple of a Lucene index?
A: Immutability — the index is a collection of segments, and a segment, once written, is never modified.
Q: What does segment immutability buy?
A: Better compression and no cache invalidation.

```

Related
----------

* [Immutability](immutability.md)