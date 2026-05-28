+++
title = "Indoor Wi-Fi Roaming with OpenWRT"
description = "A few months after writing up the Cudy AX3000 units and moving the house over to OpenWRT, I ended up revisiting the one bit I had deliberately waved away as “good enough”: roaming.A real house, with a mix "
date = "2026-05-26T17:30:00Z"
url = "https://taoofmac.com/space/blog/2026/05/26/1730?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-05-27T23:23:32.324024177Z"
seen = false
+++

A few months after writing up the [Cudy AX3000](/space/reviews/2025/09/14/1630) units and moving the house over to [OpenWRT](/space/os/linux/distributions/openwrt), I ended up revisiting the one bit I had deliberately waved away as “good enough”: roaming.

A real house, with a mix of phones, tablets, laptops and a few stubborn IoT things that insist on staying in 2016, has… issues. But they’re not always obvious, and given we’d both upgraded the 5GHz band *and* changed the locations of the access points, it took a while to figure out where the new rough spots were.

>
>
> If you’re just tuning in, I have a hard split between a legacy 2.4GHz network and the modern 5GHz one. I already had client-managed roaming and basic handoff guidance, but now I added `usteer`, 802.11k neighbour reports (because `hostapd` was not cooperating), and things are now pretty much perfect.
>
>

The long version is below, with anonymised data and enough detail for future me to remember why I did this.

