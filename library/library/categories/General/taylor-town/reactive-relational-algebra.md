+++
title = "Reactive Relational Algebra"
description = "databases plus wibbly wobbly timey wimey stuff"
date = "2024-09-15T00:00:00Z"
url = "https://taylor.town/reactive-relational-algebra"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.260587612Z"
seen = true
+++

th, td { font-family: monospace; }

Personally, [relational algebra](https://en.wikipedia.org/wiki/Relational_algebra) feels more "invented" than "discovered". Sometimes the whole thing smells like a [kludge](https://en.wikipedia.org/wiki/Kludge) that weasled its way into modern CS curricula.

But hey, if you're rigorously thinking about databases/tables/spreadsheets, and you need to build on the work of really really smart people, then relational algebra starts looking like an attractive corner of math & computing theory.

Anyway, so here I am, trying to build ["better spreadsheets"](https://taylor.town/better-spreadsheets), and I'm playing with "derived" tables that feel like [database views](https://en.wikipedia.org/wiki/View_(SQL)):

```
A[t+1] = B[t] ∪ C[t]
```

 This is my way of saying that "A will be derived from the union of B and C".

The whole reason I added the [wibbly wobbly timey wimey](https://tardis.fandom.com/wiki/Wibbly_wobbly,_timey_wimey) stuff is that my spreadsheet program works with async data (e.g. HTTP requests, SQL queries).

 I somehow settled on a time-indexed paradigm inspired by discrete [functional reactive programming](https://en.wikipedia.org/wiki/https://en.wikipedia.org/wiki/Functional_reactive_programming). My brain is apparently too smooth to grok what FRP is, so I have no clue if my idea here is actually related or not.

I really wanted to model concurrent async database operations like this:

```
A[t+n+1] = B[t] ∪ C[t+n]
```

 This is my way of saying that "A will be derived from B and the async/future result of C."

This notation was surprisingly helpful for thinking through some hairy concurrency stuff!

But anyway, when I started building actual async spreadsheets, I found myself making lots of intermediate tables to emulate "memory". At some point, I realized it was easiest to "merge" tables using self-reference:

```
A[t+1] = A[t] ∪ B[t]
```

For example:

| t |      A      |    B    |
|---|-------------|---------|
| 0 |     []      |[{a},{b}]|
| 1 |  [{a},{b}]  |  [{a}]  |
| 2 |  [{a},{b}]  |   []    |
| 3 |  [{a},{b}]  |  [{c}]  |
| 4 |[{a},{b},{c}]|  [{c}]  |
| … |      …      |    …    |

Hey, this feels pretty good!

Intuitively, you can guess that self-unioning sets can only gain rows; likewise, self-intersecting sets only lose rows. Intuitively, you can also guess that the behavior of all other operators are trivial exercises in some category theory theorem that bounced off the surface of my smooth brain.

With all of relational algebra (and its extensions) at your disposal, you can express some pretty cool stuff:

```
A[t+1] = φ{i>=max(i)-5}(A[t] ∪ B[t] ⨝ C[t])
```

"A will be the last five records of B joined with C."

My latest equivalent [scrapscript](https://scrapscript.org) notation looks something like this:

```
a1 . a1 = a0 |> sheet/union (sheet/join b0 c0) |> sheet/limit 5
```

This query DSL feels very natural in my experimental scrapsheet demos! I'm excited to see whether the paradigm handles more complexity.

Anyway, this is where my reactive relational algebra ends for now (and probably forever). Feel free to email me at [hello@taylor.town](mailto:hello@taylor.town) if you have any ideas on where to go next.

See you in the next timestep!