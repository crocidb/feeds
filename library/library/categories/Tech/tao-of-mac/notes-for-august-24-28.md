+++
title = "Notes for August 24–28"
description = "I came back to work this week, started catching up on everything, and decided to go out for groceries without an umbrella (it is still August, right?) and got drenched.That might be why I ended up having to take a day off–the fact that there was a virus rampaging through the ho"
date = "2026-08-28T21:30:00Z"
url = "https://taoofmac.com/space/notes/2026/08/28/2130?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-09-01T19:33:17.048134432Z"
seen = false
+++

I came back to work this week, started catching up on everything, and decided to go out for groceries without an umbrella (it is still August, right?) and got drenched.

That *might* be why I ended up having to take a day off–the fact that there was a virus rampaging through the household for a few days might have been entirely coincidental. But it removed all the momentum from my return to work and didn’t improve my ongoing shopping list of ailments (back, plantar fasciitis, etc.).

Trying to get some exercise in by going to the pharmacy was not on my bingo card.

[

Musings On Poverty
----------

](/space/notes/2026/08/28/2130#musings-on-poverty)

Since misery loves company, I followed up on [the other day](/space/links/2026/08/25/1458#m5-pro-and-m6-mac-minis) by pulling up a spreadsheet and trying to figure out how deep I would be in the hole if I bought a new desktop Mac, and… nope. I don’t think I am going to buy *any* new Apple hardware this year (unless something critical breaks). In fact, maybe *no hardware whatsoever* except for reviews, which just feels weird.

I got some very generous [donations](/space/site/donate#support-this-site) recently, though, so expect interesting hardware write-ups soon.

[

Squeezing H.264 into Unlikely Places
----------

](/space/notes/2026/08/28/2130#squeezing-h-264-into-unlikely-places)

In that spirit, I revisited a little hack that let me keep using old hardware: we’ve had M5Stack ESP32 cameras in the house [for years](/space/notes/2026/08/23/1519#notes-for-august-17-23), but Apple, in their wisdom, broke [HomeKit](/space/com/apple/homekit) repeatedly until they stopped working (to be fair, they probably shouldn’t have worked in the first place).

I’ve used them to keep tabs on 3D printers, chimneys (it’s extremely irritating when your upstairs neighbours decide to renovate their kitchen), and other things, but they had become kind of useless since [HomeKit](/space/com/apple/homekit) didn’t support their MJPEG streams and I *really* don’t want to use anything but the Home app.

Well, it turns out that [my earlier ESP32 hackery](/space/blog/2020/09/02/1900#technology) paid off: I realised that, yes, an ESP32 *can* do H.264 encoding, and spent a while iterating on the problem with `gpt-5.6-sol`–first getting encoding to work, then trying to figure out why [HomeKit](/space/com/apple/homekit) didn’t like the stream and mapping out all the parameters involved, and finally adding caching and interleaving encoding with streaming until I got 5fps (which is enough for most uses).

This led to [a somewhat off-the-cuff HN comment](https://news.ycombinator.com/item?id=49410540&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), which I reproduce below:

>
>
> As I was reading this, I realized that the ESP32 HomeKit debugging session I had running was taking a while, and this happened:
>
>
>
> **Me:** What are you doing?
>
>
>
> **Agent:** I’m resolving Apple’s private video-resolution lookup table to determine whether iOS 26 supports 320×240 for HomeKit live streaming. The decompiled source hides the numeric constants, so I:
>
>
>
> * Downloaded/extracted the iOS 26.1 arm64e dyld cache to `/workspace/tmp/ios26-dyld/`.
> * Built and installed the read-only `apfs-fuse` utility needed to mount Apple’s APFS image.
> * Planned to extract `HomeKitDaemon` and decode its resolution table.
>
>
>
> **Me:** Oh, OK. Carry on then.
>
>
>
> These are weird times.
>
>

I was using [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) for this, but a few days later Codex pulled a very similar stunt on me–I am increasingly of the opinion that `sol` is perhaps a bit *too* proactive…

[

Unsocial
----------

](/space/notes/2026/08/28/2130#unsocial)

This week I cancelled my LinkedIn Premium subscription, which is ironic in [far too many ways](/space/site/disclaimer) to comment here, but doing so felt long overdue. The reason I did it is that *even with a corporate discount* I was getting negative value from it:

* It has devolved into a vanity fair that is *worse* than Twitter (if that is possible, solely because I still get some value from my daily 15 minutes of Twitter).
* There was absolutely zero sense in paying for any of the “perks” it offers, all of which I have used approximately zero times.
* The spam was getting really annoying, even after I patiently disabled everything.
* People I meet at work can use my e-mail address to connect with me, so contact discovery is moot.
* And, in a shocking, *shocking* development over the past few years, recruiters don’t really use it for recruiting any more–they just spam you without even checking if you’re a match.

None of that is worth the money–unless they were paying *me* to use it.

I can’t really remove it from my phone yet, but… we’re getting there.

[

Cleaning Up
----------

](/space/notes/2026/08/28/2130#cleaning-up)

I also spent a fair amount of my downtime filing e-mail and poking at a few interesting things, largely to keep myself organised.

For good measure, I decided to take another stab at the “personal CRM” thing–doing reviews is great, but you end up asking yourself “what is the state of X?” too often, so I got [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to whip up a moderately sensible data schema:

![Entity relationship diagram for contacts, organisations, messages and work pipelines](/space/notes/2026/08/28/2130/crm-data-model.svg?v=6a134573350f) The data model behind my personal CRM experiment.

The key thing here is that *there is no UI and no integrations*–I just drop e-mails (or entire mailboxes) into a chat, and [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) files them away and reasons about them. Retrieving data is, as you’d expect, trivial:

* If I want to see the overall status, I get an interactive Kanban board in the `piclaw` UI.
* If I ask about someone or something, I get search results and a little table of our correspondence, including a plain-English summary of what transpired.

I thought about adding this to [`Memento`](https://rcarmo.github.io/projects/memento/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), but the transactional and threading parts wouldn’t be a good fit (the CRM handling skills and *modus operandi* went there automatically, though, which was nice).

[

Addendum: Apparently It Can Ship Things Now
----------

](/space/notes/2026/08/28/2130#addendum-apparently-it-can-ship-things-now)

Turns out `sol`’s proactivity has manifested again. I asked it to review and test [the secure P2P messaging add-on](https://rcarmo.github.io/piclaw-addons/addons/remote-peer/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), and, without any intervention on my part, it provisioned two additional `piclaw` instances, tested the add-on across all three and then cut [the 2.15.0 release](https://github.com/rcarmo/piclaw/releases/tag/v2.15.0?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com).

<img src="/space/notes/2026/08/28/2130/sol-remote-peer-release.png?v=a40704070125" alt="Sol provisioning two additional Piclaw instances, testing Remote Peer across all three and publishing Piclaw 2.15.0" width="1280" height="576"> I only asked it to review and test the add-on.

To paraphrase Douglas Adams on children and off switches, I may need to work out where `sol`’s is…