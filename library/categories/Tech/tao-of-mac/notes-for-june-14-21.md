+++
title = "Notes for June 14–21"
description = "My back is still giving me trouble, but a week’s worth of moving about carefully and a little exercise “fixed” it (as in, I can stand again for extended periods of time). And I’ve pinned down the most likely cause–I have been spending far too much time sitting at my desk.As much "
date = "2026-06-21T11:49:00Z"
url = "https://taoofmac.com/space/notes/2026/06/21/1149?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-06-29T12:19:41.707500294Z"
seen = false
+++

My back is still giving me trouble, but a week’s worth of moving about carefully and a little exercise “fixed” it (as in, I can stand again for extended periods of time). And I’ve pinned down the most likely cause–I have been spending far too much time sitting at my desk.

As much as I love working remotely, the relentless (and sometimes idiotic) pace of dozens of daily meetings (often booked haphazardly and with the usual sense of bogus urgency that comes with the typical corporate need to “take action” without any proper briefings or preparedness) keeps being the one thing that I hate about my current role, and it’s again destroying my health in excitingly painful ways…

<img src="https://taoofmac.com/media/notes/2026/06/21/1149/tLca4INdarcCkl31OZcYxnWIXZA=/qwertee.jpg" alt="A Jurassic Park-style 'Jurassic Dad: Pain Finds A Way' shirt with a skeleton clutching its aching back" style="max-width: 100%;width: 100%;height: auto" width="500" height="600"> ironically, Qwertee had this on promotion this week

Even with daily walks outside (now in jeopardy from a coming heat wave) and regular standing/walking breaks to just *think* between calls, I definitely need to go back to my makeshift [standing desk](/space/blog/2020/07/19/1630) for a while and, again, ponder upgrading my *actual*, huge (180x90 cm) desk to something healthier, if necessarily smaller.

Still, having to lie still a bit earlier in the evenings led me to cut down on a bunch of otherwise useless doomscrolling, finishing a bunch of outstanding drafts and watching a few movies (including [Sneakers](https://www.imdb.com/title/tt0105435?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)), so there was an upside of sorts.

[

RISC-V Follow-Up
----------

](/space/notes/2026/06/21/1149#risc-v-follow-up)

I ran a few more tests on the [K3](/space/reviews/2026/06/11/1830) to see if I could get it to run a usable LLM setup, and… Not quite. I did confirm that Gemma 4 models are very impressive–Gemma 4 E2B QAT+MTP in particular is way smarter than it has any right to be, and more flexible than Qwen for system administration tasks even if it can get stuck easily.

However, the bandwidth and context requirements are still quite a bit above what the [K3](/space/reviews/2026/06/11/1830) can comfortably handle for a proper agent–even my 3060 struggles a bit with running it at what I consider a suitable context length (the `piclaw` context barely fits into 32K, so I typically aim for 128K for any useful work), but at least it can do so without two-minute response times…