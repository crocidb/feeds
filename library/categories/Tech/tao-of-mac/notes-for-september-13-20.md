+++
title = "Notes for September 13-20"
description = "It’s a bit insane that we’re past mid-September and my living room is still sitting at 29<supo</supC at 7AM, but such is life in the late Holocene, I guess. Regardless, the shift towards Autumn is starting to show, and I’ve had a couple of days where I suddenly realized I was w"
date = "2026-09-20T18:00:00Z"
url = "https://taoofmac.com/space/notes/2026/09/20/1800?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-09-21T09:42:47.664986199Z"
seen = false
+++

It’s a bit insane that we’re past mid-September and my living room is still sitting at 29<sup>o</sup>C at 7AM, but such is life in the late Holocene, I guess. Regardless, the shift towards Autumn is starting to show, and I’ve had a couple of days where I suddenly realized I was working “late” into the evening and the lights started coming on automatically (never a good sign unless you’re having fun).

I have had to split my free time between a bit of stress at work and working on my health (neck, posture, back, exercise and other things). Yet, things keep happening.

[

Social Cleanup
----------

](/space/notes/2026/09/20/1800#social-cleanup)

Halfway through the week I decided (again) to do a couple of minor interventions and remove more social media apps from my machines–I have not been using [Bluesky](https://bsky.app/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), [Threads](/space/links/2023/07/08/1034#threads-deep-dive) or [Reddit](https://www.reddit.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) at all for months, so those were easy decisions, but I am somewhat besmirched that I can’t really *use* [Mastodon](/space/apps/mastodon) (i.e., [Ivory](/space/links/2023/01/24/1758#ivory-for-mastodon-review-on-macstories)) for anything meaningful (and yet am paying a subscription for [Ivory](/space/links/2023/01/24/1758#ivory-for-mastodon-review-on-macstories) because it is the best iOS experience) and that [Twitter](/space/com/twitter) (yes, I will keep referring to it as [Twitter](/space/com/twitter)), sadly, remains the “best” window into the tech industry’s collective unconscious today, even as it continues to be a cesspool with no signs of improving.

Even forcing the “Following” tab with chronological order and using a web script to filter out ads is a compromise (ethical, political and mental health-wise), and yet I cannot look away. Not for the dopamine hits, but for the edgier, more interesting hustles going on 24/7.

There is actual progress everywhere, but there is also a lot of tenuous hype, Silicon Valley bro culture, and subdued (yet sometimes misguided) pushback from the rest of the world. It’s neither wholesome nor ultimately productive, so I’ve capped [Twitter](/space/com/twitter) at 15m daily–the same as [Hacker News](https://news.ycombinator.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), which still carries a semblance of authority even though the hustle is just as real there.

But I digress, again. Consider this my usual yearly rant, which is [steeped in tradition](/space/blog/2009/06/29/2223#unsocial).

[

Codex is Back, Baby
----------

](/space/notes/2026/09/20/1800#codex-is-back-baby)

My [Codex](https://openai.com/codex/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) Open Source account is active again, so during the week I finished a bunch of low-impact polish work I had been meaning to do for ages now:

* [`piclaw`](/space/blog/2026/08/21/2218#building-piclaw-on-top-of-an-opinionated-coding-agent) now has budget controls, marginally more consistent Settings UI across its two skins, model/session pickers, VNC panes, etc., as well as some timeline SVG fixes.
* I took the time to do some “reverse TDD” and generate a shared [Gherkin](https://cucumber.io/docs/gherkin/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) behaviour specification for the [`piclaw`](/space/blog/2026/08/21/2218#building-piclaw-on-top-of-an-opinionated-coding-agent) web UI, and then applied it in a consistent UX refactor for both [`vibes`](https://github.com/rcarmo/vibes?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and [`tau-prime`](https://github.com/rcarmo/tau-prime?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)–I kept trying to use their bespoke interfaces and getting annoyed at the differences in agent steering, timeline attachments, session controls, etc., and at least now most of it is broadly consistent.
* [`memento`](https://github.com/rcarmo/memento?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) now has… Trash, somewhat saner bulk memory operations, and doesn’t “lose” older revisions when you’re looking at it as a reviewer; old proposals were being invalidated upon new revisions of a node, even if those new revisions didn’t address the proposals, and useful stuff was getting “lost”.
* My [`piclaw`](/space/blog/2026/08/21/2218#building-piclaw-on-top-of-an-opinionated-coding-agent) agents can now talk across completely different networks using [`iroh`](https://www.iroh.computer/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (in fact, that is how I am porting [`memento`](https://github.com/rcarmo/memento?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to [Go](/space/dev/golang#go-lang) now, with two different agents coordinating between Intel and ARM hardware for testing).
* Since I am still deep into agentic stuff at work, I decided to add an A2A connector to [`piclaw-addons`](https://github.com/rcarmo/piclaw-addons?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com). Its main goal is to provide me with all the enterprisey stuff I need for testing other agents: authenticated client/server, durable task mapping, pinned agent-card trust and authenticated push notifications.

There will be a few more additional features for these, but I think we’re hitting diminishing returns here, at least until I need to solve new problems…

[

That Jev thing
----------

](/space/notes/2026/09/20/1800#that-jev-thing)

Yes, I’ve been looking at [TypeSafe’s Jev](https://typesafe.ai/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) too, and trying to figure out how to emulate it with various techniques in [`go-pherence`](https://github.com/rcarmo/go-pherence?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), because I *really* like the idea of smaller, focused models doing bounded jobs–I’ve never liked the fuzziness of LLM-generated JSON (there was a time when I was hacking on [`guidance`](/space/notes/2024/05/26/1500#guidance) to force schema compliance), and I think the principle is broadly right: most business AI I come across could be solved with a set of steps using BERT/Bayesian-like classifiers–but those classifiers would only work if we could “train” them with general knowledge, and that is what [Jev](https://typesafe.ai/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) “solves” to a large degree.

I’m poking at every open weights “implementation” out there right now, because I have *dozens* of scenarios where I can use something like [Jev](https://typesafe.ai/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), but local. For instance, it would have been great to have it back when I was running my [`feed summarizer`](/space/blog/2026/01/17/2130#my-rube-goldberg-rss-pipeline) instead of hacking my own classifiers, and [Shelf](/space/blog/2026/07/10/1330#the-return-of-shelf) would also benefit from a general purpose classifier for a bunch of things.

[

Hardware
----------

](/space/notes/2026/09/20/1800#hardware)

I got a new *amazing* KVM this week, which I am having too much fun with and will write about soon. Right now I am trying to clear out my review backlog, so the reason I mention it is that I can finally go back to setting up and testing more machines *and* clear some desk space, which is delightful since it has been a losing battle for months.

Now I don’t have to bother with anything but providing power for some of them, which makes things a lot simpler.

[

Less Frequent Housekeeping
----------

](/space/notes/2026/09/20/1800#less-frequent-housekeeping)

I’ve been keeping local replicas of my [GitHub](https://github.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) projects since… forever, but I’ve been neglecting the mechanics of it a bit, so this Friday I asked [`piclaw`](/space/blog/2026/08/21/2218#building-piclaw-on-top-of-an-opinionated-coding-agent) to:

* Consolidate all my mirrors under a [GitHub](https://github.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) organization on my local [Gitea](/space/apps/gitea) instance, adding the missing ones from [my recent projects](https://rcarmo.github.io/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com).
* Audit the inherited polling schedules against repository activity. Old projects now get quarterly checks or less, and we stopped polling things that got removed from [GitHub](https://github.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (like emulators and other things I thought were worth preserving).

My old trick for managing polling overlaps is to set distinct intervals using a prime (or product of primes) number of seconds, but I told the model to add one-time jitter to clustered next runs, and this not only cut down [Gitea](/space/apps/gitea) polling from around 90 checks a day to around 20, but also made the overall distribution much nicer:

![Gitea mirror polling intervals and next-run spacing before and after jitter](/space/notes/2026/09/20/1800/gitea-mirror-schedules.svg?v=ff569cc92a08) Longer polling intervals reduce the number of checks; one-time jitter spreads out the next runs.

This took, oh… 30 minutes, tops. And I didn’t need to keep an eye on it, so likely less in practice.

[

Writing
----------

](/space/notes/2026/09/20/1800#writing)

My [Writing Workshop](/space/blog/2026/09/19/1659#a-writing-tool-that-leaves-the-writing-to-me) thing is progressing well and has been quite helpful already in putting this draft together, so I am very happy with it so far–in less than an evening, I have a *very* helpful assistant (perhaps a bit *too* helpful and insistent, mind…) and the overall experience has been quite positive:

<img src="/space/notes/2026/09/20/1800/writing-workshop-review.png?v=b148dea3a1ff" alt="Writing Workshop showing the weekly draft with highlighted passages and a review findings panel" width="2048" height="1429">Writing Workshop showing the weekly draft with highlighted passages and a review findings panel

Of course there is a lot of polishing to do (my original intent was to add polish, not too much friction, and right now the 22 kinds of suggestions from the assistant are a bit overwhelming), but it’s a matter of tuning out what I don’t need and focusing on the improvements that truly impact the quality of the draft.

And then, who knows, maybe this will evolve into something even more substantial.

[

Books
----------

](/space/notes/2026/09/20/1800#books)

But what I’m most happy with is that I finished both *[Norse Mythology](https://www.amazon.es/gp/product/B01HQA6EOC/ref=as_li_tl?_encoding=UTF8&camp=3638&creative=24630&linkCode=ur2&tag=taoofmac-21&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)* and *[Last and First Men](https://www.amazon.es/gp/product/185798806X/ref=as_li_tl?_encoding=UTF8&camp=3638&creative=24630&linkCode=ur2&tag=taoofmac-21&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)* this week, which is a positive data point in my return to reading. I did get [`piclaw`](/space/blog/2026/08/21/2218#building-piclaw-on-top-of-an-opinionated-coding-agent) to go into [GoodReads](https://www.goodreads.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and mark them both as read for me from my [Nomad](/space/reviews/2025/01/18/2335#the-supernote-a6x2-nomad), so it wasn’t a completely AI-free experience, but I am pretty sure my priorities are OK.