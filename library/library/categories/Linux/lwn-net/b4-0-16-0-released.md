+++
title = "b4 0.16.0 released"
description = 'Konstantin Ryabitsev has announced the release of version 0.16.0 of the b4 software-development tool. The biggest change is the addition of bug-tracking support:The new "b4 bugs" command integrates with git-bug to let you track bug repo'
date = "2026-08-05T17:24:28Z"
url = "https://lwn.net/Articles/1087388/"
author = "corbet"
text = ""
lastupdated = "2026-08-06T09:52:34.742365362Z"
seen = false
+++

Konstantin Ryabitsev has announced the release of version 0.16.0 of the [b4](https://b4.docs.kernel.org/en/latest/) software-development tool. The biggest change is the addition of bug-tracking support:

>  The new "b4 bugs" command integrates with git-bug to let you track bug reports alongside your git repository. Bugs are stored as git objects inside the repo, so they travel with the code and can be shared via git push/pull without any external service.

 There are also a lot of improvements to b4 review (which was [covered here](<https://lwn.net/Articles/1063303/#:~:text=entirely.-,b4 review>) in March), better conflict resolution in b4 shazam, improved history rewriting, and more.