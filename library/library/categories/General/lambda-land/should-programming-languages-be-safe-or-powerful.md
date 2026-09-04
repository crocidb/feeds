+++
title = "Should Programming Languages be Safe or Powerful?"
description = "Should a programming language be powerful and let a programmer do a lot, or should it be safe and protect the programmer from bad mistakes? Contrary to what the title insinuates, these are not diametrically opposed attributes. Nevertheless, this is the mindset that underlies no"
date = "2024-11-21T00:00:00Z"
url = "https://lambdaland.org/posts/2024-11-21_powerful_or_safe_languages/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.207592697Z"
seen = false
+++

Should a programming language be powerful and let a programmer do a lot, or should it be safe and protect the programmer from bad mistakes? Contrary to what the title insinuates, these are *not* diametrically opposed attributes. Nevertheless, this is the mindset that underlies notions such as, “macros, manual memory management, etc. are power tools—they’re not supposed to be safe.” If safety and power are not necessarily opposed, why does this notion persist?

The problem—I think—is that historically you *did* have to trade safety for certain kinds of power: if you wanted to write a high-performance device driver, C—with all its unsafe behavior—was your only option. This founded the idea that the “power tools” of the industry were fundamentally dangerous.

There’s a few things wrong with this though:

1. **Power is relative to the domain of interest.** Both Haskell and C are powerful, but in completely different ways. So, when judging whether an aspect of a language is powerful or not, consider its application.

2. **Expressive languages get you power without sacrificing safety.** New advances in programming language research have found ways to express problem domains more precisely. This means that we have less and less reason to breach safety and reach into the unsafe implementation details to get our work done.

3. **It’s good to add safety to power tools.** A safe power tool is more trustworthy than an unsafe one. This holds for real-world tools: I will never use a table saw without a functioning saw stop.

Specifically in the case of macros, there’s been an evolution from powerful-but-unsafe procedural macros in Lisp to safe-but-less-powerful pattern macros in Scheme, and finally to **powerful-and-safe** macros in Racket.

More safety means higher reliability—something that everyone wants. And with advances in making languages more expressive, you can have a language perfectly suited to a particular domain without sacrificing safety.

What makes a language powerful?
----------

A language that lets you do more of what you want to do is more powerful than a language where you can’t do what you want. But what does “what you want to do” encompass? If you want to write device drivers, then C is great for you. However, C is not as expressive in some of the ways that, say, Haskell is. For example, in Haskell, I can write lazy, recursive definitions. Here’s a list of all<sup class="footnote-reference" id="fr-1-1"><a href="#fn-1">1</a></sup> the Fibonacci numbers:

```
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
```

