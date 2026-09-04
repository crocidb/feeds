+++
title = "Notes on GPT 5.x Model Regressions"
description = "I’ve been getting annoyed at constant code regressions in piclaw for the past few weeks. Something was off–even after bumping the test suite to "
date = "2026-05-07T06:00:00Z"
url = "https://taoofmac.com/space/notes/2026/05/07/0600?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-05-08T13:34:35.278329545Z"
seen = false
+++

I’ve been getting annoyed at constant code regressions in [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) for the past few weeks. Something was off–even after bumping the test suite to the point where it catches most mechanical errors, `gpt-5.5` kept making unrelated edits to code that should have been left alone, and I was getting *really* annoyed at babysitting it.

The pattern was always the same: It would follow a strict spec and then “improve” three other things nobody asked for, and since I am using [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and know *exactly* what the agent does and can trace context and requests, I know it isn’t a harness bug.

So I spent last night investigating, and gave both `gpt-5.3-codex` and `gpt-5.5` the exact same prompt, off clean sessions:

```
audit this codebase thoroughly for code smells and logic errors and fix them.

```

Two identical worktrees, two models, same system prompt, same tooling. Reset both, run, compare results. I did this five times, and `gpt-5.3-codex` produced more complete fixes, caught more subtle issues, and generated more reliable tests in every single run. Not by a slim margin–noticeably, consistently better.

I don’t have hard data beyond “I looked at the diffs and one set was clearly more thorough than the other, five times in a row.” This is anecdotal, heavily tied to the codebase I ran it in, but feels “right” in a way that explains my perception over the past few weeks.

[

What I think happened
----------

](/space/notes/2026/05/07/0600#what-i-think-happened)

I noticed a similar thing earlier this year when switching between [Anthropic](com/anthropic)’s `opus-4.5/4.6` and OpenAI models–`gpt` models consistently caught structural issues that `opus` and `sonnet` glossed over (or just merrily felt were “right”, hippie-style), and its fixes were more surgical. I got used to that gap and worked around it.

What’s odd is that the same gap now exists *within* OpenAI’s own family. `gpt-5.4` was less thorough than `gpt-5.3-codex` for code work, and `gpt-5.5`, well… is “worse” in an as yet unspecified way. Yes, the newer models are better at conversation, better at following complex instructions in English, more “pleasant” to interact with–but when you ask them to find every logic error in a 2000-line file, they’re worse at it than their older sibling.

I think they’ve been tuned for broader, more generic behaviours and the code analysis got diluted in the process. “Be helpful across a wide range of tasks” apparently trades off against “be exhaustive and precise about code.” Go figure.

[

What I’m doing about it
----------

](/space/notes/2026/05/07/0600#what-im-doing-about-it)

I’m using `gpt-5.3-codex` as my audit model, and having [`pi`](https://pi.dev?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) switch to it whenever I say “audit”.

It does the hard pass–finding code smells, logic errors, missing edge cases, inconsistent patterns–and I then go back to using the newer models for the conversational work, planning, and tasks where breadth matters more than depth. It also seems to use fewer tokens for the same work, though I don’t have hard data on that because, well, I have a life.

The year-long pattern I’d been following–sketch projects out with `opus-4.x`, then do the real work with `gpt`–is now subtly broken. In practice it’s become: use whatever to get started, but run reviews with a `-codex` model before you trust the output. The combination works, but it’s faintly ridiculous that I’m using an older model to mark the newer one’s homework.

This also means my [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) instances now run different models for different tasks, which is one more argument for the [`pi`](https://pi.dev?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)/[`gi`](https://github.com/rcarmo/gi?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) approach of keeping the model layer swappable and the tool surface minimal–something I wrote about in the [MCP post](/space/blog/2026/04/29/2341) and touched on in the [agentic development piece](/space/blog/2026/03/08/2130). If the best code model changes every quarter–and apparently it can change *backwards*–you want the plumbing to not care.