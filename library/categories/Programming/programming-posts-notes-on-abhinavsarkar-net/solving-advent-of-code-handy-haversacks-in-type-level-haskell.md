+++
title = "Solving Advent of Code “Handy Haversacks” in Type-level Haskell"
description = "I have been trying to use type-level programming in Haskell to solve interesting problems since I read Thinking with Types by Sandy Maguire. Then I found myself solving the problems in [Advent of Code 2020](https://adv"
date = "2021-01-04T00:00:00Z"
url = "https://abhinavsarkar.net/posts/type-level-haskell-aoc7/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.603895283Z"
seen = false
+++

I have been trying to use type-level programming in Haskell to solve interesting problems since I read [Thinking with Types](https://thinkingwithtypes.com/) by [Sandy Maguire](https://sandymaguire.me/). Then I found myself solving the problems in [Advent of Code 2020](https://adventofcode.com/2020) and some of them seemed suitable to be solved with type-level programming. So I decided to give it a shot.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/type-level-haskell-aoc7/?mtm_campaign=feed).

This post is a part of the series: **Solving Advent of Code**.

1. **“Handy Haversacks” in Type-level Haskell** 👈
2. [“No Space Left On Device” with Parsers, Zippers and Interpreters](https://abhinavsarkar.net/posts/parsers-zippers-interpreters-aoc7/?mtm_campaign=feed)
3. [“Rock-Paper-Scissors” in Type-level Haskell](https://abhinavsarkar.net/notes/2022-type-level-rps/?mtm_campaign=feed)
4. [“Aplenty” by Compiling](https://abhinavsarkar.net/posts/compiling-aoc23-aplenty/?mtm_campaign=feed)
5. [“Seating System” with Comonads and Stencils](https://abhinavsarkar.net/posts/solving-aoc20-seating-system/?mtm_campaign=feed)

### Contents ###

1. [Type-level Programming](#type-level-programming)
2. [Handy Haversacks](#handy-haversacks)
3. [Terms, Types, and Kinds](#terms-types-and-kinds)
4. [Type-level Primitives](#type-level-primitives)
5. [Type Families](#type-families)
6. [Setup](#setup)
7. [Consuming Strings at Type-level](#consuming-strings-at-type-level)
8. [Parsing at Type-level](#parsing-at-type-level)
9. [How Many Bags?](#how-many-bags)

Type-level Programming[#](#type-level-programming)
----------

Type-level programming (TLP) is, simply put, using the type system of a language to solve a problem, or a part of a problem. In a way, we already do TLP when we create the right types to represent our problems and solutions in code. The right types do a lot of work for us by making sure that wrong models and states do not compile, hence reducing the solution-space for us. But in some languages like [Haskell](https://www.haskell.org/) and [Idris](https://www.idris-lang.org/), we can do much more than just crafting the right types. We can leverage the type-system itself for computation! Recent versions of Haskell have introduced superb support for various extensions and primitives to make TLP in Haskell easier than ever before[<sup>1</sup>](#fn1). Let’s use TLP to solve an interesting problem in this post.

Handy Haversacks[#](#handy-haversacks)
----------

[Handy Haversacks](https://adventofcode.com/2020/day/7) is the problem for the day seven of Advent of Code 2020[<sup>2</sup>](#fn2). In this problem, our input is a set of rules about some bags. The bags have different colors and may contain zero or more bags of other colors. Here are the rules for the example problem:

```
light red bags contain 1 bright white bag, 2 muted yellow bags.
dark orange bags contain 3 bright white bags, 4 muted yellow bags.
bright white bags contain 1 shiny gold bag.
muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
dark olive bags contain 3 faded blue bags, 4 dotted black bags.
vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
faded blue bags contain no other bags.
dotted black bags contain no other bags.
```

We are going to solve the part two of the problem: given the color of a bag, find out how many other bags in total that bag contains. Since the bags can contain more bags, this is a recursive problem. For the rules above, a `shiny gold` bag contains …

>
>
> 1 dark olive bag (and the 7 bags within it) plus 2 vibrant plum bags (and the 11 bags within each of those): 1 + 1\*7 + 2 + 2\*11 = 32 bags!
>
>

At this point, many of the readers would have already solved this problem in their heads: just parse the input to a lookup table and use it to recursively calculate the number of bags. Easy, isn’t it? But what if we want to solve it with type-level programming?

Terms, Types, and Kinds[#](#terms-types-and-kinds)
----------

We are used to working in the world of *Terms*. Terms are “things” that programs manipulate at the runtime, for example, integers, strings, and user-defined data type instances. Terms have *Types* which are used by the compiler to prevent certain behaviors at compile-time, even before the programs are run. For example, it prevents you from adding a string to an integer.

The compiler works (or computes) with types instead of terms. This chain goes further. Like terms have types, types have *Kinds*. Kinds can be thought of as “the types of the Types”. The compiler uses kinds to prevent certain behaviors of the types at compile-time. Let’s use GHCi to explore terms, types, and kinds:

```
> True -- a term
True
> :type True -- and its type
True :: Bool
> :kind Bool -- and the kind of the Bool type
Bool :: *
```

All terms have only one kind: `*`. That is, all types like `Int`, `String` and whatever data types we define ourselves, have the kind `*`.

It’s trivial to create new types in Haskell with `data` and `newtype` definitions. How do we go about creating new kinds? The [`DataKinds`](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/data_kinds.html#extension-DataKinds) extension lets us do that:

```
> :set -XDataKinds
> data Allow = Yes | No
> :type Yes -- Yes is data constructor with type Allow
Yes :: Allow
> :kind Allow -- Allow is a type with kind *
Allow :: *
> :kind Yes -- Yes is a type too. Its kind is Allow.
Yes :: Allow
```

The `DataKinds` extension promotes types to kinds, and data constructors of types to the types of corresponding kinds. In the example above, `Yes` and `No` are the promoted types of the promoted kind `Allow`. Even though the constructors, types, and kinds may have same names, the compiler can tell apart from their context.

Now we know how to create our own kinds. What if we check for the promoted kinds of the built-in types?

```
> :type True
True :: Bool
> :type 1 :: Int
1 :: Int :: Int
> :type "hello"
"hello" :: [Char]
> :kind True
True :: Bool
> :kind 1
1 :: Nat
> :kind "hello"
"hello" :: Symbol
```

As expected, the `Bool` type is promoted to the `Bool` kind. But numbers and strings have kinds `Nat` and `Symbol` respectively. What are these new kinds?

Type-level Primitives[#](#type-level-primitives)
----------

To be able to do useful computation at type-level, we need type-level numbers and strings. We can use [Peano numbers](https://wiki.haskell.org/Peano_numbers) to encode natural numbers as a type and use the `DataKinds` extension to [promote them to type-level](https://www.parsonsmatt.org/2017/04/26/basic_type_level_programming_in_haskell.html#data-kinds). With numbers as types now, we can use them for interesting things like [sized vectors](https://www.parsonsmatt.org/2017/04/26/basic_type_level_programming_in_haskell.html#vectors) with compile-time validation for index bound checks etc. But Peano numbers are awkward to work with because of their verbosity. Fortunately, GHC has built-in support for type-level natural numbers with the [`GHC.TypeLits`](https://hackage.haskell.org/package/base-4.14.1.0/docs/GHC-TypeLits.html) package.

```
> :kind 1 -- 1 is a type-level number here
1 :: Nat
> :kind 10000 -- kind of all type-level numbers is GHC.TypeLits.Nat
10000 :: Nat
```

GHC supports type-level strings as well through the same package. Unlike term-level strings which are lists of `Char`s, type-level strings are defined as a primitive and their kind is `Symbol`[<sup>3</sup>](#fn3).

```
> :kind "hello at type-level"
"hello at type-level" :: Symbol
```

GHC also supports type-level lists and tuples. Type-level lists can contain zero or more types of same kind, while type-level tuples can contain zero or more types of possibly different kinds.

```
> :kind [1, 2, 3]
[1, 2, 3] :: [Nat]
> :kind ["hello", "world"]
["hello", "world"] :: [Symbol]
> -- prefix the tuple with ' to disambiguate it as a type-level tuple
> :kind '(1, "one")
'(1, "one") :: (Nat, Symbol)
```

Now we are familiar with the primitives for type-level computations. How exactly do we do these computations though?

Type Families[#](#type-families)
----------

*Type families* can be thought of as functions that work at type-level. Just like we use functions to do computations at term-level, we use type families to do computations at type-level. Type families are enabled by the [`TypeFamilies`](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/type_families.html#extension-TypeFamilies) extension[<sup>4</sup>](#fn4).

Let’s write a simple type family to compute the logical conjunction of two type-level booleans:

```
> :set -XTypeFamilies
> :set +m
> type family And (x :: Bool) (y :: Bool) :: Bool where
>   And True True = True
>   And _     _   = False
>
> :kind And
And :: Bool -> Bool -> Bool
> :kind! And True False
And True False :: Bool
= 'False
> :kind! And True True
And True True :: Bool
= 'True
> :kind! And False True
And False True :: Bool
= 'False
```

Kind of `And` shows that it is a function at type-level. We apply it using the `:kind!` command in GHCi to see that it indeed works as expected.

GHC comes with some useful type families to do computations on `Nat`s and `Symbol`s in the `GHC.TypeLits` package. Let’s see them in action:

```
> import GHC.TypeLits
> :set -XTypeOperators
> :kind! 1 + 2 -- addition at type-level
1 + 2 :: Nat
= 3
> :kind! CmpNat 1 2 -- comparison at type-level, return lifted Ordering
CmpNat 1 2 :: Ordering
= 'LT
> :kind! AppendSymbol "hello" "world" -- appending two symbols at type-level
AppendSymbol "hello" "world" :: Symbol
= "helloworld"
```

The [`TypeOperators`](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/type_operators.html#extension-TypeOperators) extension enables us to define and use type families with symbolic names.

We have learned the basics of TLP in Haskell. Next, we can proceed to solve the actual problem.

Setup[#](#setup)
----------

This post is written in a literate programming style, meaning if you take all the code snippets from the post (excluding the GHCi examples) in the order they appear and put them in a file, you’ll have a real working program. First go the extensions and imports:

```
{-# LANGUAGE DataKinds, TypeFamilies #-}
{-# LANGUAGE TypeOperators, UndecidableInstances #-}
module AoC7 where

import Data.Proxy
import Data.Symbol.Ascii
import GHC.TypeLits
import Prelude hiding (words, reverse)
```

We have already encountered some of these extensions in the sections above. We’ll learn about the rest of them as we go along.

Consuming Strings at Type-level[#](#consuming-strings-at-type-level)
----------

The first capability required for parsing is to consume the input string character-by-character. It’s easy to do that with term-level strings as they are simply lists of characters. But `Symbol`s are built-in primitives and cannot be consumed character-by-character using the built-in functionalities. Therefore, the first thing we should do is to figure out how to break a symbol into its constituent characters. Fortunately for us, the [`symbols`](https://hackage.haskell.org/package/symbols-0.3.0.0) library implements just that with the [`ToList`](https://hackage.haskell.org/package/symbols-0.3.0.0/docs/Data-Symbol-Ascii.html#t:ToList) type family[<sup>5</sup>](#fn5). It also provide a few more utilities to work with symbols which we use later for solving our problem. Let’s see what `ToList` gives us:

```
> import Data.Symbol.Ascii (ToList)
> :kind! "hello there"
"hello there" :: Symbol
= "hello there"
> :kind! ToList "hello there"
ToList "hello there" :: [Symbol]
= '["h", "e", "l", "l", "o", " ", "t", "h", "e", "r", "e"]
```

It does what we want. However, for the purpose of parsing rules for this problem, it’s better to have the symbols broken as words. We already have the capability to break a symbol into a list of symbols of its characters. Now, we can combine the character symbols to create a list of word symbols.

We start with solving this problem with a term-level function. It is like the [`words`](https://hackage.haskell.org/package/base-4.14.1.0/docs/Prelude.html#v:words) function from the Prelude but of type `[String] -> [String]` instead of `String -> [String]`.

```
words :: [String] -> [String]
words s = reverse $ words2 [] s

words2 :: [String] -> [String] -> [String]
words2 acc []        = acc
words2 [] (" ":xs)   = words2 [] xs
words2 [] (x:xs)     = words2 [x] xs
words2 acc (" ":xs)  = words2 ("":acc) xs
words2 (a:as) (x:xs) = words2 ((a ++ x):as) xs

reverse :: [a] -> [a]
reverse l =  rev l []

rev :: [a] -> [a] -> [a]
rev []     a = a
rev (x:xs) a = rev xs (x:a)
```

This code may look unidiomatic Haskell but it’s written this way because we have to translate it to the type families version and type families do not support `let` or `where` bindings and `case` or `if` constructs. They support only recursion and pattern matching.

`words` works as expected:

```
> words ["h", "e", "l", "l", "o", " ", "t", "h", "e", "r", "e"]
["hello","there"]
```

Translating `words` to type-level is almost mechanical. Starting with the last function above:

```
type family
    Rev (acc :: [Symbol]) (chrs :: [Symbol]) :: [Symbol] where
  Rev '[] a = a
  Rev (x : xs) a = Rev xs (x : a)

type family Reverse (chrs :: [Symbol]) :: [Symbol] where
  Reverse l = Rev l '[]

type family Words2 (acc :: [Symbol]) (chrs :: [Symbol]) :: [Symbol] where
  Words2 acc '[]           = acc
  Words2 '[] (" " : xs)    = Words2 '[] xs
  Words2 '[] (x : xs)      = Words2 '[x] xs
  Words2 acc (" " : xs)    = Words2 ("" : acc) xs
  Words2 (a : as) (x : xs) = Words2 (AppendSymbol a x : as) xs

type family Words (chrs :: [Symbol]) :: [Symbol] where
  Words s = Reverse (Words2 '[] s)
```

We need the [`UndecidableInstances`](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/instances.html#extension-UndecidableInstances) extension to write these type families. This extension relaxes some rules that GHC places to make sure that type inference in the compiler terminates. In other words, this extension lets us write recursive code at type-level which may never terminate. Since GHC cannot prove that the recursion terminates, it’s up to us programmers to make sure that it does.

Let’s see if it works:

```
> :kind! ToList "hello there"
ToList "hello there" :: [Symbol]
= '["h", "e", "l", "l", "o", " ", "t", "h", "e", "r", "e"]
> :kind! Words (ToList "hello there")
Words (ToList "hello there") :: [Symbol]
= '["hello", "there"]
```

Great! Now we can move on to the actual parsing of the rules.

Parsing at Type-level[#](#parsing-at-type-level)
----------

Here are the rules of the problem as a list of symbols:

```
type Rules = [
    "light red bags contain 1 bright white bag, 2 muted yellow bags."
  , "dark orange bags contain 3 bright white bags, 4 muted yellow bags."
  , "bright white bags contain 1 shiny gold bag."
  , "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags."
  , "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags."
  , "dark olive bags contain 3 faded blue bags, 4 dotted black bags."
  , "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags."
  , "faded blue bags contain no other bags."
  , "dotted black bags contain no other bags."
  ]
```

We can see that the rules always start with the color of the container bag. Then they go on to either say that such-and-such bags “contain no other bags.” or list out the counts of one or more contained colored bags. We capture this model in a new type (and kind!):

```
data Bag = EmptyBag Symbol | FilledBag Symbol [(Nat, Symbol)]
```

A `Bag` is either an `EmptyBag` with a color or a `FilledBag` with a color and a list of tuples of count of contained bags along with their colors.

Next, we write the parsing logic at type-level which works on word symbols, directly as type families this time:

```
type family Parse (wrds :: [Symbol]) :: Bag where
  Parse (color1 : color2 : "bags" : "contain" : rest) =
    Parse2 (AppendSymbol color1 (AppendSymbol " " color2)) rest

type family Parse2 (color :: Symbol) (wrds :: [Symbol]) :: Bag where
  Parse2 color ("no" : _) = EmptyBag color
  Parse2 color rest = FilledBag color (Parse3 rest)

type family Parse3 (wrds :: [Symbol]) :: [(Nat, Symbol)] where
  Parse3 '[] = '[]
  Parse3 (count : color1 : color2 : _ : rest) =
    ('(ReadNat count, AppendSymbol color1 (AppendSymbol " " color2)) : Parse3 rest)
```

The `Parse` type family parses a list of word symbols into the `Bag` type. The logic is straightforward, if a little verbose compared to the equivalent term-level code. We use the `AppendSymbol` type family to put word symbols together and the [`ReadNat`](https://hackage.haskell.org/package/symbols-0.3.0.0/docs/Data-Symbol-Ascii.html#t:ReadNat) type family to convert a `Symbol` into a `Nat`. The rest is pattern matching and recursion. A quick test in GHCi reveals that it works:

```
> :{
> :kind! Parse
>   (Words (ToList "light red bags contain 1 bright white bag, 2 muted yellow bags."))
> :}
Parse (Words (ToList "light red bags contain 1 bright white bag, 2 muted yellow bags.")) :: Bag
= 'FilledBag
    "light red" '[ '(1, "bright white"), '(2, "muted yellow")]
> :kind! Parse (Words (ToList "bright white bags contain 1 shiny gold bag."))
Parse (Words (ToList "bright white bags contain 1 shiny gold bag.")) :: Bag
= 'FilledBag "bright white" '[ '(1, "shiny gold")]
> :kind! Parse (Words (ToList "faded blue bags contain no other bags."))
Parse (Words (ToList "faded blue bags contain no other bags.")) :: Bag
= 'EmptyBag "faded blue"
```

Finally, we parse all rules into a list of `Bag`s:

```
type family ParseRules (rules :: [Symbol]) :: [Bag] where
  ParseRules '[] = '[]
  ParseRules (rule : rest) = (Parse (Words (ToList rule)) : ParseRules rest)

type Bags = ParseRules Rules
```

And validate that it works:

```
> :kind! Bags
Bags :: [Bag]
= '[ 'FilledBag
       "light red" '[ '(1, "bright white"), '(2, "muted yellow")],
     'FilledBag
       "dark orange" '[ '(3, "bright white"), '(4, "muted yellow")],
     'FilledBag "bright white" '[ '(1, "shiny gold")],
     'FilledBag
       "muted yellow" '[ '(2, "shiny gold"), '(9, "faded blue")],
     'FilledBag
       "shiny gold" '[ '(1, "dark olive"), '(2, "vibrant plum")],
     'FilledBag
       "dark olive" '[ '(3, "faded blue"), '(4, "dotted black")],
     'FilledBag
       "vibrant plum" '[ '(5, "faded blue"), '(6, "dotted black")],
     'EmptyBag "faded blue", 'EmptyBag "dotted black"]
```

On to the final step of solving the problem: calculating the number of contained bags.

How Many Bags?[#](#how-many-bags)
----------

We have the list of bags with us now. To calculate the total number of bags contained in a bag of a given color, we need to be able to lookup bags from this list by their colors. So, that’s the first thing we implement:

```
type family
    LookupBag (color :: Symbol) (bags :: [Bag]) :: Bag where
  LookupBag color '[] = TypeError (Text "Unknown color: " :<>: ShowType color)
  LookupBag color (EmptyBag color' : rest) =
    LookupBag2 color (CmpSymbol color color') (EmptyBag color') rest
  LookupBag color (FilledBag color' contained : rest) =
    LookupBag2 color (CmpSymbol color color') (FilledBag color' contained) rest

type family LookupBag2 (color :: Symbol)
                       (order :: Ordering)
                       (bag :: Bag)
                       (rest :: [Bag]) :: Bag where
  LookupBag2 _ EQ bag _ = bag
  LookupBag2 color _ _ rest = LookupBag color rest
```

The `LookupBag` type family recursively walks through the list of `Bag`s, matching each bag’s color to the given color using the [`CmpSymbol`](https://hackage.haskell.org/package/base-4.14.1.0/docs/GHC-TypeLits.html#t:CmpSymbol) type family. Upon finding a match, it returns the matched bag. If no match is found, it returns a `TypeError`. [`TypeError`](https://hackage.haskell.org/package/base-4.9.1.0/docs/GHC-TypeLits.html#t:TypeError) is a type family much like the [`error`](https://hackage.haskell.org/package/base-4.14.1.0/docs/Prelude.html#v:error) function except it throws a compile time error instead of a runtime error.

Finally, we use `LookupBag` to implement the `BagCount` type family which does the actual calculation:

```
type family BagCount (color :: Symbol) :: Nat where
  BagCount color = BagCount2 (LookupBag color Bags)

type family BagCount2 (bag :: Bag) :: Nat where
  BagCount2 (EmptyBag _) = 0
  BagCount2 (FilledBag _ bagCounts) = BagCount3 bagCounts

type family BagCount3 (a :: [(Nat, Symbol)]) :: Nat where
  BagCount3 '[] = 0
  BagCount3 ( '(n, bag) : as) =
    n + n GHC.TypeLits.* BagCount2 (LookupBag bag Bags) + BagCount3 as
```

We use the type-level operators `+` and `*` from the `GHC.TypeLits` package to do the math on the `Nat` numbers. The rest again, is just recursion and pattern matching.

Our work is finished. It’s time to put it all to test in GHCi:

```
> :kind! BagCount "shiny gold"
BagCount "shiny gold" :: Nat
= 32
> :kind! BagCount "light red"
BagCount "light red" :: Nat
= 186
> :kind! BagCount "faded blue"
BagCount "faded blue" :: Nat
= 0
```

It works! We can also convert the type-level counts to term-level using the [`natVal`](https://hackage.haskell.org/package/base-4.14.1.0/docs/GHC-TypeLits.html#v:natVal) function and the [`Proxy`](https://hackage.haskell.org/package/base-4.14.1.0/docs/Data-Proxy.html#t:Proxy) type with the [`TypeApplications`](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/type_applications.html#extension-TypeApplications) extension. If we put an invalid color, we get a compilation error instead of a runtime error.

```
> :set -XTypeApplications
> natVal $ Proxy @(BagCount "shiny gold")
32
> natVal $ Proxy @(BagCount "shiny red")

<interactive>:17:1: error:
    • Unknown color: "shiny red"
    • In the expression: natVal $ Proxy @(BagCount "shiny red")
      In an equation for ‘it’:
          it = natVal $ Proxy @(BagCount "shiny red")
```

---

This concludes our little fun experiment with type-level programming in Haskell[<sup>6</sup>](#fn6). Though our problem was an easy one, it demonstrated the power of TLP. I hope to see more useful applications of TLP in the Haskell ecosystem going forward.

You can find the complete code for this post [here](https://abhinavsarkar.net/code/aoc7.html?mtm_campaign=feed).

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. Many modern libraries are increasingly employing TLP for better type-safe APIs. Some examples:

   * [servant](http://hackage.haskell.org/package/servant): Type-safe webservice APIs
   * [row-types](https://hackage.haskell.org/package/row-types): Type-safe open records
   * [polysemy](https://hackage.haskell.org/package/polysemy): Type-safe effect system
   * [type-of-html](https://hackage.haskell.org/package/type-of-html): Type driven HTML generation
   * [sized](https://hackage.haskell.org/package/sized): Type-safe sized sequence data-types
   * [dimensional](https://hackage.haskell.org/package/dimensions): Safe type-level dimensionality for multidimensional data

   [↩︎](#fnref1)
2. For the unfamiliar:

   >
   >
   > Advent of Code is an Advent calendar of small programming puzzles for a variety of skill sets and skill levels that can be solved in any programming language you like. People use them as a speed contest, interview prep, company training, university coursework, practice problems, or to challenge each other.
   >
   >

   [↩︎](#fnref2)
3. Type-level strings have interesting usages like type-safe keys in [open records](https://hackage.haskell.org/package/row-types).[↩︎](#fnref3)

4. The type families we use in this post are technically *Top-level closed type families*. There are other ways of defining type families as described in the [Haskell wiki](https://wiki.haskell.org/GHC/Type_families).[↩︎](#fnref4)

5. The author of the `symbols` library [Csongor Kiss](https://kcsongor.github.io) has written [an excellent post](https://kcsongor.github.io/symbol-parsing-haskell/) about how `ToList` is implemented.[↩︎](#fnref5)

6. We solve only the example problem in this post but not the actual problem which has a much larger set of rules. This is because it’s just too slow to compile. I suspect it’s because we don’t have a built-in function to break a symbol into its constituent characters and have to resort to complicated type-level hacks for the same.[↩︎](#fnref6)

This post is a part of the series: **Solving Advent of Code**.

1. **“Handy Haversacks” in Type-level Haskell** 👈
2. [“No Space Left On Device” with Parsers, Zippers and Interpreters](https://abhinavsarkar.net/posts/parsers-zippers-interpreters-aoc7/?mtm_campaign=feed)
3. [“Rock-Paper-Scissors” in Type-level Haskell](https://abhinavsarkar.net/notes/2022-type-level-rps/?mtm_campaign=feed)
4. [“Aplenty” by Compiling](https://abhinavsarkar.net/posts/compiling-aoc23-aplenty/?mtm_campaign=feed)
5. [“Seating System” with Comonads and Stencils](https://abhinavsarkar.net/posts/solving-aoc20-seating-system/?mtm_campaign=feed)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/type-level-haskell-aoc7/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Lobsters](https://lobste.rs/s/jqc3zv)
* [Reddit](https://www.reddit.com/r/adventofcode/comments/1c5mzv4/)
* [My website](https://abhinavsarkar.net/posts/type-level-haskell-aoc7/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)