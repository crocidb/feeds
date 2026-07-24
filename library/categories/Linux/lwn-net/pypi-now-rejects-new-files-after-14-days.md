+++
title = "PyPI now rejects new files after 14 days"
description = "Python Software Foundation security developer-in-residence Seth Larson has announced that the Python Package Index (PyPI) will now reject new files that are uploaded to rel"
date = "2026-07-22T16:05:44Z"
url = "https://lwn.net/Articles/1084218/"
author = "jzb"
text = ""
lastupdated = "2026-07-23T22:52:44.023320084Z"
seen = false
+++

Python Software Foundation security developer-in-residence Seth Larson has [announced](https://blog.pypi.org/posts/2026-07-22-releases-now-reject-new-files-after-14-days/) that the [Python Package Index](https://pypi.org/) (PyPI) will now reject new files that are uploaded to releases older than 14 days. The restriction is to prevent the poisoning of old releases if publishing tokens or workflows of PyPI projects are compromised.

>
>
> The [discussion of this behavior began](https://discuss.python.org/t/restricting-open-ended-releases-on-pypi/43566) during PEP 740 (Digital Attestations) back in January 2024. The discussion was [restarted in March 2026](https://discuss.python.org/t/restricting-open-ended-releases-on-pypi/43566/34) after the popular packages [LiteLLM and Telnyx were compromised](https://blog.pypi.org/posts/2026-04-02-incident-report-litellm-telnyx-supply-chain-attack/). These packages were compromised due to a "[mutable reference](https://mikael.barbero.tech/blog/post/2026-03-24-stop-trusting-mutable-references/)" in these projects' usage of the Trivy GitHub Action.
>
>
>
> Originally the discussion stalled due to some projects depending on this behavior to add support for new Python versions to already-published releases. To quantify how disruptive this change would be to existing workflows, the PyPI database was queried for [projects that have published new files to old releases](https://discuss.python.org/t/restricting-open-ended-releases-on-pypi/43566/48) (bucketed by number of days since the release). Later, specifically `cp314` wheels were queried for the top 15,000 packages, revealing that [only 56 projects of 15,000](https://discuss.python.org/t/restricting-open-ended-releases-on-pypi/43566/63) had published a 3.14-compatible wheel more than 14 days after a release was available.
>
>

LWN [covered](https://lwn.net/Articles/1064693/) the LiteLLM compromise in March.