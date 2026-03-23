+++
title = "How much of HN is AI?"
description = "I have a complicated relationship with Hacker News. The site is the most important aggregator of geek news and a major source of traffic to this blog. At the same time, it has a fair number of toxic commenters, making it a dependable source of insults hurled in my general directi"
date = "2026-03-12T01:13:16Z"
url = "https://lcamtuf.substack.com/p/how-much-of-hn-is-ai"
author = "lcamtuf"
text = ""
lastupdated = "2026-03-18T21:57:45.298971534Z"
seen = true
+++

I have a complicated relationship with [Hacker News](https://news.ycombinator.com). The site is the most important aggregator of geek news and a major source of traffic to this blog. At the same time, it has a fair number of toxic commenters, making it a dependable source of insults hurled in my general direction; if you want a taste, [this article](https://lcamtuf.substack.com/p/how-has-mathematics-gotten-so-abstract) has been called “watered-down” and “slop”.

The site is run by geeks and for geeks, so it’s not immune to tech trends; for example, around 2018, it had a fair number of stories focused on cryptocurrencies and NFT. That said, the recent shift feels more profound: almost every day, it feels that the lineup is dominated by stories focused on AI, written by AI, or commented on by AI.

To get a sense of how much of the feed is occupied by AI-related topics — often vendor announcements — I took a sampling of the daily top #5 for February 2026:

[

<img src="https://substackcdn.com/image/fetch/$s_!nyFk!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F186ff171-6d6b-44c5-a7bd-951cea16899e_2000x713.jpeg" width="1456" height="519" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/186ff171-6d6b-44c5-a7bd-951cea16899e_2000x713.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:519,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:523696,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:false,&quot;topImage&quot;:true,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/190677413?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F186ff171-6d6b-44c5-a7bd-951cea16899e_2000x713.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!nyFk!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F186ff171-6d6b-44c5-a7bd-951cea16899e_2000x713.jpeg 424w, https://substackcdn.com/image/fetch/$s_!nyFk!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F186ff171-6d6b-44c5-a7bd-951cea16899e_2000x713.jpeg 848w, https://substackcdn.com/image/fetch/$s_!nyFk!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F186ff171-6d6b-44c5-a7bd-951cea16899e_2000x713.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!nyFk!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F186ff171-6d6b-44c5-a7bd-951cea16899e_2000x713.jpeg 1456w" sizes="100vw" fetchpriority="high">

](https://substackcdn.com/image/fetch/$s_!nyFk!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/186ff171-6d6b-44c5-a7bd-951cea16899e_2000x713.jpeg)

So, yep. AI took four out of five spots on [Feb 4](https://news.ycombinator.com/front?day=2026-02-04) and [Feb 12](https://news.ycombinator.com/front?day=2026-02-12), plus arguably the entire line-up on [Feb 5](https://news.ycombinator.com/front?day=2026-02-05) (story #3 was submarine marketing for an AI vendor). The only days without LLM news in the top 5 were [February 1](https://news.ycombinator.com/front?day=2026-02-01) (with the first AI story at #7, then #9), [February 9](https://news.ycombinator.com/front?day=2026-02-09) (first at #8), and [February 25](https://news.ycombinator.com/front?day=2026-02-25) (with AI at #6, #9, #10).

For the second part of the experiment — figuring out which stories were likely AI-written — I tapped into [Pangram](https://pangram.com/). Pangram is a remarkably good, conservative model for detecting LLM-generated text. These detectors have bad rap among techies, but the objections are often based on outdated assumptions or outright misconceptions. For the tools to work, AI writing doesn’t need to be in any way “inhuman”. It’s enough that the *default voice* of the current crop of LLMs is quasi-deterministic: ask for the same essay twice and you’ll get a stylistically similar result. The individual mannerisms are human-like, but it’s very unlikely that your writing combines the exact same set.

To validate the results, I also reviewed all the flagged stories and I think the findings make sense; if anything, Pangram had a couple of false negatives. To give you a sense of what was flagged, have a look at the #3 story on [February 19](https://news.ycombinator.com/front?day=2026-02-19) (*“AI is not a coworker, it’s an exoskeleton”*). In my opinion, it has a wide range of red flags.

[Subscribe now](https://lcamtuf.substack.com/subscribe?)