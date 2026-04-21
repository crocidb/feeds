+++
title = "HNTV: play hn yt links locally"
description = "Play videos recently submitted to HN via the commandline."
date = "2023-11-27T00:00:00Z"
url = "https://taylor.town/hntv"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.454663332Z"
seen = true
+++

```
curl -s 'https://news.ycombinator.com/from?site=youtube.com' \
| egrep -o 'https?://www.youtube.com[^"]+' \
| mpv --playlist=- \
  --speed=1.5 \
  --ytdl-format='bestvideo[height<=?720]+bestaudio/best'
```

 This script (1) fetches recent YouTube submissions from [HackerNews](https://news.ycombinator.com), (2) extracts youtube links from the page, and (3) plays them sequentially at 720p (1.5x).

 Remember to upvote [intellectually stimulating](https://news.ycombinator.com/newsguidelines.html) links on HN, write constructive comments, and support worthwhile creators via Patreon/merch/etc.