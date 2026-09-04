+++
title = "My E-ink Summer Report"
description = "I’m now back to work and already embroiled in far too much, so I’m going through my infinite set of mental checklists and trying to relax by offloading some of the stuff I never got around to writing down. While I was on vacation, one of the things I did was tune out (as much as "
date = "2026-08-30T18:00:00Z"
url = "https://taoofmac.com/space/blog/2026/08/30/1800?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-09-01T19:33:17.041519756Z"
seen = false
+++

I’m now back to work and already embroiled in far too much, so I’m going through my infinite set of mental checklists and trying to relax by offloading some of the stuff I never got around to writing down. While I was on vacation, one of the things I did was tune out (as much as possible), which meant relying more on my e-ink devices.

<img src="/space/blog/2026/08/30/1800/eink-devices.jpg?v=6e53c18f8a1d" alt="They look great together" width="2048" height="1431"> They look great together [

Nomadism, Redux
----------

](/space/blog/2026/08/30/1800#nomadism-redux)

I’ve written a bit about [my long-term experience with the Supernote Nomad](/space/reviews/2025/06/14/1530#six-months-with-the-supernote-nomad), but that was almost a year ago, and in the meantime there have been quite a few software updates–plus additional tweaks of my own.

But the interesting thing is that none of that changed the way I use the device. It’s definitely replaced my [Kindle](/space/com/amazon/kindle) for nearly everything (and more). It’s been by my bedside for a year and a half now, and I still use it to take notes and catch up on the news. Catching up on the news has become somewhat more frequent, as I don’t need (or want) the additional features (or distractions) afforded by my iPad.

I haven’t used it *more* even though I do most of my reading on it, but I also haven’t used it *less*, despite a fairly long hiatus in my regular reading habits. It is very handy, virtually weightless when detached from its cover and frictionless for noting down stuff–even during work calls, when I mostly take notes to reinforce my memory of the event rather than for accuracy.

So it was a no-brainer to take it along for a week in Spain, but the new environment reminded me of three shortcomings:

* The lack of a front light makes it hard to use for late-night reading marathons (and it’s still the thing I miss the most, even if I love how light and crisp the screen is).
* It can be slow (and crashy) when running Android apps (the Kindle app crashed a few times).
* I still can’t read or annotate PDFs on it comfortably (going “back” to it instead of an iPad makes the screen size and speed differences pretty obvious).

I still wish it had a fingerprint reader, too. And, these days, I would probably appreciate a microphone for privacy-respecting dictation (I haven’t played with Bluetooth on it enough to tell if that would be a viable option).

But a bit of hacking on [`picoflux`](https://github.com/rcarmo/picoflux?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) made it trivial to read the daily news comfortably over hotel Wi-Fi, and there are a lot of small hacks that I can pull off, even if the base system is already well polished. And even though I don’t use it often as a regular tablet, [Firefox](/space/apps/firefox), [Tailscale](/space/apps/tailscale), [Termux](https://f-droid.org/en/packages/com.termux/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and [Obsidian](/space/apps/obsidian) let me do the few things I need to keep tabs on my home lab and “regular” notes.

[

The Mightiest Tiny Book
----------

](/space/blog/2026/08/30/1800#the-mightiest-tiny-book)

But based on screen time alone, the e-ink device I used the most on vacation *wasn’t* the Nomad–it was the [Xteink X4](/space/reviews/2026/04/04/1800#the-xteink-x4).

I installed a nightly build of [CrossPoint Reader](https://github.com/crosspoint-reader/crosspoint-reader?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) on a whim to see if it fixed my Wi-Fi problems (spoiler: `1.5.0-rc` didn’t, `1.6.0-rc` apparently does now that I am back). The X4 worked *perfectly*, and I carried it almost everywhere we went.

At this point, I would consider it the perfect travel and beach gadget. It is easy to pick up/put down/put away, has absolutely *zero* distractions, and gave me everything I needed for entertainment and learning. My 3D-printed hard cover protected it, and I added a little rubber USB-C plug to keep sand out.

[

Toning Down
----------

](/space/blog/2026/08/30/1800#toning-down)

Vacations and trips are self-contained periods when it’s pretty easy to cut down on noise and distractions by shifting to different devices for quieter, more focused downtime. It doesn’t surprise me that this went so well.

And although it is impossible to gauge how much time I’ve spent on e-ink devices over the year, I want to spend *more* time with them as I try to stay focused and productive. Doing more on low-end devices is going to be harder, of course, but the quality of the downtime also matters, and at least I can build my own solutions.

For instance, I’ve been making a few notes about improvements to [my OPDS and syncing server](https://github.com/rcarmo/bun-opds-server?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), and I’ve been meaning to investigate Bluetooth audio and put together a dictation plugin for the Nomad–the SDK seems straightforward enough…