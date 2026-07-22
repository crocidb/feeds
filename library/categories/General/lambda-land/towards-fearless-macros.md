+++
title = "Towards Fearless Macros"
description = "Macros are tricky beasts. Most languages—if they have macros at all—usually include a huge “here there be dragons” warning to warn curious would-be macro programmers of the dangers that lurk ahead.What is it about macros that makes them so dangerous and unwieldy? That’s difficult"
date = "2023-11-13T00:00:00Z"
url = "https://lambdaland.org/posts/2023-10-17_fearless_macros/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.241166721Z"
seen = false
+++

Macros are tricky beasts. Most languages—if they have macros at all—usually include a huge “here there be dragons” warning to warn curious would-be macro programmers of the dangers that lurk ahead.

What is it about macros that makes them so dangerous and unwieldy? That’s difficult to answer in general: there are many different macro systems with varying degrees of ease-of-use. Moreover, making macros easy to use safely is an open area of research—most languages that have macros don’t have features necessary to implement macros safely. Hence, most people steer clear of macros.

There are many ways to characterize macro systems; I won’t attempt to cover them all here, but here’s the spectrum I’ll be covering in this post:

![](/img/macro_spectrum.svg)

A spectrum of how easy macro systems are to use safely

C macros: advanced search-and-replace
----------

If you’ve done any C programming, you’ve likely run into things like:

```
#define FOO 42

printf("The answer is: %s\n", FOO);     /* prints "The answer is: 42" */
```

That `#define` bit is a macro—albeit a *C* macro. These operate just after the lexer: they work on token streams. It’s a bit like textual search-and-replace, though it knows a *little* bit about the structure of the language (not much: just what’s a token and what’s not) so that you won’t run into problems if you do something like this:

```
#define FOO 42

printf("It says FOO");     /* prints "It says FOO" not "It says 42" */
```

because that `FOO` in the string is *not* a token—it’s just part of a string.

C macros can’t do very much: you scan the token stream for a macro, then fill in the variables to the macro, and then replace the macro and the arguments its consumed with the filled-out template that is the macro definition. This prevents you from doing silly things like replacing something sitting inside of a string literal, but it’s far, far from being safe, as we’ll see in the next section.

Lisp macros: operating on ASTs
----------

In contrast to C’s macros, Lisp’s macros are much more powerful. Lisp macros operate after the lexer *and* the parser have had a go at the source code—Lisp macro operate on *abstract syntax trees*—or ASTs, which is what the compiler or interpreter works with.

Why is this a big deal? The ASTs capture the language’s semantics around precedence, for instance. In C you can write a macro that does unexpended things, like this:

```
#define DOUBLE(x) x + x

3 * DOUBLE(5); /* Does 3 * 5 + 5 = 20, not 3 * (5 + 5) = 30 */
```

The `DOUBLE` macro didn’t know anything about precedence and we computed the wrong thing. This means that, to use a macro in C, you have to have a good idea of *how* it’s doing what it’s intended to do. That means C macros are leaky abstractions that prevent local reasoning: you have to consider both the macro definition and where it’s used to understand what’s going on.

In contrast, Lisp macros are an improvement because they will rewrite the AST and the precedence you’d expect will be preserved. You can do this, for example:

```
(defmacro double (x) `(+ ,x ,x))

