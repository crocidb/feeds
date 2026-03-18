+++
title = "Hash, displace, and compress: Perfect hashing with Java"
description = "This article explains a straightforward approach for generating Perfect Hash Functions, and using them in tandem with a Map<K,Vimplementation called ReadOnlyMap<K,V. It assumes the reader is already familiar with concepts like hash functions and hash tables. If you w"
date = "2022-03-15T00:00:00Z"
url = "https://andreinc.net/2022/03/15/hash-displace-and-compress-perfect-hashing-with-java/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.202663036Z"
seen = false
+++

>
>
> This article explains a straightforward approach for generating *Perfect Hash Functions*, and using them in tandem with a `Map<K,V>` implementation called `ReadOnlyMap<K,V>`. It assumes the reader is already familiar with concepts like hash functions and hash tables. If you want to refresh your knowledge on these two topics, I recommend you read some of my previous articles: [Implementing Hash Tables in C](./2021/10/02/implementing-hash-tables-in-c-part-1) and [A tale of Java Hash Tables](./2021/11/08/a-tale-of-java-hash-tables).
>
>

A *Perfect Hash Function* (PHF), $H$, is a *hash function* that maps distinct elements from a set $S$ to a range of integer values $[0, 1, ….]$ so that there are absolutely no collisions. In mathematical terms, $H$ is injective. This means that for any $x\_{1}, x\_{2} \\in S$, if $H(x\_{1}) = H(x\_{2})$ we can confidently say $x\_{1} = x\_{2}$. The contrapositive argument is also true: if $x\_{1} \\neq x\_{2}$, then $H(x\_{1}) \\neq H(x\_{2})$.