---
title = "LaTeX, LLMs and Boring Technology"
description = "Depending on your particular use case, choosing boring technology is often a good idea. Recently, I've been thinking more and more about how the rise and increase in power of LLMs affects this choice.By definition, boring technology has been arou"
date = "2025-10-25T13:20:00Z"
url = "https://eli.thegreenplace.net/2025/latex-llms-and-boring-technology/"
author = "Eli Bendersky"
text = ""
lastupdated = "2025-10-26T00:44:06.313454762Z"
seen = true
---

Depending on your particular use case, [choosing boring technology](https://boringtechnology.club/) is often a good idea. Recently, I've been thinking more and more about how the rise and increase in power of LLMs affects this choice.

By definition, boring technology has been around for a long time. Piles of content have been written and produced about it: tutorials, books, videos, reference manuals, examples, blog posts and so on. All of this is consumed during the LLM training process, making LLMs better and better at reasoning about such technology.

Conversely, "shiny technology" is new, and has much less material available. As a result, LLMs won't be as familiar with it. This applies to many domains, but one specific example for me personally is in the context of LaTeX.

LaTeX certainly fits the "boring technology" bill. It's decades old, and has been the mainstay of academic writing since the 1980s. When I used it for the first time in 2002 (for a project report in my university AI class), it was already very old. But people keep working on it and fixing issues; it's easy to install and its wealth of capabilities and community size are staggering. Moreover, people keep working *with* it, producing more and more content and examples the LLMs can ingest and learn from.

I keep hearing about the advantages of new and shiny systems like Typst. However, with the help of LLMs, almost none of the advantages seem meaningful to me. LLMs are *great* at LaTeX and help a lot with learning or remembering the syntax, finding the right packages, deciphering errors and even generating tedious parts like tables and charts, significantly reducing the need for scripting [[1]](#footnote-1).

You can use LLMs either as standalone or fully integrated into your LaTeX environment; Overleaf has a built-in AI helper, and for local editing you can use VSCode plugins or other tools. I'm personally [content with TeXstudio](https://eli.thegreenplace.net/2025/notes-on-using-latex-to-generate-formulae/) and use LLMs as standalone help, but YMMV.

There are many examples where boring technology and LLMs go well together. The main criticism of boring technology is typically that it's "too big, full of cruft, difficult to understand". LLMs really help cutting through the learning curve though, and all that "cruft" is very likely to become useful some time in the future when you graduate from the basic use cases.

To be clear: Typst looks really cool, and kudos to the team behind it! All I'm saying in this post is that for me - personaly - the choice for now is to stick with LaTeX as a "boring technology".

Appendix: some examples of LLMs being helpful with LaTeX
----------

* For finding the right math symbols, I rarely need to scan reference materials any longer. LLMs will easily answer questions like "what's that squiggly Greek letter used in math, and its latex symbol?" or "write the latex for Green's theorem, integral form". For the trickiest / largest equations, LLMs are very good at "here's a picture I took of my equation, give me its latex code" these days [[2]](#footnote-2).

* "Here's a piece of code and the LaTeX error I'm getting on it; what's wrong?"

  This is made more ergonomic by editor integrations, but I personally find that LaTeX's error message problem is hugely overblown. 95% of the errors are reasonably clear, and serious sleuthing is only rarely required in practice. In that minority of cases, pasting some code and the error into a standalone LLM isn't a serious time drain.

* Generating TikZ diagrams and plots. For this, the hardest part is getting started and finding the right element names, and so on. It's very useful to just ask an LLM to emit something initial and then tweak it manually later, as needed. You can also ask the LLM to explain each thing it emits in detail - this is a great learning tool for deeper understanding.

  Recently I had luck going "meta" with this: when the diagram has repetitive elements, I may ask the LLM to "write a Python program that generates a TikZ diagram ...", and it works well.

* Generating and populating tables, and converting them from other data formats or screenshots.

* Help with formatting and typesetting (how do I change margins to XXX and spacing to YYY).

---

|[[1]](#footnote-reference-1)|When it comes to scripting, I generally prefer sticking to real programming languages anyway. If there's anything non-trivial to auto-generate I wouldn't use a LaTeX macro, but would write a Python program to generate whatever I need and embed it into the document with something like \\input{}.<br/><br/>Typst's scripting system may be marketed as "clean and powerful", but why learn yet another scripting language?|
|----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[2]](#footnote-reference-2)|Ignoring LaTeX's equation notation and doing their own thing is one of the biggest mistakes Typst makes, in my opinion. LaTeX's notation may not be perfect, but it's near universal at this point with support in almost all math-aware tools.<br/><br/>Typst's math mode is a clear sign of the second system effect, and isn't [even stable](https://laurmaedje.github.io/posts/math-mode-problem/).|
|----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|