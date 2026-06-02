+++
title = "Mitigating floods of posts in Artemis"
description = "Note: The logic described in this post may be a stepping stone to a more robust system in the future. Please keep that in mind as you read and know that my solution may not be optimal, rather a start toward solving a problem. This morning I opened Artemis and found a website I ha"
date = "2026-05-30T00:00:00Z"
url = "https://jamesg.blog/2026/05/30/mitigating-floods-of-posts-in-artemis"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-06-01T21:30:16.229157872Z"
seen = false
+++

*Note: The logic described in this post may be a stepping stone to a more robust system in the future. Please keep that in mind as you read and know that my solution may not be optimal, rather a start toward solving a problem.*

This morning I opened Artemis and found a website I had been following for a few months had published almost a dozen posts today. The website was now, unfortunately, a [zombie site](https://indieweb.org/zombie_site). This experience left me with two questions:

1. What should Artemis do if a site publishes significantly more posts than usual, and;
2. What should Artemis do if a site becomes a zombie site?

These are two separate questions. This afternoon, I addressed the first one by adding new logic to check for if a site posts more than usual. When Artemis prepares a user’s reader with the lists of posts from sites to which they are subscribed, an additional check now happens to identify if a site is going to flood a user’s feed.

This check is as follows: Artemis counts how many posts an author has published one each day they have published a post. For each day, in ascending order by publishing date, if the author has published more than three times the maximum number of posts they have published in a day up until that date (using a 30 day rolling window <sup class="footnote-reference" id="f-1"><a href="https://jamesg.blog/longform-feed#1">1</a></sup>), and the author has published on more than two unique days in total (to prevent false positives), the author will be flagged for that day.

Importantly, the check happens on a per-day, per-author basis. This is important because posting habits may change over time, and each author has a different posting habit; a heuristic like “do something if an author publishes more than N posts” would be liable to many false positives (i.e. news sites post a lot whereas personal websites often post fewer things per day).

If an author is flagged for a day, their posts from that day will be [collapsed into a roll-up](https://jamesg.blog/2026/01/19/announcing-artemis-roll-up). A roll-up is a list of posts by an author published in a given time frame. A link to a roll-up created as a result of the logic described above will appear as a single entry with a title like this in Artemis:

> Roll-up for example.com on 2026-05-30 (Author published more than usual)

With this implementation, a user’s feed will no longer be flooded if an author suddenly posts way more than expected. Instead, the user will get a link to a dedicated page so they can review the posts. In addition, this implementation will reduce the chance that a site that has recently become a zombie and is now spamming floods your feed.

The logic above does not explicitly identify zombie sites (this could be done with a separate series of heuristics, for example checking for language changes, site generator changes, post frequency, time since last post), but it does catch the scenario that led to my feed being flooded this morning: a site I first followed several months ago came online again and published almost a dozen posts in a short space of time.

From a user experience perspective, seeing a flood of posts is overwhelming. This is the opposite feeling I want someone to have when encountering a calm reader. Indeed, if someone subscribes to an author that publishes several times per day, that is okay: the user knows to expect many posts. But in the case of an author suddenly publishing a dozen posts in a day – 12x more than usual on days they posted – the experience is not ideal.

As I mentioned in the preface to this post, I suspect my logic will need tinkering. The use of maximums may lead to false positives; there may be more optimal ways to do this. If any ideas come to mind, please let me know. But, the logic I have today is a start, and an important one at that: floods of posts in a reader are not an ideal experience. Meanwhile, I need to also think about detecting zombie sites. Perhaps the logic above could be one heuristic to take into account when determining if a site has become a zombie.

There is one notable case where this logic fails: it only works on the first day a site has flooded a user's feed (until the maximum count resets every 30 days). But, I think this is good enough to prevent cases of accidental flooding. And, for sites that have become a zombie, a roll-up with the title "(Author published more than usual)" provides a cue to the user that a feed may need to be reviewed.

<sup class="footnote-definition-label" id="f-2">1</sup>

Because the maximum resets every 30 days, it means that an author posting a lot on one day far in the past will not break the logic.

[[↩]](https://jamesg.blog/longform-feed#f-1)

[zombie site](https://indieweb.org/zombie_site) [collapsed into a roll-up](https://jamesg.blog/2026/01/19/announcing-artemis-roll-up) [1](https://jamesg.blog/longform-feed#1) [[↩]](https://jamesg.blog/longform-feed#f-1)