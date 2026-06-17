+++
title = "Shoehorning Flying Toasters into a ESP32-S3"
description = "This is the (very) abridged story of how I got After Dark?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) running on my own flavour of the [Cydintosh](/space/links/2026/04/15/"
date = "2026-06-14T14:00:00Z"
url = "https://taoofmac.com/space/blog/2026/06/14/1400?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-06-16T20:08:31.055656603Z"
seen = false
+++

This is the (very) abridged story of how I got [After Dark](https://en.wikipedia.org/wiki/After_Dark_(software)?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) running on my own flavour of the [Cydintosh](/space/links/2026/04/15/0718)–specifically, Flying Toasters on an ESP32-S3 board, zooming along at 65 FPS, which is both completely pointless and one of the more satisfying things I’ve done this month.

[

But Why?
----------

](/space/blog/2026/06/14/1400#but-why)

Because.

[

A Mac… For Ants
----------

](/space/blog/2026/06/14/1400#a-mac-for-ants)

When I first got wind of the [Cydintosh](/space/links/2026/04/15/0718), I immediately dug out one of my Cheap Yellow Displays and tried to get the software running on it, only to find out two things:

* My Cheap Yellow Display was (predictably) different (same 240×320, but an ESP32-D0WD)
* The resistive touch screen mine had, together with the relatively small size, made it unusable in practice

I mean, it *ran*, but… Here, you be the judge:

<img alt="Yes, that is a coin cell, and this is a bit contrived of an example" src="https://taoofmac.com/media/blog/2026/06/14/1400/XVeZos7-HuzEP9Ep1Vx7KwoiyzM=/controlpanel.jpg" width="2048" height="1536" style="max-width: 100% !important;height: auto !important;">Yes, that is a coin cell, and this is a bit contrived of an example

The photo above was me trying to push the envelope a bit.

The truth is that even with proper 1:1 pixel scaling, portrait rendering and some creative interpretations of how to push faster screen updates through the SPI bus, and even considering the Mac Plus emulation *and* basic Wi-Fi access worked really well (because of the genius trick of exposing ESP32 hardware through to the emulator), it was painfully slow.

[

Moar Pixels
----------

](/space/blog/2026/06/14/1400#moar-pixels)

I did the obvious thing and ordered a couple more, larger displays with a slightly more powerful chip and proper capacitive screens:

<img alt="Size comparison, still debugging display rendering" src="https://taoofmac.com/media/blog/2026/06/14/1400/X5iz6d-hcc9aEPZTxMqLxb6xngQ=/twopanels.jpg" width="2048" height="1152" style="max-width: 100% !important;height: auto !important;">Size comparison, still debugging display rendering

And the results were *glorious*: the new boards are labelled ESP32-8048S043C, and they come with an 800×480 capacitive panel, an ESP32-S3, and 8MB PSRAM, which is more than enough to run the emulator and a more complete version of Mac OS, running the original Musashi-based `umac` emulator at a fairly good speed (certainly faster than the original Mac Plus or even the Classic) *and* at full panel screen resolution (480×800) in black and white:

<img src="https://taoofmac.com/media/blog/2026/06/14/1400/H7Za2n8yFlXRMEMvCSEmlDrIeaE=/portrait.jpg" alt="This reminded me a lot of my years doing PageMaker/print design" width="1280" height="1707" style="max-width: 100% !important;height: auto !important;"> This reminded me a lot of my years doing PageMaker/print design [

System Shenanigans
----------

](/space/blog/2026/06/14/1400#system-shenanigans)

However, the original Cydintosh image was *ancient*. The emulator worked OK, but I needed to do a bunch of upgrades to the firmware [on my personal fork](https://github.com/rcarmo/cydintosh?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link):

* Rewrote the display layer to support multiple board profiles, with the S3 target running a 480×800 framebuffer rotated to landscape
* Bumped emulated Mac RAM to 1MB (the original used 128KB, barely enough for System 3.2)
* Fixed portrait/landscape orientation, touch mapping, and the GT911 capacitive driver
* Added an MQTT layer so the thing can actually do smart-home control (the original project’s raison d’être)
* Patched `umac` to suppress Sony eject requests so disk mounting worked properly
* Built an impromptu web flasher and a serial log capture tool, because flashing ESP32-S3 devices is its own special kind of hell

Getting there took a few weeks of evenings and a bit of creative hacking.

[

Registration? We Don’t Need No… Oh
----------

](/space/blog/2026/06/14/1400#registration-we-dont-need-no-oh)

Everything went pretty swimmingly until I actually injected [After Dark](https://en.wikipedia.org/wiki/After_Dark_(software)?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) into the System folder:

<img alt="Guess what, no keyboard. At all." src="https://taoofmac.com/media/blog/2026/06/14/1400/1ybugmeY0Bi3kZdzp8ChU4j6xRE=/registration.jpg" width="2048" height="1536" style="max-width: 100% !important;height: auto !important;">Guess what, no keyboard. At all.

Without any way to input text (and no, Key Caps doesn’t really work for this), I had to resort to removing bits from the control panel with ResEdit until it mostly worked (removing the dialog was not trivial, and in the end I asked Codex to just disassemble the INIT(?) resource and skip over the dialog).

A few minor firmware tweaks later, I have a “real” Mac that runs [After Dark](https://en.wikipedia.org/wiki/After_Dark_(software)?utm_source=taoofmac.com&utm_medium=web&utm_campaign=unsolicited_traffic&utm_content=external_link) as a screensaver perfectly:

<img src="https://taoofmac.com/media/blog/2026/06/14/1400/-1iLXosHaFMKSsC3PKgxtCZ1ZTw=/poster.jpg" style="max-width: 100%;height: auto;width: 100%" alt="Your browser cannot play this video" width="1920" height="1080"> Flying Toasters running on the ESP32-S3

In case you’re wondering, the toasters fly at a solid 65-67 FPS.

Which is *faster* than they ran on my actual Macintosh SE/30 back in 1991, because that machine was doing it in 1-bit black and white on a 68030 and this is a $15 display board doing it in 16-bit colour on a dual-core 240MHz chip with more RAM than my first three computers combined.

Not too shabby, even if it’s in black and white (which is what the original Mac ROM can handle).

[

This is Clearly Worth Overdoing
----------

](/space/blog/2026/06/14/1400#this-is-clearly-worth-overdoing)

And that is why I have gone down the rabbit hole of trying to port this to an LC ROM, on *yet another* ESP32 board (a P4). It turns out there’s not enough RAM on the other boards to hold a colour frame buffer, not enough bandwidth to do the delta refresh hacks I did in the original version, and not enough CPU power and storage for the required emulation and system changes…

I’m still grinding through the mechanics of paring down BasiliskII to fit, but in the meantime this board is sitting on my desk doing nothing but rendering endless toasters and reminding me some things are worth the sheer fun involved every time I glance at it.