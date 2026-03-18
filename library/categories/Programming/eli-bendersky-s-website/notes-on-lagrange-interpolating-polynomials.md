+++
title = "Notes on Lagrange Interpolating Polynomials"
description = 'Polynomial interpolation is a method of finding a polynomial function that fits a given set of data perfectly. More concretely, suppose we have a set of n+1 distinct points [1]:\\[(x\_0,y\_0), (x\_1, y\_1), (x\_2, y\_2)\\cdots(x\_n, y\_n)\\]And we want to find th'
date = "2026-03-01T02:58:00Z"
url = "https://eli.thegreenplace.net/2026/notes-on-lagrange-interpolating-polynomials/"
author = "Eli Bendersky"
text = ""
lastupdated = "2026-03-18T21:57:51.383401404Z"
seen = false
+++

*Polynomial interpolation* is a method of finding a polynomial function that fits a given set of data perfectly. More concretely, suppose we have a set of n+1 distinct points [[1]](#footnote-1):

\\[(x\_0,y\_0), (x\_1, y\_1), (x\_2, y\_2)\\cdots(x\_n, y\_n)\\]

And we want to find the polynomial coefficients {a\_0\\cdots a\_n} such that:

\\[p(x)=a\_0 + a\_1 x + a\_2 x^2 + \\cdots + a\_n x^n\\]

Fits all our points; that is p(x\_0)=y\_0, p(x\_1)=y\_1 etc.

This post discusses a common approach to solving this problem, and also shows why such a polynomial exists and is unique.

Showing existence using linear algebra
----------

When we assign all points (x\_i, y\_i) into the generic polynomial p(x), we get:

\\[\\begin{aligned} p(x\_0)&=a\_0 + a\_1 x\_0 + a\_2 x\_0^2 + \\cdots a\_n x\_0^n = y\_0\\\\ p(x\_1)&=a\_0 + a\_1 x\_1 + a\_2 x\_1^2 + \\cdots a\_n x\_1^n = y\_1\\\\ p(x\_2)&=a\_0 + a\_1 x\_2 + a\_2 x\_2^2 + \\cdots a\_n x\_2^n = y\_2\\\\ \\cdots \\\\ p(x\_n)&=a\_0 + a\_1 x\_n + a\_2 x\_n^2 + \\cdots a\_n x\_n^n = y\_n\\\\ \\end{aligned}\\]

We want to solve for the coefficients a\_i. This is a linear system of equations that can be represented by the following matrix equation:

\\[{\\renewcommand{\\arraystretch}{1.5}\\begin{bmatrix} 1 & x\_0 & x\_0^2 & \\dots & x\_0^n\\\\ 1 & x\_1 & x\_1^2 & \\dots & x\_1^n\\\\ 1 & x\_2 & x\_2^2 & \\dots & x\_2^n\\\\ \\vdots & \\vdots & \\vdots & \\ddots &\\vdots \\\\ 1 & x\_n & x\_n^2 & \\dots & x\_n^n \\end{bmatrix} \\begin{bmatrix} a\_0\\\\ a\_1\\\\ a\_2\\\\ \\vdots\\\\ a\_n\\\\ \\end{bmatrix}= \\begin{bmatrix} y\_0\\\\ y\_1\\\\ y\_2\\\\ \\vdots\\\\ y\_n\\\\ \\end{bmatrix} }\\]

The matrix on the left is called the *Vandermonde matrix*. This matrix is known to be invertible (see Appendix for a proof); therefore, this system of equations has a single solution that can be calculated by inverting the matrix.

In practice, however, the Vandermonde matrix is often numerically ill-conditioned, so inverting it isn’t the best way to calculate exact polynomial coefficients. Several better methods exist.

Lagrange Polynomial
----------

Lagrange interpolation polynomials emerge from a simple, yet powerful idea. Let’s define the *Lagrange basis* functions l\_i(x) (i \\in [0, n]) as follows, given our points (x\_i, y\_i):

\\[l\_i(x) = \\begin{cases} 1 & x = x\_i \\\\ 0 & x = x\_j \\quad \\forall j \\neq i \\end{cases}\\]

In words, l\_i(x) is constrained to 1 at ![x_i](https://eli.thegreenplace.net/images/math/34e03e6559b14df9fe5a97bbd2ed10109dfebbd3.png) and to 0 at all other x\_j. We don’t care about its value at any other point.

The linear combination:

\\[p(x)=\\sum\_{i=0}^{n}y\_i l\_i(x)\\]

is then a valid interpolating polynomial for our set of n+1 points, because it’s equal to ![y_i](https://eli.thegreenplace.net/images/math/35c2ac2f82d0ff8f9011b596ed7e54bfcc55f471.png) at each ![x_i](https://eli.thegreenplace.net/images/math/34e03e6559b14df9fe5a97bbd2ed10109dfebbd3.png) (take a moment to convince yourself this is true).

How do we find l\_i(x)? The key insight comes from studying the following function:

\\[l'\_i(x)=(x-x\_0)\\cdot (x-x\_1)\\cdots (x-x\_{i-1}) \\cdot (x-x\_{i+1})\\cdots (x-x\_n)= \\prod\_{\\substack{0\\leq j \\leq n \\\\ j \\neq i}}(x-x\_j)\\]

This function has ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png) terms (x-x\_j) for all j\\neq i. It should be easy to see that l'\_i(x) is 0 at all x\_j when j\\neq i.

What about its value at ![x_i](https://eli.thegreenplace.net/images/math/34e03e6559b14df9fe5a97bbd2ed10109dfebbd3.png), though? We can just assign ![x_i](https://eli.thegreenplace.net/images/math/34e03e6559b14df9fe5a97bbd2ed10109dfebbd3.png) into l'\_i(x) to get:

\\[l'\_i(x\_i)=\\prod\_{\\substack{0\\leq j \\leq n \\\\ j \\neq i}}(x\_i-x\_j)\\]

And then normalize l'\_i(x), dividing it by this (constant) value. We get the Lagrange basis function l\_i(x):

\\[l\_i(x)=\\frac{l'\_i(x)}{l'\_i(x\_i)}=\\prod\_{\\substack{0\\leq j \\leq n \\\\ j \\neq i}}\\frac{x-x\_j}{x\_i-x\_j}\\]

Let’s use a concrete example to visualize this. Suppose we have the following set of points we want to interpolate: (1,4), (2,2), (3,3). We can calculate l'\_0(x), l'\_1(x) and l'\_2(x), and get the following:

![Un-normalized lagrange basis functions for our sample](https://eli.thegreenplace.net/images/2026/lagrange-basis.png)

Note where each l'\_i(x) intersects the ![x](https://eli.thegreenplace.net/images/math/11f6ad8ec52a2984abaafd7c3b516503785c2072.png) axis. These functions have the right values at all x\_{j\\neq i}. If we normalize them to obtain l\_i(x), we get these functions:

![Normalized lagrange basis functions for our sample](https://eli.thegreenplace.net/images/2026/lagrange-basis-normalized.png)

Note that each polynomial is 1 at the appropriate ![x_i](https://eli.thegreenplace.net/images/math/34e03e6559b14df9fe5a97bbd2ed10109dfebbd3.png) and 0 at all the other x\_{j\\neq i}, as required.

With these l\_i(x), we can now plot the interpolating polynomial p(x)=\\sum\_{i=0}^{n}y\_i l\_i(x), which fits our set of input points:

![Interpolation polynomial](https://eli.thegreenplace.net/images/2026/lagrange-inter-poly.png)

Polynomial degree and uniqueness
----------

We’ve just seen that the linear combination of Lagrange basis functions:

\\[p(x)=\\sum\_{i=0}^{n}y\_i l\_i(x)\\]

is a valid interpolating polynomial for a set of n+1 distinct points (x\_i, y\_i). What is its degree?

Since the degree of each l\_i(x) is ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png), then the degree of p(x) is *at most* ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png). We’ve just derived the first part of the *Polynomial interpolation theorem*:

**Polynomial interpolation theorem**: for any n+1 data points (x\_0,y\_0), (x\_1, y\_1)\\cdots(x\_n, y\_n) \\in \\mathbb{R}^2 where no two x\_j are the same, there exists a unique polynomial p(x) of degree at most ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png) that interpolates these points.

We’ve demonstrated existence and degree, but not yet *uniqueness*. So let’s turn to that.

We know that p(x) interpolates all n+1 points, and its degree is ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png). Suppose there’s another such polynomial q(x). Let’s construct:

\\[r(x)=p(x)-q(x)\\]

That do we know about r(x)? First of all, its value is 0 at all our ![x_i](https://eli.thegreenplace.net/images/math/34e03e6559b14df9fe5a97bbd2ed10109dfebbd3.png), so it has n+1 *roots*. Second, we also know that its degree is at most ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png) (because it’s the difference of two polynomials of such degree). These two facts are a contradiction. No non-zero polynomial of degree \\leq n can have n+1 roots (a basic algebraic fact related to the *Fundamental theorem of algebra*). So r(x) must be the zero polynomial; in other words, our p(x) is unique \\blacksquare.

Note the implication of uniqueness here: given our set of n+1 distinct points, there’s only one polynomial of degree \\leq n that interpolates it. We can find its coefficients by inverting the Vandermonde matrix, by using Lagrange basis functions, or any other method [[2]](#footnote-2).

Lagrange polynomials as a basis for P\_n(\\mathbb{R})
----------

The set P\_n(\\mathbb{R}) consists of all real polynomials of degree \\leq n. This set - along with addition of polynomials and scalar multiplication - [forms a vector space](https://eli.thegreenplace.net/2026/notes-on-linear-algebra-for-polynomials/).

We called l\_i(x) the "Lagrange basis" previously, and they do - in fact - form an actual linear algebra basis for this vector space. To prove this claim, we need to show that Lagrange polynomials are linearly independent and that they span the space.

**Linear independence**: we have to show that

\\[s(x)=\\sum\_{i=0}^{n}a\_i l\_i(x)=0\\]

implies a\_i=0 \\quad \\forall i. Recall that l\_i(x) is 1 at ![x_i](https://eli.thegreenplace.net/images/math/34e03e6559b14df9fe5a97bbd2ed10109dfebbd3.png), while all other l\_j(x) are 0 at that point. Therefore, evaluating s(x) at ![x_i](https://eli.thegreenplace.net/images/math/34e03e6559b14df9fe5a97bbd2ed10109dfebbd3.png), we get:

\\[s(x\_i)=a\_i = 0\\]

Similarly, we can show that a\_i is 0, for all ![i](https://eli.thegreenplace.net/images/math/042dc4512fa3d391c5170cf3aa61e6a638f84342.png) \\blacksquare.

**Span**: we’ve already demonstrated that the linear combination of l\_i(x):

\\[p(x)=\\sum\_{i=0}^{n}y\_i l\_i(x)\\]

is a valid interpolating polynomial for any set of n+1 distinct points. Using the *polynomial interpolation theorem*, this is the unique polynomial interpolating this set of points. In other words, for every q(x)\\in P\_n(\\mathbb{R}), we can identify any set of n+1 distinct points it passes through, and then use the technique described in this post to find the coefficients of q(x) in the Lagrange basis. Therefore, the set l\_i(x) spans the vector space \\blacksquare.

Interpolation matrix in the Lagrange basis
----------

Previously we’ve seen how to use the \\{1, x, x^2, \\dots x^n\\} basis to write down a system of linear equations that helps us find the interpolating polynomial. This results in the *Vandermonde matrix*.

Using the Lagrange basis, we can get a much nicer matrix representation of the interpolation equations.

Recall that our general polynomial using the Lagrange basis is:

\\[p(x)=\\sum\_{i=0}^{n}a\_i l\_i(x)\\]

Let’s build a system of equations for each of the n+1 points (x\_i,y\_i). For ![x_0](https://eli.thegreenplace.net/images/math/efbda784ad565c1c5201fdc948a570d0426bc6e6.png):

\\[p(x\_0)=\\sum\_{i=0}^{n}a\_i l\_i(x\_0)\\]

By definition of the Lagrange basis functions, all l\_i(x\_0) where i\\neq 0 are 0, while l\_0(x\_0) is 1. So this simplifies to:

\\[p(x\_0)=a\_0\\]

But the value at node ![x_0](https://eli.thegreenplace.net/images/math/efbda784ad565c1c5201fdc948a570d0426bc6e6.png) is ![y_0](https://eli.thegreenplace.net/images/math/2bb5817d0f3bf8490a8c7b1343f84f9635e683a3.png), so we’ve just found that a\_0=y\_0. We can produce similar equations for the other nodes as well, p(x\_1)=a\_1, etc. In matrix form:

\\[{\\renewcommand{\\arraystretch}{1.5}\\begin{bmatrix} 1 & 0 & 0 & \\dots & 0\\\\ 0 & 1 & 0 & \\dots & 0\\\\ 0 & 0 & 1 & \\dots & 0\\\\ \\vdots & \\vdots & \\vdots & \\ddots &\\vdots \\\\ 0 & 0 & 0 & \\dots & 1 \\end{bmatrix} \\begin{bmatrix} a\_0\\\\ a\_1\\\\ a\_2\\\\ \\vdots\\\\ a\_n\\\\ \\end{bmatrix}= \\begin{bmatrix} y\_0\\\\ y\_1\\\\ y\_2\\\\ \\vdots\\\\ y\_n\\\\ \\end{bmatrix} }\\]

We get the identity matrix; this is another way to trivially show that a\_0=y\_0, a\_1=y\_1 and so on.

Appendix: Vandermonde matrix
----------

Given some numbers \\{x\_0 \\dots x\_n\\} a matrix of this form:

\\[V= {\\renewcommand{\\arraystretch}{1.5}\\begin{bmatrix} 1 & x\_0 & x\_0^2 & \\dots & x\_0^n\\\\ 1 & x\_1 & x\_1^2 & \\dots & x\_1^n\\\\ 1 & x\_2 & x\_2^2 & \\dots & x\_2^n\\\\ \\vdots & \\vdots & \\vdots & \\ddots &\\vdots \\\\ 1 & x\_n & x\_n^2 & \\dots & x\_n^n \\end{bmatrix} }\\]

Is called the *Vandermonde* matrix. What’s special about a Vandermonde matrix is that we know it’s invertible when ![x_i](https://eli.thegreenplace.net/images/math/34e03e6559b14df9fe5a97bbd2ed10109dfebbd3.png) are distinct. This is [because its determinant is known to be non-zero](https://mathworld.wolfram.com/InvertibleMatrixTheorem.html). Moreover, its determinant is [[3]](#footnote-3):

\\[\\det(V) = \\prod\_{0 \\le i \< j \\le n} (x\_j - x\_i)\\]

Here’s why.

To get some intuition, let’s consider some small-rank Vandermonde matrices. Starting with a 2-by-2:

\\[\\det(V)=\\det\\begin{bmatrix} 1 & x\_0 \\\\ 1 & x\_1 \\\\ \\end{bmatrix}=x\_1-x\_0\\]

Let’s try 3-by-3 now:

\\[\\det(V)=\\det {\\renewcommand{\\arraystretch}{1.5}\\begin{bmatrix} 1 & x\_0 & x\_0^2 \\\\ 1 & x\_1 & x\_1^2 \\\\ 1 & x\_2 & x\_2^2 \\\\ \\end{bmatrix} }\\]

We can use the standard way of calculating determinants to expand from the first row:

\\[\\begin{aligned} \\det(V)&=1\\cdot(x\_1 x\_2^2 - x\_2 x\_1^2)-x\_0(x\_2^2-x\_1^2)+x\_0^2(x\_2 - x\_1)\\\\ &=x\_1 x\_2^2 - x\_2 x\_1^2 - x\_0 x\_2^2+x\_0 x\_1^2+x\_0^2 x\_2 - x\_0^2 x\_1\\\\ \\end{aligned}\\]

Using some algebraic manipulation, it’s easy to show this is equivalent to:

\\[\\det(V)=(x\_2-x\_1)(x\_2-x\_0)(x\_1-x\_0)\\]

For the full proof, let’s look at the generalized n+1-by-n+1 matrix again:

\\[V= {\\renewcommand{\\arraystretch}{1.5}\\begin{bmatrix} 1 & x\_0 & x\_0^2 & \\dots & x\_0^n\\\\ 1 & x\_1 & x\_1^2 & \\dots & x\_1^n\\\\ 1 & x\_2 & x\_2^2 & \\dots & x\_2^n\\\\ \\vdots & \\vdots & \\vdots & \\ddots &\\vdots \\\\ 1 & x\_n & x\_n^2 & \\dots & x\_n^n \\end{bmatrix} }\\]

Recall that subtracting a multiple of one column from another doesn’t change a matrix’s determinant. For each column k\>1, we’ll subtract the value of column k-1 multiplied by ![x_0](https://eli.thegreenplace.net/images/math/efbda784ad565c1c5201fdc948a570d0426bc6e6.png) from it (this is done on all columns simultaneously). The idea is to make the first row all zeros after the very first element:

\\[V= {\\renewcommand{\\arraystretch}{1.5}\\begin{bmatrix} 1 & 0 & 0 & \\dots & 0\\\\ 1 & x\_1 - x\_0 & x\_1^2 - x\_1 x\_0& \\dots & x\_1^n - x\_1^{n-1} x\_0\\\\ 1 & x\_2 - x\_0 & x\_2^2 - x\_2 x\_0& \\dots & x\_2^n - x\_2^{n-1} x\_0\\\\ \\vdots & \\vdots & \\vdots & \\ddots &\\vdots \\\\ 1 & x\_n - x\_0 & x\_n^2 - x\_n x\_0& \\dots & x\_n^n - x\_n^{n-1} x\_0\\\\ \\end{bmatrix} }\\]

Now we factor out x\_1-x\_0 from the second row (after the first element), x\_2-x\_0 from the third row and so on, to get:

\\[V= {\\renewcommand{\\arraystretch}{1.5}\\begin{bmatrix} 1 & 0 & 0 & \\dots & 0\\\\ 1 & x\_1 - x\_0 & x\_1(x\_1 - x\_0)& \\dots & x\_1^{n-1}(x\_1 - x\_0)\\\\ 1 & x\_2 - x\_0 & x\_2(x\_2 - x\_0)& \\dots & x\_2^{n-1}(x\_2 - x\_0)\\\\ \\vdots & \\vdots & \\vdots & \\ddots &\\vdots \\\\ 1 & x\_n - x\_0 & x\_n(x\_n - x\_0)& \\dots & x\_n^{n-1}(x\_n - x\_0)\\\\ \\end{bmatrix} }\\]

Imagine we erase the first row and first column of ![V](https://eli.thegreenplace.net/images/math/c9ee5681d3c59f7541c27a38b67edf46259e187b.png). We’ll call the resulting matrix ![W](https://eli.thegreenplace.net/images/math/e2415cb7f63df0c9de23362326ad3c37a9adfc96.png).

\\[W= {\\renewcommand{\\arraystretch}{1.5}\\begin{bmatrix} x\_1 - x\_0 & x\_1(x\_1 - x\_0)& \\dots & x\_1^{n-1}(x\_1 - x\_0)\\\\ x\_2 - x\_0 & x\_2(x\_2 - x\_0)& \\dots & x\_2^{n-1}(x\_2 - x\_0)\\\\ \\vdots & \\vdots & \\ddots &\\vdots \\\\ x\_n - x\_0 & x\_n(x\_n - x\_0)& \\dots & x\_n^{n-1}(x\_n - x\_0)\\\\ \\end{bmatrix} }\\]

Because the first row of ![V](https://eli.thegreenplace.net/images/math/c9ee5681d3c59f7541c27a38b67edf46259e187b.png) is all zeros except the first element, we have:

\\[\\det(V)=\\det(W)\\]

Note that the first row of ![W](https://eli.thegreenplace.net/images/math/e2415cb7f63df0c9de23362326ad3c37a9adfc96.png) has a common factor of x\_1-x\_0, so when calculating \\det(W), we can move this common factor out. Same for the common factor x\_2-x\_0 of the second row, and so on. Overall, we can write:

\\[\\det(W)=(x\_1-x\_0)(x\_2-x\_0)\\cdots(x\_n-x\_0)\\cdot \\det {\\renewcommand{\\arraystretch}{1.5}\\begin{bmatrix} 1 & x\_1 & x\_1^2 & \\dots & x\_1^{n-1}\\\\ 1 & x\_2 & x\_2^2 & \\dots & x\_2^{n-1}\\\\ \\vdots & \\vdots & \\vdots & \\ddots &\\vdots \\\\ 1 & x\_n & x\_n^2 & \\dots & x\_n^{n-1} \\end{bmatrix} }\\]

But the smaller matrix is just the Vandermonde matrix for \\{x\_1 \\dots x\_{n}\\}. If we continue this process by induction, we’ll get:

\\[\\det(V) = \\prod\_{0 \\le i \< j \\le n} (x\_j - x\_i)\\]

If you’re interested, the [Wikipedia page for the Vandermonde matrix](https://en.wikipedia.org/wiki/Vandermonde_matrix) has a couple of additional proofs.

---

|[[1]](#footnote-reference-1)|The ![x](https://eli.thegreenplace.net/images/math/11f6ad8ec52a2984abaafd7c3b516503785c2072.png)-es here are called *nodes* and the ![y](https://eli.thegreenplace.net/images/math/95cb0bfd2977c761298d9624e4b4d4c72a39974a.png)-s are called *values*.|
|----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[2]](#footnote-reference-2)|[Newton polynomials](https://eli.thegreenplace.net/2024/method-of-differences-and-newton-polynomials/) is also an option, and there are many other approaches.|
|----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[3]](#footnote-reference-3)|Note that this means the product of all differences between x\_j and ![x_i](https://eli.thegreenplace.net/images/math/34e03e6559b14df9fe5a97bbd2ed10109dfebbd3.png) where ![i](https://eli.thegreenplace.net/images/math/042dc4512fa3d391c5170cf3aa61e6a638f84342.png) is strictly smaller than j. That is, for n=2, the full product is (x\_2-x\_1)(x\_2-x\_0)(x\_1-x\_0). For an arbitrary ![n](https://eli.thegreenplace.net/images/math/d1854cae891ec7b29161ccaf79a24b00c274bdaa.png), there are \\frac{n(n-1)}{2} factors in total.|
|----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|