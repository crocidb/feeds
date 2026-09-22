+++
title = "[$] Thread-identity switcheroo for io_uring"
description = 'The io\_uring subsystem is all about asynchronous execution; applications count on it to not block — unless explicitly requested to. Within io\_uring, maintaining the "never blocks" guarantee has sometimes been a challenge,'
date = "2026-09-17T13:49:59Z"
url = "https://lwn.net/Articles/1094303/"
author = "corbet"
text = ""
lastupdated = "2026-09-21T09:42:43.306574992Z"
seen = false
+++

The [io\_uring subsystem](https://man7.org/linux/man-pages/man7/io_uring.7.html) is all about asynchronous execution; applications count on it to not block — unless explicitly requested to. Within io\_uring, maintaining the "never blocks" guarantee has sometimes been a challenge, given that many paths in the kernel were never designed for asynchronous execution. This problem has been worked around, but at a significant cost to performance. Now, io\_uring maintainer Jens Axboe has posted [an RFC patch set](https://lwn.net/ml/all/20260911154148.644489-1-axboe@kernel.dk) with a somewhat radical (and potentially scary) solution to the problem.