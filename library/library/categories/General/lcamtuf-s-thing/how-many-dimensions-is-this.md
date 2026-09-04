---
title = "How many dimensions is this?"
description = "A degree in mathematics might not save you from stacking boxes for a living."
date = "2025-09-03T16:20:42Z"
url = "https://lcamtuf.substack.com/p/how-many-dimensions-is-this"
author = "lcamtuf"
text = ""
lastupdated = "2025-10-22T08:57:30.076801732Z"
seen = true
---

In the past couple of weeks, I’ve been posting about seemingly simple mathematical problems that defy intuition, and where the answers we find on the internet turn out to be shallow or hard to parse. For a taste, you might enjoy the articles on [Gödel’s beavers](https://lcamtuf.substack.com/p/monkeys-typewriters-and-busy-beavers) or on [infinite decimals.](https://lcamtuf.substack.com/p/09999-1)

Today, let’s continue by asking a simple question: how many dimensions does a line have? A trained mathematician might blurt out an answer involving vector spaces or open set coverings, but there’s no fun in that. Instead, let’s take the scenic route.

### The “container” dimension ###

What does it mean for a *space* to have a certain number of dimensions? Informally, we could say that a dimension is an independent axis along which we can position a geometric object. In one-dimensional space, a point can only be moved along a single track. In 2D, we typically talk of two orthogonal axes, *x* and *y.* In three dimensions, we have *x, y*, and *z.* There’s more nuance to certain exotic or stripped-down (topological) spaces, but we don’t need to go into any of that.

The definition lends itself to a simple, common-sense way to classify the dimensionality of geometric shapes: we can look at the minimum number of spatial dimensions required to contain the object in question. A pencil sketch fits on a piece of paper, so it’s two-dimensional; a rock in your hand is 3D.

[

<img src="https://substackcdn.com/image/fetch/$s_!69O0!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F45b6445d-d83b-4cb7-921c-9b8ef8266f92_2561x1124.png" width="1456" height="639" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/45b6445d-d83b-4cb7-921c-9b8ef8266f92_2561x1124.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:639,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:197275,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:false,&quot;topImage&quot;:true,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/172288329?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F45b6445d-d83b-4cb7-921c-9b8ef8266f92_2561x1124.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!69O0!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F45b6445d-d83b-4cb7-921c-9b8ef8266f92_2561x1124.png 424w, https://substackcdn.com/image/fetch/$s_!69O0!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F45b6445d-d83b-4cb7-921c-9b8ef8266f92_2561x1124.png 848w, https://substackcdn.com/image/fetch/$s_!69O0!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F45b6445d-d83b-4cb7-921c-9b8ef8266f92_2561x1124.png 1272w, https://substackcdn.com/image/fetch/$s_!69O0!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F45b6445d-d83b-4cb7-921c-9b8ef8266f92_2561x1124.png 1456w" sizes="100vw" fetchpriority="high">

](https://substackcdn.com/image/fetch/$s_!69O0!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/45b6445d-d83b-4cb7-921c-9b8ef8266f92_2561x1124.png)*The simplest way to define the dimensionality of a shape.*

Yet, this common-sense definition is unsatisfying if we consider that a lower-dimensional object might end up straddling a higher-dimensional space. If a line segment is rotated or bent, does that make it 2D? Or is that object forever one-dimensional, somehow retaining the memory of its original orientation and curvature?

[

<img src="https://substackcdn.com/image/fetch/$s_!ALjZ!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F4e98cb44-e852-4c44-ad53-623e6e8e92d6_2494x820.png" width="1456" height="479" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/4e98cb44-e852-4c44-ad53-623e6e8e92d6_2494x820.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:479,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:92046,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:false,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/172288329?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F4e98cb44-e852-4c44-ad53-623e6e8e92d6_2494x820.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!ALjZ!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F4e98cb44-e852-4c44-ad53-623e6e8e92d6_2494x820.png 424w, https://substackcdn.com/image/fetch/$s_!ALjZ!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F4e98cb44-e852-4c44-ad53-623e6e8e92d6_2494x820.png 848w, https://substackcdn.com/image/fetch/$s_!ALjZ!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F4e98cb44-e852-4c44-ad53-623e6e8e92d6_2494x820.png 1272w, https://substackcdn.com/image/fetch/$s_!ALjZ!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F4e98cb44-e852-4c44-ad53-623e6e8e92d6_2494x820.png 1456w" sizes="100vw">

](https://substackcdn.com/image/fetch/$s_!ALjZ!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/4e98cb44-e852-4c44-ad53-623e6e8e92d6_2494x820.png)*One dimension or two?*

We could argue either way, but no matter which option we choose, the answer doesn’t feel particularly principled. This tells us to look for a more substantive approach somewhere else.

### The “degrees-of-freedom” dimension ###

To make progress, we can flip the script: instead of trying to contain the object within an *n-*dimensional space, we can analyze the dimensionality of the space *within* (or “under”) the object itself.

Informally, the space under the earlier squiggles is one-dimensional. It’s a conga line of points; you can only move toward the front or the back. In contrast, the space under a disk (a filled circle) accommodates two-dimensional geometry:

[

<img src="https://substackcdn.com/image/fetch/$s_!Az47!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F06b87337-c54a-4ad2-8435-40f1144e29f6_1899x1142.png" width="1456" height="876" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/06b87337-c54a-4ad2-8435-40f1144e29f6_1899x1142.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:876,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:140964,&quot;alt&quot;:&quot;&quot;,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/172288329?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F06b87337-c54a-4ad2-8435-40f1144e29f6_1899x1142.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" title="" srcset="https://substackcdn.com/image/fetch/$s_!Az47!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F06b87337-c54a-4ad2-8435-40f1144e29f6_1899x1142.png 424w, https://substackcdn.com/image/fetch/$s_!Az47!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F06b87337-c54a-4ad2-8435-40f1144e29f6_1899x1142.png 848w, https://substackcdn.com/image/fetch/$s_!Az47!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F06b87337-c54a-4ad2-8435-40f1144e29f6_1899x1142.png 1272w, https://substackcdn.com/image/fetch/$s_!Az47!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F06b87337-c54a-4ad2-8435-40f1144e29f6_1899x1142.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!Az47!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/06b87337-c54a-4ad2-8435-40f1144e29f6_1899x1142.png)*Two types of two-dimensionality.*

A simple and slightly less hand-wavy geometric test to distinguish between these cases is to pick an origin point within the shape and see how many degrees of freedom we have:

[

<img src="https://substackcdn.com/image/fetch/$s_!nmsa!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F21a85ff6-6abf-4e67-8bc3-7fcebb7d3a26_1691x822.png" width="1456" height="708" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/21a85ff6-6abf-4e67-8bc3-7fcebb7d3a26_1691x822.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:708,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:86602,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/172288329?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F21a85ff6-6abf-4e67-8bc3-7fcebb7d3a26_1691x822.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!nmsa!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F21a85ff6-6abf-4e67-8bc3-7fcebb7d3a26_1691x822.png 424w, https://substackcdn.com/image/fetch/$s_!nmsa!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F21a85ff6-6abf-4e67-8bc3-7fcebb7d3a26_1691x822.png 848w, https://substackcdn.com/image/fetch/$s_!nmsa!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F21a85ff6-6abf-4e67-8bc3-7fcebb7d3a26_1691x822.png 1272w, https://substackcdn.com/image/fetch/$s_!nmsa!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F21a85ff6-6abf-4e67-8bc3-7fcebb7d3a26_1691x822.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!nmsa!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/21a85ff6-6abf-4e67-8bc3-7fcebb7d3a26_1691x822.png)*The degrees-of-freedom model of dimensionality.*

Equivalently, we can ask how many different coordinates are needed to provide unambiguous “directions” from some chosen point A to B. If the points lie on a curve, a single value should do. On the surface of a filled square, we seemingly need two offsets: horizontal and vertical.

This might sound clever — and indeed, it’s clever enough to be sometimes taught in school. But then, consider the following shape:

[

<img src="https://substackcdn.com/image/fetch/$s_!8HwH!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F6ae0fc04-6e58-4fe8-ae69-a143cacce160_1718x1022.png" width="1456" height="866" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/6ae0fc04-6e58-4fe8-ae69-a143cacce160_1718x1022.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:866,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:112046,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/172288329?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F6ae0fc04-6e58-4fe8-ae69-a143cacce160_1718x1022.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!8HwH!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F6ae0fc04-6e58-4fe8-ae69-a143cacce160_1718x1022.png 424w, https://substackcdn.com/image/fetch/$s_!8HwH!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F6ae0fc04-6e58-4fe8-ae69-a143cacce160_1718x1022.png 848w, https://substackcdn.com/image/fetch/$s_!8HwH!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F6ae0fc04-6e58-4fe8-ae69-a143cacce160_1718x1022.png 1272w, https://substackcdn.com/image/fetch/$s_!8HwH!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F6ae0fc04-6e58-4fe8-ae69-a143cacce160_1718x1022.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!8HwH!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/6ae0fc04-6e58-4fe8-ae69-a143cacce160_1718x1022.png)*The ambiguity of the DOF approach.*

Depending on the chosen origin, we get different results. Across the limbs, we rack up an infinite number of 1-DOF readings; but there’s also a single 2-DOF reading at the center of the shape.

In other words, we need to amend our definition to resolve the ambiguity. If we let the peak value prevail, the shape must be declared two-dimensional, despite not really filling a 2D space. If we use the average value, we get a more logical result: it’s infinitely many 1-DOFs versus a singular 2-DOF, so the average is exactly 1D. We reach the same conclusion if we categorically exclude singularities. The day is saved… or so one would hope.

### Space-filling curveballs ###

In the previous section, we tried to draw a fundamental distinction between one-dimensional curves and shapes that fill higher-dimensional spaces. The good news is that the resulting model is pretty neat. The bad news is that the distinction isn’t as fundamental as we hope.

Consider the Hilbert curve:

[

<img src="https://substackcdn.com/image/fetch/$s_!7WDH!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3cb90002-dc27-4fb9-a977-1bce716cbb3c_3256x2268.png" width="1456" height="1014" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/3cb90002-dc27-4fb9-a977-1bce716cbb3c_3256x2268.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:1014,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:466073,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/172288329?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3cb90002-dc27-4fb9-a977-1bce716cbb3c_3256x2268.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!7WDH!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3cb90002-dc27-4fb9-a977-1bce716cbb3c_3256x2268.png 424w, https://substackcdn.com/image/fetch/$s_!7WDH!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3cb90002-dc27-4fb9-a977-1bce716cbb3c_3256x2268.png 848w, https://substackcdn.com/image/fetch/$s_!7WDH!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3cb90002-dc27-4fb9-a977-1bce716cbb3c_3256x2268.png 1272w, https://substackcdn.com/image/fetch/$s_!7WDH!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3cb90002-dc27-4fb9-a977-1bce716cbb3c_3256x2268.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!7WDH!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/3cb90002-dc27-4fb9-a977-1bce716cbb3c_3256x2268.png)*The construction of the Hilbert curve.*

The shape is constructed iteratively. We start by dividing the unit square into quadrants, then connect the centers of each quadrant to form a horseshoe-like curve (top, left). Next, we tile four scaled copies of the pattern, with the bottom two images rotated 90° CW and CCW (top, center). After that, we add three line segments that connect the tiled copies (top, right) back into a single curve. Finally, we use this new curve in lieu of the original horseshoe pattern as we repeat the tile-and-connect process (bottom row).

Each iteration halves the spacing between the segments of the curve (and between the curve and the perimeter of the unit square). It follows that if we iterate forever, the gaps are reduced to zero and the curve crosses through each and every point within its build envelope.

By construction, the shape is a one-dimensional curve; any point along it can be unambiguously described by a single coordinate. By the final appearance, however, the curve is indistinguishable from a filled square: it wholly covers a two-dimensional region without leaving any gaps. In fact, the Hilbert curve forms a wonderfully counterintuitive *mapping* from 1D to 2D. The approach can be extended to higher dimensions, hinting at a peculiar, partial equivalence between 1- and *n*-dimensional spaces.

So… how do we develop a dimensionality model that seamlessly accounts for that kind of an object — or for other unusual, fractal shapes?

### Enter Mr. Minkowski ###

There are several ways to answer this question, but by far the most intuitive is the approach outlined by Hermann Minkowski. The method is quite brilliant, so it’s a shame that it’s typically presented on the internet without explaining *why* it works.

To get started, imagine a two-dimensional, square measurement grid spanning *s* = 10 cells horizontally (and the same number vertically). On that grid, we place the shape to be measured, and then count the number of cells (“boxes”) that need to be filled to completely cover the shape. For a simple line segment, we might get:

[

<img src="https://substackcdn.com/image/fetch/$s_!cnBG!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F461ad9c2-4396-4ff6-89cc-73d4bae471e5_3185x1203.png" width="1456" height="550" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/461ad9c2-4396-4ff6-89cc-73d4bae471e5_3185x1203.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:550,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:421614,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/172288329?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F461ad9c2-4396-4ff6-89cc-73d4bae471e5_3185x1203.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!cnBG!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F461ad9c2-4396-4ff6-89cc-73d4bae471e5_3185x1203.png 424w, https://substackcdn.com/image/fetch/$s_!cnBG!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F461ad9c2-4396-4ff6-89cc-73d4bae471e5_3185x1203.png 848w, https://substackcdn.com/image/fetch/$s_!cnBG!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F461ad9c2-4396-4ff6-89cc-73d4bae471e5_3185x1203.png 1272w, https://substackcdn.com/image/fetch/$s_!cnBG!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F461ad9c2-4396-4ff6-89cc-73d4bae471e5_3185x1203.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!cnBG!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/461ad9c2-4396-4ff6-89cc-73d4bae471e5_3185x1203.png)*Covering a one-dimensional shape.*

For now, pay no mind to errors that might be introduced if the grid is too coarse; let’s assume that the resolution is high enough to capture the shape with reasonable fidelity.

With this assumption in mind, if we were to switch to a finer s = 20 grid, the number of filled cells would obviously double. We can generalize this by saying that for any one-dimensional shape, at a sufficient grid resolution, the required number of boxes (*N*) is:

Again, *N* is the box count and *s* is the “resolution” of the grid. As for the new constant *C*, it’s just a property of the measured object and its placement on the grid. In the example above, *C* = 0.6. For different line segment, we would get another number — but it’s always just a constant independent of *s.*

Now, let’s try to cover a two-dimensional filled square:

[

<img src="https://substackcdn.com/image/fetch/$s_!piKQ!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fa278dcf5-511b-4f5d-9629-36fd67b21f5f_3185x1203.png" width="1456" height="550" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/a278dcf5-511b-4f5d-9629-36fd67b21f5f_3185x1203.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:550,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:508438,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/172288329?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fa278dcf5-511b-4f5d-9629-36fd67b21f5f_3185x1203.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!piKQ!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fa278dcf5-511b-4f5d-9629-36fd67b21f5f_3185x1203.png 424w, https://substackcdn.com/image/fetch/$s_!piKQ!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fa278dcf5-511b-4f5d-9629-36fd67b21f5f_3185x1203.png 848w, https://substackcdn.com/image/fetch/$s_!piKQ!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fa278dcf5-511b-4f5d-9629-36fd67b21f5f_3185x1203.png 1272w, https://substackcdn.com/image/fetch/$s_!piKQ!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fa278dcf5-511b-4f5d-9629-36fd67b21f5f_3185x1203.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!piKQ!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/a278dcf5-511b-4f5d-9629-36fd67b21f5f_3185x1203.png)*Box-counting a filled square.*

In this case, we’re essentially using boxes to measure area; the area is proportional to the *square* of edge length. We need *N* = 36 boxes for the pictured *s = 10* grid; if we double the resolution to *s = 20*, the required cover increases four-fold (*N* = 144).

Once again, we can generalize this by saying that the cover for a two-dimensional shape is always:

As before, *C* is an object-specific constant; for the square above, it happens to be 0.36. We’d get a different number for a disk, but the area of a disk still scales with the square of its size.

The same relationship holds true for higher-dimensional objects: the volume of a cube is proportional to the cube of the length of its sides, and so forth. If *d* is the “space-filling” dimension of the shape in question, the number of boxes should be:

If we’re given the box count for an arbitrary shape and want to solve for *d*, we first gotta rearrange the equation: *s<sup>d </sup>≈ N/C*. Next, we need an operation that’s the inverse of exponentiation. Specifically, we need a logarithm, which gives us the exponent for a known base:

For exponentiation, we have a number of familiar rules that let us simplify equations; for example, we know that *x<sup>a </sup>· x<sup>b </sup>= x<sup>a+b</sup>*. There are very similar, albeit oft-forgotten, rules for logarithms; in particular, *log<sub>a</sub>(b)* can be rewritten as *log(b)/log(a).* This allows us to tidy up the earlier equation, getting rid of the non-standard logarithm base of *s:*

Further, we can split out the division by *C* because *log(a/b) = log(a) - log(b)*:

We have previously remarked that using a coarse grid introduces measurement errors; because of this, we want the number of cells to be as high as possible. In mathematical terms, we want *s* to “tend to infinity”.

Under such an assumption, the second term of the equation — a fraction involving a finite constant *C* divided by an infinity-bound number — becomes infinitesimal. In other words, for the hypothetical *s → ∞* endgame, term can be ignored. The position and the rough outline of the measured object no longer matters; the expression simplifies to:

This is the definition of the Minkowski dimension.

Some sources use the size of a single box (ε) instead of the resolution of the measurement grid (*s*). In that case, the formula can be restated as:

### So, what do you do with that? ###

Well, for many shapes — even bizarre ones — we can intuitively reason about the relation between grid size and *N*. For example, for the Hilbert curve, the box-counting dimension is pretty evidently equal to 2. In contrast to the DOF approach, we don’t get different results depending on how we *think* about the shape.

In other instances, we can use a computer to approximate the value. The machine can simply count the boxes using an increasingly fine grid until the readings converge to a stable value. Heck, this technique can even estimate the dimensionality of complex real-world shapes, such as coastlines.

But here’s the kicker: for many fractal shapes, the box-counting dimension is not a whole number! For example, the [Sierpiński triangle](https://lcamtuf.substack.com/p/sierpinski-triangle-in-my-bitwise) has a *d<sub>box </sub>*≈ 1.6. The result makes sense: the fractal is a Swiss-cheese triangle that clearly fills space better than a straight line, but worse than any triangle without a pattern of infinitely many holes.

[

<img src="https://substackcdn.com/image/fetch/$s_!lbsL!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F308d1d55-6ae6-41d5-aff0-710132bd053d_4696x1581.png" width="1456" height="490" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/308d1d55-6ae6-41d5-aff0-710132bd053d_4696x1581.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:490,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:403651,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/172288329?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F308d1d55-6ae6-41d5-aff0-710132bd053d_4696x1581.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!lbsL!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F308d1d55-6ae6-41d5-aff0-710132bd053d_4696x1581.png 424w, https://substackcdn.com/image/fetch/$s_!lbsL!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F308d1d55-6ae6-41d5-aff0-710132bd053d_4696x1581.png 848w, https://substackcdn.com/image/fetch/$s_!lbsL!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F308d1d55-6ae6-41d5-aff0-710132bd053d_4696x1581.png 1272w, https://substackcdn.com/image/fetch/$s_!lbsL!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F308d1d55-6ae6-41d5-aff0-710132bd053d_4696x1581.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!lbsL!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/308d1d55-6ae6-41d5-aff0-710132bd053d_4696x1581.png)*The first steps of constructing the Sierpiński triangle.*

In fact, these measurements give us a proper hierarchy; we can sort arbitrarily complex objects based on their space-filling ability. It’s quite beautiful: we started with mushy intuition, and ended up with a new way to think about geometry.

---

*If you liked the content, please subscribe; there’s no better way to stay in touch with the writers you like.*

[Subscribe now](https://lcamtuf.substack.com/subscribe?)