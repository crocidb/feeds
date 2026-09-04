---
title = "Fixing Problems"
description = "Today I have fixed two large annoyances I’ve had!I fixed the blue people on youtube bugI found a nice [thread](http://askubuntu.com/questions/117127/flash-video-appe"
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2013/01/13/fixing_problems/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.690101765Z"
seen = true
---

Today I have fixed two large annoyances I’ve had!

I fixed [the blue people on youtube](http://askubuntu.com/questions/117127/flash-video-appears-blue) bug
==========

![](http://i.stack.imgur.com/XvNff.png)

I found a nice [thread](http://askubuntu.com/questions/117127/flash-video-appears-blue) with a great answer. I solved it by forcefully patching `libflashplayer.so`

```
perl -pi.bak -e 's/libvdpau/lixvdpau/g' libflashplayer.so

```

Worked perfectly!

I fixed the minecraft stuck in pause bug
==========

This affects you if you’re using xmonad (or similar?) and java 1.7. The solution was simply to downgrade to java 1.6.

Another problem I’ve had earlier was that minecraft tries to full screen over both of my screens instead of just one. The solution is to add this to your `xmonad.hs`.

```

main = xmonad defaultConfig {
    ...
    , startupHook = setWMName "LG3D"
    ...
}

```

Fixed my Todo Lists
==========

Oh and I also added a lot of levels to my todo list, [as suggested by this post](http://www.aaronsw.com/weblog/productivity).

I have now the levels

* Programming
* Writing
* Reading
* Watching
* Verro
* Misc

All so I can always have something to do pending on my different energy levels etc.