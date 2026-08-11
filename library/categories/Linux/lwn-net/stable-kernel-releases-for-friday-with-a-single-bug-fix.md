+++
title = "Stable kernel releases for Friday with a single bug fix"
description = "Greg Kroah-Hartman has announced the release of the 6.12.102, 6.6.150, 6.1.182, 5.15.215, [5.10.264](https://lwn.net/Articles/108774"
date = "2026-08-07T13:35:55Z"
url = "https://lwn.net/Articles/1087743/"
author = "jzb"
text = ""
lastupdated = "2026-08-10T12:13:28.643524912Z"
seen = true
+++

Greg Kroah-Hartman has announced the release of the [6.12.102](https://lwn.net/Articles/1087744/), [6.6.150](https://lwn.net/Articles/1087745/), [6.1.182](https://lwn.net/Articles/1087746/), [5.15.215](https://lwn.net/Articles/1087747/), [5.10.264](https://lwn.net/Articles/1087748/) stable kernels. This round of stable kernel releases contains a fix for a single bug, [found by Thomas Lamprecht](https://lwn.net/ml/all/e6168644-1943-403e-98f7-e03b86db2ff2@proxmox.com/), that affected several of the kernels [released yesterday](https://lwn.net/Articles/1087567/) in response to a [security vulnerability](https://lwn.net/ml/all/2026080631-CVE-2026-68480-ad40@gregkh/) ([CVE-2026-68480](https://www.cve.org/CVERecord/?id=CVE-2026-68480)) that could allow data leakage through speculative execution.

The 6.12.102 release adds the backported security fix for CVE-2026-68480 to the 6.12 series. As always, users are advised to upgrade.