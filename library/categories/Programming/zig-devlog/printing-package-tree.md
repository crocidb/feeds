+++
title = "Printing Package Tree"
description = "Printing Package TreeThere is a new --print-tree CLI option to zig build, that looks like this:`andy@bark ~/d/groovebasin (main)zig build --print-treeffmpeg ffmpeg-8.1.1-5-zT7QA_AkUgTOx4ZqOUVZsHSk9iv97BInIiubIM6ifr67├─ libz zlib-1.3.1-1-ZZQ7ldENAA"
date = "2026-10-13T00:00:00Z"
url = "https://ziglang.org/devlog/2026/#2026-10-13"
author = ""
text = ""
lastupdated = "2026-10-22T13:34:58.244901627Z"
seen = false
+++

[Printing Package Tree](#2026-10-13)
==========

There is a new `--print-tree` CLI option to `zig build`, that looks like this:

```
andy@bark ~/d/groovebasin (main)> zig build --print-tree
ffmpeg ffmpeg-8.1.1-5-zT7QA_AkUgTOx4ZqOUVZsHSk9iv97BInIiubIM6ifr67
├─ libz zlib-1.3.1-1-ZZQ7ldENAAA7qJjUXP6E6xnRuV-jDL9dyoJFc_eb3zQ6
│  └─ zlib N-V-__8AAB0eQwD-0MdOEBmz7intriBReIsIDNlukNVoNu6o
├─ mbedtls mbedtls-3.6.4-E4NUR2wWAAAUSvVbho9aaU31-e4D8glu9l1VfxKezBkV (not fetched)
├─ openssl openssl-3.3.2-TC9C3Ze3ZABaKR5hc8KRnRPhTClKrKQKqTnXTUYkvmSR (not fetched)
├─ libressl libressl-4.0.0--kqV4KPTAACsSRP8mSIZmqgVa5OZjw6WEgvcftWkLu-c (not fetched)
├─ libmp3lame libmp3lame-3.100.1-7-67wlF2CxEwDWlVOMMLBNPbnDi5kE2OmH0azUHU2Y4DZY
├─ libvorbis libvorbis-0.0.0+1.3.7-1wt9j_QPAADVure94TG4ecBMLD8eIAzWd6ZxVOmBBPCu
│  ├─ libvorbis N-V-__8AAA7lSAA6p7eRmPGVeA9uHmeiJ2DX-ISiPliRJ8Y7
│  └─ libogg libogg-0.0.0+1.3.7-0KP-foYNAAAaj0YJOwRQs7kTN-ivzRMYTjtKzr6Apelj
│     └─ libogg N-V-__8AAFM3CwD6iAA1kggMPR8NHZ8VTb2zvRZ1Mt4BUfq9
├─ libogg libogg-0.0.0+1.3.7-0KP-foYNAAAaj0YJOwRQs7kTN-ivzRMYTjtKzr6Apelj
│  └─ libogg N-V-__8AAFM3CwD6iAA1kggMPR8NHZ8VTb2zvRZ1Mt4BUfq9
└─ nasm nasm-3.0.1-B_NnpQpTAAA25UxvqONakXtmj-a78PGe3xfgyDFgetb0
   ├─ nasm N-V-__8AAEAMKAFrNesgN6ZM9sxj37fq_i7UJe5nKkLmyRJI
   └─ zlib zlib-1.3.1-1-ZZQ7ldENAAA7qJjUXP6E6xnRuV-jDL9dyoJFc_eb3zQ6
      └─ zlib N-V-__8AAB0eQwD-0MdOEBmz7intriBReIsIDNlukNVoNu6o
pulseaudio pulseaudio-16.1.1-10-mk_62DNlNwCDcTJ5iGhTxeCoetuAFKE1FrYNw5AErtX-
StaticHttpFileServer StaticHttpFileServer-1.0.0-j-0gwes2AAByCgpeLBNR2hOaGVsDz9u8I6o54ft10OxU
└─ mime mime-4.0.0-zwmL--0gAACndOVlROQeDnM0chfojNDS8tpohlsBqMNy

```

If a terminal is detected, it prints in color, which is a bit easier to read.

This **early exits before running configurer**, so that problems causing configurer compilation errors can be troubleshooted.

Similarly, `--configure` is added, which is defined to “exit after the configuration phase” which is the exact behavior that `--fetch` used to do. `--fetch` is changed to “Fetch all dependencies including lazy ones; exit without configuration”.