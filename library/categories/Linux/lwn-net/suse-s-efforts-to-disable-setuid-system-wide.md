+++
title = "[$] SUSE's efforts to disable setuid system-wide"
description = "Setuid (and setgid) binaries have long been a source of headaches, and security vulnerabilities, on Linux systems. They are largely seen as something to be avoided; SUSE's security team, for example, [forbids the inclusion of setuid or setgid binaries in packages](https://en.open"
date = "2026-10-20T18:36:10Z"
url = "https://lwn.net/Articles/1100257/"
author = "jzb"
text = ""
lastupdated = "2026-10-21T11:46:09.755931662Z"
seen = false
+++

Setuid (and setgid) binaries have long been a source of headaches, and security vulnerabilities, on Linux systems. They are largely seen as something to be avoided; SUSE's security team, for example, [forbids the inclusion of setuid or setgid binaries in packages](https://en.opensuse.org/openSUSE:Package_security_guidelines#Setuid_Binaries) unless they have been reviewed and explicitly allowed. Thorsten Kukuk wants to go a step further and disallow them entirely. At the [2026 All Systems Go!](https://all-systems-go.io/) conference, he spoke about his work to disable setuid system-wide, as well as some of the hurdles that remain.