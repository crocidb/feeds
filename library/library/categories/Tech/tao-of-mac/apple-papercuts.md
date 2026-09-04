+++
title = "Apple Papercuts"
description = "I know this blog has strayed a fair distance from its Mac-centric origins, but I’ve been keeping a mental list of all the things that are broken, missing or inexplicably neglected in Apple’s software, and it’s gotten long enough that writing it down feels like"
date = "2026-05-18T13:20:00Z"
url = "https://taoofmac.com/space/blog/2026/05/18/1320?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-05-20T09:23:14.749843470Z"
seen = false
+++

I know this blog has strayed a fair distance from its Mac-centric origins, but I’ve been keeping a mental list of all the things that are broken, missing or inexplicably neglected in [Apple](/space/com/apple)’s software, and it’s gotten long enough that writing it down feels like a public service<sup id="fnref:1"><a class="footnote-ref" rel="anchor" href="/space/blog/2026/05/18/1320#fn:1" style="color: #0000cc;">1</a></sup>.

This isn’t about [Liquid Glass](/space/notes/2025/09/15/2359) or grand design failures–those are well documented [elsewhere](/space/blog/2026/04/12/1330). This is about the small stuff. The papercuts that, individually, you learn to live with, and collectively make you wonder whether anyone at Apple actually *uses* their software.

Despite the somewhat surprising length of this post after stitching together all the notes, I’m actually focusing on the things *I* hit every week (not trying to put together an exhaustive catalogue), and others will have their own lists–and that’s part of the problem.

[

Mail
----------

](/space/blog/2026/05/18/1320#mail)

[Apple Mail](/space/mail) is the first app open every day and the one I find hardest to defend, and I’ve been defending it for twenty years (longer if you remember the original NeXT mail client).

The broader story is one of abandonment. [Mail.app](/space/mail) used to be extensible–there was a plugin API that third parties used to build genuinely useful tools (GPGMail, SpamSieve, Act-On, all manner of filing and productivity helpers), and I used it to, among other things, [have HJKL keybindings](https://github.com/rcarmo/HJKLPlugin?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link).

Apple deprecated that API, replaced it with a (much more restrictive) [MailKit](https://developer.apple.com/documentation/mailkit?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) surface in 2021, and proceeded to lock MailKit down so hard that barely anyone shipped an extension.

And then they quietly stopped mentioning it. The result is that Mail is now *less* extensible than it was in 2010.

In particular, in this age of desktop AI agents, I come time and again across the fact that [AppleScript](/space/dev/applescript) support in Mail has been left to rot. I wrote about [getting raw message source](/space/dev/applescript/raw_mail_message_source) via AppleScript years ago, and even then it was a workaround for missing functionality.

Today the dictionary is unchanged, the bugs are unchanged, and the “Apply Rules” menu option–which used to let you re-run rules on selected messages–no longer works consistently on multiple selections, if it works at all.

And searching for messages is such a mockery of a user experience that I’m not even sure how to describe it–suffice it to say that it *never* searches solely inside the folder I’m in and that it often fails to find messages that I know are there, even with the most basic criteria.

[

### Mail on iOS Is Just Consistently Worse ###

](/space/blog/2026/05/18/1320#mail-on-ios-is-just-consistently-worse)

And then there are the basics that have simply never arrived on iOS:

* There is no way to filter messages on an [iPad](/space/com/apple/ipad). Not “limited filtering”–*none*. You cannot create a rule, you cannot sort by sender, you cannot batch-select by criteria.
* Smart folders don’t exist on any [iOS](/space/com/apple/ios) version (no, the stupid Categories thing doesn’t count). They’ve been on the Mac since… 2004?
* And, of course, there is no way to have Mail rules sync from the Mac to iOS. For a company that talks endlessly about ecosystem coherence, this is bizarre.
* Download progress is opaque. When Mail is pulling thousands of messages from an IMAP server, the feedback is either nothing or a tiny spinner.
* [Apple Intelligence](/space/ai) in Mail amounts to a summary button that occasionally produces useful one-liners.

There’s no smart filing, no suggested rules, no priority inbox–nothing that would actually reduce the cognitive load of managing email. [Gmail](/space/com/google/gmail) had most of this a decade ago.

[

Time Machine
----------

](/space/blog/2026/05/18/1320#time-machine)

I wrote [an entire blogpost about how bad it is these days](/space/til/2026/02/01/1630), and if I had the patience, I could probably write twice as much.

But I’ll just add that the performance is *abysmal* if you have thousands (or millions) of small files, and that things like [`asimov`](https://github.com/stevegrunwell/asimov?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) (or manually setting the right extended attributes manually for excluding development folders, something I routinely forget to do) *shouldn’t exist*, because it should work properly in the first place:

* It should have much more transparent progress indications
* It should *never* fail silently
* It should recover gracefully from failures
* It *really* should suggest automatic exclusions and have a proper UI that is not “Add this huge top-level folder” for exclusions

Again, this isn’t rocket science. I installed [Borg Backup](https://www.borgbackup.org/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) the other day on some of my Linux VMs, and it is *so good* that it defies explanation how Apple still hasn’t gotten this right.

[

Search
----------

](/space/blog/2026/05/18/1320#search)

[Craig Hockenberry](https://furbo.org/2026/04/29/spotlight-not-right/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) recently wrote up an experience that captures the problem perfectly: his iPhone’s Spotlight index corrupted, search stopped working across App Library, [Mail](/space/mail), Notes, Messages and Settings, and after trying every remedy he could find online–forced restarts, language changes, toggling Siri, developer mode reindexing–the only “fix” was a full device backup and restore.

Which took hours, broke Apple Pay, reset FaceID for two dozen apps, wiped TestFlight builds, and generally made his life miserable for days.

On the Mac, rebuilding the Spotlight index is a one-line terminal command that somehow I keep not memorizing despite needing it once a month. On iOS, that affordance doesn’t exist.

“It just works, my ass” was Craig’s summary, and it’s hard to improve on it.

Search on [iOS](/space/com/apple/ios) is slow, inconsistent, and returns incomplete results across every app that relies on it. On [macOS](/space/com/apple/macos) it’s marginally better but still loses to most third-party tools, solely because Spotlight completely made a mess of the user experience and Finder, well, can’t even find *itself* sometimes.

[

Calendar
----------

](/space/blog/2026/05/18/1320#calendar)

This, again, is something that I come across every single time I need to manage personal time, and that is essential if we want any form of serious AI assistants to work (or integrate with Apple stuff).

But I’ll cut right to the point: the [Calendar](/space/apps/ical) app has barely changed since iOS 7, and the parts that *have* changed are worse.

* Event metadata parsing is broken. If someone sends you a calendar invite with a video call link, Calendar will sometimes pick it up, sometimes not, and sometimes create a phantom “location” that’s actually a URL fragment.
* There’s no way to see a compact list of upcoming events without also seeing the full calendar grid.
* Calendar sharing within a family is functional but graceless.
* [CalDAV](/space/protocols/caldav) support is just… not there. It sort of works, but ever since Apple decided to move both Calendar and Reminders to CloudKit (or whatever), all you will get (for Reminders, at least) are the leftover entries that they left in the store before the migration.

Oh, and need I mention that Siri is *terrible* at calendar operations, including the extremely basic “at what time did my wife book dinner”?

[

Automation
----------

](/space/blog/2026/05/18/1320#automation)

I know. Most of the parts about some apps above are also about automation, and I did post about this in my [Siri for Families piece](/space/blog/2026/05/14/1220), but it deserves a dedicated entry because in this age of Codex and Claude being able to control your desktop, it rankles.

* [Shortcuts](/space/apps/shortcuts) actions break between OS versions. Not occasionally–*routinely*.
* [AppleScript](/space/dev/applescript) is unmaintained, and despite what I wrote earlier, is now presumed dead.
* There is no cross-platform automation story *whatsoever*. No, Shortcuts is not useful there, save for the laudable exception of being able to use my iPhone to automate switching watchfaces (which is something very few people are likely to use).
* Accessibility *sort of works*, but it is so clunky in practice that some of the workarounds I’ve seen implemented in Claude and Codex border on the hilarious.

The bottom line, for me, is that Siri Shortcuts integration is shallow compared to what [Android](/space/com/google/android) offers through intents, or what Windows offers through COM automation (or even Win32, which surprisingly still works so well that it took me [15 minutes to do an agent tool](https://rcarmo.github.io/piclaw-addons/addons/win-ui/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)).

[

Virtualisation
----------

](/space/blog/2026/05/18/1320#virtualisation)

In keeping with Apple’s inability to make the iPad truly useful, [iOS](/space/com/apple/ios) has no hypervisor support today–it was removed in iOS 16.4, and nothing has effectively replaced it since. The result is that you can’t run a Linux VM on an iPad, and you can’t run Docker containers on it either, which means that the entire ecosystem of local LLMs, coding agents, development environments and monitoring tools that I rely on for work and play is completely inaccessible on the iPad.

[macOS](/space/com/apple/macos) has had `Hypervisor.framework` since… Yosemite, and Apple Silicon Macs run [Linux](/space/os/linux) VMs beautifully–but on [iPad](/space/com/apple/ipad) and [iPhone](/space/com/apple/iphone), the entire concept doesn’t exist, and we are forced to run half-assed emulators like [`ios-linuxkit`](/space/blog/2026/05/16/1130) (which I’ve been banging on for a month as a way to prove my point).

This matters to me because a huge amount of the software I use daily–local LLMs, coding agents, development environments, monitoring tools–runs in containers or lightweight VMs. I can do all of this on an EUR 50 ARM board running [Linux](/space/os/linux). I cannot do any of it on an EUR 1,400 iPad Pro with an M4 chip, without jumping through hoops to get AltStore to run on it so that [UTM](/space/apps/utm) can pretend it has proper virtualization.

I know that Apple doesn’t care about this now that they feel buoyed by the [MacBook Neo](/space/blog/2026/03/15/1430)’s runaway success, but I am actually looking forward to trying out a [GoogleBook](/space/links/2026/05/14/1145) solely because Google has reasonably decent support for running Linux userlands on ChromeOS and Android, and I want to see how that compares to the iPad’s non-existent support.

[

Home Automation
----------

](/space/blog/2026/05/18/1320#home-automation)

I could possibly write a book about this by now, considering that I’ve been at this [for many, many years](/space/blog/2025/05/03/1830). [HomeKit](/space/com/apple/homekit) could be so much better, but it is also a part of the Apple experience where the gap between promise and reality is most painful.

Yes, [Matter](/space/protocols/matter) is coming, etc., etc., but a new protocol will never solve any of the shortcomings of the Home app:

* Scene chaining doesn’t exist.
* If-this-then-that logic is barely functional.
* Presence detection is flaky and not granular enough for room-level logic.
* There is no scripting layer. [Shortcuts](/space/apps/shortcuts) can trigger HomeKit actions, but HomeKit automations can’t call Shortcuts.
* Adaptive lighting is half-baked.
* Multi-home support is a mess.

I’ve papered over most of that with [Node-RED](/space/dev/javascript/node-red) and [Homebridge](https://homebridge.io/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link), and of course [Home Assistant](https://www.home-assistant.io/?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) can do all of the above, but, again, my main point is that it shouldn’t *need* to exist for people who’ve bought into the Apple ecosystem.

At this point, Apple should just buy [Homey](https://homey.app?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) and can their entire HomeKit stack.

[

Apple Watch
----------

](/space/blog/2026/05/18/1320#apple-watch)

The Watch deserves its own entry because it’s the device where Apple’s failure to prioritise *timekeeping* is most absurd, and with the rebirth of [Pebble](/space/links/2025/03/18/1700), I was reminded of how *awesome* smartwatch UX can be and how Apple never even got close.

In particular, the “Smart” Stack (the thing you get when you swipe up from the bottom) is never aligned with what I actually want to see, or what is up on my calendar.

The [Pebble](/space/links/2025/03/18/1700)’s timeline view remains the high-water mark for watch UX–one button tap, chronological day view, no widget carousel.

Apple’s Calendar app on the Watch tries to replicate the iPhone calendar grid on a 45mm screen, which is about as useful as reading a newspaper through a keyhole.

A watch should be the single best device for time-aware context. Instead of building a timeline, Apple built a widget carousel.

[

iCloud and CloudKit
----------

](/space/blog/2026/05/18/1320#icloud-and-cloudkit)

I once spent a week building a [CalDAV](/space/protocols/caldav) client to talk to iCloud Reminders and Calendar, and the experience was a masterclass in Apple’s backwards-compatibility approach: it works, except when it doesn’t.

* Newer Reminders lists silently migrate to CloudKit and disappear from CalDAV entirely.
* Apple Notes is completely gone from IMAP–all content is now behind CloudKit’s protobuf CRDT format, which [Eric Migicovsky recently reverse engineered](https://github.com/ericmigi/Notes-Of-Fruit?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link)
* Calendar event recurrence expansion doesn’t work properly through CalDAV.
* App-specific passwords are required if you want to have third party clients *sort of work*, but limitations are documented nowhere.

The pattern mirrors a lot of my gripes about the original iCloud services: Apple builds new infrastructure, migrates data silently, leaves old APIs running but progressively useless, and provides no supported path for third-party access.

[

Terminal
----------

](/space/blog/2026/05/18/1320#terminal)

Yes, it got updated recently. No, it is neither good nor fast nor consistent when you use [`vim`](/space/cli/vim) daily, and that is why I use [Ghostty](/space/apps/ghostty). Like a lot of other core Mac tools, I have feelings about it, some of which I cannot express politely.

[

Developer Experience
----------

](/space/blog/2026/05/18/1320#developer-experience)

I write [Swift](/space/dev/swift) because I have to, not because Apple makes it easy.

The language itself has been through enough breaking revisions that code from three years ago often won’t compile without changes. [SwiftUI](/space/dev/swift) is worse–views that worked on iOS 17 already behaved differently on 18 and now seem broken in 26, and the abstraction leaks the moment you need anything beyond a list and a navigation stack.

The result is a UI framework that *feels* modern in tutorials and *feels* like debugging a black box in production. I’ve lost count of how many times I’ve had to drop to UIKit to work around a SwiftUI layout bug that, once I start searching for it, I realize has been reported for years and yet nobody at Apple acknowledges.

And then there’s the $99/year developer fee, which Apple charges you for the privilege of running your own code on your own hardware. Not to publish on the App Store–just to *run* an app on a device you already paid for. The certificate expires annually, and if you don’t renew, your sideloaded apps stop launching. In 2026, on hardware I own, I need a subscription to run my own software.

The App Store itself is a whole separate set of papercuts–review delays, opaque rejections, the 30% cut, the inability to distribute updates outside the store–but those are well-documented grievances.

The one that gets me is simpler: the entire developer toolchain assumes you are building a product for sale, not a tool for yourself. [Xcode](/space/apps/xcode) doesn’t have a “just let me run this on my phone” mode that doesn’t involve provisioning profiles, entitlements, and a certificate chain.

Until I started using [Codex](/space/links/2026/04/27/1610), every personal project started with ten minutes of ceremony. Now I never even open [Xcode](/space/apps/xcode).

[

Phone Size
----------

](/space/blog/2026/05/18/1320#phone-size)

I still have an [iPhone 6](/space/com/apple/iphone) in a drawer, and every time I pick it up I’m reminded of what a phone that fits in your hand actually feels like. It’s *delightful* to hold–thin, light, one-handable without gymnastics, and the screen is perfectly usable for everything I actually do on a phone.

Every iPhone since has been bigger, heavier, and harder to use one-handed, and the Max/Plus variants are actively hostile to anyone with normal-sized hands or normal-sized pockets. Apple keeps making the screens taller and the bezels thinner, but the fundamental ergonomic regression–that phones stopped being things you hold comfortably and became things you *grip*–has never been acknowledged, let alone reversed.

The iPhone SE was the last concession to people who wanted a small phone, and Apple killed it. The Mini lasted two generations before being quietly shelved. The message is clear: you will hold the slab and you will like it.

[

The Pattern
----------

](/space/blog/2026/05/18/1320#the-pattern)

Every one of these is fixable. Most have been fixable for years. The pattern isn’t technical inability–it’s neglect.

Apple has the engineers, the money, and the platform control. They’ve chosen not to, repeatedly, and I suspect writing about it won’t make any difference, but as someone who has been using Macs since the System 6 days and writing about OSX here since the very beginning, I like to keep a scorecard.

And right now, it’s neither looking good nor reassuringly future-proof, unless, of course, you happen to love Liquid Glass.

---

1. And, as it happens, two weeks of insomnia and allergies provided both the time and the inclination to write it all down… [↩︎](/space/blog/2026/05/18/1320#fnref:1)