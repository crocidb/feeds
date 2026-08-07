+++
title = "An LLM agent attempts to compromise a project on GitHub"
description = "The AI Security Institute has released a detailed report on an security incident of its own making. The Institute set some LLM agents loose on the Internet with a security challenge;"
date = "2026-08-04T23:04:32Z"
url = "https://lwn.net/Articles/1087162/"
author = "corbet"
text = ""
lastupdated = "2026-08-06T09:52:34.749341268Z"
seen = false
+++

The AI Security Institute has released [a detailed report](https://www.aisi.gov.uk/blog/incident-report-unsanctioned-agent-behaviour-during-cyber-testing) on an security incident of its own making. The Institute set some LLM agents loose on the Internet with a security challenge; soon they were creating malware-laden pull requests and sock-puppet accounts to promote them.

>  The agent opened a malicious pull request (PR) to ⟨REPO\_A⟩ and pursued a number of strategies to get it merged:
>
> 1. Repeatedly commented on the PR with sockpuppet accounts to manufacture consensus and pressure the maintainer into approving with minimal review.
> 2. Opened a GitHub Issue in another repository (also owned by ⟨PERSON\_A⟩) containing a prompt injection for other coding agents. The malicious instructions were addressed to issue-triage AI coding agents and invisible to humans viewing the website.
> 3. Sent multiple emails to ⟨PERSON\_A⟩ and ⟨PERSON\_B⟩, with different pretexts to get them to run malicious code. Over the course of the sample, the agent sent five emails, some containing malware, others aimed at persuading a maintainer to accept the pull request.
>
>

 It would be surprising if this were the only incident of this type; the only real difference here is that the people involved are documenting what happened.