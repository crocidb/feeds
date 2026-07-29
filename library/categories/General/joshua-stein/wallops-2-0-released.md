+++
title = "Wallops 2.0 Released"
description = "Another large update to my Wallops IRC client is available:* wallops-2.0.sit (StuffIt 3 archive, includes source code and THINK C 5 project file)     SHA256: 532f6c72eadbb9e7ce74dded1bfcd71369a61d818f7c77160bb8a66d6f1ccf9c    SHA1: `c375a"
date = "2024-09-12T05:00:00Z"
url = "https://jcs.org/2024/09/12/wallops2"
author = "joshua stein"
text = ""
lastupdated = "2026-07-28T12:43:13.651678917Z"
seen = false
+++

Another large update to my [Wallops IRC client](/wallops) is available:

* [wallops-2.0.sit](/wallops/wallops-2.0.sit) (StuffIt 3 archive, includes source code and THINK C 5 project file)  
   SHA256: `532f6c72eadbb9e7ce74dded1bfcd71369a61d818f7c77160bb8a66d6f1ccf9c`  
  SHA1: `c375a24e00900378e84745c1e11d3d6976ef749c`

This release features an overhaul of the interface bringing tabs allowing multiple channels and private message queries, including a number of other new features and bugfixes:

* Support window resizing, using an initial window size based on the screen size
* Connect-time settings (server, nick, password, etc.) are now saved to a preferences file in the System folder, rather than as resources on the binary itself; this prevents accidental sharing of saved passwords and avoids having to re-enter settings every time the software is updated
* Add per-user queries which simplify private messaging back and forth with a single user; can be opened with `/query <user>` or by double-clicking a user in a channel nick list
* Much improved tab and window redrawing
* Optimize nick list sorting and building, especially on large channels; on a large channel with 750 users, this operation went from 62 seconds to 33 on a Mac Plus
* Only auto-scroll a message buffer to new messages when not scrolled to the bottom, making it easier to read old messages on busy channels
* Implement support for many more server numerics and commands
* Implement additional commands like `/clear`, `/op`, `/umode`, and `/disconnect` (the full list is in the [`README`](https://amendhub.com/jcs/wallops/files/README))
* Add global menu options to suppress channel "junk" such as joins, quits/parts, and nick changes
* Make Desk Accessories work from the Apple Menu
* Do case-insensitive matching of slash commands
* Add a setting to suppress MOTD printing which can speed up connections on slower machines, since MOTDs can be very long on some servers
* Add a custom about dialog