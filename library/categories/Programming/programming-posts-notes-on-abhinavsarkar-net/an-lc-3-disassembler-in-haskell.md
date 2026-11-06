+++
title = "An LC-3 Disassembler in Haskell"
description = "LC-3 assembly is an educational programming language. It is simple enough that complex programs can be written directly in it without needing a compiler, and thus it is often used in teaching assembly. An LC-3 textual assembly pr"
date = "2026-10-31T00:00:00Z"
url = "https://abhinavsarkar.net/posts/lc3-disassembler/"
author = "Abhinav Sarkar"
text = ""
lastupdated = "2026-11-02T23:27:05.115941263Z"
seen = false
+++

LC-3 assembly is an educational programming language. It is simple enough that complex programs can be written directly in it without needing a compiler, and thus it is often used in teaching assembly. An [LC-3](https://en.wikipedia.org/wiki/Little_Computer_3) textual assembly program is compiled to a binary object file by an assembler, and then executed by a [virtual machine](https://en.wikipedia.org/wiki/Virtual_machine#Process_virtual_machines). Writing a virtual machine for LC-3 is a fun little exercise. However, in this post, we implement a disassembler for compiled LC-3 binaries back to textual assembly programs.

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/lc3-disassembler/?mtm_campaign=feed).

### Contents ###

