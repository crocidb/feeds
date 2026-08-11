+++
title = "Meta: Introducing Muse Code and Muse Spark 1.2"
description = "Meta AI:We’re excited to release Muse Code (beta), a terminal coding agent powered by Muse Spark 1.2, our newest model. This marks our next step toward the frontier, with larger and much more capable models on the way. [...]Muse Code takes on complex software engineering"
date = "2026-08-07T18:05:03Z"
url = "https://research.meta.ai/blog/introducing-muse-code-and-muse-spark-1-2"
author = "John Gruber"
text = ""
lastupdated = "2026-08-10T22:24:07.316974460Z"
seen = true
+++

Meta AI:

>
>
> We’re excited to release Muse Code (beta), a terminal coding agent powered by Muse Spark 1.2, our newest model. This marks our next step toward the frontier, with larger and much more capable models on the way. [...]
>
>
>
> Muse Code takes on complex software engineering tasks across large repositories: planning changes, writing code, and validating the results. It can coordinate multiple persistent subagents for each task, solving difficult problems faster, more accurately, and with less intervention.
>
>

Terminal-only (so far), so it avoids the whole native-app-versus-Electron-shit-sandwich debate. They’ve embedded some fun interactive examples of Spark’s output right in the web page.

[Simon Willison](https://simonwillison.net/2026/Aug/5/muse-code-and-muse-spark-12/#atom-everything):

>
>
> An interesting twist on pricing is that the model [is offered](https://developer.meta.com/ai/models/muse-spark/) as two different model IDs. `muse-spark-1.2` is priced at $1.25/million input and $4.25/million output — close to Gemini 3.6 Flash ($1.50/$7.50) — but if you agree to let Meta use your data “to improve our products” you can use `muse-spark-1.2-contributor` which is $0.10/$0.20 — a huge discount, closer to GPT-5.6 Luna ($0.20/$1.20) and Gemini 3.1 Flash-Lite ($0.25/$1.50).
>
>

That’s over a 10× discount in exchange for giving your data to Meta. I can see the appeal if you don’t care about the privacy of your data and code, like, say, if you’re using Muse Spark to generate code for a throwaway project, or for something that’s open source anyway. But I wonder if Meta has considered that this offer might spook would-be users who absolutely do not want to grant Meta the rights to their data. One would hope that the two systems have a strong firewall between them. But given [Meta’s well-established contempt for the sanctity of user data](https://daringfireball.net/linked/2026/07/09/meta-instagram-ai-defaults), it’s not at all unreasonable to suspect that the difference here is like reserving a no-smoking seat in an airplane [with a smoking section](https://en.wikipedia.org/wiki/Inflight_smoking).

[ ★ ](https://daringfireball.net/linked/2026/08/07/meta-ai-muse-code)