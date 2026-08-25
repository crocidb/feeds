+++
title = "The Making of This Website"
description = "Almost nine years ago, I decided to write my own website generator. Static-site generators (SSGs) were sort of new back then, and somewhat fascinating to me. After failing to start a website/blog for a decade, I realized that I’ll never be satisfied by a ready-made solution, and "
date = "2026-06-26T00:00:00Z"
url = "https://abhinavsarkar.net/notes/2026-making-this-website/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-08-24T15:49:20.747406474Z"
seen = false
+++

Almost nine years ago, I decided to write my own website generator. Static-site generators (SSGs) were sort of new back then, and somewhat fascinating to me. After failing to start a website/blog for a decade, I realized that I’ll never be satisfied by a ready-made solution, and I need to make something of my own. I started with [Hakyll](https://jaspervdj.be/hakyll/), a small SSG framework written in Haskell. Over years, I expanded my website by adding new sections and features. The website code has grown from 500 lines to over 17000 lines now. This note recalls the story of the same.

The Hakyll Era[#](#the-hakyll-era)
----------

Some time in September 2017, I started with the 483 lines of example code Hakyll comes with. I liked Haskell and Hakyll was pretty easy to get started with because of ample examples and tutorials. It worked as expected for making a small blog-like website. All was good.

Over the next couple of years, I started adding non-blog like features to the website. I added the [Activities](https://abhinavsarkar.net/activities/?mtm_campaign=feed) and [Readings](https://abhinavsarkar.net/readings/?mtm_campaign=feed) pages, and support for showing [Webmentions](https://webmention.net/). As I added more kinds of pages and features, the limitations of Hakyll started showing. Hakyll is written for blog-like websites and is quite opinionated in certain ways. I wanted my website to be more. Soon I was fighting against it all the time.

My SSG code had grown to over 6000 lines by 2020. I needed something that allowed me to extend my website in any way I wanted. I needed a [build system](https://en.wikipedia.org/wiki/build_system). And [Shake](https://shakebuild.com/) was the answer.

Shake is a build system written in Haskell, which is used to build the Haskell compiler [GHC](https://www.haskell.org/ghc/). But it is general enough that it can be used to build anything, including a website. It is far less opinionated than Hakyll, and much more optimized. Thus, began the Shake Era.

The Shake Era[#](#the-shake-era)
----------

Shake simply generates a set of output files from a set of input files by running the rules that the programmer specifies. It provides incremental building, caching, parallelism, profiling, and many other features that are useful for build systems, and were useful to me too.

I rewrote the code for months and moved over everything from Hakyll to Shake in a single large commit (+3370/−1931). Now I had almost 8000 lines of code, but I was free to mold the website any way I wanted. It was truly a website generator, not just a blog generator. This migration led to the next era of explosive feature growth.

The Growth Era[#](#the-growth-era)
----------

Now that adding a new feature was as easy as adding a new Shake rule, I added everything that I fancied: [Search](https://abhinavsarkar.net/search/?mtm_campaign=feed) and [Now](https://abhinavsarkar.net/now/?mtm_campaign=feed) pages, many fancy [Pandoc](https://pandoc.org/) filters for my posts, support for pulling external comments from Reddit, Lobsters, etc.

In 2022, I did another major migration, this time from using [Docker](https://docker.com) to build and deploy my website to [Nix](https://nixos.org). Through the next few years, I kept adding new pages, sections, and features. Though I have not updated the [Colophon](https://abhinavsarkar.net/colophon/?mtm_campaign=feed) page in a while, it captures a lot of stuff I built over the years.

The website code also kept growing.

[![Lines of code over time, broken down by language.](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%201000%20600'%3E%3C/svg%3E) \<img src="/images/plots/pandocplot16802188496773894216.svg" class="w-100pct" alt="Lines of code over time, broken down by language."\>\</img\>](https://abhinavsarkar.net/images/plots/pandocplot16802188496773894216.svg) Lines of code over time, broken down by language. <details> <summary> Data as table </summary>

| Date  |Haskell modules|Haskell LoC|Templates LoC|Stylesheets LoC|JS LoC|Total LoC|
|-------|---------------|-----------|-------------|---------------|------|---------|
|2017-09|       2       |    202    |     86      |      195      |  0   |   483   |
|2017-12|      11       |    747    |     282     |      693      | 125  |  1847   |
|2018-12|      17       |   1249    |     509     |     1333      | 542  |  3633   |
|2019-12|      22       |   1609    |     663     |     1859      | 771  |  4902   |
|2020-05|      34       |   2401    |     739     |     2252      | 1048 |  6440   |
|2020-06|      48       |   3725    |     877     |     2274      | 1048 |  7924   |
|2022-12|      61       |   4985    |    1033     |     2781      | 1396 |  10195  |
|2024-12|      68       |   5768    |    1161     |     3050      | 1609 |  11588  |
|2025-12|      84       |   8704    |    1704     |     3733      | 1486 |  15627  |
|2026-06|      89       |   10028   |    1859     |     4043      | 1695 |  17625  |

</details>
---

The Optimization Era[#](#the-optimization-era)
----------

In 2025, I wrote a lot. I also migrated my notes from a [separate website](https://notes.abhinavsarkar.net?mtm_campaign=feed) to this website. The number of posts was now over a hundred. Around mid-2025, the website generator was starting to become slow to run. It often took 5 minutes to run, and consumed 5–8 GB of memory. It was a real pain for me because I had to pay for a large, expensive, and mostly unutilized VPS just to run it. I knew a big price hike was coming, so I decided to optimize the SSG.

Shake and Haskell profiling were a great help for this. First, I analyzed profiling charts and traces. I moved a lot of data from memory to disk, adjusted Shake concurrency and other settings, used specialized libraries to reduce GC pressure, cut down on unused dependencies, batched rules together, etc. At the same time, I refactored a lot of code to be more easily maintainable. [All of these](https://abhinavsarkar.net/notes/2025-website-work/?mtm_campaign=feed) paid off, and I was able to move to a much smaller and cheaper VPS after the changes.

Now[#](#now)
----------

Quoting my [very first blog post](https://abhinavsarkar.net/notes/2026-indieweb-start/?mtm_campaign=feed) on this domain from 18 years ago:

>
>
> I intend to make this website an archive of everything by me and about me on Internet.
>
>

That’s what I wanted from the beginning, and that’s what I’ve been on a journey to fulfill. I must have spent thousands of hours on it, but it’s been worth it. I love how it is and how it has grown. I don’t know what the future holds for it, but it’ll be bespoke.

### The Numbers Today[#](#the-numbers-today) ###

* 89 Haskell modules, 10028 lines of Haskell.
* 41 stylesheets (4043 lines), 55 templates (1859 lines), 20 JS files (1695 lines).
* 245 Haskell dependency libraries.
* 276 [changelog](https://abhinavsarkar.net/changelog/?mtm_campaign=feed) entries.
* 1937 Git commits on code (not content).
* 2550 output files generated.

[![Haskell module dependency graph](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%202846%202160'%3E%3C/svg%3E) \<img src="/images/2026-my-own-ssg/site-mods.svg" class="w-100pct mw-100pct" alt="Haskell module dependency graph"\>\</img\>](https://abhinavsarkar.net/images/2026-my-own-ssg/site-mods.svg) Haskell module dependency graph

Conclusion[#](#conclusion)
----------

I consider this website an expression and an extension of myself. Each line of code written for a specific purpose. Every setting carefully chosen. Most people are okay with an off-the-shelf SSG, and honestly I think that’s a great option. For some people like me, writing one from scratch is the only way to go.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2026-making-this-website/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/116817211320429646)
* [My website](https://abhinavsarkar.net/notes/2026-making-this-website/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)