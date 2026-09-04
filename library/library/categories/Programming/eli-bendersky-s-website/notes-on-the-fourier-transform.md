+++
title = "Notes on the Fourier Transform"
description = "The Fourier series is a great tool for analyzing periodic functions. But what about functions that don’t repeat? We’ve seen that we can compute Fourier series for a non-periodic function defined on a finite interval, "
date = "2026-07-15T03:04:00Z"
url = "https://eli.thegreenplace.net/2026/notes-on-the-fourier-transform/"
author = "Eli Bendersky"
text = ""
lastupdated = "2026-07-16T14:36:59.304808584Z"
seen = false
+++

The Fourier series is a great tool for analyzing periodic functions. But what about functions that don’t repeat? [We’ve seen](https://eli.thegreenplace.net/2026/notes-on-fourier-series/) that we can compute Fourier series for a non-periodic function defined on a finite interval, as long as we don’t care about its behavior beyond that interval.

Let’s extend this idea to functions that *never* repeat; that is, non-periodic functions defined on the interval (-\\infty,\\infty).

Visualizing Fourier series for non-repeating functions
----------

To motivate the subject ahead, let’s look back at the example used in the earlier [post about Fourier series](https://eli.thegreenplace.net/2026/notes-on-fourier-series/):

\\[t(x)= \\begin{cases} x & 0 \\leq x \\leq 1 \\\\ 2-x & 1 \< x \\leq 2 \\\\ \\end{cases}\\]

With an odd extension into [-2,0]. In that post, to make the Fourier series work, we assumed t(x) keeps repeating with a period 2L=4 on the entire x axis. Here, let’s face the reality that it does not - in fact - repeat, and observe how our Fourier series work out.

Recall that the Fourier series approximating t(x) are the sine series (since it’s an odd function):

\\[t(x)=\\frac{8}{\\pi^2}\\bigg[ sin\\frac{\\pi x}{2}-\\frac{1}{3^2} sin\\frac{3\\pi x}{2}+\\frac{1}{5^2}sin\\frac{5\\pi x}{2}-\\cdots\\bigg]\\]

The following visualization is interactive. By default, it shows t(x) (with its odd extension) and no Fourier series approximation. We’ll proceed by a series of steps and observe the outcome:

n (terms in the Fourier series)

L

x min

x max

**Step 1**: set ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png) to some non-zero number; already at 3, the approximation is very good.

The frequency spacing is \\frac{\\pi}{L} (this is the coefficient of x in the sines). Note that the Fourier series repeats every 2L, as expected.

**Step 2**: increase L to 6. This means our series are constructed assuming t(x) has a period of 12, not 4. Note how the Fourier series look now - they repeat every 12, and they don’t match t(x) as well as before. We can increase ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png) to a higher number to make the match better. As L grows, the spacing between adjacent frequencies decreases.

**Step 3**: increase L to 10. We no longer see the repetitions, so feel free to increase the values of *x min* and *x max* until you do. Note again that we need to add more and more coefficients to match t(x) better with this larger L, and the spacing adjacent frequencies grows smaller.

Increasing L means our function repeats at larger and larger intervals. The logical conclusion of this progression is to ask - what happens if the function *never* repeats, meaning L\\rightarrow\\infty? While not mathematically rigorous, the visual experiment here lets us make some conjectures: we’ll likely need an infinite number of coefficients for a good approximation, and moreover, the spacing between these coefficients will tend to zero.

In other words, instead of a discrete set of coefficients, we’ll end up with a continuous line, or *function*. The function produced by this process is the Fourier transform of t(x), and the next section shows its mathematical derivation.

Fourier series with L\\rightarrow\\infty leading to Fourier transform
----------

In these notes, we’ll be using the complex exponential formulation of Fourier series:

\\[f(x)=\\sum\_{n=-\\infty}^{\\infty}C\_n\\cdot e^{in\\pi x/L}\\]

With:

\\[C\_n=\\frac{1}{2L}\\int\_{-L}^{L}f(x)e^{-in\\pi x/L}dx\\]

We’re interested in a non-periodic ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) defined on the interval (-\\infty,\\infty). So we’ll be exploring the above equations for L\\rightarrow\\infty.

