+++
title = "Tagged data in Haskell (SICP 2.4.2)"
description = " I have a copy of SICP, or as it is also known, The Wizard Book. This book is widely praised, but I can’t take the time to work my way through all of it. However, sometimes I jump into parts of it that look interesting. Today, we’ll see how to support multiple representations o"
date = "2026-06-22T22:00:00Z"
url = "https://entropicthoughts.com/sicp-2-4-tagged-data-in-haskell"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-06-29T12:19:24.017229933Z"
seen = false
+++

 I have a copy of SICP, or as it is also known, *The Wizard Book*. This book is widely praised, but I can’t take the time to work my way through all of it. However, sometimes I jump into parts of it that look interesting. Today, we’ll see how to support multiple representations of data through tagging.

 This article is written in Haskell throughout, but at the start it will look a lot like the Lisp code in SICP. I have intentionally tried to recreate the SICP solution as closely as possible, including dynamic typing and all. See the appendix if you’re curious how it works.

 Complex numbers can be stored in their rectangular form, where there’s a real and an imaginary part. They can also be stored in polar form, where there’s a magnitude and an angle. The authors ask us to imagine that two people have been working on a library for mathematics, but ended up choosing different ways to store complex numbers. How can they write their code so that they don’t have to agree on one way to store the data?

[(Continue reading the full article on the web.)](https://entropicthoughts.com/sicp-2-4-tagged-data-in-haskell)