+++
title = "Solving Advent of Code “Seating System” with Comonads and Stencils"
description = "In this post, we solve the Advent of Code 2020 “Seating System” challenge in Haskell using comonads and stencils."
date = "2025-01-05T00:00:00Z"
url = "https://abhinavsarkar.net/posts/solving-aoc20-seating-system/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.494346084Z"
seen = false
+++

In this post, we solve the Advent of Code 2020 [“Seating System”](https://adventofcode.com/2020/day/11) challenge in Haskell using comonads and stencils.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/solving-aoc20-seating-system/?mtm_campaign=feed).

This post is a part of the series: **Solving Advent of Code**.

1. [“Handy Haversacks” in Type-level Haskell](https://abhinavsarkar.net/posts/type-level-haskell-aoc7/?mtm_campaign=feed)
2. [“No Space Left On Device” with Parsers, Zippers and Interpreters](https://abhinavsarkar.net/posts/parsers-zippers-interpreters-aoc7/?mtm_campaign=feed)
3. [“Rock-Paper-Scissors” in Type-level Haskell](https://abhinavsarkar.net/notes/2022-type-level-rps/?mtm_campaign=feed)
4. [“Aplenty” by Compiling](https://abhinavsarkar.net/posts/compiling-aoc23-aplenty/?mtm_campaign=feed)
5. **“Seating System” with Comonads and Stencils** 👈

### Contents ###

1. [The Challenge](#the-challenge)
2. [The Cellular Automaton](#the-cellular-automaton)
3. [The Solution](#the-solution)
4. [The Zipper](#the-zipper)
5. [The Comonad](#the-comonad)
6. [The Array](#the-array)
7. [The Stencil](#the-stencil)

The Challenge[#](#the-challenge)
----------

Here’s a quick summary of the challenge:

>
>
> The seat layout fits on a grid. Each position is either floor (`.`), an empty seat (`L`), or an occupied seat (`#`). For example, the initial seat layout might look like this:
>
>
>
> ```
> L.LL.LL.LL
> LLLLLLL.LL
> L.L.L..L..
> LLLL.LL.LL
> L.LL.LL.LL
> L.LLLLL.LL
> ..L.L.....
> LLLLLLLLLL
> L.LLLLLL.L
> L.LLLLL.LL
> ```
>
>
>
> All decisions are based on the number of occupied seats adjacent to a given seat (one of the eight positions immediately up, down, left, right, or diagonal from the seat).
>
>
>
> The following rules are applied to every seat simultaneously:
>
>
>
> * If a seat is empty (`L`) and there are no occupied seats adjacent to it, the seat becomes occupied.
> * If a seat is occupied (`#`) and four or more seats adjacent to it are also occupied, the seat becomes empty.
> * Otherwise, the seat’s state does not change.
>
>  Floor (`.`) never changes; seats don’t move, and nobody sits on the floor.

This is a classic *[Cellular Automaton](https://en.wikipedia.org/wiki/Cellular_Automaton)* problem. We need to write a program that simulates seats being occupied till no further seats are emptied or occupied, and returns the final number of occupied seats. Let’s solve this in Haskell.

The Cellular Automaton[#](#the-cellular-automaton)
----------

First, some imports:

```
{-# LANGUAGE GHC2021 #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TypeFamilies #-}

module Main where

import Control.Arrow ((>>>))
import Control.Comonad (Comonad (..))
import Data.Function (on)
import Data.List (intercalate, nubBy)
import Data.Massiv.Array (Ix2 (..))
import Data.Massiv.Array qualified as A
import Data.Massiv.Array.Unsafe qualified as AU
import Data.Proxy (Proxy (..))
import Data.Vector.Generic qualified as VG
import Data.Vector.Generic.Mutable qualified as VGM
import Data.Vector.Unboxed qualified as VU
import System.Environment (getArgs, getProgName)
```

We use the `GHC2021` extension here that enables a lot of useful GHC extensions by default. Our non-base imports come from the [comonad](https://bartoszmilewski.com/2017/01/02/comonads/), [massiv](https://hackage.haskell.org/package/massiv) and [vector](https://hackage.haskell.org/package/vector) libraries.

Quoting the Wikipedia page on [Cellular Automaton](https://en.wikipedia.org/wiki/Cellular_Automaton) (CA):

>
>
> * A cellular automaton consists of a regular grid of cells, each in one of a finite number of states.
> * For each cell, a set of cells called its neighborhood is defined relative to the specified cell.
> * An initial state is selected by assigning a state for each cell.
> * A new generation is created, according to some fixed rule that determines the new state of each cell in terms of the current state of the cell and the states of the cells in its neighborhood.
>
>

Let’s model the automaton of the challenge using Haskell:

```
newtype Cell = Cell Char deriving (Eq)

pattern Empty, Occupied, Floor :: Cell
pattern Empty = Cell 'L'
pattern Occupied = Cell '#'
pattern Floor = Cell '.'
{-# COMPLETE Empty, Occupied, Floor #-}

parseCell :: Char -> Cell
parseCell = \case
  'L' -> Empty
  '#' -> Occupied
  '.' -> Floor
  c -> error $ "Invalid character: " <> show c

rule :: Cell -> [Cell] -> Cell
rule cell neighbours =
  let occupiedNeighboursCount = length $ filter (== Occupied) neighbours
   in case cell of
        Empty | occupiedNeighboursCount == 0 -> Occupied
        Occupied | occupiedNeighboursCount >= 4 -> Empty
        _ -> cell
```

A cell in the grid can be in empty, occupied or floor state. We encode this with the [pattern synonyms](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/pattern_synonyms.html) `Empty`, `Occupied` and `Floor` over the `Cell` `newtype` over `Char`[<sup>1</sup>](#fn1).

The `parseCell` function parses a character to a `Cell`. The `rule` function implements [the automaton rule](#the-challenge).

The Solution[#](#the-solution)
----------

We are going to solve this puzzle in three different ways. So, let’s abstract the details and solve it top-down.

```
class (Eq a) => Grid a where
  fromLists :: [[Cell]] -> a
  step :: a -> a
  toLists :: a -> [[Cell]]

solve :: forall a. (Grid a) => Proxy a -> [[Cell]] -> Int
solve _ =
  fromLists @a
    >>> fix step
    >>> toLists
    >>> fmap (filter (== Occupied) >>> length)
    >>> sum
  where
    fix f x = let x' = f x in if x == x' then x else fix f x'
```

We solve the challenge using the `Grid` typeclass that all our different solutions implement. A grid is specified by three functions:

1. `fromList`: converts a list of lists of cells to the grid.
2. `step`: runs one step of the CA simulation.
3. `toList`: converts the grid back to a list of lists of cells.

The `solve` function calculates the number of finally occupied seats for any instance of the `Grid` typeclass by running the simulation till it converges[<sup>2</sup>](#fn2).

Now, we use `solve` to solve the challenge in three ways depending on the command line argument supplied:

```
main :: IO ()
main = do
  progName <- getProgName
  getArgs >>= \case
    [gridType, fileName] ->
      readFile fileName
        >>= (lines >>> map (map parseCell) >>> solve' gridType >>> print)
    _ -> putStrLn $ "Usage: " <> progName <> " -(z|a|s) <input_file>"
  where
    solve' = \case
      "-z" -> solve $ Proxy @(ZGrid Cell)
      "-a" -> solve $ Proxy @(AGrid Cell)
      "-s" -> solve $ Proxy @(SGrid Cell)
      _ -> error "Invalid grid type"
```

We have set up the top (`main`) and the bottom (`rule`) of our solutions. Now let’s work on the middle part.

The Zipper[#](#the-zipper)
----------

To simulate a CA, we need to focus on each cell of the automaton grid, and run the rule for the cell. What is the first thing that come to minds of functional programmers when we want to focus on a part of a data structure? [Zippers](https://en.wikipedia.org/wiki/Zipper_(data_structure))!.

Zippers are a special view of data structures, which allow one to navigate and easily update them. A zipper always has a focus or cursor which is the current element of the data structure we are “at”. Alongside, it also captures the rest of the data structure in a way that makes it easy to move around it. We can update the data structure by updating the element at the focus.

The first way to solve the challenge is the zipper for once-nested lists. Let’s start with creating the zipper for a simple list:

```
data Zipper a = Zipper [a] a [a] deriving (Eq, Functor)

zPosition :: Zipper a -> Int
zPosition (Zipper left _ _) = length left

zLength :: Zipper a -> Int
zLength (Zipper left _ right) = length left + 1 + length right

listToZipper :: [a] -> Zipper a
listToZipper = \case
  [] -> error "Cannot create Zipper from empty list"
  (x : xs) -> Zipper [] x xs

zipperToList :: Zipper a -> [a]
zipperToList (Zipper left focus right) = reverse left <> (focus : right)

pShowZipper :: (Show a) => Zipper a -> String
pShowZipper (Zipper left focus right) =
  unwords $
    map show (reverse left) <> (("[" <> show focus <> "]") : map show right)

zLeft :: Zipper a -> Zipper a
zLeft z@(Zipper left focus right) = case left of
  [] -> z
  x : xs -> Zipper xs x (focus : right)

zRight :: Zipper a -> Zipper a
zRight z@(Zipper left focus right) = case right of
  [] -> z
  x : xs -> Zipper (focus : left) x xs
```

A list zipper has a focus element, and two lists that capture the elements to the left and right of the focus. We use it through these functions:

* `zPosition` returns the zero-indexed position of the focus in the zipper.
* `zLength` returns the length of the zipper.
* `listToZipper` and `zipperToList` do conversions between lists and zippers.
* `pShowZipper` pretty-prints a zipper, highlighting the focus.
* `zLeft` and `zRight` move the zipper’s focus to left and right respectively.

Let’s see it all in action:

```
> z = listToZipper [1..7]
> putStrLn $ pShowZipper z
[1] 2 3 4 5 6 7
> z' = zRight $ zRight $ zLeft $ zRight $ zRight z
> putStrLn $ pShowZipper z'
1 2 3 [4] 5 6 7
> zPosition z'
3
> zLength z'
7
> zipperToList z'
[1,2,3,4,5,6,7]
```

Great! Now, what is the zipper for a once-nested list? A once-nested zipper, of course:

```
newtype ZGrid a = ZGrid (Zipper (Zipper a)) deriving (Eq, Functor)

zgPosition :: ZGrid a -> (Int, Int)
zgPosition (ZGrid rows@(Zipper _ focus _)) = (zPosition rows, zPosition focus)

zgSize :: ZGrid a -> (Int, Int)
zgSize (ZGrid rows@(Zipper _ focus _)) = (zLength rows, zLength focus)

listsToZGrid :: [[a]] -> ZGrid a
listsToZGrid rows =
  let (first : rest) = fmap listToZipper rows
   in ZGrid $ Zipper [] first rest

zGridToLists :: ZGrid a -> [[a]]
zGridToLists (ZGrid (Zipper left focus right)) =
  reverse (fmap zipperToList left)
    <> (zipperToList focus : fmap zipperToList right)

pShowZGrid :: (Show a) => ZGrid a -> String
pShowZGrid (ZGrid (Zipper left focus right)) =
  intercalate "\n" $ pShowRows left <> (pShowZipper focus : pShowRows right)
  where
    pShowRows = map pShowZipper'
    pShowZipper' =
      zipperToList
        >>> splitAt (zPosition focus)
        >>> \ ~(left', focus' : right') ->
          unwords $
            map show left' <> ((" " <> show focus' <> " ") : map show right')
```

`ZGrid` is a `newtype` over a zipper of zippers. It has functions similar to `Zipper` for getting focus, position and size, for conversions to-and-from lists of lists, and for pretty-printing.

Next, the functions to move the focus in the grid:

```
zgUp :: ZGrid a -> ZGrid a
zgUp (ZGrid rows) = ZGrid $ zLeft rows

zgDown :: ZGrid a -> ZGrid a
zgDown (ZGrid rows) = ZGrid $ zRight rows

zgLeft :: ZGrid a -> ZGrid a
zgLeft (ZGrid rows) = ZGrid $ fmap zLeft rows

zgRight :: ZGrid a -> ZGrid a
zgRight (ZGrid rows) = ZGrid $ fmap zRight rows
```

Let’s check them out in GHCi:

```
> zg = listsToZGrid $ replicate 7 $ [1..7]
> putStrLn $ pShowZGrid zg
[1] 2 3 4 5 6 7
 1  2 3 4 5 6 7
 1  2 3 4 5 6 7
 1  2 3 4 5 6 7
 1  2 3 4 5 6 7
 1  2 3 4 5 6 7
 1  2 3 4 5 6 7
> zg' = zgDown $ zgRight $ zgDown $ zgRight zg
> putStrLn $ pShowZGrid zg'
1 2  3  4 5 6 7
1 2  3  4 5 6 7
1 2 [3] 4 5 6 7
1 2  3  4 5 6 7
1 2  3  4 5 6 7
1 2  3  4 5 6 7
1 2  3  4 5 6 7
> zgPosition zg'
(2,2)
> zgSize zg'
(7,7)
> zGridToLists zg'
[[1,2,3,4,5,6,7],[1,2,3,4,5,6,7],[1,2,3,4,5,6,7],[1,2,3,4,5,6,7],[1,2,3,4,5,6,7],[1,2,3,4,5,6,7],[1,2,3,4,5,6,7]]
```

It works as expected. Now, how do we use this to simulate a CA?

The Comonad[#](#the-comonad)
----------

A CA requires us to focus on each cell of the grid, and run a rule for the cell that depends on the neighbours of the cell. An Haskell abstraction that neatly fits this requirement is *[Comonad](https://bartoszmilewski.com/2017/01/02/comonads/)*.

Comonads are duals of Monads[<sup>3</sup>](#fn3). We don’t need to learn everything about them for now. For our purpose, Comonad provides an interface that exactly lines up with what is needed for simulating CA:

```
class Functor w => Comonad w where
  extract :: w a -> a
  duplicate :: w a -> w (w a)
  extend :: (w a -> b) -> w a -> w b
  {-# MINIMAL extract, (duplicate | extend) #-}
```

Assuming we can make `ZGrid` a comonad instance, the signatures for the above functions for `ZGrid Cell` would be:

```
class Comonad ZGrid where
  extract :: ZGrid Cell -> Cell
  duplicate :: ZGrid Cell -> ZGrid (ZGrid Cell)
  extend :: (ZGrid Cell -> Cell) -> ZGrid Cell -> ZGrid Cell
```

For `ZGrid` as a CA comonad:

* The `extract` function would return the current focus of the grid.
* The `duplicate` function would return a grid of grids, one inner grid for each possible focus of the input grid.
* The `extend` function would apply the automata rule to each possible focus of the grid, and return a new grid.

The nice part is, we need to implement only the `extract` and `duplicate` functions, and the generation of the new grid is taken care of automatically by the default implementation of the `extend` function. Let’s write the comonad instance for `ZGrid`.

First, we write the comonad instance for `Zipper`:

```
instance Comonad Zipper where
  extract (Zipper _ focus _) = focus
  duplicate zipper = Zipper left zipper right
    where
      pos = zPosition zipper
      left = iterateN pos zLeft $ zLeft zipper
      right = iterateN (zLength zipper - pos - 1) zRight $ zRight zipper

iterateN :: Int -> (a -> a) -> a -> [a]
iterateN n f = take n . iterate f
```

`extract` for `Zipper` simply returns the input zipper’s focus element.

`duplicate` returns a zipper of zippers, with the input zipper as its focus, and the left and right lists of zippers as variation of the input zipper with all possible focuses. Trying out the functions in GHCi gives a better idea:

```
> z = listToZipper [1..7] :: Zipper Int
> :t duplicate z
duplicate z :: Zipper (Zipper Int)
> mapM_ (putStrLn . pShowZipper) $ zipperToList $ duplicate z
[1] 2 3 4 5 6 7
1 [2] 3 4 5 6 7
1 2 [3] 4 5 6 7
1 2 3 [4] 5 6 7
1 2 3 4 [5] 6 7
1 2 3 4 5 [6] 7
1 2 3 4 5 6 [7]
```

Great! Now we use similar construction to write the comonad instance for `ZGrid`:

```
instance Comonad ZGrid where
  extract (ZGrid grid) = extract $ extract grid
  duplicate grid = ZGrid $ Zipper left focus right
    where
      (focusRowPos, focusColPos) = zgPosition grid
      (rowCount, colCount) = zgSize grid

      focus = Zipper focusLeft grid focusRight
      focusLeft = iterateN focusColPos zgLeft $ zgLeft grid
      focusRight =
        iterateN (colCount - focusColPos - 1) zgRight $ zgRight grid

      left = iterateN focusRowPos (fmap zgUp) $ fmap zgUp focus
      right =
        iterateN (rowCount - focusRowPos - 1) (fmap zgDown) $ fmap zgDown focus
```

It works in similar fashion:

```
> zg = listsToZGrid $ replicate 4 $ [0..3] :: ZGrid Int
> putStrLn $ pShowZGrid zg
[0] 1 2 3
 0  1 2 3
 0  1 2 3
 0  1 2 3
> :t duplicate zg
duplicate zg :: ZGrid (ZGrid Int)
> :t mapM_ (putStrLn . pShowZGrid) $ concat $ zGridToLists $ duplicate zg
mapM_ (putStrLn . pShowZGrid) $ concat $ zGridToLists $ duplicate zg :: IO ()
```

I’ve rearranged the output of running the last line of the code above for clarity:

![Output of duplicate for ZGrid](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20661%20625'%3E%3C/svg%3E) \<img src="/images/solving-aoc20-seating-system/gridgrid.svg" class="w-100pct nolink mw-80pct" alt="Output of duplicate for ZGrid"\>\</img\> Output of `duplicate` for `ZGrid`

We can see a grid of grids, with one inner grid focussed at each possible focus of the input grid. Now we finally implement the automaton:

```
zGridNeighbours :: ZGrid a -> [a]
zGridNeighbours grid =
  map snd . nubBy ((==) `on` fst) $
    [ (pos, extract grid')
      | move <- moves,
        let grid' = move grid,
        let pos = zgPosition grid',
        pos /= zgPosition grid
    ]
  where
    moves =
      [ zgUp, zgDown, zgRight, zgLeft,
        zgUp >>> zgLeft, zgUp >>> zgRight,
        zgDown >>> zgLeft, zgDown >>> zgRight
      ]

stepZGrid :: ZGrid Cell -> ZGrid Cell
stepZGrid = extend $ \grid -> rule (extract grid) (zGridNeighbours grid)

instance Grid (ZGrid Cell) where
  fromLists = listsToZGrid
  step = stepZGrid
  toLists = zGridToLists
```

`zGridNeighbours` returns the neighbour cells of the currently focussed cell of the grid. It does so by moving the focus in all eight directions, and extracting the new focuses. We also make sure to return unique cells by their position.

`stepZGrid` implements one step of the CA using the `extend` function of the `Comonad` typeclass. We call `extend` with a function that takes the current grid, and returns the result of running the CA `rule` on its focus and the neighbours of the focus.

Finally, we plug in our functions into the `ZGrid Cell` instance of `Grid`.

That’s it! Let’s compile and run the code[<sup>4</sup>](#fn4):

```
❯ nix-shell -p "ghc.withPackages (p: [p.massiv p.comonad])" \
      --run "ghc --make seating-system.hs -O2"
[1 of 2] Compiling Main             ( seating-system.hs, seating-system.o )
[2 of 2] Linking seating-system
❯ time ./seating-system -z input.txt
2243
        2.72 real         2.68 user         0.02 sys
```

I verified with the Advent of Code website that the result is correct. We also see the time elapsed, which is 2.7 seconds. That seems pretty high. Can we do better?

The Array[#](#the-array)
----------

The problem with the zipper approach is that lists in Haskell are too slow. Some operations on them like `length` are \\(O(n)\\). The are also lazy in spine and value, and build up thunks. We could switch to a different list-like data structure[<sup>5</sup>](#fn5), or cache the grid size and neighbour indices for each index to make it run faster. Or we could try an entirely different approach.

Let’s think about it for a bit. Zippers intermix two things together: the data in the grid, and the focus. When running a step of the CA, the grid data does not change when focussing on all possible focuses, only the focus itself changes. What if we separate the data from the focus? Maybe that’ll make it faster. Let’s try it out.

Let’s model the grid as combination of a 2D array and an index into the array. We are using the arrays from the [massiv](https://hackage.haskell.org/package/massiv) library.

```
data AGrid a = AGrid {aGrid :: A.Array A.B A.Ix2 a, aGridFocus :: A.Ix2}
  deriving (Eq, Functor)
```

`A.Ix2` is massiv’s way of representing an index into an 2D array, and is essentially same as a two-tuple of `Int`s. `A.Array A.B A.Ix2 a` here means a 2D boxed array of `a`s. massiv uses [representation strategies](https://hackage.haskell.org/package/massiv/docs/Data-Massiv-Core.html#t:Strategy) to decide how arrays are actually represented in the memory, among which are boxed, unboxed, primitive, storable, delayed etc. Even though primitive and storable arrays are faster, we have to go with boxed arrays here because the `Functor` instance of `A.Array` exists only for boxed and delayed arrays, and boxed ones are the faster among the two for our purpose.

It is actually massively[<sup>6</sup>](#fn6) easier to write the `Comonad` instance for `AGrid`:

```
instance Comonad AGrid where
  extract (AGrid grid focus) = grid A.! focus
  extend f (AGrid grid focus) =
    AGrid (A.compute $ A.imap (\pos _ -> f $ AGrid grid pos) grid) focus
```

The `extract` implementation simply looks up the element from the array at the focus index. This time, we don’t need to implement `duplicate` because it is easier to implement `extend` directly. We map with index (`A.imap`) over the grid, calling the function `f` for the variation of the grid with the index as the focus.

Next, we write the CA step:

```
listsToAGrid :: [[Cell]] -> AGrid Cell
listsToAGrid = A.fromLists' A.Seq >>> flip AGrid (0 :. 0)

aGridNeighbours :: AGrid a -> [a]
aGridNeighbours (AGrid grid (x :. y)) =
  [ grid A.! (x + i :. y + j)
    | i <- [-1, 0, 1],
      j <- [-1, 0, 1],
      (x + i, y + j) /= (x, y),
      validIndex (x + i, y + j)
  ]
  where
    A.Sz (rowCount :. colCount) = A.size grid
    validIndex (a, b) = and [a >= 0, b >= 0, a < rowCount, b < colCount]

stepAGrid :: AGrid Cell -> AGrid Cell
stepAGrid = extend $ \grid -> rule (extract grid) (aGridNeighbours grid)

instance Grid (AGrid Cell) where
  fromLists = listsToAGrid
  step = stepAGrid
  toLists = aGrid >>> A.toLists
```

`listsToAGrid` converts a list of lists of cells into an `AGrid` focussed at `(0,0)`. `aGridNeighbours` finds the neighbours of the current focus of a grid by directly looking up the valid neighbour indices into the array. `stepAGrid` calls `extract` and `aGridNeighbours` to implement the CA step, much like the `ZGrid` case. And finally, we create the `AGrid Cell` instance of `Grid`.

Let’s compile and run it:

```
❯ rm ./seating-system
❯ nix-shell -p "ghc.withPackages (p: [p.massiv p.comonad])" \
      --run "ghc --make seating-system.hs -O2"
[2 of 2] Linking seating-system
❯ time ./seating-system -a input.txt
2243
        0.10 real         0.09 user         0.00 sys
```

Woah! It takes only 0.1 second this time. Can we do even better?

The Stencil[#](#the-stencil)
----------

massiv has a construct called *[Stencil](https://hackage.haskell.org/package/massiv/docs/Data-Massiv-Array-Stencil.html)* that can be used for simulating CA:

>
>
> Stencil is abstract description of how to handle elements in the neighborhood of every array cell in order to compute a value for the cells in the new array.
>
>

That sounds like exactly what we need. Let’s try it out next.

With stencils, we do not need the instance of `Comonad` for the grid. So we can switch to the faster unboxed array representation:

```
newtype instance VU.MVector s Cell = MV_Char (VU.MVector s Char)
newtype instance VU.Vector Cell = V_Char (VU.Vector Char)
deriving instance VGM.MVector VU.MVector Cell
deriving instance VG.Vector VU.Vector Cell
instance VU.Unbox Cell

type SGrid a = A.Array A.U A.Ix2 a
```

First five lines make `Cell` an instance of the [`Unbox`](https://hackage.haskell.org/package/vector/docs/Data-Vector-Unboxed.html#t:Unbox) typeclass. We chose to make `Cell` a `newtype` wrapper over `Char` because `Char` has an `Unbox` instance.

Then we define a new grid type `SGrid` that is an 2D unboxed array.

Now, we define the stencil and the step function for our CA:

```
ruleStencil :: A.Stencil A.Ix2 Cell Cell
ruleStencil = AU.makeUnsafeStencil (A.Sz (3 :. 3)) (1 :. 1) $ \_ get ->
  rule (get (0 :. 0)) $ map get neighbourIndexes
  where
    neighbourIndexes =
      [ -1 :. -1, -1 :. 0, -1 :. 1,
         0 :. -1,           0 :. 1,
         1 :. -1,  1 :. 0,  1 :. 1
      ]

stepSGrid :: SGrid Cell -> SGrid Cell
stepSGrid = A.mapStencil (A.Fill Floor) ruleStencil >>> A.computeP

instance Grid (SGrid Cell) where
  fromLists = A.fromLists' A.Seq
  step = stepSGrid
  toLists = A.toLists
```

We make a stencil of size 3-by-3, where the focus is at index `(1,1)` relative to the stencil’s top-left cell. In the callback function, we use the supplied `get` function to get the neighbours of the focus by using indices relative to the focus, and call `rule` with the cells at focus and neighbour indices.

Then we write the step function `stepSGrid` that maps the stencil over the grid. Finally we put everything together in the `SGrid Cell` instance of `Grid`.

Let’s compile and run it:

```
❯ rm ./seating-system
❯ nix-shell -p "ghc.withPackages (p: [p.massiv p.comonad])" \
      --run "ghc --make seating-system.hs -O2"
[2 of 2] Linking seating-system
❯ time ./seating-system -s input.txt
2243
        0.08 real         0.07 user         0.00 sys
```

It is only a bit faster than the previous solution. But, this time we have another trick up our sleeves. Did you notice `A.computeP` we sneaked in there? With stencils, we can now run the step for all cells in parallel! Let’s recompile it with the right options and run it again:

```
❯ rm ./seating-system
❯ nix-shell -p "ghc.withPackages (p: [p.massiv p.comonad])" \
      --run "ghc --make seating-system.hs -O2 -threaded -rtsopts"
[2 of 2] Linking seating-system
❯ time ./seating-system -s input.txt +RTS -N
2243
        0.04 real         0.11 user         0.05 sys
```

The `-threaded` option enables multithreading, and the `+RTS -N` option makes the process use all CPU cores[<sup>7</sup>](#fn7). We get a nice speedup of 2x over the single-threaded version.

Bonus Round: Simulation Visualization[#](#bonus-round-simulation-visualization)
----------

Since you’ve read the entire post, here is a bonus visualization of the CA simulation for you (warning: lots of fast blinking):

<details> <summary class="print-hide"> Play the simulation </summary> ![]() \<img src="/images/solving-aoc20-seating-system/ca.gif" class="nolink w-100pct mw-80pct"\>\</img\> </details>

That’s it for this post! I hope you enjoyed it and took something away from it. The full code for this post is available [here](https://abhinavsarkar.net/code/seating-system.html?mtm_campaign=feed).

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. The reason for using a `newtype` instead of a `data` is explained in the [Stencil](#the-stencil) section.[↩︎](#fnref1)

2. If you are unfamiliar, [`>>>`](https://hackage.haskell.org/package/base/docs/Control-Arrow.html#v:-62--62--62-) is the left-to-right function composition function:

   ```
   f >>> g = g . f
   ```

   [↩︎](#fnref2)
3. This [short post](https://www.quora.com/What-is-a-Comonad-and-when-should-I-use-them/answer/Bartosz-Milewski) by [Bartosz Milewski](https://bartoszmilewski.com/) explains how comonads and monads are related.[↩︎](#fnref3)

4. We use [Nix](https://nixos.org) for getting the dependency libraries.[↩︎](#fnref4)

5. I did try a variation with [`Data.Sequence.Seq`](https://hackage.haskell.org/package/containers/docs/Data-Sequence.html#t:Seq) instead of lists, and it was twice as fast.[↩︎](#fnref5)

6. Pun very much intended.[↩︎](#fnref6)

7. I tried running the process with different values of `N` and found that `N4` gave the fastest results. So, [Amdahl’s law](https://en.wikipedia.org/wiki/Amdahl’s_law) applies here.[↩︎](#fnref7)

This post is a part of the series: **Solving Advent of Code**.

1. [“Handy Haversacks” in Type-level Haskell](https://abhinavsarkar.net/posts/type-level-haskell-aoc7/?mtm_campaign=feed)
2. [“No Space Left On Device” with Parsers, Zippers and Interpreters](https://abhinavsarkar.net/posts/parsers-zippers-interpreters-aoc7/?mtm_campaign=feed)
3. [“Rock-Paper-Scissors” in Type-level Haskell](https://abhinavsarkar.net/notes/2022-type-level-rps/?mtm_campaign=feed)
4. [“Aplenty” by Compiling](https://abhinavsarkar.net/posts/compiling-aoc23-aplenty/?mtm_campaign=feed)
5. **“Seating System” with Comonads and Stencils** 👈

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/solving-aoc20-seating-system/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/113776697853043225)
* [Lobsters](https://lobste.rs/s/uwwgmn)
* [Reddit](https://www.reddit.com/r/haskell/comments/1huaqlj/)
* [Discourse](https://discourse.haskell.org/t//11131)
* [My website](https://abhinavsarkar.net/posts/solving-aoc20-seating-system/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)