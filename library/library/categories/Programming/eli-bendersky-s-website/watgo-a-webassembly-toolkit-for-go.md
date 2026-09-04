+++
title = "watgo - a WebAssembly Toolkit for Go"
description = "I'm happy to announce the general availability of watgo - the WebAssembly Toolkit for Go. This project is similar to wabt (C++) or [wasm-tools](https://github.com/bytecodealliance/wasm-tools"
date = "2026-04-10T02:28:00Z"
url = "https://eli.thegreenplace.net/2026/watgo-a-webassembly-toolkit-for-go/"
author = "Eli Bendersky"
text = ""
lastupdated = "2026-04-10T10:24:01.286361173Z"
seen = false
+++

I'm happy to announce the general availability of [watgo](https://github.com/eliben/watgo) - the **W**eb**A**ssembly **T**oolkit for **G**o. This project is similar to [wabt](https://github.com/webassembly/wabt) (C++) or [wasm-tools](https://github.com/bytecodealliance/wasm-tools) (Rust), but in pure, zero-dependency Go.

watgo comes with a CLI and a Go API to parse WAT (WebAssembly Text), validate it, and encode it into WASM binaries; it also supports decoding WASM from its binary format.

At the center of it all is [wasmir](https://pkg.go.dev/github.com/eliben/watgo/wasmir) - a semantic representation of a WebAssembly module that users can examine (and manipulate). This diagram shows the functionalities provided by watgo:

![Block diagram showing the different parts of watgo; described in the next paragraph](https://eli.thegreenplace.net/images/2026/watgo-diagram.png)

* Parse: a parser from WAT to wasmir
* Validate: uses the official WebAssembly validation semantics to check that the module is well formed and safe
* Encode: emits wasmir into WASM binary representation
* Decode: read WASM binary representation into wasmir

CLI use case
----------

watgo comes with a CLI, which you can install by issuing this command:

```
go install github.com/eliben/watgo/cmd/watgo@latest

```

The CLI aims to be compatible with wasm-tools [[1]](#footnote-1), and I've already switched my [wasm-wat-samples](https://github.com/eliben/wasm-wat-samples) projects to use it; e.g. a command to parse a WAT file, validate it and encode it into binary format:

```
watgo parse stack.wat -o stack.wasm

```

API use case
----------

wasmir semantically represents a WASM module with an API that's easy to work with. Here's an example of using watgo to parse a simple WAT program and do some analysis:

```
package main

import (
  "fmt"

  "github.com/eliben/watgo"
  "github.com/eliben/watgo/wasmir"
)

const wasmText = `
(module
  (func (export "add") (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.add
  )
  (func (param f32 i32) (result i32)
    local.get 1
    i32.const 1
    i32.add
    drop
    i32.const 0
  )
)`

func main() {
  m, err := watgo.ParseWAT([]byte(wasmText))
  if err != nil {
    panic(err)
  }

  i32Params := 0
  localGets := 0
  i32Adds := 0

  // Module-defined functions carry a type index into m.Types. The function
  // body itself is a flat sequence of wasmir.Instruction values.
  for _, fn := range m.Funcs {
    sig := m.Types[fn.TypeIdx]
    for _, param := range sig.Params {
      if param.Kind == wasmir.ValueKindI32 {
        i32Params++
      }
    }

    for _, instr := range fn.Body {
      switch instr.Kind {
      case wasmir.InstrLocalGet:
        localGets++
      case wasmir.InstrI32Add:
        i32Adds++
      }
    }
  }

  fmt.Printf("module-defined funcs: %d\n", len(m.Funcs))
  fmt.Printf("i32 params: %d\n", i32Params)
  fmt.Printf("local.get instructions: %d\n", localGets)
  fmt.Printf("i32.add instructions: %d\n", i32Adds)
}

```

One important note: the WAT format supports several syntactic niceties that are flattened / canonicalized when lowered to wasmir. For example, all folded instructions are lowered to unfolded ones (linear form), function & type names are resolved to numeric indices, etc. This matches the validation and execution semantics of WASM and its binary representation.

These syntactic details are present in watgo in the textformat package (which parses WAT into an AST) and are removed when this is lowered to wasmir. The textformat package is kept internal at this time, but in the future I may consider exposing it publicly - if there's interest.

Testing strategy
----------

Even though it's still early days for watgo, I'm reasonably confident in its correctness due to a strategy of very heavy testing right from the start.

WebAssembly comes with a [large official test suite](https://github.com/WebAssembly/spec/), which is perfect for end-to-end testing of new implementations. The core test suite includes almost 200K lines of WAT files that carry several modules with expected execution semantics and a variety of error scenarios exercised. These live in specially designed [.wast files](https://github.com/WebAssembly/spec/tree/main/interpreter#scripts) and leverage a custom spec interpreter.

watgo hijacks this approach by using the official test suite for its own testing. A custom harness parses .wast files and uses watgo to convert the WAT in them to binary WASM, which is then executed by Node.js [[2]](#footnote-2); this harness is a significant effort in itself, but it's very much worth it - the result is excellent testing coverage. watgo passes the entire WASM spec core test suite.

Similarly, we leverage [wabt's interp test suite](https://github.com/WebAssembly/wabt/tree/main/test/interp) which also includes end-to-end tests, using a simpler Node-based harness to test them against watgo.

Finally, I maintain a collection of realistic program samples written in WAT in the [wasm-wat-samples repository](https://github.com/eliben/wasm-wat-samples); these are also used by watgo to test itself.

---

|[[1]](#footnote-reference-1)|Though not all of wasm-tools's functionality is supported yet.|
|----------------------------|--------------------------------------------------------------|

|[[2]](#footnote-reference-2)|To stick to a pure-Go approach also for testing, I originally tried using wazero for this, but had to give up because wazero doesn't support some of the recent WASM proposals that have already made it into the standard (most notably Garbage Collection).|
|----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|