First, let’s make a slight change of notation. Instead of writing formulae in terms of the period (2L), we’ll be using the n-th harmonic angular frequency w\_n:

\\[w\_n=\\frac{n\\pi}{L}\\]

So we can slightly rewrite our series as:

\\[f(x)=\\sum\_{n=-\\infty}^{\\infty}C\_n\\cdot e^{i w\_n x}=\\sum\_{n=-\\infty}^{\\infty}C\_n\\cdot e^{i\\cdot n \\Delta w x}\\]

Using \\Delta w as the difference between two consecutive frequencies:

\\[\\Delta w=w\_n-w\_{n-1}=\\frac{n\\pi}{L}-\\frac{(n-1)\\pi}{L}=\\frac{\\pi}{L}\\]

Using this notation, C\_n is expressed as:

\\[C\_n=\\frac{\\Delta w}{2\\pi}\\int\_{-\\pi/\\Delta w}^{\\pi/\\Delta w}f(x)e^{-i\\cdot n \\Delta w x}dx\\]

So far there are no new insights here, just some new notation. Now we’re going to use it to facilitate the next step.

Since L\\rightarrow \\infty, then \\Delta w\\rightarrow 0. Let’s calculate the limit of the Fourier series representation of ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) when \\Delta w\\rightarrow 0:

\\[f(x)=\\lim\_{\\Delta w\\rightarrow 0}\\sum\_{n=-\\infty}^{\\infty}C\_n\\cdot e^{i\\cdot n \\Delta w x}\\]

And substitute the latest C\_n into this equation, changing its dummy integration variable from x to t to avoid confusion [[1]](#footnote-1)

\\[f(x)=\\lim\_{\\Delta w\\rightarrow 0}\\sum\_{n=-\\infty}^{\\infty}\\left[\\frac{\\Delta w}{2\\pi}\\int\_{-\\pi/\\Delta w}^{\\pi/\\Delta w}f(t)e^{-i\\cdot n \\Delta w t}dt\\right]\\cdot e^{i\\cdot n \\Delta w x}\\]

Reordering slightly, and also replacing n\\Delta w by w\_n in the complex exponents:

\\[f(x)=\\frac{1}{2\\pi}\\lim\_{\\Delta w\\rightarrow 0}\\sum\_{n=-\\infty}^{\\infty}\\left[\\int\_{-\\pi/\\Delta w}^{\\pi/\\Delta w}f(t)e^{-i\\cdot w\_n t}dt\\right]\\cdot e^{i\\cdot w\_n x}\\Delta w\\]

Looking at the limit with the sum carefully, this is a Riemann sum (see Appendix A)! w\_n is the "sampled" version of ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png), and \\Delta w\\rightarrow 0. We can therefore replace it by an integral, changing w\_n to ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png) and \\Delta w to dw [[2]](#footnote-2):

\\[f(x)=\\frac{1}{2\\pi}\\int\_{-\\infty}^{\\infty}\\left[\\int\_{-\\infty}^{\\infty}f(t)e^{-i\\cdot wt}dt\\right]\\cdot e^{i\\cdot w x}dw\\]

The inner integral is called the *Fourier transform* of ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) and denoted [[3]](#footnote-3):

\\[\\boxed{\\hat{f}(w)=\\mathcal{F}\\left[f(x)\\right]=\\int\_{-\\infty}^{\\infty}f(x)e^{-i\\cdot wx}dx}\\]

And the full equation for ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) is then the *inverse* Fourier transform:

\\[\\boxed{f(x)=\\mathcal{F}^{-1}\\left[\\hat{f}(w)\\right]=\\frac{1}{2\\pi}\\int\_{-\\infty}^{\\infty}\\hat{f}(w)e^{i\\cdot w x}dw}\\]

Example calculation of Fourier transform
----------

Let’s take our favorite odd triangular pulse example and calculate its Fourier transform. The function’s mathematical definition and plot are shown earlier in this post. Note that we’re not extending this function periodically - it’s zero beyond the range [-2,2]; this is exactly why we need the Fourier transform here - as we’ve seen, Fourier series won’t do because the function they reconstruct eventually starts repeating.

We’re looking to find:

