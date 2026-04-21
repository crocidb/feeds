+++
title = "Slap: Fun Cat Lang... with a Borrow Checker?"
description = "Slap's true power is what it cannot do."
date = "2026-04-03T00:00:00Z"
url = "https://taylor.town/slap-000"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.116367295Z"
seen = true
+++

iframe { margin: 0 0 -1rem; }

<iframe src="https://taylor.town/flock.html" width="645" height="485" style="border:none;"></iframe>

Behold, [Slap](https://github.com/surprisetalk/slap)! It's a language chimera:

* [**terse**](#terse): tacit like APL, J, K
* [**safe**](#safe): strong linear type system like Rust
* [**small**](#small): simple spec like Lisp, Forth
* [**fast**](#fast): manual memory like C, Zig
* [**easy**](#easy): managed effects like Elm, Roc

Terse
----------

Slap is a stack language. Postfix syntax is ugly, but powerful:

```
-- twenty fibonacci numbers (no recursion)
0 1 20 (swap over plus) repeat drop
  6765 eq assert
```

I'll eventually add [Uiua](https://www.uiua.org)-esque glyphs so you can feel like a wizard:   
`0 1 20 (: ↷ +) ⍥ ↘ 2765 = !`   

Those who abhor tacit stack manipulation can use `let` instead:

```
-- sum of squares (tacit)
[1 2 3 4 5]
  (sqr) map sum
  55 eq assert

-- sum of squares (explicit)
[1 2 3 4 5]
  0 ('x let 'y let x x mul y plus) fold
  55 eq assert
```

Safe
----------

Slap's true power is what it *cannot* do.

Parametric types (à la [Hindley–Milner](https://en.wikipedia.org/wiki/Hindley–Milner_type_system)) prevent mismatched data:

```
[1] [2.0] cat
-- TYPE ERROR: type variable conflict
--   expected: int list
--   got:      float list
```

[Linear types](https://en.wikipedia.org/wiki/Substructural_type_system#Linear_type_systems) (i.e. Rust-like borrow checker) protect allocated memory from leakage, corruption, meddling, and abandonment. You cannot duplicate nor discard a pointer (box):

```
42 box dup
-- TYPE ERROR: dup requires copyable type, got box

42 box drop
-- TYPE ERROR: drop requires copyable type, got box
```

For boxes, you must `lend`, `mutate`, `clone`, or `free`:

```
-- borrow a read-only snapshot with lend
[1 2 3] box
  (len) lend
  3 eq assert free

-- mutate in place
[1 2 3] box
  (4 give) mutate
  (len) lend
  4 eq assert free

-- clone into two independent boxes
[1 2 3] box
  clone
    (4 give) mutate
    (len) lend
    4 eq assert free
  () lend
  3 eq assert free
```

This API prevents classic problems like double-free, use-after-free, and forgot-to-free.

Linear types are also great for file handles and thread coordination. Stay tuned!

Slap's stacks are flexible. You can safely use them as tuples or closures without confusing the type system:

```
-- it's a tuple
(1 2) apply plus
  3 eq assert

-- it's a closure
'make-adder ('n let (n plus)) def
  5 make-adder 3 swap apply
  8 eq assert

-- it's a function
(1 plus) (2 mul) compose (3 sub) compose (sqr) compose
  5 swap apply
  81 eq assert
```

In some languages you can declare function types. Typed stack languages have a similar concept called "stack effects". The Slap type-checker automatically infers these for you, but you may add them for extra clarity/enforcement:

```
-- double = n -> n * 2
'double (2 mul) def

-- square : int -> int
-- square = n -> n * n
'square (dup mul)
  [int lent in  int move out]
    effect check def
```

Slap's annotations are expressive enough to describe exotic stack effects:

```
-- no effect
'noop () [] effect check def

-- return multiple values
'hello-world ("hello" "world")
  [str move out  str move out]
    effect check def

-- linear parametric effect
'pal
  ((dup reverse cat) mutate)
  [ 'a list 't own in  
    'a list 't own out ]
    effect check def
```

Fast
----------

No garbage collection! No secret allocations! Everything sits on the stack (unless you send it to the heap in a `box`).

The stack is often slower than the heap. Slap's transparent semantics forces you to reason about such tradeoffs.

Slap has fast solutions to most of the first fifty Project Euler problems. Here are the first ten:

|   |       |                                              |                                                                                 |
|---|-------|----------------------------------------------|---------------------------------------------------------------------------------|
| 1 | 3 ms  |[problem](https://projecteuler.net/problem=1) |[solution](https://github.com/surprisetalk/slap/blob/main/examples/euler/1.slap) |
| 2 | 3 ms  |[problem](https://projecteuler.net/problem=2) |[solution](https://github.com/surprisetalk/slap/blob/main/examples/euler/2.slap) |
| 3 | 3 ms  |[problem](https://projecteuler.net/problem=3) |[solution](https://github.com/surprisetalk/slap/blob/main/examples/euler/3.slap) |
| 4 |102 ms |[problem](https://projecteuler.net/problem=4) |[solution](https://github.com/surprisetalk/slap/blob/main/examples/euler/4.slap) |
| 5 | 3 ms  |[problem](https://projecteuler.net/problem=5) |[solution](https://github.com/surprisetalk/slap/blob/main/examples/euler/5.slap) |
| 6 | 3 ms  |[problem](https://projecteuler.net/problem=6) |[solution](https://github.com/surprisetalk/slap/blob/main/examples/euler/6.slap) |
| 7 |542 ms |[problem](https://projecteuler.net/problem=7) |[solution](https://github.com/surprisetalk/slap/blob/main/examples/euler/7.slap) |
| 8 | 10 ms |[problem](https://projecteuler.net/problem=8) |[solution](https://github.com/surprisetalk/slap/blob/main/examples/euler/8.slap) |
| 9 | 40 ms |[problem](https://projecteuler.net/problem=9) |[solution](https://github.com/surprisetalk/slap/blob/main/examples/euler/9.slap) |
|10 |7298 ms|[problem](https://projecteuler.net/problem=10)|[solution](https://github.com/surprisetalk/slap/blob/main/examples/euler/10.slap)|
| … |   …   |                      …                       |                                        …                                        |

Small
----------

`slap.c` is \~2,000 miserable lines of C99.

Could be smaller too -- I'm convinced I can shave another \~500 lines without sacrificing readability or performance.

It's a lexer, a typechecker, and a stack evaluator.

If Slap's architecture can fit in my pea-sized brain, it will surely fit in yours too.

Easy
----------

Slap has pixels! Build with `make slap-sdl` (native) or `make slap-wasm` (browser) to get a 640x480 canvas with 2-bit grayscale.

The runtime and lo-fi aesthetics were inspired by [Uxn](https://wiki.xxiivv.com/site/uxn.html). Go check it out!

You can interact with your host system via efficient (and type-safe) (and memory-safe) [managed effects](https://medium.com/@kaw2k/managed-effects-and-elm-36b7fcd246a9):

```
'tick (handler1) on
'keydown (handler2) on
'mousedown (handler3) on
(render0) show
```

### Game of Life ###

<iframe src="https://taylor.town/life.html" width="645" height="485" style="border:none;"></iframe>

```
'cell ( H plus H mod W mul swap W plus W mod plus nth ) def

'neighbors (
  'cy let 'cx let 'gs let
  gs cx 1 sub cy 1 sub cell
  gs cx       cy 1 sub cell plus
  gs cx 1 plus cy 1 sub cell plus
  gs cx 1 sub cy       cell plus
  gs cx 1 plus cy       cell plus
  gs cx 1 sub cy 1 plus cell plus
  gs cx       cy 1 plus cell plus
  gs cx 1 plus cy 1 plus cell plus
) def

'step (
  'g let list
  0 'i let
  (i N lt) (
    i W divmod 'y let 'x let
    'g x y neighbors 'n let
    'g i nth 1 eq (n 2 eq n 3 eq or) (n 3 eq) if
    (1) (0) if give
    i 1 plus 'i let
  ) while
) def

'tick ( drop drawing 0 eq (step) () if ) on
(... render grid ...) show
```

### Dots ###

<iframe src="https://taylor.town/dots.html" width="645" height="485" style="border:none;"></iframe>

```
'tick (
  ...
  -- Flee from mouse
  dist2 10000 lt mx -1 neq and (
    vx dx sign 6 mul plus 'vx let
    vy dy sign 6 mul plus 'vy let
  ) () if
  -- When stopped, sneak back home
  vx abs vy abs plus 2 lt (
    hxs i get x sub 'hdx let
    hys i get y sub 'hdy let
    x hdx sign plus 'x let
    y hdy sign plus 'y let
  ) () if
) on
```

### Snake ###

<iframe src="https://taylor.town/snake.html" width="645" height="485" style="border:none;"></iframe>

```
'tick (
  drop 1 plus
  state 1 eq (
    dup 6 mod 0 eq (
      -- move head in current direction
      dir 0 eq (hx hy 1 sub) (
      dir 1 eq (hx 1 plus hy) (
      dir 2 eq (hx hy 1 plus) (
                hx 1 sub hy
      ) if) if) if
      -- wall/self collision → death
      -- eat food → grow, else drop tail
    ) () if
  ) () if
) on
```

### More ###

See [all the examples](https://github.com/surprisetalk/slap/tree/main/examples) for yourself!