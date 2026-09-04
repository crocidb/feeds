+++
title = "[$] Hazard pointers for the kernel"
description = "The kernel's read-copy-update (RCU) subsystem ensures that data will not be deleted until it is known that there are no threads holding references to it. RCU works well and is widely used throughout the kernel, but it can increase memory use and add significant delays before unus"
date = "2026-07-27T16:51:58Z"
url = "https://lwn.net/Articles/1084015/"
author = "corbet"
text = ""
lastupdated = "2026-07-28T12:42:27.194144961Z"
seen = false
+++

The kernel's read-copy-update (RCU) subsystem ensures that data will not be deleted until it is known that there are no threads holding references to it. RCU works well and is widely used throughout the kernel, but it can increase memory use and add significant delays before unused kernel objects are cleaned up. [Hazard pointers](https://en.wikipedia.org/wiki/Hazard_pointer) are an alternative approach to lockless data updates that offers better performance, for some situations at least. The kernel community is currently considering [a hazard-pointer implementation](https://lwn.net/ml/all/23e34c2e-67fd-45da-b130-e70a131a59ea@paulmck-laptop) by Mathieu Desnoyers and Paul McKenney.