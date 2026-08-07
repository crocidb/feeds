+++
title = "Six stable kernels with a security fix"
description = "Greg Kroah-Hartman has announced the release of the 7.1.7, 6.18.43, 6.6.149, 6.1.181, 5.15.214,"
date = "2026-08-06T18:13:15Z"
url = "https://lwn.net/Articles/1087567/"
author = "jzb"
text = ""
lastupdated = "2026-08-06T21:59:24.729384588Z"
seen = false
+++

Greg Kroah-Hartman has announced the release of the [7.1.7](https://lwn.net/Articles/1087568/), [6.18.43](https://lwn.net/Articles/1087569/), [6.6.149](https://lwn.net/Articles/1087570/), [6.1.181](https://lwn.net/Articles/1087571/), [5.15.214](https://lwn.net/Articles/1087572/), and [5.10.263](https://lwn.net/Articles/1087573/) stable kernels. These kernels fix a [single security vulnerability](https://lwn.net/ml/all/2026080631-CVE-2026-68480-ad40@gregkh/) ([CVE-2026-68480](https://www.cve.org/CVERecord/?id=CVE-2026-68480)) that could allow data leakage through speculative execution. Users of those kernels are advised to upgrade.