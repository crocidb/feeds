+++
title = "Not a Joke"
description = "I have a long and somewhat embarrassing history with LISP that goes back to the years when it was fading from academia and LISP machines were giving way to Macs and [DECstations](https://en.wikipedia.org/wiki/DECstation?utm_cam"
date = "2026-09-01T21:30:00Z"
url = "https://taoofmac.com/space/blog/2026/09/01/2130?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-09-03T13:15:13.164304732Z"
seen = false
+++

I have a long and somewhat embarrassing history with [LISP](/space/dev/lisp) that goes back to the years when it was fading from academia and LISP machines were giving way to [Macs](/space/com/apple/mac#macintosh) and [DECstations](https://en.wikipedia.org/wiki/DECstation?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (a transition that should be familiar to anyone who read the [UNIX-HATERS Handbook](https://en.wikipedia.org/wiki/The_UNIX-HATERS_Handbook?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)), so I got properly hooked on [Clojure](/space/dev/clojure#clojure-script) when it came out.

But [Clojure](/space/dev/clojure#clojure-script) had the *huge* disadvantage of being tied to the [Java](/space/dev/java) virtual machine. That dependency was also one of its superpowers, but I always saw it as its biggest flaw.

Despite that, I used it in production for a few years and have been mourning the fact that you can’t have it without the [JVM](/space/dev/java) ever since. On a [Raspberry Pi](/space/hw/raspberry_pi#raspberry-pi) or an [ARM](https://en.wikipedia.org/wiki/ARM_architecture?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) SBC, starting a [JVM](/space/dev/java) just to run a REPL feels like bringing a shipping container to a picnic.

[Joker](https://rcarmo.github.io/projects/go-joker?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) was the escape hatch I’d been looking for–a standalone [Go](/space/dev/golang#go-lang) binary that understands most of [Clojure’s](/space/dev/clojure#clojure-script) syntax and needs no external runtime. I started using it for scripting and linting years ago, and when I began thinking about building [`gi`](https://rcarmo.github.io/projects/gi/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (my own lightweight coding agent), embedding [Joker](https://rcarmo.github.io/projects/go-joker?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) as the extension language was the obvious choice.

There was just a *tiny* little problem: it was *slow*. Not “a bit slow”–it was *orders of magnitude slower* than [Python](/space/dev/python) on anything involving loops, arithmetic or recursion. Fine for linting, but useless for anything else.

I [forked it](https://github.com/rcarmo/go-joker?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and spent two very intense days making it fast over a bank holiday. I’ve written about [`go-joker`](https://github.com/rcarmo/go-joker?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) before, including [the spiffy notebook interface it ships with](/space/notes/2026/05/24/1445#joking-around):

<img src="/space/blog/2026/09/01/2130/go-joker-mandelbrot-notebook.png?v=160c7c5b50ab" alt="go-joker notebook with Mandelbrot rendering" width="1216" height="1480"> The Go-Joker notebook rendering Mandelbrot through the WASM-backed imaging path.

But I recently realised that I never really put together all of my notes from last April, and it’s long overdue to write a proper post about it, so here it is.

[

The Approach
----------

](/space/blog/2026/09/01/2130#the-approach)

My deep, dark past poking at the [JVM](/space/dev/java) (did you know that [HP](/space/com/hp) had one audited externally in Europe? Ask me how I know) and my limited time working on [.NET](/space/dev/dotnet#net) internals–plus a lot of reading about the [JVM’s](/space/dev/java) tiered compilation–all told me the same thing: the path from “slow interpreter” to “fast interpreter” follows a fairly predictable arc. First you identify the hot paths, then you lower them to a simpler representation, then you specialise that representation for the common types. If you’re lucky, you can go further and compile to native code for the innermost loops.

This isn’t something I’ve done often (not for a few decades, really), but I used to discuss it with one or two compiler nerds I worked with ages ago–we had long, weird phone calls about [`gcc`](https://gcc.gnu.org/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), of all things–so I had an idea of how to do it.

The trick was getting a coding agent to do most of the mechanical work while I steered the architecture. I had `gpt-5.5` implement each layer while I provided the design constraints, which initially boiled down to:

* flat bytecode
* register-based execution
* no heap allocation for primitives
* a tree-walker fallback for anything weird

A few hours of thumbing through ancient books, interspersed with liberal swearing and infected by [WASM’s](/space/dev/wasm#webassembly-wasm) relative madness, eventually got me to a tiered execution engine:

![The final thing, in a very rough sketch](/space/blog/2026/09/01/2130/go-joker-tiered-execution-architecture.svg?v=57d56c4b4554) Go-Joker’s tiered execution pipeline, including WASM, typed IR, boxed IR and tree-walker fallbacks.

Each tier handles what it can and drops to the next for anything more complex. Early on, execution would start in the tree-walker and be promoted as the interpreter recognised patterns it could optimise, and the implementation grew progressively more intricate from there.

And since I needed something to compile, I went out and grabbed [The Computer Language Benchmarks Game](https://en.wikipedia.org/wiki/The_Computer_Language_Benchmarks_Game?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), which has a range of computational scenarios that resist trivial optimisation (to a degree), along with ready-made comparisons.

[

Phase 1: IR Bytecode
----------

](/space/blog/2026/09/01/2130#phase-1-ir-bytecode)

The first step, heavily inspired by [.NET](/space/dev/dotnet#net), was compiling hot loops and functions to flat bytecode–an intermediate representation with fixed-size opcodes, a value stack and no allocation for integer/float operations. This alone got `mandelbrot` from 450ms down to about 40ms. The key insight (which I stole from the JIT literature) was that most [Clojure](/space/dev/clojure#clojure-script) loops are either purely numeric or purely structural–they rarely mix–so you can have a typed path that handles `Int`/`Double` without boxing and a boxed path for everything else.

And my old JVM tricks also paid off: stripping `Int` and `Double` down to single-field structs (8 bytes, stack-allocable) cut allocations by half across the board. That is the kind of change an [LLM](/space/ai/llm#large-language-models) won’t suggest unless you ask very specifically, because it breaks the type hierarchy in ways that it “feels” are wrong until you measure.

[

Phase 2: WASM Compilation
----------

](/space/blog/2026/09/01/2130#phase-2-wasm-compilation)

The realisation that pure numeric loops could go *further* came when I noticed that [`wazero`](https://github.com/tetratelabs/wazero?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (a pure-[Go](/space/dev/golang#go-lang) [WebAssembly](/space/dev/wasm#webassembly-wasm) runtime) could JIT-compile [WASM](/space/dev/wasm#webassembly-wasm) to native code–with zero cgo, another requirement of mine. If the tree-walker detected a loop that was purely integer/float arithmetic, we could emit WASM bytecode for it, hand it to [`wazero`](https://github.com/tetratelabs/wazero?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and get native-speed execution (well, almost) without leaving the [Go](/space/dev/golang#go-lang) process.

This was huge fun: the arithmetic benchmarks went from 12ms (IR) to 0.24ms (WASM), giving what used to be a [Clojure](/space/dev/clojure#clojure-script) interpreter pretty much [Bun](/space/cli/bun)/[JavaScriptCore](/space/dev/javascript) speed. It’s limited–it only handles cases where every value is a known numeric type and there are no collection operations–but when it applies, it’s great.

[

Phase 3: Polishing
----------

](/space/blog/2026/09/01/2130#phase-3-polishing)

The rest was just grinding out the hotspots. Per-instance function compilation caches (`irGetFnProg`), capture-slot optimisation for closures (`captureSlotSet`), a `StringCursor` native type for zero-allocation string iteration (because, well, it was getting embarrassing to append stuff to strings…), transient vectors for non-escaping loop mutations and tail-call rewriting at parse time–I had to ask [`piclaw`](https://rcarmo.github.io/projects/piclaw/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to check the ordering, but this was all done by systematically going through the benchmarks.

Given my fondness for profiling, I wanted this thing to be self-diagnosing, so I asked `gpt-5.5` to add a runtime introspection namespace (`joker.runtime`) so scripts can inspect their own IR, [WASM](/space/dev/wasm#webassembly-wasm) output, escape analysis and allocation profiles.

By the end, I had some pretty nice results:

* [Mandelbrot](https://en.wikipedia.org/wiki/Mandelbrot_set?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com): \~0.095ms on [Joker’s](https://rcarmo.github.io/projects/go-joker?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) best path (\~68× faster than [Python](/space/dev/python))
* [N-body](https://en.wikipedia.org/wiki/N-body_problem?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com): \~0.006ms (\~133× faster than [Python](/space/dev/python))
* [Joker’s](https://rcarmo.github.io/projects/go-joker?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) best-path suite wins 12 of the 15 benchmarks; [Go](/space/dev/golang#go-lang) and [JavaScript](/space/dev/javascript) engines dominate the other three
* It beats [Python](/space/dev/python) and [Goja](https://github.com/dop251/goja?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) ([Go’s](/space/dev/golang#go-lang) [JavaScript](/space/dev/javascript) engine) on all 15

![benchmark comparison](/space/blog/2026/09/01/2130/go-joker-benchmark-comparison.svg?v=ca7e47c83add) Current CLBG and micro-benchmark results in milliseconds per operation; lower is better. [

Why This Matters (for me, at least)
----------

](/space/blog/2026/09/01/2130#why-this-matters-for-me-at-least)

The original goal wasn’t really to build a fast [Clojure](/space/dev/clojure#clojure-script) (well, not this fast, at least), but as usual I wandered off big time. Eventually I had to get back to what I wanted in the first place: an extension language for [`gi`](https://rcarmo.github.io/projects/gi/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) that:

* compiles into the binary (no external runtime)
* starts instantly (no [JVM](/space/dev/java), no [Node.js](https://nodejs.org/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com))
* is fast enough for real work (not just config parsing)
* has a REPL for interactive debugging
* can introspect its own execution

I now have all five. Scripts and extensions for [`gi`](https://rcarmo.github.io/projects/gi/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) can be written in [Clojure](/space/dev/clojure#clojure-script), stored in the [SQLite](/space/db/sqlite) database alongside everything else, and executed at speeds that range from “competitive with [Python](/space/dev/python)” to “competitive with JIT-compiled [JavaScript](/space/dev/javascript)”, depending on the workload.

I’m not doing anything with [`gi`](https://rcarmo.github.io/projects/gi/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) right now, but the above is close enough to the [LISP machine](/space/dev/lisp) dream that I still use [`go-joker`](https://github.com/rcarmo/go-joker?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) quite frequently.

[

The AI Angle
----------

](/space/blog/2026/09/01/2130#the-ai-angle)

Two days–that’s how long this took, from “[Joker](https://rcarmo.github.io/projects/go-joker?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is too slow” to “[Joker](https://rcarmo.github.io/projects/go-joker?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) beats [Python](/space/dev/python) on [Mandelbrot](https://en.wikipedia.org/wiki/Mandelbrot_set?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com).”

I could not have done this in two days without AI–the mechanical work of implementing 30+ IR opcodes, writing typed dispatch paths, plumbing [WASM](/space/dev/wasm#webassembly-wasm) emission, and generating benchmark harnesses would have taken weeks by hand.

But (and this is the interesting bit for me) I also could not have done it *with* AI alone–the architectural decisions (tiered execution, typed vs. boxed split, [WASM](/space/dev/wasm#webassembly-wasm) for numeric leaves, the fallback chain) came from knowing how the [JVM](/space/dev/java) and [.NET CLR](/space/dev/dotnet#net) work internally, remembering that I had a copy of [Smith & Nair](https://www.amazon.es/gp/product/1558609105/ref=as_li_tl?_encoding=UTF8&camp=3638&creative=24630&linkCode=ur2&tag=taoofmac-21&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and the [`wazero`](https://github.com/tetratelabs/wazero?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) source (kudos), and spending years thinking about what makes interpreters fast and (let’s face it) taking a few shortcuts.

All in all, I think this ratio of thinking to execution (and, by the way, [`go-joker`](https://github.com/rcarmo/go-joker?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) comes with a massive battery of tests I would never have thought of writing) is what I want to get out of most of my projects. It’s never going to be as popular as the [Bun rewrite](/space/links/2026/07/08/2310#rewriting-bun-in-rust) in [Rust](/space/dev/rust), but it was a lot of fun.