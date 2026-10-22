+++
title = "NixOS Is Making Me Less Afraid"
description = " Something funny happened a little while ago: I read about FreshRSS, and it sounded nice, so I installed it on a server and started using it. That would not have happened a year ago, but then again, a year ago I didn’t have any NixOS servers. For the past few years, my RSS feed"
date = "2026-10-19T22:00:00Z"
url = "https://entropicthoughts.com/nixos-is-making-me-less-afraid"
author = "a@xkqr.org (kqr)"
text = ""
lastupdated = "2026-10-21T11:46:08.084222088Z"
seen = false
+++

 Something funny happened a little while ago: I read about FreshRSS, and it sounded nice, so I *installed it on a server and started using it*. That would not have happened a year ago, but then again, a year ago I didn’t have any NixOS servers.

 For the past few years, my RSS feeds have lived locally on my phone only. There was a good idea behind that, but it never quite worked in practice. For one, many things are easier to read on a larger screen. But it was also brittle to trust a phone app to manage the read/unread status of thousands of articles across a hundred feeds. What I really wanted was a server-side feed aggregator. This is software that runs on a server, manages RSS feeds, and then I can read the RSS feeds either through a web interface, or through client applications. I’ve wanted that for a while, but I’ve never taken the step, because it would be yet another side project to maintain the deployment of.

 But now, with some NixOS experience, adding a working FreshRSS configuration (including backups) took 9 lines of Nix code. That installation has just hands-off worked for the past few months. If or when that server breaks, I can spin up a new one running the exact same configuration, probably in something like 15 minutes. When we can do something like that, there is literally no reason to not just try the new software.

 Contrast this against how FreshRSS is installed outside of NixOS. Then we’d

[(Continue reading the full article on the web.)](https://entropicthoughts.com/nixos-is-making-me-less-afraid)