+++
title = "Notes on Fourier series"
description = "The trigonometric Fourier series is a beautiful mathematical theory that shows how to decompose a periodic function into an infinite sum of sinusoids. These are my notes on the subject, with some examples and the connection to linear algebra in Hilbert space.Coefficients of Fouri"
date = "2026-05-28T02:30:00Z"
url = "https://eli.thegreenplace.net/2026/notes-on-fourier-series/"
author = "Eli Bendersky"
text = ""
lastupdated = "2026-05-28T23:18:06.471354766Z"
seen = false
+++

The trigonometric Fourier series is a beautiful mathematical theory that shows how to decompose a periodic function into an infinite sum of sinusoids. These are my notes on the subject, with some examples and the connection to linear algebra in Hilbert space.

Coefficients of Fourier series
----------

Let’s assume that ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) is a *well-behaved* 2L-periodic [[1]](#footnote-1) function and that we can find coefficients a\_n and b\_n such that:

\\[f(x)=\\sum\_{n=0}^{\\infty}\\left(a\_n cos\\frac{n\\pi x}{L}+b\_n sin\\frac{n\\pi x}{L}\\right)\\]

Then we say that the *Fourier series* on the right-hand side converges to ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png). We’ll talk more about the assumptions mentioned above and convergence in the next section.

Note that when n=0, the sum becomes just ![a_0](https://eli.thegreenplace.net/images/math/4a5997da73aadd118038761e69d01e24586bf958.png); therefore it’s customary to write the series starting with n=1, with a separate constant component (which is the function's average over one period). To make computations nicer, this constant is typically called a\_0 / 2, so:

\\[f(x)=\\frac{a\_0}{2}+\\sum\_{n=1}^{\\infty}\\left(a\_n cos\\frac{n\\pi x}{L}+b\_n sin\\frac{n\\pi x}{L}\\right)\\]

Our goal is to find the coefficients a\_n and b\_n that satisfy this equation. We’ll do this in three steps.

**Step 1:** Integrate both sides of the equation between -L and L [[2]](#footnote-2).

\\[\\int\_{-L}^{L}f(x)dx=\\int\_{-L}^{L}\\frac{a\_0}{2}dx+\\sum\_{n=1}^{\\infty}\\bigg (\\int\_{-L}^{L}a\_n cos\\frac{n\\pi x}{L}dx+\\int\_{-L}^{L}b\_n sin\\frac{n\\pi x}{L}dx\\bigg )\\]

Per Appendix A, all integrals within the sum are zero, so we’re left with:

\\[\\int\_{-L}^{L}f(x)dx=\\int\_{-L}^{L}\\frac{a\_0}{2}dx=\\bigg[\\frac{x\\cdot a\_0}{2}\\bigg]\_{-L}^{L}=a\_0\\cdot L\\]

And thus we find ![a_0](https://eli.thegreenplace.net/images/math/4a5997da73aadd118038761e69d01e24586bf958.png):

\\[a\_0=\\frac{1}{L}\\int\_{-L}^{L}f(x)dx\\]

**Step 2:** Multiply both sides by cos\\frac{m\\pi x}{L} (m is a positive integer constant) and integrate between -L and L.

\\[\\begin{aligned} \\int\_{-L}^{L}f(x)cos\\frac{m\\pi x}{L}dx&=\\int\_{-L}^{L}\\frac{a\_0}{2}cos\\frac{m\\pi x}{L}dx\\\\ &+\\sum\_{n=1}^{\\infty}\\bigg (\\int\_{-L}^{L}a\_n cos\\frac{n\\pi x}{L}cos\\frac{m\\pi x}{L}dx+\\int\_{-L}^{L}b\_n sin\\frac{n\\pi x}{L}cos\\frac{m\\pi x}{L}dx\\bigg ) \\end{aligned}\\]

Looking at the right-hand side, the first integral is zero per Appendix A, and the last integral is zero per Appendix B. We’re left with:

\\[\\int\_{-L}^{L}f(x)cos\\frac{m\\pi x}{L}dx=\\sum\_{n=1}^{\\infty}\\int\_{-L}^{L}a\_n cos\\frac{n\\pi x}{L}cos\\frac{m\\pi x}{L}dx\\]

Per Appendix B, the integral on the right is zero for all n\\neq m, and L for n=m. Therefore, we can write:

\\[\\int\_{-L}^{L}f(x)cos\\frac{m\\pi x}{L}dx=a\_m\\cdot L\\]

Recall that m is an arbitrary integer, just like ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png); for consistency, we’ll replace m by ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png) and isolate a\_n:

\\[a\_n=\\frac{1}{L}\\int\_{-L}^{L}f(x)cos\\frac{n\\pi x}{L}dx\\]

**Step 3:** Hopefully it’s clear where this is going now; multiply both sides by sin\\frac{m\\pi x}{L} and integrate between -L and L. Using a very similar reasoning to step 2, we’ll end up with:

\\[b\_n=\\frac{1}{L}\\int\_{-L}^{L}f(x)sin\\frac{n\\pi x}{L}dx\\]

We’ve just found a way to calculate all the coefficients of our Fourier series for ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png):

\\[f(x)=\\frac{a\_0}{2}+\\sum\_{n=1}^{\\infty}\\left(a\_n cos\\frac{n\\pi x}{L}+b\_n sin\\frac{n\\pi x}{L}\\right)\\]

Where:

\\[\\begin{aligned} a\_0&=\\frac{1}{L}\\int\_{-L}^{L}f(x)dx\\\\ a\_n&=\\frac{1}{L}\\int\_{-L}^{L}f(x)cos\\frac{n\\pi x}{L}dx\\\\ b\_n&=\\frac{1}{L}\\int\_{-L}^{L}f(x)sin\\frac{n\\pi x}{L}dx \\end{aligned}\\]

Conditions on *f* and convergence of Fourier series
----------

The previous section discusses Fourier series for a function ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) that is *well-behaved* - but what does that mean? The full answer would lead us deep into analysis, which I’d like to avoid here. So I’ll keep it brief.

We typically assume that ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) is [square integrable](https://en.wikipedia.org/wiki/Square-integrable_function), which is denoted as L^2. Moreover, we assume that the function is [piecewise smooth](https://en.wikipedia.org/wiki/Piecewise_function): each segment of the function has continuous derivatives. A very simple example of a piecewise smooth function is f(x)=|x|. Another is the triangular wave function used in the example below.

These conditions hold for pretty much any reasonable function we want to approximate using Fourier series, so they aren’t a serious burden.

For a function ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) that satisfies these conditions, it’s guaranteed to have a Fourier series that *pointwise converges* to it. This means that at every continuous point of ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png), the Fourier series converges to it exactly; at every jump point, the Fourier series converges to the mid-point of the jump.

Cosine and Sine series
----------

