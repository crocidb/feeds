---
title = "Only 1% of Software Benefits from SIMD Instructions"
description = "David Patterson) had recently mentioned that (rephrasing):The programmers may benefit from using complex instruction sets directly, but it is increasingly challenging f"
date = "2021-11-21T00:00:00Z"
url = "https://ashvardanian.com/posts/simd-popularity/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.380737094Z"
seen = true
---

[David Patterson](https://en.wikipedia.org/wiki/David_Patterson_(computer_scientist)) had recently [mentioned](https://youtu.be/naed4C4hfAg?t=1500) that (rephrasing):

>
>
> The programmers may benefit from using complex instruction sets directly, but it is increasingly challenging for compilers to automatically generate them in the right spots.
>
>

In the last 3-4 years I gave a [bunch of talks](https://ashvardanian.com/lectures) on the intricacies of SIMD programming, highlighting the divergence in hardware and software design in the past ten years. Chips are becoming bigger and more complicated to add more functionality, but the general-purpose compilers like GCC, LLVM, MSVC and ICC cannot keep up with the pace. Hardly any developer codes in Assembly today, hoping that the compiler will do the heavy lifting.