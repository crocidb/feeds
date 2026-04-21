+++
title = "Lil' Fun Langs' Guts"
description = "What's inside them? Do I need my pancreas?"
date = "2026-03-01T00:00:00Z"
url = "https://taylor.town/scrapscript-001"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.126123321Z"
seen = true
+++

I'm still thinking about those [lil' fun langs](https://taylor.town/scrapscript-000). How do they work? What's inside them? Do I need my pancreas? What if I don't want to normalize my IR? Is laziness a virtue?

Haskell-esque languages may look alike, but they differ across many dimensions:

* [strict vs. lazy](#strict-vs-lazy)
* [curried vs. bland](#curried-vs-bland)
* [bootstrapped vs. hosted](#bootstrapped-vs-hosted)
* [interpreted vs. compiled](#interpreted-vs-compiled)
* [nominal vs. structural types](#nominal-vs-structural)
* [pretty vs. ugly errors](#pretty-vs-ugly-errors)

Most implementations use standard compilation phases:

1. [Lexing](#lexing): Source → Token stream
2. [Parsing](#parsing): Tokens → Surface AST
3. [Desugaring](#name-resolution--desugaring): Surface AST → Core AST
4. [Type Inference](#type-inference): Core AST → Typed AST
5. [Pattern Match Compile](#pattern-match-compilation): Typed AST → Case trees
6. [Normalization (ANF/K)](#normalization): Typed AST → Normalized IR
7. [Optimization](#optimization): Normalized IR → Normalized IR
8. [Closure Conversion](#closure-conversion): Normalized IR → Closure-explicit IR
9. [Code Generation](#code-generation): Closure IR → Target (asm/bytecode/C/LLVM)
10. [Register Allocation](#register-allocation): Virtual regs → Physical regs (if native)
11. [Runtime System](#runtime-system): GC, primitives, entry point

---

Strict vs. Lazy
----------

In strict evaluation, arguments are evaluated before being passed to a function. In lazy evaluation, arguments are only evaluated if their value is actually needed; the result is cached, so the work happens at most once.

```
-- lazy eval returns `3` without applying `foo`
length [ 1, foo 2, 4 ]
```

|      Aspect      |      Strict (ML, OCaml)       |          Lazy (Haskell)          |
|------------------|-------------------------------|----------------------------------|
|  Normalization   |      ANF / K-normal form      |      STG / thunks required       |
|Closure conversion|    Standard flat closures     |Closures + thunks + update frames |
| Code generation  |        Straightforward        |Requires eval/apply or push/enter |
|Memory management |  Values are always evaluated  |  May contain unevaluated thunks  |
|    Tail calls    |         Simple (jump)         |    Complex (enters, updates)     |
|    Debugging     |Easy (call stack is meaningful)|Hard (thunks obscure control flow)|
|Runtime complexity|     Simpler (\~200 LOC C)     | More complex (\~500–2000 LOC C)  |

Strict evaluation is the simple choice. If you want laziness, Peyton Jones's [STG machine](https://www.microsoft.com/en-us/research/wp-content/uploads/1992/04/spineless-tagless-gmachine.pdf) is the standard approach. MicroHs sidesteps the STG machine by compiling directly to combinatory logic with graph reduction.

Lazy evaluation also unlocks infinite collections — you can define an infinite list and consume only what you need.

Curried vs. Bland
----------

|   Style   |               Examples                |                                            Implementation cost                                            |
|-----------|---------------------------------------|-----------------------------------------------------------------------------------------------------------|
|**Curried**|      Haskell, Ben Lynn, MicroHs       |Free in combinator backends; native backends need arity analysis to avoid allocating a closure per argument|
| **Bland** |MinCaml, OCaml (internally), Grace, EYG|       Simpler codegen -- multi-arg functions are just functions that take tuples or multiple params       |

In a curried language, `f x y` is `((f) x) y`: two function applications. If your backend doesn't detect that `f` always takes two arguments (arity analysis), you pay for a heap allocation on every multi-argument call.

Bootstrapped vs. Hosted
----------

>
>
> I tried to teach myself to play the guitar. But I'm a horrible teacher — because I do not know how to play a guitar.
>
>
>
> — [Mitch Hedberg](https://en.wikipedia.org/wiki/Mitch_Hedberg)
>
>

Most compilers are written in an existing language (e.g. C, Rust, Haskell, OCaml) and lean on that host's ecosystem for parsing libraries, build tools, and package management.

A bootstrapped compiler compiles itself. You write the compiler in the language it compiles, then use an earlier version of the compiler (or a minimal seed runtime) to build the next version. Your language becomes self-sustaining; the compiler is its own test suite.

There are many exemplary self-hosted languages to study:

* **MicroHs** is a Haskell compiler that compiles Haskell to combinators. The combinator reducer is implemented in C. The compiler is written in Haskell and can compile itself. Bootstrapping requires only a C compiler -- no pre-existing Haskell installation.
* **Ben Lynn** starts with a minimal runtime in C (\~350 LOC), then constructs increasingly capable compilers, each written in the subset that the previous one can compile. Each stage is \~100–300 LOC of the language being defined. The total chain is \~2000 LOC + 350 LOC C.

```
  C runtime (350 LOC)
    → compiler₁: lambda calculus + integers
    → compiler₂: + let, letrec, ADTs
    → compiler₃: + type inference
    → compiler₄: + pattern matching
    → compiler₅: + type classes
    → ...
    → compilerₙ: near-Haskell-98
```

* **Newt** is a dependently typed language whose compiler is written in Newt, targeting JavaScript. It bootstraps by keeping the generated JS checked in. This works best when your target is a high-level runtime (JS, JVM) rather than native code.

Interpreted vs. Compiled
----------

An interpreter executes the program directly by walking its AST or stepping through bytecode. A compiler translates the program into another language (e.g. x86, C, JS) and lets that target handle execution.

The boundary here is blurry. Bytecode VMs compile to an intermediate form. "Transpilers" compile to source code rather than machine instructions.

|          Strategy          |              Examples              |LOC estimate|                                 Trade-off                                  |
|----------------------------|------------------------------------|------------|----------------------------------------------------------------------------|
|**Tree-walking interpreter**|PLZoo `poly`, Eff, Frank, Grace, 1ML|   50–200   |          Simplest. No codegen, no runtime. Slow (10–100× native)           |
|      **Bytecode VM**       | OCaml (ZINC), Tao, PLZoo `miniml`  |  200–500   |   Middle ground. Portable, reasonable speed. Write \~30–50 instructions    |
|   **Native compilation**   |        MinCaml, mlml, AQaml        |  500–1500  | Fast execution, but you own register allocation, calling conventions, ABI  |
|     **Transpile to C**     |Koka, Scrapscript, Chicken, Austral |  200–500   |Best of both worlds -- portable native speed, C compiler does the hard parts|
|   **Transpile to JS/Go**   |         Newt, SOSML, Borgo         |  200–400   |  Web/ecosystem deployment, but you inherit the target's performance model  |
|  **Combinator reduction**  |         Ben Lynn, MicroHs          |  100–300   | No closures, no registers. Graph reduction evaluator in C. Simple but slow |

[Lil' fun langs](https://taylor.town/scrapscript-000) are usually interpreters. Without compilation, you can skip closure conversion, register allocation, and runtime systems. The leap from interpreter to compiler costs \~500–2000 LOC.

Nominal vs. Structural Types
----------

```
type Meters  = Int
type Seconds = Int

-- Nominal:     Meters ≠ Seconds  (different names)
-- Structural:  Meters = Seconds  (same shape)
```

|    Style     |             Examples             |                       Consequence                       |
|--------------|----------------------------------|---------------------------------------------------------|
| **Nominal**  |     OCaml, Haskell, Austral      |  Name is identity -- same shape doesn't mean same type  |
|**Structural**|EYG, Grace, TypeScript, Simple-sub|Shape is identity -- same fields/variants means same type|

Most ML-family languages are nominal for algebraic data types but structural for records (if implemented). Row polymorphism (EYG, Grace, Koka) is inherently structural -- it acts on "any record with at least these fields." Simple-sub goes further: union and intersection types, with principal inference intact.

Pretty vs. Ugly Errors
----------

```
-- Ugly:
Error: type mismatch: int vs string

-- Pretty:
 3 │ let x = 1 + "hello"
   │             ^^^^^^^^
Error: I expected an `int` here, but got a `string`.
  The left side of `+` is `int`, so the right side must be too.
```

Pretty errors cannot be achieved with a coat of paint. To point at a line/region of code, you must thread source locations through every compiler phase. A minimum viable error system:

1. **Source spans on every AST node.** Every expression, pattern, and type carries `{ file, start_line, start_col, end_line, end_col }`. This costs one extra field per node.
2. **Preserve spans through desugaring.** When you lower `where` to `let`, the new `let` node inherits the span of the `where`.
3. **Preserve spans through type inference.** When unification fails, you need the spans of both conflicting types.
4. **Format errors with context.** Show the source line, underline the relevant span, explain the mismatch.

|       Quality       |           Examples            |                                 Cost                                 |
|---------------------|-------------------------------|----------------------------------------------------------------------|
|    **Elm-tier**     |         Elm, Austral          |Purpose-built error messages per failure mode. Highest effort, best UX|
|   **Good enough**   |       Tao, Ante, OCaml        |        Source spans + generic formatting. Covers 90% of cases        |
|   **Positional**    | MinCaml, most small compilers |         Line numbers but no span highlighting or explanation         |
|**De Bruijn indices**|Elaboration Zoo (intentionally)|       Variable names lost -- fine for research, bad for users        |

---

Lexing
----------

|           Approach           |             Used by             |   LOC estimate   |           Notes            |
|------------------------------|---------------------------------|------------------|----------------------------|
|    Hand-written recursive    | MinCaml (Rust port), Tao, Ante  |     100–300      | Full control, best errors  |
|      ocamllex / mlllex       |MinCaml (original), HaMLet, PLZoo|      50–100      |Standard for OCaml/SML hosts|
|        Alex (Haskell)        |  MicroHs, many Haskell-hosted   |      50–100      | Standard for Haskell hosts |
|Parser combinator (integrated)|   Ben Lynn, some educational    |0 (part of parser)|     Lexerless parsing      |

Optional enhancements:

* **Layout/indentation sensitivity** (Haskell-style offside rule): Ben Lynn implements this in later bootstrapping stages. MicroHs includes full layout parsing. Adds 100–300 LOC. The algorithm is well-described by the [Haskell Report's Section 2.7](https://www.haskell.org/onlinereport/haskell2010/haskellch2.html#x7-210002.7).
* **Unicode identifiers**: Most small compilers skip this entirely. Koka supports it.
* **Interpolated strings**: Syntax like `"hello ${name}"` is not standard in ML-family, but some newer languages add it.

Parsing
----------

Parsing converts the flat token stream into a tree. The surface syntax is parsed into a concrete syntax tree (CST) or directly into an abstract syntax tree (AST). ML-family languages have a well-behaved grammar that is almost [LL(1)](https://en.wikipedia.org/wiki/LL_parser).

|                  Approach                   |           Used by            |     LOC estimate     |                Notes                 |
|---------------------------------------------|------------------------------|----------------------|--------------------------------------|
|Recursive descent + Pratt/precedence climbing|MinCaml (Rust port), Tao, Ante|       200–500        |Best error messages, easiest to extend|
|          ocamlyacc / mlyacc (LALR)          |  MinCaml (original), HaMLet  |100–200 (grammar file)|  Standard, but poor error recovery   |
|      Parser combinators (Parsec-style)      |   Ben Lynn, MicroHs, PLZoo   |       100–400        | Elegant, compositional, backtracking |
|                PEG / Packrat                |      Rare in ML-family       |       100–300        |        Linear time guarantee         |

Every subsequent phase transforms this type. In ML-family languages, the AST typically looks like:

```
type expr =
  | Lit of literal                    (* 42, 3.14, "hello", true *)
  | Var of name                       (* x *)
  | App of expr * expr                (* f x *)
  | Lam of name * expr                (* fun x -> e *)  (or \x -> e)
  | Let of name * expr * expr         (* let x = e1 in e2 *)
  | LetRec of name * expr * expr      (* let rec f = e1 in e2 *)
  | If of expr * expr * expr          (* if c then t else f *)
  | Tuple of expr list                (* (a, b, c) *)
  | Match of expr * branch list       (* match e with p1 -> e1 | ... *)
  | Ann of expr * type                (* (e : t) *)
```

Name Resolution & Desugaring
----------

Before type inference, the surface AST is simplified:

1. **Alpha-renaming**: Every binder is assigned a unique identifier to eliminate shadowing. MinCaml's Rust port does this during type checking. Most do this while parsing or during a separate pass.
2. **Fixity resolution**: Infix operators are re-associated according to declared precedence and associativity. HaMLet does this as a separate pass. Many small compilers hardcode operator precedence in the parser.
3. **Desugaring**: Surface constructs are lowered into core constructs:
   * `where` clauses → `let`
   * Guards in pattern matching → nested `if`
   * `do` notation (monadic) → `>>=` chains
   * List comprehensions → `concatMap`
   * Operator sections → lambdas: `(+ 1)` becomes `fun x -> x + 1`
   * Record syntax → positional constructors + accessor functions
   * Type class instances → dictionary passing (elaboration)

Type Inference
----------

This is the heart of an ML-family language. The "standard" algorithm is Hindley-Milner (HM) type inference, specifically [Algorithm W](https://web.cs.wpi.edu/~cs4536/c12/milner-damas_principal_702702.pdf) or [Algorithm J](https://web.cs.wpi.edu/~cs4536/c12/milner-damas_principal_702702.pdf).

Core components:

1. **Type representation**: Types are terms built from type variables, type constructors, and function arrows: `type ty = TVar of tvar | TCon of string | TArr of ty * ty | TTuple of ty list`
2. **Unification**: Given two types, find the most general substitution that makes them equal. Implemented as a union-find structure over type variables with [occurs-check](https://en.wikipedia.org/wiki/Occurs_check).
3. **Generalization**: At `let` boundaries, free type variables in a type are universally quantified to produce a polymorphic type scheme: `∀α. α → α`.
4. **Instantiation**: When a polymorphic name is used, its scheme is instantiated with fresh type variables.

```
-- Given:
let id = fun x -> x in (id 1, id true)

-- Type inference trace:
-- 1. id : α → α                (infer: x has fresh type α, body is x)
-- 2. generalize: id : ∀α. α → α    (α is free at let boundary)
-- 3. id 1:  instantiate α=β, unify β→β with int→γ, get int
-- 4. id true: instantiate α=δ, unify δ→δ with bool→ε, get bool
-- 5. result: (int, bool)
```

|            Approach            |                  Used by                   |LOC estimate|                            Notes                             |
|--------------------------------|--------------------------------------------|------------|--------------------------------------------------------------|
|Algorithm W (substitution-based)|      Algorithm W Step-by-Step, PLZoo       |  150–400   |    Simplest to understand, compose substitutions eagerly     |
|   Algorithm J (mutable refs)   |     MinCaml, most production compilers     |  100–300   |      More efficient, uses mutable unification variables      |
|    Constraint-based (HM(X))    |        GHC, some research compilers        |  500–2000  |   Separates constraint generation from solving; extensible   |
|  Bidirectional type checking   |Elaboration Zoo, some dependent type systems|  200–500   |Alternates checking/inference modes; scales to dependent types|

But fancy type system features aren't free:

|                   Enhancement                    |Complexity added|                   Used by                    |
|--------------------------------------------------|----------------|----------------------------------------------|
|            **Type classes / traits**             | \+500–2000 LOC |Haskell, MicroHs, Ben Lynn (later stages), Tao|
|**Row polymorphism** (extensible records/variants)| \+300–800 LOC  |            Koka, 1ML, EYG, Grace             |
|             **Higher-kinded types**              | \+200–500 LOC  |                Haskell, Koka                 |
|                    **GADTs**                     | \+500–1500 LOC |               GHC, OCaml 4.x+                |
|          **Algebraic effects** (typed)           | \+500–1500 LOC |               Koka, Eff, Frank               |
|            **Dependent types** (full)            |\+1000–5000 LOC |         Elaboration Zoo, Idris, Lean         |
|   **Algebraic subtyping** (union/intersection)   |   \+500 LOC    |             Simple-sub, MLscript             |
|     **First-class polymorphism** (System F)      | \+300–1000 LOC |                   1ML, MLF                   |
|     **Module system** (functors, signatures)     |\+1000–5000 LOC |              HaMLet, OCaml, 1ML              |

Other strategies:

* **Polymorphism:** Monomorphic type inference only (no `∀` quantification). Every type is fully determined. This cuts the type checker to \~100 LOC by eliminating generalization and instantiation entirely. Functions like `id x = x` get a concrete type at each use site.
* **Elaboration:** Modern type checkers increasingly separate *elaboration* (translating surface syntax to a fully explicit core) from *unification* (solving type constraints). The Elaboration Zoo demonstrates this cleanly: each stage is a single Haskell file of 200–800 LOC, progressively adding features.
* **Type class desugaring via dictionary passing:** Haskell-style type classes are implemented by translating class constraints into explicit dictionary arguments. `sort :: Ord a => [a] -> [a]` becomes `sort :: OrdDict a -> [a] -> [a]`. Ben Lynn's compiler and MicroHs both use this approach.

Pattern Match Compilation
----------

With types inferred, pattern matching can be compiled to efficient decision trees or case trees.

|                Approach                 |                Used by                |LOC estimate|                                  Notes                                   |
|-----------------------------------------|---------------------------------------|------------|--------------------------------------------------------------------------|
|**Decision trees** (Maranget's algorithm)|   Most modern compilers, Tao, Ante    |  200–600   |                 Optimal -- no redundant tests, good code                 |
|        **Backtracking automata**        |Older compilers, simple implementations|  100–300   |                      Simpler but can duplicate work                      |
|      **Nested if/switch** (naive)       |      Many educational compilers       |   50–100   |               Correct but exponentially bad in worst case                |
|          **Omitted entirely**           |         MinCaml, PLZoo `poly`         |     0      |                Only supports `if/then/else` on primitives                |
|          **Defunctionalized**           |      Some educational compilers       |   50–150   |Sequence of partial functions with fallthrough; simpler but less efficient|

Key phases:

1. **Exhaustiveness checking**: Warn/error if a match doesn't cover all cases.
2. **Redundancy checking**: Warn if a pattern is unreachable.
3. **Guard compilation**: Guards add a "backtrack" obligation.
4. **Nested pattern flattening**: `(Cons (x, Cons (y, Nil)))` → sequence of tests.

The canonical reference is [Compiling Pattern Matching to Good Decision Trees](http://moscova.inria.fr/~maranget/papers/ml05e-maranget.pdf). Luc Maranget's algorithm produces provably optimal decision trees in terms of the number of tests. OCaml and Rust use this approach.

Normalization
----------

```
-- Before (nested expression):
f (g x) (h y)

-- After (A-normal form):
let a = g x in
let b = h y in
f a b
```

Every intermediate value gets a name. Every function argument becomes trivial. Evaluation order is now explicit in the `let` chain.

Normalization strategies:

|                  Strategy                  |                  Used by                  |                                        Character                                        |
|--------------------------------------------|-------------------------------------------|-----------------------------------------------------------------------------------------|
|**K-normal form** (MinCaml's variant of ANF)|          MinCaml and derivatives          |                 Direct-style; names all intermediate values with `let`                  |
|          **A-normal form** (ANF)           |Flanagan et al. 1993, many modern compilers|                Essentially the same as K-normal form; the standard name                 |
|    **Continuation-passing style** (CPS)    |     Appel's SML/NJ, Rabbit, CertiCoq      |      Every function takes an extra continuation argument; all calls are tail calls      |
|            **No normalization**            |                 Ben Lynn                  |Typed AST → combinatory logic directly. Works for graph reduction, not for native codegen|
|              **SSA directly**              |                Scrapscript                |           Skips ANF/CPS; SSA IR with SCCP + DCE. Lets LLVM/C handle the rest            |
|          **Monadic normal form**           |Some dependent type systems (Bowman, 2024) |    Like ANF but uses monadic bind instead of let; cleaner for certain optimizations     |

Optimization
----------

With the program in normal form, optimization passes can simplify it. In small compilers, optimizations are kept minimal -- the goal is to not be embarrassingly slow, not to compete with GCC.

MinCaml's optimization passes (totaling \~300 LOC):

|                Pass                |LOC (MinCaml)|                               Effect                                |
|------------------------------------|-------------|---------------------------------------------------------------------|
|         **Beta reduction**         |    \~50     |            Inline `let x = y in ... x ...` → `... y ...`            |
|     **Let flattening** (assoc)     |     22      |`let x = (let y = e1 in e2) in e3` → `let y = e1 in let x = e2 in e3`|
|        **Inline expansion**        |    \~100    |         Replace calls to small functions with their bodies          |
|        **Constant folding**        |    \~50     |                            `3 + 4` → `7`                            |
|     **Dead code elimination**      |    \~50     |       Remove `let x = e1 in e2` when `x` is not free in `e2`        |
|**Common subexpression elimination**|    \~50     |               (optional in MinCaml, via hash-consing)               |

These six passes cover 80%+ of the optimization value for a small compiler. They are applied iteratively until a fixpoint is reached (typically 2–3 iterations).

Beyond the basics:

|          Optimization          |  Complexity  |                                    Effect                                    |
|--------------------------------|--------------|------------------------------------------------------------------------------|
|   **Tail call optimization**   | \+50–100 LOC |        Essential for functional languages; loops are recursive calls         |
|  **Known-call optimization**   |   \+50 LOC   |   When the target of a call is statically known, skip closure indirection    |
| **Unboxing** (specialization)  |\+200–500 LOC |          Avoid boxing for monomorphic uses of polymorphic functions          |
|       **Contification**        |\+100–300 LOC |   Convert functions that are always called in tail position to local jumps   |
|**Demand analysis** (strictness)|\+500–2000 LOC|      For lazy languages: determine which arguments are always evaluated      |
|  **Worker/wrapper transform**  |\+200–500 LOC |            Separate strict args from lazy ones for better codegen            |
|   **Deforestation / fusion**   |\+500–2000 LOC|Eliminate intermediate data structures (e.g., `map f . map g` → `map (f . g)`)|
| **Whole-program optimization** |    varies    | JHC does this via GRIN; eliminates unused constructors, specializes globally |

Closure Conversion
----------

```
-- Before:
let f = \ x -> x + y

-- After:
let f =
  { fun = \ env x -> x + env.y
  , env = { y = y }
  }
```

The optimized IR still has functions with free variables. Closure conversion makes all functions "closed" -- because hardware doesn't understand lexical scoping. Every function becomes a pair: (code pointer, environment record). The environment captures the function's free variables at the point of definition.

|                 Approach                  |                   Used by                   |                                                                               Trade-offs                                                                                |
|-------------------------------------------|---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|             **Flat closures**             |       MinCaml, OCaml, most compilers        |                               Environment is a flat vector of captured values. O(1) access, one allocation per closure. Standard choice.                                |
|        **Linked/shared closures**         |         Some older Scheme compilers         |                               Environment is a linked list of frames. Shares structure between closures. More allocation, slower access.                                |
|            **Lambda lifting**             |GHC (selectively), some educational compilers|Eliminates closures entirely by adding extra parameters. No heap allocation for the closure itself. But callers must pass more arguments, and call sites must be updated.|
|          **Defunctionalization**          |           Reynolds (1972), MLton            |             Replace higher-order functions with first-order dispatch on a sum type. Eliminates function pointers entirely. Requires whole-program analysis.             |
|**Combinatory logic** (bracket abstraction)|              Ben Lynn, MicroHs              |                            Replace lambdas with SKI combinators (or variants). No closures, no environments. Evaluation by graph reduction.                             |

Code Generation
----------

Codegen is wholly determined by your choice of target:

|                Target                 |                Used by                 |LOC estimate|                        Trade-offs                         |
|---------------------------------------|----------------------------------------|------------|-----------------------------------------------------------|
|**Native assembly** (x86-64, ARM, etc.)|          MinCaml, mlml, AQaml          |  300–800   |      Best performance, most work, platform-specific       |
|             **C source**              |Koka, Scrapscript, Chicken, JHC, Austral|  200–500   |Portable, leverages C compiler's optimizer, but indirection|
|              **LLVM IR**              |     Ante, gocaml, Harrop's MiniML      |  200–500   |  Good native perf, cross-platform, but large dependency   |
|             **Cranelift**             |MinCaml (Rust port), some new languages |  200–500   |  Faster compilation than LLVM, good codegen, Rust-native  |
|       **Bytecode** (custom VM)        |  OCaml (ZINC machine), PLZoo `miniml`  |  200–500   |          Portable, simple, but slower execution           |
|         **JavaScript / Wasm**         |   MinCaml-wasm, SOSML, Newt, various   |  200–400   |       Web deployment, but limited performance model       |
|             **Go source**             |                 Borgo                  |  200–500   |  Inherit Go's ecosystem, tooling, and concurrency model   |
|         **Combinatory logic**         |           Ben Lynn, MicroHs            |  100–300   |     No register allocation needed, but slow execution     |
|  **Normalizer** (no runtime target)   |                 Dhall                  |  200–500   |"Compilation" = reduce to normal form. No executable output|

Register Allocation
----------

Programs use arbitrarily many variables, but CPUs have a fixed number of registers. Register allocation decides which variables live in registers and which spill into memory.

If you target native assembly, you implement this yourself. The backend handles this for you if you target C/LLVM/Cranelift/etc.

|             Approach              |              Used by              |LOC estimate|               Quality               |
|-----------------------------------|-----------------------------------|------------|-------------------------------------|
|**Graph coloring** (Chaitin-Briggs)|     MinCaml, Appel's textbook     |  200–500   |  Optimal for most cases, standard   |
|          **Linear scan**          |    Some JITs, simple compilers    |  100–200   |Fast compilation, slightly worse code|
|   **Naïve (spill everything)**    |    Some educational compilers     |     50     |  Correct but terrible performance   |
|        **Not applicable**         |Compilers targeting C/LLVM/bytecode|     0      |        Delegated to backend         |

Runtime System
----------

The minimal setup includes:

|          Component          |   Complexity   |                  Notes                  |
|-----------------------------|----------------|-----------------------------------------|
|**Entry point / stack setup**|  10–30 LOC C   | Set up initial heap and stack pointers  |
|    **Garbage collector**    | 100–1000 LOC C |                See below                |
|  **Primitive operations**   |50–200 LOC C/asm|      I/O, math, string operations       |
|   **Allocation routine**    |   10–50 LOC    |Bump allocator (if GC handles collection)|
| **Closure representation**  |part of codegen |   How closures are laid out in memory   |

Lil' fun langs allocate frequently -- every closure, every cons cell, every partial application. Without reclamation, you run out of memory fast. You need to prevent garbage from accumulating:

|           Strategy           |                   Used by                    |   Complexity   |                                          Notes                                          |
|------------------------------|----------------------------------------------|----------------|-----------------------------------------------------------------------------------------|
|   **No GC** (leak memory)    |Some educational compilers, MinCaml benchmarks|       0        |                            Viable for short-running programs                            |
|**Cheney copying (semispace)**|    Many small compilers, Appel's textbook    | 100–300 LOC C  |                            Simple, fast, but uses 2× memory                             |
|      **Mark-and-sweep**      |                   Various                    | 100–300 LOC C  |                       Doesn't move objects, no forwarding needed                        |
|    **Reference counting**    |       Koka (Perceus), Carp, Swift-like       |  200–500 LOC   |No pause times; Perceus achieves it precisely with no overhead via compile-time insertion|
|       **Region-based**       |        MLKit, some research languages        |  300–1000 LOC  |                      Compile-time memory management, no GC pauses                       |
|    **Arena / stack only**    |            Very simple compilers             |   20–50 LOC    |                          Allocate in arenas, free all at once                           |
| **Ownership / affine types** |              Rust, Carp, Lean 4              |0 (compile-time)|                    No runtime GC needed, but restricts the language                     |

If your language has algebraic effects (Eff, Frank, Koka, Ante), the runtime needs support for delimited continuations or a CPS-transformed calling convention. Effect handlers essentially require a second stack or a segmented stack to capture continuations. Koka handles this via evidence-passing; Eff and Frank use interpretation.