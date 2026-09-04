+++
title = "[$] The beginning of a process-builder API"
description = 'The recent discussion on "spawn templates" raised questions about whether it was time to provide an alternative to the classic Unix fork()/exec() pattern for process creation. One idea that was raised there was to shift the template pattern in'
date = "2026-08-04T13:27:51Z"
url = "https://lwn.net/Articles/1086330/"
author = "corbet"
text = ""
lastupdated = "2026-08-06T09:52:34.753318826Z"
seen = false
+++

The recent [discussion on "spawn templates"](https://lwn.net/Articles/1076018/) raised questions about whether it was time to provide an alternative to the classic Unix fork()/exec() pattern for process creation. One idea that was raised there was to shift the template pattern into an interface that could be used to efficiently assemble new processes from bare cloth, without duplicating the parent process. Preferably, that interface would be able to implement [posix\_spawn()](https://man7.org/linux/man-pages/man3/posix_spawn.3.html). Li Chen, the author of the spawn-template work, has now responded with [a patch series](https://lwn.net/ml/all/cover.1784204592.git.me@linux.beauty) (written with significant LLM assistance) showing what a process-builder API for Linux might look like.