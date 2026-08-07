+++
title = "Logstash as pluggable pipeline"
description = "Every Logstash pipeline has three stages, and each stage is a slot filled by plugins: the stage contract is fixed, the implementations are swappable. Inputs receive events (a file plugin, a beats plugin, kafka, http). Filters transform them — grok to parse, mutate to "
date = "2026-08-05T00:00:00Z"
url = "https://vlnn.dev/?stack=logstash-as-pluggable-pipeline"
author = "Generalistic writings from @vlnn"
text = ""
lastupdated = "2026-08-06T09:52:33.862470930Z"
seen = false
+++

Every Logstash pipeline has three stages, and each stage is a slot filled by plugins: the stage contract is fixed, the implementations are swappable. Inputs receive events (a `file` plugin, a `beats` plugin, `kafka`, `http`). Filters transform them — `grok` to parse, `mutate` to rename, `date`, `drop`. Outputs ship them onward, usually via the `elasticsearch` plugin.

So swapping files for Kafka, or Elasticsearch for S3, becomes a config change, not a rewrite. The value concentrates in the separate filter stage: turning unstructured lines into structured, queryable fields before they hit the index.

```test
Q: What are the three stages of every Logstash pipeline?
A: Inputs, filters, outputs — the stage contract is fixed, the plugin implementations are swappable.
Q: What does the pluggable design make of swapping file input for Kafka, or Elasticsearch output for S3?
A: A config change, not a rewrite.
Q: Where does the value of the pipeline concentrate?
A: In the filter stage — turning unstructured lines into structured, queryable fields before they hit the index.

```

Related
----------

* [grok](grok.md)
* [dissect](dissect.md)