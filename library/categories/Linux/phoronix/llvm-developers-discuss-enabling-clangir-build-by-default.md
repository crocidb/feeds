+++
title = "LLVM Developers Discuss Enabling ClangIR Build By Default"
description = "ClangIR has been in development for a number of years now as a new intermediate representation for the Clang compiler. ClangIR makes use of MLIR and is higher-level than LLVM IR. With ClangIR able to preserve more C/C++ source semantics, its usage can lead to better diagnostics, "
date = "2026-09-06T10:43:10Z"
url = "https://www.phoronix.com/news/ClangIR-Build-Default-Maybe"
author = "Michael Larabel"
text = ""
lastupdated = "2026-09-08T09:44:05.354913564Z"
seen = false
+++

ClangIR has been in development for a number of years now as a new intermediate representation for the Clang compiler. ClangIR makes use of MLIR and is higher-level than LLVM IR. With ClangIR able to preserve more C/C++ source semantics, its usage can lead to better diagnostics, code/static analysis, and more performance optimizations compared to everything lowered straight away from AST to LLVM IR. While not enabling its usage by default, LLVM stakeholders are discussing at least now building it by default...