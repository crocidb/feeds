+++
title = "IKEA-Oriented Development"
description = "To frugally furnish a codebase, imitate Ikea."
date = "2023-06-16T00:00:00Z"
url = "https://taylor.town/ikea-oriented-development"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.553016856Z"
seen = true
+++

Every codebase is a home. Repos carry scars, arguments, memories, secrets, decorations, and sometimes [graffiti](https://twitter.com/FrostbiteEngine/status/398214869662441472).

Programmers are homeowners. They perform repairs, rearrange things, and embark on redesigns.

To frugally furnish a codebase, imitate Ikea:

1. [Packaging is the Product](#air)
2. [Pre-Packaged Dependencies](#deps)
3. [Composable & Disposable](#cd)

---

1. Packaging is the Product
----------

[![shipping air](https://taylor.town/persimmon-box.jpg)](https://twitter.com/DeLaNate/status/654796101887721472/photo/1?ref_src=twsrc^tfw|twcamp^tweetembed|twterm^654796101887721472|twgr^0fb5010f80f8b4dbb3db86f2de2085e351161f1b|twcon^s1_&ref_url=https://www.buzzfeed.com/morenikeadebayo/amazon-packaging-needs-to-chill-the-fuck-out)

>
>
> We hate air.
>
>
>
> \-- Peter Agnefjäll (CEO of IKEA)
>
>

They're not trying to cut costs on assembly labor, folks.

Air is expensive. Ikea embraces DIY furniture to save space on trucks, ships, and warehouses.

>
>
> IKEA famously eliminates air from their packages by selling their furniture in ready-to-assemble parts. In 2010, when they started selling their Ektorp sofa disassembled, IKEA eliminated enough air to reduce their package size by 50%. With this smaller packaging, IKEA was able to remove 7,477 trucks from the roads annually.
>
>
>
> \-- Katelan Cunningham ([*Why IKEA Hates Air*](https://www.lumi.com/blog/ship-less-air))
>
>

It takes \~10 seconds to open the Zoom *login screen* on my M1 Pro. Generations of software devs used Moore's Law to deliver exponential air to our computers.

Packaging is the product; data layouts matter.

[![computing latencies](https://taylor.town/k0t1e.png)](https://gist.github.com/jboner/2841832)

Delivering data is expensive.

Bytes bounce between disks, RAM, caches, and networks.

How much space/time *should* a program use in theory? Seriously, [always make an educated guess](https://www.youtube-nocookie.com/embed/Ge3aKEmZcqY).

Take any ID or value in your system. How many computers does it touch? How much time does it spend in HTTP packets? How big and how long does it spend in RAM? How many times is it copied in CPU cache? How is it moved or copied on the program stack? How is it represented in the GPU?

As an exercise for the reader, how much air is being delivered in each case?

```
let points = 0;
const usrs = await sql`select * from usr where country = 'JP'`;
for (const usr of usrs) {
  points += usr.points;
}
```

```
const usrs = await sql`select * from usr where country = 'JP'`;
const [{ points = 0 }] = await sql`
  select sum(points) as points
  from usr
  where id in ${sql(usrs.map(usr => usr.id))}
`;
```

```
const [{ points = 0 }] = await sql`
  select sum(points) as points
  from usr
  where country = 'JP'
`;
```

2. Pre-Packaged Dependencies
----------

[![ikea flatpack](https://taylor.town/im-1950-flatpack-01-1256x1600.png)](http://web.archive.org/web/20230601074628/https://ikeamuseum.com/en/digital/the-story-of-ikea/flatpacks/)

If you have a hammer and screwdriver, you can build Ikea furniture. Everything else comes in the box. Nobody wants to hunt for a 6.2mm allen key when what you really need is a bookshelf.

![Ikea tools](https://taylor.town/ikea-screwdriver-1536x521.png)

In the computing world, screws are made of plaintext, HTTP, etc. Today's shells and standard libraries offer ubiquitous screwdrivers like Regex manipulation, HTTP processing, and JSON parsing.

If you can't bundle allen keys for your hex fasteners, stick to screws. Likewise, if you lack the engineering resources to support multiple SDKs, make damn sure your web API is easy enough to access with `curl`.

My MarioKart 64 cartridge probably won't inform me that Python2.7 was deprecated. If your program isn't designed to work 20 years from now, it won't.

3. Composable & Disposable
----------

![kallax variations](https://taylor.town/20-IKEA-KALLAX-Hacks-Your-Home-Needs.jpg)

>
>
> Flat-pack furniture is not meant to last. It has taken me too long to understand that flimsiness is part of its appeal. Because when the door of a cabinet starts to sag off plumb and the laminate is curling off its corner, that means you get to buy another one.
>
>
>
> \-- [Lionel Shriver](https://www.spectator.co.uk/article/ikea-s-real-genius-making-furniture-disposable)
>
>

[Ikea furniture is hackable.](https://www.reddit.com/r/ikeahacks/top)

Hackable things are often (1) composable and (2) disposable.

Composable systems expose extendible interfaces. For example, [Eurorack modular synths](https://en.wikipedia.org/wiki/Eurorack) offer auditory combinatorics (at exorbitant prices).

Disposable goods (i.e. commodities) are useful *because* they aren't special. A paper plate can be repurposed as a mask, a canvas, a paint palette, a frisbee, a paper snowflake, etc. Ceramic plates are not very versatile.

Together, composability and disposability encourage experimentation.

SQL is ugly, but there's a good reason it's the lingua-franca of tech. People embrace SQL's blemishes because (1) it's generally fast and (2) queries are disposable. Plus, whenever you need a new query, you can rifle through your trash to find snippets worth recycling! SQL is easy to cobble, remix, and edit.

To make your software hackable:

* **Make experimentation effortless.** If tweaking and testing your codebase is a pain, devs will avoid making changes. Nobody wants to wade through spaghetti then wait 40 seconds for recompilation.
* **Embrace reliable mainstream formats.** Use common interfaces like CSV, webhooks, JSON, and RSS. Products are way more useful when you can plug them into GNU utils, IFTTT, Siri Shortcuts, etc.
* **Write code that can be replaced.** Writing code is easy, but editing code is hard. Make inputs and outputs extremely clear; everything between is disposable detail. We intuitively call irreplacable code "complicated" or "spaghetti".