+++
title = "Reviving a Touch Bar MacBook with Fedora Silverblue"
description = "Following up on my revival of a MacBook Air with Fedora, I decided to install Silverblue onto my old MacBookPro13,2 (the 2016, T1 Touch Bar model), which I once "
date = "2026-11-03T20:37:00Z"
url = "https://taoofmac.com/space/blog/2026/11/03/2037?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-11-05T13:08:25.091113560Z"
seen = true
+++

Following up on my [revival of a MacBook Air with Fedora](/space/blog/2025/11/05/2200#reviving-a-macbook-air-with-fedora-silverblue), I decided to install [Silverblue](/space/os/linux/distributions/fedora) onto my old `MacBookPro13,2` (the 2016, T1 Touch Bar model), which I once (somewhat naively) termed [my mid-life-crisis laptop](/space/blog/2017/05/21/1430#the-macbook-pro-my-mid-life-crisis-laptop).

With the benefit of hindsight, I can now finally come to terms with why this particular hardware revision is much maligned in general, and revisiting it was an interesting experience because:

* I had forgotten how bad the keyboard is
* The Touch Bar is worse than useless in general, and causes a number of issues in Linux
* It can’t use modern 5GHz Wi-Fi (well, it can, but this setup doesn’t support WPA3, and probably never will)
* The battery is somewhat shot
* It warms up considerably at the slightest provocation

It does, however, have an absolutely *beautiful* 2560x1600 panel that reminds me of the [Lenovo Chromebook](/space/reviews/2026/10/04/1800#the-lenovo-chromebook-plus) I had to send back (still sad about that), and four USB-C ports so it’s trivial to keep topped up enough to use as a thin client:

<img src="/space/blog/2026/11/03/2037/macbook-pro-fedora-silverblue.jpg?v=f2eeec417731" alt="MacBook Pro running Fedora Silverblue, with the GNOME About panel and Touch Bar visible" width="2048" height="1536">MacBook Pro running Fedora Silverblue, with the GNOME About panel and Touch Bar visible

[

Installation
----------

](/space/blog/2026/11/03/2037#installation)

The first step is, as you’d expect, to just plug in a USB drive and boot from it. [Fedora](/space/os/linux/distributions/fedora)’s hardware support is, as usual, stellar (power management, backlight, touchpad, etc., all worked out of the box) and I was immediately productive on it by dint of installing `pi`, asking it to map `Esc` to `Caps Lock`, and get the rest of the hardware to work while I just spun up [Firefox](/space/apps/firefox), logged onto my [Obsidian](/space/apps/obsidian) server and kept writing.

The result is a sort of overpowered Chromebook (it has 16GB RAM and entirely too much storage, and even if it has a relatively paltry two cores and four threads, it’s still an i5), and were it not for the pretty hefty weight when compared to more modern machines, I would call it a very satisfactory conversion.

[

Kernel Fixes
----------

](/space/blog/2026/11/03/2037#kernel-fixes)

The entire process took something like eight hours altogether (loosely spread over a couple of days), and I’m pretty sure you can get it down to under 4 hours if you slave away at it as a meat proxy to the AI–I just kept doing other stuff and occasionally rebooted for it to test the fixes.

What `pi` ended up doing was:

* Building `akmod` packages for both the Touch Bar and audio initialization
* Debugging microphone and camera inputs
* Tracking down and fixing incorrect NVRAM settings that prevented the Wi-Fi from working in 5GHz
* Taking several stabs at getting full suspend/resume to work while ensuring all the weird hardware recovered correctly (this is what took the longest, by far)

As you’d expect, I got it to [publish all the notes, steps and packages on GitHub](https://github.com/rcarmo/fedora-silverblue-macbook?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), so this should be easily reproducible if you have an identical machine (which, mind you, you might not–there are several subtle variations of this).

[

Next Time…
----------

](/space/blog/2026/11/03/2037#next-time)

Since I forgot to turn on LUKS disk encryption in the first install and I want to move to Fedora 45 (which is launching this week), I will eventually have to do the whole thing again–this time likely going straight to my [Niri](https://github.com/YaLTeR/niri?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) desktop setup rather than staying in GNOME. However, given the number of changes expected in Fedora 45, I will let *that* settle first.

All in all, reasonably smooth sailing, although power management and sleep/resume have been a major pain, since it also had to patch and tweak the Touch Bar and audio drivers to come back on when picking up the machine.

There are a couple of things that still don’t really work, but they’re fairly minor considering this is probably going to live out its days as a couch machine:

* External displays (might have to do with the old Intel chipset–some monitors are detected but nothing renders)
* There’s an annoying phantom tap thing in the trackpad driver, so for the moment I am back to press to click, which is slightly maddening

I like our new AI overlords, especially considering I can use them to breathe new life into this kind of otherwise useless hardware. I might even look into replacing the battery on this one as well…