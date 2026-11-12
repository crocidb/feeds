+++
title = "Linux 7.5 To Convey To User-Space Multi-Grain Timestamp Usage On Files"
description = "Merged for Linux 6.13 back in 2024 was multigrain timestamp support for being able to switch between coarse and fine-grained change/modification time reporting on a per-file basis. This is useful if caring about accuracy more than the once-per-jiffy timestamps on files and was or"
date = "2026-11-09T11:08:22Z"
url = "https://www.phoronix.com/news/Linux-7.5-Statx-MG-TImestamp"
author = "Michael Larabel"
text = ""
lastupdated = "2026-11-11T16:05:18.615594935Z"
seen = false
+++

Merged for Linux 6.13 back in 2024 was multigrain timestamp support for being able to switch between coarse and fine-grained change/modification time reporting on a per-file basis. This is useful if caring about accuracy more than the once-per-jiffy timestamps on files and was originally devised as a way of addressing NFS caching issues. A limitation of multigrain timestamps though has been the lack of user-space to know whether a file's timestamps are multi-grain or not...