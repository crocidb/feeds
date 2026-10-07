+++
title = "Faster software linking with mold"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/10/Gemini_Generated_Image_8cr2v98cr2v98cr2-150x150.jpg" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" '
date = "2026-10-06T08:00:20Z"
url = "https://lemire.me/blog/2026/10/06/linking-node-js-with-mold/"
author = "Daniel Lemire"
text = ""
lastupdated = "2026-10-06T13:46:52.641668446Z"
seen = false
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2026/10/Gemini_Generated_Image_8cr2v98cr2v98cr2-150x150.jpg" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async">

When you build a program, the compiler turns each source file into an object file. Then a linker stitches all the object files and libraries into one executable.

On Linux, the default linker is usually GNU ld (also called bfd). The GNU binutils also ship gold, an alternative linker that was designed to be faster. Gold was built a Google and first made available in 2008.

The [mold](https://github.com/rui314/mold) linker is a newer linker written by Rui Ueyama, it was first released in 2021. It is meant as a drop-in replacement for GNU ld, and its main selling point is speed. The latest release is version 3.

How much faster is it on a large project? I built [Node.js](https://github.com/nodejs/node) from its main branch on an Intel Xeon Gold 6548N server (Emerald Rapids, two sockets, 64 cores and 128 threads) running Linux with GCC 14.3. The final `node` executable weighs about 160 MB.

I captured the command that links the `node` executable and ran it six times with each linker. I report the median.

|        linker         |time to link node|
|-----------------------|-----------------|
|   GNU ld (bfd) 2.41   |     2.52 s      |
|     GNU gold 2.41     |     1.46 s      |
| mold 3.0.0, 1 thread  |     0.49 s      |
| mold 3.0.0, 8 threads |     0.13 s      |
|mold 3.0.0, 128 threads|     0.11 s      |

[<img fetchpriority="high" decoding="async" src="https://lemire.me/blog/wp-content/uploads/2026/10/link_big4-1024x614.png" alt="" width="660" height="396" class="alignnone size-large wp-image-23023" srcset="https://lemire.me/blog/wp-content/uploads/2026/10/link_big4-1024x614.png 1024w, https://lemire.me/blog/wp-content/uploads/2026/10/link_big4-300x180.png 300w, https://lemire.me/blog/wp-content/uploads/2026/10/link_big4-768x461.png 768w, https://lemire.me/blog/wp-content/uploads/2026/10/link_big4.png 1050w" sizes="(max-width: 660px) 100vw, 660px">](https://lemire.me/blog/wp-content/uploads/2026/10/link_big4.png)

With multithreading, mold is about 24 times faster than GNU ld and about 14 times faster than gold.

Even if I restrict mold to a single thread, it links Node.js in half a second, five times faster than GNU ld. With only 8 threads, you get nearly all of the benefit.

Using mold is easy. You can pass `-fuse-ld=mold` to GCC or clang. Or you can wrap your whole build:

```
mold -run make -j128

```

The `-run` option intercepts every call to the default linker and redirects it to mold. You do not need to change the build scripts.

Of course, two seconds saved on a link does not matter much if you build Node.js once. But a developer who edits a file and rebuilds dozens of times a day pays the link cost each time. With mold, the link step becomes nearly free.

My scripts and raw results are [available](https://github.com/lemire/Code-used-on-Daniel-Lemire-s-blog/tree/master/2026/10/mold).