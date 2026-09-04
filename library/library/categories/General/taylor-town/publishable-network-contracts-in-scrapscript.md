+++
title = "Publishable Network Contracts in Scrapscript"
description = "As networked programs change, the communication between sound programs inevitably becomes unsound."
date = "2024-07-15T00:00:00Z"
url = "https://taylor.town/unsound-2024-cfp"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.284264864Z"
seen = true
+++

This was a last-minute abstract submission to [UNSOUND 2024](https://2024.splashcon.org/home/unsound-2024).

As networked programs change, the communication between sound programs inevitably becomes unsound.

Surprisingly, there exist no practical means of maintaining contracts between networked programs. Software developers suffer accordingly:

* **the "/v2" problem:** REST server maintainers rely on a fragile honor system to publish API changes. As a result, many APIs permanently embed "/v1" and "/v2" in their URLs while pushing breaking changes. Services that embed versioned dates in HTTP headers (e.g. AWS) sow confusion as leading StackOverflow solutions become irrelevent.
* **the deprecation dance:** Deprecation is mostly a word-of-mouth experience. Only the largest engineering teams have spare resources to plan, communicate, and enact deprecation plans. When deprecation notices are finally heeded, errors usually cascade through dependent packages.
* **ambiguous protocols:** JSONSchema, gRPC, XML schemas, etc. usually fail to identify type errors in request/response payloads. As a result, code-generated 1st-party libraries are often the only means to safely explore/integrate an API. But maintaining code-gen libraries is too burdensome for most small engineering teams, so each language ecosystem often maintains multiple broken implementations via volunteer effort.
* **poor feedback channels:** Unless a network API is open-source, there is no consistent mechanism of feedback for service maintainers. Furthermore, sharing client state and stacktraces remains a manual process.
* **unhelpful type errors:** When an API mismatch occurs over the network, the service is expected to supply a 400 error. There exists no formal method of decoding type errors; most service maintainers manually implement human-readable messages, which are often misleading/incorrect.
* **untrusted code:** If a client chooses to use a library, the elect to continually trust the performance and security of others' code.
* **no accountability:** Without a common mechanism of publishing/parsing contracts, there can be no formal way of assigning blame when client/server errors occur. Breaches of SLA contracts are generally unenforced.
* **scarce changelog data:** Even if top-level API type-information is available, it is generally impossible to track historical changes to remote APIs. This weakens clients' abilities to investigate and audit upstream systems.

In summary, unsoundness creeps between the boundaries of the following ad-hoc systems:

* live API endpoints (e.g. api.example.com)
* schema/type information (e.g. api.example.com/schema)
* application-level protocols (e.g. JSON, gRPC, XML)
* package-managers (e.g. NPM, PyPI)
* version control systems (e.g. GitHub)
* developer documentation (e.g. ReadTheDocs)
* bug tracking (e.g. GitHub issues)

Scrapscript prevents some of these errors via a holistic combination of programming lanugage features, type-system guarantees, and ecosystem defaults:

* [Scrapscript](https://scrapscript.org) is a strongly-typed functional language (like Haskell, Elm, etc.).
* All expressions in Scrapscript are content-addressible.
* To share arbitrary snippets with other programs, any expression can be published into "the scrapyard".
* All scrapyard entries are cryptographically signed; all signatures are public.
* A simple `address` type (published in the scrapyard) provides a simple means of contracts.

```
address : req => res =>
  { ip : text
  , port : int
  , unsafe-at : timestamp
  , protocol : { req, res }
  }
```

```
-- sends a record to my-address and awaits a list of ints
app-send my-address { foo = "hello" }
. my-address : address { foo : text } (list int) =
    { ip = "a31f:3dce:9990:dd92:3636:4786:9099:c665"
    , port = 81
    , unsafe-at = 1721100422
    , protocol =
      { req = t::text |> tmap (foo -> {foo})
      , res = t::list t::int
      }
    }
. t = scrap/type
. tmap = scrap/type/map
```

* Type information can be inferred and enforced from encoders/decoders constructed in protocols. The type-checker can enforce soundness at compile-time, and verify the incoming payload against its contract at evaluation time.
* All standard Scrapscript networking functions use this address type by default -- `unsafe-at` can be ignored or gradually adopted.
* The Scrapscript CLI (currently under development) automatically constructs and publishes these addresses upon deploying a server.
* Cryptographic signatures guarantee authenticity of addresses.
* The `unsafe-at` timestamp provides an algorithically enforceable SLA contract. Scrapscript tools may use this information to automatically remit payment for outages and create audit trails for debugging.