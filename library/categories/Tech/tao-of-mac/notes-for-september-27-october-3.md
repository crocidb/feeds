+++
title = "Notes For September 27-October 3"
description = "This week was a bit different. For starters, it rained. And I visited the local office. And I consciously set aside hours to catch up on my writing instead of herding AI or doomscrolling, and again, failed at a bunch of that because–well, I lied.Work has been… odd, discouraging a"
date = "2026-10-03T18:40:00Z"
url = "https://taoofmac.com/space/notes/2026/10/03/1840?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-10-05T09:04:51.118678088Z"
seen = true
+++

This week was a bit different. For starters, it rained. And I visited the local office. And I consciously set aside hours to catch up on my writing instead of herding AI or doomscrolling, and again, failed at a bunch of that because–well, I lied.

Work has been… odd, discouraging and, above all, draining, so I’ll just get that out of the way: Every time there is a reorganization, a bunch of wheels are reinvented. That is fine; it’s part of the transition process. But the *kind* of wheels that people focus on during those transition periods is, I think, the most telling signal of whether that reorganization actually needed to happen.

That said, after a late-night stint last Friday pouring a bit of my soul into an internal project that might actually be fun but ultimately pushed the “buffer zone” between work and real life into the red, the week was finally over and I could sit down and focus.

[

Sharper Gherkins
----------

](/space/notes/2026/10/03/1840#sharper-gherkins)

I’ve been trying a new tactic for doing small projects, which is to have AI take my `SPEC.md`, generate a set of [Gherkin](https://cucumber.io/docs/gherkin/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) files (which I then revise) and then develop the code from there–either as pure TDD or using the feature files as oracles for the actual tests.

And guess what? It’s mostly worked (I have three or four working examples, and I’m actually writing this [on one of them](/space/blog/2026/09/19/1659#a-writing-tool-that-leaves-the-writing-to-me)), although retrofitting it to an existing project can be quite messy. As an extreme example, I took [my Python MCP server for office files](https://github.com/rcarmo/python-office-mcp-server?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and [my Go OOXML library](https://github.com/rcarmo/go-ooxml?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), moved all the fixtures and test cases to a [separate repo](https://github.com/rcarmo/fixtures-ooxml?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), and left a few agents to hash it out with the current test cases as grounding. They are still at it.

However, I see great potential in doing this for *real* TDD:

* Humans take literally *forever* to agree on what a user story should be.

* Gherkin gives me a compact, almost Python-like and formulaic take on the desired outcome(s) for a feature, action, etc. In short, it makes things a lot more deterministic and predictable.

* I can match each feature to a part of the `SPEC.md` without losing the opportunity to refine it (and break it down if needed) in a machine-readable format.

And *the LLMs do not need to reinterpret the features.* They can help draft them, but once Gherkin scenarios are wired to tests, you can stop spending tokens reinterpreting them and just… run the tests.

Looking back, I am starting to realize that most of my hacks for herding AI are actually about *removing* it from the equation–[my MCP designs](/space/blog/2026/04/29/2341#lessons-on-building-mcp-servers) bake in workflow guidance, my original [development approach](/space/blog/2026/03/08/2130#so-you-want-to-do-agentic-development) tried to set things on rails from the start, and now I’m just putting blinders on it.

Gosh, it almost feels like… management.

[

Tooting the TUI
----------

](/space/notes/2026/10/03/1840#tooting-the-tui)

As a way to sneak some minimalism back into my computing, I’ve gone “back” to TUIs and spent a little while working on [`gi`](https://github.com/rcarmo/gi?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), which is now more pleasurable to use and much more `pi`-like (same commands, same UX, mostly because I very much like its minimalism and you can’t go wrong with that).