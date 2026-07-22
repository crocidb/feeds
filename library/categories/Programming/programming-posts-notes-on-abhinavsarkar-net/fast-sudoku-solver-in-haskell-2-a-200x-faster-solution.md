+++
title = "Fast Sudoku Solver in Haskell #2: A 200x Faster Solution"
description = "In the first part of this series of posts, we wrote a simple Sudoku solver in Haskell. It used a [constraint satisfaction](https://en.wikipedia."
date = "2018-07-11T00:00:00Z"
url = "https://abhinavsarkar.net/posts/fast-sudoku-solver-in-haskell-2/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.678524277Z"
seen = false
+++

In the [first part](https://abhinavsarkar.net/posts/fast-sudoku-solver-in-haskell-1/?mtm_campaign=feed) of this series of posts, we wrote a simple [Sudoku](https://en.wikipedia.org/wiki/Sudoku) solver in [Haskell](https://www.haskell.org/). It used a [constraint satisfaction](https://en.wikipedia.org/wiki/Constraint_satisfaction_problem) algorithm with [backtracking](https://en.wikipedia.org/wiki/Depth-first_search). The solution worked well but was very slow. In this post, we are going to improve it and make it **fast**.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/fast-sudoku-solver-in-haskell-2/?mtm_campaign=feed).

This post is a part of the series: **Fast Sudoku Solver in Haskell**.

1. [A Simple Solution](https://abhinavsarkar.net/posts/fast-sudoku-solver-in-haskell-1/?mtm_campaign=feed)
2. **A 200x Faster Solution** 👈
3. [Picking the Right Data Structures](https://abhinavsarkar.net/posts/fast-sudoku-solver-in-haskell-3/?mtm_campaign=feed)

### Contents ###

1. [Quick Recap](#quick-recap)
2. [Constraints and Corollaries](#constraints-and-corollaries)
3. [Singles, Twins and Triplets](#singles-twins-and-triplets)
4. [A Little Forward, a Little Backward](#a-little-forward-a-little-backward)
5. [Pruning the Cells, Exclusively](#pruning-the-cells-exclusively)
6. [Faster than a Speeding Bullet!](#faster-than-a-speeding-bullet)
   1. [Update](#update)

7. [Conclusion](#conclusion)

Quick Recap[#](#quick-recap)
----------

[Sudoku](https://en.wikipedia.org/wiki/Sudoku) is a number placement puzzle. It consists of a 9x9 grid which is to be filled with digits from 1 to 9 such that each row, each column and each of the nine 3x3 sub-grids contain all the digits. Some of the cells of the grid come pre-filled and the player has to fill the rest.

In the previous post, we implemented a simple Sudoku solver without paying much attention to its performance characteristics. We ran[<sup>1</sup>](#fn1) some of [17-clue puzzles](https://abhinavsarkar.net/files/sudoku17.txt.bz2?mtm_campaign=feed)[<sup>2</sup>](#fn2) through our program to see how fast it was:

```
$ head -n100 sudoku17.txt | time stack exec sudoku
... output omitted ...
      116.70 real       198.09 user        94.46 sys
```

So, it took about 117 seconds to solve one hundred puzzles. At this speed, it would take about 16 hours to solve all the 49151 puzzles contained in the file. This is way too slow. We need to find ways to make it faster. Let’s go back to the drawing board.

Constraints and Corollaries[#](#constraints-and-corollaries)
----------

In a Sudoku puzzle, we have a partially filled 9x9 grid which we have to fill completely while following the constraints of the game.

![A sample puzzle](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20201%20209'%3E%3C/svg%3E) \<img src="/images/fast-sudoku-solver-in-haskell-1/sudoku01.svg" class="w-100pct nolink mw-30pct" alt="A sample puzzle"\>\</img\> A sample puzzle ![And its solution](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20201%20209'%3E%3C/svg%3E) \<img src="/images/fast-sudoku-solver-in-haskell-1/sudoku02.svg" class="w-100pct nolink mw-30pct" alt="And its solution"\>\</img\> And its solution

Earlier, we followed a simple pruning algorithm which removed all the solved (or *fixed*) digits from neighbours of the fixed cells. We repeated the pruning till the fixed and non-fixed values in the grid stopped changing (or the grid *settled*). Here’s an example of a grid before pruning:

![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20921%20209'%3E%3C/svg%3E) \<img src="/images/fast-sudoku-solver-in-haskell-1/sudoku1.svg" class="w-100pct nolink extra-width"\>\</img\>

And here’s the same grid when it settles after repeated pruning:

![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20921%20209'%3E%3C/svg%3E) \<img src="/images/fast-sudoku-solver-in-haskell-1/sudoku4.svg" class="w-100pct nolink extra-width"\>\</img\>

We see how the possibilities conflicting with the fixed values are removed. We also see how some of the non-fixed cells turn into fixed ones as all their other possible values get eliminated.

This simple strategy follows directly from the constraints of Sudoku. But, are there more complex strategies which are implied indirectly?

Singles, Twins and Triplets[#](#singles-twins-and-triplets)
----------

Let’s have a look at this sample row captured from a solution in progress:

![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20921%2049'%3E%3C/svg%3E) \<img src="/images/fast-sudoku-solver-in-haskell-2/sudoku-line1.svg" class="w-100pct nolink extra-width"\>\</img\>

Notice how the sixth cell is the only one with `1` as a possibility in it. It is obvious that we should fix the sixth cell to `1` as we cannot place `1` in any other cell in the row. Let’s call this the *Singles*[<sup>3</sup>](#fn3) scenario.

But, our current solution will not fix the sixth cell to `1` till one of these cases arise:

1. all other possibilities of the cell are pruned away, or,
2. the cell is chosen as pivot in the `nextGrids` function and `1` is chosen as the value to fix.

This may take very long and lead to a longer solution time. Let’s assume that we recognize the Singles scenario while pruning cells and fix the cell to `1` right then. That would cut down the search tree by a lot and make the solution much faster.

It turns out, we can generalize this pattern. Let’s check out this sample row from middle of a solution:

![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20921%2049'%3E%3C/svg%3E) \<img src="/images/fast-sudoku-solver-in-haskell-2/sudoku-line2.svg" class="w-100pct nolink extra-width"\>\</img\>

It is a bit difficult to notice with the naked eye but there’s something special here too. The digits `5` and `7` occur only in the third and the ninth cells. Though they are accompanied by other digits in those cells, they are not present in any other cells. This means, we can place `5` and `7` either in the third or the ninth cell and no other cells. This implies that we can prune the third and ninth cells to have only `5` and `7` like this:

![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20921%2049'%3E%3C/svg%3E) \<img src="/images/fast-sudoku-solver-in-haskell-2/sudoku-line3.svg" class="w-100pct nolink extra-width"\>\</img\>

This is the *Twins* scenario. As we can imagine, this pattern extends to groups of three digits and beyond. When three digits can be found only in three cells in a block, it is the *Triplets* scenario, as in the example below:

![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20921%2049'%3E%3C/svg%3E) \<img src="/images/fast-sudoku-solver-in-haskell-2/sudoku-line4.svg" class="w-100pct nolink extra-width"\>\</img\>

In this case, the triplet digits are `3`, `8` and `9`. And as before, we can prune the block by fixing these digits in their cells:

![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20921%2049'%3E%3C/svg%3E) \<img src="/images/fast-sudoku-solver-in-haskell-2/sudoku-line5.svg" class="w-100pct nolink extra-width"\>\</img\>

Let’s call these three scenarios *Exclusives* in general.

We can extend this to *Quadruplets* scenario and further. But such scenarios occur rarely in a 9x9 Sudoku puzzle. Trying to find them may end up being more computationally expensive than the benefit we may get in solution time speedup by finding them.

Now that we have discovered these new strategies to prune cells, let’s implement them in Haskell.

A Little Forward, a Little Backward[#](#a-little-forward-a-little-backward)
----------

We can implement the three new strategies to prune cells as one function for each. However, we can actually implement all these strategies in a single function. But, this function is a bit more complex than the previous pruning function. So first, let’s try to understand its working using tables. Let’s take this sample row:

![](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20921%2049'%3E%3C/svg%3E) \<img src="/images/fast-sudoku-solver-in-haskell-2/sudoku-line6.svg" class="w-100pct nolink extra-width"\>\</img\>

First, we make a table mapping the digits to the cells in which they occur, excluding the fixed cells:

|Digit|     Cells      |
|-----|----------------|
|  2  |    6, 8, 9     |
|  3  |    6, 8, 9     |
|  4  |       1        |
|  6  |1, 4, 6, 7, 8, 9|
|  8  |    6, 8, 9     |
|  9  |1, 4, 6, 7, 8, 9|

Then, we flip this table and collect all the digits that occur in the same set of cells:

|     Cells      |Digits |
|----------------|-------|
|       1        |   4   |
|    6, 8, 9     |2, 3, 8|
|1, 4, 6, 7, 8, 9| 6, 9  |

And finally, we remove the rows of the table in which the count of the cells is not the same as the count of the digits:

| Cells |Digits |
|-------|-------|
|   1   |   4   |
|6, 8, 9|2, 3, 8|

Voilà! We have found a Single `4` and a set of Triplets `2`, `3` and `8`. You can go over the puzzle row and verify that this indeed is the case.

Translating this logic to Haskell is quite easy now:

```
isPossible :: Cell -> Bool
isPossible (Possible _) = True
isPossible _            = False

exclusivePossibilities :: [Cell] -> [[Int]]
exclusivePossibilities row =
  -- input
  row
  -- [Possible [4,6,9], Fixed 1, Fixed 5, Possible [6,9], Fixed 7, Possible [2,3,6,8,9],
  -- Possible [6,9], Possible [2,3,6,8,9], Possible [2,3,6,8,9]]

  -- step 1
  & zip [1..9]
  -- [(1,Possible [4,6,9]),(2,Fixed 1),(3,Fixed 5),(4,Possible [6,9]),(5,Fixed 7),
  -- (6,Possible [2,3,6,8,9]),(7,Possible [6,9]),(8,Possible [2,3,6,8,9]),
  -- (9,Possible [2,3,6,8,9])]

  -- step 2
  & filter (isPossible . snd)
  -- [(1,Possible [4,6,9]),(4,Possible [6,9]),(6,Possible [2,3,6,8,9]),
  -- (7,Possible [6,9]), (8,Possible [2,3,6,8,9]),(9,Possible [2,3,6,8,9])]

  -- step 3
  & Data.List.foldl'
      (\acc ~(i, Possible xs) ->
        Data.List.foldl' (\acc' x -> Map.insertWith prepend x [i] acc') acc xs)
      Map.empty
  -- fromList [(2,[9,8,6]),(3,[9,8,6]),(4,[1]),(6,[9,8,7,6,4,1]),(8,[9,8,6]),
  -- (9,[9,8,7,6,4,1])]

  -- step 4
  & Map.filter ((< 4) . length)
  -- fromList [(2,[9,8,6]),(3,[9,8,6]),(4,[1]),(8,[9,8,6])]

  -- step 5
  & Map.foldlWithKey'(\acc x is -> Map.insertWith prepend is [x] acc) Map.empty
  -- fromList [([1],[4]),([9,8,6],[8,3,2])]

  -- step 6
  & Map.filterWithKey (\is xs -> length is == length xs)
  -- fromList [([1],[4]),([9,8,6],[8,3,2])]

  -- step 7
  & Map.elems
  -- [[4],[8,3,2]]
  where
    prepend ~[y] ys = y:ys
```

We extract the `isPossible` function to the top level from the `nextGrids` function for reuse. Then we write the `exclusivePossibilities` function which finds the Exclusives in the input row. This function is written using the reverse application operator [`(&)`](https://hackage.haskell.org/package/base-4.11.1.0/docs/Data-Function.html#v:-38-)[<sup>4</sup>](#fn4) instead of the usual `($)` operator so that we can read it from top to bottom. We also show the intermediate values for a sample input after every step in the function chain.

The nub of the function lies in step 3 (pun intended). We do a nested fold over all the non-fixed cells and all the possible digits in them to compute the map[<sup>5</sup>](#fn5) which represents the first table. Thereafter, we filter the map to keep only the entries with length less than four (step 4). Then we flip it to create a new map which represents the second table (step 5). Finally, we filter the flipped map for the entries where the cell count is same as the digit count (step 6) to arrive at the final table. The step 7 just gets the values in the map which is the list of all the Exclusives in the input row.

Pruning the Cells, Exclusively[#](#pruning-the-cells-exclusively)
----------

To start with, we extract some reusable code from the previous `pruneCells` function and rename it to `pruneCellsByFixed`:

```
makeCell :: [Int] -> Maybe Cell
makeCell ys = case ys of
  []  -> Nothing
  [y] -> Just $ Fixed y
  _   -> Just $ Possible ys

pruneCellsByFixed :: [Cell] -> Maybe [Cell]
pruneCellsByFixed cells = traverse pruneCell cells
  where
    fixeds = [x | Fixed x <- cells]

    pruneCell (Possible xs) = makeCell (xs Data.List.\\ fixeds)
    pruneCell x             = Just x
```

Now we write the `pruneCellsByExclusives` function which uses the `exclusivePossibilities` function to prune the cells:

```
pruneCellsByExclusives :: [Cell] -> Maybe [Cell]
pruneCellsByExclusives cells = case exclusives of
  [] -> Just cells
  _  -> traverse pruneCell cells
  where
    exclusives    = exclusivePossibilities cells
    allExclusives = concat exclusives

    pruneCell cell@(Fixed _) = Just cell
    pruneCell cell@(Possible xs)
      | intersection `elem` exclusives = makeCell intersection
      | otherwise                      = Just cell
      where
        intersection = xs `Data.List.intersect` allExclusives
```

`pruneCellsByExclusives` works exactly as shown in the examples above. We first find the list of Exclusives in the given cells. If there are no Exclusives, there’s nothing to do and we just return the cells. If we find any Exclusives, we [`traverse`](https://hackage.haskell.org/package/base-4.11.1.0/docs/Data-Traversable.html#v:traverse) the cells, pruning each cell to only the intersection of the possible digits in the cell and Exclusive digits. That’s it! We reuse the `makeCell` function to create a new cell with the intersection.

As the final step, we rewrite the `pruneCells` function by combining both the functions.

```
fixM :: (Eq t, Monad m) => (t -> m t) -> t -> m t
fixM f x = f x >>= \x' -> if x' == x then return x else fixM f x'

pruneCells :: [Cell] -> Maybe [Cell]
pruneCells cells = fixM pruneCellsByFixed cells >>= fixM pruneCellsByExclusives
```

We have extracted `fixM` as a top level function from the `pruneGrid` function. Just like the `pruneGrid'` function, we need to use monadic bind ([`>>=`](https://hackage.haskell.org/package/base-4.10.1.0/docs/Control-Monad.html#v:-62--62--61-)) to chain the two pruning steps. We also use `fixM` to apply each step repeatedly till the pruned cells settle[<sup>6</sup>](#fn6).

No further code changes are required. It is time to check out the improvements.

Faster than a Speeding Bullet![#](#faster-than-a-speeding-bullet)
----------

Let’s build the program and run the exact same number of puzzles as before:

```
$ head -n100 sudoku17.txt | time stack exec sudoku
... output omitted ...
      0.53 real         0.58 user         0.23 sys
```

Woah! It is way faster than before. Let’s solve all the puzzles now:

```
$ cat sudoku17.txt | time stack exec sudoku > /dev/null
      282.98 real       407.25 user       109.27 sys
```

So it is took about 283 seconds to solve all the 49151 puzzles. The speedup is about 200x[<sup>7</sup>](#fn7). That’s about 5.8 milliseconds per puzzle.

Let’s do a quick profiling to see where the time is going:

```
$ stack build --profile
$ head -n1000 sudoku17.txt | stack exec -- sudoku +RTS -p > /dev/null
```

This generates a file named `sudoku.prof` with the profiling results. Here are the top five most time-taking functions (cleaned for brevity):

|         Cost Center         |    Source    |%time|%alloc|
|-----------------------------|--------------|-----|------|
|  `exclusivePossibilities`   |(49,1)-(62,26)|17.6 | 11.4 |
|`pruneCellsByFixed.pruneCell`|(75,5)-(76,36)|16.9 | 30.8 |
|`exclusivePossibilities.\.\` |   55:38-70   |12.2 | 20.3 |
|          `fixM.\`           |   13:27-65   |10.0 | 0.0  |
|            `==`             |   15:56-57   | 7.2 | 0.0  |

Looking at the report, my guess is that a lot of time is going into list operations. Lists are known to be inefficient in Haskell so maybe we should switch to some other data structures?

### Update[#](#update) ###

As per the [comment](https://abhinavsarkar.net/posts/fast-sudoku-solver-in-haskell-2/?mtm_campaign=feed#comment-97ca7640-8531-11e8-a1d5-1fd7d3dbc496) by Chris Casinghino, I ran both the versions of code without the `-threaded`, `-rtsopts` and `-with-rtsopts=-N` options. The time for previous post’s code:

```
$ head -n100 sudoku17.txt | time stack exec sudoku
... output omitted ...
       96.54 real        95.90 user         0.66 sys
```

And the time for this post’s code:

```
$ cat sudoku17.txt | time stack exec sudoku > /dev/null
      258.97 real       257.34 user         1.52 sys
```

So, both the versions run about 10% faster without the threading options. I suspect this has something to do with GHC’s parallel GC as described in [this post](https://web.archive.org/web/20180711/https://inner-haven.net/posts/2017-05-08-speed-up-haskell-programs-weird-trick.html). So for now, I’ll keep threading disabled.

Conclusion[#](#conclusion)
----------

In this post, we improved upon our simple Sudoku solution from the [last time](https://abhinavsarkar.net/posts/fast-sudoku-solver-in-haskell-1/?mtm_campaign=feed). We discovered and implemented a new strategy to prune cells, and we achieved a 200x speedup. But profiling shows that we still have many possibilities for improvements. We’ll work on that and more in the upcoming posts in this series. The code till now is available [here](https://code.abhinavsarkar.net/abhin4v/hasdoku/src/commit/9d6eb18229f905c52cb4c98b569abb70757ba022?mtm_campaign=feed).

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. All the runs were done on my MacBook Pro from 2014 with 2.2 GHz Intel Core i7 CPU and 16 GB memory.[↩︎](#fnref1)

2. At least 17 cells must be pre-filled in a Sudoku puzzle for it to have a unique solution. So 17-clue puzzles are the most difficult of all puzzles. [This paper](https://arxiv.org/pdf/1201.0749v2.pdf) by McGuire, Tugemann and Civario gives the proof of the same.[↩︎](#fnref2)

3. “Single” as in [“Single child”](https://en.wikipedia.org/wiki/Single_child)[↩︎](#fnref3)

4. Reverse application operation is not used much in Haskell. But it is the preferred way of function chaining in some other functional programming languages like [Clojure](https://clojuredocs.org/clojure.core/->), [FSharp](https://en.wikibooks.org/wiki/F_Sharp_Programming/Higher_Order_Functions#The_|>_Operator), and [Elixir](https://hexdocs.pm/elixir/Kernel.html#|>/2).[↩︎](#fnref4)

5. We use [Data.Map.Strict](https://hackage.haskell.org/package/containers-0.6.0.1/docs/Data-Map-Strict.html) as the map implementation.[↩︎](#fnref5)

6. We need to run `pruneCellsByFixed` and `pruneCellsByExclusives` repeatedly using `fixM` because an unsettled row can lead to wrong solutions.

   Imagine a row which just got a `9` fixed because of `pruneCellsByFixed`. If we don’t run the function again, the row may be left with one non-fixed cell with a `9`. When we run this row through `pruneCellsByExclusives`, it’ll consider the `9` in the non-fixed cell as a Single and fix it. This will lead to two `9`s in the same row, causing the solution to fail.[↩︎](#fnref6)

7. Speedup calculation: 116.7 / 100 \* 49151 / 282.98 = 202.7[↩︎](#fnref7)

This post is a part of the series: **Fast Sudoku Solver in Haskell**.

1. [A Simple Solution](https://abhinavsarkar.net/posts/fast-sudoku-solver-in-haskell-1/?mtm_campaign=feed)
2. **A 200x Faster Solution** 👈
3. [Picking the Right Data Structures](https://abhinavsarkar.net/posts/fast-sudoku-solver-in-haskell-3/?mtm_campaign=feed)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/fast-sudoku-solver-in-haskell-2/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Lobsters](https://lobste.rs/s/yqsqsg)
* [Reddit](https://www.reddit.com/r/haskell/comments/8xyfad/)
* [My website](https://abhinavsarkar.net/posts/fast-sudoku-solver-in-haskell-2/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)