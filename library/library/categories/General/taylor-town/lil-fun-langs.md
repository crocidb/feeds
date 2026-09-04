+++
title = "Lil' Fun Langs"
description = "a pungent monad odor that attracts mathochists"
date = "2026-02-20T00:00:00Z"
url = "https://taylor.town/scrapscript-000"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.132294309Z"
seen = true
+++

|                                         |                                                                        |   LOC   |   Host   |HM |ADTs|Match|Cl.|       Target       |
|-----------------------------------------|------------------------------------------------------------------------|---------|----------|---|----|-----|---|--------------------|
|    [Hirrolot's CoC](#hirrolots-coc)     |[src](https://gist.github.com/Hirrolot/27e6b02a051df333811a23b97c375196)|  \~70   |  OCaml   | ✗ | ✗  |  ✗  | ✓ |    Interpreter     |
|     [Harrop MiniML](#harrop-miniml)     | [src](https://gist.github.com/jdh30/6130c615b5945fd57fc0ea74fcb87e05)  |  \~100  |  OCaml   | ✗ | ✗  |  ✗  | ✗ |   LLVM → native    |
|       [Algorithm W](#algorithm-w)       |           [src](https://github.com/mgrabmueller/AlgorithmW)            |  \~300  | Haskell  | ✓ | ✗  |  ✗  | ✗ | Type checker only  |
|[tomprimozic/type-systems](#type-systems)|           [src](https://github.com/tomprimozic/type-systems)           |  \~300  |  OCaml   | ✓ | ✗  |  ✗  | ✗ | Type checker only  |
|[lambda-calculus-hs](#lambda-calculus-hs)|         [src](https://github.com/solomon-b/lambda-calculus-hs)         |\~200–900| Haskell  | ✗ | ✓  |  ✓  | ✓ |    Interpreter     |
|              [THIH](#thih)              |            [src](https://hackage.haskell.org/package/thih)             |  \~429  | Haskell  | ✓ | ✓  |  ✓  | ✗ | Type checker only  |
|        [Simple-sub](#simple-sub)        |               [src](https://github.com/LPTK/simple-sub)                |  \~500  |  Scala   | ✓ | ✗  |  ✗  | ✓ | Type checker only  |
|       [PLZoo `poly`](#plzoo-poly)       |              [src](https://github.com/andrejbauer/plzoo)               |  \~500  |  OCaml   | ✓ | ✗  |  ✗  | ✓ |    Interpreter     |
|               [EYG](#eyg)               |             [src](https://github.com/CrowdHailer/eyg-lang)             |  \~500  |  Gleam   | ✓ | ✓  |  ✓  | ✓ |    Interpreter     |
|           [Pico-ml](#pico-ml)           |                [src](https://github.com/Quramy/pico-ml)                |  \~500  |TypeScript| ✓ | ✗  |  ✗  | ✓ |    WebAssembly     |
|            [TinyML](#tinyml)            |            [src](http://lambda-the-ultimate.org/node/2683)             |  \<700  |   SML    | ✓ | ✗  |  ✗  | ✓ |    Interpreter     |
|               [Eff](#eff)               |              [src](https://github.com/matijapretnar/eff)               | \~1–2K  |  OCaml   | ✓ | ✓  |  ✓  | ✓ |    Interpreter     |
|             [Frank](#frank)             |               [src](https://github.com/frank-lang/frank)               | \~1–2K  | Haskell  | ✓ | ✓  |  ✓  | ✓ |    Interpreter     |
|             [Grace](#grace)             |              [src](https://github.com/Gabriella439/grace)              | \~1–3K  | Haskell  | ✓ | ✗  |  ✗  | ✓ |    Interpreter     |
|           [Hackett](#hackett)           |             [src](https://github.com/lexi-lambda/hackett)              | \~1–3K  |  Racket  | ✓ | ✓  |  ✓  | ✓ |   Racket runtime   |
|       [Scrapscript](#scrapscript)       |            [src](https://github.com/tekknolagi/scrapscript)            | \~1–3K  |  Python  | ✓ | ✓  |  ✓  | ✓ |C/WASM/Cosmo native |
|           [MinCaml](#mincaml)           |               [src](https://github.com/esumii/min-caml)                | \~2,000 |  OCaml   | ✓ | ✗  |  ✗  | ✓ |x86/SPARC/PPC native|
|          [Ben Lynn](#ben-lynn)          |                [src](https://github.com/blynn/compiler)                | \~2,000 |Haskell/C | ✓ | ✓  |  ✓  | ✓ | Combinators → C VM |
|               [1ML](#1ml)               |                 [src](https://github.com/rossberg/1ml)                 | \~3–5K  |  OCaml   | ✓ | ✗  |  ✗  | ✓ |    Interpreter     |
|              [mlml](#mlml)              |                 [src](https://github.com/coord-e/mlml)                 | \~3–5K  |  OCaml   | ✗ | ✓  |  ✓  | ✓ |   x86-64 native    |
|             [Dhall](#dhall)             |           [src](https://github.com/dhall-lang/dhall-haskell)           |  \~4K   | Haskell  | ✗ | ✓  |  ✓  | ✓ |     Normalizer     |
|              [Ante](#ante)              |                 [src](https://github.com/jfecher/ante)                 | \~5–10K |   Rust   | ✓ | ✓  |  ✓  | ✓ | Cranelift → native |
|               [Tao](#tao)               |                 [src](https://github.com/zesterer/tao)                 | \~5–10K |   Rust   | ✓ | ✓  |  ✓  | ✓ |Bytecode interpreter|
|           [Austral](#austral)           |               [src](https://github.com/austral/austral)                | \~5–10K |  OCaml   | ✗ | ✓  |  ✓  | ✓ |         C          |
|             [AQaml](#aqaml)             |             [src](https://github.com/ushitora-anqou/aqaml)             | \~5–8K  |  OCaml   | ✗ | ✓  |  ✓  | ✓ |   x86-64 native    |
|             [Borgo](#borgo)             |               [src](https://github.com/borgo-lang/borgo)               | \~5–10K |   Rust   | ✓ | ✓  |  ✓  | ✓ |     Go source      |
|            [polytt](#polytt)            |            [src](https://github.com/ToposInstitute/polytt)             | \~5–10K |  OCaml   | ✗ | ✓  |  ✓  | ✓ |    Interpreter     |
|              [Newt](#newt)              |               [src](https://github.com/dunhamsteve/newt)               |  \~7K   |   Newt   | ✗ | ✓  |  ✓  | ✓ |     JavaScript     |
|            [HaMLet](#hamlet)            |               [src](https://github.com/rossberg/hamlet)                |\~10–15K |   SML    | ✓ | ✓  |  ✓  | ✓ |    Interpreter     |
|             [SOSML](#sosml)             |                 [src](https://github.com/SOSML/SOSML)                  |\~10–15K |TypeScript| ✓ | ✓  |  ✓  | ✓ |Browser interpreter |
|           [MicroHs](#microhs)           |               [src](https://github.com/augustss/MicroHs)               |\~15–30K |Haskell/C | ✓ | ✓  |  ✓  | ✓ | Combinators → C/JS |

I adore small programming languages. [Iota](https://web.archive.org/web/20181024173237/http://www.nyu.edu/projects/barker/Iota/) is two combinators. [tinylisp](https://github.com/Robert-van-Engelen/tinylisp/blob/main/tinylisp.pdf) is 99 lines of C. [milliForth](https://github.com/fuzzballcat/milliForth) is 340 *bytes*. [Fractran](https://wiki.xxiivv.com/site/fractran.html) multiplies fractions. Oh, [K](https://needleful.net/blog/2024/01/arthur_whitney.html)?

I've encountered tiny implementations of Forth, Lisp, C, Prolog, etc., but never "milliHaskell".

Yes, I'm still slowly working on [scrapscript](https://scrapscript.org).

[ML-style](https://en.wikipedia.org/wiki/ML_(programming_language)) languages carry a pungent monad odor that attracts mathochists. Notable examples include Haskell, Elm, F#, Scala, and OCaml. They're "Lambda Calculus with syntactic sugar", i.e. [functional](https://en.wikipedia.org/wiki/Functional_programming) and [statically-typed](https://en.wikipedia.org/wiki/Type_system#STATIC). Most implementations extend [Hindley-Milner type inference](https://en.wikipedia.org/wiki/Hindley–Milner_type_system) with [algebraic data types](https://en.wikipedia.org/wiki/Abstract_type), pattern matching, and closures:

|            Feature             |    LOC    |             Dependencies              |    References    |
|--------------------------------|-----------|---------------------------------------|------------------|
|       Integer arithmetic       |   \~50    |            Parser, codegen            |     MinCaml      |
|         Floating-point         |   \~100   |      Parser, codegen (SSE/NEON)       |     MinCaml      |
|    Booleans + if/then/else     |   \~50    |            Parser, codegen            |    Everything    |
|          Let bindings          |   \~30    |         Parser, normalization         |    Everything    |
|First-class functions (closures)|   \~200   |      Closure conversion, runtime      |     MinCaml      |
| Recursive functions (let rec)  |   \~50    |Type inference (occurs check), codegen |     MinCaml      |
|             Tuples             |   \~100   |    Parser, type inference, codegen    |     MinCaml      |
|             Arrays             |   \~100   |   Parser, runtime (bounds checking)   |     MinCaml      |
|   Monomorphic type inference   |   \~100   |              Unification              |     MinCaml      |
|Polymorphic type inference (HM) |   \~300   |     Generalization, instantiation     |Algorithm W, PLZoo|
|      Algebraic data types      | \~200–400 |Parser, type checker, runtime (tagging)|   HaMLet, Tao    |
|    Pattern matching (basic)    |   \~200   |   Exhaustiveness check, case trees    |    Tao, Ante     |
|  Pattern matching (optimized)  | \~400–600 |         Maranget's algorithm          |   OCaml, Rust    |
|          Type classes          |\~500–2000 |Dictionary passing, instance resolution|MicroHs, Ben Lynn |
|        Modules (basic)         |\~500–1000 |         Namespace management          |      HaMLet      |
| Modules (functors/signatures)  |\~2000–5000|        Type-level computation         |   HaMLet, 1ML    |
|        Row polymorphism        | \~300–800 |         Extended unification          |EYG, type-systems |
|       Algebraic effects        |\~500–1500 |    Effect typing, runtime support     | Eff, Frank, Ante |
|      Algebraic subtyping       |   \~500   |      Polar types, biunification       |    Simple-sub    |
|          Linear types          |   \~600   |           Linearity checker           |     Austral      |
|        Lazy evaluation         | \~300–500 |      Thunks, memoization runtime      |MicroHs, Ben Lynn |
|  Garbage collection (Cheney)   |   \~200   |            Runtime system             |       Most       |
|     Tail call optimization     | \~50–100  |    Codegen (jump instead of call)     |     MinCaml      |
|        Inline expansion        |   \~100   |          Normalization pass           |     MinCaml      |
|     Dead code elimination      |   \~50    |        Free variable analysis         |     MinCaml      |
|       Totality checking        | \~300–500 |Coverage analysis, termination checker |    Tao, Dhall    |

Further reading:

* [Write You a Haskell](http://dev.stephendiehl.com/fun/) (and [sequel](https://github.com/JKTKops/Write-You-a-Haskell-2)): builds a Haskell subset incrementally: lambda calculus → STLC → HM inference → ADTs → pattern matching → type classes → STG → LLVM.
* [Implementing Functional Languages: a tutorial](https://www.microsoft.com/en-us/research/publication/implementing-functional-languages-a-tutorial/) by Simon Peyton Jones & David Lester: complete implementations of template instantiation, G-Machine, TIM, and parallel G-Machine for a lazy Core language. [Reimplemented in C++ with LLVM](https://danilafe.com/blog/00_compiler_intro/) by Daniel Fedorin.
* [The ZINC experiment](https://xavierleroy.org/publi/ZINC.pdf): the foundational paper behind OCaml's bytecode compiler. The ZINC abstract machine uses \~140 instructions and 7 registers. Implementations include OMicroB (running OCaml bytecode on PIC18 microcontrollers with \<10KB RAM) and HardCaml-Zinc (hardware implementation).
* [Elaboration Zoo](https://github.com/AndrasKovacs/elaboration-zoo): progressive dependent type checking implementations, each a single Haskell file of 200–800 lines, from basic NbE through holes, implicit arguments, and first-class polymorphism. The best resource for understanding modern elaboration. Its companion [smalltt](https://github.com/AndrasKovacs/smalltt) (\~1–2K LOC Haskell) is a complete dependent type elaborator with normalization-by-evaluation.
* [Modern Compiler Implementation in ML](https://en.wikipedia.org/wiki/Modern_Compiler_Implementation_in_ML): the Tiger language compiler covers every phase from lexing through graph-coloring register allocation in \~5,000–8,000 LOC of SML. Multiple GitHub implementations target x86-64 and RISC-V.

If you want a milliHaskell, all your inspiration/ingredients are right here.

---

Hirrolot's CoC
----------

>
>
> 🤖 The most extreme capability-to-size ratio in this list — a complete Calculus of Constructions (the type theory at the top of the lambda cube) with bidirectional typing, dependent function types, and a type-in-type universe, all in a single OCaml gist of \~60–80 lines. It can express length-indexed vectors and other dependently typed programs. Not ML-family per se, but it demonstrates that full dependent types need not be complex to implement.
>
>

* **Gist**: [gist.github.com/Hirrolot/27e6b02a051df333811a23b97c375196](https://gist.github.com/Hirrolot/27e6b02a051df333811a23b97c375196)

Harrop MiniML
----------

>
>
> 🤖 MiniML demonstrates the absolute floor for a native-code ML compiler. Using Camlp4 for parsing and OCaml's LLVM bindings, it supports integer arithmetic, conditionals, and recursive first-order functions. Xavier Leroy noted the critical caveat: this is not truly "Mini-ML" since it lacks higher-order first-class functions — adding closures and garbage collection would significantly expand the codebase. Still, it shows what LLVM enables in \~100 lines.
>
>

* **Gist**: [gist.github.com/jdh30/6130c615b5945fd57fc0ea74fcb87e05](https://gist.github.com/jdh30/6130c615b5945fd57fc0ea74fcb87e05)

Algorithm W
----------

>
>
> 🤖 **Algorithm W Step by Step** by Martin Grabmüller (\~300 LOC, literate Haskell) is the canonical educational implementation of Algorithm W for Hindley-Milner type inference. Self-contained, well-commented, and widely referenced — this is where most people first implement HM inference.
>
>

* **Repo**: [github.com/mgrabmueller/AlgorithmW](https://github.com/mgrabmueller/AlgorithmW)

tomprimozic/type-systems
----------

>
>
> 🤖 A collection of standalone implementations of several inference algorithms in OCaml (\~300–600 LOC total): basic Algorithm W, **row polymorphism** (the technique foundational to Elm's original type system), and HMF (first-class polymorphism with partial inference). Each variant is self-contained in a single directory. Where Algorithm W Step by Step teaches you *one* algorithm well, this repository shows you what changes when you swap in more powerful type system features.
>
>

* **Repo**: [github.com/tomprimozic/type-systems](https://github.com/tomprimozic/type-systems)

lambda-calculus-hs
----------

>
>
> 🤖 A progressive collection of single-file lambda calculus implementations in Haskell (\~200–900 LOC each) by Solomon Bothwell. Starts with simply typed evaluation and builds incrementally through bidirectional typechecking, normalization by evaluation (NbE), System T, records with depth subtyping, and nominal inductive types with dependent pattern matching. Each implementation is self-contained. Where tomprimozic/type-systems varies the *inference algorithm*, this repository varies the *type system* while keeping bidirectional checking as the constant.
>
>

* **Repo**: [github.com/solomon-b/lambda-calculus-hs](https://github.com/solomon-b/lambda-calculus-hs)

THIH
----------

>
>
> 🤖 **Typing Haskell in Haskell** by Mark P. Jones is the definitive executable specification of Haskell 98's complete type system in just **429 lines of core Haskell**. It covers kinds, qualified types, type classes, pattern matching types, binding groups, mutual recursion, and defaulting. For context, the Hugs type checker implementing the same semantics spans 90+ pages of C. THIH is a type checker only (no evaluation), but its density of specification per line of code is unmatched.
>
>

* **Paper**: [web.cecs.pdx.edu/\~mpj/thih/](https://web.cecs.pdx.edu/~mpj/thih/)
* **Hackage**: [hackage.haskell.org/package/thih](https://hackage.haskell.org/package/thih)

Simple-sub
----------

>
>
> 🤖 **\~500 LOC of Scala.** Lionel Parreaux's clean reimplementation of Stephen Dolan's MLsub — algebraic subtyping that adds union and intersection types to Hindley-Milner while preserving principal types. No annotations required. The original MLsub won POPL 2017; Simple-sub distills it into an ICFP 2020 Pearl that's small enough to read in one sitting. The ancestor of MLscript, which grows the idea into a full language with OOP and TypeScript interop.
>
>

* **Repo**: [github.com/LPTK/simple-sub](https://github.com/LPTK/simple-sub)
* **Paper**: "The Simple Essence of Algebraic Subtyping" (ICFP 2020)

PLZoo `poly`
----------

>
>
> 🤖 **\~400–600 LOC, OCaml.** Implements a lazy, purely functional language with parametric polymorphism and HM type inference. Its sibling `miniml` (\~300–500 LOC) includes a compiler targeting an abstract machine. Both are part of Andrej Bauer's Programming Languages Zoo, which contains 12+ miniature language implementations, each a few hundred lines of OCaml, covering everything from untyped lambda calculus to call-by-push-value.
>
>

* **Website**: [plzoo.andrej.com](https://plzoo.andrej.com/)
* **Repo**: [github.com/andrejbauer/plzoo](https://github.com/andrejbauer/plzoo)

EYG
----------

>
>
> 🤖 **\~500 LOC JavaScript interpreter**, full implementation in Gleam. EYG ("Eat Your Greens") by Peter Saxton prioritizes predictability, portability, and crash-free programs. It uses row-typed inference (HM extended with row polymorphism), algebraic effects as the sole FFI mechanism, and closure serialization — functions can be sent to other machines for tierless client/server programming. The most distinctive feature: programs are stored as JSON ASTs, not text files. A structural editor makes it impossible to write syntactically invalid programs.
>
>

* **Repo**: [github.com/CrowdHailer/eyg-lang](https://github.com/CrowdHailer/eyg-lang)
* **Website**: [eyg.run](https://eyg.run/)
* **Talk**: SPLASH/LIVE 2024

Pico-ml
----------

>
>
> 🤖 An OCaml subset with HM type inference that compiles to WebAssembly, implemented in TypeScript. Small and self-contained — unusual for having a TypeScript host language rather than the OCaml/Haskell norm. A good starting point if you want to understand ML compilation targeting the browser.
>
>

* **Repo**: [github.com/Quramy/pico-ml](https://github.com/Quramy/pico-ml)

TinyML
----------

>
>
> 🤖 **\<700 LOC, Standard ML.** Packs a lexer, parser, interpreter, and full polymorphic HM type checker into under 700 lines of SML. Referenced on Lambda the Ultimate, this may be the **smallest complete implementation with genuine Hindley-Milner inference**, though the original download link appears to have gone stale.
>
>

* **Reference**: [lambda-the-ultimate.org/node/2683](http://lambda-the-ultimate.org/node/2683)

Eff
----------

>
>
> 🤖 The original algebraic effects language (2012) by Andrej Bauer and Matija Pretnar. OCaml syntax with effect handlers as first-class constructs — you declare effect operations, then install handlers that give them meaning. This is where the idea was first made concrete in a running implementation. Koka, Frank, OCaml 5's effect handlers, and virtually every subsequent algebraic effects system trace lineage here.
>
>

* **Repo**: [github.com/matijapretnar/eff](https://github.com/matijapretnar/eff)
* **Paper**: "Programming with Algebraic Effects and Handlers" (2012)

Frank
----------

>
>
> 🤖 **"Do Be Do Be Do"** (POPL 2017) by Sam Lindley, Conor McBride, and Craig McLaughlin. A strict effectful functional language where functions are handlers that handle zero effects — and multihandlers generalize function abstraction to handle multiple effect interfaces simultaneously. The insight: the boundary between "function" and "effect handler" is artificial. Implemented in Haskell. Lindley describes it as "the one I'm most fond of" while noting it's "basically unmaintained." That tension between conceptual elegance and practical neglect is the story of many languages on this list.
>
>

* **Repo**: [github.com/frank-lang/frank](https://github.com/frank-lang/frank)
* **Paper**: "Do Be Do Be Do" (POPL 2017)

Grace
----------

>
>
> 🤖 A JSON superset with bidirectional type checking and row polymorphism, by Gabriella Gonzalez (author of Dhall). Designed explicitly as a **"ready-to-fork" language skeleton** — if you need a typed DSL, clone Grace and customize it. Has open records, open unions (polymorphic variants), and a clean Haskell codebase that reads like a tutorial. No Hindley-Milner per se (bidirectional instead), but closely related.
>
>

* **Repo**: [github.com/Gabriella439/grace](https://github.com/Gabriella439/grace)
* **Blog**: [haskellforall.com/2021/09/fall-from-grace-ready-to-fork.html](https://www.haskellforall.com/2021/09/fall-from-grace-ready-to-fork.html)

Hackett
----------

>
>
> 🤖 A Haskell-like language implemented entirely as **Racket macros** via the "Type Systems as Macros" technique, by Alexis King. Bidirectional type inference, algebraic datatypes, pattern matching, typeclasses, higher-kinded types, and higher-rank polymorphism — all implemented not as a separate type-checker pass but as macro expansion. The meta-angle is the story: types as macros rather than a traditional elaboration pipeline.
>
>

* **Repo**: [github.com/lexi-lambda/hackett](https://github.com/lexi-lambda/hackett)
* **Paper**: "Type Systems as Macros" (POPL 2017)

Scrapscript
----------

>
>
> 🤖 A content-addressable pure functional language where every expression reduces to a cryptographic hash, stored in a decentralized "scrapyard" registry and referenced by hash or alias. The implementation is a **\~1,300-line dependency-free Python interpreter in a single file**, with a baseline compiler to C (\~500 LOC) and an SSA IR with SCCP/DCE optimization (\~1,000 LOC). Pattern matching is the sole control-flow mechanism. Compiles to C, WebAssembly, and Cosmopolitan portable executables. Implemented primarily by Max Bernstein.
>
>

* **Repo**: [github.com/tekknolagi/scrapscript](https://github.com/tekknolagi/scrapscript)
* **Blog series**: Max Bernstein's implementation walkthroughs at [bernsteinbear.com/blog/scrapscript/](https://bernsteinbear.com/blog/scrapscript/)

MinCaml
----------

>
>
> 🤖 **\~2,000 LOC, OCaml → native code.** The gold standard for capability-to-code-size ratio. Written by Eijiro Sumii at Tohoku University, it implements a strict, higher-order functional language with type inference, closures, tuples, arrays, tail-call optimization, inline expansion, constant folding, and graph-coloring register allocation. It compiles to SPARC, PowerPC, and x86 assembly. On benchmarks including a ray tracer, **MinCaml-compiled code runs within 2× of GCC and OCaml's `ocamlopt`** — sometimes faster. The deliberate trade-off: it omits polymorphism, algebraic data types, and pattern matching. Used in undergraduate compiler courses at the University of Tokyo since 2001, where students build ray tracers compiled by their own compilers running on custom CPUs.
>
>

* **Repo**: [github.com/esumii/min-caml](https://github.com/esumii/min-caml)
* **Paper**: "MinCaml: A Simple and Efficient Compiler for a Minimal Functional Language" (FDPE 2005)
* **Forks**: [gocaml](https://github.com/rhysd/gocaml) (Go + LLVM reimplementation), [miniml](https://github.com/cmaes/miniml) (OCaml + LLVM, \~1,500 LOC, adds LLVM backend to MinCaml's architecture)

Ben Lynn
----------

>
>
> 🤖 **\~2,000 lines of Haskell + 350 lines of C.** Arguably the most remarkable bootstrapping achievement in this space. Starting from a 350-SLOC C runtime that interprets combinatory logic, Lynn builds a chain of approximately 20 progressively more capable compilers, each written in the subset of Haskell that the previous compiler can handle. The final compiler supports type inference, type classes, algebraic data types, pattern matching, guards, where clauses, monadic I/O, modules, and layout parsing — approaching **Haskell 98 coverage**. It compiles Haskell to combinatory logic via Kiselyov's bracket abstraction algorithm, with graph reduction evaluation. Later stages even target WebAssembly. The entire bootstrapping chain is reproducible from just a C compiler.
>
>

* **Repo**: [github.com/blynn/compiler](https://github.com/blynn/compiler)
* **Website**: [crypto.stanford.edu/\~blynn/compiler/](https://crypto.stanford.edu/~blynn/compiler/) — "Compiler Quest," an extraordinary walkthrough of each bootstrapping stage
* **Annotated fork**: [github.com/siraben/mini-haskell](https://github.com/siraben/mini-haskell) (\~1,500 LOC Haskell + 350 LOC C, MIT-licensed, well-commented)

1ML
----------

>
>
> 🤖 **\~3,000–5,000 LOC, OCaml.** Andreas Rossberg unified ML's core and module layers into a single language where modules are first-class values, types are values, and functors are ordinary functions. It elaborates to System Fω with HM-style inference. Won the **ICFP Most Influential Paper Award in 2025**. A proof-of-concept interpreter, not optimized, but a conceptual breakthrough in minimal surface area.
>
>

* **Repo**: [github.com/rossberg/1ml](https://github.com/rossberg/1ml)
* **Paper**: "1ML — Core and modules united" (ICFP 2015, JFP 2018)

mlml
----------

>
>
> 🤖 A self-hosting OCaml subset compiler targeting native x86-64. \~3,000–5,000 LOC. Supports pattern matching, algebraic data types, recursive functions, and closures. Does not implement type inference — it demonstrates the minimum OCaml subset needed for self-compilation.
>
>

* **Repo**: [github.com/coord-e/mlml](https://github.com/coord-e/mlml)

Dhall
----------

>
>
> 🤖 A total (non-Turing-complete) typed configuration language. \~4K LOC core Haskell. Normalization is guaranteed to terminate — you can always reduce a Dhall expression to a normal form, which means imports resolve, functions inline, and what you get is plain data. Based on a Calculus-of-Constructions-derived type theory with records, unions, and natural numbers. Has a formal specification and implementations in Haskell, Rust, Go, and Clojure.
>
>

* **Repo**: [github.com/dhall-lang/dhall-haskell](https://github.com/dhall-lang/dhall-haskell)
* **Website**: [dhall-lang.org](https://dhall-lang.org/)

Ante
----------

>
>
> 🤖 Combines HM type inference, algebraic data types, pattern matching, algebraic effects, and an ownership-like system for shared mutability. Written in Rust, it uses **Cranelift** for native code generation. Actively developed, aiming to bridge the Rust/OCaml divide.
>
>

* **Repo**: [github.com/jfecher/ante](https://github.com/jfecher/ante)

Tao
----------

>
>
> 🤖 Surprisingly feature-rich for its size: generics, typeclasses, sum types, pattern matching, first-class functions, currying, algebraic effects, associated types, and totality checking. Its pipeline runs from lexing through HIR type inference to MIR monomorphization and bytecode execution. Written in Rust.
>
>

* **Repo**: [github.com/zesterer/tao](https://github.com/zesterer/tao)

Austral
----------

>
>
> 🤖 A systems language with **linear types** and capability-based security. The linear type checker is \~600 lines. OCaml bootstrap compiler targeting C. Designed by Fernando Borretti to fit in one person's head — the spec is deliberately small enough that a single developer can understand the entire language. Not functional in the Haskell sense, but linear types make it adjacent. An experiment in "what if we took linear types seriously but kept the language small."
>
>

* **Repo**: [github.com/austral/austral](https://github.com/austral/austral)
* **Website**: [austral-lang.org](https://austral-lang.org/)

AQaml
----------

>
>
> 🤖 A self-hosting OCaml subset compiler targeting native x86-64. \~5,000–8,000 LOC. Adds records, variants, references, and garbage collection beyond what mlml supports. Triple self-hosting verified. Like mlml, it omits type inference — demonstrating the minimum OCaml needed for self-compilation.
>
>

* **Repo**: [github.com/ushitora-anqou/aqaml](https://github.com/ushitora-anqou/aqaml)

Borgo
----------

>
>
> 🤖 Adds ML-family features (algebraic data types, exhaustive pattern matching, Result/Option types) to Go's ecosystem by compiling to Go source code with Rust-like syntax. Written in Rust.
>
>

* **Repo**: [github.com/borgo-lang/borgo](https://github.com/borgo-lang/borgo)

polytt
----------

>
>
> 🤖 A research experiment from the Topos Institute extending Martin-Löf Type Theory with native, first-class polynomial functors — the mathematical objects underlying deterministic state machines and interactive systems. Written in OCaml with Menhir parsing. Custom syntax for polynomial types (`y^n`), morphism arrows, and wiring operators. Dependent types (Pi, Sigma), finite-set ADTs, and pattern matching via case elimination. An ended experiment, but a unique point in the design space: what happens when you make polynomial functors a language primitive rather than an encoding.
>
>

* **Repo**: [github.com/ToposInstitute/polytt](https://github.com/ToposInstitute/polytt)

Newt
----------

>
>
> 🤖 **\~7K LOC, self-hosted, compiles to JavaScript.** A dependently typed language with Agda/Idris/Haskell-like syntax by Steve Dunham. Bidirectional typechecking with normalization by evaluation (based on Elaboration Zoo), typeclasses, ADTs with dependent pattern matching, case tree compilation, trampoline-based TCO for mutually tail-recursive functions, and erasure of compile-time-only values (0/ω quantities). Has a web playground and an LSP. The compiler is written in Newt itself. Built as a learning exercise, but the feature set — self-hosting, dependent types, typeclasses, erasure, LSP — puts it well beyond most pedagogical implementations.
>
>

* **Repo**: [github.com/dunhamsteve/newt](https://github.com/dunhamsteve/newt)
* **Playground**: [dunhamsteve.github.io/newt](https://dunhamsteve.github.io/newt)

HaMLet
----------

>
>
> 🤖 **\~10,000–15,000 LOC, SML.** Andreas Rossberg's most faithful implementation of the Definition of Standard ML. It implements **all of SML '97** including the full module system (signatures, structures, functors), mapping rule-by-rule to the formal Definition. Jeremy Yallop recommends it as the most readable SML implementation. It can be bundled into a single SML file and compiled by any SML implementation. A `compile-js` branch demonstrates compilation to JavaScript.
>
>

* **Repo**: [github.com/rossberg/hamlet](https://github.com/rossberg/hamlet)

SOSML
----------

>
>
> 🤖 **\~10,000–15,000 LOC, TypeScript.** Implements the full SML core language in the browser: val/fun/datatype declarations, pattern matching, HM type inference, exceptions, and references. Used for teaching at Saarland University.
>
>

* **Website**: [sosml.org](https://sosml.org)
* **Repo**: [github.com/SOSML/SOSML](https://github.com/SOSML/SOSML)

MicroHs
----------

>
>
> 🤖 By Lennart Augustsson (one of GHC's original creators) — the most complete "small" Haskell compiler alive today. It compiles an extended subset of **Haskell 2010** including type classes, do-notation, deriving, record syntax, overloaded literals, and modules. It is fully self-hosting and — critically — **bootstrappable from only a C compiler** (no pre-existing Haskell toolchain required). MicroHs translates Haskell to combinators executed by a C runtime. It has a JavaScript runtime target, a package manager (`mcabal`), and can compile real Hackage packages like QuickCheck. The codebase is not trivially small (estimated **15,000–30,000 lines** across compiler, libraries, and runtime), but for what it does — a near-complete Haskell compiler bootstrappable from C — it is remarkably compact.
>
>

* **Repo**: [github.com/augustss/MicroHs](https://github.com/augustss/MicroHs)
* **Paper**: "MicroHs: A Small Compiler for Haskell" (Haskell Symposium 2024)