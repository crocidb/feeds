+++
title = "[$] Cross-crate forward declarations in Rust"
description = " Rust has several ad-hoc mechanisms to allow user code to influence how the standard library executes. For example, custom panic handlers and custom allocators both involve registering functions that core standard library code needs to call. With more similar features planned, Ja"
date = "2026-10-19T13:50:49Z"
url = "https://lwn.net/Articles/1099596/"
author = "daroc"
text = ""
lastupdated = "2026-10-21T11:46:09.765461348Z"
seen = false
+++

 Rust has several ad-hoc mechanisms to allow user code to influence how the standard library executes. For example, custom panic handlers and custom allocators both involve registering functions that core standard library code needs to call. With more similar features planned, Jana Dönszelmann spotted the developing pattern and put together a general solution, introducing a safer, checked analogue of C's weak symbol linking. At Kangrejos 2026, she explained how this new language feature works, and proposed using it to clean up the kernel's handling of integer overflows in Rust code.