+++
title = "Data-directed programming in Haskell (SICP 2.4.3)"
description = " I have a copy of SICP, or as it is also known, The Wizard Book. This book is widely praised, but I can’t take the time to work my way through all of it. Instead, I’m going to occasionally jump into the parts of it that look interesting. Last week, we looked at tagged data in H"
date = "2026-06-29T22:00:00Z"
url = "https://entropicthoughts.com/sicp-2-4-data-directed-programming-in-haskell"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-07-01T13:54:26.095434935Z"
seen = true
+++

I have a copy of SICP, or as it is also known, *The Wizard Book*. This book is widely praised, but I can’t take the time to work my way through all of it. Instead, I’m going to occasionally jump into the parts of it that look interesting. Last week, we looked at tagged data in Haskell. The authors of SICP weren’t convinced that’s the best approach, so they move on to data-directed programming. We’ll do the same.

 Complex numbers can be stored in their rectangular form, with a real and an imaginary part. They can also be stored in polar form, where there’s a magnitude and an angle. Whichever way a complex number is stored, we would like to be able to query it for all of these four quantities:

* The real coordinate in the rectangular form of the complex number.
* The imaginary coordinate in the rectangular form.
* The magnitude in the polar form.
* The angle in the polar form.

[(Continue reading the full article on the web.)](https://entropicthoughts.com/sicp-2-4-data-directed-programming-in-haskell)