+++
title = "disable-javascript.org"
description = "An initiative that informs users about some of the most severe issues affecting the JavaScript ecosystem, and explains how to disable JavaScript in various browsers and only enable it for trusted websites."
date = "2025-12-02T10:34:32Z"
url = "https://xn--gckvb8fzb.com/disable-javascript-org/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2025-12-10T15:23:56.755659386Z"
seen = true
+++

With several posts on this website attracting significant views in the last few months I had come across **plenty** of *feedback* on the [tab gimmick](/faq/#tab) [implemented last quarter](/updates-2025-q3/#site-updates). While the replies that I came across on platforms like the *Fediverse* and *Bluesky* were lighthearted and oftentimes with humor, the visitors coming from traditional link aggregators sadly weren’t as amused about it. Obviously a large majority of people disagreeing with the core message behind this *prank* appear to be web developers, who’s very existence quite literally depends on JavaScript, and who didn’t hold back to express their anger in the comment sections as well as through direct emails. Unfortunately, most commenters are missing the point.

[![This website when you send it to the background with JS enabled](/disable-javascript-org/images/tab_hu_e8d49deda13e22f2.webp)](/disable-javascript-org/images/tab.png)This website when you send it to the background with JS enabled

Missing the point
----------

This email exchange is just one example of feedback that completely misses the point:

>
>
> I just found it a bit hilarious that your site makes notes about ditching and disable Javascript, and yet Google explicitly requires it for the YouTube embeds.
>
>
>
> Feels weird.
>
>
>
> Regards.
>
>

The email contained the following attachment:

[![](/disable-javascript-org/images/image_hu_bd26847e0d67cbd.webp)](/disable-javascript-org/images/image.png)

Given the lack of context I assume that the author was referring to the YouTube embeds on this website (e.g. on the [keyboard](/keyboard/) page).

Here is my reply:

>
>
> Hey there,
>
>
>
> Simply click the link on the video box that says “Try watching this video on www.youtube.com” and you should be directed to YouTube (or a frontend of your choosing with LibRedirect [1]) where you can watch it.
>
>
>
> Sadly, I don’t have the influence to convince YouTube to make their video embeds working without JavaScript enabled. ;-) However, if more people would disable JavaScript by default, maybe there would be a higher incentive for server-side-rendering and video embeds would at the very least show a thumbnail of the video (which YouTube could easily do, from a technical point of view).
>
>
>
> Kind regards!
>
>
>
> [1]: [https://libredirect.github.io](https://libredirect.github.io)
>
>

Read before you write
----------

[It also appears](https://news.ycombinator.com/item?id=45668638) that many of the people disliking the *feature* didn’t care to **properly read** the highlighted part of the popover that says *“Turn JavaScript off, now, and only allow it on websites you trust!”*:

>
>
> Indeed - and the author goes on to show a screenshot of Google Trends which, I’m sure, won’t work without JavaScript turned on.
>
>

This comment perfectly encapsulates the flawed rhetoric. *Google Trends* (like *YouTube* in the previous example) is a website that is unlikely to exploit 0-days in your JavaScript engine, or at least that’s the general consensus.

However, when you clicked on [*a link that looks like someone typed it in by putting their head on the keyboard*](https://lemmy.ml/post/37915663/21801580), that led you to a website you obviously didn’t know beforehand, it’s a different story.

What I’m advocating for is to have **JavaScript disabled by default for everything unknown to you**, and **only enable it for websites that you know and trust**. Not only is this approach going to protect you from *jump-scares*, regardless whether that’s a changing tab title, a popup, or an actual exploit, but it will hopefully pivot the thinking of particularly web developers back from *“Let’s render the whole page using JavaScript and display nothing if it’s disabled”* towards *“Let’s make the page as functional as possible without the use of JavaScript and only sprinkle it on top as a way to make the experience **better** for anyone who choses to enable it”*.

It is mind boggling how this simple take is perceived as [*militant techno-minimalism*](https://news.ycombinator.com/item?id=45668105) and can provoke such *salty* feedback. I keep wondering whether these are the same people that consider `curl ... | sh` to be a generally *okay* way to install software …?

The hacker ethos
----------

[One of the many commenters](https://lobste.rs/s/iuvukw/word_on_omarchy#c_w1rvlc) that however did agree with the approach that I’m taking on this site had put it fairly nicely:

>
>
> About as annoying as your friend who bumped key’ed his way into your flat in 5 seconds waiting for you in the living room. Or the protest blocking the highway making you late for work.
>
>
>
> Many people don’t realize that JavaScript means running arbitrary untrusted code on your machine. […]
>
>
>
> Maybe the hacker ethos has changed, but I for one miss the days of small pranks and nudges to illustrate security flaws, instead of ransomware and exploits for cash. A gentle reminder that we can all do better, and the world isn’t always all that friendly.
>
>

As the author of this comment correctly hints, the *hacker* ethos has in fact changed. My guess is that only a tiny fraction of the people that are actively commenting on platforms like *Hacker News* or *Reddit* these days know about, let’s say, *cDc*’s *Back Orifice*, the *BOFH* stories, *bash.org*, and all the *kickme.to/\** links that would trigger a disconnect in *AOL*’s dialup desktop software. Hence, the understanding about how far *pranks* in the 90s and early 2000s really went simply isn’t there. And with most things these days required to be *politically correct*, having the tab change to what looks like a Google image search for *“sam bankman-fried nudes”* is therefor frowned upon by many, even when the reason behind it is to inform.

Frankly, it seems that conformism has eaten not only the internet, but to an extent the whole world, when an opinion that goes ever so slightly against the [status quo](https://www.enable-javascript.com) is labelled as some sort of *extreme view*. To feel even just a *“tiny bit violated by”* something as mundane as a changing text and icon in the browser’s tab bar seems absurd, especially when it is **you** that allowed my website to run arbitrary code on your computer!

Doubling down on it
----------

[![](/disable-javascript-org/images/disable-js_hu_fa7bd35e3084b382.webp)](/disable-javascript-org/images/disable-js.jpg)

Because I’m convinced [that](https://idlewords.com/talks/website_obesity.htm) [a](https://news.ycombinator.com/item?id=14050104) [principled](https://www.baldurbjarnason.com/2023/web-dev-untalented/) [stance](https://news.ycombinator.com/item?id=30083104) [against](https://unixdigest.com/articles/so-called-modern-web-developers-are-the-culprits.html) [the](https://josephg.com/blog/the-modern-web/) [insanity](https://www.quora.com/Why-are-many-modern-websites-so-slow-even-when-computers-and-internet-connections-improve-substantially) [that](https://www.jonoalderson.com/conjecture/javascript-broke-the-web-and-called-it-progress/) [is](https://forums.macrumors.com/threads/i-hate-the-modern-web.2378718/) [the](https://tech.yahoo.com/general/articles/modern-became-broken-220023969.html) [modern](https://news.ycombinator.com/item?id=21848468) [web](https://reddit.com/r/webdev/comments/1p908gw/why_is_the_web_essentially_shit_now/) is necessary, I am doubling down on this effort by making it an actual initiative:

[disable-javascript.org](https://disable-javascript.org)

*disable-javascript.org* is a website that informs the average user about some of the most severe issues affecting the JavaScript ecosystem and browsers/users all over the world, and explains in simple terms how to disable JavaScript in various browsers and only enable it for specific, trusted websites.

The site is linked on the JavaScript popover that appears on this website, so that visitors aren’t only *pranked* into hopefully disabling JavaScript, but can also easily find out how to do so. *disable-javascript.org* offers a JavaScript-snippet that is almost identical to the one in use by this website, in case you would like to participate in the cause. Of course, you can as well simply link to *disable-javascript.org* from anywhere on your website to show your support.

If you’d like to contribute to the initiative by extending the website with valuable info, you can do so through its [Git repository](https://codeberg.org/mrus/disable-javascript.org). Feel free to open pull-requests with the updates that you would like to see on *disable-javascript.org*. :-)