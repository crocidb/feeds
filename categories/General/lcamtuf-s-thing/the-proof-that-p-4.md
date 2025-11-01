---
title = "The proof that π = 4"
description = "Recreational math: why a troll proof involving circles is less wrong than it seems."
date = "2025-06-05T21:43:49Z"
url = "https://lcamtuf.substack.com/p/4"
author = "lcamtuf"
text = ""
lastupdated = "2025-10-22T08:57:30.092289809Z"
seen = true
---

In an [article published here last week](https://lcamtuf.substack.com/p/09999-1), I discussed the perils of thinking about infinity as a number. More specifically, I criticized the structure of some of the elementary proofs that 0.9999… = 1.

As a teaching prop, I wheeled out the following equation:

This is an endless sum of alternating +1 and -1 terms. Pairwise, they all work out to zero, so the equation seems to make sense.

At the same time, there’s no risk of running out of terms in an infinite sum, so it seems harmless to shift the annotations one position to the right:

This seems to be saying that 1 = 0. Oops.

The reason I like this “proof” is that it’s hard to reflexively dismiss. A common reaction is *“oh yeah, but this left an unpaired - 1 at infinity”,* but what does this mean? If there’s a single, specific element at the ∞-th position in the sum, what do we find at position ∞ + 1?…

In the earlier article, we concluded that in contexts like these, infinity must be understood as a process metaphor, not a quantity. We’re not talking about an infinite number of steps as much as we’re talking about an *ill-specified* number of steps.

### Got it, are we done now? ###

Well, sort of. Thinking of infinity as a process helps us make sense of a good chunk of higher math, but it’s not always enough. Sometimes, it’s easy to fixate on the notion of infinity and miss more basic flaws in our reasoning.

Consider the following troll proof that *π* = 4:

[

<img src="https://substackcdn.com/image/fetch/$s_!IlCQ!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3901f63e-00c6-4fb5-8906-4691da94f125_3498x3132.png" width="1456" height="1304" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/3901f63e-00c6-4fb5-8906-4691da94f125_3498x3132.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:1304,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:600048,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/165285863?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3901f63e-00c6-4fb5-8906-4691da94f125_3498x3132.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!IlCQ!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3901f63e-00c6-4fb5-8906-4691da94f125_3498x3132.png 424w, https://substackcdn.com/image/fetch/$s_!IlCQ!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3901f63e-00c6-4fb5-8906-4691da94f125_3498x3132.png 848w, https://substackcdn.com/image/fetch/$s_!IlCQ!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3901f63e-00c6-4fb5-8906-4691da94f125_3498x3132.png 1272w, https://substackcdn.com/image/fetch/$s_!IlCQ!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3901f63e-00c6-4fb5-8906-4691da94f125_3498x3132.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!IlCQ!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/3901f63e-00c6-4fb5-8906-4691da94f125_3498x3132.png)*Time is a flat circle.*

We begin by drawing a circle with a diameter of 1; it follows that the circumference of this circle is 1*π.* We then draw a 1×1 square around the circle. The perimeter of the square is a sum of the lengths of its sides: 1 + 1 + 1 + 1 = 4.

Next, we “fold back” small sections near the corners of the square. We trim and reorient segments of length *a* such that the inverted corner just touches the circumference of the circle. Critically, this operation doesn’t change the perimeter of the outer shape. This should be fairly clear, but we can also double-check the result: each of the remaining long edges has a length of *b = 1 - 2a;* the newly-added corner sections are *8a* in total. The sum of *4b + 8a* works out back to 4.

Yet, the outer shape is now evidently a better approximation of the circle. If we perform another iteration, folding back the eight protruding corners, we get even closer to a circle *without changing the perimeter in any way.* If we keep doing this forever, the seemingly inescapable conclusion is that we’ll get infinitely close to the shape of a unit circle while keeping the perimeter of 4. In other words, the circle’s circumference must be also equal to 4. Or, to put it more bluntly: *π* = 4.

### Help me, Mr. Internet! ###

Most of the intuitive rebukes of the proof — including some popular YouTube videos — are unsatisfying, incomplete, or outright wrong. And if you ask on a math forum, the usual response is something along the lines of:

[

<img src="https://substackcdn.com/image/fetch/$s_!fO_b!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F33139ed0-b491-4024-b2e6-44c2a4d3e90c_1752x1046.png" width="1456" height="869" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/33139ed0-b491-4024-b2e6-44c2a4d3e90c_1752x1046.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:869,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:154332,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/165285863?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F33139ed0-b491-4024-b2e6-44c2a4d3e90c_1752x1046.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!fO_b!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F33139ed0-b491-4024-b2e6-44c2a4d3e90c_1752x1046.png 424w, https://substackcdn.com/image/fetch/$s_!fO_b!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F33139ed0-b491-4024-b2e6-44c2a4d3e90c_1752x1046.png 848w, https://substackcdn.com/image/fetch/$s_!fO_b!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F33139ed0-b491-4024-b2e6-44c2a4d3e90c_1752x1046.png 1272w, https://substackcdn.com/image/fetch/$s_!fO_b!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F33139ed0-b491-4024-b2e6-44c2a4d3e90c_1752x1046.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!fO_b!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/33139ed0-b491-4024-b2e6-44c2a4d3e90c_1752x1046.png)*Figure 7-4: the internet.*

I get it: mathematics doesn’t concern itself with intuition or reality. It operates in a closed universe of axioms; the main thrust of the discipline is to make these axioms as abstract as possible, and specify them as precisely as possible. So, if you don’t want to learn the lingo of mathematical analysis, *what are you doing here?*

At the same time, you might be one of these entitled bozos who just want to know why the *π = 4* proof is wrong. If so, don’t get distracted by the part about infinity; the first step is to figure out if the method used to iteratively approximate the shape is truly sound.

We can start by distilling the troll proof to a simpler but functionally identical case — trying to find the length of the diagonal of a 1×1 square:

[

<img src="https://substackcdn.com/image/fetch/$s_!cqZK!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5c093a8a-17e8-49c6-9e2e-133303085ed4_4408x2336.png" width="1456" height="772" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/5c093a8a-17e8-49c6-9e2e-133303085ed4_4408x2336.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:772,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:490425,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/165285863?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5c093a8a-17e8-49c6-9e2e-133303085ed4_4408x2336.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!cqZK!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5c093a8a-17e8-49c6-9e2e-133303085ed4_4408x2336.png 424w, https://substackcdn.com/image/fetch/$s_!cqZK!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5c093a8a-17e8-49c6-9e2e-133303085ed4_4408x2336.png 848w, https://substackcdn.com/image/fetch/$s_!cqZK!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5c093a8a-17e8-49c6-9e2e-133303085ed4_4408x2336.png 1272w, https://substackcdn.com/image/fetch/$s_!cqZK!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5c093a8a-17e8-49c6-9e2e-133303085ed4_4408x2336.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!cqZK!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/5c093a8a-17e8-49c6-9e2e-133303085ed4_4408x2336.png)*A stairway to hell.*

We have a diagonal of some unknown length. We make the first approximation with a path consisting of a single horizontal segment and a single vertical segment (arrows, left). The overall length of this path is 1 + 1 = 2.

Next, similarly to the circle scenario, we fold back the corner where the two segments intersect. This gives us four identical sections, each ½ long (middle diagram); the overall length of the stairstep path remains 4 · ½ = 2. We keep going; the shape gets closer and closer to the diagonal, but the walking distance along the jagged path remains constant. As before, the apparent conclusion is that the diagonal has a length of 2 — and not the \~1.41 value you can measure with a ruler or calculate from the Pythagorean theorem.

So, what’s wrong with these proofs? Again, a reasonable suspicion is that this construction process doesn’t properly converge on what it claims to converge on. It helps to express this idea more precisely: we can analyze the pointwise distance between the stairstep approximation and the diagonal. The following diagram should help:

[

<img src="https://substackcdn.com/image/fetch/$s_!HQ2f!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fef80a904-3014-45d8-b6e0-6a5856ef1d1a_4648x2168.png" width="1456" height="679" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/ef80a904-3014-45d8-b6e0-6a5856ef1d1a_4648x2168.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:679,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:558500,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/165285863?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fef80a904-3014-45d8-b6e0-6a5856ef1d1a_4648x2168.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!HQ2f!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fef80a904-3014-45d8-b6e0-6a5856ef1d1a_4648x2168.png 424w, https://substackcdn.com/image/fetch/$s_!HQ2f!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fef80a904-3014-45d8-b6e0-6a5856ef1d1a_4648x2168.png 848w, https://substackcdn.com/image/fetch/$s_!HQ2f!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fef80a904-3014-45d8-b6e0-6a5856ef1d1a_4648x2168.png 1272w, https://substackcdn.com/image/fetch/$s_!HQ2f!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fef80a904-3014-45d8-b6e0-6a5856ef1d1a_4648x2168.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!HQ2f!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/ef80a904-3014-45d8-b6e0-6a5856ef1d1a_4648x2168.png)*Pointwise error of estimation.*

On the left, I marked the peak distance between the diagonal and the initial approximation; this is labeled *x*. If we look at the rotated view in the lower part of the figure, the actual distance changes linearly from 0 to *x (*and back). So, finding the average deviation is akin to calculating the average water level in a bucket that’s steadily filling up from empty to full. The average deviation is simply 50% of the maximum. I’m going to invent a symbol for the average error and write *ε<sub>shape </sub>*= *x/2.*

In the center panel, the situation repeats: we have two triangles that are precisely half the size of the previous one. Within the span of each of these triangles, peak deviation is *x/2*, so the average is *x/4*; this doesn’t change if we line up both tringles side-by-side. The calculated average deviation is *ε<sub>shape </sub>*= *x/4. Finally,* after one more iteration (right), we get *ε<sub>shape </sub>*= *x/8*.

The deviation remaining after iteration *c* can be generalized as:

In this equation, *x* is just some finite constant value; we could calculate it, but we don’t need to. Either way, on the face of it, the expression robustly moves toward zero as we iterate — so from the perspective of pointwise shape error, we can get arbitrarily close to the target, and our shape approximation algorithm looks fine.

### If not this, then what? ###

If the method of constructing the approximation is correct, perhaps we’re mistaken about the length of the constructed shape? It doesn’t *feel* that way, but once again, it’s best to formalize our reasoning:

[

<img src="https://substackcdn.com/image/fetch/$s_!VryS!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe7e1e668-5a2f-4093-805c-028079b66f82_4648x2168.png" width="1456" height="679" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/e7e1e668-5a2f-4093-805c-028079b66f82_4648x2168.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:679,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:496890,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/165285863?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe7e1e668-5a2f-4093-805c-028079b66f82_4648x2168.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!VryS!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe7e1e668-5a2f-4093-805c-028079b66f82_4648x2168.png 424w, https://substackcdn.com/image/fetch/$s_!VryS!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe7e1e668-5a2f-4093-805c-028079b66f82_4648x2168.png 848w, https://substackcdn.com/image/fetch/$s_!VryS!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe7e1e668-5a2f-4093-805c-028079b66f82_4648x2168.png 1272w, https://substackcdn.com/image/fetch/$s_!VryS!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fe7e1e668-5a2f-4093-805c-028079b66f82_4648x2168.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!VryS!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/e7e1e668-5a2f-4093-805c-028079b66f82_4648x2168.png)*Path length error of estimation.*

On the left, we have a diagonal of some length *n* and a two-segment path (total length 2). The resulting path error — the walking-distance difference between the two routes — is *ε<sub>path </sub>= 2 - n.*

Next, let’s have a look at the middle diagram. Here, the length of the diagonal is obviously the same as before (*n),* while the stairstep curve has a length of 4 · ½; this yields *ε<sub>path </sub>=* 4 · ½ *- n = 2 - n* — no change from before. The situation repeats on the right: *ε<sub>path </sub>=* 8 · ¼ *- n = 2 - n.* That is to say, *ε<sub>path </sub>*appears independent of *ε<sub>shape</sub>*; it remains constant (and pretty big) as we iterate.

We can observe that the diagonal is smooth, while the stairstep approximation we’re building is increasingly jagged. In each iteration, the size of every “detour” we’re taking is halved, but the number of detours is doubled — so the total overhead associated with this route doesn’t change. That is to say, the core claims of the troll proof check out.

If it’s not the construction method, then some of our other assumptions must be wrong. And… hold on: now that we properly defined the concepts, who says that pointwise proximity and walking-path distance must be correlated to begin with? You can probably take many routes from home to work or school that are geometrically distant, but have similar lengths. Conversely, two nearby walking paths can have vastly different lengths if one is straight as an arrow and the other zig-zags a lot.

In other words, the main problem with the troll proof is just that it tries to imply a contradiction where none exists. It’s not particularly *weird* that we can construct a shape that is arbitrarily close to a circle on a pointwise basis, but that has a completely different path length because it meanders on a microscopic scale.

### So the result is a different shape? ###

Well… for a finite (but arbitrarily large) number of iterations, yes: despite visual similarity, jagged circles and smooth circles are just two wholly separate things. But if we take the “repeat forever” part of the troll proof literally, the answer gets more complicated than that.

In standard analysis — the prevailing flavor of mathematical fiction used to deal with infinity in algebraic contexts — most attempts to formally analyze the scenario would show that our increasingly jagged curve *somehow* collapses to a smooth diagonal (or a smooth circle) the moment we start talking about the hypothetical outcome “at infinity”.

The simplest way to explain the issue is to have another look at the earlier formula for the pointwise error between the stairstep pattern and the diagonal:

We’d be forgiven to say that as *c* (the iteration count) tends to infinity, the value of *ε<sub>shape</sub>* becomes infinitely small. It’s not wrong, but this kind of talk is verboten: as outlined [in the earlier article](https://lcamtuf.substack.com/p/09999-1), infinitesimals have no place on the real number line (or on the axes of a drawing plane). In standard mathematical discourse, *“infinitely close to zero”* and *“equal to zero”* are effectively the same, so the limit **is** zero. And if *ε<sub>shape</sub>* = 0, then we must conclude that the two figures no longer differ in any way.

This also implies that “at infinity” — and not a moment sooner — the length of the constructed curve must jump from 2 to √2 (in the case of a diagonal), or from 4 or *π* (in the case of a circle). This sounds weird, but there’s nothing that prohibits such a result. Keep in mind that infinity is not a point on the number line: it’s an abstraction for a place as distant from finite numbers as you can possibly get. Discontinuities can happen as we take a leap from here to there.

The apparent collapse of our kinda-would-be-fractal doesn’t have any profound meaning; it’s just an outcome of an thought experiment in a framework where numbers must be finite, but processes can continue without end. This asymmetry can produce wacky results elsewhere, too; the earlier case of 0.9999… = 1 is another manifestation of the same phenomenon.

If we’re in a philosophical mood, we could insist that the geometric fine structure of the curve survives, just becomes too small to ever exert any influence on real numbers. That’s not just grasping at straws: there are nonstandard analysis approaches that allow infinitesimals and that would keep the two curves distinguishable, for some definitions of infinity.

*👉 You might also like another geometric puzzle involving [dimensions and infinity](https://lcamtuf.substack.com/p/how-many-dimensions-is-this); or an exploration of spaces where [π is actually equal to 4.](https://lcamtuf.substack.com/p/folks-we-have-the-best)*

---

*If you liked the content, please subscribe; there’s no better way to stay in touch with the writers you like.*

[Subscribe now](https://lcamtuf.substack.com/subscribe?)