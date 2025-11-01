---
title = "13 problems with logarithms"
description = "A 13 problems set with logarithms"
date = "2024-06-06T00:00:00Z"
url = "/2024/06/06/13-problems-with-logarithms"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2025-10-22T08:59:05.768381194Z"
seen = true
---

As a side hobby, I like to compose math problems. Solving exercises is one game; creating exercises is another world. It’s fun because you never know where you are going or what you wish to obtain, but sometimes, you can unravel interesting relationships between numbers.

This problem set is *an original endeavor*, meaning I haven’t purposely copied the problems from an existing book or paper. However, the more straightforward exercises are just “natural” extensions of existing formulas, and I am sure somebody else proposed them first. For example, exercise 4 appears under different forms in various problems you can find online, and exercise 5 is a variation of an existing exercise from the classical Romanian “culegere de probleme” Nastasescu & Nita. I found exercise 8 solved on YouTube with a slight twist: \\(a=10, b=e\\).

---

>
>
> Note: Nobody other than me has reviewed the problems. If you see any issues with them (they might be totally wrong for some reason, don’t hesitate to contact me).
>
>

---

The exercises
==========

1. <sup><sup>[very easy]</sup></sup> If \\(a,b,c \\in (0, \\infty) \\setminus \\{1\\}\\), \\(abc \\neq 1\\), \\(x=\\log\_ba\\), and \\(y=\\log\_ca\\), then compute \\(\\log\_{abc}a\\). <sup><sup><a href="#exercise-1">solution</a></sup></sup>

2. <sup><sup>[easy]</sup></sup> If \\(a,b \\in (0, \\infty) \\setminus \\{1\\}\\), \\(a^x=(ab)^n\\) and \\(b^y=(ab)^n\\) prove that \\(\\frac{1}{x}+\\frac{1}{y}=\\frac{1}{n}\\). <sup><sup><a href="#exercise-2">solution</a></sup></sup>

3. <sup><sup>[easy]</sup></sup> Prove that \\(\\sum\_{i=2}^{n}(\\frac{1}{\\log\_i n}) = \\prod\_{i=n+1}^{n!}(\\log\_{i-1}i)\\), where \\(n \\gt 2\\) and \\(n \\in \\mathbb{N}\\). <sup><sup><a href="#exercise-3">solution</a></sup></sup>

4. <sup><sup>[easy]</sup></sup> If \\(a^{\\log\_m x} \* x^{\\log\_m b} = ab\\), prove that \\(x=m\\). <sup><sup><a href="#exercise-4">solution</a></sup></sup>

5. <sup><sup>[medium]</sup></sup> If \\(2\\log\_b x = \\log\_c x - \\log\_a x\\), prove that \\(c^2=(\\frac{a}{c})^{\\log\_a b}\\). <sup><sup><a href="#exercise-5">solution</a></sup></sup>

6. <sup><sup>[hard]</sup></sup> If \\(\\rvert \\log\_a x \\log\_b x \\lvert=\\lvert \\log\_b x \\log\_c x + \\log\_a x \\log\_c x + \\log\_a x \\log\_b x\\rvert\\), prove that \\(c=(abc)^{\\log\_c(abc)}\\). <sup><sup><a href="#exercise-6">solution</a></sup></sup>

7. <sup><sup>[easy]</sup></sup> Find \\(x\\) if \\(a,b,c \\in (0,1) \\cup (1, \\infty)\\), and \\(a^{\\ln\\frac{b}{c}}\*b^{\\ln\\frac{c}{a}}\*c^{\\ln\\frac{a}{x}}=1\\).<sup><sup><a href="#exercise-7">solution</a></sup></sup>

8. <sup><sup>[hard]</sup></sup> Solve \\((\\log\_ax)^{\\log\_bx} = (\\log\_bx)^{\\log\_ax}\\).<sup><sup><a href="#exercise-8">solution</a></sup></sup>

9. <sup><sup>[easy]</sup></sup> If \\(a,b,m \\in (0,1)\\) or \\(a,b,m \\in (1, \\infty)\\), prove that \\(\\frac{\\log\_{ab}m}{\\sqrt{\\log\_am\*\\log\_bm}} \\le 1\\). <sup><sup><a href="#exercise-9">solution</a></sup></sup>

10. <sup><sup>[easy]</sup></sup> If \\(a,b,m \\in (0,1)\\) or \\(a,b,m \\in (1, \\infty)\\), prove \\(\\frac{1}{\\log\_{(a+b)}m} \\ge \\frac{1}{\\log\_2m} + \\frac{1}{2}(\\frac{1}{\\log\_am}+\\frac{1}{\\log\_bm})\\). <sup><sup><a href="#exercise-10">solution</a></sup></sup>

