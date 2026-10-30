+++
title = "[$] Python's experimental JIT to be removed"
description = "Python's experimental just-in-time (JIT) compiler, which was added to CPython in 2024 for the 3.13 release, is on its way out. In "
date = "2026-10-26T15:45:58Z"
url = "https://lwn.net/Articles/1102102/"
author = "jzb"
text = ""
lastupdated = "2026-10-27T22:33:08.842949354Z"
seen = false
+++

Python's [experimental just-in-time (JIT) compiler](https://docs.python.org/3.13/whatsnew/3.13.html#an-experimental-just-in-time-jit-compiler), which was added to CPython in 2024 for the [3.13 release](https://www.python.org/downloads/release/python-3130/), is on its way out. In June, the Python steering council [announced](https://discuss.python.org/t/an-announcement-from-the-steering-council-regarding-the-jit-project/107638) that it was pausing work on the JIT in CPython's main branch until there was an accepted [Python Enhancement Proposal](https://peps.python.org/pep-0001) (PEP) that addressed concerns about maintenance, compatibility, and set clear success metrics as well as a timeline for completion. After creating [PEP 836](https://peps.python.org/pep-0836/) ("JIT Go Brrr: The Path to a Supported JIT Compiler for CPython") to try to meet the council's request, and after months of discussion, the JIT maintainers have withdrawn the PEP. For now, it appears that development on the once-promising project has come to an end.