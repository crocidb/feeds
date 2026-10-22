+++
title = "How They Got Duo Support in NetNewsWire"
description = "From the NetNewsWire blog:The latest version of NetNewsWire for iOS supports iPhone Duo, which is very much a novel iPhone with toolbars running up the side and all kinds of behavior.How we did "
date = "2026-10-16T20:53:42Z"
url = "https://netnewswire.blog/2026/10/16/how-we-got-duo-support.html"
author = "John Gruber"
text = ""
lastupdated = "2026-10-21T11:46:08.155074068Z"
seen = false
+++

From the NetNewsWire blog:

>
>
> The [latest version](https://netnewswire.blog/2026/10/16/netnewswire-for-ios-unread-count.html) of NetNewsWire for iOS supports iPhone Duo, which is very much a novel iPhone with toolbars running up the side and all kinds of behavior.
>
>
>
> How we did it: we didn’t do any work at all. We built the app using Xcode 27.1 and the default iOS SDK that comes with it, and that’s it.
>
>
>
> Here’s the thing, though: we were already using standard controls — toolbars, navigation controllers, split views, etc. — and we were paying attention to size classes and such (as opposed to just looking at device type).
>
>

Develop your app the right way and, depending on the app, it might literally be no work at all to produce a great version for the Duo. Develop your app the wrong way and it might take months. NetNewsWire is one of my most-used apps. I keep it in my home screen dock, alongside Messages, Notes, and Safari. It would drive me nuts to use a Duo without a version of NetNewsWire that adapts to the Duo’s novel display sizes.

[ ★ ](https://daringfireball.net/linked/2026/10/16/how-they-got-duo-support-in-netnewswire)