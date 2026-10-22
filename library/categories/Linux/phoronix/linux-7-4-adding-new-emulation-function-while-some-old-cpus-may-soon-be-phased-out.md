+++
title = "Linux 7.4 Adding New Emulation Function While Some Old CPUs May Soon Be Phased Out"
description = "Linux 7.4 is seeing a new emulation function added for cmpxchg() for compare and exchange. This is being done so that two-byte cmpxchg() can be used in common Linux kernel code that is already natively supported on newer CPU architectures. The pull request notes though that some "
date = "2026-10-20T10:32:23Z"
url = "https://www.phoronix.com/news/Linux-7.4-Two-Byte-CMPXCHG"
author = "Michael Larabel"
text = ""
lastupdated = "2026-10-21T11:46:09.458689925Z"
seen = false
+++

Linux 7.4 is seeing a new emulation function added for cmpxchg() for compare and exchange. This is being done so that two-byte cmpxchg() can be used in common Linux kernel code that is already natively supported on newer CPU architectures. The pull request notes though that some old systems might no longer be supported by the Linux kernel moving ahead...