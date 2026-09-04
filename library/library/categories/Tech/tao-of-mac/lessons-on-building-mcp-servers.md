+++
title = "Lessons on Building MCP Servers"
description = "I’ve been building MCP servers for a while now–I wrote about the general approach last year, started out by creating [umcp](https://github.com/rcarmo/umcp?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_c"
date = "2026-04-29T23:41:00Z"
url = "https://taoofmac.com/space/blog/2026/04/29/2341?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-05-05T08:25:09.968761655Z"
seen = true
+++

I’ve been building [MCP](/space/ai/mcp) servers for a while now–I wrote about [the general approach](/space/blog/2025/10/04/1111) last year, started out by creating [umcp](https://github.com/rcarmo/umcp?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), and I’ve recently opened up an [Office server](https://github.com/rcarmo/python-office-mcp-server?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) that’s been battered by enough models against enough real documents that the patterns have settled.

I’m still not a fan of [MCP](/space/ai/mcp), but what follows is what I’ve learned about making tool chains actually work, condensed from swearing at logs rather than reading papers.

>
>
> **Disclaimer:***This is a condensed version of [`CHAINING.md`](https://github.com/rcarmo/umcp/blob/main/docs/CHAINING.md?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), which was itself stapled together from a bunch of notes in my [Obsidian](/space/apps/obsidian) vault. The full version has more code examples and a techniques inventory table that Opus just \_had* to add, and I’ve since beaten that out of it and restored most of the original text (minus typos).
>
>

The short version: the MCP servers I design do most of the work, while the model walks breadcrumbs.

[

Models don’t plan
----------

](/space/blog/2026/04/29/2341#models-dont-plan)

They look at the conversation, scan the tool list, and grab whatever looks more probable. That’s it. There is no hidden planner. If you want chains that finish somewhere sensible, the *server* has to make the next call blindingly obvious at every step.

After a year or so, I have pared down my approach into these three things, roughly in order of how much pain they save you:

* A small named core verb set covering most intents
* Output that suggests the next call
* An addressing scheme that survives between calls–anchors, IDs, paths, anything but line numbers.

[

Core verbs beat surface area
----------

](/space/blog/2026/04/29/2341#core-verbs-beat-surface-area)

The [Office](https://github.com/rcarmo/python-office-mcp-server?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) server exposes over 100 tools. Its `get_instructions()` funnels models toward eight:

>
>
> *…start with `office_help`, then prefer `office_read`, `office_inspect`, `office_patch`, `office_table`, `office_template`, `office_audit`, and `word_insert_at_anchor`. Treat specialised tools as fallback, diagnostic, legacy-compatibility, or expert tools when the core flow is insufficient.*
>
>

That single sentence does an outsized amount of work–it tells the model there *is* a recommended path, that the path is verb-shaped (`help -> read -> inspect -> patch -> audit`), and that everything else is opt-in.

Without it, models cheerfully reach for `word_parse_sow_template` when `office_read` would do, and you end up with five-call detours for one-call jobs.

So I quickly realized that I needed to be ruthless about which tools to surface and when. The specialised ones still ship–hidden under a “for experts” framing, and a handful of legacy ones filtered out of `tools/list` entirely.

I also make liberal use of activation sets–the surface the model *sees* is small; the surface it *can reach* is large.

[

Naming is the chain
----------

](/space/blog/2026/04/29/2341#naming-is-the-chain)

Again, models chain whatever is most likely (or rhymes), and the most effective tactic, for me, has been taking advantage of that.

All Word tools are `word_*`, all Excel `excel_*`, all unified `office_*`. A model that just called `office_inspect` will reach for `office_patch` next, not `word_patch_with_track_changes`, because the prefix matches.

This particular server also makes liberal use of annotations and a little intent/inferrer hack that reads those prefixes to assign `readOnlyHint`/`destructiveHint` automatically, so naming discipline turns into safety metadata for free.

The prefix is the plan. The verb is the step. If you take one thing from this entire post, I’d suggest this notion…

[

Every response nominates the next call
----------

](/space/blog/2026/04/29/2341#every-response-nominates-the-next-call)

This was the single change that made things behave on smaller models. The big ones will plan a chain from a tool list and a goal; the wee ones won’t–they grab the first plausible tool and stop.

The fix is stupid simple: every response ends with a breadcrumb dictionary of hints to follow. At minimum `next_tools: [...]`, plus `usage: "<exact call>"` whenever the current tool produced a value the next one needs.

A model that can’t assemble arguments from a schema can copy the `usage` string verbatim. In fact, they *will* copy it, because it is still the most likely outcome as it fills in tokens, and thus those usage hints funnel the path the model takes.

[

Discovery as a tool, not documentation
----------

](/space/blog/2026/04/29/2341#discovery-as-a-tool-not-documentation)

Another thing I hit upon was that signposting needed to be curated.

Borrowing a page from intent mapping, `office_help(goal=...)` returns a structured record–recommended chain with rationale, fallbacks, diagnostic strings to watch for, one imperative `next_step` sentence. Not prose. Not a README, not skills. Data the model can act on without reading comprehension.

Called with no arguments, it returns the catalogue. Called with an unknown goal, it returns the supported set rather than an error, which turns a potential workflow-stopping error into an actual useful catalogue.

[

Addressing: anchors, not offsets
----------

](/space/blog/2026/04/29/2341#addressing-anchors-not-offsets)

The biggest reason simple models can’t follow chains is the model losing the thread between calls. “Insert a paragraph after the introduction” is fine in English but catastrophic if you expect it to remember a byte offset across three tool calls.

In this particular scenario, I cheated and since most Office documents have headings (or cells, or internal structured paths inside OOXML), I used either verbatim text from the document or immovable coordinates (which was particularly hard in PowerPoint, by the way).

So besides suggestions and hints, return identifiers your tools will later accept as input. If you find yourself returning data the model has to *describe back to you* in natural language, you’ve made a chain that will misfire on a Tuesday afternoon when you’re not watching.

[

Modes turn one tool into four
----------

](/space/blog/2026/04/29/2341#modes-turn-one-tool-into-four)

I started out with individual editing tools per format, which was very easy to do automated tests for but incredibly wasteful of context, so at one point I decided to make things much simpler for initial discovery, and since I needed to make all outputs auditable, I then tagged available sub-operations risk-wise.

`office_patch` is the same code path whether you ask for `dry_run`, `best_effort`, `safe`, or `strict`. One tool, four modes, one entry in `tools/list`.

Discovery cost scales with tool count, not mode count. And `dry_run -> safe -> strict` is an escalation chain the model figures out on its own without being told.

If you have N tools that differ only in how cautious they are, collapse them. You’re wasting everyone’s context budget.

[

Diagnostics as the back-edge
----------

](/space/blog/2026/04/29/2341#diagnostics-as-the-back-edge)

Linear chains are easy. Real chains have loops, and loops only happen when the server invites the model back in. Every mutating tool returns a standard envelope with `status`, `matched_targets`, `unmatched_targets`, and `next_tools`.

The model then branches on a small subset of options “locally” without needing to go over the entire context, and if you name the diagnostic fields with exact strings the model will see again in your instructions, it will just reinforce them.

In this particular case, again, I cheated. I figured out that the models were starting to call tools at random because they couldn’t introspect the document well enough and ended up breaking files, so I *always* gave them at least one read-only tool, so the penalty for “I’m confused, let me look again” is one extra round-trip, not a destructive cock-up.

[

My MCP Design Checklist
----------

](/space/blog/2026/04/29/2341#my-mcp-design-checklist)

* Pick five to ten core verbs and name them in `get_instructions()` or your local equivalent
* Use consistent prefixes by surface
* Provide a discovery tool that returns recommendations as data, not prose
* Make the discovery tool browseable–no-arg returns the catalogue, unknown input returns the supported set
* Embed forward breadcrumbs in every tool response
* Provide a map/anchors tool so addresses survive between calls
* Give every mutating tool a mode enum including `dry_run`
* Return named diagnostic fields and cite the recovery tools
* Standardise the mutation envelope. If one tool changes something in a specific way, make sure the others are consistent (arguments, semantics, etc.)
* Reject unknown arguments strictly (this is much easier in some runtimes than others)
* Provide an audit tool so the model has somewhere to land
* Cache anything the recovery loop calls more than once, because, well, it *will* get called dozens of times even if you carefully curate paths through your tooling with hints.
* Make repeat calls safe–models retry, and they should be allowed to (idempotence is hard, and often impossible).

Do the boring work in the schema and the descriptions. The model will happily do the clever bit if you stop making it guess.