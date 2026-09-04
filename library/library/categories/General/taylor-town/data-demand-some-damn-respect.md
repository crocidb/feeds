+++
title = "Data demand some damn respect."
description = "Et tu, brutus computus."
date = "2025-03-28T00:00:00Z"
url = "https://taylor.town/flat-scraps-002"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.192642138Z"
seen = true
+++

Loyal bytes toil in memory, on disk, across wires, etc. They crunch our numbers; we cast them to the garbage collector. *Et tu, brutus computus.*

And so I've been thinking about "compassionate" compilation. How can we learn to love our languages again? How can we reduce our energy footprint? How can we tame the chaos monkeys? How can we reignite the joy of simple software? How can we share our abundance as if recycling air?

The Modern Stack
----------

Modern web computing looks vaguely like this:

* TSX → unspeakable horror → HTML/CSS/JS
* HTML/CSS/JS on CDN → HTTP → HTML/CSS/JS into DOM → process layout and run JS → virtual DOM
* Rust → ??? → LLVM IR → LLVM → server executable → Dockerfile → Docker image
* virtual DOM → DOM → browser → JSON → HTTP → JSON → server executable -\> SQL → PG protocol → query planner → PG tuples → MVCC magic → PG protocol → server executable → JSON → HTTP → JSON → browser → DOM → virtual DOM

This is barely a map of the *happy path*. It skips error states, compiler internals, OS, CI, package management, containers, garbage collection, CPU caches, etc. How many allocations--

Nope. It's too much for my sad synapses. I cannot pretend to comprehend the journey that my data take to load a single web app.

A Convenient Package
----------

