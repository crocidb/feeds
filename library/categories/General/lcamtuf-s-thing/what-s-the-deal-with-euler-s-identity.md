+++
title = "What's the deal with Euler's identity?"
description = "Untangling a cursed formula from 1748."
date = "2025-11-08T22:15:52Z"
url = "https://lcamtuf.substack.com/p/whats-the-deal-with-eulers-identity"
author = "lcamtuf"
text = ""
lastupdated = "2025-12-10T15:23:59.122415939Z"
seen = true
+++

Perhaps the most famous equation in pop mathematics is Euler’s identity:

The equation is deemed profound because it combines not one, not two, but five “special” mathematical constants: *e*, *π*, 0, 1, and the imaginary unit *i.*

The identity is a special case of an equation known as Euler’s formula:

The identity form is what you get if you choose an angle of *α* = *π* in radians (180°). This makes the cosine expression equal to -1 and the sine part equal to zero, so the final result of the substitution is:

Now, four “special” values is still weak sauce, so we move -1 to the left to increase the profoundness factor by another 25%.

There are multiple “easy” proofs of Euler’s formula you can find on YouTube, but they all involve sleight of hand: they make unobvious assertions about infinite series and function derivatives, or rely on a circular definition of complex numbers. I don’t have a proof that will fit on a napkin, but I think there’s a reasonably intuitive way to reason about what the equation does.

### A geometric view of complex numbers ###

Imagine a point in a Cartesian coordinate system that lies on the horizontal axis at a distance *l* from the center. If you wish to rotate this point by an angle *α* in radians, you can calculate the new *(x, y)* coordinates using simple trigonometry:

Less obviously, there is also a way to rotate points without trigonometric functions. If we take point *(x, y)* and flip the signs of the individual coordinates — *(-x, -y)* — we always achieve what looks like a rotation by 180°:

