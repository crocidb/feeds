+++
title = "Begrudgingly choosing CBOR over MessagePack"
description = "Protocols are important. Communicate with caution."
date = "2025-03-01T00:00:00Z"
url = "https://taylor.town/flat-scraps-001"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.204302783Z"
seen = true
+++

In my pursuit of [a *sharable* programming language](https://scrapscript.org), I need a suitable serialization format that's (1) performant to send/store and (2) easy to understand/implement.

 Serialized [scrapscript](https://scrapscript.org) expressions are called "flat scraps".

In [a previous essay](https://taylor.town/flat-scraps-000), I crammed scrapscript into [MessagePack](https://msgpack.org).

 At the time, I didn't realize that [Max Bernstein](https://bernsteinbear.com) had already written [an entire serializer in \~100 LOC](https://github.com/tekknolagi/scrapscript/blob/trunk/scrapscript.py#L1028-L1182). Mind blown!

After [further experiments](https://github.com/surprisetalk/smel/pull/1), I somehow convinced myself that this serialization format also needed to (3) commit to existing standards, (4) work overtime as a pseudo-IR, (5), and run on relatively crappy hardware.

 I'm still in the discovery phase here. Max's format remains very attractive after witnessing the weight of popular CBOR and msgpack implementations.

Meanwhile, [Peter Saxton](https://crowdhailer.me) ([EYG](https://eyg.run)) sent me a friendly email recommending [CBOR](https://en.wikipedia.org/wiki/CBOR) as a potential alternative to [MessagePack](https://msgpack.org).

Uh oh -- competing standards? Marginal design tradeoffs? Open-source woes? Buckle up!

 Drama is fun, but not relevant to this essay. [This post](https://diziet.dreamwidth.org/6568.html) provides a solid summary of CBOR's history. [This comment](https://news.ycombinator.com/item?id=14072598) links to the most contentious public spats.

Which is cooler?
----------

Obviously MessagePack is what *cool* kids would use.

Compare the subheadings on each landing page:

* [msgpack](https://msgpack.org): "It's like JSON. but fast and small."
* [CBOR](https://cbor.io): "RFC 8949 Concise Binary Object Representation"

One of these formats is wearing a damn necktie.

Everything about CBOR is uncool. It was designed by a committee. It reeks of RFCs. Acronyms are lame. Saying "SEE-BORE" is like licking a nickel. One of the authors is "Carsten Bormann", which makes the name feel masturbatory.

>
>
> CBOR was inspired by MessagePack. MessagePack was developed and promoted by Sadayuki Furuhashi ("frsyuki").
>
>
>
> \-- [RFC 8949](https://www.rfc-editor.org/rfc/rfc8949.html)
>
>

Loyalty to an "original" brand has merit. Instead of chasing mere incremental improvements, you can support creators who synthesize value from nearly nothing. To favor derivative work can feel like choosing bureaucracy over personal expression.

Which is more efficient?
----------

But many people don't care about "coolness" -- they want compression and speed and performance.

In [these benchmarks](https://prataprc.github.io/msgpack-vs-cbor.html), the author compared performance between two popular Go libraries. From these tests, it appears that the CBOR library encodes/decodes \~200% faster.

![Following bar chart show the time taken to encode basic data types - nil, int64, uint64, bool, bytes, string, array and map. This benchmark was done in go-language, using msgpack package and gson package. Source code is available here, here and here.](https://prataprc.github.io/media/gsoncharts/enc-msgpack-gson.svg)

Which is simpler?
----------

But efficiency isn't everything. I usually choose conceptual simplicity over performance. Like most makers, I resent depending on forces I cannot understand.

To measure complexity, you can often use documentation length as a proxy. MessagePack [is just a markdown file.](https://github.com/msgpack/msgpack/blob/master/spec.md) The CBOR spec [has its own gravitational field](https://cbor.io/spec.html).

However, upon further scrutiny, I've found that the documentation sniff-test misled me. [This HN comment](https://news.ycombinator.com/item?id=14068017) shares my latest thoughts:

>
>
> Yeah, I skipped all the drama, read the spec and implemented an encoder/decoder. CBOR is just how MessagePack-like format should have been done from the beginning: it's technically superior in a sense that it's neat and simple, replacing many specialized rules with one generalization.
>
>

At its top-level, MessagePack [defines a bunch of types](https://github.com/msgpack/msgpack/blob/master/spec.md): integers, floats, arrays, extensions, etc. CBOR unifies these types with "tags"; this pattern seems much easier to explain and implement.

[This person posits](https://news.ycombinator.com/item?id=14072598) that CBOR's tags are poorly designed. Although I respectfully disagree with his conclusions, I think he makes some great points.

Which is more popular?
----------

"Serialization" often connotes "communication". Bandwidth is expensive, so formats like MessagePack and CBOR make obvious candidates for computer protocols.

[Metcalfe's Law](https://en.wikipedia.org/wiki/Metcalfe's_law) states that the value of a protocol is proportional to its popularity.

The data speak for itself:

|     |       |                                                                           |
|-----|-------|---------------------------------------------------------------------------|
|3.1K☆|   C   |         [msgpack/msgpack-c](https://github.com/msgpack/msgpack-c)         |
|2.4K☆|  Go   |       [vmihailenco/msgpack](https://github.com/vmihailenco/msgpack)       |
|1.9K☆|Python |    [msgpack/msgpack-python](https://github.com/msgpack/msgpack-python)    |
|1.8K☆|  Go   |              [tinylib/msgp](https://github.com/tinylib/msgp)              |
|1.4K☆| Java  |      [msgpack/msgpack-java](https://github.com/msgpack/msgpack-java)      |
|1.4K☆|  JS   |[msgpack/msgpack-javascript](https://github.com/msgpack/msgpack-javascript)|
|1.2K☆| Rust# |        [3Hren/msgpack-rust](https://github.com/3Hren/msgpack-rust)        |
|1.0K☆|  JS   |      [kawanet/msgpack-lite](https://github.com/kawanet/msgpack-lite)      |
|837☆ |  C#   |       [msgpack/msgpack-cli](https://github.com/msgpack/msgpack-cli)       |
|806☆ |  Go   |            [fxamacker/cbor](https://github.com/fxamacker/cbor)            |
|784☆ |  PHP  |       [msgpack/msgpack-php](https://github.com/msgpack/msgpack-php)       |
|764☆ | Ruby  |      [msgpack/msgpack-ruby](https://github.com/msgpack/msgpack-ruby)      |
|529☆ |  JS   |          [kriszyp/msgpackr](https://github.com/kriszyp/msgpackr)          |
|519☆ |   C   |            [intel/tinycbor](https://github.com/intel/tinycbor)            |
|364☆ |  JS   |          [hildjj/node-cbor](https://github.com/hildjj/node-cbor)          |
|354☆ |   C   |               [PJK/libcbor](https://github.com/PJK/libcbor)               |
|320☆ |  JS   |            [paroga/cbor-js](https://github.com/paroga/cbor-js)            |
|311☆ |  JS   |      [msgpack/msgpack-node](https://github.com/msgpack/msgpack-node)      |
|303☆ |  JS   |            [kriszyp/cbor-x](https://github.com/kriszyp/cbor-x)            |
|300☆ | Rust  |              [pyfisch/cbor](https://github.com/pyfisch/cbor)              |
|284☆ | Rust  |            [enarx/ciborium](https://github.com/enarx/ciborium)            |
|243☆ |Python |           [agronholm/cbor2](https://github.com/agronholm/cbor2)           |
|214☆ |  C#   |            [peteroupc/CBOR](https://github.com/peteroupc/CBOR)            |
|210☆ |Erlang |    [msgpack/msgpack-erlang](https://github.com/msgpack/msgpack-erlang)    |
|196☆ |Haskell|          [well-typed/cborg](https://github.com/well-typed/cborg)          |
|142☆ | Swift |      [valpackett/SwiftCBOR](https://github.com/valpackett/SwiftCBOR)      |
|138☆ |Haskell|   [msgpack/msgpack-haskell](https://github.com/msgpack/msgpack-haskell)   |
|119☆ | Java  |          [c-rack/cbor-java](https://github.com/c-rack/cbor-java)          |

Which is better?
----------

For my particular use-case, CBOR totally wins. [Scrapscript expressions feel great inside CBOR's extension tags.](https://github.com/surprisetalk/smel/pull/1)

I prefer CBOR, but I don't like that I prefer CBOR. It irks me to use technology with political baggage.

Anyway, MessagePack and CBOR are *vast* improvements over JSON. As long as MessagePack retains its popular advantage, both options seem reasonable.

Protocols are important. Communicate with caution.