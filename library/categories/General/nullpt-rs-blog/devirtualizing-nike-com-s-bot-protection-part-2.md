+++
title = "Devirtualizing Nike.com's Bot Protection (Part 2)"
description = "Last time, we went over performing string extraction on the VM, and scratched the surface of analyzing the execution itself. However, this leaves the significant problem of actually devirtualizing the bytecode. For instance, we mentioned that individual strings are difficult to e"
date = "2023-01-12T00:00:00Z"
url = "https://nullpt.rs/devirtualizing-nike-vm-2"
author = "nullpt.rs • blog"
text = ""
lastupdated = "2026-10-29T10:50:48.451367362Z"
seen = true
+++

Last time, we went over performing string extraction on the VM, and scratched the surface of analyzing the execution itself. However, this leaves the significant problem of actually devirtualizing the bytecode. For instance, we mentioned that individual strings are difficult to extract in a static manner—as specific values of the instruction pointer are required—but this difficulty also applies to opcodes and registers. As the bytecode is a stream of numbers, it's impossible to determine whether a number indicates a register, opcode, or constant without knowing what came before it.