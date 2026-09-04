+++
title = "Speed of random number generators in Go"
description = '<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/10/goo-150x150.jpg" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" loading="lazy" srcs'
date = "2025-10-15T22:18:33Z"
url = "https://lemire.me/blog/2025/10/15/speed-of-random-number-generators-in-go/"
author = "Daniel Lemire"
text = ""
lastupdated = "2026-03-19T16:26:22.847722825Z"
seen = true
+++

<img width="150" height="150" src="https://lemire.me/blog/wp-content/uploads/2025/10/goo-150x150.jpg" class="webfeedsFeaturedVisual wp-post-image" alt="" style="display: block; margin-bottom: 5px; clear:both;max-width: 100%;" link_thumbnail="" decoding="async" loading="lazy" srcset="https://lemire.me/blog/wp-content/uploads/2025/10/goo-150x150.jpg 150w, https://lemire.me/blog/wp-content/uploads/2025/10/goo-300x300.jpg 300w, https://lemire.me/blog/wp-content/uploads/2025/10/goo-768x768.jpg 768w, https://lemire.me/blog/wp-content/uploads/2025/10/goo.jpg 777w" sizes="auto, (max-width: 150px) 100vw, 150px">

We often need to generate random numbers in software. We need them for games, simulations, testing, and so forth. In many of these cases, we would like to use the fastest generator we can find, as long as it is reasonably random-looking.  
 In some instances, we need them for cryptography: we may need to generate a number that nobody else could guess. In these cases, performance is less of a concern.

In Go, the standard library offers a few options. The original math/rand package provides a fast but non-cryptographic generator, while crypto/rand delivers secure bits. Go 1.22 introduced math/rand/v2 with ChaCha8 and PCG options. ChaCha8 was designed by Daniel J. Bernstein, a famous cryptographer. PCG was created by a co-author of mine, Professor O’Neill from Harvey Mudd College. Her work on the PCG generator has been broadly adopted. The Go ChaCha8 implementation benefits from advanced optimizations: it is partly implemented in assembly. The PCG implementation is simpler, just a few Go functions.

[I benchmark how long it takes to generate a 64-bit word on Apple M4 and Intel Ice Lake processors using Go 1.24](https://github.com/lemire/Code-used-on-Daniel-Lemire-s-blog/tree/master/2025/10/15).

|      function      | Apple M4 |Intel Ice Lake|
|--------------------|----------|--------------|
|     math/rand      |  1.7 ns  |    5.8 ns    |
|  math/rand/v2 PCG  |**1.4 ns**|  **4.8 ns**  |
|math/rand/v2 ChaCha8|  2.6 ns  |    8.1 ns    |
|    crypto/rand     |  51 ns   |    518 ns    |

I find that O’Neill’s PCG is fastest in my tests. It is not cryptographically strong, but if you are using the random numbers for testing or simulation purposes, it should serve you well.