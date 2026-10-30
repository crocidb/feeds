+++
title = "More Resilient Help Menu"
description = 'More Resilient Help Menuzig build --help now works even when configuration fails, or when there is no build.zig file:`info: initialize build.zig template file with "zig init"info: see "zig --help" for more optionserror: no build.zig file found, in the'
date = "2026-10-12T00:00:00Z"
url = "https://ziglang.org/devlog/2026/#2026-10-12"
author = ""
text = ""
lastupdated = "2026-10-22T13:34:58.246262356Z"
seen = false
+++

[More Resilient Help Menu](#2026-10-12)
==========

`zig build --help` now works even when configuration fails, or when there is no build.zig file:

```
info: initialize build.zig template file with "zig init"
info: see "zig --help" for more options
error: no build.zig file found, in the current directory or any parent directories
Usage: zig build [steps] [options]

Steps:                    (unavailable due to build.zig compilation failure)
Project-Specific Options: (unavailable due to build.zig compilation failure)

System Integration Options:
  --search-prefix [path]       Add a path to look for binaries, libraries, headers
  --sysroot [path]             Set the system root directory (usually /)
...
  Available System Integrations:                Enabled:

   (unavailable due to build.zig compilation failure)

General Options:
  -h, --help                   Print this help to stdout and exit
  -l, --list-steps             Print available steps to stdout and exit
...

```