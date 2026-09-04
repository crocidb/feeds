+++
title = "JSON Parsing from Scratch in Haskell"
description = "JSON is probably the most used standard file format for storing and transmitting data on the Internet in recent times. Though it was historically derived from JavaScript, it is a programming languag"
date = "2020-05-04T00:00:00Z"
url = "https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.646306034Z"
seen = false
+++

[JSON](https://en.wikipedia.org/wiki/JSON) is probably the most used standard file format for storing and transmitting data on the Internet in recent times. Though it was historically derived from [JavaScript](https://en.wikipedia.org/wiki/JavaScript), it is a programming language independent format and is now supported by almost all languages. JSON has a simple syntax specification with only four scalar data types and two composite data types. So, writing a parser for JSON is a great exercise for learning the basics of parsing. Let’s write one from scratch in Haskell.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed).

This post is a part of the series: **JSON Parsing from Scratch in Haskell**.

1. **JSON Parsing from Scratch in Haskell** 👈
2. [Error Reporting—Part 1](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-2/?mtm_campaign=feed)
3. [Error Reporting—Part 2](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-3/?mtm_campaign=feed)

### Contents ###

1. [Introduction](#introduction)
2. [JSON Syntax](#json-syntax)
3. [Parsing](#parsing)
4. [Setup](#setup)
5. [JSON Data Type](#json-data-type)
6. [JSON Generators](#json-generators)
7. [Parser](#parser)
8. [Char Parser](#char-parser)
9. [Digit Parser](#digit-parser)
10. [String Parser](#string-parser)
11. [JNull and JBool Parsers](#jnull-and-jbool-parsers)
12. [JString Parser](#jstring-parser)
13. [JNumber Parser](#jnumber-parser)
14. [JArray Parser](#jarray-parser)
15. [JObject Parser](#jobject-parser)
16. [JSON Parser](#json-parser)
17. [Conclusion](#conclusion)

Introduction[#](#introduction)
----------

JSON (JavaScript Object Notation) grew out of JavaScript as a way to exchange data between browsers and servers. [Douglas Crockford](https://en.wikipedia.org/wiki/Douglas_Crockford), an American computer programmer and author of the popular book [*JavaScript: The Good Parts*](https://web.archive.org/web/20200504/https://www.amazon.com/dp/0596517742/wrrrldwideweb), wrote the first specification of the JSON format. After seeing wide adoption as a general data-exchange format, [IETF](https://en.wikipedia.org/wiki/IETF) standardized JSON as an [Internet Standard](https://en.wikipedia.org/wiki/Internet_Standard) with [RFC 7159](https://tools.ietf.org/html/rfc7159) and later with [RFC 8259](https://tools.ietf.org/html/rfc8259). Now JSON is the lingua franca of the [Web Service](https://en.wikipedia.org/wiki/Web_Service) world, both [RPC](https://en.wikipedia.org/wiki/Remote_procedure_call) and [REST](https://en.wikipedia.org/wiki/REST) varieties. It has also become a commonly used configuration file format and database storage format. With such broad uses, it is no wonder that almost all programming languages support JSON in some form or another. As of the time of writing this post, the [json.org](https://www.json.org/json-en.html) website lists 167 JSON libraries across 60 languages.

Since JSON came out of JavaScript—a [dynamically typed](https://en.wikipedia.org/wiki/Dynamic_typing), [prototype-based](https://en.wikipedia.org/wiki/Prototype-based_programming) [object-oriented](https://en.wikipedia.org/wiki/Object-oriented_programming) language with a [curly bracket](https://en.wikipedia.org/wiki/List_of_programming_languages_by_type#Curly-bracket_languages) syntax—it heavily borrows the data types and syntax from JavaScript. It has only four scalar data types:

1. Null: a [null](https://en.wikipedia.org/wiki/Nullable_type) value.
2. Boolean: a [boolean](https://en.wikipedia.org/wiki/Boolean_datatype) value.
3. String: a [string](https://en.wikipedia.org/wiki/String_(computer_science)) value, a sequence of zero or more [Unicode](https://en.wikipedia.org/wiki/Unicode) characters.
4. Number: a numeric value representing integral and real numbers with support for [scientific notation](https://en.wikipedia.org/wiki/scientific_notation).

Along with these four scalar data types, JSON supports only two composite data types:

1. Array: an ordered list of values.
2. Object: a collection of name-value pairs.

JSON Syntax[#](#json-syntax)
----------

Let’s see how these types are represented syntactically in JSON.

### Null and Boolean[#](#null-and-boolean) ###

The Null value is represented simply by the exact string `null`. Boolean data is either truthy or falsey, represented by the exact strings `true` and `false` respectively.

### String[#](#string) ###

A String in JSON is sequence of zero or more Unicode characters (except [Control characters](https://en.wikipedia.org/wiki/Control_characters)), wrapped in double quotes (`"`). Some special characters can be escaped using backslashes. Additionally, all characters can also be represented with their four hex-digit codes prefixed with `\u`. This transition diagram depicts the String syntax:

![JSON String syntax](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20417%20577'%3E%3C/svg%3E) \<img src="/images/json-parsing-from-scratch-in-haskell/string.svg" class="w-100pct mw-60pct nolink" alt="JSON String syntax"\>\</img\> JSON String syntax

### Number[#](#number) ###

A Number in JSON is represented as a combination of an integral part, a fractional part and an exponent. All these parts are optional but they must follow some rules. For example, these numbers are invalid in JSON:

012  integral part cannot start with 0 1.  fractional part cannot be empty .123  integral part cannot be empty 1.23e  exponent part cannot be empty

And these numbers are valid: 0, 1234, 1.23, 0.222, 1e5, 5E-45, 1.23e9, 1.77E-9.

![JSON Number syntax](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20385%20609'%3E%3C/svg%3E) \<img src="/images/json-parsing-from-scratch-in-haskell/number.svg" class="w-100pct mw-60pct nolink" alt="JSON Number syntax"\>\</img\> JSON Number syntax

### Whitespace[#](#whitespace) ###

In JSON, whitespace is a string of zero or more valid whitespace characters which are space ( ), newline (`\n`), return (`\r`) and tab (`\t`).

### Array[#](#array) ###

A JSON Array is an ordered list of zero or more JSON values separated by commas (`,`). An array begins with a left bracket (`[`) and ends with a right bracket (`]`) and may contain whitespace between them if empty.

![JSON Array syntax](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20401%20145'%3E%3C/svg%3E) \<img src="/images/json-parsing-from-scratch-in-haskell/array.svg" class="w-100pct mw-60pct nolink" alt="JSON Array syntax"\>\</img\> JSON Array syntax

### Object[#](#object) ###

A JSON Object is a collection of zero or more name-value pairs separated by commas (`,`). An object begins with a left brace (`{`) and ends with a right brace (`}`) and may contain whitespace between them if empty. Names and values are separated by colons (`:`) and are optionally surrounded by whitespace.

![JSON Object syntax](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20401%20241'%3E%3C/svg%3E) \<img src="/images/json-parsing-from-scratch-in-haskell/object.svg" class="w-100pct mw-60pct nolink" alt="JSON Object syntax"\>\</img\> JSON Object syntax

### Value[#](#value) ###

Finally, a JSON value is a string, or a number, or a boolean, or null, or an object, or an array, surrounded by optional whitespace. As you may have noticed, we referred to JSON values in the [Array](#array) and [Object](#object) sections above. Hence, the definition of the JSON syntax is recursive.

![JSON Value syntax](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20417%20337'%3E%3C/svg%3E) \<img src="/images/json-parsing-from-scratch-in-haskell/value.svg" class="w-100pct mw-60pct nolink" alt="JSON Value syntax"\>\</img\> JSON Value syntax

Parsing[#](#parsing)
----------

*Parsing*[<sup>1</sup>](#fn1) is the process of taking textual input data and converting it to a [data structure](https://en.wikipedia.org/wiki/data_structure)—often a hierarchal structure like a [parse tree](https://en.wikipedia.org/wiki/parse_tree)—while checking the input for correct syntax. Parsing is an important first step[<sup>2</sup>](#fn2) in compilers and interpreters for programming languages to check and convert source text files into internal representations which are used by later steps in the processes. However, parsing is also used for other purposes like converting data from one format to other, for [linting](https://en.wikipedia.org/wiki/linting), and for [pretty-printing](https://en.wikipedia.org/wiki/pretty-printing). Our use-case here is converting textual JSON data into Haskell’s internal data structures.

![Parse tree for JSON data {"a": 1, "b": [false, null]}](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20529%20305'%3E%3C/svg%3E) \<img src="/images/json-parsing-from-scratch-in-haskell/parse-tree.svg" class="w-100pct mw-80pct nolink" alt="Parse tree for JSON data {&quot;a&quot;: 1, &quot;b&quot;: [false, null]}"\>\</img\> Parse tree for JSON data `{"a": 1, "b": [false, null]}`

The syntax of a *[Language](https://en.wikipedia.org/wiki/Formal_language)* is defined by a set of rules. This set of rules is called the *[Grammar](https://en.wikipedia.org/wiki/Formal_grammar)* of the language. If an input does not adhere to a language’s grammar, it is considered incorrect. JSON’s grammar is a [*Deterministic context-free grammar*](https://en.wikipedia.org/wiki/Deterministic_context-free_grammar) which is a subset of [*Context-free grammar*](https://en.wikipedia.org/wiki/Context-free_grammar)[<sup>3</sup>](#fn3). Many programming languages, markup languages and data-definition languages can be described by context-free grammars[<sup>4</sup>](#fn4). Being deterministic, JSON grammar will never allow multiple parse trees for the same input.

Parsing is a widely studied field and as such, multiple parsing algorithms have been invented over time. These algorithms differ in the kind of grammars they can parse and their performances. In general, there are three broad categories of parsing algorithms for context-free grammars:

1. Universal parsing algorithms like [Earley’s algorithm](https://en.wikipedia.org/wiki/Earley_parser) which can parse any grammar. However, these algorithms are generally too slow to be used in real-world settings.
2. [Top-down parsing](https://en.wikipedia.org/wiki/Top-down_parsing) algorithms which start at the root level of parse tree and work down to leaf nodes.
3. [Bottom-up parsing](https://en.wikipedia.org/wiki/Bottom-up_parsing) algorithms which start at the leaf nodes of parse tree and work up to the root node.

Both top-down and bottom-up parsers are widely used. In this post, we will implement a [*Recursive descent parser*](https://en.wikipedia.org/wiki/Recursive_descent_parser) which is a top-down parser which executes a set of mutually recursive functions to process its input.

Lastly, there are different ways of writing parsers. We can write the entire parser by hand: read the input character-by-character and call different functions depending on the characters read, parsing the input. Or we can use a [Parser generator](https://en.wikipedia.org/wiki/Parser_generator) program to generate the code for a parser by providing the language’s grammar.

Alternatively, we can use a [*Parser combinator*](https://en.wikipedia.org/wiki/Parser_combinator) system. A parser combinator is a way of combining smaller parsers using higher-order functions to create larger parsers. Let’s say we start with a simple parser to parse one digit. We can then combining it with itself to create a parser to parse a natural number. In the same way, we can start with parsers for constituent parts of a language’s grammar and combine them by following the grammar to create a parser for the whole language. Haskell, with its support for higher-order functional programming, has many good parser combinator [libraries](https://hackage.haskell.org/packages/#cat:Parsing) but we are going to write one from scratch here[<sup>5</sup>](#fn5). Here we go!

Setup[#](#setup)
----------

We are going to write a simple but correct JSON parser from scratch in Haskell, as a Parser combinator. This parser will be for illustrative and learning/teaching purposes only and will not be for production usage[<sup>6</sup>](#fn6). As such, we will not care about error handling and reporting, performance or ease of use. Our purpose here is to learn about some basics of parsing, nuances of the JSON syntax, and parser combinators and property-based testing in Haskell. We will use the [RFC 8259](https://tools.ietf.org/html/rfc8259) document as the reference for the JSON language specification.

To test our parser for correctness, we will use the [QuickCheck](https://hackage.haskell.org/package/QuickCheck) library. QuickCheck is a *Property-based Testing* framework. The key idea of property-based testing is to write properties of our code that hold true for any input and then, to automatically generate arbitrary inputs and make sure that that the properties are indeed true for them[<sup>7</sup>](#fn7). Since we are writing a JSON parser—or rather, several of them for small parts of the JSON syntax—we will generate arbitrary textual data which are valid JSON and we will throw them at our parsers and assert that they work correctly. We will use GHCi, the interactive Haskell [REPL](https://en.wikipedia.org/wiki/REPL), to run the tests. Since we will be writing the parser from scratch, we will not use any libraries other than the [base](https://hackage.haskell.org/package/base) library.

Let’s start by writing the required imports:

```
{-# LANGUAGE DeriveGeneric, TupleSections, LambdaCase #-}
module JSONParser where

import Control.Applicative (Alternative(..), optional)
import Control.Monad (replicateM)
import Data.Bits (shiftL)
import Data.Char (isDigit, isHexDigit, isSpace, chr, ord, digitToInt)
import Data.Functor (($>))
import Data.List (intercalate)
import GHC.Generics (Generic)
import Numeric (showHex)
import Test.QuickCheck hiding (Positive, Negative)
```

JSON Data Type[#](#json-data-type)
----------

The data type for JSON in Haskell `JValue` directly reflects the JSON data types:

```
data JValue = JNull
            | JBool Bool
            | JString String
            | JNumber { int :: Integer, frac :: [Int], exponent :: Integer }
            | JArray [JValue]
            | JObject [(String, JValue)]
            deriving (Eq, Generic)
```

The JSON `null` type is represented by a singleton value type with the constructor `JNull` with no parameters. The JSON boolean type is just a wrapper constructor `JBool` over the Haskell `Bool` type. Similarly, the JSON string type is a wrapper over the Haskell `String` type. The JSON number type is represented as a collection of its integer, fraction and exponent parts. The integer and exponent parts are Haskell `Integer`s which are signed integers of unbounded size. Whereas the fraction part is a list of digits represented as Haskell `Int`s. A list of digits is needed here because the fraction part can have leading zeros.

The JSON array type is a wrapped Haskell list, with its elements being of any JSON data types. Likewise, the JSON object type is an [Association list](https://en.wikipedia.org/wiki/Association_list) of Haskell `String` and any JSON data type.

Let’s write a [`Show`](https://hackage.haskell.org/package/base/docs/Prelude.html#t:Show) instance for the JSON type so that we can easily inspect its values:

```
instance Show JValue where
  show value = case value of
    JNull          -> "null"
    JBool True     -> "true"
    JBool False    -> "false"
    JString s      -> showJSONString s
    JNumber s [] 0 -> show s
    JNumber s f 0  -> show s ++ "." ++ concatMap show f
    JNumber s [] e -> show s ++ "e" ++ show e
    JNumber s f e  -> show s ++ "." ++ concatMap show f ++ "e" ++ show e
    JArray a       -> "[" ++ intercalate ", " (map show a) ++ "]"
    JObject o      -> "{" ++ intercalate ", " (map showKV o) ++ "}"
    where
      showKV (k, v) = showJSONString k ++ ": " ++ show v

showJSONString :: String -> String
showJSONString s = "\"" ++ concatMap showJSONChar s ++ "\""

isControl :: Char -> Bool
isControl c = c `elem` ['\0' .. '\31']

showJSONChar :: Char -> String
showJSONChar c = case c of
  '\'' -> "'"
  '\"' -> "\\\""
  '\\' -> "\\\\"
  '/'  -> "\\/"
  '\b' -> "\\b"
  '\f' -> "\\f"
  '\n' -> "\\n"
  '\r' -> "\\r"
  '\t' -> "\\t"
  _ | isControl c -> "\\u" ++ showJSONNonASCIIChar c
  _ -> [c]
  where
    showJSONNonASCIIChar c =
      let a = "0000" ++ showHex (ord c) "" in drop (length a - 4) a
```

We want this `Show` instance to show the JSON values as they appear in JSON text data. We do this so that we can reuse this instance to convert JSON values to text, to test our parsers later. Most of the cases are straightforward. For numbers, we handle the empty fraction and zero exponent cases separately, omitting those in the text form. JSON strings however, require some special handing for possible escape sequences and control characters. Note that we do not use [`Data.Char.isControl`](https://hackage.haskell.org/package/base/docs/Data-Char.html#v:isControl) function here to detect the control characters, instead we write our own. This is because the JSON definition of control characters is different from the Haskell one. We show control characters as their four hex-digit representations prefixed by `\u`[<sup>8</sup>](#fn8). Also note that JSON strings are shown with surrounding double-quotes (`"`).

A quick test in GHCi confirms that it works fine:

```
> :{
> json =
>   JObject [("a", JNumber 1 [] 0), ("b", JArray [JBool False, JString "\20A"])]
> :}
> print json
{"a": 1, "b": [false, "\u0014A"]}
```

JSON Generators[#](#json-generators)
----------

As mentioned earlier, let’s write some QuickCheck generators to generate arbitrary JSON text data to use with property-based testing later. The plan is to generate arbitrary values of type `JValue` and convert them to text using the `Show` instance we wrote earlier. QuickCheck has the typeclass [`Arbitrary`](https://hackage.haskell.org/package/QuickCheck/docs/Test-QuickCheck.html#t:Arbitrary) for the types for which it can generate random values. We can implement this typeclass for the `JValue` type but the problem with that is, we can’t have different generators for JSON numbers and strings and other cases. So instead, we write functions to directly create generators for different JSON value types.

You may skip this section and jump to the [Parser](#parser) section if you wish. You can come back here and read it when we start implementing tests for our parsers.

### Scalar Generators[#](#scalar-generators) ###

The [`Gen`](https://hackage.haskell.org/package/QuickCheck/docs/Test-QuickCheck.html#t:Gen) monad lets us write generators by combining the built-in generators. We use the existing generators of `Bool`, `Integer` and list types in QuickCheck to write the generators for `JNull`, `JBool` and `JNumber` values.

```
jNullGen :: Gen JValue
jNullGen = pure JNull

jBoolGen :: Gen JValue
jBoolGen = JBool <$> arbitrary

jNumberGen :: Gen JValue
jNumberGen = JNumber <$> arbitrary <*> listOf (choose (0, 9)) <*> arbitrary
```

Here, the [`<$>`](https://hackage.haskell.org/package/base/docs/Data-Functor.html#v:-60--36--62-) operator is the infix symbolic form of the `fmap` function, and the [`<*>`](https://hackage.haskell.org/package/base/docs/Control-Applicative.html#v:-60--42--62-) operator is the applicative apply function.

The JSON string generator is bit more complicated because we need to generate strings with both unescaped and escaped characters.

```
jsonStringGen :: Gen String
jsonStringGen =
  concat <$> listOf (oneof [ vectorOf 1 arbitraryUnicodeChar
                           , escapedUnicodeChar ])
  where
    escapedUnicodeChar = ("\\u" ++) <$> vectorOf 4 (elements hexDigitLetters)
    hexDigitLetters    = ['0'..'9'] ++ ['a'..'f'] ++ ['A'..'F']

jStringGen :: Gen JValue
jStringGen = JString <$> jsonStringGen
```

Let’s test them with the [`generate`](https://hackage.haskell.org/package/QuickCheck/docs/Test-QuickCheck.html#v:generate) function from QuickCheck in GHCi:

```
> generate jNullGen
null
> generate jBoolGen
true
> generate jNumberGen
2.76e-2
> generate jStringGen
"\\uB6dC񄵤\\u365E\\u5085󓘅\\uCF54\\u47d8\\u17CA\\u10Fd𣲙򾈲񀓮\\uE62a𡅪"
```

Note that `jStringGen` may generate strings with any Unicode character so the generated string may not be renderable entirely on terminals or on browsers.

### Composite Generators[#](#composite-generators) ###

The generators for composite values—Arrays and Object—take an `Int` parameter to control the size of the generated values. They invoke `jValueGen` which we are yet to define, to generate the component values recursively.

```
jArrayGen :: Int -> Gen JValue
jArrayGen = fmap JArray . scale (`div` 2) . listOf . jValueGen . (`div` 2)

jObjectGen :: Int -> Gen JValue
jObjectGen = fmap JObject . scale (`div` 2) . listOf . objKV . (`div` 2)
  where
    objKV n = (,) <$> jsonStringGen <*> jValueGen n
```

``div` 2` used twice is to reduce the size of generated values which are otherwise too large and take a long time to generate. Trial in GHCi:

```
> generate $ jArrayGen 6
[true, "\\u8d78󑛲񷌚\\uC2C0򗪄󚉥򛪸", null, {}, null, ["󂵆񇯨\\uD28b", null, null, null], "\\uaC63\\u3Fec\\u55Fa򩜗\\uaB47\\uEea0\\u3BB5", false, null]
> generate $ jObjectGen 6
{"򑅄񛗹\\uB2c5\\uB6f4\\udee6󅪻\\u3E6F􄆘𨔂𛎺񐧤\\u6037𿦠񠇅": [[[true]]], "\\uf57b\\ua499\\uE936": null, "󐧊\\u9D5a򦯦񢥩󘌚": -7.3310625010e-10}
```

And finally, we have the generator for any `JValue`. It also takes a parameter to control the size. For small values of the parameter it tends towards generating more scalar values and does the opposite for larger values. It does so by calling the generators we defined earlier.

```
jValueGen :: Int -> Gen JValue
jValueGen n = if n < 5
  then frequency [(4, oneof scalarGens), (1, oneof (compositeGens n))]
  else frequency [(1, oneof scalarGens), (4, oneof (compositeGens n))]
  where
    scalarGens      = [jNullGen , jBoolGen , jNumberGen , jStringGen]
    compositeGens n = [jArrayGen n, jObjectGen n]
```

Quick trial again:

```
> generate $ jValueGen 2
9.99546402304186496400162205e-13
> generate $ jValueGen 6
{"񐠹񏜕\\u8F1D𸕓񘎝\\ua32E\\u8d8D𰜢񍁍𱽹\\u1b21񈝸񢕣": false, "\\u56dd\\uCEbb򭟖\\uED43": 13e3, "\\u0de3\\uFFB6颮򮈝\\ufb8A\\uFCBa\\u03fa": 5.546567497889e3, "\\u631e󠪳\\u9d95񲚫\\u2Bb8": {"񐈣\\u3a0B𧭯\\ue05E󈰚𱋫쀦": -5.397e-1, "\\u9BcD򧻳\\u3dbd": false, "": "\\uD65b"}, "\\u0BDb\\ufdEB򟝸\\u0749\\ucc92񅒹񾚗򫖳\\u9da3\\u9079\\uDCF1񌹒\\udcF3": null, "󴡥󌽉憝񮿣𴓒򼭚\\udB70\\u8E9a\\ud3a4": true, "\\ubF82\\uf8bD\\u29E0򂊏񳬿\\uC60A": "􏹮\\ub5D7\\u98Ea󊢠\\uec7E\\uB27A\\u6bb2\\uFc4C񊧥\\uB9cC򴠶򩱥\\uDEC9", "񥸍\\u2fde𛃀\\uF490\\uaC02": true}
```

We use `jValueGen` to write the `Arbitrary` instance for `JValue`:

```
instance Arbitrary JValue where
  arbitrary = sized jValueGen
  shrink    = genericShrink
```

The [`Generic`](https://hackage.haskell.org/package/base/docs/GHC-Generics.html#t:Generic) instance derivation for `JValue` lets us use the [`genericShrink`](https://hackage.haskell.org/package/QuickCheck/docs/Test-QuickCheck.html#v:genericShrink) function from QuickCheck to automatically shrink test input on test failure.

And finally, one last missing piece:

### Adding Whitespace[#](#adding-whitespace) ###

The JSON grammar allows whitespaces around many of its parts as depicted in the transition diagrams in the [JSON syntax](#json-syntax) section. But our current implementation of the `Show` instance for `JValue` does not add any extra whitespace around anything. This is because the `show` function is pure, and hence cannot generate arbitrary amount of whitespaces. But the `Gen` monad can! So let’s write a function to “stringify” `JValue` with arbitrary whitespace:

```
jsonWhitespaceGen :: Gen String
jsonWhitespaceGen =
  scale (round . sqrt . fromIntegral)
  . listOf
  . elements
  $ [' ' , '\n' , '\r' , '\t']

stringify :: JValue -> Gen String
stringify = pad . go
  where
    surround l r j = l ++ j ++ r
    pad gen = surround <$> jsonWhitespaceGen <*> jsonWhitespaceGen <*> gen
    commaSeparated = pad . pure . intercalate ","

    go value = case value of
      JArray elements ->
        mapM (pad . stringify) elements
          >>= fmap (surround "[" "]") . commaSeparated
      JObject kvs ->
        mapM stringifyKV kvs >>= fmap (surround "{" "}") . commaSeparated
      _           -> return $ show value

    stringifyKV (k, v) =
      surround <$> pad (pure $ showJSONString k) <*> stringify v <*> pure ":"
```

`jsonWhitespaceGen` is a generator for valid JSON whitespace only strings. We use it in the `stringify` function to traverse over the `JValue` structure and recursively show parts of it and pad them with arbitrary whitespace.

With everything in place now, we can generate arbitrary JSON text in GHCi:

```
> generate $ jValueGen 6 >>= stringify
"\t\n\t\t\r[\t \tnull \t\n\t\r, \r \rtrue,\r\t \n\r\t\"\22981\93569\34480\873701\689193\476209\\\\ubacc\\\\u794A\\\\u1C30\"\t  \n ,\r \n \t [ \n\n\n \t\t\n\t\ntrue\n\r\t\n\n\n\n,\t\r\t\r \r{\r\r\n \t \n\"\\\\u8a1F\\\\uCcDc\895076\"\r\r \r:\r\t\t\r\tfalse \n\t\r , \"\248461\"\r: \t\t\n {\r\n}  \t\r\t\t},\t \n \t\t\r\t{\"\"\t:\r  3e-3\t,\n\"\\\\u5F81\\\\uc031\"\t\n:\"\803844\"\t\t\t  ,\"\\\\u29b1\"\n:\r   null\t\r\t\r\t \t\t\t\t}\r\n  ,\n\t \rtrue\r\t  \t,\n   \t\t\r{\r\"\\\\u2fA6\759074\"\r\t\t:\t\n[\n \r\r\rnull]\n\t,\n\r\n\n \"\\\\uEee3\\\\u5Dab\61593\" : \n\tnull\n\n \t\r\n\r\r}\n \n \r\r\r,\r \r \n\"\951294\\\\u9dd3\\\\u0B39\"\t\n\t,\n\n \t\n  \nfalse\r\r\n\r\n \t \r]\n \n\t\r, \r\t \n\t \"\16324\\\\uf6DE\733261\\\\u8b38\\\\ueBa2\382636\474586\\\\uCDDc\\\\u49ee\\\\ua989\"\n ,\n\t\r\rnull \r\r\n\n\t ]\r\r"
```

You can go over the output and verify that it indeed is a valid JSON text data.

Parser[#](#parser)
----------

With the generators set up, let’s write the parsers now. So what exactly is a *Parser*? A parser takes some input, reads some part of it and maybe “parses” it into some relevant data structure. And it leaves the rest of the input to be potentially parsed later. That sounds like a function! Let’s write it down:

```
newtype Parser i o =
  Parser { runParser :: i -> Maybe (i, o) }
```

As per our definition, a parser is just a wrapper over the function type `i -> Maybe (i, o)`[<sup>9</sup>](#fn9). If a parser succeeds in parsing then it returns the rest of the input and the output it parsed the input to, else it returns nothing. This definition is simple but it will do for our purpose.

Let’s write our first parser to illustrate this type.

Char Parser[#](#char-parser)
----------

We are starting simple. We are going to write a parser to match the first character of the input with a given character.

```
char1 :: Char -> Parser String Char
char1 c = Parser $ \case
  (x:xs) | x == c -> Just (xs, x)
  _               -> Nothing
```

`char1` parser matches the given character with the input string and succeeds only if the input starts with the given character[<sup>10</sup>](#fn10). It returns the rest of the input and the matched character on success. Let’s exercise this on GHCi:

```
> runParser (char1 'a') "abhinav"
Just ("bhinav",'a')
> runParser (char1 'a') "sarkar"
Nothing
```

Great! We just wrote and ran our first parser. We can generalized this parser by extracting the predicate satisfaction clause out:

```
satisfy :: (a -> Bool) -> Parser [a] a
satisfy predicate = Parser $ \case
  (x:xs) | predicate x -> Just (xs, x)
  _                    -> Nothing

char :: Char -> Parser String Char
char c = satisfy (== c)
```

Digit Parser[#](#digit-parser)
----------

Moving on, let’s write a parser to parse a digit:

```
digit1 :: Parser String Int
digit1 = Parser $ \i -> case runParser (satisfy isDigit) i of
  Nothing      -> Nothing
  Just (i', o) -> Just (i', digitToInt o)
```

We simply use the `satisfy` parser with the [`isDigit`](https://hackage.haskell.org/package/base/docs/Data-Char.html#v:isDigit) function to parse a character which is a digit (0–9) and then run the [`digitToInt`](https://hackage.haskell.org/package/base/docs/Data-Char.html#v:digitToInt) function on the output character to convert it to an `Int`. Trial run:

```
> runParser digit1 "123"
Just ("23",1)
> runParser digit1 "abc"
Nothing
```

However, we can do some refactoring:

```
digit2 :: Parser String Int
digit2 = Parser $ \i -> case runParser (satisfy isDigit) i of
  Nothing      -> Nothing
  Just (i', o) -> Just . fmap digitToInt $ (i', o)

digit3 :: Parser String Int
digit3 = Parser $ \i -> fmap (fmap digitToInt) . runParser (satisfy isDigit) $ i
```

Hmm, it is staring to look like …

### `Parser` is a `Functor`[#](#parser-is-a-functor) ###

```
instance Functor (Parser i) where
  fmap f parser = Parser $ fmap (fmap f) . runParser parser
```

Now we can rewrite the digit parser as:

```
digit :: Parser String Int
digit = digitToInt <$> satisfy isDigit
```

String Parser[#](#string-parser)
----------

Let’s write a parser to parse out a given string from the input:

```
string1 :: String -> Parser String String
string1 s = case s of
  ""     -> Parser $ \i -> Just (i, "")
  (c:cs) -> Parser $ \i -> case runParser (char c) i of
    Nothing        -> Nothing
    Just (rest, _) -> case runParser (string1 cs) rest of
      Nothing         -> Nothing
      Just (rest', _) -> Just (rest', c:cs)
```

The `string1` parser is written recursively. As the base case, if the given string is empty, we simply return the input and an empty string as the result. Otherwise, we match the first character of the given string with the input by parsing it with the `char` parser. If it fails, the `string1` parser fails. Else, we recursively run the `string1` parser with the rest of the given string against the rest of the input. If the parsing succeeds, we cons the first parsed character with the rest of the parsed characters. Trying in GHCi:

```
> runParser (string1 "hello") "hello world"
Just (" world","hello")
> runParser (string1 "hello") "help world"
Nothing
```

Let’s refactor this a bit:

```
string2 :: String -> Parser String String
string2 s = case s of
  ""     -> Parser $ pure . (, "")
  (c:cs) -> Parser $ \i -> case runParser (char c) i of
    Nothing        -> Nothing
    Just (rest, c) -> fmap (c:) <$> runParser (string2 cs) rest
```

If you squint a little bit, what do you think that looks like? Yes, you are right …

### `Parser` is an `Applicative`[#](#parser-is-an-applicative) ###

```
instance Applicative (Parser i) where
  pure x    = Parser $ pure . (, x)
  pf <*> po = Parser $ \input -> case runParser pf input of
    Nothing        -> Nothing
    Just (rest, f) -> fmap f <$> runParser po rest
```

Take a minute to read and digest this. With the `Applicative` instance, we can now rewrite the `string1` parser as:

```
string :: String -> Parser String String
string ""     = pure ""
string (c:cs) = (:) <$> char c <*> string cs
```

The [`Functor`](https://hackage.haskell.org/package/base/docs/Prelude.html#t:Functor) and [`Applicative`](https://hackage.haskell.org/package/base/docs/Prelude.html#t:Applicative) instances for `Parser` make it really powerful. With the `Functor` instance, we can lift pure functions to do operations on parsers. With the `Applicative` instance, we can combine multiple parsers together with `Applicative` functions (like `<*>`) to create new parsers. Now we are ready to write our first JSON parsers.

JNull and JBool Parsers[#](#jnull-and-jbool-parsers)
----------

The parser for `JNull` is merely a `string` parser for the string `null`:

```
jNull :: Parser String JValue
jNull = string "null" $> JNull
```

We use the [`$>`](https://hackage.haskell.org/package/base/docs/Data-Functor.html#v:-36--62-) operator to discard the parsed string and return the `JNull` value.

The parser for JSON boolean values needs to parse for the string `true`, falling back on parsing for the string `false` if failed. This is called *[Backtracking](https://en.wikipedia.org/wiki/Backtracking)* in parsing parlance. To achieve this easily in Haskell, we have to make it so that …

### Parser is an `Alternative`[#](#parser-is-an-alternative) ###

```
instance Alternative (Parser i) where
  empty = Parser $ const empty
  p1 <|> p2 = Parser $ \input -> runParser p1 input <|> runParser p2 input
```

The [`Alternative`](https://hackage.haskell.org/package/base/docs/Control-Applicative.html#t:Alternative) typeclass does exactly what is sounds like. The `<|>` function lets you choose a different alternative if the first option fails, hence allowing backtracking. With this, we can write the `JBool` parser simply as:

```
jBool :: Parser String JValue
jBool =   string "true"  $> JBool True
      <|> string "false" $> JBool False
```

Over to GHCi:

```
> runParser jNull "null"
Just ("",null)
> runParser jNull "dull"
Nothing
> runParser jBool "true"
Just ("",true)
> runParser jBool "false"
Just ("",false)
> runParser jBool "truth"
Nothing
> runParser jBool "falsities"
Nothing
```

These two parsers were pretty simple. The next one is going to be a tad more complicated.

JString Parser[#](#jstring-parser)
----------

Before writing the JSON string parser, we need a parser to parse JSON characters.

As explained in the [String part](#string) of the JSON syntax section, the JSON spec allows characters in JSON strings to escaped with some special sequences or with a `\u` prefix and characters’ hex-digit codes. Also, JSON control characters cannot be written directly in JSON strings. So we write the JSON character parser as a combination of all these alternatives:

```
jsonChar :: Parser String Char
jsonChar =   string "\\\"" $> '"'
         <|> string "\\\\" $> '\\'
         <|> string "\\/"  $> '/'
         <|> string "\\b"  $> '\b'
         <|> string "\\f"  $> '\f'
         <|> string "\\n"  $> '\n'
         <|> string "\\r"  $> '\r'
         <|> string "\\t"  $> '\t'
         <|> unicodeChar
         <|> satisfy (\c -> not (c == '\"' || c == '\\' || isControl c))
  where
    unicodeChar =
      chr . fromIntegral . digitsToNumber 16 0
        <$> (string "\\u" *> replicateM 4 hexDigit)

    hexDigit = digitToInt <$> satisfy isHexDigit

digitsToNumber :: Int -> Integer -> [Int] -> Integer
digitsToNumber base =
  foldl (\num d -> num * fromIntegral base + fromIntegral d)
```

Note that the order of the alternative clauses is important here. The most eager clause is the last one.

The [`*>`](https://hackage.haskell.org/package/base/docs/Control-Applicative.html#v:-42--62-) function from the `Applicative` typeclass lets us run the parser on its left, discard the parsed value on success and run the parser on its right. `replicateM` runs the given parser `n` times, gathering the results in a list. The `digitsToNumber` function takes a list of digits as `Int`s and combines them to create a number with the given base. We use these functions to write the `unicodeChar` parser which parses the `\u` prefix character representations.

Now that we have the JSON character parser, it should be really easy to parse a JSON string, right? After all, a string is just a list of characters. Wrong! Quoting from the [String section](https://tools.ietf.org/html/rfc8259#section-7) of RFC 8259:

>
>
> To escape an extended character that is not in the Basic Multilingual Plane, the character is represented as a 12-character sequence, encoding the UTF-16 surrogate pair. So, for example, a string containing only the G clef character (U+1D11E) may be represented as `"\\uD834\\uDD1E"`.
>
>

Now it’s time for short detour to the Unicode Land.

### Unicode Planes and Surrogate Characters[#](#unicode-planes-and-surrogate-characters) ###

In the Unicode standard, a plane is a contiguous group of 2<sup>16</sup> [code points](https://en.wikipedia.org/wiki/code_point). The first of these planes which covers most of the commonly used characters is called the [Basic Multilingual Plane](https://en.wikipedia.org/wiki/Plane_(Unicode)#Basic_Multilingual_Plane) (BMP).

![The map of the Basic Multilingual Plane. From Wikipedia.](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20750%20500'%3E%3C/svg%3E) \<img src="/images/json-parsing-from-scratch-in-haskell/Roadmap\_to\_Unicode\_BMP.svg" class="nolink full-width" alt="The map of the Basic Multilingual Plane. From Wikipedia."\>\</img\> The map of the Basic Multilingual Plane. From [Wikipedia](https://en.wikipedia.org/wiki/File:Roadmap_to_Unicode_BMP.svg).

The characters which are not in the BMP can be encoded into it using the code points from the High Surrogate (U+D800–U+DBFF) and Low Surrogate (U+DC00–U+DFFF) blocks of the BMP. A pair of a High Surrogate and a Low Surrogate code points can be used to encode a non-BMP character. A lone surrogate code point cannot be a valid character. [G clef](https://en.wikipedia.org/wiki/Clef#G-clefs) 𝄞 residing in the [Plane 1](https://en.wikipedia.org/wiki/Plane_(Unicode)#Supplementary_Multilingual_Plane), is an example character with code point U+1D11E and surrogate representation (U+D834, U+DD1E).

So, to parse a JSON string, we need to work by character pairs and not just one character at a time. Our current abstractions of `Functor` and `Applicative` are not powerful enough for this because they work with only one element at a time. We need something more powerful. We need to learn that …

### Parser is a `Monad`[#](#parser-is-a-monad) ###

```
instance Monad (Parser i) where
  p >>= f = Parser $ \input -> case runParser p input of
    Nothing        -> Nothing
    Just (rest, o) -> runParser (f o) rest
```

The [`Monad`](https://hackage.haskell.org/package/base/docs/Prelude.html#t:Monad) typeclass lets us sequence operations in a context so that the second operation can depend on the result of the first operation. Let’s use it to write the JSON string parser:

```
jString :: Parser String JValue
jString = JString <$> (char '"' *> jString')                   -- 1
  where
    jString' = do
      optFirst <- optional jsonChar                            -- 2
      case optFirst of
        Nothing -> "" <$ char '"'                              -- 3
        Just first | not (isSurrogate first) ->                -- 4
          (first:) <$> jString'                                -- 5
        Just first -> do                                       -- 6
          second <- jsonChar                                   -- 7
          if isHighSurrogate first && isLowSurrogate second    -- 8
          then (combineSurrogates first second :) <$> jString' -- 9
          else empty                                           -- 10
```

This code is quite dense so let’s look at it line-by-line. Match the number cues in the code comments with the step numbers below:

1. Parse the starting double-quote (`"`) and run the rest of the string through the ancillary parser `jString'`. Also wrap the returned result with the `JString` constructor at the end.
2. Parse and get the optional first character using the [`optional`](https://hackage.haskell.org/package/base/docs/Control-Applicative.html#v:optional) function.
3. If there is no first character, the input is empty. Try to match the ending double-quote (`"`) and return an empty string as output[<sup>11</sup>](#fn11).
4. If there is a first character and it is not a surrogate then:
5. Run the `jString'` parser recursively on the rest of the input and return this character consed with the rest of the output just as it was done in the [String parser](#string-parser).
6. Else, that is, if the first character **is** a surrogate then:
7. Parse and get the second character. Note that this is not an optional operation like step 2 because there can be no lone surrogates.
8. If the first character is a High Surrogate and the second character is a Low Surrogate, that is, if we have a valid surrogate pair:
9. Combine the two surrogates, parse the rest of the string with the `jString'` parser recursively, cons the combined character with the rest of the output and return it.
10. Else fail because the surrogate pair is invalid.

In summary, we read two characters from the input instead of one and see if we can find a valid surrogate pair.

The helper functions are:

```
highSurrogateLowerBound, highSurrogateUpperBound :: Int
highSurrogateLowerBound = 0xD800
highSurrogateUpperBound = 0xDBFF

lowSurrogateLowerBound, lowSurrogateUpperBound :: Int
lowSurrogateLowerBound  = 0xDC00
lowSurrogateUpperBound  = 0xDFFF

isHighSurrogate, isLowSurrogate, isSurrogate :: Char -> Bool
isHighSurrogate a =
  ord a >= highSurrogateLowerBound && ord a <= highSurrogateUpperBound
isLowSurrogate a  =
  ord a >= lowSurrogateLowerBound && ord a <= lowSurrogateUpperBound
isSurrogate a     = isHighSurrogate a || isLowSurrogate a

combineSurrogates :: Char -> Char -> Char
combineSurrogates a b = chr $
  ((ord a - highSurrogateLowerBound) `shiftL` 10)
  + (ord b - lowSurrogateLowerBound) + 0x10000
```

The `do` syntax is a syntactic-sugar on top of the monadic bind operation `>>=` which allows us to sequence monadic operations. That’s how we are able to read the first character and choose to do different things depending on whether it is a surrogate or not[<sup>12</sup>](#fn12). This cannot be done without the `Monad` instance of `Parser`.

Let’s give `jString` a try in GHCi:

```
> runParser jString "\"abhinav\""
Just ("","abhinav")
> runParser jString "\"\\u1234\""
Just ("","ሴ")
> runParser jString "\"\\uD834\\uDD1E\""
Just ("","𝄞")
> runParser jString "\"\\uD834\"" -- lone surrogate is invalid
Nothing
> runParser jString "\"\\uD834\\uE000\"" -- \uEOOO is not a surrogate
Nothing
```

It seems to work but we can’t be sure yet. Let’s write our first QuickCheck property to test it throughly:

```
prop_genParseJString :: Property
prop_genParseJString =
  forAllShrink jStringGen shrink $ \js ->
    case runParser jString (show js) of
      Nothing     -> False
      Just (_, o) -> o == js
```

We use the JSON string generator `jStringGen` which we wrote in the [Scalar Generators](#scalar-generators) section to generate arbitrary JSON strings. Then we parse them using the `jString` parser and equate the parsed result with the generated value for confirming that the parser works. The [`forAllShrink`](https://hackage.haskell.org/package/QuickCheck/docs/Test-QuickCheck.html#v:forAllShrink) function from QuickCheck takes care of input generation and input shrinking in case of failures, automatically. We test this property in GHCi using the [`quickCheck`](https://hackage.haskell.org/package/QuickCheck/docs/Test-QuickCheck.html#v:quickCheck) function:

```
> quickCheck prop_genParseJString
+++ OK, passed 100 tests.
```

Brilliant! That was a complicated parser to write. Let’s move on to parsing numbers.

JNumber Parser[#](#jnumber-parser)
----------

Numbers in JSON can be in different formats. They can be an integer, or a real number with a integral and fractional part, or in scientific notation with or without a fractional part. We will write separate parsers for each of these formats and then combine them to create the number parser. We start with the integer parser:

```
jUInt :: Parser String Integer
jUInt =   (\d ds -> digitsToNumber 10 0 (d:ds)) <$> digit19 <*> digits
      <|> fromIntegral <$> digit

digit19 :: Parser String Int
digit19 = digitToInt <$> satisfy (\x -> isDigit x && x /= '0')

digits :: Parser String [Int]
digits = some digit

jInt' :: Parser String Integer
jInt' = signInt <$> optional (char '-') <*> jUInt

signInt :: Maybe Char -> Integer -> Integer
signInt (Just '-') i = negate i
signInt _          i = i
```

`jUInt` is a parser for unsigned integers. Integers in JSON cannot start with leading zeros. So if there are multiple digits, `jUInt` makes sure that the first digit is 1–9. Alternatively, there can be one digit in range 0–9. `digitsToNumber` is used to combine parsed digits into an `Integer`. `jInt'` add support for an optional `-` sign over `jUInt`.

We use the [`some`](https://hackage.haskell.org/package/base/docs/Control-Applicative.html#v:some) function here for writing the `digits` function. `some` runs the given parser one or more times and returns gathering the results in a list.

Parsers for the fractional and exponent parts are simple:

```
jFrac :: Parser String [Int]
jFrac = char '.' *> digits

jExp :: Parser String Integer
jExp = (char 'e' <|> char 'E')
  *> (signInt <$> optional (char '+' <|> char '-') <*> jUInt)
```

Now we can combine these parsers to create a parser for various number formats:

```
jInt :: Parser String JValue
jInt = JNumber <$> jInt' <*> pure [] <*> pure 0

jIntExp :: Parser String JValue
jIntExp = JNumber <$> jInt' <*> pure [] <*> jExp

jIntFrac :: Parser String JValue
jIntFrac = (\i f -> JNumber i f 0) <$> jInt' <*> jFrac

jIntFracExp :: Parser String JValue
jIntFracExp = (\ ~(JNumber i f _) e -> JNumber i f e) <$> jIntFrac <*> jExp
```

And finally, the `jNumber` parser is a combination of all the format parser alternatives, ordered from most eager to least eager:

```
jNumber :: Parser String JValue
jNumber = jIntFracExp <|> jIntExp <|> jIntFrac <|> jInt
```

We can verify it in GHCi:

```
> runParser jNumber "01"
Just ("1",0)
> runParser jNumber "4"
Just ("",4)
> runParser jNumber "44"
Just ("",44)
> runParser jNumber "44.0"
Just ("",44.0)
> runParser jNumber "44.45"
Just ("",44.45)
> runParser jNumber "0.444"
Just ("",0.444)
> runParser jNumber "44E4"
Just ("",44e4)
> runParser jNumber "44.3e-7"
Just ("",44.3e-7)
> runParser jNumber "0.35e+34"
Just ("",0.35e34)
```

Nice. But to be sure, let’s write a QuickCheck property for `jNumber`:

```
prop_genParseJNumber :: Property
prop_genParseJNumber =
  forAllShrink jNumberGen shrink $ \jn ->
    case runParser jNumber (show jn) of
      Nothing     -> False
      Just (_, o) -> o == jn
```

And run it:

```
> quickCheck prop_genParseJNumber
+++ OK, passed 100 tests.
```

That concludes the parsers for the scalar JSON types.

JArray Parser[#](#jarray-parser)
----------

A JSON array can contain zero or more items of any JSON types separated by commas (`,`). So it’s natural that the array parser will be recursive in nature. Arrays can also contain any amount of JSON whitespace around the items. First we write some helper functions to ease our parser implementation:

```
surroundedBy ::
  Parser String a -> Parser String b -> Parser String a
surroundedBy p1 p2 = p2 *> p1 <* p2

separatedBy :: Parser i v -> Parser i s -> Parser i [v]
separatedBy v s =   (:) <$> v <*> many (s *> v)
                <|> pure []

spaces :: Parser String String
spaces = many (char ' ' <|> char '\n' <|> char '\r' <|> char '\t')
```

We are using the previously introduced operators `<$>` from the `Functor` typeclass, `*>`, `<*>` and `<*` from the `Applicative` typeclass, and `<|>` from the `Alternative` typeclass. The function [`many`](https://hackage.haskell.org/package/base/docs/Control-Applicative.html#v:many) is like `some` except it runs the given parser zero or more times. Let’s see these in action:

```
jArray :: Parser String JValue
jArray = JArray <$>
  (char '['
   *> (jValue `separatedBy` char ',' `surroundedBy` spaces)
   <* char ']')
```

It’s amazing how this definition almost reads like the spec for JSON array itself. We use the yet undefined `jValue` parser here to recursively parse any JSON value. Let’s try this out:

```
> :{
> runParser jArray
>   "[1,      \"hello\", \n3.5,  null, [false,true]]"
> :}
Just ("",[1, "hello", 3.5, null, [false, true]])
> runParser jArray "[  [   [  true   ] ]    ]"
Just ("",[[[true]]])
> runParser jArray "[123"
Nothing
```

Let’s write the QuickCheck property for testing the parser:

```
prop_genParseJArray :: Property
prop_genParseJArray =
  forAllShrink (sized jArrayGen) shrink $ \ja -> do
    jas <- dropWhile isSpace <$> stringify ja
    return . counterexample (show jas) $ case runParser jArray jas of
      Nothing     -> False
      Just (_, o) -> o == ja
```

We generate arbitrary JSON arrays using the `sized jArrayGen` generator, we `stringify` the arrays and parse the text data to equate them with the original generated arrays. Since the `jArray` parser does not deal with leading whitespace, we need to discard it before parsing the text. [`sized`](https://hackage.haskell.org/package/QuickCheck/docs/Test-QuickCheck.html#v:sized) lets QuickCheck control the size of generated values. We also add additional info to the QuickCheck error reports using the [`counterexample`](https://hackage.haskell.org/package/QuickCheck/docs/Test-QuickCheck.html#v:counterexample) function.

Running the test[<sup>13</sup>](#fn13):

```
> quickCheck prop_genParseJArray
+++ OK, passed 100 tests.
```

JObject Parser[#](#jobject-parser)
----------

On to the final piece, the JSON object parser almost writes itself after all we have learned till now:

```
jObject :: Parser String JValue
jObject = JObject <$>
  (char '{' *> pair `separatedBy` char ',' `surroundedBy` spaces <* char '}')
  where
    pair = (\ ~(JString s) j -> (s, j))
      <$> (jString `surroundedBy` spaces)
      <*  char ':'
      <*> jValue
```

The property for testing is quite similar to that of the `jArray` parser:

```
prop_genParseJObject :: Property
prop_genParseJObject =
  forAllShrink (sized jObjectGen) shrink $ \jo -> do
    jos <- dropWhile isSpace <$> stringify jo
    return . counterexample (show jos) $ case runParser jObject jos of
      Nothing     -> False
      Just (_, o) -> o == jo
```

And the test:

```
> quickCheck prop_genParseJObject
+++ OK, passed 100 tests.
```

JSON Parser[#](#json-parser)
----------

Finally, it’s time to put all the puzzle pieces together to write **the** JSON parser:

```
jValue :: Parser String JValue
jValue = jValue' `surroundedBy` spaces
  where
    jValue' =   jNull
            <|> jBool
            <|> jString
            <|> jNumber
            <|> jArray
            <|> jObject
```

That was easier than expected[<sup>14</sup>](#fn14)! Now we can write the `parseJSON` function to … parse JSON:

```
parseJSON :: String -> Maybe JValue
parseJSON s = case runParser jValue s of
  Just ("", j) -> Just j
  _            -> Nothing
```

And now we write the final property which just straight-up generates arbitrary JSON values, `stringify`s them and matches the parsed values with the original generated values:

```
prop_genParseJSON :: Property
prop_genParseJSON = forAllShrink (sized jValueGen) shrink $ \value -> do
  json <- stringify value
  return . counterexample (show json) . (== Just value) . parseJSON $ json
```

Let’s skip testing this property and instead write a test to test all of them:

```
runTests :: IO ()
runTests = do
  putStrLn "== prop_genParseJString =="
  quickCheck prop_genParseJString

  putStrLn "== prop_genParseJNumber =="
  quickCheck prop_genParseJNumber

  putStrLn "== prop_genParseJArray =="
  quickCheck prop_genParseJArray

  putStrLn "== prop_genParseJObject =="
  quickCheck prop_genParseJObject

  putStrLn "== prop_genParseJSON =="
  quickCheck prop_genParseJSON
```

As the tradition goes, let’s do a final run for all the tests[<sup>15</sup>](#fn15):

```
> runTests
== prop_genParseJString ==
+++ OK, passed 100 tests.
== prop_genParseJNumber ==
+++ OK, passed 100 tests.
== prop_genParseJArray ==
+++ OK, passed 100 tests.
== prop_genParseJObject ==
+++ OK, passed 100 tests.
== prop_genParseJSON ==
+++ OK, passed 100 tests.
```

Hurray! We have written a simple but correct JSON parser from scratch.

Conclusion[#](#conclusion)
----------

In the short span of thirty minutes, we have learned how to write a JSON parser from scratch in Haskell. We have also learned some basics of parsing and a great deal of details about the JSON syntax. We also gained some understanding of how to write Property-based tests with QuickCheck. I hope all these things will be useful to you. The full code for the JSON parser can be seen [here](https://abhinavsarkar.net/code/jsonparser.html?mtm_campaign=feed).

Acknowledgements[#](#acknowledgements)
----------

Many thanks to [Ankur Sethi](https://ankursethi.com/) and [Nirbheek Chauhan](https://nirbheek.in/) for helping me understand the intricacies of Unicode, and to [Steven Deobald](https://deobald.ca/) for reviewing a draft of this article.

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. **parse**: verb [with object]

   resolve (a sentence) into its component parts and describe their syntactic roles

   Origin: mid 16th century: perhaps from Middle English pars ‘parts of speech’, from Old French pars ‘parts’ (influenced by Latin pars ‘part’).[↩︎](#fnref1)

2. Parsing is often preceded by a *Lexing* step which converts raw text input into a sequence of tokens which may be annotated with some extra syntactic information. Alternatively, Lexing can be skipped as a separate step and combined with the Parsing step.[↩︎](#fnref2)

3. Context-free grammars are a part of the [Chomsky hierarchy](https://en.wikipedia.org/wiki/Chomsky_hierarchy) of formal grammars.[↩︎](#fnref3)

4. [C++](https://en.wikipedia.org/wiki/C++) famously has a non-context-free grammar, aka a [Context-sensitive grammar](https://en.wikipedia.org/wiki/Context-sensitive_grammar).[↩︎](#fnref4)

5. For comparison, [here](https://github.com/antlr/grammars-v4/blob/master/json/JSON.g4) is the grammar of JSON to be used by the popular parser generator framework [ANTLR](https://www.antlr.org/). And [this post](https://wesleytsai.io/2015/06/13/a-json-parser/) shows how to implement a JSON parser by hand in Javascript.[↩︎](#fnref5)

6. For real production usage, I recommend using the [Aeson](https://hackage.haskell.org/package/aeson) library.[↩︎](#fnref6)

7. Actually, QuickCheck does not generate entirely arbitrary inputs. It generates arbitrary inputs with increasing complexity—where the complexity is defined by the user—and asserts the properties on these inputs. When a test fails for a particular input, QuickCheck also tries to simplify the culprit input and tries to find the simplest input for which the test fails. This process is called *Shrinking* in QuickCheck parlance. QuickCheck then shows this simplest input to the user for them to use it to debug their code.[↩︎](#fnref7)

8. If you are confused by so many backslashes (`\`) in the `showJSONChar` function, they are there because to write a backslash in Haskell code or in JSON text data, you need to escape it with … another backslash.[↩︎](#fnref8)

9. Real-world parsers are of course more complicated than our definition. They need to report proper error messages and often need to be stateful. For example, the parser type in the popular [Attoparsec](https://hackage.haskell.org/package/attoparsec) parser library looks like this:

   ```
   newtype Parser i o = Parser {
     runParser :: forall r.
          State i
       -> Pos
       -> More
       -> Failure i (State i)   r
       -> Success i (State i) o r
       -> IResult i r
   }
   ```

   [↩︎](#fnref9)
10. In case you are confused by the dangling `\case`, we are using the [LambdaCase](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/lambda_case.html#extension-LambdaCase) GHC extension here.[↩︎](#fnref10)

11. As you may have guessed, [`<$`](https://hackage.haskell.org/package/base/docs/Data-Functor.html#v:-60--36-) is a flipped version of `$>`. It discards the parser result on left and returns the value on right.[↩︎](#fnref11)

12. Essentially, what the `Monad` abstraction gives our parsers is [*Lookahead*](https://en.wikipedia.org/wiki/Parsing#Lookahead), the capability to “look ahead” in the input and make decisions accordingly. With the lookahead capability, we can write a *Predictive parser*, which is a Recursive decent parser without the need to do backtracking. Predictive parsing is faster than backtracking because we don’t need to go over the input multiple times. With the lookahead of one character, we can write an alternative version of the `jBool` parser like this:

   ```
   lookahead :: Parser String Char
   lookahead = Parser $ \case
     i@(x:_) -> Just (i, x)
     _       -> Nothing

   jBoolAlt :: Parser String JValue
   jBoolAlt = do
     c <- lookahead
     JBool <$> case c of
       't' -> string "true"  $> True
       'f' -> string "false" $> False
       _   -> empty
   ```

   [↩︎](#fnref12)
13. You can also run the tests with the [`verboseCheck`](https://hackage.haskell.org/package/QuickCheck/docs/Test-QuickCheck.html#v:verboseCheck) function to see all the values being generated by QuickCheck.[↩︎](#fnref13)

14. Alternatively, we can write a predictive parser for JSON:

   ```
   jValueAlt ::
     Parser String JValue
   jValueAlt =
     jValue' `surroundedBy` spaces
     where
       jValue' = do
         c <- lookahead
         case c of
           'n'  -> jNull
           't'  -> jBool
           'f'  -> jBool
           '\"' -> jString
           '['  -> jArray
           '{'  -> jObject
           _    -> jNumber
   ```

   [↩︎](#fnref14)
15. Our astute readers may have noticed that all the QuickCheck properties we wrote are for *Positive Tests*, that is, we only generate valid JSON text to test our parsers. They do not guarantee that the parsers fail for invalid inputs. Since the point of this post is not to learn testing in details, I’ll leave the [*Negative Testing*](https://en.wikipedia.org/wiki/Negative_Testing) as an exercise for the readers. However, I’ve ascertained the correctness of this JSON parser by running it against [this test suite](https://github.com/nst/JSONTestSuite) written by the author of the famous [Parsing JSON is a Minefield](http://seriot.ch/parsing_json.php) article.[↩︎](#fnref15)

This post is a part of the series: **JSON Parsing from Scratch in Haskell**.

1. **JSON Parsing from Scratch in Haskell** 👈
2. [Error Reporting—Part 1](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-2/?mtm_campaign=feed)
3. [Error Reporting—Part 2](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-3/?mtm_campaign=feed)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/112542142040173291)
* [Lobsters](https://lobste.rs/s/jt5nrm)
* [Reddit](https://www.reddit.com/r/haskell/comments/1d5cuoi/)
* [Discourse](https://discourse.haskell.org/t//9661)
* [My website](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)