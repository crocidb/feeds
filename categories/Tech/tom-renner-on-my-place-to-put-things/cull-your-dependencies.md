---
title = "Cull your dependencies"
description = "Anyone writing code professionally in December 2021 will remember the “fun” of [the](https://www.abc.net.au/news/2021-12-15/log4j-cyber-security-flaw-which-has-online-exper"
date = "2022-06-09T00:00:00Z"
url = "https://tomrenner.com/posts/cull-your-dependencies/"
author = "Tom Renner on My place to put things"
text = ""
lastupdated = "2025-10-22T08:59:04.001919937Z"
seen = true
---

Anyone writing code professionally in December 2021 will remember the [“fun”](https://www.wired.com/story/log4j-flaw-hacking-internet/) [of](https://www.bbc.com/news/technology-59669297) [the](https://www.abc.net.au/news/2021-12-15/log4j-cyber-security-flaw-which-has-online-experts-worried/100703290) [Log4J](https://www.wsj.com/articles/hackers-exploit-log4j-flaw-at-belgian-defense-ministry-11640020439?mod=article_inline) [vulnerability](https://www.computerweekly.com/news/252510860/What-is-Log4Shell-and-why-are-we-panicking-about-it). For those that weren’t - this was a critical security error that allowed attackers to run any code they wanted on your servers. The root cause was a logging library, Log4J, that is used by most projects that are writting in Java.

It’s usually used to write code something like:

>
>
> `log.info("Process completed successfully");`
>
>

which will then appear in your logs, allowing you to track your application’s behaviour. Pretty innocuous stuff.