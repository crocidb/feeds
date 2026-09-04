+++
title = "Notes for June 28 - July 4"
description = "The weather certainly doesn’t help, but I’ve still managed to squeeze in a few interesting hacks this week in between work, flashbacks about the recent reorg (too soon to call it, but l"
date = "2026-07-04T12:30:00Z"
url = "https://taoofmac.com/space/notes/2026/07/04/1230?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-07-06T19:14:07.681709082Z"
seen = false
+++

The [weather certainly doesn’t help](/space/notes/2026/07/02/2200), but I’ve still managed to squeeze in a few interesting hacks this week in between work, [flashbacks](/space/blog/2024/06/08/1200) about the [recent reorg](/space/links/2026/07/02/1459) (too soon to call it, but like everyone else, I’m waiting for the other shoe to drop), and a new personal project of watching every Bond movie in chronological order (which is a surprisingly good way to spend a few evenings, even if it’s a bit uneven in quality).

[

Pi On Your iPad… Sort Of
----------

](/space/notes/2026/07/04/1230#pi-on-your-ipad-sort-of)

Although I can run most AI agents inside [`ios-linuxkit`](https://github.com/rcarmo/ios-linuxkit?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), I keep getting bitten by the fact that Apple won’t let me run my own apps *permanently* on my iPad, so every now and then the build expires when I am either a) away from home or b) with every single Mac in the house off or otherwise inaccessible (or both), which is a *giant* pain.

And I do want to be able to run some form of terminal-based agent on the iPad, if only for helping me proofread and auto-link drafts (which I could theoretically do with an [Obsidian](/space/apps/obsidian) plugin, but none of those are reliable in the long term). So when I got wind of [`tau`](https://github.com/huggingface/tau?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and realized it was pure [Python](/space/dev/python), I immediately tried to install it inside [a-Shell](/space/apps/a-shell), which has a very complete Python runtime and has been my go-to for all sorts of CLI tooling for years–and after some creative hacking, it mostly works:

<img alt="tau running in a-Shell after some tweaks" src="https://taoofmac.com/media/notes/2026/07/04/1230/OOkL3OFrUn5NV7vipWA67Wv5e9g=/tau.jpg" width="1280" height="894" style="max-width: 100% !important;height: auto !important;">tau running in a-Shell after some tweaks

[My fork](https://github.com/rcarmo/tau-a-shell?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) adds a bunch of things like GitHub provider support, hiding the sidebar and a few workarounds for common iPad foibles (like the lack of an `Esc` key, and [a-Shell](/space/apps/a-shell)’s weird lack of support for `Command + .`), and like [`pi`](/space/ai/agentic/pi), is self-modifying to a degree where I can expect it to keep adapting to the way I work.

[

Home Automation
----------

](/space/notes/2026/07/04/1230#home-automation)

Since I have a love-hate relationship with air conditioning, I set up an additional [Tuya ZG-204ZM](https://www.zigbee2mqtt.io/devices/ZG-204ZM.html?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link#tuya-zg-204zm) to keep track of presence in the office and only turn it on when absolutely needed, which led me down the usual rabbit hole of [Homekit not having any sort of useful logic](/space/blog/2026/05/18/1320) to do something as simple as “only turn this thing on **if** I am in the office **and** it is over 27<sup>o</sup>C”, which takes all of three minutes to wire up in Node-RED – but is now undiscoverable by anyone else in the house since it won’t be visible in the Home app.

>
>
> And yes, I know there are alternatives to the Home app. That is not the point.
>
>

*Truly useful* automation like “only turn this thing on **if** I am in the office **and** it is over 27<sup>o</sup>C **and** my kids didn’t leave the window open” (which takes two more minutes) is, alas, something that Apple will likely never really understand.

That said, this class of microwave-based presence sensors is very good. I’ve been using one for a year to turn on ambient lighting when I sit at my office desk (and dim everything when I walk away), and it’s been stupidly reliable. However, it seems that the really interesting, zone-aware ones that have been coming out require wired power, and if any smart home manufacturer truly believes people want to have wall warts to push 5V to these things through a highly visible wire, well, that’s just not happening (the model I’m using takes 2 AAA batteries, which apparently last forever).

[

AI Media Slop…ish
----------

](/space/notes/2026/07/04/1230#ai-media-slop-ish)

I have been playing with [Ideogram 4](https://ideogram.ai/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) a bit [again](/space/notes/2026/06/14/1800), but this time on my puny RTX 3060 (which manages one decent-quality image every… 5 minutes or so), as well as with automated video generation via [Remotion](https://github.com/remotion-dev/remotion?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), mostly to figure out how some of the current commercial SOTA slop generation pipelines (the output of which we’re constantly exposed to in social media) can be *scaled down* to more useful pursuits, like helping teachers create *grounded* educational assets. Since I have long had a local [Kiwix](https://kiwix.org/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) instance on my NAS (yes, I like the idea of having offline copies of iFixit and selected Stack Exchange forums), there’s no shortage of material, but I started out with a simpler thing–a [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) intro:

<img src="https://taoofmac.com/media/notes/2026/07/04/1230/5mJBYRjk3PxWBiCbbv70_Ay2gTc=/piclaw-intro.jpg" style="max-width: 100%;height: auto;width: 100%" alt="Your browser cannot play this video" width="1920" height="1080">  A short intro clip that `piclaw` created for itself using Remotion.

So far, I see two major challenges:

* Fact-based storylines/scripts are (as I expected) quite challenging to put together (LLMs have no taste, hence no decent criteria for emphasizing the right aspects of the source material). This seems like a relatively easy thing to handle using a multi-step curation process and better skill authoring, but requires time.
* Consistency in visual depictions. Themes and templates go a long way, but anything that involves a visual prompt is just too prone to error–which is why I’ve been looking into [Ideogram 4](https://ideogram.ai/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) as a possible way to improve things.

And yes, there’s a lot of pseudo-infographic stuff out there, but it’s all pretty much crap–any pointers on actually reliable techniques or open-weight models are welcome.

[

RDP Shenanigans
----------

](/space/notes/2026/07/04/1230#rdp-shenanigans)

Faced with the prospect of *years* without significant hardware upgrades *and* the heat, I decided to revive [my Linux thin client setup](/space/blog/2022/10/23/1700), with a twist: I need to run modern graphical apps on the server, and right now that means Wayland.

`xrdp` still works great for most essentials, but we keep getting told that Wayland is the future for what–two decades now?–and it’s high time I explored RDP support in Wayland properly. After all, [I know the wire protocol well](https://github.com/rcarmo/go-rdp?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), and I have extra motivation:

* I’ve been meaning to fix a critical part of the Steam experience (pairing a new/updated device remotely to a headless machine) for ages, and getting view-only output out of Gamescope would be nice, because Valve clearly never gave much thought to the notion of headless Steam boxes.
* GNOME Remote Desktop is… bad. I’m sorry, but it just is, not just because I want proper multi-user headless support but also because of various protocol support gaps.
* I would very much like to, sometime in the future, have something that works *at least as well* as `xorgxrdp` and `sesman` to have minimally accelerated desktops (rendered using the GPU on the server side) streamed via RDP (preferably H.264) to an arbitrary client.

The current state of the art in the X11 world lets me do the latter (with minimally usable audio) pretty well, but there’s nothing equivalent in the Wayland ecosystem… Until I found out about [`lamco-rdp-server`](https://github.com/lamco-admin/lamco-rdp-server?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and started hacking at my own fork to implement the bits I wanted.

And oh boy, is Wayland broken by design if you try to do something like this… Right now the current setup is, roughly, an in-memory, headless Weston instance that, via some duct tape and wishful thinking, *is screen captured* through the “portal” abstraction by `lamco-rdp-server`, which feels like a tremendous waste of resources instead of, you know, just having a process hold both the compositor and the protocol renderer per logged-in user.

But I got most of the interesting bits to work already:

<img src="https://taoofmac.com/media/notes/2026/07/04/1230/_ybOYgPM_jQX-3DKAspFN45cwG4=/wayland-rdp.jpg" style="max-width: 100%;height: auto;width: 100%" alt="Your browser cannot play this video" width="1552" height="720">  A headless Weston session streamed over RDP via my `lamco-rdp-server` fork.

Screen resizing, in particular, is a pain, but then again input has been much worse… I wasn’t particularly fond of the idea of reinventing this wheel to the point where it’ll be a full-fledged thin client solution, but a few hours with Codex led me to a usable `xrdp`-like solution with an equivalent `sesman`-like session manager, PAM support and a few other niceties, and I’m certainly up for experimenting (and learning) with it over Summer.