Sometimes, additional properties of the function ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) can help us simplify the Fourier series for it. If f\_e(x) is an [even function](https://eli.thegreenplace.net/2025/notes-on-even-and-odd-functions/), then we know that:

\\[b\_n=\\frac{1}{L}\\int\_{-L}^{L}f(x)sin\\frac{n\\pi x}{L}dx=0\\]

Because the function inside the integral is odd, and integrating an odd function over a symmetric interval results in 0.

Therefore, the Fourier series for such f\_e(x) is a *cosine series*:

\\[f\_e(x)=\\frac{a\_0}{2}+\\sum\_{n=1}^{\\infty}a\_n cos\\frac{n\\pi x}{L}\\]

With coefficients ![a_0](https://eli.thegreenplace.net/images/math/4a5997da73aadd118038761e69d01e24586bf958.png) and a\_n given as before.

Similarly if f\_o(x) is an *odd* function, then its ![a_0](https://eli.thegreenplace.net/images/math/4a5997da73aadd118038761e69d01e24586bf958.png) and a\_n are 0, and its Fourier series is a *sine series*:

\\[f\_o(x)=\\sum\_{n=1}^{\\infty}b\_n sin\\frac{n\\pi x}{L}\\]

Fourier series for a non-periodic function defined on an interval
----------

So far we’ve been talking about 2L-periodic functions that can be faithfully represented by Fourier series. But what if we have a non-periodic function defined on a finite interval?

E.g. suppose we have f(x)=x on the interval [0,L]. Can we approximate it with a Fourier series?

Yes! First, we have to make a choice of how to extend the function to the negative interval [-L,0]. Then, we simply repeat the function every 2L - this is called a *periodic extension*. Note that the Fourier series calculation only cares about the range [-L,L]. The resulting series will approximate the generated periodic function in its entirety, and in particular will also converge to it in the [0,L] interval (except maybe the endpoints, depending on the mode of extension).

There are several natural ways to extend a function defined on [0,L] into the interval [-L,0] [[3]](#footnote-3):

* Direct periodic repetition: we simply repeat ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) every L: f(x+L)=f(x)\\ \\forall x.
* Even extension: f(|x|)
* Odd extension: ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) when x\\ge 0 and -f(-x) when x\<0.

Here’s an example of extending our sample function f(x)=x onto the full interval [-L,L] and then repeating it periodically every 2L:

 Your browser does not support the HTML5 canvas tag.

Note that the Fourier series for these extended functions will be different. However, they will all converge to ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) in the interval [0,L]. Typically, even and odd extensions have the benefit of producing either cosine or sine series, correspondingly (as discussed in the previous section).

We’ve seen that Fourier series work well for periodic functions and also non-periodic functions defined on a finite domain (because we can extend these periodically). But what about aperiodic functions defined on the entire real line? This is where we’ll have to leave Fourier series behind and move on to their generalization - the *Fourier transform*; this will be a topic for a separate post.

Example
----------

Let’s take the following triangular function t(x) [[4]](#footnote-4):

 Your browser does not support the HTML5 canvas tag.

t(x) is periodic with period 4. We can define it by starting with a formula on the interval [0,2]:

\\[t(x)= \\begin{cases} x & 0 \\leq x \\leq 1 \\\\ 2-x & 1 \< x \\leq 2 \\\\ \\end{cases}\\]

Then making an odd extension into [-2,0] and repeating it periodically. Now we can go ahead to calculate its Fourier coefficients.

Since this function is odd, we know that we’ll get a *sine series*, as a\_n are going to be 0 for all ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png). Let’s calculate b\_n; in our case L=2 (half the period).

\\[b\_n=\\frac{1}{2}\\int\_{-2}^{2}t(x)sin\\frac{n\\pi x}{2}dx\\]

Since t(x) is odd and so is the sine, we’re integrating an even function over a symmetric interval. Therefore, we only have to integrate on the positive half of the range and multiply the result by two:

\\[b\_n=\\int\_{0}^{2}t(x)sin\\frac{n\\pi x}{2}dx\\]

Let’s set k=\\frac{n\\pi}{2}:

\\[b\_n=\\int\_{0}^{2}t(x)sin(kx)dx\\]

And split up the integral for the different segments of t(x):

\\[b\_n=\\int\_{0}^{1}x\\cdot sin(kx)dx+\\int\_{1}^{2}(2-x)sin(kx)dx\\]

The first integral, by the method described in Appendix C:

\\[I\_1=\\int\_{0}^{1}x\\cdot sin(kx)dx=\\bigg[\\frac{-x cos(kx)}{k}+\\frac{sin(kx)}{k^2} \\bigg]\_{0}^{1}=\\frac{sin(k)}{k^2}-\\frac{cos(k)}{k}\\]

The second integral can also be split into two:

\\[I\_2=\\int\_{1}^{2}2sin(kx)dx - \\int\_{1}^{2}x\\cdot sin(kx)dx\\]

The first of these is trivial to calculate; the second can once again use Appendix C. After some tedious but straightforward calculations [[5]](#footnote-5) we’ll get:

\\[I\_2=\\frac{cos(k)}{k}+\\frac{sin(k)-sin(2k)}{k^2}\\]

Adding I\_1+I\_2, we get:

\\[\\begin{aligned} b\_n=I\_1+I\_2&=\\frac{sin(k)}{k^2}-\\frac{cos(k)}{k}+\\frac{cos(k)}{k}+\\frac{sin(k)-sin(2k)}{k^2}\\\\ &=\\frac{2sin(k)-sin(2k)}{k^2} \\end{aligned}\\]

Now let’s substitute k=\\frac{n\\pi}{2} back. This makes sin(2k) zero because the sine of an integer multiple of \\pi is always zero:

\\[b\_n=\\frac{2sin \\frac{n\\pi}{2}}{\\left (\\frac{n\\pi}{2}\\right )^2}=\\frac{8sin \\frac{n\\pi}{2}}{n^2\\pi^2}\\]

We have b\_n, so the Fourier series for our t(x) is:

\\[t(x)=\\sum\_{n=1}^{\\infty}\\frac{8}{n^2\\pi^2}sin\\frac{n\\pi}{2}sin\\frac{n\\pi x}{2}\\]

Note that for even values of ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png), sin \\frac{n\\pi}{2} is zero, so only the odd terms remain:

\\[t(x)=\\frac{8}{\\pi^2}\\bigg[ sin\\frac{\\pi x}{2}-\\frac{1}{3^2} sin\\frac{3\\pi x}{2}+\\frac{1}{5^2}sin\\frac{5\\pi x}{2}-\\cdots\\bigg]\\]

Here’s an interactive chart showing how the series t(x) converges to our triangular function. You can set the number of terms in the Fourier series and see the effect (red line). Note that all even coefficients are zero so it will look the same for ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png) as for n-1 when ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png) is odd.

 Your browser does not support the HTML5 canvas tag.

 n (terms in the Fourier series)

