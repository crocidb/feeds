---
title = "USearch Molecules: 28 Billion Chemical Embeddings on AWS ⚗️"
description = "TLDR: I’ve finally finished a project that involved gathering 7 billion small molecules, each represented in SMILES notation and having fewer than 50 “heavy” non-hydrogen atoms. Those molecules were “fingerprinted”, producing 28 billion structural embeddings, using MACCS, Pub"
date = "2023-11-20T00:00:00Z"
url = "https://ashvardanian.com/posts/usearch-molecules/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.344782380Z"
seen = true
---

>
>
> TLDR: I’ve finally finished a project that involved gathering 7 billion small molecules, each represented in SMILES notation and having fewer than 50 “heavy” non-hydrogen atoms. Those molecules were “fingerprinted”, producing 28 billion structural embeddings, using MACCS, PubChem, ECFP4, and FCFP4 techniques. These embeddings were indexed using [Unum’s](https://unum.cloud) open-source tool [USearch](https://github.com/unum-cloud/usearch), to accelerate molecule search. This extensive dataset is now made available globally for free, thanks to a partnership with [AWS Open Data](https://registry.opendata.aws/usearch-molecules/). You can find the complete data sheet and scripts for data visualization on [GitHub](https://github.com/ashvardanian/usearch-molecules).
>
>