+++
title = "[$] Stabilizing Rust's never type"
description = """ A function's return type is supposed to indicate the kind of data that it produces. Rust's "never" type, which is  denoted by an exclamation mark ("!"), is the type the language uses to mark a function that never retur"""
date = "2026-09-08T13:34:38Z"
url = "https://lwn.net/Articles/1091015/"
author = "daroc"
text = ""
lastupdated = "2026-09-08T23:03:51.394651361Z"
seen = false
+++

 A function's return type is supposed to indicate the kind of data that it produces. Rust's "never" type, which is [ denoted by an exclamation mark](https://doc.rust-lang.org/stable/std/primitive.never.html) ("!"), is the type the language uses to mark a function that never returns and other places where a value can never occur. For a long time, the never type was used internally by the compiler, but was considered an unstable feature. On [ August 24](https://github.com/rust-lang/rust/pull/155499), after more than two years of work, Rust-compiler-contributor "waffle" finally managed to stabilize the type. It took so long, in part, because it involved a small breaking change to previous Rust editions, which the compiler maintainers needed to ensure did not impact much real code.