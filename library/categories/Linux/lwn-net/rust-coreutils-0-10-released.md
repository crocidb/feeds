+++
title = "Rust Coreutils 0.10 released"
description = "Version 0.10 of the uutils project's Rust Coreutils has been released. This release focused on compatibility with the [GNU Core Utilities](https://www.gnu.org/softwa"
date = "2026-08-06T13:37:51Z"
url = "https://lwn.net/Articles/1087490/"
author = "jzb"
text = ""
lastupdated = "2026-08-06T21:59:24.732283418Z"
seen = false
+++

[Version 0.10](https://github.com/uutils/coreutils/releases/tag/0.10.0) of the [uutils](https://uutils.org/) project's [Rust Coreutils](https://uutils.org/coreutils/) has been released. This release focused on compatibility with the [GNU Core Utilities](https://www.gnu.org/software/coreutils/) suite, with Rust Coreutils now passing 645 of 690 tests, up from 625 with [version 0.9.0](https://github.com/uutils/coreutils/releases#release-0.9.0). Notable changes in this release include addition of the mv --exchange option, an OpenSSL backend for checksum utilities, applying SELinux labels at creation when using mkdir, mkfifo, and mknod, as well as a number of performance and security improvements.

The project has an [online playground](https://uutils.org/playground/) that runs the Rust Coreutils directly in the browser via WebAssembly for those who would like to try the utilities without installing them. LWN [covered](https://lwn.net/Articles/1007907/) the uutils project in February 2025.