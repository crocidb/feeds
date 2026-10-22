+++
title = "Notes on the complex roots of unity"
description = 'One of the most wonderful aspects of math is how deep we can get by studying seemingly trivial questions. Consider the roots of unity, where "unity" simply means the number 1.Basics: roots of unity for real numbersStudying the roots of unity usually begins in middle sch'
date = "2026-10-18T01:18:00Z"
url = "https://eli.thegreenplace.net/2026/notes-on-the-complex-roots-of-unity/"
author = "Eli Bendersky"
text = ""
lastupdated = "2026-10-21T11:46:10.753063126Z"
seen = false
+++

One of the most wonderful aspects of math is how deep we can get by studying seemingly trivial questions. Consider the roots of unity, where "unity" simply means the number 1.

Basics: roots of unity for real numbers
----------

Studying the roots of unity usually begins in middle school: what is the square root of 1? Equivalently, what are the solutions to this equation?

\\[x^2=1\\]

Well, there are two answers: 1 and -1.

Similarly, we can ask the question for higher roots; the third roots are solutions to the equation:

\\[x^3=1\\]

And so on. When we’re only dealing with real numbers, that’s pretty much the whole story. For odd-degree roots of 1, the only answer is 1; for even-degree roots of 1, the answer is either 1 or -1.

When we extend our domain to the complex numbers, things become much more interesting.

Basics: roots of unity for complex numbers
----------

