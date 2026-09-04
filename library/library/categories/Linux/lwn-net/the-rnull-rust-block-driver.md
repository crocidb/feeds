+++
title = '[$] The "rnull" Rust block driver'
description = ' The null block driver (null\_blk) is a small driver that is mostly useful for benchmarking block-layer implementations. It accepts all requests and marks them complete as quickly as possible, doing as little work as p'
date = "2026-08-28T18:26:23Z"
url = "https://lwn.net/Articles/1090378/"
author = "daroc"
text = ""
lastupdated = "2026-09-01T19:33:14.076181008Z"
seen = false
+++

 The [null block driver](https://www.kernel.org/doc/html/latest/block/null_blk.html) (null\_blk) is a small driver that is mostly useful for benchmarking block-layer implementations. It accepts all requests and marks them complete as quickly as possible, doing as little work as possible. In June 2026, Andreas Hindborg shared [ a patch set](https://lwn.net/ml/all/20260609-rnull-v6-19-rc5-send-v2-0-82c7404542e2@kernel.org/) implementing the same functionality in Rust, in order to show that a simple block driver is now possible to write using the kernel's Rust APIs and to enable comparisons between the C and Rust implementations. A minimal version of the "rnull" driver is already present in the mainline kernel, but Hindborg's patch set brings it up to feature parity with the C version.