---
title = "A 20-minute intro to complex numbers"
description = "You might have heard of complex numbers before -- but what's the actual significance of i = √-1?"
date = "2025-05-16T18:24:26Z"
url = "https://lcamtuf.substack.com/p/a-20-minute-intro-to-complex-numbers"
author = "lcamtuf"
text = ""
lastupdated = "2025-10-22T08:57:30.110439450Z"
seen = true
---

In a couple of earlier articles on this site, I brought up complex numbers. They are a fairly abstract construct that reeks of higher math, but is hard to avoid in the context of [analog electronics](https://lcamtuf.substack.com/p/analog-filters-part-2-let-it-ring), [signal processing](https://lcamtuf.substack.com/p/not-so-fast-mr-fourier), [computer graphics](https://lcamtuf.substack.com/p/you-cant-handle-the-buddhabrot), and more.

If you’re a subscriber, you probably have at least an inkling of how complex numbers work; the mechanics are explained in many places on the internet and are probably required for CS and EE degrees. That said, accessible texts usually don’t explain what’s *cool* about this construct — and in particular, why it’s uniquely suited as a model of two-dimensional Cartesian geometry, phase-shifted electronic signals, and other “orthogonal” quantities.

### The cat coordinate system ###

The most basic (if somewhat flawed) way to introduce complex numbers is that they’re a trick to express two independent, real numbers as a single variable while keeping the two halves at an arm’s length. This is done by coupling one of the numbers to a magic-bean value of *i*:

We call the free term (*x*) the “real” part, and the *i*-coupled term (*y*) the “imaginary” part.

A more accessible way to put it would be to say that we invented a value of 🐱, with the rule that 🐱 is not a normal number. There are no obvious arithmetic rules that would allow you to combine the terms that contain a 🐱 with the ones that do not, but you’re free to work on each part separately.

Addition and subtraction can be pretty intuitively extended to cat-complex numbers by individually summing the cat-free and cat-bearing parts:

This aligns with intuition about the real world; for example, if the cat-free part represents horizontal distance and the cat part represents elevation gain, summing the corresponding cat-complex numbers for different segments of a mountain trail can give us the totals for the hike:

[

<img src="https://substackcdn.com/image/fetch/$s_!AA5L!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F04c72178-7fb8-4cbb-875f-e066a6100121_2499x1561.png" width="1456" height="909" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/04c72178-7fb8-4cbb-875f-e066a6100121_2499x1561.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:909,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:521413,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/163599741?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F04c72178-7fb8-4cbb-875f-e066a6100121_2499x1561.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!AA5L!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F04c72178-7fb8-4cbb-875f-e066a6100121_2499x1561.png 424w, https://substackcdn.com/image/fetch/$s_!AA5L!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F04c72178-7fb8-4cbb-875f-e066a6100121_2499x1561.png 848w, https://substackcdn.com/image/fetch/$s_!AA5L!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F04c72178-7fb8-4cbb-875f-e066a6100121_2499x1561.png 1272w, https://substackcdn.com/image/fetch/$s_!AA5L!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F04c72178-7fb8-4cbb-875f-e066a6100121_2499x1561.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!AA5L!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/04c72178-7fb8-4cbb-875f-e066a6100121_2499x1561.png)*Adding hike segments in cat-space.*

In a boring math paper, they would make you delete the cats and use *i* instead, but the semantics of addition and subtraction remain the same:

The rules for multiplication by real numbers follow from addition and are similarly obvious. You multiply the real and imaginary parts independently:

If we’re using complex numbers to represent *(x, y)* points on a Cartesian plane, then addition moves them by some specified distance, while multiplication by a positive value scales the geometry in relation to the center of the coordinate system.

### Making the cat spin ###

We could stop there: a system that uses 🐱 or that defines *i* as an abstract symbol works just fine. That said, for geometry, it’s just not a big improvement over keeping track of *x* and *y* coordinates as separate entities and manipulating them individually. The cat symbol is cool, but it doesn’t offer any special insights into reality.

The core problem is that the cat-based model doesn’t encode any specific relationship between the two values. As far as it’s concerned, the cat domain and the non-cat domain are completely disjoint. They are two different number lines on two separate sheets of paper.

These are not the mechanics of the two-dimensional Cartesian coordinate system: the axes are orthogonal. They are *mostly* separate, but we expect there to be a rotation operator that transposes one axis onto another. Alas, in our 🐱-coupled system, rotation is not intrinsically defined.

OK, I lied: we have the notion of rotating a point by 180°. It’s equivalent to scalar multiplication by -1:

The operation flips the signs of both coordinates. For a pair of points on a plane, we’d get the following result:

[

<img src="https://substackcdn.com/image/fetch/$s_!NOmQ!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fee6b9596-0767-46d2-a311-7738da42f1b5_2364x1592.png" width="1456" height="981" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/ee6b9596-0767-46d2-a311-7738da42f1b5_2364x1592.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:981,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:190221,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/163599741?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fee6b9596-0767-46d2-a311-7738da42f1b5_2364x1592.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!NOmQ!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fee6b9596-0767-46d2-a311-7738da42f1b5_2364x1592.png 424w, https://substackcdn.com/image/fetch/$s_!NOmQ!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fee6b9596-0767-46d2-a311-7738da42f1b5_2364x1592.png 848w, https://substackcdn.com/image/fetch/$s_!NOmQ!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fee6b9596-0767-46d2-a311-7738da42f1b5_2364x1592.png 1272w, https://substackcdn.com/image/fetch/$s_!NOmQ!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fee6b9596-0767-46d2-a311-7738da42f1b5_2364x1592.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!NOmQ!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/ee6b9596-0767-46d2-a311-7738da42f1b5_2364x1592.png)*Wheeeeee!*

Upon closer inspection, we can intuit that it’s not the magnitude of the scalar value (-1) that’s doing the hard work; if we switch to -2 or -0.5, the objects change scale, but they’re still rotated just 180°.

Instead, a full turn (360°) requires multiplying by -1 **twice**. Continuing down that path, multiplying by -1 three times in a row results in a 540° turn (180° · 3), and so on. In other words, the secret sauce appears to be the exponent of a constant -1 base:

So, what would it take to achieve rotation by 90°? Well, looking at the series above, the answer seems pretty clear, if *weird.* We need to choose an exponent of *½:*

In the Cartesian view of complex numbers, if we take a real value and attach it to *i*, we’re essentially saying that it no longer represents a distance on the *x* axis, and instead represents the same distance on the *y* axis. That’s rotation by 90°. It follows that to automatically encode orthogonality between the two parts of a complex number, we ought to define *i* as (-1)<sup>½</sup>.

### But what’s (-1)<sup>½</sup>? ###

If you had any prior exposure to complex numbers, you already know the “official” answer, but it can be useful to ponder how we arrive at that. Let’s start with the basic, middle-school definition of positive integer powers. It’s a convenient notation that replaces repeated multiplication:

We have no real-world intuition about what it means to raise *n* to anything other than a positive integer, but it suffices to make another obvious observation about the equivalence of *n<sup>a </sup>· n<sup>b </sup>*and *n<sup>a + b</sup>:*

This equality gives us a lead for *n<sup>0</sup>*:

The only possible multiplier for *n<sup>a </sup>*that produces *n<sup>a</sup>* is 1, so in an internally-consistent algebra system, that must be the value of *n<sup>0</sup>*. Roughly the same logic can be used to figure out the meaning of *n<sup>-a</sup>*:

The first half of the expression — *n<sup>a </sup>*— expands to a product of *a* repetitions of *n.* The only way to get back to 1 is for *n<sup>-a </sup>*to be the reciprocal of *n<sup>a </sup>*— that is, to expand to *a* repetitions of *1/n*.

This brings us to simple fractions. Whatever the meaning of *n<sup>½ </sup>*might be, we want the following to hold:

Exponentiation has two inverse operations: roots (mapping result & exponent → base) and logarithms (mapping result & base → exponent). In this instance, since we’re looking for a value that gives us *n* when squared, we need the square root of *n*; in other words, *n<sup>½</sup>* = √*n*.

### Tying it all together  ###

At this point, we can more conventionally describe the value we’ve been looking for: *i* = (-1)<sup>½</sup> = √-1.

The value of *i* is not real (in the sense that it doesn’t have a place on the ℝ number line), so it obeys the design rule of the 🐱-based system: it keeps the orthogonal coordinates separate. The exception is that multiplication of a complex number by *i<sup>m </sup>*results in a rotation of *m ·* 90°. For example, for *m* = 1, we can see that the *x* and *y* coordinates change places:

We’ll get to the way to deal with fractional *m* values in a moment.

For the most part, rudimentary complex number algebra is straightforward, but there are some surprises. We have previously established that multiplying by *i* twice just flips the sign of the starting number: *z* *· i<sup>2</sup> = -z*. If we divide both sides of this equation by *i*, we get *z* *· i = -z / i*. After further simplification, we arrive at a peculiar but unavoidable corollary: *i = -1/i*, which can be also written as *-i = 1/i.*

There is a geometric explanation of this result, too! If multiplying by *i* is equivalent to a rotation by 90°, then to get us back to the starting point, division by *i* must correspond to rotation by -90°. It follows that in the geometric view, taking -1 on the real axis and rotating it by +90° (-1*·i*, aka *-i)* ought to produce the same result as taking +1 and rotating it -90° (*1/i):*

[

<img src="https://substackcdn.com/image/fetch/$s_!CRrH!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fa3310f9b-108d-45cd-9dd5-1dd96d4f28ce_2364x1592.png" width="1456" height="981" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/a3310f9b-108d-45cd-9dd5-1dd96d4f28ce_2364x1592.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:981,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:117468,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/163599741?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fa3310f9b-108d-45cd-9dd5-1dd96d4f28ce_2364x1592.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!CRrH!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fa3310f9b-108d-45cd-9dd5-1dd96d4f28ce_2364x1592.png 424w, https://substackcdn.com/image/fetch/$s_!CRrH!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fa3310f9b-108d-45cd-9dd5-1dd96d4f28ce_2364x1592.png 848w, https://substackcdn.com/image/fetch/$s_!CRrH!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fa3310f9b-108d-45cd-9dd5-1dd96d4f28ce_2364x1592.png 1272w, https://substackcdn.com/image/fetch/$s_!CRrH!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fa3310f9b-108d-45cd-9dd5-1dd96d4f28ce_2364x1592.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!CRrH!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/a3310f9b-108d-45cd-9dd5-1dd96d4f28ce_2364x1592.png)*Division and multiplication in the complex plane.*

To build a more general model of complex multiplication, we can note that any point on a two-dimensional plane that’s described by its *(x, y)* coordinates can be also unambiguously described by its distance from *(0, 0)* and an angle:

[

<img src="https://substackcdn.com/image/fetch/$s_!zhyh!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3c5a6498-e5e6-4d12-859a-230fc221832a_3629x1645.png" width="1456" height="660" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/3c5a6498-e5e6-4d12-859a-230fc221832a_3629x1645.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:660,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:227668,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/163599741?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3c5a6498-e5e6-4d12-859a-230fc221832a_3629x1645.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!zhyh!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3c5a6498-e5e6-4d12-859a-230fc221832a_3629x1645.png 424w, https://substackcdn.com/image/fetch/$s_!zhyh!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3c5a6498-e5e6-4d12-859a-230fc221832a_3629x1645.png 848w, https://substackcdn.com/image/fetch/$s_!zhyh!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3c5a6498-e5e6-4d12-859a-230fc221832a_3629x1645.png 1272w, https://substackcdn.com/image/fetch/$s_!zhyh!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F3c5a6498-e5e6-4d12-859a-230fc221832a_3629x1645.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!zhyh!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/3c5a6498-e5e6-4d12-859a-230fc221832a_3629x1645.png)*Two ways of saying the same thing.*

This representation is known as *polar coordinates.* The technique is fairly common in computer graphics and engineering; there are simple trigonometric conversions between the two. When applied to the complex plane, the trick allows us to imagine any complex number as a real value *l* on the x axis that’s rotated by some angle *m ·* 90°. Based on what we discussed earlier*,* we already have a formula to do this exact thing:

This length is usually referred to as the *modulus* or the *absolute value*. The angle (again, *m ·* 90°) is called the *argument*, apparently as an homage to an astronomical term that dates back to the 14th century.

This notation is surprisingly useful. For example, the polar form gives us a neat geometric interpretation of what it means to multiply two complex numbers. If we represent each number using the polar formula, we get:

In essence, the result is that the lengths are multiplied while the angles add.

That formula, in turn, gives us an explanation of a certain method to get rid of complex numbers in the denominator of a fraction. Such denominators can be annoying to work with, and in textbooks, you’re instructed to multiply both the numerator and the denominator of the troublesome fraction by what’s known as the *complex conjugate*. In plain English: if the denominator is *z = x + iy,* the complex conjugate is just a version of *z* that has the sign of the imaginary part flipped: *z<sup>*</sup> = x - iy.*

The result is always a real-only denominator — but how did we come up with this and why does this work? To answer this, imagine a plot of both *z* and *z<sup>*</sup>.* On a Cartesian plane, they’re essentially the same, except the *y* coordinate of *z<sup>* </sup>*is flipped, producing a mirror image in respect to the horizontal axis. This means that in the polar-coordinate representation, the lengths of *z* and *z<sup>* </sup>*are the same (*l<sub>1</sub> = l<sub>2</sub>*), while the angles have the opposite sign (*m<sub>1</sub> = -m<sub>2</sub>*). If we use the earlier formula to calculate the product of *z ·* *z<sup>*</sup>*, it follows that the angle is zero (i.e., the new nominator is real-only) while the new *l* is equal to the square of the modulus of *z.*

Another neat use of the polar notation has to do with the fact that rotations in two dimensions can also be described with basic trigonometry. When working with separate *x* and *y* coordinates, we’d use the following formula to rotate a point on the *x* axis by some chosen angle *α*:

This gives us a yet another to represent complex numbers: as a scalar length *l* (again, the modulus) multiplied by a cosine of an angle *α* to construct the real part, and a sine coupled to *i* to construct the imaginary part:

This might seem mundane, but combining the new formula with the earlier polar representation (*z = l · i<sup>m</sup>*), we can write the following identity:

If we substitute *l* = 1 and switch to radians, we get a equation that allows us to easily find *i<sup>m </sup>*for fractional values of *m* using trigonometric functions:

This is a pretty important and useful result.

We could stop here, but more whimsically, we can also move the scaling factor for *m* from right to the left, ending up with the following form:

This is within an earshot of the well-known Euler’s formula:

In that last equation, if we substitute *m = π*, the cosine expression becomes -1 and the sine expression becomes 0 (that is, *e<sup>iπ </sup>* = -1 + 0*i*). Move the -1 to the other side and you end up with *e<sup>iπ</sup>*<sup> </sup>+ 1 = 0, which is deemed profound by many pop-science mystics and cranks.

In all fairness to mystics, getting to Euler’s formula is not *that* simple: I skipped a step, and to explain the sudden appearance of the mathematical constant *e*, we’d need to do a bit more work. A rough outline can be found in the pinned comment under this post.

### Postscript: the algebraic view ###

In most texts, complex numbers are introduced in a seemingly less purposeful way: not as a model of 2D geometry, but as a way to solve equations such as *x²* = -2. This seems somewhat fanciful: why is it important to have imagined “solutions” to such equations in the first place?

A good way to answer it is to start with the realm of natural numbers. Natural numbers are an intuitive formalization of rudimentary day-to-day math: one apple plus one apple equals two apples. That said, basic algebra on these numbers can produce solutions that lie outside the realm: for example, the solution to *x + 2 = 1* is not a natural number. Because of this, we can say that natural numbers are not *algebraically closed*.

To fix the issue with subtraction, we can obviously extend the scheme by adding negative integers. We’re all used to the concept, but imagine defining it for a caveman mathematician! You’d probably say that we envisioned a make-believe realm of numbers that are just like naturals, except they’re coupled to a magic symbol to represent some multiple of the “negative unit” (-1). Oh and we came up with new rules for combining negative and positive values. Wait, doesn’t that sounds awfully close to the way we explain *i?…*

But I digress. The introduction of negative numbers solves subtraction, but still allows the realm to be escaped via division (the solution to 2·*x* = 1 is not an integer). To close that particular gap, we need to allow rational numbers. Yet, rationals are also not enough: the solution to *x²* = 2 is not a finite fraction.

Strictly speaking, we can fix this glitch in a more narrow way, but the usual “common-sense” upgrade from rationals are reals — which, in addition to irrational roots, also accommodate transcendental numbers such as (*√2)<sup>√2</sup>*, *π,* or *e.* Reals are a familiar household name and seem to be on the brink of being algebraically closed… but then, what about *x²* = -2?

Well, we can address the issue by allowing the imaginary unit (√-1) — and crucially, *this is where it all ends*. The addition of this element closes off all escape routes from reals and gives us an algebraically-closed field. The only remaining gaps are singularities such as 0/0 (aka, 0·*x* = 0), which can’t have a well-defined solution under conventional algebra rules.

Just as importantly, the addition of imaginary numbers doesn’t break algebra: all the standard rules extend seamlessly to this realm. The only property we lose is strict ordering. To illustrate, assume that *a =* 1 + 0*i* and *b =* 0 + 1*i*. It’s clear that *a ≠ b* — but can we confidently say that *a \< b* or *a \> b*?

Either way: complex numbers are not just a one-off hack, but the final stepping stone in the construction of an escape-proof algebra system that naturally follows from observations about the real world. And yes: this means that standard algebra, taken to its logical conclusion, is a two-dimensional geometry.

*👉 For a followup article about extending complex numbers to 3D, see [here](https://lcamtuf.substack.com/p/complex-numbers-2-a-world-in-3d).*

---

*I write well-researched, original articles about geek culture, electronic circuit design, and more. **If you like the content, please subscribe.** It’s increasingly difficult to stay in touch with readers via social media; my typical post on X is shown to less than 5% of my followers and gets a \~0.2% clickthrough rate.*

[Subscribe now](https://lcamtuf.substack.com/subscribe?)