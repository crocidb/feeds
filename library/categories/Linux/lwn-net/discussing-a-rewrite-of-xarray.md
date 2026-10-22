+++
title = "[$] Discussing a rewrite of XArray"
description = " The work to support block sizes larger than the page size on XFS has been difficult. Many users of XFS run stable kernels, which means that they aren't testing new XFS code as it is released. That has made Daniel Gomez wonder whether adopting Rust for some of the data structures"
date = "2026-10-20T15:46:37Z"
url = "https://lwn.net/Articles/1100520/"
author = "daroc"
text = ""
lastupdated = "2026-10-21T11:46:09.757163051Z"
seen = false
+++

 The work to support block sizes larger than the page size on XFS has been difficult. Many users of XFS run stable kernels, which means that they aren't testing new XFS code as it is released. That has made Daniel Gomez wonder whether adopting Rust for some of the data structures underlying XFS, particularly [ XArrays](https://docs.kernel.org/core-api/xarray.html), could reduce the number of bugs lurking in the code. At Kangrejos 2026, he led a discussion about the potential problems with converting XArray to Rust. The assembled kernel developers had a number of reasons to be cautious about replacing the XArray code, but Gomez was determined to experiment with the possibility, citing both security and performance improvements.