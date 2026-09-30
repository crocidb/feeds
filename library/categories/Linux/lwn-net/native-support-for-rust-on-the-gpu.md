+++
title = "[$] Native support for Rust on the GPU"
description = " Christian Legnitto is the maintainer of  rust-gpu and  Rust CUDA, two libraries that make it possible to program a computer's graphics processing unit (GPU) from Rust"
date = "2026-09-29T17:57:20Z"
url = "https://lwn.net/Articles/1095731/"
author = "daroc"
text = ""
lastupdated = "2026-09-29T21:52:18.975160308Z"
seen = false
+++

 Christian Legnitto is the maintainer of [ rust-gpu](https://github.com/Rust-GPU/rust-gpu#-rust-gpu) and [ Rust CUDA](https://github.com/Rust-GPU/rust-cuda#the-rust-cuda-project), two libraries that make it possible to program a computer's graphics processing unit (GPU) from Rust. He isn't satisfied with the current state of GPU support in Rust, however. In a talk at [ RustConf 2026](https://rustconf.com/), he explained his vision for how the GPU could become an ordinary compiler target for normal Rust code, without the need for any special libraries or new ecosystem support. That vision is not yet fully implemented, but he does have a prototype that he is preparing to release.