1. [Introduction to LC-3](#introduction-to-lc-3)
2. [Problem in Disassembling LC-3](#problem-in-disassembling-lc-3)
3. [Setting Up](#setting-up)
4. [Decoding Instructions](#decoding-instructions)
5. [Basic Disassembly](#basic-disassembly)
6. [Fixed-Point Cleanup](#fixed-point-cleanup)
7. [Postprocessing](#postprocessing)
8. [Pretty-Printing](#pretty-printing)
9. [Reading the Binary](#reading-the-binary)
10. [Finishing Up](#finishing-up)
11. [Conclusion](#conclusion)

Introduction to LC-3[#](#introduction-to-lc-3)
----------

LC-3 has a simple [instruction set](https://www.jmeiners.com/lc3-vm/supplies/lc3-isa.pdf) with only 18 instructions. It works with eight 16-bit registers (numbered from 0 to 7), and 16-bit addressable memory. LC-3 instructions are also 16-bit, with first four bits used for opcodes, and the rest for instruction arguments.

![LC-3 Instruction Set Architecture](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20361%201117'%3E%3C/svg%3E) \<img src="/images/lc3-disassembler/lc3-isa.svg" class="w-50pct nolink" alt="LC-3 Instruction Set Architecture"\>\</img\> LC-3 Instruction Set Architecture

There are instructions for doing arithmetic and bitwise logical operations, conditional branching, executing subroutines, loading from and storing to memory, handling interrupts and doing system calls. Some of them take source, destination, and base registers as arguments (`SR`, `DR`, and `BR` respectively in the diagram above). Others take integer immediate values, program counter, and address offsets (`imm`, `PCOffset`, and `offset` respectively in the diagram above). The `TRAP` instruction take a code for the syscall to execute. Notice that we count the bits from right to left, zero-indexed.

When written in the textual assembly format, we use mnemonics for the opcodes and syscalls. The eight registers are written as `R0` to `R7`. The instructions can be labeled and referred from other instructions using them. Let’s start by looking at a simple LC-3 assembly file:

```
; LC−3 Program that prints
; "Hello World!" to the console
.ORIG x3000
LEA R0, HW                 ; load address of string
PUTS                       ; print string to console
HALT                       ; halt program
HW .STRINGZ "Hello World!" ; string data
.END
```

As seen above, the assembly file can also contain assembler directives such as `.STRINGZ`, `.FILL`, `.BLKW`, `.ORIG`, and `.END`. Quoting the [`lc3asm`](https://github.com/falvarezb/lc3asm) docs:

> `.ORIG`  tells the assembler where in memory to place the LC-3 program. `.FILL`  tells the assembler to set aside the next location in the program and initialize it with the value of the operand. `.BLKW`  tells the assembler to set aside some number of sequential memory locations (BLocK of Words) in the program. `.STRINGZ`  tells the assembler to initialize a sequence of n + 1 memory locations; the argument is a sequence of n characters, inside double quotation marks; the first n words of memory are initialized with the zero-extended ASCII codes of the corresponding characters in the string; the final word of memory is initialized to 0. `.END`  tells the assembler where the program ends; any characters that come after .END are ignored by the assembler.

We assemble the program with the `lc3asm` assembler, and then execute the resultant binary with the [`lc3`](https://www.jmeiners.com/lc3-vm/src/lc3.c) VM[<sup>1</sup>](#fn1):

```
$ lc3as hello.asm
$ lc3 hello.obj
Hello World!
```

It works as expected! As much fun as it would be to write an assembler and a VM, in this post, we don’t assemble or run LC-3 programs, we **disassemble** them. We don’t care *what* the instructions do, only *how* they are encoded.

Problem in Disassembling LC-3[#](#problem-in-disassembling-lc-3)
----------

Unlike an object file generated from [X86](https://en.wikipedia.org/wiki/X86) or [Arm](https://en.wikipedia.org/wiki/Arm) assembly, an LC-3 object file does not contain section tables separating code from data, symbol tables indicating function and variable names, relocation information, or debug symbols[<sup>2</sup>](#fn2). It contains only raw binary instructions and data that are freely intermixed in a single address space. This is made necessary by the fact that LC-3 has only 16-bit addressable memory. So data blocks and read-write memory addressed from code has to be within \\(2^{16}\\) bits or 8192 bytes of the code addressing it.

Consider these bytes:

```
0100 0001 0000 0000    ; Instruction: JSRR R6
0100 0001 0000 0000    ; Or is it data?
```

A disassembler looking only at binary code has no context. A 16-bit word that decodes perfectly as a legal instruction may actually be a character, a part of a packed string, a number/byte literal, or a memory address. We need context to decode correctly, so the disassembler works in multiple passes:

1. First, we decode instructions that are unambiguous.
2. Then, we use the context of the decoded instructions to speculatively decode the rest of the instructions/data. We repeat this till a fixed point is reached.
3. Next, we clean up the data by combining bytes.
4. Finally, we insert labels at the right places.

Let’s go over the disassembler part-by-part.

Setting Up[#](#setting-up)
----------

First, the imports:

```
{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}

module LC3Disassembler where

import Control.Arrow ((>>>))
import Control.Monad (forM, forM_, unless, when)
import Control.Monad.ST.Strict (ST, runST)
import Data.Bits (Bits (..))
import Data.ByteString qualified as BS
import Data.Char qualified as Char
import Data.Functor ((<&>))
import Data.Int (Int16)
import Data.List qualified as List
import Data.List.Split qualified as List
import Data.Set qualified as Set
import Data.Vector qualified as V
import Data.Vector.Mutable qualified as MV
import Data.Vector.Unboxed qualified as UV
import Data.Vector.Unboxed.Mutable qualified as MUV
import Data.Word (Word16, Word8)
import System.Exit (exitFailure)
import Text.Printf (printf)
```

We use the [vector](https://hackage.haskell.org/package/vector) library for instruction lists, and the [`ST`](https://hackage.haskell.org/package/base/docs/Control-Monad-ST.html#t:ST) monad for manipulating them mutably. We also use [bytestring](https://hackage.haskell.org/package/bytestring/) for doing binary IO.

Here are the data types we use:

```
data Register
  = RegR0
  | RegR1
  | RegR2
  | RegR3
  | RegR4
  | RegR5
  | RegR6
  | RegR7
  deriving (Show, Enum)

data Flag = FlagNeg | FlagZer | FlagPos deriving (Eq, Ord, Show)

data TrapRoutine
  = TrapGETC
  | TrapOUT
  | TrapPUTS
  | TrapIN
  | TrapPUTSP
  | TrapHALT
  | TrapUNKNOWN Word8
  deriving (Show)

data Instruction
  = ADD
      { destReg :: Register,
        sourceReg1 :: Register,
        source2 :: Either Register Int16
      }
  | AND
      { destReg :: Register,
        sourceReg1 :: Register,
        source2 :: Either Register Int16
      }
  | BR
      { flags :: Set.Set Flag,
        pcOffset :: Int16,
        label :: Maybe String,
        raw :: Word16
      }
  | JMP {baseReg :: Register}
  | RET
  | JSR {pcOffset :: Int16, label :: Maybe String, raw :: Word16}
  | JSRR {baseReg :: Register}
  | LD {destReg :: Register, pcOffset :: Int16, raw :: Word16}
  | LDI {destReg :: Register, pcOffset :: Int16, raw :: Word16}
  | LDR {destReg :: Register, baseReg :: Register, offset :: Int16}
  | LEA {destReg :: Register, pcOffset :: Int16}
  | NOT {destReg :: Register, sourceReg :: Register}
  | RTI
  | ST {sourceReg :: Register, pcOffset :: Int16, raw :: Word16}
  | STI {sourceReg :: Register, pcOffset :: Int16, raw :: Word16}
  | STR {sourceReg :: Register, baseReg :: Register, offset :: Int16}
  | TRAP {trapRoutine :: TrapRoutine}
  | INVALID
  | RAW Word16
  | CHAR Char
  | STRING String
  | LABEL String
  | SPECULATION {origInstr :: Instruction, specualtedInstr :: Instruction}
  deriving (Show)

type BinCode = UV.Vector Word16

data Object = Object {origin :: Word16, code :: BinCode}
  deriving (Show)
```

The `Register` type enumerates the eight LC-3 registers. The `Flag` type represents the condition codes used for conditional jumping, which are negative, zero and positive.

The `TrapRoutine` type enumerates the eight standard LC-3 trap codes used for doing IO and halting the programs:

|  Code   |                                                 Description                                                  |
|---------|--------------------------------------------------------------------------------------------------------------|
| `GETC`  |                                       Reads one character from STDIN.                                        |
|  `OUT`  |                                       Prints one character to STDOUT.                                        |
| `PUTS`  |Prints a null-terminated [ASCII](https://en.wikipedia.org/wiki/ASCII) one-character-per-word string to STDOUT.|
|  `IN`   |                        Prints a prompt to STDOUT and reads one character from STDIN.                         |
| `PUTSP` |                   Prints a null-terminated ASCII two-characters-per-word string to STDOUT.                   |
| `HALT`  |                                         Halts the program execution.                                         |
|`UNKNOWN`|                                   Represents an unknown trap routine code.                                   |

The `Instruction` type is the heart of the disassembler. It doesn’t represent only the real LC-3 instructions, but also adds more constructors that are useful for disassembling:

* `ADD` to `TRAP` are the real LC-3 instructions.
* `INVALID` represents the one reserved opcode `1101` that the ISA defines as invalid[<sup>3</sup>](#fn3).
* `RAW` is for capturing raw encoded binary data.
* `CHAR` represents a single character.
* `STRING` represents a string, that is a sequence of characters.
* `LABEL` is a textual label used to annotate instructions that other instructions may jump to. It doesn’t exist in binary data, and is inserted by the disassembler.
* `SPECULATION` is a speculated instruction. It holds both the original instruction decoded from the binary data, and the guessed instruction depending on the context.

This representation lets us handle ambiguous data. Also note that we capture the raw bytes in some instructions like `BR` and `JSR`.

Finally, `BinCode` represents entire 16-bit binary code, and `Object` is the type for representing an LC-3 object file with an origin address and the binary code.

### Type-Safe Bit Matching[#](#type-safe-bit-matching) ###

Since we work a lot with bits here, we define some patterns to make it easier and less error-prone:

```
newtype Tribit = Tribit Word16

tribit :: Word16 -> Tribit
tribit w = Tribit $ w .&. 0b111

pattern B000, B001, B010, B011, B100, B101, B110, B111 :: Tribit
pattern B000 = Tribit 0b000
pattern B001 = Tribit 0b001
pattern B010 = Tribit 0b010
pattern B011 = Tribit 0b011
pattern B100 = Tribit 0b100
pattern B101 = Tribit 0b101
pattern B110 = Tribit 0b110
pattern B111 = Tribit 0b111

{-# COMPLETE B000, B001, B010, B011, B100, B101, B110, B111 #-}

newtype Nibble = Nibble Word16

nibble :: Word16 -> Nibble
nibble w = Nibble $ w .&. 0b1111

pattern B0000, B0001, B0010, B0011, B0100, B0101, B0110, B0111,
        B1000, B1001, B1010, B1011, B1100, B1101, B1110, B1111 :: Nibble
pattern B0000 = Nibble 0b0000
pattern B0001 = Nibble 0b0001
pattern B0010 = Nibble 0b0010
pattern B0011 = Nibble 0b0011
pattern B0100 = Nibble 0b0100
pattern B0101 = Nibble 0b0101
pattern B0110 = Nibble 0b0110
pattern B0111 = Nibble 0b0111
pattern B1000 = Nibble 0b1000
pattern B1001 = Nibble 0b1001
pattern B1010 = Nibble 0b1010
pattern B1011 = Nibble 0b1011
pattern B1100 = Nibble 0b1100
pattern B1101 = Nibble 0b1101
pattern B1110 = Nibble 0b1110
pattern B1111 = Nibble 0b1111

{-# COMPLETE B0000, B0001, B0010, B0011, B0100, B0101, B0110, B0111,
             B1000, B1001, B1010, B1011, B1100, B1101, B1110, B1111 #-}
```

Each LC-3 instruction has a 4-bit opcode, and many have 3-bit register or flag fields. So, we define two new types: `Tribit` (3-bit) and `Nibble` (4-bit), with pattern synonyms for exhaustive pattern matching.

By defining patterns `B0000` through `B1111`, we map directly to the ISA specification. For example, `B0101` visually shows the bit pattern for the `AND` opcode. GHC’s `COMPLETE` pragma enforces exhaustiveness, so no fallback cases are needed. The smart constructor functions `tribit` and `nibble` take the least significant 3 or 4 bits of the passed 16-bit parameter respectively, and return respective typed bits.

Decoding Instructions[#](#decoding-instructions)
----------

First, we decode the registers and trap routines:

```
decodeRegister :: Word16 -> Register
decodeRegister = tribit >>> \case
  B000 -> RegR0
  B001 -> RegR1
  B010 -> RegR2
  B011 -> RegR3
  B100 -> RegR4
  B101 -> RegR5
  B110 -> RegR6
  B111 -> RegR7

decodeTrapRoutine :: Word8 -> TrapRoutine
decodeTrapRoutine = \case
  0x20 -> TrapGETC
  0x21 -> TrapOUT
  0x22 -> TrapPUTS
  0x23 -> TrapIN
  0x24 -> TrapPUTSP
  0x25 -> TrapHALT
  n -> TrapUNKNOWN n
```

We see the bit patterns in action here. The trap routines codes are as defined in the ISA.

Next, the `decodeInstruction` function extracts the opcode nibble (the most significant four bits), and decodes the arguments by calling `decodeInstruction'`, which dispatches on the opcodes:

```
decodeInstruction :: Word16 -> Instruction
decodeInstruction instr =
  decodeInstruction' instr $ nibble $ instr `shiftR` 12
```

Now, we go over decoding of each instruction one-by-one.

### `ADD`[#](#add) ###

`ADD` has two variations: one that takes two source registers, and another that takes one source register and one immediate value.

![LC-3  Instruction](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20298%20109'%3E%3C/svg%3E) \<img src="/images/lc3-disassembler/lc3-add.svg" class="w-50pct nolink" alt="LC-3 Instruction"\>\</img\> LC-3 `ADD` Instruction

```
signExtendedBits :: Word16 -> Int -> Int16
signExtendedBits instr n =
  fromIntegral (instr `shiftL` (16 - n)) `shiftR` (16 - n)

decodeInstruction' :: Word16 -> Nibble -> Instruction
decodeInstruction' instr B0001 =
  let destReg = decodeRegister $ instr `shiftR` 9
      sourceReg1 = decodeRegister $ instr `shiftR` 6
      mSource2 = case (instr `shiftR` 5) `testBit` 0 of
        False -> case (instr `shiftR` 3) .&. 0b11 of
          0 -> Just $ Left $ decodeRegister instr
          _ -> Nothing
        True -> Just $ Right $ signExtendedBits instr 5
   in case mSource2 of
        Just source2 -> ADD {..}
        Nothing -> RAW instr
```

First, we extract and decode the destination and first source register. Then depending on the sixth bit, we either decode the second source register or the value. The value is [sign extended](https://en.wikipedia.org/wiki/Sign_extension) by calling the helper function `signExtendedBits`. When decoding the second register, if we find that the forth and fifth bits are not `0`, that means this is not a valid `ADD` instruction. In that case, we return the raw bytes wrapped in the `RAW` constructor, because the malformed instructions are far more likely to be data that happens to have an opcode prefix. Capturing them as `RAW` lets us treat them as data in the later steps.

This same pattern is used in decoding other instructions as well: extract and decode registers, flags, and values, and check fixed bits for validity. If valid, return the decoded instruction, or else the raw bytes.

### `AND`[#](#and) ###

The `AND` instruction has exactly same format as the `ADD` instruction, except for the different opcode.

![LC-3  Instruction](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20298%20109'%3E%3C/svg%3E) \<img src="/images/lc3-disassembler/lc3-and.svg" class="w-50pct nolink" alt="LC-3 Instruction"\>\</img\> LC-3 `AND` Instruction

```
decodeInstruction' instr B0101 =
  let destReg = decodeRegister $ instr `shiftR` 9
      sourceReg1 = decodeRegister $ instr `shiftR` 6
      mSource2 = case (instr `shiftR` 5) `testBit` 0 of
        False -> do
          case (instr `shiftR` 3) .&. 0b11 of
            0 -> Just $ Left $ decodeRegister instr
            _ -> Nothing
        True -> Just $ Right $ signExtendedBits instr 5
   in case mSource2 of
        Just source2 -> AND {..}
        Nothing -> RAW instr
```

### `NOT`[#](#not) ###

To decode the `NOT` instruction, we decode the registers and check for the fixed bits.

![LC-3  Instruction](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20298%2055'%3E%3C/svg%3E) \<img src="/images/lc3-disassembler/lc3-not.svg" class="w-50pct nolink" alt="LC-3 Instruction"\>\</img\> LC-3 `NOT` Instruction

```
decodeInstruction' instr B1001 = case instr .&. 0b111111 of
  0b111111 -> do
    let destReg = decodeRegister $ instr `shiftR` 9
        sourceReg = decodeRegister $ instr `shiftR` 6
    NOT {..}
  _ -> RAW instr
```

### `BR`[#](#br) ###

Decoding the `BR` instruction requires us to decode the condition flags, which is a straightforward mapping from their bit patterns.

![LC-3  Instruction](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20298%2055'%3E%3C/svg%3E) \<img src="/images/lc3-disassembler/lc3-br.svg" class="w-50pct nolink" alt="LC-3 Instruction"\>\</img\> LC-3 `BR` Instruction

```
decodeInstruction' instr B0000 =
  let flagSet = case tribit $ instr `shiftR` 9 of
        B000 -> Nothing
        B001 -> Just $ Set.fromList [FlagPos]
        B010 -> Just $ Set.fromList [FlagZer]
        B100 -> Just $ Set.fromList [FlagNeg]
        B011 -> Just $ Set.fromList [FlagZer, FlagPos]
        B110 -> Just $ Set.fromList [FlagNeg, FlagZer]
        B101 -> Just $ Set.fromList [FlagNeg, FlagPos]
        B111 -> Just $ Set.fromList [FlagNeg, FlagZer, FlagPos]
   in case flagSet of
        Nothing ->
          let c = Char.chr $ fromIntegral instr
           in if Char.isAscii c then CHAR c else RAW instr
        Just flags -> BR {
            pcOffset = signExtendedBits instr 9,
            label = Nothing,
            raw = instr,
            ..
          }
```

In case no flags are set, the instruction is likely to be an ASCII character instead with the high byte set to `b0000_0000`, so we add a special check for that. Note that we capture the raw byte in the output instruction, to be used later.

### `RET`/`JMP`[#](#retjmp) ###

The `RET` and `JMP` instructions have same opcode, but differ in the bits 7–9, which are set to `111` for `RET`. Note that the function also checks for the fixed bits, failing which it returns a `RAW` instruction.

![LC-3 / Instruction](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20298%20109'%3E%3C/svg%3E) \<img src="/images/lc3-disassembler/lc3-ret.svg" class="w-50pct nolink" alt="LC-3 / Instruction"\>\</img\> LC-3 `RET`/`JMP` Instruction

```
decodeInstruction' instr B1100 =
  case (tribit $ instr `shiftR` 9, instr .&. 0b111111) of
    (B000, 0) -> case tribit $ instr `shiftR` 6 of
      B111 -> RET
      Tribit n -> JMP $ decodeRegister n
    _ -> RAW instr
```

### `JSR`/`JSRR`[#](#jsrjsrr) ###

The `JSR` and `JSRR` instructions have the same opcode, differing in the 12th bit.

![LC-3 / Instruction](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20298%20109'%3E%3C/svg%3E) \<img src="/images/lc3-disassembler/lc3-jsr.svg" class="w-50pct nolink" alt="LC-3 / Instruction"\>\</img\> LC-3 `JSR`/`JSRR` Instruction

```
decodeInstruction' instr B0100 =
  case (instr `shiftR` 11) `testBit` 0 of
    True -> JSR (signExtendedBits instr 11) Nothing instr
    False -> case ((instr `shiftR` 9) .&. 0b11, instr .&. 0b1111_11) of
      (0, 0) -> JSRR $ decodeRegister $ instr `shiftR` 6
      _ -> RAW instr
```

### `LD`/`LDI`/`LDR`[#](#ldldildr) ###

Decoding the `LD`, `LDI` and `LDR` instructions is a straightforward matter of decoding their registers and offsets. Notice that the `LD` and `LDI` instructions also capture the raw bytes.

![LC-3 // Instruction](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20298%20163'%3E%3C/svg%3E) \<img src="/images/lc3-disassembler/lc3-ld.svg" class="w-50pct nolink" alt="LC-3 // Instruction"\>\</img\> LC-3 `LD`/`LDI`/`LDR` Instruction

```
decodeInstruction' instr B0010 =
  LD (decodeRegister $ instr `shiftR` 9) (signExtendedBits instr 9) instr

decodeInstruction' instr B1010 =
  LDI (decodeRegister $ instr `shiftR` 9) (signExtendedBits instr 9) instr

decodeInstruction' instr B0110 =
  let destReg = decodeRegister $ instr `shiftR` 9
      baseReg = decodeRegister $ instr `shiftR` 6
      offset = signExtendedBits instr 6
   in LDR {..}
```

### `ST`/`STI`/`STR`[#](#ststistr) ###

Decoding the `ST`, `STI` and `STR` instructions is similar to the `LD`, `LDI` and `LDR` instructions.

![LC-3 // Instruction](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20298%20163'%3E%3C/svg%3E) \<img src="/images/lc3-disassembler/lc3-st.svg" class="w-50pct nolink" alt="LC-3 // Instruction"\>\</img\> LC-3 `ST`/`STI`/`STR` Instruction

```
decodeInstruction' instr B0011 =
  ST (decodeRegister $ instr `shiftR` 9) (signExtendedBits instr 9) instr

decodeInstruction' instr B1011 =
  STI (decodeRegister $ instr `shiftR` 9) (signExtendedBits instr 9) instr

decodeInstruction' instr B0111 =
  let sourceReg = decodeRegister $ instr `shiftR` 9
      baseReg = decodeRegister $ instr `shiftR` 6
      offset = signExtendedBits instr 6
   in STR {..}
```

### `LEA`[#](#lea) ###

Again, straightforward decoding of register and offset:

![LC-3  Instruction](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20298%2055'%3E%3C/svg%3E) \<img src="/images/lc3-disassembler/lc3-lea.svg" class="w-50pct nolink" alt="LC-3 Instruction"\>\</img\> LC-3 `LEA` Instruction

```
decodeInstruction' instr B1110 =
  LEA (decodeRegister $ instr `shiftR` 9) (signExtendedBits instr 9)
```

### `RTI`[#](#rti) ###

The `RTI` instruction is a constant byte pattern.

![LC-3  Instruction](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20298%2055'%3E%3C/svg%3E) \<img src="/images/lc3-disassembler/lc3-rti.svg" class="w-50pct nolink" alt="LC-3 Instruction"\>\</img\> LC-3 `RTI` Instruction

```
decodeInstruction' instr B1000 = case instr .&. 0b1111_1111_1111 of
  0 -> RTI
  _ -> RAW instr
```

### `TRAP`[#](#trap) ###

Decoding the `TRAP` instruction requires us to decode the trap routines.

![LC-3  Instruction](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20298%2055'%3E%3C/svg%3E) \<img src="/images/lc3-disassembler/lc3-trap.svg" class="w-50pct nolink" alt="LC-3 Instruction"\>\</img\> LC-3 `TRAP` Instruction

```
decodeInstruction' instr B1111 = case (instr `shiftR` 8) .&. 0b1111 of
  0 -> TRAP $ decodeTrapRoutine $ fromIntegral $ instr .&. 0b1111_1111
  _ -> RAW instr
```

### `INVALID`[#](#invalid) ###

We don’t care about the rest of the bytes if the opcode is for the `INVALID` instruction.

![LC-3  Instruction](data:image/svg+xml,%3Csvg%20xmlns='http://www.w3.org/2000/svg'%20viewBox='0%200%20298%2055'%3E%3C/svg%3E) \<img src="/images/lc3-disassembler/lc3-resv.svg" class="w-50pct nolink" alt="LC-3 Instruction"\>\</img\> LC-3 `INVALID` Instruction

```
decodeInstruction' _ B1101 = INVALID
```

That’s it for decoding the bytes to instructions. But that was the easy part. Up next, we get into the heuristic operations.

Basic Disassembly[#](#basic-disassembly)
----------

`disassembleInstrs`, the function below, is our main entry point to disassembling the binary code. It runs in the `ST` monad so that we can work with a mutable vector of instructions.

```
disassembleInstrs :: BinCode -> [Instruction]
disassembleInstrs code = runST do
  instructions <- MV.replicate (UV.length code) INVALID
  disassembleInstr code instructions 0
  fixInstrs instructions
  V.freeze instructions <&> (V.toList >>> combineCharInstrs >>> insertLabels)
```

First we allocate the mutable vector, and then we do a basic disassembly of the binary code into it by calling `disassembleInstr`. After that, we go over the disassembled instructions in `fixInstrs`, and use heuristics to guess better ones. Finally, we clean up by combining the character data and inserting the labels, and return the final immutable vector of instructions.

```
type MInstructions s = MV.MVector s Instruction

disassembleInstr :: BinCode -> MInstructions s -> Int -> ST s ()
disassembleInstr code instructions idx = when (idx < UV.length code) $
  MV.read instructions idx >>= \case
    RAW _ -> disassembleInstr code instructions $ idx + 1
    CHAR _ -> disassembleInstr code instructions $ idx + 1
    STRING _ -> disassembleInstr code instructions $ idx + 1
    _ -> do
      let raw = code UV.! idx
      let instr = decodeInstruction raw
      prevInstr <- MV.readMaybe instructions $ idx - 1

      case (instr, prevInstr) of
        (TRAP TrapOUT, Just (LD RegR0 pcOffset _)) -> do
          let idx' = idx + fromIntegral pcOffset
          disassembleChar instructions idx' $ code UV.!? idx'
        (TRAP TrapPUTS, Just (LEA RegR0 pcOffset)) ->
          disassembleW16String code instructions $ idx + fromIntegral pcOffset
        (TRAP TrapPUTSP,  Just (LEA RegR0 pcOffset)) ->
          disassembleW8String code instructions $ idx + fromIntegral pcOffset
        _ -> return ()

      MV.write instructions idx instr
      disassembleInstr code instructions $ idx + 1
```

`disassembleInstr` is where our first heuristic is applied. We go over the binary code vector element-by-element, decoding each raw word using the `decodeInstruction` function we wrote earlier. But we don’t stop there, we do an additional check. If a freshly decoded instruction is one of some `TRAP` instructions, preceded by some particular instructions, we use it to further disassemble some data. We recognize these three patterns:

* `LD R0, pcOffset` followed by `OUT`: This pattern loads a character at the relative `pcOffset` into the `R0` registers and prints it. If we see this pattern, we know that the instruction at current index plus `pcOffset` is a character. So we disassemble it immediately as a character in `disassembleChar`.
* `LEA R0, pcOffset` followed by `PUTS`: This signals that the data at the relative `pcOffset` is a null-terminated one-character-per-word string. So we disassemble it character-by-character till we reach the null bit in `disassembleW16String`.
* `LEA R0, pcOffset` followed by `PUTSP`: This pattern is for a null-terminated two-characters-per-word string, so we disassemble accordingly in `disassembleW8String`.

```
disassembleChar :: MInstructions s -> Int -> Maybe Word16 -> ST s ()
disassembleChar instructions idx = \case
  Just raw -> MV.write instructions idx $ CHAR $ Char.chr $ fromIntegral raw
  Nothing -> return ()

disassembleW16String :: BinCode -> MInstructions s -> Int -> ST s ()
disassembleW16String code instructions idx = do
  let raw = code UV.!? idx
  disassembleChar instructions idx raw
  case raw of
    Just 0 -> return ()
    Nothing -> return ()
    _ -> disassembleW16String code instructions (idx + 1)

disassembleW8String :: BinCode -> MInstructions s -> Int -> ST s ()
disassembleW8String code instructions idx = case code UV.!? idx of
  Just raw -> do
    let b1 = raw .&. 0b1111_1111
        b2 = (raw `shiftR` 8) .&. 0b1111_1111
    MV.write instructions idx $ STRING $ map (Char.chr . fromIntegral) [b1, b2]
    unless (raw == 0) $ disassembleW8String code instructions (idx + 1)
  Nothing -> return ()
```

These patterns are very common and almost standard, so we can confidently use them for detecting character and string data. Also, note the checks in the beginning of `disassembleInstr` that prevent already disassembled char/string data from being overwritten.

At this point, we have decoded the instructions and char/string data. But there are more possibilities of improving the disassembly quality.

Fixed-Point Cleanup[#](#fixed-point-cleanup)
----------

In this pass, we revisit the decoded instructions and correct them based on their targets and neighbours:

```
fixInstrs :: MInstructions s -> ST s ()
fixInstrs instructions = do
  let codeSize = MV.length instructions
  backwardChanged <-
    or <$> forM [codeSize - 1, codeSize - 2 .. 0] (fixInstr instructions)
  forwardChanged <- or <$> forM [0 .. codeSize - 1] (fixInstr instructions)

  when (backwardChanged || forwardChanged) $
    fixInstrs instructions
```

`fixInstrs` runs till a fixed point is reached, that is to say, till the instructions stop changing. It does a backward sweep with the `fixInstr` function, then a forward sweep, then repeats until no changes occur. We do this because a rewrite can create conditions for another rewrite. Doing this till a fixed point is reached is safe because of the way `fixInstr` is written: it only changes code-like instructions to data-like instructions, and never the other way. That makes the whole pass monotonic, causing it to eventually terminate. We do the sweep in both directions to make the changes order-independent. Next up is `fixInstr`:

```
data TargetCheck = MayBeData | MustBeCode | NoCheck

fixInstr :: MInstructions s -> Int -> ST s Bool
fixInstr instructions idx = MV.read instructions idx >>= \case
  LD {..} -> changeInstr instructions NoCheck pcOffset raw idx
  LDI {..} -> changeInstr instructions NoCheck pcOffset raw idx
  ST {..} -> changeInstr instructions MayBeData pcOffset raw idx
  STI {..} -> changeInstr instructions NoCheck pcOffset raw idx
  JSR {..} -> changeInstr instructions MustBeCode pcOffset raw idx
  BR {..} -> changeInstr instructions MustBeCode pcOffset raw idx
  _ -> return False
```

The idea behind `fixInstr` is that, certain instructions that point to other instructions are likely to be data. Different instructions have different confidence levels for their target addresses, encoded as `TargetCheck`:

* `MustBeCode`, used for `JSR`, `BR`: If the target is known to be data or does not exist, this instruction must be wrong, because these instructions are for jumping to code. Rewrite the instruction to `RAW`.
* `MayBeData`, used for `ST`: `ST` may or may not point to data. But if the instruction is in a neighbourhood that mostly has data, it is very likely to be data itself. Rewrite such instruction as `SPECULATION`, capturing both the data and instruction forms.
* `NoCheck`, used for `LD`, `LDI`, `STI`: The target doesn’t strongly indicate code or data. However, if `pcOffset` is `0` as well, the instruction is likely to be data if present in a data-heavy neighbourhood. In such case, rewrite as `SPECULATION`, otherwise ignore.

`changeInstr` below carries out the actual rewrites:

```
changeInstr :: MInstructions s -> TargetCheck -> Int16 -> Word16 -> Int -> ST s Bool
changeInstr instructions targetCheck pcOffset raw idx = do
  let newInstr = RAW raw
      targetIdx = idx + 1 + fromIntegral pcOffset
      writeNewInstr = MV.write instructions idx newInstr >> return True

      maybeWriteSpeculatedInstr = do
        prevInstr <- MV.readMaybe instructions $ idx - 1
        nextInstr <- MV.readMaybe instructions $ idx + 1
        if isSpeculatedDataInstr prevInstr || isSpeculatedDataInstr nextInstr
          then do
            oInstr <- MV.read instructions idx
            MV.write instructions idx $ SPECULATION oInstr newInstr
            return True
          else return False

  mTargetInstr <- MV.readMaybe instructions targetIdx
  case (targetCheck, mTargetInstr) of
    (MustBeCode, Just targetInstr) | isDataInstr targetInstr -> writeNewInstr
    (MustBeCode, Just _) -> return False
    (MustBeCode, Nothing) -> writeNewInstr
    (MayBeData, _) -> maybeWriteSpeculatedInstr
    (NoCheck, Just _) | pcOffset == 0 -> maybeWriteSpeculatedInstr
    (NoCheck, _) -> return False
```

The two helper predicates distinguish definite data and speculative data:

```
isDataInstr :: Instruction -> Bool
isDataInstr = \case
  CHAR _ -> True
  STRING _ -> True
  RAW _ -> True
  SPECULATION oi _ -> isDataInstr oi
  _ -> False

isSpeculatedDataInstr :: Maybe Instruction -> Bool
isSpeculatedDataInstr = \case
  Just (SPECULATION _ si) -> isDataInstr si
  Just i -> isDataInstr i
  _ -> False
```

`isDataInstr` checks for `CHAR`, `STRING`, `RAW`, and the original side of `SPECULATION`. `isSpeculatedDataInstr` checks for the speculative data alternative.

Note how speculative data can cause neighbouring instructions to become data, but cannot alone cause a branch/call instruction to change, thus limiting speculation from spreading.

Postprocessing[#](#postprocessing)
----------

After the previous pass the instructions become stable. We now process them to do some cleanups. First, we merge consecutive characters into strings:

```
combineCharInstrs :: [Instruction] -> [Instruction]
combineCharInstrs = concat . List.chop \case
  l@(CHAR _ : rest) -> case span isNonNullChar l of
    ([], _) -> ([RAW 0], rest)
    (cs, rest') -> case rest' of
      (CHAR '\0' : rrest) -> ([STRING $ [c | CHAR c <- cs] <> ['\0']], rrest)
      _ -> ([toRAW c | CHAR c <- cs], rest')
  l@(STRING _ : _) ->
    let (ss, rest) = span isNonNullString l
     in case rest of
          (STRING ['\0', '\0'] : rrest) ->
            ([STRING $ concat [[c1, c2] | STRING [c1, c2] <- ss] <> ['\0']], rrest)
          _ -> (map toRAW $ concat [[c1, c2] | STRING [c1, c2] <- ss], rest)
  ~(i : rest) -> ([i], rest)
  where
    isNonNullChar = \case
      CHAR '\0' -> False
      CHAR _ -> True
      _ -> False

    isNonNullString = \case
      STRING ['\0', '\0'] -> False
      STRING _ -> True
      _ -> False

    toRAW = RAW . fromIntegral . Char.ord
```

`combineCharInstrs` uses [`chop`](https://hackage.haskell.org/package/split/docs/Data-List-Split.html#v:chop) to walk the instruction list and combine:

* a run of `CHAR`s followed by `CHAR '\0'` to become a single `STRING` with the [`NUL`](https://en.wikipedia.org/wiki/Null_character) terminator, and
* a run of two-character `STRING` entries followed by `STRING "\0\0"` to become a single combined `STRING`.

If a run is not `NUL`-terminated, we revert the characters in it to `RAW`.

Finally, we insert the labels before the instructions that other instructions point to:

```
insertLabels :: [Instruction] -> [Instruction]
insertLabels instrs =
  let indexedInstrs = zip [0 ..] instrs
      labelIdxs = List.nub $
        [offsetIdx i pcOffset | (i, BR {pcOffset}) <- indexedInstrs]
        <> [offsetIdx i pcOffset | (i, JSR {pcOffset}) <- indexedInstrs]
   in flip concatMap indexedInstrs \(i, instr) -> case instr of
        br@BR {pcOffset} -> [br { label = Just $ mkLabel $ offsetIdx i pcOffset }]
        jsr@JSR {pcOffset} -> [jsr { label = Just $ mkLabel $ offsetIdx i pcOffset }]
        _ | i `elem` labelIdxs -> [LABEL $ mkLabel i, instr]
        _ -> [instr]
  where
    offsetIdx i offset = i + 1 + offset
    mkLabel i = "LBL_" <> show i
```

We also change the pointing instructions to use the labels instead of offsets.

This concludes the entire disassembly of LC-3 binary code. To finish off, we need functions to print the instructions and to read the binary files.

Pretty-Printing[#](#pretty-printing)
----------

`disassemble` is our top-level function that takes an object file and returns the disassembly as text:

```
disassemble :: Object -> String
disassemble Object {..} =
  let instrs = disassembleInstrs code
   in unlines $
        [".ORIG x" <> printf "%04X" origin]
          <> map ppInstruction instrs
          <> [".END"]
```

`disassemble` simply pretty prints each disassembled instruction and wraps the result with `.ORIG` and `.END` directives from LC-3 assembler format. Here is the pretty printer:

```
ppInstruction :: Instruction -> String
ppInstruction = \case
  ADD {..} ->
    "ADD " <> ppRegister destReg
      <> ", " <> ppRegister sourceReg1
      <> ", " <> either ppRegister ppNum source2
  AND {..} ->
    "AND " <> ppRegister destReg
      <> ", " <> ppRegister sourceReg1
      <> ", " <> either ppRegister ppNum source2
  BR {label = Just lbl, ..} -> "BR" <> ppFlags flags <> " " <> lbl
  BR {..} -> "BR" <> ppFlags flags <> " " <> ppNum pcOffset
  JMP {..} -> "JMP " <> ppRegister baseReg
  RET -> "RET"
  JSR {label = Just lbl} -> "JSR " <> lbl
  JSR {..} -> "JSR " <> ppNum pcOffset
  JSRR {..} -> "JSRR " <> ppRegister baseReg
  LD {..} -> "LD " <> ppRegister destReg <> ", " <> ppNum pcOffset
  LDI {..} -> "LDI " <> ppRegister destReg <> ", " <> ppNum pcOffset
  LDR {..} ->
    "LDR " <> ppRegister destReg
      <> ", " <> ppRegister baseReg
      <> ", " <> ppNum offset
  LEA {..} -> "LEA " <> ppRegister destReg <> ", " <> ppNum pcOffset
  NOT {..} -> "NOT " <> ppRegister destReg <> ", " <> ppRegister sourceReg
  RTI -> "RTI"
  ST {..} -> "ST " <> ppRegister sourceReg <> ", " <> ppNum pcOffset
  STI {..} -> "STI " <> ppRegister sourceReg <> ", " <> ppNum pcOffset
  STR {..} ->
    "STR " <> ppRegister sourceReg
      <> ", " <> ppRegister baseReg
      <> ", " <> ppNum offset
  TRAP {..} -> ppTrapRoutine trapRoutine
  INVALID -> "INVALID"
  RAW w -> ".FILL x" <> printf "%04X" w
  CHAR c -> show c
  STRING s -> ".STRINGZ \"" <> concatMap translateEscapeSeqs (init s) <> "\""
  SPECULATION {..} ->
    ppInstruction specualtedInstr <> " ; or " <> ppInstruction origInstr
  LABEL s -> "\n" <> s
```

The instructions are rendered in the LC-3 assembly syntax. `RAW` words become `.FILL xNNN` directives. `STRING` values become `.STRINGZ "..."` with proper escape sequences. `SPECULATION` instructions are rendered with both interpretations: the speculated data form followed by the original instruction as a comment. This preserves ambiguity for human review.

The helper pretty-printers:

```
ppRegister :: Register -> String
ppRegister = ("R" <>) . show . fromEnum

ppNum :: Int16 -> String
ppNum = ("#" <>) . show

ppFlags :: Set.Set Flag -> String
ppFlags flags = case concatMap ppFlag $ Set.toAscList flags of
  "nzp" -> ""
  fs -> fs
  where
    ppFlag = \case
      FlagNeg -> "n"
      FlagZer -> "z"
      FlagPos -> "p"

ppTrapRoutine :: TrapRoutine -> String
ppTrapRoutine = \case
  TrapGETC -> "GETC"
  TrapOUT -> "OUT"
  TrapPUTS -> "PUTS"
  TrapIN -> "IN"
  TrapPUTSP -> "PUTSP"
  TrapHALT -> "HALT"
  TrapUNKNOWN n -> "TRAP " <> show n

translateEscapeSeqs :: Char -> String
translateEscapeSeqs = \case
  '\a' -> "\\a"
  '\b' -> "\\b"
  '\ESC' -> "\\e"
  '\f' -> "\\f"
  '\n' -> "\\n"
  '\r' -> "\\r"
  '\t' -> "\\t"
  '\v' -> "\\v"
  '\\' -> "\\\\"
  '"' -> "\\\""
  c -> [c]
```

The registers are printed as `R0`–`R7`. Numeric values are prefixed with `#`, and the escape sequences (`\n`, `\t`, etc.) are properly encoded in strings. The trap routines are looked up by their standard codes and output as their names.

Reading the Binary[#](#reading-the-binary)
----------

After all we’ve been through, this is a piece of cake:

```
readObject :: BS.ByteString -> Either String Object
readObject blob
  | BS.length blob < 2 = Left "Blob is too short to be valid"
  | odd $ BS.length blob = Left "Blob has odd number of bytes"
  | otherwise = runST do
      let instrCount = (BS.length blob - 2) `div` 2
          origin =
            (fromIntegral (BS.index blob 0) `shiftL` 8)
              .|. fromIntegral (BS.index blob 1)

      instructions <- MUV.new instrCount
      forM_ [1 .. instrCount] \i -> do
        let b1 = fromIntegral $ BS.index blob $ i * 2
            b2 = fromIntegral $ BS.index blob $ i * 2 + 1
            b = b1 `shiftL` 8 .|. b2
        MUV.write instructions (i - 1) b

      code <- UV.freeze instructions
      return $ Right $ Object {..}
```

Only important thing to note is to combine the byte pairs in the [big-endian](https://en.wikipedia.org/wiki/big-endian) order.

Finishing Up[#](#finishing-up)
----------

The `main` function reads a binary `.obj` file from STDIN, parses it, and disassembles it to STDOUT:

```
main :: IO ()
main = BS.getContents <&> readObject >>= \case
  Left err -> putStrLn err >> exitFailure
  Right object -> putStr $ disassemble object
```

Error messages are printed and the program exits with status 1 on failure.

And, we are done!

Let’s test it on the [“Hello World!” program](#hello-world):

```
$ ghc -Wall --make lc3-dis.hs -O2 -o lc3d -main-is LC3Disassembler
$ cat hello.obj | ./lc3d | tee hello-dis.asm
.ORIG x3000
LEA R0, #2
PUTS
HALT
.STRINGZ "Hello World!"
.END
$ lc3as hello-dis.asm
$ lc3 hello-dis.obj
Hello World!
```

Amazing! We assembled the disassembled program and ran it, and it produced the same output. The assembly is also pretty much the same.

To make sure the disassembler works correctly, let’s run it on a the binary code for a larger program: [lc3-fizzbuzz.asm](https://abhinavsarkar.net/code/lc3-fizzbuzz.html?mtm_campaign=feed) that output the solution for the [Fizzbuzz](https://en.wikipedia.org/wiki/Fizzbuzz) problem.

```
$ lc3as lc3-fizzbuzz.asm           # assemble
$ lc3 lc3-fizzbuzz.obj > out1      # run and capture output
$ cat lc3-fizzbuzz.obj | lc3d > lc3-fizzbuzz-dis.asm  # diassemble
$ lc3as lc3-fizzbuzz-dis.asm       # assemble the disassembly
$ lc3 lc3-fizzbuzz-dis.obj > out2  # run and capture output
$ diff out1 out2 && echo "Same!"   # diff the outputs
Same!
```

It works perfectly. You can also see the word-wise diff between original and disassembled assembly below:

<details> <summary> Diff </summary>

```
diff --git a/lc3-fizzbuzz.asm b/lc3-fizzbuzz-dis.asm
index 4949924..6a3882a 100644
--- a/lc3-fizzbuzz.asm
+++ b/lc3-fizzbuzz-dis.asm
@@ -1,80 +1,79 @@
.ORIG x3000

AND R0, R0, #0
LD R1, [-START-]{+#66+}
LD R4, [-END-]{+#66+}
NOT R2, R4
ADD R2, R2, #1
LD R5, [-ASCII_48-]{+#64+}

[-LOOP-]{+LBL_6+}
ADD R0, R1, R2
BRp [-DONE-]{+LBL_65+}
ADD R3, R1, #0

[-SUB_3-]{+LBL_9+}
ADD R0, R3, #-3
BRn [-MOD_3-]{+LBL_13+}
ADD R3, R3, #-3
BR [-SUB_3-]{+LBL_9+}

[-MOD_3-]{+LBL_13+}
ADD R4, R1, #0

[-SUB_5-]{+LBL_14+}
ADD R0, R4, #-5
BRn [-MOD_5-]{+LBL_18+}
ADD R4, R4, #-5
BR [-SUB_5-]{+LBL_14+}

[-MOD_5-]{+LBL_18+}
ADD R3, R3, #0
BRz [-CHECK_MOD_5-]{+LBL_24+}
ADD R4, R4, #0
BRz [-PRINT_BUZZ-]{+LBL_29+}
JSR [-PRINT_NUM-]{+LBL_40+}
BR [-PRINT_NEWLINE-]{+LBL_35+}

[-CHECK_MOD_5-]{+LBL_24+}
ADD R4, R4, #0
BRz [-PRINT_FIZZ-]{+LBL_32+}
LEA R0, [-FIZZ-]{+#44+}
PUTS
BR [-PRINT_NEWLINE-]{+LBL_35+}

[-PRINT_BUZZ-]{+LBL_29+}
LEA R0, [-BUZZ-]{+#46+}
PUTS
BR [-PRINT_NEWLINE-]{+LBL_35+}

[-PRINT_FIZZ-]{+LBL_32+}
LEA R0, [-FIZZ_BUZZ-]{+#48+}
PUTS
BR [-PRINT_NEWLINE-]{+LBL_35+}

[-PRINT_NEWLINE-]{+LBL_35+}
AND R0, R0, #0
ADD R0, R0, #10
OUT
ADD R1, R1, #1
BR [-LOOP-]{+LBL_6+}

[-PRINT_NUM-]{+LBL_40+}
ST R7, [-S7-]{+#25+}
ST R1, [-S1-]{+#25+}
ADD R3, R1, #-10
BRn [-SINGLE_DIGIT-]{+LBL_59+}
AND R4, R4, #0
AND R3, R3, #0
ADD R3, R3, R1

[-SUB_10-]{+LBL_47+}
ADD R3, R3, #-10
BRn [-PRINT_10S_DIGIT-]{+LBL_51+}
ADD R4, R4, #1
BR [-SUB_10-]{+LBL_47+}

[-PRINT_10S_DIGIT-]{+LBL_51+}
ADD R3, R3, #10
ADD R0, R4, #0
ADD R0, R0, R5
@@ -82,30 +81,23 @@ OUT
ADD R0, R3, #0
ADD R0, R0, R5
OUT
BR [-RET_PRINT_NUM-]{+LBL_62+}

[-SINGLE_DIGIT-]{+LBL_59+}
ADD R0, R1, #0
ADD R0, R0, R5
OUT

[-RET_PRINT_NUM-]{+LBL_62+}
LD R1, [-S1-]{+#4+}
LD R7, [-S7-]{+#2+}
RET

[-DONE-]{+LBL_65+}
HALT[-S7-]
.FILL x0000[-S1-]
.FILL x0000[-START    .FILL #1-]
[-END      .FILL #100-]

[-ASCII_48 .FILL x0030-]

[-FIZZ-]
.STRINGZ [-"Fizz"-]
[-BUZZ-]{+"d0Fizz"+}
.STRINGZ "Buzz"[-FIZZ_BUZZ-]
.STRINGZ "FizzBuzz"
.END

```

</details>

The data section at the end is different because the string merging pass in our code merges the `.FILL` data with the `.STRINGZ` data that follows. Other than that, the assembly is pretty much the same, ignoring the generated label names. Perfect!

Conclusion[#](#conclusion)
----------

Building a disassembler for a format without metadata is a fun exercise. You have to find the patterns in the data, come up with heuristics, and use them to write your disassembler. You may need to go over the output multiple times to refine it. While the approach here is specific to LC-3, the principles generalize to other code/data separation problems in binary analysis and reverse engineering.

The full code for this disassembler is available [here](https://abhinavsarkar.net/code/lc3-dis.html?mtm_campaign=feed).

 If you have any questions or comments, please leave a comment below. If you liked this post, please share it. Thanks for reading!

---

1. I patched the VM to *not* print `HALT` when halting.[↩︎](#fnref1)

2. Most LC-3 assemblers produce .sym files containing the debug symbols. But we don’t use them for disassembling the binaries in this post.[↩︎](#fnref2)

3. Actually, the ISA defines `1101` opcode as reserved for future use.[↩︎](#fnref3)

---

Thanks for reading this post via feed. Feeds are great, and you're great for using them. ♥

This post was originally published on [abhinavsarkar.net](https://abhinavsarkar.net/posts/lc3-disassembler/?mtm_campaign=feed).

### Like, repost, or comment on: ###

* [Fediverse](https://fantastic.earth/@abnv/117536396086305694)
* [Lobsters](https://lobste.rs/s/qoznnh)
* [Reddit](https://www.reddit.com/r/haskell/comments/1xkxccz/)
* [Discourse](https://discourse.haskell.org/t//14918)
* [My website](https://abhinavsarkar.net/posts/lc3-disassembler/?mtm_campaign=feed#comment-container)

Read more of my [posts](https://abhinavsarkar.net/posts/) and [notes](https://abhinavsarkar.net/notes/).

![](https://anna.abhinavsarkar.net/matomo.php?idsite=1&rec=1)