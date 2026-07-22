+++
title = "Delimited Continuations"
description = "I’ve talked at some length about continuations and what they can do. In short, continuations let us manipulate the control flow programmatically. Among other things, it lets us implement generic non-deterministic backtracking search constructs, "
date = "2023-04-11T00:00:00Z"
url = "https://lambdaland.org/posts/2023-04-11_delimited_continuations/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.258441039Z"
seen = false
+++

I’ve talked at some length about [continuations](/posts/2022-11-17_continuations) and what they can do. In short, continuations let us manipulate the control flow programmatically. Among other things, it lets us implement generic non-deterministic backtracking search constructs, exception handlers, and cooperative threading—all without changes to the runtime or standard library!

If you need a refresher, see my [previous post on continuations](/posts/2022-11-17_continuations). The continuations that I talked about there were *unbounded* continuations, meaning that they captured the *entire* call stack. There’s another kind of continuation called a *delimited* continuation, which can do a superset of the things that an unbounded continuation can do.

To talk about continuations—delimited and regular—let’s look at a model of how a programming language get implemented. For that, we’ll talk about an abstraction of a language runtime with a thing called a CEK machine. Then we’ll realize the model with a simple implementation in Racket, and then we’ll talk about continuations.

The CEK machine
----------

To understand continuations, it will be helpful to talk about an idealized machine: one that isn’t tied to any CPU architecture or memory constraints. Our machine is the CEK machine described by Felleisen et al. <sup class="footnote-reference" id="fr-fn:1-1"><a href="#fn-fn:1">1</a></sup>

The letters “CEK” stand for the three parts of the machine:

C: Control The *control* state of the machine. This translates to the expression currently being evaluated. E: Environment An *environment* is a mapping of *variables* to *values*. K: Kontinuation A thing that answers, “once I’m done with this bit, what do I do next?” We’ll talk about this some more. Yeah, yeah, I know that’s not how you spell continuation, but the `C` was taken by “control”, so they went with `K` instead.

Often times you’ll see interpreters defined in what’s called “big-step” semantics. All that means is that the interpreter takes an expression and produces a result, often calling itself recursively. It might look something like this:

Implementing a CEK machine in Racket
----------

Capturing continuations
----------

1. Felleisen, Matthias, Robert Bruce Findler, and Matthew Flatt. Semantics Engineering with PLT Redex. Cambridge, Mass: MIT Press, 2009. [↩](#fr-fn:1-1)