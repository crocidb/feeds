+++
title = "More vulnerabilities in widely deployed software"
description = " The Node.js project has released a number of security updates to fix, among other vulnerabilities, a remote-code-execution bug affecting programs that use Brotli compression. And, in case any programmers "
date = "2026-10-21T17:09:24Z"
url = "https://lwn.net/Articles/1102044/"
author = "daroc"
text = ""
lastupdated = "2026-10-22T13:34:56.304823712Z"
seen = false
+++

 The Node.js project has [released a number of security updates](https://nodejs.org/en/blog/vulnerability/october-2026-security-releases) to fix, among other vulnerabilities, a remote-code-execution bug affecting programs that use Brotli compression. And, in case any programmers who use compiled languages thought they could relax, the [musl libc project](https://musl.libc.org/) has also announced a new vulnerability: an [out-of-bounds write](https://lwn.net/ml/all/20261021154307.GA4413@brightrain.aerifal.cx/) that could potentially lead to remote code execution, although that has not been demonstrated.