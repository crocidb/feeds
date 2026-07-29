+++
title = "On AI"
description = "In 2019, I started watching Andreas Kling's programming videos, many of which were live-coding sessions writing his new operating system SerenityOS. He was always pretty fast at writing code, especially si"
date = "2026-07-23T05:00:00Z"
url = "https://jcs.org/2026/07/23/ai"
author = "joshua stein"
text = ""
lastupdated = "2026-07-28T12:43:13.620968009Z"
seen = false
+++

In 2019, I started watching [Andreas Kling's programming videos](https://www.youtube.com/@awesomekling/videos), many of which were live-coding sessions writing his new operating system [SerenityOS](https://serenityos.org/). He was always pretty fast at writing code, especially since his IDE, Qt Creator, had knowledge of all his C++ code and could [auto-complete](https://youtu.be/lz26q55Xt7E?t=301) classes, variable names, and function signatures. Back then it seemed like he had much of the code written in his head and was limited just by his typing speed.

Four years later, he switched to [CLion](https://www.jetbrains.com/clion/) which had early GitHub Copilot support for AI-assisted code completion. While [initially skeptical](https://www.youtube.com/watch?v=090Fgq4YMPU&t=1552s) of Copilot, he [experimented with it](https://www.youtube.com/watch?v=xZ0fXo4BL-w&t=3438s) and within months, [Copilot was writing code blocks](https://www.youtube.com/watch?v=mU353Vls2gM&t=1435s), ["reading [his] mind"](https://youtu.be/W4ku1Z8VyZk?t=1040), and [writing whole functions](https://youtu.be/huW7wUefAak?t=2191). His IDE's auto-completion through AI seemed like it had finally caught up with his brain and he could get ideas out into code faster.

---

While I found it fascinating watching Andreas speed up his development, none of it appealed to me for my work for years after. I didn't even use an IDE or an LSP in my editor. I was skeptical of AI and probably wrote it off too soon due to its [early failures](https://en.wikipedia.org/wiki/Will_Smith_Eating_Spaghetti_test).

I eventually tinkered with Claude in a web browser, asking it questions that I would have otherwise asked a search engine and been directed to a Stack Overflow answer. Once Claude Code came out, I was amazed at the power of giving it access to a directory of code on my laptop and letting it directly read and modify files. Its ability to completely (and quickly) reverse engineer a binary blob with zero context is still pretty awesome. Once local models got good and small enough, I started using Ollama on my [M4 Mac Mini](/2025/02/26/imacg4k) to do local offline work.

Like many things, it's possible to like and use a technology, language, or tool while rejecting all of the hype, fraud, and negative communities that build up around them (like Rails, or Rust). Of course, you can also choose not to like or use any of those things. You can prefer to use a hand saw instead of a circular saw, or to drive a manual transmission car instead of a self-driving EV. But I think at this point it's naive to think of all AI technology as useless or bad. The AI *industry* on the other hand…

---

In 2020, taking inspiration from Andreas, I started [recording my own videos](/system6c) programming on an 8 Mhz Macintosh 512Ke (later a Macintosh Plus) in the THINK C 5 IDE. I had never actually used a classic Macintosh before and I wanted to learn what it was like to program for them as one would have 40 years ago. I made a rule for myself that I would only write code on the Macintosh itself, typing everything on its [Apple M0110 keyboard](/images/system6c-banner-1500x596.jpg). No modern computers would be involved in writing, editing, or compiling any of the code for my projects.

Since starting that series, I've written (most of) an IMAP e-mail client, a [revision control system](/amend), a [Wikipedia reader](/wikipedia), an [IRC client](/wallops), then a multi-user, multi-threaded [BBS server](/subtext). It all taught me a lot about the Macintosh and about C, and ignited my vintage computing hobby which has introduced me to many new friends.

One thing about writing my e-mail client that bugged me was that it required a [proxy server](https://github.com/jcs/sockhole) on a modern server to strip TLS and present plaintext to the poky Macintosh. So after [adding Wi-Fi functionality](/2023/08/23/scsiwifi) to my Mac Plus, I added a [TLS offloading device](https://github.com/jcs/BlueSCSI-v2/commit/fecdc50496e7529178610fde23339ad01d413410) so my Mac could do [TLS decryption](https://amendhub.com/jcs/detritus/files/request.c#L765) independently.

That provided the final giant piece of the puzzle needed to write a "modern" web browser (at least something newer than [MacWeb](https://en.wikipedia.org/wiki/MacWeb) that could parse HTML 5) for classic Mac OS, since [everything is encrypted](/2021/01/06/plaintext) these days. I started [working on that browser](https://amendhub.com/jcs/detritus) in 2024, adding other protocols such as Gopher (and begrudgingly, [Gemini](/2021/01/06/plaintext#a-rant-about-gemini)).

---

A couple months ago, I was feeling particularly salty about computers and posted [these](/notes/2026/05/27/1003448877519323137) [notes](/notes/2026/05/27/1003448877519323242):

>
>
> I have lost all enthusiasm for reading about new software projects, especially dealing with vintage computing. What would have sounded amazing a year or two ago and made me want to engage with the author, I now just assume was something AI spit out and feels hollow and boring so I skim past it.
>
>

>
>
> And writing software feels like being [Marge in that go-kart race](https://www.youtube.com/watch?v=CG0WSQz2f84). Work slow and steady for a year writing something neat that had never been brought to a platform before, but someone can hear about it and use Claude to whiz by you in a week and make something with 10 times the functionality.
>
>

>
>
> Case in point, I saw these today:
>
>
>
> A [modern web browser](https://github.com/mplsllc/macsurf) for Mac OS 9 with CSS, ES5 JavaScript, and TLS
>
>
>
> [A 3D printer monitoring app for System 7 with video](https://www.reddit.com/r/prusa3d/comments/1tph8w3/buddycam_looks_great_in_1bit_peak_prusa_monitoring/)
>
>
>
> A year ago either would have sounded awesome but now I scroll past because I assume AI wrote it all
>
>

Today someone posted [this](https://ecliptik.github.io/geomys/), a completely [vibe-coded](https://github.com/ecliptik/geomys/graphs/contributors) Gopher client for classic Mac OS. Claude even made a fancy website for it. And wouldn't you know it, but [some](https://github.com/ecliptik/geomys/blob/99fb147e1dda39704759f06faa13508d63886670/src/tcp.c#L2) of the [code](https://github.com/ecliptik/geomys/blob/99fb147e1dda39704759f06faa13508d63886670/src/sysutil.c#L4) for it even comes from my own projects.

---

The other week, Andreas [tweeted this](https://x.com/awesomekling/status/2076744024606511393):

>
>
> *Feels like “I actually enjoy writing code by hand” is about to become the big 2026 virtue signal for programmers.*
>
>

While I don't totally agree, it did cause me to question why I bother writing software for 40-year-old computers that only gets used by a handful of people and why I'm bothered by vibecoded software in this context.

I write a lot of my software because I want it, but I'm also happy to make it for others in the community to use. Maybe I'm just being vain though, because I want my labor-of-love to be appreciated by people in the community I'm a part of and if a vibecoded version enters the chat with a ton of features and a slick interface, I'm afraid my work will get drowned out and it'll feel like a lot of wasted effort. My Comet will get Yahoo'd.

So if a vibecoded tool is genuinely useful and available now while mine's been in development for years, maybe I should just be happy that other people in the community have something new to use. I can continue working on my version for myself and release it when it's ready. After all, Claude has to take that code from somewhere.