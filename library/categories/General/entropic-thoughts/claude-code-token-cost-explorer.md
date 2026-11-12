+++
title = "Claude Code token cost explorer"
description = " I am experimenting with involving subagents more in my LLM coding agent workflow. I discovered that subagents make it more difficult to diagnose token usage in Claude Code, because the regular /context command only breaks down context usage for the main conversation, not for t"
date = "2026-11-09T23:00:00Z"
url = "https://entropicthoughts.com/claude-code-token-cost-explorer"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-11-11T16:05:17.732241062Z"
seen = false
+++

 I am experimenting with involving subagents more in my LLM coding agent workflow. I discovered that subagents make it more difficult to diagnose token usage in Claude Code, because the regular `/context` command only breaks down context usage for the main conversation, not for the subagents.

 I tried some existing tools like `ccusage` and `claude-agent-ledger`, but they weren’t able to give me the sort of breakdown into specifics I needed to optimise my usage. Thus, I shamelessly had Claude Code whip up a tool that gives me a better view of its token usage. This is vibecoded in the true sense of the word – I have barely looked at the code – but I’m okay with that becuase it is not critical infrastructure and it does what I need it to.

 If you want to know how to get more out of your Claude Code sessions without paying more for it, here’s how you can find out.

 First, open the context cost explorer in your browser. Everything happens locally on your machine, so none of your transcript data leaves your computer. If you’re the paranoid kind, you can verify by opening the network tab in your browser and reading in a non-sensitive session and seeing that nothing funny happens. Then follow the steps below, or use your own analytical ability.

[(Continue reading the full article on the web.)](https://entropicthoughts.com/claude-code-token-cost-explorer)