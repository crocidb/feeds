+++
title = "Generate random SQL inserts using pysert"
description = "pysert (lowercase ‘p’) is a python utility designed to generate random SQL INSERT statements from predefined templates. While its primary focus is SQL, its template-driven nature allows it to generate almost any stru"
date = "2021-01-20T00:00:00Z"
url = "https://andreinc.net/2021/01/20/generate-random-sql-inserts-using-pysert/"
author = "Andrei Ciobanu"
text = ""
lastupdated = "2026-03-18T21:57:49.236961540Z"
seen = true
+++

[**pysert**](https://github.com/nomemory/pysert/blob/main/pysert.py) (lowercase ‘p’) is a python utility designed to generate random SQL `INSERT` statements from predefined templates. While its primary focus is SQL, its template-driven nature allows it to generate almost any structured format, including `JSON`, `XML`, or `YAML`.

If you need a more robust, production-grade Java solution, I recommend checking out [MockNeat](https://www.mockneat.com), which offers similar functionality with a significantly larger feature set.

Getting Started
==========

The script requires `python 3.x`. First, clone the repository: