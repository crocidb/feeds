+++
title = "[$] A pause for the Python JIT"
description = "In 2024 the Python 3.13 release added an experimental just-in-time (JIT) compiler to optimize the way that CPython executes Python"
date = "2026-09-01T14:40:09Z"
url = "https://lwn.net/Articles/1090385/"
author = "jzb"
text = ""
lastupdated = "2026-09-01T19:33:14.060301903Z"
seen = false
+++

In 2024 the [Python 3.13](https://www.python.org/downloads/release/python-3130/) release added an [experimental just-in-time (JIT) compiler](https://docs.python.org/3.13/whatsnew/3.13.html#an-experimental-just-in-time-jit-compiler) to optimize the way that CPython executes Python code. Since then, work has proceeded on the JIT, albeit perhaps less formally than some might like. In June, Python's [steering council](https://peps.python.org/pep-0013/#the-steering-council) (SC) put out an [announcement](https://discuss.python.org/t/an-announcement-from-the-steering-council-regarding-the-jit-project/107638) that no new development on the JIT land (with the exception of bug and security fixes) in Python's main branch, until it accepts a [Python Enhancement Proposal](https://peps.python.org/pep-0001) (PEP) that would make the case for the JIT as a supported part of CPython. That has led to the creation of [PEP 836](https://peps.python.org/pep-0836/) ("JIT Go Brrr: The Path to a Supported JIT Compiler for CPython"), which is currently under discussion. As it stands, it seems likely that work on JIT will continue, but when that will happen is less certain.