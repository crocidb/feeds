+++
title = "[$] Sched-ext: enqueue() for sub-schedulers and proxy-execution support"
description = 'The extensible scheduler class (sched\_ext) allows the installation of custom CPU schedulers as a set of BPF programs. While sched\_ext, in its current form, has already led to a lot of interesting scheduler-development work, th'
date = "2026-07-16T14:00:05Z"
url = "https://lwn.net/Articles/1082717/"
author = "corbet"
text = ""
lastupdated = "2026-07-16T14:36:54.827062251Z"
seen = false
+++

The [extensible scheduler class](https://docs.kernel.org/scheduler/sched-ext.html) (sched\_ext) allows the installation of custom CPU schedulers as a set of BPF programs. While sched\_ext, in its current form, has already led to a lot of interesting scheduler-development work, the subsystem itself is still undergoing rapid evolution. Among other work, the ability to set up a hierarchy of [sub-schedulers](https://lwn.net/Articles/1056014/) is approaching completion, and a longstanding incompatibility with [proxy execution](https://lwn.net/Articles/934114/) is coming to an end.