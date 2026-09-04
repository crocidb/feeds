+++
title = "New Site Generator"
description = "After a month of testing, I’ve cut over the site engine to my new Go-based generator, which lives almost entirely inside GitHub Actions and uses a rather convoluted process to minimize the number of moving parts and dependencies.I still expect some minor brea"
date = "2026-08-01T11:30:00Z"
url = "https://taoofmac.com/space/notices/2026/08/01/1130?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-06T09:52:38.191886824Z"
seen = false
+++

After a month of testing, I’ve cut over the site engine to my new [Go](/space/dev/golang)-based generator, which lives almost entirely inside GitHub Actions and uses a rather convoluted process to minimize the number of moving parts and dependencies.

I still expect some minor breakages and regressions, but the new engine is much faster and a bit more flexible than the old one, plus it does away with the need to have a separate build server and the associated maintenance overhead.

Let’s see how it goes, shall we?

>
>
> **Update:** Of course it broke a few things, but the great thing about my agent setup is that it can do audits and rebuilds on demand, so most of it is already fixed: <img src="/space/notices/2026/08/01/1130/image.png?v=ff76b8f4ec55" alt="piclaw audit" width="1280" height="611">
>
>