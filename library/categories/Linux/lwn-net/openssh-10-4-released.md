+++
title = "OpenSSH 10.4 released"
description = "OpenSSH 10.4 has been released. In addition to a number of security and bug fixes, there are a few notable changes; this release adds experimental support for a composite post-quantum signature scheme combining ML-DSA 44 and Ed25519 as described in [this IETF draft](https://datat"
date = "2026-07-06T16:13:19Z"
url = "https://lwn.net/Articles/1081536/"
author = "jzb"
text = ""
lastupdated = "2026-07-06T19:13:36.148473820Z"
seen = true
+++

OpenSSH 10.4 has been released. In addition to a number of security and bug fixes, there are a few notable changes; this release adds experimental support for a composite post-quantum signature scheme combining ML-DSA 44 and Ed25519 as described in [this IETF draft](https://datatracker.ietf.org/doc/draft-miller-sshm-mldsa44-ed25519-composite-sigs/). With 10.4, if OpenSSH is compiled with sandbox support it will fail on Linux systems that have not enabled SECCOMP or NO\_NEW\_PRIVS; prior to this release, [sshd](https://man.openbsd.org/sshd.8) would log an error but continue operation. See the [release notes](https://www.openssh.org/txt/release-10.4) for a full list of changes.