+++
title = "A selection of problems with logarithms"
description = "A nice selection of problems with logarithms. As the title says."
date = "2024-06-06T00:00:00Z"
url = "/2024/06/06/13-problems-with-logarithms"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-02-11T20:17:07.200497473Z"
seen = false
+++

In the landscape of the Romanian 10th-grade Math Olympiad, **logarithms** are a distinct and recurring theme. While they don’t dominate the entire curriculum, a problem involving them is bound to appear, often requiring a deep understanding of algebraic inequalities and identities.

This collection is curated specifically as a training ground for that level. The problems below are a mix of the new and the battle-tested. Some are original compositions/exercises I designed to explore specific algebraic relationships.

Others are drawn directly from past Local or Regional contest phases, selected because they capture the rigor required for competition.

Whether you are looking for a fresh challenge or revisiting classic techniques, these exercises are designed to help you spot the patterns necessary for the Olympiad.

---

The exercises
==========

[Problem LG01](#plg01)

Let \\(a,b,c \\in (0, \\infty) \\setminus \\{1\\}\\) such that \\(abc \\neq 1\\). Given the following relationships:

 \\[ x = \\log\_b a \\] \\[ y = \\log\_c a \\]

Express \\(\\log\_{abc} a\\) in terms of \\(x, y\\) (specifically, find the relationship between \\(\\log\_{abc} a\\) and the given variables).

<details> <summary>Hint 1</summary>

When dealing with multiple logarithms that share the same argument \\(a\\), but have different bases \\(b, c, abc\\), the most effective strategy is to use the Reciprocal Property. This allows to move the common variable \\(a\\) into the base position, making the addition of terms possible.

</details> <details> <summary>Solution</summary>

Using the known property \\(\\log\_n m = \\frac{1}{\\log\_m n}\\), we rewrite our known values:

 \\[ \\log\_a b = \\frac{1}{\\log\_b a} = \\frac{1}{x} \\] \\[ \\log\_a c = \\frac{1}{\\log\_c a} = \\frac{1}{y} \\]

Expand using the "Product Rule":

 \\[ \\log\_{abc} a = \\frac{1}{\\log a (abc)} = \\frac{1}{\\log\_a a + \\log\_a b + \\log\_a c} = \\] \\[ = \\frac{1}{1+\\frac{1}{x}+\\frac{1}{y}} = \\frac{xy}{xy+x+y} \\]

</details>

[Problem LG02](#plg02)

Let \\(a,b \\in (0, \\infty) \\setminus \\{1\\}\\). Given the following equations involving a common power of n:

 \\[ a^x = \\left(ab\\right)^n = b^y \\]

Prove that: \\(\\frac{1}{x}+\\frac{1}{y}=\\frac{1}{n}\\)

<details> <summary>Hint 1</summary>

When you see variables in exponents (like \\(x,y,n\\)) and the goal involves their reciprocals \\( \\left(\\frac{1}{x}, \\frac{1}{y}, \\frac{1}{n}\\right)\\), the most direct path is to convert the exponential equations into logarithmic form. This moves the variables from the "ceiling" to the "floor", so they can be manipulated algebraically.

</details> <details> <summary>Solution</summary>

Starting with the first equation, we use logarithms to "isolate" \\(x\\) and \\(y\\):

 \\[ a^x = (ab)^n \\implies x = \\log\_a (ab)^n = \\log\_a \\left(a^n\\cdot b^n\\right) = \\] \\[ = n \\log\_a a + n \\log\_a b = n \\cdot \\left(1 + \\log\_a b\\right) \\] \\[ b^y = (ab)^n \\implies y = \\log\_b (ab)^n = \\log\_b \\left(a^n \\cdot b^n\\right) = \\] \\[ = n \\log\_b a + n \\log\_b b = n \\cdot \\left(1+ \\log\_b a\\right) \\]

To make \\(x\\) "compatible" with \\(y\\), we convert \\(\\log\_b a\\) to \\(\\frac{1}{\\log\_a b}\\):

 \\[ y = n \\cdot \\left(1+\\log\_b a\\right) = n \\cdot \\left(1 + \\frac{1}{\\log\_a b}\\right) = \\] \\[ = n \\cdot \\frac{1+\\log\_a b}{\\log\_a b} \\]

Now we substitute the expressions for \\(x\\) and \\(y\\) into the reciprocal sum:

 \\[ \\frac{1}{x} + \\frac{1}{y} = \\frac{1}{n \\cdot \\left(1 + \\log\_a b \\right)} + \\frac{\\log\_a b}{n \\cdot \\left(1+\\log\_a b\\right)} = \\] \\[ = \\frac{1+\\log\_a b}{n \\cdot \\left(1+\\log\_a b\\right)} = \\frac{1}{n} \\]

</details> <details> <summary>Note</summary>

After giving this more thought, a simpler solution without logaritgms exists. Can can you find it ?

</details>

[Problem LG03](#plg03)

Let \\(n \\in \\mathbb{N}\\) and \\(n \> 2\\). Prove the following identity:

 \\[ \\sum\_{i=2}^n \\frac{1}{\\log\_i n} = \\prod\_{i=n+1}^{n!} \\log\_{i-1} i \\]

<details> <summary>Solution</summary>

We analyze the Left-Hand Side (LHS) and Right-Hand Side (RHS) independently.

 \\[ \\sum\_{i=2}^{n} \\frac{1}{\\log\_i n} = \\log\_n 2 + \\log\_n 3 + \\log\_n 4 + \\dots + \\log\_n n = \\] \\[ = \\log\_n 2 + \\log\_n 3 + \\dots + \\log\_n n = \\log\_n (2 \\cdot 3 \\cdot 4 \\cdot \\dots \\cdot n) = \\log\_n \\left(n!\\right) \\]

At the same time, the product is defined from \\(i = n+1\\) to \\(n!\\). Let's expand the first few terms and the final term:

 \\[ \\prod\_{i=n+1}^{n!} \\log\_{i-1} i = \\log\_n(n+1) \\cdot \\log\_{n+1}(n+2) \\cdot \\log\_{n+2}(n+3) \\dots \\log\_{n!-1}(n!) \\]

We apply the Chain Rule for Logarithms, which states that \\(\\log\_a b \\cdot \\log\_b c = \\log\_a c\\). This creates a telescoping effect where the argument of one logarithm cancels the base of the next:

 \\[ \\prod\_{i=n+1}^{n!}[\\log\_{i-1}i] = \\underbrace{\\underbrace{\\log\_n(n+1) \* \\log\_{n+1}(n+2)}\_{=\\log\_n(n+2)} \* .}\_{=\\log\_nk}.. \* \\log\_{n!-1}(n!) \\Leftrightarrow \\\\ \\prod\_{i=n+1}^{n!}[\\log\_{i-1}i] = \\log\_n(n!) \\]

We can conclude that:

 \\[ \\sum\_{i=2}^n \\frac{1}{\\log\_i n} = \\log\_n (n!) = \\prod\_{i=n+1}^{n!} \\log\_{i-1} i \\]

</details>

[Problem LG04](#plg04)

Let \\(a,b,m \\in (0, \\infty) \\setminus \\{1\\}\\). Given the equation:

 \\[ a^{\\log\_m x} \\cdot x^{\\log\_m b} = ab \\]

Prove that \\(x=m\\).

<details> <summary>Hint 1</summary>

Rewrite \\(a,b,x\\) in terms of base \\(m\\).

</details> <details> <summary>Solution</summary>

By the definition of logarithms, any number \\(N\\) can be written as \\(N=m^{\\log\_m N}\\):

 \\[ a = m^{\\log\_m a} \\] \\[ b = m^{\\log\_m b} \\] \\[ x = m^{\\log\_m x} \\] \\[ (ab) = m^{\\log\_{m} ab} \\]

Substitute these into the original equation \\(a^{\\log\_m x} \\cdot x^{\\log\_m b}\\):

 \\[ (m^{\\log\_m a})^{\\log\_m x} \\cdot (m^{\\log\_m x})^{\\log\_m b} = m^{(\\log\_m a \\cdot \\log\_m x)} \\cdot m^{(\\log\_m x \\cdot \\log\_m b)} = \\] \\[ = m^{(\\log\_m a \\cdot \\log\_m x) + (\\log\_m x \\cdot \\log\_m b)} = m^{\\log\_m x (\\log\_m a + \\log\_m b)} = \\] \\[ = m^{\\log\_m x \\cdot \\log\_m(ab)} \\]

Recall that \\(ab = m^{\\log\_m(ab)}\\). Our equation is now:

 \\[ m^{\\log\_m x \\cdot \\log\_m(ab)} = m^{\\log\_m(ab)} \\Leftrightarrow \\] \\[ \\log\_m x \\cdot \\log\_m(ab) = \\log\_m(ab) \\Leftrightarrow \\] \\[ \\log\_m x = 1 \\implies x = m \\]

</details>

[Problem LG05](#plg04)

Let \\(a,b,c,x \\in (0, \\infty) \\setminus \\{1\\}\\). Given the relationship:

 \\[ 2 \\cdot \\log\_b x = \\log\_c x - \\log\_a x \\]

Prove that:

 \\[ c^2 = \\left( \\frac{a}{c} \\right)^{\\log\_a b} \\]

<details> <summary>Hint 1</summary>

Notice that the variable \\(x\\) is consistent as the argument across all terms, but the bases (\\(a, b, c\\)) are mismatched. Logarithms are only additive when their bases are identical.

</details> <details> <summary>Solution</summary>

Using the "reciprocal property" \\(\\log\_n m = \\frac{1}{\\log\_m n}\\), we rewrite the equation to unify the terms under base \\(x\\):

 \\[ \\frac{2}{\\log\_x b} = \\frac{1}{\\log\_x c} - \\frac{1}{\\log\_x a} = \\frac{\\log\_x a - \\log\_x c}{\\log\_x a \\cdot \\log\_x c} \\]

To get rid of the fractions we cross-multiply:

 \\[ 2(\\log\_x a \\cdot \\log\_x c) = \\log\_x b (\\log\_x a - \\log\_x c) \\Leftrightarrow \\] \\[ 2\\log\_x c = \\frac{\\log\_x b}{\\log\_x a} \\cdot (\\log\_x a - \\log\_x c) \\Leftrightarrow \\] \\[ 2 \\log\_x c = \\log\_a b \\cdot \\log\_x \\left( \\frac{a}{c} \\right) \\Leftrightarrow \\] \\[ \\log\_x (c^2) = \\log\_x \\left[ \\left( \\frac{a}{c} \\right)^{\\log\_a b} \\right] \\Leftrightarrow \\] \\[ c^2 = \\left( \\frac{a}{c} \\right)^{\\log\_a b} \\]

</details>

[Problem LG06](#plg04)

Let \\(a,b,c \\in (0, \\infty) \\setminus \\{1\\}\\). Find the value of \\(x\\) that satisfies the following equation:

 \\[ a^{\\ln \\frac{b}{c}} \\cdot b^{\\ln \\frac{c}{a}} \\cdot c^{\\ln \\frac{a}{x}} = 1 \\]

<details> <summary>Solution</summary>

Apply \\(\\ln\\) to the entire equation. Since \\(\\ln(1) = 0\\), we have:

 \\[ \\ln \\left( a^{\\ln \\frac{b}{c}} \\cdot b^{\\ln \\frac{c}{a}} \\cdot c^{\\ln \\frac{a}{x}} \\right) = 0 \\]

Using the rules \\(\\ln(MN) = \\ln M + \\ln N\\) and \\(\\ln(M^k) = k \\ln M\\):

 \\[ \\ln\\left(\\frac{b}{c}\\right)\\ln a + \\ln\\left(\\frac{c}{a}\\right)\\ln b + \\ln\\left(\\frac{a}{x}\\right)\\ln c = 0 \\]

Expand the internal fractions using \\(\\ln(M/N) = \\ln M - \\ln N\\):

 \\[ (\\ln b - \\ln c)\\ln a + (\\ln c - \\ln a)\\ln b + (\\ln a - \\ln x)\\ln c = 0 \\Leftrightarrow \\] \\[ (\\ln b \\ln a - \\ln c \\ln a) + (\\ln c \\ln b - \\ln a \\ln b) + (\\ln a \\ln c - \\ln x \\ln c) = 0 \\Leftrightarrow \\] \\[ \\underbrace{\\ln a \\ln b - \\ln a \\ln b}\_{0} + \\underbrace{\\ln a \\ln c - \\ln a \\ln c}\_{0} + \\ln b \\ln c - \\ln x \\ln c = 0 \\Leftrightarrow \\] \\[ \\ln b \\ln c - \\ln x \\ln c = 0 \\Leftrightarrow \\] \\[ \\ln c (\\ln b - \\ln x) = 0 \\Leftrightarrow \\] \\[ \\ln x = \\ln b \\Leftrightarrow \\] \\[ x = b \\]

</details>

[Problem LG07](#plg07)

Solve the equation:

 \\[ (\\log\_a x)^{\\log\_b x} = (\\log\_b x)^{\\log\_a x} \\]

where \\(a, b\>0\\) and \\(a, b \\neq 1\\).

<details> <summary>Solution 1</summary>

Not all math questions have "nice" answers.

Given:

 \\[ (\\log\_a x)^{\\log\_b x} = (\\log\_b x)^{\\log\_a x} \\]

Taking \\(\\log\_b\\) on both sides:

 \\[ \\log\_b \\left[(\\log\_a x)^{\\log\_b x}\\right] = \\log\_b \\left[(\\log\_b x)^{\\log\_a x}\\right] \\Leftrightarrow \\] \\[ (\\log\_b x) \\cdot \\log\_b(\\log\_a x) = (\\log\_a x) \\cdot \\log\_b(\\log\_b x) \\]

Using the change of base formula \\(\\log\_a x = \\frac{\\log\_b x}{\\log\_b a}\\):

 \\[ (\\log\_b x) \\cdot \\log\_b(\\log\_a x) = \\frac{\\log\_b x}{\\log\_b a} \\cdot \\log\_b(\\log\_b x) \\Leftrightarrow \\] \\[ (\\log\_b x) \\cdot \\log\_b(\\frac{\\log\_b x}{\\log\_b a}) = \\frac{\\log\_b x}{\\log\_b a} \\cdot \\log\_b(\\log\_b x) \\]

Assuming \\(x \\neq 1\\) (which is a trivial solution), we divide both sides by \\(\\log\_b x\\):

 \\[ \\log\_b\\left(\\frac{\\log\_b x}{\\log\_b a}\\right) = \\frac{\\log\_b(\\log\_b x)}{\\log\_b a} \\Leftrightarrow \\]

 \\[ \\log\_b(\\log\_b x) - \\log\_b(\\log\_b a) = \\frac{\\log\_b(\\log\_b x)}{\\log\_b a} \\]

Isolate the terms involving \\(x\\):

 \\[ \\log\_b(\\log\_b x) \\left(1 - \\frac{1}{\\log\_b a}\\right) = \\log\_b(\\log\_b a) \\Leftrightarrow \\]

 \\[ \\log\_b(\\log\_b x) \\left(\\frac{\\log\_b a - 1}{\\log\_b a}\\right) = \\log\_b(\\log\_b a) \\Leftrightarrow \\]

 \\[ \\log\_b(\\log\_b x) = \\frac{\\log\_b(\\log\_b a) \\cdot \\log\_b a}{\\log\_b a - 1} \\]

Finally, exponentiate twice to solve for \\(x\\):

 \\[ x = b^{b^{\\left( \\frac{\\log\_b a \\cdot \\log\_b(\\log\_b a)}{\\log\_b a - 1} \\right)}} \\]

Additionally, \\(x = 1\\) is a solution for any \\(a, b\\) where the logarithms are defined.

</details> <details> <summary>Solution 2</summary>

User @mgologanu actually challenged the fact that not all problems have nice solutions. We can make the answer look nicer, by keeping the symmetry.

 First, we take the natural logarithm (\\(\\ln\\)) of both sides to bring the exponents down. The choice of using \\(\\ln\\) belongs to him:

 \\[ \\log\_b x \\cdot \\ln(\\log\_a x) = \\log\_a x \\cdot \\ln(\\log\_b x) \\iff \\]

 \\[ \\iff \\frac{\\ln x}{\\ln b} \\cdot \\ln\\left(\\frac{\\ln x}{\\ln a}\\right) = \\frac{\\ln x}{\\ln a} \\cdot \\ln\\left(\\frac{\\ln x}{\\ln b}\\right) \\iff \\]

 Assuming \\(x \\neq 1\\) (since \\(x=1\\) is a trivial solution):

 \\[ \\iff \\frac{1}{\\ln b} \\left[ \\ln(\\ln x) - \\ln(\\ln a) \\right] = \\frac{1}{\\ln a} \\left[ \\ln(\\ln x) - \\ln(\\ln b) \\right] \\iff \\]

 \\[ \\iff \\ln a \\left[ \\ln(\\ln x) - \\ln(\\ln a) \\right] = \\ln b \\left[ \\ln(\\ln x) - \\ln(\\ln b) \\right] \\iff \\]

 \\[ \\iff \\ln a \\ln(\\ln x) - \\ln b \\ln(\\ln x) = \\ln a \\ln(\\ln a) - \\ln b \\ln(\\ln b) \\iff \\] \\[ \\iff \\ln(\\ln x) (\\ln a - \\ln b) = \\ln a \\ln(\\ln a) - \\ln b \\ln(\\ln b) \\iff \\]

 Solve for \\(\\ln(\\ln x)\\):

 \\[ \\ln(\\ln x) = \\frac{\\ln a \\ln(\\ln a) - \\ln b \\ln(\\ln b)}{\\ln a - \\ln b} \\iff \\]

 \\[ \\iff \\ln(\\ln x) = \\ln(\\ln a) \\cdot \\left[ \\frac{\\ln a}{\\ln a - \\ln b} \\right] - \\ln(\\ln b) \\cdot \\left[ \\frac{\\ln b}{\\ln a - \\ln b} \\right] \\iff \\]

 \\[ \\iff \\ln(\\ln x) = \\ln(\\ln a) \\left( \\frac{1}{1-\\frac{\\ln b}{\\ln a}} \\right) + \\ln(\\ln b) \\left( \\frac{1}{1-\\frac{\\ln a}{\\ln b}} \\right) \\iff \\]

 \\[ \\iff \\ln(\\ln x) = \\ln(\\ln a) \\left( \\frac{1}{1-\\log\_a b} \\right) + \\ln(\\ln b) \\left( \\frac{1}{1-\\log\_b a} \\right) \\iff \\]

 \\[ \\iff \\ln(\\ln x) = \\ln \\left[ (\\ln a)^{\\frac{1}{1 - \\log\_a b}} \\cdot (\\ln b)^{\\frac{1}{1 - \\log\_b a}} \\right] \\iff \\]

 Finally, exponentiate both sides to remove the outer logarithm:

 \\[ \\ln x = (\\ln a)^{\\frac{1}{1 - \\log\_a b}} \\cdot (\\ln b)^{\\frac{1}{1 - \\log\_b a}} \\]

\\(x\\) from the solutions is "equivalent".

</details>

[Problem LG08](#plg08)

Let \\(a,b,m \\in (0,1)\\) or \\(a,b,m \\in (1, \\infty)\\). Prove that:

 \\[ \\frac{2\\log\_{ab}m}{\\sqrt{\\log\_am \\cdot \\log\_bm}} \\le 1 \\]

<details> <summary>Solution</summary>

Since \\( a, b, m \\in (0,1) \\) or \\( (1, \\infty) \\), all logarithmic terms are positive.

 \\[ \\begin{aligned} \\frac{2\\log\_{ab}m}{\\sqrt{\\log\_am \\cdot \\log\_bm}} \\le 1 & \\iff 2\\log\_{ab}m \\le \\sqrt{\\log\_am \\cdot \\log\_bm} \\\\ \\\\ & \\iff \\frac{2}{\\log\_m(ab)} \\le \\sqrt{\\log\_am \\cdot \\log\_bm} \\\\ \\\\ & \\iff \\frac{2}{\\log\_ma + \\log\_mb} \\le \\sqrt{\\log\_am \\cdot \\log\_bm} \\\\ \\\\ & \\iff \\frac{2}{\\frac{1}{\\log\_am} + \\frac{1}{\\log\_bm}} \\le \\sqrt{\\log\_am \\cdot \\log\_bm} \\end{aligned} \\]

Let \\( x = \\log\_a m \\) and \\( y = \\log\_b m \\). The inequality becomes:

 \\[ \\frac{2}{\\frac{1}{x} + \\frac{1}{y}} \\le \\sqrt{xy} \\]

The Left Hand Side is the Harmonic Mean of \\(x\\) and \\(y\\), and the Right Hand Side is the Geometric Mean. Since \\( HM \\le GM \\) for all positive real numbers, the inequality is true (with equality iff \\( x=y \\)).

</details>

[Problem LG09](#plg09)

Let \\( a, b, m \\in (1, \\infty) \\), prove that:

 \\[ \\frac{1}{\\log\_{(a+b)}m} \\ge \\frac{1}{\\log\_2m} + \\frac{1}{2}\\left(\\frac{1}{\\log\_am}+\\frac{1}{\\log\_bm}\\right) \\]

<details> <summary>Solution</summary>

We start with the inequality we want to prove, and we change the base of all logarithms to \\( m \\):

 \\[ \\frac{1}{\\log\_{a+b}m} \\ge \\frac{1}{\\log\_2m} + \\frac{1}{2}\\left(\\frac{1}{\\log\_am}+\\frac{1}{\\log\_bm}\\right) \\iff \\] \\[ \\iff \\log\_m(a+b) \\ge \\log\_m 2 + \\frac{1}{2}(\\log\_m a + \\log\_m b) \\iff \\] \\[ \\iff \\log\_m(a+b) - \\log\_m 2 \\ge \\log\_m\\sqrt{ab} \\iff \\] \\[ \\iff \\log\_m\\left(\\frac{a+b}{2}\\right) \\ge \\log\_m\\sqrt{ab} \\iff \\]

Since the logarithmic function is strictly increasing for a base greater than \\(1\\), we can compare the arguments directly. This leads to the Arithmetic Mean-Geometric Mean inequality (AM-GM), which is known to be true.

</details>

[Problem LG10](#plg10)

Let \\(x\_1, x\_2, \\dots, x\_n\\) be real numbers such that either all \\(x\_i \\in (0,1)\\), or all \\(x\_i \\in (1, \\infty)\\), prove that for any integer \\(n \\ge 2\\):

 \\[ \\sum\_{i=1}^{n-1} \\log\_{x\_i} x\_{i+1} \\ge n - \\log\_{x\_n} x\_1 \\]

<details> <summary>Solution</summary>

We re-arrange the inequality:

 \\[ \\sum\_{i=1}^{n-1} \\log\_{x\_i} x\_{i+1} \\ge n - \\log\_{x\_n} x\_1 \\iff \\] \\[ \\iff \\sum\_{i=1}^{n-1} \\log\_{x\_i} x\_{i+1} + \\log\_{x\_n} x\_1 \\ge n \\]

The left side is now a sum of \\( n \\) terms. Since all \\( x\_i \\) are in the same interval (either all less than 1 or all greater than 1), every logarithmic term is positive. We can apply the **AM-GM Inequality**:

 \\[ \\frac{\\sum\_{i=1}^{n-1} \\log\_{x\_i} x\_{i+1} + \\log\_{x\_n} x\_1}{n} \\ge \\sqrt[n]{ \\left( \\prod\_{i=1}^{n-1} \\log\_{x\_i} x\_{i+1} \\right) \\cdot \\log\_{x\_n} x\_1 } \\]

Evaluate the product inside the root using the chain rule for logarithms (\\( \\log\_a b \\cdot \\log\_b c = \\log\_a c \\)):

 \\[ \\text{Product} = \\underbrace{\\log\_{x\_1}x\_2 \\cdot \\log\_{x\_2}x\_3 \\cdots \\log\_{x\_{n-1}}x\_n}\_{\\log\_{x\_1}x\_n} \\cdot \\log\_{x\_n}x\_1 = \\log\_{x\_1}x\_n \\cdot \\log\_{x\_n}x\_1 = 1 \\implies \\] \\[ \\frac{\\text{Sum}}{n} \\ge \\sqrt[n]{1} = 1 \\implies \\text{Sum} \\ge n \\]

</details>

[Problem LG11](#plg11)

Let \\( a, b, c \\in (0,1) \\cup (1, \\infty) \\). If \\( x = \\log\_b c \\), \\( y = \\log\_a c \\), and \\( m = \\log\_{abc} c \\), prove that:

 \\[ \\left(\\frac{1}{m \\sqrt{3}} - 1\\right) \\left(\\frac{1}{m \\sqrt{3}} + 1\\right) \\le \\frac{1}{x^2} + \\frac{1}{y^2} \\]

<details> <summary>Solution</summary>

 First, let's simplify the expression for \\( m \\) to find a relationship between \\( x, y, \\) and \\( m \\).

 \\[ m = \\log\_{abc} c \\implies \\frac{1}{m} = \\log\_c(abc) \\iff \\] \\[ \\iff \\frac{1}{m} = \\log\_c a + \\log\_c b + \\log\_c c \\]

Substitute \\( x = \\log\_b c \\) and \\( y = \\log\_a c \\) using the change of base property \\( \\log\_u v = \\frac{1}{\\log\_v u} \\):

 \\[ \\frac{1}{m} = \\frac{1}{\\log\_a c} + \\frac{1}{\\log\_b c} + 1 \\implies \\frac{1}{m} = \\frac{1}{y} + \\frac{1}{x} + 1 \\]

 Now, apply the **Cauchy-Schwarz Inequality** to the vectors \\( \\vec{u} = (\\frac{1}{x}, \\frac{1}{y}, 1) \\) and \\( \\vec{v} = (1, 1, 1) \\), this will lead to:

 \\[ \\left( \\frac{1}{x} \\cdot 1 + \\frac{1}{y} \\cdot 1 + 1 \\cdot 1 \\right)^2 \\le \\left( \\frac{1}{x^2} + \\frac{1}{y^2} + 1^2 \\right) (1^2 + 1^2 + 1^2) \\]

Substitute \\( \\frac{1}{m} \\) back into the left side:

 \\[ \\left( \\frac{1}{m} \\right)^2 \\le 3 \\left( \\frac{1}{x^2} + \\frac{1}{y^2} + 1 \\right) \\iff \\] \\[ \\iff \\frac{1}{3m^2} \\le \\frac{1}{x^2} + \\frac{1}{y^2} + 1 \\iff \\frac{1}{3m^2} - 1 \\le \\frac{1}{x^2} + \\frac{1}{y^2} \\iff \\] \\[ \\left( \\frac{1}{m\\sqrt{3}} - 1 \\right) \\left( \\frac{1}{m\\sqrt{3}} + 1 \\right) \\le \\frac{1}{x^2} + \\frac{1}{y^2} \\]

</details> <details> <summary>Source</summary>

Andrei N. Ciobanu

</details>

[Problem LG12](#plg12)

Prove that for any integer \\( n \\ge 3 \\):

 \\[ \\sum\_{i=2}^{n-1}\\log\_i(i+1) \\ge \\sum\_{i=2}^{n-1}\\log\_i 2 + \\frac{n-2}{2} \\]

<details> <summary>Solution</summary>

First, bring the two sums together on the left side by subtracting \\(\\sum\_{i=2}^{n-1}\\log\_i 2\\) from both sides:

 \\[ \\sum\_{i=2}^{n-1} \\log\_i(i+1) - \\sum\_{i=2}^{n-1} \\log\_i 2 \\ge \\frac{n-2}{2} \\]

Combine the logarithms within the sum:

 \\[ \\sum\_{i=2}^{n-1} \\log\_i\\left(\\frac{i+1}{2}\\right) \\ge \\frac{n-2}{2} \\]

Now, let's analyze the term inside the summation. We can compare the arithmetic mean and geometric mean of the numbers \\( i \\) and \\( 1 \\). By the **AM-GM Inequality**:

 \\[ \\frac{i+1}{2} \\ge \\sqrt{i \\cdot 1} = \\sqrt{i} = i^{\\frac{1}{2}}\\]

Since \\( i \\ge 2 \\), the base of the logarithm is greater than 1, so the function is strictly increasing. Taking \\( \\log\_i \\) of both sides preserves the inequality:

 \\[ \\log\_i\\left(\\frac{i+1}{2}\\right) \\ge \\log\_i(\\sqrt{i}) \\implies \\] \\[ \\implies \\log\_i\\left(\\frac{i+1}{2}\\right) \\ge \\frac{1}{2} \\]

Finally, sum this inequality from \\( i=2 \\) to \\( n-1 \\). Note that there are exactly \\( (n-1) - 2 + 1 = n-2 \\) terms in the series:

 \\[ \\sum\_{i=2}^{n-1} \\log\_i\\left(\\frac{i+1}{2}\\right) \\ge \\sum\_{i=2}^{n-1} \\frac{1}{2} = (n-2) \\cdot \\frac{1}{2} = \\frac{n-2}{2} \\]

</details> <details> <summary>Source</summary>

Andrei N. Ciobanu

</details>

[Problem LG13](#plg13)

Consider the set \\( M \\) defined as:

 \\[ M = \\left\\{ x \\in (0,1) \\cup (1,\\infty) \\mid 7 \\ln^3 x - [\\ln x]^3 - \\{\\ln x\\}^3 = \\{[\\lg x]\\} + [\\{e^x\\}] \\right\\} \\]

Prove that the following inequality holds for any \\( x \\in M \\):

 \\[ \\sum\_{k=2}^{2013} \\log\_k x \< \\frac{2012^2}{\\ln \\frac{1}{(2013!)^2}} \\]

The notations \\([\\cdot]\\) and \\(\\{\\cdot\\}\\) represent the integer part (floor) and the fractional part of a real number, respectively.

<details> <summary>Solution</summary>

Before proving the inequality, we have to uncover the actual structure of \\(M\\), and for that, we need to solve the equation.

Let's look at the terms on the right side:

* \\([\\lg x]\\) is an integer. The fractional part of any integer is always 0. So, \\(\\{[\\lg x]\\} = 0\\).
* \\(\\{e^x\\}\\) is a fractional part, so by definition it lies in the interval \\([0, 1)\\). The integer part (floor) of any number in \\([0, 1)\\) is 0. So, \\([\\{e^x\\}] = 0\\).

In conclusion, \\(\\{[\\lg x]\\} + [\\{e^x\\}]\\) is just a fancy way of saying \\(0\\).

Thus, the equation can be rewritten as:

 \\[ 7 \\ln^3 x - [\\ln x]^3 - \\{\\ln x\\}^3 = 0 \\]

Let's substitute \\(a = [\\ln x]\\) and \\(b = \\{\\ln x\\}\\). Taking into consideration that \\(\\ln x = a + b\\), we can rewrite the equation as:

 \\[ 7 (a + b)^3 - a^3 - b^3 = 0 \\iff \\] \\[ \\iff 6a^3 + 6b^3 + 21ab(a+b) = 0 \\iff \\] \\[ \\iff 2(a+b)(a^2 - ab + b^2) + 7ab(a+b) = 0 \\iff \\] \\[ \\iff (a+b)(2a^2 - 2ab + 2b^2) + 7ab(a+b) = 0 \\iff \\] \\[ \\iff (a+b)(2a^2+5ab+2b^2) = 0 \\iff \\] \\[ \\iff (a+b)(a+2b)(2a+b) = 0 \\]

It's already good news. We have 3 possible cases where the factors can be zero:

* \\(a+b=0\\), which means that \\([\\ln x]+\\{\\ln x\\}=\\ln x=0 \\implies x=1\\). We reject this solution, as \\(x \\in (0,1) \\cup (1,\\infty)\\) per the definition of \\(M\\);
* \\(2a+b = 0 \\implies b=-2a\\). Since \\(b=\\{\\ln x\\} \\in [0,1)\\) and \\(a=[\\ln x] \\in \\mathbb{Z}\\), the only solution is when \\(a=b=0\\). This means \\(\\ln x = 0 \\implies x = 1\\), and again this solution is rejected;
* \\(a+2b=0\\). Since \\(b=\\{\\ln x\\} \\in [0,1)\\) and \\(a=[\\ln x] \\in \\mathbb{Z}\\), the only valid solution here is \\((a=-1, b=\\frac{1}{2}) \\implies \\ln x = -\\frac{1}{2} \\implies x = \\frac{1}{\\sqrt{e}}\\).

So, in conclusion, \\(M=\\{\\frac{1}{\\sqrt{e}}\\}\\).

At this point, we need to prove the inequality, taking into consideration that \\(\\log\_k \\frac{1}{\\sqrt{e}}=\\log\_k e^{-\\frac{1}{2}}=-\\frac{1}{2 \\ln k}\\). The inequality becomes:

 \\[ -\\frac{1}{2} \\sum\_{k=2}^{2013} \\frac{1}{\\ln k} \< \\frac{2012^2}{\\ln \\frac{1}{(2013!)^2}} \\iff \\] \\[ \\iff -\\frac{1}{2} \\sum\_{k=2}^{2013} \\frac{1}{\\ln k} \< - \\frac{2012^2}{2 \\sum\_{k=2}^{2013} \\ln k} \\iff \\] \\[ \\iff \\sum\_{k=2}^{2013} \\frac{1}{\\ln k} \> \\frac{2012^2}{\\sum\_{k=2}^{2013} \\ln k} \\]

If \\(n=2012\\) (because mathematicians prefer letters to numbers), the inequality holds thanks to the well-known Cauchy-Schwarz inequality:

 \\[ \\left( \\sum\_{k=2}^{n+1} \\ln k \\right) \\left( \\sum\_{k=2}^{n+1} \\frac{1}{\\ln k} \\right) \> (1+1+\\dots+1)^2 = n^2 \\]

</details> <details> <summary>Source</summary>

Concursul Județean de Matematică "Cristian S. Calude", ediția XIV-a, Galați, România, 2013

</details>

[Problem LG14](#plg14)

Let \\( a, b, c, d \\in (1, \\infty) \\). Prove that:

 \\[ \\prod\_{\\text{cyc}} \\log\_{\\frac{1}{(a+b)^2}} \\frac{9}{4\\left(\\frac{a+b}{2} + c + d\\right)^2} \\ge 1 \\]

<details> <summary>Hint 1</summary>

The notation \\(\\prod\_{\\text{cyc}}\\) denotes a **cyclic product**. It implies multiplying the given expression by the 3 variations obtained by cyclically shifting the variables \\(a \\to b \\to c \\to d \\to a\\).

For example, if the first term depends on \\((a,b,c,d)\\), the second depends on \\((b,c,d,a)\\), the third on \\((c,d,a,b)\\), and the last on \\((d,a,b,c)\\).

Expanded, the expression is:

 \\[ \\begin{aligned} &\\log\_{\\frac{1}{(a+b)^2}} \\frac{9}{4\\left(\\frac{a+b}{2} + c + d\\right)^2} \\cdot \\log\_{\\frac{1}{(b+c)^2}} \\frac{9}{4\\left(\\frac{b+c}{2} + d + a\\right)^2} \\cdot \\\\ &\\cdot \\log\_{\\frac{1}{(c+d)^2}} \\frac{9}{4\\left(\\frac{c+d}{2} + a + b\\right)^2} \\cdot \\log\_{\\frac{1}{(d+a)^2}} \\frac{9}{4\\left(\\frac{d+a}{2} + b + c\\right)^2} \\ge 1 \\end{aligned} \\]

</details> <details> <summary>Hint 2</summary>

You can simplify the complex terms using the identity: \\(\\log\_{A^n} (B^n) = \\log\_A B\\). This can be derived from standard logarithmic properties.

</details> <details> <summary>Solution</summary>

We observe that for each term in the product, both the base and the argument can be written as powers with an exponent of \\(-2\\). We can use Hint 2 to simplify the expressions:

 \\[ \\begin{aligned} \\prod\_{\\text{cyc}} \\log\_{\\frac{1}{(a+b)^2}} \\frac{9}{4\\left(\\frac{a+b}{2} + c + d\\right)^2} &= \\prod\_{\\text{cyc}} \\log\_{\\left(\\frac{1}{a+b}\\right)^2} \\left[\\frac{3}{2\\left(\\frac{a+b}{2} + c + d\\right)}\\right]^2 \\\\ &= \\prod\_{\\text{cyc}} \\log\_{\\left(a+b\\right)^{-2}} \\left[\\frac{a+b+2(c+d)}{3}\\right]^{-2} \\\\ &= \\prod\_{\\text{cyc}} \\log\_{\\left(a+b\\right)} \\left[\\frac{a+b+2c+2d}{3}\\right] \\end{aligned} \\]

To exploit the symmetry, we regroup the terms in the argument:

 \\[ \\begin{aligned} \\prod\_{\\text{cyc}} \\log\_{\\left(a+b\\right)} \\left[\\frac{a+b+2c+2d}{3}\\right] &= \\prod\_{\\text{cyc}} \\log\_{\\left(a+b\\right)} \\left[\\frac{(b+c)+(c+d)+(d+a)}{3}\\right] \\end{aligned} \\]

Since \\( a, b, c, d \\in (1, \\infty) \\), the sums are positive. We apply the **AM-GM inequality** to the argument of the logarithm. Since the base \\(a+b \> 2\\), the logarithm function is increasing, preserving the inequality:

 \\[ \\begin{aligned} \\prod\_{\\text{cyc}} \\log\_{\\left(a+b\\right)} \\left[\\frac{(b+c)+(c+d)+(d+a)}{3}\\right] &\\geq \\prod\_{\\text{cyc}} \\log\_{\\left(a+b\\right)} \\sqrt[3]{\\left(b+c\\right)\\cdot\\left(c+d\\right)\\cdot\\left(d+a\\right)} \\\\ &= \\prod\_{\\text{cyc}} \\frac{1}{3} \\log\_{\\left(a+b\\right)} \\left[(b+c)\\cdot(c+d)\\cdot(d+a)\\right] \\\\ &= \\prod\_{\\text{cyc}} \\left[\\frac{\\log\_{(a+b)} (b+c) + \\log\_{(a+b)} (c+d) + \\log\_{(a+b)} (d+a)}{3}\\right] \\end{aligned} \\]

We now apply the **AM-GM inequality** again, this time to the sum of the logarithms:

 \\[ \\begin{aligned} \\prod\_{\\text{cyc}} \\left[\\dots\\right] &\\geq \\prod\_{\\text{cyc}} \\sqrt[3]{\\log\_{(a+b)}(b+c)\\cdot\\log\_{(a+b)}(c+d)\\cdot\\log\_{(a+b)}(d+a)} \\\\ &= \\sqrt[3]{ \\prod\_{\\text{cyc}} \\left( \\log\_{(a+b)}(b+c)\\cdot\\log\_{(a+b)}(c+d)\\cdot\\log\_{(a+b)}(d+a) \\right) } \\end{aligned} \\]

Finally, we observe that the terms inside the product cancel out perfectly. We have 12 logarithmic terms that form reciprocal pairs (e.g., \\(\\log\_x y \\cdot \\log\_y x = 1\\)):

 \\[ = \\sqrt[3]{\\underbrace{\\log\_{(a+b)}(c+d) \\cdot \\log\_{(c+d)} (a+b)}\_{1} \\cdot \\dots} = 1 \\]

Since the product is 1, the inequality is proven.

</details> <details> <summary>Source</summary>

Concursul Interjudețean de Matematică "Cristian S. Calude", ediția a XII-a, Galați, 2011

Problem authors: Rodica Balan, Dumitru Balan

</details>

[Problem LG15](#plg15)

Consider the numbers \\( A, B, a, k \\) such that \\( A \> B \> a \> 1 \\) and \\( k \> 0 \\). Prove that:

 \\[ \\log\_a \\frac{A}{B} + 1 \> \\log\_{B+k} (A+k) \\]

<details> <summary>Hint 1</summary>

Try to simplify the inequality by eliminating the \\(+1\\) from the left side.

</details> <details> <summary>Solution</summary>

We begin by rewriting the inequality to make the Right-Hand Side (RHS) comparable to the Left-Hand Side (LHS):

 \\[ \\begin{aligned} & \\log\_a \\frac{A}{B} + 1 \> \\log\_{B+k} (A+k) \\iff \\\\ & \\iff \\log\_a \\frac{A}{B} \> \\log\_{B+k} (A+k) - 1 \\iff \\\\ & \\iff \\log\_a \\frac{A}{B} \> \\log\_{B+k} (A+k) - \\log\_{B+k} (B+k) \\iff \\\\ & \\iff \\log\_a \\frac{A}{B} \> \\log\_{B+k} \\left(\\frac{A+k}{B+k}\\right) \\end{aligned} \\]

To prove this strict inequality, we establish an intermediate inequality and then apply the property of transitivity:

 \\[ \\log\_a \\frac{A}{B} \\overset{\\text{?}}{\>} \\dots \> \\log\_{B+k} \\left(\\frac{A+k}{B+k}\\right) \\]

Intuitively, we first compare the arguments of the logarithms. We want to check if:

 \\[ \\log\_a \\frac{A}{B} \\overset{\\text{?}}{\>} \\log\_a \\left(\\frac{A+k}{B+k}\\right) \\]

Since the base \\(a \> 1\\), the logarithm is an increasing function. Thus, it suffices to prove that \\(\\frac{A}{B} \> \\frac{A+k}{B+k}\\):

 \\[ \\begin{aligned} & \\frac{A}{B} \> \\frac{A+k}{B+k} \\iff \\frac{A}{B}-\\frac{A+k}{B+k} \> 0 \\iff \\\\ & \\iff \\frac{A(B+k)-B(A+k)}{B(B+k)} \> 0 \\iff \\\\ & \\iff \\frac{AB + Ak - AB - Bk}{B(B+k)} \> 0 \\iff \\\\ & \\iff \\frac{k(A-B)}{B(B+k)} \> 0 \\end{aligned} \\]

Since \\( k \> 0 \\), \\( A \> B \\) (implies \\( A-B \> 0 \\)), and \\( B \> 1 \\), the fraction \\(\\frac{k(A-B)}{B(B+k)}\\) is strictly positive. Thus, the argument inequality holds.

Simultaneously, we compare the bases. Since \\(B \> a\\) and \\(k \> 0\\), we have \\(B+k \> a\\). Recall that for a fixed argument greater than 1, a larger base yields a smaller logarithm value. Therefore:

 \\[ \\log\_a \\left( \\frac{A+k}{B+k} \\right) \> \\log\_{B+k} \\left( \\frac{A+k}{B+k} \\right) \\]

Combining these two results allows us to form the complete chain of inequalities:

 \\[ \\log\_a \\frac{A}{B} \> \\log\_a \\left( \\frac{A+k}{B+k} \\right) \> \\log\_{B+k} \\left(\\frac{A+k}{B+k}\\right) \\]

By transitivity, the original inequality is proven.

</details> <details> <summary>Source</summary>

Concursul Interjudețean de Matematică "Cristian S. Calude", Ediția a XVII-a, Galați, 5 Noiembrie 2016.

Clasa a X-a, Problema 1.b.

</details>

[Problem LG16](#plg16)

Let \\( a, b, c \\in (0, 1) \\) or \\( a, b, c \\in (1, \\infty) \\). Prove the inequality:

 \\[ \\sum\_{\\text{cyc}} \\frac{1}{(\\log\_b c + \\log\_c a) \\cdot \\log\_a^3 b} \\ge \\frac{3}{2} \\]

<details> <summary>Hint</summary>

The notation \\(\\sum\_{\\text{cyc}}\\) stands for a **cyclic sum**. It means you take the first term and add the two other variations formed by shifting the variables in the cycle \\(a \\to b \\to c \\to a\\).

So, the expression expands to:

 \\[ \\underbrace{\\frac{1}{(\\log\_b c + \\log\_c a) \\cdot \\log\_a^3 b}}\_{\\text{Original Term}} + \\underbrace{\\frac{1}{(\\log\_c a + \\log\_a b) \\cdot \\log\_b^3 c}}\_{\\text{Shift } a \\to b, b \\to c, c \\to a} + \\underbrace{\\frac{1}{(\\log\_a b + \\log\_b c) \\cdot \\log\_c^3 a}}\_{\\text{Shift } b \\to c, c \\to a, a \\to b} \\]

</details> <details> <summary>Solution 1</summary>

This is a classic problem where substitution works to our advantage. Let's define: \\(x = \\frac{1}{\\log\_a b} = \\log\_b a\\), \\(y = \\frac{1}{\\log\_b c} = \\log\_c b\\), and \\(z = \\frac{1}{\\log\_c a} = \\log\_a c\\). An important thing to notice is that:

 \\[ \\frac{1}{xyz} = \\log\_a b \\cdot \\log\_b c \\cdot \\log\_c a = 1 \\implies xyz = 1 \\]

At the same time, since \\(xyz=1\\), the AM-GM inequality tells us that \\(\\frac{x+y+z}{3} \\geq \\sqrt[3]{xyz} = 1 \\implies x+y+z \\geq 3\\).

Substituting these back into the original expression (noting that \\(\\log\_a^3 b = (1/x)^3\\)):

 \\[ \\begin{aligned} & \\sum\_{\\text{cyc}} \\frac{1}{(\\frac{1}{y}+\\frac{1}{z})\\frac{1}{x^3}} \\geq \\frac{3}{2} \\iff \\sum\_{\\text{cyc}} \\frac{1}{\\frac{z+y}{yz} \\cdot \\frac{1}{x^3}} \\geq \\frac{3}{2} \\iff \\\\ & \\iff \\sum\_{\\text{cyc}} \\frac{x^3 yz}{z+y} \\geq \\frac{3}{2} \\end{aligned} \\]

Since \\(xyz=1\\), we have \\(x^3 yz = x^2 (xyz) = x^2\\). The inequality simplifies to:

 \\[ \\sum\_{\\text{cyc}} {\\frac{x^2}{z+y}} \\geq \\frac{3}{2} \\]

The resulting inequality is quite well known. To keep things simple (or perhaps a bit magical), we can use AM-GM in the following manner to isolate the variables:

 \\[ \\sum\_{\\text{cyc}} \\left(\\frac{x^2}{z+y}+\\frac{z+y}{4} \\right) \\overset{\\text{AM-GM}}{\\geq} 2\\sqrt{\\frac{x^2}{4}} = \\sum\_{\\text{cyc}} x \\]

Rearranging the terms:

 \\[ \\sum\_{\\text{cyc}} \\frac{x^2}{z+y} + \\frac{1}{4}\\sum\_{\\text{cyc}}(z+y) \\geq \\sum\_{\\text{cyc}} x \\]

Notice that \\(\\sum\_{\\text{cyc}}(z+y) = (z+y) + (x+z) + (y+x) = 2(x+y+z)\\). Thus:

 \\[ \\sum\_{\\text{cyc}} \\frac{x^2}{z+y} \\geq \\sum\_{\\text{cyc}} x - \\frac{2(x+y+z)}{4} = \\frac{x+y+z}{2} \\]

Since we established earlier that \\(x+y+z \\ge 3\\), the final result holds:

 \\[ \\sum\_{\\text{cyc}} \\frac{x^2}{z+y} \\geq \\frac{3}{2} \\]

</details> <details> <summary>Solution 2</summary>

We can solve the problem directly using Titu's Lemma and logarithm manipulation:

 \\[ \\begin{aligned} & \\sum\_{\\text{cyc}} \\frac{1}{(\\log\_b c + \\log\_c a) \\cdot \\log\_a^3 b} = \\sum\_{\\text{cyc}} \\frac{1}{\\left(\\frac{1}{\\log\_c b}+\\frac{1}{\\log\_a c}\\right) \\cdot \\frac{1}{\\log\_b^3 a}} = \\\\ & = \\sum\_{\\text{cyc}} \\frac{\\log\_b a \\cdot \\log\_c b \\cdot \\log\_a c \\cdot \\log\_b^2 a}{\\log\_c b + \\log\_a c} \\end{aligned} \\]

Since \\(\\log\_b a \\cdot \\log\_c b \\cdot \\log\_a c = 1\\), the expression simplifies nicely to:

 \\[ \\sum\_{\\text{cyc}} \\frac{\\log\_b^2 a}{\\log\_c b + \\log\_a c} \\]

This structure allows us to easily apply Titu's Lemma:

 \\[ \\sum\_{\\text{cyc}} \\frac{\\log\_b^2 a}{\\log\_c b + \\log\_a c} \\overset{\\text{Titu's Lemma}}{\\geq} \\frac{\\left( \\log\_b a + \\log\_c b + \\log\_a c\\right)^2}{2\\left(\\log\_b a + \\log\_c b + \\log\_a c \\right)} = \\] \\[ = \\frac{\\log\_b a + \\log\_c b + \\log\_a c}{2} \\]

Using AM-GM on the three logarithmic terms:

 \\[ \\frac{\\log\_b a + \\log\_c b + \\log\_a c}{2} \\geq \\frac{3\\sqrt[3]{\\log\_b a \\cdot \\log\_c b \\cdot \\log\_a c}}{2} = \\frac{3}{2} \\]

</details> <details> <summary>Source</summary>

Concursul Interjudețean de Matematică "Cristian S. Calude", ediția a XVIII-a, Galați, 4 noiembrie 2017

Clasa a X-a, proposed by Iuliana Duma

</details>