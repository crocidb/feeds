+++
title = "The Siri For Families Apple Will Never Build"
description = "The Ternus announcement got me thinking about the one thing I keep wishing Apple would build and almost certainly never will: a family-scoped AI assistant that actually works across all our devices.I don’t mean a frontier model "
date = "2026-05-14T12:20:00Z"
url = "https://taoofmac.com/space/blog/2026/05/14/1220?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-05-20T09:23:14.784550223Z"
seen = false
+++

The [Ternus announcement](/space/links/2026/04/21/0730) got me thinking about the one thing I keep wishing [Apple](/space/com/apple) would build and almost certainly never will: a family-scoped AI assistant that actually works across all our devices.

I don’t mean a frontier model or a “reasoning engine”–just a competent, context-aware agent that understands my family as a unit. The shared calendar, the school schedules, the medication reminders, who’s picking up whom and when. The kind of thing that Apple Intelligence was *supposed* to be, except pointed at the problem that would actually matter most to the people who are already deep in the ecosystem and paying for it.

I am married with two kids. Between us we have more Apple devices than I care to count–and we are *exactly* the demographic Apple loves to put in keynote photos. And yet [iCloud](/space/com/apple/icloud) treats us as completely separate customers who happen to share a credit card. Family Sharing is a permissions layer bolted onto individual accounts, and it shows in every single interaction–shared photo libraries (still broken), purchase management (still confusing), screen time (still adversarial rather than collaborative). Twenty-four years of *“digital hub”* strategy, and this is where we are.

[

What I Actually Want
----------

](/space/blog/2026/05/14/1220#what-i-actually-want)

Here’s what a competent family agent could do without being creepy–and in most cases, without even needing to leave the device:

* Know that my son has a test on Thursday and hasn’t opened the revision material since Monday. A gentle nudge (to him), not a surveillance report.
* Track our medication schedule and ping people (or me, if an elderly relative misses a window) without turning into a clinical monitoring tool.
* Surface things on [Apple TV](/space/com/apple/tv) that match what we *actually* watch, not what the recommendation engine wants us to try.
* Coordinate pickup times, grocery lists, meal plans–the sort of mundane family logistics that currently live in a group chat and three different apps.
* Make [iCloud](/space/com/apple/icloud) file sharing work the way a shared family folder should, rather than the absurd permissions mess it currently is.
* Do smarter photo sharing–not just a wholesale shared library, but understanding who’s took the photos, where and sharing only relevant stuff to family without it being an all-or-nothing proposition.
* Better family e-mail, better event handling, better package tracking across household members.

I also want it to let me keep my parents and in-laws in the loop. Most of the above also applies to extended family, especially if you have elderly parents who need help managing their medications, appointments, and social connections. A family agent could be a lifeline for them without being intrusive.

None of this is exotic. Apple already does the understated version of some of it–surfacing birthdays, suggesting contacts to call at specific times, the quiet little iOS touches that work well precisely *because* they don’t try to be clever. A family agent would just be more of that, but with understated functionality across the whole household instead of locked to a single Apple ID.

And *none of it requires SOTA models*, or selling out to Gemini. A 4B parameter model running on-device–the sort of thing I’ve been [running on an ARM SBC](/space/reviews/2026/04/11/1900) for months–would handle the intent parsing and coordination.

The hard part isn’t the AI. It never was. It’s the will, the focus and the willingness to execute, and that’s where Apple has been asleep at the wheel for over a decade–and I am not going to hold my breath that Ternus will be the one to wake them up in things like APIs and interoperability that would actually make this possible by third parties.

They *should* have an absurd advantage here: they own the OS, the hardware, the sync layer, the health stack, the media stack, the calendar, the reminders. Nobody else even comes close to that vertical. And they’ve done *nothing* with it.

I know this is possible because I’ve been [building something like it myself](https://github.com/rcarmo/gi?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)–a personal agent that fits in a single [Go](/space/dev/golang) binary and a [SQLite](/space/db/sqlite) database, carries its own scripts and state, and runs on anything from a Raspberry Pi to a desktop. The [TypeScript-based version](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) already manages my homelab, files links to my wiki, coordinates across machines, and does it all with about 300MB of RAM (the Go version should take up 30).

I built this on the equivalent of a Raspberry Pi, but Apple can’t do it with a trillion-dollar platform because they won’t treat families as anything other than a billing construct.

Just to add insult to injury, *I could do most of what I wanted* if we were in the Google ecosystem. But on iCloud it’s impossible to access shared tasklists (or even anything else, really) with any sort of standard protocol and documented API. For Google (or even Outlook), most of it is accessible.

Every Apple equivalent is there, but they just refuse to connect them, or let anyone use them.

[

The Automation Graveyard
----------

](/space/blog/2026/05/14/1220#the-automation-graveyard)

I know I’ve banged on this drum for years, but Apple has spent the better part of a decade systematically *breaking* OS automation, and they’ve done it so thoroughly that it’s hard to believe it’s accidental.

[AppleScript](/space/dev/applescript) is on life support. Automator was effectively killed. [Shortcuts](/space/apps/shortcuts) was supposed to replace both, and instead became an App Store for workflow fragments that nobody maintains and that break with every major OS update. The Shortcuts editor is still painful for anything beyond “open this app and do one thing”, and the integration points with third-party apps range from spotty to fictional.

On [Android](/space/com/google/android), you can set up [Tasker](https://tasker.joaoapps.com/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) automations that trigger on location, time, sensor data, app state, notification content, Bluetooth proximity–and chain them into workflows that persist across OS updates. On Windows, I have a [`piclaw`](https://github.com/rcarmo/piclaw?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) instance that can drive the entire desktop via [a Windows API extension](https://rcarmo.github.io/piclaw-addons/addons/win-ui/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link). The gap between what those platforms allow and what Apple permits isn’t narrowing. It’s getting wider.

[Shortcuts](/space/apps/shortcuts) could have been the foundation for family automation. Instead, it’s a gallery of pretty icons.

[

Why It Won’t Happen
----------

](/space/blog/2026/05/14/1220#why-it-wont-happen)

I suspect the real reason is structural. Apple doesn’t think of families as a product category. They think of them as a collection of individual customers who happen to share a payment method. Every design decision reflects this: iPads are still single-user devices. [iCloud](/space/com/apple/icloud) storage is pooled, but grudgingly, and shared files live in a sort of no-man’s-land. App purchases are shared grudgingly, in a submenu of a submenu. Family Sharing is an afterthought, not a platform.

The only thing that Apple seems to care about (after iMessage) is that we can share what we are watching on Apple TV, which has been relevant in our family for exactly zero minutes since the feature launched.

And until someone at Apple decides that “a household of four using Apple devices” is a use case worth designing *for* rather than designing *around*, Siri will remain a single-user voice assistant that can’t reliably set a timer on the right HomePod.

With Ternus coming from hardware, I’d like to think there’s a chance he gets that a trillion-dollar ecosystem ought to handle a shared grocery list. But I’ve been hoping Apple would sort out family sharing since iCloud launched, so I’m not holding my breath here.