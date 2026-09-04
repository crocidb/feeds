---
title = """
LLDB Fork for Zig
"""
description = "LLDB Fork for ZigAuthor: Alex Rønne PetersenOne of the major things Jacob has been working on is good debugging support for Zig. This includes an LLDB fork with enhan"
date = "2025-01-24T00:00:00Z"
url = "https://ziglang.org/devlog/2025/#2025-01-24"
author = ""
text = ""
lastupdated = "2025-10-22T08:59:09.949528356Z"
seen = true
---

[LLDB Fork for Zig](#2025-01-24)
==========

Author: Alex Rønne Petersen

One of the major things [Jacob](https://github.com/jacobly0) has been working on is good debugging support for Zig. This includes an [LLDB fork](https://github.com/jacobly0/llvm-project/tree/lldb-zig) with enhancements for the Zig language, and is primarily intended for use with Zig’s self-hosted backends. With the self-hosted x86\_64 backend becoming much more usable in the upcoming 0.14.0 release, I decided to type up a [wiki page](https://github.com/ziglang/zig/wiki/LLDB-for-Zig) with instructions for building and using the fork.

If you’re already trying out Zig’s self-hosted backend in your workflow, please take the LLDB fork for a spin and see how it works for you.