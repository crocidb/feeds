+++
title = "[$] Python's two modules for random numbers"
description = "Python's random and secrets modules both include utilities for obtaining random values, but only one of them is suitable for generating passwords and security tokens. For much of Py"
date = "2026-10-06T15:02:09Z"
url = "https://lwn.net/Articles/1097468/"
author = "jake"
text = ""
lastupdated = "2026-10-07T14:53:32.026416604Z"
seen = true
+++

Python's [random](https://docs.python.org/3/library/random.html) and [secrets](https://docs.python.org/3/library/secrets.html) modules both include utilities for obtaining random values, but only one of them is suitable for generating passwords and security tokens. For much of Python's history, random was used for passwords and tokens anyway, despite documentation that called it unsuitable for cryptography. In 2015, Python's core team debated whether to fix that misuse by making random secure by default. Instead, in 2016, Python 3.6 added a second module: secrets. The random module is still misused at times, so it is instructive to look into how the random-number modules should be used.