By the [formal definition](https://en.wikipedia.org/wiki/Root_of_unity), a root of unity is any complex number that yields 1 when raised to a positive integer power n.

Rather than looking at *all* the possible roots of 1, it’s often more useful to discuss the roots for a specific given n: complex numbers z such that z^n=1.

For example, let’s consider n=2. We’ve already seen that the roots are 1 and -1; these are complex numbers with a zero imaginary part.

How about n=4? There are four roots: 1, -1, i and -i. For n=3, the three roots [[1]](#footnote-1) are 1, \\frac{-1+i\\sqrt{3}}{2} and \\frac{-1-i\\sqrt{3}}{2}. It’s easy enough to check that these indeed give 1 when raised to the third power, but how do we calculate them in the first place?

Calculating complex roots using polar coordinates
----------

A complex number with magnitude 1 can be represented in polar coordinates [[2]](#footnote-2) as z=e^{i\\theta}. If we raise z to the n-th power, we get:

\\[z^n=e^{in\\theta}\\]

The magnitude of z^n is still 1, which is essential if we want z to be a n-th root of unity. Let’s equate z^n to 1:

\\[z^n=e^{in\\theta}=1\\]

To find the solutions to this equation, we’ll first want to represent 1 itself in polar coordinates. Let’s use another variable for the angle:

\\[1=e^{i\\phi}\\]

What is the value of \\phi? Thinking about the unit circle, \\phi is any integer multiple of 2\\pi - which we’ll express as 2\\pi k for k=0,1,2...:

\\[1=e^{i2\\pi k}\\]

Back to z^n:

\\[z^n=e^{in\\theta}=e^{i2\\pi k}\\]

Or:

\\[n\\theta=2\\pi k\\quad\\Rightarrow\\quad \\theta=\\frac{2\\pi k}{n}\\]

So the n-th roots of unity are [[3]](#footnote-3):

\\[\\boxed{z\_k=e^{i2\\pi k/n}, \\qquad k=0,1,\\dots,n-1}\\]

Some basic examples
----------

Let’s begin with n=2. We have the following roots:

\\[\\begin{aligned} z\_0&=e^{i2\\pi 0/2}=e^0=1\\\\ z\_1&=e^{i2\\pi 1/2}=e^{i\\pi}=\\cos\\pi+i\\sin\\pi=-1 \\end{aligned}\\]

For n=3:

\\[\\begin{aligned} z\_0&=e^{i2\\pi 0/3}=e^0=1\\\\ z\_1&=e^{i2\\pi 1/3}=\\cos\\frac{2\\pi}{3}+i\\sin\\frac{2\\pi}{3}=-\\frac{1}{2}+i\\frac{\\sqrt{3}}{2}\\\\ z\_2&=e^{i2\\pi 2/3}=\\cos\\frac{4\\pi}{3}+i\\sin\\frac{4\\pi}{3}=-\\frac{1}{2}-i\\frac{\\sqrt{3}}{2} \\end{aligned}\\]

As expected. It should be similarly simple to calculate the roots for n=4; give it a try.

Roots of unity and rotations on the unit circle
----------

What happens when we multiply some root of unity z\_k by itself? Since the magnitude of the root is 1, multiplying by it is akin to a *rotation* along the unit circle by the root’s angle. For example, consider z\_1 from the 3rd roots of unity:

\\[z\_1=e^{i2\\pi1/3}\\]

Multiply z\_1 by itself:

\\[z\_1^2=e^{i2\\pi1/3}\\cdot e^{i2\\pi1/3}=e^{i2\\pi2/3}\\]

If the angle of z\_1 is 2\\pi/3, the angle of z\_1^2 is 4\\pi/3. Let’s multiply by z\_1 once more:

\\[z\_1^3=e^{i2\\pi2/3}\\cdot e^{i2\\pi1/3}=e^{i6\\pi/3}=1\\]

The result is 1, as expected (after all, z\_1 is a 3rd root of unity).

This visualization shows how roots of unity appear on the unit circle and how raising them to powers rotates the roots until finally z\_k^n=1:

 The nth roots of unity, equally spaced around the unit circle. Use the root selector below.

Roots *n* Root *k*

 The powers of the selected root. Use the power slider below.

Power *m*

Select n first; this shows the n-th roots as blue dots on the unit circle. Now you can click any of the roots, and see its powers in the lower plot - drag the slidebar to see the rotations. If you spend some time playing with this, you’ll notice that some roots - for example z\_2 when n=6 - go back to 1 when raised to a smaller power than n. We’ll revisit this outcome when we discuss the group-theoretic aspects of roots of unity.

Geometry: roots of unity and regular polygons
----------

As we’ve seen, the roots of unity are evenly spaced along the unit circle on the complex plane. If we connect the roots with straight lines to their immediate neighbors, we’ll notice something interesting:

 Adjacent nth roots of unity joined to form a regular polygon on the unit circle.

Roots *n*

For different values of n\\ge3, we get the [Regular Polygons](https://en.wikipedia.org/wiki/Regular_polygon)! It’s pretty easy to prove this if we connect each root with a straight line to the origin. The triangles we get are congruent, because the sides from the origin to the roots are all of length 1, and the central angles are all 2\\pi /n. Therefore, both the sides of the polygons and their angles are identical, which makes them regular.

Conjugates of roots of unity
----------

Suppose we have the root of unity:

\\[z\_k=e^{i2\\pi k/n}\\]

For some k and n. If we take the reciprocal of z\_k:

\\[z\_k^{-1}=e^{-i2\\pi k/n}\\]

Then:

\\[(z\_k^{-1})^n=e^{-in 2\\pi k/n}=e^{-i2\\pi k}=1\\]

So z\_k^{-1} is also an n-th root of unity. While the powers of z\_k are rotating counter-clockwise on the unit circle until they land on 1 for the n-th power, the powers of z\_k^{-1} similarly rotate *clockwise*.

z\_k^{-1} also happens to be the complex conjugate of z\_k:

\\[z\_k^{-1}=z\_k^\*\\]

So if we have:

\\[z\_k=e^{i2\\pi k/n}, \\qquad k=0,1,\\dots,n-1\\]

As the n-th roots of unity, then:

\\[z\_k^\*=e^{-i2\\pi k/n}, \\qquad k=0,1,\\dots,n-1\\]

Are also n-th roots of unity. In fact, they are the same roots, because for any given positive k:

\\[\\begin{aligned} z\_k^\*&=e^{-i2\\pi k/n}\\\\ &=1\\cdot e^{-i2\\pi k/n}\\\\ &=e^{i2\\pi}\\cdot e^{-i2\\pi k/n}\\\\ &=e^{i2\\pi n/n}\\cdot e^{-i2\\pi k/n}\\\\ &=e^{i2\\pi (n-k)/n}=z\_{n-k} \\end{aligned}\\]

So enumerating the conjugate roots is the same as enumerating the roots themselves in the opposite order.

Group theory: the cyclic group of roots of unity
----------

Let’s look at the set of z\_k (roots of unity) for some n:

\\[\\mu\_n=\\left\\{z\_k=e^{2\\pi ik/n}:k=0,1,\\dots,n-1\\right\\}\\]

This set - along with the multiplication operation - forms a *group*. Let’s prove that.

**Closure:** Assume z,y\\in\\mu\_n (so z^n=1 and y^n=1). Then:

\\[(zy)^n=z^n y^n=1\\]

Therefore zy\\in\\mu\_n.

**Identity:** The number 1\\in\\mu\_n, so it can serve as our identity element for the group.

**Associativity:** Taken directly from the associativity of the multiplication operation on complex numbers.

**Inverse:** We’ve just seen in the section on conjugates that z^{-1} is an n-th root of unity when z is. So the inverse exists and is part of the group.

Because the operation we have is just complex multiplication, we can trivially derive additional properties, like commutativity. Therefore, the group \\mu\_n is *Abelian*.

Finally, we can show that the group is also *cyclic* and discuss its *generators*.

For slightly simpler notation, let’s denote w=z\_1. So the group can be represented as:

\\[\\mu\_n=\\left\\{1, w, w^2,\\dots,w^{n-1}\\right\\}\\]

This makes it obvious that the group is cyclic - all its elements can be expressed as integer powers of w. And w is a generator for the group.

But interestingly, w is not the only generator for this group. Any w^k can be a generator, as long as k and n are co-prime. For example, consider the group \\mu\_6:

\\[\\mu\_6=\\left\\{1, w, w^2,w^3,w^4,w^5\\right\\}\\]

Obviously, w is a generator for this group. But w^2 isn’t! If we raise it to various powers we get:

\\[\\begin{aligned} (w^2)^0&=1\\\\ (w^2)^1&=w^2\\\\ (w^2)^2&=w^4\\\\ (w^2)^3&=w^6=1\\\\ (w^2)^4&=w^8=w^2\\\\ (w^2)^5&=w^{10}=w^4\\\\ \\end{aligned}\\]

Since w^6=1, the powers of w^2 repeat after just three steps, so they only reach three out of six group elements.

But if k and n are co-prime, w^k is a generator; in the case of \\mu\_6, we can easily verify that w and w^5 are the only generators. The roots that are generators for the group are also called the *primitive roots*.

Sums of roots of unity
----------

Let’s take the n-roots of unity (n\>1), denoted as above with:

\\[\\mu\_n=\\left\\{1, w, w^2,\\dots,w^{n-1}\\right\\}\\qquad w=e^{2\\pi i/n}\\]

What’s the sum of all these roots?

\\[S=1+w+w^2+\\cdots+w^{n-1}=\\sum\_{i=0}^{n-1}w^i\\]

This is just the sum of a geometric series with the first term 1 and common ratio r=w. Therefore:

\\[S=\\frac{1-w^n}{1-w}=\\frac{1-1}{1-w}=0\\]

If you look carefully at the visualization shown above - this makes sense geometrically. All the roots of unity are evenly spread around the unit circle, so viewing them as vectors, all components cancel out.

How about the sum of roots raised to some integer power k? Let’s try this for k=2 (assuming n\>2):

\\[S\_2=1+w^2+w^4+\\cdots+w^{2(n-1)}\\]

Using the same geometric series sum formula (with r=w^2), we get:

\\[S\_2=\\frac{1-w^{2n}}{1-w^2}=\\frac{1-(w^{n})^{2}}{1-w^2}=0\\]

In general, when k is not divisible by n, the sum is 0. But when k *is* divisible by n, each power becomes:

\\[w^k=e^{2\\pi ik/n}=1\\]

And n of these sum to n. In conclusion:

\\[\\sum\_{i=0}^{n-1}w^{ki}= \\begin{cases} n & k \\equiv 0 \\pmod{n}\\\\ 0 & \\text{otherwise} \\\\ \\end{cases}\\]

Powers of roots of unity as an orthogonal basis
----------

Let’s consider the powers of roots of unity as vectors. We’ll continue using the notation:

\\[\\mu\_n=\\left\\{1, w, w^2,\\dots,w^{n-1}\\right\\}\\qquad w=e^{2\\pi i/n}\\]

We’ll begin with the 0-th power vector - each of the roots raised to power 0:

\\[v\_0=\\left[1, 1, 1,\\dots,1\\right]\\]

Then power 1 - just the roots themselves:

\\[v\_1=\\left[1, w, w^2,\\dots,w^{n-1}\\right]\\]

Each root raised to power 2:

\\[v\_2=\\left[1, w^2, w^4,\\dots,w^{2(n-1)}\\right]\\]

And so on, until power n-1:

\\[v\_{n-1}=\\left[1, w^{n-1}, w^{2(n-1)},\\dots,w^{(n-1)(n-1)}\\right]\\]

To go full linear algebra mode, we’ll collect these vectors into an n\\times n matrix:

\\[V=\\begin{bmatrix} 1 & 1 & 1 & \\cdots & 1 \\\\ 1 & w & w^2 & \\cdots & w^{n-1} \\\\ 1 & w^2 & w^4 & \\cdots & w^{2(n-1)} \\\\ \\vdots & & & & \\vdots \\\\ 1 & w^{n-1} & w^{2(n-1)} & \\cdots & w^{(n-1)(n-1)} \\\\ \\end{bmatrix}\\]

Let’s calculate the inner product of two matrix rows. Recall that when computing the inner product on vectors over \\mathbb{C}, we conjugate the second element:

\\[\\begin{aligned} \\langle v\_i,v\_j\\rangle&=\\sum\_{k=0}^{n-1}v\_i[k]\\cdot v\_j[k]^\*\\\\ &=\\sum\_{k=0}^{n-1}w^{ik}\\cdot (w^{jk})^\*\\\\ &=\\sum\_{k=0}^{n-1}w^{ik}\\cdot w^{-jk}\\\\ &=\\sum\_{k=0}^{n-1}w^{(i-j)k}\\\\ \\end{aligned}\\]

But hold on, we’ve just calculated this exact sum in the previous section. We get:

\\[\\langle v\_i,v\_j\\rangle=\\sum\_{k=0}^{n-1}w^{(i-j)k}= \\begin{cases} n & (i-j) \\equiv 0 \\pmod{n}\\\\ 0 & \\text{otherwise} \\\\ \\end{cases}\\]

Since the vector indices i and j only run over [0..n-1], this is equivalent to:

\\[\\langle v\_i,v\_j\\rangle=\\sum\_{k=0}^{n-1}w^{(i-j)k}= \\begin{cases} n & i=j\\\\ 0 & \\text{otherwise} \\\\ \\end{cases}\\]

Which is to say: the vectors v\_i and v\_j are mutually orthogonal when i\\neq j. Since we have a set of n orthogonal vectors in \\mathbb{C}^n, these vectors form a *basis* for \\mathbb{C}^n - any vector in this space can be represented as a linear combination of v\_i. This fact has far reaching consequences in math and engineering, since it plays a critical part in forming the DFT (Discrete Fourier Transform), and V is also known as the *Fourier matrix*. But this will be a topic for a separate post.

Another fun thing to notice before we’re finished here: the matrix V happens to be *symmetric* (this is trivial to check by observation). Therefore, its columns are also mutually orthogonal.

---

|[[1]](#footnote-reference-1)|In general - counting multiplicity - there are exactly n complex roots. This is because we’re essentially finding the solutions to the polynomial z^n-1=0, which has n complex solutions according to the Fundamental theorem of algebra.|
|----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[2]](#footnote-reference-2)|For some notes on converting between the different representations of complex numbers, see my post on [the Euler formula](https://eli.thegreenplace.net/2024/notes-on-the-euler-formula/).|
|----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[3]](#footnote-reference-3)|When k=n, \\theta=2\\pi, which is the same as \\theta=0. On a unit circle, the roots start repeating once one full cycle is completed; therefore, there are only n unique roots with k=0,1,\\dots,n-1.|
|----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|