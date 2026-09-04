+++
title = "[$] Bringing BPF to binfmt_misc"
description = 'The kernel is able to run a few types of executable files, including native binaries in the ELF format and interpreted programs that begin with the ! marker. It also, however, has a mechanism, called binfmt\_misc, that can '
date = "2026-08-06T13:47:18Z"
url = "https://lwn.net/Articles/1086947/"
author = "corbet"
text = ""
lastupdated = "2026-08-06T21:59:24.730769687Z"
seen = false
+++

The kernel is able to run a few types of executable files, including native binaries in the ELF format and interpreted programs that begin with the #! marker. It also, however, has a mechanism, called [binfmt\_misc](https://docs.kernel.org/admin-guide/binfmt-misc.html), that can be configured from user space to enable the transparent execution of programs in just about any format. This feature has been relatively static for years, but it seems likely to receive some significant updates in the near future, including the ability to load BPF programs that can decide how to run a given program.