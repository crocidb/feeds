+++
title = "Digital circuit simulator in Haskell (SICP 3.3)"
description = " I have a copy of SICP, or as it is also known, The Wizard Book. This book is widely praised, but I can’t take the time to work my way through all of it. Instead, I’m going to occasionally jump into the parts of it that look interesting. In the previous two installations of thi"
date = "2026-07-26T22:00:00Z"
url = "https://entropicthoughts.com/sicp-3-3-digital-circuit-simulator-in-haskell"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-07-28T12:42:17.545149217Z"
seen = true
+++

I have a copy of SICP, or as it is also known, *The Wizard Book*. This book is widely praised, but I can’t take the time to work my way through all of it. Instead, I’m going to occasionally jump into the parts of it that look interesting.

 In the previous two installations of this series, we looked at ways of implementing generic functions. In the first one, by tagging values and dispatching operations on tags. In the second case, by filling a mutable table of operation–tag pairs. We saw how these are roughly equivalent to the existing Haskell features of sum types and type classes.

 Now we’ll simulate a digital circuit. The reason this is interesting is that the solution in SICP uses hidden mutable state and message-passing to make the code object-oriented. It even uses a mutable global variable for scheduling! I wasn’t sure if it would be possible to replicate that in Haskell, but as we’ll see, it can get incredibly close.

[(Continue reading the full article on the web.)](https://entropicthoughts.com/sicp-3-3-digital-circuit-simulator-in-haskell)