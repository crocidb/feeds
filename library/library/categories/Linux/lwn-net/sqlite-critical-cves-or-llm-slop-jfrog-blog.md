+++
title = "SQLite Critical CVEs or LLM Slop? (JFrog blog)"
description = "The JFrog blog examines some reported vulnerabilities in SQLite, some of which made their way into high-profile vulnerability databases, that turned out to be entirely fabricated by LLMs.These LLM slop CVEs "
date = "2026-08-03T14:59:31Z"
url = "https://lwn.net/Articles/1086936/"
author = "corbet"
text = ""
lastupdated = "2026-08-06T09:52:34.759745633Z"
seen = false
+++

The JFrog blog [examines some reported vulnerabilities in SQLite](https://research.jfrog.com/post/sqlite-critical-cves-or-llm-slops/), some of which made their way into high-profile vulnerability databases, that turned out to be entirely fabricated by LLMs.

>  These LLM slop CVEs can cause organizations to waste time investigating and patching vulnerabilities that do not actually exist, as well as polluting vulnerability databases. In environments where Critical vulnerabilities are automatically prioritized or tickets are opened based on vulnerability scores, such fabricated CVEs can turn into a real burden.
>
>  In environments where AI is used to automate vulnerability triage and remediation this becomes even more concerning. An AI agent that encounters a fabricated CVE may attempt to locate the vulnerable function, generate a patch, or recommend changes based on code that does not even exist. Instead of helping security teams remediate real vulnerabilities, it can lead them down a completely wrong path, potentially introducing unnecessary changes and wasting time.
>
>