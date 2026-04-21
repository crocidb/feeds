+++
title = "Cramming scrapscript into msgpack"
description = 'Every scrapscript program can be crammed into "flat" scraps.'
date = "2024-12-21T00:00:00Z"
url = "https://taylor.town/flat-scraps-000"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.220531347Z"
seen = true
+++

This is a work-in-progress! Please email me at [hello@taylor.town](mailto:hello@taylor.town) if you have any suggestions, criticisms, threats, etc.

[msgpack](https://msgpack.org) is a lovely little serialization format. As a JSON replacement, it saves bandwidth while preserving native language features (e.g. tuples, records, objects, dates).

By leveraging msgpack, every [scrapscript](https://scrapscript.org) program/expression can be crammed into "flat" scraps.

When using HTTP, set `Content-Type` to `application/scrap`.

Because flat scraps encode a full programming language, you can send unambiguous programs/queries across a wire:

```
"Joy" |> (name -> ok { name })

-- EXPR       0xc7201f
-- "Joy"      0xa34a6f79
-- name=name  0x81a46e616d65c704786e616d65
-- REC        0xc17b7d
-- OK         0xc10006
-- name       0xc704786e616d65
-- ->         0xc12d3e
-- |>         0xc17c3e
```

…and represent its evaluated result:

```
ok { name = "Joy" }

-- EXPR        0xc7101f
-- name="Joy"  0x81a46e616d65a34a6f79
-- REC         0xc17b7d
-- OK          0xc10006
```

This first-class serialization format confers non-obvious benefits:

* a compact format affords a canonical format for hashing
* when computation is cheaper than bandwidth, you can send programs instead of sending data
* both code & data can share the same tooling for compression, analysis, optimization, etc.
* cheaper to store programs on disk (or KV store) and load into memory
* it's a simple/convenient cross-platform compilation target
* with types, encoders/decoders can be magically inferred/generated/typechecked at compile-time
* msgpack is supported [by 50+ languages/environments](https://msgpack.org); all msgpack messages are already scraps, and scrap-specific extensions can be incrementally implemented in each host language

---

|                           |                  scrapscript                   |                                      msgpack                                      |extID |
|---------------------------|------------------------------------------------|-----------------------------------------------------------------------------------|------|
|   [literals](#literals)   |  [int](https://scrapscript.org/guide#Numbers)  | [int](https://github.com/msgpack/msgpack/blob/master/spec.md#bool-format-family)  |      |
|   [literals](#literals)   | [float](https://scrapscript.org/guide#Numbers) |[float](https://github.com/msgpack/msgpack/blob/master/spec.md#float-format-family)|      |
|   [literals](#literals)   |   [text](https://scrapscript.org/guide#Text)   |  [str](https://github.com/msgpack/msgpack/blob/master/spec.md#str-format-family)  |      |
|   [literals](#literals)   |  [bytes](https://scrapscript.org/guide#Bytes)  |  [bin](https://github.com/msgpack/msgpack/blob/master/spec.md#bin-format-family)  |      |
|   [literals](#literals)   |   [hole](https://scrapscript.org/guide#Hole)   |     [nil](https://github.com/msgpack/msgpack/blob/master/spec.md#nil-format)      |      |
|   [literals](#literals)   |  [bool](https://scrapscript.org/guide#Types)   | [bool](https://github.com/msgpack/msgpack/blob/master/spec.md#bool-format-family) |      |
|[expressions](#expressions)|                      expr                      |  [ext](https://github.com/msgpack/msgpack/blob/master/spec.md#ext-format-family)  |`0x1f`|
| [references](#references) | [var](https://scrapscript.org/guide#Variables) |  [ext](https://github.com/msgpack/msgpack/blob/master/spec.md#ext-format-family)  |`0x76`|
| [references](#references) |  [rock](https://scrapscript.org/guide#Rocks)   |  [ext](https://github.com/msgpack/msgpack/blob/master/spec.md#ext-format-family)  |`0x72`|
| [references](#references) |[hash](https://scrapscript.org/guide#Scrapyards)|  [ext](https://github.com/msgpack/msgpack/blob/master/spec.md#ext-format-family)  |`0x24`|
| [structures](#structures) |  [list](https://scrapscript.org/guide#Lists)   |[array](https://github.com/msgpack/msgpack/blob/master/spec.md#array-format-family)|      |
| [structures](#structures) |  [dict](https://scrapscript.org/guide#Rocks)   | \*[map](https://github.com/msgpack/msgpack/blob/master/spec.md#map-format-family) |      |
| [structures](#structures) |   [tag](https://scrapscript.org/guide#Types)   | \*[map](https://github.com/msgpack/msgpack/blob/master/spec.md#map-format-family) |      |
| [structures](#structures) |[record](https://scrapscript.org/guide#Records) | \*[map](https://github.com/msgpack/msgpack/blob/master/spec.md#map-format-family) |      |
| [evaluation](#evaluation) |                      expr                      |                                                                                   |`0x1f`|

 Each `extID` classifies its msgpack [ext](https://github.com/msgpack/msgpack/blob/master/spec.md#ext-format-family) datatype. Each of these bytes mnemonically corresponds to ASCII characters (e.g. record is `0x7b` for `{`).

 Versioning remains an open question! Email me at [hello@taylor.town](mailto:hello@taylor.town) with your wildest ideas.

Literals
----------

|    scrapscript     |           msgpack            |
|--------------------|------------------------------|
| `$$bool::false ()` |             `c2`             |
| `$$bool::true ()`  |             `c3`             |
|        `()`        |             `c0`             |
|        `11`        |          `d0` `0b`           |
|       `1234`       |         `cd` `04d2`          |
|       `1.2`        |       `ca` `3f99999a`        |
|  `123456789.1234`  |   `cb` `419d6f34547e5c92`    |
|        `-&`        |         `cb` `fff0`          |
|        `+&`        |         `cb` `7ff0`          |
|       `;ff`        |             `ff`             |
|       `"hi"`       |         `a2` `6869`          |
|       `"🐀🐀"`       |   `ac` `7ac97bca7ac97bca`    |
|`;;aGVsbG8gd29ybGQ=`|`c4` `0cab` `aGVsbG8gd29ybGQ=`|

Expressions
----------

Flat scrap expressions are written in [reverse polish notation](https://en.wikipedia.org/wiki/Reverse_Polish_notation):

| scrapscript | flatscrap |                    msgpack                    |                            |
|-------------|-----------|-----------------------------------------------|----------------------------|
|   `1 + 2`   |  `1 2 +`  |       `c7` `05` `1f` `01` `02` `c1002b`       |  ext8 length extID 1 2 +   |
|`(1 + 2) * 3`|`1 2 + 3 *`|`c7` `08` `1f` `01` `02` `c1002b` `03` `c1002a`|ext8 length extID 1 2 + 3 \*|
| `1 + 2 * 3` |`1 2 3 * +`|`c7` `08` `1f` `01` `02` `03` `c1002a` `c1002b`|ext8 length extID 1 2 3 \* +|

Within the expression, prepend each 2-byte operator with `0xc1`.

Here are many of the normal computer operations you know and love:

|     |      |    |             |
|-----|------|----|-------------|
| num |`002b`|`+` |     add     |
| num |`002d`|`-` |  subtract   |
| num |`002a`|`*` |  multiply   |
| num |`002f`|`/` |   divide    |
| num |`005e`|`^` |     pow     |
| num |`0025`|`%` |   modulo    |
| num |`2525`|`%%`|  remainder  |
|comp |`003c`|`<` |     lt      |
|comp |`003e`|`>` |     gt      |
|comp |`3c3d`|`<=`|     lte     |
|comp |`3e3d`|`>=`|     gte     |
|many |`2b2b`|`++`|   concat    |
|many |`3e2b`|`>+`|   prepend   |
|many |`2b3c`|`+<`|   append    |
|bitty|`2626`|`&&`|     and     |
|bitty|`7c7c`|`⏐⏐`|     or      |
|bitty|`5e5e`|`^^`|     xor     |
|nofun|`3d3d`|`==`|    equal    |
|nofun|`2f3d`|`/=`|  not equal  |
| fun |`3c7c`|`<⏐`|  pipe left  |
| fun |`7c3e`|`⏐>`| pipe right  |
| fun |`3c3c`|`<<`|compose left |
| fun |`3e3e`|`>>`|compose right|

 Typing is tricky. For example, we want addition to work for floats and integers, but we also don't want to introduce ambiguity. We could enforce type-specific operators, but that might introduce complexity elsewhere. As usual, email [hello@taylor.town](mailto:hello@taylor.town) with thoughts.

Fancier operators are also available:

|      scrapscript      |      flatscrap      |                                   msgpack                                   |
|-----------------------|---------------------|-----------------------------------------------------------------------------|
|        `t::a`         |     `t "a" :.`      |                      `c7081f` `d47674` `a161` `c13a2e`                      |
|       `t::a ()`       |    `t "a" () ::`    |                   `c7081f` `d47674` `a161` `c0` `c13a3a`                    |
|       `rec ~ a`       |     `rec "a" ~`     |                   `c70b1f` `c70476726563` `a161` `c1007e`                   |
|     `a ? a == 1`      |   `a "a" 1 == ?`    |               `c70c1f` `d47261` `a161` `01` `c13d3d` `c1003f`               |
|        `f 1 2`        |   `f 1 2 apply2`    |                    `c7081f` `d47666` `01` `02` `c12032`                     |
|`⏐ 0 -> 0 ⏐ n -> n - 1`|`0 0 -> n n 1 - -> ⏐`|`c7121f` `00` `00` `c12d3e` `d4766e` `d4766e` `01` `c1002d` `c12d3e` `c12d7c`|

|arity|bytes |char|  desc  |
|-----|------|----|--------|
|  2  |`007e`|`~` | access |
|  2  |`3a2e`|`:.`| tagger |
|  3  |`3a3a`|`::`|  tag   |
|  2  |`003f`|`?` | assert |
|  2  |`2d3e`|`->`|function|
|  2  |`007c`|`⏐` |  case  |
|  2  |`003a`|`:` |annotate|
|  2  |`003a`|`:` |annotate|
|  2  |`2031`|    |apply 1 |
|  3  |`2032`|    |apply 2 |
|  4  |`2033`|    |apply 3 |

To keep things tiny, we also cram common expressions into the operator space:

|arity|bytes |    scrap    |
|-----|------|-------------|
|  1  |`0015`|`result::no` |
|  1  |`0006`|`result::ok` |
|  0  |`0030`|`maybe::none`|
|  1  |`0031`|`maybe::some`|
|  2  |`0032`|   `pair`    |
|  3  |`0033`|   `trip`    |
|  4  |`0034`|   `quad`    |
|  2  |`6c6d`|`$$list-map` |
|  1  |`6e39`|   `$$max`   |
|  1  |`6e30`|   `$$min`   |
|     |  …   |      …      |

References
----------

Flat scraps distinguish between [scope variables](https://scrapscript.org/guide#Variables) (`76`), [native functions](https://scrapscript.org/guide#Rocks) (`72`), and [expression hashes](https://scrapscript.org/guide#Scrapyards) (`24`):

|  scrapscript   |           msgpack            |                             |
|----------------|------------------------------|-----------------------------|
|      `x`       |        `d4` `76` `78`        |      fixext1 extID "x"      |
|     `$$x`      |        `d4` `72` `78`        |      fixext1 extID "x"      |
|    `$$min`     |   `c7` `03` `72` `6d696e`    |   ext8 length extID "max"   |
|`$md5;;aG93ZHk=`|`c7` `11` `24` `00` `aG93ZHk=`|ext8 length extID algoID data|

 Hashes point to other flat scraps [in a scrapyard](https://scrapscript.org/guide#Scrapyards).

| ID |  algo  |
|----|--------|
|`00`|  MD5   |
|`01`|  SHA1  |
|`02`|  SHA2  |
|`03`|  SHA3  |
|`62`| BLAKE  |
|`63`|CityHash|
|`66`|  FNV   |
|`6d`| Murmur |
|`72`| RIPEMD |
|`73`|SipHash |
|`78`| xxHash |

Structures
----------

A scrapscript list corresponds to a plain msgpack array:

|scrapscript|   msgpack   |              |
|-----------|-------------|--------------|
| `[1,2,3]` |`93` `010203`|fixarray 1 2 3|

The other structures are represented as [maps](https://github.com/msgpack/msgpack/blob/master/spec.md#map-format-family):

|           scrapscript            |                 msgpack                  |                       |
|----------------------------------|------------------------------------------|-----------------------|
|`[ ;;oWE=';;AQ==, ;;oWI=';;Ag== ]`|       `82` `a161` `01` `a162` `02`       |   map8 "a" 1 "b" 2    |
|`dict/from-list [ "a"'1, "b"'2 ]` |    `c7161f` `c10064` `82a16101a16202`    | expr `d` `{a=1,b=2}`  |
|           `#a c #b d`            |`c71a1f` `c10023` `82a161d47263a162d47265`| expr `#` `{a=c,b=d}`  |
|        `{ a = 1, b = 2 }`        |    `c7161f` `c17b7d` `82a16101a16202`    | expr `{}` `{a=1,b=2}` |
|             `{ a }`              |     `c7151f` `c17b7d` `81a161d47261`     |   expr `{}` `{a=a}`   |
|         `{ a = 1, ..z }`         |   `c7171f` `c17b7d` `82a16101a0d4727a`   |expr `{}` `{a=1,""=z}` |
|         `{ a = 1, ... }`         |     `c7151f` `c17b7d` `82a16101a0a0`     |expr `{}` `{a=1,""=""}`|

Because maps are ambiguously typed, use special operators to clarify the intended structure:

|arity|bytes |char|desc |
|-----|------|----|-----|
|  1  |`0064`|`d` |dict |
|  1  |`7b7d`|`{}`| rec |
|  1  |`0023`|`#` |type |
|  2  |`002e`|`.` |where|
|  2  |`0021`|`!` |await|

Evaluation
----------

Astute observers may have noticed some strange operators like [where](https://scrapscript.org/guide#Variables) and [await](https://www.roc-lang.org/tutorial#the-postfix-await-operator):

|     scrapscript     |     flatscrap     |                  msgpack                  |
|---------------------|-------------------|-------------------------------------------|
| `x . x = 1 . y = 2` |`{"x"=1,"y"=2} x .`|`c7141f` `82a17801a17902` `d47678` `c1002e`|
|`x <- 1 ! y <- 2 ! x`|`{"x"=1,"y"=2} x !`|`c7141f` `82a17801a17902` `d47678` `c10021`|

To build a basic interpreter, push values on a stack and perform operations in-place. Bind function arguments and environment variables into a scoped map that can be copied from.

 Blind copies are naive! I'm cooking up some unsafe "hint" operators for advanced memory management. Stay tuned.

And someday soon, we'll all be able to do irresponsible stuff like this:

```
// javascript
const fib = scrap.decode(await fetch("yard.scrap.land/tom/fib"));
console.log(fib(40)); // 102334155
```

```
// javascript
import fib from "yard.scrap.land/tom/fib";
console.log(fib(40)); // 102334155
```

```
// golang
import (
  "fmt"
  "yard.scrap.land/tom"
)
func main() {
  fmt.Println(tom.Fib(40)) // 102334155
}
```

```
# python
async with aiohttp.ClientSession() as sess:
    async with sess.get("yard.scrap.land/tom/fib") as res:
        fib = scrap.decode(await res.read())
        print(fib(40)) # 102334155
```

```
// javascript
const fib = n => {
  let phi = (1 + Math.sqrt(5)) / 2;
  let asymp = Math.pow(phi, n) / Math.sqrt(5);
  return Math.round(asymp);
};
await fetch("api.example.com", {
  headers: { "Content-Type": "application/scrap" },
  method: "POST",
  body: scrap.encode(fib),
});
```