+++
title = "3D Printing State of the Union"
description = "Since I got a new printer last week and I’ve been documenting my endeavours in this realm in a rather haphazard way, I thought it would be useful to do a sort of catch-up/snapshot of where things are (and have been) for a while "
date = "2026-08-06T17:00:00Z"
url = "https://taoofmac.com/space/blog/2026/08/06/1700?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-06T09:52:38.167329408Z"
seen = false
+++

Since I got [a new printer last week](/space/notes/2026/07/12/1230#notes-for-july-5-12) and I’ve been documenting my endeavours in this realm in a rather haphazard way, I thought it would be useful to do a sort of catch-up/snapshot of where things are (and have been) for a while now.

Right now I have three 3D printers (down from four):

* The [KP3S Pro](/space/com/kingroon/kp3s_pro#kingroon-kp3s-pro), which is my “tiny”, near-silent printer
* The [Two Trees SK1](/space/com/two_trees/sk1#two-trees-sk1), my former workhorse
* A brand-new Flashforge Creator 5 Pro, which I am still getting to know and taking copious notes on

However, this all started (as many 3D printing stories start) with a Prusa. Or, rather, a clone.

[

The Prusa Connection
----------

](/space/blog/2026/08/06/1700#the-prusa-connection) <img src="/space/blog/2026/08/06/1700/printers-prusa.jpg?v=8e1e082dc653" alt="The BQ Prusa MK2 over the years" width="2048" height="1709"> The BQ Prusa MK2 over the years

A few years back, when I was organising the first editions of the Lisbon Maker Faire, I got [a BQ Prusa clone](/space/blog/2014/10/05/2130#hephaestus-extruder), which stood me in good stead for a long while–I printed many kilos of PLA/PETG with it, the vast majority of it going into functional parts of various descriptions (some, as you’d expect, were 3D printer parts), to the point where the nozzle wore out and widened from its 0.4mm to somewhere between 0.6 and 0.8mm (which only made it more useful for some functional prints).

Last weekend I retired it and gave it to a friend–which, given how tight space is in my office these days, was a necessity. Instead of dismantling it and saving the non-printed parts, I tried to make sure it would go to someone who could rebuild it.

Since I took care to keep all the STLs (Prusa originals and derivatives are awesome in terms of long-term maintenance), had spare Arduino boards and ample extras–including a Raspberry Pi touchscreen and an unused extruder kit I had intended to fit it with–it left the house almost like it came in (i.e., as a kit), and even though I’ll miss it to a fair degree, I hadn’t really used it in almost a year.

This printer had a great run, and was extraordinarily maintainable–I replaced many of its parts over the years (including *nearly* replacing its extruder assembly before I got the other ones).

It also became my first [Klipper printer](/space/blog/2022/07/09/1230#reviving-my-ancient-bq-prusa-i3-hephestos-with-klipper), and the excitement from that upgrade and the realisation that 3D printing was going through a stepwise evolution was pretty much the reason I got my second.

[

The Little Upstart
----------

](/space/blog/2026/08/06/1700#the-little-upstart) <img src="/space/blog/2026/08/06/1700/printers-kp3s.jpg?v=d0c3009030e5" alt="The KP3S Pro over the years" width="2048" height="2048"> The KP3S Pro over the years

The [KP3S Pro](/space/com/kingroon/kp3s_pro#kingroon-kp3s-pro) was my choice as a follow-up printer, and an attempt to regain finer print quality (which I did) while retaining some control over the hardware and software–I bought it intending from the start to run [Klipper](/space/3d/printing/klipper), and it has served me very well.

After swapping out its extruder assembly and bolting on a Bambu clone hotend and an inductive sensor a little while ago (which [I also made a video about](https://www.youtube.com/watch?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com&v=aWYlb0_-Fgo)), it is now the quietest (and, funnily enough, most hassle-free) of my printers, even considering that its cantilever setup makes it a tad wonky.

Despite the limitations of its relatively small 220x220 build plate, I use it a lot during the day to print small jigs, calibration samples and slices of prototypes, to the fascination of some of the people I have video calls with. Being quiet, precise and low-friction for small functional work, it is perfect for the kind of slow, iterative prototyping that I can squeeze in during some work weeks, although to be completely fair it is a tad small, so for most final prints I have to move “up”.

[

The Tank
----------

](/space/blog/2026/08/06/1700#the-tank) <img src="/space/blog/2026/08/06/1700/printers-sk1.jpg?v=d3a4c5323f47" alt="The SK1 and the tweaks I did" width="2048" height="1536"> The SK1 and the tweaks I did

I had the good fortune of getting an [SK1](/space/com/two_trees/sk1#two-trees-sk1) when Two Trees dipped its toes into the 3D printer manufacturing business (which they appear to have since exited, sadly), and upgraded it from its Bambu Lab P1-like barebones frame to a fully enclosed configuration including auxiliary part cooling fans, and I have quite enjoyed the ride.

As my first Core XY, the thing was a pretty amazing leap in terms of print speed and quality, and it is still rock solid provided you can deal with its somewhat uneven temperament and a few quirks.

There is a lot to like mechanically–since it (cleverly) uses Bambu clone hotends, it has been the printer I’ve used with most of my tougher abrasive filaments, and coupled with [a BIQU cool plate](https://www.amazon.es/gp/product/B0FCL25JX2/ref=as_li_tl?_encoding=UTF8&camp=3638&creative=24630&linkCode=ur2&tag=taoofmac-21&utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) it has been perfect for stuff that would never print reliably on the [KP3S Pro](/space/com/kingroon/kp3s_pro#kingroon-kp3s-pro). The stepper motors and mechanics have been rock solid (the only part that broke down was the toolhead fan, which somehow lost a blade), and [ever since I enclosed it](/space/blog/2024/07/13/1900#enclosing-the-twotrees-sk1) it’s only improved.

It does have *one* significant hardware foible–the extruder is *very* prone to heat creep, and it’s impossible to reliably print PLA on it with it fully enclosed unless you [use a vent like this one](https://www.printables.com/model/924900-aerateur-pour-kit-enclosure-two-trees-sk1?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and turn on the fans–which, even if only slightly on, just add to the noise, especially when the printer is running at speed.

The shipping [Klipper](/space/3d/printing/klipper) firmware has always been a little buggy, and although I did some creative upgrading and [replaced the screen with a USB-networked Pi](/space/blog/2024/04/28/1500#plug-and-play-klipperscreen-for-the-twotrees-sk1), it still has some weird pre-print slowdowns and glitches due to the rather complex Voron Trident-like homing sequence that I’ve yet to fully iron out.

My plans for it, now that I have a new “big” printer, include completely reflashing the entire thing with [more modern firmware](https://github.com/mechano/TwoTrees-SK1-Armbian-Klipper-Firmware?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and, eventually (if I can figure out a good, reliable replacement that isn’t a major pain to mechanically assemble), upgrading the toolhead to a more future-proof combination.

But the excellent mechanics aren’t really compromised by a few software and thermal-design decisions, and I suspect it will stick around for a while.

[

The Creator 5 Pro
----------

](/space/blog/2026/08/06/1700#the-creator-5-pro) <img src="/space/blog/2026/08/06/1700/printers-creator5pro.jpg?v=c2873351dd12" alt="The Flashforge Creator 5 Pro" width="2048" height="1536"> The Flashforge Creator 5 Pro

I will write more about the whys, hows, and outcomes, but I spent a *long* while making up my mind about this one, and it’s going to both replace and *complement* the [SK1](/space/com/two_trees/sk1#two-trees-sk1)–it’s roughly the same size (except for the ludicrous top cover), but I needed something to print (slightly) tougher materials, use multi-material for supports, and, overall, enjoy a bit less tweaking and more automated tuning.

And yes, I decided to get in on the toolchanger craze, but not because I want to print multi-coloured baubles–I want to print functional parts with different materials, and toolchangers are *another* stepwise evolution in the 3D printing world that I want to explore.

I’m slowly getting used to it and jotting down notes for an in-depth post in a few weeks (maybe months, depending on how summer pans out), but I’ve already used it to print [that SK1 vent](https://www.printables.com/model/924900-aerateur-pour-kit-enclosure-two-trees-sk1?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and a few small precision multi-colour and multi-material tests. It is noisy enough that I don’t enjoy running it at full speed while I’m in the office (and its “silent” mode is quieter, but still not something I want to put up with during meetings), so I’m using it mostly on weekends.

[OrcaSlicer](/space/apps/orcaslicer) works (almost) perfectly with it (and is sure to improve), and I’ve already dipped my toes into [building a monitoring app](https://github.com/rcarmo/swift-flashforgeui?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) since I am still thinking of it as a sealed appliance, but I know that there will be alternate firmware versions soon(ish) and expect it to become just another [Klipper](/space/3d/printing/klipper) printer (or close enough) in due time–that, and the simple, no-frills mechanicals, were two of my bets when I picked it out; the third was that maintainability would win out over its somewhat spartan feature set. It’s early days for that, of course.

And *of course* I’ve gone and started patching around some of Flashforge’s shortcomings myself–besides [that Swift-based desktop app](https://github.com/rcarmo/swift-flashforgeui?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) to talk to it, I’ve also printed my own version of a purge bucket (a rite of passage for any modern printer, including toolchangers, it seems), and am actively trying to get around to actually *using* it for the stuff I want–for which all I really need is the most precious commodity: time.

That and, of course, working my way up to the final print jobs it’s meant to do–the other printers still have their work cut out for them…