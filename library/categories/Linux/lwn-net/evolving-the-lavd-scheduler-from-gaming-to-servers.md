+++
title = "[$] Evolving the LAVD scheduler from gaming to servers"
description = "The extensible scheduler class, which enables the creation of custom CPU schedulers with BPF, has led to a burst of innovation in this area; the LAVD scheduler has, per"
date = "2026-10-07T13:33:48Z"
url = "https://lwn.net/Articles/1097209/"
author = "corbet"
text = ""
lastupdated = "2026-10-07T14:53:32.021784485Z"
seen = true
+++

The [extensible scheduler class](https://lwn.net/Articles/922405/), which enables the creation of custom CPU schedulers with BPF, has led to a burst of innovation in this area; [the LAVD scheduler](https://github.com/sched-ext/scx/tree/main/scheds/rust/scx_lavd#scx_lavd) has, perhaps, been one of the most noteworthy schedulers to emerge. Though it was originally [designed for gaming applications](https://lwn.net/Articles/1051430/), the LAVD scheduler has since grown to serve other types of workloads as well. At the 2026 edition of [Kernel Recipes](https://kernel-recipes.org/en/2026/), Changwoo Min and Gavin Guo presented an overview of this scheduler and how it has evolved over time.