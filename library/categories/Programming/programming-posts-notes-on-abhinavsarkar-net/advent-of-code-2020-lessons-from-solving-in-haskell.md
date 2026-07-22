+++
title = "Advent of Code 2020 — Lessons from Solving in Haskell"
description = "After many years of trying unsuccessfully, I finally completed all 25 days of the Advent of Code 2020 in Haskell. Here is a summary of my learnings and solutions."
date = "2020-12-26T00:00:00Z"
url = "https://abhinavsarkar.net/notes/2020-aoc-learnings/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.606271080Z"
seen = false
+++

After many years of trying unsuccessfully, I finally completed all 25 days of the [Advent of Code 2020](https://adventofcode.com/2020/) in Haskell. Here is a summary of my learnings and solutions.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2020-aoc-learnings/?mtm_campaign=feed).

This post is a part of the series: **Advent of Code 2020**.

1. [Week 1](https://abhinavsarkar.net/notes/2020-aoc-wk1/?mtm_campaign=feed)
2. [Week 2](https://abhinavsarkar.net/notes/2020-aoc-wk2/?mtm_campaign=feed)
3. [Week 3](https://abhinavsarkar.net/notes/2020-aoc-wk3/?mtm_campaign=feed)
4. [Week 4](https://abhinavsarkar.net/notes/2020-aoc-wk4/?mtm_campaign=feed)
5. **Lessons from Solving in Haskell** 👈

Learnings[#](#learnings)
----------

* GHCi is a powerful REPL. We can do almost anything in it which we can do in a file. It is also fast and great to play with code.
* [Zippers](https://web.archive.org/web/20201226/http://learnyouahaskell.com/zippers) are an awesome technique to move around in a data structure. We can also think of them as focus points in spaces like lines, plains or 3D volumes. Many AoC problems are about moving around in space, doing things at the focus points. Zippers are quite suitable for such problems.
* [Data.List.Split](https://hackage.haskell.org/package/split/docs/Data-List-Split.html) module is good enough for basic input parsing.
* It is trivially easy to write a simple but feature-rich parser framework in Haskell. [Here](https://abhinavsarkar.net/notes/2020-aoc-wk2?mtm_campaign=feed#day-7) is one in its entirety, with some example parsers, in just 24 lines.
* [Data.Graph.Wrapper](https://hackage.haskell.org/package/graph-wrapper/docs/Data-Graph-Wrapper.html) is a useful wrapper over [Data.Graph](https://hackage.haskell.org/package/containers/docs/Data-Graph.html).
* Haskell is good for writing interpreters.
* Graph traversal + Memoization = Dynamic programming.
* Use [Data.Memotrie](https://hackage.haskell.org/package/MemoTrie/docs/Data-MemoTrie.html) for side-effect-free memoization in Haskell.
* Sometimes it’s faster to recompute than to memoize because of the lazy nature of Haskell and the extra memory usage caused by memoization.
* [Comonads](https://hackage.haskell.org/package/comonad) are great to simulate [Cellular automata](https://en.wikipedia.org/wiki/Cellular_automaton). Zippers are comonads.
* Comonad based cellular automata do not mutate the state of the automata universe, neither do they compute and materialize the whole universe at every step of the automata. Rather, they just stack functions over functions to create new lazy views over the original universe. This means that we can have lazy infinite universes. This also means that simulating cellular automata using comonads tends to get slower with increasing number of neighbours/dimensions.
* Sometimes mutability is the only option if we want to implement a fast algorithm. Mutable vectors from the [vector](https://hackage.haskell.org/package/vector) library are great for this.
* Writing the [four-dimensional zipper comonad](https://abhinavsarkar.net/notes/2020-aoc-wk3?mtm_campaign=feed#day-17) from scratch is complex and takes a really long time.
* [There are no words](https://english.stackexchange.com/questions/56472/x-y-z-horizontal-vertical-and) similar to *horizontal* and *vertical* for three dimensions or more.
* [ReadP](https://hackage.haskell.org/package/base/docs/Text-ParserCombinators-ReadP.html) is a good, minimal and easy to use parser framework which is included in the Haskell standard library.
* Try to use [Bit arrays](https://en.wikipedia.org/wiki/Bit_array) when they fit, for performant solutions.
* Some problems, when scaled up, cannot be solved with lazy lists in a reasonable time.
* We can simulate a linked list of integers over a vector.
* If a program generates a lot of garbage, turning on multithreading (`-threaded`) and parallel garbage collection (`-qg0 -N`) may make it run faster.
* Tweaking the heap size (`-H`) and the allocation area size (`-A`) may make a program run faster.
* Use the [`Strict`](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/strict.html#extension-Strict) extension cautiously. Sometimes it may unexpectedly make a program run slower.
* [Hexagons are the bestagons](https://www.youtube.com/watch?v=thOifuHs6eY).

Solutions[#](#solutions)
----------

Here’s the index of all the solutions I wrote for AoC 2020:

|                 Problem                  |                                 Solution                                  |         Salient points         |                                                                           Libraries/modules used                                                                            |
|------------------------------------------|---------------------------------------------------------------------------|--------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [1](https://adventofcode.com/2020/day/1) | [1](https://abhinavsarkar.net/notes/2020-aoc-wk1?mtm_campaign=feed#day-1) |      List comprehensions       |                                                                                   *None*                                                                                    |
| [2](https://adventofcode.com/2020/day/2) | [2](https://abhinavsarkar.net/notes/2020-aoc-wk1?mtm_campaign=feed#day-2) |           Validation           |                                                                                   *None*                                                                                    |
| [3](https://adventofcode.com/2020/day/3) | [3](https://abhinavsarkar.net/notes/2020-aoc-wk1?mtm_campaign=feed#day-3) |            Zippers             |                                                                                   *None*                                                                                    |
| [4](https://adventofcode.com/2020/day/4) | [4](https://abhinavsarkar.net/notes/2020-aoc-wk1?mtm_campaign=feed#day-4) |           Validation           |                                                             [split](https://hackage.haskell.org/package/split)                                                              |
| [5](https://adventofcode.com/2020/day/5) | [5](https://abhinavsarkar.net/notes/2020-aoc-wk1?mtm_campaign=feed#day-5) |            Decoding            |                                                                                   *None*                                                                                    |
| [6](https://adventofcode.com/2020/day/6) | [6](https://abhinavsarkar.net/notes/2020-aoc-wk2?mtm_campaign=feed#day-6) |             *None*             |                                                                                   *None*                                                                                    |
| [7](https://adventofcode.com/2020/day/7) | [7](https://abhinavsarkar.net/notes/2020-aoc-wk2?mtm_campaign=feed#day-7) |        Parsing, graphs         |                             [mtl](https://hackage.haskell.org/package/mtl), [graph-wrapper](https://hackage.haskell.org/package/graph-wrapper)                              |
| [8](https://adventofcode.com/2020/day/8) | [8](https://abhinavsarkar.net/notes/2020-aoc-wk2?mtm_campaign=feed#day-8) |      Parsing, interpreter      |                                                               [mtl](https://hackage.haskell.org/package/mtl)                                                                |
| [9](https://adventofcode.com/2020/day/9) | [9](https://abhinavsarkar.net/notes/2020-aoc-wk2?mtm_campaign=feed#day-9) |             *None*             |                                                                                   *None*                                                                                    |
|[10](https://adventofcode.com/2020/day/10)|[10](https://abhinavsarkar.net/notes/2020-aoc-wk2?mtm_campaign=feed#day-10)|      Graphs, memoization       |                                                                                   *None*                                                                                    |
|[11](https://adventofcode.com/2020/day/11)|[11](https://abhinavsarkar.net/notes/2020-aoc-wk2?mtm_campaign=feed#day-11)|   Cellular automata, zippers   |               [comonad](https://hackage.haskell.org/package/comonad), [Data.Sequence](https://hackage.haskell.org/package/containers/docs/Data-Sequence.html)               |
|[12](https://adventofcode.com/2020/day/12)|[12](https://abhinavsarkar.net/notes/2020-aoc-wk2?mtm_campaign=feed#day-12)|            Geometry            |                                                                                   *None*                                                                                    |
|[13](https://adventofcode.com/2020/day/13)|[13](https://abhinavsarkar.net/notes/2020-aoc-wk3?mtm_campaign=feed#day-13)|         Number theory          |                                                                                   *None*                                                                                    |
|[14](https://adventofcode.com/2020/day/14)|[14](https://abhinavsarkar.net/notes/2020-aoc-wk3?mtm_campaign=feed#day-14)|      Parsing, interpreter      |                                                               [mtl](https://hackage.haskell.org/package/mtl)                                                                |
|[15](https://adventofcode.com/2020/day/15)|[15](https://abhinavsarkar.net/notes/2020-aoc-wk3?mtm_campaign=feed#day-15)|        Number sequence         |                               [Data.Vector.Unboxed.Mutable](https://hackage.haskell.org/package/vector/docs/Data-Vector-Unboxed-Mutable.html)                               |
|[16](https://adventofcode.com/2020/day/16)|[16](https://abhinavsarkar.net/notes/2020-aoc-wk3?mtm_campaign=feed#day-16)|Parsing, constraint satisfaction|                                                               [mtl](https://hackage.haskell.org/package/mtl)                                                                |
|[17](https://adventofcode.com/2020/day/17)|[17](https://abhinavsarkar.net/notes/2020-aoc-wk3?mtm_campaign=feed#day-17)|   Cellular automata, zippers   |                      [comonad](https://hackage.haskell.org/package/comonad), [Data.List](https://hackage.haskell.org/package/base/docs/Data-List.html)                      |
|[18](https://adventofcode.com/2020/day/18)|[18](https://abhinavsarkar.net/notes/2020-aoc-wk3?mtm_campaign=feed#day-18)|      Parsing, interpreter      |                                                               [mtl](https://hackage.haskell.org/package/mtl)                                                                |
|[19](https://adventofcode.com/2020/day/19)|[19](https://abhinavsarkar.net/notes/2020-aoc-wk3?mtm_campaign=feed#day-19)|            Parsing             |                                        [ReadP](https://hackage.haskell.org/package/base/docs/src/Text.ParserCombinators.ReadP.html)                                         |
|[20](https://adventofcode.com/2020/day/20)|[20](https://abhinavsarkar.net/notes/2020-aoc-wk4?mtm_campaign=feed#day-20)|       Image manipulation       |                                      [Data.Array.BitArray](https://hackage.haskell.org/package/bitwise/docs/Data-Array-BitArray.html)                                       |
|[21](https://adventofcode.com/2020/day/21)|[21](https://abhinavsarkar.net/notes/2020-aoc-wk4?mtm_campaign=feed#day-21)|Parsing, constraint satisfaction|                                        [ReadP](https://hackage.haskell.org/package/base/docs/src/Text.ParserCombinators.ReadP.html)                                         |
|[22](https://adventofcode.com/2020/day/22)|[22](https://abhinavsarkar.net/notes/2020-aoc-wk4?mtm_campaign=feed#day-22)|        Recursion, game         |                                                                                   *None*                                                                                    |
|[23](https://adventofcode.com/2020/day/23)|[23](https://abhinavsarkar.net/notes/2020-aoc-wk4?mtm_campaign=feed#day-23)|       Linked list, game        |                             [Data.Vector.Primitive.Mutable](https://hackage.haskell.org/package/vector/docs/Data-Vector-Primitive-Mutable.html)                             |
|[24](https://adventofcode.com/2020/day/24)|[24](https://abhinavsarkar.net/notes/2020-aoc-wk4?mtm_campaign=feed#day-24)|   Parsing, cellular automata   |[ReadP](https://hackage.haskell.org/package/base/docs/src/Text.ParserCombinators.ReadP.html), [Map](https://hackage.haskell.org/package/containers/docs/Data-Map-Strict.html)|
|[25](https://adventofcode.com/2020/day/25)|[25](https://abhinavsarkar.net/notes/2020-aoc-wk4?mtm_campaign=feed#day-25)|          Cryptography          |                                                                                   *None*                                                                                    |

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

This post is a part of the series: **Advent of Code 2020**.

1. [Week 1](https://abhinavsarkar.net/notes/2020-aoc-wk1/?mtm_campaign=feed)
2. [Week 2](https://abhinavsarkar.net/notes/2020-aoc-wk2/?mtm_campaign=feed)
3. [Week 3](https://abhinavsarkar.net/notes/2020-aoc-wk3/?mtm_campaign=feed)
4. [Week 4](https://abhinavsarkar.net/notes/2020-aoc-wk4/?mtm_campaign=feed)
5. **Lessons from Solving in Haskell** 👈

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2020-aoc-learnings/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Lobsters](https://lobste.rs/s/wmi6ma)
* [Reddit](https://www.reddit.com/r/haskell/comments/klspv9/)
* [Hacker News](https://news.ycombinator.com/item?id=25560044)
* [My website](https://abhinavsarkar.net/notes/2020-aoc-learnings/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)