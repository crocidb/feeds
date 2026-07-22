+++
title = "JSON Parsing from Scratch in Haskell: Error Reporting—Part 2"
description = "In the previous post, we set out to rewrite the JSON parser we wrote in Haskell in an earlier post, to add support for error reporti"
date = "2020-09-30T00:00:00Z"
url = "https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-3/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.630808915Z"
seen = false
+++

In the [previous post](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-2/?mtm_campaign=feed), we set out to rewrite the JSON parser we wrote in Haskell in an [earlier post](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed), to add support for error reporting. The parser was written very naively: if it failed, it returned nothing. You couldn’t tell what the failure was or where it happened. That’s OK for a toy parser but error reporting is an absolute must requirement for all good parsers. In the previous post, we finished writing the basic framework for the same. In this post, we’ll finish adding simple but useful error reporting capability to our JSON parser.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-3/?mtm_campaign=feed).

This post is a part of the series: **JSON Parsing from Scratch in Haskell**.

1. [JSON Parsing from Scratch in Haskell](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed)
2. [Error Reporting—Part 1](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-2/?mtm_campaign=feed)
3. **Error Reporting—Part 2** 👈

### Contents ###

1. [Setup](#setup)
2. [JNull and JBool Parsers](#jnull-and-jbool-parsers)
3. [JString Parser](#jstring-parser)
4. [JNumber Parser](#jnumber-parser)
5. [JArray Parser](#jarray-parser)
6. [JObject Parser](#jobject-parser)
7. [JValue Parser](#jvalue-parser)
8. [Conclusion](#conclusion)

Setup[#](#setup)
----------

In the [previous post](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-2/?mtm_campaign=feed), we implemented a new parser using [*Zippers*](https://web.archive.org/web/20200930/http://learnyouahaskell.com/zippers) which supported error reporting with multiline contextual error messages with the position of the errors. We also wrote some basic parsers using this new parser. Here’s a quick recap of the code:

The `JValue` data type:

```
data JValue = JNull
            | JBool Bool
            | JString String
            | JNumber { int :: Integer, frac :: [Int], exponent :: Integer }
            | JArray [JValue]
            | JObject [(String, JValue)]
            deriving (Eq, Generic)
```

The `ParseResult` data type:

```
data ParseResult a = Error [String] | Result a
```

The new `TextZipper` based parser:

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

The helper functions to create and throw parse errors:

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

And finally, the basic parsers written using the new parser:

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

Now, we are going to rewrite all the elemental JSON parsers from the [first post](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed) and put them together to create the final JSON parser. We start with the simplest of them.

JNull and JBool Parsers[#](#jnull-and-jbool-parsers)
----------

The `jNull` and `jBool` parsers stay the same as seen before.

```
jNull :: Parser String JValue
jNull = string "null" $> JNull

jBool :: Parser String JValue
jBool = do
  c <- lookahead
  JBool <$> case c of
    't' -> string "true"  $> True
    'f' -> string "false" $> False
    _   -> throw $
      errorMsgForChar "Expected: 't' for true or 'f' for false; got '%v'" c

errorMsgForChar :: String -> Char -> String
errorMsgForChar err c = printf err $ showCharForErrorMsg c
```

JString Parser[#](#jstring-parser)
----------

JSON strings have a [complex syntax](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed#string) and the parser for them is going to be the most complex one. First, we write the `jsonChar` parser to parse a JSON character:

```
jsonChar :: Parser String (Char, Int)
jsonChar = lookahead >>= \case
  '\\' -> char '\\' *> escapedChar
  _    -> (,1) <$> otherChar
  where
    escapedChar = lookahead >>= \case
      '"'  -> ('"',  2) <$ char '"'
      '\\' -> ('\\', 2) <$ char '\\'
      '/'  -> ( '/', 2) <$ char  '/'
      'b'  -> ('\b', 2) <$ char 'b'
      'f'  -> ('\f', 2) <$ char 'f'
      'n'  -> ('\n', 2) <$ char 'n'
      'r'  -> ('\r', 2) <$ char 'r'
      't'  -> ('\t', 2) <$ char 't'
      'u'  -> (,6) <$> (char 'u' *> unicodeChar)
      c    -> throw $ errorMsgForChar "Invalid escaped character: '%v'" c

    unicodeChar =
      chr . fromIntegral . digitsToNumber 16 0 <$> replicateM 4 hexDigit

    hexDigit = digitToInt <$>
      satisfy isHexDigit "Expected a hex digit"

    otherChar = satisfy (not . isQuoteEscapeOrControl)
      "Did not except '\"', '\\' or control characters"

    isQuoteEscapeOrControl c = c == '\"' || c == '\\' || isControl c

digitsToNumber :: Int -> Integer -> [Int] -> Integer
digitsToNumber base =
  foldl (\num digit -> num * fromIntegral base + fromIntegral digit)
```

We do two lookaheads in `jsonChar`[<sup>1</sup>](#fn1). The first is for checking if the first character is backslash (`\`). If so, we consume it and parse the rest of the input for a JSON escaped character. Otherwise, we parse the input for a non escaped and non-control character.

When parsing for escaped characters, we do another lookahead and based on it, we consume one of the known escaped characters. Or if the lookahead gives `u`, we parse the rest of the input for a unicode character represented with four hex digits.

`jsonChar` also returns the number of characters consumed from the input for the purpose that’ll become clear when we go over the `jString` parser. We also make sure to throw appropriate errors when parsing fails. Let’s check out `jsonChar` in GHCi:

```
> runParser jsonChar "a"
("",('a',1))
> runParser jsonChar "\\b"
("",('\b',2))
> runParser jsonChar "\\u0040"
("",('@',6))
> runParser jsonChar "\\g"
Invalid escaped character: 'g' at line 1, column 2: \g
                                                     ↑
> runParser jsonChar "\\u0x40"
Expected a hex digit, got 'x' at line 1, column 4: \u0x40
                                                      ↑
> runParser jsonChar "\0"
Did not except '"', '\' or control characters, got '\0' at line 1, column 1: \0
                                                                             ↑
```

Both positive and negative tests work fine and the error messages are correct too. Let’s move on to writing the JSON string parser.

```
jString :: Parser String JValue
jString = JString <$> (char '"' *> jString')
```

The `jString` parser simply consumes the leading double quote character of a JSON string and invokes the ancillary parser `jString'` that does the rest of the parsing.

```
jString' :: Parser String String
jString' = do
  c <- lookahead `elseThrow` "Expected rest of a string"
  if c == '"'
  then "" <$ char '"'
  else jFirstChar
```

The `jString'` parser first does a lookahead, failing which it throws an error. If the lookahead returns the double quote character, then it consumes the character and returns an empty string. Otherwise, it calls the `jFirstChar` parser to parse the first JSON character.

```
jFirstChar :: Parser String String
jFirstChar = do
  (first, count) <- jsonChar
  if | not (isSurrogate first) -> (first:) <$> jString'
     | isHighSurrogate first   -> jSecondChar first
     | otherwise               -> do
         pushback count
         throw
           . errorMsgForChar "Expected a high surrogate character, got '%v'"
           $ first

pushback :: Int -> Parser String ()
pushback count = Parser $ \input ->
  Result (iterate moveBackByOne input !! count, ())
```

`jFirstChar` calls the `jsonChar` parser to get the first JSON character and the count of the characters consumed from the input. If the first JSON character is not a unicode surrogate character then it just calls `jString'` to parse the rest of the string and returns the first character consed with it[<sup>2</sup>](#fn2).

If the first character is a high surrogate character then it calls `jSecondChar` to parse the rest of the string. Else, the first character is a low surrogate character, which is an error case as Unicode surrogate pairs must start with a high surrogate character[<sup>3</sup>](#fn3). We can throw an error to report the same but there is a catch here. Since we have already consumed the first JSON character from the input, throwing an error at this point will report the wrong position. To fix this, we need to move back in the input by the number of characters consumed by the first JSON character. For this purpose, we call a special parser `pushback` which rewinds the cursor in the input text zipper by calling `moveBackByOne` the right number of times. After invoking the `pushback` parser, we throw the error.

```
jSecondChar :: Char -> Parser String String
jSecondChar first = do
  (second, count) <- jsonChar `elseThrow`
    "Expected a second character of a surrogate pair"
  if isLowSurrogate second
  then (combineSurrogates first second :) <$> jString'
  else do
    pushback count
    throw
      . errorMsgForChar "Expected a low surrogate character, got '%v'"
      $ second
```

The `jSecondChar` parser is similar to the `jFirstChar` parser. If it finds a low surrogate JSON character then it combines the high and the low surrogate characters and calls `jString'` to parse the rest of the string. Else it pushes back the input by the correct number of characters and throw an error[<sup>4</sup>](#fn4).

That completes our most complex parser. Let’s test it out in GHCi:

```
> runParser jString "\"abc\""
("","abc")
> runParser jString "\"abc"
Empty input at line 1, column 5: "abc
                                     ↑
→ Expected rest of a string at line 1, column 5: "abc
                                                     ↑
> runParser jString "\"\\uD834\\uDD1E\""
("","𝄞")
> runParser jString "\"\\uD834\""
Did not except '"', '\' or control characters, got '"' at line 1, column 8: \uD834"
                                                                                  ↑
→ Expected a second character of a surrogate pair at line 1, column 8: \uD834"
                                                                             ↑
> runParser jString "\"\\uD834\\u0040\""
Expected a low surrogate character, got '@' at line 1, column 8: \uD834\u0040
                                                                       ↑
> runParser jString "\"\\uDD1E\\uDD1E\""
Expected a high surrogate character, got '?' at line 1, column 2: "\uDD1E
                                                                   ↑
```

We try out all the success and failure cases. Everything works out right.

JNumber Parser[#](#jnumber-parser)
----------

Numbers in JSON can be in different formats as shown by [this syntax](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed#number). Let’s start by writing the parser for a JSON integer.

```
jUInt :: Parser String Integer
jUInt = (`elseThrow` "Expected an unsigned integer") $
  lookahead >>= \case
    '0'           -> fromIntegral <$> digit
    c | isDigit c -> digitsToNumber 10 0 <$> digits
    c             -> throw $ printf "Expected a digit, got '%v'" c

jInt :: Parser String Integer
jInt = (`elseThrow` "Expected a signed integer") $
  lookahead >>= \case
    '-' -> negate <$> (char '-' *> jUInt)
    _   -> jUInt

digits :: Parser String [Int]
digits = ((:) <$> digit <*> digits') `elseThrow` "Expected digits"
  where
    digits' = safeLookahead >>= \case
      Just c | isDigit c -> (:) <$> digit <*> digits'
      _                  -> return []
```

`jUint` is a parser for an unsigned JSON integer. It starts with a lookahead and matches the character to see if it is a digit. If so it parses one-or-more characters as digits using the `digits` parser and converts the list of digits to a number. It handles the case of the first digit being zero specially because only JSON number which can begin with zero is zero itself.

`jInt` adds support for parsing optionally negative signed integers over `jUint`. Note that there are no positive signed integers in JSON.

The `digits` parser parses one or more characters into a list of digits as integers. It uses `safeLookahead` so it stops parsing when it encounters a non-digit character.

Moving on to parsing fractions and exponents:

```
jFrac :: Parser String [Int]
jFrac = (char '.' *> digits) `elseThrow` "Expected a fraction"

jExp :: Char -> Parser String Integer
jExp c = (char c *> jExp') `elseThrow` "Expected an exponent"
  where
    jExp' = lookahead >>= \case
      '-' -> negate <$> (char '-' *> jUInt)
      '+' -> char '+' *> jUInt
      _   -> jUInt
```

The `jFrac` parser parses simply for a dot (`.`) followed by one or more digits.

The `jExp` parser parses for a exponent symbol character (`e` or `E`) followed by a positive or negative or no sign unsigned integer. It uses `jUint` to do that. The exponent character is provided by the `jNumber` parser below.

Finally, the number parser `jNumber` brings all these together to parse any JSON number:

```
jNumber :: Parser String JValue
jNumber = do
  i <- jInt
  safeLookahead >>= \case
    Just '.' -> do
      f <- jFrac
      safeLookahead >>= \case
        Just c' | isExpSym c' -> JNumber i f <$> jExp c' -- int+frac+exp
        _                     -> pure $ JNumber i f 0    -- int+frac
    Just c | isExpSym c       -> JNumber i [] <$> jExp c -- int+exp
    _                         -> pure $ JNumber i [] 0   -- int
  where
    isExpSym c = c == 'e' || c == 'E'
```

The first part of any JSON number is a signed integer, which is followed by an optional fraction part, followed by an optional exponent part. We do two lookaheads to determine if there are following fractional and/or exponent parts and accordingly use the previously defined parsers to parse them. Then we put the parts together depending on the four cases[<sup>5</sup>](#fn5).

Let’s take `jNumber` for a spin in GHCi:

```
> runParser jNumber "0"
("",0)
> runParser jNumber "123"
("",123)
> runParser jNumber "123.1"
("",123.1)
> runParser jNumber "123e-22"
("",123e-22)
> runParser jNumber "123.11E+3"
("",123.11e3)
> runParser jNumber "01"
("1",0)
> runParser jNumber "-a"
Expected a digit, got 'a' at line 1, column 2: -a
                                                ↑
→ Expected an unsigned integer at line 1, column 2: -a
                                                     ↑
→ Expected a signed integer at line 1, column 1: -a
                                                 ↑
> runParser jNumber "1.a"
Expected a digit, got 'a' at line 1, column 3: 1.a
                                                 ↑
→ Expected digits at line 1, column 3: 1.a
                                         ↑
→ Expected a fraction at line 1, column 2: 1.a
                                            ↑
> runParser jNumber "1ex"
Expected a digit, got 'x' at line 1, column 3: 1ex
                                                 ↑
→ Expected an unsigned integer at line 1, column 3: 1ex
                                                      ↑
→ Expected an exponent at line 1, column 2: 1ex
                                             ↑
> runParser jNumber "1.1e+@"
Expected a digit, got '@' at line 1, column 6: 1.1e+@
                                                    ↑
→ Expected an unsigned integer at line 1, column 6: 1.1e+@
                                                         ↑
→ Expected an exponent at line 1, column 4: 1.1e+@
                                               ↑
```

Great! We were able to write small parsers for the parts of JSON numbers and combine them together using the `Applicative` and `Monad` capabilities to create a parser for any JSON number. This covers all the scalar types in JSON. Coming up are the parser for the two composite types.

JArray Parser[#](#jarray-parser)
----------

We start with rewriting the helper functions:

```
surroundedBy :: Parser i a -> Parser i b -> Parser i a
surroundedBy parser1 parser2 = parser2 *> parser1 <* parser2

separatedBy :: Parser String v -> Char -> String -> Parser String [v]
separatedBy parser sepChar errMsg = do
  res <- parser  `elseThrow` errMsg
  safeLookahead >>= \case
    Just c | c == sepChar ->
      (res:) <$> (char sepChar *> separatedBy parser sepChar errMsg)
    _ -> return [res]

spaces :: Parser String String
spaces = safeLookahead >>= \case
  Just c | isWhitespace c -> (:) <$> char c <*> spaces
  _                       -> return ""
  where
    isWhitespace c = c == ' ' || c == '\n' || c == '\r' || c == '\t'

```

`surroundedBy` stays the same. `separatedBy` now takes a separator character instead of a separator parser because we need to match the character with the lookahead. It also takes an error message to throw in case the given parser errors out. Rest of the changes are to convert `separatedBy` and `spaces` from `Alternative` based parsing to lookahead based parsing.

Now, we can rewrite the `jArray` parser using these helpers:

```
jArray :: Parser String JValue
jArray = JArray <$> do
  _ <- char '[' <* spaces
  c <- lookahead `elseThrow` "Expected a JSON value or ']'"
  case c of
    ']' -> [] <$ char ']'
    _   -> separatedBy jValue ',' "Expected a JSON value" <*
              satisfy (== ']') "Expected ',' or ']'"
```

`jArray` is now written in a monadic style instead of the earlier applicative style because we need to use lookahead[<sup>6</sup>](#fn6). First, it consumes the opening bracket (`[`) and any spaces that follow. Then it does a lookahead and checks to see if it is the closing bracket (`]`). If so, it consumes the character and returns an empty array.

Otherwise, it recursively parses for one-or-more JSON values separated by comma using the yet to be defined `jValue` parser, followed by the closing bracket (`]`). It also takes care of throwing appropriate errors. Let’s check it out in GHCi:

```
> runParser jArray "" -- empty input
Expected '[', but the input is empty at line 1, column 1:
                                                          ↑
> runParser jArray "[" -- no closing bracket
Empty input at line 1, column 2: [
                                  ↑
→ Expected a JSON value or ']' at line 1, column 2: [
                                                     ↑
> runParser jArray "[]" -- empty array
("",[])
> runParser jArray "[\t \r \n]" -- empty array with whitespace
("",[])
> runParser jArray "[\t\t  0]" -- one element array with whitespace
("",[0])
> runParser jArray "[0]" -- one element array without whitespace
("",[0])
> runParser jArray "[0,]" -- closing bracket after comma
Unexpected character: ']' at line 1, column 4: [0,]
                                                  ↑
→ Expected a JSON value at line 1, column 4: [0,]
                                                ↑
> runParser jArray "[0,1]" -- two element array
("",[0, 1])
> runParser jArray "[0," -- no element after comma
Empty input at line 1, column 4: [0,
                                    ↑
→ Expected a JSON value at line 1, column 4: [0,
                                                ↑
> runParser jArray "[      " -- no closing bracket after whitespace
Empty input at line 1, column 8: ······
                                       ↑
→ Expected a JSON value or ']' at line 1, column 8: ······
                                                          ↑
> runParser jArray "[0;1]" -- semicolon instead of comma
Expected ',' or ']', got ';' at line 1, column 3: [0;1]
                                                    ↑
```

It works as expected for all positive and negative tests. Moving on to the last composite parser for JSON objects.

JObject Parser[#](#jobject-parser)
----------

The `jObject` parser is very similar to the `jArray` parser: written in a monadic style using lookahead. Only difference is that the surrounding characters are braces (`{}`) and the recursive parsing is for one-or-more pairs of JSON string and JSON value[<sup>7</sup>](#fn7).

```
jObject :: Parser String JValue
jObject = JObject <$> do
  _ <- char '{' <* spaces
  c <- lookahead `elseThrow` "Expected a JSON value or '}'"
  case c of
    '}' -> [] <$ char '}'
    _   -> separatedBy pair ',' "Expected an object key-value pair" <*
             satisfy (== '}') "Expected ',' or '}'"
  where
    pair = (\ ~(JString s) j -> (s, j)) <$> key <*  char ':' <*> value
    key = (jString `surroundedBy` spaces) `elseThrow` "Expected an object key"
    value = jValue `elseThrow` "Expected an object value"
```

Testing in GHCi:

```
> runParser jObject "" -- empty input
Expected '{', but the input is empty at line 1, column 1:
                                                          ↑
> runParser jObject "{" -- no closing brace
Empty input at line 1, column 2: {
                                  ↑
→ Expected a JSON value or '}' at line 1, column 2: {
                                                     ↑
> runParser jObject "{}" -- empty object
("",{})
> runParser jObject "{\t  \n}" -- empty object with whitespace
("",{})
> runParser jObject "{\t  \n \"a\": 1}" -- one element object with whitespace
("",{"a": 1})
> runParser jObject "{\"a\": 1}" -- one element object without whitespace
("",{"a": 1})
> runParser jObject "{\"a\": 1,}" -- closing brace after comma
Expected '"', got '}' at line 1, column 9: a":·1,}
                                                 ↑
→ Expected an object key at line 1, column 9: a":·1,}
                                                    ↑
→ Expected an object key-value pair at line 1, column 9: a":·1,}
                                                               ↑
> runParser jObject "{\"a\":}" -- no value in key-value pair
Unexpected character: '}' at line 1, column 6: {"a":}
                                                    ↑
→ Expected an object value at line 1, column 6: {"a":}
                                                     ↑
→ Expected an object key-value pair at line 1, column 2: {"a":}
                                                          ↑
> runParser jObject "{\"a\": 1," -- no key after comma
Expected '"', but the input is empty at line 1, column 9: a":·1,
                                                                ↑
→ Expected an object key at line 1, column 9: a":·1,
                                                    ↑
→ Expected an object key-value pair at line 1, column 9: a":·1,
                                                               ↑
> runParser jObject "{1}" -- wrong key type
Expected '"', got '1' at line 1, column 2: {1}
                                            ↑
→ Expected an object key at line 1, column 2: {1}
                                               ↑
→ Expected an object key-value pair at line 1, column 2: {1}
                                                          ↑
> runParser jObject "{\"a\"}" -- no colon after key
Expected ':', got '}' at line 1, column 5: {"a"}
                                               ↑
→ Expected an object key-value pair at line 1, column 2: {"a"}
                                                          ↑
> runParser jObject "{      " -- no closing brace after whitespace
Empty input at line 1, column 8: ······
                                       ↑
→ Expected a JSON value or '}' at line 1, column 8: ······
                                                          ↑
> runParser jObject "{\"a\": 1;\"b\": 2}" -- semicolon instead of comma
Expected ',' or '}', got ';' at line 1, column 8: "a":·1;"b":·
                                                        ↑
> runParser jObject "{\"a\"# 1}" -- hash instead of semicolon
Expected ':', got '#' at line 1, column 5: {"a"#·1}
                                               ↑
→ Expected an object key-value pair at line 1, column 2: {"a"#·1
                                                          ↑
```

That’s a lot of tests! But everything works out. On to the final parser which brings everything together.

JValue Parser[#](#jvalue-parser)
----------

The [earlier version](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed#json-parser) of the `jValue` parser was based on backtracking: it tried to parse the input with parsers for each JSON type one-by-one, trying the next parser in case of failure. Since we have eschewed backtracking in this post for the purpose of having correct error message, we need to replace backtracking with lookahead in the `jValue` parser too.

```
jValue :: Parser String JValue
jValue = jValue' `surroundedBy` spaces
  where
    jValue' = lookahead >>= \case
      'n'  -> jNull   `elseThrow` "Expected null"
      't'  -> jBool   `elseThrow` "Expected true"
      'f'  -> jBool   `elseThrow` "Expected false"
      '\"' -> jString `elseThrow` "Expected a string"
      '['  -> jArray  `elseThrow` "Expected an array"
      '{'  -> jObject `elseThrow` "Expected an object"
      c | c == '-' || isDigit c ->
        jNumber `elseThrow` "Expected a number"
      c    -> throw $ printf "Unexpected character: '%v'"
                    $ showCharForErrorMsg c
```

That turns out to be easier than expected as the JSON syntax is unambiguous. We can always choose the right sub-parser to use by looking at the character lookahead returns. We also sprinkle right error messages for each sub-parser and for the default case. And we are done!

We write the top-level `parseJSON` function now which runs the `jValue` parser over the input and return the result as an `Either`. The `printResult` function just pretty-prints the result of `parseJSON`.

```
parseJSON :: String -> Either String JValue
parseJSON s = case runParser jValue s of
  Result ("", j) -> Right j
  Result (i, _)  -> Left $ "Leftover input: " <> i
  err@(Error _)  -> Left $ show err

printResult :: Either String JValue -> IO ()
printResult = putStrLn . either ("ERROR:\n" <>) (("RESULT:\n" <>) . show)
```

Finally, the test case promised at the beginning of the post:

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
> printResult $ parseJSON "[{\"c\"\t:\n  \n  \t[\r\"\\n\"]}]"
RESULT:
[{"c": ["\n"]}]
```

We also run the property-based tests to make sure that nothing is broken:

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

We have successfully added useful error-reporting capabilities to our JSON parser.

Conclusion[#](#conclusion)
----------

Over the course of the last two posts, we rewrote the JSON parser we wrote in the first post to add support for error reporting. While doing that, we learned about Zippers and how to use them to move around within a data structure. We also learned about lookahead based predictive parsing and how it is different from backtracking parsing. The full code for the new JSON parser can be found [here](https://abhinavsarkar.net/code/jsonparser-2.html?mtm_campaign=feed).

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. For comparison: [the `jsonChar` parser](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed#cb34-1) which uses backtracking from the first post.[↩︎](#fnref1)

2. We are using the [Multi-way If](https://downloads.haskell.org/ghc/latest/docs/users_guide/exts/multiway_if.html#extension-MultiWayIf) GHC extension here.[↩︎](#fnref2)

3. To learn about Unicode surrogate characters and what they have to do with JSON parsing, see the [`jString` parser section](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed#jstring-unicode) in the first post.[↩︎](#fnref3)

4. For comparison: [the `jString` parser](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed#cb36-1) from the first post.[↩︎](#fnref4)

5. For comparison: [the `jNumber` parser](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed#jnumber-parser) which uses backtracking from the first post.[↩︎](#fnref5)

6. For comparison: [the `jArray` parser](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed#jarray-parser) from the first post.[↩︎](#fnref6)

7. For comparison: [the `jObject` parser](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed#jobject-parser) from the first post.[↩︎](#fnref7)

This post is a part of the series: **JSON Parsing from Scratch in Haskell**.

1. [JSON Parsing from Scratch in Haskell](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell/?mtm_campaign=feed)
2. [Error Reporting—Part 1](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-2/?mtm_campaign=feed)
3. **Error Reporting—Part 2** 👈

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-3/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [My website](https://abhinavsarkar.net/posts/json-parsing-from-scratch-in-haskell-3/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)