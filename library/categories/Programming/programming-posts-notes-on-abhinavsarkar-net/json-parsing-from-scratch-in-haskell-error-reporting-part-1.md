+++
title = "JSON Parsing from Scratch in Haskell: Error Reporting—Part 1"
description = "In the previous post we wrote a simple but correct JSON parser in Haskell. The parser was written very naively: if it failed, it returned nothing. You couldn’t tell what the failure was or where it happened."
date = "2020-09-29T00:00:00Z"
url = "https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-2/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.636772084Z"
seen = false
+++

In the [previous post](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed) we wrote a simple but correct JSON parser in Haskell. The parser was written very naively: if it failed, it returned nothing. You couldn’t tell what the failure was or where it happened. That’s OK for a toy parser but error reporting is an absolute must requirement for all good parsers. So in this post and next post, we’ll add simple but useful error reporting capability to our JSON parser.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-2/?mtm_campaign=feed).

This post is a part of the series: **JSON Parsing from Scratch in Haskell**.

1. [JSON Parsing from Scratch in Haskell](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed)
2. **Error Reporting—Part 1** 👈
3. [Error Reporting—Part 2](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-3/?mtm_campaign=feed)

### Contents ###

1. [Introduction](#introduction)
2. [Setup](#setup)
3. [Adding Error](#adding-error)
   1. [The Backtracking Problem](#the-backtracking-problem)

4. [Tracking Position](#tracking-position)
   1. [Zippers](#zippers)
   2. [Text Zipper](#text-zipper)
   3. [Zippered Parser](#zippered-parser)

5. [Errors with Position](#errors-with-position)
6. [Basic Parsers](#basic-parsers)
7. [Conclusion](#conclusion)

Introduction[#](#introduction)
----------

The [JSON parser](https://abhinavsarkar.net/code/jsonparser.html?mtm_campaign=feed) we wrote in the previous post works correctly and passes all tests. However, if we run it with an invalid input, it returns `Nothing`:

```
parseJSON :: String -> Maybe JValue
```

This is a not a very user-friendly parser. In the real-world, we often have to run potentially invalid input through parsers and we expect the parsers to help us out in figuring what is wrong, and sometimes even to keep going by letting us handle or ignore the errors. Different parsers support error handling and reporting to different degrees. [Megaparsec](https://github.com/mrkkrp/megaparsec) is a Haskell parser library which has good support for it. Here’s how a parsing error looks when working with Megaparsec:

```
1:4:
  |
1 | aaacc
  |    ^
unexpected 'c'
expecting 'a' or 'b'
in foo, in bar
```

The error report tells us what the parser was expecting and what it got. It also tells us where the error happened. It even tells us the context of the error by telling us that it happened “in foo, in bar”. Such an error report is definitely quite useful to track down the problems with the inputs or even with the parsers[<sup>1</sup>](#fn1).

Setup[#](#setup)
----------

We want to implement similar error reporting for our JSON parser. To be specific, we want the error reporting to tell us:

* The nature of errors: what is expected and what is wrong.
* The position of errors in terms of line and column numbers in the input.
* The context of errors in terms of the JSON syntax.

Here’s how it will look like when we are done:

```
> printResult $ parseJSON "[{\"c\"\t:\n  \n  \t[\r\"\\g\"]}]"
ERROR:
Invalid escaped character: 'g' at line 3, column 8: ·\t[\r"\g"]}]
                                                            ↑
→ Expected a string at line 3, column 6: ··\t[\r"\g"]}
                                                ↑
→ Expected a JSON value at line 3, column 6: ··\t[\r"\g"]}
                                                    ↑
→ Expected an array at line 3, column 4: ··\t[\r"\g"
                                             ↑
→ Expected an object value at line 1, column 8: {"c"\t:\n
                                                       ↑
→ Expected an object key-value pair at line 1, column 3: [{"c"\t:\n
                                                           ↑
→ Expected an object at line 1, column 2: [{"c"\t:
                                           ↑
→ Expected a JSON value at line 1, column 2: [{"c"\t:
                                              ↑
→ Expected an array at line 1, column 1: [{"c"\t
                                         ↑
```

Adding support for error reporting will be a major code change. We will rely on the [property-based tests](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed#cb61) which we wrote in the previous post to make sure that nothing breaks[<sup>2</sup>](#fn2). A lot of code though will stay the same. Instead of showing such parts in this post, I’ll link to the relevant sections in the previous post.

To start with, the imports are below.

```
{-# LANGUAGE DeriveGeneric, TupleSections #-}
{-# LANGUAGE LambdaCase, MultiWayIf #-}
module JSONParser where

import Control.Applicative (Alternative(..))
import Control.Monad (replicateM)
import Data.Bits (shiftL)
import Data.Char (isDigit, isHexDigit, isSpace, chr, ord, digitToInt)
import Data.Functor (($>))
import Data.List (intercalate)
import Data.List.Split (split, dropFinalBlank, keepDelimsR, onSublist)
import qualified Data.List.NonEmpty as NEL
import GHC.Generics (Generic)
import Numeric (showHex)
import Prelude hiding (lines)
import Text.Printf (printf)
import Test.QuickCheck hiding (Positive, Negative)
```

Here’s the `JValue` data type for a refresher:

```
data JValue = JNull
            | JBool Bool
            | JString String
            | JNumber { int :: Integer, frac :: [Int], exponent :: Integer }
            | JArray [JValue]
            | JObject [(String, JValue)]
            deriving (Eq, Generic)
```

The [instances](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed#cb3-1) for `JValue` and the [JSON generators](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed#json-generators) remain the same.

Adding Error[#](#adding-error)
----------

The old `Parser` type we defined in the previous post returned `Nothing` in case of failures:

```
newtype Parser i o =
  Parser { runParser :: i -> Maybe (i, o) }
```

To be able to return errors, we start with creating a new type to capture the possible results of parsing:

```
data ParseResult a = Error [String] | Result a
```

`ParseResult`—the result of parsing—is now either an `Error` with a list of error messages, or a `Result` with the result of successful parsing.

Let’s quickly write the various typeclass instances for it:

```
instance Show a => Show (ParseResult a) where
  show (Result res) = show res
  show (Error errs) = formatErrors (reverse errs)
    where
      formatErrors []         = error "No errors to format"
      formatErrors [err]      = err
      formatErrors (err:errs) =
        err <> delim <> intercalate delim (map (concatMap padNewline) errs)

      delim = "\n→ "
      padNewline '\n' = '\n':replicate (length delim - 1) ' '
      padNewline c    = [c]

instance Functor ParseResult where
  fmap _ (Error errs) = Error errs
  fmap f (Result res) = Result (f res)

instance Applicative ParseResult where
  pure = Result
  Error  errs <*> _   = Error errs
  Result f <*> result = fmap f result
```

The `Show` instance shows each error message in the list on its own line, starting with the last message. The results are shown verbatim. The `Functor` and `Applicative` instances propagate errors while operating on results as expected.

Let’s print an error in GHCi to get a feel of it:

```
> print $ Error ["something went wrong", "and we know"]
and we know
→ something went wrong
```

Now we write a new Parser type which returns `ParseResult` instead of `Maybe`[<sup>3</sup>](#fn3):

```
newtype Parser1 i o =
  Parser1 { runParser1 :: i -> ParseResult (i, o) }
```

And the instances for the new `Parser1` type:

```
instance Functor (Parser1 i) where
  fmap f parser = Parser1 $ fmap (fmap f) . runParser1 parser

instance Applicative (Parser1 i) where
  pure x    = Parser1 $ pure . (, x)
  pf <*> pa = Parser1 $ \input -> case runParser1 pf input of
    Error err        -> Error err
    Result (rest, f) -> fmap f <$> runParser1 pa rest

instance Alternative (Parser1 i) where
  empty = Parser1 $ const $ Error ["Unknown error."]
  parser1 <|> parser2 = Parser1 $ \input ->
    case runParser1 parser1 input of
      Result res -> Result res
      Error _    -> runParser1 parser2 input

instance Monad (Parser1 i) where
  parser >>= f = Parser1 $ \input -> case runParser1 parser input of
    Error errs            -> Error errs
    Result (rest, output) -> runParser1 (f output) rest
```

The instances are similar to the ones from the previous post, with additional `Error` propagation. Some work is delegated to the instances of `ParseResult`.

Next, we write some helper functions to return errors while parsing:

```
parseError1 :: String -> ParseResult a
parseError1 err = Error [err]

throw1 :: String -> Parser1 String o
throw1 = Parser1 . const . parseError1
```

And finally, we rewrite our old parsers to return errors on failures instead of returning `Nothing`:

```
satisfy1 ::
  (Char -> Bool) -> (Char -> String) -> Parser1 String Char
satisfy1 predicate mkError = Parser1 $ \case
  (c:cs) | predicate c -> Result (cs, c)
  (c:_)                -> parseError1 (mkError c)
  _                    -> parseError1 "Empty input"

char1 :: Char -> Parser1 String Char
char1 c = satisfy1 (== c) $ printf "Expected '%v', got '%v'" c

string1 :: String -> Parser1 String String
string1 ""     = pure ""
string1 (c:cs) = (:) <$> char1 c <*> string1 cs
```

`satisfy1` is a “higher-order” parser, it takes a function to create the error message—which `char1` and other parsers which call `satisfy1` pass—to create contextual error messages. The `string1` parser stays the same.

At this point, we can play with these parsers in GHCi:

```
> runParser1 (string1 "abc") "abc"
("","abc")
> runParser1 (string1 "abc") "abx"
Expected 'c', got 'x'
> runParser1 (string1 "abc") ""
Empty input
```

Great, it works! Let’s try it out by rewriting the JSON bool parser from the [previous post](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed#cb32-1):

```
jBool1 :: Parser1 String JValue
jBool1 =   string1 "true"  $> JBool True
       <|> string1 "false" $> JBool False
```

Over to GHCi:

```
> runParser1 jBool1 "trux"
Expected 'f', got 't'
```

Oops. That error message is wrong. It should have said `Expected 'e', got 'x'`. Somehow, the message is about `t` instead of `x`. What’s going on here?

### The Backtracking Problem[#](#the-backtracking-problem) ###

The problem is with the [backtracking](https://en.wikipedia.org/wiki/backtracking) done in the `jBool1` parser. When the first parser branch of `true` is unable to parse the input, it backtracks to the start of the input and tries to parse it with the second branch of `false`. And then it fails while trying to match `f` with the first character of the input `t`, hence the error message. The solution to this is to abandon backtracking and write a *Predictive Parser* with [lookahead](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?nosidenotes?mtm_campaign=feed#fn12).

```
lookahead1 :: Parser1 String Char
lookahead1 = Parser1 $ \case
  input@(c:_) -> Result (input, c)
  _           -> parseError1 "Empty input"

jBool2 :: Parser1 String JValue
jBool2 = do
  c <- lookahead1
  JBool <$> case c of
    't' -> string1 "true"  $> True
    'f' -> string1 "false" $> False
    _   -> throw1 $
      printf "Expected: 't' for true or 'f' for false; got '%v'" c
```

The `lookahead1` function lets us peek at the first character of the input without consuming it. We use it in the `jBool2` function to choose one of the `true` or `false` branches categorically, without any backtracking. If the lookahead is neither `t` or `f` then we throw an error.

Let’s see if it works:

```
> runParser1 jBool2 "trux"
Expected 'e', got 'x'
> runParser1 jBool2 "falze"
Expected 's', got 'z'
> runParser1 jBool2 "null"
Expected: 't' for true or 'f' for false; got 'n'
```

It works as expected. But this signals a big change for all our previous JSON parsers. We’ll need to switch from backtracking to lookahead everywhere. Fortunately, the JSON syntax is such that any JSON input can be parsed unambiguously with lookahead of only one character and we’ll not require any radical changes. But first, let’s figure out how to add position tracking to our parser.

Tracking Position[#](#tracking-position)
----------

We need to track the position where our parser is currently at—in terms of line and column numbers in the input text—so that we can include that information in our error messages. One obvious way of doing this is to make the parser stateful. We can do this by layering the [`StateT`](https://hackage.haskell.org/package/transformers/docs/Control-Monad-Trans-State-Strict.html#t:StateT) monad transformer over the basic `Parser` monad. Then we can have the current line and column numbers in the state and update them while processing the input in the parsers we write.

But we choose to be more adventurous! We’ll instead use an often talked about but seldom used technique: *Zippers*[<sup>4</sup>](#fn4).

### Zippers[#](#zippers) ###

Quoting the [Wikipedia](https://en.wikipedia.org/wiki/Zipper_(data_structure)) article on Zippers:

>
>
> A zipper is a technique of representing an aggregate data structure so that it is convenient for writing programs that traverse the structure arbitrarily and update its contents, especially in purely functional programming languages.
>
>

Basically, zippers are a special view of data structures, which allow one to navigate and update them easily. A zipper always has a focus or cursor which is the current element of the data structure we are “at”. Alongside, it also captures the rest of the data structure in a way that makes it easy to move around it. We can update the data structure by updating the element at the focus. Let’s take the example of a non-empty list to understand zippers.

![List zipper](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20121%2097'%3E%3C/svg%3E) \<img src="/images/json-parsing-from-scratch-in-haskell-2/list-zipper.svg" class="w-100pct mw-30pct nolink" alt="List zipper"\>\</img\> List zipper

For the above list, when are “at” or interested in the element `4`, the focus of the list zipper is `4`. It also contains two lists named `left` and `right` to capture the elements of the list left and right of the focus respectively. To move the focus from `4` to `3` on its left, we just need to uncons `3` from the left list, make it the focus and cons `4` to the right list. Here’s the code for list zipper:

```
data ListZipper a =
  ListZipper {
    lzLeft  :: [a]
  , lzFocus :: a
  , lzRight :: [a]
  } deriving (Show)

list2zipper :: NEL.NonEmpty a -> ListZipper a
list2zipper list = ListZipper [] (NEL.head list) (NEL.tail list)

lzMoveRight :: ListZipper a -> ListZipper a
lzMoveRight (ListZipper l f [])     = ListZipper l f []
lzMoveRight (ListZipper l f (x:xs)) = ListZipper (f:l) x xs

lzMoveLeft :: ListZipper a -> ListZipper a
lzMoveLeft (ListZipper [] f r)     = ListZipper [] f r
lzMoveLeft (ListZipper (x:xs) f r) = ListZipper xs x (f:r)

zipper2list :: ListZipper a -> NEL.NonEmpty a
zipper2list (ListZipper l f r) = NEL.fromList $ reverse l ++ f:r
```

Let’s see it in action in GHCi:

```
> lz = list2zipper $ NEL.fromList [1..9]
> lz
ListZipper {lzLeft = [], lzFocus = 1, lzRight = [2,3,4,5,6,7,8,9]}
> lzMoveLeft lz
ListZipper {lzLeft = [], lzFocus = 1, lzRight = [2,3,4,5,6,7,8,9]}
> lzMoveRight lz
ListZipper {lzLeft = [1], lzFocus = 2, lzRight = [3,4,5,6,7,8,9]}
> lzMoveRight $ lzMoveRight lz
ListZipper {lzLeft = [2,1], lzFocus = 3, lzRight = [4,5,6,7,8,9]}
> lzMoveRight $ lzMoveRight $ lzMoveRight lz
ListZipper {lzLeft = [3,2,1], lzFocus = 4, lzRight = [5,6,7,8,9]}
> lz' = lzMoveRight $ lzMoveRight $ lzMoveRight lz
> lzMoveLeft lz'
ListZipper {lzLeft = [2,1], lzFocus = 3, lzRight = [4,5,6,7,8,9]}
> lzMoveLeft $ lzMoveLeft lz'
ListZipper {lzLeft = [1], lzFocus = 2, lzRight = [3,4,5,6,7,8,9]}
> lzMoveLeft $ lzMoveLeft $ lzMoveLeft lz'
ListZipper {lzLeft = [], lzFocus = 1, lzRight = [2,3,4,5,6,7,8,9]}
> NEL.toList $ zipper2list lz'
[1,2,3,4,5,6,7,8,9]
```

With the understanding of the list zipper, let’s figure out a zipper for our parser input[<sup>5</sup>](#fn5).

### Text Zipper[#](#text-zipper) ###

Though the input to our parser is a `String`, for the purpose of error reporting, we should think of it as two-dimensional text with rows of lines from top-to-bottom and columns of characters from left-to-right. For this representation, we can devise a zipper as shown in the diagram below:

![Text zipper](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20297%20321'%3E%3C/svg%3E) \<img src="/images/json-parsing-from-scratch-in-haskell-2/text-zipper.svg" class="w-100pct mw-60pct nolink" alt="Text zipper"\>\</img\> Text zipper

If we think of our parser moving through this 2D text one character at a time—as a cursor moving through a text document—this zipper structure makes sense. The character just right of the cursor is the current character that the parser is going to consume next. There are some characters to the left of the cursor in the same line which have already been consumed and there are some to the right which are yet to be consumed. Similarly, there are some line above the current line which the parser has already seen and there are some yet unseen lines below the current line. With this view in mind, we can write the code for `TextZipper`:

```
data TextZipper a =
  TextZipper {
    tzLeft  :: a
  , tzRight :: a
  , tzAbove :: [a]
  , tzBelow :: [a]
  }

instance Show a => Show (TextZipper a) where
  show (TextZipper left right above below) =
    "TextZipper{left=" <> show left
      <> ", right=" <> show right
      <> ", above=" <> show above
      <> ", below=" <> show below
      <> "}"

textZipper :: [String] -> TextZipper String
textZipper []           = TextZipper "" "" [] []
textZipper (first:rest) = TextZipper "" first [] rest

currentPosition :: TextZipper String -> (Int, Int)
currentPosition zipper =
  (length (tzAbove zipper) + 1, length (tzLeft zipper) + 1)

currentChar :: TextZipper String -> Maybe Char
currentChar zipper = case tzRight zipper of
  []    -> Nothing
  (c:_) -> Just c

lines :: String -> [String]
lines = (split . dropFinalBlank . keepDelimsR . onSublist) "\n"
```

Finding the current position of the cursor in `TextZipper` is trivially easy. The current row number is just the count of lines above the current line plus one. Similarly, the current column number is the count of characters left of the cursor plus one. The `currentChar` function returns the character just right of the cursor, if there’s one present.

The `lines` function is a slightly modified version of `Prelude`’s [`lines`](https://hackage.haskell.org/package/base/docs/Prelude.html#v:lines) function which leaves the newlines (`\n`) in the output. We do this so that we can report an error if there is a newline at any wrong position like in middle of a JSON string.

Quick trial in GHCi:

```
> Prelude.lines "some\nnext\n\nmore"
["some","next","","more"]
> lines "some\nnext\n\nmore"
["some\n","next\n","\n","more"]

> text = lines "some text\nnext line\nmore lines"
> text
["some text\n","next line\n","more lines"]
> tz = textZipper text
> tz
TextZipper{left="", right="some text\n", above=[], below=["next line\n","more lines"]}
> currentPosition tz
(1,1)
> currentChar tz
Just 's'
```

Next, we write functions to move forward and backward in the text zipper:

```
moveByOne :: TextZipper String -> TextZipper String
moveByOne zipper
  -- not at end of line
  | not $ null (tzRight zipper) =
      zipper { tzLeft  = head (tzRight zipper) : tzLeft zipper
             , tzRight = tail $ tzRight zipper
             }
  -- at end of line but not at end of input
  | not $ null (tzBelow zipper) =
      zipper { tzAbove = tzLeft zipper : tzAbove zipper
             , tzBelow = tail $ tzBelow zipper
             , tzLeft  = ""
             , tzRight = head $ tzBelow zipper
             }
  -- at end of input
  | otherwise = zipper

move :: TextZipper String -> TextZipper String
move zipper = let zipper' = moveByOne zipper
  in case currentChar zipper' of
       Just _  -> zipper'
       Nothing -> moveByOne zipper'
```

The `moveByOne` function moves forward in the text zipper by one character. It considers three cases:

1. When not at the end of line indicated by `tzRight` not being empty, it moves the cursor by one character in the same line.
2. When at the end of line but not at the end of input indicated by `tzBelow` not being empty, it moves the cursor to the beginning of the next line below.
3. When at the end of the input, it does nothing.

The `move` function calls `moveByOne` one or two times to move past end of lines.

The `moveBackByOne` function is similar to `moveByOne` except it moves backwards in the zipper:

```
moveBackByOne :: TextZipper String -> TextZipper String
moveBackByOne zipper
  -- not at start of line
  | not $ null (tzLeft zipper) =
      zipper { tzLeft  = tail $ tzLeft zipper
             , tzRight = head (tzLeft zipper) : tzRight zipper
             }
  -- at start of line but not at start of input
  | not $ null (tzAbove zipper) =
      zipper { tzAbove = tail $ tzAbove zipper
             , tzBelow = tzRight zipper : tzBelow zipper
             , tzLeft  = head $ tzAbove zipper
             , tzRight = ""
             }
  -- at start of input
  | otherwise = zipper
```

Phew. That was a lot. Let’s try them out in GHCi to build our understanding:

```
> text = lines "some\nnext\n\nmore"
> text
["some\n","next\n","\n","more"]
> tz = textZipper text
> tz
TextZipper{left="", right="some\n", above=[], below=["next\n","\n","more"]}
> -- demostrating moveByOne
> moveByOne tz -- moves by one char
TextZipper{left="s", right="ome\n", above=[], below=["next\n","\n","more"]}
> f `times` n = (!! n) . iterate f
> moveByOne `times` 1 $ tz -- moves by one char
TextZipper{left="s", right="ome\n", above=[], below=["next\n","\n","more"]}
> moveByOne `times` 4 $ tz -- moves by four chars
TextZipper{left="emos", right="\n", above=[], below=["next\n","\n","more"]}
> moveByOne `times` 5 $ tz -- moves by five chars
TextZipper{left="\nemos", right="", above=[], below=["next\n","\n","more"]}
> moveByOne `times` 6 $ tz -- moves by six chars
TextZipper{left="", right="next\n", above=["\nemos"], below=["\n","more"]}
> -- demostrating move
> tz' = moveByOne `times` 6 $ tz
> tz'
TextZipper{left="", right="next\n", above=["\nemos"], below=["\n","more"]}
> move tz' -- moves by one char
TextZipper{left="n", right="ext\n", above=["\nemos"], below=["\n","more"]}
> move `times` 1 $ tz' -- moves by one char
TextZipper{left="n", right="ext\n", above=["\nemos"], below=["\n","more"]}
> move `times` 4 $ tz' -- moves by four chars
TextZipper{left="txen", right="\n", above=["\nemos"], below=["\n","more"]}
> move `times` 5 $ tz' -- moves by six chars, moving past end of line
TextZipper{left="", right="\n", above=["\ntxen","\nemos"], below=["more"]}
> -- demonstrating moveBackByOne
> tz' = moveByOne `times` 10 $ tz
> tz'
TextZipper{left="txen", right="\n", above=["\nemos"], below=["\n","more"]}
> moveBackByOne tz' -- moves back by one char
TextZipper{left="xen", right="t\n", above=["\nemos"], below=["\n","more"]}
> moveBackByOne `times` 1 $ tz' -- moves back by one char
TextZipper{left="xen", right="t\n", above=["\nemos"], below=["\n","more"]}
> moveBackByOne `times` 3 $ tz' -- moves back by three chars
TextZipper{left="n", right="ext\n", above=["\nemos"], below=["\n","more"]}
> moveBackByOne `times` 4 $ tz' -- moves back by four chars
TextZipper{left="", right="next\n", above=["\nemos"], below=["\n","more"]}
> moveBackByOne `times` 5 $ tz' -- moves back by five chars
TextZipper{left="\nemos", right="", above=[], below=["next\n","\n","more"]}
```

That works as expected. We are now ready to add position tracking to our error reporting parser.

### Zippered Parser[#](#zippered-parser) ###

Adding `TextZipper` to the parser is simple. We just change the input to be of type `TextZipper i`.

```
newtype Parser i o = Parser {
    runParser_ :: TextZipper i -> ParseResult (TextZipper i, o)
  }

runParser :: Parser String o -> String -> ParseResult (String, o)
runParser parser input =
  case runParser_ parser (textZipper $ lines input) of
    Error errs             -> Error errs
    Result (restZ, output) -> Result (leftOver restZ, output)
  where
    leftOver tz = concat (tzRight tz : tzBelow tz)
```

We also change the `runParser` function to convert the input string into a text zipper and to convert the text zipper for the leftover input back into a string at the end of parsing.

Finally, we rewrite the instances for `Parser` without any change in logic:

```
instance Functor (Parser i) where
  fmap f parser = Parser $ fmap (fmap f) . runParser_ parser

instance Applicative (Parser i) where
  pure x    = Parser $ pure . (, x)
  pf <*> pa = Parser $ \input -> case runParser_ pf input of
    Error err        -> Error err
    Result (rest, f) -> fmap f <$> runParser_ pa rest

instance Monad (Parser i) where
  parser >>= f = Parser $ \input -> case runParser_ parser input of
    Error err        -> Error err
    Result (rest, o) -> runParser_ (f o) rest
```

Notice that there is no `Alternative` instance of `Parser` anymore unlike the [previous post](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed#cb31-1). This is because we are eschewing the backtracking functionality provided by the `Alternative` instance for our current parser. This also means that we cannot use any convenience functions provided by `Alternative` like `many`, `some` and `optional`. But that’s okay because we will not need them when using lookahead.

Now that we have the parser with position tracking and error reporting separately, let’s integrate them together.

Errors with Position[#](#errors-with-position)
----------

We want to add positions of the errors to the error messages along with a sample text around the error position. The `addPosition` function does that:

```
addPosition :: String -> TextZipper String -> String
addPosition err zipper =
  let (ln, cn) = currentPosition zipper
      err'     = printf (err <> " at line %d, column %d: ") ln cn
      left     = reverse $ tzLeft zipper
      right    = tzRight zipper
      left'    = showStr $ drop (length left - ctxLen) left
      right'   = showStr $ take ctxLen right
      line     = left' <> right'
  in printf (err' <> "%s\n%s↑")
            line
            (replicate (length err' + length left') ' ')
  where
    ctxLen = 6
    showStr = concatMap showCharForErrorMsg

showCharForErrorMsg :: Char -> String
showCharForErrorMsg c = case c of
  '\b' -> "\\b"
  '\f' -> "\\f"
  '\n' -> "\\n"
  '\r' -> "\\r"
  '\t' -> "\\t"
  ' '  -> "·"
  _ | isControl c -> "\\" <> show (ord c)
  _ -> [c]
```

`addPosition` takes an error message and a text zipper. It finds the current position in the zipper and gets the text around the current position. Then it adds this text and the position in the error message and returns it. It also takes care of replacing characters in a way that makes the error messages more readable. Let’s see it at work in GHCi:

```
> text = lines "some\nnext\n\nmore"
> text
["some\n","next\n","\n","more"]
> tz = textZipper text
> tz
TextZipper{left="", right="some\n", above=[], below=["next\n","\n","more"]}
> f `times` n = (!! n) . iterate f
> tz' = move `times` 7 $ tz
> tz'
TextZipper{left="en", right="xt\n", above=["\nemos"], below=["\n","more"]}
> putStrLn $ addPosition "Something went wrong" tz'
Something went wrong at line 2, column 3: next\n
                                            ↑
```

It works perfectly. Now we can enhance our error related helper functions to add position info in errors.

```
parseError :: String -> TextZipper String -> ParseResult a
parseError err zipper = Error [addPosition err zipper]

throw :: String -> Parser String o
throw = Parser . parseError

elseThrow :: Parser String o -> String -> Parser String o
elseThrow parser err = Parser $ \input ->
  case runParser_ parser input of
    Result (rest, a) -> Result (rest, a)
    Error errs       -> Error (addPosition err input : errs)
```

We also define a parser combinator `elseThrow` which tries to run the parser given to it and returns an error with position info in case the parser fails. We’ll see it in action soon.

Our new parser with position-ful error reporting is complete now. Next, we rewrite all our parsers to use lookahead as we mentioned before, starting with the basic parsers.

Basic Parsers[#](#basic-parsers)
----------

We rewrite the parsers `lookahead` and `satisfy` to use our new `TextZipper` based parser.

```
lookahead :: Parser String Char
lookahead = Parser $ \input -> case currentChar input of
  Just c  -> Result (input, c)
  Nothing -> parseError "Empty input" input

safeLookahead :: Parser String (Maybe Char)
safeLookahead = Parser $ \input -> case currentChar input of
  Just c  -> Result (input, Just c)
  Nothing -> Result (input, Nothing)

satisfy :: (Char -> Bool) -> String -> Parser String Char
satisfy predicate expectation = Parser $ \input -> case currentChar input of
  Just c | predicate c -> Result (move input, c)
  Just c               -> flip parseError input $
    expectation <> ", got '" <> showCharForErrorMsg c <> "'"
  _                    -> flip parseError input $
    expectation <> ", but the input is empty"

char :: Char -> Parser String Char
char c = satisfy (== c) $ printf "Expected '%v'" $ showCharForErrorMsg c

digit :: Parser String Int
digit = digitToInt <$> satisfy isDigit "Expected a digit"

string :: String -> Parser String String
string ""     = pure ""
string (c:cs) = (:) <$> char c <*> string cs
```

We have an additional function `safeLookahead` which is like `lookahead` but instead of throwing a parser error on failure, it returns `Nothing`. Notice that `lookahead` and `safeLookahead` only call `currentChar` but not `move`, whereas `satisfy` calls both of them. This means the two lookahead functions do not consume from the input stream but `satisfy` does. Other parsers are barely changed. We can exercise them in GHCi to see the new functionalities:

```
> runParser lookahead "abc"
("abc",'a')
> runParser lookahead ""
Empty input at line 1, column 1:
                                 ↑
> runParser safeLookahead "abc"
("abc",Just 'a')
> runParser safeLookahead ""
("",Nothing)
> runParser (string "abh") "abhinav"
("inav","abh")
> runParser (string "abc") "abhinav"
Expected 'c', got 'h' at line 1, column 3: abhinav
                                             ↑
> runParser digit "12s"
("2s",1)
> runParser digit "abhinav"
Expected a digit, got 'a' at line 1, column 1: abhina
                                               ↑
```

We get correct results and correct error messages with right error positions.

Conclusion[#](#conclusion)
----------

We are in the process of rewriting the JSON parser we wrote in the [previous post](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed) to add support for error reporting. In this post, we rewrote the basic parser framework to support throwing errors with multiline contextual messages and error positions. In the [next post](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-3/?mtm_campaign=feed), we rewrite all JSON parsers using our new basic parsers to use lookahead instead of backtracking.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. Megaparsec provides a lot of other facilities for working with errors. You can define custom errors with custom messages which seamlessly work with the built-in pretty printing. You can catch errors in your parsers and choose to do another thing. You can even report multiple errors in a single run, which is useful when you are writing some sort of validation/inspection tool. [This tutorial](https://markkarpov.com/tutorial/megaparsec.html) goes in full depth about all the capabilities of Megaparsec.[↩︎](#fnref1)

2. Having unit tests before refactoring your code is always a good idea. Refactoring should be a behavior-preserving code change. Running the tests continuously ensures that the refactoring steps have not changed any behavior of the code. Property-based tests go a step further ahead by literally capturing the behaviors of your code as tests, no hand-written test data required. Though it is not shown in this post, the tests written in the previous post were a huge help to me and caught many edge-cases while adding the error reporting capabilities.[↩︎](#fnref2)

3. The suffix `1` has been added to the `Parser` type and the functions in the following code because this is not the final form of the parser we are going to write. The final ones will not have suffixes.[↩︎](#fnref3)

4. Let me reiterate that the parser implementation in this series of posts is for illustrative and learning/teaching purposes only. So it’s okay to have some fun using an interesting technique. A production grade parser will certainly not use Zippers like the way we do.[↩︎](#fnref4)

5. The [*Zippers*](https://web.archive.org/web/20200929/http://learnyouahaskell.com/zippers) chapter from the *Learn you a Haskell* book is a great resource to learn about zippers in detail.[↩︎](#fnref5)

This post is a part of the series: **JSON Parsing from Scratch in Haskell**.

1. [JSON Parsing from Scratch in Haskell](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed)
2. **Error Reporting—Part 1** 👈
3. [Error Reporting—Part 2](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-3/?mtm_campaign=feed)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-2/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Lobsters](https://lobste.rs/s/1tnngp)
* [Reddit](https://www.reddit.com/r/functionalprogramming/comments/j2fger/)
* [My website](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-2/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)