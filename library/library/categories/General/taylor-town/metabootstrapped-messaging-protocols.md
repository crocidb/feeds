+++
title = "Metabootstrapped Messaging Protocols"
description = "Any Turing-complete bootstrapped messaging protocol can transpile its bootstrapped client to other languages."
date = "2024-06-14T00:00:00Z"
url = "https://taylor.town/sle-2024-cfp"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.290328632Z"
seen = true
+++

This page was adapted from my recent [SLE 2024](https://2024.splashcon.org/track/sle-2024) abstract submission.

Abstract
----------

Any Turing-complete bootstrapped messaging protocol can transpile its bootstrapped client to other languages. Metabootstrapping has practical advantages:

1. Maintains consistent protocol implementations across languages.
2. Propagates types-as-values to verify protocols at compilation time.
3. Sufficiently powerful to propagate high-level (e.g. JSON) and low-level (e.g. TCP) protocols together.
4. Defines unambiguous mappings between programming language features/structures.
5. Reduces bandwidth via content-addressible "scraps".
6. Provides a natural mechanism to check and enforce inter-program contracts.
7. Automatically transpiles naive code from any source language to any target language.

 This essay progressively enhances JSON to concretely demonstrate concepts, limitations, etc. for a more complete and thoroughly-designed implementation, see [scrapscript.org](https://scrapscript.org).

Motivation
----------

Modern message formats (e.g. JSON, XML, gRPC) encoders/decoders must be implemented, maintained, and upgraded across all supported languages. The ambiguity of syntax and protocol in JSON and other protocols creates security threats and wastes developer time.

Basic Solution
----------

By adding a few primitives to JSON (conditionals and simple lambdas), one can express a naive JSON parser in JSON:

```
{
  "parseJson": x =>
    parseString x
    ? parseString x
    : parseObject {} x,

  "parseString": x =>
    x == ""
    ? null
    : x[0] == "\""
      ? parseStringHelper x[1:]
      : null,

  "parseStringHelper": x =>
    x[0] == "\""
    ? ""
    : x[0] + parseStringHelper x[1:],

  "parseObject": obj => x =>
    x[0] == "{"
    ? parseObjectHelper obj x[1:]
    : null,

  "parseObjectHelper": obj => x =>
    x[0] == "}"
    ? obj
    : obj
      + parseObjectHelper
          { (parseString x): parseJson (skipKey "\"" x) }
          (skip "," (skipKey x)),

  "skip": c => x =>
    x == ""
    ? null
    : x[1] == c
      ? x[2:]
      : skipKey x[2:],

  "skipKey": x =>
    (skip ":" (skip "\"" (skip "\"" x)))

}
```

Improvements & Demonstration
----------

The full presentation will cover examples of enhanced variations on this theme, as discovered during the development of Scrapscript.

* **Upgrading the bootstrapper**: Changes are automatically propagated as new clients to all mapped languages.
* **Verbosity with second-order schemas like JSONSchema**: By adding sum/product types to JSON, one can formally describe its own AST and the ASTs of other languages.
* **String/bytes level limitation**: By adding a formal VM description (rocks/platforms), one can additionally express lower-level networking and communication details.
* **Artifacts in stepping up/down between languages**:
  * Example: stepping down: JSON encoders/decoders in Elm.
  * Example: stepping up: PostgreSQL range types.

* **Local types limitation**: By treating types as values, type-safe contracts can be natively sent across the network for deterministic blame.
* **Cost of running and sending large programs**: By adding content addressible "scraps", one can significantly reduce bandwidth and computation.
* **Contract mediation without a trusted third party**: By hosting/sharing types as content-addressible scraps, we get a neutral deterministic system for enforcing contracts.
* **Code already written in the target language**: If encoding/decoding works both ways, then any compatible code can be ported to the neutral code store, and then further shared with all other languages.