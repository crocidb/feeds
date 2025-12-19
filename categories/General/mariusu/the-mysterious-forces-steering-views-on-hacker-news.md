+++
title = "The Mysterious Forces Steering Views on Hacker News"
description = "How the moderators behind one of the internet's most popular platforms for tech content have a say into which content you consume."
date = "2025-12-18T10:06:58Z"
url = "https://xn--gckvb8fzb.com/the-mysterious-forces-steering-views-on-hacker-news/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2025-12-19T13:15:18.490623265Z"
seen = true
+++

I was initially torn about whether to publish this story, as I don’t have a clear or constructive recommendation on how to resolve the issue. I also didn’t want to come across as a paranoid conspiracy theorist – birds aren’t real, by the way. However, after repeatedly witnessing firsthand how *Y Combinator’s* *Hacker News* platform influences the spread of information and, consequently, opinions within the *tech scene*, I believe this topic deserves to be discussed, even if only briefly.

I approached this subject rationally, aiming to explain certain metrics I observed in my log files. I began exploring the [*Hacker News* algorithms](https://www.righto.com/2013/11/how-hacker-news-ranking-really-works.html), along with [related posts](https://drewdevault.com/2017/09/13/Analyzing-HN.html) by [other authors](https://daringfireball.net/2025/03/the_website_hacker_news_is_afraid_to_discuss) and, naturally, the [comment sections](https://news.ycombinator.com/item?id=34626587) of [those discussions](https://news.ycombinator.com/item?id=15507821). Although I hadn’t previously delved into the topic, the deeper I went, the more I realized it wasn’t just a case of me being *overly paranoid* or *seeing ghosts*. It became increasingly clear that some form of *censorship*, whether through subtle *slowing* or outright *blocking*, does seem to be a recurring issue on the *Hacker News* platform. By *censorship*, I don’t mean the removal of deceptive or harmful content, but rather the suppression of factual material that happens to be critical of, let’s say, *friends of Y Combinator*.

I began writing this post after noticing unusual behavior when another one of my articles was shared on *Hacker News*. It triggered an immediate spike in traffic, which then dropped off abruptly for no apparent reason. While [the post in question](https://news.ycombinator.com/item?id=44617309) appeared to resonate with many readers, it rapidly fell from the top ranks of the *Hacker News* front page to the second, then third, and within minutes to the fourth page.

The decline was *so* sudden that even the very people whose product my post was criticizing, and who understandably weren’t pleased with it, [stepped in to dispute any claims of *censorship*](https://news.ycombinator.com/item?id=44620611). Nevertheless, the data from my [analytics](/infrastructure/#analytics) clearly shows a traffic chart in a shape that couldn’t be further from being *organic*, leading to the assumption that the post was demoted from the front page both sharply and deliberately.

**Note:** The Element CEO’s comment reads:

>
>
> neither YC nor any YC-intermediary is an investor in NV
>
>

This statement, however, doesn’t appear to be factually true. *Protocol Labs*, who is the lead investor of the [*Series B* funding round](https://www.crunchbase.com/funding_round/new-vector-im-series-b--418b3026) of *Element* (*New Vector*), was initially founded as part of the [*Y Combinator S14 program*](https://www.protocol.ai/about/).

This means that *Y Combinator* invested money into *Protocol Labs*, who in turn is a lead investor in *New Vector*, the company behind *Element*. One could argue that there **is in fact** an interest by *Y Combinator*, or at the very least by *their friends* over at *Protocol Labs* to protect *Element* from negative publicity – if you can even call my post that.

Similarly, I analyzed gigabytes of log files and traffic behavior for another [post of mine that gathered *some* attention on *news.ycombinator.com*](https://news.ycombinator.com/item?id=45667615) just recently. In this case, however, the *censorship* became more evident, even to the [casual](https://news.ycombinator.com/item?id=45668626) [reader](https://news.ycombinator.com/item?id=45668324) [on *Hacker News*](https://news.ycombinator.com/item?id=45668293). If you’re looking at the post today, though, you might not fully understand the comments, as the post is clearly no longer *flagged*.

This critical deep dive into a specific project by a well-known tech figure took off within minutes of being shared on *Hacker News*. My analytics immediately alerted me to a surge in traffic, which is when I first noticed. The post reached the [Top 5 list](https://bsky.app/profile/hackernewstop5.bsky.social/post/3m3rtsfafes2f) ([on *X*](https://twitter.com/hackernewstop5/status/1980974314611757345)) on *Hacker News*’ front page within minutes, accumulating over 40 upvotes in a short period. Then, abruptly, the traffic came to a complete stop when the post was suddenly *flagged* by *Hacker News* for no apparent reason.

Even though the post was *flagged* and essentially became invisible on the platform, community interest remained so high that the post went from about 50 upvotes to over 100, all while still being effectively censored. It wasn’t until several hours later (amid puzzled comments from the *HN* community and others) that *Hacker News* seemingly decided to silently *unflag* the post, as if nothing had ever happened and the post simply didn’t gain a lot of traction. And it worked:

The post had dropped from the visible ranks and wasn’t going to return. *Hacker News* had effectively stopped it at just the right the moment, when it could have gained serious traction, as it was scrutinizing a project tied to a prominent and influential tech figure.

While the post was picked up by *Lobsters* and spread further, attracting many views and, more importantly, thoughtful responses, its reach didn’t come close to matching the influence of what seems to be the most powerful tech aggregator on the internet.

Tl;dr
----------

*Hacker News* is neither unbiased nor free from censorship. While it generally remains hands-off with neutral content, the moment a post that’s critical or even just slightly negative towards projects or companies affiliated with *Y Combinator* (either directly or indirectly) gains traction, the platform’s moderation team will seemingly step in to significantly limit its reach.

Unfortunately, I don’t believe there’s anything the community can do about this, as *Hacker News* has maintained its position as a leading *tech news institution* for years, with little competition on the horizon. As search engines continue their decline and are increasingly replaced by similarly censored LLMs, the discoverability of tech content, especially slightly more critical pieces, is likely to become a significant challenge in the future. My only advice is to keep in mind that, whenever you find yourself browsing *Hacker News*, you’re seeing a *curated* view of the current tech landscape that won’t necessarily represent the full picture.