+++
title = "Remote code execution on Linux systems with multipath TCP"
description = " On October 27, LLM provider Anthropic reported on a  remotely exploitable use-after-free bug affecting systems with multipath TCP listeners open. The "
date = "2026-10-30T15:45:27Z"
url = "https://lwn.net/Articles/1104192/"
author = "daroc"
text = ""
lastupdated = "2026-11-02T23:27:02.325006244Z"
seen = false
+++

 On October 27, LLM provider Anthropic [reported on](https://www.anthropic.com/research/discovering-vulnerabilities-with-claude) a [ remotely exploitable use-after-free bug](https://nvd.nist.gov/vuln/detail/cve-2026-98432) affecting systems with multipath TCP listeners open. The bug works by triggering a response to a retransmitted SYN packet at the same moment that the TCP connection is established in another thread, causing the first thread to access the connection's options structure after the second thread has freed it. The first thread can then disclose kernel memory or cause a buffer overflow, writing an attacker-controlled payload. The fix was [ to only free the structure after an RCU grace period](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e3f33b0a1d89d738e2b913dab519226eaf76e15b). On October 29, the Go security team [advised that all programs written in Go use multipath TCP by default](https://lwn.net/ml/all/bdb0066d-471b-4689-bb85-bfcb08774706@oracle.com/), so many systems may be unknowingly vulnerable. And, of course, there is always the possibility of related bugs in other sections of the TCP stack. Users may be wise to update to a patched kernel as soon as one becomes available for their distribution.