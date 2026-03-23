+++
title = "Antifragile Programming and Why AI Won’t Steal Your Job"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/11/G6dHib4XsAEyBYe-150x150.jpeg" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" loadin'
date = "2025-11-29T02:39:56Z"
url = "https://lemire.me/blog/2025/11/29/antifragile-programming-and-why-ai-wont-steal-your-job/"
author = "Daniel Lemire"
text = ""
lastupdated = "2026-03-19T16:26:22.833046902Z"
seen = false
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/11/G6dHib4XsAEyBYe-150x150.jpeg" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" loading="lazy">

Whenever I say I dislike debugging and organize my programming habits around avoiding it, there is always pushback: “You must not use a good debugger.”

To summarize my view: I want my software to be antifragile (credit to Nassim Taleb for the concept). The longer I work on a codebase, the easier it should become to fix bugs.

Each addition to a pieces of code can be viewed as a stress. If nothing is done, the code gets slightly worse, harder to maintain, more prone to bugs. Thankfully, you can avoid such outcome.

That’s not natural. For most developers lacking deep expertise, as the codebase grows, bugs become harder to fix: you chase symptoms through layers of code, hunt heisenbugs that vanish in the debugger, or fix one bug only to create another. The more code you have, the worse it gets. Such code is fragile. Adding a new feature risks breaking old, seemingly unrelated parts.

In my view, the inability to produce antifragile code explains the extreme power-law distribution in programming: most of the code we rely on daily was written by a tiny fraction of all programmers who have mastered antifragility.

How do you reverse this? How do you ensure that the longer you work on the code, the shallower the bugs become?  
 There are well-known techniques, and adding lots of tests and checks definitely helps. You can write antifragile code without tests or debug-time checks… but you’ll need something functionally equivalent.

Far-reaching prescriptions (“you must use language X, tool Y, method Z”) are usually cargo-cult nonsense. Copying Linus Torvalds’ tools or swearing style won’t guarantee success. But antifragillity is not a prescription, it is a desired outcome.

Defensive programming itself is uncontroversial—yet it wasn’t common in the 1980s and still isn’t the default for many today.  
 Of course, a full defensive approach isn’t always applicable or worth the cost.

For example, if I’m vibe-coding a quick web app with more JavaScript than I care to read, I’ll just run it in the browser’s debugger. It works fine. I’m not using that code to control a pacemaker, and I’m not expecting to be woken up at midnight on Christmas to fix it.

If your program is 500 lines and you’ll run it 20 times a year, antifragility isn’t worth pursuing.

Large language models can generate defensive code, but if you’ve never written defensively yourself and you learn to program primarily with AI assistance, your software will probably remain fragile.

You can add code quickly, but the more you add, the bigger your problems become.

That’s the crux of the matter. Writing code was never the hard part—I could write code at 12, and countless 12-year-olds today can write simple games and apps. In the same way, a 12-year-old can build a doghouse with a hammer, nails, and wood. Getting 80% of the way has always been easy.

Scaling complexity without everything collapsing—that’s the hard part.