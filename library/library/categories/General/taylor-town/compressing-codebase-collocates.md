+++
title = "Compressing Codebase Collocates"
description = 'Replacing collocates with simpler substitutes is intuitively called "compression".'
date = "2023-11-03T00:00:00Z"
url = "https://taylor.town/code-collocates"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.472988565Z"
seen = true
+++

A [collocate](https://en.wikipedia.org/wiki/Collocation) is a series of words that frequently occur together.

Fill in the blanks:

* torrential \_\_\_\_
* excruciating \_\_\_\_
* maiden \_\_\_\_
* teeming with \_\_\_\_
* resistance is \_\_\_\_
* thunderous \_\_\_\_
* suffered a crushing \_\_\_\_
* the archives are \_\_\_\_

Theoretical Information
----------

The following equation defines ["surprisal"](https://en.wikipedia.org/wiki/Information_content):

[![](https://wikimedia.org/api/rest_v1/media/math/render/svg/295f7cf4eb9ba42f609202e88c2425b633a5ba49) ](https://en.wikipedia.org/wiki/Quantities_of_information)

Collocates suggest improvements to a message's [average information content](https://en.wikipedia.org/wiki/Binary_entropy_function).

Replacing collocates with simpler substitutes is called ["compression"](https://en.wikipedia.org/wiki/Data_compression).

Abstractions
----------

Programmers compress code via abstractions. They pull out patterns and turn them into reusable templates.

Bad abstractions create distracting [compression artifacts](https://en.wikipedia.org/wiki/Compression_artifact) in the codebase. Beware programming patterns that are unrelated to the movement of data. Much of modern softare is built with useless superstitions.

Even "good" abstractions aren't free. Templates must be designed and defined and applied and remembered and maintained. If an abstraction isn't compressing your code, it's mere noise in your signal.

Carefully consider opportunity costs. Each abstraction creates artificial boundaries where other compression strategies might fare better.

Decompress, Recompress
----------

The most reliable way to escape local compression maxima is to decompress everything and then recompress.

In my personal experience, most codebases can easily shrink a hundredfold and speed up a thousandfold. Sometimes [much more](https://www.youtube.com/watch?v=hxM8QmyZXtg&list=PLEMXAbCVnmY6zCgpCFlgggRkrp0tpWfrn).

To decompress a codebase, inline its paths of execution. For example, rewrite each endpoint of a webserver with only standard library functions and simple database drivers. One can repeat the decompression process all the way to bedrock machine code, but most programs accrue diminishing returns before that point.

To compress a codebase, recursively replace collocates with equivalent ["zero-cost" abstractions](https://stackoverflow.com/questions/69178380/what-does-zero-cost-abstraction-mean). Don't try to outsmart yourself -- prioritize infrastructure for the most egregious repetition frictions of [digital desire paths](https://taylor.town/digital-desire-paths).

Brevity is a good indicator of compression, but sometimes counterproductive. When people rely on overly-specific mental models, the medicine becomes poison. Moving structures from git to wiki scatters information rather than compressing it. Onboarding processes are components of codebases. Secret truths are not [mutual information](https://en.wikipedia.org/wiki/Mutual_information).

Above all else, don't force it. Obvious improvements become invisible when implemented well. Decompress, recompress. Breathe. Decompress, recompress. Breathe. Decompress, recompress.