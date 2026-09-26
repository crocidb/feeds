+++
title = "[$] Testing compat_linux on NetBSD with the Linux Test Project"
description = 'NetBSD has long had support for running Linux binaries via its kernel-level compat\_linux feature, but test coverage for it was less complete than some might hope. In order to provide better testing for compat\_linux'
date = "2026-09-21T14:22:55Z"
url = "https://lwn.net/Articles/1094310/"
author = "jzb"
text = ""
lastupdated = "2026-09-23T18:24:55.803542928Z"
seen = false
+++

[NetBSD](https://netbsd.org/) has long had support for running Linux binaries via its kernel-level [compat\_linux](https://man.netbsd.org/compat_linux.8) feature, but test coverage for it was less complete than some might hope. In order to provide better testing for compat\_linux, Google Summer of Code (GSoC) participant Henrique Brito opted to work on enabling the [Linux Test Project (LTP)](https://linux-test-project.readthedocs.io/en/latest/) test suite to compile and run on NetBSD. At [EuroBSDCon 2026](https://2026.eurobsdcon.org/), Brito's mentor, Stephen Borrill, provided a report on the project, and the status of LTP on NetBSD. The work has already resulted in some minor fixes, and a good list of additional problems to solve.