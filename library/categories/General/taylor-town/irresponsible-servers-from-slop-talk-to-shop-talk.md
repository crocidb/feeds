+++
title = "Irresponsible Servers: From Slop Talk to Shop Talk"
description = "400: OUT OF STOCK"
date = "2024-09-22T00:00:00Z"
url = "https://taylor.town/irresponsible-servers"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.254843585Z"
seen = true
+++

![](https://taylor.town/irresponsible-servers.png)

Slop Talk
----------

Hello!

…

Hello?

…

200: ACK.

Hi, I'd like a cheeseburger with fries--

400: OUT OF STOCK.

Cheeseburger…

…

…with fries?

…

…

400: OUT OF STOCK.

Fries.

400: OUT OF STOCK.

Fine -- forget the fries!

500: SOMETHING WENT WRONG.

Trust Issues
----------

So here I am, helping out a friend with some YouTube analytics stuff -- we're using [Google's official Node.js client](https://github.com/googleapis/google-api-nodejs-client) to communicate with Google's servers.

Hmm. That's weird. I'm pretty sure I saw something in the online documentation, but I don't see it in the Typescript bindings.

After chatting with YouTube technical support, it looks like the JS client is lagging behind the REST API. No problem -- I'll just skip the dependency and write it from scratch.

Hmm. That's weird. The YouTube reporting payload roughly returns the right shape, but this is definitely not what we wanted. After trying every other endpoint via trial-and-error, it looks like we're stuck.

But after escalating the issue with YouTube technical support, it looks like what we actually want is an *undocumented* API, which the rep just enabled on our service acount. Additional details have been sent to our email inboxes.

Hmm. That's weird. It works.

Maybe this is why I have trust issues.

Meat Sounds
----------

These are symptoms of a sloppy protocol. No, I'm not talking about Google/YouTube -- they're doing the best they can with problematic tools. No, I'm talking about this whole meta-protocol encapsulating NPM, GitHub, REST, JSON, Swagger, etc.

 It's easy to hate on Javascript, but this problem seems endemic across languages.

My biggest gripe is that machines can do all of this. It doesn't need to be this hard, folks; almost every human touchpoint here can be reduced/eliminated.

Matching versions, downloading bindings, filing support tickets -- machines have historically been very good at things like this. And yet I have to [flap my meat sounds over the radio waves](https://www.mit.edu/people/dpolicar/writing/prose/text/thinkingMeat.html) in order to establish a network connection?

REST for the Wicked
----------

To cajole our machines into performing this labor, we must be much more precise about how the meta-protocol is currently broken. We must hunt *soundless* friction. Here is where my head's at right now:

* There is currently no machine-verifiable link between documentation, types, schemas, requests, responses, addresses, etc. When something goes wrong, I, human, must independently verify this stuff with fractal frustration.
* Without machine "contracts", I am encouraged to trust the server's opinion of ["I fucked up" v. "you fucked up"](https://www.reddit.com/r/ProgrammerHumor/comments/kh0z9s/http_status_ranges_in_nutshell/). In practice, my bad inputs can cause 5xx errors, and random server bugs can return 4xx errors.
* Errors are generally not established/enumerated in documentation/types/schema. To exhaustively implement error-handling, you must use a pathfinding algorithm called "toes discover furniture at full-speed in the dark".
* Don't even get me started on `/api/v2` and deprecation "schedules".

Blame Games
----------

In some ways, this is a simple attribution-of-error problem. As a web client, there is no consistent/automatic way to blame a server when things go wrong.

Lately, I've been thinking about ["publishable network contracts"](https://taylor.town/unsound-2024-cfp) in [scrapscript](https://scrapscript.org). Over time, I've developed this strange feeling that we're doing this to ourselves; we're not holding our servers accountable.

So here's my working definition of a "responsible" server:

1. remains active at the expected address
2. abides by a machine-interpretable protocol
3. commits to the protocol until a specific date
4. responds to requests within guaranteed timeout window
5. cryptographically signs an address, deprecation date, protocol, documentation, etc.

 To give you a taste of what's possible here, I'm using these properties to construct a Heroku-like service for scrapscript. In that service, I can automatically prorate API payments for server downtime. Legal teams needn't get involved for machine-verifiable errors.

Scrapscript's [network contracts](https://taylor.town/unsound-2024-cfp) could theoretically resolve some of this, but I really (really) hope I don't need to maintain a whole new programming language to improve our meta-protocol.

Shop Talk
----------

```
-- REQ /burgest
()

-- RES
{ order :
  { address = "123.456.678.890"
  , port = 8080
  , timeout = time/seconds 5
  , depecrated-at = 1721100422
  , protocol =
    { req =
        #burger int
        #fries int
        #shake int
    , res =
        #ok { order-id : int }
        #out-of-stock
        #store-closed
        #end-of-world
    }
  }
, confirm :
  { ip = "123.456.678.890"
  , port = 8081
  , timeout = time/seconds 30
  , depecrated-at = 1721100422
  , protocol =
    { req = { order-id : int, credit-card : text }
    , res =
        #ok
        #unknown-order-id
        #empty-order
        #order-expired
        #payment-declined (#funds #cc)
        #payment-processor-unreachable
        #staff-locked-in-restroom-again
    }
  }
}

-- REQ /burgest/order
#burger 1

-- RES
#ok { order-id : 4321 }

-- REQ /burgest/order
#fries 1

-- RES
#out-of-stock

-- REQ /burgest/confirm
{ order-id : 4321
, credit-card : "0000000000000001"
}

-- RES
#staff-locked-in-restroom-again
```