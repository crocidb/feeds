+++
title = "LLMs and almost good code"
description = " TL;DR: My new prior is that top-of-the-line LLMs working on easy tasks generate code that is maybe 10 % more complicated than necessary. I also think we accept this complexity too easily, because it comes from code that is right here, right now, solving an immediate proble"
date = "2026-06-08T22:00:00Z"
url = "https://entropicthoughts.com/llms-and-almost-good-code"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-06-10T21:35:35.933666829Z"
seen = true
+++

TL;DR: My new prior is that top-of-the-line LLMs working on *easy* tasks generate code that is maybe 10 % more complicated than necessary. I also think we accept this complexity too easily, because it comes from code that is *right here*, *right now*, solving an immediate problem. This may have consequences for maintenance in the long term.

 The background to this discovery was that I needed to do some CRUD plumbing in a work project. It was a simple change that mostly mirrored existing functionality. This is a perfect fit for LLMs, in my experience, so I used a frontier model to generate the code for it. The change ended up being a total of just over 200 lines, mostly additions.

 The part of the generated code we’ll talk about is a 24-line function that converts an arbitrary (user-supplied) string to a safe HTTP header value.

[(Continue reading the full article on the web.)](https://entropicthoughts.com/llms-and-almost-good-code)