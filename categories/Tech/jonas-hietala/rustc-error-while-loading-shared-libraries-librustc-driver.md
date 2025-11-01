---
title = "rustc: error while loading shared libraries: librustc_driver"
description = "I had installed and used rust already but today I fired it up and received:rustc --versionrustc: error while loading shared libraries: librustc_driver-7e44814b.so: cannot open shared object file: No such file or directoryI’ve seen this b"
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2015/08/12/rustc_error_while_loading_shared_libraries_librustcdriver/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.556200138Z"
seen = true
---

I had installed and used [rust](https://github.com/rust-lang/rust) already but today I fired it up and received:

```
rustc --version
rustc: error while loading shared libraries: librustc_driver-7e44814b.so: cannot open shared object file: No such file or directory

```

I’ve seen this before… I thought modifying `LD_LIBRARY_PATH` in my shell was enough, but no. According to [the bug report](https://github.com/rust-lang/rust/issues/24677) the problem is with `ldconfig`.

Edit `/etc/ld.so.conf` and add `/usr/local/lib` to it then run `ldconfig` to update the cache. Now everything works again.

```
rustc --version
rustc 1.3.0-dev (4b4119d5c 2015-07-29)

```

Not sure why it appeared again though.