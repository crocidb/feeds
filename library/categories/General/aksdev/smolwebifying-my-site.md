+++
title = "Smolwebifying my site"
description = "I found this thing called smolweb and it spoke to me.Like yeah, websites are quite heavy these days. Older hardware (from like 2010s) has really difficult time loading it, and the big chunks of Javascript do not help either.And not to forget web "
date = "2026-04-26T18:07:00Z"
url = "https://akselmo.dev/posts/smolwebifying-my-site/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:56.966959293Z"
seen = true
+++

I found this thing called [smolweb](https://smolweb.org/index.html) and it spoke to me.

Like yeah, websites are quite heavy these days. Older hardware (from like 2010s) has really difficult time loading it, and the big chunks of Javascript do not help either.

And not to forget web browsers such as [Netsurf](https://www.netsurf-browser.org/) that do not have the resources to recreate the whole HTML/CSS/JS standard.

So, as you can see, this site is now much more plain and simple. Very easy to scroll from top to bottom and read the stuff. I think I will have to modify some of the paddings/margins around some elements, but other than that, I'm quite happy with it. I may also need to rework some colors. I tried to follow closely my [Revontuli](https://codeberg.org/akselmo/Revontuli) colorscheme.

Smolweb.org has a cool little validator that gives me valid score, and my CSS grade is C-. I will have to see if I can make that grade bit better, at least B. :) I also ran my site through the W3C [HTML](https://validator.w3.org/) and [CSS](https://jigsaw.w3.org/css-validator/) validators, like back in the olden days! And they told me my site is valid. :D

I spent quite a long time on this and I'm clearly not a designer. Probably \~12h total. I managed to remove at least \~1000 lines of extra stuff, which is awesome. One big thing I did was starting to use SCSS with Zola, so it compiles the CSS instead of relying on CSS variables. This makes the site work even on browsers that do not support CSS variables!

Let me know what you think of the look! And I'm curious what scores others get from the smolweb validator!

[](https://brid.gy/publish/mastodon)