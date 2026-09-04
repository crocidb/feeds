+++
title = "My WWDC 26 Wish List"
description = "Michael Tsai’s annual roundup of WWDC wish lists went up this week, and the thing that struck me most wasn’t any single re"
date = "2026-06-05T11:13:00Z"
url = "https://taoofmac.com/space/blog/2026/06/05/1113?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-06-06T15:22:27.758122146Z"
seen = false
+++

[Michael Tsai’s annual roundup](https://mjtsai.com/blog/2026/06/03/wwdc-2026-wish-lists/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) of WWDC wish lists went up this week, and the thing that struck me most wasn’t any single request–it was the mood. There seem to be fewer wish lists than last year, several people openly admitted they couldn’t be bothered to write one, and the ones that did are pretty much bereft of any “aspirational” wishes.

In short, most Apple developers seem resigned to their fate, and echoed the same weary plea for a “Snow Leopard” year where Apple fixes things instead of shipping more, er… “liquid” junk.

One thing that is clearly apparent even to me (even though I am not doing a lot of Mac or iOS development save [`ios-linuxkit`](/space/blog/2026/05/16/1130)) is that we haven’t even got stability in the 26s yet (John Siracusa has a rather mordant take on that in the latest [ATP](http://atp.fm?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) episode), and in a couple of weeks we’ll get betas of the 27s piling bugs on top of bugs.

I already wrote my catalogue of [what’s broken](/space/blog/2026/05/18/1320) last month, so consider this the constructive inverse–roughly the same list, reframed as things I’d actually like to see fixed next week.

None of these are moonshots. Most have been fixable for years, and a fair few were working *better* a decade ago.

What’s changed for me is the agentic-era stakes: I now point Codex and Claude at almost every tool I use during the day, and Apple’s software is, conspicuously, the part that fights back hardest (although I can’t really [go on about it much](/space/site/disclaimer), this week’s [MS Build](https://www.theverge.com/tech/941668/microsoft-build-may-2026-live-news-updates?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) is chock full of examples where Microsoft is *way* ahead of Apple in working AI integration, and it’s… just sad to me personally).

My expectations are effectively rock-bottom by now. Apple has become a hardware company where software seems to have been tacked on as a somewhat under-maintained afterthought. But I can’t help but keep a scorecard, so here’s what I’m hoping for–in rough order of how often it ruins my week.

* I want [Mail](/space/apps/mail) to be automatable again. Not necessarily the full plugin API they killed, but an [AppleScript](/space/dev/applescript) dictionary that isn’t frozen in amber and a MailKit surface that can file, tag and search without ceremony–because the one app I live in all day is the one black box I can’t point an agent at. While they’re at it, smart folders and rules that sync from the Mac should finally arrive on [iOS](/space/com/apple/ios), roughly twenty years late.
* Spotlight should simply find things that exist. I’d settle for that alone–no AI, no reinvention–just reliable, complete results and the one-line reindex affordance the Mac has had for years made available on [iOS](/space/com/apple/ios), so a corrupted index doesn’t mean a multi-hour restore that breaks Apple Pay and FaceID along the way.
* In the agentic era, automation needs to be a first-class platform, not an afterthought. Like many others, I wish for a way to *programmatically* create and modify [Shortcuts](/space/apps/shortcuts); I also want Shortcuts that don’t break between OS releases, a genuine cross-platform story, and the MCP-style hooks that OpenAI and Anthropic have to keep reinventing to automate *anything* in macOS. Windows still does COM and Win32 automation so well that I built an agent tool against it in fifteen minutes–Apple should be embarrassed by that comparison.
* Give the iPad back a hypervisor. [`Hypervisor.framework`](https://developer.apple.com/documentation/hypervisor?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) has been on the Mac since Yosemite and Apple Silicon runs Linux VMs beautifully, yet an EUR 1,400 iPad Pro with an M4 can’t run a container or a VM that a EUR 50 ARM board handles without breaking a sweat. The entire local-LLM and coding-agent ecosystem I depend on is locked out of the most powerful tablet I own.
* [HomeKit](/space/com/apple/homekit) needs a scripting layer and real logic. Scene chaining, granular presence, if-this-then-that that actually works, and–for the love of everything–let HomeKit automations call [Shortcuts](/space/apps/shortcuts), not just the reverse. I’ve papered over all of it with Node-RED and Home Assistant, but none of that should be necessary for someone who bought into the ecosystem.
* Make iCloud sync trustworthy and give us Sync Now buttons across the core apps, the way Messages already has (for now, until they notice and remove it). Stop silently migrating data to CloudKit and leaving the CalDAV and IMAP paths to rot–document third-party access properly instead of letting Reminders and Notes quietly vanish from open protocols. Apple has never exposed any APIs worth using, and that needs to change.
* The Watch should be the best time-aware device Apple makes, and instead it’s a widget carousel. I want a [Pebble](/space/links/2025/03/18/1700)-style chronological timeline, a Smart Stack that’s actually aligned with my calendar, and the Watch independence Imthaz Ahamed asked for–let it pair with more than one phone.
* Let me run my own code on my own hardware without an annual EUR 99 toll. I don’t want App Store distribution–I want a “just run this on my phone” mode in [Xcode](/space/apps/xcode) that doesn’t involve certificate chains that expire and silently brick my sideloaded apps.
* Stabilise [SwiftUI](/space/dev/swift) or admit it’s a research project. Views that worked on iOS 17 behave differently on 18 and seem broken on 26, and I lose hours dropping to UIKit to dodge layout bugs reported years ago. Steve Troughton-Smith’s dream of a real cross-platform successor to UIKit and AppKit is the one I’d trade everything else on this list for if I had to write iOS apps for a living.

And no, I’m not going to complain about [Liquid Glass](/space/notes/2025/09/15/2359) again. I don’t think anyone at Apple will ever own up to how much of a failure it was (even down to controls that provide user feedback but don’t register clicks at the very edge of them), and *some* of it was an improvement (the other 80% of spattering controls atop application content wasn’t).

Every one of these is within Apple’s reach. They have the engineers, the money, and total control of the platform, which is precisely why the pattern grates: this isn’t technical inability, it’s a decade of chosen neglect dressed up as focus, whether you look at it from the pure platform side or if you think about it in terms of the (utterly absent) third-party API integration surface.

This is, unashamedly, a bit of a rant. I’ve been using Macs since System 6 and writing here since the OS X betas, and I’ve watched the company get richer and more capable while the software I use every day gets quietly worse at the boring, essential things, and no wonder I have gradually started using other platforms to the point where most people don’t even consider this a Mac blog.

But I am deeply indebted to Apple for making the platforms that have kept me sane over multiple decades, and I do care about the ecosystem, so… Here we are.

I’d love to be proved wrong next week. I won’t hold my breath–but the scorecard is open, the pen is out, and if all we get is another year of razzle over the dazzle, at least I’ll have a checklist to tick off.