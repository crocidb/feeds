+++
title = "microKanren Reading"
description = "μKanren (“micro-Kanren”) is a tiny, embeddable logic programming language. It’s easy to understand and implement in almost any language. It’s a great case study of an embedded language: unlike other common “embedded” languages like SQL or regex, which normally are represented as "
date = "2022-07-04T00:00:00Z"
url = "https://lambdaland.org/posts/2022-07-04_kanren/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.284235939Z"
seen = false
+++

μKanren (“micro-Kanren”) is a tiny, embeddable logic programming language. It’s easy to understand and implement in almost any language. It’s a great case study of an embedded language: unlike other common “embedded” languages like SQL or regex, which normally are represented as just plain-old strings, μKanren takes more advantage of the host language’s features.

I recommend reading [the original paper](http://webyrd.net/scheme-2013/papers/HemannMuKanren2013.pdf): it’s short, well-written, and easy to understand.

I did a write-up which you can read [on Codeberg](https://codeberg.org/ashton314/microKanren). The README is my set of notes that I made while walking through the implementation of the paper, and the repository contains an implementation in [Racket](https://racket-lang.org). I’ve included some fun use cases like a type checker/inference engine that takes up only 37 lines of code!

It’s a fun little language, and I might be able to use it at work soon actually. It’s definitely specialized for solving a particular class of problem, but you might be surprised how many things fall into that category. Have you used μKanren? [Drop me a line](/about/#contact)—I’d love to hear about it!