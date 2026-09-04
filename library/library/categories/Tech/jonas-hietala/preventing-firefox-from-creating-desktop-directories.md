---
title = "Preventing Firefox from creating Desktop directories"
description = 'With a fresh firefox installation I found that it kept creating a ~/Desktop directory. But I found how to turn it off.Edit ~/.config/user-dirs.dirs to`XDG_DESKTOP_DIR="$HOME/"XDG_DOCUMENTS_DIR="$HOME/"XDG_DOWNLOAD_DIR="$HOME/"'
date = "2024-07-17T19:35:07Z"
url = "http://jonashietala.se/blog/2015/08/02/preventing_firefox_from_creating_desktop_directories/index.html"
author = "Jonas Hietala"
text = ""
lastupdated = "2025-10-22T08:58:11.569728603Z"
seen = true
---

With a fresh firefox installation I found that it kept creating a `~/Desktop` directory. But [I found how to turn it off](http://www.kariliq.nl/misc/firefox-dirs.html).

Edit `~/.config/user-dirs.dirs` to

```
XDG_DESKTOP_DIR="$HOME/"
XDG_DOCUMENTS_DIR="$HOME/"
XDG_DOWNLOAD_DIR="$HOME/"
XDG_MUSIC_DIR="$HOME/"
XDG_PICTURES_DIR="$HOME/"
XDG_PUBLICSHARE_DIR="$HOME/"
XDG_TEMPLATES_DIR="$HOME/"
XDG_VIDEOS_DIR="$HOME/"

```

I had `XDG_DESKTOP_DIR="$HOME/Desktop"` which made a Desktop folder all the time.