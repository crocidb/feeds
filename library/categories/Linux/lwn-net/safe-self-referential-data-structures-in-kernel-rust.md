+++
title = "[$] Safe self-referential data structures in kernel Rust"
description = " Self-referential structures that can be used without unsafe code have posed a problem for Rust for years. There are many cases where a self-referential data structure is the elegant algorithmic choice, but implementing it in accordance with Rust's lifetime rules is all but impos"
date = "2026-10-16T18:30:00Z"
url = "https://lwn.net/Articles/1099224/"
author = "daroc"
text = ""
lastupdated = "2026-10-21T11:46:09.771346195Z"
seen = false
+++

 Self-referential structures that can be used without unsafe code have posed a problem for Rust for years. There are many cases where a self-referential data structure is the elegant algorithmic choice, but implementing it in accordance with Rust's lifetime rules is all but impossible. At Kangrejos 2026, Gary Guo presented a clever solution to the problem in the context of the kernel's [ pin\_init crate](https://rust.docs.kernel.org/pin_init/index.html), which helps with the creation of immovable data structures, typically for interoperability with C. Guo's changes could help remove most of the unsafe code related to lifetimes in the [ Nova driver](https://rust-for-linux.com/nova-gpu-driver) and, eventually, other Rust components.