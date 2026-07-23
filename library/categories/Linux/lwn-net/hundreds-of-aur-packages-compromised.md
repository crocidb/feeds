+++
title = "Hundreds of AUR packages compromised"
description = "Hundreds of orphaned packages hosted by the Arch User Repository (AUR) have been compromised by an attacker who has added a malicious npm package (atomic-lockfile) that can exfiltrate sensitive data. T"
date = "2026-06-12T13:41:22Z"
url = "https://lwn.net/Articles/1077718/"
author = "jzb"
text = ""
lastupdated = "2026-06-16T20:07:35.353860181Z"
seen = false
+++

Hundreds of orphaned packages hosted by the [Arch User Repository](https://aur.archlinux.org/) (AUR) have been compromised by an attacker who has added a [malicious npm package](https://www.npmjs.com/package/atomic-lockfile) (atomic-lockfile) that can exfiltrate sensitive data. The project is currently [working on](https://lists.archlinux.org/archives/list/aur-general@lists.archlinux.org/thread/FGXPCB3ZVCJIV7FX323SBAX2JHYB7ZS4/) cleaning up the mess. There is a [list of affected packages](https://gr.ht/aur_pkg_list.txt) and [post](https://gaysex.cloud/notes/andaxow7itfn05x9) (possibly NSFW domain) by "sodiboo" with additional information. Arch Linux users (or users of Arch-based distributions) that use AUR packages may wish to see if they have installed any of the compromised updates.