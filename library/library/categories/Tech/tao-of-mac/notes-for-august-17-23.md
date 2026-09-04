+++
title = "Notes for August 17–23"
description = "Tomorrow I’m going back to work after a rather lopsided summer break (not feeling up to it physically or mentally), and the social network pendulum is swinging back into a bit of normalcy as I progressively tune nearly all of them out.Twitter (which I refuse to name otherwise) is"
date = "2026-08-23T15:19:00Z"
url = "https://taoofmac.com/space/notes/2026/08/23/1519?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-24T15:49:20.638339966Z"
seen = false
+++

Tomorrow I’m going back to work after a rather lopsided summer break (not feeling up to it physically or mentally), and the social network pendulum is swinging back into a bit of normalcy as I progressively tune nearly all of them out.

Twitter (which I refuse to name otherwise) is still a controversial (but time-boxed) part of my news intake since [Mastodon](/space/apps/mastodon) has turned into a desert for any serious [AI](/space/ai#artificial-intelligence) discussions other than violent opposition, [LinkedIn](https://www.linkedin.com/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is still crammed with sales-y ego trips and [YouTube](/space/com/youtube) keeps peddling glitz rather than substance, but I do need to figure out what is going on.

For science, I dipped into a few of them over the weekend, which did not improve my general mood–it doesn’t look like I am going “back” into a saner industry (rather the opposite), but at least I sort of got my book reading habits back over the break, and I can finally say I did more productive stuff than just doomscrolling.

[

3D Stuff
----------

](/space/notes/2026/08/23/1519#3d-stuff)

First my shaver broke in the most subtly annoying way (the retaining latch was clearly not designed to outlive the mechanism), then I decided to do something about designing and printing cases for a bunch of SBCs and realised I no longer need to buy dust mesh for those:

<img src="/space/notes/2026/08/23/1519/meshes.jpg?v=766ed9050f6c" alt="A few things that needed fixing" width="2048" height="1024">A few things that needed fixing

Turns out I can print 0.1 mm-thick dust filters with zero issues using PLA and a 0.4 mm nozzle, even if the prints themselves are a bit susceptible to minor flaws if the filament is aged. But being able to design them to size (and shape) is promising.

[

The Future Is Not Evenly Distributed
----------

](/space/notes/2026/08/23/1519#the-future-is-not-evenly-distributed)

I ended up trying [Qwen 3.8](/space/links/2026/08/17/0643#qwen-3-8-27b-is-excellent-but-slow) on the only machine I have that can *somewhat* run it at speed (my MacBook Pro M3, which has 36GB RAM), and… it sort of worked (with RAM to spare, which is nice), but quickly reminded me why I prefer doing [AI](/space/ai#artificial-intelligence) on servers as the battery visibly drained and the machine became warm enough on my lap to be noticeable.

Doing small programming tasks (algorithms or singleton functions) *without* an agentic harness context was doable (so I could probably rely on it if I was doing the same stuff I needed three years ago), but it takes *forever* (something like 30 minutes) to churn through a basic sub-32Ktok agent context, so… I still need better hardware.

[

Claw in a Bun
----------

](/space/notes/2026/08/23/1519#claw-in-a-bun)

Under the pretext of upgrading to [Bun 1.4](/space/links/2026/08/20/1818#bun-1-4), I did some of the long-standing [TypeScript](/space/dev/typescript) cleanup work in [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), dropped in a few fixes and dependency updates, and let it loose.

As recounted [in what is probably this year’s longest post](/space/blog/2026/08/21/2218#building-piclaw-on-top-of-an-opinionated-coding-agent), I just want to *use* the thing now, so unless there’s some amazing new frontier model out or some critical fix, I’m going to try to throttle back on it–also, my free Codex subscription is running out soon, so when *that* goes I’ll have to re-think how to keep my work and hobbies separate.

But things are looking up–RAM use seems lower, most of the annoyances I had seem to have been fixed, and there are (crosses fingers) no immediate issues.

[

Homebridge 2.4
----------

](/space/notes/2026/08/23/1519#homebridge-2-4)

After a very careful waiting period, I finally updated [my home automation setup](/space/blog/2025/05/03/1830#my-quest-for-home-automation-part-6) to `homebridge` 2.x, which, of course, broke things. In my case I am using [`homebridge-webos-tv`](https://github.com/merdok/homebridge-webos-tv?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to control my living room TV and [`homebridge-mqtt`](https://github.com/cflurin/homebridge-mqtt?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to create virtual HomeKit devices from [Node-RED](/space/dev/javascript/node-red), and they both broke instantly when I upgraded to 2.4.0 (yeah, I waited *that* long) because they seem to be fairly niche and not fully tested with 2.x yet.

The solution (which took a while to figure out) was to disable their child bridges and force the use of the `bonjour-hap` advertiser in the top config stanza:

```
"bridge": {
  "name": "Homebridge",
  "username": "0E:…",
  "port": 51826,
  "pin": "123-45-678",
  "advertiser": "bonjour-hap" <- ADDED THIS
}

```

At this time, nearly all of my automations are pure native HomeKit, with only a few things patched through [Node-RED](/space/dev/javascript/node-red) (which I upgraded to 5.0.4 this week as well), which is great except that it exposes me to Apple’s general penchant for breaking things every now and then.

But everything “just worked” aside from a minor configuration glitch in a “Virtual Bell” accessory that I use to merge our doorbells into a single alert, and my usual fiends, the ESP32 cameras that we still use to check on open windows and stuff.

Those tiny and slow cameras are long overdue for replacement, possibly with something like the [Aqara G100](https://www.amazon.es/gp/product/B0F6CKH9BB/ref=as_li_tl?_encoding=UTF8&camp=3638&creative=24630&linkCode=ur2&tag=taoofmac-21&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com). The M5Stack hardware was never really meant to be [HomeKit](/space/com/apple/homekit) compatible, but I’ve been hacking at the [ESP32](/space/hw/esp8266#esp8266-and-esp32) firmware for years and they have suffered through years of Apple breaking things subtly (without even documenting the right behaviour for camera devices), so at this point I keep them around for a sort of sport.

[

Minor Annoyances
----------

](/space/notes/2026/08/23/1519#minor-annoyances)

If you’ve missed my [apple papercuts update](/space/blog/2026/08/22/1147#apple-papercuts-summer-edition), well, I’ve been trying to get a lot of writing done on my iPad, and… stuff happened. I’ve also put together a [`swift-app-template`](https://github.com/rcarmo/swift-app-template?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to see if I can standardise a bit the stuff I am doing, and made a point of cramming in as many quality-control steps as possible so I don’t keep reinventing the wheel, starting with `SwiftPM` defaults and ending with a comprehensive set of agent skills consolidated from my library.

I also pinned down and fixed a site rendering bug (images inserted using certain ancient formats of [Markdown](/space/markup/markdown) references would be interpreted as page links).

[

Reading
----------

](/space/notes/2026/08/23/1519#reading)

Building on last week’s book marathon, I finished *[The Shattering Peace](https://www.amazon.es/gp/product/1509835385/ref=as_li_tl?_encoding=UTF8&camp=3638&creative=24630&linkCode=ur2&tag=taoofmac-21&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)* by John Scalzi, which was a nice, fun romp, and got started (again) on *[Norse Mythology](https://www.amazon.es/gp/product/1408891956/ref=as_li_tl?_encoding=UTF8&camp=3638&creative=24630&linkCode=ur2&tag=taoofmac-21&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com)*, still one of my favourite reads.

I think I’m ready for whatever Loki tosses at me tomorrow when I log back in.