11. <sup><sup>[medium]</sup></sup> If \\(x\_i \\in (0,1)\\) or \\(x\_i \\in (1, \\infty)\\), prove \\(\\sum\_{i=1}^{n-1}\\log\_{x\_{i}}{x\_{i+1}} \\ge n - \\log\_{x\_n}x\_1\\), \\(\\forall n \\in \\mathbb{N}, n \\ge 2\\).<sup><sup><a href="#exercise-11">solution</a></sup></sup>

12.<sup><sup>[medium]</sup></sup> If \\(x=\\log\_b c\\), \\(y=\\log\_a c\\), and \\(m=\\log\_{abc} c\\), prove that \\((\\frac{1}{m \\sqrt{3}}-1)(\\frac{1}{m \\sqrt{3}}+1) \\le \\frac{1}{x^2} + \\frac{1}{y^2}\\).<sup><sup><a href="#exercise-12">solution</a></sup></sup>

13.<sup><sup>[medium]</sup></sup> If \\(a,b,m \\in (0,1)\\) or \\(a,b,m \\in (1, \\infty)\\), prove \\(\\sum\_{i=2}^{n-1}\\log\_i(i+1)\\ge \\sum\_{i=2}^{n-1}\\log\_i2+\\frac{n-2}{2}\\).<sup><sup><a href="#exercise-13">solution</a></sup></sup>

Solutions
==========

Exercise 1
----------

\\(\\log\_{abc}a=\\frac{1}{log\_a(abc)}=\\frac{1}{\\log\_aa+\\log\_ab+\\log\_ac} = \\frac{1}{1 + \\frac{1}{x}+\\frac{1}{y}}=\\frac{xy}{xy+x+y}\\).

Exercise 2
----------

If \\(a^x=(ab)^n \\Rightarrow x = \\log\_{a}(a^nb^n) = n + n\\log\_ab = n(1+\\log\_ab)\\).

In a similar fashion, if \\(b^y=(ab)^n \\Rightarrow y = \\log\_{b}(a^nb^n) = n + n\\log\_ba = n(1+\\log\_ba) = \\frac{n(\\log\_ab+1)}{\\log\_ab}\\).

With this in mind, \\(\\frac{1}{x}+\\frac{1}{y}=\\frac{1}{n(1+\\log\_ab)} + \\frac{log\_ab}{n(1+\\log\_ab)} = \\frac{1+\\log\_ab}{n(1+\\log\_ab)}=\\frac{1}{n}\\).

Exercise 3
----------

We start with the sum:

 \\[\\sum\_{i=2}^{n}(\\frac{1}{\\log\_i n}) = \\frac{1}{\\log\_2 n} + \\frac{1}{\\log\_3 n} + ... + \\frac{1}{\\log\_n n} \\Leftrightarrow \\\\ \\sum\_{i=2}^{n}(\\frac{1}{\\log\_i n}) = \\log\_n 2 + \\log\_n 3 + ... + \\log\_n n \\Leftrightarrow \\\\ \\sum\_{i=2}^{n}(\\frac{1}{\\log\_i n}) = \\log\_n n!\\]

Then we compute the product:

 \\[\\prod\_{i=n+1}^{n!}[\\log\_{i-1}i] = \\underbrace{\\underbrace{\\log\_n(n+1) \* \\log\_{n+1}(n+2)}\_{=\\log\_n(n+2)} \* .}\_{=\\log\_nk}.. \* \\log\_{n!-1}(n!) \\Leftrightarrow \\\\ \\prod\_{i=n+1}^{n!}[\\log\_{i-1}i] = \\log\_n(n!)\\]

As we can see the sum and product are equal.

Exercise 4
----------

We know that: \\(a^{\\log\_m x} \* x^{\\log\_m b} = ab\\).

Let’s write \\(x^{\\log\_m b}=k\\).

This would be equivalent to:

 \\[\\log\_m(x^{\\log\_m b})=\\log\_m k \\Leftrightarrow \\\\ \\log\_m b \* \\log\_m x =\\log\_m k \\Leftrightarrow \\\\ \\log\_m x \* \\log\_m b =\\log\_m k \\Leftrightarrow \\\\ \\log\_m (b^{\\log\_m x})=\\log\_m k \\Leftrightarrow \\\\ b^{\\log\_m x} = k\\]

So we can re-write our initial relationship as:

 \\[a^{\\log\_m x} \* b^{\\log\_m x} = ab \\Leftrightarrow \\\\ (ab)^{\\log\_m x} = (ab)^1 \\Rightarrow \\\\ \\log\_m x = 1 \\Rightarrow \\\\ x = m\\]

Exercise 5
----------

\\(2\\log\_b x = \\log\_c x - \\log\_a x\\) is equivalent to:

 \\[\\frac{2}{\\log\_x b}=\\frac{\\log\_x a - \\log\_x c}{\\log\_x a \\log\_x c}\\]

