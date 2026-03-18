+++
title = "Rewriting"
description = "This weekend I started work on rewriting the static site generator that I use for this website, Aurora. I was looking over the codebase and wondered if I could make the code a bit more efficient and easier to understand. I had ideas for new abstractions – things I could do to red"
date = "2026-03-17T00:00:00Z"
url = "https://jamesg.blog/2026/03/17/rewriting"
author = "James' Coffee Blog"
text = ""
lastupdated = "2026-03-18T21:57:44.617244393Z"
seen = false
+++

This weekend I started work on rewriting the static site generator that I use for this website, [Aurora](https://github.com/capjamesg/aurora). I was looking over the codebase and wondered if I could make the code a bit more efficient and easier to understand. I had ideas for new abstractions – things I could do to reduce the amount of code needed.

One of the areas I wanted to improve on was the logic for generating category and date pages. The existing version of Aurora had large functions that generated these pages. This weekend I realised I could create what I have been thinking of as a “virtual page”, which is basically adding the category name to the list of templates to be generated with an identifier that the page is a category page.

While the rewrite doesn’t have several of the features in the current version – and for this reason, as well as incompatibilities with how templates are generated, I have not yet open sourced the code – the code works well for the use case I have in mind right now (this website!). Importantly, I had a lot of fun with the rewrite, challenging myself to figure out how to reduce the number of lines of code in the project while keeping the code clear.

This is the third time I have written a static site generator. Every time I have rewritten the code, my code has been shorter. I think it is because I understand the problem better every time I do a rewrite, and every time I come with new knowledge about programming.

Looking through the current Aurora codebase, I realised there were features I really like too: the hooks API that lets you “hook into” the generator and process templates with your own Python logic works well. In cases where I really liked how a feature was designed, I brought it into the new codebase.

On the topic of rewriting, a few weeks ago I removed almost 1,000 lines of code from the Artemis codebase by creating a better abstraction for forms. The codebase had a lot of repetitive code that came from copy-pasting form boilerplate; one abstraction allowed me to reduce a significant amount of repetition.

I don’t have a timeline for releasing an update to Aurora. This was more a project for me to practice my skills. I started with a few ideas that I wanted to explore and ended with implementations of those ideas. And: my new generator is now running this blog! If any pages don’t look right, please let me know.

[Aurora](https://github.com/capjamesg/aurora)