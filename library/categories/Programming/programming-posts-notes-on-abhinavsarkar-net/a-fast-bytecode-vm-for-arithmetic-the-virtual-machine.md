+++
title = "A Fast Bytecode VM for Arithmetic: The Virtual Machine"
description = "In this series of posts, we write a fast bytecode compiler and a virtual machine for arithmetic in Haskell. We explore the following topics:* [Parsing arithmetic expressions to Abstract Syntax Trees (ASTs).](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/parsing-e"
date = "2025-10-21T00:00:00Z"
url = "https://abhinavsarkar.net/posts/arithmetic-bytecode-vm/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.461642465Z"
seen = false
+++

In this series of posts, we write a fast bytecode compiler and a virtual machine for arithmetic in Haskell. We explore the following topics:

* [Parsing arithmetic expressions to Abstract Syntax Trees (ASTs).](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed#parsing-expressions)
* [Unit testing for our parser.](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed#testing-the-parser)
* [Interpreting ASTs.](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed#the-ast-interpreter)
* [Compiling ASTs to bytecode.](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-compiler/?mtm_campaign=feed#the-compiler)
* [Disassembling and decompiling bytecode.](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-compiler/?mtm_campaign=feed#the-decompiler)
* [Unit testing for our compiler.](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-compiler/?mtm_campaign=feed#testing-the-compiler)
* Property-based testing for our compiler.
* Efficiently executing bytecode in a virtual machine (VM).
* Unit testing and property-based testing for our VM.
* Benchmarking our code to see how the different passes perform.
* All the while keeping an eye on performance.

In this final post, we write the virtual machine that executes our bytecode, and benchmark it.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm/?mtm_campaign=feed).

This post is a part of the series: **A Fast Bytecode VM for Arithmetic**.

1. [The Parser](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed)
2. [The Compiler](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-compiler/?mtm_campaign=feed)
3. **The Virtual Machine** 👈

### Contents ###

1. [Introduction](#introduction)
2. [Testing the Compiler](#testing-the-compiler)
3. [The Virtual Machine](#the-virtual-machine)
4. [Testing the ](#testing-the-vm)[VM](<%Virtual Machine>)
5. [Benchmarking the ](#benchmarking-the-vm)[VM](<%Virtual Machine>)
6. [Benchmarking Against C](#benchmarking-against-c)
7. [Future Directions](#future-directions)
8. [Conclusion](#conclusion)

Introduction[#](#introduction)
----------

[Bytecode](https://en.wikipedia.org/wiki/Bytecode) *[Virtual Machines](https://en.wikipedia.org/wiki/Virtual_machine#Process_virtual_machines)* (VMs) are known to be faster than AST-walking interpreters. That’s why many real-world programming languages these days are implemented with bytecode VMs, for example, [Java](https://en.wikipedia.org/wiki/Java_(programming_language)), [Python](https://en.wikipedia.org/wiki/Python_(programming_language)), [PHP](https://en.wikipedia.org/wiki/PHP), and [Raku](https://en.wikipedia.org/wiki/Raku). The reason is partially, the flat and compact nature of bytecode itself. But VMs also have a few other tricks up their sleeves that make them highly performant. In this post, we write a VM for our arithmetic expression language, and explore some of these performance tricks.

But first, we need to finish a pending task.

Testing the Compiler[#](#testing-the-compiler)
----------

We wrote [some unit tests](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-compiler/?mtm_campaign=feed#testing-the-compiler]) for our compiler in the last post, but unit tests cover only the cases we can think of. A compiler has to deal with any input, and with just unit tests we cannot be sure of its correctness.

To test our compiler and other components for correctness, we use the [QuickCheck](https://hackage.haskell.org/package/QuickCheck) library. QuickCheck is a *Property-based Testing* framework. The key idea of property-based testing is to write properties of our code that hold true for any input, and then to automatically generate a large number of arbitrary inputs and make sure that the properties are indeed true for them[<sup>1</sup>](#fn1)[<sup>2</sup>](#fn2). Since we are writing an arithmetic expression parser/compiler/VM, we generate arbitrary expression ASTs, and use them to assert certain invariants of our program.

With QuickCheck, we write generators for the inputs for our tests. These generators are composable just like parser combinators are. We use the library provided generators to write small generators that we combine to create larger ones. Let’s start:

```
numGen :: Q.Gen Expr
numGen = Num <$> Q.arbitrary

varGen :: Set.Set Ident -> Q.Gen Expr
varGen vars = Var <$> Q.elements (Set.toList vars)

identGen :: Q.Gen Ident
identGen =
  mkIdent
    <$> ( (:)
            <$> Q.elements lower
            <*> Q.resize 5 (Q.listOf1 $ Q.elements validChars)
        ) `Q.suchThat` (not . isReservedKeyword . BSC.pack)
  where
    lower = ['a' .. 'z']
    validChars = lower <> ['A' .. 'Z']
```

 ArithVMLib.hs

First come the basic generators:

* `numGen` generates number expressions by using QuickCheck’s built-in `arbitrary` function.
* `varGen` generates variable expressions by choosing from the set of passed valid variable names.
* `identGen` generates valid identifiers from combinations of letters a—z and A—Z, and discarding ones that are reserved keywords.

Moving on to composite generators:

```
binOpGen :: Set.Set Ident -> Int -> Q.Gen Expr
binOpGen vars size =
  BinOp
    <$> Q.chooseEnum (Add, Div)
    <*> exprGen vars (size `div` 2)
    <*> exprGen vars (size `div` 2)

letGen :: Set.Set Ident -> Int -> Q.Gen Expr
letGen vars size = do
  x <- identGen
  let vars' = Set.insert x vars
  Let x <$> exprGen vars (size `div` 2) <*> exprGen vars' (size `div` 2)

exprGen :: Set.Set Ident -> Int -> Q.Gen Expr
exprGen vars size
  | size < 5 = Q.frequency [(4, Q.oneof baseGens), (1, Q.oneof compositeGens)]
  | otherwise = Q.frequency [(1, Q.oneof baseGens), (4, Q.oneof compositeGens)]
  where
    baseGens = numGen : [varGen vars | not $ Set.null vars]
    compositeGens = [binOpGen vars size, letGen vars size]
```

 ArithVMLib.hs

* `binOpGen` generates binary expressions with arbitrary binary operations. It recursively calls `exprGen` to generate the operands. The `size` parameter controls the complexity of the generated expressions, and we half the size of operands (and so on recursively) so that we don’t end up with infinitely large expressions.

* `letGen` generates `Let` expressions by generating an identifier, and then generating the assignment and body expressions recursively. We do the same trick of halving sizes here as well. Notice that the assignment is generated with the passed variable names in scope, whereas the body is generated with the new identifier added to the scope.

* `exprGen` uses the above generators to generate all kinds of expressions. At smaller sizes, it prefers to generate base expressions, while at larger sizes, it prefers composite ones. Due to the careful recursive halving of size in composite generators, we end up with expressions of finite sizes.

Finally, we have some instances of QuickCheck’s `Arbitrary` type class to tie everything together:

```
instance Q.Arbitrary Expr where
  arbitrary = Q.sized $ exprGen Set.empty
  shrink = Q.genericShrink

instance Q.Arbitrary Ident where
  arbitrary = identGen

instance Q.Arbitrary Op where
  arbitrary = Q.chooseEnum (Add, Div)
```

 ArithVMLib.hs

We can apply them in GHCi:

```
> :set -XTypeApplications
> Q.sample $ Q.arbitrary @Expr
0
((let jgSg = 2 in (-2 - -2)) + -2)
2
(0 / 1)
(-11 / -13)
((let kpuS = 10 in 31) + (let jChmZV = -12 in jChmZV))
((54 * -55) * (let ohLSk = 29 in -45))
(-102 - (-119 * -125))
(-234 - (32 / -217))
(let kVrB = (-261 * 238) in ((let qdz = 228 in 347) + 18))
(let uMMdXH = ((let ePUi = 842 in ePUi) - (let zrkM = (let vwH = ((9 + -987) / -487) in (let ylKowr = vwH in vwH)) in zrkM)) in (((uMMdXH / -836) / uMMdXH) - (let qkK = uMMdXH in qkK)))
```

Notice that the generated samples increase in complexity. With the generators in place, we define our properties next. Let’s test our parser first:

```
prop_print_ast_then_parse_returns_same_ast :: Spec
prop_print_ast_then_parse_returns_same_ast =
  prop "Property: Print AST then parse returns same AST" $ \expr ->
    parse (BSC.pack $ show expr) == Right expr
```

 ArithVMSpec.hs

This property is a simple round-trip test for the parser and printer: we parse the string representation of a generated expression, and assert that it gives back the same expression.

The second property is a more involved round-trip test for the compiler and decompiler:

```
prop_disassemble_bytecode_then_decompile_then_compile_returns_same_bytecode :: Spec
prop_disassemble_bytecode_then_decompile_then_compile_returns_same_bytecode =
  prop ( "Property: Disassemble bytecode then decompile then compile"
         <> " returns same bytecode" ) $ \expr ->
    case compile (sizedExpr expr) of
      Left _ -> Q.discard
      Right bytecode ->
        (disassemble bytecode >>= (decompile >>> fmap sizedExpr) >>= compile)
          == Right bytecode
```

 ArithVMSpec.hs

This asserts that compiling an expression, then disassembling and decompiling it, and finally compiling it again should result in the original bytecode[<sup>3</sup>](#fn3).

This requires a helper function to get the size of an expression:

```
sizedExpr :: Expr -> SizedExpr
sizedExpr expr = case expr of
  Num _ -> (expr, 3)
  Var _ -> (expr, 2)
  BinOp _ a b -> (expr, snd (sizedExpr a) + snd (sizedExpr b) + 1)
  Let _ a b -> (expr, snd (sizedExpr a) + snd (sizedExpr b) + 1)
```

 ArithVMLib.hs

We run these tests in a later section. This ends our short detour.

The Virtual Machine[#](#the-virtual-machine)
----------

Now for the main event: the virtual machine. Our VM is a stack-based machine that operates on a stack of values and executes the compiled bytecode. Our goal is to be as fast as possible. For a quick reminder, these are our `Opcode`s:

```
data Opcode
  = OPush !Int16        -- 0
  | OGet !Word8         -- 1
  | OSwapPop            -- 2
  | OAdd                -- 3
  | OSub                -- 4
  | OMul                -- 5
  | ODiv                -- 6
  deriving (Show, Read, Eq, Generic)

```

 ArithVMLib.hs

And now, the heart of the VM:

```
interpretBytecode :: Bytecode -> Result Int16
interpretBytecode = interpretBytecode' defaultStackSize

interpretBytecode' :: Int -> Bytecode -> Result Int16
interpretBytecode' stackSize bytecode = runST $ runExceptT $ do
  stack <- PA.newPinnedPrimArray stackSize
  sp <- go 0 0 stack
  checkStack InterpretBytecode stackSize sp
  PA.readPrimArray stack 0
  where
    !size = BS.length bytecode

    go sp ip _ | ip == size = pure sp
    go !sp !ip stack = do
      let opcode = readInstr bytecode ip
      if
        | sp >= stackSize -> throwInterpretError "Stack overflow"
        | sp < 0 -> throwInterpretError "Stack underflow"
        | sp < 2 && opcode >= 2 -> throwInsufficientElementsError
        | opcode == 0 && ip + 2 >= size -> throwIPOOBError $ ip + 2
        | opcode == 1 && ip + 1 >= size -> throwIPOOBError $ ip + 1
        | otherwise -> case opcode of
            0 -> do                 -- OPush
              PA.writePrimArray stack sp $ readInstrArgInt16 bytecode ip
              go (sp + 1) (ip + 3) stack
            1 -> do                 -- OGet
              let i = fromIntegral $ readInstrArgWord8 bytecode ip
              if i < sp
                then do
                  PA.copyMutablePrimArray stack sp stack i 1
                  go (sp + 1) (ip + 2) stack
                else throwInterpretError $
                  "Stack index " <> show i <> " out of bound " <> show (sp - 1)
            2 -> do                 -- OSwapPop
              PA.copyMutablePrimArray stack (sp - 2) stack (sp - 1) 1
              go (sp - 1) (ip + 1) stack
            3 -> interpretBinOp (+) -- OAdd
            4 -> interpretBinOp (-) -- OSub
            5 -> interpretBinOp (*) -- OMul
            6 -> do                 -- ODiv
              b <- PA.readPrimArray stack $ sp - 1
              a <- PA.readPrimArray stack $ sp - 2
              when (b == 0) $ throwInterpretError "Division by zero"
              when (b == (-1) && a == minBound) $
                throwInterpretError "Arithmetic overflow"
              PA.writePrimArray stack (sp - 2) $ a `div` b
              go (sp - 1) (ip + 1) stack
            n -> throwInterpretError $
              "Invalid bytecode: " <> show n <> " at: " <> show ip
      where
        interpretBinOp op = do
          b <- PA.readPrimArray stack $ sp - 1
          a <- PA.readPrimArray stack $ sp - 2
          PA.writePrimArray stack (sp - 2) $ a `op` b
          go (sp - 1) (ip + 1) stack
        {-# INLINE interpretBinOp #-}

        throwIPOOBError ip = throwInterpretError $
          "Instruction index " <> show ip <> " out of bound " <> show (size - 1)

        throwInsufficientElementsError =
          throwInterpretError "Not enough elements to execute operation"

        throwInterpretError = throwError . Error InterpretBytecode
```

 ArithVMLib.hs

The `interpretBytecode'` function is where the action happens. It is way more complex than [`interpretAST`](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed#the-ast-interpreter), but the complexity has a reason, namely performance.

`interpretBytecode'` runs inside the [`ST`](https://hackage.haskell.org/package/base/docs/Control-Monad-ST.html#t:ST) monad wrapped with the [`ExceptT`](https://hackage.haskell.org/package/mtl/docs/Control-Monad-Except.html#t:ExceptT) monad transformer. `ST` monad lets us use mutable data structures locally while ensuring the function remains externally pure. `ExceptT` monad transformer adds support for throwing and propagating errors in a pure manner.

We use [`PrimArray`](https://hackage.haskell.org/package/primitive/docs/Data-Primitive-PrimArray.html) for our stack, which is a mutable array of unboxed primitive types, in our case an array of [`Int16`](https://hackage.haskell.org/package/base/docs/Data-Int.html#t:Int16) values. Using a mutable unboxed array is much faster than using an immutable and/or boxed one like [`Seq`](https://hackage.haskell.org/package/containers/docs/Data-Sequence.html#t:Seq) or [`Vector`](https://hackage.haskell.org/package/vector/docs/Data-Vector.html) due to reduced allocation and/or pointer chasing.

The core of the VM is the `go` function, a tight, tail-recursive loop that GHC compiles into an efficient machine loop, as we see later. It takes the stack pointer (`sp`), instruction pointer (`ip`)[<sup>4</sup>](#fn4), and the stack as arguments.

At the top of each loop, a block of guard clauses checks for stack overflow, underflow, and other error conditions before branching on the current opcode. Placing these checks at the top instead of inside the opcode cases is a deliberate choice. This may make the code slightly harder to understand, but it significantly improves the performance of the loop by moving all branching at the beginning of the loop, resulting in code that is more friendly to the CPU’s *[Branch Predictor](https://en.wikipedia.org/wiki/Branch_predictor)*. Also notice how we reduce the number of checks by working with a range of opcodes at once in the `opcode >= 2` guard. The checks are also sorted so as to be most performant, guided by profiling and benchmarking[<sup>5</sup>](#fn5).

The handling of each opcode is actually pretty straightforward. We use different `PrimArray` specific operations to read and write to the stack, while taking care of doing the required bound and arithmetic checks. We also use the `readInstr*` functions that we wrote [earlier](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-compiler/?mtm_campaign=feed#cb7-1).

After carrying out each operation, we reenter the loop by calling it tail-recursively with the right stack and instruction pointers. Finally, we make sure that the execution terminated correctly by checking the state of the stack, and return its first element.

### Peeking Under the Hood: GHC Core[#](#peeking-under-the-hood-ghc-core) ###

We see [later](#benchmarking-the-vm) that the VM is quite fast, but how does GHC achieve this performance? To see the magic, we can look at GHC’s intermediate language: [Core](https://hackage.haskell.org/package/ghc/docs/GHC-Core.html). Core is a simpler functional language than Haskell to which GHC compiles Haskell. The simpler nature of Core makes it easier for GHC to optimize it, and compile it further. We can get the Core code for a program by compiling with the GHC option `-ddump-simpl`.

The actual Core code for our VM is too verbose to show here, but here is a simplified C-like pseudo-code version of our `go` loop:

```
$wgo (stack_addr, ip, sp) {
  if (ip == bytecode_size) {
    return sp;
  }
  if (sp >= stack_size) {
    throw "Stack Overflow";
  }
  if (sp < 0) {
    throw "Stack Underflow";
  }

  opcode = read_byte_at(bytecode_addr, ip);
  // ... other checks ...

  switch (opcode) {
    case 0: // OPush
      val = read_int16_at(bytecode_addr, ip + 1);
      write_int16_at(stack_addr, sp, val);
      jump $wgo(stack_addr, ip + 3, sp + 1);

    case 3: // OAdd
      val2 = read_int16_at(stack_addr, sp - 1);
      val1 = read_int16_at(stack_addr, sp - 2);
      write_int16_at(stack_addr, sp - 2, val1 + val2);
      jump $wgo(stack_addr, ip + 1, sp - 1);

    // ... other cases ...
  }
}
```

A few key optimizations are worth pointing out:

1. **The loop:** The tail-recursive `go` function is compiled into a proper loop. The `jump $wgo(...)` instruction is effectively a `goto`, which means there’s no function call overhead for each iteration of the VM loop.
2. **Unboxing:** The Core code is full of primitive, unboxed types like `Int#`, `Addr#`, and `Word#`, and operations on them. These are raw machine integers and memory addresses, not boxed Haskell objects. This means operations on them are as fast as they would be in C. The stack operations are not function calls on a `PrimArray` instance, but primitive memory reads and writes on a raw memory address `stack_addr`.
3. **Inlining:** The `interpretBinOp` helper function is completely inlined into the main loop. For `OAdd`, the code for reading two values, adding them, and writing the result is laid out inline, and works on unboxed values and array address.

In short, GHC has turned our high-level, declarative Haskell code into a low-level loop that looks remarkably like one we would write in C. We get the safety and expressiveness of Haskell, while GHC does the heavy lifting to produce highly optimized code. It’s the best of both worlds!

Testing the VM[#](#testing-the-vm)
----------

We must test the VM to make sure it works correctly[<sup>6</sup>](#fn6). We reuse [the success and failure tests](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed#testing-the-interpreter) for the AST interpreter, as the bytecode interpreter should yield the same result:

```
bytecodeInterpreterSpec :: Spec
bytecodeInterpreterSpec = describe "Bytecode interpreter" $ do
  forM_ astInterpreterSuccessTests $ \(input, result) ->
    it ("interprets: \"" <> BSC.unpack input <> "\"") $ do
      parseCompileInterpret input `shouldBe` Right result

  forM_ errorTests $ \(input, err) ->
    it ("fails for: \"" <> BSC.unpack input <> "\"") $ do
      parseCompileInterpret input `shouldSatisfy` \case
        Left (Error InterpretBytecode msg) | err == msg -> True
        _ -> False
  where
    parseCompileInterpret = parseSized >=> compile >=> interpretBytecode' 7

    errorTests =
      [ ("1/0", "Division by zero"),
        ("-32768 / -1", "Arithmetic overflow"),
        ( "let a = 0 in let b = 0 in let c = 0 in let d = 0 in let e = 0 in "
            <> "let f = 0 in a + b + c + d + e + f",
          "Stack overflow"
        )
      ]

prop_interpret_ast_returns_same_result_as_compile_assemble_then_interpret_bytecode ::
  Spec
prop_interpret_ast_returns_same_result_as_compile_assemble_then_interpret_bytecode =
  prop ( "Property: Interpret AST returns same result as compile"
          <> " then interpret bytecode" ) $ \expr ->
    interpretAST expr == (compile (sizedExpr expr) >>= interpretBytecode)
```

 ArithVMSpec.hs

We also add a property-based test this time: for any given expression, interpreting the AST should produce the same result as compiling it to bytecode and executing it in the VM[<sup>7</sup>](#fn7).

Our test suite is complete now:

```
main :: IO ()
main = hspec $ do
  parserSpec
  astInterpreterSpec
  compilerSpec
  prop_print_ast_then_parse_returns_same_ast
  prop_disassemble_bytecode_then_decompile_then_compile_returns_same_bytecode
  bytecodeInterpreterSpec
  prop_interpret_ast_returns_same_result_as_compile_assemble_then_interpret_bytecode
```

 ArithVMSpec.hs

And finally, we run all tests together:

<details> <summary> Test run </summary>

```
$ cabal test -O2
Running 1 test suites...
Test suite specs: RUNNING...

Parser
  parses: "1 + 2 - 3 * 4 + 5 / 6 / 0 + 1" [✔]
  parses: "1+2-3*4+5/6/0+1" [✔]
  parses: "1 + -1" [✔]
  parses: "let x = 4 in x + 1" [✔]
  parses: "let x=4in x+1" [✔]
  parses: "let x = 4 in let y = 5 in x + y" [✔]
  parses: "let x = 4 in let y = 5 in x + let z = y in z * z" [✔]
  parses: "let x = 4 in (let y = 5 in x + 1) + let z = 2 in z * z" [✔]
  parses: "let x=4in 2+let y=x-5in x+let z=y+1in z/2" [✔]
  parses: "let x = (let y = 3 in y + y) in x * 3" [✔]
  parses: "let x = let y = 3 in y + y in x * 3" [✔]
  parses: "let x = let y = 1 + let z = 2 in z * z in y + 1 in x * 3" [✔]
  fails for: "" [✔]
  fails for: "1 +" [✔]
  fails for: "1 & 1" [✔]
  fails for: "1 + 1 & 1" [✔]
  fails for: "1 & 1 + 1" [✔]
  fails for: "(" [✔]
  fails for: "(1" [✔]
  fails for: "(1 + " [✔]
  fails for: "(1 + 2" [✔]
  fails for: "(1 + 2}" [✔]
  fails for: "66666" [✔]
  fails for: "-x" [✔]
  fails for: "let 1" [✔]
  fails for: "let x = 1 in " [✔]
  fails for: "let let = 1 in 1" [✔]
  fails for: "let x = 1 in in" [✔]
  fails for: "let x=1 inx" [✔]
  fails for: "letx = 1 in x" [✔]
  fails for: "let x ~ 1 in x" [✔]
  fails for: "let x = 1 & 2 in x" [✔]
  fails for: "let x = 1 inx" [✔]
  fails for: "let x = 1 in x +" [✔]
  fails for: "let x = 1 in x in" [✔]
  fails for: "let x = let x = 1 in x" [✔]
AST interpreter
  interprets: "1" [✔]
  interprets: "1 + 2 - 3 * 4 + 5 / 6 / 1 + 1" [✔]
  interprets: "1 + (2 - 3) * 4 + 5 / 6 / (1 + 1)" [✔]
  interprets: "1 + -1" [✔]
  interprets: "1 * -1" [✔]
  interprets: "let x = 4 in x + 1" [✔]
  interprets: "let x = 4 in let x = x + 1 in x + 2" [✔]
  interprets: "let x = 4 in let y = 5 in x + y" [✔]
  interprets: "let x = 4 in let y = 5 in x + let z = y in z * z" [✔]
  interprets: "let x = 4 in (let y = 5 in x + y) + let z = 2 in z * z" [✔]
  interprets: "let x = let y = 3 in y + y in x * 3" [✔]
  interprets: "let x = let y = 1 + let z = 2 in z * z in y + 1 in x * 3" [✔]
  fails for: "x" [✔]
  fails for: "let x = 4 in y + 1" [✔]
  fails for: "let x = y + 1 in x" [✔]
  fails for: "let x = x + 1 in x" [✔]
  fails for: "1/0" [✔]
  fails for: "-32768 / -1" [✔]
Compiler
  compiles: "1" [✔]
  compiles: "1 + 2 - 3 * 4 + 5 / 6 / 1 + 1" [✔]
  compiles: "1 + (2 - 3) * 4 + 5 / 6 / (1 + 1)" [✔]
  compiles: "let x = 4 in x + 1" [✔]
  compiles: "let x = 4 in let y = 5 in x + y" [✔]
  compiles: "let x = 4 in let x = x + 1 in x + 2" [✔]
  compiles: "let x = let y = 3 in y + y in x * 3" [✔]
  compiles: "let x = let y = 1 + let z = 2 in z * z in y + 1 in x * 3" [✔]
  compiles: "1/0" [✔]
  compiles: "-32768 / -1" [✔]
  fails for: "x" [✔]
  fails for: "let x = 4 in y + 1" [✔]
  fails for: "let x = y + 1 in x" [✔]
  fails for: "let x = x + 1 in x" [✔]
  fails for: "let x = 4 in let y = 1 in let z = 2 in y + x" [✔]
  fails for: "let x = 4 in let y = 5 in x + let z = y in z * z" [✔]
  fails for: "let a = 0 in let b = 0 in let c = 0 in let d = 0 in d" [✔]
  fails for greater sized expr [✔]
  fails for lesser sized expr [✔]
Property: Print AST then parse returns same AST [✔]
  +++ OK, passed 100 tests.
Property: Disassemble bytecode then decompile then compile returns same bytecode [✔]
  +++ OK, passed 100 tests.
Bytecode interpreter
  interprets: "1" [✔]
  interprets: "1 + 2 - 3 * 4 + 5 / 6 / 1 + 1" [✔]
  interprets: "1 + (2 - 3) * 4 + 5 / 6 / (1 + 1)" [✔]
  interprets: "1 + -1" [✔]
  interprets: "1 * -1" [✔]
  interprets: "let x = 4 in x + 1" [✔]
  interprets: "let x = 4 in let x = x + 1 in x + 2" [✔]
  interprets: "let x = 4 in let y = 5 in x + y" [✔]
  interprets: "let x = 4 in let y = 5 in x + let z = y in z * z" [✔]
  interprets: "let x = 4 in (let y = 5 in x + y) + let z = 2 in z * z" [✔]
  interprets: "let x = let y = 3 in y + y in x * 3" [✔]
  interprets: "let x = let y = 1 + let z = 2 in z * z in y + 1 in x * 3" [✔]
  fails for: "1/0" [✔]
  fails for: "-32768 / -1" [✔]
  fails for: "let a = 0 in let b = 0 in let c = 0 in let d = 0 in let e = 0 in let f = 0 in a + b + c + d + e + f" [✔]
Property: Interpret AST returns same result as compile then interpret bytecode [✔]
  +++ OK, passed 100 tests.

Finished in 0.0166 seconds
91 examples, 0 failures
Test suite specs: PASS
```

</details>

Happily, all tests pass.

Benchmarking the VM[#](#benchmarking-the-vm)
----------

Now for the fun part: benchmarking. We use the [criterion](https://hackage.haskell.org/package/criterion) library to benchmark the code.

```
{-# LANGUAGE GHC2021 #-}

module Main where

import ArithVMLib
import Control.Arrow ((>>>))
import Control.DeepSeq (force)
import Control.Exception (evaluate)
import Control.Monad ((>=>))
import Criterion
import Criterion.Main
import Criterion.Main.Options
import Criterion.Types
import Data.ByteString qualified as BS

main :: IO ()
main = do
  code <- BS.getContents >>= evaluate . force
  let Right ast = force $ parseSized code
      Right bytecode = force $ compile ast
      Right program = force $ disassemble bytecode
  runMode
    ( Run
        (defaultConfig {reportFile = Just "benchmark.html"})
        Prefix
        []
    )
    [ bgroup
        "pass"
        [ bench "parse" $ whnf (parseSized >>> force) code,
          bench "compile" $ whnf (compile >>> force) ast,
          bench "disassemble" $ whnf (disassemble >>> force) bytecode,
          bench "decompile" $ whnf (decompile >>> force) program
        ],
      bgroup
        "interpret"
        [ bench "ast" $ whnf (fst >>> interpretAST >>> force) ast,
          bench "bytecode" $ whnf (interpretBytecode >>> force) bytecode
        ],
      bgroup
        "run"
        [ bench "ast" $
            whnf (parse >=> interpretAST >>> force) code,
          bench "bytecode" $
            whnf (parseSized >=> compile >=> interpretBytecode >>> force) code
        ]
    ]
```

 ArithVMBench.hs

We have a benchmark suite to measure the performance of each pass, the two interpreters (AST and bytecode), and the full end-to-end runs[<sup>8</sup>](#fn8). We compile with the following GHC options:

```
 -O2
 -fllvm
 -funbox-strict-fields
 -funfolding-use-threshold=16
 -threaded
 -rtsopts
 -with-rtsopts=-N2
```

<details> <summary> Benchmark run </summary>

```
$ cat benchmark.tb | cabal bench
Running 1 benchmarks...
Benchmark bench: RUNNING...
benchmarking pass/parse
time                 581.1 ms   (566.7 ms .. 594.3 ms)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 573.5 ms   (570.4 ms .. 577.1 ms)
std dev              3.948 ms   (1.359 ms .. 5.424 ms)
variance introduced by outliers: 19% (moderately inflated)

benchmarking pass/compile
time                 51.00 ms   (50.48 ms .. 52.54 ms)
                     0.998 R²   (0.995 R² .. 1.000 R²)
mean                 50.82 ms   (50.57 ms .. 51.87 ms)
std dev              810.9 μs   (185.8 μs .. 1.509 ms)

benchmarking pass/disassemble
time                 160.3 ms   (154.7 ms .. 166.5 ms)
                     0.998 R²   (0.990 R² .. 1.000 R²)
mean                 155.8 ms   (150.0 ms .. 160.5 ms)
std dev              7.642 ms   (4.255 ms .. 11.76 ms)
variance introduced by outliers: 12% (moderately inflated)

benchmarking pass/decompile
time                 495.1 ms   (454.0 ms .. 523.7 ms)
                     0.999 R²   (0.999 R² .. 1.000 R²)
mean                 506.5 ms   (495.0 ms .. 525.1 ms)
std dev              17.73 ms   (2.167 ms .. 22.59 ms)
variance introduced by outliers: 19% (moderately inflated)

benchmarking interpret/ast
time                 49.57 ms   (49.53 ms .. 49.61 ms)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 49.80 ms   (49.71 ms .. 50.07 ms)
std dev              255.9 μs   (124.2 μs .. 433.9 μs)

benchmarking interpret/bytecode
time                 15.83 ms   (15.79 ms .. 15.88 ms)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 15.79 ms   (15.75 ms .. 15.83 ms)
std dev              96.85 μs   (70.30 μs .. 140.9 μs)

benchmarking run/ast
time                 628.0 ms   (626.7 ms .. 630.5 ms)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 617.2 ms   (610.2 ms .. 621.0 ms)
std dev              6.679 ms   (1.899 ms .. 8.802 ms)
variance introduced by outliers: 19% (moderately inflated)

benchmarking run/bytecode
time                 643.8 ms   (632.5 ms .. 655.3 ms)
                     1.000 R²   (1.000 R² .. 1.000 R²)
mean                 638.3 ms   (635.8 ms .. 641.2 ms)
std dev              2.981 ms   (1.292 ms .. 4.153 ms)
variance introduced by outliers: 19% (moderately inflated)

Benchmark bench: FINISH
```

</details>

Here are the results in a more digestible format:

|    Benchmark     |Mean Time (ms)|
|------------------|--------------|
|    pass/parse    |    573.5     |
|   pass/compile   |     50.8     |
| pass/disassemble |    155.8     |
|  pass/decompile  |    506.5     |
|  interpret/ast   |     49.8     |
|interpret/bytecode|     15.8     |
|     run/ast      |    617.2     |
|   run/bytecode   |    638.3     |

Here are the times in a chart (smaller is better):

[![Benchmark times](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20800%20600'%3E%3C/svg%3E) \<img src="/images/plots/pandocplot7696613430207986151.svg" class="w-100pct" alt="Benchmark times"\>\</img\>](https://abhinavsarkar.net/images/plots/pandocplot7696613430207986151.svg) Benchmark times

Let’s break down these numbers:

* **Parsing and decompiling are slow**: At \~573ms and \~506ms, these are by far the slowest passes. This isn’t surprising. Parsing with parser combinators has a known trade-off of expressiveness for performance. Decompiling is a shift-reduce parser that reconstructs an AST from a linear stream of opcodes, and we didn’t spend any time optimizing it.
* **Compilation is fast**: At \~51ms, compilation is an order of magnitude faster than parsing. This is thanks to pre-calculating the bytecode size during the parsing phase, which allows us to pre-allocate a single `ByteString` and fill it in with low-level pointer operations.
* **Bytecode interpretation is blazingly fast**: At just \~16ms, our VM’s interpreter is over 3 times faster than the AST interpreter (\~50ms), which proves our belief that bytecode interpreters are faster.
* **End-to-end runs**: Interestingly, the total time to run via bytecode (\~638ms) is slightly slower than the run via AST (\~617ms). This is because the cost of parsing, compiling, and then interpreting is higher than just parsing and interpreting. The real win for a bytecode VM comes when you compile *once* and run *many times*, amortizing the initial compilation cost.

I can already see readers thinking, “Sure that’s fast, but is it faster than C/Rust/Zig/my favourite language?” Let’s find out.

Benchmarking Against C[#](#benchmarking-against-c)
----------

To get a better sense of our VM’s performance, I rewrote it in C.

[The C implementation](https://abhinavsarkar.net/code/arithvm.html?mtm_campaign=feed) is a classic manual approach: a hand-written tokenizer and recursive-descent parser, `struct`s with pointers for the AST, and manual memory management and error propagation. The VM is a simple `while` loop with a `switch` statement for dispatching opcodes[<sup>9</sup>](#fn9).

To compare our Haskell code against the C code, we need to write the last Haskell module, the CLI app that we demonstrated in [the first post](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed#introduction):

<details> <summary> ArithVMApp.hs </summary>

```
{-# LANGUAGE GHC2021 #-}

module Main where

import ArithVMLib
import Control.Arrow ((>>>))
import Control.Monad ((>=>))
import Data.ByteString qualified as BS
import Data.Foldable (toList)
import Data.Set qualified as Set
import Data.String (IsString (fromString))
import Options.Applicative qualified as O
import System.Exit (exitFailure)
import System.IO qualified as IO
import Test.QuickCheck qualified as Q
import Text.Pretty.Simple qualified as PS

data Command
  = RunPass Pass Input
  | Run Input
  | Generate Int
  deriving (Show, Eq)

data Input = InputFP FilePath | InputStdin deriving (Show, Eq)

instance IsString Input where
  fromString = \case
    "-" -> InputStdin
    fp -> InputFP fp

commandParser :: IO Command
commandParser =
  O.customExecParser (O.prefs $ O.showHelpOnError <> O.showHelpOnEmpty)
    . O.info (O.hsubparser (mconcat subcommandParsers) O.<**> O.helper)
    $ O.fullDesc <> O.header "Bytecode VM for Arithmetic written in Haskell"
  where
    subcommandParsers =
      map
        ( \(command, pass, desc) ->
            O.command command
            . O.info (RunPass pass <$> inputParser)
            $ O.progDesc desc
        )
        [ ("read", Read, "Read an expression from file or STDIN"),
          ("parse", Parse, "Parse expression to AST"),
          ("print", Print, "Parse expression to AST and print it"),
          ("compile", Compile, "Parse and compile expression to bytecode"),
          ("disassemble", Disassemble, "Disassemble bytecode to opcodes"),
          ( "decompile",
            Decompile,
            "Disassemble and decompile bytecode to expression"
          ),
          ("interpret-ast", InterpretAST, "Parse expression and interpret AST"),
          ( "interpret-bytecode",
            InterpretBytecode,
            "Parse, compile and assemble expression, and interpret bytecode"
          )
        ]
        <> [ O.command "run" . O.info (Run <$> inputParser) $
               O.progDesc "Run bytecode",
             O.command "generate" . O.info (Generate <$> maxSizeParser) $
               O.progDesc "Generate a random arithmetic expression"
           ]

    inputParser =
      O.strArgument
        ( O.metavar "FILE"
            <> O.value InputStdin
            <> O.help "Input file, pass - to read from STDIN (default)"
        )

    maxSizeParser =
      O.option
        O.auto
        ( O.long "size"
            <> O.short 's'
            <> O.metavar "INT"
            <> O.value 100
            <> O.help "Maximum size of the generated AST"
        )

main :: IO ()
main = commandParser >>= runCommand

runCommand :: Command -> IO ()
runCommand = \case
  RunPass Read i -> run i (const $ pure ()) (\_ -> Right () :: Either String ())
  RunPass Parse i -> run i (const $ pure ()) parse
  RunPass Print i -> run i pPrintExpr parse
  RunPass Compile i -> run i BS.putStr $ parseSized >=> compile
  RunPass Decompile i -> run i pPrintExpr $ disassemble >=> decompile
  RunPass Disassemble i -> run i (mapM_ print) $ disassemble >>> fmap toList
  RunPass InterpretAST i -> run i print $ parse >=> interpretAST
  RunPass InterpretBytecode i ->
    run i print $ parseSized >=> compile >=> interpretBytecode
  Run i -> run i print interpretBytecode
  Generate maxSize -> Q.generate (exprGen Set.empty maxSize) >>= pPrintExpr
  where
    run input print process = do
      code <- case input of
        InputStdin -> BS.getContents
        InputFP fp -> BS.readFile fp
      case process code of
        Left err -> IO.hPrint IO.stderr err >> exitFailure
        Right val -> print val

    pPrintExpr =
      PS.pPrintOpt PS.CheckColorTty $
        PS.defaultOutputOptionsDarkBg
          { PS.outputOptionsIndentAmount = 2,
            PS.outputOptionsCompact = True
          }
```

</details>

We compile with the following GHC options[<sup>10</sup>](#fn10):

```
 -O2
 -fllvm
 -funbox-strict-fields
 -funfolding-use-threshold=16
```

And for the C version, we compile using GCC:

```
gcc -O3 arithvm.c -o arithvm -Wall
```

Now, let’s see how they stack up against each other. We use [hyperfine](https://github.com/sharkdp/hyperfine) to run the two executables.

<details> <summary> Hyperfine run </summary>

```
$ arith-vm compile benchmark.tb > benchmark.tbc
# Haskell runs
$ hyperfine -L pass read,parse,compile,interpret-bytecode --warmup 10 -r 30 \
    "arith-vm {pass} benchmark.tb"
Benchmark 1: arith-vm read benchmark.tb
  Time (mean ± σ):      30.4 ms ±   0.2 ms    [User: 2.4 ms, System: 15.9 ms]
  Range (min … max):    30.0 ms …  30.9 ms    30 runs

Benchmark 2: arith-vm parse benchmark.tb
  Time (mean ± σ):     567.6 ms ±   5.7 ms    [User: 537.4 ms, System: 22.0 ms]
  Range (min … max):   554.7 ms … 579.9 ms    30 runs

Benchmark 3: arith-vm compile benchmark.tb
  Time (mean ± σ):     630.0 ms ±   4.5 ms    [User: 598.5 ms, System: 23.5 ms]
  Range (min … max):   622.6 ms … 641.1 ms    30 runs

Benchmark 4: arith-vm interpret-bytecode benchmark.tb
  Time (mean ± σ):     650.2 ms ±   4.9 ms    [User: 619.0 ms, System: 23.3 ms]
  Range (min … max):   640.9 ms … 656.6 ms    30 runs

$ hyperfine --warmup 10 -r 30 "arith-vm run benchmark.tbc"
Benchmark 1: arith-vm run benchmark.tbc
  Time (mean ± σ):      29.3 ms ±   0.2 ms    [User: 17.6 ms, System: 2.9 ms]
  Range (min … max):    28.9 ms …  29.6 ms    30 runs

# C runs
$ hyperfine -L pass read,parse,compile,interpret --warmup 10 -r 30 \
    "./arithvm {pass} benchmark.tb"
Benchmark 1: ./arithvm read benchmark.tb
  Time (mean ± σ):      14.2 ms ±   0.2 ms    [User: 0.8 ms, System: 13.0 ms]
  Range (min … max):    14.0 ms …  14.6 ms    30 runs

Benchmark 2: ./arithvm parse benchmark.tb
  Time (mean ± σ):     217.4 ms ±   2.6 ms    [User: 192.2 ms, System: 23.7 ms]
  Range (min … max):   213.6 ms … 223.9 ms    30 runs

Benchmark 3: ./arithvm compile benchmark.tb
  Time (mean ± σ):     254.5 ms ±   2.9 ms    [User: 228.3 ms, System: 24.7 ms]
  Range (min … max):   246.0 ms … 259.1 ms    30 runs

Benchmark 4: ./arithvm interpret benchmark.tb
  Time (mean ± σ):     267.9 ms ±   2.1 ms    [User: 241.5 ms, System: 24.9 ms]
  Range (min … max):   263.4 ms … 272.2 ms    30 runs

$ hyperfine --warmup 10 -r 30 "./arithvm run benchmark.tbc"
Benchmark 1: ./arithvm run benchmark.tbc
  Time (mean ± σ):      13.9 ms ±   0.1 ms    [User: 12.4 ms, System: 1.1 ms]
  Range (min … max):    13.6 ms …  14.1 ms    30 runs
```

</details>

Here’s a summary of the results:

|  Pass   |C Time (ms)|Haskell Time (ms)|Slowdown|
|---------|-----------|-----------------|--------|
|  Read   |   14.2    |      30.4       | 2.14x  |
|  Parse  |   203.2   |      537.2      | 2.64x  |
| Compile |   37.1    |      62.4       | 1.68x  |
|Interpret|   13.4    |      20.2       | 1.51x  |
|   Run   |   13.9    |      29.3       | 2.11x  |

I have subtracted the times of previous passes to get the times for individual passes. Here’s the same in a chart (smaller is better):

[![Run time of different passes for C and Haskell VMs](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20800%20600'%3E%3C/svg%3E) \<img src="/images/plots/pandocplot18010519765177174314.svg" class="w-100pct" alt="Run time of different passes for C and Haskell VMs"\>\</img\>](https://abhinavsarkar.net/images/plots/pandocplot18010519765177174314.svg) Run time of different passes for C and Haskell VMs

As expected, the C implementation is faster across the board, between 1.5x to 2.6x. The biggest difference is in parsing, where the hand-written C parser is more than twice as fast as our combinator-based one. On the other hand, interpreting bytecode in Haskell is only 50% slower than C. In my opinion, the Haskell code’s performance is quite respectable, especially given the safety, expressiveness and conciseness benefits, as illustrated by the code sizes[<sup>11</sup>](#fn11):

|Implementation|Lines of Code|
|--------------|-------------|
|      C       |     775     |
|   Haskell    |     407     |

The Haskell implementation is almost half the size of the C code. I don’t know about you but I’m perfectly happy with the half as small, half as fast tread-off.

The benchmark results for the VMs become less surprising when I compare the C `interpret` function with the GHC Core code for `interpretBytecode'`[<sup>12</sup>](#fn12).

```
int interpret(const uint8_t *bytecode, const long bytecode_size, int16_t *result) {
  VM vm;
  vm_init(&vm);

  while (vm.ip < bytecode_size) {
    if (vm.sp >= STACK_SIZE) { return VM_ERROR_STACK_OVERFLOW; }
    if (vm.sp < 0) { return VM_ERROR_STACK_UNDERFLOW; }

    const uint8_t op = bytecode[vm.ip];
    // other checks

    switch (op) {
    case OP_PUSH: {
      const uint8_t byte1 = bytecode[vm.ip + 1];
      const uint8_t byte2 = bytecode[vm.ip + 2];
      const int16_t value = (int16_t)((uint16_t)byte1 | ((uint16_t)byte2 << 8));

      vm.stack[vm.sp] = value;
      vm.sp++;
      vm.ip += 3;
      break;
    }

    case OP_ADD:
    case OP_SUB:
    case OP_MUL:
    case OP_DIV: {
      int16_t value1 = vm.stack[vm.sp - 2];
      int16_t value2 = vm.stack[vm.sp - 1];

      int16_t result;
      switch (op) {
      case OP_ADD: { result = value1 + value2; break; }
      case OP_SUB: { result = value1 - value2; break; }
      case OP_MUL: { result = value1 * value2; break; }
      case OP_DIV: {
        if (value2 == 0) { return VM_ERROR_DIVISION_BY_ZERO; }
        if (value2 == -1 && value1 == -32768) {
          return VM_ERROR_ARITHMETIC_OVERFLOW;
        }
        result = value1 / value2;
        break;
      }
      }

      vm.stack[vm.sp - 2] = result;
      vm.sp--;
      vm.ip++;
      break;
    }
    // ... other cases ...
    }
  }
  // ... final checks and return ...
}
```

This structure is almost a 1-to-1 match with the GHC Core code we saw earlier. The C `while` loop corresponds to the optimized `$wgo` function that GHC generates, the `switch` statement is almost identical to the `case` analysis on the raw opcode byte, and the C stack array is equivalent to the `MutableByteArray#` GHC uses. GHC effectively compiles our high-level Haskell into a low-level code that is structurally identical to what we wrote by hand in C[<sup>13</sup>](#fn13).

This explains why the performance is in the same ballpark. The remaining performance gap is probably due to the thin layer of abstraction that the Haskell runtime still maintains, but it’s remarkable how close we can get to C-like performance.

Future Directions[#](#future-directions)
----------

While our Haskell program is fast, we can improve certain things:

* **Parser optimizations**: As the benchmarks showed, parsing is our slowest pass. For better performance, we could replace our Attoparsec-based combinator parser with a parser generator like [Alex](https://www.haskell.org/alex/) and [Happy](https://www.haskell.org/happy/), or even write a recursive-descent parser by hand.

* **Superinstructions**: We could analyze the bytecode for common instruction sequences (like `OPush` followed by `OAdd`) and combine them into single superinstructions. This would reduce the instruction dispatch overhead, but may make compilation slower.

* **Register-based VM**: A register-based VM, which uses a small array of virtual registers instead of a memory-based stack, could significantly reduce memory traffic and improve performance. This would require a more complex compiler capable of register allocation.

* **Just-in-Time (JIT) compilation**: The ultimate performance boost could come from a [JIT compiler](https://en.wikipedia.org/wiki/JIT_compiler). Instead of interpreting bytecode, we could compile it to native machine code at runtime, eliminating the interpreter entirely. Maybe we could use [LLVM](https://web.archive.org/web/20251021/https://llvm.org/) to build a JIT compiler in Haskell.

Conclusion[#](#conclusion)
----------

And that’s a wrap! We successfully built a bytecode compiler and virtual machine in Haskell. We covered parsing, AST interpretation, compilation, and bytecode execution, as well as, debugging and testing functionalities. Let’s update our checklist:

* [Parsing arithmetic expressions to Abstract Syntax Trees (ASTs).](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed#parsing-expressions)
* [Unit testing for our parser.](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed#testing-the-parser)
* [Interpreting ASTs.](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed#the-ast-interpreter)
* [Compiling ASTs to bytecode.](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-compiler/?mtm_campaign=feed#the-compiler)
* [Disassembling and decompiling bytecode.](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-compiler/?mtm_campaign=feed#the-decompiler)
* [Unit testing for our compiler.](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-compiler/?mtm_campaign=feed#testing-the-compiler)
* [Property-based testing for our compiler.](#testing-the-compiler)
* [Efficiently executing bytecode in a virtual machine.](#the-virtual-machine)
* [Unit testing and property-based testing for our VM.](#testing-the-vm)
* [Benchmarking our code to see how the different passes perform.](#benchmarking-the-vm)
* All the while [keeping](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-compiler/?mtm_campaign=feed#compiling-fast-and-slow) [an eye](#peeking-under-the-hood-ghc-core) on performance.

The journey from a simple AST interpreter to a bytecode VM has been a rewarding one. We saw a significant performance improvement, learned about how compilers and VMs work, and how to write performant code in Haskell. While our Haskell implementation isn’t as fast as the hand-written C version, it’s far more concise and, I would argue, easier to reason about. It’s a great demonstration of Haskell’s power for writing high-performance—yet safe and elegant—code.

See the full code at:

* [ArithVMLib.hs](https://abhinavsarkar.net/code/ArithVMLib.html?mtm_campaign=feed)
* [ArithVMSpec.hs](https://abhinavsarkar.net/code/ArithVMSpec.html?mtm_campaign=feed)
* [ArithVMBench.hs](https://abhinavsarkar.net/code/ArithVMBench.html?mtm_campaign=feed)
* [ArithVMApp.hs](https://abhinavsarkar.net/code/ArithVMApp.html?mtm_campaign=feed)
* [arithvm.c](https://abhinavsarkar.net/code/arithvm.html?mtm_campaign=feed)

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. Actually, QuickCheck does not generate entirely arbitrary inputs. It generates arbitrary inputs with increasing complexity—where the complexity is defined by the user—and asserts the properties on these inputs. When a test fails for a particular input, QuickCheck also tries to simplify the culprit and tries to find the simplest input for which the test fails. This process is called *Shrinking* in QuickCheck parlance. QuickCheck then shows this simplest input to the user for them to use it to debug their code.[↩︎](#fnref1)

2. Read this good [introduction to QuickCheck](https://jesper.sikanda.be/posts/quickcheck-intro.html) if you are unfamiliar.[↩︎](#fnref2)

3. Notice that we discard the expressions that do not compile successfully.[↩︎](#fnref3)

4. `sp` and `ip` are not actual pointers, but indices into the stack and bytecode arrays respectively.[↩︎](#fnref4)

5. Guided by the GHC profiler, I tweaked the code in many different ways and ran benchmarks for every change. Then I chose the code that was most performant.[↩︎](#fnref5)

6. It is extremely important to write good tests before getting your hands dirty with performance optimizations. In my case, the tests saved me many times from breaking the VM while moving code around for performance.[↩︎](#fnref6)

7. We are using our AST interpreter as a definitional interpreter, assuming it to be correctly implemented because of its simpler nature.[↩︎](#fnref7)

8. I ran all benchmarks on an Apple M4 Pro 24GB machine against a 142MB file generated using the expression generator we wrote earlier.[↩︎](#fnref8)

9. I don’t claim to be a great or even a good C programmer. In fact, this C VM is the first substantial C code I have written in decades. I’m sure the code is not most optimized. It may even be ridden with memory management bugs. If you find something wrong, please let me know in the comments.[↩︎](#fnref9)

10. I tried various RTS options to tweak GHC garbage collection, but the defaults proved to be fastest.[↩︎](#fnref10)

11. The lines of code are for only the overlapping functionalities between C and Haskell versions.[↩︎](#fnref11)

12. I did try using *[Direct Threading](https://en.wikipedia.org/wiki/Threaded_code#Direct_threading)* and *[Subroutine Threading](https://en.wikipedia.org/wiki/Threaded_code#Subroutine_threading)* in the C code, but they resulted in slower code than the switch-case variant. GCC may be smart enough in case of this simple VM to optimize the switch-case to be faster than threaded code.[↩︎](#fnref12)

13. You may have noticed that the C `interpret` function is not laid out in the exact same manner as the Haskell `interpretBytecode'.go` function. In case of C, moving the checks to the front did not yield in performance improvement. I suspect this may be because GCC is smart enough to do that optimization by itself. The nested `switch` were also no detriment to the performance of the C code.[↩︎](#fnref13)

This post is a part of the series: **A Fast Bytecode VM for Arithmetic**.

1. [The Parser](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-parser/?mtm_campaign=feed)
2. [The Compiler](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm-compiler/?mtm_campaign=feed)
3. **The Virtual Machine** 👈

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/115412798088597169)
* [Lobsters](https://lobste.rs/s/2mjimw)
* [Reddit](https://www.reddit.com/r/haskell/comments/1ocfnex/)
* [Discourse](https://discourse.haskell.org/t//13159)
* [Hacker News](https://news.ycombinator.com/item?id=45656836)
* [My website](https://abhinavsarkar.net/posts/arithmetic-bytecode-vm/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)