+++
title = "Razer Basilisk V3 Pro 35K Phantom White Edition"
description = "A review of the Razer Basilisk V3 Pro 35K in its translucent Phantom White edition, compared to the regular Basilisk V3 Pro that I had been using since 2024."
date = "2026-10-16T12:26:06Z"
url = "https://xn--gckvb8fzb.com/razer-basilisk-v3-pro-35k-phantom-white-edition/"
author = "marius@xn--gckvb8fzb.com (Marius)"
text = ""
lastupdated = "2026-10-21T11:46:09.515624252Z"
seen = false
+++

In 2024 I [replaced](/updates-2024-q3/) the Logitech MX Master 3 that I had been using since 2021 with a Razer Basilisk V3 Pro and Razer’s Mouse Dock Pro. The Basilisk did what the Logitech never managed to do, namely work without connection stutters, lags and dropouts. It also charged wirelessly on its dock and came with the same free-spinning scroll wheel that I had gotten used to on the MX Master, while being lighter and not covered in rubber that got quite disgusting to touch over time. Since then it has been my mouse at most [desks](/desk/), as well as on the road, where I bring it on almost every trip, even though my [setup](/minimal-yet-productive-travel-desk-setup/) is mostly keyboard-driven.

There was nothing wrong with the V3 Pro that I had. The main difference between it and the Basilisk V3 Pro 35K, which Razer released in October 2024, is the newer Focus Pro 35K sensor that replaces the Focus Pro 30K. However, I really like the transparent tech aesthetics of the 2000s, and when I came across the 35K in Razer’s translucent Phantom White edition at TSUKUMO eX. in the Akihabara district of Tokyo, I bought it anyway. I want to see more companies move away from the boring, muted look of today’s hardware and bring back the transparent tech look.

This post is a review of the Phantom White from the perspective of someone who had used the regular V3 Pro for two years. It covers what Razer changed between the two, the engineering inside, and where Linux compatibility is at.

**Disclosure:** I paid for the mouse with my own money and have no relationship with Razer. The opinions in this post are entirely my own.

Phantom White
----------

