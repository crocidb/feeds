+++
title = "I hereby pardon all junior engineers"
description = "Shortsighted engineering practices have eroded public trust in technology. We can reclaim that trust by building better things together."
date = "2023-11-22T00:00:00Z"
url = "https://taylor.town/pardon-2023"
author = "Taylor Troesh"
text = ""
lastupdated = "2026-04-20T13:20:40.462055429Z"
seen = true
+++

I maintain a tradition of [pardoning](https://en.wikipedia.org/wiki/National_Thanksgiving_Turkey_Presentation) something each Thanksgiving.

This year, I pardon all junior engineers.

Sorry little ones, our systems have failed you.

* [Techno-Pessimism](#pess)
* [The Gators in Our Waterparks](#gators)
* [Battleships vs. Wigwams](#wigwams)
* [Building Better Maps](#maps)
* [On On-Ramps](#onramps)
* [Elbows on the ;DROP TABLES](#elbows)
* [Finishing Projects Together](#together)

**tl;dr:** Shortsighted engineering practices have eroded public trust in technology. We can reclaim that trust by building better things together. To build better things, engineers need to (1) [improve project discoverability](https://wigwam.directory), (2) stay focused, (3) become better teachers, (4) learn better manners, and (5) ship finished products.

**preface:** Toxicity is unsustainable. Cynicism is lazy. Yet I'm still scared and frustrated and human. In this essay, I try to suggest solutions to my fears, but there are no silver bullets in my magazine. Help me figure stuff out. Let's build a better future together.

Techno-Pessimism
----------

We trusted [a 70lb ardinuo](https://en.wikipedia.org/wiki/Apollo_Guidance_Computer) to get us to the moon and back.

That hope is fossilized in [classic sci-fi](https://www.reddit.com/r/RetroFuturism/top/): explore space, build utopia, maintain peace, etc.

We once sought Star Trek. Now we orbit the Black Mirror.

Our televisions watch us. Our speakers listen to us. [Even the damn toasters surf the web.](https://techcrunch.com/2022/08/17/tineco-toasty-one/)

In our collective unconscious, hackers went from [heroes](https://www.youtube.com/watch?v=IESEcsjDcmM) to [curiosities](https://www.youtube.com/watch?v=msX4oAXpvUE) to [punchlines](https://www.youtube.com/watch?v=x6eE-Zk3nVQ) to [villians](https://www.youtube.com/watch?v=xvwoariHaf4).

[Deep Blue](https://en.wikipedia.org/wiki/Deep_Blue_(chess_computer)) was victory. ChatGPT reeks of existential risk.

They gave us a universal currency; we turned it into a casino.

They gave us a town square; we turned it into a fight club.

They gave us a universal oracle; we turned it into a billboard.

Money defeated magic.

The Gators in Our Waterparks
----------

But all that cash yields no quality.

Even Apple and Microsoft [can't banish the gators](https://www.google.com/search?q=apple+zero+day) from their waterparks.

California [is spectacularly behind schedule and overbudget](https://www.youtube.com/watch?v=FgHSYHXFfwg) on its quest to build the world's slowest high-speed rail.

It seems like nobody knows how to build things anymore.

The hardware gods gave us flops and flops and flops. The software grew gluttonous and bloated. Moore's law didn't make computers 2x *more delightful* every 18 months.

Languages and frameworks and materials compete for engineers' attention, yet the fundamental problems remain.

How fast *should* programs boot? How long *should* it take to make bug-free software? How long *should* a smartphone stay relevant? How much mining *should* it take to live? How many steps *should* it take to get to my local grocery store?

It's beyond the scope of this essay, but I ocassionally see incredible projects and re-realize that we're participating in unfathomable waste:

* [Alan Kay's metaverse in a 15MB operating system](https://youtu.be/uQTeWJNkylI?si=1vzMSdsLZ9K5oNXz&t=2479)
* [Casey Muratori's simple terminal that exceeds Microsoft's best](https://www.youtube.com/watch?v=hxM8QmyZXtg)
* [100 Rabbits' permacomputing VM](https://100r.co/site/uxn.html)
* [this computer from 1968](https://www.youtube.com/watch?v=yJDv-zdhzMY&pp=ygUTbW90aGVyIG9mIGFsbCBkZW1vcw==)
* [Chuck Moore's 144-computer FORTH chip](https://www.youtube.com/watch?v=0PclgBd6_Zs)
* [DOOM running on a pregnancy test](https://www.popularmechanics.com/science/a33957256/this-programmer-figured-out-how-to-play-doom-on-a-pregnancy-test/)

I don't know where the waste originates. Sometimes software bloat smells like [economics problems](https://www.youtube.com/watch?v=XZ3w_jec1v8). Sometimes it feels like [retrograde amnesia](https://www.youtube.com/watch?v=8pTEmbeENF4). Sometimes it feels like [a collapse of civilation](https://www.youtube.com/watch?v=pW-SOdj4Kkk).

We must change before [cruft](https://en.wikipedia.org/wiki/Cruft) and [learned helplessness](https://en.wikipedia.org/wiki/Learned_helplessness) accrete beyond repair. Elegance evades us because we've convinced ourselves that the only alternative to a battleship is a wigwam.

Battleships vs. Wigwams
----------

The world's population stows in the bellies of three battleships: UOSS Apple, UOSS Microsoft, UOSS Linux. After decades under deck, we forgot that there's still a sea to explore.

The battleships are not just operating systems. They're also browsers and protocols and languages and printables and fabric patterns. Consider how [SQL grows in complexity](https://en.wikipedia.org/wiki/SQL:2023) with no viable viable alternatives.

"If you don't like the existing battleships why don't you build your own?"

Battleships can't be berthed in backyards, but people build wonderful wigwams:

* [Precious Plastic](https://www.preciousplastic.com)
* [DynamicLand](https://dynamicland.org)
* [Uxn](https://100r.co/site/uxn.html)
* [play.date](https://play.date)
* [TodePond](https://github.com/TodePond)
* [Roc](https://www.roc-lang.org)
* [val.town](https://www.val.town)
* [Urbit](https://urbit.org)
* [Flipper Zero](https://flipperzero.one)
* [Zig](https://ziglang.org)

Wigwams rarely become battleships. Battleships need time and money and labor. Bloated software demands lots of hands, and lots of hands produce bloated software. And so the bloated software eats up all the time and capital and labor.

Wigwams were once worthwhile and lucrative endeavors. Corporations and academics cooperated to make wonderful things. But now the corporations coast on their respective battleships while hobbyists and academics build wigwams.

When fewer than 5,000 programmers existed, they built [Lisp](https://en.wikipedia.org/wiki/Lisp_(programming_language)) (1960) and [APL](https://en.wikipedia.org/wiki/APL_(programming_language)) (1966) and [sketchpad](https://en.wikipedia.org/wiki/Sketchpad) (1963). With over 5 million programmers today, the best we can do is Rust and React.

Don't get me wrong -- it is easier to make wigwams than ever before. But unfocused collective efforts produce rube-goldberg communes and [abandonware](https://en.wikipedia.org/wiki/Abandonware) ghost-towns. Wigwams will continue to rise and fall in the shadow of battleships until engineers recommit to quality craftsmanship and intentional tinkering. We must organize sustainable communities around stable design. We must make better maps and learn better manners.

Building Better Maps
----------

The [curse of lisp](http://www.winestockwebdesign.com/Essays/Lisp_Curse.html) escaped from its pen of parens and now plagues every engineering discipline. It is easier to build a crappy project from-scratch than to contribute to a semi-mature project. We need to make finding and funding and contributing to projects effortless. We need better maps.

 Note that I am terribly guilty of building new wigwams instead of aiding existing ones. [Scrapscript](https://scrapscript.org) is scarcely even a wigwam at this point, but I have too much ego to abandon my wigwam and help others build sandcastles at their camps. I am convinced that scrapscript has enough unique design goals to be worthwhile, but doesn't every maker feel the same about their darlings?

Makers feel the futility of shouting at IndieHackers, GitHub, HackerNews, Instructables, etc. [Democratic](https://en.wikipedia.org/wiki/Like_button) news feeds gorge your attention on shiny new things instead of focusing your efforts onto crusty old things.

Our ad-hoc hype machines are failing us, but talk is cheap. I created [wigwam.directory](https://wigwam.directory) with the following goals in mind:

* promote "slow tech" over hype
* organize project landscape by goals
* match talent quickly and effectively
* sustainably fund unsexy infrastructure
* keep projects on-schedule and within budget
* maintain list of "open problems" in need of new wigwams

But [wigwam.directory](https://wigwam.directory) is no panacea. A repo to organize repos is classic engineering hubris. Programmers (including myself) make futile efforts to solve complex social problems with simple software. We assume that only those bestowed with holy git clients can contribute to OSS. But there's a whole world of talented artists and marketers and accountants eager to help us build the future. Right now, the only way to force engineers to play nicely with other folks is to create an entity called a "startup".

Non-engineers should see our wigwams from afar and beg to build with us. Instead, we defecate on their sandcastles and tell them to become better engineers.

On On-Ramps
----------

Looking back, I taught myself about computers because I wanted to make stop-motion videos and record soulless rock music with my childhood friend. I learned to write so that I could make people cry/laugh like David Foster Wallace. My best friend learned to code to make custom levels for [Trespasser](https://en.wikipedia.org/wiki/Trespasser_(video_game)). And so on.

Countless web-designers started with Myspace CSS. Countless game-devs started with Flash. The next generation of engineers are discovering Roblox, Kerbal Space Program, LEGO, etc.

There's no better feeling than seeing a feat of engineering and shouting at yourself, "I want to build things like this!"

[TodePond](https://www.youtube.com/watch?v=taNguu5T22g&list=ULcxqQ59vzyTk&index=1) is my favorite case-study in good on-ramp design. It's novel, visually appealing, sincere, invites experimentation, and all wrapped in superb storytelling.

But I'm worried we've lost too many of our "I can do this!" funnels. People don't look at tables and toys and websites anymore and think, "I could make that if I really tried!" Economies-of-scale drown us in injection-molded plastic and AAA games and Marvel films and warranty-breaking seals. These behemoths rarely inspire tinkering, but the internet has stepped in to infect people with the engineering itch.

To avoid decades of college debt, many become Internet™ autodidacts, then build a portfolio. Take a course on YouTube, sign up on Coursera, etc. It's easier to learn than ever before, but these platforms want to steal your eyeballs. The algorithms lure you with recommended videos. Creators are incentivized to create padded edutainment to feed the advertising machine. They skip useful lessons because learning is difficult and boring.

Battleships like Unity and React are perfect fodder for edutainment machines. Bloated systems with infinite knobs can churn out decades of empty tutorials. Personally, it's a bit harder to mistake entertainment for learning when I'm holding a chisel instead of a screen. Each of my shoddy woodcarvings reminds me that I don't actually know what I'm doing yet.

Some disciplines have irreducibly steep on-ramps. No portfolio will help you land an aerospace engineering job. Apprenticeships once filled this niche, but were abandoned in favor of scalable/standardized schooling. Many discover that "real learning" doesn't start until their first job, yet we demand 4-year degrees for even the damn internships nowadays. In the continued pursuit of profits and rankings and exclusivity, much of academia has atrophied. Colleges are incentivized to provide *the feeling of* learning rather than actual learning. Bootcamps try to pick up the slack, but there's only so much you can do in accelerated courses. Educators pour their hearts into curricula, but most aren't given ample time or resources to do quality work.

Riff-Oriented Learning
----------

Seriously, try to teach somebody modern software development. It's a nightmare. I have personally resorted to teaching my one-weekend CS101 course on pen-and-paper because modern environments are broken and/or distracting. The best teaching environments combine experimentation, sharing, and tight feedback loops. LEGO Mindstorms and [Elm](https://elm-lang.org) are fantastic resources for beginners, but I'm frankly astounded there aren't more beginner-friendly ecosystems out there.

People learn exceptionally well via [riffing](https://www.thefreedictionary.com/riffing). [Elm's examples](https://elm-lang.org/examples) are brilliant, but I'm looking for [tweetable programs](https://twitter.com/wolframtap). We could [normalise sharing scrappy fiddles](https://arroost.com). We could build smaller things in public on [leanpub](https://leanpub.com) and [itch.io](https://itch.io). We could have fun together.

It's how "building things" becomes "building things *together*". It's what pushes people from "I want to make things like this!" to "These are my people!" But only if the people have good manners.

Elbows on the ;DROP TABLES
----------

In the floppy days, the maps to the engineering camps were bad and the manners somehow worse.

But we are slowly improving. My daughter is nearly 2 years old, and I suspect that in two short decades, she'll feel welcome in any engineering discipline she chooses (*if* she chooses so). By that time, I hope it won't be so remarkable to work with women on software projects.

But I'm uncertain about our ability to maintain basic decency. Today's engineers are pretty homogenous, yet fervor infects so many HN threads, GitHub PRs, etc. On average, it seems like \~3 comments deep before passive aggression proliferates. [Y'all'n't](https://taylor.town/yallnt) so friendly sometimes.

Learn some manners, folks. Read [HTWFAIP](https://bookshop.org/p/books/how-to-win-friends-and-influence-people-dale-carnegie/7496534?ean=9780671027032). Take vacations. [Talk to a professional](https://www.betterhelp.com). Volunteer for your community. Take responsibility for yourself.

Imagine all the wonderful things we could create together with more people and smoother communications!

Finishing Projects Together
----------

Mario Kart 64 was released in 1996. Since then, my cartridge hasn't received any patches/updates/DLC. It continues to make me smile.

I miss shipping finished products. Feature development is sisyphean. I want to [escape the agile treadmill](https://www.youtube.com/watch?v=BnyNM8kVH-4). I envy "real" engineers who work on physical objects -- modern software devs aren't really allowed to complete anything. The norm is to battle [software rot](https://en.wikipedia.org/wiki/Software_rot) and add features ad infinitum. Endless work is unsustainable.

My dream is to work on ambitious projects with 2-20 core contributors over 1-100 months per project. When the project is complete and stable and beautiful, all of us stop working on it and move onto different projects. If built on a small/stable/well-defined platform/VM, it should work indefinitely (like Mario Kart 64).

And then we celebrate our launch together and say goodbye or maybe do another project together and adopt some starry-eyed junior engineers and we all learn together and life is good.

Finishing cool projects together -- wouldn't that be fun?