\\[\\hat{t}(w)=\\int\_{-\\infty}^{\\infty}t(x)e^{-iwx}dx\\]

To calculate the integral, let’s decompose the complex exponent using Euler’s formula:

\\[\\hat{t}(w)=\\int\_{-\\infty}^{\\infty}t(x)cos(wx)dx-i\\int\_{-\\infty}^{\\infty}t(x)sin(wx)dx\\]

Since our t(x) is odd, the [first integral is zero](https://eli.thegreenplace.net/2025/notes-on-even-and-odd-functions/). Also t(x)sin(wx) is even, so we can write:

\\[\\hat{t}(w)=-2i\\int\_{0}^{\\infty}t(x)sin(wx)dx\\]

We’ve already calculated a very similar integral in the [post on Fourier series](https://eli.thegreenplace.net/2026/notes-on-fourier-series/), so let’s just skip to the result:

\\[\\hat{t}(w)=-2i\\cdot\\frac{2\\cdot sin(w)-sin(2w)}{w^2}\\]

The only remaining difficulty is its value at 0, which seems undefined at first (division by zero). However, note that as w\\rightarrow 0, the numerator also tends to 0, so we can use L’Hopital’s rule (twice!) to find that:

\\[\\lim\_{w\\rightarrow 0} \\hat{t}(w)=0\\]

Therefore:

\\[\\hat{t}(w)= \\begin{cases} -2i\\cdot\\frac{2\\cdot sin(w)-sin(2w)}{w^2} & w\\neq 0 \\\\ 0 & w=0 \\\\ \\end{cases}\\]

This function is complex-valued; in fact, it’s purely imaginary. How do we visualize it? A common way to visualize complex-valued functions is by plotting their magnitude and phase separately.

The magnitude of \\hat{t}(w) is:

\\[|\\hat{t}(w)|=\\sqrt{\\hat{t}(w)\\cdot\\hat{t}(w)^\*}=2\\left|\\frac{2\\cdot sin(w)-sin(2w)}{w^2} \\right|\\]

Since \\hat{t}(w) is purely imaginary, there are only two options for the phase:

When the numerator is positive, we get a negative imaginary number with phase -\\pi/2, and when the numerator is negative, we get a positive imaginary number with phase \\pi/2. Finally, when \\hat{t}(w)=0 (which happens at w=0, by our earlier analysis, but also whenever ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png) is a whole multiple of \\pi), the phase is undefined.

Here’s the magnitude and phase of \\hat{t}(w) plotted against ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png):

![Magnitude and phase of the fourier transform of t(x)](https://eli.thegreenplace.net/images/2026/ft-triangle.png)

It is common to talk about \\hat{t}(w) as the *frequency domain* representation of t(x).

The frequency domain representation of functions
----------

When the functions we’re working with have *time* as their domain (e.g. the x in t(x) represents time), which is often the case in the study of signals and systems, the Fourier transform can be seen as computing the *frequency domain* representation of the function.

Here’s the Fourier transform formula again:

\\[\\hat{f}(w)=\\mathcal{F}\\left[f(x)\\right]=\\int\_{-\\infty}^{\\infty}f(x)e^{-i\\cdot wx}dx\\]

It takes ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) - the *time domain* representation of a function, and converts it to \\hat{f}(w) - a *frequency domain* representation. For well-behaved functions, these two representations are dual - each one describes the function completely, just in a different way.

To convert back from a frequency domain representation to the time domain, we use the inverse Fourier transform:

\\[\\mathcal{F}^{-1}\\left[\\hat{f}(w)\\right]=\\frac{1}{2\\pi}\\int\_{-\\infty}^{\\infty}\\hat{f}(w)e^{i\\cdot w x}dw\\]

While a time-domain plot (t(x)) shows how a signal changes over time, a frequency-domain plot (\\hat{t}(w)) shows how the signal is distributed across all possible frequencies. Moreover, as we’ve seen, \\hat{t}(w) is complex valued. Each frequency therefore has both a magnitude and a phase: the magnitude tells us how strongly that frequency contributes, while the phase tells us how that component is shifted.

The frequency domain is extremely useful in signal analysis; for example, when designing filters.