[

<img src="https://substackcdn.com/image/fetch/$s_!Dxm8!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F50089664-f5fe-499a-92fa-774174cdffe0_2364x1592.jpeg" width="1456" height="981" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/50089664-f5fe-499a-92fa-774174cdffe0_2364x1592.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:981,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:190221,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/178365616?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F50089664-f5fe-499a-92fa-774174cdffe0_2364x1592.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!Dxm8!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F50089664-f5fe-499a-92fa-774174cdffe0_2364x1592.jpeg 424w, https://substackcdn.com/image/fetch/$s_!Dxm8!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F50089664-f5fe-499a-92fa-774174cdffe0_2364x1592.jpeg 848w, https://substackcdn.com/image/fetch/$s_!Dxm8!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F50089664-f5fe-499a-92fa-774174cdffe0_2364x1592.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!Dxm8!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F50089664-f5fe-499a-92fa-774174cdffe0_2364x1592.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!Dxm8!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/50089664-f5fe-499a-92fa-774174cdffe0_2364x1592.jpeg)*180° rotation by multiplying coordinates by -1.*

The sign-flipping operation is equivalent to multiplication by -1. Changing the magnitude of the negative multiplier doesn’t result in a different rotation angle; it’s the “negative unit" itself (-1) that appears to be doing the hard work. If we want to achieve a rotation by 360°, we need to multiply the coordinates by -1 twice; the pattern extends in a pretty obvious way:

This leads to a peculiar realization: it would appear that to achieve rotations of less than 180°, we could raise -1 to a fractional power. In particular, for 90°, we could use an exponent halfway between (-1)<sup>0</sup> and (-1)<sup>1</sup>, multiplying the coordinates by (-1)<sup>½</sup>. This multiplier, known as *i,* can be also written as √(-1).

The number *i* is not a real. That’s not to say that it doesn’t exist; it just isn’t a member of the set of real numbers, ℝ. The construct lets us represent the coordinates of any point (*x, y*) as a single compound (“complex”) number:

The first part corresponds to the distance along the horizontal axis. The second (*i-*coupled) value is a number that’s evidently “rotated” by 90° — i.e., it represents the distance along the vertical axis.

This might sound unhinged, but the result is a coherent model of 2D geometry, and standard algebra extends to this *i*-containing realm in a pretty straightforward way. For the most part, you just work on the two halves of a complex number separately, keeping in mind that *i · i = -1.*

If we go back to the first method of rotation — using *sin* and *cos* — we can rewrite the formula as:

Equivalently, as discussed earlier on, we can express rotation by *m* · 90° by multiplying a given number by the correct power of *i*:

In the first equation, the angle of rotation (*α)* is expressed in radians, so a full 360° turn is achieved when *α = 2π*. In the second version, it’s expressed in 90° increments, so a full rotation is *m =* 4. To reconcile these equations, we need to toss in the appropriate scaling factor. If we do it on the *i<sup>m</sup>*<sup> </sup>side to settle on radians, we get:

This can be further simplified by choosing *l* = 1, essentially building a model of a point moving along a unit circle with a radius of one:

The equation is already in the same ballpark as Euler’s formula, but we’re not quite done yet.

### Imaginary bases and exponents ###

In the realm of real numbers, exponentiation that uses one positive base other than 1 can be rewritten in another base simply by tossing in an appropriate scaling factor in the exponent. For example, we can write the following:

The scaling factor is just the logarithm of the old base in the new base: *log<sub>2</sub>(8)* = 3.

Logarithms seamlessly extend to complex numbers, allowing us to move between real and imaginary bases in exponentiation. As a trivial example, if *(-1)<sup>½ </sup>= i*, this tells us that *log<sub>-1</sub>(i)* *= ½*, so we can apply the earlier rule to arrive at a fairly unsurprising equality:

In the same vein, there exists an imaginary-number logarithm that nets us a scaling factor to move from base *i* to base 10*:*

The value of *log<sub>10</sub>(i)* happens to be roughly 0.682·i, but we don’t need to know how to calculate it just yet. The point is just that the two earlier forms — *i<sup>x </sup>*and 10*<sup>&lt;some i-containing constant&gt;·x </sup>*— are equivalent. They both represent rotation by a chosen angle in a two-dimensional space.

### ♫ You spin me ‘round (like a record) ###

Before the segue into the properties of exponentiation, we established the following formula that equated two methods of rotating a point:

On the left side of the equation, we needed to toss in a 2/*π* scaling factor to convert from 90° increments to radians. It would be nice to switch to a different, real-number base *n* that naturally has the same rotation speed as the *cos + sin* expression. This would let us simplify the formula to:

The *cos + sin* expression is drawing a circle with a radius of 1, completing one rotation every *2π* radians. The circumference of the unit circle is *2π*, so there is a 1:1 correspondence between the parameter of the expression (α) and the distance traveled by the moving point.

As luck would have it, there is also a well-known real base for which there is a 1:1 correspondence between *x* and *n<sup>x</sup>* in the vicinity of real *x = 0*. It is, by definition, the mathematical constant *e*. If you’re unfamiliar with this property, it’s easy to show it numerically; if we choose a small Δ*x* = 0.0001 and calculate the rate of change near *x* = 0, we get:

In the domain of real numbers, the rate of change of *n<sup>x </sup>*increases in tandem with the value of *x*; that’s the nature of exponential growth. But in the realm of complex numbers, we have already asserted that a real value raised to an imaginary power results in constant-speed rotation, not runaway growth. We must conclude that the rate of change is dialed in solely by the real part, which is always zero in the formula we’re trying to build.

This means that the scaling-factor-free solution we’re looking for is just:

The observation also gives us the value of *log<sub>e</sub>(i) = ln(i)*. Per the earlier discussion, switching from *i* to base *e* entails multiplying the exponent by *log<sub>e</sub>(i).* In this instance, the multiplication evidently cancels out the 2/*π* factor, so *ln(i)* must be *π/2 · i*, or about *1.571 · i.*

That’s it. Again, it’s not a real proof: the argument contains a couple of appeals to intuition. That said, I like this chain of thought better than the usual explanations found on the internet.

As to why all these constants come together, the basic answer is that complex numbers are a two-dimensional geometry — and that radians, i, *e,* and *π* describe similar things.

*👉 For a more in-depth treatment of complex numbers, [click here](https://lcamtuf.substack.com/p/a-20-minute-intro-to-complex-numbers). If you like beavers, check out [this article](https://lcamtuf.substack.com/p/monkeys-typewriters-and-busy-beavers). And you enjoy the content, please subscribe. I don’t sell anything; it’s just a good way to stay in touch with the authors you like.*

[Subscribe now](https://lcamtuf.substack.com/subscribe?)