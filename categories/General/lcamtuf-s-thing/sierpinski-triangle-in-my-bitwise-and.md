---
title = "Sierpiński triangle? In my bitwise AND?"
description = "Exploring a peculiar bit-twiddling hack at the intersection of 1980s geek sensibilities."
date = "2025-05-10T21:06:25Z"
url = "https://lcamtuf.substack.com/p/sierpinski-triangle-in-my-bitwise"
author = "lcamtuf"
text = ""
lastupdated = "2025-10-22T08:57:30.118150689Z"
seen = true
---

I’m an [ethusiastic promoter](https://lcamtuf.substack.com/p/getting-silly-with-c-part-void2) of the C language. One of the outmoded cultural phenomena associated with C are *bit-twiddling hacks*: a collection of brain-teasers that implement improbably complex algorithms using bitwise arithmetic. They are often developed under the guise of code optimization, but they mostly serve to impress your friends and confuse enemies.

I have also [previously written](https://lcamtuf.substack.com/p/you-cant-handle-the-buddhabrot) about fractals; they’re pieces of mathematical curiosa that enjoyed a near-mythical status in 1980s, but are no longer talked about in polite company. One of the better-known fractals is the Sierpiński triangle. It is constructed by taking an ordinary (filled) triangle and then successively removing middle one-fourths from what’s left:

[

<img src="https://substackcdn.com/image/fetch/$s_!x9xL!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fede9de9d-e511-43f2-98e8-4519bd8f5ca5_4696x1581.png" width="1456" height="490" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/ede9de9d-e511-43f2-98e8-4519bd8f5ca5_4696x1581.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:490,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:403651,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:false,&quot;topImage&quot;:true,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/163283294?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fede9de9d-e511-43f2-98e8-4519bd8f5ca5_4696x1581.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!x9xL!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fede9de9d-e511-43f2-98e8-4519bd8f5ca5_4696x1581.png 424w, https://substackcdn.com/image/fetch/$s_!x9xL!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fede9de9d-e511-43f2-98e8-4519bd8f5ca5_4696x1581.png 848w, https://substackcdn.com/image/fetch/$s_!x9xL!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fede9de9d-e511-43f2-98e8-4519bd8f5ca5_4696x1581.png 1272w, https://substackcdn.com/image/fetch/$s_!x9xL!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fede9de9d-e511-43f2-98e8-4519bd8f5ca5_4696x1581.png 1456w" sizes="100vw" fetchpriority="high">

](https://substackcdn.com/image/fetch/$s_!x9xL!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/ede9de9d-e511-43f2-98e8-4519bd8f5ca5_4696x1581.png)*The first steps of building the Sierpiński triangle.*

The fractal has some interesting properties; most notably, the surface area decreases by 25% in each iteration while the perimeter increases by 50%, so the respective values are trending to 0 and ∞. This is despite the figure retaining the same overall footprint as the starting triangle.

Anyway — there is this astonishingly simple bit-twiddling hack that *somehow* produces the Sierpiński triangle ([demo](https://godbolt.org/z/KbMqba9vY)):

>
>
> ```
> #include <stdint.h>
> #include <stdio.h>
>
> #define LEN (1 << 6)
>
> int main() {
>   for (uint32_t y = 0; y < LEN; y++) {
>     for (uint32_t x = 0; x < LEN; x++)
>       printf((x & y) ? "  " : "MM");
>     putchar('\n');
>   }
> }
> ```
>
>

In essence, we iterate over a pair of integer coordinates, *x* and *y*, and then color each cell depending on whether bitwise *x & y* is zero or non-zero. That’s it! For a pair of counters running from 0 to 63, the result is this:

[

<img src="https://substackcdn.com/image/fetch/$s_!6uly!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb5966474-26ed-489d-9c51-791306afde91_2031x1875.png" width="1456" height="1344" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/b5966474-26ed-489d-9c51-791306afde91_2031x1875.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:1344,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:52571,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:false,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/163283294?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb5966474-26ed-489d-9c51-791306afde91_2031x1875.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!6uly!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb5966474-26ed-489d-9c51-791306afde91_2031x1875.png 424w, https://substackcdn.com/image/fetch/$s_!6uly!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb5966474-26ed-489d-9c51-791306afde91_2031x1875.png 848w, https://substackcdn.com/image/fetch/$s_!6uly!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb5966474-26ed-489d-9c51-791306afde91_2031x1875.png 1272w, https://substackcdn.com/image/fetch/$s_!6uly!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb5966474-26ed-489d-9c51-791306afde91_2031x1875.png 1456w" sizes="100vw">

](https://substackcdn.com/image/fetch/$s_!6uly!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/b5966474-26ed-489d-9c51-791306afde91_2031x1875.png)*What.*

Increasing the range of the counters adds more detail, producing a finer-grained fractal with more and more nested triangles. But… why?

A hand-wavy explanation is that the bit-twiddling part is mostly a red herring. There’s nothing clever about bitwise AND; the magic is the positional numeral system! If we visualize the process of counting from 0 to 63 in binary, we get the following bit pattern:

[

<img src="https://substackcdn.com/image/fetch/$s_!0FM0!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F144b9b38-0a23-4fe0-b191-97788189cc1d_2031x625.png" width="1456" height="448" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/144b9b38-0a23-4fe0-b191-97788189cc1d_2031x625.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:448,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:21697,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/163283294?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F144b9b38-0a23-4fe0-b191-97788189cc1d_2031x625.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!0FM0!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F144b9b38-0a23-4fe0-b191-97788189cc1d_2031x625.png 424w, https://substackcdn.com/image/fetch/$s_!0FM0!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F144b9b38-0a23-4fe0-b191-97788189cc1d_2031x625.png 848w, https://substackcdn.com/image/fetch/$s_!0FM0!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F144b9b38-0a23-4fe0-b191-97788189cc1d_2031x625.png 1272w, https://substackcdn.com/image/fetch/$s_!0FM0!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F144b9b38-0a23-4fe0-b191-97788189cc1d_2031x625.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!0FM0!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/144b9b38-0a23-4fe0-b191-97788189cc1d_2031x625.png)*Binary count from 0 to 63 (left to right).*

The value of the least significant bit is toggling with every tick, the next bit is flipping back and forth at half the frequency, and so on. This can be thought as a fractal pattern in itself: as we increase the size of the counter, the visualization acquires more and more self-similar detail, with no hard limit in sight. In fact, if you squint your eyes, the pattern does look a bit like a succession of somewhat squished (log-scale) triangles.

For a more precise tie-in to the Sierpiński shape, we do need to peek under the hood of the *x & y* operation. We’re calculating a bitwise AND of two counters, but what is the result of that?

Well, it’s sufficient for any bit of *x & y* to be set to satisfy the condition in the program, so let’s start by looking at the MSB. If you’re used to binary numbers, it should be obvious that in our 6-bit (64-value) case, the most significant bit of the x coordinate will be zero for all values less than 32, and one for all values equal to or above that threshold:

This divides the x axis into two halves; the same is true for the y coordinate, so we end up with four quadrants in the two-dimensional plot. Only in the bottom right quadrant (32x32 cells), both of the MSBs are set:

In other words, plotting the MSB of *x & y* nets us the following:

[

<img src="https://substackcdn.com/image/fetch/$s_!tJaP!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd65be3b4-89aa-419f-9a75-85ec88cdd446_2031x1875.png" width="1456" height="1344" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/d65be3b4-89aa-419f-9a75-85ec88cdd446_2031x1875.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:1344,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:52976,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/163283294?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd65be3b4-89aa-419f-9a75-85ec88cdd446_2031x1875.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!tJaP!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd65be3b4-89aa-419f-9a75-85ec88cdd446_2031x1875.png 424w, https://substackcdn.com/image/fetch/$s_!tJaP!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd65be3b4-89aa-419f-9a75-85ec88cdd446_2031x1875.png 848w, https://substackcdn.com/image/fetch/$s_!tJaP!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd65be3b4-89aa-419f-9a75-85ec88cdd446_2031x1875.png 1272w, https://substackcdn.com/image/fetch/$s_!tJaP!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fd65be3b4-89aa-419f-9a75-85ec88cdd446_2031x1875.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!tJaP!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/d65be3b4-89aa-419f-9a75-85ec88cdd446_2031x1875.png)*Plotting the value of the MSB of x & y.*

Next, let’s have a look at the second most significant bit (#4). The value cycles at twice the frequency of the MSB, wrapping around in the middle. The same is happening in the y axis. In effect, we get the same pattern as before, but tiled twice in each axis:

In other words, the operation sets the bottom right sub-quadrants of every original quadrant.

The following visualization shows the regions where bit #4 of *x & y* is set. These regions are superimposed on top of the previously-calculated layout for the MSB:

[

<img src="https://substackcdn.com/image/fetch/$s_!mRiN!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F78c51bd4-a896-4295-9344-eb939f85c07d_2031x1875.png" width="1456" height="1344" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/78c51bd4-a896-4295-9344-eb939f85c07d_2031x1875.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:1344,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:53460,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/163283294?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F78c51bd4-a896-4295-9344-eb939f85c07d_2031x1875.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!mRiN!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F78c51bd4-a896-4295-9344-eb939f85c07d_2031x1875.png 424w, https://substackcdn.com/image/fetch/$s_!mRiN!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F78c51bd4-a896-4295-9344-eb939f85c07d_2031x1875.png 848w, https://substackcdn.com/image/fetch/$s_!mRiN!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F78c51bd4-a896-4295-9344-eb939f85c07d_2031x1875.png 1272w, https://substackcdn.com/image/fetch/$s_!mRiN!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F78c51bd4-a896-4295-9344-eb939f85c07d_2031x1875.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!mRiN!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/78c51bd4-a896-4295-9344-eb939f85c07d_2031x1875.png)*Squares set after taking into account bit #4.*

There are no surprises with bit #3. The pattern wraps around four times in each axis, lighting up the following regular grid of blocks:

[

<img src="https://substackcdn.com/image/fetch/$s_!8LPM!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F396f4b73-3e02-454b-94ac-e46a5aa38f99_2031x1875.png" width="1456" height="1344" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/396f4b73-3e02-454b-94ac-e46a5aa38f99_2031x1875.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:1344,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:57744,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/163283294?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F396f4b73-3e02-454b-94ac-e46a5aa38f99_2031x1875.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!8LPM!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F396f4b73-3e02-454b-94ac-e46a5aa38f99_2031x1875.png 424w, https://substackcdn.com/image/fetch/$s_!8LPM!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F396f4b73-3e02-454b-94ac-e46a5aa38f99_2031x1875.png 848w, https://substackcdn.com/image/fetch/$s_!8LPM!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F396f4b73-3e02-454b-94ac-e46a5aa38f99_2031x1875.png 1272w, https://substackcdn.com/image/fetch/$s_!8LPM!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F396f4b73-3e02-454b-94ac-e46a5aa38f99_2031x1875.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!8LPM!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/396f4b73-3e02-454b-94ac-e46a5aa38f99_2031x1875.png)*Contributions of bit #3 (in teal).*

Again, we can express it as a divide-and-set operation running at a finer scale and toggling the bottom right sub-sub-quadrants:

The same goes for bit 2, wrapping around eight times and adding a regular pattern of 64 blocks:

[

<img src="https://substackcdn.com/image/fetch/$s_!RHyb!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F54f38f9e-fa91-4c23-83f5-3b5861aa54c7_2031x1875.png" width="1456" height="1344" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/54f38f9e-fa91-4c23-83f5-3b5861aa54c7_2031x1875.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:1344,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:66925,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/163283294?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F54f38f9e-fa91-4c23-83f5-3b5861aa54c7_2031x1875.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!RHyb!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F54f38f9e-fa91-4c23-83f5-3b5861aa54c7_2031x1875.png 424w, https://substackcdn.com/image/fetch/$s_!RHyb!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F54f38f9e-fa91-4c23-83f5-3b5861aa54c7_2031x1875.png 848w, https://substackcdn.com/image/fetch/$s_!RHyb!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F54f38f9e-fa91-4c23-83f5-3b5861aa54c7_2031x1875.png 1272w, https://substackcdn.com/image/fetch/$s_!RHyb!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F54f38f9e-fa91-4c23-83f5-3b5861aa54c7_2031x1875.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!RHyb!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/54f38f9e-fa91-4c23-83f5-3b5861aa54c7_2031x1875.png)*Contributions of bit #2 (in teal).*

After two more steps, we end up with the following result; the dark blue cells are coordinates that were never set in any of the passes, netting the familiar triangle:

[

<img src="https://substackcdn.com/image/fetch/$s_!YIB3!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3df018eb-b5f9-4160-a49c-00524ce129b4_2031x1875.png" width="1456" height="1344" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/3df018eb-b5f9-4160-a49c-00524ce129b4_2031x1875.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:1344,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:57728,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/163283294?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3df018eb-b5f9-4160-a49c-00524ce129b4_2031x1875.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!YIB3!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3df018eb-b5f9-4160-a49c-00524ce129b4_2031x1875.png 424w, https://substackcdn.com/image/fetch/$s_!YIB3!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3df018eb-b5f9-4160-a49c-00524ce129b4_2031x1875.png 848w, https://substackcdn.com/image/fetch/$s_!YIB3!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3df018eb-b5f9-4160-a49c-00524ce129b4_2031x1875.png 1272w, https://substackcdn.com/image/fetch/$s_!YIB3!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3df018eb-b5f9-4160-a49c-00524ce129b4_2031x1875.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!YIB3!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/3df018eb-b5f9-4160-a49c-00524ce129b4_2031x1875.png)*Mr. Sierpiński, I presume?*

In effect, the algorithm is an iterative block-removal approach in disguise; it just doesn’t look that way because the passes are “parallelized” by the arithmetic logic unit of a CPU — at least up to the maximum hardware-supported bit width of an integer.

[Subscribe now](https://lcamtuf.substack.com/subscribe?)

---

*I write well-researched, original articles about geek culture, electronic circuit design, and more. **If you like the content, please subscribe.** It’s increasingly difficult to stay in touch with readers via social media; my typical post on X is shown to less than 5% of my followers and gets a \~0.2% clickthrough rate.*