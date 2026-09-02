+++
title = "Rewrote my blog with Zine"
description = "15 years ago, on December 11th, 2010, at the bold age of 17, I wrote my first blog post on the wonders of the [Windows Phone 7](https://en.wikipedia.org/wiki/Win"
date = "2026-04-19T00:00:00Z"
url = "https://drewdevault.com/blog/Rewrite-with-zine/"
author = "Drew DeVault's blog"
text = ""
lastupdated = "2026-07-21T09:21:06.718347146Z"
seen = true
+++

15 years ago, on December 11th, 2010, at the bold age of 17, I wrote [my first blog post](https://web.archive.org/web/20120305160351/http://sircmpwn.blogspot.com/2010/12/everything-you-want-out-of-wp7.html) on the wonders of the [Windows Phone 7](https://en.wikipedia.org/wiki/Windows_Phone_7) on Blogspot. I started blogging as a kid at the behest of a family friend at Microsoft, who promised she’d make sure I would become the youngest [Microsoft MVP](https://en.wikipedia.org/wiki/Microsoft_Most_Valuable_Professional) if I started blogging. That never came to pass, though, because as I entered adulthood and started to grow independent of my Microsoft-friendly family I quickly began down the path to the free and open source software community.

Early blog posts covered intriguing topics such as complaining about my parent’s internet filter, a horrible hack to “replace” the battery of a dead gameboy game, announcing my friend’s Minecraft guild had a new website (in PHP), and so on. After Blogspot, I moved to [Jekyll](https://jekyllrb.com/) on GitHub pages, publishing [You don’t need jQuery](https://drewdevault.com/blog/You-dont-need-jQuery/) in 2013. For a long time this was the oldest post on the site.

I’m pretty proud of my writing skills and have a solid grasp on who I am today, but the further back you go the worse my writing, ideas, values, and politics all get. I was growing up in front of the world on this blog, you know? It’s pretty embarassing to keep all of this old stuff around. But, I decided a long time ago to keep all of it up, so that people can understand where I’ve come from, and that everyone has to start somewhere.<sup class="footnote-ref"><a href="#fn-1" id="fn-1-ref-1">1</a></sup>

At some point – I’m not sure when – I switched from Jekyll to [Hugo](https://gohugo.io/), and I’ve stuck with it since. But lately I’ve been frustrated with it. I’d like my blog engine to remain relatively stable and simple, but Hugo is quite complex and over the past few years I’ve been bitten by a number of annoying and backwards-incompatible changes. And, as part of my efforts to remove vibe-coded software from my stack, I was disappointed to learn that [Hugo is being vibe coded now](https://github.com/gohugoio/hugo/blob/842d8f105256c5656e7895ee61fa5b2dfe90a9e3/AGENTS.md), and so rewriting my blog went onto the todo list.

Choosing the right static site generator (SSG) was a bit of a frustrating process. Other leading candidates, like Pelican or Zola, are also built from slop now. But a few months ago I found [Zine](https://zine-ssg.io/), and after further study I found it to be a pretty promising approach. Over the past few days I have rewritten my templates and ported in nearly 400 (jeesh) blog posts from my archives.

There’s a lot to like about Zine. I’m pretty intrigued by SuperHTML as a templating engine design – the templates are all valid HTML5 and use an interesting approach to conditions, loops, and interpolation. SuperMD has some interesting ideas, but I’m less sold on it. The Scripty language used for interpolation and logic is a bit iffy in terms of design – feels half baked. And the designers had some fun ideas, like [devlogs](https://zine-ssg.io/log/), which I feel are kind of interesting but tend to have an outsized influence on the design, more polished where the polish might have been better spent elsewhere. The development web server tends to hang fairly often and I’ve gotten it to crash with esoteric error messages every now and then.

But what can I say, it’s alpha software – I hope it will improve, and I’m betting that it will by migrating my blog. There’s no official LLM policy ([yet](https://github.com/kristoff-it/zine/issues/200)) and I hope they will end up [migrating to Codeberg](https://github.com/kristoff-it/zine/issues/199), and using Discord for project communication is [not something I appreciate](https://drewdevault.com/blog/Dont-use-Discord-for-FOSS/), but maybe they’ll change their tune eventually.

In the meantime, I took the opportunity to clean up the code a bit. The canonical links have gone through several rounds of convention and backwards compatibility, and I have replaced them with a consistent theme and set up redirects. I probably broke everyone’s feed readers when rolling these changes out, and I apologise for that. I have gone through the backlog and updated a number of posts as best as I can to account for bitrot, but there are still a lot of broken videos and links when you get far enough back – hopefully I can restore some of that given enough time.

I’ve also gone ahead and imported the *really old* stuff from Blogspot. The whole lot is garbage, but if you’re curious to see where I started out, these old posts are more accessible now.