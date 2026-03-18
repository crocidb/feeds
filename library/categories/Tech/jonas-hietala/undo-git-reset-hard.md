---
title = "Undo git reset --hard"
description = "I purposefully and more or less idiotically executed git reset --hard <hashin hopes of going back a bit. What I didn’t realize then is that you throw away all the commits between now until <hash. Not quite what was planned.After a bit of panic I found [the answer](http://s"
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2014/08/29/undo_git_reset_--hard/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.612305057Z"
seen = true
---

I purposefully and more or less idiotically executed `git reset --hard <hash>` in hopes of going back a bit. What I didn’t realize then is that you throw away all the commits between now until `<hash>`. Not quite what was planned.

After a bit of panic I found [the answer](http://stackoverflow.com/questions/7374069/undo-git-reset-hard/18472148#18472148):

1. Find your hash using `git reflog`.
2. Do `git cherry-pick <hash>` to go back in time.

This saved me a bunch of time, thanks!