---
title = "Hearthstone on Wine"
description = "I like Hearthstone and recently the next expansion Goblins vs Gnomes so I wanted to install and play it. It didn’t work in vanilla wine, with a “time out error”, but I found a [bug report](https://bugs.wine"
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2014/11/12/hearthstone_wine/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.598585703Z"
seen = true
---

I like [Hearthstone](http://us.battle.net/hearthstone/en/) and recently the next expansion [Goblins vs Gnomes](http://www.goblinsvsgnomes.com) so I wanted to install and play it. It didn’t work in vanilla wine, with a “time out error”, but I found a [bug report](https://bugs.winehq.org/show_bug.cgi?id=36216) which makes it work. Here’s a short summary:

Get wine source from [git](http://wiki.winehq.org/GitWine). My version was `wine-1.7.30-121-g6fe4d9e`.

Make `shlexec.patch` inside the source directory

```
@@ -, +, @@
    Revert "shell32: Use CREATE_NEW_CONSOLE when SEE_MASK_NOCONSOLE is omitted."

    This reverts commit 2005be6dc92c0943ede01525cecad88f8e83c9c7.
--- a/dlls/shell32/shlexec.c	
+++ a/dlls/shell32/shlexec.c	
@@ -338,7 +338,7 @@ static UINT_PTR SHELL_ExecuteW(const WCHAR *lpCmd, WCHAR *env, BOOL shWait,
     startup.dwFlags = STARTF_USESHOWWINDOW;
     startup.wShowWindow = psei->nShow;
     dwCreationFlags = CREATE_UNICODE_ENVIRONMENT;
-    if (!(psei->fMask & SEE_MASK_NO_CONSOLE))
+    if (psei->fMask & SEE_MASK_NO_CONSOLE)
         dwCreationFlags |= CREATE_NEW_CONSOLE;
     if (CreateProcessW(NULL, (LPWSTR)lpCmd, NULL, NULL, FALSE, dwCreationFlags, env,
                        lpDirectory, &startup, &info))

```

Before `make` run

```
patch -p1 < shlexec.patch

```

Then do `make` and `make install` as normal and have fun with Hearthstone.