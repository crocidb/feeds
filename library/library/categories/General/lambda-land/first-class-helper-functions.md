+++
title = "First-Class Helper Functions"
description = "We’re going to be writing a BF compiler for a class I’m in. Last night I threw together a little interpreter for the program in about an hour; it doesn’t do input—that should be easy to add—but it’s enough to handle [some benchmarks](htt"
date = "2024-09-11T00:00:00Z"
url = "https://lambdaland.org/posts/2024-09-11_parameterized_decisions/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.216471934Z"
seen = false
+++

We’re going to be writing a [BF](https://en.wikipedia.org/wiki/Brainfuck) compiler for a class I’m in. Last night I threw together a little interpreter for the program in about an hour; it doesn’t do input—that should be easy to add—but it’s enough to handle [some benchmarks](https://github.com/cwfitzgerald/brainfuck-benchmark) for the language, albeit slowly. You can see my repository [on Codeberg](https://codeberg.org/ashton314/brainfreeze) for the source code.

I needed one function to do two closely related jobs—the logic was identical, but some parameters needed to change. Fortunately, first-class functions in your language make it trivial to parameterize your programs in elegant ways.

For those unfamiliar, a BF program looks like this:

```
++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.
```

That program prints `Hello, World!`. Here’s the spec for the language, taken from [this repo](https://github.com/sunjay/brainfuck/blob/master/brainfuck.md):

* `>` move the pointer right
* `<` move the pointer left
* `+` increment the current cell
* `-` decrement the current cell
* `.` output the value of the current cell
* `,` replace the value of the current cell with input
* `[` jump to the matching `]` instruction if the current value is zero
* `]` jump to the matching `[` instruction if the current value is **not** zero

Basically, BF is a little Turing machine: you have a big array of memory and a pointer into that array. The commands move the pointer around and can set or check the value pointed at.

The `[` and `]` characters form loops and need to be balanced. In my interpreter I wanted to run a preprocessing step so that when I encountered a `[` or a `]` I would know how far to jump instead of having to search the program for the matching bracket. Here’s the top-level function to modify the program vector to replace `[` and `]` with a struct containing how far to jump:

```
(struct jmp (amount) #:transparent)
(struct jmp-forward jmp () #:transparent)  ; replaces a [ command
(struct jmp-backward jmp () #:transparent) ; replaces a ] command

(define (preprocess-loops! prog)
  (for ([i (in-range (vector-length prog))])
    (match (vector-ref prog i)
      [#\[ (vector-set! prog i (find-matching prog i 1 'close))]
      [#\] (vector-set! prog i (find-matching prog i -1 'open))]
      [_ 42])))
```

That `find-matching` function was a little tricky: in the case of searching for a `]` it would have to walk *forward* looking for a `]` character or a `(jmp-backward …)` struct, and it would have to walk *backward* looking for a `[` character or `(jmp-forward …)` struct. The naïve way to do this would be to have a bunch of `if` expressions dispatching on the `'close` or `'open` passed to `find-matching`:

```
(define (find-matching prog start offset kind [stack 0])
  (let* ([addr (+ start offset)]
         [current-instr (vector-ref prog addr)])
    (if (eq? kind 'close)
        (if (or (eqv? current-instr #\]) (jmp-backward? current-instr))
            (if (zero? stack)
                (jmp-forward offset)
                (find-matching prog start (+ 1 start) kind (- stack 1)))  ; this isn't our close ]
            (if (or (eqv? current-instr #\[) (jmp-forward? current-instr))
                (find-matching prog start (+ 1 start) kind (+ stack 1))   ; deepen stack because we found another [
                (find-matching prog start (+ 1 start) kind stack)))
        (if (or (eqv? current-instr #\[) (jmp-forward? current-instr))
            (if (zero? stack)
                ...)
            (if (or (eqv? current-instr #\]) (jmp-backward? current-instr))
                ...
                ...)))))
```

The need for a stack to find matching delimiters should be pretty obvious: if I have an open bracket `[` and am looking for the matching close bracket `]`, then I need to make sure I don’t get confused by other open-close pairs in between.

The function above is pretty clunky: all the logic for checking if the stack is empty gets duplicated, and the logic for adding/decrementing the stack is a mirror image between the two branches of `if (eq? kind 'close)`. There might be a few ways to rearrange this example so that it’s a little better, but there’s one big change we can make.

The key insight is this: we have first-class functions, so why not parameterize the condition we use to check the current command to know if we should push the stack, pop the stack, or return a new struct? Here’s how we do it:

```
(define (find-matching prog start offset kind [stack 0])
  (define (close? x) (or (jmp-backward? x) (eqv? x #\])))
  (define (open? x) (or (jmp-forward? x) (eqv? x #\[)))
  (define addr (+ start offset))
  (let-values ([(needle-pred other-pred bump jmp-maker)
                (if (eq? kind 'close)
                    (values close? open? 1 jmp-forward)
                    (values open? close? -1 jmp-backward))])
    (if (needle-pred (vector-ref prog addr))
        (if (zero? stack)
            (jmp-maker offset)
            (find-matching prog start (+ bump offset) kind (- stack 1)))
        (if (other-pred (vector-ref prog addr))
            (find-matching prog start (+ bump offset) kind (+ stack 1))
            (find-matching prog start (+ bump offset) kind stack)))))
```

Now we have `needle-pred`, which returns true if the current command is the current thing we’re looking for; `other-pred`, which tells us if we need to increase the stack; `bump`, which just tells us which way to move the offset; and `jmp-maker` which we use to build the right kind of struct to return when we’ve found the matching delimiter and the stack is empty.

I really like that `let-values` lets me bind a bunch of variables on a single condition; other languages can do something similar if they have e.g. tuples and rich pattern matching.

First-class functions are a powerful way to parameterize your code, and it doesn’t just have to be with higher-order functions. Clearly, generic functions like `map` and `filter` would be basically useless without the ability to take functions as parameters. But you can also tailor the behavior of your program by pushing the differences between two or more possible scenarios into functions, and then select the proper set of functions in one conditional.