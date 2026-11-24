+++
title = "[$] Added indirection allows for larger BPF programs"
description = " The BPF verifier has historically worked by tracing every possible path of execution through a program, checking, at each instruction, that various safety properties hold. This works, but it can result in an exponential increase in the number of states that need checking in prog"
date = "2026-11-19T17:32:42Z"
url = "https://lwn.net/Articles/1106537/"
author = "daroc"
text = ""
lastupdated = "2026-11-23T10:53:41.395104616Z"
seen = false
+++

 The BPF verifier has historically worked by tracing every possible path of execution through a program, checking, at each instruction, that various safety properties hold. This works, but it can result in an exponential increase in the number of states that need checking in programs with complicated control-flow. Alexei Starovoitov, one of the kernel's core BPF maintainers, has shared [ a patch set](https://lwn.net/ml/all/20261105204513.2230344-1-alexei.starovoitov@gmail.com/) that substantially reworks how the verifier tracks states, in order to reduce the size of that exponential explosion.