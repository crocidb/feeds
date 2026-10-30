+++
title = "A report from the LPC sched_ext microconference"
description = 'The Linux Plumbers Conference blog has a report from the sched\_ext microconference held in Prague.Three main topics dominated the discussions*Priority inversion and how to handle it '
date = "2026-10-28T22:11:43Z"
url = "https://lwn.net/Articles/1103426/"
author = "corbet"
text = ""
lastupdated = "2026-10-29T10:48:58.481642443Z"
seen = false
+++

The Linux Plumbers Conference blog has [a report](https://lpc.events/blog/current/index.php/2026/10/28/the-sched_exit-microconference/) from the sched\_ext microconference held in Prague.

>  Three main topics dominated the discussions
>
> * **Priority inversion and how to handle it in sched\_ext**: lock holder and lock waiter preemption, time slice extension, and making proxy execution work together with BPF schedulers.
> * **Paravirtualized scheduling**: letting the host and guest schedulers cooperate across the VM boundary, with sched\_ext as the policy engine on the host.
> * **Device and topology-aware scheduling**: using hardware feedback (Intel HFI), device/accelerator locality and cache topology to drive task placement.
>
>