Compact formula using a single phase-shifted sinusoid
----------

We’ve written the Fourier series for ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) as follows so far:

\\[f(x)=\\frac{a\_0}{2}+\\sum\_{n=1}^{\\infty}\\left(a\_n cos\\frac{n\\pi x}{L}+b\_n sin\\frac{n\\pi x}{L}\\right)\\]

We can rewrite this in a somewhat more compact form, using a single sinusoid with a configurable phase at each ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png):

\\[f(x)=\\frac{a\_0}{2}+\\sum\_{n=1}^{\\infty}q\_n\\cdot cos\\left(\\frac{n\\pi x}{L}+\\theta\_n\\right)\\]

Based on Appendix D, q\_n and \\theta\_n can be computed as follows:

\\[\\begin{aligned} q\_n&=\\sqrt{a\_n^2+b\_n^2}\\\\ \\theta\_n&=\\operatorname{atan2}(-b\_n,a\_n) \\end{aligned}\\]

When Fourier series are used in the context of signal processing, this formulation is easier to reason about because it represents the magnitude and phase shift of each harmonic of ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) in the frequency domain [[6]](#footnote-6)

Complex Fourier series
----------

It should not come as a surprise that the Fourier series, being a combination of trigonometric functions, can also be represented with complex exponential functions.

Specifically, we’ll show that our ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) can be approximated as follows:

\\[f(x)=\\sum\_{n=-\\infty}^{\\infty}C\_n\\cdot e^{in\\pi x/L}\\]

Let’s calculate C\_n. We proceed in a manner similar to before, by multiplying both sides of the equation by e^{-im\\pi x/L} and taking an integral in the range [-L,L]:

\\[\\begin{aligned} \\int\_{-L}^{L}f(x)e^{-im\\pi x/L}dx&=\\sum\_{n=-\\infty}^{\\infty}\\int\_{-L}^{L}C\_n\\cdot e^{in\\pi x/L}e^{-im\\pi x/L}dx\\\\ &=\\sum\_{n=-\\infty}^{\\infty}\\int\_{-L}^{L}C\_n\\cdot e^{i(n-m)\\pi x/L}dx \\end{aligned}\\]

