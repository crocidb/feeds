+++
title = "The Load-Bearing Vocabulary of Claude"
description = "Fun (but depressing?) data analysis project from Louis Abraham, showing how repetitive Claude is in the words it chooses when submitting GitHub pull requests. Abraham, in the project’s readme:GitHub pull request descriptions, grouped by the words they are written with rather "
date = "2026-08-27T21:09:42Z"
url = "https://louisabraham.github.io/load-bearing/"
author = "John Gruber"
text = ""
lastupdated = "2026-09-01T19:33:12.423193019Z"
seen = true
+++

Fun (but depressing?) data analysis project from Louis Abraham, showing how repetitive Claude is in the words it chooses when submitting GitHub pull requests. Abraham, in the project’s readme:

>
>
> GitHub pull request descriptions, grouped by the words they are written with rather than by anything they were told to look for: eight ways of writing, and every description belongs to one of them. One of the eight was 1.0% of the corpus at the start of 2025 and is 45% of it by the middle of 2026.
>
>

If you want to get a little more depressed, I’ve been doing deeper reading into AI watermarking research, and one of the admissions in [Google’s white paper on SynthID-Text](https://www.nature.com/articles/s41586-024-08025-4) — the watermarking scheme Anthropic says Claude is going to start using — is that the technique incurs “some reduction to inter-response diversity”. That means different answers to the same prompt become more similar to each other — there’s less variety to watermarked text responses. That’s a load-bearing problem given that Claude clearly already struggles in this regard *before* watermarking its output.

[ ★ ](https://daringfireball.net/linked/2026/08/27/the-load-bearing-vocabulary-of-claude)