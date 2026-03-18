+++
title = "A blog that is a single executable binary"
description = "Contents Introduction The code Running the sample blog Adding a new blog post to the sample blog How everything works   [The model and "
date = "2022-04-10T00:00:00Z"
url = "https://andreinc.net/2022/04/10/a-blog-that-is-a-single-executable-binary/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.197486939Z"
seen = false
+++

Contents
----------

* [Introduction](#introduction)
* [The code](#the-code)
* [Running the sample blog](#running-the-sample-blog)
* [Adding a new blog post to the sample blog](#adding-a-new-blog-post-to-the-sample-blog)
* [How everything works](#how-everything-works)
  * [The model and a neat pre-processor trick](#the-model-and-a-neat-pre-processor-trick)
  * [The server](#the-server)

* [Conclusions](#conclusions)
* [Discussion](#discussion)

Introduction
==========

Recently, while browsing [lobste.rs](https://lobste.rs/), I had the chance to stumble upon this beautiful [article](https://j3s.sh/thought/my-website-is-one-binary.html), titled: *my website is one binary*.

It was an idea crazy enough (in a positive way) to try it myself in C.

So, what if I wrote my own blogging “platform” (for lack of a more suitable term)? But, instead of outputting a static HTML site, my *platform* outputs a single **executable binary file** compatible with any \*Nix platform. There would be no HTML files, no other assets, just a piece of source code that gets recompiled each time I plan to update my “content”. Everything stays in memory, and my *site* is literally an executable.