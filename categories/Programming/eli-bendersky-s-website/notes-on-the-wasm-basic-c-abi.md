+++
title = "Notes on the WASM Basic C ABI"
description = 'The WebAssembly/tool-conventions repository contains "Conventions supporting interoperability between tools working with WebAssembly".Of special interest, in contains the [Basic C ABI](https://github.com/WebAssembly/too'
date = "2025-11-25T03:47:00Z"
url = "https://eli.thegreenplace.net/2025/notes-on-the-wasm-basic-c-abi/"
author = "Eli Bendersky"
text = ""
lastupdated = "2025-12-10T15:24:02.184676317Z"
seen = false
+++

The [WebAssembly/tool-conventions](https://github.com/WebAssembly/tool-conventions/tree/main) repository contains "Conventions supporting interoperability between tools working with WebAssembly".

Of special interest, in contains the [Basic C ABI](https://github.com/WebAssembly/tool-conventions/blob/main/BasicCABI.md) - an ABI for representing C programs in WASM. This ABI is followed by compilers like Clang with the wasm32 target. Rust is [also switching to this ABI](https://blog.rust-lang.org/2025/04/04/c-abi-changes-for-wasm32-unknown-unknown/) for extern "C" code.

This post contains some notes on this ABI, with annotated code samples and diagrams to help visualize what the emitted WASM code is doing. Hereafter, "the ABI" refers to this Basic C ABI.

Preface: the WASM value stack and linear memory
----------

In these notes, annotated WASM snippets often contain descriptions of the state of the WASM value stack at a given point in time. Unless otherwise specified, "TOS" refers to "Top Of value Stack", and the notation [ x y ] means the stack has y on top, with x right under it (and possibly some other stuff that's not relevant to the discussion under x); in this notation, the stack grows "to the right".

The WASM value stack has no linear memory representation and cannot be addressed, so it's meaningless to discuss whether the stack grows towards lower or higher addresses. The value stack is simply an abstract stack, where values can be pushed onto or popped off its "top".

Whenever addressing is required, the ABI specifies explicitly managing a separate stack in linear memory. This stack is very similar to how stacks are managed in hardware assembly languages (except that in the ABI this stack pointer is held in a global variable, and is not a special register), and it's called the "linear stack".

Scalar parameters and returns
----------

By "scalar" I mean basic C types like int, double or char. For these, using the WASM value stack is sufficient, since WASM functions can accept an arbitrary number of scalar parameters.

This C function:

```
int add_three(int x, int y, int z) {
  return x + y + z;
}

```

Will be compiled into something like:

```
(func $add_three (param i32 i32 i32) (result i32)
  local.get 1     ;; [ y ]
  local.get 0     ;; [ y  x ]
  i32.add         ;; [ x+y ]
  local.get 2     ;; [ x+y  z ]
  i32.add         ;; [ x+y+z ]
)

```

And can be called by pushing three values onto the stack and invoking call $add\_three.

The ABI specifies that all integral types 32-bit and smaller will be passed as i32, with the smaller types appropriately sign or zero extended. For example, consider this C function:

```
char add_three_chars(char x, char y, char z) {
  return x + y + z;
}

```

It's compiled to the almost same code as add\_three:

```
(func $add_three_chars (param i32 i32 i32) (result i32)
  local.get 1
  local.get 0
  i32.add
  local.get 2
  i32.add
  i32.extend8_s
)

```

Except the last i32.extend8\_s, which takes the lowest 8 bits of the value on TOS and sign-extends them to the full i32 (effectively ignoring all the higher bits). Similarly, when $add\_three\_chars is called, each of its parameters goes through i32.extend8\_s.

There are additional oddities that we won't get deep into, like passing \_\_int128 values via two i64 parameters.

Pointers
----------

C pointers are just scalars, but it's still educational to review how they are handled in the ABI. Pointers to any type are passed in i32 values; the compiler knows they are pointers, though, and emits the appropriate instructions. For example:

```
int add_indirect(int x, int y, int* sum) {
    *sum = x + y;
    return *sum;
}

```

Is compiled to:

```
(func $add_indirect (param i32 i32 i32) (result i32)
  local.get 2         ;; [ ptr_sum ]
  local.get 1         ;; [ ptr_sum  y ]
  local.get 0         ;; [ ptr_sum  y  x ]
  i32.add             ;; [ ptr_sum  x+y ]
  local.tee 0         ;; x <- x+y, leaving stack intact
  i32.store           ;; store x+y into *ptr_sum
  local.get 0         ;; [ x+y ] for returning
)

```

Recall that in WASM, there's no difference between an i32 representing an address in linear memory and an i32 representing just a number. i32.store expects [ addr value ] on TOS, and does \*addr = value.

Note that the x parameter isn't needed any longer after the sum is computed, so it's reused later on to hold the return value. WASM parameters are treated just like other locals (as in C).

Passing parameters through linear memory
----------

According to the ABI, while scalars and single-element structs or unions are passed to a callee via WASM function parameters (as shown above), for larger aggregates the compiler utilizes linear memory.

Specifically, each function gets a "frame" in a region of linear memory allocated for the linear stack. This region grows downwards from high to low addresses [[1]](#footnote-1), and the global $\_\_stack\_pointer points at the bottom of the frame:

![WASM C ABI linear stack](https://eli.thegreenplace.net/images/2025/wasm-c-abi-linear-stack.png)

Consider this code:

```
struct Pair {
    unsigned x;
    unsigned y;
};

__attribute__((noinline))
unsigned pair_calculate(struct Pair pair) {
    return 7*pair.x + 3*pair.y;
}

unsigned do_work(unsigned x, unsigned y){
    struct Pair pp = {.x = x, .y = y};
    return pair_calculate(pp);
}

```

When do\_work is compiled to WASM, prior to calling pair\_calculate it copies pp into a location in linear memory, and passes the address of this location to pair\_calculate. This location is on the linear stack, which is maintained using the $\_\_stack\_pointer global. Here's the compiled WASM for do\_work (I also gave its local variable a meaningful name, for readability):

```
(func $do_work (param i32 i32) (result i32)
  (local $sp i32)
  global.get $__stack_pointer
  i32.const 16
  i32.sub
  local.tee 2                   ;; sp <- __stack_pointer - 16
  global.set $__stack_pointer   ;; update __stack_pointer as well
  local.get 2
  local.get 1
  i32.store offset=12           ;; mem[sp+12] = y
  local.get 2
  local.get 0
  i32.store offset=8            ;; mem[sp+8] = x
  local.get 2                   ;; [ sp ]
  local.get 2                   ;; [ sp  sp ]

  ;; Do a 64-bit load from mem[sp+8], this loads the entire pair into
  ;; a single i64.
  i64.load offset=8 align=4
  i64.store                     ;; mem[sp] = pair-as-i64
  local.get 2                   ;; [ sp ]
  call $pair_calculate          ;; call pair_calculate, passing it sp
  local.set 1                   ;; x = result
  local.get 2                   ;; [ sp ]
  i32.const 16
  i32.add                       ;; [ sp+16 ]
  global.set $__stack_pointer   ;; __stack_pointer back to its original value
  local.get 1                   ;; [ x ] for return
)

```

Some notes about this code:

* There are two instance of the pair pp in linear memory prior to the call to pair\_calculate: the original one from the initialization statement (at offset 8), and a copy created for passing into pair\_calculate (at offset 0). Theoretically, as pp is unused used after the call, the compiler could do better here and keep only a single copy.
* The stack pointer is decremented by 16, and restored at the end of the function.
* The first few instructions - where the stack pointer is adjusted - are usually called the *prologue* of the function. In the same vein, the last few instructions where the stack pointer is reset back to where it was at the entry are called the *epilogue*.

Before pair\_calculate is called, the linear stack looks like this:

![WASM C ABI linear stack view at entry to pair_calculate](https://eli.thegreenplace.net/images/2025/wasm-c-abi-passing-pair.png)

Following the ABI, the code emitted for pair\_calculate takes Pair\* (by reference, instead of by value as the original C code):

```
(func $pair_calculate (param i32) (result i32)
  local.get 0           ;; [ addr ]

  ;; Recall that what's stored at mem[addr] is a pair, with 'x', followed by 'y'.
  i32.load offset=4     ;; [ pair.y ]
  i32.const 3
  i32.mul               ;; [ 3*pair.y ]
  local.get 0
  i32.load              ;; [ 3*pair.y  pair.x ]
  i32.const 7
  i32.mul               ;; [ 3*pair.y  7*pair.x ]
  i32.add               ;; [ 3*pair.y+7*pair.x ]
)

```

Each function that needs linear stack space is responsible for adjusting the stack pointer and restoring it to its original place at the end. This naturally enables nested function calls; suppose we have some function a calling function b which, in turn, calls function c, and let's assume all of these need to allocate space on the linear stack. This is how the linear stack looks after c's prologue:

![WASM C ABI linear stack showing nested frames](https://eli.thegreenplace.net/images/2025/wasm-c-abi-nested-frames.png)

Since each function knows how much stack space it has allocated, it's able to properly restore $\_\_stack\_pointer to the bottom of its caller's frame before returning.

Returning values through linear memory
----------

What about returning values of aggregate types? According to the ABI, these are also handled indirectly; a pointer parameter is *prepended* to the parameter list of the function. The function writes its return value into this address.

The following function:

```
struct Pair make_pair(unsigned x, unsigned y) {
  struct Pair pp = {.x = x, .y = y};
  return pp;
}

```

Is compiled to:

```
;; Note that the WASM function has three parameters an no return values.
;; The first parameter (local 0) is the address where it should store its
;; return value.
(func $make_pair (param i32 i32 i32)
  local.get 0
  local.get 2
  i32.store offset=4      ;; ret_addr[4] = y
  local.get 0
  local.get 1
  i32.store               ;; ret_addr[0] = x
)

```

Here's a function that calls it:

```
unsigned do_work(unsigned x, unsigned y) {
  struct Pair pp = make_pair(x, y);
  return 7*pp.x + 3*pp.y;
}

```

And the corresponding WASM:

```
(func $do_work (param i32 i32) (result i32)
  ;; local 2 to hold the address for make_pair's return value.
  (local i32)
  global.get $__stack_pointer   ;; sp <- __stack_pointer - 16
  i32.const 16
  i32.sub
  local.tee 2                   ;; save sp in local 2
  global.set $__stack_pointer
  local.get 2
  i32.const 8
  i32.add                       ;; [ sp+8 ]
  local.get 0                   ;; [ sp+8  x ]
  local.get 1                   ;; [ sp+8  x  y ]

  ;; make_pair is called with three parameters: the address for where to
  ;; store its return pair, x and y.
  call $make_pair
  local.get 2
  i32.load offset=8
  local.set 1                   ;; local 1 = pp.x
  local.get 2
  i32.load offset=12
  local.set 0                   ;; local 0 = pp.y
  local.get 2
  i32.const 16
  i32.add
  global.set $__stack_pointer   ;; __stack_pointer back to its original value
  local.get 0
  i32.const 3
  i32.mul                       ;; [ 3*pp.y ]
  local.get 1
  i32.const 7
  i32.mul                       ;; [ 3*pp.y  7*pp.x ]
  i32.add                       ;; [ 3*pp.y+7*pp.x ]
)

```

Note that this function only uses 8 bytes of its stack frame, but allocates 16; this is because the ABI dictates 16-byte alignment for the stack pointer.

Advanced topics
----------

There are some advanced topics mentioned in the ABI that these notes don't cover (at least for now), but I'll mention them here for completeness:

* "Red zone" - leaf functions have access to 128 bytes of [red zone](https://eli.thegreenplace.net/2011/09/06/stack-frame-layout-on-x86-64) below the stack pointer. I found this difficult to observe in practice [[2]](#footnote-2). Since we don't issue system calls directly in WASM, it's tricky to conjure a realistic leaf function that requires the linear stack (instead of just using WASM locals).
* A separate frame pointer (global value) to be used for functions that require dynamic stack allocation (such as using [C's VLAs](https://en.wikipedia.org/wiki/Variable-length_array)).
* A separate base pointer to be used for functions that require alignment \> 16 bytes on the stack.

---

|[[1]](#footnote-reference-1)|This is similar [to x86](https://eli.thegreenplace.net/2011/02/04/where-the-top-of-the-stack-is-on-x86/). For the WASM C ABI, a good reason is provided for the direction: WASM load and store instructions have an *unsigned* constant called offset that can be used to add a positive offset to the address parameter without extra instructions.<br/><br/>Since $\_\_stack\_pointer points to the lowest address in the frame, these offsets can be used to efficiently access any value on the stack.|
|----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

|[[2]](#footnote-reference-2)|If you have a nice example showing it using Clang/LLVM, please drop me a note!|
|----------------------------|------------------------------------------------------------------------------|