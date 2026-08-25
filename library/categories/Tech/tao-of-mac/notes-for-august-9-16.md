+++
title = "Notes for August 9–16"
description = "This was a different week, partly because we decided to watch the eclipse from a Spanish beachfront and partly because I actually read three books. There is an entire sub-thread around my back and neck aching worse than ever and my sleep patterns looking like a game of Splatoon t"
date = "2026-08-16T19:00:00Z"
url = "https://taoofmac.com/space/notes/2026/08/16/1900?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-24T15:49:20.710604699Z"
seen = false
+++

This was a different week, partly because we decided to watch the eclipse from a Spanish beachfront and partly because I actually read three books. There is an entire sub-thread around my back and neck aching worse than ever and my sleep patterns looking like a game of Splatoon that I will spare my readership, though.

I do think that this week’s Economist [completely nailed the holiday feeling](https://www.economist.com/business/2026/08/13/the-six-stages-of-holiday-making?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) since I nearly drafted an existential rant about considering retiring to Spain for tax purposes, but as the article says, a lot of holiday musings don’t really stand the test of time–something I’m not going to take for granted.

But hey, [Tailscale](/space/apps/tailscale) worked (hotel Wi-Fi seems to be mostly a solved problem by now, even if I still chuckle at WISPr portals), none of my home machines overheated while we were gone, and although the week was a dismal failure in terms of writing, I managed to, at least for a few hours, completely forget about work and actually enjoy myself.

But I *really* wish I didn’t have to go back. This has not been a new feeling over the past decade, and I have taken it to mean that I can finally reason about work in the proper way (either because it has stopped defining me or because it’s fundamentally misaligned with what I think I should be doing in these insane AI-driven times–not sure which yet).

[

Rust Isn’t That Shiny
----------

](/space/notes/2026/08/16/1900#rust-isn-t-that-shiny)

One of the books I read was on [Rust](/space/dev/rust) (actually two, the original book’s third edition and another on Rust for embedded systems), and I plodded through its gospel mostly wondering what the heck I could really get out of it given that I’ve mostly settled on [Go](/space/dev/golang) and [Bun](/space/cli/bun) for the vast majority of my projects this year that aren’t in [C](/space/dev/c) or [Python](/space/dev/python).

Although I’ve been successfully steering [`wrdp`](https://github.com/rcarmo/wrdp?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to passably structured form (and, more important, usefulness), I remain unconvinced I would have used [Rust](/space/dev/rust) to do it if it wasn’t for [IronRDP](https://github.com/Devolutions/IronRDP?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), and given the malleability of [Go](/space/dev/golang) and the ease with which most LLMs can generate it correctly (provided you [follow sane approaches](/space/blog/2026/03/08/2130) and lint/fuzz the heck out of it), I don’t see myself picking [Rust](/space/dev/rust) as my default unless I’m going into a codebase that already uses it.

My biggest gripe remains the mental model, or, more to the point, *the mental overhead* of imposing a series of abstractions on top of the language *that the hardware fundamentally doesn’t care about* and that only cause programmers grief. In short, [C](/space/dev/c) and [Go](/space/dev/golang) feel more honest in either their rawness or their willingness to abstract a bit more in ways I actually find productive.

[

Plan9 Lives on
----------

](/space/notes/2026/08/16/1900#plan9-lives-on)

…in [Go](/space/dev/golang) assembly, at least. I took the time to understand a bit more how `llama.cpp` worked and after a few SIMD optimisations in some of the more impactful matmuls, see if I could port some of that across to [`go-pherence`](https://github.com/rcarmo/go-pherence?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) for kicks. The fact that I can still consistently get 10% localised speedups by just *looking* at the inference graphs and asking “why wasn’t this done *this* way” (as you can see in [my `llama.cpp` fork](https://github.com/rcarmo/llama-cpp?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)) makes me wonder exactly how much performance is being left on the table, and if Kaizen shouldn’t be a software design technique.

Lacking GPU hardware, I have to stick to stubbornly wrapping my remaining neurons around Intel-specific (and, soon, NEON-specific) optimisations, but it seems that my [K3 experimentation](/space/reviews/2026/06/11/1830) sparked a new interest in making inference go *brrrrrrr* I can’t quite turn off.

[

Side Effects
----------

](/space/notes/2026/08/16/1900#side-effects)

Speaking of turn-offs, the AI agent/shell/UX craze is still raging on to the point where I decided to put [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) on hold for a bit and prepare the way to converge with what I fervently hope will be a thoughtful, elegant agent harness that is emerging from the [`pi`](/space/ai/agentic/pi) SDK.

I am, effectively, taking a gamble on what it might look like, and simultaneously preparing to clean up [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)’s event loop into less of a mess by rebuilding part of the internals into more or less cleanly cut “effectors” that run after each state machine transition as needed.

I also started putting hard caps on my “AI time”. Either token-wise, or attention-wise, I am taking advantage of the summer season to just go slower on a few projects.

[

No More ArchiveBox
----------

](/space/notes/2026/08/16/1900#no-more-archivebox)

Except, of course, that I decided to add one more, but for a good cause.

I’m also trying to simplify the amount of stuff I run in general, and scoring it by a thoroughly unscientific ratio of actual use against the headaches each service causes. This week [ArchiveBox](https://github.com/ArchiveBox/ArchiveBox?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)’s number came up because it just keeps getting stuck in CPU loops, and having a machine subtly overheat over many hours in the middle of summer is *not* something I favour.

Plus the usefulness of the thing is also in question, really.

There is a long history of “read later”/maybe useful/procrastination in reading here that probably needs its own blog post, and I’m old enough to have gone through Delicious, Instapaper, Pocket, and now ArchiveBox.

I think the common thread between all of them (and the reason “read later” services exist) is the (mostly fake) reassurance that I will a) *really* read something later (which often doesn’t happen) or b) be able to find something again if I ever need it.

Both of those prey on human nature, such as it is, in a weird reflection of what we’re going through now with AI, since all of these bookmarking and archival “helpers” boil down into CPU cycles, storage and a slightly guilty sense of having outsourced remembering things to a machine.

And I really should know better, since this very site has mostly replaced all of them for many uses–just go into any technical wiki page and it’s usually crammed full of links to interesting projects in various domains. And it just works.

[ArchiveBox](https://github.com/ArchiveBox/ArchiveBox?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), meanwhile, has been a random source of failures, CPU use and frustration around its pace of development. Although I like the idea of storing bits of the web before they’re eroded away by slop, there are two fundamental problems with it:

* It has too many moving parts
* I don’t need to keep a zillion formats that I never open

What I need is to be able to find and read something on iOS when I eventually need it, and more or less high-fidelity content capture–for which MHTML is decent enough, even if Safari has never adopted it. Being able to strip it down into machine-readable or printable formats is mostly optional, and can be done on demand.

So… I whipped up [`bun-packrat`](https://github.com/rcarmo/bun-packrat?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), which does the entire thing relatively tidily, storing a single source of truth for the page contents, reshuffling it on the fly for me to read, and leveraging [SQLite](/space/db/sqlite)’s FTS5 indexing for search. After all, with agents to extract text, fill in missing metadata and build whatever enrichments I end up wanting later, that’s more than good enough, simpler to maintain and far less wasteful (if you ignore my firing up a headless browser for every capture, of course). Instead of 35GB of junk, the 2.000-odd [ArchiveBox](https://github.com/ArchiveBox/ArchiveBox?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) entries now take up a little over 1GB in a single database, which is just great.