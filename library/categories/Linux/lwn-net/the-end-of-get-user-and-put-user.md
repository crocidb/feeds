+++
title = "[$] The end of __get_user() and __put_user()"
description = "Linus Torvalds rarely writes significant amounts of kernel code these days, so the merging of a 48-part patch series from him is an unusual event. This series, destined for the 7.4 kerne"
date = "2026-10-22T16:25:50Z"
url = "https://lwn.net/Articles/1102061/"
author = "corbet"
text = ""
lastupdated = "2026-10-27T22:33:08.852341824Z"
seen = false
+++

Linus Torvalds rarely writes significant amounts of kernel code these days, so the [merging](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=22a78a25438d) of a 48-part patch series from him is an unusual event. This series, destined for the 7.4 kernel release, performs some long-delayed kernel cleanup by removing a couple of the primitives used to access user-space memory from the kernel. What was once a best practice has long been superseded, but it can take time for such changes to work their way through a body of code this large.