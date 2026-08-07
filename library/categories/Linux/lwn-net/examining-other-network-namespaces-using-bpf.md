+++
title = "[$] Examining other network namespaces using BPF"
description = " Jordan Rife's work involves writing BPF programs for  Cilium that interface with  Kubernetes networking. As part of that work, he wants to enable BPF programs with appropriate permissions to iterate through the sockets of a differe"
date = "2026-08-05T16:59:26Z"
url = "https://lwn.net/Articles/1085896/"
author = "daroc"
text = ""
lastupdated = "2026-08-06T09:52:34.744043162Z"
seen = false
+++

 Jordan Rife's work involves writing BPF programs for [ Cilium](https://cilium.io/) that interface with [ Kubernetes](https://kubernetes.io/) networking. As part of that work, he wants to enable BPF programs with appropriate permissions to iterate through the sockets of a different network namespace. He led a session about the idea at the 2026 [ Linux Storage, Filesystem, Memory-Management, and BPF Summit](https://events.linuxfoundation.org/lsfmmbpf/) where the BPF developers in attendance were quick to suggest a number of related alternatives.