Computers are crafted at the *nanometer* scale; they are the pinnacle of human precision. But software [squanders this power](https://en.wikipedia.org/wiki/Wirth's_law). Our precision engines evoke frustration, bugs, and inconsistency -- "did you try turning it off and on again?". Codebases devolve into chimeras of LEGO, Lincoln Logs, cement, popsicle sticks, duct tape -- software cannot succeed like this.

But to wrest LEGO and Lincoln Logs from y'all would be folly. I cannot coerce an entire industry to converge on compatible standards. No, no -- please keep your familiar tools/toys.

Here's my proposal: we choose one "good enough" data layout, and we squeeze it for as much mileage as it can bear. Such a format must encode most popular formats, respect bandwidth, support single-pass execution, allocate sparingly, afford sublinear lookup (for lists/dicts), and remain simple to understand/implement. Good news: our computing forefathers already solved these problems -- we just need to cram them into a single convenient package.

**tl;dr** flat scraps = bootleg [MsgPack](https://msgpack.org) + bootleg [IPFS](https://ipfs.tech) + bootleg [XSD](https://en.wikipedia.org/wiki/XML_Schema_(W3C)) + bootleg [FORTH](https://en.wikipedia.org/wiki/Forth_(programming_language))

Boring Data
----------

Integers, floats, strings, bytes, arrays, maps, variants, types -- any serialization format that encodes these data will do. CBOR and MsgPack are reasonable starting points.

 Flat scraps are still in the discovery phase! Meanwhile, check out [Max Bernstein](https://bernsteinbear.com)'s [elegant \~100 LOC scrapscript serializer](https://github.com/tekknolagi/scrapscript/blob/trunk/scrapscript.py#L1028-L1182).

Most popular markup/config/data formats (JSON, YAML, XML, CSS, HTML, CSV, Dockerfile, etc.) can be efficiently encoded as CBOR/MsgPack (sketched here as scrapscript types):

```
()

; csv :
    list text

; css :
    list css-rule
; css-rule :
    | #style { selector : text, declarations  : list decl }
    | #at { name : text, prelude : text, block : maybe (list decl) }
; css-decl :
    { property : text, value : text, important : bool }

; html :
    xml

; xml :
    | #text text
    | #float float
    | #bool bool
    | #object (list xml)
    | #doctype { name : text, attrs : dict text xml }
    | #tag { name : text, attrs : dict text xml, body : xml }

; yaml :
    json

; json :
    | #null
    | #bool bool
    | #int int
    | #float float
    | #text text
    | #list (list json)
    | #dict (dict text json)

; dockerfile :
    { base : (pair text text)
    , instructions : list (
        | #from (pair text text)
        | #run text
        | #copy (pair (list text) text)
        | #workdir text
        | #env (list (pair text text))
        | #expose (list int)
        | #volume (list text)
        | #user text
        | #entrypoint (list text)
        | #cmd (list text)
        | #comment text
      )
    }
```

CSS parsers should live in editors, not browsers. You can still write as much CSS as you want -- just don't send it around as CSS *text*. Text is floppy. It's hard to cache, hard to compress, hard to parse, hard to validate, etc. Send data structures instead.

Shareable Data
----------

By shoving all these data structures into the same serialization format, all software can reap the rewards of common infrastructure: shared compression, shared schema validation, shared optimizations, shared versioning, etc.

Scrapscript (and flat scraps) extend "sharing" further. You can [replace any "scrap" of data with its cryptographic hash](https://scrapscript.org/guide#Scrapyards) to reference it and reuse it. For example, we could serialize HTML pages like this:

```
<html>
  <html title="meta" href="scrap://$e9a23cbc455158951716b440c3d165e0"/>
  <body>
    <html title="header" href="scrap://$099fb995346f31c749f6e40db0f395e3"/>
    <main>
      <p>hello world</p>
    </main>
    <html title="footer" href="scrap://$d7eb6b340a11a367a1bec55e4a421d949214759f"/>
  </body>
</html>
```

Suddenly, without any syntax changes, every format acquires the powers of git *at the semantic level*. Replace any chunk of JSON/CSV/etc with its hash and it can hit a cache on the other side of the wire.

It gets better. We can use [scrap maps](https://scrapscript.org/guide#ScrapMap) to name (and version) arbitrary hashes:

```
<html>
  <html href="scrap://taylortown/example/meta"/>
  <body>
    <html href="scrap://taylortown/example/header"/>
    <main>
      <p>hello world</p>
    </main>
    <html href="scrap://taylortown/example/footer"/>
  </body>
</html>
```

But wait -- it gets even better.

Flat scraps [have a type system](https://scrapscript.org/guide#Types). Imagine succinct [JSON Schema](https://json-schema.org), friendly XSD, serializable Haskell, etc. You can reuse all the exact same tools for maximum strictness:

```
package-json
; package-json :
    { name : text
    , version : text
    , description : maybe text
    , main : maybe text
    , types : maybe text
    , scripts : dict text text
    , repository : maybe { type : maybe text, url : text, directory : maybe text }
    , keywords : list text
    , author : maybe { name : text, email : maybe text, url : maybe text }
    , license : maybe text
    , bugs : maybe { url : maybe text, email : maybe text }
    , homepage : maybe text
    , dependencies : dict text text
    , devdependencies : dict text text
    , peerdependencies : dict text text
    , optionaldependencies : dict text text
    , engines : maybe { node : maybe text, npm : maybe text }
    , private : maybe bool
    , publishconfig : maybe { registry : maybe text, access : maybe text }
    , workspaces : maybe (list text)
    }
```

You needn't f\*ck around nor find out. You can infer/enforce types at runtime or compile time. You can ensure that all configs and messages are truly compatible.

 You may enjoy [my talk from UNSOUND '24](https://www.youtube.com/live/ZZx7DvdAID0?si=vNlkzcXyAJuJR7yk&t=10311).

Programs
----------

But that's just static data. You can also *efficiently encode arbitrary programs* this way. Code can be data, too.

By extending CBOR/MsgPack with executable data, we unlock new superpowers: dynamic configs, templating engines, RPCs, client-side codegen, hot reload, Smalltalk-esque images, etc.

Behold the reigning champion of simple computing: FORTH. [Stack languages](https://en.wikipedia.org/wiki/Stack-oriented_programming) are the simplest means of practical memory/compute. [Uxn](https://permacomputing.net/Uxn/) is exemplary.

 Why not WASM? LLVM IR? In short, they're not simple enough for my tastes. I think humans write more code than we can responsibly maintain. In my experience, bloat is the nastiest unsolved problem in software; slow/buggy software is holding us back.

Most people consider [reverse-polish notation](https://en.wikipedia.org/wiki/Reverse_Polish_notation) an eye blight, but computers [kinda prefer it](https://en.wikipedia.org/wiki/Stack_machine#Comparison_with_register_machines) over prefix and infix notations.

 We might be able to get the best of all worlds by embedding "performance hint" operators: explicit allocations, SIMD, etc.

```
{ add1 = n -> n + 1 }

-- flat scrap (bytes):
--   { "add1" = expr[var(n) var(n) 1 op(+) op(->)] }
```

Here's my compromise: flat scraps use RPN; [scrapscript](https://scrapscript.org) reflects them as an infix notation.

 While I've been off exploring flat scraps, [Max](https://bernsteinbear.com) ([and friends](https://github.com/tekknolagi/scrapscript/graphs/contributors)) have been turning scrapscript into a real high-level programming language with [a world-class compiler](https://github.com/tekknolagi/scrapscript)!

The Scrap Stack
----------

This is the vision I'm working toward with flat scraps:

* **lex/parse:** scrapscript → flat scrap
* **eval:** flat scrap → flat scrap
* **optimize:** flat scrap → flat scrap
* **print:** flat scrap → scrapscript
* **compile:** flat scrap → executable
* **deploy:** flat scrap → tcp → flat scrap
* **serve:** flat scrap → tcp → executable → tcp → flat scrap
* **query:** flat scrap → tcp → flat scrap → dirtdb → flat scrap → tcp → flat scrap

It looks stupid, because yes -- it's stupid.

Computing can be simpler.

---

* Help me release [smel shell](https://github.com/surprisetalk/smel/pull/1).
* Contribute to [Max's compiler](https://github.com/tekknolagi/scrapscript).
* Visit [the Scrapscript Discourse](https://scrapscript.discourse.group).
* Email me at [hello@taylor.town](mailto:hello@taylor.town).