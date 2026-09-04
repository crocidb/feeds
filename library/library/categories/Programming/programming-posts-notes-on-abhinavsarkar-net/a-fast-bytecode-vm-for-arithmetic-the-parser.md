+++
title = "A Fast Bytecode VM for Arithmetic: The Parser"
description = "In this series of posts, we write a fast bytecode compiler and a virtual machine for arithmetic in Haskell. We explore the following topics: Parsing arithmetic expressions to Abstract Syntax Trees (ASTs). Unit testing for our parser. Interpreting ASTs. Compiling ASTs to bytec"
date = "2025-08-02T00:00:00Z"
url = "https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.476939242Z"
seen = false
+++

In this series of posts, we write a fast bytecode compiler and a virtual machine for arithmetic in Haskell. We explore the following topics:

* Parsing arithmetic expressions to Abstract Syntax Trees (ASTs).
* Unit testing for our parser.
* Interpreting ASTs.
* Compiling ASTs to bytecode.
* Disassembling and decompiling bytecode.
* Unit testing for our compiler.
* Property-based testing for our compiler.
* Efficiently executing bytecode in a virtual machine (VM).
* Unit testing and property-based testing for our VM.
* Benchmarking our code to see how the different passes perform.
* All the while keeping an eye on performance.

In this post, we write the parser for our expression language to an AST, and an AST interpreter.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed).

This post is a part of the series: **A Fast Bytecode VM for Arithmetic**.

1. **The Parser** 👈
2. [The Compiler](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-compiler/?mtm_campaign=feed)
3. [The Virtual Machine](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm/?mtm_campaign=feed)

### Contents ###

