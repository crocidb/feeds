+++
title = "GNU Core Utilities 9.12 released"
description = 'Pádraig Brady has announced GNU Core Utilities (coreutils) version 9.12. "There have been 288 commits by 16 people in the 21 weeks since 9.11". New features include an -A option for [uname](https://m'
date = "2026-09-14T19:53:59Z"
url = "https://lwn.net/Articles/1094312/"
author = "jzb"
text = ""
lastupdated = "2026-09-21T09:42:43.320513145Z"
seen = false
+++

Pádraig Brady has [announced](https://lists.gnu.org/archive/html/coreutils-announce/2026-09/msg00000.html) GNU Core Utilities (coreutils) version 9.12. "
> There have been 288 commits by 16 people in the 21 weeks since 9.11

". New features include an -A option for [uname](https://man7.org/linux/man-pages/man1/uname.1.html) which labels all output, as well as adding awareness of the [failfs](https://docs.kernel.org/filesystems/failfs.html) and [nullfs](https://lwn.net/Articles/1062163/) filesystem types to [stat](https://www.man7.org/linux/man-pages/man1/stat.1.html) and [tail](https://www.man7.org/linux/man-pages/man1/tail.1.html).

There are many bug fixes in this release as well, including one for a bug "
> present in 'the beginning'

" that caused some utilities to fail when traversing hierarchies if files are being removed in parallel.