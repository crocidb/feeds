+++
title = "Meta: Update should fix RSS feeds"
description = "I recently made an update to how I build my blog. I like writing my posts with Org-mode because it provides a richer markup language than Markdown. Plus, more Emacs = more good. Hugo has support for Org files, but there was a problem with the RSS feed genera"
date = "2023-05-13T00:00:00Z"
url = "https://lambdaland.org/posts/2023-05-13_rss_fixup/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.253402318Z"
seen = false
+++

I recently made an update to how I build my blog. I like writing my posts with Org-mode because it provides a richer markup language than Markdown. Plus, more Emacs = more good. [Hugo](https://gohugo.io/) has support for Org files, but there was a problem with the RSS feed generation: all of my posts written in Org got truncated at some point. I don’t know if the fault lies with Hugo itself or with some problem in the theme I use—whatever it was, I don’t have the time right now to debug that and submit a good bug report or a fix. Instead, I’m using the [ox-hugo](https://ox-hugo.scripter.co/) org-mode exporter, so I still can write my posts with Org, but then let Emacs export them to Markdown for Hugo to process.

Yes, it’s a Rube Goldberg machine. But what would a programmer’s blog be if the build wasn’t convoluted like this? Anyway, RSS feeds are fixed now—I checked. If you happened to read anything only via RSS, and found the content cut off at a strange point, this might have fixed it for some posts. Let me know if you run into any other strange issues.

Cheers!