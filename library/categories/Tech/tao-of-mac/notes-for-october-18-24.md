+++
title = "Notes for October 18-24"
description = "I’ve been more interested in exploring how to simultaneously enjoy Greek yoghurt, orange marmalade and the glorious golden-hour light that pervades my living room than, well, most other things, so this week was a bit of a bust as far as personal projects go.Part of that is becaus"
date = "2026-10-24T20:03:00Z"
url = "https://taoofmac.com/space/notes/2026/10/24/2003?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-10-27T22:33:14.258979537Z"
seen = false
+++

I’ve been more interested in exploring how to simultaneously enjoy Greek yoghurt, orange marmalade and the glorious golden-hour light that pervades my living room than, well, most other things, so this week was a bit of a bust as far as personal projects go.

Part of that is because I have finally swapped the [Surface loaner](/space/reviews/2026/09/20/1100#the-surface-laptop-with-snapdragon) I was using for a brand new machine (more on that later) and am also returning the [Lenovo Chromebook](/space/reviews/2026/10/04/1800#the-lenovo-chromebook-plus) I recently reviewed, so I had to spend a little while making sure nothing of relevance was lost.

The rest was… mostly housekeeping, really.

[

Wi-Fi Tweaks
----------

](/space/notes/2026/10/24/2003#wi-fi-tweaks)

A sharp-eyed reader (hi!) noticed that I mentioned the [Radxa Linkr](/space/reviews/2026/10/18/1646#the-radxa-linkr) had some WPA3 issues, and told me an [OpenWrt update](https://openwrt.org/releases/25.12/changelog-25.12.6?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) had some WPA3 interoperability fixes for the [Cudy M3000](/space/reviews/2025/09/14/1630#the-cudy-ax3000-wi-fi-6-system-with-openwrt), so I upgraded one of my APs–that didn’t fix the Linkr, but after some soaking in I upgraded the rest with no ill effects.

Roaming around the house still works fine, but there are a couple of reported issues with fast-transition (FT) associations in this build, so I’m keeping an eye on [OpenWrt PR #23181](https://github.com/openwrt/openwrt/pull/23181?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and [mt76 issue #1098](https://github.com/openwrt/mt76/issues/1098?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) in case I come across any issues in the future.

[

Local Agents
----------

](/space/notes/2026/10/24/2003#local-agents)

I’ve found an interesting workaround for my “no local agents on my Mac” rule–I’ve been using [Open Minis](https://apps.apple.com/pt/app/open-minis/id6759188481?l=en-GB&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) on my iPad for a while now because of its iOS integrations (it can handle Reminders, Calendar, HomeKit, etc.), and I realised that it can run as a fully sandboxed iOS app on my MacBook Pro *and* sync via iCloud with my iPad and iPhone.

Since I had previously gotten my iPad to sync skills with [`memento`](https://github.com/rcarmo/memento?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), it took me 5 minutes to get everything working on my Mac, including mapping a couple of “external” folders to it.

Since it’s using the same engine as [`ios-linuxkit`](https://github.com/rcarmo/ios-linuxkit?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (even if they didn’t take any of my PRs and fixes, which is a bit sad), there’s additional ARM-on-ARM emulation going on, but on a MacBook that barely registers–and having a sandboxed agent that can run its own native Safari WebKit browser completely isolated from my Mac is pretty nice.

[

The Grind
----------

](/space/notes/2026/10/24/2003#the-grind)

I’ve been patiently nudging [`piclaw`](https://github.com/rcarmo/piclaw?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to port itself to `pi-durable`. Most of that has already happened–the new version is self-healing and is gradually removing the redundant abstractions I had built atop the original SDK.

No hurry there.