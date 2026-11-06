+++
title = "How We Could Have Backdoored Bash (Hacktron blog)"
description = "The Hacktron blog documents how the group was able to compromise the GNU Savannah forge and could have pushed malware into any of the projects hosted there.Using Hacktron, we found that an email address like a`touch${IFS}/tm"
date = "2026-10-31T14:00:42Z"
url = "https://lwn.net/Articles/1104262/"
author = "corbet"
text = ""
lastupdated = "2026-11-02T23:27:02.321214861Z"
seen = false
+++

The Hacktron blog [documents](https://www.hacktron.ai/blog/hacking-gnu-savannah) how the group was able to compromise the GNU Savannah forge and could have pushed malware into any of the projects hosted there.

>  Using Hacktron, we found that an email address like a`touch${IFS}/tmp/savane-rce-proof`@attacker.example gave any registered user code execution on its backend. From there, we made our account a superuser, impersonated Bash's maintainer, and confirmed we could add an SSH key with push access to the upstream Bash repository. An unpatched kernel gave us root access and access to a GNU backup server. We reported it to the FSF on May 11, 2026.