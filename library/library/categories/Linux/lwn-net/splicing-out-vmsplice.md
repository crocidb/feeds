+++
title = "[$] Splicing out vmsplice()"
description = "The splice() and vmsplice() system calls are meant to improve performance for certain data-movement tasks by minimizing (or avoiding altogether) system calls and the co"
date = "2026-06-04T16:22:46Z"
url = "https://lwn.net/Articles/1075838/"
author = "corbet"
text = ""
lastupdated = "2026-06-07T00:10:44.911967976Z"
seen = true
+++

The [splice()](https://man7.org/linux/man-pages/man2/splice.2.html) and [vmsplice()](https://man7.org/linux/man-pages/man2/vmsplice.2.html) system calls are meant to improve performance for certain data-movement tasks by minimizing (or avoiding altogether) system calls and the copying of data. They also have a long history of security problems. The recent flood of LLM-discovered vulnerabilities has drawn attention, once again, to splice() and vmsplice(); as a result, they may end up being removed altogether.