+++
title = "Art of Lisp questions"
description = """What's thatI'm reading a book, I'm taking notes. Here will be notes for the book "Art of Lisp Programing"What is Art of Lisp ProgrammingA 1987 book by Robin Jones and Ian Stewart, seems to be quite a primitive introduction to the LISP. Still, it's written pret"""
date = "2022-10-12T00:00:00Z"
url = "https://vlnn.dev/?stack=art-of-lisp-questions"
author = "Generalistic writings from @vlnn"
text = ""
lastupdated = "2026-08-06T09:52:33.923850594Z"
seen = false
+++

What's that
----------

I'm reading a book, I'm taking notes. Here will be notes for the book "Art of Lisp Programing"

What is Art of Lisp Programming
----------

A 1987 book by Robin Jones and Ian Stewart, seems to be quite a primitive introduction to the LISP. Still, it's written pretty well, illustrated with pictures from Alice in Wonderland and is, well, interesting! Also authors are from ZX Spectrum clique, that is +100500 to their nerdiness.

Try simple things
----------

* car/cdr are named so due to historical reasons, i.e. assembly mnemonics of long gone IBM 709. Let's use **head** and **tail** instead.

```lisp
(defun head (x)
 (car x))
(defun tail (x)
  (cdr x))
(- (head '(4 3 2 1)) (head (tail '(4 3 2 1))))  ;; 1 is expected as (- 4 3)

```

```results
1

```

Q: Is `head` replacing `car` or `cdr`? A: `car`