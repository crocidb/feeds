---
title = "Our CPython bindings got 5x faster without PyBind11 🐍"
description = "Cover Python’s not the fastest language out there. Developers often use tools like Boost.Python and SWIG to wrap faster native C/C++ code for Py"
date = "2023-10-10T00:00:00Z"
url = "https://ashvardanian.com/posts/pybind11-cpython-tutorial/"
author = "Ash's Blog"
text = ""
lastupdated = "2025-10-22T08:59:03.354830102Z"
seen = true
---

![Cover](https://ashvardanian.com/pybind11-cpython-tutorial/python-diet.png)

* Python’s not the fastest language out there.
* Developers often use tools like [Boost.Python](https://github.com/boostorg/python) and [SWIG](https://www.swig.org/) to wrap faster native C/C++ code for Python.
* [PyBind11](https://github.com/pybind/pybind11) is the most popular tool for the job not the quickest. [NanoBind](https://github.com/wjakob/nanobind) offers improvements, but when speed really matters, we turn to pure [CPython C API](https://docs.python.org/3/c-api/index.html) bindings.

With **[StringZilla](https://github.com/ashvardanian/stringzilla)**, I started with PyBind11 but switched to CPython to reduce latency. The switch did demand more coding effort, moving from modern C++17 to more basic C99, but the result is a 5x lower call latency! So if you want to make your bindings lighter and better understand how CPython works under the hood - continue reading 🤗