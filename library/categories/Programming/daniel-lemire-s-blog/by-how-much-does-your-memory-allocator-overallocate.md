+++
title = "By how much does your memory allocator overallocate?"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/12/plot-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" loading="lazy"How'
date = "2025-12-30T19:15:55Z"
url = "https://lemire.me/blog/2025/12/30/by-how-much-does-your-memory-allocator-overallocates/"
author = "Daniel Lemire"
text = ""
lastupdated = "2026-03-19T16:26:22.815238766Z"
seen = true
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/12/plot-150x150.png" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" loading="lazy">

How much virtual memory does the following C++ expression allocate on the heap?

```
new char[4096]

```

The answer is *at least 4 kibibytes* but surely more.

Firstly, each heap memory allocation requires some memory to keep track of what has been allocated. You are likely using 8 bytes or so of overhead that your program cannot access.

Secondly, the memory allocator may allocate a bit more than the 4096 bytes you requested. On a Linux machine, I found that it would allocate 4104 bytes, so 8 extra bytes that are usable by your program. You can check this value by calling `malloc_usable_size` under Linux.

Thus, overall, you may end up with an extra 16 bytes allocated when you requested 4096 bytes. It is an overhead of about 0.4%. You are basically *wasting* a byte for every 256 bytes that you allocate.

But that is not the worst possible case. On macOS, let us consider the following line of code.

```
new char[3585]

```

The system reports an allocation of 4096 bytes: a 14% overhead. What is happening is that macOS rounds up the memory allocation to the nearest 512 byte boundary for moderately small allocations. If you try allocating even larger memory blocks, it starts rounding up even more.

[<img loading="lazy" decoding="async" class="alignnone size-full wp-image-22415" src="http://lemire.me/blog/wp-content/uploads/2025/12/plot.png" alt="" width="878" height="535" srcset="https://lemire.me/blog/wp-content/uploads/2025/12/plot.png 878w, https://lemire.me/blog/wp-content/uploads/2025/12/plot-300x183.png 300w, https://lemire.me/blog/wp-content/uploads/2025/12/plot-768x468.png 768w" sizes="auto, (max-width: 878px) 100vw, 878px">](http://lemire.me/blog/wp-content/uploads/2025/12/plot.png)