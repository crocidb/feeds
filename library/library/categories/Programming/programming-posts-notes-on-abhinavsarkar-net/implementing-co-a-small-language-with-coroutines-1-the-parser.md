+++
title = "Implementing Co, a Small Language With Coroutines #1: The Parser"
description = "Many major programming languages these days support some lightweight concurrency primitives. The most recent popular ones are GoroutinesConcurrency:_goroutines_and_channels) in Go, [Coroutines](http"
date = "2021-04-24T00:00:00Z"
url = "https://abhinavsarkar.net/posts/implementing-co-1/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.599522182Z"
seen = false
+++

Many major programming languages these days support some lightweight concurrency primitives. The most recent popular ones are [Goroutines](https://en.wikipedia.org/wiki/Go_(programming_language)#Concurrency:_goroutines_and_channels) in [Go](https://golang.org/), [Coroutines](https://kotlinlang.org/docs/coroutines-basics.html) in [Kotlin](https://kotlinlang.org/) and [Async](https://rust-lang.github.io/async-book/01_getting_started/02_why_async.html) in [Rust](https://www.rust-lang.org/). Let’s explore some of these concepts in detail by implementing a programming language with support for coroutines and Go-style channels.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/implementing-co-1/?mtm_campaign=feed).

This post is a part of the series: **Implementing Co, a Small Language With Coroutines**.

1. **The Parser** 👈
2. [The Interpreter](https://abhinavsarkar.net/posts/implementing-co-2/?mtm_campaign=feed)
3. [Adding Coroutines](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed)
4. [Adding Channels](https://abhinavsarkar.net/posts/implementing-co-4/?mtm_campaign=feed)
5. [Adding Sleep](https://abhinavsarkar.net/posts/implementing-co-5/?mtm_campaign=feed)

### Contents ###

1. [Lightweight Concurrency](#lightweight-concurrency)
2. [Introducing Co](#introducing-co)
3. [The Co Interpreter](#the-co-interpreter)
4. [The Co AST](#the-co-ast)
   1. [Expressions](#expressions)
   2. [Statements](#statements)

5. [Parsing](#parsing)
   1. [Parsing Expressions](#parsing-expressions)
   2. [Parsing Statements](#parsing-statements)

Lightweight Concurrency[#](#lightweight-concurrency)
----------

[Lightweight concurrency](https://en.wikipedia.org/wiki/Light-weight_process) has been a popular topic among programmers and programming language designers alike in recent times. Many languages created in the last decade have support for them either natively or using libraries. Some example are:

* [Goroutines](https://en.wikipedia.org/wiki/Go_(programming_language)#Concurrency:_goroutines_and_channels) in [Go](https://golang.org/),
* [Coroutines](https://kotlinlang.org/docs/coroutines-basics.html) in [Kotlin](https://kotlinlang.org/),
* [Async](https://rust-lang.github.io/async-book/01_getting_started/02_why_async.html) in [Rust](https://www.rust-lang.org/), and
* [core.async](https://clojure.github.io/core.async/) in [Clojure](https://clojure.org/).

These examples differ in their implementation details but all of them enable programmers to run millions of tasks concurrently. This capability of being able to do multiple tasks at the same time is called [*Multitasking*](https://en.wikipedia.org/wiki/Computer_multitasking).

Multitasking can be of two types:

* [Pre-emptive multitasking](https://en.wikipedia.org/wiki/Pre-emptive_multitasking) in which the tasks can be [preempted](https://en.wikipedia.org/wiki/Preemption_(computing)) so that other tasks can be run.
* [Cooperative multitasking](https://en.wikipedia.org/wiki/Cooperative_multitasking)<sup><a href="#ref-Bartel2011-ap" class="citation" title="Bartel, “Non-Preemptive Multitasking.”">@1</a></sup> in which the tasks voluntarily yield control to other tasks to be run.

[Coroutines](https://en.wikipedia.org/wiki/Coroutines)<sup><a href="#ref-Knuth1997-rv" class="citation" title="Knuth, “Coroutines.”">@2</a></sup> are computations that support cooperative multitasking[<sup>1</sup>](#fn1). Unlike ordinary [*Subroutines*](https://en.wikipedia.org/wiki/Subroutines) that execute from start to end and do not hold any state between invocations, coroutines can exit in the middle by calling other coroutines and may later resume at the same point. They also hold state between invocations. They do so by [*yielding*](https://en.wikipedia.org/wiki/Yield_(multithreading)) the control of the current running thread so that some other coroutine can be run on the same thread[<sup>2</sup>](#fn2).

Coroutine implementations often come with support for [*Channels*](https://en.wikipedia.org/wiki/Channel_(programming)) for inter-coroutine communication. One coroutine can send a message over a channel, and another coroutine can receive the message from the same channel. Coroutines and channels together are an implementation of [*Communicating Sequential Processes*](https://en.wikipedia.org/wiki/Communicating_Sequential_Processes) (CSP)<sup><a href="#ref-Hoare1986-ih" class="citation" title="Hoare, “Communicating Sequential Processes.”">@5</a></sup>, a formal language for describing patterns of interaction in concurrent systems.

In this series of posts, we implement Co, a small dynamically typed [imperative programming](https://en.wikipedia.org/wiki/imperative_programming) language with support for coroutines and channels. [Haskell](https://www.haskell.org) is our choice of language to write an interpreter for Co.

Introducing Co[#](#introducing-co)
----------

Co has these basic features that are found in many programming languages:

* [Dynamic](https://en.wikipedia.org/wiki/Dynamic_typing) and [strong](https://en.wikipedia.org/wiki/Strong_and_weak_typing) typing.
* Null, boolean, string and integer literals, and values.
* Addition, subtraction, multiplication and integer division arithmetic operations.
* String concatenation operation.
* Equality and inequality checks on booleans, strings and numbers.
* Less-than and greater-than comparison operations on numbers.
* Variable declarations, usage and assignments.
* `if` and `while` statements.
* Function declarations and calls, with support for recursion.
* First class functions and anonymous functions.
* Mutable closures.

It also has these special features:

* `yield` statement to yield the current thread of computation (ToC).
* `spawn` statement to start a new ToC.
* First class channels with operators to send and receive values over them.
* `sleep` function to sleep the current ToC for a given number of milliseconds.

Let’s see some example code in Co for illustration:

```
// Fibonacci numbers
// using a while loop
var a = 0;
var b = 1;
var j = 0;
var temp = null;
while (j < 6) {
  print(a);
  temp = a;
  a = b;
  b = temp + b;
  j = j + 1;
}

// Fibonacci numbers
// using recursive function call
function fib(n) {
  if (n < 2) {
    return n;
  }
  return fib(n - 2)
    + fib(n - 1);
}

var i = 0;
while (i < 6) {
  print(fib(i));
  i = i + 1;
}
```

As you may notice, Co’s syntax is heavily inspired by [JavaScript](https://en.wikipedia.org/wiki/JavaScript). The code example above computes and prints[<sup>3</sup>](#fn3) the first six [Fibonacci numbers](https://en.wikipedia.org/wiki/Fibonacci_numbers) in two different ways, and demonstrates a number of features of Co, including variable declarations and assignments, `while` loops, `if` conditions, and function declarations and calls along with recursion.

We can save the code in a file and run it with the Co interpreter[<sup>4</sup>](#fn4) to print this (correct) output:

```
0
1
1
2
3
5
0
1
1
2
3
5
```

The next example shows the usage of coroutines in Co:

```
function printNums(start, end) {
  var i = start;
  while (i < end + 1) {
    print(i);
    yield;
    i = i + 1;
  }
}

spawn printNums(1, 4);
printNums(11, 16);
```

Running this code with the interpreter prints this output:

```
11
1
12
2
13
3
14
4
15
16
```

The `printNum` function prints numbers between the `start` and `end` arguments, but yields the ToC after each print. Notice how the prints are interleaved. This is because the two calls to the function `printNums` run concurrently in two separate coroutines.

The next example show the usage of channels in Co:

```
var chan = newChannel();

function player(name) {
  var n = null;
  while (true) {
    n = <- chan;
    if (n == "done") {
      print(name + " done");
      return;
    }

    print(name + " " + n);
    if (n == 0) {
      print(name + " done");
      "done" -> chan;
      return;
    }
    n - 1 -> chan;
  }
}

spawn player("ping");
spawn player("pong");
10 -> chan;
```

This is the popular [Ping-pong](http://erlang.org/doc/getting_started/conc_prog.html) [benchmark](https://kotlinlang.org/docs/channels.html#channels-are-fair) for communication between ToCs. Here we use channels and coroutines for the same. Running this code prints this output:

```
ping 10
pong 9
ping 8
pong 7
ping 6
pong 5
ping 4
pong 3
ping 2
pong 1
ping 0
ping done
pong done
```

Lastly, here is [Sleep sort](https://www.geeksforgeeks.org/dsa/sleep-sort-king-laziness-sorting-sleeping/) in Co:

```
function sleepSort(a, b, c, d, e) {
  function printNum(num) {
    sleep(num);
    print(num);
  }
  spawn printNum(a);
  spawn printNum(b);
  spawn printNum(c);
  spawn printNum(d);
  spawn printNum(e);
}

sleepSort(5, 4, 3, 2, 1);
```

Running this code prints this output:

```
1
2
3
4
5
```

We’ll revisit these examples later while building our interpreter, and understand them as well as the code that implements them.

The Co Interpreter[#](#the-co-interpreter)
----------

The Co interpreter works in two stages:

1. Parsing: a parser converts Co source code to [*Abstract Syntax Tree*](https://en.wikipedia.org/wiki/Abstract_Syntax_Tree) (AST).
2. Interpretation: a [tree-walking interpreter](https://en.wikipedia.org/wiki/Interpreter_(computing)#Abstract_syntax_tree_interpreters) walks the AST, executes the instructions and produces the output.

![Stages of the Co interpreter](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20521%2065'%3E%3C/svg%3E) \<img src="/images/implementing-co-1/stages.svg" class="w-100pct mw-80pct nolink" alt="Stages of the Co interpreter"\>\</img\> Stages of the Co interpreter

In this post, we implement the parser for Co. In the [second part](https://abhinavsarkar.net/posts/implementing-co-2/?mtm_campaign=feed), we create a first cut of the interpreter that supports the [basic features](#basic-features) of Co. In the third and fourth parts, we extend the interpreter to add support for coroutines and channels.

The complete code for the parser is [here](https://abhinavsarkar.net/code/co-parser.html?mtm_campaign=feed). You can load it in GHCi using [stack](https://haskellstack.org/) (by running `stack co-interpreter.hs`), and follow along while reading this article[<sup>5</sup>](#fn5).

Let’s start with listing the extensions and imports needed[<sup>6</sup>](#fn6).

```
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RecordWildCards #-}
module CoInterpreter where

import Control.Concurrent (forkIO, threadDelay)
import Control.Concurrent.MVar.Lifted
import Control.Monad (foldM, unless, void, when)
import Control.Monad.Base (MonadBase, liftBase)
import Control.Monad.Combinators.Expr (Operator (..), makeExprParser)
import Control.Monad.Cont (ContT, MonadCont, callCC, runContT)
import Control.Monad.Except (ExceptT, MonadError (..), runExceptT)
import Control.Monad.IO.Class (MonadIO, liftIO)
import Control.Monad.State.Strict (MonadState, StateT, evalStateT)
import qualified Control.Monad.State.Strict as State
import Data.Foldable (traverse_)
import Data.IORef.Lifted
import qualified Data.Map.Strict as Map
import Data.Maybe (fromMaybe)
import qualified Data.PQueue.Prio.Min as PQ
import Data.Time.Clock.POSIX (getPOSIXTime)
import Data.Void (Void)
import System.Clock (Clock (Monotonic), fromNanoSecs, getTime, TimeSpec)
import System.Environment (getArgs, getProgName)
import System.IO (hPutStrLn, stderr)
import Text.Megaparsec hiding (runParser)
import Text.Megaparsec.Char
import qualified Text.Megaparsec.Char.Lexer as L
import Text.Pretty.Simple
  ( CheckColorTty (..),
    OutputOptions (..),
    defaultOutputOptionsNoColor,
    pPrintOpt,
  )
```

Next, let’s take a look at the Co AST.

The Co AST[#](#the-co-ast)
----------

Since Co is an [imperative programming](https://en.wikipedia.org/wiki/imperative_programming) language, it is naturally [*Statement*](https://en.wikipedia.org/wiki/Statement_(computer_science)) oriented. A statement describes how an action is to be executed. A Co program is a list of top-level statements.

Statements have internal components called [*Expressions*](https://en.wikipedia.org/wiki/Expression_(computer_science)). Expressions evaluate to values at program run time. Let’s look at them first.

### Expressions[#](#expressions) ###

We represent Co expressions as a Haskell [*Algebraic data type*](https://en.wikipedia.org/wiki/Algebraic_data_type) (ADT) with one constructor per expression type:

```
data Expr
  = LNull
  | LBool Bool
  | LStr String
  | LNum Integer
  | Variable Identifier
  | Binary BinOp Expr Expr
  | Call Expr [Expr]
  | Lambda [Identifier] [Stmt]
  | Receive Expr
  deriving (Show, Eq)

type Identifier = String
```

`LNull`

The literal `null`. Evaluates to the null value.

`LBool Bool`

The boolean literals, `true` and `false`. Evaluate to their counterpart boolean values.

`LStr String`

A string literal like `"towel"`. Evaluates to a string.

`LNum Integer`

An integer literal like `1` or `-5`. Evaluates to an integer.

`Variable Identifier`

A variable named by an identifier like `a1` or `sender`. Evaluates to the variable’s value at the point in the execution of code. An `Identifier` is a string of alphanumeric characters, starting with an alpha character.

`Binary Op Expr Expr`

A binary operation on two expressions. Example: `1 + 41` or `2 == "2"`. Supported binary operations are defined by the `BinOp` enum: addition/concatenation, subtraction, multiplication, integer division, equality and inequality checks, and less-than and greater-than comparisons.

```
data BinOp =
    Plus
  | Minus
  | Slash
  | Star
  | Equals
  | NotEquals
  | LessThan
  | GreaterThan
  deriving (Show, Eq)
```

`Call Expr [Expr]`

Calls the function obtained by evaluating the callee expression, with the given argument expressions. Examples: `calcDistance(start, end)` or `getResolver(context)(template)`.

`Lambda [Identifier] [Stmt]`

A function with the given parameter names and body statements. Example: `function (a, b) { return a*a + b*b; }`.

`Receive Expr`

Receives a value from a channel. Examples:

```
// receive a value from the channel and prints it
print(<- someChannel);
// receive a value from the channel and assigns it
var x = <- someChannel;
```

Next, we see how statements are represented in the AST.

### Statements[#](#statements) ###

We represent the Co statements as a Haskell ADT with one constructor per statement type:

```
data Stmt
  = ExprStmt Expr
  | VarStmt Identifier Expr
  | AssignStmt Identifier Expr
  | IfStmt Expr [Stmt]
  | WhileStmt Expr [Stmt]
  | FunctionStmt Identifier [Identifier] [Stmt]
  | ReturnStmt (Maybe Expr)
  | YieldStmt
  | SpawnStmt Expr
  | SendStmt Expr Expr
  deriving (Show, Eq)

type Program = [Stmt]
```

`ExprStmt Expr`

A statement with just an expression. The expression’s value is thrown away after executing the statement. Example: `1 + 2;`

`VarStmt Identifier Expr`

Defines a new variable named by an identifier and sets it to an expression’s value. In Co, variables must be initialized when being defined. Example: `var a = 5;`

`AssignStmt Identifier Expr`

Sets an already defined variable named by an identifier to an expression’s value. Example: `a = 55 + "hello";`

`IfStmt Expr [Stmt]`

Executes a list of statements if the condition expression evaluates to a truthy value. In Co, `null` and `false` values are non-truthy, and every other value is truthy. Also note that, there are no `else` branches for `if` statements in Co. Example:

```
if (a == 1) {
  print("hello");
}
```

`WhileStmt Expr [Stmt]`

Executes a list of statements repeatedly while the condition expression evaluates to a truthy value. Example:

```
var n = 0;
while (n < 5) {
  print(n);
  n = n + 1;
}
```

`FunctionStmt Identifier [Identifier] [Stmt]`

Defines a function with a name, a list of parameter names, and a list of body statements. Example:

```
function greet(greeting) {
  print(greeting + " world");
}
```

`ReturnStmt (Maybe Expr)`

Returns from a function, optionally returning an expression’s value. Example:

```
function square(x) {
  return x * x;
}
```

`YieldStmt`

Suspends the currently executing ToC so that some other ToC may run. The current ToC resumes later from statement next to the `yield` statement. Example:

```
function printNums(start, end) {
  var i = start;
  while (i < end + 1) {
    print(i);
    yield;
    i = i + 1;
  }
}
```

`SpawnStmt Expr`

Starts a new ToC in which the given expression is evaluated, which runs concurrently with all other running ToCs. Example:

```
spawn printNums(1, 4);
printNums(11, 16);
```

`SendStmt Expr Expr`

Sends an expressions’s value to a channel. Example:

```
1 + square(3) -> someChannel;
```

The Co AST is minimal but it serves our purpose. Next, let’s figure out how to actually parse source code to AST.

Parsing[#](#parsing)
----------

Parsing is the process of taking textual input data and converting it to a data structure—often a hierarchal structure like AST—while checking the input for correct syntax. There are many ways of writing parsers[<sup>7</sup>](#fn7), [*Parser Combinators*](https://en.wikipedia.org/wiki/Parser_Combinators)<sup><a href="#ref-Hutton1992-vc" class="citation" title="Hutton, “Higher-Order Functions for Parsing.”">@11</a></sup> being one of them. Parser combinators [libraries](https://hackage.haskell.org/packages/#cat:Parsing) are popular in Haskell because of their ease of use and succinctness. We are going to use one such library, [Megaparsec](https://hackage.haskell.org/package/megaparsec), to create a parser for Co.

Let’s start with writing some basic parsers for the Co syntax using the Megaparsec parsers.

```
type Parser = Parsec Void String

sc :: Parser ()
sc = L.space space1 lineCmnt blockCmnt
  where
    lineCmnt = L.skipLineComment "//"
    blockCmnt = L.skipBlockComment "/*" "*/"

lexeme :: Parser a -> Parser a
lexeme = L.lexeme sc

symbol :: String -> Parser String
symbol = L.symbol sc

reserved :: String -> Parser ()
reserved w = (lexeme . try) $ string w *> notFollowedBy alphaNumChar

parens, braces :: Parser a -> Parser a
parens = between (symbol "(") (symbol ")")
braces = between (symbol "{") (symbol "}")

semi, identifier, stringLiteral :: Parser String
semi = symbol ";"
identifier = lexeme ((:) <$> letterChar <*> many alphaNumChar)
stringLiteral = char '"' >> manyTill L.charLiteral (char '"') <* sc

integer :: Parser Integer
integer = lexeme (L.signed sc L.decimal)
```

In the above code, `Parser` is a concise type-alias for our parser type[<sup>8</sup>](#fn8).

The `sc` parser is the space consumer parser. It dictates what’s ignored while parsing the sources code. For Co, we consider the Unicode space character and the control characters—tab, newline, carriage return, form feed, and vertical tab—as whitespaces. We use the [`space1`](https://hackage.haskell.org/package/megaparsec-9.0.1/docs/Text-Megaparsec-Char.html#v:space1) parser to configure that. `sc` also lets us configure how to ignore line comments and block comments while parsing.

The `lexeme` combinator is for parsing [*Lexemes*](https://en.wikipedia.org/wiki/Lexemes) while ignoring whitespaces and comments. It is implemented using the [`lexeme`](https://hackage.haskell.org/package/megaparsec-9.0.1/docs/Text-Megaparsec-Char-Lexer.html#v:lexeme) combinator from Megaparsec.

The `symbol` combinator is for parsing symbols, that is, operators like `*` and `;`. It is implemented using the [`symbol`](https://hackage.haskell.org/package/megaparsec-9.0.1/docs/Text-Megaparsec-Char-Lexer.html#v:symbol) combinator.

The `reserved` combinator is for parsing reserved keywords like `if` and `while`. It is implemented as a combination of `lexeme` combinator and `string` parser, while making sure that the reserved keyword is not a prefix of another word. It uses the `try` combinator to backtrack if that happens.

The `parens` and `braces` combinators are for parsing code surrounded by parentheses `(` and `)` and braces `{` and `}` respectively.

The `semi` parser matches a semicolon `;`. The `identifier` parser is for parsing identifiers in Co. The `stringLiteral` parser matches a string literal like `"polyphonic ringtone"`. `integer` is the parser for Co integers.

Let’s also write some functions to run the parsers and pretty-print the output in GHCi:

```
runParser :: Parser a -> String -> Either String a
runParser parser code = do
  case parse parser "" code of
    Left err -> Left $ errorBundlePretty err
    Right prog -> Right prog

pPrint :: (MonadIO m, Show a) => a -> m ()
pPrint =
  pPrintOpt CheckColorTty $
    defaultOutputOptionsNoColor
      { outputOptionsIndentAmount = 2,
        outputOptionsCompact = True,
        outputOptionsCompactParens = True
      }
```

That completes our basic setup for parsing. Let’s try them out in GHCi now:

```
> runParser identifier "num1 "
Right "num1"
> runParser stringLiteral "\"val\"  "
Right "val"
> runParser integer "1  "
Right 1
> runParser integer "-12  "
Right (-12)
```

They work as expected. Next, off to parsing Co expressions.

### Parsing Expressions[#](#parsing-expressions) ###

Parsing Co expressions to AST requires us to handle the [*Associativity*](https://en.wikipedia.org/wiki/Operator_associativity) and [*Precedence*](https://en.wikipedia.org/wiki/Order_of_operations) of the operators. Fortunately, Megaparsec makes it easy with the [`makeExprParser`](https://hackage.haskell.org/package/parser-combinators-1.3.0/docs/Control-Monad-Combinators-Expr.html#v:makeExprParser) combinator. `makeExprParser` takes a parser to parse the terms and a table of operators, and creates the expression parser for us.

* Terms are parts of expressions which cannot be broken down further into sub-expressions. Examples in Co are literals, variables, groupings and function calls.
* The table of operators is a list of [`Operator`](https://hackage.haskell.org/package/parser-combinators-1.3.0/docs/Control-Monad-Combinators-Expr.html#t:Operator) `Parser Expr` lists ordered in descending precedence. All operators in one list have the same precedence but may have different associativity.

This is a lot to take in but looking at the code makes it clear. First, the operator table:

```
operators :: [[Operator Parser Expr]]
operators =
  [ [Prefix $ Receive <$ symbol "<-"],
    [ binary Slash $ symbol "/",
      binary Star $ symbol "*"],
    [ binary Plus $ symbol "+",
      binary Minus $ try (symbol "-" <* notFollowedBy (char '>'))
    ],
    [ binary LessThan $ symbol "<",
      binary GreaterThan $ symbol ">"
    ],
    [ binary Equals $ symbol "==",
      binary NotEquals $ symbol "!="
    ]
  ]
  where
    binary op symP = InfixL $ Binary op <$ symP
```

The prefix operator `<-`, for receiving values from channels, is of highest precedence and hence the first in the table. Next are the binary operators `/` and `*` for integer division and multiplication respectively. Following it, are the binary `+` and `-` operators which are of same precedence. After that come the comparison operators `<` and `>`. Finally, we have the lowest precedence operators, the equality and inequality checks `==` and `!=`.

Each operator also contains the parser to parse the operator symbol in the source code. All of them are self-explanatory except the parser for the `-` operator. The `-` parser is slightly complicated because we want it to not parse `->`, the channel send operator, the first character of which is same as the symbol for the `-` operator.

Moving on to the term parser next:

```
term :: Parser Expr
term = primary >>= call
  where
    call e =
      ( lookAhead (symbol "(")
        >> symbol "("
        >> Call e <$> sepBy expr (symbol ",") <* symbol ")"
        >>= call )
      <|> pure e

    primary = LNull <$ reserved "null"
          <|> LBool True <$ reserved "true"
          <|> LBool False <$ reserved "false"
          <|> LStr <$> stringLiteral
          <|> LNum <$> integer
          <|> Lambda
            <$> (reserved "function" *> parens (sepBy identifier $ symbol ","))
            <*> braces (many stmt)
          <|> Variable <$> identifier
          <|> parens expr
```

The `term` parser uses the `primary` parser to parse the primary terms, and the `call` parser to parse the function calls. The `call` parser is recursive because the callee itself can be a chain of more functions calls, for example `x(1, 2)(y)("blah")()`. It starts with the output of the `primary` parser, and then tries to parse a function call. If it succeeds, it calls itself again to parse the next function call in the chain. If it fails, it returns the output of the previous round[<sup>9</sup>](#fn9).

The `primary` parser is a combination of smaller parsers—one for each type of primary terms in Co—combined together using the [`Alternative`](https://hackage.haskell.org/package/base-4.12.0.0/docs/Control-Applicative.html#t:Alternative) instance of the parsers. It matches each parser one by one from the top until the match succeeds[<sup>10</sup>](#fn10). First, it tries to match for literals `null`, `true`, and `false`, failing which it matches for string and integer literals. Then it matches for anonymous functions, variables, and expressions grouped in parentheses—in that order[<sup>11</sup>](#fn11).

That’s it! We finally write the expression parser:

```
expr :: Parser Expr
expr = makeExprParser term operators
```

Let’s play with it in GHCi:

```
> pPrint $ runParser expr "1 + a < 9 - <- chan"
Right
  ( Binary LessThan
    ( Binary Plus ( LNum 1 ) ( Variable "a" ) )
    ( Binary Minus ( LNum 9 ) ( Receive ( Variable "chan" ) ) ) )
> pPrint $ runParser expr "funFun(null == \"ss\" + 12, true)"
Right
  ( Call "funFun"
    [ Binary Equals LNull
      ( Binary Plus ( LStr "ss" ) ( LNum 12 ) )
    , LBool True ] )
> pPrint $ runParser expr "-99 - <- chan + funkyFun(a, false, \"hey\")"
Right
  ( Binary Plus
    ( Binary Minus ( LNum ( - 99 ) ) ( Receive ( Variable "chan" ) ) )
    ( Call "funkyFun" [ Variable "a", LBool False, LStr "hey" ] ) )
> pPrint $ runParser expr "(function (x) { print(x + 1); })(99)"
Right
  ( Call
    ( Lambda [ "x" ]
      [ ExprStmt
        ( Call
          ( Variable "print" )
          [ Binary Plus ( Variable "x" ) ( LNum 1 ) ] ) ] )
    [ LNum 99 ] )
```

Done! Onward, to parsing Co statements.

### Parsing Statements[#](#parsing-statements) ###

For parsing statements, we reuse the same trick we used for parsing expressions: combine smaller parsers for each statement type using `Alternative`.

```
stmt :: Parser Stmt
stmt =
  IfStmt <$> (reserved "if" *> parens expr) <*> braces (many stmt)
    <|> WhileStmt <$> (reserved "while" *> parens expr) <*> braces (many stmt)
    <|> VarStmt <$> (reserved "var" *> identifier) <*> (symbol "=" *> expr <* semi)
    <|> YieldStmt <$ (reserved "yield" <* semi)
    <|> SpawnStmt <$> (reserved "spawn" *> expr <* semi)
    <|> ReturnStmt <$> (reserved "return" *> optional expr <* semi)
    <|> FunctionStmt
      <$> try (reserved "function" *> identifier)
      <*> parens (sepBy identifier $ symbol ",")
      <*> braces (many stmt)
    <|> try (AssignStmt <$> identifier <*> (symbol "=" *> expr <* semi))
    <|> try (SendStmt <$> expr <*> (symbol "->" *> expr <* semi))
    <|> ExprStmt <$> expr <* semi
```

Most of the statements start with keywords like `if`, `var`, `function`, etc, so our parsers look for the keywords first using the `reserved` parser. If none of the keyword-starting statements match then we try matching for assignments, channel sends, and expression statements, in that order. The `stmt` parser uses the `expr` parser to parse expressions within statements. It also uses the combinators [`many`](https://hackage.haskell.org/package/parser-combinators-1.3.0/docs/Control-Applicative-Combinators.html#v:many), [`optional`](https://hackage.haskell.org/package/parser-combinators-1.3.0/docs/Control-Applicative-Combinators.html#v:optional), [`try`](https://hackage.haskell.org/package/megaparsec-9.0.1/docs/Text-Megaparsec.html#v:try) and [`sepBy`](https://hackage.haskell.org/package/parser-combinators-1.3.0/docs/Control-Applicative-Combinators.html#v:sepBy) from Megaparsec.

Finally, we put everything together to create the parser for Co:

```
program :: Parser Program
program = sc *> many stmt <* eof
```

The Co parser matches multiple top-level statements, starting with optional whitespace and ending with end-of-file.

It’s demo time. In GHCi, we parse a file and pretty-print the AST:

```
> readFile "coroutines.co" >>= pPrint . runParser program
Right
  [ FunctionStmt "printNums"
    [ "start", "end" ]
    [ VarStmt "i"
      ( Variable "start" )
    , WhileStmt
      ( Binary LessThan
        ( Variable "i" )
        ( Binary Plus ( Variable "end" ) ( LNum 1 ) ) )
      [ ExprStmt
        ( Call "print" [ Variable "i" ] )
      , YieldStmt
      , AssignStmt "i"
        ( Binary Plus ( Variable "i" ) ( LNum 1 ) ) ] ]
  , SpawnStmt
    ( Call "printNums" [ LNum 1, LNum 4 ] )
  , ExprStmt
    ( Call "printNums" [ LNum 11, LNum 16 ] ) ]
```

I’ve gone ahead and created a side-by-side view of the source code and corresponding AST for all three input files, aligned neatly for your pleasure of comparison. If you so wish, feast your eyes on them, and check for yourself that everything works correctly.

<details> <summary class="print-em"> Source code and AST for `fib.co` </summary>

|```<br/>// Fibonacci numbers<br/>// using a while loop<br/>var a = 0;<br/>var b = 1;<br/>var j = 0;<br/>var temp = null;<br/>while (j < 6) {<br/>  print(a);<br/>  temp = a;<br/>  a = b;<br/>  b = temp + b;<br/>  j = j + 1;<br/>}<br/><br/>// Fibonacci numbers<br/>// using recursive function call<br/>function fib(n) {<br/>  if (n < 2) {<br/>    return n;<br/>  }<br/>  return fib(n - 2)<br/>    + fib(n - 1);<br/>}<br/><br/>var i = 0;<br/>while (i < 6) {<br/>  print(fib(i));<br/>  i = i + 1;<br/>}<br/>```|```<br/><br/>[ VarStmt "a" ( LNum 0 )<br/>, VarStmt "b" ( LNum 1 )<br/>, VarStmt "j" ( LNum 0 )<br/>, VarStmt "temp" LNull<br/>, WhileStmt ( Binary LessThan ( Variable "j" ) ( LNum 6 ) )<br/>  [ ExprStmt ( Call "print" [ Variable "a" ] )<br/>  , AssignStmt "temp" ( Variable "a" )<br/>  , AssignStmt "a" ( Variable "b" )<br/>  , AssignStmt "b" ( Binary Plus ( Variable "temp" ) ( Variable "b" ) )<br/>  , AssignStmt "j" ( Binary Plus ( Variable "j" ) ( LNum 1 ) )<br/>  ]<br/><br/>, FunctionStmt "fib" [ "n" ]<br/>  [ IfStmt ( Binary LessThan ( Variable "n" ) ( LNum 2 ) )<br/>    [ ReturnStmt ( Just ( Variable "n" ) )<br/>    ]<br/>  , ReturnStmt ( Just ( Binary Plus ( Call "fib" [ Binary Minus ( Variable "n" ) ( LNum 2 ) ] )<br/>                                    ( Call "fib" [ Binary Minus ( Variable "n" ) ( LNum 1 ) ] ) ) )<br/>  ]<br/><br/>, VarStmt "i" ( LNum 0 )<br/>, WhileStmt ( Binary LessThan ( Variable "i" ) ( LNum 6 ) )<br/>  [ ExprStmt ( Call "print" [ Call "fib" [ Variable "i" ] ] )<br/>  , AssignStmt "i" ( Binary Plus ( Variable "i" ) ( LNum 1 ) )<br/>  ] ]<br/>```|
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

</details> <details> <summary class="print-em"> Source code and AST for `coroutines.co` </summary>

|```<br/>function printNums(start, end) {<br/>  var i = start;<br/>  while (i < end + 1) {<br/>    print(i);<br/>    yield;<br/>    i = i + 1;<br/>  }<br/>}<br/><br/>spawn printNums(1, 4);<br/>printNums(11, 16);<br/>```|```<br/>[ FunctionStmt "printNums" [ "start", "end" ]<br/>  [ VarStmt "i" ( Variable "start" )<br/>  , WhileStmt ( Binary LessThan ( Variable "i" ) ( Binary Plus ( Variable "end" ) ( LNum 1 ) )<br/>    [ ExprStmt ( Call "print" [ Variable "i" ] )<br/>    , YieldStmt<br/>    , AssignStmt "i" ( Binary Plus ( Variable "i" ) ( LNum 1 ) )<br/>    ]<br/>  ]<br/><br/>, SpawnStmt ( Call "printNums" [ LNum 1, LNum 4 ] )<br/>, ExprStmt ( Call "printNums" [ LNum 11, LNum 16 ] ) ]<br/>```|
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

</details> <details> <summary class="print-em"> Source code and AST for `pingpong.co` </summary>

|```<br/>var chan = newChannel();<br/><br/>function player(name) {<br/>  var n = null;<br/>  while (true) {<br/>    n = <- chan;<br/>    if (n == "done") {<br/>      print(name + " done");<br/>      return;<br/>    }<br/><br/>    print(name + " " + n);<br/>    if (n == 0) {<br/>      print(name + " done");<br/>      "done" -> chan;<br/>      return;<br/>    }<br/>    n - 1 -> chan;<br/>  }<br/>}<br/><br/>spawn player("ping");<br/>spawn player("pong");<br/>10 -> chan;<br/>```|```<br/>[ VarStmt "chan" ( Call "newChannel" [] )<br/><br/>, FunctionStmt "player" [ "name" ]<br/>  [ VarStmt "n" LNull<br/>  , WhileStmt ( LBool True )<br/>    [ AssignStmt "n" ( Receive ( Variable "chan" ) )<br/>    , IfStmt ( Binary Equals ( Variable "n" ) ( LStr "done" ) )<br/>      [ ExprStmt ( Call "print" [ Binary Plus ( Variable "name" ) ( LStr " done" ) ] )<br/>      , ReturnStmt Nothing<br/>      ]<br/><br/>    , ExprStmt ( Call "print" [ Binary Plus ( Binary Plus ( Variable "name" ) ( LStr " " ) ) ( Variable "n" ) ] )<br/>    , IfStmt ( Binary Equals ( Variable "n" ) ( LNum 0 ) )<br/>      [ ExprStmt ( Call "print" [ Binary Plus ( Variable "name" ) ( LStr " done" ) ] )<br/>      , SendStmt ( LStr "done" ) "chan"<br/>      , ReturnStmt Nothing<br/>      ]<br/>    , SendStmt ( Binary Minus ( Variable "n" ) ( LNum 1 ) ) "chan"<br/>    ]<br/>  ]<br/><br/>, SpawnStmt ( Call "player" [ LStr "ping" ] )<br/>, SpawnStmt ( Call "player" [ LStr "pong" ] )<br/>, SendStmt ( LNum 10 ) "chan" ]<br/>```|
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

</details>
---

That’s all for now. In about 200 lines of code, we have implemented the complete parser for Co. In the [next part](https://abhinavsarkar.net/posts/implementing-co-2/?mtm_campaign=feed), we’ll implement a tree-walking interpreter for the Co AST that supports the [basic features](#basic-features).

The full code for the parser can be seen [here](https://abhinavsarkar.net/code/co-parser.html?mtm_campaign=feed).

Acknowledgements[#](#acknowledgements)
----------

Many thanks to [Steven Deobald](https://deobald.ca/) for reviewing a draft of this article.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

 Bartel, Joe. “Non-Preemptive Multitasking.” *The Computer Journal*, no. 30 (May 2011): 37–38, 28. [http://cini.classiccmp.org/pdf/HT68K/HT68K%20TCJ30p37.pdf](<http://cini.classiccmp.org/pdf/HT68K/HT68K TCJ30p37.pdf>).

 Hoare, C A R. “Communicating Sequential Processes.” *Communications of the ACM* 21, no. 8 (1978): 666–77. [https://doi.org/10.1145/359576.359585](https://doi.org/10.1145/359576.359585).

 Hutton, Graham. “Higher-Order Functions for Parsing.” *Journal of Functional Programming* 2, no. 3 (1992): 323–43. [https://doi.org/10.1017/S0956796800000411](https://doi.org/10.1017/S0956796800000411).

 Knuth, Donald E. “Coroutines.” In *The Art of Computer Programming: Volume 1: Fundamental Algorithms*, 3rd ed., 193–200. Addison Wesley, 1997.

 Watson, Des. “Approaches to Syntax Analysis.” In *A Practical Approach to Compiler Construction*, 75–93. Springer International Publishing, 2017. [https://doi.org/10.1007/978-3-319-52789-5\_4](https://doi.org/10.1007/978-3-319-52789-5_4).

---

1. Coroutines are often conflated with [*Fibers*](https://en.wikipedia.org/wiki/Fiber_(computer_science)). Some implementations of coroutines call themselves fibers instead. Quoting Wikipedia:

   >
   >
   > Fibers describe essentially the same concept as coroutines. The distinction, if there is any, is that coroutines are a language-level construct, a form of control flow, while fibers are a systems-level construct, viewed as threads that happen to not run in parallel. It is contentious which of the two concepts has priority: fibers may be viewed as an implementation of coroutines, or as a substrate on which to implement coroutines.
   >
   >

   [↩︎](#fnref1)
2. [*Green threads*](https://en.wikipedia.org/wiki/Green_threads) are another popular solution for lightweight concurrency. Unlike coroutines, green threads are preemtable. Unlike [*Threads*](https://en.wikipedia.org/wiki/Thread_(computing)), they are scheduled by the language runtime instead of the operating system.[↩︎](#fnref2)

3. `print` is a built-in function in Co. It behaves same as the `console.log` function in JavaScript, or the [`print`](https://hackage.haskell.org/package/base-4.15.0.0/docs/Prelude.html#v:print) function in Haskell.[↩︎](#fnref3)

4. The complete code for the interpreter is [here](https://abhinavsarkar.net/code/co-interpreter.html?mtm_campaign=feed).[↩︎](#fnref4)

5. If you are a Cabal user instead, the process is a little longer. First run:

   ```
   cabal repl \
     --build-depends "megaparsec ^>= 9.0" \
     --build-depends "lifted-base ^>= 0.2" \
     --build-depends "clock ^>= 0.8" \
     --build-depends "pqueue ^>= 1.4" \
     --build-depends "pretty-simple ^>= 4.0"
   ```

   Then in the started GHCi REPL, run `:load co-interpreter.hs`. You should be able to use the functions in the interpreter now.[↩︎](#fnref5)

6. We are using:

   * the [containers](https://hackage.haskell.org/package/containers) and [pqueue](https://hackage.haskell.org/package/pqueue) libraries for data structures,
   * the [clock](https://hackage.haskell.org/package/clock) library for getting system time,
   * the [megaparsec](https://hackage.haskell.org/package/megaparsec) library for parsing,
   * the [mtl](https://hackage.haskell.org/package/mtl) and [lifted-base](https://hackage.haskell.org/package/lifted-base) libraries for the Monad stack and operations, and
   * the [pretty-simple](https://hackage.haskell.org/package/pretty-simple) library for pretty printing data structures.

   [↩︎](#fnref6)
7. I explore parsing in more depth by writing a JSON parser from scratch in Haskell in [one of my previous posts](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed).[↩︎](#fnref7)

8. I followed [this](https://github.com/mrkkrp/megaparsec-site/blob/master/tutorials/parsing-simple-imperative-language.md) (outdated) Megaparsec tutorial for writing a parser for an imperative language. [This tutorial](https://markkarpov.com/tutorial/megaparsec.html) is also helpful in learning the intricacies of Megaparsec.[↩︎](#fnref8)

9. `term` is a [*Recursive descent parser*](https://en.wikipedia.org/wiki/Recursive_descent_parser). If we directly include call parsing as an alternative in the `primary` parser, we would run into the [*Left recursion*](https://en.wikipedia.org/wiki/Left_recursion) problem, causing the parser to hang in infinite loop.[↩︎](#fnref9)

10. In the parsing parlance this is called *[Backtracking](https://en.wikipedia.org/wiki/Backtracking)*. The alternative is to do a *[Lookahead](https://en.wikipedia.org/wiki/Parsing#Lookahead)*<sup><a href="#ref-Watson2017" class="citation" title=" (Watson, “Approaches to Syntax Analysis”)">@14</a></sup>.[↩︎](#fnref10)

11. An earlier version of this post used the `symbol` parser for parsing keywords instead of the `reserved` parser. That would cause the parser to fail to parse variable names like `nullx` that start with a keyword. Using the `reserved` parser fixes this issue because of the built-in backtracking using `try`.[↩︎](#fnref11)

This post is a part of the series: **Implementing Co, a Small Language With Coroutines**.

1. **The Parser** 👈
2. [The Interpreter](https://abhinavsarkar.net/posts/implementing-co-2/?mtm_campaign=feed)
3. [Adding Coroutines](https://abhinavsarkar.net/posts/implementing-co-3/?mtm_campaign=feed)
4. [Adding Channels](https://abhinavsarkar.net/posts/implementing-co-4/?mtm_campaign=feed)
5. [Adding Sleep](https://abhinavsarkar.net/posts/implementing-co-5/?mtm_campaign=feed)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/implementing-co-1/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/109600762450465878)
* [Lobsters](https://lobste.rs/s/5cn5oa)
* [Reddit](https://www.reddit.com/r/haskell/comments/n8f22x/)
* [Discourse](https://discourse.haskell.org/t//2484)
* [My website](https://abhinavsarkar.net/posts/implementing-co-1/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)