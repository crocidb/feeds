+++
title = "[$] Attaching programs to multiple tracepoints"
description = " Tracepoints in the kernel are useful for a variety of purposes: debugging, active monitoring, and performance measurements, among other things. Previously, any given BPF program could only be attached to a single tracepoint. Jiri Olsa has been working to change that, and led a d"
date = "2026-07-22T15:08:41Z"
url = "https://lwn.net/Articles/1082948/"
author = "daroc"
text = ""
lastupdated = "2026-07-23T22:52:44.026205520Z"
seen = false
+++

 Tracepoints in the kernel are useful for a variety of purposes: debugging, active monitoring, and performance measurements, among other things. Previously, any given BPF program could only be attached to a single tracepoint. Jiri Olsa has been working to change that, and led a discussion about his progress at the 2026 [ Linux Storage, Filesystem, Memory-Management, and BPF Summit](https://events.linuxfoundation.org/lsfmmbpf/). That work has since been [ merged](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c49f336dbcf30ff8622d3725c54fe1c90e8ccd9c), and can be expected as part of the 7.2 kernel.