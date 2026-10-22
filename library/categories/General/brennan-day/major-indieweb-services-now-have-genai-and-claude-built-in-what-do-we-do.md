+++
title = "Major IndieWeb Services Now Have genAI and Claude Built-in. What Do We Do?"
description = "The IndieWeb's pro-human, anti-genAI consensus has met its own infrastructure: Aaron Parecki, co-founder and the movement's 'single point of Aaron,' now commits with Claude Code to webmention.io, indielogin.com, Meetable, IndieNews, and micropub.rocks. On the fragility of relying"
date = "2026-10-18T02:00:00Z"
url = "https://brennan.day/the-indieweb-now-has-genai-and-claude-built-in-what-do-we-do/"
author = "mail@brennanbrown.ca (Brennan Kenneth Brown)"
text = ""
lastupdated = "2026-10-21T11:46:09.803626422Z"
seen = false
+++

UPDATE: Aaron has responded with [his own post](https://aaronparecki.com/2026/10/17/5/rebuilding-my-indieweb-projects) titled "Why I'm rebuilding my IndieWeb projects with Claude" which is worth reading, and which rightly picks a nit with my original title (now changed). I also want to be absolutely clear: I do *not* want anybody to go after Parecki, or anybody else that uses genAI. I wrote this solely to inform people and make them aware of what's going on. I'm still totally aimless about the next steps, myself.

---

I've always had an understanding that the independent web was designed by humans and for humans. There were times that my inbox or forums I visit were solicited by people (and maybe occasionally agents) who vibecoded a project and were proudly sharing it as part of the resistance against the corporate web. That always felt totally antithetical to what is trying to be accomplished and achieved with regards to the IndieWeb.

Take for instance this website proclaiming that [the IndieWeb is punk](https://indiewebispunk.net/). While I appreciate the intent of the message, it felt totally counteracted by the fact that the website was created [with the help of Claude Code](https://github.com/jimmitchell/indiewebispunk.net/issues/1#issuecomment-5610535587), and how the language on the website itself reads like what an LLM would output. How can you advocate that people should hand-make their Internet pages when yours itself is not?

Now, I've only been an active participant on the IndieWeb for around a year, and I will stress that it is an incredibly loosely-defined movement and umbrella term. But the view and understanding of the subculture being pro-human and anti-genAI, just as it is anti-corporation, seemed coherent and widely agreed upon. If you read the [AI policy](https://indieweb.org/AI_policy) article on the wiki, there seems to be a broad overall consensus.

So, what do we do when the founding technical member of the IndieWeb has decided to use [Claude Code in some of](https://github.com/aaronpk/webmention.io) [the most important IndieWeb projects](https://github.com/aaronpk/indielogin.com)?

I briefly gestured towards this in [an earlier post](https://brennan.day/i-love-sharing-cool-stuff-made-by-people/#other-cool-things), but I haven't really reckoned with what it means until now.

But I'm getting ahead of myself.

Aaronpk? [](#aaronpk)
----------

Let's start at the beginning. [Aaron Parecki](https://aaronparecki.com) (known online as aaronpk) is one of the co-founders and the lead technical architect of the IndieWeb movement. Alongside [Tantek Çelik](https://tantek.com), he co-founded the movement in 2010, with the main idea being to empower individuals to own their own identity, data, and web presence rather than relying on centralized social media silos.

Parecki’s contributions to the IndieWeb as-we-know-it are incredibly foundational. He co-founded and helped organize the very first [IndieWebCamp](https://indieweb.org/IndieWebCamps) in Portland, Oregon in [June 2011](https://indieweb.org/2011). He built and maintains [Meetable](https://meetable.org), an open-source event-listing platform that powers [events.indieweb.org](https://events.indieweb.org) and facilitates community gatherings.

Parecki bridged the gap between IndieWeb concepts and technical web specifications. He's served as the editor/co-editor for critical W3C protocols:

* [Webmention](https://www.w3.org/TR/webmention/): A protocol enabling websites to automatically notify each other when they link to one another, allowing cross-site commenting and conversations.
* [Micropub](https://www.w3.org/TR/micropub/): An API standard for independent clients and posting apps to securely create, update, or delete posts on a user's own domain.
* [WebSub](https://www.w3.org/TR/websub/): A protocol for real-time pub/sub notifications, allowing for instantaneous decentralized feeds.

Parecki also created much of the essential backend plumbing used by the community under his personal p3k project umbrella:

* [webmention.io](https://webmention.io): A widely adopted, free service that receives and aggregates Webmentions on behalf of independent websites.
* [Quill](https://quill.p3k.io) & [Teacup](https://teacup.p3k.io): Micropub clients used to post text, photos, food logs, and check-ins directly to your personal sites from your [phone](https://brennan.day/phoneblogging/) or web browser.
* [Monocle](https://monocle.p3k.io) & [Aperture](https://aperture.p3k.io): A self-hosted Microsub reader and server environment designed to let users consume content in a decentralized manner.
* [OwnYourSwarm](https://ownyourswarm.p3k.io): A bridging tool to syndicate Foursquare/Swarm check-ins back to your personal domain; an example of PESOS (Publish Elsewhere, Syndicate to Own Site) philosophy.

He is so foundational that the IndieWeb wiki has an article titled [single point of Aaron](https://indieweb.org/single_point_of_aaron), where "IndieWeb technology is being developed and there haven't been enough implementations to create proper diversity causing an over reliance on one of Aaron Parecki's services in order for the technology to work broadly."

Parecki's personal website, [aaronparecki.com](http://aaronparecki.com), serves as a fantastic reference implementation of an IndieWeb-enabled site. There's location tracking, fitness logs, music, micro-blog notes, and much more. All built on his own infrastructure.

And if you visit that site, you'll notice it was only a few weeks ago that [he 3D printed a Claude Code mascot](https://aaronparecki.com/2026/09/29/9/claude-code) (with the help of Claude, of course), and that he's been using a local LLM model to [generate cat pictures](https://aaronparecki.com/2026/10/05/11/) for his weather display.

And if that was the end of it, that'd be one thing—I think it'd be weird of me to write this blog post if Parecki was just dabbling in genAI personally.

But that isn't the case at all. What's happening here is that major IndieWeb projects, such as [webmention.io](https://webmention.io), are being [entirely reworked into PHP](https://github.com/aaronpk/webmention.io/commits/php/) with Claude Code. The original Ruby code hasn't been touched since April of this year, and seems to be human-only and what I mirror on [folk.zone](https://webmention.folk.zone).

The same can be seen in [the commit history](https://github.com/aaronpk/indielogin.com/commits/main/) of [indielogin.com](https://indielogin.com), which began having Claude Code as a contributor only around a month ago in mid-September. And the same for [Meetable's codebase](https://github.com/aaronpk/Meetable/commits/main/), [IndieNews' codebase](https://github.com/aaronpk/IndieNews/commits/main/), [micropub.rocks' codebase](https://github.com/aaronpk/micropub.rocks/commits/main/), and I'm sure many of Parecki's projects I haven't checked.

Suddenly, if you have an anti-genAI stance, you have a reckoning on your hands. My website, for example, uses [IndieAuth/IndieLogin for comments](https://brennan.day/building-an-indieauth-comment-system-for-your-static-site/), I use [Webmentions](https://brennan.day/how-webmentions-work-on-brennan-day/), I have [Micropub enabled](https://brennan.day/posting-to-your-static-site-with-quill-and-micropub/). The list goes on and on.

The "Discourse" [](#the-discourse)
----------

I can imagine the discourse going in several directions here. To start, the IndieWeb has always had an inherent fragility and over-reliance on Parecki's work. He could have decided to inject advertisements or malicious code into his code at any time, and many others (and I) would have been at the mercy of that. Instead, he has decided to use Claude for his many projects.

You could also make the argument that there just [simply isn't enough funding or attention](https://masto.hackers.town/@socketwench/117439551423517319) for these projects, that people have been too passive and unsupportive of projects like these for human-only maintenance to be sustainable.

Next—and I think this is actually important—the lowercase indie web is NOT the uppercase [IndieWebCamp](https://indieweb.org/IndieWebCamps) and the [IndieWeb wiki](https://indieweb.org/wiki). I have always tried to emphasize that it doesn't matter if you use Microformats2 or any of the other specifications and protocols listed on the wiki—as long as you made your website and it isn't just a mere account on a corporate social media platform, then you've succeeded and are part of the indie web.

But of course, many people (myself included) still conflate the two as one-in-the-same. What comes up when you search "indie web," after all? Probably the wiki that's existed for over fifteen years. The "brand" that has [merch](https://indieweb.printful.me/) and [a logo](https://indieweb.org/logo).

What Do We Do, Now? [](#what-do-we-do-now)
----------

Many people who participate in the IndieWeb and who are passionate about the subculture aren't technologically savvy enough to fork and build their own human-made versions of Parecki's projects. Maybe there will be a few devoted, technical people willing to put in the work there, but it would take a lot of time and effort. It would be a good thing to have a more diverse selection of choices, don't get me wrong, but it does feel like a serious schism in a way.

Or do we just bend the knee? Do we accept that generative AI is so ubiquitous that, even in a movement and subculture promoting humanity and our fight against corporations and their ruinous effects, it's okay that the major fundamental building blocks of the IndieWeb use the likes of a chatbot built by the corporation Anthropic? Do we just let the developers and programmers we rely on use the technology?

Or do we just abandon uppercase IndieWeb altogether? Do we strip our websites of the specs and formatting and just simply wash our hands of the project that's been built for over a decade and a half?

Obviously, I don't think there's an easy answer. I don't even know what I personally am going to do, here. I don't think I can overstate how vital and influential Parecki's technical contributions have been to the IndieWeb, regardless of his recent genAI usage. I am not writing this out of judgment or anger, but rather to just bring awareness to the situation, so people can make an informed choice for themselves. That's all I ever try to do.

Somebody I look up to and who's been handcrafting his own (impressive) code for years has told me that he feels fatigued by having to feel angry all the time at genAI at this point. And I can sympathize deeply with how demoralizing it must feel, and that there is obvious burnout in trying to be proactive and vocal about this when there's a never-ending torrent of chatbots and genAI in our face every single day.

I'd really love to know the thoughts of other people (yes, you reading) on this, I think it'll help me get a clearer picture. Maybe it will for you, too.

---

>
>
> **About Brennan Kenneth Brown**
>
>
>
> Queer Métis writer, cultural critic, and web developer based in Mohkínstsis (Calgary), Treaty 7 territory. Author of nine books and counting, the founder of Fireweed Writing School and Berry House Studio, and of Write Club at Mount Royal University. His work has been cited in Le Monde and other publications.
>
>
>
> **Enjoy this content?** Support my work and help me create more:
>
>
>
> [Patreon](https://patreon.com/brennankbrown) | [Ko-fi](https://ko-fi.com/brennan) | [GitHub Sponsors](https://github.com/sponsors/brennanbrown)
>
>