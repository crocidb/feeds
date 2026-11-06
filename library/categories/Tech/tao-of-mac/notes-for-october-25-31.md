+++
title = "Notes for October 25-31"
description = "Have I ever mentioned how much I hate daylight savings and the utter stupidity of disrupting my (already poorly attuned) circadian rhythms for a completely arbitrary change that makes mornings only slightly more bearable and evenings a dark pit of mild despair?Well, I guess I j"
date = "2026-10-31T17:53:00Z"
url = "https://taoofmac.com/space/notes/2026/10/31/1753?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-11-02T23:27:05.374235327Z"
seen = true
+++

Have I ever mentioned how much I *hate* daylight savings and the utter stupidity of disrupting my (already poorly attuned) circadian rhythms for a completely arbitrary change that makes mornings only slightly more bearable and evenings a dark pit of mild despair?

Well, I guess I just have. It might have also been the tipping point for my feeling slightly feverish and achy towards the end of the working week, which certainly did not help my overall mood or productivity.

[

Hacking The Norns
----------

](/space/notes/2026/10/31/1753#hacking-the-norns)

The week did have an auspicious start, since spurred by tinkering with the [FM-1](/space/reviews/2026/10/11/2100#the-m-vave-fm-1) I decided to get some music/audio hacking in. I’ve been toying with the idea of turning my [Norns](https://monome.org/docs/norns/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) into a [Microcosm](https://www.hologramelectronics.com/pages/microcosm?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) effects pedal for [almost a year now](/space/notes/2025/12/31/1830#we-have-hologram-microcosm-at-home), and not only did things finally start to gel with [SuperCollider](https://supercollider.github.io/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) after deciding to reorganize the code but I also thought it would be nice to throw AI at the problem of getting a usable UX on that and iterating through all the visible options:

<img src="/space/notes/2026/10/31/1753/norns-mosaic-a-interface-views.png?v=7602c6f44e97" alt="Mosaic A Norns interface views showing Activity, Shape, Mix and Time controls, settings, presets and error states" width="1608" height="1470"> Mosaic A interface views and secondary controls, with settings, presets and status screens. [

Economic Madness
----------

](/space/notes/2026/10/31/1753#economic-madness)

I’ve looked at [Anthropic’s S-1](https://www.sec.gov/Archives/edgar/data/2130357/000162828026067168/anthropicpbc-sx1.htm?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and am torn between it being one of the best works of investor fiction ever written (especially regarding profitability vs compute and training costs) and a potential proof point for industry “transformation”.

If it goes through (and they don’t get their lunch eaten by OpenAI, open weights or anything else that will sink per-token pricing, which will certainly have more interesting implications) they might have something interesting there, but I am not betting *my* money on anything that is pure AI at this point.

[

3D Printing
----------

](/space/notes/2026/10/31/1753#3d-printing)

I finally managed to make a small dent into my 3D printing backlog–I had been meaning to design 3D printed cases for the [Orange Pi 6+](/space/reviews/2026/04/11/1900#the-orange-pi-6-plus), the [LattePanda Sigma](/space/reviews/2026/09/13/1700#the-lattepanda-sigma) and another couple of SBCs I have, but a fortuitous search found serviceable ready-to-print ones, so my office is now looking slightly more tidy, and I have fresh new surfaces for dust to settle on, with two caveats:

* The [Orange Pi 6+](/space/reviews/2026/04/11/1900#the-orange-pi-6-plus)’s fan noise was much more noticeable with the case on
* I am temporarily lacking the required M3/14mm screws to button down the Sigma properly

Still, it was nice to go back to popping stuff off build plates, and the cases make for a much neater desk. Plus I realized I had an entire roll of white TPU stored away that has come in pretty handy to print feet for most of the cases.

[

Reverse Engineering Renaissance
----------

](/space/notes/2026/10/31/1753#reverse-engineering-renaissance)

One of the AI-related things I am actually quite happy about is the blooming reverse engineering/hardware repurposing scene, which I’ve been tracking since I would indeed like to make better use of some of my older hardware.

There are now credible, largely working efforts to do stuff like get Linux running on the [Lenovo ThinkSmart View](https://github.com/jethac/lenovo-thinksmart-view?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and [iPad and iPhone hardware](https://github.com/OrchardLinux/omarchy-a?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) (sadly, triggered by [Omarchy](https://omarchy.org/?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), but I guess the outcomes are a net positive), re-targeting or recompiling [Nintendo Switch](/space/com/nintendo/switch#nintendo-switch) games for the [Mac](https://github.com/ly05010419/MacNativeGames?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and [Windows](https://github.com/Revivedx/SavageWindRecomp?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com), and various other retrocomputing initiatives.

Of course only time will tell how good and actually useful any of those things are, but the barrier to entry is now so low that [taking over Android photo frames](https://github.com/wesbos/photo-frame-dashboard?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and debloating Smart TVs is almost commonplace, and I’m totally here for it.