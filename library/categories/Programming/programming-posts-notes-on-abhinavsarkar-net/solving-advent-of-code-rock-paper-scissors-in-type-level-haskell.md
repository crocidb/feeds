+++
title = "Solving Advent of Code “Rock-Paper-Scissors” in Type-level Haskell"
description = "Let’s solve part 1 of today’s Advent of Code challenge “Rock Paper Scissors” in type-level Haskell."
date = "2022-12-02T00:00:00Z"
url = "https://abhinavsarkar.net/notes/2022-type-level-rps/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.567815735Z"
seen = false
+++

Let’s solve part 1 of today’s Advent of Code [challenge](https://adventofcode.com/2022/day/2) “Rock Paper Scissors” in type-level Haskell.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2022-type-level-rps/?mtm_campaign=feed).

This post is a part of the series: **Solving Advent of Code**.

1. [“Handy Haversacks” in Type-level Haskell](https://abhinavsarkar.net/posts/type-level-haskell-aoc7/?mtm_campaign=feed)
2. [“No Space Left On Device” with Parsers, Zippers and Interpreters](https://abhinavsarkar.net/posts/parsers-zippers-interpreters-aoc7/?mtm_campaign=feed)
3. **“Rock-Paper-Scissors” in Type-level Haskell** 👈
4. [“Aplenty” by Compiling](https://abhinavsarkar.net/posts/compiling-aoc23-aplenty/?mtm_campaign=feed)
5. [“Seating System” with Comonads and Stencils](https://abhinavsarkar.net/posts/solving-aoc20-seating-system/?mtm_campaign=feed)

Instead of using term-level programming as we usually do, we make Haskell’s type system do the work of calculating the solution. So the solution is known right after we compile the program, and we do not even need to run the compiled program.

Here goes the code:

```
{-# LANGUAGE DataKinds, TypeFamilies, TypeApplications #-}
{-# LANGUAGE TypeOperators, UndecidableInstances #-}

module Main where

import Data.Proxy
import GHC.TypeLits

data Move = Rock | Paper | Scissors
data Result = Lose | Draw | Win

type family Parse (move :: Symbol) :: Move where
   Parse "A"  = Rock
   Parse "B"  = Paper
   Parse "C"  = Scissors
   Parse "X"  = Rock
   Parse "Y"  = Paper
   Parse "Z"  = Scissors
   Parse move = TypeError (Text "Invalid move" :<>: ShowType move)

type family Play (opMove :: Move) (myMove :: Move) :: Result where
  Play Rock     Scissors = Lose
  Play Scissors Paper    = Lose
  Play Paper    Rock     = Lose
  Play Rock     Rock     = Draw
  Play Scissors Scissors = Draw
  Play Paper    Paper    = Draw
  Play _        _        = Win

type family ScoreMove (move :: Move) :: Nat where
  ScoreMove Rock     = 1
  ScoreMove Paper    = 2
  ScoreMove Scissors = 3

type family ScoreResult (result :: Result) :: Nat where
  ScoreResult Lose = 0
  ScoreResult Draw = 3
  ScoreResult Win  = 6

type family Score (moves :: (Move, Move)) :: Nat where
  Score '(opMove, myMove) = ScoreMove myMove + ScoreResult (Play opMove myMove)

type family Solve (input :: [(Symbol, Symbol)]) :: Nat where
  Solve '[] = 0
  Solve ('(opMove, myMove) : rest) = Score '(Parse opMove, Parse myMove) + Solve rest

type Input = [
    '("A", "Y"),
    '("B", "X"),
    '("C", "Z")
  ]

type Solution = Solve Input

solution = natVal $ Proxy @Solution

main = print solution
```

 tl-rps.hs

The above code solves the challenge for the sample input, but it works for the real input as well (which is thousands of lines long). We can compile the program like this:

```
$ ghc -O2 --make -freduction-depth=0 tl-rps.hs
```

Running the output binary gives us the right result:

```
$ ./tl-rps
15
```

To verify that the solution is known at compile time, we can compile the program with `-ddump-simpl` flag to dump the simplifier output, and inspect it manually.

```
$ ghc -O2 -c -freduction-depth=0 -ddump-simpl tl-rps.hs
```

Right at the top of the simplifier output, we find this:

```
solution :: Integer
[GblId,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 100 0}]
solution = 15
```

Alternatively, we can load the code in GHCi, and inspect the kind of the `Solution` type:

```
$ ghci -freduction-depth=0 tl-rps.hs
GHCi, version 9.0.2: https://www.haskell.org/ghc/  :? for help
[1 of 1] Compiling Main             ( tl-rps.hs, interpreted )
Ok, one module loaded.
λ> :kind! Solution
Solution :: Nat
= 15
```

This proves that the solution has already been calculated at compile time.

To understand what the code does, read my [blog post](https://abhinavsarkar.net/posts/type-level-haskell-aoc7/?mtm_campaign=feed) about type-level Haskell solution of one of last year’s Advent of Code challenges. Or better yet, learn some type-level programming in Haskell by reading the book [Thinking with Types](https://thinkingwithtypes.com/) by [Sandy Maguire](https://sandymaguire.me/).

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

This post is a part of the series: **Solving Advent of Code**.

1. [“Handy Haversacks” in Type-level Haskell](https://abhinavsarkar.net/posts/type-level-haskell-aoc7/?mtm_campaign=feed)
2. [“No Space Left On Device” with Parsers, Zippers and Interpreters](https://abhinavsarkar.net/posts/parsers-zippers-interpreters-aoc7/?mtm_campaign=feed)
3. **“Rock-Paper-Scissors” in Type-level Haskell** 👈
4. [“Aplenty” by Compiling](https://abhinavsarkar.net/posts/compiling-aoc23-aplenty/?mtm_campaign=feed)
5. [“Seating System” with Comonads and Stencils](https://abhinavsarkar.net/posts/solving-aoc20-seating-system/?mtm_campaign=feed)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/notes/2022-type-level-rps/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/109445431721468848)
* [Lobsters](https://lobste.rs/s/frbwzf)
* [My website](https://abhinavsarkar.net/notes/2022-type-level-rps/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)