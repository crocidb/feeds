+++
title = "Interpreting Brainfuck in Haskell"
description = "Writing an interpreter for Brainfuck is almost a rite of passage for any programming language implementer, and it’s my turn now. In this post, we’ll write not one but four Brainfuck interpreters in Haskell. Let’s go!"
date = "2025-01-19T00:00:00Z"
url = "https://abhinavsarkar.net/posts/brainfuck-interpreter/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-07-21T09:17:41.489206114Z"
seen = false
+++

Writing an interpreter for Brainfuck is almost a rite of passage for any programming language implementer, and it’s my turn now. In this post, we’ll write not one but four Brainfuck interpreters in Haskell. Let’s go!

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/brainfuck-interpreter/?mtm_campaign=feed).

### Contents ###

1. [Introduction](#introduction)
2. [Setup](#setup)
3. [String Interpreter](#string-interpreter)
4. [AST Interpreter](#ast-interpreter)
5. [Bytecode Interpreter](#bytecode-interpreter)
6. [Optimizing Bytecode Interpreter](#optimizing-bytecode-interpreter)
7. [Comparison](#comparison)

Introduction[#](#introduction)
----------

[Brainfuck](https://en.wikipedia.org/wiki/Brainfuck) (henceforth BF) is the most famous of esoteric programming languages. Its fame lies in the fact that it is extremely minimalist, with only eight instructions, and very easy to implement. Yet, it is Turing-complete and as capable as any other programming language[<sup>1</sup>](#fn1). Writing an interpreter for BF is a fun exercise, and so there are hundreds, maybe even thousands of them. Since BF is very verbose, optimizing BF interpreters is almost a sport, with people posting benchmarks of their creations. I can’t say that what I have in this post is novel, but it was definitely a fun exercise for me.

BF has eight instructions of one character each. A BF program is a sequence of these instructions. It may have other characters as well, which are treated as comments and are ignored while executing. An instruction pointer (IP) points at the next instruction to be executed, starting with the first instruction. The instructions are executed sequentially, except for the jump instructions that may cause the IP to jump to remote instructions. The program terminates when the IP moves past the last instruction.

BF programs work by modifying data in a memory that is an array of at least 30000 byte cells initialized to zero. A data pointer (DP) points to the current byte of the memory to be modified, starting with the first byte of the memory. BF programs can also read from standard input and write to standard output, one byte at a time using the [ASCII](https://en.wikipedia.org/wiki/ASCII) character encoding.

The eight BF instructions each consist of a single character:

`>`  Increment the DP by one to point to the next cell to the right. `<`  Decrement the DP by one to point to the next cell to the left. `+`  Increment the byte at the DP by one. `-`  Decrement the byte at the DP by one. `.`  Output the byte at the DP. `,`  Accept one byte of input, and store its value in the byte at the DP. `[`  If the byte at the DP is zero, then instead of moving the IP forward to the next command, jump it forward to the command after the matching `]` command. `]`  If the byte at the DP is nonzero, then instead of moving the IP forward to the next command, jump it back to the command after the matching `[` command.

Each `[` matches exactly one `]` and vice versa, and the `[` comes first. Together, they add conditions and loops to BF.

Some details are left to implementations. In our case, we assume that the memory cells are signed bytes that underflow and overflow without errors. Also, accessing the memory beyond array boundaries wraps to the opposite side without errors.

For a taste, here is a small BF program that prints `Hello, World!` when run:

```
+++++++++++[>++++++>+++++++++>++++++++>++++>+++>+<<<<<<-]>+++
+++.>++.+++++++..+++.>>.>-.<<-.<.+++.------.--------.>>>+.>-.
```

As you can imagine, interpreting BF is easy, at least when doing it naively. So instead of writing one interpreter, we are going to write four, with increasing performance and complexity.

Setup[#](#setup)
----------

First, some imports:

```
{-# LANGUAGE GHC2021 #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TypeFamilies #-}

module Main where

import Control.Arrow ((>>>))
import Control.Monad (void)
import Data.Bits (shiftR, (.&.))
import Data.ByteArray qualified as BA
import Data.Char (chr, ord)
import Data.Functor (($>))
import Data.Int (Int8)
import Data.Kind (Type)
import Data.Vector qualified as V
import Data.Vector.Storable.Mutable qualified as MV
import Data.Word (Word16, Word8)
import Foreign.Ptr (Ptr, castPtr, minusPtr, plusPtr)
import Foreign.Storable qualified as S
import System.Environment (getArgs, getProgName)
import System.Exit (exitFailure)
import System.IO qualified as IO
import Text.ParserCombinators.ReadP qualified as P
```

We use the `GHC2021` extension here that enables a lot of useful GHC extensions by default. Our non-base imports come from the [memory](https://hackage.haskell.org/package/memory) and [vector](https://hackage.haskell.org/package/vector) libraries.

We abstract the interpreter interface as a typeclass:

```
class Interpreter a where
  data Program a :: Type
  parse :: String -> Program a
  interpret :: Memory -> Program a -> IO ()
```

An `Interpreter` is specified by a data type `Program` and two functions: `parse` parses a string to a `Program`, and `interpret` interprets the parsed `Program`.

For modeling the mutable memory, we use a mutable unboxed [`IOVector`](https://hackage.haskell.org/package/vector/docs/Data-Vector-Mutable.html#t:IOVector) of signed bytes (`Int8`) from the vector package. Since our interpreter runs in `IO`, this works well for us. The DP hence, is modelled as a index in this vector, which we name the `MemIdx` type.

```
newtype Memory = Memory {unMemory :: MV.IOVector Int8}
type MemIdx = Int

newMemory :: Int -> IO Memory
newMemory = fmap Memory . MV.new

memorySize :: Memory -> Int
memorySize = MV.length . unMemory

readMemory :: Memory -> MemIdx -> IO Int8
readMemory = MV.unsafeRead . unMemory

writeMemory :: Memory -> MemIdx -> Int8 -> IO ()
writeMemory = MV.unsafeWrite . unMemory

modifyMemory :: Memory -> (Int8 -> Int8) -> MemIdx -> IO ()
modifyMemory = MV.unsafeModify . unMemory

nextMemoryIndex :: Memory -> MemIdx -> MemIdx
nextMemoryIndex memory memIdx = (memIdx + 1) `rem` memorySize memory

prevMemoryIndex :: Memory -> MemIdx -> MemIdx
prevMemoryIndex memory memIdx = (memIdx - 1) `mod` memorySize memory
```

We wrap the `IOVector Int8` with a `Memory` `newtype`. `newMemory` creates a new memory array of bytes initialized to zero. `memorySize` returns the size of the memory. `readMemory`, `writeMemory` and `modifyMemory` are for reading from, writing to and modifying the memory respectively. `nextMemoryIndex` and `prevMemoryIndex` increment and decrement the array index respectively, taking care of wrapping at boundaries.

Now we write the `main` function using the `Interpreter` typeclass functions:

```
main :: IO ()
main = do
  IO.hSetBuffering IO.stdin IO.NoBuffering
  IO.hSetBuffering IO.stdout IO.LineBuffering
  progName <- getProgName
  let usage = "Usage: " <> progName <> " -(s|a|b|o) <bf_file>"

  getArgs >>= \case
    [interpreterType, fileName] -> do
      code <- filter (`elem` "+-.,><[]") <$> readFile fileName
      memory <- newMemory 30000
      parseAndInterpret memory code usage interpreterType
    _ -> exitWithMsg usage
  where
    parseAndInterpret memory code usage = \case
      "-s" -> interpret @StringInterpreter memory $ parse code
      "-a" -> interpret @ASTInterpreter memory $ parse code
      "-b" -> interpret @BytecodeInterpreter memory $ parse code
      "-o" -> interpret @OptimizingBytecodeInterpreter memory $ parse code
      t -> exitWithMsg $ "Invalid interpreter type: " <> t <> "\n" <> usage

    exitWithMsg msg = IO.hPutStrLn IO.stderr msg >> exitFailure
```

The `main` function calls the `parse` and `interpret` functions for the right interpreter with a new memory and the input string read from the file specified in the command line argument. We make sure to filter out non-BF characters when reading the input file.

With the setup done, let’s move on to our first interpreter.

String Interpreter[#](#string-interpreter)
----------

A BF program can be interpreted directly from its string representation, going over the characters and executing the right logic for them. But strings in Haskell are notoriously slow because they are implemented as singly linked-lists of characters. Indexing into strings has \\(O(n)\\) time complexity, so it is not a good idea to use them directly. Instead, we use a char Zipper[<sup>2</sup>](#fn2).

```
data StringInterpreter

instance Interpreter StringInterpreter where
  data Program StringInterpreter = ProgramCZ CharZipper
  parse = ProgramCZ . czFromString
  interpret memory (ProgramCZ code) = interpretCharZipper memory code
```

Zippers are a special view of data structures, which allow one to navigate and easily update them. A zipper has a focus or cursor which is the current element of the data structure we are “at”. Alongside, it also captures the rest of the data structure in a way that makes it easy to move around it. We can update the data structure by updating the element at the focus[<sup>3</sup>](#fn3).

```
data CharZipper = CharZipper
  {czLeft :: String, czFocus :: Maybe Char, czRight :: String}

czFromString :: String -> CharZipper
czFromString = \case
  [] -> CharZipper [] Nothing []
  (x : xs) -> CharZipper [] (Just x) xs

czMoveLeft :: CharZipper -> CharZipper
czMoveLeft = \case
  CharZipper [] (Just focus) right -> CharZipper [] Nothing (focus : right)
  CharZipper (x : xs) (Just focus) right -> CharZipper xs (Just x) (focus : right)
  z -> z

czMoveRight :: CharZipper -> CharZipper
czMoveRight = \case
  CharZipper left (Just focus) [] -> CharZipper (focus : left) Nothing []
  CharZipper left (Just focus) (x : xs) -> CharZipper (focus : left) (Just x) xs
  z -> z
```

This zipper is a little different from the usual implementations because we need to know when the focus of the zipper has moved out the program boundaries. Hence, we model the focus as `Maybe Char`. `czFromString` creates a char zipper from a string. `czMoveLeft` and `czMoveRight` move the focus left and right respectively, taking care of setting the focus to `Nothing` if we move outside the program string.

Parsing the program is thus same as creating the char zipper from the program string. For interpreting the program, we write this function:

```
interpretCharZipper :: Memory -> CharZipper -> IO ()
interpretCharZipper memory = go 0
  where
    go !memIdx !program = case czFocus program of
      Nothing -> return ()
      Just c -> case c of
        '+' -> modifyMemory memory (+ 1) memIdx >> goNext
        '-' -> modifyMemory memory (subtract 1) memIdx >> goNext
        '>' -> go (nextMemoryIndex memory memIdx) program'
        '<' -> go (prevMemoryIndex memory memIdx) program'
        ',' -> do
          getChar >>= writeMemory memory memIdx . fromIntegral . ord
          goNext
        '.' -> do
          readMemory memory memIdx >>= putChar . chr . fromIntegral
          goNext
        '[' -> readMemory memory memIdx >>= \case
          0 -> go memIdx $ skipRight 1 program
          _ -> goNext
        ']' -> readMemory memory memIdx >>= \case
          0 -> goNext
          _ -> go memIdx $ skipLeft 1 program
        _ -> goNext
      where
        program' = czMoveRight program
        goNext = go memIdx program'
```

Our main driver here is the tail-recursive `go` function that takes the memory index and the program as inputs. It then gets the current focus of the program zipper, and executes the BF logic accordingly.

If the current focus is `Nothing`, it means the program has finished running. So we end the execution. Otherwise, we switch over the character and do what the BF spec tells us to do.

For `+` and `-`, we increment or decrement respectively the value in the memory cell at the current index, and go to the next character. For `>` and `<`, we increment or decrement the memory index respectively, and go to the next character.

For `,`, we read an ASCII encoded character from the standard input, and write it to the memory at the current memory index as a byte. For `.`, we read the byte from the memory at the current memory index, and write it out to the standard output as an ASCII encoded character. After either cases, we go to the next character.

For `[`, we read the byte at the current memory index, and if it is zero, we skip right over the part of the program till the matching `]` is found. Otherwise, we go to the next character.

For `]`, we skip left over the part of the program till the matching `[` is found, if the current memory byte is non-zero. Otherwise, we go to the next character.

The next two functions implement the skipping logic:

```
skipRight :: Int -> CharZipper -> CharZipper
skipRight !depth !program
  | depth == 0 = program'
  | otherwise = case czFocus program' of
      Nothing -> error "No matching [ while skipping the loop forward"
      Just '[' -> skipRight (depth + 1) program'
      Just ']' -> skipRight (depth - 1) program'
      _ -> skipRight depth program'
  where
    program' = czMoveRight program

skipLeft :: Int -> CharZipper -> CharZipper
skipLeft !depth !program
  | depth == 0 = czMoveRight program
  | otherwise = case czFocus program' of
      Nothing -> error "No matching ] while skipping the loop backward"
      Just ']' -> skipLeft (depth + 1) program'
      Just '[' -> skipLeft (depth - 1) program'
      _ -> skipLeft depth program'
  where
    program' = czMoveLeft program
```

The tail-recursive functions `skipRight` and `skipLeft` skip over parts of the program by moving the focus to right and left respectively, till the matching bracket is found. Since the loops can contain nested loops, we keep track of the depth of loops we are in, and return only when the depth becomes zero. If we move off the program boundaries while skipping, we throw an error.

That’s it! We now have a fully functioning BF interpreter. To test it, we use these two BF programs: [`hanoi.bf`](https://abhinavsarkar.net/code/hanoi.html?mtm_campaign=feed) and [`mandelbrot.bf`](https://abhinavsarkar.net/code/mandelbrot.html?mtm_campaign=feed).

`hanoi.bf` solves the [Tower of Hanoi](https://en.wikipedia.org/wiki/Tower_of_Hanoi) puzzle with animating the solution process as ASCII art:

![A freeze-frame from the animation of solving the Tower of Hanoi puzzle with hanoi.bf](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20925%20547'%3E%3C/svg%3E) \<img src="/images/brainfuck-interpreter/hanoi.svg" class="w-100pct nolink mw-70pct" alt="A freeze-frame from the animation of solving the Tower of Hanoi puzzle with hanoi.bf"\>\</img\> A freeze-frame from the animation of solving the Tower of Hanoi puzzle with `hanoi.bf`

`mandelbrot.bf` prints an ASCII art showing the [Mandelbrot set](https://en.wikipedia.org/wiki/Mandelbrot_set):

![Mandelbrot set ASCII art by mandelbrot.bf](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%201090%20865'%3E%3C/svg%3E) \<img src="/images/brainfuck-interpreter/mandelbrot.svg" class="w-100pct nolink" alt="Mandelbrot set ASCII art by mandelbrot.bf"\>\</img\> Mandelbrot set ASCII art by `mandelbrot.bf`

Both of these BF programs serve as good benchmarks for BF interpreters. Let’s test ours by compiling and running it[<sup>4</sup>](#fn4):

```
❯ nix-shell -p "ghc.withPackages (pkgs: with pkgs; [vector memory])" \
    --run "ghc --make bfi.hs -O2"
[1 of 2] Compiling Main             ( bfi.hs, bfi.o )
[2 of 2] Linking bfi [Objects changed]
❯ time ./bfi -s hanoi.bf > /dev/null
       29.15 real        29.01 user         0.13 sys
❯ time ./bfi -s mandelbrot.bf > /dev/null
       94.86 real        94.11 user         0.50 sys
```

That seems quite slow. We can do better.

AST Interpreter[#](#ast-interpreter)
----------

Instead of executing BF programs from their string representations, we can parse them to an *[Abstract Syntax Tree](https://en.wikipedia.org/wiki/Abstract_Syntax_Tree)* (AST). This allows us to match brackets only once at parse time, instead of doing it repeatedly at run time. We capture loops as AST nodes, allowing us to skip them trivially.

```
data ASTInterpreter

instance Interpreter ASTInterpreter where
  data Program ASTInterpreter = ProgramAST Instructions
  parse = ProgramAST . parseToInstrs
  interpret memory (ProgramAST instrs) = interpretAST memory instrs
```

We represent the BF AST as a Haskell *[Algebraic Data Type](https://en.wikipedia.org/wiki/Algebraic_Data_Type)* (ADT):

```
type Instructions = V.Vector Instruction

data Instruction
  = Inc               -- +
  | Dec               -- -
  | MoveR             -- >
  | MoveL             -- <
  | GetC              -- ,
  | PutC              -- .
  | Loop Instructions -- []
  deriving (Show)
```

There is one constructor per BF instruction, except for loops where the `Loop` constructor captures both the start and end of loop instructions. We use immutable boxed vectors for lists of instructions instead of Haskell lists so that we can index into them in \\(O(1)\\).

We use the parse combinator library [`ReadP`](https://hackage.haskell.org/package/base/docs/Text-ParserCombinators-ReadP.html) to write a recursive-decent parser for BF:

```
parseToInstrs :: String -> Instructions
parseToInstrs code =
  V.fromList $ case P.readP_to_S (P.many instrParser <* P.eof) code of
    [(res, "")] -> res
    out -> error $ "Unexpected output while parsing: " <> show out

instrParser :: P.ReadP Instruction
instrParser = P.choice
  [ P.char '+' $> Inc,
    P.char '-' $> Dec,
    P.char '>' $> MoveR,
    P.char '<' $> MoveL,
    P.char ',' $> GetC,
    P.char '.' $> PutC,
    Loop . V.fromList <$> P.between (P.char '[') (P.char ']') (P.many instrParser)
  ]
```

All cases except the loop one are straightforward. For loops, we call the parser recursively to parse the loop body. Note that the parser matches the loop brackets correctly. If the brackets don’t match, the parser fails.

Next, we interpret the BF AST:

```
interpretAST :: Memory -> Instructions -> IO ()
interpretAST memory = void . interpretInstrs 0 memory

interpretInstrs :: MemIdx -> Memory -> Instructions -> IO MemIdx
interpretInstrs memIdx !memory !program = go memIdx 0
  where
    go !memIdx !progIdx
      | progIdx == V.length program = return memIdx
      | otherwise = case program V.! progIdx of
          Inc -> modifyMemory memory (+ 1) memIdx >> goNext
          Dec -> modifyMemory memory (subtract 1) memIdx >> goNext
          MoveR -> go (nextMemoryIndex memory memIdx) $ progIdx + 1
          MoveL -> go (prevMemoryIndex memory memIdx) $ progIdx + 1
          GetC -> do
            getChar >>= writeMemory memory memIdx . fromIntegral . ord
            goNext
          PutC -> do
            readMemory memory memIdx >>= putChar . chr . fromIntegral
            goNext
          Loop instrs -> readMemory memory memIdx >>= \case
            0 -> goNext
            _ -> interpretInstrs memIdx memory instrs >>= flip go progIdx
      where
        goNext = go memIdx $ progIdx + 1
```

The AST interpreter code is quite similar to the string interpreter one. This time we use an integer as the IP to index the `Instructions` vector. All cases except the loop one are pretty much same as before.

For loops, we read the byte at the current memory index, and if it is zero, we skip executing the `Loop` AST node and go to the next instruction. Otherwise, we recursively interpret the loop body and go to the next instruction, taking care of passing the updated memory index returned from the recursive call to the execution of the next instruction.

And we are done. Let’s see how it performs:

```
❯ time ./bfi -a hanoi.bf > /dev/null
       14.94 real        14.88 user         0.05 sys
❯ time ./bfi -a mandelbrot.bf > /dev/null
       36.49 real        36.32 user         0.17 sys
```

Great! `hanoi.bf` runs 2x faster, whereas `mandelbrot.bf` runs 2.6x faster. Can we do even better?

Bytecode Interpreter[#](#bytecode-interpreter)
----------

AST interpreters are well known to be slow because of how AST nodes are represented in the computer’s memory. The AST nodes contain pointers to other nodes, which may be anywhere in the memory. So while interpreting an AST, it jumps all over the memory, causing a slowdown. One solution to this is to convert the AST into a more compact and optimized representation known as *[Bytecode](https://en.wikipedia.org/wiki/Bytecode)*. That’s what our next interpreter uses.

```
data BytecodeInterpreter

instance Interpreter BytecodeInterpreter where
  data Program BytecodeInterpreter = ProgramBC BA.Bytes
  parse =
    parseToInstrs
      >>> translate
      >>> assemble
      >>> ProgramBC
  interpret memory (ProgramBC bytecode) = interpretBytecode memory bytecode
```

We reuse the parser from the AST interpreter, but then we convert the resultant AST into bytecode by translating and assembling it[<sup>5</sup>](#fn5). We use the [`Bytes`](https://hackage.haskell.org/package/memory/docs/Data-ByteArray.html#t:Bytes) byte array data type from the memory package to represent bytecode.

Unlike AST, bytecode has a flat list of instructions—called *[Opcodes](https://en.wikipedia.org/wiki/Opcodes)*—that can be encoded in a single byte each, with optional parameters. Because of its flat nature and compactness, bytecode is more CPU friendly to execute, which is where it gets its performance from. The downside is that bytecode is not human readable unlike AST.

```
data Opcode
  = OpInc
  | OpDec
  | OpMoveR
  | OpMoveL
  | OpGetC
  | OpPutC
  | OpLoop Opcodes
  | OpClear
  deriving (Show)

type Opcodes = [Opcode]
```

We use the `Opcode` ADT to model the BF opcodes. For now, it corresponds one-to-one with the `Instruction` ADT.

The `translate` function translates `Instructions` to `Opcodes`:

```
translate :: Instructions -> Opcodes
translate = V.toList >>> map translateOpcode
  where
    translateOpcode = \case
      Inc -> OpInc
      Dec -> OpDec
      MoveR -> OpMoveR
      MoveL -> OpMoveL
      GetC -> OpGetC
      PutC -> OpPutC
      Loop instrs -> OpLoop $ translate instrs

```

The `assemble` function assembles `Opcodes` to bytecode byte array:

```
assemble :: Opcodes -> BA.Bytes
assemble = BA.pack . concatMap assembleOpcode

assembleOpcode :: Opcode -> [Word8]
assembleOpcode = \case
  OpInc -> [0]
  OpDec -> [1]
  OpMoveR -> [2]
  OpMoveL -> [3]
  OpGetC -> [4]
  OpPutC -> [5]
  OpLoop body ->
    let assembledBody = concatMap assembleOpcode body
        bodyLen = length assembledBody + 3
     in if bodyLen > 65_536 -- 2 ^ 16
          then error $ "Body of loop is too big: " <> show bodyLen
          else do
            let assembledBodyLen = assembleBodyLen bodyLen
            [6] <> assembledBodyLen <> assembledBody <> [7] <> assembledBodyLen
  OpClear -> [8]
  where
    assembleBodyLen bodyLen =
      let lb = fromIntegral $ bodyLen .&. 0xff
          mb = fromIntegral $ (bodyLen .&. 0xff00) `shiftR` 8
       in [lb, mb] -- assumes Little-endian arch
```

The `assembleOpcode` function assembles an `Opcode` to a list of bytes (`Word8`s). For all cases except for `OpLoop`, we simply return a unique byte for the opcode.

For `OpLoop`, we first recursively assemble the loop body. We encode both the body and the body length in the assembled bytecode, so that the bytecode interpreter can use the body length to skip over the loop body when required. We use two bytes to encode the body length, so we first check if the body length plus three is over 65536 (\\(= 2^8\*2^8\\)). If so, we throw an error. Otherwise, we return:

1. a unique byte for loop start (6),
2. followed by the body length encoded in two bytes (in the *[Little-endian](https://en.wikipedia.org/wiki/Little-endian)* order),
3. then the assembled loop body,
4. followed by a unique byte for loop end (7),
5. finally followed by the encoded body length again.

We encode the body length at the end again so that we can use it to jump backward to the start of the loop, to continue looping. Let’s look at this example to understand the loop encoding better:

```
> code = "++++++++++++++++++++++++++++++++++++++++++++++++>+++++[<+.>-]"
> concatMap assembleOpcode . translate . parseToInstrs $ code
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,6,8,0,3,0,5,2,1,7,8,0]
```

Let’s focus on the last twelve bytes. The diagram below shows the meaning of the various bytes:

![Assembled bytecode for a  loop](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20496%20271'%3E%3C/svg%3E) \<img src="/images/brainfuck-interpreter/bytecode.svg" class="w-100pct nolink mw-70pct" alt="Assembled bytecode for a loop"\>\</img\> Assembled bytecode for a BF loop

The example also demonstrates the flat nature of assembled bytecode. Now, all we have to do is to interpret it:

```
interpretBytecode :: Memory -> BA.Bytes -> IO ()
interpretBytecode memory bytecode =
  MV.unsafeWith
    (unMemory memory)
    (BA.withByteArray bytecode
      . interpretBytecodePtr (memorySize memory) (BA.length bytecode))
```

Instead of using integer indices in the bytecode array and memory vector, this time we use C-style direct [pointers](https://en.wikipedia.org/wiki/Pointer_(computer_programming))[<sup>6</sup>](#fn6):

```
type ProgPtr = Ptr Word8
type MemPtr = Ptr Int8

interpretBytecodePtr :: Int -> Int -> MemPtr -> ProgPtr -> IO ()
interpretBytecodePtr memLen programLen memStartPtr progStartPtr =
  go memStartPtr progStartPtr
  where
    progEndPtr = progStartPtr `plusProgPtr` programLen
    memEndPtr = memStartPtr `plusMemPtr` memLen

    go !memPtr !progPtr
      | progPtr == progEndPtr = return ()
      | otherwise = readProg >>= \case
          0 -> modifyMem (+ 1) >> goNext                           -- Inc
          1 -> modifyMem (subtract 1) >> goNext                    -- Dec
          2 -> jump (nextMemPtr memStartPtr memEndPtr memPtr 1) 1  -- MoveR
          3 -> jump (prevMemPtr memStartPtr memEndPtr memPtr 1) 1  -- MoveL
          4 -> getChar >>= writeMem . fromIntegral . ord >> goNext -- GetC
          5 -> readMem >>= putChar . chr . fromIntegral >> goNext  -- PutC
          6 -> readMem >>= \case                                   -- Loop start
            0 -> readProg2 >>= jump memPtr
            _ -> jump memPtr 3
          7 -> readMem >>= \case                                   -- Loop end
            0 -> jump memPtr 3
            _ -> readProg2 >>= jump memPtr . negate
          8 -> writeMem 0 >> goNext                                -- Clear
          op -> error $ "Unknown opcode: " <> show op
      where
        goNext = jump memPtr 1
        jump memPtr offset = go memPtr $ progPtr `plusProgPtr` offset

        readProg = S.peek progPtr
        readProg2 = -- assumes Little-endian arch
          fromIntegral <$> S.peek (castPtr @_ @Word16 $ progPtr `plusProgPtr` 1)

        readMem = S.peek memPtr
        writeMem = S.poke memPtr
        modifyMem f = readMem >>= writeMem . f
```

In Haskell, the pointer type [`Ptr`](https://hackage.haskell.org/package/base/docs/Foreign-Ptr.html#t:Ptr) is parametrized by the type of the data it points to. We have two types of pointers here, one that points to the bytecode program, and another that points to the memory cells. So in this case, the IP and DP are actually pointers.

The `go` function here is again the core of the interpreter loop. We track the current IP and DP in it, and execute the logic corresponding to the opcode at the current memory location. `go` ends when the IP points to the end of the program byte array.

Most of the cases in `go` are similar to previous interpreters. Only difference is that we use pointers to read the current opcode and memory cell. For the loop start opcode, we read the byte pointed to by the DP, and if it is zero, we read the next two bytes from the program bytecode, and use it as the offset to jump the IP by to skip over the loop body. Otherwise, we jump the IP by 3 bytes to skip over the loop start opcode and encoded loop body length bytes. For the loop end opcode, we follow similar steps, except we jump backward to the start of the loop.

The helper functions for doing pointer arithmetic are following:

```
plusProgPtr :: ProgPtr -> Int -> ProgPtr
plusProgPtr = plusPtr

plusMemPtr :: MemPtr -> Int -> MemPtr
plusMemPtr = plusPtr

nextMemPtr :: MemPtr -> MemPtr -> MemPtr -> Int -> MemPtr
nextMemPtr memStartPtr memEndPtr memPtr inc =
  let memPtr' = memPtr `plusMemPtr` inc
   in if memEndPtr > memPtr'
        then memPtr'
        else memStartPtr `plusPtr` (memPtr' `minusPtr` memEndPtr)

prevMemPtr :: MemPtr -> MemPtr -> MemPtr -> Int -> MemPtr
prevMemPtr memStartPtr memEndPtr memPtr inc =
  let memPtr' = memPtr `plusMemPtr` (-1 * inc)
   in if memPtr' >= memStartPtr
        then memPtr'
        else memEndPtr `plusPtr` (memPtr' `minusPtr` memStartPtr)
```

`nextMemPtr` and `prevMemPtr` implement wrapping of pointers as we [do for memory indices](#cb3-1) in `nextMemoryIndex` and `prevMemoryIndex`. Let’s see what the results of our hard work are:

```
❯ time ./bfi -b hanoi.bf > /dev/null
       11.10 real        11.04 user         0.04 sys
❯ time ./bfi -b mandelbrot.bf > /dev/null
       15.72 real        15.68 user         0.04 sys
```

1.3x and 2.3x speedups for `hanoi.bf` and `mandelbrot.bf` respectively over the AST interpreter. Not bad. But surely we can do even better?

Optimizing Bytecode Interpreter[#](#optimizing-bytecode-interpreter)
----------

We can optimize our bytecode interpreter by emitting specialized opcodes for particular patterns of opcodes that occur frequently. Think of it as replacing every occurrence of a long phrase in a text with a single word that means the same, leading to a shorter text and faster reading time. Since BF is so verbose, there are many opportunities for optimizing BF bytecode[<sup>7</sup>](#fn7). We are going to implement only one simple optimization, just to get a taste of how to do it.

```
data OptimizingBytecodeInterpreter

instance Interpreter OptimizingBytecodeInterpreter where
  data Program OptimizingBytecodeInterpreter = ProgramOBC BA.Bytes
  parse =
    parseToInstrs
      >>> translate
      >>> optimize
      >>> assemble
      >>> ProgramOBC
  interpret memory (ProgramOBC bytecode) = interpretBytecode memory bytecode
```

The optimizing bytecode interpreter is pretty much same as the bytecode interpreter, with the `optimize` function called between the translation and assembly phases.

The pattern of opcode we are optimizing for is `[-]` and `[+]`. Both of these BF opcodes when executed, decrement or increment the current memory cell till it becomes zero. In effect, these patterns clear the current cell. We start the process by adding a new `Opcode` for clearing a cell:

```
data Opcode
  = OpInc
  | OpDec
  | OpMoveR
  | OpMoveL
  | OpGetC
  | OpPutC
  | OpLoop Opcodes
  | OpClear
  deriving (Show)

type Opcodes = [Opcode]
```

The `optimize` function recursively goes over the `Opcodes`, and emits optimized ones by replacing the patterns that clear the current cell with `OpClear`:

```
optimize :: Opcodes -> Opcodes
optimize = map $ \case
  OpLoop [OpDec] -> OpClear
  OpLoop [OpInc] -> OpClear
  OpLoop body -> OpLoop $ optimize body
  op -> op
```

Then we modify the `assembleOpcode` function to emit a unique byte for `OpClear`:

```
assembleOpcode :: Opcode -> [Word8]
assembleOpcode = \case
  OpInc -> [0]
  OpDec -> [1]
  OpMoveR -> [2]
  OpMoveL -> [3]
  OpGetC -> [4]
  OpPutC -> [5]
  OpLoop body ->
    let assembledBody = concatMap assembleOpcode body
        bodyLen = length assembledBody + 3
     in if bodyLen > 65_536 -- 2 ^ 16
          then error $ "Body of loop is too big: " <> show bodyLen
          else do
            let assembledBodyLen = assembleBodyLen bodyLen
            [6] <> assembledBodyLen <> assembledBody <> [7] <> assembledBodyLen
  OpClear -> [8]
```

Finally, we modify the bytecode interpreter to execute the `OpClear` opcode.

```
go !memPtr !progPtr
  | progPtr == progEndPtr = return ()
  | otherwise = readProg >>= \case
      0 -> modifyMem (+ 1) >> goNext                           -- Inc
      1 -> modifyMem (subtract 1) >> goNext                    -- Dec
      2 -> jump (nextMemPtr memStartPtr memEndPtr memPtr 1) 1  -- MoveR
      3 -> jump (prevMemPtr memStartPtr memEndPtr memPtr 1) 1  -- MoveL
      4 -> getChar >>= writeMem . fromIntegral . ord >> goNext -- GetC
      5 -> readMem >>= putChar . chr . fromIntegral >> goNext  -- PutC
      6 -> readMem >>= \case                                   -- Loop start
        0 -> readProg2 >>= jump memPtr
        _ -> jump memPtr 3
      7 -> readMem >>= \case                                   -- Loop end
        0 -> jump memPtr 3
        _ -> readProg2 >>= jump memPtr . negate
      8 -> writeMem 0 >> goNext                                -- Clear
      op -> error $ "Unknown opcode: " <> show op
```

We can see how the patterns `[-]` and `[+]` that may execute operations tens, maybe hundreds, of times, are replaced by a single operation in the interpreter now. This is what gives us the speedup in this case. Let’s run it:

```
❯ time ./bfi -o hanoi.bf > /dev/null
        4.07 real         4.04 user         0.01 sys
❯ time ./bfi -o mandelbrot.bf > /dev/null
       15.58 real        15.53 user         0.04 sys
```

`hanoi.bf` runs 2.7x faster, whereas `mandelbrot.bf` is barely 1% faster as compared to the non-optimizing bytecode interpreter. This demonstrates how different optimizations apply to different programs, and hence the need to implement a wide variety of them to be able to optimize all programs well.

Comparison[#](#comparison)
----------

It’s time for a final comparison of the run times of the four interpreters:

|    Interpreter    |Hanoi |Mandelbrot|
|-------------------|------|----------|
|      String       |29.15s|  94.86s  |
|        AST        |14.94s|  36.49s  |
|     Bytecode      |11.10s|  15.72s  |
|Optimizing Bytecode|4.07s |  15.58s  |

The final interpreter is 7x faster than the baseline one for `hanoi.bf`, and 6x faster for `mandelbrot.bf`. Here’s the same data as a chart:

[![Run time of the four interpreters](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20800%20600'%3E%3C/svg%3E) \<img src="/images/plots/pandocplot3569819420457630450.svg" class="w-100pct mw-80pct" alt="Run time of the four interpreters"\>\</img\>](https://abhinavsarkar.net/images/plots/pandocplot3569819420457630450.svg) Run time of the four interpreters

That’s it for this post. I hope you enjoyed it and took something away from it. In a future post, we’ll explore more optimization for our BF interpreter. The full code for this post is available [here](https://abhinavsarkar.net/code/bfi.html?mtm_campaign=feed).

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. BF is Turning-complete. That means it can be used to implement any computable program. However, it is a Turing tarpit, which means it is not feasible to write any useful programs in it because of its lack of abstractions.[↩︎](#fnref1)

2. A string interpreter also serves as an useful baseline for measuring the performance of BF interpreters. That’s why I decided to use strings instead of [`Data.Text`](https://hackage.haskell.org/package/text/docs/Data-Text.html#t:Text) or [`Data.Sequence`](https://hackage.haskell.org/package/containers/docs/Data-Sequence.html#t:Seq), which are more performant.[↩︎](#fnref2)

3. I am a big fan of zippers, as evidenced by [this growing list](https://abhinavsarkar.net/tags/zippers/?mtm_campaign=feed) of posts that I use them in.[↩︎](#fnref3)

4. We use [Nix](https://nixos.org) for getting the dependency libraries.[↩︎](#fnref4)

5. If you are unfamiliar, [`>>>`](https://hackage.haskell.org/package/base/docs/Control-Arrow.html#v:-62--62--62-) is the left-to-right function composition function:

   ```
   f >>> g = g . f
   ```

   [↩︎](#fnref5)
6. While the only way to access byte arrays is pointers, we could have continued accessing the memory vector using indices. I benchmarked both methods, and found that using pointers for memory access sped up the execution of `hanoi.bf` by 1.1x and `mandelbrot.bf` by 1.6x as compared to index-based access. It’s also nice to learn how to use pointers in Haskell. This is why we chose to use [`Storable`](https://hackage.haskell.org/package/vector/docs/Data-Vector-Storable.html#g:1) vectors for the memory.[↩︎](#fnref6)

7. See [BFC](https://bfc.wilfred.me.uk), which touts itself as “an industrial-grade Brainfuck compiler”, with a huge list of optimizations.[↩︎](#fnref7)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/brainfuck-interpreter/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/113856008812394988)
* [Lobsters](https://lobste.rs/s/hi2md7)
* [Reddit](https://www.reddit.com/r/haskell/comments/1i52mi8/)
* [Discourse](https://discourse.haskell.org/t//11238)
* [Hacker News](https://news.ycombinator.com/item?id=42758614)
* [My website](https://abhinavsarkar.net/posts/brainfuck-interpreter/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)