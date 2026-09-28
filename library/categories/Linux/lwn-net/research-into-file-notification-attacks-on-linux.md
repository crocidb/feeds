+++
title = "Research into file-notification attacks on Linux"
description = "Sudheendra Raghav Neela, a member of a group of researchers from Graz University of Technology, has announced the release of research into file-notification attacks that would allow spying on "
date = "2026-09-24T17:40:36Z"
url = "https://lwn.net/Articles/1096431/"
author = "jzb"
text = ""
lastupdated = "2026-09-27T09:50:58.742555035Z"
seen = false
+++

Sudheendra Raghav Neela, a member of a group of researchers from [Graz University of Technology](https://www.tugraz.at/en/home), has [announced](https://infosec.exchange/@vmcall/117327103049106849) the release of research into file-notification attacks that would allow spying on user activity on Android, Linux, macOS, and Windows. The group has published [a paper](https://inoti.fyi/pubs/file-notification-attacks.pdf) with details on the research as well as a [web site](https://inoti.fyi/) with demonstrations of the vulnerabilities.

On Linux, an attacker can use [inotifywatch](https://linux.die.net/man/1/inotifywatch) to monitor a directory to conduct an inter-keystroke timing attack—even if they do not have read access to the files within a directory. The group also discovered a method to conduct a [UI-redress attack](https://www.deepwatch.com/glossary/ui-redress-attack/) (or "[clickjacking](https://en.wikipedia.org/wiki/Clickjacking)" attack) on KDE 5 and KDE 6 by monitoring /usr/bin/pkexec to detect when [Polkit](https://en.wikipedia.org/wiki/Polkit) spawns an authentication prompt. An attacker could draw a fake password window on top of the real window to collect a user's credentials.

Both of these flaws are still present today, though the Linux kernel did partially mitigate the issue with [a fix](https://lore.kernel.org/linux-cve-announce/2026011303-CVE-2025-68788-05bd@gregkh/) that was included in the 5.10.248, 5.15.198, 6.1.160, 6.6.120, 6.12.65, and 6.18.3 kernels shipped in January. See the web site for more information and a mitigation to prevent password-prompt windows from losing focus.