Before you tell me that that’s just a useless cute trick, I actually had to use this when I was building the balancing algorithm in my rope data structure for [my text editor written in Haskell](https://codeberg.org/ashton314/ysue). Haskell is incredibly powerful in an *expressive* sense: a single line of code can elegantly capture a complicated computation.

>
>
> The purpose of abstraction is not to be vague, but to create a new semantic level in which one can be absolutely precise.
>
>
>
>
>
> Edsgar Dijkstra
>
>
>
>

Power is closely related to the domain of interest: a language is powerful in a particular realm of problems. C is powerful for working with memory directly. Conversely, Haskell or Racket is more powerful than C in pretty much every other domain because these languages give the user tremendous ability to *match the program to the domain*. This is a meta-power that sets high-level languages apart from lower-level ones.

Safe languages can be just as powerful as their unsafe counterparts—in many cases, they are *more* powerful because the abstractions they create better fit the domain. Whenever a tradeoff between power and safety must be made, that is a sign that the language is not the right fit for the domain.

Consider how immutability gives you *local reasoning power*. At one of my industry jobs, our codebase was a mixture of Ruby and Elixir. Both are safe languages, but Elixir is immutable. When I was working on some Elixir code, I could read:

```
user = get_user(session)
name = get_user_name(user)
do_something_else(user)
```

and I didn’t have to worry about `user` getting modified in the call to `get_user_name`. To understand the output of this function, I didn’t have to worry too much about the implementation of `get_user_name`.

In contrast, if you did the same sort of thing in Ruby:

```
user = get_user(session)
name = user.get_name()
user.do_something_else()
```

the `get_name` method *could* do something sneaky like set name to `"blank"` if it didn’t exist.<sup class="footnote-reference" id="fr-2-1"><a href="#fn-2">2</a></sup> In this case, I *did* have to understand what every method call did to understand the function. This made it harder to track down errors because I had to account for all the side effects that *could* happen at every method call.

Certain things like immutability might seem constraining, but [constraints can liberate you](https://www.youtube.com/watch?v=GqmsQeSzMdw) by allowing you to rely on particular behaviors. Elixir doesn’t let you modify things in-place, but you can rely on this, which makes understanding and composing code easier. Haskell forces you to express side-effects in the type system, but this lets you know that calling a function with a signature like `String → Int` won’t do any IO or throw an exception. Rust doesn’t have `null` like in Java, but you know when you get a pointer, you can safely dereference it and you don’t have to do all the null checking that you have to do in Java.

Case study: macros in Lisp, Scheme, and Racket
----------

The evolution of syntax macros in Lisp, Scheme, and Racket provide an interesting real-world instance of how safety and power can start off as a trade-off, but with better language design, become complimentary.

### Lisp macros: unsafe but powerful ###

I don’t have the space here to do a deep dive into Lisp macros, but here’s the short of it: Lisp macros are just functions that receive code as data. This code is represented as nested lists of symbols. All a macro needs to do is return a *new* list of symbols that will be spliced right into the call site.

```
(defmacro my-or (thing1 thing2)
  `(let ((tmp ,thing1))
     (if tmp tmp ,thing2)))

;; calling the macro
(my-or 1 2)
;; expands to
(let ((tmp 1))
  (if tmp tmp 2))  ;=> 1
```

The problem with this is that these macros are *unhygienic*: if I introduce a new variable, as I did with `tmp` in `my-or`, that is just a bare symbol that can be inadvertently captured producing unexpected output:

```
(let ((tmp 99)) (my-or nil tmp))
;; expands to
(let ((tmp 99)) (let ((tmp nil)) (if tmp tmp tmp))) ;=> nil
```

This is very bad! To use a macro safely, you need to be sure that it’s not introducing variables that you might accidentally capture. Lisp provides a mechanism<sup class="footnote-reference" id="fr-3-1"><a href="#fn-3">3</a></sup> to avoid some of the pitfalls with variable capture, but that’s not the end of the danger. If I have a macro that expands to a call to a function, e.g. `printf`, I would expect this to be the `printf` in scope at the time I defined the macro. However, this might not be the case—a user might inadvertently redefine a function, and then the macro would not behave in the expected way.

### Scheme macros: safe but less powerful ###

Scheme has a faculty called `syntax-rules`, which lets you define transformations between a pattern and a template:

```
(define-syntax my-or
  (syntax-rules ()
    ((_ thing1 thing2) (let ((tmp thing1))
                         (if tmp tmp thing2)))))
```

[Rust’s `macro_rules!` form](https://doc.rust-lang.org/book/ch19-06-macros.html) is essentially `syntax-rules` from Scheme, but a little fancier with some syntax classes like `:expr` and such.

This is safe; the examples from the Lisp run as expected:

```
(my-or 1 2)                      ;=> 1
(my-or #f 42)                    ;=> 42
(let ((tmp 99)) (my-or #f tmp))  ;=> 99
```

However, we’ve lost some of the power because we can only define transformations between templates. We can’t, for example, write a macro that does some deep inspection of the code and makes decisions on how to expand. Furthermore, there’s no way for us to intentionally break hygiene when we really want to.

### Racket macros: the best of both worlds ###

Racket resolves the dilemma between having to choose between powerful Lisp-like procedural macros, and safe Scheme-like hygienic macros by giving us fully hygienic procedural macros! I have [another blog post discussing macros in Lisp, Scheme, and Racket](/posts/2023-10-17_fearless_macros/) and I go into some detail about the evolution of those macro systems.

And if you want to dive deep into macro hygiene, see Matthew Butterick’s excellent [explainer on Hygiene](https://beautifulracket.com/explainer/hygiene.html) from his book [*Beautiful Racket*](https://beautifulracket.com/).

The upshot of it is that Racket uses a combination of features (scope sets, syntax objects, etc.) to give the user a richer way of specifying syntax than simple dumb lists of symbols. This avoids inadvertent variable capture as well as keeps function references lined up nicely. However, macros can still do arbitrary computation, which means that we’re not constrained in the way that the pattern-transformation macros in Scheme are.

And just to prove that Racket is just as powerful as Common Lisp, here’s the classic `aif` macro:

```
#lang racket
(require racket/stxparam syntax/parse/define)

(define-syntax-parameter it
  (lambda (stx)
    (raise-syntax-error (syntax-e stx)
                        "can only be used inside aif")))

(define-syntax (aif stx)
  (syntax-parse stx
    [(_ test tcase fcase)
     #'(let ([tmp test])
         (if tmp
             (syntax-parameterize
                 ([it (make-rename-transformer #'tmp)])
               tcase)
             fcase))]))

(aif 41 (+ it 1) 'whatever) ;=> 42
it                          ;error: it: can only be used inside aif
```

This example is inspired by Greg Hendershott’s fabulous tutorial [*Fear of Macros*](https://www.greghendershott.com/fear-of-macros/index.html). The `define-syntax-parameter` bit lets us introduce new bindings *intentionally*, whilst still keeping us from accidental breaches of macro hygiene.

Consequentially, **Racket’s macro system is far more useful than Lisp or Scheme’s systems, and this because of Racket’s safety and expressiveness.** You can actually build trustworthy systems on top of Racket’s macro system because you’re not constantly foot-gunning yourself with hygiene malfunctions, and the macros are expressive enough to do some [rather complicated things](/posts/2023-08-14_types_with_macros/).

Towards greater safety and reliability
----------

Safe systems let us build software that is more capable and more reliable. **Unsafe power is something to improve, not grudgingly accept—and much less defend as somehow desirable.** Languages like Rust and Zig have made systems programming immune to whole hosts of errors by being more expressive than C, and languages like Racket are leading the way in making metaprogramming more useful reliable and less like dark magic.

Further reading
----------

If you want to learn more about writing macros in Racket, check out [*Beautiful Racket*](https://beautifulracket.com/) by Matthew Butterick and [*Fear of Macros*](https://www.greghendershott.com/fear-of-macros/index.html) by Greg Hendershott.

I highly recommend listening Runar Bjarnason’s talk at Scala World, [*Constraints Liberate, Liberties Constrain*](https://www.youtube.com/watch?v=GqmsQeSzMdw), wherein he discusses how constraining one part of a system can open up freedoms of later components that build on that constrained part.

1. Yes, *all* the Fibonacci numbers. Haskell is lazy; this will compute as many as you ask for. [↩](#fr-1-1)

2. You might think, “well, just document that behavior.” Now I need to read the documentation of *every* function I encounter—I might as well go read the code to be sure the documentation isn’t out of date. Local reasoning means to understand what `do_something_else` is passed, I don’t have to worry *in the first place* if `get_name` will do somethig to the result of `get_user`. [↩](#fr-2-1)

3. Lisp has a function called `gensym` which makes a fresh symbol for you to use. Some other languages such as [Julia](https://docs.julialang.org/en/v1/base/base/#Base.gensym) have a `gensym` function; `gensym` is a poor substitute for proper hygiene. [↩](#fr-3-1)