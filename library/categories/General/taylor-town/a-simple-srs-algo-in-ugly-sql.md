+++
title = "A Simple SRS Algo (in Ugly SQL)"
description = "There are plenty of excellent off-the-shelf SRS algorithms out there, but I needed something (1) optional, (2) debuggable, and (3) cheap."
date = "2024-02-14T00:00:00Z"
url = "https://taylor.town/flashcasts-srs-algo"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.329335728Z"
seen = true
+++

![A digital flashcard showing "Basic lasagna recipe?" with forgot, flip, and remembered buttons.](https://taylor.town/lasagna.png)

I recently built [flashcasts](https://flashcasts.com), which delivers spaced-repetition software via podcast feeds.

There are plenty of excellent [off-the-shelf SRS algorithms](https://en.wikipedia.org/wiki/Spaced_repetition#Algorithms) out there, but I needed something (1) optional, (2) debuggable, and (3) cheap.

Optional
----------

Via the website, you can record whether you remembered or forgot each card, and it'll adjust future episodes based on your input.

But podcasts are a very "on-the-go" medium, so I needed an algorithm that wouldn't punish you for inconsistent or nonexistent scores.

The card feedback mechanism on flashcasts needed to work when used, but somehow also work when neglected.

Debuggable
----------

Deck shuffling seems like a really annoying problem to triage, so it was important to find something small enough to fit in my small skull.

For reference, here is the infamous [SM-2](https://en.wikipedia.org/wiki/SuperMemo) algo:

```
input:  user grade q, repetition number n, easiness factor EF, interval I
output: updated values of n, EF, and I

if q ≥ 3 (correct response) then
    if n = 0 then I ← 1
    else if n = 1 then I ← 6
    else I ← round(I × EF)
    end if
    increment n
else (incorrect response)
    n ← 0
    I ← 1
end if

EF ← EF + (0.1 − (5 − q) × (0.08 + (5 − q) × 0.02))
if EF < 1.3 then EF ← 1.3 end if

return (n, EF, I)
```

I'm sorry to tell you that SM-2, shown above, is [one of the simpler ones in the series](https://supermemo.guru/wiki/Algorithm_SM-18).

Sidenote: modern software devs seem to "simulate" processes in places where basic highschool maths suffice. My suspicion is that most folks store intermediate states rather than designing systems around their irreducible artifacts. I'm perpetually curious how others tame complexity, so feel free to email me at [hello@taylor.town](mailto:hello@taylor.town) if you have any thoughts on this topic.

Anyway, here's the basic framework I came up with:

1. Coarsely sort cards by timestamps to prioritize recently seen/added cards.
2. Penalize cards by fractions of episode intervals to tweak sorting.

Here's the base idea, which we'll build upon:

```
cards.sort(card => {
  const {
    period=1*24*60*60, // interval between new episodes
    chaos=0.3, // adds nondeterminism
  } = card.feed.settings; // cofigurable by user
  return
    (card.last_scored_at || card.created_at || now())
    // Randomly penalize each card by a number of episodes.
    // e.g. chaos=2 will penalize each card by 0-2 episodes
    // Beware "escape velocity trap", where only recently scored cards can be shuffled.
    + period * random() * chaos
```

Let's add a naive learning-curve by penalizing longer cards:

```
cards.sort(card => {
  const {
    period=1*24*60*60, // interval between new episodes
    ease=1.0, // how much difficulty affects ordering
  } = card.feed.settings; // cofigurable by user
  return
    (card.last_scored_at || card.created_at || now())
    // Logarithmically penalize cards based on string length.
    // e.g. ease=1 will penalize 2-letter cards by 1 episode
    // e.g. ease=1 will penalize 10-letter cards by 2 episodes
    // e.g. ease=1 will penalize 20-letter cards by 3 episodes
    // e.g. ease=1 will penalize 140-letter cards by 4 episodes
    // Note that it's only the back of the card, which is the harder part of flashcards.
    // Escape velocity trap also applies here.
    + period * ln(1+card.back.length) * ease
```

Finally, the feedback loop, and the key to reaching "escape velocity":

```
cards.sort(card => {
  const {
    deceleration=0.7, // how quickly intervals grow longer (per card)
    feedback=1.2 // how much your scores affect things
  } = card.feed.settings; // cofigurable by user
  return
    (card.last_scored_at || card.created_at || now())
    // Geometrically penalize cards based on existing scores.
    // card.scores_avg ranges between 0.0 and 1.0
    // e.g. decel=0, fdbck=0 will penalize all cards equally
    // e.g. decel=0, fdbck=2 will penalize higher-scores harder
    // e.g. decel=2, fdbck=0 will penalize a card by n²  episodes each time it's scored
    // e.g. decel=1, fdbck=1 will penalize a card by score_count*score_avg episodes
    + period
      * card.scores_count ^ deceleration
      * card.scores_avg ^ feedback
```

Altogether, here's the final SQL that I use:

```
coalesce(s.created_at,c.created_at,now())
+ f.every
  * random()             * coalesce(fd.chaos,        0.3) -- how much randomness
+ f.every
  * coalesce(s._count,7) ^ coalesce(fd.deceleration, 0.7) -- how quickly the intervals grow longer
  * s._avg               ^ coalesce(fd.feedback,     1.2) -- how much your scores affect things
+ f.every
  * ln(1+c.bytes_b)      * coalesce(fd.ease,         1.0) -- how much the difficulty affects the ordering
```

Cheap
----------

To maintain my commitment to [frugly](https://taylor.town/frugly) pricing and [lifetime licenses](https://taylor.town/lifetime-licenses), I needed to make something that was economical and stable. I chose to go all-in on SQL, because it's unfortunately unbeatable for stuff like this.

Seriously, is there any way to do stuff like this cheaper/easier? To my chagrin, SQL often seems like the global minimum for combined server costs and development time.

Here's the entirety of the logic that creates new episodes for each feed:

```
with episode_ as (...) -- stale episodes
insert into episode (episode_id, feed_id, card_ids)
select left(md5(random()::text),16), feed_id, array_agg(card_id)
from (
  select feed_id, card_id
  from (
    select feed_id, deck_id, card_id, per_episode, row_number() over (partition by feed_id, deck_id) as n
    from episode_ e_
    inner join feed f using (feed_id)
    inner join feed_deck fd using (feed_id)
    inner join card c using (deck_id)
    left join lateral (
      select now() as created_at, avg(coalesce(s.score::int::real,0.5)) as _avg, count(s.score) as _count
      from score s, episode e
      where f.usr_id is not null and e.feed_id = e_.feed_id and (s.episode_id,s.card_id) = (e.episode_id,c.card_id)
    ) s on true
    where not c.card_id = any(fd.hidden_card_ids)
    order by
      coalesce(s.created_at,c.created_at,now())
      + f.every
        * random()             * coalesce(fd.chaos,        0.3) -- how much randomness
      + f.every
        * coalesce(s._count,7) ^ coalesce(fd.deceleration, 0.7) -- how quickly the intervals grow longer
        * s._avg               ^ coalesce(fd.feedback,     1.2) -- how much your scores affect things
      + f.every
        * ln(1+c.bytes_b)      * coalesce(fd.ease,         1.0) -- how much the difficulty affects the ordering
    , random()
  ) a
  where per_episode >= n
  order by random()
) b
group by feed_id
```