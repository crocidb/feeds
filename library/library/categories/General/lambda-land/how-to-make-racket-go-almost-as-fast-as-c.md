+++
title = "How to Make Racket Go (Almost) As Fast As C"
description = "I recently wrote about using first-class functions to help make a BF interpreter. This is a follow-up post to describe a nifty solution to a tricky problem that made my program go 2–5× faster and put it about on-par with an interprete"
date = "2024-10-15T00:00:00Z"
url = "https://lambdaland.org/posts/2024-09-27_threaded_interpreter/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.213096404Z"
seen = false
+++

I recently wrote about [using first-class functions to help make a BF interpreter](/posts/2024-09-11_parameterized_decisions/). This is a follow-up post to describe a nifty solution to a tricky problem that made my program go 2–5× faster and put it about on-par with an interpreter written in pure C.

A basic interpreter works by walking down the AST and evaluating nodes recursively: when the interpreter encounters an expression, it dispatches on the type of expression to decide how to perform the evaluation. Here’s the key insight to get a massive speed bump with very little effort: *that dispatch is expensive and can be performed ahead-of-time*. We can walk through the code *once* and precompute all the dispatching work.

This is not a new idea. The first description that I’m aware of comes from Feeley and Lapalme [[1](#citeproc_bib_item_1)]. A name for this technique is making a *threaded interpreter*. It’s nowhere near as fast as a native code compiler, but interpreters are easy to write, and this is a very simple way to get a very big boost in performance.

A basic interpreter
----------

Please see [the appendix](https://lambdaland.org/posts/2024-09-27_threaded_interpreter/#appendix-full-code-for-basic-interpreter) for the full code for this interpreter. Tested to run with Racket v8.14 [cs].

Here’s a simple language and a (simplified) interpreter:

```
;; Syntax description
(struct func (params body) #:transparent)
(struct app (fn-expr args) #:transparent)
(struct op (op-name arg1 arg2) #:transparent)
(struct if-expr (test-expr t-case f-case) #:transparent)

;; Closure values
(struct closure (params body env) #:transparent)

;; Core interpreter routine
(define (interpret expr env)
  (match expr
    ;; Literal values: booleans and numbers evaluate to themselves
    [(or (? number?) (? boolean?)) expr]

    ;; Look up variables in the environment
    [(? symbol? var-name) (lookup-env env var-name)]

    ;; Evaluating a function expression yields a closure value
    [(func params body) (closure params body env)]

    ;; Application: evaluate the function expression to get a closure.
    ;; Next, evaluate the arguments, and then extend the environment
    ;; and evaluate the body of the closure.
    [(app fn-expr args)
     (let ([fn (interpret fn-expr env)]
           [eval-args (map (λ (e) (interpret e env)) args)])
       (interpret (closure-body fn)
                  (extend-env env (closure-params fn) eval-args)))]

    ;; Built-in operators
    [(op op-name a1 a2)
     (let ([arg1 (interpret a1 env)]
           [arg2 (interpret a2 env)])
       (case op-name
         [(+) (+ arg1 arg2)]
         [else (error "Undefined operator!")]))]

    ;; Conditionals
    [(if-expr test tcase fcase)
     (if (interpret test env)
         (interpret tcase env)
         (interpret fcase env))]))
```

We can now build and run simple programs:

```
(interpret (app (func '(x) (op '+ 'x 1)) (list 41)) '())
;; => 42
```

There is nothing particularly special about this interpreter: there’s a basic representation for programs, and the `interpret` function walks the AST recursively to evaluate the program.

Threading the environment
----------

To make this interpreter go faster, we need bypass the `match` statement by pre-computing the code to run. We can do this by building up a closure that calls the next thing to run in tail-position. Racket has a proper tail-call optimization, so function calls in tail position will be optimized to `jump` instructions and they won’t grow the stack. Having known jump targets is also really good for modern CPUs which do speculative execution; known jump targets means no branch mis-predictions.

We do this by breaking up the `interpret` function: instead of taking an expression and an environment, we want a function that just takes an expression. This should return a function that we can give an environment, which will the compute the value of the program. We will call this new function `compile`.

```
(define (compile expr)
  (match expr
    [(or (? number?) (? boolean?))
     (λ (env) expr)]
    [(? symbol? var-name)
     (λ (env) (lookup-env env var-name))]
    [(func params body)
     (let ([comp-body (compile body)])
       (λ (env) (closure params comp-body env)))]
    [(app fn-expr args)
     (let ([fn (compile fn-expr)]
           [comp-args (map compile args)])
       (λ (env)
         (let ([c (fn env)])
           ((closure-body c) (extend-env env (closure-params c) (map (λ (a) (a env)) comp-args))))))]
    [(op op-name a1 a2)
     (let ([arg1 (compile a1)]
           [arg2 (compile a2)])
       (case op-name
         [(+) (λ (env) (+ (arg1 env) (arg2 env)))]
         [(-) (λ (env) (- (arg1 env) (arg2 env)))]
         [(*) (λ (env) (* (arg1 env) (arg2 env)))]
         [(/) (λ (env) (/ (arg1 env) (arg2 env)))]
         [(<) (λ (env) (< (arg1 env) (arg2 env)))]
         [(>) (λ (env) (> (arg1 env) (arg2 env)))]
         [(=) (λ (env) (= (arg1 env) (arg2 env)))]
         [else (error "Undefined operator!")]))]
    [(if-expr test tcase fcase)
     (let ([comp-test (compile test)]
           [comp-tcase (compile tcase)]
           [comp-fcase (compile fcase)])
       (λ (env)
         (if (comp-test env)
             (comp-tcase env)
             (comp-fcase env))))]))
```

Note how the code follows the same structure as the basic interpreter, but the return type has changed: instead of a value, you get a function in the form of `(λ (env) …)`. Also, instead of calling `interpret` on subexpressions, you call `compile`, and pass the environment to those subexpressions to get the value out.

There’s a lot more that we could here to improve things. The easiest thing would be to track where variables will be in the environment and optimize variable lookups with direct jumps into the environment structure. This saves us from having to walk the environment linearly on every variable lookup. I won’t implement that here, but that’s some pretty low-hanging fruit.

The tricky part of BF: mutual recursion
----------

So, we get a lot of oomph by turning everything into tail calls. But loops (which, in BF, are the only branching mechanism) present a tricky problem: you either need to call the function that encodes the loop body repeatedly *or* call the function that encodes whatever comes after the loop. Moreover, once the loop body is done, it needs to jump back to the first function that encodes the choice of whether to keep going in the loop or exit.

Here’s my `compile` function for [my basic threaded interpreter](https://github.com/ashton314/brainfreeze/blob/0a7a5d011c9576a4800edfe56d1e174d5ca638ac/interp_threaded.rkt#L40) for BF:

```
(define (compile program c-ip jmp-targets inst-cache)
  (if (< c-ip (vector-length program))
      (match (vector-ref program c-ip)
        [#\+ (let ([rest-progn (compile program (+ 1 c-ip) jmp-targets inst-cache)])
               (λ (state sp)
                 (vector-set! state sp (+ (vector-ref state sp) 1))
                 (rest-progn state sp)))]
        [#\- (let ([rest-progn (compile program (+ 1 c-ip) jmp-targets inst-cache)])
               (λ (state sp)
                 (vector-set! state sp (- (vector-ref state sp) 1))
                 (rest-progn state sp)))]
        [#\> (let ([rest-progn (compile program (+ 1 c-ip) jmp-targets inst-cache)])
               (λ (state sp)
                 (rest-progn state (+ sp 1))))]
        [#\< (let ([rest-progn (compile program (+ 1 c-ip) jmp-targets inst-cache)])
               (λ (state sp)
                 (rest-progn state (- sp 1))))]
        [#\. (let ([rest-progn (compile program (+ 1 c-ip) jmp-targets inst-cache)])
               (λ (state sp)
                 (display (integer->char (vector-ref state sp)))
                 (rest-progn state sp)))]
        [#\,
         (let ([rest-progn (compile program (+ 1 c-ip) jmp-targets inst-cache)])
           (λ (state sp)
             (vector-set! state sp (char->integer (read-char)))
             (rest-progn state sp)))]
        [(jmp-forward target)
         (letrec ([loop-start (λ (state sp)
                                (if (zero? (vector-ref state sp))
                                    (loop-end state sp)
                                    (loop-body state sp)))]
                  [loop-past-end (compile program (+ c-ip target 1) jmp-targets inst-cache)]
                  [loop-end (compile program (+ c-ip target) (cons loop-start loop-past-end) inst-cache)]
                  [loop-body (compile program (+ 1 c-ip) null inst-cache)])
           loop-start)]
        [(jmp-backward _)
         (λ (state sp)
           (if (zero? (vector-ref state sp))
               ((cdr jmp-targets) state sp)
               ((car jmp-targets) state sp)))])
      (λ (_state _sp)           ; finished compiling program
        void)))
```

I match on each of the characters of the program. In my interpreter I do a little bit of preprocessing to turn `[` and `]` into `jmp-forward` and `jmp-backward` structs respectively. That way, I don’t have to spend a ton of time scanning the program for matching brackets.

The interesting bit is the clause for the `jmp-forward` construct: to build the closure I need at a `loop-start`, I need to be able to refer to the loop body (computed and stored in `loop-body`) as well as the end of the loop (computed and stored in `loop-end`).

When I build the `loop-end` closure, pass `loop-start` and `loop-past-end` (which is the rest of the program *after* the loop) into the `compile` function as the `jmp-targets` parameter. When the compiler encounters the matching `jmp-backward` instruction, it uses the `jmp-targets` parameter to get the `loop-start` and `loop-past-end` to decide whether or not to redo the loop or not.

I’ve since improved this code, and now the `zero?` check only happens once. I also parse the program so that every instruction gets turned into a struct—rather than left as a bare character. See [interp\_threaded\_opt.rkt](https://github.com/ashton314/brainfreeze/blob/main/interp_threaded_opt.rkt) in my Brainfreeze repo for the current version.

The `loop-start` and `loop-end` functions need to reference each other to be able to continue or abort the loop. `letrec` lets me build functions that can reference each other in a clean, functional way.

Let’s see some numbers!
----------

So how much faster does threading make the code go? [Here](https://github.com/cwfitzgerald/brainfuck-benchmark/blob/2e10658581ce0c81b02e858e292984cf8e5df96a/benches/mandel.b) is a BF program that renders a Mandelbrot set. I can run this with my basic and my threaded interpreter on my M1 Pro MacBook Pro to get an idea:

```
racket interp_basic.rkt bench/benches/mandel.b  43.25s user 0.77s system 93% cpu 47.138 total
racket interp_threaded.rkt bench/benches/mandel.b  17.62s user 0.38s system 92% cpu 19.461 total
```

`43.25 seconds` vs `17.62 seconds` is a big difference! That’s a solid 2× speedup! This actually put my threaded Racket interpreter on par with a C-based threaded interpreter that one of my classmates built and ran with the same benchmarks. If I recall, his was only about a second or two faster.

The compile step opens up a big opportunity for optimizations. I’ve been working on some domain-specific optimizations for BF and my interpreter can run the same benchmark in a blazing `9.94 seconds`.

```
racket runner.rkt bench/benches/mandel.b  9.94s user 0.18s system 94% cpu 10.707 total
```

(And, of course, none of this really holds a candle to a proper compiler; I’ve to a compiler that takes the optimized code from the threaded interpreter and emits machine code. It can run `mandel.b` in a mere `0.5 seconds`!)

I hope you take away a few things from this post:

1. Proper tail-calls make stuff go fast. If your language supports proper tail-call optimization, take advantage of it.

2. Racket is *really good* for writing interpreters and compilers! You can get very fast performance in the comfort of a high-level garbage-collected functional programming language.

Racket will never be able to match the best-written C code in terms of speed. But Racket is far easier to debug and a lot more fun to write—and for a lot of applications, Racket is still more than fast enough.

>
>
> A bad day writing code in Scheme is better than a good day writing code in C.
>
>
>
>
>
> David Stigant
>
>
>
>

Appendix: Full code for basic interpreter
----------

```
#lang racket

;; Syntax description

(struct func (params body) #:transparent)
(struct app (fn-expr args) #:transparent)
(struct op (op-name arg1 arg2) #:transparent)
(struct if-expr (test-expr t-case f-case) #:transparent)

;; Closure values
(struct closure (params body env) #:transparent)

;; Environment helpers
(define (extend-env base-env vars vals)
  (foldl (λ (var val env-acc) (cons (cons var val) env-acc)) base-env vars vals))

(define (lookup-env env var)
  (match (assoc var env)
    [(cons _ val) val]
    [#f (error "Undefined variable!")]))

;; Core interpreter routine
(define (interpret expr env)
  (match expr
    [(or (? number?) (? boolean?)) expr]
    [(? symbol? var-name) (lookup-env env var-name)]
    [(func params body) (closure params body env)]
    [(app fn-expr args)
     (let ([fn (interpret fn-expr env)]
           [eval-args (map (λ (e) (interpret e env)) args)])
       (interpret (closure-body fn)
                  (extend-env env (closure-params fn) eval-args)))]
    [(op op-name a1 a2)
     (let ([arg1 (interpret a1 env)]
           [arg2 (interpret a2 env)])
       (case op-name
         [(+) (+ arg1 arg2)]
         [(-) (- arg1 arg2)]
         [(*) (* arg1 arg2)]
         [(/) (/ arg1 arg2)]
         [(<) (< arg1 arg2)]
         [(>) (> arg1 arg2)]
         [(=) (= arg1 arg2)]
         [else (error "Undefined operator!")]))]
    [(if-expr test tcase fcase)
     (if (interpret test env)
         (interpret tcase env)
         (interpret fcase env))]))
```

Appendix: Full code for threading interpreter
----------

```
#lang racket

;; Syntax description

(struct func (params body) #:transparent)
(struct app (fn-expr args) #:transparent)
(struct op (op-name arg1 arg2) #:transparent)
(struct if-expr (test-expr t-case f-case) #:transparent)

;; Closure values
(struct closure (params body env) #:transparent)

;; Environment helpers
(define (extend-env base-env vars vals)
  (foldl (λ (var val env-acc) (cons (cons var val) env-acc)) base-env vars vals))

(define (lookup-env env var)
  (match (assoc var env)
    [(cons _ val) val]
    [#f (error "Undefined variable!")]))

;; Threading interpreter
(define (compile expr)
  (match expr
    [(or (? number?) (? boolean?))
     (λ (env) expr)]
    [(? symbol? var-name)
     (λ (env) (lookup-env env var-name))]
    [(func params body)
     (let ([comp-body (compile body)])
       (λ (env) (closure params comp-body env)))]
    [(app fn-expr args)
     (let ([fn (compile fn-expr)]
           [comp-args (map compile args)])
       (λ (env)
         (let ([c (fn env)])
           ((closure-body c) (extend-env env (closure-params c) (map (λ (a) (a env)) comp-args))))))]
    [(op op-name a1 a2)
     (let ([arg1 (compile a1)]
           [arg2 (compile a2)])
       (case op-name
         [(+) (λ (env) (+ (arg1 env) (arg2 env)))]
         [(-) (λ (env) (- (arg1 env) (arg2 env)))]
         [(*) (λ (env) (* (arg1 env) (arg2 env)))]
         [(/) (λ (env) (/ (arg1 env) (arg2 env)))]
         [(<) (λ (env) (< (arg1 env) (arg2 env)))]
         [(>) (λ (env) (> (arg1 env) (arg2 env)))]
         [(=) (λ (env) (= (arg1 env) (arg2 env)))]
         [else (error "Undefined operator!")]))]
    [(if-expr test tcase fcase)
     (let ([comp-test (compile test)]
           [comp-tcase (compile tcase)]
           [comp-fcase (compile fcase)])
       (λ (env)
         (if (comp-test env)
             (comp-tcase env)
             (comp-fcase env))))]))

;; compute 42
(define p1 (app (func '(a) (op '+ 'a 1)) '(41)))
```

References
----------

.csl-left-margin{float: left; padding-right: 0em;} .csl-right-inline{margin: 0 0 0 1em;}

[]()

[1]

Feeley, M. and Lapalme, G. 1987. Using closures for code generation. *Computer languages*. 12, 1 (Jan. 1987), 47–66. DOI:[https://doi.org/10.1016/0096-0551(87)90012-9](https://doi.org/10.1016/0096-0551(87)90012-9).