+++
title = "[$] Deterministic testing for multithreaded Python"
description = """Python's support for multithreaded programs has improved considerably over the last few years with the advent of the "free-threaded" version of the language. But testing multithreaded programs is notoriously difficult, because the underlying h"""
date = "2026-09-04T15:29:17Z"
url = "https://lwn.net/Articles/1090579/"
author = "jake"
text = ""
lastupdated = "2026-09-08T09:44:05.488492628Z"
seen = false
+++

Python's support for multithreaded programs has improved considerably over the last few years with the advent of the ["free-threaded" version of the language](https://lwn.net/Articles/1078367/). But testing multithreaded programs is notoriously difficult, because the underlying host system determines the thread-execution ordering, which adds an element of non-determinism. At PyCon US, Larry Hastings gave a talk ([YouTube video](https://www.youtube.com/watch?v=S3LUpx0hzkw&t=96s)) about his [blanket](https://pypi.org/project/blanket/) project, which is meant to provide mechanisms for deterministic testing of multithreaded Python code.