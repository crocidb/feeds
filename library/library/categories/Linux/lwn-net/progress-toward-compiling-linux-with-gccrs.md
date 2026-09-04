+++
title = "[$] Progress toward compiling Linux with gccrs"
description = " The gccrs project, which is creating a Rust frontend for the GCC compiler, has spent the first half of 2026 focusing on compiling the Linux kernel. By testing the compiler against the kernel crates, the development team has made significant progres"
date = "2026-07-28T17:40:01Z"
url = "https://lwn.net/Articles/1083202/"
author = "daroc"
text = ""
lastupdated = "2026-07-28T20:39:51.100907858Z"
seen = false
+++

 The [gccrs project](https://rust-gcc.github.io/), which is creating a Rust frontend for the GCC compiler, has spent the first half of 2026 focusing on compiling the Linux kernel. By testing the compiler against the kernel crates, the development team has made significant progress toward generating correct code for other Rust programs. As detailed in the project's [ weekly](https://github.com/Rust-GCC/Reporting/tree/main/2026) and [ monthly](https://rust-gcc.github.io/#status-reports) reports, this effort has uncovered and resolved problems in areas such as attribute handling (described in the [ report for February](https://rust-gcc.github.io/2026/03/10/2026-02-monthly-report.html)), name resolution, and resource management (both [ detailed in the May report](https://rust-gcc.github.io/2026/06/02/2026-05-monthly-report.html)). Currently, the compiler can only handle simple standalone programs, but that situation could change rapidly in the coming months.