By Appendix A, the sum elements are all zero when n\\neq m. When n=m, we get:

\\[\\int\_{-L}^{L}f(x)e^{-im\\pi x/L}dx=\\int\_{-L}^{L}C\_m\\cdot 1 \\cdot dx=2LC\_m\\]

Therefore, renaming m to ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png) (since it’s just an arbitrary integer constant):

\\[C\_n=\\frac{1}{2L}\\int\_{-L}^{L}f(x)e^{-in\\pi x/L}dx\\]

We’ve found an alternative formulation to Fourier series, using complex exponentials instead of trigonometric functions. While this was a direct derivation, another way to achieve the same result is to use the [Euler Formula](https://eli.thegreenplace.net/2024/notes-on-the-euler-formula/) to derive:

\\[\\begin{aligned} cos\\theta&=\\frac{e^{i\\theta}+e^{-i\\theta}}{2}\\\\ sin\\theta&=\\frac{e^{i\\theta}-e^{-i\\theta}}{2i} \\end{aligned}\\]

And substitute these into the original Fourier series formula. I’ll leave this as an exercise for the diligent reader; eventually, the result will be the same. Moreover, it’s possible to show a direct correspondence between a\_n, b\_n and C\_n, for n\>0:

\\[\\begin{aligned} C\_0&=\\frac{a\_0}{2}\\\\ C\_n&=\\frac{a\_n-ib\_n}{2}\\\\ C\_{-n}&=\\frac{a\_n+ib\_n}{2}\\\\ \\end{aligned}\\]

Note that C\_{-n}=C\_n^\* when both a\_n and b\_n are real (which is the case for a real-valued ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png)). This helps explain why the complex formulation has negative frequencies in the sum; when the function is actually real, each negative frequency is paired up with a positive frequency and the result is real [[7]](#footnote-7):

\\[\\begin{aligned} C\_n e^{in\\pi x/L}+C\_{-n} e^{-in\\pi x/L}&=C\_n e^{in\\pi x/L}+C\_n^\* e^{-in\\pi x/L}\\\\ &=C\_n e^{in\\pi x/L}+\\left(C\_{n} e^{in\\pi x/L}\\right)^\*\\\\ &=2\\operatorname{Re}\\bigg(C\_{n} e^{in\\pi x/L}\\bigg) \\end{aligned}\\]

So, for a real function we only need to account for positive frequencies:

\\[f(x)=C\_0+\\sum\_{n=1}^{\\infty}2\\operatorname{Re}\\bigg(C\_{n} e^{in\\pi x/L}\\bigg)\\]

We can take it further. C\_n is a complex number, so let’s represent it in polar form as C\_n=\\frac{q\_n}{2} e^{i\\theta\_n} (the factor of half will make sense soon). Then:

\\[\\begin{aligned} \\operatorname{Re}\\bigg(C\_{n} e^{in\\pi x/L}\\bigg)&=\\operatorname{Re}\\bigg(\\frac{q\_n}{2} e^{i\\theta\_n}e^{in\\pi x/L}\\bigg)\\\\ &=\\frac{q\_n}{2}\\operatorname{Re}\\bigg(e^{i(n\\pi x/L + \\theta\_n)}\\bigg)\\\\ &=\\frac{q\_n}{2} cos\\bigg(\\frac{n\\pi x}{L}+\\theta\_n\\bigg) \\end{aligned}\\]

And substituting back into the sum:

\\[f(x)=C\_0+\\sum\_{n=1}^{\\infty}q\_n cos\\bigg(\\frac{n\\pi x}{L}+\\theta\_n\\bigg)\\]

This is precisely the compact formulation from the previous section!

Fourier orthogonal basis in Hilbert space
----------

The most beautiful aspect of Fourier theory is that it doesn’t just happen to work by chance, and is deeply connected to linear algebra. Please read [my post on Hilbert space](https://eli.thegreenplace.net/2025/hilbert-space-treating-functions-as-vectors/) before proceeding.

The space of real-valued square integrable functions L^2 forms a Hilbert space, in which we can define the inner product (assuming real functions):

\\[\\langle f,g \\rangle=\\int\_{-L}^{L}f(x)g(x) dx\\]

We’ve demonstrated that the family of functions:

\\[1,\\qquad cos\\frac{n\\pi x}{L},\\qquad sin\\frac{n\\pi x}{L}\\]

Are all mutually orthogonal, because their pairwise inner products are zero! We’ve also shown that any function in L^2 can be represented as a weighted sum of these functions:

\\[f(x)=\\frac{a\_0}{2}+\\sum\_{n=1}^{\\infty}\\left(a\_n cos\\frac{n\\pi x}{L}+b\_n sin\\frac{n\\pi x}{L}\\right)\\]

So these functions form a *basis* for L^2. When we think of these functions as vectors (in an infinite Hilbert space), much of what we did in this post starts feeling like "normal" linear algebra. For example, when we have a set of basis vectors and we want to know how to represent some vector ![v](https://eli.thegreenplace.net/images/math/7a38d8cbd20d9932ba948efaa364bb62651d5ad4.png) in this basis, we usually find the coefficients by [projecting it](https://eli.thegreenplace.net/2024/projections-and-projection-matrices/) onto the basis. E.g. with a basis vector e\_1, the coefficient of ![v](https://eli.thegreenplace.net/images/math/7a38d8cbd20d9932ba948efaa364bb62651d5ad4.png):

\\[c=\\frac{\\langle v, e\_1\\rangle}{\\langle e\_1, e\_1\\rangle}\\]

Similarly, when we calculate the coefficient b\_n for some function ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png), we project ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) onto the basis vector sin\\frac{n\\pi x}{L} by calculating:

\\[b\_n=\\frac{\\langle f(x), sin\\frac{n\\pi x}{L}\\rangle}{\\langle sin\\frac{n\\pi x}{L}, sin\\frac{n\\pi x}{L}\\rangle}\\]

From Appendix B, we know that the denominator is L, and we’ve just denoted:

\\[\\langle f(x), sin\\frac{n\\pi x}{L}\\rangle=\\int\_{-L}^{L}f(x)sin\\frac{n\\pi x}{L}dx\\]

So we get:

\\[b\_n=\\frac{1}{L}\\int\_{-L}^{L}f(x)sin\\frac{n\\pi x}{L}dx\\]

Which should look familiar!

This is the core linear-algebra idea behind Fourier series: the functions 1, cos\\frac{n\\pi x}{L}, and sin\\frac{n\\pi x}{L} play the role of orthogonal basis vectors, while the Fourier coefficients are coordinates of ![f](https://eli.thegreenplace.net/images/math/4a0a19218e082a343a1b17e5333409af9d98f0f5.png) in this basis. The integral formulas for a\_n and b\_n are not mysterious tricks; they are projections, just like dot products with basis vectors in ordinary Euclidean space.

Fourier series therefore let us decompose a function into independent orthogonal directions, much like decomposing a vector into its ![x](https://eli.thegreenplace.net/images/math/11f6ad8ec52a2984abaafd7c3b516503785c2072.png), ![y](https://eli.thegreenplace.net/images/math/95cb0bfd2977c761298d9624e4b4d4c72a39974a.png), and z components.

Appendix A: Integrals of sinusoids
----------

For any integer n\\neq 0 and an arbitrary constant L, we have:

\\[\\begin{aligned} \\int\_{-L}^{L}cos\\frac{n\\pi x}{L}dx&=\\bigg[\\frac{L}{n\\pi}sin\\frac{n\\pi x}{L}\\bigg]\_{-L}^{L}\\\\ &=\\frac{L}{n\\pi}(sin(n\\pi)-sin(-n\\pi))=0 \\end{aligned}\\]

Similarly:

\\[\\begin{aligned} \\int\_{-L}^{L}sin\\frac{n\\pi x}{L}dx&=\\bigg[\\frac{-L}{n\\pi}cos\\frac{n\\pi x}{L}\\bigg]\_{-L}^{L}\\\\ &=\\frac{-L}{n\\pi}\\left(cos(n\\pi)-cos(-n\\pi)\\right)=0 \\end{aligned}\\]

Using these, we can calculate the integral of a complex exponential function for an integer n\\neq 0:

\\[\\begin{aligned} \\int\_{-L}^{L}e^{in\\pi x/L}dx=\\int\_{-L}^{L}\\bigg[ cos\\frac{n\\pi x}{L} +i\\cdot sin\\frac{n\\pi x}{L}\\bigg] dx=0 \\end{aligned}\\]

Appendix B: Integrals of products of sinusoids
----------

We’ll start with the product of two sines, for any positive integers m and ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png):

\\[ss=\\int\_{-L}^{L}sin\\frac{m\\pi x}{L}\\cdot sin\\frac{n\\pi x}{L}dx\\]

Using the trigonometric identity for a product of sines, we can write:

\\[\\begin{aligned} ss&=\\frac{1}{2}\\int\_{-L}^{L}\\bigg(cos\\frac{(m-n)\\pi x}{L}-cos\\frac{(m+n)\\pi x}{L}\\bigg)dx\\\\ &=\\frac{1}{2}\\int\_{-L}^{L}cos\\frac{(m-n)\\pi x}{L}dx-\\frac{1}{2}\\int\_{-L}^{L}cos\\frac{(m+n)\\pi x}{L}dx \\end{aligned}\\]

Now let’s focus on two different scenarios, m\\neq n and m=n.

If m\\neq n, then each of the integrals constituting *ss* are 0 (see on Appendix A), so ss=0.

If m=n, then the second integral is still 0, but the first one isn’t:

\\[\\begin{aligned} ss&=\\frac{1}{2}\\int\_{-L}^{L}cos\\frac{0\\pi x}{L}dx\\\\ &=\\frac{1}{2}\\int\_{-L}^{L}1dx=L \\end{aligned}\\]

Therefore:

\\[ss=\\int\_{-L}^{L}sin\\frac{m\\pi x}{L}\\cdot sin\\frac{n\\pi x}{L}dx= \\begin{cases} L & m = n \\\\ 0 & m \\neq n \\end{cases}\\]

We can use exactly the same approach to show that:

\\[cc=\\int\_{-L}^{L}cos\\frac{m\\pi x}{L}\\cdot cos\\frac{n\\pi x}{L}dx= \\begin{cases} L & m = n \\\\ 0 & m \\neq n \\end{cases}\\]

One more variant to cover:

\\[sc=\\int\_{-L}^{L}sin\\frac{m\\pi x}{L}\\cdot cos\\frac{n\\pi x}{L}dx\\]

Since sine is an odd function and cosine is an even function, their product is an odd function. And the integral of an odd function over a symmetric interval is 0 (see [this post for more details](https://eli.thegreenplace.net/2025/notes-on-even-and-odd-functions/)).

Therefore:

\\[sc=\\int\_{-L}^{L}sin\\frac{m\\pi x}{L}\\cdot cos\\frac{n\\pi x}{L}dx=0\\]

Appendix C: A useful integral
----------

Let’s calculate the indefinite integral:

\\[I=\\int x\\cdot sin(kx) dx\\]

For some constant k. We’ll use integration by parts:

\\[\\int u\\cdot dv =u\\cdot v - \\int v\\cdot du\\]

Here u=x, so du=dx. Also dv=sin(kx), so v=-\\frac{cos(kx)}{k}.

Putting it together:

\\[I=\\frac{-x\\cdot cos(kx)}{k}+\\int \\frac{cos(kx)}{k} dx=\\frac{-x\\cdot cos(kx)}{k}+\\frac{sin(kx)}{k^2}\\]

Appendix D: Sinusoid with phase as a sum of sin and cos
----------

Let’s take a general sinusoid with magnitude q, frequency ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png) and phase ![\theta](https://eli.thegreenplace.net/images/math/cb005d76f9f2e394a770c2562c2e150a413b3216.png):

\\[s(x)=q\\cdot cos(wx+\\theta)\\]

We’re going to show that s(x) can be represented as a sum of a *sine* and a *cosine* with no phase. This is related to [my earlier post on the sum of same-frequency sinusoids](https://eli.thegreenplace.net/2023/sum-of-same-frequency-sinusoids/).

Let’s start by expanding s(x) using a trigonometric identity:

\\[s(x)=q\\cdot cos(\\theta)cos(wx)-q\\cdot sin(\\theta)sin(wx)\\]

Now we’ll denote: a=q\\cdot cos(\\theta) and b=-q\\cdot sin(\\theta), so:

\\[s(x)=a\\cdot cos(wx)+b\\cdot sin(wx)\\]

We have a and b in terms of q and ![\theta](https://eli.thegreenplace.net/images/math/cb005d76f9f2e394a770c2562c2e150a413b3216.png), but what about the other way around?

Let’s take the equations:

\\[\\begin{aligned} a&=q\\cdot cos(\\theta)\\\\ b&=-q\\cdot sin(\\theta) \\end{aligned}\\]

Square both of them and add together:

\\[\\begin{aligned} a^2+b^2&=q^2\\cdot(cos^2(\\theta)+sin^2(\\theta))=q^2\\\\ &\\Rightarrow q=\\sqrt{a^2+b^2} \\end{aligned}\\]

Now we’ll take the equations for b and a and divide one by the other:

\\[\\begin{aligned} \\frac{b}{a}&=\\frac{-sin(\\theta)}{cos(\\theta)}\\\\ &\\Rightarrow\\theta=\\operatorname{atan2}(-b,a) \\end{aligned}\\]

Where [the atan2 function](https://en.wikipedia.org/wiki/Atan2) is careful to take into account the sign of both numerator and denominator. Also it’s worth mentioning that ![\theta](https://eli.thegreenplace.net/images/math/cb005d76f9f2e394a770c2562c2e150a413b3216.png) is determined up to additions of 2\\pi.

To conclude, for any q, ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png) and ![\theta](https://eli.thegreenplace.net/images/math/cb005d76f9f2e394a770c2562c2e150a413b3216.png):

\\[q\\cdot cos(wx+\\theta)=a\\cdot cos(wx)+b\\cdot sin(wx)\\]

With the aforementioned conversion formulas for a, b.

---

|[[1]](#footnote-reference-1)|A function ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) is called periodic if there exists some constant P\>0 such that f(x+P)=f(x)\\ \\forall x. In our case, we denote the period as P=2L to make presentation and calculations neater.|
|----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[2]](#footnote-reference-2)|Since f(x)\\in L^2, we know that it’s integrable on a finite interval|
|----------------------------|---------------------------------------------------------------------|

|[[3]](#footnote-reference-3)|There’s also an infinite number of less natural ways to extend the function; they will still work, but may make the calculation needlessly complicated|
|----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[4]](#footnote-reference-4)|I chose this one because the more common ones like a square wave and a sawtooth wave have many derivations available online, including on Wikipedia.|
|----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|

|[[5]](#footnote-reference-5)|Try it for yourself - it’s a good exercise.|
|----------------------------|-------------------------------------------|

|[[6]](#footnote-reference-6)|When q\_n=0 for some ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png), the corresponding \\theta\_n can be chosen arbitrarily.|
|----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[7]](#footnote-reference-7)|For a complex-valued ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png), this conjugate symmetry no longer holds in general. a\_n and b\_n may be complex, so C\_n and C\_{-n} need not be conjugates.|
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|