(* 3 (double 5))                        ; returns 30
```

Lisp macros are also *procedural macros*, meaning you can execute arbitrary code inside of a macro to generate new ASTs. Macros in Lisp and its descendants are essentially functions from AST → AST. This opens up a whole world of exciting possibilities! Procedural macros constitute a “lightweight compiler API”. [[4](#citeproc_bib_item_4)]

Scheme macros: hygiene
----------

“Same except for variable names” is also called alpha-equivalence. This comes from the λ-calculus, which states that the particular choice of variable name should not matter. E.g. \\lambda x.x and \\lambda y.y are the same function in the lambda calculus, just as f(x) = x + 2 and g(y) = y + 2 are the same function in algebra.

Lisp macros aren’t without danger—many a Lisp programmer has shot their foot off with a macro. One reason is that Lisp macros are not *hygienic*—variables in the macro’s implementation may leak into the context of the macro call. This means that two Lisp programs that are the same except for different variable names can behave differently:

```
(defmacro swap (x y)
  `(let ((tmp ,x))      ;(tmp-leaky)
     (setq ,x ,y)
     (setq ,y tmp)))

(let ((foo 1)
      (bar 2))
  (swap foo bar)
  (list foo bar)) ; produces '(2 1)

(let ((tmp 1)
      (baz 2))
  (swap tmp baz)        ;(tmp-capture)
  (list tmp baz)) ; produces '(1 2) --- no swap!
```

The fact that the macro implementation uses a variable named `tmp` (tmp-leaky) has leaked through to the user of the macro. (tmp-capture) This phenomenon is called *variable capture*, and it exposes this macro as a leaky abstraction! There are ways to mitigate this using `gensym`, but those are error-prone manual techniques. It makes macro writing feel like you’re writing in an unsafe lower-level language.

Scheme’s macros introduce a concept known as *hygiene*, which prevents variable capture automatically:

```
(define-syntax swap
  (syntax-rules ()
    ((swap a b)
     (let ((tmp a))      ; (tmp-intro-macro)
       (set! a b)
       (set! b tmp)))))

(let ((foo 1)
      (bar 2))
  (swap foo bar)
  (list foo bar)) ; produces '(2 1)

(let ((tmp 1)            ; (tmp-intro-let)
      (baz 2))
  (swap tmp baz)
  (list tmp baz)) ; still produces '(2 1)
```

In this case, the variable `tmp` that the `swap` macro introduces (tmp-intro-macro) is not the same thing that the variable `tmp` from the calling context (tmp-intro-let) refers to. This separation of scopes happens automatically behind the scenes, so there’s now no chance of accidental variable capture.<sup class="footnote-reference" id="fr-1-1"><a href="#fn-1">1</a></sup>

If you’d like to know more about hygiene, [[1](#citeproc_bib_item_1)] is an excellent resource.

Racket macros: phase separation and scope sets
----------

Since Scheme macros (and Lisp macros more generally) allow running arbitrary Scheme code—including code from other modules—the dependency graph between modules can get so tangled that clean builds of a Scheme codebase are impossible. Racket solves this problem with its [phase separation](https://docs.racket-lang.org/guide/phases.html), which puts clear delimiters between when functions and macros are available to different parts of the language. This detangles dependency graphs without sacrificing the expressive power of macros. I wrote a little bit about [phase separation](/posts/2023-05-19_racket_macros/#phases); you can read more on [the Racket docs](https://docs.racket-lang.org/reference/syntax-model.html#(tech._phase._level)) as well as Matthew Flatt’s paper [[3](#citeproc_bib_item_3)] on phase separation.

Racket also has a robust system for reasoning about where a variable’s definition comes from called a *scope set*. This is a notion makes reasoning about where variables are bound sensible. See a [blog post](https://www-old.cs.utah.edu/plt/scope-sets/) as well as [NO\_ITEM\_DATA:flattBindingSetsScopes2016b] by Matthew Flatt for more on scope sets.

Phase separation and scope sets make Racket macros the safest to use: Racket macros compose sensibly and hide their implementation details so that it is easy to write macros that are easy to use as if they were built-in language constructs.

Racket also goes beyond the `syntax-rules` form that it inherited from Scheme; Racket’s `syntax-parse` macro-building system makes generating good error messages easy.

There’s a little bug in the `swap` macro we used earlier, and that is the `set!` form only takes an identifier (i.e. a variable) as its first argument. We don’t have any error checking inside the macro; if we were to call `swap` with something that wasn’t an identifier, we’d get an error in terms of the `set!` the macro expands to, not the macro call itself:

```
(let ((foo 1)
      (bar 2))
  (swap (+ foo 1) bar)
  (list foo bar))

> (swap (+ foo 1) bar)
  set!: not an identifier
  at: (+ foo 1)
  in: (set! (+ foo 1) bar)
```

This isn’t good because there’s no `set!` in our code at all! We could add some error handling in our macro to manually check that `a` and `b` are identifiers, but that’s a little tedious. Racket’s `syntax-parse` helps us out:

```
(require syntax/parse/define)

(define-syntax (swap stx)
  (syntax-parse stx
    [(_ a:id b:id)
     #'(let ([tmp a])
         (set! a b)
         (set! b tmp))]))

(let ([tmp 1]
      [baz 2])
  (swap tmp baz)
  (list tmp baz))            ; returns '(2 1) as expected

(let ([foo 1]
      [bar 2])
  (swap (+ foo 1) bar))

swap: expected identifier
  at: (+ foo 1)
  in: (swap (+ foo 1) bar)
```

Much better! Now our error is in terms that the macro user will recognize. There are lots of other things that `syntax-parse` can do that make it easy to write correct macros that generate good error messages—a must for macros that become a part of a library.

Other languages
----------

Many modern languages use macros; I’ll only talk about a few more here. If something’s missing, that’s probably because I didn’t want to be exhaustive.

### Julia ###

Julia macros have a lot of nice things: they operate on ASTs and they’re hygienic, though the way hygiene is currently implemented is a little strange: all variables get `gensym`’d automatically{{% sidenote sn2 %}}Meaning, they all get replaced with some generated symbol that won’t clash with any possible variable or function name.{{% /sidenote %}} whether or not they come from inside the macro or they originated from the calling code.

Part of the problem is that all variables are represented as simple symbols, which [[1](#citeproc_bib_item_1)] shows is insufficient to properly implement hygiene.

Evidently there is [some](https://github.com/JuliaLang/julia/pull/6910) [ongoing](https://github.com/JuliaLang/julia/issues/37691) [work](https://github.com/JuliaLang/JuliaSyntax.jl/pull/329) to improve the situation. This is a good example of research ideas percolating into industry languages I think.

### Elixir ###

Elixir has robust AST macros, and its standard library makes heavy use of macros; many “core” Elixir constructs like `def`, `if`, `raise`, `|>`, and others are actually macros that expand to smaller units of Elixir.

Elixir actually gets hygiene right! Unlike Julia, variables in Elixir’s AST have metadata—including scope information—attached to them. This and other aspects of Elixir’s macro system open it up to lots of exciting possibilities. The [Nx](https://hexdocs.pm/nx/Nx.html) library brings support for numerical and GPU programming to Elixir, and it works essentially by implementing a custom Elixir compiler *in Elixir itself*, and macros play a big role in this.

Me thinking that Elixir is a big mainstream language should tell you something about the languages I spend my time with in my job as a PhD student.

I think Elixir macros are really neat—they’re the most powerful I’ve seen in a “big mainstream” language.

### Rust ###

Rust supports two kinds of macros: macros-by-example, and procedural macros.

Macros-by-example are a simple pattern-to-pattern transformation. Here’s an example from [The Rust Book](https://doc.rust-lang.org/book/ch19-06-macros.html):

```
#[macro_export]
macro_rules! vec {
    ( $( $x:expr ),* ) => {     // (pattern-repeat)
        {
            let mut temp_vec = Vec::new();
            $(
                temp_vec.push($x);
            )*
            temp_vec
        }
    };
}
```

This macro takes a pattern like

```
vec!(foo, bar baz)
```

and expands it to a pattern like

```
{
    let mut temp_vec = Vec::new();
    temp_vec.push(foo);
    temp_vec.push(bar);
    temp_vec.push(baz);
    temp_vec
}
```

Notice how the `*` marks a part of the template that can be repeated. (pattern-repeat) This is akin to Racket or Scheme’s `...` repetition form. Macros-by-example work on AST, but you can’t perform arbitrary computation on the AST. For that, you need procedural macros.

Rust’s procedural macros (called “proc macros”) work on a token stream, and you can perform arbitrary computation, which puts them in a bit of a funny middle ground between C and Lisp. There is a [Rust crate](https://docs.rs/syn/2.0.39/syn/) that you can use to parse a Rust token stream into Rust AST, but you don’t get any nice source information from the AST nodes, which makes producing good error messages a challenge.

I personally find Rust macros to be disappointing.

Conclusion
----------

There’s a wide variety of macro systems. The best macro systems:

* *Operate on the AST* rather than on a stream of tokens
* Avoid leaking implementation details through inadvertent variable capture by being *hygienic*
* Produce good error messages that are in *terms of the caller’s context*
* (Bonus) have good *phase separation* to enforce clear separation between complex macro systems

Different languages have different features in their macro systems; some languages make it easy to use macros sensibly, while for others macros are a formidable challenge to use properly—make sure you know what your language provides and the trade-offs involved.

### Why shouldn’t you use macros? ###

Turns out you can do a *lot* with functions. Powerful function programming languages let you do so much with first-class functions. If you can get access to [first-class continuations](/posts/2022-11-17_continutations/), as you can in Racket and Scheme, then you can create powerful new programming constructs without having to resort to macros.

I came across the [JuliaCon 2019 keynote](https://www.youtube.com/watch?v=mSgXWpvQEHE&t=579s) talk, where Steven Johnson explains how many of the things that you can do with macros can be solved just with Julia’s type dispatch.

If you can do something with functions, you probably should: functions are first-class values in most languages these days, and you’ll enjoy increased composability, better error messages, and code that is easier to read and understand by your peers.

Macros introduce little languages wherever you use them. For simple macros, you might not have *any* constraints on what you may write under the scope of a macro. As an example, consider a macro that adds a `while`-loop construct to a language by rewriting to another kind of looping mechanism: you shouldn’t have any restriction on what you can write inside the body of the `while` loop.

However, more complex macros can impose more restrictions on what can and cannot be written under their lexical extent. These restrictions may or may not be obvious. Examples: accidental variable capture limits what can be safely written, and grammatical errors (e.g. using an expression where an identifier was expected) can lead to inscrutable errors.

Better macro systems mitigate these problems. It’s not enough to just have a macro system that uses ASTs; you need a macro system that makes it easy to write *correct* macros with clear error messages so they truly feel like natural extensions of the language. Few languages do this right.

### Why should you use macros? ###

Macro systems have improved since the 1960s. While Lisp excluded many of the pitfalls of C macros *by construction*, you still had to use kluges like `gensym` to manually avoid variable capture. Scheme got rid of that with hygienic macros, and Racket improved matters further by improving macro hygiene through scope sets and introducing phase separation. It is so much easier to build robust macro-based abstractions.

Macros are good—anyone can write macros and experiment with new syntactic constructs. This makes development and extension of the language no longer the sole domain of the language designer and maintainer—library authors can experiment with different approaches to various problems.

We see this a lot with Elixir: Elixir’s core language is really rather small; most of the magic powering popular libraries like [Ecto](https://hexdocs.pm/ecto/getting-started.html) or [Phoenix](https://www.phoenixframework.org/) comes from a choice set of macro abstractions. These and other libraries are free to experiment with novel syntax without fear of cluttering and coupling the core language with bad abstractions that would then need to be maintained in perpetuity.

Macros can be powerful when used correctly—something made much easier by modern macro systems.

References
----------

.csl-left-margin{float: left; padding-right: 0em;} .csl-right-inline{margin: 0 0 0 1em;}

[]()

[1]

Adams, M.D. 2015. [Towards the Essence of Hygiene](https://doi.org/10.1145/2676726.2677013). *Proceedings of the 42nd Annual ACM SIGPLAN-SIGACT Symposium on Principles of Programming Languages* (Mumbai India, Jan. 2015), 457–469.

[]()

[2]

Barzilay, E., Culpepper, R. and Flatt, M. Keeping it Clean with Syntax Parameters.

[]()

[3]

Flatt, M. 2002. [Composable and compilable macros: You want it when?](https://doi.org/10.1145/581478.581486) *Proceedings of the seventh ACM SIGPLAN international conference on Functional programming* (New York, NY, USA, Sep. 2002), 72–83.

[]()

[4]

Krishnamurthi, S. 2006. EDUCATIONAL PEARL: Automata via macros. *Journal of functional programming*. 16, 03 (May 2006), 253. DOI:[https://doi.org/10.1017/S0956796805005733](https://doi.org/10.1017/S0956796805005733).

NO\_ITEM\_DATA:flattBindingSetsScopes2016b

1. Breaking hygiene has some utility in some cases—for example, one might want to add a `break` form inside the body of a loop. There are ways around hygiene, but these are not without some problems. For more details see [[2](#citeproc_bib_item_2)]. [↩](#fr-1-1)