We re-write everything as:

 \\[2\*\\log\_x c = \\frac{\\log\_x b}{\\log\_x a}\*(\\log\_x a - \\log\_x c)\\]

The latest is equivalent to:

 \\[\\log\_x c^2 = \\log\_a b \* \\log\_x \\frac{a}{c} \\Leftrightarrow \\ \\log\_x c^2 = \\log\_x (\\frac{a}{c})^{\\log\_a b}\\]

Finally, we have proven:

 \\[c^2=(\\frac{a}{c})^{\\log\_a b}\\]

Exercise 6
----------

The modulus is there as a hint that you can square both sides.

 \\[|\\log\_a x \\log\_b x|=|\\log\_b x \\log\_c x + \\log\_a x \\log\_c x + \\log\_a x \\log\_b x| \\Leftrightarrow \\\\ \\\\ (\\log\_a x \\log\_b x)^2=(\\log\_b x \\log\_c x + \\log\_a x \\log\_c x + \\log\_a x \\log\_b x)^2 \\Leftrightarrow \\\\ \\\\ \\frac{\\log\_c x}{\\log\_c x} (\\log\_a x \\log\_b x)^2 = (\\log\_b x \\log\_c x + \\log\_a x \\log\_c x + \\log\_a x \\log\_b x)^2 \\Leftrightarrow \\\\ \\\\ \\frac{1}{\\log\_c x} = \\frac{(\\log\_b x \\log\_c x + \\log\_a x \\log\_c x + \\log\_a x \\log\_b x)}{\\log\_a x \\log\_b x \\log\_c x} \* \\frac{(\\log\_b x \\log\_c x + \\log\_ax \\log\_cx + \\log\_ax \\log\_bx)}{\\log\_ax \\log\_bx}\\Leftrightarrow \\\\ \\\\ \\frac{1}{\\log\_c x}=(\\frac{1}{log\_a x} + \\frac{1}{\\log\_b x} + \\frac{1}{\\log\_c x})(\\frac{\\log\_c x}{\\log\_a x} + \\frac{\\log\_c x}{\\log\_b x} + 1) \\Leftrightarrow \\\\ \\\\ \\log\_x c = (\\log\_x a + \\log\_x b + \\log\_x c)(\\frac{log\_x a}{log\_x c} + \\frac{\\log\_x b}{\\log\_x c} + \\frac{\\log\_x c}{\\log\_x c}) \\Leftrightarrow \\\\ \\\\ \\log\_x c = (\\log\_x a + \\log\_x b + \\log\_x c)(\\log\_c a + \\log\_c b + \\log\_c c) \\Leftrightarrow \\\\ \\\\ \\log\_x c = \\log\_x(abc) \* \\log\_c(abc) \\Leftrightarrow \\\\ \\\\ c = (abc)^{\\log\_c(abc)}\\]

Exercise 7
----------

 \\[\\ln a\*\\ln\\frac{b}{c} + \\ln b\*\\ln\\frac{c}{a} + \\ln c\*\\ln{a}{x}=0 \\Leftrightarrow \\\\ \\ln a(\\ln b-\\ln c) + \\ln b (\\ln c - \\ln a) + \\ln (\\ln a - \\ln x) = 0\\]

After reducing the terms further:

 \\[\\ln c(\\ln b - \\ln x) = 0 \\Rightarrow x = b\\]

Exercise 8
----------

Not all the math questions have nice answers.

 \\[(\\log\_ax)^{\\log\_bx} = (\\log\_bx)^{\\log\_ax} \\Leftrightarrow \\\\ \\log\_b[(\\log\_ax)^{\\log\_bx}] = \\log\_b[(\\log\_bx)^{\\log\_ax}] \\Leftrightarrow \\\\ (\\log\_bx)\*\\log\_b(\\log\_ax) = \\log\_ax\*\\log\_b(\\log\_bx) \\Leftrightarrow \\\\ (\\log\_bx)\*\\log\_b(\\log\_ax) = \\frac{\\log\_bx}{\\log\_ba}\*\\log\_b(\\log\_bx) \\Leftrightarrow \\\\ \\log\_b(\\frac{\\log\_bx}{\\log\_ba}) = \\frac{\\log\_b(\\log\_bx)}{\\log\_ba} \\Leftrightarrow \\\\ \\log\_b(\\log\_bx)-\\log\_b(\\log\_ba) = \\frac{\\log\_b(\\log\_bx)}{\\log\_ba} \\Leftrightarrow \\\\ \\log\_b(\\log\_bx) - \\frac{\\log\_b(\\log\_bx)}{\\log\_ba} = \\log\_b(\\log\_ba) \\Leftrightarrow \\\\ \\log\_b(\\log\_bx)(1-\\frac{1}{\\log\_ba}) = \\log\_b(\\log\_ba) \\Leftrightarrow \\\\ \\log\_b(\\log\_bx) = \\frac{\\log\_b(\\log\_ba) \\log\_ba}{log\_ba-1} \\Leftrightarrow \\\\ x = b^{b^{\\frac{\\log\_b(\\log\_ba) \\log\_ba}{log\_ba-1}}}\\]