[<img class="kg-image" src="/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1962_hu_113afce5f983b127.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1962.jpg)

Razer introduced its Phantom collection in June 2025 with translucent green versions of the Basilisk V3 Pro 35K, the BlackWidow V4 75% keyboard, the Barracuda X Chroma headset and the Firefly V2 Pro mouse mat. In October 2025 the same four products followed in translucent white, together with a Kishi V3 controller for phones, under the name Phantom White. In Japan the Basilisk went on sale on November 7, 2025, at a suggested price of ¥28,980, which is ¥2,000 more than the black and white versions of the 35K. In the US the difference is $10, with the Phantom White at $169.99.

Not only is the shell translucent, but so are the side grips, the cover on the underside and even the housing of the wireless dongle, which Razer refers to as *color-matched components*. The shell, however, isn’t as clear as Razer’s product renders make it look. The top in particular has a milky finish that is half white and half see-through, and the internals show through it as faint shapes instead of in detail. It’s apparently the same for the green version, with the interior only faintly visible through a shell that isn’t fully clear.

Making a mouse translucent takes more than swapping the plastic. Razer’s Global Head of Design, Charlie Bolton, explained in an interview that the products in the Phantom collection weren’t designed to be transparent in the first place, and that Razer had to redesign a lot of their internal structure. Razer’s own marketing speaks of *reengineered internals* and *meticulous wiring* without going into detail. The only differences that I could find documented are that the Phantom editions have only 12 individually programmable LEDs instead of the 13 of the black and white 35K, and that Razer publishes a separate firmware updater for them. Which of the lighting zones was dropped, and why, Razer doesn’t say, but my assumption is that the 13th LED is the one which, on the non-translucent versions, illuminates the Razer logo on the back of the mouse.

With the lighting turned on, the shell spreads the light of the *underglow* and the scroll wheel through the body of the mouse. This makes whatever lighting effect is running impossible to ignore, which, as I’ll explain [further down](#linux), is a bit of a problem in my case.

[<img class="kg-image" src="/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1970_hu_177f248978c947da.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1970.jpg)

Translucent and white plastics tend to yellow with UV exposure over the years, and since the Phantom editions have only been around for about a year, I haven’t found any reports on how they age. I guess this is something that I’ll be able to report on in a few years, if yellowing should actually occur.

It also remains to be seen whether the rubber on the side grips will wear after a few years as has been the case with my black V3 Pro, but I strongly assume that it will, at which point it’ll be interesting to see how that will look on the translucent material.

Aesthetics are subjective, and I can understand anyone who prefers the stealthy look of the black version and finds the Phantom White to be a bit too much. I, for one, like it a lot. It reminds me of the translucent gadgets of the 2000s, and it turns the mouse, which is usually one of the most boring objects on a desk, into something that is quite interesting to look at.

Specs
----------

[<img class="kg-image" src="/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1971_hu_158a9f0d06d59cf.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1971.jpg)

|       Spec       |         Basilisk V3 Pro (2022)          |  Basilisk V3 Pro 35K Phantom White   |
|------------------|-----------------------------------------|--------------------------------------|
|      Sensor      |     Focus Pro 30K (PixArt PAW3950)      |         Focus Pro 35K Gen-2          |
|    Resolution    |     Up to 30,000 DPI, 50 DPI steps      |    Up to 35,000 DPI, 1 DPI steps     |
|Speed/acceleration|              750 IPS, 70 G              |            750 IPS, 70 G             |
|  Main switches   | Razer Optical Gen-3, 90 million clicks  |Razer Optical Gen-3, 90 million clicks|
|   Scroll wheel   |   HyperScroll Tilt Wheel, Smart-Reel    |  Same, with configurable Smart-Reel  |
|     Buttons      |             11 programmable             |   11 programmable, 13 controls\*\*   |
| On-board memory  |               5 profiles                |              5 profiles              |
|     Lighting     |                13 zones                 |               12 zones               |
|   Connectivity   |  2.4 GHz HyperSpeed, Bluetooth, USB-C   | 2.4 GHz HyperSpeed, Bluetooth, USB-C |
|   Polling rate   | 1000 Hz, 8000 Hz with dock or dongle\*  | 1000 Hz, 8000 Hz with dock or dongle |
| Battery, 1000 Hz |90h at launch, 110h on today’s spec page |                 140h                 |
| Battery, 8000 Hz |                   32h                   |                 28h                  |
|Battery, Bluetooth|100h at launch, 150h on today’s spec page|                 210h                 |
|Wireless charging |     Qi, with puck (sold separately)     |   Qi, with puck (sold separately)    |
|      Weight      |                  112g                   |                 112g                 |
|    Dimensions    |          130 x 75.4 x 42.5 mm           |         130 x 75.1 x 42.5 mm         |
|Launch price (US) |                 $159.99                 |               $169.99                |
|Launch price (JP) |                 ¥25,980                 |               ¥28,980                |
|     Released     |               August 2022               |             October 2025             |

\* At launch the V3 Pro supported 4000 Hz with the Mouse Dock Pro or the HyperPolling Wireless Dongle. Razer raised that to 8000 Hz with a firmware update in November 2023.

\*\* Razer lists 11 programmable buttons for both mice, but its product page for the 35K also speaks of 13 customizable controls. The 14 controls of the Basilisk V4 Pro further down are counted the same way.

The weights are Razer’s, without the cable and the dongle. If you put the 35K on a scale it will probably measure around 113g, and with the wireless charging puck installed, my Phantom White weighs around 118g. The different battery figures for the original V3 Pro are not a typo. Razer rated it at 90 hours when it launched but lists 110 hours today. I couldn’t find an explanation for the extra 20 hours, as I doubt that Razer actually changed the battery and I’d assume that it’s a value that they might have achieved using purely software optimizations.

Internals
----------

[<img class="kg-image" src="/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1964_hu_ac5058d6cc4f2a1f.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1964.jpg)

I haven’t taken apart the 35K so far, and it seems like nobody else on the internet has either, but if we assume that the internals are identical to the V3 Pro’s, then it’s likely to have the same Nordic Semiconductor nRF52840 at its core, which is an ARM Cortex-M4 system on a chip with 1 MB of flash and 256 KB of RAM, and a radio for both Bluetooth and proprietary 2.4 GHz protocols like Razer’s HyperSpeed. The lighting then probably also has its own RGB driver, maybe even the exact same W3635, and the 600 mAh battery is probably also wrapped in foam and mounted on a plastic frame above the sensor, into which the scroll wheel assembly slots as well. I also assume that the battery is soldered to the board, and that replacing it requires a soldering iron. Not great for a mouse that costs as much, and whose battery is likely the first part to wear out.

Going by the V3 Pro’s design, the buttons on the top shell would then also be on a separate PCB that connects to the main board with a 5-pin connector, while the LED strip for the underglow and the scroll wheel connect via ribbon cables. Three magnets in the base would then align the mouse on the Mouse Dock Pro.

Presumably the 35K also uses Razer’s third-generation optical switches for its main buttons, which register a click when the plunger interrupts an infrared light beam instead of when two metal contacts touch. They don’t need a *debounce delay* and aren’t prone to the double-clicking that mechanical switches tend to develop over time. Razer rates those at 90 million clicks. The other buttons, however, probably use ordinary mechanical switches. Some online sources state that the switches of the side buttons and the sensitivity clutch are ChangFeng parts, others that the side switches are Huano, and that the two buttons on top, the wheel click and the tilt inputs use unbranded tactile switches.

The teardowns of the original identify the Focus Pro 30K sensor as a PixArt PAW3950. The Focus Pro 35K Gen-2 was reportedly developed together with PixArt as well, but Razer hasn’t said which part it’s based on.

Sensor
----------

[<img class="kg-image" src="/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1974_hu_1bf271077473d007.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1974.jpg)

The Focus Pro 35K Gen-2 raises the maximum resolution from 30,000 to 35,000 DPI, while the tracking speed of 750 IPS and the maximum acceleration of 70 G stay the same. The more useful change is that the sensitivity can now be set in steps of 1 DPI instead of 50, which is probably important to people who want to match the sensitivity they’re used to from another mouse, and for whom Razer hence added a DPI Sensitivity Matcher to Synapse. The other features carried over from the 30K, namely Smart Tracking, which adjusts the tracking to the surface and offers three *lift-off distances*, Asymmetric Cut-Off, which sets the lift-off and landing distances separately across 26 levels, and Motion Sync.

The new sensor seems to be fast and accurate across soft, hard and glass pads, but in practice indistinguishable from the old one, at least to me, who is not a professional eSports player. I’ve read about measured lift-off distances of 0.6, 0.8 and 2.0 mm for the low, medium and high settings on a bare surface, while some users saw slight jitter at 8,000 DPI and more above that, which is irrelevant to anyone, including myself, who doesn’t use such settings. I use the mouse for desktop work, meaning websites and applications like VMs that are cumbersome to use with the keyboard alone, and for that the difference between the two sensors is entirely academic.

Polling rate
----------

[<img class="kg-image" src="/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1973_hu_da2817d7578c9ec9.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1973.jpg)

The included HyperSpeed dongle polls at up to 1000 Hz, and so does the USB cable. For 8000 Hz, the mouse needs either the HyperPolling Wireless Dongle or the Mouse Dock Pro. The dock launched in 2022 with a 4000 Hz transceiver and is listed with 8000 Hz today, and the original V3 Pro got 8000 Hz with its firmware update in November 2023, so 8000 Hz isn’t new to the 35K either. Once the mouse is paired with the dock, its own dongle obviously isn’t needed anymore and can be stored away inside the mouse.

Independent measurements put the click latency of the 35K at 1.8 ms at 4000 Hz and 1.6 ms at 8000 Hz. These are good numbers, however, the gains over 1000 Hz are marginal, but the cost in battery life isn’t. At 8000 Hz Razer rates the 35K at 28 hours, down from the 32 hours of the original, which is a fifth of what the mouse gets at 1000 Hz.

Scroll wheel
----------

[<img class="kg-image" src="/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1969_hu_97cc2c07cffa0d62.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1969.jpg)

The scroll wheel was one of the main reasons I went with the Basilisk back in 2024. Like the MX Master, it can switch between a notched, tactile mode and a free-spinning mode, but the two do it in different ways. Logitech’s MagSpeed wheel uses an electromagnet, while Razer’s HyperScroll Tilt Wheel uses a small DC motor that, via a plastic gear, either presses a lever against a toothed disk for the tactile mode or pulls it back for the free spin.

The rotation is read by an *optical encoder*, an LED and two photodiodes looking at a segmented disk. The mechanism is so precise that seemingly even a single human hair stuck in between, blocking the encoder’s light, can lead to a jittering wheel.

Anyhow, the mode can be switched with the button below the wheel or automatically with Smart-Reel, which goes into free spin when you scroll fast and back to the tactile mode when you slow down. Smart-Reel isn’t new, because the original V3 Pro had it as well, but what’s new on the 35K is that the speed at which Smart-Reel switches can be set across five levels, and that Synapse offers a scroll acceleration that speeds up scrolling the faster you spin the wheel. Unfortunately, the acceleration is implemented in Synapse and not in the mouse, and it hence doesn’t exist on systems that don’t run Synapse.

Every switch between the two modes comes with an audible click from the motor.

Shape
----------

[<img class="kg-image" src="/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1963_hu_e46301b0d0381ab6.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1963.jpg)

Razer barely touched the shell, and the 35K is the same 130 mm long, 75 mm wide and 42.5 mm tall right-handed mouse with a thumb rest that the original was. Hence, the ergonomics are the same good ones that the original Basilisk had. In a palm grip the thumb rests on the ledge, with the sensitivity clutch right underneath it and the two side buttons above it.

At 112g the Basilisk is heavy compared to the lightweight mice that are popular for shooters. For my use, however, it isn’t heavy by any means. Compared to the MX Master 3 that I used before, the Basilisk is still more than 20g lighter, and its weight is distributed well enough for it not to feel heavy in the hand. The feet are made of PTFE and glide well on a mouse pad, but they’re small and can scrape across a hard desk.

Battery
----------

[<img class="kg-image" src="/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1968_hu_d9028750c44f22ba.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1968.jpg)

Razer rates the 35K at 140 hours on the 2.4 GHz connection at 1000 Hz and at 210 hours on Bluetooth, compared to the 110 and 150 hours that it lists for the original today. Razer doesn’t say where the difference comes from, and as long as nobody has opened up a 35K, it’s unclear whether it’s the battery, the sensor or the firmware. However, the lighting matters quite a lot for battery life and might almost halve the runtime when set to peak brightness.

So far, the battery life for me has been phenomenal even with the *unicorn puke* turned on at 10% brightness. My previous Basilisk had become a little weak with regard to its runtime after two years of daily use, and while I’ve only had the 35K for a short time, it feels like it can go weeks on a single charge.

Charging
----------

[<img class="kg-image" src="/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1972_hu_f401f89938eb7704.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1972.jpg)

The cover on the underside of the mouse closes off a compartment for storing the dongle, and it can be swapped for Razer’s Wireless Charging Puck. The puck twists in, connects to the mouse through contact pads, and turns it into a Qi device that charges on the Mouse Dock Pro and, if the coils line up, on other Qi chargers. The Mouse Dock Pro includes a puck, otherwise it’s $29.99 or ¥3,288. Charging on the dock is slower than via the cable, with about 0.1 A on the dock compared to 0.33 A via USB-C on the original V3 Pro, which however doesn’t matter with the mouse on the dock overnight.

Sadly, there doesn’t seem to be a wireless charging puck that is also transparent. Razer sells the Wireless Charging Puck in a single color, which is black, and it’s the same puck that comes with the Mouse Dock Pro. Hence, in order to use the mouse with my Mouse Dock Pro, I have to use the original black puck. It’s a bit sad, but then again, it’s not visible as long as you don’t lift the mouse to look underneath it.

The dock itself has a built-in 8000 Hz transceiver and RGB lighting that shows the battery level of the mouse while it’s charging, from green through yellow to red. On October 8, 2026, Razer announced a successor, the Mouse Dock V2 Pro, which lists the 35K as compatible and is supposed to arrive in Japan in November for ¥11,980.

Linux
----------

[<img class="kg-image" src="/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1966_hu_b732416694657153.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1966.jpg)

Like with the original V3 Pro, Razer doesn’t offer any software for Linux. Synapse, Razer’s official ~~malware~~ software, runs on Windows and, as a preview, on macOS. Pairing the mouse with the dock, updating its firmware and the firmware of its receiver, and changing settings like the lighting timeout all require Synapse. Hence, I set up a Windows 11 VM on KVM, passed the dock through to it, unpaired my old Basilisk V3 Pro, paired the 35K, updated its firmware and adjusted its settings.

Razer has started offering a browser-based version of Synapse, Synapse Web, which could in theory work on Linux. As of now, however, its list of supported devices contains a single mouse, the Viper V4 Pro.

The on-board profiles, which include settings like the polling rate, work without Synapse. Sadly, just like with my previous Basilisk, the lighting still doesn’t seem to be stored on-board, at least not in a way that persists without Synapse running in the background. Synapse doesn’t run on Linux, and for using the mouse through the dock there doesn’t seem to be a working FOSS implementation yet that can properly set its lighting, which is why my Phantom White currently displays its typical spectrum cycling effect, also known as *unicorn puke*.

[<img class="kg-image" src="/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1967_hu_eb6d8ee27c76b58b.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1967.jpg)

[OpenRazer](https://openrazer.github.io) has supported the Basilisk V3 Pro 35K since version 3.10, and the Mouse Dock Pro since version 3.12. Unfortunately, the latter covers only the dock itself, namely its own lighting, while a mouse that’s paired with the dock doesn’t show up as a device. The dock relays the mouse’s input to the computer, so the mouse works, but its DPI stages, its polling rate and its lighting can’t be changed from Linux as long as it’s connected through the dock. A [report](https://gitlab.com/CalcProgrammer1/OpenRGB/-/work_items/4324) about OpenRGB not detecting the Basilisk V3 Pro through the dock has been open since 2024.

[Pull request #2817](https://github.com/openrazer/openrazer/pull/2817), which was opened in May 2026, adds pairing, unpairing and a scan for nearby mice to OpenRazer’s driver for the dock. It also exposes a mouse that’s paired with the dock as a device of its own, with the same settings and effects that OpenRazer supports through the mouse’s own dongle. Testers report that the Basilisk V3 Pro 35K works through the dock with it, including static colors, and a follow-up pull request adds the 8000 Hz polling rate. As of now, however, the pull request is still waiting for a review by the project’s maintainers, and I’m waiting for it to be merged, so that I can finally configure the mouse through the Mouse Dock Pro via OpenRazer.

Verdict
----------

[<img class="kg-image" src="/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1965_hu_953b77a24cbfb01f.webp" width="1440" height="810" alt="" loading="lazy" decoding="async">](https://cdn.xn--gckvb8fzb.com/razer-basilisk-v3-pro-35k-phantom-white-edition/images/razer-basilisk-v3-pro-35k-1965.jpg)

If you own a Basilisk V3 Pro, there’s little reason to replace it with a 35K. The sensor is newer, but in practice indistinguishable from the old one, at least unless you’re an eSports professional, and the remaining changes are a longer rated battery life and a few settings in Synapse. I’d recommend the original, which these days often sells at a discount. Unless, that is, you care about the way it looks, which, admittedly, is why I bought it.

As a mouse, the 35K Phantom White is as good as the V3 Pro was. The ergonomics are the same good ones that the original Basilisk had, the scroll wheel is as versatile as ever, and the battery life has, so far, been phenomenal. The translucent shell is a welcome change from the muted look of most hardware today, and the premium of ¥2,000 or $10 over the regular versions is not terrible. The downsides are the ones that the original had as well, namely (for some people) the weight, the price, a battery that’s probably soldered in, and software that doesn’t run on Linux, plus a charging puck that doesn’t match the rest of the mouse.

**Note:** Shortly after I bought the 35K, at the beginning of October, Razer announced the Basilisk V4 Pro, which is supposed to arrive in Japan in November for ¥27,980. It’s 12g lighter and has 14 instead of 13 customizable controls, a new scroll wheel with an additional, finer tactile mode and a Focus Pro 50K sensor. It also supports 8000 Hz in both wireless and wired mode and is rated at 200 hours of battery life, but it has only 7 lighting zones, and Razer hasn’t announced a Phantom edition of it so far. If you don’t care about the translucent shell, the V4 Pro is probably the better buy. I do, and I’m happy with the Phantom White.