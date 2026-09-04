---
title = "Pressure to change"
description = "At Notion, we’ve been doing a quality sprint to increase our test coverage. Friday was the last day, and I wanted to get some more tests written. Time was short, which forced me to break my usual workflow.Not that I really have a usual workflow, these days. New AI-augmented progr"
date = "2025-11-01T07:00:00Z"
url = "https://maryrosecook.com/blog/post/pressure-to-change"
author = ""
text = ""
lastupdated = "2025-11-07T14:09:27.178795305Z"
seen = true
---

At Notion, we’ve been doing a quality sprint to increase our test coverage. Friday was the last day, and I wanted to get some more tests written. Time was short, which forced me to break my usual workflow.

Not that I really have a usual workflow, these days. New AI-augmented programming tools and techniques come out every day. Everything is changing so fast that you can frequently become 10% more productive, forever, with a few minutes or a few hours invested. So, I push myself to try new things.

But, inevitably, workflows are sticky. It’s hard to change a habit. Extra cognitive load to monitor and refine the technique. Extra willpower to overcome the inertia of the familiar. Extra gumption to risk wasted time on something that isn’t helpful. So I have my mega list of stuff to try and every few days I’ll pluck something off it to try.

But Friday was eye-opening. With time short, I wanted to get as much done as possible. And failure would mean only a few hours lost.

We already had a bunch in place to speed things up.

A Claude Code skill that my colleague, Jimmy, wrote. It laid out a careful, thorough process for writing tests. It included looking at our testing guide, tips on what to mock and an entreaty to look at surrounding test coverage.

I pointed Codex at the Notion doc listing functions that needed coverage. I told it to find functions that are core parts of the system, or that have complex logic. This way, we could prioritize our time towards testing code that was important or gnarly.

And, on Friday, here’s the new stuff I tried -

I’m rushing. Jimmy’s skill is written for Claude, but I use Codex. What if I just point Codex at the skill directory in Claude’s config?

I’m rushing, so I have to get out of the loop. I need a process that can autonomously go from function name to PR. So I wrote a prompt with these steps: read the guidance on writing tests, write tests, create a branch, commit, review the code, refine the code, put up a PR.

I’m rushing, so it’s going to be harder to review every line. So I unleashed a “Final Review Before Pushing Straight to Production” prompt. This presents very high stakes to the model. And it lists a bunch of things the model regularly gets wrong. It lists every (human) comment on every PR I’ve landed (auto-fetched). It lists all the redirect prompts I’ve given the model (also auto-fetched).

I’m rushing, and I only have four git work trees. I can’t do one test-suite per tree. It’ll take too long. What if I give Codex four functions and tell it to go from function -\> PR for each one?

I’m rushing, and now my PRs are getting reviewed by my human colleagues. What if I paste the PR URL into Codex and tell it to do fixes for the comments, then push a new commit?

Surprisingly, these almost all worked. Only the four-PRs-in-one failed. Three of the PRs had lint errors and the setup made it harder to iterate on them.

Dozens of new tests and four new techniques to carry into the future. Or, rather, to carry until they’re superseded next week.