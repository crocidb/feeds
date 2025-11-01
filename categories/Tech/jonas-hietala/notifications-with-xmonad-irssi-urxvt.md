---
title = "Notifications with xmonad/irssi/urxvt"
description = "So I’ve been idling on irc for years now and I’ve been using irssi for that, which works fine. I have not had notifications enabled, so I can see from the statusbar whenever someone messages me. As I’ve never been very active this has been fine, but now I"
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2014/07/03/notifications/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.640553590Z"
seen = true
---

So I’ve been idling on irc for years now and I’ve been using [irssi](http://www.irssi.org/) for that, which works fine. I have not had notifications enabled, so I can see from the statusbar whenever someone messages me. As I’ve never been very active this has been fine, but now I figured it’s time to fix that.

Fortunately it was very easy, there’s even a perfect match for my setup in the [xmonad documentation](http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Hooks-UrgencyHook.html)!

Here’s a summary:

Configure xmonad
==========

In `xmonad.hs`, highlight with existing dzen (my statusbar).

```
myDzenPP h = defaultPP { ... }
main = do
    bar <- spawnPipe "dzen2 ..."

    xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig {
        logHook = dynamicLogWithPP $ myDzenPP bar
        , ...
    }

```

Configure irssi
==========

I used [beepchan.pl](http://jerith.za.net/code/irssichanbeep.html) to only notify on selected channels.

```
settings = {
  "fe-common/core" = {
    bell_beeps = "yes";
    beep_msg_level = "MSGS NOTICES INVITES DCC DCCMSGS HILIGHT";
    beep_when_away = "no";
    beep_when_window_active = "no";
    ...
  };
  "perl/core/scripts" = {
    beep_channels = "#treecraft";
    ...
  };
};

```

Configure screen
==========

In `.screenrc`

`vbell off # or remove the existing 'vbell on' line`

Configure rxvt
==========

In `.Xdefaults`

`urxvt.urgentOnBell: true`