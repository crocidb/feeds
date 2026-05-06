+++
title = "Scaling, stretching and shifting sinusoids"
description = 'This is a brief and simple [1] explanation of how to adjust the standard sinusoid sin(x) to change its amplitude, frequency and phase shift. More precisely, given the general function:\\[s(x)=A\\cdot sin(w\\cdot x+\\theta)\\]We’ll see how adjusting the parameters !'
date = "2026-05-02T14:17:00Z"
url = "https://eli.thegreenplace.net/2026/scaling-stretching-and-shifting-sinusoids/"
author = "Eli Bendersky"
text = ""
lastupdated = "2026-05-05T08:25:02.114480474Z"
seen = false
+++

This is a brief and simple [[1]](#footnote-1) explanation of how to adjust the standard sinusoid sin(x) to change its amplitude, frequency and phase shift. More precisely, given the general function:

\\[s(x)=A\\cdot sin(w\\cdot x+\\theta)\\]

We’ll see how adjusting the parameters ![A](https://eli.thegreenplace.net/images/math/6dcd4ce23d88e2ee9568ba546c007c63d9131c1b.png), ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png) and ![\theta](https://eli.thegreenplace.net/images/math/cb005d76f9f2e394a770c2562c2e150a413b3216.png) affect the shape of s(x). Each section below covers one of these aspects mathematically, and you can use the demo at the bottom to experiment with the topic visually.

Scaling
----------

Scaling is conceptually the simplest change; we adjust ![A](https://eli.thegreenplace.net/images/math/6dcd4ce23d88e2ee9568ba546c007c63d9131c1b.png) to increase or decrease the amplitude (maximal height) of s(x). Setting A=2 will make the ![y](https://eli.thegreenplace.net/images/math/95cb0bfd2977c761298d9624e4b4d4c72a39974a.png) value twice as large (in both the positive and negative direction) as the original function.

Stretching
----------

Stretching changes the frequency of sin(x), which is inverse proportional to its period. The baseline function sin(x) has a period of 2\\pi, meaning it repeats every 2\\pi. In other words, sin(x)=sin(x+2\\pi) for any ![x](https://eli.thegreenplace.net/images/math/11f6ad8ec52a2984abaafd7c3b516503785c2072.png).

If we set w=2, we get sin(2x). This function repeats itself twice as fast as sin(x), because ![x](https://eli.thegreenplace.net/images/math/11f6ad8ec52a2984abaafd7c3b516503785c2072.png) is multiplied by 2 before being fed into the sinusoid. If ![x](https://eli.thegreenplace.net/images/math/11f6ad8ec52a2984abaafd7c3b516503785c2072.png) changes by \\pi, the sinusoid’s input changes by 2\\pi. Therefore, the period of sin(2x) is \\pi, the period of sin(4x) is \\frac{\\pi}{2} and so on. [[2]](#footnote-2)

More generally, the period of sin(wx) is \\frac{2\\pi}{w}. Play with the demo below to see this in action, by changing ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png) and observing how the waveform changes.

If we know the period p we want, we can easily calculate the ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png) that gives us this period:

\\[p=\\frac{2\\pi}{w} \\implies w=\\frac{2\\pi}{p}\\]

Shifting
----------

The final parameter we discuss is ![\theta](https://eli.thegreenplace.net/images/math/cb005d76f9f2e394a770c2562c2e150a413b3216.png); it’s called the *phase* of the sinusoid. In the baseline sin(x), ![\theta=0](https://eli.thegreenplace.net/images/math/a1dffbe89f1ec5a919198de979fca459eb7fdf84.png). The sinusoid is 0 at x=0, achieves its positive peak at x=\\frac{\\pi}{2}, crosses 0 again at x=\\pi, negative peak at x=\\frac{3\\pi}{2} and returns to its original position at x=2\\pi where the repetition begins.

By adding a non-zero ![\theta](https://eli.thegreenplace.net/images/math/cb005d76f9f2e394a770c2562c2e150a413b3216.png), we don’t affect the sinusoid’s amplitude or frequency, but we do shift it right or left along the ![x](https://eli.thegreenplace.net/images/math/11f6ad8ec52a2984abaafd7c3b516503785c2072.png) axis. For example, suppose we use the function sin(x+\\theta) with \\theta=\\frac{\\pi}{2}. Then when x=0, we have sin(\\frac{\\pi}{2}), so the sinusoid is already at its positive peak; at x=\\frac{\\pi}{2}, the sinusoid crosses 0 into the negatives, etc. Everything happens earlier (by exactly the value of \\theta=\\frac{\\pi}{2}) than in the baseline sinusoid. In other words, we’ve shifted the function *left* by \\frac{\\pi}{2}. Similarly, when ![\theta](https://eli.thegreenplace.net/images/math/cb005d76f9f2e394a770c2562c2e150a413b3216.png) is negative, everything happens later, and the function is shifted *right*.

Putting it all together
----------

We’ve now gone over all the parameters for the function:

\\[s(x)=A\\cdot sin(w\\cdot x+\\theta)\\]

* ![A](https://eli.thegreenplace.net/images/math/6dcd4ce23d88e2ee9568ba546c007c63d9131c1b.png) controls the scaling factor (amplitude).
* ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png) is the frequency and controls the repetition period
* ![\theta](https://eli.thegreenplace.net/images/math/cb005d76f9f2e394a770c2562c2e150a413b3216.png) controls the phase - how much the sinusoid is shifted left or right

Use the demo below to adjust these parameters and observe their effect on the sinusoid:

 Your browser does not support the HTML5 canvas tag.

 A  ω  θ

---

|[[1]](#footnote-reference-1)|The math level of this post is high-school, at best. My main goal here is to test how to integrate interactive demos into my blog posts.|
|----------------------------|----------------------------------------------------------------------------------------------------------------------------------------|

|[[2]](#footnote-reference-2)|This can be a bit counter-intuitive at first; we scale ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png) by 2, but the period scales by half. Why? The reason is that ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png) affects the sinusoid’s *domain*, while the period is a property of its *range*. Therefore, an inverse relation is reasonable, once we put more thought into it. In fact, ![w](https://eli.thegreenplace.net/images/math/aff024fe4ab0fece4091de044c58c9ae4233383a.png) is often called the *angular frequency* of the sinusoid, and frequency is inverse proportional to the period.|
|----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|