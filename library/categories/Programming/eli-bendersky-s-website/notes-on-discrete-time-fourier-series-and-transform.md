+++
title = "Notes on discrete-time Fourier series and transform"
description = "The following are my notes on discrete-time Fourier series (DTFS), as well as the discrete-time Fourier transform (DTFT). These topics serve as an important theoretical underpinning to the digital processing of signals by computers using the DFT (which will be covered in a future"
date = "2026-09-19T16:39:00Z"
url = "https://eli.thegreenplace.net/2026/notes-on-discrete-time-fourier-series-and-transform/"
author = "Eli Bendersky"
text = ""
lastupdated = "2026-09-21T09:42:46.637867480Z"
seen = false
+++

The following are my notes on discrete-time Fourier series (DTFS), as well as the discrete-time Fourier transform (DTFT). These topics serve as an important theoretical underpinning to the digital processing of signals by computers using the DFT (which will be covered in a future post).

For discrete-time signals, we use the square bracket notation to denote samples: x[n] is the n-th sample of signal x.

We’ll say that a discrete-time (just *discrete* from this point on, for brevity) signal is periodic with period N if:

\\[x[n]=x[n+N]\\qquad\\forall{n}\\]

When talking about [continuous-time Fourier series](https://eli.thegreenplace.net/2026/notes-on-fourier-series/), we started with real trigonometric functions and later moved to complex exponentials. Here, we’ll just go ahead and start directly with (discrete) complex exponentials - converting between the two representations isn’t difficult and can be done as needed (Appendix C in this post demonstrates it).

We’ll be dealing with the following family of signals [[1]](#footnote-1):

\\[\\phi\_k[n]=e^{ikw\_0n}=e^{ik(2\\pi/N)n}\\qquad \\forall k\\in\\mathbb{Z}\\]

These are discrete complex exponentials that are periodic with period N. w\_0=\\frac{2\\pi}{N} is the *angular frequency*. As discussed in Appendix A, there are only N such distinct signals, since:

\\[\\phi\_k[n]=\\phi\_{k+N}[n]\\qquad\\forall{k}\\]

Coefficients of discrete-time Fourier series
----------

We’ll want to consider the representation of an arbitrary N-periodic x[n] by a linear combination of \\phi\_k[n]:

\\[x[n]=\\sum\_{k=\\langle N\\rangle}a\_k\\phi\_k[n]\\]

The notation k=\\langle N\\rangle means k runs over any sequence of N consecutive integers. Since there are only N distinct signals \\phi\_k, the order of summation doesn’t matter - as long as all of them are used. So it could go from 0 to N-1, or from 1 to N, or from 2 to N+1, and so on. All of these orders will enumerate all distinct \\phi\_k.

Going back to our linear combination:

\\[x[n]=\\sum\_{k=\\langle N\\rangle}a\_k\\phi\_k[n]=\\sum\_{k=\\langle N\\rangle}a\_ke^{ikw\_0n}\\]

This is the discrete-time Fourier series (DTFS) representation of x[n] and the coefficients a\_k are the Fourier series coefficients. Note that there are no convergence issues as in the continuous case, because we’re dealing with a finite sum.

To find the coefficients a\_k, we’ll proceed in a way that’s somewhat similar to the continuous case. Multiply both sides of the equation above by e^{-ir(2\\pi/N)n} and sum over N terms:

\\[\\sum\_{n=\\langle N\\rangle}x[n]e^{-ir(2\\pi/N)n}= \\sum\_{n=\\langle N\\rangle}\\sum\_{k=\\langle N\\rangle}a\_ke^{i(k-r)(2\\pi/N)n}\\]

Interchanging the order of summation on the right-hand side:

\\[\\sum\_{n=\\langle N\\rangle}x[n]e^{-ir(2\\pi/N)n}= \\sum\_{k=\\langle N\\rangle}a\_k\\sum\_{n=\\langle N\\rangle}e^{i(k-r)(2\\pi/N)n}\\]

By Appendix B, the inner sum on the right-hand side is equal to N when N\\mid r-k and to 0 otherwise. Without loss of generality - since we iterate over N consecutive values - let’s just assume this happens in our sum when r=k (and therefore r-k=0, which is an integer multiple of N).

So our equation becomes:

\\[\\sum\_{n=\\langle N\\rangle}x[n]e^{-ir(2\\pi/N)n}=a\_r N\\]

Or:

\\[a\_r=\\frac{1}{N}\\sum\_{n=\\langle N\\rangle}x[n]e^{-ir(2\\pi/N)n}\\]

To conclude, the Fourier decomposition of a periodic discrete signal x[n] into periodic complex exponentials is:

\\[\\boxed{ \\begin{aligned} x[n]&=\\sum\_{k=\\langle N\\rangle}a\_k e^{ik(2\\pi/N)n}\\\\ \\vspace{2pt}\\\\ a\_k&=\\frac{1}{N}\\sum\_{n=\\langle N\\rangle}x[n]e^{-ik(2\\pi/N)n} \\end{aligned} }\\]

Example: revisiting the triangular function
----------

Let’s revisit the triangular function t(x) from [the post on Fourier series](https://eli.thegreenplace.net/2026/notes-on-fourier-series). Here, we’ll be using the following *sampled* version:

 Your browser does not support the HTML5 canvas tag.

The sampling is done with 12 samples per period of 4. The spacing between two samples is \\Delta x=\\frac{1}{3}. Another way to express it:

\\[t\_d[n]=t(n/3)\\]

Substituting this into the definition of t(x), we get:

\\[t\_d[n]= \\begin{cases} \\frac{n}{3} & 0 \\leq n \\leq 3 \\\\ 2-\\frac{n}{3} & 3 \< n \\leq 6 \\\\ \\end{cases}\\]

We then do an odd extension [[2]](#footnote-2) to the range n=[6..12), and repeat it with period N=12.

Using considerations similar to the [continuous time case](https://eli.thegreenplace.net/2026/notes-on-fourier-series/), because our function is odd we just need a sine series here:

\\[t\_d[n]=\\sum\_{k=1}^{5}b\_k sin\\frac{k\\pi n}{6}\\]

The five terms correspond to the five pairs of nonzero-frequency indices; see Appendix C.

And the coefficients are:

\\[b\_k=\\frac{1}{6}\\sum\_{n=0}^{11}t\_d[n]sin\\frac{k\\pi n}{6}\\\\\\]

We can run this sum over half the period, because the terms at ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png) and 12-n are equal (both t\_d[n] and the sine change signs). Also, the terms at n=0 and n=6 vanish because t\_d[0]=t\_d[6]=0:

\\[b\_k=\\frac{1}{3}\\sum\_{n=1}^{5}t\_d[n]sin\\frac{k\\pi n}{6}\\\\\\]

Looking at the values of t\_d:

\\[b\_1=\\frac{1}{3}\\left(\\frac{1}{3}sin\\frac{\\pi}{6}+\\frac{2}{3}sin\\frac{2\\pi}{6}+sin\\frac{3\\pi}{6}+\\frac{2}{3}sin\\frac{4\\pi}{6}+\\frac{1}{3}sin\\frac{\\pi}{6}\\right)=\\frac{4+2\\sqrt{3}}{9}\\]

We can similarly calculate all b\_k until k=5:

\\[\\begin{aligned} b\_1&=\\frac{4+2\\sqrt{3}}{9}\\\\ b\_2&=0\\\\ b\_3&=-\\frac{1}{9}\\\\ b\_4&=0\\\\ b\_5&=\\frac{4-2\\sqrt{3}}{9}\\\\ \\end{aligned}\\]

The resulting Fourier series is therefore:

\\[t\_d[n]=\\frac{4+2\\sqrt{3}}{9}sin\\frac{\\pi n}{6}-\\frac{1}{9}sin\\frac{\\pi n}{2}+\\frac{4-2\\sqrt{3}}{9}sin\\frac{5\\pi n}{6}\\]

You can use the following interactive plot to explore this approximation to the discrete triangle function t\_d[n]:

 Your browser does not support the HTML5 canvas tag.

Terms in the Fourier series 1 2 3

The dropdown box selects how many of the terms in the series shown above to plot. The orange crosses show where the series’ values at the integer indices are, and the orange line is interpolated to better visualize the sine waves being added. Note that when all the coefficients are used, the DTFS *exactly* reconstructs the input signal.

Discrete-time Fourier Transform (DTFT)
----------

In the post on [the Fourier Transform](https://eli.thegreenplace.net/2026/notes-on-the-fourier-transform/) we’ve seen how non-periodic signals can be represented in the frequency domain by taking the Fourier series and calculating them at the limit L\\rightarrow\\infty. Here, we’ll do something similar for discrete signals.

Suppose we have a non-periodic discrete signal x[n] of finite duration (it’s zero outside a finite range of indices). Here’s a sample plot:

 Your browser does not support the HTML5 canvas tag.

The bottom half is x\_N[n] - a periodic signal, one period (N) of which is equal to x[n]. We choose M large enough that x[n]=0 outside [-M,M] and set N=2M+1.

Since x\_N is periodic, we can represent it with DTFS [[3]](#footnote-3):

\\[\\begin{aligned} x\_N[n]&=\\sum\_{k=-M}^{M}a\_k e^{ik(2\\pi/N)n}\\\\ a\_k&=\\frac{1}{N}\\sum\_{n=-M}^{M}x[n]e^{-ik(2\\pi/N)n} \\end{aligned}\\]

We’ll use the notation of angular frequency:

\\[\\Delta w=\\frac{2\\pi}{N}\\qquad w\_k=k\\Delta w\\]

Then:

\\[\\begin{aligned} x\_N[n]&=\\sum\_{k=-M}^{M}a\_k e^{i w\_k n}\\\\ a\_k&=\\frac{1}{N}\\sum\_{n=-M}^{M}x[n]e^{-i w\_k n} \\end{aligned}\\]

Now the critical part; since x[n] is zero outside [-M,M], extending the summation to all integers does not change its value:

\\[a\_k=\\frac{1}{N}\\sum\_{n=-\\infty}^{\\infty}x[n]e^{-i w\_k n}\\]

We’ll define the following *continuous* function with variable ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png):

\\[X(w)=\\sum\_{n=-\\infty}^{\\infty}x[n]e^{-i w n}\\]

Then at points w\_k:

\\[a\_k=\\frac{1}{N}X(w\_k)\\]

The function X(w) is the discrete-time Fourier transform (DTFT) of x[n]. The inverse DTFT process reconstructs x[n] from X(w), by substituting a\_k back into the DTFS:

\\[x\_N[n]=\\sum\_{k=-M}^{M}\\frac{1}{N}X(w\_k) e^{i w\_k n}\\]

By our definition of \\Delta w, we have:

\\[\\frac{1}{N}=\\frac{\\Delta w}{2\\pi}\\]

Therefore:

\\[x\_N[n]=\\frac{1}{2\\pi}\\sum\_{k=-M}^{M}X(w\_k) e^{i w\_k n}\\Delta w\\]

Just like in the continuous case, we recognize the sum as a *Riemann sum*. Let M\\rightarrow\\infty. The spacing \\Delta w tends to zero, and we can rewrite the sum as an integral:

\\[x[n]=\\lim\_{M\\rightarrow\\infty}x\_N[n]=\\frac{1}{2\\pi}\\int\_{-\\pi}^{\\pi}X(w)e^{iwn}dw\\]

To conclude, the DTFT and inverse DTFT pair are:

\\[\\boxed{ \\begin{aligned} X(w)&=\\sum\_{n=-\\infty}^{\\infty}x[n]e^{-i w n}\\\\ \\vspace{2pt}\\\\ x[n]&=\\frac{1}{2\\pi}\\int\_{-\\pi}^{\\pi}X(w)e^{iwn}dw \\end{aligned} }\\]

X(w) is a continuous, periodic function with period 2\\pi, because:

\\[\\begin{aligned} X(w+2\\pi)&=\\sum\_{n=-\\infty}^{\\infty}x[n]e^{-i (w+2\\pi) n}\\\\ &=\\sum\_{n=-\\infty}^{\\infty}x[n]e^{-i w n}e^{-i 2\\pi n}\\\\ &=\\sum\_{n=-\\infty}^{\\infty}x[n]e^{-i w n}=X(w)\\\\ \\end{aligned}\\]

Therefore, it’s enough to run the integral on any interval of length 2\\pi.

The DTFS and DTFT are closely related. Starting with a finite-duration signal x[n], we form a periodic signal by repeating a block of N samples containing it. Its DTFS coefficients are equally spaced, scaled samples of the DTFT:

\\[a\_k=\\frac{1}{N}X\\left(\\frac{2\\pi k}{N}\\right)\\]

The relation is similar to the one between Fourier series and the Fourier transform in the continuous case.

The DTFT also has useful properties similar to the continuous Fourier transform: linearity, time shifting, the convolution theorem etc, but we won’t spend time on them here.

Appendix A: Discrete-time complex exponentials
----------

Discrete-time complex exponentials have the form e^{iw\_0n} where w\_0 is the *angular frequency*. The discrete nature of these functions leads to some interesting outcomes; for example, consider the exponential with angular frequency w\_0+2\\pi:

\\[e^{i(w\_0+2\\pi)n}=e^{iw\_0n}e^{i2\\pi n}=e^{iw\_0n}\\]

Therefore, the exponential at w\_0+2\\pi is *exactly the same* as the exponential at w\_0. In considering discrete complex exponentials, we need only choose w\_0 from a range of length 2\\pi.

Another interesting aspect of these functions concerns their periodicity. In order for e^{iw\_0n} to be periodic with some positive integer period N, the following must hold:

\\[e^{iw\_0(n+N)}=e^{iw\_0n}\\]

In other words:

\\[e^{iw\_0N}=1\\]

So w\_0N itself must be an integral multiple of 2\\pi. For some integer k:

\\[w\_0N=k\\cdot(2\\pi)\\Longrightarrow w\_0=\\frac{k2\\pi}{N}\\]

For a fixed positive integer N, let’s consider all complex exponentials for which N is a period:

\\[\\phi\_k[n]=e^{ik(2\\pi/N)n}\\qquad \\forall k\\in\\mathbb{Z}\\]

But earlier we’ve said that all complex exponentials with angular frequencies 2\\pi apart are identical. This means that the set above consists of only N distinct exponentials. We can choose any starting k and get distinct signals with k, k+1, k+2 and so on until k+N-1. After that, they begin repeating: \\phi\_N[n]=\\phi\_0[n] and so on.

All of this is very different from the continuous case, where t is a real number. The signals e^{iw\_0t} and e^{i(w\_0+2\\pi)t} agree only at integer values of t, so they are distinct functions of t\\in\\mathbb{R}. Consequently, for a fixed positive period ![T](https://eli.thegreenplace.net/images/math/c2c53d66948214258a26ca9ca845d7ac0c17f8e7.png), the continuous-time exponentials e^{ik(2\\pi/T)t} are distinct for every integer k, giving infinitely many distinct signals.

Appendix B: Sum of consecutive complex exponentials
----------

Let’s consider the following discrete function, defined by a sum:

\\[A[k]=\\sum\_{n=0}^{N-1}e^{i(2\\pi/N)kn}\\]

We’ll want to consider two cases:

(1) When k is an integer multiple of N: k=rN for some integer r (for example k=0, k=N, k=-2N etc.)

In this case, the sum becomes:

\\[A[k]=\\sum\_{n=0}^{N-1}e^{i(2\\pi/N)rNn}=\\sum\_{n=0}^{N-1}e^{i2\\pi rn}\\]

Since both r and ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png) are integers, the exponent is an integer multiple of 2\\pi i, so:

\\[A[k]=\\sum\_{n=0}^{N-1}1=N\\]

(2) When k is not an integer multiple of N, let’s do a variable change p=n+1:

\\[A[k]=\\sum\_{p=1}^{N}e^{i(2\\pi/N)k(p-1)}\\]

We can now use the finite sum formula for a geometric progression with the common ratio r=e^{i(2\\pi/N)k}; the sum is:

\\[S\_N=\\frac{1-r^N}{1-r}\\]

Note that r\\neq 1 because k is not an integer multiple of N. However:

\\[r^N=e^{i(2\\pi/N)kN}=1\\]

Therefore:

\\[A[k]=S\_N=0\\]

While these calculations demonstrate the sums from n=0 to N-1, they work exactly the same for any N consecutive indices, because the summand is periodic in ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png) with period N. Therefore:

\\[A[k]=\\sum\_{n=\\langle N\\rangle}e^{i(2\\pi/N)kn}= \\begin{cases} N & N\\mid k\\\\ 0 & \\text{otherwise} \\end{cases}\\]

Appendix C: Sine series decomposition of t\_d[n]
----------

Using the formula for DTFS developed earlier in the post:

\\[\\begin{aligned} a\_k&=\\frac{1}{12}\\sum\_{n=0}^{11}t\_d[n]e^{-ik(\\pi/6)n}\\\\ &=\\frac{1}{12}\\sum\_{n=0}^{11}t\_d[n]cos\\frac{k\\pi n}{6}-i\\frac{1}{12}\\sum\_{n=0}^{11}t\_d[n]sin\\frac{k\\pi n}{6}\\\\ \\end{aligned}\\]

Recall that t\_d[n] is odd over the full range n=[0..12). Specifically, since the cosine is an even function, we have for any m:

\\[\\begin{aligned} t\_d[12-m]&=-t\_d[m]\\\\ cos\\frac{k\\pi(12-m)}{6}&=cos(2\\pi k -\\frac{k\\pi m}{6})=cos\\frac{k\\pi m}{6}\\\\ \\end{aligned}\\]

Therefore the cosine terms cancel out throughout the period; term 1 is the same as negative term 11, etc.

We’re left with the sines:

\\[a\_k=-i\\frac{1}{12}\\sum\_{n=0}^{11}t\_d[n]sin\\frac{k\\pi n}{6}\\]

All coefficients are purely imaginary. For convenience, let’s write:

\\[\\begin{aligned} b\_k&=\\frac{1}{6}\\sum\_{n=0}^{11}t\_d[n]sin\\frac{k\\pi n}{6}\\\\ a\_k&=\\frac{-i b\_k}{2}\\\\ \\end{aligned}\\]

Let’s turn back to the Fourier reconstruction formula:

\\[t\_d[n]=\\sum\_{k=\\langle N\\rangle}a\_k e^{ik(2\\pi/N)n}\\]

And pair up exponentials at k with ones at 12-k:

\\[e^{i(12-k)\\pi n/6}=e^{i2\\pi n}e^{-ikn\\pi/6}=e^{-ikn\\pi/6}\\]

Also, since t\_d[n] are real, the conjugate of a\_k is:

\\[a\_{12-k}=a\_k^\*=\\frac{ib\_k}{2}\\]

So adding the paired exponentials with their coefficients and using Euler’s formula:

\\[\\begin{aligned} a\_ke^{i k\\pi n/6}+a\_{12-k}e^{-i k\\pi n/6}&=-\\frac{ib\_k}{2}e^{i k\\pi n/6}+\\frac{ib\_k}{2}e^{-i k\\pi n/6}\\\\ &=b\_k\\frac{e^{i k\\pi n/6}-e^{-i k\\pi n/6}}{2i}\\\\ &=b\_k sin\\frac{k\\pi n}{6} \\end{aligned}\\]

Therefore:

\\[t\_d[n]=\\sum\_{k=0}^{11}a\_k e^{ik(2\\pi/N)n}=\\sum\_{k=1}^{5}b\_k sin\\frac{k\\pi n}{6}\\]

We don’t include the terms at k=0 and k=6, because a\_0=a\_6=0 (sine of an integral multiple of \\pi).

---

|[[1]](#footnote-reference-1)|There are a lot of symbols used in this equation. ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png) is the "time" index of the signal x[n] - its domain; k enumerates the k-th function \\phi\_k from a family of functions - each \\phi\_k[n] is a function of ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png); N is the period; ![i](https://eli.thegreenplace.net/images/math/042dc4512fa3d391c5170cf3aa61e6a638f84342.png) is the imaginary unit.|
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[2]](#footnote-reference-2)|The odd extension may be slightly confusing because we don’t use negative indices. But indices are arbitrary! In our case, within a single period index -n is equivalent to 12-n; if we consider one period around the halfway point of n=6, it’s easy to see that the function is indeed odd.|
|----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[3]](#footnote-reference-3)|Note that we use x[n], not x\_N[n] in the summation for a\_k. This is because within the chosen range they are equal.|
|----------------------------|---------------------------------------------------------------------------------------------------------------------|