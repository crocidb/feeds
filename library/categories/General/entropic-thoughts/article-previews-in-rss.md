+++
title = "Article previews in RSS"
description = " Since about three years past time immemorial, the RSS feed for this site has been very anaemic. It had article titles and dates, and that was it. Many readers have requested that I include the full article in the feed, or at least a preview, but I’ve always put it off because it"
date = "2026-05-06T22:00:00Z"
url = "https://entropicthoughts.com/article-previews-in-rss"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-05-08T13:34:19.152453569Z"
seen = false
+++

 Since about three years past time immemorial, the RSS feed for this site has been very anaemic. It had article titles and dates, and that was it. Many readers have requested that I include the full article in the feed, or at least a preview, but I’ve always put it off because it has sounded difficult to accomplish technically.

 The way the RSS feed for this site is generated is in two steps:

1. First a little loop in Emacs Lisp runs through the first few items of a sorted and filtered list of files belonging to this project. This loop constructs an org-element syntax tree for the RSS feed, and renders it out to a temporary file as an Org mode file.
2. Then the regular Org exporting framework takes over and exports that file as an RSS file using the ox-rss backend.

 (Continue reading the full article on the web.)