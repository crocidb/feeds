+++
title = "Systemd adds support for components written in Rust"
description = "Christian Brauner has announced that he has merged support for writing leaf components of systemd in Rust. Rust will be used only for new leaf components, existing code is not "
date = "2026-10-26T15:13:59Z"
url = "https://lwn.net/Articles/1102970/"
author = "jzb"
text = ""
lastupdated = "2026-10-27T22:33:08.845546243Z"
seen = false
+++

Christian Brauner has [announced](https://mastodon.social/@brauner/117494833311192688) that he has [merged support](https://github.com/systemd/systemd/pull/44324) for writing leaf components of systemd in Rust. Rust will be used only for new leaf components, existing code is not being ported to Rust and nothing that other components depend on is written in Rust.

Brauner [said](https://mastodon.social/@brauner/117494833657858840) that the project would like to move forward with Rust support in core systemd, "
> but there are several blockers in Rust's support for dynamic libraries which prevents us from doing that without massively bloating every binary we build

". Assuming all goes well, it seems likely this work will appear in the systemd v263 release expected in December.