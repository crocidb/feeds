+++
title = "OpenSSH 10.6 released"
description = 'Version 10.6 of OpenSSH has been released. The announcement notes that the OpenSSH team has been receiving a large number of AI-assisted security bug reports. "We very much welcome these reports, especially when combined with human tr'
date = "2026-10-06T13:42:48Z"
url = "https://lwn.net/Articles/1098980/"
author = "jzb"
text = ""
lastupdated = "2026-10-06T13:46:50.473580225Z"
seen = false
+++

[Version 10.6](https://www.openssh.org/txt/release-10.6) of OpenSSH has been released. The announcement notes that the OpenSSH team has been receiving a large number of AI-assisted security bug reports. "
> We very much welcome these reports, especially when combined with human triage, analysis, test-cases and particularly when accompanied by proposed fixes

". As a result, the project expects to be making more frequent releases to get updates to users more quickly rather than batching the bug fixes until the next planned release.

Notable changes in this release include enabling the hybrid post-quantum ssh-mldsa44-ed25519 signature algorithm, addition of a -p option for [sftp](https://man.openbsd.org/sftp)'s [lmkdir](https://man.openbsd.org/sftp#lmkdir)/[mkdir](https://man.openbsd.org/sftp#mkdir) commands, as well as disabling the LZ77 dictionary coder in [ssh](https://man.openbsd.org/ssh) and [sshd](https://man.openbsd.org/sshd) to mitigate side-channel leaks (which will result in reduced effectiveness of the Compression option). The [scp -R](https://man.openbsd.org/scp#R) option, which allows copies between two remote hosts, is being deprecated due to security risks; the option will be ignored in the future. See the announcement for full details of all changes and bug fixes.