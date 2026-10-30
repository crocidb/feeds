+++
title = "x86 Kernel Shadow Stacks Being Worked On For Linux As Powerful Control Flow Protection"
description = "Linux user-space for several years had shadow stack support for hardware-enforced control-flow enforcement in defending against return oriented programming (ROP) attacks. Intel Tigerlake and newer CPUs or AMD Zen 3 and newer have the necessary hardware shadow stacks support. Shad"
date = "2026-10-22T13:22:56Z"
url = "https://www.phoronix.com/news/Linux-Kernel-Shadow-Stacks"
author = "Michael Larabel"
text = ""
lastupdated = "2026-10-22T13:34:56.142274033Z"
seen = false
+++

Linux user-space for several years had shadow stack support for hardware-enforced control-flow enforcement in defending against return oriented programming (ROP) attacks. Intel Tigerlake and newer CPUs or AMD Zen 3 and newer have the necessary hardware shadow stacks support. Shadow stacks have been effective for helping user-space software fend ROP attacks while now there is new work toward bringing shadow stack support for kernel space on Linux...