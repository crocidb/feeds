+++
title = "Notes on Linear Algebra for Polynomials"
description = 'We’ll be working with the set P\_n(\\mathbb{R}), real polynomials of degree \\leq n. Such polynomials can be expressed using n+1 scalar coefficients a\_i as follows:\\[p(x)=a\_0+a\_1 x + a\_2 x^2 + \\cdots + a\_n x^n\\]Vector spaceThe set P\_n(\\mathbb{R}), along with …'
date = "2026-02-26T02:34:00Z"
url = "https://eli.thegreenplace.net/2026/notes-on-linear-algebra-for-polynomials/"
author = "Eli Bendersky"
text = ""
lastupdated = "2026-03-18T21:57:51.392784967Z"
seen = false
+++

We’ll be working with the set P\_n(\\mathbb{R}), real polynomials of degree \\leq n. Such polynomials can be expressed using n+1 scalar coefficients a\_i as follows:

\\[p(x)=a\_0+a\_1 x + a\_2 x^2 + \\cdots + a\_n x^n\\]

Vector space
----------

The set P\_n(\\mathbb{R}), along with addition of polynomials and scalar multiplication form a *vector space*. As a proof, let’s review how the vector space axioms are satisfied. We’ll use p(x), q(x) and r(x) as arbitrary polynomials from the set P\_n(\\mathbb{R}) for the demonstration. Similarly, a and b are arbitrary scalars in ![\mathbb{R}](https://eli.thegreenplace.net/images/math/0ed839b111fe0e3ca2b2f618b940893eaea88a57.png).

**Associativity of vector addition**:

\\[p(x)+[q(x)+r(x)]=p(x)+q(x)+r(x)=[p(x)+q(x)]+r(x)\\]

This is trivial because addition of polynomials is associative [[1]](#footnote-1). Commutativity is similarly trivial, for the same reason:

**Commutativity of vector addition**:

\\[p(x)+q(x)=q(x)+p(x)\\]

**Identity element of vector addition**:

The zero polynomial 0 serves as an identity element. \\forall p(x)\\in P\_n(\\mathbb{R}), we have 0 + p(x) = p(x).

**Inverse element of vector addition**:

For each p(x), we can use q(x)=-p(x) as the additive inverse, because p(x)+q(x)=0.

**Identity element of scalar multiplication**

The scalar 1 serves as an identity element for scalar multiplication. For each p(x), it’s true that 1\\cdot p(x)=p(x).

**Associativity of scalar multiplication**:

For any two scalars a and b:

\\[a[b\\cdot p(x)]=ab\\cdot p(x)=[ab]\\cdot p(x)\\]

**Distributivity of scalar multiplication over vector addition**:

For any p(x), q(x) and scalar a:

\\[a\\cdot[p(x)+q(x)]=a\\cdot p(x)+a\\cdot q(x)\\]

**Distributivity of scalar multiplication over scalar addition**:

For any scalars a and b and polynomial p(x):

\\[[a+b]\\cdot p(x)=a\\cdot p(x) + b\\cdot p(x)\\]

Linear independence, span and basis
----------

Since we’ve shown that polynomials in P\_n(\\mathbb{R}) form a vector space, we can now build additional linear algebraic definitions on top of that.

A set of k polynomials p\_k(x)\\in P\_n(\\mathbb{R}) is said to be *linearly independent* if

\\[\\sum\_{i=1}^{k}a\_i p\_i(x)=0\\]

implies a\_i=0 \\quad \\forall i. In words, the only linear combination resulting in the zero vector is when all coefficients are 0.

As an example, let’s discuss the fundamental building blocks of polynomials in P\_n(\\mathbb{R}): the set \\{1, x, x^2, \\dots x^n\\}. These are linearly independent because:

\\[a\_0 + a\_1 x + a\_2 x^2 + \\cdots a\_n x^n=0\\]

is true only for zero polynomial, in which all the coefficients a\_i=0. This comes from the very definition of polynomials. Moreover, this set *spans* the entire P\_n(\\mathbb{R}) because every polynomial can be (by definition) expressed as a linear combination of \\{1, x, x^2, \\dots x^n\\}.

Since we’ve shown these basic polynomials are linearly independent and span the entire vector space, they are a *basis* for the space. In fact, this set has a special name: the *monomial basis* (because a monomial is a polynomial with a single term).

Checking if an arbitrary set of polynomials is a basis
----------

Suppose we have some set polynomials, and we want to know if these form a basis for P\_n(\\mathbb{R}). How do we go about it?

The idea is using linear algebra the same way we do for any other vector space. Let’s use a concrete example to demonstrate:

\\[Q=\\{1-x, x, 2x+x^2\\}\\]

Is the set Q a basis for P\_n(\\mathbb{R})? We’ll start by checking whether the members of Q are linearly independent. Write:

\\[a\_0(1-x)+a\_1 x + a\_2(2x+x^2)=0\\]

By regrouping, we can turn this into:

\\[a\_0 + (a\_1-a\_0+2a\_2)x+a\_2 x^2=0\\]

For this to be true, the coefficient of each monomial has to be zero; mathematically:

\\[\\begin{aligned} a\_0&=0\\\\ a\_1-a\_0+2a\_2&=0\\\\ a2&=0\\\\ \\end{aligned}\\]

In matrix form:

\\[\\begin{bmatrix} 1 & 0 & 0\\\\ -1 & 1 & 2\\\\ 0 & 0 & 1\\\\ \\end{bmatrix} \\begin{bmatrix}a\_0\\\\ a\_1\\\\ a\_2\\end{bmatrix} =\\begin{bmatrix}0\\\\ 0\\\\ 0\\end{bmatrix}\\]

We know how to solve this, by reducing the matrix into [row-echelon form](https://en.wikipedia.org/wiki/Row_echelon_form). It’s easy to see that the reduced row-echelon form of this specific matrix is I, the identity matrix. Therefore, this set of equations has a single solution: a\_i=0 \\quad \\forall i [[2]](#footnote-2).

We’ve shown that the set Q is linearly independent. Now let’s show that it *spans* the space P\_n(\\mathbb{R}). We want to analyze:

\\[a\_0(1-x)+a\_1 x + a\_2(2x+x^2)=\\alpha +\\beta x + \\gamma x^2\\]

And find the coefficients a\_i that satisfy this for any arbitrary ![\alpha](https://eli.thegreenplace.net/images/math/f7c665b45932a814215e979bc2611080b4948e68.png), ![\beta](https://eli.thegreenplace.net/images/math/6499d503bfc00cadae1440b191c52a8632e2f8c4.png) and \\gamma. We proceed just as before, by regrouping on the left side:

\\[a\_0 + (a\_1-a\_0+2a\_2)x+a\_2 x^2=\\alpha +\\beta x + \\gamma x^2\\]

and equating the coefficient of each power of ![x](https://eli.thegreenplace.net/images/math/11f6ad8ec52a2984abaafd7c3b516503785c2072.png) separately:

\\[\\begin{aligned} a\_0&=\\alpha\\\\ a\_1-a\_0+2a\_2&=\\beta\\\\ a2&=\\gamma\\\\ \\end{aligned}\\]

If we turn this into matrix form, the matrix of coefficients is exactly the same as before. So we know there’s a single solution, and by rearranging the matrix into I, the solution will appear on the right hand side. It doesn’t matter for the moment what the actual solution is, as long as it exists and is unique. We’ve shown that Q spans the space!

Since the set Q is linearly independent and spans P\_n(\\mathbb{R}), it is a *basis* for the space.

Inner product
----------

I’ve discussed inner products for functions in [the post about Hilbert space](https://eli.thegreenplace.net/2025/hilbert-space-treating-functions-as-vectors/). Well, *polynomials are functions*, so we can define an inner product using integrals as follows [[3]](#footnote-3):

\\[\\langle p, q \\rangle = \\int\_{a}^{b} p(x) q(x) w(x) \\, dx\\]

Where the bounds a and b are arbitrary, and could be infinite. Whenever we deal with integrals we worry about convergence; in my post on Hilbert spaces, we only talked about L^2 - the square integrable functions. Most polynomials are not square integrable, however. Therefore, we can restrict this using either:

1. A special *weight function* w(x) to make sure the inner product integral converges
2. Set finite bounds on the integral, and then we can just set w(x)=1.

Let’s use the latter, and restrict the bounds into the range [-1,1], setting w(x)=1. We have the following inner product:

\\[\\langle p, q \\rangle = \\int\_{-1}^{1} p(x) q(x) \\, dx\\]

Let’s check that this satisfies the inner product space conditions.

**Conjugate symmetry**:

Since real multiplication is commutative, we can write:

\\[\\langle p, q \\rangle = \\int\_{-1}^{1} p(x) q(x) \\, dx =\\int\_{-1}^{1} q(x) p(x) \\, dx=\\langle q, p \\rangle\\]

We deal in the reals here, so we can safely ignore complex conjugation.

**Linearity in the first argument**:

Let p\_1,p\_2,q\\in P\_n(\\mathbb{R}) and a,b\\in \\mathbb{R}. We want to show that

\\[\\langle ap\_1+bp\_2,q \\rangle = a\\langle p\_1,q\\rangle +b\\langle p\_2,q\\rangle\\]

Expand the left-hand side using our definition of inner product:

\\[\\begin{aligned} \\langle ap\_1+bp\_2,q \\rangle&=\\int\_{-1}^{1} (a p\_1(x)+b p\_2(x)) q(x) \\, dx\\\\ &=a\\int\_{-1}^{1} p\_1(x) q(x) \\, dx+b\\int\_{-1}^{1} p\_2(x) q(x) \\, dx \\end{aligned}\\]

The result is equivalent to a\\langle p\_1,q\\rangle +b\\langle p\_2,q\\rangle.

**Positive-definiteness**:

We want to show that for nonzero p\\in P\_n(\\mathbb{R}), we have \\langle p, p\\rangle \> 0. First of all, since p(x)^2\\geq0 for all ![x](https://eli.thegreenplace.net/images/math/11f6ad8ec52a2984abaafd7c3b516503785c2072.png), it’s true that:

\\[\\langle p, p\\rangle=\\int\_{-1}^{1}p(x)^2\\, dx\\geq 0\\]

What about the result 0 though? Well, let’s say that

\\[\\int\_{-1}^{1}p(x)^2\\, dx=0\\]

Since p(x)^2 is a non-negative function, this means that the integral of a non-negative function ends up being 0. But p(x) is a polynomial, so it’s *continuous*, and so is p(x)^2. If the integral of a continuous non-negative function is 0, it means the function itself is 0. Had it been non-zero in any place, the integral would necessarily have to be positive as well.

We’ve proven that \\langle p, p\\rangle=0 only when p is the zero polynomial. The positive-definiteness condition is satisfied.

In conclusion, P\_n(\\mathbb{R}) along with the inner product we’ve defined forms an *inner product space*.

Orthogonality
----------

Now that we have an inner product, we can define orthogonality on polynomials: two polynomials p,q are *orthogonal* (w.r.t. our inner product) iff

\\[\\langle p,q\\rangle=\\int\_{-1}^{1}p(x)q(x)\\, dx=0\\]

Contrary to expectation [[4]](#footnote-4), the monomial basis polynomials are *not* orthogonal using our definition of inner product.

For example, calculating the inner product for 1 and x^2:

\\[\\langle 1,x^2\\rangle=\\int\_{-1}^{1}x^2\\, dx=\\frac{x^3}{3}\\biggr|\_{-1}^{1}=\\frac{2}{3}\\]

There are other sets of polynomials that *are* orthogonal using our inner product. For example, the [Legendre polynomials](https://en.wikipedia.org/wiki/Legendre_polynomials); but this is a topic for another post.

---

|[[1]](#footnote-reference-1)|There’s a level of basic algebra below which we won’t descend in these notes. We could break this statement further down by saying that something like a\_i x^i + a\_j x^j can be added to b\_i x^i + b\_j x^j by adding each power of ![x](https://eli.thegreenplace.net/images/math/11f6ad8ec52a2984abaafd7c3b516503785c2072.png) separately for any ![i](https://eli.thegreenplace.net/images/math/042dc4512fa3d391c5170cf3aa61e6a638f84342.png) and j, but let’s just take it for granted.|
|----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[2]](#footnote-reference-2)|Obviously, this specific set of equations is quite trivial to solve without matrices; I just want to demonstrate the more general approach. Once we have a system of linear equations, the whole toolbox of linear algebra is at our disposal. For example, we could also have checked the determinant and seen it’s non-zero, which means that a square matrix is invertible, and in this case has a single solution of zeroes.|
|----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[3]](#footnote-reference-3)|And actually with this (or any valid) inner product, P\_n(\\mathbb{R}) indeed forms a Hilbert space, because it’s finite-dimensional, and every finite-dimensional inner product space is complete.|
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[4]](#footnote-reference-4)|Because of how naturally this set spans P\_n(\\mathbb{R}). And indeed, we can define alternative inner products using which monomials are orthogonal.|
|----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|