[

Why I Did Not Merge The SSIDs
----------

](/space/blog/2026/05/26/1730#why-i-did-not-merge-the-ssids)

The obvious advice for roaming is “use one SSID everywhere”, and that is often correct if you’re running Wi-Fi in an office, a public venue, or generally somewhere where you don’t have (or care about) legacy devices. It is also not what I did, because the 2.4GHz side needs to remain friendly to older and slightly terrible IoT devices, which means WPA2 compatibility and a conservative setup.

The 5GHz side is where the more modern clients live, and despite losing 5GHz access for a couple of things, I was happy to move it to WPA3. So this is what things look like from a high level:

* 2.4GHz: legacy-compatible WPA2-ish network for IoT and old clients.
* 5GHz: modern client network with WPA3/SAE
* 2.5GbE backhaul across four “dumb” APs
* *Zero* cloud management or vendor-specific software. Nada. Zilch. Non-negotiable.

[

User Feedback
----------

](/space/blog/2026/05/26/1730#user-feedback)

However, I got a few complaints that when moving about the house, iPhones, iPads and MacBooks would not switch to another AP. Since our flat is wrapped around a couple of elevator shafts and there are a few spots (like the kitchen) where tiling, pipes and tiny RF nuisances like fridges were prevalent, that sort of tended to happen a lot–and Apple devices are notorious for being opinionated about that base station they want to stick to.

The baseline *seemed* fine. All four APs had 802.11r/k/v-related options enabled. Fast Transition was also demonstrably happening–the AP logs had `auth_alg=ft` entries that showed fast transition was happening, I had installed `wpad-mbedtls` for “mesh” support, but roaming clearly needed to be improved.

And my setup meant it had to be improved *within* each band/SSID, not across bands. Cross-band roaming is the client’s job, and many clients are not especially good at it.

[

Adding `usteer`
----------

](/space/blog/2026/05/26/1730#adding)

But two things stood out:

* There was no steering daemon installed. Clients were making all roaming decisions on their own, which usually means they hang on to a far-away AP until their signal is frankly embarrassing.
* `rrm_nr_list` was empty on every radio. In other words, even though 802.11k was enabled, `hostapd` was not exposing neighbour reports to clients, so… no real way to steer anything.

So I installed `usteer` and its LuCI companion package on all four APs, enabled it, and left the initial configuration at defaults:

```
opkg update
opkg install usteer luci-app-usteer
/etc/init.d/usteer enable
/etc/init.d/usteer restart

```

The default configuration is minimal: LAN gossip, syslog enabled, IPv6 disabled for the daemon (because, for *reasons*, I don’t trust our current ISP router to do anything reliably except act as an ONT), and a moderate debug level. That was enough for all APs to see one another and exchange client data, which is exactly what I wanted.

However, the 802.11k neighbour list wasn’t being populated. After poking through the OpenWRT forums, I realized the missing piece was `static-neighbor-reports`, which is one of those tiny OpenWRT packages that does exactly what it says and nothing more.

Each AP can generate its own 802.11k neighbour report element via:

```
ubus call hostapd.<iface> rrm_nr_get_own

```

But clients only get useful neighbour lists if each AP is told about the other APs. So I generated per-band lists and installed them per AP:

```
opkg install static-neighbor-reports
/etc/init.d/static-neighbor-reports enable
/etc/init.d/static-neighbor-reports restart

```

The important detail is that the reports are band-specific: 2.4GHz radios only advertise 2.4GHz peers, and 5GHz radios only advertise 5GHz peers. No cross-band mixing, because the two networks intentionally have different SSIDs and security settings.

After that, every AP had three neighbours per radio, `usteer` had AP/client state, and `hostapd` has explicit 802.11k neighbour data to hand to clients that ask for it.

[

What Changed
----------

](/space/blog/2026/05/26/1730#what-changed)

The first comparison is a little boring, but useful. Here is the 2.4GHz SNR before and after the change (this, like the other charts here, was generated from [Graphite](/space/apps/graphite) data):

![2.4GHz SNR over the week](https://taoofmac.com/media/blog/2026/05/26/1730/72f8TO0lWMNK_An34i2tWcTN36w=/snr-2g-weekly.svg)2.4GHz SNR over the week

![2.4GHz SNR: pre-rollout vs latest](https://taoofmac.com/media/blog/2026/05/26/1730/TeIzyjg2rQ5ILDxDBrik_PQvDBo=/snr-2g-comparison.svg)2.4GHz SNR: pre-rollout vs latest

There is no miracle here. 2.4GHz remains 2.4GHz–crowded, noisy, full of junk devices and crowded by all my neighbors. Two of the APs improved or stayed roughly level, two got worse in the sampling window, and I have zero expectations about ever clearing this kind of congestion without moving to the countryside.

The 5GHz side is more encouraging, even if you do need to know when we were near which AP at what time when you look at active bitrates:

![5GHz bitrate over the week](https://taoofmac.com/media/blog/2026/05/26/1730/FBufEONNtwunC5-DH_52c6RO4-o=/bitrate-5g-weekly.svg)5GHz bitrate over the week

The interesting part, though, is that at least between two APs, there was a noticeable shift in usage–which seems to reflect where clients should be registered in practice:

![5GHz bitrate: pre-rollout vs latest](https://taoofmac.com/media/blog/2026/05/26/1730/3i_uhGEnt0oOPSlkRTmhBJa4qS0=/bitrate-5g-comparison.svg)5GHz bitrate: pre-rollout vs latest

But the best sanity check is the sticky-client view, because that is what started this in the first place:

![Sticky-client check](https://taoofmac.com/media/blog/2026/05/26/1730/d9xdNEE8gET5ufk83_RltKpe9UQ=/sticky-client-check.svg)Sticky-client check

The number of merely weak clients did not disappear–one extra client fell below -75dBm in the later sample–but the *very* weak clients went away. That is the bit I care about: the previous -90dBm-ish sticky associations were gone in the later check, which *seems* to indicate clients are not getting hung up on their previous AP and are indeed roaming.

[

Caveats
----------

](/space/blog/2026/05/26/1730#caveats)

A single sample is not science, and Wi-Fi is a swamp of client decisions, radio noise and domestic entropy. I also saw one new Fast Transition log entry after the rollout:

```
FT: Missing required pairwise in pull response from a peer AP

```

That happened once in the latest check. It is not enough to call the setup broken, but it is worth watching–especially because SAE and FT have enough moving parts that I would rather trust logs than assumptions.

[

Going Forward
----------

](/space/blog/2026/05/26/1730#going-forward)

I will be keeping an eye on this over the next few weeks… somehow. I got an LLM to do the Graphite queries and chart scripting for me, and ain’t nobody got time to build dashboards only I would look at, but the metrics aren’t going to go away and the stable config lives in my local [Gitea](/space/apps/gitea) instance now, so there’s really no excuse not to do a spot check in a few months.

But I really like my Cudy APs. No cloud controller, no meshing, no mobile app and no secret sauce. Just OpenWRT, `collectd`/Graphite, and the odd `ssh` session to check configs.

That is still the main thing I like about this setup: when it gets weird, it gets weird in ways I can inspect.