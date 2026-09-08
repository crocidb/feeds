+++
title = "[$] Fixing the TCMalloc regression with RSEQ operations"
description = "The restartable sequences feature is one of the stranger corners of the kernel's user-space interface; it provides a way for user space to carry out simple lockless operations and be informed if it is preempted over the course of an operation ("
date = "2026-09-07T14:33:43Z"
url = "https://lwn.net/Articles/1092555/"
author = "corbet"
text = ""
lastupdated = "2026-09-08T09:44:05.478022983Z"
seen = false
+++

The [restartable sequences](https://lwn.net/Articles/697979/) feature is one of the stranger corners of the kernel's user-space interface; it provides a way for user space to carry out simple lockless operations and be informed if it is preempted over the course of an operation (and must, thus, restart). Work merged in the 6.19 release to [improve the performance of restartable sequences](https://lwn.net/Articles/1033955/) broke the [TCMalloc allocator](https://github.com/google/tcmalloc#tcmalloc), which was relying on an undocumented (and unintended) kernel behavior. Now, Olivier Dion is [proposing an addition](https://lwn.net/ml/all/20260828153349.8061-1-odion@efficios.com) to the restartable-sequences API that will bring TCMalloc back into the fold; it does not make the restartable-sequences API any less strange, though.