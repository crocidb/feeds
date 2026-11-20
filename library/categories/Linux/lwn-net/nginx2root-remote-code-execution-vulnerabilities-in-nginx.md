+++
title = "NGINX2Root: Remote Code Execution vulnerabilities in nginx"
description = "Xint is reporting that it has discovered a collection of five critical vulnerabilities in the [NGINX](https://ngi"
date = "2026-11-18T16:13:34Z"
url = "https://lwn.net/Articles/1108362/"
author = "jzb"
text = ""
lastupdated = "2026-11-19T14:05:14.595452865Z"
seen = false
+++

Xint is [reporting](https://xint.io/blog/nginx2root-remote-code-execution) that it has discovered a collection of [five critical vulnerabilities](https://xint.io/blog/nginx2root-remote-code-execution#5-technical-analysis-of-the-nginx-vulnerabilities-16) in the [NGINX](https://nginx.org/) web server. The worst flaw, it says, would [allow an unauthenticated attacker to execute commands on an affected nginx server with HTTP/2 enabled](https://xint.io/blog/nginx2root-remote-code-execution#what-an-attacker-can-do-2). The company also reports a local-privilege escalation (LPE) [kernel vulnerability](https://xint.io/blog/nginx2root-remote-code-execution#6-analysis-of-the-linux-kernel-lpe-vulnerability-22), which was introduced in the 4.15 kernel, in the [Stream Control Transmission Protocol (SCTP)](https://docs.kernel.org/networking/sctp.html) subsystem. If chained with the NGINX vulnerability, it would allow an attacker to gain root privileges on the host. A kernel patch for this is not yet available.

>  We also obtained a root shell on the host in a setup where nginx was running in a Docker container. On many Linux distributions, the SCTP module is installed by default and the kernel loads it automatically the first time a program opens an SCTP socket. Whether SCTP is reachable on a given host still depends on the kernel, the available modules, and the container's restrictions. Where it is reachable, the attacker can take over the host kernel. Since all containers on the host share that kernel, this gives the attacker control of the host and every container on it.

Xint recommends updating to [NGINX 1.31.9](https://github.com/nginx/nginx/releases/tag/release-1.31.9), which was just released, and to block the SCTP module on hosts that do not need it until a kernel fix is available. See the [mitigations](https://xint.io/blog/nginx2root-remote-code-execution#33-emergency-mitigations-before-patching-14) section of their report for more information.