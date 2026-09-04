+++
title = "Deriving Recursion from First Principles"
description = "These are some of my class notes. Learning to derive the Y Combinator from first principles is something I’ve always wanted to do. This isn’t quite the Y Combinator, but it’s very close and it still gets you r"
date = "2023-10-02T00:00:00Z"
url = "https://lambdaland.org/posts/2023-10-03_recursion_from_first_principles/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.244674294Z"
seen = false
+++

These are some of my class notes. Learning to derive the [Y Combinator](https://en.wikipedia.org/wiki/Fixed-point_combinator#Y_combinator) from first principles is something I’ve always wanted to do. This isn’t *quite* the Y Combinator, but it’s very close and it still gets you recursion without relying on recursive structures to begin with.

In the beginning, we write a recursive function to compute the length of a list:

```
(let* ([len (λ (lst)
             (if (null? lst)
                 0
                 (+ 1 (len (cdr lst)))))])
  (len '(1 2 3)))
```

The [`let*`](https://docs.racket-lang.org/reference/let.html) syntax allows us to create local variable bindings that can reference themselves. But let’s suppose we don’t have `let*`—what do we do?

We can make a function that we give to itself. That then returns the function we want, with the outer function in scope. So, the outer function `len` in this example has “type”[^fn:1] `$self → Int → Int`. That makes it clear that to get the `Int → Int` function we want, we have to pass the function to itself.

```
(let ([len (λ (len)
             (λ (lst)
               (if (null? lst)
                   0
                   (+ 1 ((len len) (cdr lst))))))])
  ((len len) '(1 2 3)))
```

But it’d be nice if we could pull out that `(len len)` in the body of the function. Let’s call that `len1`.

```
(let ([len (λ (len)
             (let ([len1 (λ (l) ((len len) l))])
               (λ (lst)
                 (if (null? lst)
                     0
                     (+ 1 (len1 (cdr lst)))))
               ))])
  ((len len) '(1 2 3)))
```

Note that what we *can’t* do is this:

```
(let ([len (λ (len)
             (let ([len1 (len len)])    ; problem here!
               (λ (lst)
                 (if (null? lst)
                     0
                     (+ 1 (len1 (cdr lst)))))
               ))])
  ((len len) '(1 2 3)))
```

Because this is an *eager* language, so that’d loop forever.

Let’s do that same trick for the outer `len len`:

```
(let ([len (λ (len)
             (let ([len1 (λ (l) ((len len) l))])
               (λ (lst)
                 (if (null? lst)
                     0
                     (+ 1 (len1 (cdr lst)))))
               ))])
  (let ([len1 (len len)])               ; type of len1 is Int → Int
    (len1 '(1 2 3))))
```

Note that the `(len len)` at the end of that is OK because we’re not doing another self application.

Let’s change that inner `let` to a `λ` just for fun.

```
(let ([len (λ (len)
             ((λ (len1)
                (λ (lst)
                  (if (null? lst) 0 (+ 1 (len1 (cdr lst))))))
              (λ (l) ((len len) l))))])
  ((λ (len1)
     (len1 '(1 2 3)))
   (len len)))
```

Rename `len` → `self`, `len1` → `rec`, and just return the function without calling it:

```
(let ([self (λ (self)
              ((λ (rec)
                 (λ (lst)
                   (if (null? lst) 0 (+ 1 (rec (cdr lst))))))
               (λ (x) ((self self) x))))])
  (self self))
```

Ok, we are ready… let’s go ahead an extract that part `(λ (lst) ...)`: that’s the only part of this that knows anything about computing the length of lists. We’ll wrap the whole thing in a function called `mk_rec` which takes a function of two arguments: the first argument we will pass `rec` to, and the second is the actual argument to the function.

```
(define (mk_rec fn_x) ; takes two args: the recursive thingy and the argument
  (let ([self (λ (self)
                ((λ (rec)
                   (λ (x) (fn_x rec x)))
                 (λ (x) ((self self) x))))])
    (self self)))

(define len (mk_rec (λ (rec lst) (if (null? lst) 0 (+ 1 (rec (cdr lst)))))))
(len '(1 2 3))                          ; returns 3

(define fact (mk_rec (λ (rec x) (if (zero? x) 1 (* x (rec (- x 1)))))))
(fact 5)                                ; returns 120
```

Note that that isn’t actually the the Y combinator exactly. But hey we have recursion without using recursion!

\+++ *Source = “FreeBSD `fortune` files; this is probably my favorite quine ever.*”