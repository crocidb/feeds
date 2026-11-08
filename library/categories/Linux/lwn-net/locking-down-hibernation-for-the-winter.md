+++
title = "[$] Locking down hibernation for the winter"
description = " When a computer hibernates, the kernel writes the contents of memory to disk and then shuts the system down. Resuming from hibernation involves reading that data back into memory, and then having the kernel pick up where it left off. Unfortunately, the kernel does not have any w"
date = "2026-11-06T18:51:28Z"
url = "https://lwn.net/Articles/1103190/"
author = "daroc"
text = ""
lastupdated = "2026-11-07T14:31:42.363672885Z"
seen = false
+++

 When a computer hibernates, the kernel writes the contents of memory to disk and then shuts the system down. Resuming from hibernation involves reading that data back into memory, and then having the kernel pick up where it left off. Unfortunately, the kernel does not have any way to know that the data it is reading back has not been tampered with, which is why [lockdown](https://lwn.net/Articles/791863/), an optional kernel feature that attempts to prevent modifications to the running kernel, disables hibernation. Matthew Garrett, who has been working on lockdown for many years, has shared [ a patch set](https://lwn.net/ml/linux-pm/20261008132532.1155166-1-matthewg@nvidia.com/) that aims to fix this problem. His solution must also protect against downgrade attacks (where an attacker reboots the computer with an older kernel version to bypass new protections), which complicates the implementation.