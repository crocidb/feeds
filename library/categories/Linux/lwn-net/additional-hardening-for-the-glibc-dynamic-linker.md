+++
title = "[$] Additional hardening for the glibc dynamic linker"
description = " The  Node.js project recently had a  security vulnerability that affected its [ Brot"
date = "2026-11-11T14:35:29Z"
url = "https://lwn.net/Articles/1105134/"
author = "daroc"
text = ""
lastupdated = "2026-11-11T16:05:19.254107066Z"
seen = false
+++

 The [ Node.js project](https://nodejs.org/en) recently had a [ security vulnerability](https://nodejs.org/en/blog/vulnerability/october-2026-security-releases#nodejs-brotli-decoder-out-of-bounds-write-permits-remote-code-execution-cve-2026-111497---high) that affected its [ Brotli](https://brotli.org/) decoder. The bug [ was a buffer overflow](https://project-zero.issues.chromium.org/issues/565308158), but the particular way that official Node.js binaries are built for Linux meant that one of the main protections against turning a buffer overflow into remote code execution, [ address space layout randomization](https://en.wikipedia.org/wiki/Address_space_layout_randomization) (ASLR) could not be turned on. If ASLR had been enabled, the bug would still be exploitable in theory, but much more difficult to exploit in practice. In response, the GNU C Library (glibc) is [ considering](https://lwn.net/ml/all/20261028175613.3779425-1-adhemerval.zanella@linaro.org/) a new set of [ tunable settings](https://sourceware.org/glibc/manual/latest/html_node/Tunables.html) to allow administrators to forbid programs that do not support ASLR. The new settings, while a welcome hardening measure, may not address the root problem.