+++
title = "Seven stable kernels with fixes for three Xen vulnerabilities"
description = "Hot on the heels of the previous two stable kernels, Greg Kroah-Hartman has announced the release of the 7.3.3, 6.18.62, 6.12.116, ["
date = "2026-11-06T18:48:34Z"
url = "https://lwn.net/Articles/1105902/"
author = "jzb"
text = ""
lastupdated = "2026-11-07T14:31:42.367200430Z"
seen = false
+++

Hot on the heels of the [previous two stable kernels](https://lwn.net/Articles/1105899/), Greg Kroah-Hartman has announced the release of the [7.3.3](https://lwn.net/Articles/1105903/), [6.18.62](https://lwn.net/Articles/1105904/), [6.12.116](https://lwn.net/Articles/1105905/), [6.6.162](https://lwn.net/Articles/1105906/), [6.1.192](https://lwn.net/Articles/1105907/), [5.15.225](https://lwn.net/Articles/1105908/), and [5.10.274](https://lwn.net/Articles/1105909/) stable kernels. Each one only contains fixes for three use-after-free vulnerabilities announced today by the Xen security team.

Two of the vulnerabilities could allow an attacker to cause a denial of service (DoS) for the entire Xen host machine with possible information leakage ([CVE-2026-100080](https://lwn.net/ml/all/E1xPLfb-0000000A5rj-1W0D@xenbits.xenproject.org/), [CVE-2026-100082](https://lwn.net/ml/all/E1xPLfh-0000000A5vb-11J3@xenbits.xenproject.org/)), and one may allow privilege escalation as well as a DoS of the host machine ([CVE-2026-100081](https://lwn.net/ml/all/E1xPLfe-0000000A5tc-0wMP@xenbits.xenproject.org/)). Users should, of course, upgrade if they are using Xen.