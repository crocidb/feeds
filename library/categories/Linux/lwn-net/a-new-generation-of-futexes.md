+++
title = "[$] A new generation of futexes"
description = "Futexes are a kernel subsystem that provides support for fast mutexes in user space. While futexes can indeed be fast, they are not fast enough for a number of users. Partly as a result of that, the implementation of futexes h"
date = "2026-11-16T15:06:04Z"
url = "https://lwn.net/Articles/1102988/"
author = "corbet"
text = ""
lastupdated = "2026-11-19T14:05:14.605519817Z"
seen = false
+++

[Futexes](https://man7.org/linux/man-pages/man7/futex.7.html) are a kernel subsystem that provides support for fast mutexes in user space. While futexes can indeed be fast, they are not fast enough for a number of users. Partly as a result of that, the implementation of futexes has grown in complexity over the years, with two basic variants on offer. The desire for faster futexes remains, though, and that inspires new patches, including [this series from Suleiman Souhlal](https://lwn.net/ml/all/20260917043339.2093426-1-suleiman@google.com) adding a third futex class called "futex PING" for "priority inheritance next generation".