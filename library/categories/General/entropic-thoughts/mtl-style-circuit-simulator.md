+++
title = "MTL-style circuit simulator"
description = " After the first attempt at making a very side-effectful circuit simulator, and then an ambitious attempt at making it pure, I was reminded of a middle ground, using a pattern common in production Haskell code. It is called MTL-style effects, and it is a specific type of *final"
date = "2026-10-26T23:00:00Z"
url = "https://entropicthoughts.com/mtl-style-circuit-simulator"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-10-27T22:33:08.499889041Z"
seen = false
+++

 After the first attempt at making a very side-effectful circuit simulator, and then an ambitious attempt at making it pure, I was reminded of a middle ground, using a pattern common in production Haskell code. It is called *MTL-style effects*, and it is a specific type of *final tagless encoding*.

 The idea is that we first find a set of operations that our circuit simulator needs to support. Drawing this boundary well requires some experience and taste. Then we encode that limited set of operations into a type class. Here’s one way to do it.

In[1]:

```
class CircuitOperations m where
 make_wire :: m Wire
 get_signal :: Wire -> m Signal
 set_signal :: Wire -> Signal -> m ()
 add_action :: Wire -> m () -> m ()
 after_delay :: Int -> m () -> m ()
 get_time :: m Int
 probe_output :: String -> m ()
 propagate :: m ()

```

 Having read the previous article, these operations should sound familiar. I’m sure it’s possible to create a better set of operations, but this will suffice to illustrate the point.

[(Continue reading the full article on the web.)](https://entropicthoughts.com/mtl-style-circuit-simulator)