+++
title = "How did pinwheel calculators work?"
description = "In today’s article, you can watch the author add numbers together."
date = "2026-11-25T01:44:11Z"
url = "https://blog.coredump.cx/p/how-did-pinwheel-calculators-work"
author = "lcamtuf"
text = ""
lastupdated = "2026-11-25T14:41:59.480758979Z"
seen = false
+++

As a handful of readers might know, I am [a bit of a calculator nerd](https://blog.coredump.cx/p/a-brief-history-of-counting-stuff). I’m especially fond of mechanical four-function calculators that had their heyday between the 1920s and 1960s and then disappeared without a trace.

A video is worth a thousand tokens, so to explore the ingenuity of the design, let’s start with a short clip of a Vaucanson calculator from my collection:

<iframe src="https://player.vimeo.com/video/1249853296?autoplay=0&amp;h=951c3ac2cc" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true"></iframe>

In the first half of the video, I demonstrate addition. I calculate 1234 + 4321 by placing the first operand in the input register, turning the crank clockwise to add this value to the accumulator (bottom right), and then entering the second operand and cranking again. To subtract from the stored value, I’d turn the crank counterclockwise.

The second and more interesting half shows multiplication: I solve 79 × 123 by entering the first operand and then turning the crank three times to load 79 × 3 into the accumulator. Next, I shift the accumulator carriage one decimal digit to the right and crank twice; because the accumulator is offset from the input register, this has the same effect as cranking twenty times in the original position; in other words, I add 79 × 20. Finally, I shift the carriage once more and complete one more turn to add 79 × 100. Note that the crank counter in the bottom left now reads “123”, confirming that we multiplied the first operand by the correct value.

To divide, I’d load the first operand into the accumulator and then successively subtract power-of-ten multiples of the second number. This would give me the integer result in the counter register and the remainder in the accumulator.

Alright — so how does this work? Well, if you pop open a pinwheel calculator, you will be greeted by a pretty complicated mechanism:

[

<img src="https://substackcdn.com/image/fetch/$s_!dSrH!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Feb40e834-a063-4cbe-aad6-1163d2b04b93_2000x1334.jpeg" width="1456" height="971" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/eb40e834-a063-4cbe-aad6-1163d2b04b93_2000x1334.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:971,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:1254218,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:false,&quot;topImage&quot;:true,&quot;internalRedirect&quot;:&quot;https://blog.coredump.cx/i/226307789?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Feb40e834-a063-4cbe-aad6-1163d2b04b93_2000x1334.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!dSrH!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Feb40e834-a063-4cbe-aad6-1163d2b04b93_2000x1334.jpeg 424w, https://substackcdn.com/image/fetch/$s_!dSrH!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Feb40e834-a063-4cbe-aad6-1163d2b04b93_2000x1334.jpeg 848w, https://substackcdn.com/image/fetch/$s_!dSrH!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Feb40e834-a063-4cbe-aad6-1163d2b04b93_2000x1334.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!dSrH!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Feb40e834-a063-4cbe-aad6-1163d2b04b93_2000x1334.jpeg 1456w" sizes="100vw" fetchpriority="high">

](https://substackcdn.com/image/fetch/$s_!dSrH!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/eb40e834-a063-4cbe-aad6-1163d2b04b93_2000x1334.jpeg)*Calculator entrails. By author.*

There’s a lot going on here, but the most important part of the assembly is the prominent stack of input disks, one per digit, as seen in the top right of the photo. Each disk has three main components: a center section mounted to a keyed shaft that stays in position until the main crank is turned; a set of nine radial pins that slide into grooves machined in that disk; and a freely-moving digit-setting ring with a track and a couple of detents:

[

<img src="https://substackcdn.com/image/fetch/$s_!2VDx!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe1563113-93e5-439e-a810-6c5ec8c52952_2000x1500.jpeg" width="1456" height="1092" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/e1563113-93e5-439e-a810-6c5ec8c52952_2000x1500.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:1092,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:472557,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://blog.coredump.cx/i/226307789?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe1563113-93e5-439e-a810-6c5ec8c52952_2000x1500.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!2VDx!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe1563113-93e5-439e-a810-6c5ec8c52952_2000x1500.jpeg 424w, https://substackcdn.com/image/fetch/$s_!2VDx!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe1563113-93e5-439e-a810-6c5ec8c52952_2000x1500.jpeg 848w, https://substackcdn.com/image/fetch/$s_!2VDx!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe1563113-93e5-439e-a810-6c5ec8c52952_2000x1500.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!2VDx!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe1563113-93e5-439e-a810-6c5ec8c52952_2000x1500.jpeg 1456w" sizes="auto, 100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!2VDx!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/e1563113-93e5-439e-a810-6c5ec8c52952_2000x1500.jpeg)*The fundamental mechanism of a pinwheel calculator. By author.*

Each pin has a protrusion that rides in the track of the digit-setting ring. By turning the input lever, we can change the number of pins that extend from the assembly.

[

<img src="https://substackcdn.com/image/fetch/$s_!Hfob!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Feb5a84f7-c829-4482-a8dc-67190b292acc_2000x1125.jpeg" width="1456" height="819" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/eb5a84f7-c829-4482-a8dc-67190b292acc_2000x1125.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:819,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:342855,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://blog.coredump.cx/i/226307789?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Feb5a84f7-c829-4482-a8dc-67190b292acc_2000x1125.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!Hfob!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Feb5a84f7-c829-4482-a8dc-67190b292acc_2000x1125.jpeg 424w, https://substackcdn.com/image/fetch/$s_!Hfob!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Feb5a84f7-c829-4482-a8dc-67190b292acc_2000x1125.jpeg 848w, https://substackcdn.com/image/fetch/$s_!Hfob!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Feb5a84f7-c829-4482-a8dc-67190b292acc_2000x1125.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!Hfob!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Feb5a84f7-c829-4482-a8dc-67190b292acc_2000x1125.jpeg 1456w" sizes="auto, 100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!Hfob!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/eb5a84f7-c829-4482-a8dc-67190b292acc_2000x1125.jpeg)*Input digit set to “3”, with three pins extended. By author.*

When the crank is turned, these extended pins mesh to an intermediate gear that advances the digit at the corresponding position of the accumulator:

<iframe src="https://player.vimeo.com/video/1249880801?autoplay=0&amp;h=1495ce6ce5" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

Of course, this mechanism is not enough: without a way to carry to the next column, 0001 + 0009 would give us 0000 instead of 0010. To implement carry, each input disk (except for the rightmost one) is also equipped with a spring-loaded carry pin. This pin sticks out at all times, but is normally out of the path of the intermediate gear, so it has no effect on the output value.

To perform carry, each output position is equipped with a cam that pushes a wedge-shaped carry-sensing lever into the path of the carry pin just as the digit rolls over from 9 to 0. This wedge pushes the pin to the left, momentarily placing it in the path of the intermediate gear for the next decimal digit.

This is a mouthful; the entire process is shown in the following video:

<iframe src="https://player.vimeo.com/video/1249855054?autoplay=0&amp;h=af0ca2b804" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

The carry-sensing lever is pushed back into the retracted position before the drum completes a full rotation, thus allowing the carry pin to spring back.

Note that the carry pins are staggered and do not engage at all once; this is to allow carry to effortlessly ripple through all digits if necessary (e.g., when adding 9999 + 1).

There’s a couple of additional convenience and reliability features in each pinwheel calculator; this includes interlocks to prevent out-of-sequence inputs, as well as reset levers for each register. There’s even a mechanical bell on overflow or underflow. I won’t bore you with all the gory details, in part because these mechanisms are less interesting — but if you’re morbidly curious, this [ancient YouTube video](https://www.youtube.com/watch?v=YXMuJco8onQ) provides a more complete walkthrough.

And if you want to learn about the prehistory of calculators, I invite you to check out my 2023 article:

PS. Yep, this is why one of the registers on all Intel CPUs is called the “accumulator”.

---

<img src="https://substackcdn.com/image/fetch/$s_!7cdv!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8711c3cb-0b64-4e7a-839a-78e6f456a021_256x70.png" width="256" height="70" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/8711c3cb-0b64-4e7a-839a-78e6f456a021_256x70.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:70,&quot;width&quot;:256,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:5925,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://blog.coredump.cx/i/226307789?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8711c3cb-0b64-4e7a-839a-78e6f456a021_256x70.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!7cdv!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8711c3cb-0b64-4e7a-839a-78e6f456a021_256x70.png 424w, https://substackcdn.com/image/fetch/$s_!7cdv!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8711c3cb-0b64-4e7a-839a-78e6f456a021_256x70.png 848w, https://substackcdn.com/image/fetch/$s_!7cdv!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8711c3cb-0b64-4e7a-839a-78e6f456a021_256x70.png 1272w, https://substackcdn.com/image/fetch/$s_!7cdv!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F8711c3cb-0b64-4e7a-839a-78e6f456a021_256x70.png 1456w" sizes="auto, 100vw" loading="lazy">

*I write articles about [electronics](https://blog.coredump.cx/p/electronics-curriculum), [math](https://blog.coredump.cx/p/algorithms-and-math-trivia), [philosophy](https://blog.coredump.cx/p/philosophy), and [more](https://blog.coredump.cx/p/tranquility). If you like what you see, please subscribe.*

[Subscribe now](https://blog.coredump.cx/subscribe?)