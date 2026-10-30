+++
title = "Upstreaming Tyr: Rust, DRM, and the Linux Kernel (Collabora)"
description = "The Collabora blog provides an update on Tyr, a driver for Arm Mali GPUs.One of our biggest challenges has been developing Tyr while the Rust kernel abstractions and drive"
date = "2026-10-21T14:58:56Z"
url = "https://lwn.net/Articles/1102024/"
author = "corbet"
text = ""
lastupdated = "2026-10-22T13:34:56.311203450Z"
seen = false
+++

The Collabora blog [provides an update on Tyr](https://www.collabora.com/news-and-blog/blog/2026/10/21/upstreaming-tyr-rust-drm-and-the-linux-kernel/), a driver for Arm Mali GPUs.

>  One of our biggest challenges has been developing Tyr while the Rust kernel abstractions and driver interfaces are also being developed. As the driver interfaces are naturally revised and improved, we have rewritten Tyr several times to adapt to the larger Rust ecosystem. This not only makes progress much slower than it would be with a mature API, but also stalls progress for capabilities, such as job scheduling, while the abstraction is properly designed, reviewed, tested, and merged upstream.
>
>  But working in this evolving environment is also precisely where Tyr is able to provide the most value. As a user of these new Rust abstractions, Tyr helps to expose their requirements and limitations.
>
>