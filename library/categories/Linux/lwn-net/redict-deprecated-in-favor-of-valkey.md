+++
title = "Redict deprecated in favor of Valkey"
description = " Drew DeVault has announced that Redict, a fork of Redis that was created in response to Redis's 2024 license change, has been deprecated. He rec"
date = "2026-11-17T16:20:44Z"
url = "https://lwn.net/Articles/1108155/"
author = "daroc"
text = ""
lastupdated = "2026-11-19T14:05:14.599563574Z"
seen = false
+++

 Drew DeVault has [announced](https://redict.io/posts/2026-11-17-redict-deprecated/) that [Redict](https://redict.io), a fork of [Redis](https://redis.io/) that was created in response to [Redis's 2024 license change](https://lwn.net/Articles/966631/), has been deprecated. He recommends switching to [Valkey](https://valkey.io/), the permissively licensed Redis fork supported by the Linux Foundation. The two projects are mutually compatible, so switching should be as simple as changing which package is installed and renaming the configuration file.

>
>
>  I had hoped to rally the Redis diaspora around a copyleft initiative, to protect ourselves from future rug-pulls, and made Redict to serve this purpose. However, with the valkey project's success, and Redis's return to a copyleft license, Redict was not able to build a sustainable community.
>
>
>
>  We recommend that Redict users switch to valkey, which uses a permissive license but has better long-term prospects. We advise against switching back to Redis; though it is once again open source, and copyleft, it uses a contributor license agreement which will facilitate another rug-pull when Redis has a bad financial quarter.
>
>