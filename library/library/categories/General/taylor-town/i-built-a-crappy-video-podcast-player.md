+++
title = "I built a crappy video podcast player"
description = "2005 birthed the iPod Video and YouTube."
date = "2026-05-08T00:00:00Z"
url = "https://taylor.town/telecasts-000"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-05-20T09:23:01.474036286Z"
seen = false
+++

**tl;dr:** Try out [telecast.company](https://telecast.company); share your complaints/gripes [on GitHub](https://github.com/surprisetalk/telecast).

2005 birthed the [iPod Video](https://ipodwiki.com/wiki/IPod_video) and [YouTube](https://en.wikipedia.org/wiki/YouTube).

20 years later… it's 2025. Compare YouTube against the podcast (iPod broadcast) ecosystem. YouTube pisses off its creators, fuels a clickbait thumbnail arms-race, and fosters addiction (protip: [disable recommendations](https://github.com/lawrencehook/remove-youtube-suggestions)). Podcasters thrive in an ecosystem of interviews, educational content, and long-form journalism.

Okay, this is a bit unfair. Trash podcasts exist. Quality YouTube channels exist (and are strafing over to [Nebula](https://nebula.tv)). Incentives tend to produce different median media on their platforms; YouTube's centralized advertising model seems to encourage unsustainable behavior from its advertisers, its creators, and its consumers.

Yes, video podcasts have been a thing since 2005, but YouTube dominated online video by simplifying hosting/delivery/discovery. Twenty years later, creating/consuming video podcasts remains an awful experience.

"vidcast" and "vodcast" are clunky portmanteaus, so I'm co-opting the term "telecast" (television broadcast) for video podcasts.

Proof-of-Concept
----------

And so I built a very crappy video podcast player.

![](https://taylor.town/telecasts-000-1.gif)

Some initial features/findings:

* I first tried [VanJS](https://vanjs.org), but ended up [using Elm](https://taylor.town/elm-2023). Elm is handy for medium-sized projects like this!
* [podcastindex.org](https://podcastindex.org) is a great resource for jumpstarting podcast search! Unfortunately, it doesn't provide any easy means of exclusively searching *video* podcasts/episodes, so I'll likely have to build my own directory from scratch.
* Podcasts apparently support [live broadcasts](https://podcastindex-org.github.io/docs-api/#get-/episodes/live)!
* YouTube already already [exposes an RSS feed for every channel](https://www.reddit.com/r/selfhosted/comments/mgnsyg/quicktip_youtube_channels_have_an_rss_feed/)! But searching/browsing YouTube channels will impede telecast adoption.
* I eventually want to facilitate creator donations, but web monetization is not quite there yet.
* The loading times for thumbnails was prohibitively slow for many podcast feeds.
* Full [local-first](https://www.localfirst.fm) will not be feasible with limited browser storage, but it will ease the transition to native apps
* The app looks way too empty/intimidating on first load. I'll want to create some curated starter packs.

Throw One Away
----------

That prototype was too crappy. I tossed it in the proverbial garbage.

"Throw One Away" is my favorite way of acclimating to a new problem domain.

Here's what it looks like now:

![](https://taylor.town/telecasts-000-3.gif)

It's designed to be [local-first](https://www.inkandswitch.com/local-first-software/) software; nearly everything lives in the frontend. The only server endpoints are (1) a public search API and (2) a CORS/cache proxy for RSS feeds and video thumbnails.

I used [duckdb](https://duckdb.org) and some [nasty sql](https://github.com/surprisetalk/telecast/blob/main/scripts/podcastindex.sql) to load the search database with \~100K feeds from [PodcastIndex.org](https://podcastindex.org).

```
curl -O https://public.podcastindex.org/podcastindex_feeds.db.tgz
tar -xzf podcastindex_feeds.db.tgz -C /tmp/
sed "s|\$DATABASE_URL|$DATABASE_URL|" import_feeds.sql | duckdb
```

Thanks to [PodcastIndex.org](https://podcastindex.org) for helping make the internet open, free, and accessible!

Beyond video podcasts, I also added a bunch of my favorite RSS feeds from YouTube, plus channels from Kagi's [smallyt.txt](https://github.com/kagisearch/smallweb/blob/main/smallyt.txt) list.

The code is [on Github](https://github.com/surprisetalk/telecast). It's crappy, but it's *mine* -- I'm tired of smelling other people's crap.

Try it out at [telecast.company](https://telecast.company)