The Fourier transform also has a number of properties that are very useful in signal analysis and processing. But first, let’s discuss what a "well-behaved function" means for the purpose of applying Fourier transforms.

Existence condition for the Fourier transform
----------

The simplest existence condition for Fourier transforms is absolute integrability (also known as Lebesgue integrable):

\\[\\int\_{-\\infty}^{\\infty}|f(x)|dx\<\\infty\\]

With this condition, \\hat{f}(w) exists on the entire ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png) domain, is continuous and vanishes (tends to 0) as |w|\\rightarrow\\infty [[4]](#footnote-4).

While this condition is sufficient, it’s not necessary; there are less well-behaved functions that also have Fourier transforms defined with some limitations. In these notes, we’re mostly interested in well-behaved functions that are used in real-world engineering, so we won’t discuss the other cases.

Another assumption commonly made for real-world functions is that they vanish (tend to 0) as |x|\\rightarrow\\infty. While this is not a direct outcome of absolute integrability [[5]](#footnote-5), it’s a reasonable assumption in engineering. After all, real-world signals have finite energies.

Intuitively, when we also assume ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) is [uniformly continuous](https://en.wikipedia.org/wiki/Uniform_continuity), the assumption of vanishing at |x|\\rightarrow\\infty is a logical conclusion, because otherwise how can the total area for |f(x)| be finite?

An important outcome of this discussion is that the Fourier transform is unsuitable for periodic functions. Functions that repeat at intervals *are not absolute integrable*. For periodic functions, we use Fourier series.

Some useful properties of Fourier transforms
----------

**Linearity**

The Fourier transform is a linear operator, because the integral is linear:

\\[\\begin{aligned} \\mathcal{F}\\left[\\alpha f(x)+\\beta g(x)\\right]&=\\int\_{-\\infty}^{\\infty}\\alpha f(x)e^{-i\\cdot wx}dx+\\int\_{-\\infty}^{\\infty}\\beta g(x)e^{-i\\cdot wx}dx\\\\ &=\\alpha\\int\_{-\\infty}^{\\infty}f(x)e^{-i\\cdot wx}dx+\\beta\\int\_{-\\infty}^{\\infty}g(x)e^{-i\\cdot wx}dx\\\\ &=\\alpha\\mathcal{F}\\left[f(x)\\right]+\\beta\\mathcal{F}\\left[g(x)\\right] \\end{aligned}\\]

So is the inverse Fourier transform; it’s similarly easy to show that:

\\[\\mathcal{F}^{-1}\\left[\\alpha\\hat{f}(w)+\\beta\\hat{g}(w)\\right]= \\alpha\\mathcal{F}^{-1}\\left[\\hat{f}(w)\\right]+\\beta\\mathcal{F}^{-1}\\left[\\hat{g}(w)\\right]\\]

**Scaling**

If we scale the domain of a function by a constant, its transform changes only slightly:

\\[\\mathcal{F}\\left[f(ax)\\right]=\\int\_{-\\infty}^{\\infty}f(ax)e^{-i\\cdot wx}dx\\]

Let’s do the variable substitution u=ax:

\\[\\mathcal{F}\\left[f(ax)\\right]=\\frac{1}{a}\\int\_{-\\infty}^{\\infty}f(u)e^{-i\\cdot \\frac{wu}{a}}du\\]

This is the Fourier transform evaluated at \\frac{w}{a}, so:

\\[\\mathcal{F}\\left[f(ax)\\right]=\\frac{1}{a}\\hat{f}\\left(\\frac{w}{a}\\right)\\]

There’s one small caveat here; when a is negative, the integral bounds should be flipped, causing a minus sign in front of the transform. So we can write:

\\[\\mathcal{F}\\left[f(ax)\\right]=\\frac{1}{|a|}\\hat{f}\\left(\\frac{w}{a}\\right)\\]

Which works for any a\\ne 0.

This property is intuitive when thinking about signals: suppose a\>0, then f(ax) means the signal is *compressed* in the time domain by a factor a. The scaling property says that the frequency domain is *expanded* using the same factor; in other words, the higher frequencies become more prominent because we need sharper transitions to represent the compressed signal.

**Time shifting**

What happens to the Fourier transform if we time-shift the input signal by some constant: f(x-x\_0). By definition:

\\[\\mathcal{F}\\left[f(x-x\_0)\\right]=\\int\_{-\\infty}^{\\infty}f(x-x\_0)e^{-i\\cdot wx}dx\\]

Substituting u=x-x\_0, we get du=dx, so:

\\[\\begin{aligned} \\mathcal{F}\\left[f(x-x\_0)\\right]&=\\int\_{-\\infty}^{\\infty}f(u)e^{-i\\cdot w(u+x\_0)}du\\\\ &=e^{-iwx\_0}\\int\_{-\\infty}^{\\infty}f(u)e^{-i\\cdot wu}du\\\\ &=e^{-iwx\_0}\\mathcal{F}\\left[f(x)\\right] \\end{aligned}\\]

**Transform of a derivative**

An extremely useful property that’s often employed in the solution of partial differential equations; let’s calculate the Fourier transform of the derivative of ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png):

\\[\\mathcal{F}\\left[f'(x)\\right]=\\int\_{-\\infty}^{\\infty}f'(x)e^{-i\\cdot wx}dx\\]

We’ll use integration by parts, where dv=f'(x) and u=e^{-i\\cdot wx}. Therefore, v=f(x) and du=-iw\\cdot e^{-i\\cdot wx}:

\\[\\mathcal{F}\\left[f'(x)\\right]=\\left[f(x)e^{-i\\cdot wx}\\right]^{\\infty}\_{-\\infty}-\\int\_{-\\infty}^{\\infty}f(x)(-iw\\cdot e^{-i\\cdot wx})dx\\]

Recall the assumption made in the "Existence condition..." section about ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) vanishing at infinities. So the first part of the equation above is zero, and we’re left with:

\\[\\begin{aligned} \\mathcal{F}\\left[f'(x)\\right]&=-\\int\_{-\\infty}^{\\infty}f(x)(-iw\\cdot e^{-i\\cdot wx})dx\\\\ &=iw\\int\_{-\\infty}^{\\infty}f(x)e^{-i\\cdot wx}dx\\\\ &=iw\\cdot\\mathcal{F}\\left[f(x)\\right] \\end{aligned}\\]

**Transform of convolution**

The convolution between two continuous functions ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) and g(x) is defined as:

\\[(f\\ast g)(x)=\\int\_{-\\infty}^{\\infty}f(\\xi)g(x-\\xi)d\\xi\\]

Let’s calculate the Fourier transform of this function:

\\[\\begin{aligned} \\mathcal{F}\\left[(f\\ast g)(x)\\right]&=\\int\_{-\\infty}^{\\infty}e^{-i\\cdot wx}\\left[\\int\_{-\\infty}^{\\infty}f(\\xi)g(x-\\xi)d\\xi\\right]dx\\\\ &=\\int\_{-\\infty}^{\\infty}\\int\_{-\\infty}^{\\infty}e^{-i\\cdot wx}f(\\xi)g(x-\\xi)d\\xi\\ dx \\end{aligned}\\]

This step of combining the integrals into a double integral, as well as the next step (changing the order of integration) is possible due to [Fubini’s theorem](https://en.wikipedia.org/wiki/Fubini's_theorem) and our assumption that ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) and g(x) are Lebesgue integrable.

Switch order of integration:

\\[\\mathcal{F}\\left[(f\\ast g)(x)\\right]=\\int\_{-\\infty}^{\\infty}\\int\_{-\\infty}^{\\infty}e^{-i\\cdot wx}f(\\xi)g(x-\\xi)dx\\ d\\xi\\]

Now, f(\\xi) in the inner integral doesn’t depend on x, so we can pull it out:

\\[\\mathcal{F}\\left[(f\\ast g)(x)\\right]=\\int\_{-\\infty}^{\\infty}f(\\xi)\\int\_{-\\infty}^{\\infty}e^{-i\\cdot wx}g(x-\\xi)dx\\ d\\xi\\]

The inner integral is just the Fourier transform of a time-shifted g(x-\\xi), so we can write:

\\[\\mathcal{F}\\left[(f\\ast g)(x)\\right]=\\int\_{-\\infty}^{\\infty}f(\\xi)e^{-i\\cdot w\\xi}\\mathcal{F}\\left[g(x)\\right]d\\xi=\\mathcal{F}\\left[g(x)\\right]\\int\_{-\\infty}^{\\infty}e^{-i\\cdot w\\xi}f(\\xi)d\\xi\\]

And the remaining integral is the Fourier transform of ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png), so:

\\[\\mathcal{F}\\left[(f\\ast g)(x)\\right]=\\mathcal{F}\\left[f\\right]\\cdot\\mathcal{F}\\left[g\\right]\\]

Convolution in the time domain translates to multiplication in the frequency domain! This result is so important in signal processing that it’s called *the convolution theorem*.

Appendix A: Riemann sum and the definite integral
----------

Suppose we have some function ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png) and we want to know the area bounded between this function’s graph and the x axis in a certain interval [a,b]. One way to do this is to take a [partition](https://en.wikipedia.org/wiki/Partition_of_an_interval) of the interval:

\\[a=x\_0\<x\_1\<\\cdots\<x\_{n-1}\<x\_n=b\\]

And calculate the area under ![f](https://eli.thegreenplace.net/images/math/4a0a19218e082a343a1b17e5333409af9d98f0f5.png) for every element of the partition. We can then approximate such sub-areas by rectangles, as follows:

![Riemann sum plot](https://eli.thegreenplace.net/images/2026/riemann-sum.png)

We’ll denote the area of each rectangle as f(x^\*\_i)\\cdot\\Delta x:

* \\Delta x=(b-a)/n is the width of one interval (assuming a uniform partition, but the math works just as well for non-uniform ones).
* x^\*\_i is some value in the interval [x\_{i-1},x\_i].

There are many ways to choose which point of the interval [x\_{i-1},x\_i] to denote as x^\*\_i: left point (x\_{i-1}), right point (![x_i](https://eli.thegreenplace.net/images/math/34e03e6559b14df9fe5a97bbd2ed10109dfebbd3.png)), mid-point between the two (which is what our plot shows) or anything in between. The distinction doesn’t really matter for our purpose, as we will soon see.

We can approximate the area under the curve of ![f](https://eli.thegreenplace.net/images/math/4a0a19218e082a343a1b17e5333409af9d98f0f5.png) in the interval [a,b] with the **Riemann sum**, using a uniform partition:

\\[S=\\sum\_{i=1}^{n}f(x^\*\_i)\\Delta x\\]

If ![f](https://eli.thegreenplace.net/images/math/4a0a19218e082a343a1b17e5333409af9d98f0f5.png) is continuous on [a,b], then as n\\rightarrow \\infty:

\\[S=\\lim\_{n\\rightarrow \\infty}\\sum\_{i=1}^{n}f(x^\*\_i)\\Delta x=\\int\_{a}^{b}f(x)dx\\]

This is known as the **Riemann integral**, or just the definite integral. The limit is why the exact choice of x^\*\_i doesn’t matter: as n\\rightarrow\\infty we have \\Delta x\\rightarrow 0, and all points within [x\_{i-1}, x\_i] are equally good.

---

|[[1]](#footnote-reference-1)|Note that C\_n is not a function of x; in its definition, x only serves as a dummy integration variable and can be called anything we choose. When we substitute C\_n into the equation for ![f(x)](https://eli.thegreenplace.net/images/math/3e03f4706048fbc6c5a252a85d066adf107fcc1f.png), which *is* a function of x, we have to be careful. Thus the renaming.|
|----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[2]](#footnote-reference-2)|Note we apply the limit; therefore, the bounds of the inner integral (in the square brackets) are now also between -\\infty and \\infty|
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------|

|[[3]](#footnote-reference-3)|We change the dummy integration variable back to x here, for consistency. Once again, since x is just the integration variable and the integral is definite, the final result doesn’t depend on x. It’s a function of ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png).|
|----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[4]](#footnote-reference-4)|The vanishing at infinity part is the Riemann-Lebesgue lemma; you can find a proof on Wikipedia|
|----------------------------|-----------------------------------------------------------------------------------------------|

|[[5]](#footnote-reference-5)|A pathological absolute-integrable function can have spikes at infinity but still have a finite total area.|
|----------------------------|-----------------------------------------------------------------------------------------------------------|