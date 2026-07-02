+++
title = "[$] Secure Boot certificate expiration is here"
description = "Linux users who have Secure Boot enabled on their systems rely on certificates issued by Microsoft to verify the software used to boot a system is trusted by the user. One of those certificates expired recently, but that will not "
date = "2026-07-01T13:18:52Z"
url = "https://lwn.net/Articles/1079808/"
author = "jzb"
text = ""
lastupdated = "2026-07-01T13:54:32.000029864Z"
seen = false
+++

Linux users who have [Secure Boot](https://en.wikipedia.org/wiki/UEFI#Secure_Boot) enabled on their systems rely on certificates issued by Microsoft to verify the software used to boot a system is trusted by the user. One of those certificates expired recently, but that will not cause systems that are able to boot to stop doing so. There are situations where the expiration may cause problems, however, and the window for relying on existing signed binaries is shorter than it might appear. Users and administrators will want to stay on top of these changes. Over the last year, part of my job at Microsoft has been to work on this problem. [LWN wrote about the certificate expiration in July 2025](https://lwn.net/Articles/1029767/), and this article follows up with where we are now.