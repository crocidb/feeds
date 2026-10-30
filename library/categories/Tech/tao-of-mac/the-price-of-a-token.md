+++
title = "The Price of a Token"
description = "OpenAI launched GPT-6.1 Terra today at $1 per million input tokens, $5 for output and $0.05 for cached input. That is pretty similar to what happ"
date = "2026-10-26T21:50:00Z"
url = "https://taoofmac.com/space/blog/2026/10/26/2150?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-10-27T22:33:14.194853133Z"
seen = false
+++

OpenAI launched [GPT-6.1 Terra](https://developers.openai.com/api/docs/models/gpt-6.1-terra?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) today at $1 per million input tokens, $5 for output and $0.05 for cached input. That is pretty similar to what happened with 6.1-Sol, since it is half of what [GPT-5.6 Terra](https://developers.openai.com/api/docs/pricing?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) costs now, and the cached input rate is a fifth of what my [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) pricing table recorded for it back in July.

This is kind of interesting to me for a number of reasons, not the least of which is that I have been tracking these numbers for months both [at work](/space/site/disclaimer) and as I use my OpenAI subscription–my agents burn through a fair chunk of tokens, so anything that makes them *much* cheaper is noteworthy.

[

Following the numbers
----------

](/space/blog/2026/10/26/2150#following-the-numbers)

In case you’re new here, [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) keeps a dated pricing reference for its token chart, plus a set of `finops` snapshots with the provider pages they were taken from. Looking at the `git` history for a few model lines (USD per million tokens, input/output, then cache reads), the trend is pretty interesting:

|     Line     |             Earlier              |       Now        |
|--------------|----------------------------------|------------------|
| Claude Opus  |      4/4.1: $15/$75, $1.50       |5.5: $4/$20, $0.20|
|Claude Sonnet |      4.5/4.6: $3/$15, $0.30      |5.5: $2/$10, $0.10|
| OpenAI “Sol” | 5.6 (July table): $5/$30, $0.50  |6.1: $2/$10, $0.10|
|OpenAI “Terra”|5.6 (July table): $2.50/$15, $0.25|6.1: $1/$5, $0.05 |

In short, headline prices are down by anywhere from a third to three quarters depending on which line you pick, which is nice but not the interesting part–the interesting part is the last column, and, if you’re doing *any* sort of agentic work at scale, how caching prices factor into the equation.

[

Cache Impact
----------

](/space/blog/2026/10/26/2150#cache-impact)

When I [audited a week of usage](https://github.com/rcarmo/piclaw/blob/main/docs/finops/2026-09-05/audit/report.md?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) on my main instance in September, it came to 2.17 billion tokens. 94.3% of those were cache reads, which is *entirely* by design since I have been aggressively optimising [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)’s context structure (and compaction) to maximise caching to lower costs, but still left a bit of fake money on the table.

Since 90% of my workloads are development/agent loops, fresh input on each turn is typically 1.5% and output a measly 0.1% (i.e. one or more tool calls). Agents just ship the same long context over and over to providers (to a point where I have to wonder why the heck we still use the same payload structure…), and 93.7% of the volume was in requests over 272K tokens, which OpenAI bills at twice the input and cache rates.

What this means, in volume, is that the price that matters for agents is actually *cache reads*, not raw tokens. If you’re burning money to light up your cigarettes (and have a disgusting smoking habit), you probably don’t care that Claude Fable 5.1 and GPT-6 Astra have the same $10/$50 list price, but over time Fable 5.1 cut cache reads from $1 to $0.25, which made it 70% cheaper than Astra on the same replay ($2,064 versus $6,858).

I don’t use Fable (I don’t have access to it anymore, even at work, and Anthropic doesn’t give me the time of day as an individual open source developer), but running my old benchmark’s token counts against today’s prices is… kind of interesting, and makes me really happy I am not paying per token:

|      Model      |Input/output|Cache read|One week, same workload|
|-----------------|------------|----------|-----------------------|
|   GPT-6 Astra   |  $10/$50   |  $1.00   |        $6,858         |
|Claude Fable 5.1 |  $10/$50   |  $0.25   |        $2,064         |
| Claude Opus 5.5 |   $4/$20   |  $0.20   |       \~$1,030        |
|   GPT-6.1 Sol   |   $2/$10   |  $0.10   |        \~$990         |
|Claude Sonnet 5.5|   $2/$10   |  $0.10   |        \~$515         |
|  GPT-6.1 Terra  |   $1/$5    |  $0.05   |        \~$490         |

Of course, the above assumes a full replay: identical tokens as over that week, identical cache behaviour, etc. I’m glossing over retries, reasoning effort and whether the model actually gets the job done, so it’s just a data point.

I do find it interesting that Sonnet and Sol come out differently despite identical list prices because of OpenAI’s long-context surcharge, which Anthropic doesn’t charge–but, again, subscriptions mask all of this under their flat rate.

[

What OpenAI is claiming
----------

](/space/blog/2026/10/26/2150#what-openai-is-claiming)

OpenAI’s [announcement](https://openai.com/index/introducing-gpt-6-1-terra/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) says Terra matches Astra on Agents’ Last Exam (a test of agents using office software, which I’ve always found hilarious given there’s so much more useful stuff to test them on) “at one-tenth the price per token”, and that it finishes tasks over three times faster than both Astra and Sol.

There are also claims that Terra is over three times as token-efficient as Opus 5.5 at maximum effort, which would make it about nine times cheaper per task–likely more because Terra would also be using fewer tokens.

Now, I’m much more focused on actual results, and even if I don’t care anything about synthetic benchmarks like [BenchLM](https://benchlm.ai/models/gpt-6-1-terra?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), they are less flattering on stuff I care about:

* Terminal-Bench 4.0: Terra scores 50.3%, against 70.6% for Sonnet 5.5.
* OSWorld 2.1 (offline subset): Terra 74.2%, Opus 5.5 87.2%.
* OpenAI itself still points people at Sol or Astra for “in-depth research or complex coding”.

Still, if you consider that the smart approach is to have Luna and Terra carry out pre-defined instructions drafted by Sol or Astra *and* use extensive standard automation, Terra is starting to look really good for churning through things like ticket triage, running test harnesses and even managing CI.

[

But why does Anthropic keep charging premium prices?
----------

](/space/blog/2026/10/26/2150#but-why-does-anthropic-keep-charging-premium-prices)

This is the bit that puzzles me. If Sol and Terra now get you most of the way to… well, anywhere, really, for a fraction of the price, why does Anthropic still sell Fable (and Mythos) at $10/$50?

I have a few theories, ranging from good marketing, lack of competitive pressure at the premium level, and the current shape of the market:

* They are not alone. Astra costs exactly what Fable does, so OpenAI also keeps a premium tier. It’s just not the one it advertises, which is an interesting inversion of Anthropic’s marketing spiel.
* The mid-range has already converged. Sneakily (well, quietly, at least) Sonnet 5.5 now has the [same list price](https://platform.claude.com/docs/en/about-claude/pricing?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) as GPT-6.1 Sol, down to the $0.10 cache reads, and Opus 5.5 is at $4/$20, so the price war is happening one tier down (maybe at the level Claude users actually set most of their agents to).
* They *nominally* still win where it matters for coding agents. My results with Opus have been consistently *lousy* across the board where it regards code quality (and [the models outright lying to me](/space/blog/2026/07/11/1500) regarding implementation), but market perception seems to be completely opposite to mine.
* Most people never see a token price. Claude Max, Codex and Copilot sell allowances, not tokens, and a flat $200 a month both hides most of the difference unless you hit the limits and is psychologically justifiable as being “best of breed” (even if it isn’t).

What I do know is that, on my own workload, the cheapest Anthropic model I’d trust with real work (Sonnet 5.5) now costs about the same as Terra, and Opus 5.5 costs half of what Fable does. So Anthropic is, surprisingly, cutting prices too.

Still, I’ll be running Terra against my usual [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) tasks over the next few days, mostly to see whether the token-efficiency claims hold up. My guess is that it’ll replace a lot of my bounded, well-tested work and none of my hard debugging, planning or code audits, but we’ll see.