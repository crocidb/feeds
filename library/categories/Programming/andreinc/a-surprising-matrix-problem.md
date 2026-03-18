---
title = "A surprising matrix problem"
description = "A surprising math problem from the Spanish Math Olympiad of 1988"
date = "2024-03-14T00:00:00Z"
url = "/2024/03/14/a-surprising-matrix-problem"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2025-10-22T08:59:05.781794277Z"
seen = true
---

In this short article I will discuss a *cute* mathematical problem that I discovered while reading [“Polya’s Footsteps: Miscellaneous Mathematical Expositions”](https://www.amazon.com/Polyas-Footsteps-Miscellaneous-Mathematical-Expositions/dp/0883853264) by the Canadian mathematician [Ross Honsberger](https://en.wikipedia.org/wiki/Ross_Honsberger). If you’re not familiar with Honsberger’s work, he is a well-known author in the field of [recreational mathematics](https://en.wikipedia.org/wiki/Recreational_mathematics). The one and only [Edsger W. Dijkstra](https://en.wikipedia.org/wiki/Edsger_W._Dijkstra) referred to Honsberger’s work as “delightful”.

The problem was asked during the First Round of the Spanish Math Olympiad in 1988, and if you own the book, you can find it at page 9.

---

The integers \\(1,2,3,...,n^2\\) are arranged to form the \\(n \\times n\\) matrix:

 \\[A=\\begin{pmatrix} 1 & 2 & ... & n\\\\ n+1 & n+2 & ... & 2n \\\\ ... & ... & ... & ... \\\\ (n-1)n+1 & ... & ... & n^2 \\end{pmatrix}\\]

A sum \\(S\_A\\) is constructed as follows:

* The first term \\(x\_1\\) in \\(S\\) is chosen at random from the entries of \\(A\\);
* After selecting \\(x\_1\\), \\(x\_1\\)’s row and column are deleted.
* The second term \\(x\_2\\) is chosen randomly from the remaining entries in \\(A\\), after which \\(x\_2\\)’s row and column are deleted.
* We carry similar selections and deletions until \\(A\\) is exhausted.

Prove that the sum \\(S\\) builds up to the exact total no matter what entries (\\(x\_1, x\_2, ...\\)) might be taken. So the sum \\(S\\) is always the same.

---

Excellent problem, isn’t it?

The first thing I did was check and see how everything worked, so I started with a \\(3 \\times 3\\) matrix:

 \\[A=\\begin{pmatrix} 1 & 2 & 3 \\\\ 4 & 5 & 6 \\\\ 7 & 8 & 9 \\\\ \\end{pmatrix}\\]

I randomly selected \\(3\\), then removed its row and column. The matrix \\(A\\) becomes: \\(\\begin{pmatrix} 4 & 5 \\\\ 7 & 8 \\end{pmatrix}\\). Then I randomly selected \\(7\\), removed its row and column, so that \\(A\\) becomes \\(A=\\begin{pmatrix} 5 \\end{pmatrix}\\). On this run the sum \\(S\_A=3+7+5=15\\).

I did try a second run \\(S\_A=5+1+9\\), and a third run \\(S\_A=6+2+7\\).

For a \\(3 \\times 3\\) matrix, the sum is \\(S\_A=15\\), no matter what we do.

At this point, it’s worth noting that if we examin things from a column perspective, each time we select numbers from a different column. Similarly, if we look at it from a row perspective, each time we select a number from a different row than the previous ones.

So, the intuition says there’s something to do with the positions of the numbers and not the numbers themselves. That would be incorrect, but it led me in the right direction.

For example, if we pick a matrix \\(B\\) that’s *slightly different* than \\(A\\), and comes in the form:

 \\[B=\\begin{pmatrix} 1 & 2 & 3 & ... & n \\\\ 1 & 2 & 3 & ... & n \\\\ ... & ... & ... & ... & ... \\\\ 1 & 2 & 3 & ... & n \\\\ \\end{pmatrix}\\]

If we apply the the same algorithm to \\(B\\), our sum will always be:

 \\[S\_B=1+2+3+...+n=\\frac{n(n+1)}{2}\\]

The reason is simple: before we exhaust matrix \\(B\\), we visit all the possible columns without repetition. Of course, the order can differ, but the sum remains the same (addition is commutative).

So, half of the problem is solved. We know that the sum is constant for a matrix \\(B\\). We need to find a relationship between the terms of \\(B\\) and \\(A\\) and show that something similar is happening for \\(A\\).

The relationship between the two matrices is the following:

* Each term from the first row of \\(A\\) is identical to its corresponding term on the first row of \\(B\\);
* Each term from the second row of \\(A\\) is \\(n\\) more than its corresponding term on the second row of \\(B\\);
* Each term from the third row of \\(A\\) is \\(2\*n\\) more than its corresponding term on the third row of \\(B\\);

We can generalize:

* Each term on the k<sup>th</sup> row of \\(A\\) is \\(k\*n\\) more than its corresponding term on the k<sup>th</sup> row of \\(B\\).

So if consider \\(a\_1, a\_2, ..., a\_n\\) the chosen elements from \\(S\_A\\) and the corresponding \\(b\_1, b\_2, ..., b\_n\\) from \\(S\_B\\), we see the following pattern:

* \\(a\_1 = b\_1\\) ;
* \\(a\_2 = b\_2 + n\\) ;
* \\(a\_3 = b\_3 + 2\*n\\) ;
* \\(a\_4 = b\_4 + 3\*n\\) ;
* … and so on

If we sum \\(S\_A = a\_1 + a\_2 + ... + a\_n\\) we obtain:

 \\[S\_A = (b\_1+0\*n) + (b\_2 + n) + (b\_3 + 2\*n) + ... + (b\_n + (n-1)\*n) \\Leftrightarrow \\\\ S\_A = S\_B + n(1+2+3...+(n-1)) \\Leftrightarrow \\\\ S\_A = \\frac{n(n+1)}{2} + n\*\\frac{n(n-1)}{2} \\Leftrightarrow \\\\ S\_A = \\frac{n(n^2+1)}{2} \\\\\\]

So \\(S\_A\\) is a constant that depends on \\(n\\).

This explains why the result was always 15 for the \\(3 \\times 3\\) matrix we’ve picked.

---

#### Personal observation, an exercise left for the reader ####

If you give the problem some thought, you will see that the problem holds not only for consecutive numbers but for all the numbers in arithmetical progression.

So, as long as the matrix \\(A\\) is in this form:

 \\[A=\\begin{pmatrix} a\_1 & a\_2 & a\_3 & ... & a\_n \\\\ a\_{n+1} & ... & ... & ... & a\_{2n} \\\\ ... & ... & ... & ... & ... \\\\ ... & ... & ... & ... & a\_{n^2} \\\\ \\end{pmatrix}\\]

And \\(a\_1, a\_2, ..., a\_{n^2}\\) are in arithmetic progression, so that \\(a\_k=a\_{k-1}+d\\), and is \\(d\\) is the common difference, the sum \\(S\_A\\) (as previously defined) is constant.

If we pick a \\(3 \\times 3\\) example of a matrix \\(A\\) with numbers in an arithmetical progression:

 \\[A=\\begin{pmatrix} 1 & 3 & 5 \\\\ 7 & 9 & 11 \\\\ 13 & 15 & 17 \\end{pmatrix}\\]

We observe that the sum, \\(S\_A\\), is constant: \\(S\_A^1=1+9+17\\), \\(S\_A^2=5+9+13\\), etc. They are all 27.

Proving this is an exercise left for the reader.