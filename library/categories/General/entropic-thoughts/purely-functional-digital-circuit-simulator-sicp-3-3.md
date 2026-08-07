+++
title = "Purely functional digital circuit simulator (SICP 3.3)"
description = " I have a copy of SICP, or as it is also known, The Wizard Book. This book is widely praised, but I can’t take the time to work my way through all of it. Instead, I’m going to occasionally jump into the parts of it that look interesting. Since last week, are in the process of s"
date = "2026-08-04T22:00:00Z"
url = "https://entropicthoughts.com/sicp-3-3-pure-digital-circuit-simulator"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-08-06T09:52:33.486424317Z"
seen = false
+++

 I have a copy of SICP, or as it is also known, *The Wizard Book*. This book is widely praised, but I can’t take the time to work my way through all of it. Instead, I’m going to occasionally jump into the parts of it that look interesting.

 Since last week, are in the process of simulating a digital circuit. The reason this is interesting is the solution in SICP uses hidden mutable state and message-passing to make the code object-oriented. It even uses a mutable global variable for scheduling! We managed to replicate all of that in Haskell, but now we want to refactor the solution to be easier to work with.

 If we are going to manage the simulation in a pure functional manner, we still have to contend with the fact that during simulation, wires are objects with a fixed identity. A wire does not become a different wire just because its signal changes – the same wire is still hooked up to the same gates. Wires need to maintain their identity somehow.

[(Continue reading the full article on the web.)](https://entropicthoughts.com/sicp-3-3-pure-digital-circuit-simulator)