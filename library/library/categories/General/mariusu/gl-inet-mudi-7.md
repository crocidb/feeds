+++
title = "GL.iNet Mudi 7"
description = 'A three-month review of the \_GL.iNet Mudi 7\_ (\_GL-E5800\_) 5G NR Tri-band Wi-Fi 7 travel router, including a comparison to my long-time \_Netgear Nighthawk M2\_ companion.'
date = "2026-08-06T11:34:37Z"
url = "https://xn--gckvb8fzb.com/gl-inet-mudi-7/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-08-06T21:59:23.993782944Z"
seen = false
+++

**tl;dr:** After almost seven years my [*Netgear Nighthawk M2*](/computer/#h4wk) has started rebooting on its own, reporting nonsensical battery percentages and ignoring most of my presses on its touch buttons, so I spent the past three months replacing it with the *GL.iNet Mudi 7* (*GL-E5800*), a 5G NR Sub-6 travel router with two nano-SIM slots plus an onboard eSIM, Wi-Fi 7, a 2.5 GbE port, two USB-C ports and a removable 5380 mAh battery. It is the most capable mobile router I have owned, its 13.5-hour battery rating is close to what I measure, and the LTE reception alone is a clear upgrade over the *M2*. Sadly the *Tri-band* on the box means two bands at a time, there is no *MLO* at all, both SIM trays are underneath the battery, the touchscreen still can’t get you through a captive portal, and firmware 4.8.5 has a cellular defect that leaves the device on *Connecting…* after a carrier deactivates an idle data session. If you came to the *Mudi* line for [*blue-merle*](https://github.com/srlabs/blue-merle) and IMEI randomization, you might be disappointed to learn that this sadly seems to have ended with the *GL-E750*.

Earlier this year I [reviewed the *GL.iNet Slate 7*](/gl-inet-slate-7/) (*GL-BE3600*), the Wi-Fi 7 travel router that replaced my long-running *Linksys WRT3200 ACM* as the router in my [travel setup](/minimal-yet-productive-travel-desk-setup/). I mentioned in that post that I was also in the process of replacing my even older *Netgear Nighthawk M2*, the LTE-A Cat. 20 hotspot that has handled my mobile data for almost seven years now. The *M2* has been a reliable piece of equipment, however, it has started misbehaving so badly that I no longer trust on the road. Random reboots, increasingly nonsensical battery percentages, and touch buttons that no longer register most presses make it a tedious device to use, and with it well past any expectation of longevity, I figured it was time to give its successor a proper, multi-month trial before the *M2* gives up entirely in the middle of some airport lounge.

The device I settled on is the *GL.iNet Mudi 7* (*GL-E5800*), a 5G NR Sub-6 *Tri-band* Wi-Fi 7 travel router that *GL.iNet* unveiled at CES 2026 and started shipping back in April. On paper the device is an upgrade over both the *Netgear M2* and the *Mudi V2* aka *GL-E750V2*, which was still a 4G/LTE Cat. 6 device with a 0.96" OLED. The *Mudi 7* packs *Qualcomm*’s *Dragonwing MBB Gen 3* platform, a Wi-Fi 7 PHY with a 6 GHz radio, two nano-SIM slots plus an onboard eSIM, two USB-C ports, a 2.5 GbE Ethernet port, a 2.8" color touchscreen, and a removable 5380 mAh battery, all in a 157x75x22.8mm, 300g enclosure that runs *OpenWrt* with *GL.iNet*’s firmware layer on top. At $419.99, or roughly €425, it is also the most expensive device *GL.iNet* sells.

Specs
----------

[![](/gl-inet-mudi-7/images/gl-inet-mudi-7-1059_hu_f646b230aee00710.webp)](/gl-inet-mudi-7/images/gl-inet-mudi-7-1059.jpg)

Just like the [*Slate 7*](/gl-inet-slate-7/), the *Mudi 7* is above most *consumer* travel routers. It comes with a 5G NR Sub-6 Rel-17 NSA/SA modem with LTE Cat. 20 (DL) / Cat. 18 (UL) fallback, and the exact specifications of the hardware are as follows:

|        Spec         |                                                                                                                                    Details                                                                                                                                    |
|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|         CPU         |                                                                                                                          Qualcomm quad-core ≈2.2 GHz                                                                                                                          |
|        Modem        |                                                              Qualcomm Dragonwing MBB Gen 3, 5G NR Sub-6, 3GPP Rel-17 NSA/SA, no mmWave; peak theoretical 4.67 Gbps DL; LTE Cat. 20 (DL) / Cat. 18 (UL) fallback                                                               |
|       Memory        |                                                                                                                               2 GB LPDDR4X RAM                                                                                                                                |
|       Storage       |                                                                                                                                   8 GB eMMC                                                                                                                                   |
|      Ethernet       |                                                                                                                      1x 2.5 GbE port, switchable WAN/LAN                                                                                                                      |
|      Wireless       |IEEE *802.11a/b/g/n/ac/ax/be* on 2.4 / 5 / 6 GHz, but only two bands at a time; no *MLO*; max theoretical PHY rates: 2.4 GHz 688 Mbps, 5 GHz 2882 Mbps, 6 GHz 5764 Mbps; antennas: 8x internal (6x cellular, 2x Wi-Fi), 2x external *TS-9* ports for optional cellular antennas|
|         SIM         |                                                                                           2x Nano-SIM + 1x onboard eSIM, *Dual SIM Dual Standby*, eSIM and SIM 2 mutually exclusive                                                                                           |
|         USB         |                                                                                  1x USB-C (power only, PD input/output); 1x USB-C *10 Gbps* (power, USB tethering, USB OTG, USB-to-Ethernet)                                                                                  |
|       Display       |                                                                                                                          2.8" color LCD touchscreen                                                                                                                           |
|       Clients       |                                                                                                                              Up to 64 concurrent                                                                                                                              |
|        Modes        |                                                                                                                   Router, access point, extender; no *WDS*                                                                                                                    |
|      Firmware       |                                                                                                                             *GL.iNet* (*OpenWrt*)                                                                                                                             |
|        Power        |                                                                                                            USB PD / PPS 5–12V, 30W max input, 24W PD fast charging                                                                                                            |
|       Battery       |                                                                                                     3.85V / 5380 mAh / 20.72 Wh, *removable*, rated for up to 13.5 hours                                                                                                      |
|Operating temperature|                                                                                                                               0–40°C (32–104°F)                                                                                                                               |
|        Size         |                                                                                                                                 157x75x22.8mm                                                                                                                                 |
|       Weight        |                                                                                                                                  300g/0.66lb                                                                                                                                  |

### Tri-band ###

Apart from having a modem, the second difference from the *Slate 7* is the 6 GHz radio, which the *Slate 7* lacks entirely. However, the *Tri-band* on the box is a bit misleading. The *Mudi 7* has radios for all three bands, but the chipset cannot drive 5 GHz and 6 GHz simultaneously, so you configure the device as either 2.4 + 5 GHz or 2.4 + 6 GHz.

This also means the *Mudi 7* has no *Multi-Link Operation* at all. On the *Slate 7* I complained that [*GL.iNet*’s *MLO* documentation](https://docs.gl-inet.com/router/en/4/interface_guide/wireless/#mlo-wi-fi) advertises a 6 GHz band that the hardware doesn’t have. On the *Mudi 7* the 6 GHz band is present and *MLO* is gone, which is an odd trade for a device that costs nearly three times as much.

### Regional variants ###

There are two regional variants, *GL-E5800NA* for North America and *GL-E5800EU* for Europe, with different 5G NR and LTE band coverage, which is important to travelers like myself. Both variants cover n5, n7, n26, n38, n41, n77 and n78. Beyond that they diverge, as the *EU* model adds n1, n3, n8, n20, n28, n40 and n75, while the *NA* model adds n2, n12, n14, n25, n30, n48, n66 and n71, plus n13, n29 and n70 in SA mode only. LTE splits the same way, with the *EU* model on FDD B1, B3, B5, B7, B8, B20, B28 and B32 and TDD B38, B40, B41, B42 and B43, and the *NA* model on FDD B2, B4, B5, B7, B12, B13, B14, B17, B25, B26, B29, B30, B66 and B71 and TDD B38, B41, B42, B43 and B48. For my use case (almost exclusively APAC/LATAM) the *EU* variant turned out to be the more sensible choice, but anyone moving frequently between North America and the rest of the world should read both band lists carefully before ordering.

To be fair, though, the *Nighthawk M2* splits even harder. *Netgear* ships that device as at least five separate SKUs, and the [band list for each one](https://kb.netgear.com/000062070/What-cellular-bands-are-supported-by-MR2100-Nighthawk-M2-Mobile-Router) is quite short.

### Contents ###

The box itself contains the *Mudi 7*, the battery pack, a relatively big travel pouch, a USB-C cable, and the paper manual. No external antennas and no power adapter, which I appreciate, given the [chargers](/minimal-yet-productive-travel-desk-setup/) I already lug around.

Modem
----------

[![](/gl-inet-mudi-7/images/gl-inet-mudi-7-1067_hu_b2861517df2d73f5.webp)](/gl-inet-mudi-7/images/gl-inet-mudi-7-1067.jpg)

The headline feature is the modem, which uses the *Dragonwing* platform, *Qualcomm*’s rebranded enterprise and mobile-broadband lineup.

In practice the 4.67 Gbps peak figure is, as with virtually all *hyped* peak numbers, marketing material. Real-world throughput depends primarily on the carrier’s network, the SIM plan, the spectrum allocation, the band combination, and the signal conditions at your specific location. In my own testing I have seen sustained downlink figures in the 600–900 Mbps range on a properly-provisioned 5G network, and significantly less (in the 100–250 Mbps range) on a more typical mixed NSA deployment.

What’s more important, though, is the LTE fallback. The modem falls back to LTE Cat. 20 (DL) / Cat. 18 (UL) and is significantly more sensitive than the *M2*’s aging *Qualcomm* baseband. In the same hotel rooms where my *M2* used to show a single LTE bar at best, the *Mudi 7* can consistently show two or three, often pulling more usable bandwidth on the same SIM and the same carrier.

Lastly, the *Mudi 7* has two *TS-9* external antenna ports for those of us who care to bolt on a pair of paddle or directional antennas in RV/cabin/dead-zone scenarios. I haven’t bothered to test these, as my use case doesn’t involve any of that. However, these days most people might have almost exclusively converted to *Starlink* anyway, so the external antennas might not be as much of a selling point as they were ten years ago.

SIM and eSIM
----------

[![](/gl-inet-mudi-7/images/gl-inet-mudi-7-1069_hu_d317f97864b7fb6f.webp)](/gl-inet-mudi-7/images/gl-inet-mudi-7-1069.jpg)

The *Mudi 7* has two Nano-SIM slots and one onboard eSIM. Both Nano-SIMs and the eSIM are managed via the touchscreen and the web UI. However, it’s important to note that the *Dual SIM Dual Standby* in this context means dual standby with an asterisk. The onboard eSIM and SIM slot 2 are *mutually exclusive* and cannot be active at the same time. The eSIM is disabled by default, and the moment you enable it, SIM 2 stops functioning. SIM 1 remains operational either way, and the modem can auto-switch (i.e. fail over) between SIM 1 and whichever of SIM 2 / eSIM is currently active, but you do **not** get to keep three simultaneously hot profiles. For anyone hoping to keep a local SIM, a regional roaming eSIM, and a home-country SIM in standby together, this is a bit of a disappointment.

Failover itself has also been more rigid than I expected. The web UI exposes the auto-switch feature, including data-usage thresholds and signal-loss triggers, but the failover decision-making has been slow in practice. A complete loss of signal usually does cause a switchover within a reasonable amount of time, but more nuanced situations (such as one SIM throttling without any indication, or losing data while still showing *connected*) often require a manual nudge. *GL.iNet*’s documentation describes far more sophisticated multi-WAN coordination than the SIM-side auto-switch logic delivers. Then again, to be fair, Mwan3 on the *Linksys* has had similar issues and I guess down detection is just a complicated thing to get right.

One caveat is that both Nano-SIM trays are **underneath the battery**, so putting a card in or taking one out means having the device powered down, prying off the back cover, and pulling the battery out. On a product aimed at people who buy a local SIM on arrival, that is a weird design. Then again, in many cases the device is probably already powered off because you arrived by airplane anyway.

Switching between profiles that are already provisioned (either physical-to-physical or physical-to-eSIM) is one of the things the touchscreen handles well, and it doesn’t normally require any detours into the admin UI.

Touchscreen
----------

[![](/gl-inet-mudi-7/images/gl-inet-mudi-7-1071_hu_83b2693eb3f86b68.webp)](/gl-inet-mudi-7/images/gl-inet-mudi-7-1071.jpg)

Speaking of which, just like the [*Slate 7*](/gl-inet-slate-7/), the *Mudi 7* comes with a built-in touch display, though here it is a 2.8" color LCD rather than the much smaller panel on the *Slate 7*.

The screen shows the usual variety of things, like signal strength and current network type, connected client count, real-time data usage, battery percentage, Wi-Fi details with a QR code for quick joining, and the ability to toggle the VPN, the Wi-Fi, and a couple of other features without opening the admin UI. Firmware upgrades also display a progress bar on the screen, which (as I had complained about with the *Linksys*) is a small but welcome quality-of-life feature.

The notable thing missing from the touchscreen is captive portal handling. The moment the upstream WAN is a hotel or airport Wi-Fi network with a captive portal in the middle, the touchscreen is useless and you have to reach for a phone, tablet, or laptop, attach to the *Mudi 7*, open a browser, and go through the portal manually before the router (and everything behind it) can reach the internet. But to be fair, a 2.8" panel is probably a poor place to render an HTML login form and a keyboard to begin with.

The lockscreen with a 4-digit PIN that was introduced on the *Slate 7* is also present on the *Mudi 7*, which I once again appreciate, given the kind of sensitive information (carrier and SIM details, VPN state, hostnames) that this screen displays.

Battery reporting
----------

One annoying quirk is the battery percentage reporting. Both the LCD and the web UI will, after a full charge, *stay* at 100% for the first 1–3 hours of unplugged operation before catching up to reality and dropping rapidly to whatever the actual state of charge is. The underlying kernel fuel-gauge driver does report accurate values (you can confirm this via SSH and `ubus call mcu status`), but from what I can see the MCU layer that drives the LCD and the admin UI applies some *smoothing* to avoid the device displaying 98–99% immediately after charging.

I would much rather see *the truth* on the screen than a smoothed *consumer-friendly* approximation, especially on a device whose entire purpose is to be unplugged for long stretches.

OpenWrt
----------

[![](/gl-inet-mudi-7/images/gl-inet-mudi-7-1065_hu_1e91e6409bf0512b.webp)](/gl-inet-mudi-7/images/gl-inet-mudi-7-1065.jpg)

The *Mudi 7* shipped with *OpenWrt 23.05.4* (`r24012-d8dd03c46f`, Kernel `5.15.170-perf`), with *GL.iNet*’s firmware layer on top. The device runs *Qualcomm*’s proprietary SDK and binary blobs. The same software-openness caveats that apply to the [*Slate 7*](/gl-inet-slate-7/) apply here as well. You get full root SSH access, the `uci` configuration tree, and the ability to side-load the *LuCI UI* if you want, but you’re stuck with *GL.iNet*’s firmware for anything that touches the cellular or Wi-Fi 7 silicon.

The original *Mudi* (*GL-E750*) is the device that [*blue-merle*](https://github.com/srlabs/blue-merle) was written for, the *SRLabs* package that changes the IMEI via AT commands on the device’s modem, wipes the stored client MAC addresses, and randomizes the BSSID and the WAN MAC address across reboots, and it is a large part of why the *Mudi* line got its reputation as *the* privacy-focused travel router in the first place. However, *blue-merle* supports the *GL-E750* and nothing else, and with the 5G modem, the firmware base, and the entire platform having changed underneath it, there is no indication that this is going to change. If IMEI randomization is the reason you were looking at a *Mudi* specifically, the *Mudi 7* does not give you that, at least today.

To be fair, the firmware layer is also what makes the device usable out of the box. The *Multi-WAN*, *WireGuard*, *OpenVPN*, *Tailscale*, *AdGuard Home*, *DNScrypt-proxy2*, *Tor*, and the modem management features are all preinstalled and reachable via a friendly web UI, which (as I had mentioned in the [*Slate 7*](/gl-inet-slate-7/) review) is a substantial step up over the bare *vanilla OpenWrt* experience on an older router like my [*WRT3200 ACM*](/computer/#a0i).

VPN
----------

The *Mudi 7* supports *WireGuard* with up to 600 Mbps. I have been running my own *WireGuard* tunnel on the device, routing the entire LAN through it, and it has kept up with whatever the upstream 5G or LTE connection could deliver.

### Tailscale ###

As with the [*Slate 7*](/gl-inet-slate-7/), *Tailscale* is available, with the same caveats. Basic connectivity works, but anything beyond the default configuration (exit nodes with advanced flags, subnet routing, tagged ACLs, etc.) is going to require manual intervention via SSH.

Tor
----------

The *Mudi 7* can, like the [*Slate 7*](/gl-inet-slate-7/), run a *Tor* node and route LAN traffic over it. The moment *Tor* is enabled, *VPNs*, *DNS*, *AdGuard Home* and *IPv6* will not work properly anymore, because the firmware doesn’t (yet) compose these services the way a hand-rolled *OpenWrt* setup can.

**Note:** As I had explained in [the *Slate 7* review](/gl-inet-slate-7/), these limitations are 100% a *GL.iNet* issue and not caused by *OpenWrt*. The same combinations work fine if you wire them up by hand on top of a vanilla *OpenWrt* installation, including DNS lookups via *Tor* through *DNScrypt-proxy2*. The UI just isn’t there yet on the *GL.iNet* side.

[![](/gl-inet-mudi-7/images/gl-inet-mudi-7-1075_hu_d3be33eb827b1421.webp)](/gl-inet-mudi-7/images/gl-inet-mudi-7-1075.jpg)

AdGuard Home
----------

*AdGuard Home* is, as on the [*Slate 7*](/gl-inet-slate-7/), part of the default installation and just as plug-’n-play. I still don’t use it personally, but the web UI is identical to the one on the *Slate 7* and works fine in the configurations I have tested.

Multi-WAN
----------

The *Mudi 7* differentiates itself from most travel routers in the number of uplinks it can hold at once, as the device supports up to five concurrent WAN inputs: The cellular modem, the 2.5 GbE Ethernet port (when configured as WAN), Wi-Fi-as-WAN (i.e. *repeater* mode), USB-C tethering from a phone or a secondary modem, and USB-C-attached USB Ethernet adapters. The firmware uses *Multi-WAN* underneath, with a friendly UI on top. Router, access point and extender modes are all supported, *WDS* is not.

### USB-C ###

The device features dual USB-C, with one of the USB-C ports being power-only. The other USB-C port is a fully-featured *10 Gbps* port with USB tethering, and USB OTG support. It’s possible to charge the *Mudi 7* on one port while simultaneously tethering on the other.

USB tethering itself, just like on the [*Slate 7*](/gl-inet-slate-7/), is a matter of a few clicks in the UI. Plug a phone in, enable tethering on the phone, and the *Mudi 7* picks it up as a USB Ethernet WAN. The same applies to a USB-to-Ethernet adapter, should you ever need to add a second wired WAN or to bridge into a hotel’s wired LAN where Wi-Fi is unreliable.

Experience
----------

[![](/gl-inet-mudi-7/images/gl-inet-mudi-7-1073_hu_459514d8cd0d2c22.webp)](/gl-inet-mudi-7/images/gl-inet-mudi-7-1073.jpg)

I have had the *Mudi 7* for roughly three months now, and the *tl;dr* is that the device is pretty solid overall, with a handful of caveats around firmware quirks and the chunkier footprint.

### Battery life ###

Battery life is a bit of a mixed bag here, because it depends a lot on what features/services are running on the *Mudi 7*, on the amount of WiFi clients and how cellular coverage is.

Let me therefore put it this way: For the amount of features you get with the *Mudi*, especially compared to my older *M2*, the battery life is decent. Having that said, however, I do believe that the *Nighthawk*, at least in its earlier days, was able to survive longer on a single charge than the *Mudi* is able to right now. Obviously I don’t have scientific benchmarks to prove it, but I remember vividly being out and about with the *M2* for a full day and going to bed with the device only around halfway drained. This is something that I don’t think is possible with the *GL.iNet*. While the device easily gets through a regular workday, I probably wouldn’t trust it to survive a full day road trip with four friends through a mountainous region.

Ultimately, its battery life can be extended using an external powerbank, but that’s clearly not ideal with a device that already weighs 300g on its own. If we’re being honest here, 300g equals about two Google Pixel 5 or two Motorola Edge 30 phones, which can both provide you with a 5G hotspot and which will probably (combined) outlast the *Mudi* by at least a few hours. So if the pure 5G hotspotting capability is all you care about, the *GL.iNet* is definitely not a good option with regard to battery life. If, however, you’re looking at it as the centerpiece of your mobile LAN, that will allow you to leave your *Slate 7* at home because it supports pretty much every important feature and offers integrated 5G connectivity on top of that, then its battery life isn’t too bad after all.

### Heat ###

The chassis warms up noticeably under sustained 5G load (especially with a VPN), but never to the point where I’d be concerned about throttling or comfort. The back gets warm to the touch, but no warmer than a mid-range phone under similar load, and certainly not as warm as my old *M2* would get at times. Unlike with the *Netgear*, I haven’t experienced any heat warnings with the *Mudi* so far.

### Build quality ###

The build quality is solid. The chassis has a reassuring density to it, the touchscreen is responsive, and the front button doesn’t feel flimsy. The back panel is a bit of a weak point, because it is a plastic snap-fit cover protecting the battery and it creaks under pressure. Given that this cover has to be pried off to swap the battery or a SIM, I’m half-expecting it to wear out relatively quickly.

### Weight ###

[![](/gl-inet-mudi-7/images/gl-inet-mudi-7-1061_hu_adaca9def8df6eff.webp)](/gl-inet-mudi-7/images/gl-inet-mudi-7-1061.jpg)

Weight and footprint, as I had anticipated in the [travel desk write-up](/minimal-yet-productive-travel-desk-setup/), are clearly worse than the *M2*’s. The *Mudi 7* is heavier (300g vs the *M2*’s 240g) and noticeably chunkier in both length and width. In absolute terms this is still a small device, but on a packed desk and in a packed bag, the difference is noticeable. The included travel pouch is also larger than the router needs, because most of the extra volume is set aside for accessories. Most people probably won’t use the travel pouch for travel, but rather for storage at home.

### Charging ###

Charging behavior has been predictable. The 24W PD fast-charging input gets the 5380 mAh battery from 0% to \~80% in roughly an hour, and to full in about an hour and 45 minutes. The device accepts whatever USB-C PD source there is around, including my [*UGREEN* 100W](/minimal-yet-productive-travel-desk-setup/) and the [*Sharge Pouch Mini P2*](/edc/#power-bank) power bank.

If you’re considering this device as a permanent member (or even a centerpiece) of your LAN, I have some good news for you: The *Mudi 7* can be operated via USB-C, without its battery plugged in. I don’t know whether this is officially supported by *GL.iNet*, because when you connect a charger the display will show a battery icon with an exclamation mark inside of it, but long-pressing the front button will turn the device on nevertheless. I haven’t experienced any peaks in power-consumption that would lead to arbitrary restarts without the battery plugged-in, but your mileage may vary.

### Reliability ###

Reliability has been pretty good, and I haven’t experienced any crashes, random reboots, or other issues. The only firmware-level oddities I have encountered are the [battery reporting](#battery-reporting) discussed above and the cellular issue in firmware 4.8.5 mentioned in the *tl;dr*: After a carrier deactivates an idle data session, the router can remain on *Connecting…* until I intervene.

Verdict
----------

[![](/gl-inet-mudi-7/images/gl-inet-mudi-7-1063_hu_5caa11e98c541d23.webp)](/gl-inet-mudi-7/images/gl-inet-mudi-7-1063.jpg)

The *Mudi 7* is probably one of the most capable travel-friendly mobile routers I have ever owned, and it has a permanent place in [my travel setup](/minimal-yet-productive-travel-desk-setup/). The 5G modem, the dual-SIM-plus-eSIM configuration, the dual USB-C ports, the 2.5 GbE port, the removable 5380 mAh battery, and the *Wi-Fi 7* PHY can replace the *M2* + *Slate 7* combo for me, while also covering scenarios (5G, multi-SIM, multi-WAN, USB-C-tethered secondary modems) that the combo never could.

While the 300g weight and the bulkier footprint are a step back compared to the *M2*, if I account for the added size and weight of the *Slate 7* that I had to lug around alongside the *M2* to make the LAN work for me, then it doesn’t look as bad anymore. Then again, with the *M2* + *Slate 7* combo I had the flexibility to only bring what’s really needed, which, for e.g. a day trip, would end up being only the *M2*.

Apart from that, there is the *Tri-band* situation, with the chipset only driving two bands at once and offering no *MLO* at all, the SIM-failover logic, which doesn’t work as smoothly as one would expect, the SIM 2 vs eSIM mutual-exclusion, that is mildly annoying, and the battery percentage smoothing, that makes me distrust everything else the device reports. However, none of these are deal-breakers but more like minor inconveniences.

The proprietary *Qualcomm* blob situation is the more concerning part for me, and as with the [*Slate 7*](/gl-inet-slate-7/), the *Mudi 7* is *OpenWrt* only *in spirit*, and its long-term wireless and cellular stack support depends entirely on *GL.iNet* and *Qualcomm* continuing to cooperate. If your priority is true software freedom, this device, like virtually every other 5G-capable router on the market today, is not for you. Neither is it for you if you bought into the *Mudi* name for [*blue-merle*](https://github.com/srlabs/blue-merle) and IMEI randomization.

If your priority is a modern, travel-ready, multi-WAN, multi-SIM 5G router with a solid (if proprietary) firmware on top, the *Mudi 7* is, at the time of writing, the best option I’m aware of. I will be sticking with the *Mudi 7* as my mobile-data device for the foreseeable future, and the *Nighthawk M2* has been retired to the bottom of a drawer after seven years of service.

**PS:** Make sure to check [future updates](/collection/updates/) if you’re interested in the long-term experience with the *Mudi 7*.