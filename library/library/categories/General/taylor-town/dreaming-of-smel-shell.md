+++
title = "dreaming of smel shell"
description = "It's more than a terminal, but less than a desktop environment."
date = "2025-01-21T00:00:00Z"
url = "https://taylor.town/smel-000"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.210319391Z"
seen = true
+++

I'm here to explain a dream. Like most dreams, it's difficult to describe and annoying to experience secondhand.

I want [nushell](https://nushell.org) plus notebook UI. Or maybe [jupyter](https://jupyter.org) notebooks minus UI?

It's more than a terminal, but less than a desktop environment.

Give me tiny lil' apps for email, calendar, RSS, streaming, editing, etc.

I want DWIM semantics… without sacrificing type-safety.

Let me pipe graphical programs together like DAW plugins -- knobs optional, please.

An Intuition
----------

Here's what this dream might look like in `bash`:

```
$ curl "names.json" | nano | jq '.[].name' > names.txt

   100% ■■■■■■■■■■■■■

   [{"name":"Alice"},{"name":"Bob"}]

   ˟ "Alice"
   ˟ "Bob"
   + ﹍﹍﹍﹍

   ⎋ names.txt :: 8kb :: 10μs :: 15 seconds ago
```

In this example, I'd want the JSON displayed by `nano` to work like a live `textarea`. Upstream edits would propagate through the pipes:

```
$ curl "names.json" | nano | jq '.[].name' > names.txt

   100% ■■■■■■■■■■■■■

   [{"name":"Blice"},{"name":"Bob"}]

   ˟ "Blice"
   ˟ "Bob"
   + ﹍﹍﹍﹍

   ⎋ names.txt :: 8kb :: 7μs :: just now
```

A Mockup
----------

This paradigms extends the UNIX pipe metaphor with [pipe gauges](https://www.mcmaster.com/products/pipe-gauges/).

![](https://taylor.town/smel-000-0.jpg)

The magic here is that each gauge is interactive. By manipulating a gauge, you can synthesize/manipulate its pipe.

A Reveal
----------

And to nobody's surprise -- [scrapscript](https://scrapscript.org) is the hammer that transforms my problems into nails.

Here's how the same command might look in `smel`, a scrapscript shell:

```
http "names.json" []
|> edit []
|> each (get "name")
|> write "names.txt" []
```

Empty lists can behave like typesafe `--flag=value` params:

```
http "names.json" [#method #get, #json]
|> edit [#vi]
|> each (get "name")
|> write "names.txt" []
```

An Example
----------

But what's going on inside the pipes and gauges?

Let's imagine a simple progress widget inspired by [Elm Architecture](https://guide.elm-lang.org):

```
http "names.json" []
|> smel/widget
   { init = { count = 0 }
   , subs =
      model -> [ end #end, key "q" #end, in #out ]
   , update =
       {count} ->
         | #out #nothing -> {count} ' cmd/out out
         | #out (#package x) -> { count = x.content-length } ' cmd/out out
         | #out (#packet x) -> { count = count + bytes/length x } ' cmd/out out
         | #out (#text x) -> { count = text/length x } ' cmd/out out
         | #out (#affix x) -> { count = count + text/length x } ' cmd/out out
         | #out (#row x) -> { count = count + 1 } ' cmd/out out
         | #out (#blob x) -> { count = bytes/length x } ' cmd/out out
         | #out (#chunk x) -> { count = count + bytes/length x } ' cmd/out out
         | #out (#list x) -> { count = count + list/length x } ' cmd/out out
         | #out (#item x) -> { count = count + 1 } ' cmd/out out
         | #out _ -> model ' cmd/err "unexpected input"
         | #end -> model ' cmd/end
   , view = {count} ->
       smel/ui/rows
       [ smel/ui/text [] "PROGRESS"
       , smel/ui/text []
         (text/from-int count ++ " " ++ text/repeat count ".")
       ]
   }
|> edit []
|> each (get "name")
|> write "names.txt" []

-- PROGRESS
-- 33 .................................
```

Without going into too many details:

* Incoming data/signals flow into `subs`. These subscriptions pass messages (e.g. `#out _`) to `update`.
* This widget can receive lots of different types of data via `in`. When it receives "complete" data (e.g. `#list _`), it overwrites `count`. When it receives incremental data (e.g. `#item _`), it increments `count` accordingly.
* When `count` is updated, the view is automatically re-rendered.
* `smel/ui` is a minimal UI library that can target terminal, browser, etc.

A Dream
----------

This architecture can yield lots of cool interactive notebook-like widgets!

```
cal []
--                          2025 January
--   ╭────┬────┬────┬────┬────┬────┬────╮
--   │ su │ mo │ tu │ we │ th │ fr │ sa │
--   ├────┼────┼────┼────┼────┼────┼────┤
--   │    │    │    │  1 │  2 │  3 │  4 │
-- ◀ │  5 │  6 │  7 │  8 │  9 │ 10 │ 11 │ ▶
--   │ 12 │ 13 │ 14 │ 15 │ 16 │ 17 │ 18 │
--   │ 19 │ 20 │ 21 │ 22 │ 23 │ 24 │ 25 │
--   │ 26 │ 27 │ 28 │ 29 │ 30 │ 31 │    │
--   ╰────┴────┴────┴────┴────┴────┴────╯

files [::glob "~/**.jpg", ::larger (mb 10), ::contains "hello"]
-- ˟ ~/bananas.jpg
-- ˟ ~/prom_night.jpg
-- ˟ ~/toe_surgery.jpg
-- ✛ ﹍﹍﹍﹍﹍﹍﹍﹍

text "15*sin(x)" |> plot []
--
-- "15*sin(x)"
--
--  15.00 ┤   ╭──╮                ╭──╮
--  10.00 ┤ ╭─╯  ╰─╮            ╭─╯  ╰─╮
--   5.00 ┤╭╯      ╰╮          ╭╯      ╰╮
--   0.00 ┼╯        ╰╮        ╭╯        ╰╮
--  -5.00 ┤          ╰╮      ╭╯          ╰╮      ╭
-- -10.00 ┤           ╰─╮  ╭─╯            ╰─╮  ╭─╯
-- -15.00 ┤             ╰──╯                ╰──╯

int (1 + 2)
-- 3

|> map (add 4)
-- 7

mail [] |> show []
--
--  ╭───────┬─────────────────┬────────────────╮
--  │ 01/18 │ Jeff Bezos      │ RE: Green Origi│
--  ▶ 01/18 │ Grandma         │ please send mor│
--  │ 01/17 │ Bill Gates      │ Candy Crush?   │
--  │ 01/17 │ Elon M.         │ FWD: Path of Ex│
--  │ 01/15 │ Tom             │ Friend request │
--  ╰───────┴─────────────────┴────────────────╯
--
--  Grandma <grandma@yahoo.com>
--  # please send more money
--  │
--  │ the one-armed bandit took it again
--  │   <3 gma

int (1 + 2)
|> edit [::autosave false]
|> silent (map (x -> x +< '!'))
|> show []
--
-- 3
--
-- [ 4 ]  ☑ save
--
-- "4!"

http "taylor.town/two-toucans-canoe" []
|> show [::markdown]
--
-- ■■■■■■■■■▢ 90%
--
-- ▓  # Two Toucans Canoe
-- ▓
-- ▓  Two toucans canoe towards land.
-- ░
-- ░  Toucan Dan commands, "Paddle faster, Anne!"
-- ░
-- ░  And Anne paddles faster.
-- ░
-- ░  The canoe swerves westward.
-- ░
-- ▼  ...

browse [::markdown]
-- [https://en.wikipedia.org/wiki/life]
--
-- ▓  # Life
-- ░
-- ░  Life is a quality that distinguishes
-- ░  matter that has biological processes,
-- ░  such as signaling and self-sustaining
-- ░  processes, from matter that does not.
-- ░  It is defined descriptively by the
-- ░  capacity for homeostasis, organisation,
-- ░  metabolism, growth, adaptation,
-- ░
-- ▼  ...

int (a + b)
. a = 1
. b = 2
-- 3

snap [] |> now (t -> write "~/shell-`stamp t`.scrap" [])
--
-- ˟ cal []
-- ˟ files [::glob "~/**.jpg", ::larger (mb 10), ::contains "hello"]
-- ˟ text "15*sin(x)" |> plot []
-- ˟ int (1 + 2)
-- ˟ |> map (add 4)
-- ˟ mail [] |> show []
-- ˟ int (1 + 2)
--     |> edit [::autosave false]
--     |> silent (map (x -> x +< '!'))
--     |> show []
-- ˟ http "taylor.town/two-toucans-canoe" []
--     |> show [::markdown]
-- ˟ browse [::markdown]
-- ˟ int (a + b)
--     . a = 1
--     . b = 2
-- ✛ ﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍﹍
--
-- ⎋ ~/shell-202501170858.txt :: 400kb :: 54ms :: 10 minutes ago

share []
-- watch [] "https://smel.scrap.land/oteh883h3be"

watch [] "https://smel.scrap.land/oteh883h3be"
-- ┌────────────────────────────────────┐
-- │ watch [] "https://smel.scrap.land/o│  [F]ull
-- │ -- ┌───────────────────────────────│
-- │ -- │ watch [] "https://smel.scrap.l│  [M]ute
-- │ -- │ -- ┌──────────────────────────│
-- │ -- │ -- │ watch [] "https://smel.sc│  [S]nap
-- │ -- │ -- │ -- ┌─────────────────────│
-- │ -- │ -- │ -- │ watch [] "https://sm│  [Q]uit
-- │ -- │ -- │ -- │ -- ┌────────────────│
-- │ -- │ -- │ -- │ -- │ watch [] "https│
-- │ -- │ -- │ -- │ -- │ -- ┌───────────│
-- └────────────────────────────────────┘
```

A Seed
----------

Here's how I currently imagine the smel platform API for building widgets:

```
{widget,sub,cmd,err,act,pipe,ui}

. widget : model => msg =>
    { init : model
    , subs : model -> list (sub msg)
    , update : model -> msg -> model ' cmd msg
    , view : model -> ui msg
    }

. sub : msg =>
    #end msg
    #in (stuff -> msg)
    #key (byte -> act -> msg)
    #touch (point -> act -> msg)
    #every { ms : int, do : time -> msg }

. cmd : msg =>
    #none
    #end
    #err text
    #out stuff
    #batch (list (cmd msg))

. act :
    #up
    #down
    #press

. stuff :
    #nothing
    #scrap scrap
     #sliver bytes
    #text text
     #affix text
    #table (dict text (list scrap))
     #row (dict text scrap)
    #package bytes
     #packet bytes
    #blob bytes
     #chunk bytes
    #list (list scrap)
     #item scrap

. ui : msg =>
    #text { wrap : bool, data : text, ..style }
    #cols { data : list ui, ..style }
    #rows { data : list ui, ..style }
    #tip { label : text, data : ui, ..style }
    #button { click : msg, label : text, ..style }
    #input { input : text -> msg, label : text, ..style }
    #progress { label : text, count : float, total : float, ..style }

. style :
    { align : #left #center #stretch #right
    , border : #none #solid
    , border-color : #inherit #color color
    , font-color : #inherit #color color
    , font-size : #title #subtitle #body #note
    , font-style : #unstyled #bold #italic #strike #underline
    }
```

An Invitation
----------

If this vision of personal computing excites you, please contribute:

* add comments/questions/suggestions to [my PR](https://github.com/surprisetalk/smel/pull/1) in [surprisetalk/smel](https://github.com/surprisetalk/smel)
* add to [Max Bernstein](https://bernsteinbear.com)'s beautiful implementation at [tekknolagi/scrapscript](https://github.com/tekknolagi/scrapscript)
* keep an eye out for [the self-hosted draft spec](https://github.com/scrapscript/scrapscript/pull/1) at [scrapscript/scrapscript](https://github.com/scrapscript/scrapscript)