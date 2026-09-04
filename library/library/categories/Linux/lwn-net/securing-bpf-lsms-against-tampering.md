+++
title = "[$] Securing BPF LSMs against tampering"
description = " Since 2020, BPF programs have been able to  act as Linux security modules (LSMs). Several projects, including systemd, have been working to use that capability to provide more security to users. Christian Brauner spoke at the 2026 [ L"
date = "2026-07-17T15:58:17Z"
url = "https://lwn.net/Articles/1082111/"
author = "daroc"
text = ""
lastupdated = "2026-07-18T14:48:09.914067544Z"
seen = false
+++

 Since 2020, BPF programs have been able to [ act as](https://docs.kernel.org/bpf/prog_lsm.html) Linux security modules (LSMs). Several projects, including systemd, have been working to use that capability to provide more security to users. Christian Brauner spoke at the 2026 [ Linux Storage, Filesystem, Memory-Management, and BPF Summit](https://events.linuxfoundation.org/lsfmmbpf/) about some of the limitations of using BPF in this way, and the changes he would like to see for systemd's use. In particular, he would like a way to make sure that BPF programs cannot be removed or have their private data tampered with.