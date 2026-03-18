+++
title = "On implementing Bloom Filters in C"
description = "This article assumes the reader is already familiar with the C programming language and some basic concepts concerning hash functions. The target audience (as is often the case on my blog) is undergrad CS students or seasoned developers who, just like me, haven’t learned about Bl"
date = "2022-03-15T00:00:00Z"
url = "https://andreinc.net/2022/03/15/on-implementing-bloom-filters-in-c/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.205347532Z"
seen = false
+++

This article assumes the reader is already familiar with the C programming language and some basic concepts concerning hash functions. The target audience (as is often the case on my blog) is undergrad CS students or seasoned developers who, just like me, haven’t learned about Bloom Filters during their University years.

Introduction
==========

>
>
> If you just want to jump directly into the code, check out [this repository](https://github.com/nomemory/bloomfilters-c).
>
>

As [Wikipedia states](https://en.wikipedia.org/wiki/Bloom_filter), *Bloom Filters* are space-efficient, probabilistic data structures, conceived by Burton Howard Bloom in 1970, used to test whether an element is a member of a set or not. What I find peculiar is that the real Mr. Burton Howard Bloom doesn’t have a wiki page, while the imaginary [Mr. Leopold Bloom](https://en.wikipedia.org/wiki/Leopold_Bloom) has one.