1. [Introduction](#introduction)
2. [Expressions](#expressions)
3. [Parsing Expressions](#parsing-expressions)
4. [Error Handling](#error-handling)
5. [The Parser](#the-parser)
6. [Testing the Parser](#testing-the-parser)
7. [The AST Interpreter](#the-ast-interpreter)
8. [Testing the Interpreter](#testing-the-interpreter)

Introduction[#](#introduction)
----------

The language that we are going to work with is that of basic [arithmetic](https://en.wikipedia.org/wiki/arithmetic) expressions, with integer values, and addition, subtraction, multiplication and integer division operations. However, our expression language has a small twist: it is possible to introduce a variable using a `let` binding and use the variable in the expressions in the body of `let`[<sup>1</sup>](#fn1). Furthermore, we use the same syntax for `let` as Haskell does. Here are some examples of valid expressions in our language:

```
1 + 2 - 3 * 4 + 5 / 6 / 0 + 1
let x = 4 in x + 1
let x = 4 in let y = 5 in x + y
let x = 4 in let y = 5 in x + let z = y in z * z
let x = 4 in (let y = 5 in x + 1) + let z = 2 in z * z
let x = (let y = 3 in y + y) in x * 3
let x = let y = 3 in y + y in x * 3
let x = let y = 1 + let z = 2 in z * z in y + 1 in x * 3
```

The only gotcha here is that the body of a `let` expression extends as far as possible while accounting for nested `let`s. It becomes clear when we look at parsed expressions later.

The eventual product is a command-line tool that can run different commands. Let’s start with a demo of the tool:

```
$ arith-vm -h
Bytecode VM for Arithmetic written in Haskell

Usage: arith-vm COMMAND

Available options:
  -h,--help                Show this help text

Available commands:
  read                     Read an expression from file or STDIN
  parse                    Parse expression to AST
  print                    Parse expression to AST and print it
  compile                  Parse and compile expression to bytecode
  disassemble              Disassemble bytecode to opcodes
  decompile                Disassemble and decompile bytecode to expression
  interpret-ast            Parse expression and interpret AST
  interpret-bytecode       Parse, compile and assemble expression, and
                           interpret bytecode
  run                      Run bytecode
  generate                 Generate a random arithmetic expression

$ arith-vm parse -h
Usage: arith-vm print [FILE]

  Parse expression to AST and print it

Available options:
  FILE                     Input file, pass - to read from STDIN (default)
  -h,--help                Show this help text

$ echo -n "let x = 1 in let y = 2 in y + x * 3" | arith-vm print
( let x = 1 in ( let y = 2 in ( y + ( x * 3 ) ) ) )

$ echo -n "let x = 1 in let y = 2 in y + x * 3" | arith-vm compile > a.tbc

$ hexdump -C a.tbc
00000000  00 01 00 00 02 00 01 01  01 00 00 03 00 05 03 02  |................|
00000010  02                                                |.|
00000011

$ arith-vm disassemble a.tbc
OPush 1
OPush 1
OPush 2
OGet 1
OGet 0
OPush 3
OMul
OAdd
OSwapPop
OSwapPop

$ arith-vm decompile a.tbc
( let a = 1 in ( let b = 2 in ( b + ( a * 3 ) ) ) )

$ echo -n "let x = 1 in let y = 2 in y + x * 3" | arith-vm interpret-ast
5

$ echo -n "let x = 1 in let y = 2 in y + x * 3" | arith-vm interpret-bytecode
5

$ arith-vm run a.tbc
5

$ arith-vm generate
(
  (
    (
      ( let nD =
        ( 11046 - -20414 ) in
        ( let xqf = ( -15165 * nD ) in nD )
      ) * 26723
    ) /
    (
      ( let phMuOI =
        ( let xQ = ( let mmeBy = -28095 in 22847 ) in 606 ) in 25299
      ) *
      ( let fnoNQm = ( let mzZaZk = 29463 in 18540 ) in ( -2965 / fnoNQm ) )
    )
  ) * 21400
)
```

We can parse an expression, or compile it to bytecode. We can also disassemble bytecode to opcodes, or decompile it back to an expression. We can interpret an expression either as an AST or as bytecode. We can also run a bytecode file directly. Finally, we have a handy command to generate random expressions for testing/benchmarking purposes[<sup>2</sup>](#fn2).

Let’s start.

Expressions[#](#expressions)
----------

Since this is Haskell, we start with listing many language extensions and imports:

```
{-# LANGUAGE GHC2021 #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE UndecidableInstances #-}

module ArithVMLib
  ( Expr(..), Ident(..), Op(..), Pass(..), Error(..), Opcode(..), Bytecode,
    sizedExpr, parse, parseSized, compile', compile, decompile, disassemble,
    exprGen, interpretAST, interpretBytecode', interpretBytecode ) where

import Control.Applicative ((<|>))
import Control.DeepSeq (NFData)
import Control.Exception (Exception, catch, throwIO)
import Control.Monad (unless, void, when)
import Control.Monad.Except (MonadError (..), runExceptT)
import Control.Monad.ST.Strict (runST)
import Data.Attoparsec.ByteString.Char8 qualified as P
import Data.Bits (shiftL, shiftR, (.&.), (.|.))
import Data.ByteString qualified as BS
import Data.ByteString.Char8 qualified as BSC
import Data.ByteString.Internal qualified as BSI
import Data.ByteString.Unsafe qualified as BS
import Data.Char (toUpper)
import Data.HashMap.Strict qualified as Map
import Data.Hashable (Hashable)
import Data.Int (Int16)
import Data.List qualified as List
import Data.Maybe (fromMaybe)
import Data.Primitive.PrimArray qualified as PA
import Data.Sequence (Seq (..), (|>))
import Data.Sequence qualified as Seq
import Data.Set qualified as Set
import Data.Strict.Tuple (Pair ((:!:)))
import Data.Strict.Tuple qualified as TS
import Data.Word (Word16, Word8)
import Foreign.Ptr (Ptr, minusPtr, plusPtr)
import Foreign.Storable (poke)
import GHC.Generics (Generic)
import Test.QuickCheck qualified as Q
```

 ArithVMLib.hs

We use the `GHC2021` extension here that enables a lot of useful GHC extensions by default. We are using the [bytestring](https://hackage.haskell.org/package/bytestring/) and [attoparsec](https://hackage.haskell.org/package/attoparsec/) libraries for parsing, [strict](https://hackage.haskell.org/package/strict/), [containers](https://hackage.haskell.org/package/containers/) and [unordered-containers](https://hackage.haskell.org/package/unordered-containers/) for compilation, [deepseq](https://hackage.haskell.org/package/deepseq/), [mtl](https://hackage.haskell.org/package/mtl/) and [primitive](https://hackage.haskell.org/package/primitive/) for interpreting, and [QuickCheck](https://hackage.haskell.org/package/QuickCheck/) for testing.

The first step is to parse an expression into an *[Abstract Syntax Tree](https://en.wikipedia.org/wiki/Abstract_Syntax_Tree)* (AST). We represent the AST as Haskell *[Algebraic Data Types](https://en.wikipedia.org/wiki/Algebraic_data_type)* (ADTs):

```
data Expr
  = Num !Int16
  | Var !Ident
  | BinOp !Op Expr Expr
  | Let !Ident Expr Expr
  deriving (Eq, Generic)

newtype Ident = Ident BS.ByteString
  deriving (Eq, Ord, Generic, Hashable)

data Op = Add | Sub | Mul | Div deriving (Eq, Enum, Generic)

instance NFData Expr

instance Show Expr where
  show = \case
    Num n -> show n
    Var (Ident x) -> BSC.unpack x
    BinOp op a b -> "(" <> show a <> " " <> show op <> " " <> show b <> ")"
    Let (Ident x) a b ->
      "(let " <> BSC.unpack x <> " = " <> show a <> " in " <> show b <> ")"

instance NFData Ident

instance Show Ident where
  show (Ident x) = BSC.unpack x

mkIdent :: String -> Ident
mkIdent = Ident . BSC.pack

instance NFData Op

instance Show Op where
  show = \case
    Add -> "+"
    Sub -> "-"
    Mul -> "*"
    Div -> "/"
```

 ArithVMLib.hs

We add `Show` instances for ADTs so that we can pretty-print the parsed AST[<sup>3</sup>](#fn3). Now, we can start parsing.

Parsing Expressions[#](#parsing-expressions)
----------

The [EBNF](https://en.wikipedia.org/wiki/EBNF) grammar for expressions is as follows:

```
expr     ::= term | term space* ("+" | "-") term
term     ::= factor | factor space* ("*" | "/") factor
factor   ::= space* (grouping | num | var | let)
grouping ::= "(" expr space* ")"
num      ::= "-"? [0-9]+
var      ::= ident
ident    ::= ([a-z] | [A-Z])+
let      ::= "let" space+ ident space* "=" expr space* "in" space+ expr space*
space    ::= " " | "\t" | "\n" | "\f" | "\r"
```

The `expr`, `term`, `factor`, and `grouping` productions take care of having the right precedence of arithmetic operations. The `num` and `var` productions are trivial. Our language is fairly oblivious of whitespaces; we allow zero-or-more spaces at most places.

The `let` expressions grammar is pretty standard, except we require one-or-more spaces after the `let` and `in` keywords to make them unambiguous.

We use the [parser combinator](https://en.wikipedia.org/wiki/parser_combinator) library [attoparsec](https://hackage.haskell.org/package/attoparsec/) for creating the parser. attoparsec works directly with bytestrings so we don’t incur the cost of decoding unicode characters[<sup>4</sup>](#fn4)[<sup>5</sup>](#fn5).

We write the parser in a top-down [recursive-descent](https://en.wikipedia.org/wiki/Recursive_descent_parser) fashion, same as the grammar, starting with the `expr` parser:

```
type SizedExpr = (Expr, Int)

-- expr ::= term | term space* ("+" | "-") term
exprParser :: P.Parser SizedExpr
exprParser = chainBinOps termParser $ \case
  '+' -> pure Add
  '-' -> pure Sub
  op -> fail $ "Expected '+' or '-', got: " <> show op

-- term ::= factor | factor space* ("*" | "/") factor
termParser :: P.Parser SizedExpr
termParser = chainBinOps factorParser $ \case
  '*' -> pure Mul
  '/' -> pure Div
  op -> fail $ "Expected '*' or '/', got: " <> show op

chainBinOps :: P.Parser SizedExpr -> (Char -> P.Parser Op) -> P.Parser SizedExpr
chainBinOps operandParser operatorParser = operandParser >>= rest
  where
    rest (!expr, !size1) =
      ( do
          P.skipSpace
          c <- P.anyChar
          operator <- operatorParser c
          (operand, !size2) <- operandParser
          rest (BinOp operator expr operand, size1 + size2 + 1)
      ) <|> pure (expr, size1)
{-# INLINE chainBinOps #-}
```

 ArithVMLib.hs

One small complication: our parsers not only return the parsed expressions, but also the number of bytes they occupy when compiled to bytecode. We gather this information while building the AST in parts, and propagate it upward in the tree. We use the bytecode size later in the compilation pass[<sup>6</sup>](#fn6).

Both `exprParser` and `termParser` chain the right higher precedence parsers with the right operators between them[<sup>7</sup>](#fn7) using the `chainBinOps` combinator.

```
-- factor ::= space* (grouping | num | var | let)
factorParser :: P.Parser SizedExpr
factorParser = do
  P.skipSpace
  P.peekChar' >>= \case
    '(' -> groupingParser
    '-' -> numParser
    c | P.isDigit c -> numParser
    c | c /= 'l' -> varParser
    _ -> varParser <|> letParser

-- grouping ::= "(" expr space* ")"
groupingParser :: P.Parser SizedExpr
groupingParser = P.char '(' *> exprParser <* P.skipSpace <* P.char ')'
```

 ArithVMLib.hs

`factorParser` uses [lookahead](https://en.wikipedia.org/wiki/Parsing#Lookahead) to dispatch between one of the primary parsers, which is faster than using [backtracking](https://en.wikipedia.org/wiki/backtracking). `groupingParser` simply skips the parenthesis, and recursively calls `exprParser`.

```
-- num ::= "-"? [0-9]+
numParser :: P.Parser SizedExpr
numParser = do
  n <- P.signed P.decimal P.<?> "number"
  if validInt16 n
    then pure (Num $ fromIntegral n, 3)
    else fail $ "Expected a valid Int16, got: " <> show n
  where
    validInt16 :: Integer -> Bool
    validInt16 i =
      fromIntegral (minBound @Int16) <= i
        && i <= fromIntegral (maxBound @Int16)
```

 ArithVMLib.hs

`numParser` uses the `signed` and `decimal` parsers from the attoparsec library to parse an optionally signed integer. We restrict the numbers to 2-byte integers (-32768–32767 inclusive)[<sup>8</sup>](#fn8). The `<?>` helper from attoparsec names parsers so that the error message shown in case of failures point to the right parser.

```
-- var ::= ident
varParser :: P.Parser SizedExpr
varParser = (,2) . Var <$> identParser

-- ident ::= ([a-z] | [A-Z])+
identParser :: P.Parser Ident
identParser = do
  ident <- P.takeWhile1 P.isAlpha_ascii P.<?> "identifier"
  if isReservedKeyword ident
    then fail $
      "Expected identifier, got: \"" <> BSC.unpack ident
        <> "\", which is a reversed keyword"
    else pure $ Ident ident
{-# INLINE identParser #-}

isReservedKeyword :: BSC.ByteString -> Bool
isReservedKeyword = \case
  "let" -> True
  "in" -> True
  _ -> False
{-# INLINE isReservedKeyword #-}
```

 ArithVMLib.hs

`varParser` and `identParser` are straightforward. We restrict identifiers to upper-and-lowercase [ASCII](https://en.wikipedia.org/wiki/ASCII) alphabetic letters. We also check that our reserved keywords (`let` and `in`) are not used as identifiers.

Finally, we write the parser for `let` expressions:

```
-- let ::= "let" space+ ident space* "=" expr space* "in" space+ expr space*
letParser :: P.Parser SizedExpr
letParser = do
  expect "let" <* skipSpace1
  !x <- identParser
  P.skipSpace *> expect "="
  (assign, !aSize) <- exprParser
  P.skipSpace *> expect "in" <* skipSpace1
  (body, !bSize) <- exprParser <* P.skipSpace
  pure (Let x assign body, aSize + bSize + 1)
  where
    expect s =
      void (P.string s) <|> do
        found <- P.manyTill P.anyChar (void P.space <|> P.endOfInput)
        let found' = if found == "" then "end-of-input" else "\"" <> found <> "\""
        fail $ "Expected: \"" <> BSC.unpack s <> "\", got: " <> found'

    skipSpace1 = P.space *> P.skipSpace
```

 ArithVMLib.hs

In `letParser` we use `identParser` to parse the variable name, and recursively call `exprParser` to parse the assignment and body expressions, while making sure to correctly parse the spaces. The helper parser `expect` is used to parse known string tokens (`let`, `=` and `in`), and provide good error messages in case of failures. Talking about error messages …

Error Handling[#](#error-handling)
----------

Let’s figure out an error handling strategy. We use an `Error` type wrapped in [`Either`](https://hackage.haskell.org/package/base/docs/Prelude.html#t:Either) to propagate the errors in our program:

```
data Error = Error !Pass !String
  deriving (Generic)

instance Eq Error where
  (Error _ m1) == (Error _ m2) = m1 == m2

instance Show Error where
  show (Error pass msg) = show pass <> " error: " <> msg

instance NFData Error
instance Exception Error

data Pass
  = Read
  | Parse
  | Print
  | Compile
  | Decompile
  | Disassemble
  | InterpretAST
  | InterpretBytecode
  deriving (Show, Eq, Generic)

instance NFData Pass

type Result = Either Error
```

 ArithVMLib.hs

The `Error` type also captures the `Pass` in which the error is thrown. `Result` is a type alias that represents either an error or a result. Finally, we put all the parsers together to write the `parse` function.

The Parser[#](#the-parser)
----------

Our `parseSized` function uses the `parse` function from attoparsec to run the `exprParser` over an input.

```
parseSized :: BS.ByteString -> Result SizedExpr
parseSized = processResult . P.parse (exprParser <* P.skipSpace)
  where
    processResult = \case
      P.Done "" res -> pure res
      P.Done leftover _ ->
        throwParseError $
          "Leftover input: \"" <> BSC.unpack leftover <> "\""
      P.Partial f -> processResult $ f ""
      P.Fail _ [] err ->
        throwParseError . capitalize . fromMaybe err $
          List.stripPrefix "Failed reading: " err
      P.Fail "" ctxs _ ->
        throwParseError $
          "Expected: " <> formatExpected ctxs <> ", got: end-of-input"
      P.Fail leftover ctxs _ ->
        throwParseError $
          "Expected: " <> formatExpected ctxs
            <> ", got: \"" <> head (words $ BSC.unpack leftover) <> "\""

    capitalize ~(c : cs) = toUpper c : cs

    formatExpected ctxs = case last ctxs of
      [c] -> "\'" <> [c] <> "\'"
      s -> s

    throwParseError = throwError . Error Parse

parse :: BS.ByteString -> Result Expr
parse = fmap fst . parseSized
{-# INLINE parse #-}
```

 ArithVMLib.hs

The `processResult` function deals with intricacies of how attoparsec returns the parsing result. Basically, we inspect the returned result and throw appropriate errors with useful error messages. We use [`throwError`](https://hackage.haskell.org/package/mtl/docs/Control-Monad-Error.html#v:throwError) from the `MonadError` typeclass that works with all its instances, which `Either` is one of.

Finally, we throw away the bytecode size from the result of `parseSized` in the `parse` function.

The parser is done. But as good programmers, we must make sure that it works correctly. Let’s write some unit tests.

Testing the Parser[#](#testing-the-parser)
----------

We use the [hspec](https://hspec.github.io/) library to write unit tests for our program. Each test is written as a [spec](https://en.wikipedia.org/wiki/Behavior-driven_development#Behavioral_specifications)[<sup>9</sup>](#fn9).

```
{-# LANGUAGE GHC2021 #-}
{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import ArithVMLib
import Control.Arrow ((>>>))
import Control.Monad (forM_, (>=>))
import Data.ByteString.Char8 qualified as BSC
import Data.Int (Int16)
import Data.Sequence qualified as Seq
import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck qualified as Q

parserSpec :: Spec
parserSpec = describe "Parser" $ do
  forM_ parserSuccessTests $ \(input, result) ->
    it ("parses: \"" <> BSC.unpack input <> "\"") $ do
      (show <$> parse input) `shouldBe` Right result

  forM_ parserErrorTests $ \(input, err) ->
    it ("fails for: \"" <> BSC.unpack input <> "\"") $ do
      parse input `shouldSatisfy` \case
        Left (Error Parse msg) | err == msg -> True
        _ -> False

parserSuccessTests :: [(BSC.ByteString, String)]
parserSuccessTests =
  [ ( "1 + 2 - 3 * 4 + 5 / 6 / 0 + 1",
      "((((1 + 2) - (3 * 4)) + ((5 / 6) / 0)) + 1)"
    ),
    ( "1+2-3*4+5/6/0+1",
      "((((1 + 2) - (3 * 4)) + ((5 / 6) / 0)) + 1)"
    ),
    ( "1 + -1",
      "(1 + -1)"
    ),
    ( "let x = 4 in x + 1",
      "(let x = 4 in (x + 1))"
    ),
    ( "let x=4in x+1",
      "(let x = 4 in (x + 1))"
    ),
    ( "let x = 4 in let y = 5 in x + y",
      "(let x = 4 in (let y = 5 in (x + y)))"
    ),
    ( "let x = 4 in let y = 5 in x + let z = y in z * z",
      "(let x = 4 in (let y = 5 in (x + (let z = y in (z * z)))))"
    ),
    ( "let x = 4 in (let y = 5 in x + 1) + let z = 2 in z * z",
      "(let x = 4 in ((let y = 5 in (x + 1)) + (let z = 2 in (z * z))))"
    ),
    ( "let x=4in 2+let y=x-5in x+let z=y+1in z/2",
      "(let x = 4 in (2 + (let y = (x - 5) in (x + (let z = (y + 1) in (z / 2))))))"
    ),
    ( "let x = (let y = 3 in y + y) in x * 3",
      "(let x = (let y = 3 in (y + y)) in (x * 3))"
    ),
    ( "let x = let y = 3 in y + y in x * 3",
      "(let x = (let y = 3 in (y + y)) in (x * 3))"
    ),
    ( "let x = let y = 1 + let z = 2 in z * z in y + 1 in x * 3",
      "(let x = (let y = (1 + (let z = 2 in (z * z))) in (y + 1)) in (x * 3))"
    )
  ]

parserErrorTests :: [(BSC.ByteString, String)]
parserErrorTests =
  [ ("", "Not enough input"),
    ("1 +", "Leftover input: \"+\""),
    ("1 & 1", "Leftover input: \"& 1\""),
    ("1 + 1 & 1", "Leftover input: \"& 1\""),
    ("1 & 1 + 1", "Leftover input: \"& 1 + 1\""),
    ("(", "Not enough input"),
    ("(1", "Expected: ')', got: end-of-input"),
    ("(1 + ", "Expected: ')', got: \"+\""),
    ("(1 + 2", "Expected: ')', got: end-of-input"),
    ("(1 + 2}", "Expected: ')', got: \"}\""),
    ("66666", "Expected a valid Int16, got: 66666"),
    ("-x", "Expected: number, got: \"-x\""),
    ("let 1", "Expected: identifier, got: \"1\""),
    ("let x = 1 in ", "Not enough input"),
    ( "let let = 1 in 1",
      "Expected identifier, got: \"let\", which is a reversed keyword"
    ),
    ( "let x = 1 in in",
      "Expected identifier, got: \"in\", which is a reversed keyword"
    ),
    ("let x=1 inx", "Expected: space, got: \"x\""),
    ("letx = 1 in x", "Leftover input: \"= 1 in x\""),
    ("let x ~ 1 in x", "Expected: \"=\", got: \"~\""),
    ("let x = 1 & 2 in x", "Expected: \"in\", got: \"&\""),
    ("let x = 1 inx", "Expected: space, got: \"x\""),
    ("let x = 1 in x +", "Leftover input: \"+\""),
    ("let x = 1 in x in", "Leftover input: \"in\""),
    ("let x = let x = 1 in x", "Expected: \"in\", got: end-of-input")
  ]
```

 ArithVMSpec.hs

We have a bunch of tests for the parser, testing both success and failure cases. Notice how spaces are treated in the expressions. Also notice how the `let` expressions are parsed. We’ll add property-based tests for the parser in the next post.

There is not much we can do with the parsed ASTs at this point. Let’s write an interpreter to evaluate our ASTs.

The AST Interpreter[#](#the-ast-interpreter)
----------

The AST interpreter is a standard and short recursive interpreter with an environment mapping variables to their values:

```
interpretAST :: Expr -> Result Int16
interpretAST = go Map.empty
  where
    go env = \case
      Num n -> pure n
      Var x -> case Map.lookup x env of
        Just v -> pure v
        Nothing -> throwInterpretError $ "Unknown variable: " <> show x
      BinOp op a b -> do
        !a' <- go env a
        !b' <- go env b
        case op of
          Add -> pure $! a' + b'
          Sub -> pure $! a' - b'
          Mul -> pure $! a' * b'
          Div | b' == 0 -> throwInterpretError "Division by zero"
          Div | b' == (-1) && a' == minBound ->
            throwInterpretError "Arithmetic overflow"
          Div -> pure $! a' `div` b'
      Let x assign body -> do
        !val <- go env assign
        go (Map.insert x val env) body

    throwInterpretError = throwError . Error InterpretAST
```

 ArithVMLib.hs

This interpreter serves both as a performance baseline for the bytecode VM we write later, and as a definitional interpreter for testing the VM[<sup>10</sup>](#fn10). We are careful in detecting division-by-zero and arithmetic overflow errors, but we ignore possible integer overflow/underflow errors that may be caused by the arithmetic operations.

Testing the Interpreter[#](#testing-the-interpreter)
----------

We write some unit tests for the interpreter following the same pattern as the parser:

```
astInterpreterSpec :: Spec
astInterpreterSpec = describe "AST interpreter" $ do
  forM_ astInterpreterSuccessTests $ \(input, result) ->
    it ("interprets: \"" <> BSC.unpack input <> "\"") $ do
      parseInterpret input `shouldBe` Right result

  forM_ astInterpreterErrorTests $ \(input, err) ->
    it ("fails for: \"" <> BSC.unpack input <> "\"") $ do
      parseInterpret input `shouldSatisfy` \case
        Left (Error InterpretAST msg) | err == msg -> True
        _ -> False
  where
    parseInterpret = parse >=> interpretAST

astInterpreterSuccessTests :: [(BSC.ByteString, Int16)]
astInterpreterSuccessTests =
  [ ("1", 1),
    ("1 + 2 - 3 * 4 + 5 / 6 / 1 + 1", -8),
    ("1 + (2 - 3) * 4 + 5 / 6 / (1 + 1)", -3),
    ("1 + -1", 0),
    ("1 * -1", -1),
    ("let x = 4 in x + 1", 5),
    ("let x = 4 in let x = x + 1 in x + 2", 7),
    ("let x = 4 in let y = 5 in x + y", 9),
    ("let x = 4 in let y = 5 in x + let z = y in z * z", 29),
    ("let x = 4 in (let y = 5 in x + y) + let z = 2 in z * z", 13),
    ("let x = let y = 3 in y + y in x * 3", 18),
    ("let x = let y = 1 + let z = 2 in z * z in y + 1 in x * 3", 18)
  ]

astInterpreterErrorTests :: [(BSC.ByteString, String)]
astInterpreterErrorTests =
  [ ("x", "Unknown variable: x"),
    ("let x = 4 in y + 1", "Unknown variable: y"),
    ("let x = y + 1 in x", "Unknown variable: y"),
    ("let x = x + 1 in x", "Unknown variable: x"),
    ("1/0", "Division by zero"),
    ("-32768 / -1", "Arithmetic overflow")
  ]
```

 ArithVMSpec.hs

Now, we can run the parser and interpreter tests to make sure that everything works correctly.

```
main :: IO ()
main = hspec $ do
  parserSpec
  astInterpreterSpec
```

 ArithVMSpec.hs <details> <summary> Output of the test run </summary>

```
$ cabal test -O2
Running 1 test suites...
Test suite specs: RUNNING...

Parser
  parses: "1 + 2 - 3 * 4 + 5 / 6 / 0 + 1" [✔]
  parses: "1+2-3*4+5/6/0+1" [✔]
  parses: "1 + -1" [✔]
  parses: "let x = 4 in x + 1" [✔]
  parses: "let x=4in x+1" [✔]
  parses: "let x = 4 in let y = 5 in x + y" [✔]
  parses: "let x = 4 in let y = 5 in x + let z = y in z * z" [✔]
  parses: "let x = 4 in (let y = 5 in x + 1) + let z = 2 in z * z" [✔]
  parses: "let x=4in 2+let y=x-5in x+let z=y+1in z/2" [✔]
  parses: "let x = (let y = 3 in y + y) in x * 3" [✔]
  parses: "let x = let y = 3 in y + y in x * 3" [✔]
  parses: "let x = let y = 1 + let z = 2 in z * z in y + 1 in x * 3" [✔]
  fails for: "" [✔]
  fails for: "1 +" [✔]
  fails for: "1 & 1" [✔]
  fails for: "1 + 1 & 1" [✔]
  fails for: "1 & 1 + 1" [✔]
  fails for: "(" [✔]
  fails for: "(1" [✔]
  fails for: "(1 + " [✔]
  fails for: "(1 + 2" [✔]
  fails for: "(1 + 2}" [✔]
  fails for: "66666" [✔]
  fails for: "-x" [✔]
  fails for: "let 1" [✔]
  fails for: "let x = 1 in " [✔]
  fails for: "let let = 1 in 1" [✔]
  fails for: "let x = 1 in in" [✔]
  fails for: "let x=1 inx" [✔]
  fails for: "letx = 1 in x" [✔]
  fails for: "let x ~ 1 in x" [✔]
  fails for: "let x = 1 & 2 in x" [✔]
  fails for: "let x = 1 inx" [✔]
  fails for: "let x = 1 in x +" [✔]
  fails for: "let x = 1 in x in" [✔]
  fails for: "let x = let x = 1 in x" [✔]
AST interpreter
  interprets: "1" [✔]
  interprets: "1 + 2 - 3 * 4 + 5 / 6 / 1 + 1" [✔]
  interprets: "1 + (2 - 3) * 4 + 5 / 6 / (1 + 1)" [✔]
  interprets: "1 + -1" [✔]
  interprets: "1 * -1" [✔]
  interprets: "let x = 4 in x + 1" [✔]
  interprets: "let x = 4 in let x = x + 1 in x + 2" [✔]
  interprets: "let x = 4 in let y = 5 in x + y" [✔]
  interprets: "let x = 4 in let y = 5 in x + let z = y in z * z" [✔]
  interprets: "let x = 4 in (let y = 5 in x + y) + let z = 2 in z * z" [✔]
  interprets: "let x = let y = 3 in y + y in x * 3" [✔]
  interprets: "let x = let y = 1 + let z = 2 in z * z in y + 1 in x * 3" [✔]
  fails for: "x" [✔]
  fails for: "let x = 4 in y + 1" [✔]
  fails for: "let x = y + 1 in x" [✔]
  fails for: "let x = x + 1 in x" [✔]
  fails for: "1/0" [✔]
  fails for: "-32768 / -1" [✔]

Finished in 0.0058 seconds
54 examples, 0 failures
Test suite specs: PASS
```

</details>

Awesome, it works! That’s it for this post. Let’s update our checklist:

* [Parsing arithmetic expressions to Abstract Syntax Trees (ASTs).](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed#parsing-expressions)
* [Unit testing for our parser.](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed#testing-the-parser)
* [Interpreting ASTs.](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed#the-ast-interpreter)
* Compiling ASTs to bytecode.
* Disassembling and decompiling bytecode.
* Unit testing for our compiler.
* Property-based testing for our compiler.
* Efficiently executing bytecode in a virtual machine (VM).
* Unit testing and property-based testing for our VM.
* Benchmarking our code to see how the different passes perform.
* All the while keeping an eye on performance.

In the [next part](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-compiler/?mtm_campaign=feed), we write a bytecode compiler for our expression AST.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. Variables are scoped to the body of the `let` expressions they are introduced in, that is, our language has [lexical scoping](https://en.wikipedia.org/wiki/lexical_scoping). Also, variables with same name in inner `let`s [shadow](https://en.wikipedia.org/wiki/Variable_shadowing) the variables in outer `let`s.[↩︎](#fnref1)

2. If you are wondering why do this at all, when we can directly run the expressions while parsing, I think this is a great little project to learn how to write performant bytecode compilers and VMs in Haskell.[↩︎](#fnref2)

3. Bangs (`!`) that enforce strictness are placed in the `Expr` ADT (and also in the later code) at the right positions that provide performance benefits. The right positions were found by profiling the program. A bang placed at a wrong position (for example in front of `Expr` inside `BinOp`) may ruin the compiler provided optimizations and make the overall program slower.[↩︎](#fnref3)

4. attoparsec is very fast, but there are [faster parsing libraries](https://gitlab.com/FinnBender/haskell-parsing-benchmarks/) in Haskell. On the other hand, attoparsec does not provided great error messages. If the user experience were a higher priority, I’d use the [megaparsec](https://hackage.haskell.org/package/megaparsec/) library. I find attoparsec to have the right balance of performance, developer experience and user experience. Handwritten parsers from scratch could be faster, but they’d be harder to maintain and use.[↩︎](#fnref4)

5. I wrote the first version of the parser using the [`ReadP`](https://hackage.haskell.org/package/base/docs/Text-ParserCombinators-ReadP.html) library that comes with Haskell standard library. I rewrote it to use attoparsec and found that the rewritten parser was more than 10x faster.[↩︎](#fnref5)

6. You don’t need to think about the bytecode size of expressions right now. It’ll become clear when we go over compilation in the next post.[↩︎](#fnref6)

7. Certain functions such as `chainBinOps` are inlined using the [`INLINE`](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/pragmas.html#inline-pragma) pragma to improve the program performance. The functions to inline were chosen by profiling.[↩︎](#fnref7)

8. Since the numbers need to be encoded into bytes when we compile to bytecode, we need to choose *some* encoding for them. For simpler code, we choose 2-byte integers.[↩︎](#fnref8)

9. Testing your parsers is crucial because that’s your programming languages’ interface to the users. Also because writing (fast) parsers is difficult and error-prone. Most of the bugs I found in this program were in the parser.[↩︎](#fnref9)

10. Again, notice the carefully placed bangs to enforce strictness. Try to figure out why they are placed at some places and not at others.[↩︎](#fnref10)

This post is a part of the series: **A Fast Bytecode VM for Arithmetic**.

1. **The Parser** 👈
2. [The Compiler](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-compiler/?mtm_campaign=feed)
3. [The Virtual Machine](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm/?mtm_campaign=feed)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/114959209511283377)
* [Lobsters](https://lobste.rs/s/rjfxop)
* [Reddit](https://www.reddit.com/r/haskell/comments/1mfpfyo/)
* [Discourse](https://discourse.haskell.org/t//12624)
* [Hacker News](https://news.ycombinator.com/item?id=44767097)
* [My website](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)