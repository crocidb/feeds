+++
title = "[$] Even more formal verification for BPF"
description = " BPF offers useful safety guarantees, but Kumar Kartikeya Dwivedi wants BPF programs to be even safer. At the 2026  Linux Storage, Filesystem, Memory-Management, and BPF Summit, he led a session ([slides](https://drive.google.com/fi"
date = "2026-08-10T13:59:33Z"
url = "https://lwn.net/Articles/1087069/"
author = "daroc"
text = ""
lastupdated = "2026-08-10T22:25:11.148702584Z"
seen = false
+++

 BPF offers useful safety guarantees, but Kumar Kartikeya Dwivedi wants BPF programs to be even safer. At the 2026 [ Linux Storage, Filesystem, Memory-Management, and BPF Summit](https://events.linuxfoundation.org/lsfmmbpf/), he led a session ([slides](https://drive.google.com/file/d/1qeLgPaOvwKMHQmyGHeNWQUBQstQeDR2v/view)) discussing the possibility of adding domain-specific invariants to BPF programs. It was not a discussion intended to lead to the implementation of any particular kernel feature, but rather an overview of why additional formal verification might be needed, and how it could work with the existing BPF ecosystem.