+++
title = "Self-Host Blog Images in Two Lines of Bash"
description = "My blog is a folder of markdown files.Everybody hates broken links, so here's how I download files to put in /dist:Download all images referenced by URL.wget $(grep -RIhEo 'https?://[^ )]+' . | grep -e png -e jpg -e jpeg)`Replace all markdown links with relative fil"
date = "2023-05-22T00:00:00Z"
url = "https://taylor.town/blog-download-images"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.791190219Z"
seen = true
+++

My blog is a folder of markdown files.

Everybody hates broken links, so here's how I download files to put in `/dist`:

```
# Download all images referenced by URL.
wget $(grep -RIhEo 'https?://[^ )]+' . | grep -e png -e jpg -e jpeg)
```

```
# Replace all markdown links with relative file names at root.
# e.g. [test](/123.png) <- [test](https://example.com/123.png)
sed -i '.bak' -E 's#\(https?:/.*/([^/]+\.(png|jpg|jpeg)).*\)#(/\1)#g' *.md
```