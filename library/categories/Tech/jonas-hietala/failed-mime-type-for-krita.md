---
title = "Failed mime type for Krita"
description = 'I thought Krita worked fine… Until I tried to save. Krita crashed whenever I tried to save (or open) a file and gave the error:Could not find mime type "application/x-krita"Turns out if you reinstall the package shared-mime-info which comes natively '
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2015/07/08/failed_mime_type_for_krita/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.576685755Z"
seen = true
---

I thought [Krita](https://krita.org/) worked fine… Until I tried to save. Krita crashed whenever I tried to save (or open) a file and gave the error:

```
Could not find mime type "application/x-krita"

```

Turns out if you reinstall the package `shared-mime-info` which comes natively with Slackware the problem goes away.