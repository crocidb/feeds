+++
title = "C-Kermit 11 released"
description = "For those of us with a long memory: John Goerzen has announced the release of C-Kermit 11, the first release o"
date = "2026-08-03T18:15:59Z"
url = "https://lwn.net/Articles/1086953/"
author = "corbet"
text = ""
lastupdated = "2026-08-06T09:52:34.757165985Z"
seen = false
+++

For those of us with a long memory: John Goerzen has [announced](https://changelog.complete.org/archives/44456-celebrating-45-years-of-kermit-with-the-first-new-c-kermit-release-in-15-years-and-working-with-a-decades-old-c-codebase) the release of C-Kermit 11, the first release of this file-transfer utility in 15 years.

>  As Debian maintainer of Kermit, I noticed some areas where it wasn't matching modern expectations. One area was, not surprising for a project of its age, security. Another area was that its character set or line-ending conversions are usually not desired now; we are used to byte-identical binary transfers, and the defaults caused confusion and even some rare instances of data corruption. So I started making a few patches last year.

 See [the changelog](https://github.com/OpenKermit/ckermit/releases/tag/v11.0.506) for details on the work that has been done.

 Most of us probably haven't thought about C-Kermit in years (if ever), but there was a time when it was an essential tool for moving files between machines.