Exercise 9
----------

 \\[\\frac{\\log\_{ab}m}{\\sqrt{\\log\_am\*\\log\_bm}} \\le 1 \\Leftrightarrow \\\\ \\\\ \\log\_{ab}m \\le \\sqrt{\\log\_am\*\\log\_bm} \\Leftrightarrow \\\\ \\\\ \\frac{1}{\\log\_m(ab)} \\le \\sqrt{\\log\_am\*\\log\_bm} \\Leftrightarrow \\\\ \\\\ \\frac{1}{\\log\_ma + \\log\_mb} \\le \\sqrt{\\log\_am\*\\log\_bm} \\Leftrightarrow \\\\ \\\\ \\frac{1}{\\frac{1}{\\log\_am} + \\frac{1}{\\log\_bm}} \\le \\sqrt{\\log\_am\*\\log\_bm}\\]

Exercise 10
----------

 \\[\\frac{1}{\\log\_{(a+b)}m} \\ge \\frac{1}{\\log\_2m} + \\frac{1}{2}(\\frac{1}{\\log\_am}+\\frac{1}{\\log\_bm}) \\Leftrightarrow \\\\ \\log\_m(a+b) \\ge \\log\_m2 + \\frac{1}{2}(\\log\_ma + \\log\_mb) \\Leftrightarrow \\\\ \\log\_m(a+b) - \\log\_m2 \\ge \\log\_m\\sqrt{ab} \\Leftrightarrow \\\\ \\log\_m(\\frac{a+b}{2}) \\ge \\log\_m\\sqrt{ab}\\]

Exercise 11
----------

 \\[\\sum\_{i=1}^{n-1}\\log\_{x\_{i}}{x\_{i+1}} \\ge n \\Leftrightarrow \\\\ \\sum\_{i=1}^{n-1}\\log\_{x\_{i}}{x\_{i+1}} + \\log\_{x\_n}x\_1 \\ge n\\]

From the QM-AM-GM inequality:

 \\[\\frac{\\sum\_{i=1}^{n-1}\\log\_{x\_{i}}{x\_{i+1}} + \\log\_{x\_n}x\_1}{n} \\ge (\\log\_{x\_n}x\_1\*\\underbrace{\\prod\_{i=1}^{n-1}\\log\_{x\_{i}}{x\_{i+1}}}\_{=\\log\_{x\_{1}}x\_n})^{\\frac{1}{n}} \\Leftrightarrow \\\\ \\frac{\\sum\_{i=1}^{n-1}\\log\_{x\_{i}}{x\_{i+1}} + \\log\_{x\_n}x\_1}{n} \\ge (\\underbrace{\\log\_{x\_n}x\_1 \* \\log\_{x\_1}x\_n}\_{=1})^{\\frac{1}{n}}\\Leftrightarrow \\\\ \\sum\_{i=1}^{n-1}\\log\_{x\_{i}}{x\_{i+1} + \\log\_{x\_n}x\_1}{n} \\ge n \\Leftrightarrow \\\\ \\sum\_{i=1}^{n-1}\\log\_{x\_{i}}{x\_{i+1} \\ge n - \\log\_{x\_n}x\_1}{n}\\]

Exercise 12
----------

 \\[m=\\log\_{abc} c \\Leftrightarrow \\\\ \\frac{1}{m}=\\frac{1}{log\_{abc} c} \\Leftrightarrow \\\\ \\frac{1}{m}=\\log\_c(abc) \\Leftrightarrow \\\\ \\frac{1}{m}=\\log\_c a + \\log\_c b + 1 \\Leftrightarrow \\\\ \\frac{1}{m}=\\frac{1}{\\log\_a c} + \\frac{1}{log\_b c} + 1\\]

So we can conclude that \\(\\frac{1}{m}=\\frac{1}{x} + \\frac{1}{y} + 1\\).

Applying the Cauchy-Schwartz inequality:

 \\[(\\frac{1}{x}\*1 + \\frac{1}{y}\*1 + 1\*1)^2 \\le (\\frac{1}{x^2} + \\frac{1}{y^2}+1)(1^2 + 1^2 + 1^2)\\]

Leads to:

 \\[\\frac{1}{m^2} \\lt 3(\\frac{1}{x^2} + \\frac{1}{y^2}+1) \\Leftrightarrow \\\\ (\\frac{1}{m \\sqrt{3}}-1)(\\frac{1}{m \\sqrt{3}}+1) \\le \\frac{1}{x^2} + \\frac{1}{y^2}\\]

Exercise 13
----------

The solution is left to the reader.